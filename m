Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9963B4F054E
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787610; cv=none; b=s6oLWhr/VizNea7uvgJD5KmEgexXmVwkpIYaZUChl0DrZSkT6Al1N7ztbBY//YKNTkpJYekE+6P+BNzvZ7fyok7b3PvRH0RXePtnsXw33Pqn4yc24vwqsvYMsCkXhmzpc/THrTWbaZwOxHkgBhFlX/IsaKk7SS9ZHXSnr30hUkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787610; c=relaxed/simple;
	bh=vDebz4UsJmjORwt2efyOGqFPF9BjJ2eSha3yv6WZhk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=plZ6umZYgDPuyoOoKHHqqCaL3dPAAlw2SVLgUJtCR0vdNtao9uEh9n2/H03EJT1z0dvnbn7PSXxmPFiHOEcnj4wwXBInyG53mAHPXOtn0gS1ay6DDy9dsHnziQfrG6zEaNJ7l7apsjlHUk2h8PaTc55YqwnVZCN1gvzXfjs1++8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=uMH5bmbq; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="uMH5bmbq"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c2533d83e3bso593485666b.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1788787599; x=1789392399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1f+YXy7SbvRq8mPftGLFWh+1zroaa0JiAwnQyBtt98g=;
        b=uMH5bmbqe/Ac2Ie1Oy7U4c3dDiCIq2c3isL+VBJbrZfQU7VSC66VVNOPpLWWdRzCGh
         o/1C3iFVgvrNVzZpm0irIbzZ32fdu23n08bR7S7pljQ4/kaTwit1m8nOIt7G0V91JuU0
         Zgpyn/Bx9fQhtT0lpMAL3QPZ5LZi892+kwXYMMX2jaMnfD2dfYoV1glgr9sa48gpYVsL
         T4uw+lqsvfbgbuopoVY6oPflJsBQH3svP9DDcQSOHxYJu1sKrOxKDKCqm6MqeZ6kWVVA
         dDUHNUD2hQKhgo9PTbWs8dNZ2xpvKiP+DneBC19yugA804c1WAr7ivjOL1SmmCAlxWmC
         gIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787599; x=1789392399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1f+YXy7SbvRq8mPftGLFWh+1zroaa0JiAwnQyBtt98g=;
        b=sSzsMkOLptEjmlh5dHPp0/ToT/37+nTF6BKX6OBfr3DyLT1DEcfeYbMjeU+8CF2jX7
         CQCjmAcf0QNIapbUSNA8mEhGUtDKuR7Q9NG5wlPob3L8zFV9W7zZxXx5p+f+GwX/iIZF
         swFMwCiZhvSTYIh2PijF5cM1tl0/NvnledJVScug9txnN4ncjXXwnMXdpk1OXXJKqXgO
         /O3Iw/sZJ2hbLlBz9nSzIyWguvnq6KpYEGXFwT5U/tP7IHVrFcIq0QEpVEdR5OTmcPex
         UA4TnzhSuGjKIr11L9mIOUxIR5mob2mQh9jQSOt7rkfhr2DloqRPsuCGZCfN2NvoOJrl
         5P3g==
X-Forwarded-Encrypted: i=1; AKwUvBy9DI2g6GHSP0no9XZx2OEzU5X4heO7137XghtF1CQ1R07PJ5uLctyeIaSnxq2OTciJf56S8dnbd6rw@vger.kernel.org
X-Gm-Message-State: AFuF++mmQ4Z2ptU3H0Reyxf5VF5nVlrjAvuEeJlpvTtrYFCl6Qf8haXJ
	JJKhWzRJQh4qzH9eQQIZyyfLpa0kBjupZJGlqWh51owK0LBSj6RvoxSzAcIYkgidhh8=
X-Gm-Gg: AYBFou2XgPOfbGC96lMB+deO10M/KmV+C+f6Ed9WGEbdP27GGxcWRTxrh8doPy2my8W
	wSETr1IxbhyszEETTPyM2WeGuiw3sGfYltgQVzb1+GbHvTpswEFZSwPKatE156iEfScg491Tgco
	yinBsFvlUKU5DpP+hcHq3bkCzXdeaZU82oaK1NXniys4GNYtNYUY8lcRX2DHYJwRN+8GCksBw1u
	q4PH9paz60JC+4P11wWW6z6Y+Jxp54bbM/DbMdhygqeFgyS8q0Kxz9cGJzMJo2oIKkxiWCUwv/7
	0eMz/ztZB2aA59EQNC2IN6TE1+ZqXmSWErN73jSQbaSwqnX/TFnt1F4cJWMD95EfA7x+GbYePQh
	K0CD4/nIMRe9nCJoNx8Ks4Vwfe6iuTeCTeonF4SCw2SS2feqTIvIWVtYOAPudYmkyLBMuChyiNl
	WyAvTy/VqvxtDuMzV3sDhp3kvhKk7/jvh7hdRxYS7XAhZgmreUYjnhHZPAZnF9ygKbkz+vt+ezH
	D+G8ZYn2OQjWHYfamKkIHAFbNtgG7dAAtpUgtbF2qDl1g2MDqOZdROYteuWbgDpDyroVyxIQx8U
	77Vgg0FmMCyKF3KCNrCRG8kj+EQDpIFinh4XrA==
X-Received: by 2002:a17:907:3f24:b0:c25:58e:83ff with SMTP id a640c23a62f3a-c260c9f0348mr1521074566b.10.1788787598895;
        Mon, 07 Sep 2026 06:26:38 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-94-253-164-142.zg.cable.xnet.hr. [94.253.164.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2622a7c677sm366362766b.9.2026.09.07.06.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:26:38 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: ulfh@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	adrian.hunter@intel.com,
	aubin.constans@microchip.com,
	ehristev@kernel.org,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 6/6] arm64: dts: microchip: ev23x71a: enable eMMC
Date: Mon,  7 Sep 2026 15:25:34 +0200
Message-ID: <20260907132617.1198548-7-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907132617.1198548-1-robert.marko@sartura.hr>
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the non-removable eMMC connected to SDMMC0. Configure its 8-bit bus
for 1.8 V DDR operation.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
* Remove the unnecessary maximum-frequency property.
* Expand the commit description.

 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
index 985ca31e74e7..89a161b87d6f 100644
--- a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
+++ b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
@@ -478,6 +478,16 @@ flash@0 {
 	};
 };
 
+&sdmmc0 {
+	pinctrl-0 = <&emmc_sd_pins>;
+	pinctrl-names = "default";
+	bus-width = <8>;
+	mmc-ddr-1_8v;
+	non-removable;
+	disable-wp;
+	status = "okay";
+};
+
 &serdes {
 	status = "okay";
 };
-- 
2.55.0
