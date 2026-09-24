Received: from mail-wr2-f21.google.com (mail-wr2-f21.google.com [74.125.225.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DAD3AFD1A
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240801; cv=none; b=OWm1/ELlsR/HDsWh2a9e28OC2mmfVU6dq5GWAqYAu6yl5wRB6sLX3qFHX8f7VQgSyHtXawdcAUki/41Ob2r0SPUmFfOWEkzyNED0X2Zx87i9OhxcilrphUMD+iNPyz6bIVGNigjNPtypSmyd1eHIbeJUHoym21KakojgoUIrc1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240801; c=relaxed/simple;
	bh=nK28L6hxZ9KSJUY90j7KB9ZFcL/Tw1vP3St946F4sGI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VF3MWU6scENB1ql9RF1d3kLvuqR18/25fLT4I8NSUt47YoIKQM1DnaN6+hIWO1jewjwebOd41F+j2EkLOW374rhg3ysTLVskwKBgRqFj16TiKSLjRcOUegeohnzu7v2/ylo+A3SA6GY3l7hLu5wCnanzdtO7R1mMNRhKYrk9Mlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCTeg91k; arc=none smtp.client-ip=74.125.225.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCTeg91k"
Received: by mail-wr2-f21.google.com with SMTP id ffacd0b85a97d-482f633cd80so1063722f8f.2
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 02:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790240797; x=1790845597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d4sabqfhS2o2uZAuTQZWzjMte84cAzlbbU15QotmRlg=;
        b=NCTeg91kgeO/6hhad3TJi0TyEnQP0uxcb+6OAKEHPKrddLSfUu163NCPx3H3SM2oZ/
         ax0VTOP+qvH9/ZT8zc8Hgfm5oGjRoheNenMPFTTsKJKLhDktWKYxtl9mnniAhSDdjRXD
         +zDm+Jg+cl+RuIBTl7YRK8R9srFdHIQ9IT+MUvHTiAwDeSJx+zOVkW+RYUYhiO5R32sA
         F6cjfFrATQ4U+DXUicBx65GUFvcWeoADV3eJBg2n9T04aq4lNgQ1A8TRFfBy3HBVibxc
         t67sa15+xCm2/8MVSMnMf3Ji+bk1dDBPsnfQGm1yah27KOtqtCmM0p/IUYmjqvbwKzwR
         cKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240797; x=1790845597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d4sabqfhS2o2uZAuTQZWzjMte84cAzlbbU15QotmRlg=;
        b=gJYeCwULRs0c7Ch23KvovhMJX0Jtkzjcs3cbWDP8HE/8DA3uThWEEjLlbFhTAax/2p
         QDUdvG+jp/bqwVi/lzLZ+UZOKkDEfTPQ9DVdDQwqb3d7K3xe9XFLwvBH00ehCgqPRuuy
         hJqNwqY91mz/nbfnplC456t+yVbPjgHyPenBKZjIWcx+NZsTrQwBytaJdezLPIB6P6c/
         zLqv0bQ/2WPM1Pb8p9vUXwvO9hoEviuLCYzuE6wff8XVKhEVTSHbJn28vpK6u0f+7nhp
         VMU0Js2wooU0d1Rd+ppgOrs9epWCtdZ2ChGR28DDrkqHsYLut+1z4iZ4/gFIl/ddSCkl
         HQtA==
X-Gm-Message-State: AFuF++lk301Hwg68mP7RMeBRvQqvvElv3hzS0Zd/ltxiv9Bs6Yc3WmQW
	O4/PiOlrAWxacpXCQPItbdUEteK8pZWa75KN5MOxj4gE3OHDE8a1uD/w
X-Gm-Gg: AYBFou3zvcau3pjd0W/pfdAyf2s0fN5TgS/gW8fVszkkCJBa/yQX8QT1kTQ2lV39m1H
	hg2fO51KarMu/zaRQGdIC7ploKDls9EOHbSx5FRAo1tf7R1mlGVvJ2SgMqtTk4gAdJ2MG5G6MoF
	4UaE4W8JMlAF3aGLHbdkJJcPI4KSjX+Hs7c7HVlgI8JLjGvDHeT6SFk9GWGEET1QaGMMr3YYuSA
	Vv+SZ8WWVF+tGB6uhhn/MBj6ZkFUMoGkQDM/BEOyAo87PfDE3qdh2F0FaBGOCvPKD+/9s5aKwha
	FUkEadl9WAjWHzxAYV/FElJgkt901KYoz2v64teQBaDUG9ufFEEdunXwfc/IA3ramgWhoHHebL/
	DKONeEIp/j3leQoksR8ijVegzYiQUheAKwxVsa486JPzyst86Z8ex3E1AVhaT+yAMLJBG5fi2rd
	4ml+U53YoYGCL45oTLaSbcp/O9DroSiQ7VXt0P+FdtkYYP1taZIJWX9CiPKqy2LcixxXHgkLNgi
	b8dvcSyJf0kT7H6XBI=
X-Received: by 2002:a05:6000:26c1:b0:487:342:d141 with SMTP id ffacd0b85a97d-48871679294mr3268587f8f.23.1790240796949;
        Thu, 24 Sep 2026 02:06:36 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877c379sm12875561f8f.29.2026.09.24.02.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:06:36 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/7] ARM: tegra: lg-x3: Add newly supported devices and fixes
Date: Thu, 24 Sep 2026 12:06:01 +0300
Message-ID: <20260924090608.28734-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nodes for recently supported device (ALS, LED controllers, haptics)
along with minor tweaks and fixups.

Svyatoslav Ryhel (7):
  ARM: tegra: lg-x3: Adjust WiFi node
  ARM: tegra: lg-x3: Remove pinctrl-* properties duplication
  ARM: tegra: lg-x3: Lower supported suspend mode
  ARM: tegra: lg-x3: Add light sensor node
  ARM: tegra: lg-x3: Add flash LEDs controller node
  ARM: tegra: lg-x3: Add haptic engine node
  ARM: tegra: lg-x3: Add backlight LED controller node

 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts |   5 +-
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts |   5 +-
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi  | 106 ++++++++++++++++++-
 3 files changed, 108 insertions(+), 8 deletions(-)

-- 
2.53.0

