Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281026;
	b=s1sj3wtM5Zq6/ZJSr67yCpYsz3Jf2JXwbF+kX3GcxsOJznZmnu/a15174PVZhRjGSg9k
	 FVty+MFibRUYxXmxlaCPhniXnlzJil6p3bHOh06SoZEAut1gS1/BvTQ6nyZxkDB135DVK
	 vWK6yjOt9PfjHHyr1iHAEU6qqHUEkZOZIZdrsSXEVX0d2BHvuT/rgqGWUiIEzGK0zc0Pj
	 X7dTwzOs1CY9MR3jkHRIG5FpXO9A/+grB5u2q7cn1Aa2uvGkFUizOY56cbAYarDIyG56K
	 Goho3OOaOTHpeixMm7LtQaCQ+mD7mrKgzDXTBnKFt0NIU3qYl38Sl4UbCsQcReErAcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OB2jqsnVm5eEvKu1VwxOsMOI5d+IePdDWWZTVxh1rD4=;
	b=f6cQu7l7t/6AdSr8aKzfkFOa8RiivjBSYMSmq345xjWCGaW4AAJpFKUOai+pHMpGs0kV
	 5x6IFrnT7Lk46WbmXl0xgp1cEwUYGqBe/2r07CbmQELJcxtbCOTRsvsrRRCd2BnZxN4Wd
	 tGH1h+wev361qti5QDXGR3s1yuielhQ2SXQSvveZC3kakiZ/T5YyDY3xKq7O6XiGt0lgn
	 HIsgFndN50Nj/HbPWZdRuB7nbrVYorsz5ht4NQONqzv/dbk+JIvYpHKfzFLGfbM3Xx+6R
	 OLnSBN0hpQIY47Hn3YNVvXAGfZGzJA5a+fnvq8v6UQ4x22IHlVJIzL6Feq4q9nG0NoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GT+0KNJd;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D1B60A2600
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 13:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3D1B60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GT+0KNJd
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a2551d7b5so960155eec.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 06:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281025; x=1793885825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OB2jqsnVm5eEvKu1VwxOsMOI5d+IePdDWWZTVxh1rD4=;
        b=GT+0KNJdIkRJdE8W4Gio2ibuEXT3n7impA3mxO3geWU8aZlinEeYdYdy07gFbSHHCX
         KhbsyXizO5+wfp7iifVvfkHhh/lLE8+fuhcdhWWY14Nvyv18Q2O5KBBNzRRaBblX1v5J
         zJqXETqUCazmqOkDpGVAY6Qng9fgVzLmLkAHYwB/Ba5TWDAEK0LZd16davtplEtlgsYB
         LcRi+7GxtepHatbRTZRFix6ZKSTeOQJqXRafyHg0BjKLWIMJJc0PGdzx8jXd78dDH9YX
         XIK9uJNHwM8wQ64A4R1HnVfKztxcFDHed7qbpgCh437XokySgXHWdN9bI2Xe1DUUff6z
         lovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281025; x=1793885825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OB2jqsnVm5eEvKu1VwxOsMOI5d+IePdDWWZTVxh1rD4=;
        b=SH/32snRrvJ3sIc7NQiRG1uy5hpBj3jq/KcsDqSA60sC02z9aA3/SAomyQzWyTYuzj
         VshBukM17zO+IvBZYfHA6qynzsmyXVfrfBoslk9IRJVL2M3y9qHo6UR8LSyaSc8I5FRy
         51Hw9lTcDJqPK9Hre9K54X0uTzxZ4HOa3fa9DUXSCISWr7oHhV1Fog5/KM85gw9qYLBp
         fn97lsnQeB19JK5luSzwQF0rnShbm2BaatZunNRW0AJyHT03q9QJFaYJrdx5bezNAG4+
         Uj9WEDoP15GrMrNeQoS0m5bFBB/JftjpZk5P13dySRN4ru0VHCY1edkUTaqBmPrbD048
         BiBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFEWmbomyuipAlUahS/mmFYE/a9mPMzSZGS+j7jwi/sHIz0c6VsK5UceG3lAbzX8K//PL8iaOQ4035@vger.kernel.org
X-Gm-Message-State: AFq9FYKs4I+pdZVpWt1yy1YaK64gtdW1m2mgHWSinN49Y5R3ylthMlqH
	LQaZKEVfs10SWqPgGsvwqfAgJLkCz4mzWS7MFZ9islWlBp10L0mg6AbU
X-Gm-Gg: AYBFou2/5eqzWi/+ZyujkB2bCsuxaehXknXwwqNKiCyQ9FlgjUnOpIOxCNo7IycfKnB
	dvz4tXokHWK3QGmtEzNljJSfyNlaR6sJsmquWOq/N1ZCn2/PMX/VOLtYZbQ6hOyCwFdfCO/WU1f
	0v/Nx3RRPjhg5kjt3atV4lA5swFPDjE3Z05hOeHF+nYsNNY/yT25s56jYBO1OAKs51jfmmb2/bg
	TyHznWN9CT1jn7fMeHhDfW4iqs3lOCWENlj8zyt3x7b8bbmZPyJ4EzBtEkppMrUdyDLFvc1ILyX
	/42Ka/y44lk7P872poAleaMTa1cLwk54sxRz6SnlbuJmeIOyMoMD3rxDghLmVLJX4tZDRdyH3jH
	u4W9sRF39d4GYWunRVRUc8vqCjtnGxyXl/uZEcUxvBbe7y8LuO+RikDk9D2Zgj5a6QQuv3t9b3I
	h7PBJ2n6hMVq5JW9xiRP6XRFXpyoVIYbC2mGYe01jMHwvYcQYEF9TnjTZuPNx8nn2EN6ErBrIH/
	r/K2GrVvGwqZYM81b/Yf5ANshOVE/I5GQ111wGA0hwLpLlYxRCIpQm2nbeOSWp0h83sYjNLFxZu
	h/Ss4dTgL3mTyfrhfAcBISAuVmzAQu8Z9DZbnq3/xHpXkKYuGNrYfw==
X-Received: by 2002:a05:701b:4559:20b0:192:a481:361 with SMTP id a92af1059eb24-1a942c60314mr3416088c88.7.1793281024734;
        Thu, 29 Oct 2026 06:37:04 -0700 (PDT)
Received: from 192.168.1.130 ([2402:a00:163:2ce9:cd0f:5122:d067:9a24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75f51bdebsm17046239c88.17.2026.10.29.06.37.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 06:37:04 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v1 0/2] arm64: dts: qcom: Add Vicharak Axon Pro
Date: Thu, 29 Oct 2026 19:06:52 +0530
Message-ID: <20261029133654.6585-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree support for the Vicharak Axon Pro single-board computer,
based on the Qualcomm QCS9075 platform and using the QCS9100/SA8775P
compatible fallback.

The board description includes its PMIC regulators, debug UART, UFS,
USB 2.0 host with an onboard hub, PCIe, SGMII Ethernet with an RTL8221B
PHY, GPIO LEDs, GPU, DSPs, and audio through an ES8388 codec and two
digital microphones.

Ajit Singh (2):
  dt-bindings: arm: qcom: Add Vicharak Axon Pro
  arm64: dts: qcom: qcs9100: Add Vicharak Axon Pro

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/lemans-vicharak-axon-pro.dts     | 848 ++++++++++++++++++
 3 files changed, 850 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-vicharak-axon-pro.dts

-- 
2.50.1 (Apple Git-155)

