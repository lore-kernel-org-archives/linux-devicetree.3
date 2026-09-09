Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1505293EE
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 23:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788997705; cv=none; b=dKDnS5l8FzyHholu4ejMmpGnMXwwLmiS+zsCxaWbbmcgNbH7CzQz+UB1o8GiqpYtmKL+axrXecZhuykgt0YI7uLVHV+IMcJxEFXpjyYBeQdS6PnljwGK6Io8EAWtsSVd3Hjbgt9XDQsOfAFFF57iiMI1AIgeHAvU9Bb+s4ueEaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788997705; c=relaxed/simple;
	bh=j3nXkMsJdWKehS+eBrEBhVDV+Ebh7EVLigl6HYjdVE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tjWfMuIUIYG+cA7fgBrkrltcjL0245dx/wipGi6A0KNqMuBFo03v7iRLGBYz0ymxfnLeAZbig7RN4WmQNLirPuY7fPTlu0wlKDnVL8LYo46hoH1EeDfDIvekA5mMXHbknJAy1vFHX1tE1jixxWh9m+DrWnTmI5PNy4vxnq+v8eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I8u+YtJf; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I8u+YtJf"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b4ae0b3308so4801468e87.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 16:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788997702; x=1789602502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ThT5wu/no3JecMleRY6YhnuthYVTftRYEaBVTxj8kQc=;
        b=I8u+YtJfHEfdFVcvAi8iMZb+CsaYFlyZtEj3ND96sgBd+8B2ldUPTcPzNyrLAM7i9e
         JD11H3c8vvBn39sgidPnZ8eAdT01icuPsi+RPqeAQcq+yvxV+dp/84DWjW0Q3wGezQht
         ZkMqUFSW3xuhg4knXbxfclmzO0loKE05YQK8BJrg2Y1J2Um7MrC8emTzPI4v+igNO5OT
         XJEbPmKNPdyCLTuxUQrvd/kXxI2GyY0C6QxgkaBGYVcgMmAlo2onWWVPIcylHTIimU2z
         ZrwxYNXurThhms0PaQuxOkVyThKBGrqDpU/Lgncs37n2B2S5FsY2qIlsJPoIJzxGoOdE
         83gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788997702; x=1789602502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ThT5wu/no3JecMleRY6YhnuthYVTftRYEaBVTxj8kQc=;
        b=RP4TgnckOJQSu01TnzM2BjWnGQD6NRhuAYXir/VJE3j4/JL7GxNF1BJDr1hBcZowzH
         xY41927zkiWTgPwivWSLei7p+SX4lRJdGbXAGDH6+2vYstKtR2MJSWbduUdBo9XeM924
         IO5arJ+wOU2ChchXilF32iXueWUKYYZMHu28ITOJkzMBDeWdinpHvqdjlLkAj4bvDDm/
         DkSbf3zIlhGbbJ6yCX14D9jAWOZ+pq79MM17S8Ot+4Kb/RlD7XWeS2wP0CNXIugHqlSa
         +yR9yH82P8EPtn+QZtw4f/qkUPxUJPEYbotmYxiQB/RMF+Sc0wRzGQwfzcawiPsP8T19
         sHZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKDeElBp1hjWaQCCsPXgotIE1Ea5BVj+Vhzbigxg5M9YTB9gvjJKHLNipNEVg+03POjiNxB/4LBolH@vger.kernel.org
X-Gm-Message-State: AFuF++mDP6hPlOoEDU8NL3UxvBKteZ7ORUJ6uc2hHkb/NV3Rt4iOnmne
	VGhI2ypQvk+xP9HQd5b9ouvp0iZpc5+9m00eRBrqCObIEK4hd1PXozlF
X-Gm-Gg: AYBFou2Sp2ZdY4vbb1DBK+dmcwfXrQEEQda0neHt523Q2vISTsMnwo1HB+j2TfmN1mb
	eJakW1fljAbGlatRZEaFqON+sw67dpFidhUIGiDvnX/xyiiJmVkytMSEaFcdGMaOQSQdfMUx7Bp
	+Zmy2guvC32uF0wd80SjiJPioH4C3t1pYB9Rq6Nu2F8VJJkJb4LuJuacxzn4+kkM6srXyymA1K1
	n71Mutc5juPAB2oq21nm0Fd0HW/hnZxoUHjK1D1mhWChr5wEAWmt3dBWzJROF7SDIAPiihWPlmW
	PtWjzdYKPNEMXt3eCLsRTx8KUmkD45bQOj3lpK5Mzl1oPD6IR3Vyzej4yQxY4qe4TinWpNpG/nC
	ML9B7vuCAT5KAsD8v0w6YQ8UstDg3jVHlGT+aFKfiwuNHfBGZc6z7U5wDXOCG6h9PmEnYJVuFZF
	ie+aToFOrAS1bR9a3lQgPhq/PhVXluhoxoI4TIQBcrQoilNEMZyqdmuHREkn7/3q6Rs0vHTh2JE
	AT7EqiuCH61JdQb7hPYD8ZWdf1a4xWxXd1Qwmv4M5eTMI42K9w=
X-Received: by 2002:a05:6512:3f0e:b0:5b5:e86f:3550 with SMTP id 2adb3069b0e04-5b616eed114mr6055767e87.9.1788997701538;
        Wed, 09 Sep 2026 16:48:21 -0700 (PDT)
Received: from notebook ([93.189.200.242])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166ed4cesm4153300e87.26.2026.09.09.16.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 16:48:20 -0700 (PDT)
From: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: David Heidelberg <david@ixit.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	"Andrew F . Davis" <afd@ti.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
Subject: [PATCH v3 0/3] bq27xxx: support interchangeable OnePlus 6/6T fuel gauges
Date: Thu, 10 Sep 2026 02:47:41 +0300
Message-ID: <20260909234744.1177153-1-rinat.muhamedgaliev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829205258.26955-1-rinat.muhamedgaliev@gmail.com>
References: <20260829205258.26955-1-rinat.muhamedgaliev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OnePlus 6 and OnePlus 6T battery packs may contain either a TI bq27411
or bq27541 fuel gauge. The DTS compatible used until now selects only
the bq27411 register map, while v2 proposed selecting bq27541 for every
device. Neither static choice supports both original and replacement
battery packs.

Add a generic ti,bq27xxx compatible and have the I2C driver issue the
DeviceType control command at probe time. It selects bq27411 for
DeviceType 0x0421 and bq27541 for 0x0541.

Tested on OnePlus 6T (fajita) with DeviceType 0x0541. After installing
the kernel and rebooting, the fuel gauge reported 4.360 V, 100% state
of charge, 27.8 C, and Full status.

Changes in v3:
- Replace the static bq27541 DTS change from v2 with runtime detection
  for both bq27411 and bq27541.
- Add the generic compatible to the binding and I2C driver.
- Split the change into binding, driver, and DTS patches.

Rinat Muhamedgaliev (3):
  dt-bindings: power: supply: bq27xxx: add generic compatible
  power: supply: bq27xxx: autodetect bq27411 and bq27541
  arm64: dts: qcom: sdm845-oneplus: use generic fuel gauge compatible

 .../bindings/power/supply/bq27xxx.yaml        |  1 +
 .../boot/dts/qcom/sdm845-oneplus-common.dtsi  |  4 +-
 .../dts/qcom/sdm845-oneplus-enchilada.dts     |  2 +-
 .../boot/dts/qcom/sdm845-oneplus-fajita.dts   |  2 +-
 drivers/power/supply/bq27xxx_battery_i2c.c    | 39 +++++++++++++++++++
 5 files changed, 44 insertions(+), 4 deletions(-)

-- 
2.55.0
