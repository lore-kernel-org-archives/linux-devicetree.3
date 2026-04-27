Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D549239021E
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 07:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777273427; cv=none; b=jdWDkAFoI1DR6zwYhgcsBchlLrDVyULI92HTue3unAFZFFZyjl5948U76N/gKIQGiGRRTdf3XHhv5DT4mGZFTbPlpRGT1vNw8/uM7Os065txoWVvURgJHF7ZcuEMgEXz2pZj7HSNbK8T66IDY/pjvdRru7OcsebFIqY9uSDFggg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777273427; c=relaxed/simple;
	bh=83bu0e2hUCx0MiN45S3ruSGlLf0W0sVvbitldUzcJRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FUN9B66R9Tt/LX+NgySKfz+toyE0i9YThxQDkrDDUINE5b5oP9m2/n7ikigohb8mvN6ULSdLzarj8gjFAtfNe+b1gi2K4IpN76+kAg6wdV6jLpRZdeZJAp4IRPqXntRs88xbgvIi0Hyem0fFdOPtu1MesECDSqu2my9uwYw15Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mapzlhba; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mapzlhba"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43cfde3c3f3so10011155f8f.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 00:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777273424; x=1777878224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qiCb3qX1nnHHHaqbj7n6PWSc1bwd0jpS7OTapvME0fc=;
        b=MapzlhbaTlNeFXfTKmFjK8ctVTaOM201dZLg1NvYTw5lj7xVRf8Vij+Kg1eGd+Fk3q
         +P9jZf1mJDBJFekBa7jVeyY7zP6186Hj1zQEslebsgMj5bYZHsx//voezPQx+HqWIfu1
         OMoRHjdTSvZKsyEUOOqY5aYKQsE2cOvxut1jrJDtMFNQGMb7sPivM+C0gN9v+5Dm/hDw
         XQxU7LC7A+AolzN7x9V/kBf4uknfK/K1cSe3wbHQ6NJDbIGipOaVFHrL0lCTKdC3PI0O
         P6FTL4ChOhWuy+1LXYMRfae4l6XBvHwthH1EgjQz/HsOx4PC7S/PhPe3usuzqa+hozDn
         zkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777273424; x=1777878224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qiCb3qX1nnHHHaqbj7n6PWSc1bwd0jpS7OTapvME0fc=;
        b=pg1JGrSJmRcAWwL45s8H/6ELu10+a4SWVaUneg2jyrYAo5MdTudvkCQKPPBfRZVOHX
         Mdpev5w7b+h4IfimehqZd/1XVeAtsaY3c6ShQ16d/LtvhYTCylqU/ULqO0ekHW7g6WgO
         0cnWf6p5mHDp8RRNNw0qcRM/zVdcSEGC/3mr4I30WZvea3MVifSQy4e5Y8jMqNBacqZM
         26SDTm6auRyJzNJyFsQ6htTgDWrZPFvfMbXxUeP9qahw1CJs7dzVRk3vb69smw0UcKZB
         mUGBjP8k1sy8LbHRRDXTI6hUv7TExwv6QXyVOUgSw2M53WncWiA2/SvAzgAtHkAtMpV+
         1UKQ==
X-Forwarded-Encrypted: i=1; AFNElJ+5RsZx3k4NJDJ3hJz5lnHYPXyp5sOHw/DS9sqAWd8Dw0V4eXDcJ7p9+1Jvq4NZduOeBaOXpHJzjCcD@vger.kernel.org
X-Gm-Message-State: AOJu0YxZGr2bZMICRnh9p5alerVS8x+YAL63oQvPGZX2l5E7rGi/3FDN
	7HQEk8tn9+inc45MHmS8FJp1UXjB/7oGBY5mSF6E9N5rBO6uJ4IZF/K+
X-Gm-Gg: AeBDievbSAeeUpjvtAVVnAYFrjKltG5dk5nMd8zusXoURspztPW1QrRvsczPJTWwgwK
	OzwrBAvACU5LZomZerGkRp9mS54M9gmk8qGfk7UJRkrJ54G7NxRifIBum2TWgRUeJEfOL+XSuEz
	J3q5BkRujsdNjQQUNQw0m44YnZy1QNzHiqkC8y7R59zHF3ifU+6sWpMpTT3STI2Tw2mI4ZXIkVr
	2mLBhNX+YEpFm2ClvUCXYI1VnikxMoolvo5NJ7CA7O2aCKxqDCe3W+WvW2OCjqzptw7LRVgNPOm
	mEyk2SKlntj5A2W1hMxnPjVkJXo/onzPSo1Zb6I8NwE/T6ST3KK/hOd+hjO55EmXdk8/eCUVyO8
	JS5nuf95XATm8RQNb0o13GydEHbf7xJLNqO+9gQLlc0wlsgJIX3ur+++2W/LQXcq5bbQhB6h28C
	HjMbWIUEJZRcYi4uqBcRvIvwk=
X-Received: by 2002:a05:6000:2c0c:b0:43f:e22e:e8da with SMTP id ffacd0b85a97d-43fe3dc5b0bmr63597483f8f.5.1777273424009;
        Mon, 27 Apr 2026 00:03:44 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a341sm84245734f8f.24.2026.04.27.00.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 00:03:43 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 6/7] ARM: tegra: Add DC interconnections for Tegra114
Date: Mon, 27 Apr 2026 10:03:11 +0300
Message-ID: <20260427070312.81679-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260427070312.81679-1-clamor95@gmail.com>
References: <20260427070312.81679-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DC interconnections to Tegra114 device tree to reflect connections
between MC, EMC and DC.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index 6c2b79b35938..f46406b06a07 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -125,6 +125,17 @@ dc@54200000 {
 
 			nvidia,head = <0>;
 
+			interconnects = <&mc TEGRA114_MC_DISPLAY0A &emc>,
+					<&mc TEGRA114_MC_DISPLAY0B &emc>,
+					<&mc TEGRA114_MC_DISPLAY1B &emc>,
+					<&mc TEGRA114_MC_DISPLAY0C &emc>,
+					<&mc TEGRA114_MC_DISPLAYHC &emc>;
+			interconnect-names = "wina",
+					     "winb",
+					     "winb-vfilter",
+					     "winc",
+					     "cursor";
+
 			rgb {
 				status = "disabled";
 			};
@@ -144,6 +155,17 @@ dc@54240000 {
 
 			nvidia,head = <1>;
 
+			interconnects = <&mc TEGRA114_MC_DISPLAY0AB &emc>,
+					<&mc TEGRA114_MC_DISPLAY0BB &emc>,
+					<&mc TEGRA114_MC_DISPLAY1BB &emc>,
+					<&mc TEGRA114_MC_DISPLAY0CB &emc>,
+					<&mc TEGRA114_MC_DISPLAYHCB &emc>;
+			interconnect-names = "wina",
+					     "winb",
+					     "winb-vfilter",
+					     "winc",
+					     "cursor";
+
 			rgb {
 				status = "disabled";
 			};
-- 
2.51.0

