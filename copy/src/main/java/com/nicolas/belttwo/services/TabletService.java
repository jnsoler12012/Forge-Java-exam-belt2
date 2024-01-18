package com.nicolas.belttwo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nicolas.belttwo.models.Tablet;
import com.nicolas.belttwo.models.User;
import com.nicolas.belttwo.repositories.TabletRepository;
import com.nicolas.belttwo.repositories.UserRepository;

@Service
public class TabletService {
  @Autowired
  private TabletRepository tabletRepository;

  @Autowired
	private UserRepository userRepo;

  public Tablet registerTablet(Tablet tablet, User user) {
    System.out.println(user.getId());
    tablet.setUser(user);
    user.getTablets().add(tablet);
    System.out.println(user.getTablets());
    return tabletRepository.save(tablet);
  }
}
