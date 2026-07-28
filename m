Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FF83F4128
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785225566; cv=none; b=IsJSOkg0LD0ft6ytJy1c8txfInHbOKeEeU6I/iVVXDbeel0vQPCJ8qryg69KmiiN19aVo2V0x7h/rArkeXyBPatbn3JURnL4VkUjApr635EeIaUTGqwv08EfvMxUL93Nj2OUimeSCYAsPiEI6ZnYLaXcz6Na6yN7XFiDq0f9z4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785225566; c=relaxed/simple;
	bh=UgBTQH7GpSUIQwncRoW5RM++cyy215AnSvysVsOpvRM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LkN3Q6cyj65SuoxgU0jWjptO8irlehsEVPbbhjrgaYx8qKY8DyQmZQ6Qx407kAziy6Sc6RDHOY5tWm2/ehHE6mg3FsBtK2aatF5GL59f1JMkYxlaScoa64Nm11Qwn3MqmcXovKWD/GZaPvekK8anlka+jCdHpScDw7y61k4RoME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n2CftCgJ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n2CftCgJ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cad8076b01so44457845ad.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 00:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785225565; x=1785830365; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R88QuZxfpdQjWFdL/UX0MN9xrstZMv3cCY685maQmlI=;
        b=n2CftCgJghHnbiS9ImBk349RihNy2e6I1pX1Cd31eT3BMCGkPNNHdng4oIfed229rP
         GwUEfdeDmqOifW4LSVTT/gx8DHX1NXvTZ8Udte3htPJznSUT6WBS+R88anEYAFSKE0IT
         wlqOV867ZAuKG6hpdjsM21XCF57xUs+KLen6Td17B0k9hz9FEFTStR1zkqO1KXTRoTq+
         RY6oSWTXGGjgTXsJrlKAxvxbkIX4KbWIPiwR7rqzjmmVNNVIZPHEdD6I6Zt6/X3ZrmiA
         /XgpPxubcBSyzkwBQAxu4fASLImx+8NW+/c4iWZvLjY1/fsT44tchxjyWFy3ZQVBa27+
         wtHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785225565; x=1785830365;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R88QuZxfpdQjWFdL/UX0MN9xrstZMv3cCY685maQmlI=;
        b=FwMIQOxJiz+1J+QFbgTvb+dgO4QUQwLB246Uh9uSDfuiG9PTimooYUrkh4/TuEkWe6
         XaGNUE8XjL5uqi9nthqnFV2HkKrVzDMk/GRgC358x+BxStMkLY9983OVcQyWbVUFFMbd
         o6DuQgjiFnQ9GBTWJdSQ51d9JtfKjVYvu5cQF1kGDYbuxfrCP2gkrKKjHUoRzy+NcW/8
         vWSJs/m+/PK1KrBL/KjHOPVCIRmIlygt6BlEG8ll2QIHFWZs+BIOHafm8vaCyyPMD3wN
         Yi5QCosDTafzD1R1eBBc5wozKsIBZlYN2YH0K+zzO7E9Z6bX6pld3jEY3yGoXfZuieXr
         EhXQ==
X-Forwarded-Encrypted: i=1; AHgh+RpiSdb3tN6P1UIeO+m7H58yfwqvf6rOelfzlPnVieawGQqw7jDI1HIyynXraNHHFM72zoX8X/1blTE2@vger.kernel.org
X-Gm-Message-State: AOJu0YzUePZ1rOMQ6xsb8mMrJds1uWv0kAyIMhW+su9249Kzh/Ka4jkx
	x96Hft8HcjSyjpdMwMNbQyt+MTTZAxerEcO2hB2MMXaVw1fyPc0L8g+j
X-Gm-Gg: AR+sD11aCUiAQaa6pvwVU136r6fP1B70mXEaCSMSMBfTGqUtpUZnpmbfRTvnfyuwqRG
	jeCO/lmdh/7bp4IZ/xmpuZOmgl5YMBnMsbxD/Zi6Hn1PH2h5g8kmPcaIAoa9MJne8/8PmcxhuZr
	EvgZHJKt0X09KldGIAhxkwiW5vtHr4qZ/l/2/7FwPA0UYzmRiYRJAzyg87v4zXtPlA70TDlQAcp
	nEUyBmCIDMChAeU0nxg90UPIGyOwo3YUQp8vw7j9zF9aFuDgLtrGj+ry1KHKsRL9khRRdF/tLZK
	/gGvrV7MyoNmlicxMnXNTDsS7aNWi1qzKigYujSdp1e+Bvb4c7KJvk3dBB/LKAfh3yOkYdWC5oo
	EtXUIIzlMd/dKrSTpGJO/OotkfrHb/mh3jIjSr+EP+ubKCCO79JDHUmrsMPt10RnLOBhj6D9+F1
	hlpejbihxSCvdZe7ugvEwmit4ZM7/Q8B47RhMeaT9T+Q==
X-Received: by 2002:a17:902:f78d:b0:2c9:97a7:3289 with SMTP id d9443c01a7336-2d015dbc958mr14645265ad.43.1785225564742;
        Tue, 28 Jul 2026 00:59:24 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81d81csm47543915ad.80.2026.07.28.00.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 00:59:23 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Subject: [PATCH 0/2] iio: adc: Add support for Texas Instruments ADS112C04
Date: Tue, 28 Jul 2026 16:01:16 +0800
Message-Id: <20260728-ti-ads112c04-driver-v1-0-475efe4e2b78@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMxhaGoC/x3MQQqAIBBA0avErBtQk7SuEi0qp5pNxRgSSHdPW
 r7F/xkiCVOEvsoglDjyeRTouoJln46NkEMxGGVa5YzFm3EKUWuzKItBOJHgTI58p6zzjYVSXkI
 rP/91GN/3A20C4wZlAAAA
X-Change-ID: 20260724-ti-ads112c04-driver-be7e89047834
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=UgBTQH7GpSUIQwncRoW5RM++cyy215AnSvysVsOpvRM=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBqaGHQ/1AGTtbpoWMNgqPkPT861vDNSceKl087U
 xvshrMRU12JATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCamhh0AAKCRClg0K3CVbE
 ge71CACEmsQM2PPE08Q2PwZ52TMhOq3OpFqngbpYTwBiqxW/i9gSFmtQ6mr95sDc8dYUR4785o5
 A4Q90+1GM15wRM38T66yjGFuk4kOt4im5cCtibMYBhVrW927cPyHn1k+mr1T7io2XLOXGXsZsUF
 GKQnYSw0lLNElLyOJKtcO9fafmbhZWI0f2S+4++iD27e1tkXVgnpwYXmSRHL2LedftcCf0GSTxa
 KwvJAfkjDnuPcrTJx5HAWi3GM//GKChrtoI4dDYaCGHe2NunR01YDNxTD+beOUIhRLAX+wGHm5l
 D2p/WJzAMtV05T5KnX9nUAsw8u6CspxDNd6nNPagvXjEbG6B
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

This patch series introduces support for the Texas Instruments ADS112C04
Analog-to-Digital Converters.

The ADS112C04 (16-bit) is precision, low-power, delta-sigma ADCs with
an I2C interface. They feature a flexible input multiplexer supporting
single-ended and differential measurements, a programmable gain amplifier,
and an internal voltage reference.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
Kyle Hsieh (2):
      dt-bindings: iio: adc: ti,ads112c04: Add binding for ADS112C04
      iio: adc: ti-ads112c04: Add support for TI ADS112C04

 .../devicetree/bindings/iio/adc/ti,ads112c04.yaml  |  76 +++++
 drivers/iio/adc/Kconfig                            |  10 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/ti-ads112c04.c                     | 317 +++++++++++++++++++++
 4 files changed, 404 insertions(+)
---
base-commit: 4539944e515183668109bdf4d0c3d7d228383d88
change-id: 20260724-ti-ads112c04-driver-be7e89047834

Best regards,
-- 
Kyle Hsieh <kylehsieh1995@gmail.com>

