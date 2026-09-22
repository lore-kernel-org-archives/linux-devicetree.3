Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAA7544D44
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 12:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080645; cv=none; b=Jgzlz1DeUaJAUd1RNwkt9Uw4Jc6ZuZbTgq1o+8qT/+ciyTmF2T7jZxA6gQNgI4rNepivF6lZVFmFlz0t4o3g3HBNCfL0HzIVwYeryNdA/ZdgboN6PmKFgIs5quTNwjgy6MW1DW1BZhV5AdNS87kUiOsuCmm+Z4oYAKLtq1n6Va0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080645; c=relaxed/simple;
	bh=5NrQ0i9ZNaZcHW2sMy4/POEkSP7UIxG/VSc5oqI9g54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LBTHEP9aK9G/sP8qQKgz3XY0ywQMdofrdau/lNJA8Z4cxod7R8SZfe1P3UPZpHF72NMbj9woizUtJpE8XNh+ANNBIr3cc+bl6wvv+Fi/eLOMKcYojMeG2NfGGj3C75n2RAYikBX0SXAQPErLSNgLcof9GFiJe5jfLQx6TyWVyL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UyZc9rVA; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UyZc9rVA"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc147d86bebso862460a12.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 05:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790080639; x=1790685439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sSFIDyEBXWq4SCc8zo/QNh6HqGLSDKyG+17t+RiabUE=;
        b=UyZc9rVAIR1FO4jx4tky8KiEODCyCzpVM5LNa42EL7j0C5BZzIReQkVEZgHLw3MGoW
         ZRp2MbW5IJgQPCx4ByFLWmS+0jTY7a7hBOoYq6akYT/WSCYjt18XjN2U+6uO5xlQZ0lR
         mIoVEm4/H6AGEBTVHqZceU0x/+cn9PgAsuXdbAfiIHU9wFN8igaQfeBfwr1flKDIRrya
         ynxE9916lCHRwlDj2wT7HFz7yZ/ki+roFhnJ2AHyXmFHhooh+BWwKKv9xbCpKat5UkJ5
         hq/UMFRDAM3ImytmAPVGnxPK+uZB31b7nyvjgJPTZS4cxnhK/Eu2sYmpRS9J9sc4MLoi
         ZA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790080639; x=1790685439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSFIDyEBXWq4SCc8zo/QNh6HqGLSDKyG+17t+RiabUE=;
        b=q7Jv2ZLYW0ya/AvRAPnyt0yzqFDh3lAL5NKskIKzeRMalk16ebJqip0Nm0ALsZRUOJ
         gwJX7ElGRCzJ1WFp1vwnR4eIExmp/qjnBGO3X/vrUFEDgqJcrncl2wnR1tyFtyORNKuQ
         9uyBDBZg3cQaPCpBj5NAbfSi+na0ueEUKqMdL4xjYD674+JQlnaa2IAkg0QszIvyyY5O
         PEtTkBnT11Ej2+0X0Hz1JOORfPEZMb4RDsnyuifBouH6pnaLHeMW0yeUjxWF7evymywK
         1yQx/hBBfMGGER9cBWl50X/FGVPGYKVmyaxS6KloGC/1gJX1oodnsNo2vNgMf/UnZtZP
         Ua7w==
X-Forwarded-Encrypted: i=1; AKwUvByaiSEw1TLbZVO5wUPkMdSeGquDaXsgbbUxO89IK8914waGgBDghON1OTUDuFzmZbIlxr0CD1lE41LI@vger.kernel.org
X-Gm-Message-State: AFuF++mfvuJExEaudsufAfTpHbrN7XVFwi11mRCwO+Gg3My9HnTvgRZ8
	KtQGBU0MizUjPo/nKHcJorCzlGcUjpm9yXmwiKVfUu5iTXWd03JRU1IY
X-Gm-Gg: AYBFou3QF7HgL+YIZ3FoMJ55aB/4S0aTnZ1UD68rX12TFjnGctaweGlnUy4QLKfhUV3
	/SZAcNt17KZ1hbl7toX8T/+tir31nSHA6NoUu/xvAFKiHi7HfTFiGL3TTP0n5QvyPxJrM2LXW22
	nSZB/QovsxZy/3l8dY0U2bNcZp1Sy+c9D/9a14cRh7NHW+eJlPuDEt64zn2vIKBlEDkxtgVsrSu
	MmP7J2wnDIYR87RXbWieaUdtYE4UPapyYD1ueFHJn9MDhLtkRvnCTi4IFRunT2b0LLapmVmAe5e
	UzQhWYXxo4d98SjxdfWdtMpw74EEJXlGYBjf1XY5WnvV/xmwd+CiYO2HJRbHFcYToyDk3h11RkV
	sP1iLKtROyBPtbiOCIxdypbdJES8oyOTdtKxeU2Bkk5qrRsNBeaZViWR4rDtNRppdNrav9ifYtL
	BZLFORFC1YW+woLFIOn85aJEpoOgmgXh29+anO9Meq6xn+DqyVc5r97EtgtbwOSd+t+y1sruKMZ
	UQcngc48Y8/lzXGOkmZWMsWZUI=
X-Received: by 2002:a05:6a21:7e01:b0:3db:280:b0f with SMTP id adf61e73a8af0-3ddec65f674mr701021637.14.1790080639455;
        Tue, 22 Sep 2026 05:37:19 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.140])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e612ccd46sm6453922eec.18.2026.09.22.05.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:37:18 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au
Cc: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	andrew@lunn.ch,
	tan.siewert@9elements.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v7 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC support
Date: Tue, 22 Sep 2026 18:04:58 +0530
Message-ID: <cover.1790079398.git.prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the ASRock Rack B650D4U BMC, based on the ASPEED AST2600 SoC.

The series adds the board compatible string and describes the BMC memory, SPI NOR flash layout, UART console, GPIO line names, graphics reserved memory, I2C EEPROM, and MAC0 connected to an RTL8211F Ethernet PHY.

MAC0 obtains its MAC address from the EEPROM on I2C7 and uses RGMII-ID mode.

Changes in v7:

* Correct the GPIOP bank line names for the reset, power and NMI button/control signals according to the confirmed board mapping.
* Remove the obsolete GPIOF5 reset-button line name.
* Leave the binding patch unchanged.

The B650D4U DTB builds successfully using aspeed_g5_defconfig.

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
  ARM: dts: aspeed: Add ASRock Rack B650D4U BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 135 ++++++++++++++++++
 3 files changed, 137 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

-- 
2.47.3

