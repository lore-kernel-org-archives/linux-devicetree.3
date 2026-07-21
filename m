Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C61429000
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628179; cv=none; b=ERorAyuxfrApXADIO8wBV51h2DsxBgUm9RzAMCMa0sUkKOO4rT9IZlzhLXqrbiEQlteycLCdeaOs3Wmym1DPcnqSGClmD2SirWGN8z+xWzbAdgXMtls4TCknucJYXsQSB1Arf62KSRPlH9+p86ndCWcmWN8YkRnH14GdN/9vT+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628179; c=relaxed/simple;
	bh=7+sESZCwoRmRdIMvSHX+5fStOthQC4z83L8wCCGlnHU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TNdAcN6ChAqq/ZfWX1hiEa6CjvKM+qUFJWdbu+GmF8lsvNfGuC1P+nKPpMd3s8Q5z6bmsrmAS6IEoQaWbWhuFXlrYFoLrbJi0TCVDIdhkBzC5TuMF9GI85dP6/t9AG9ol+k6ScC8q7ZIm0TBOBTcSC/DZY2i6jmqetzv87SX/DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6shmsyR; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6shmsyR"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f81a3ccf9so250153f8f.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 03:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784628176; x=1785232976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=001R/7t07n0Z2h3W1UkPArubc/R60QJ7+7vPomj4XII=;
        b=a6shmsyRgbZ9NuRHBfy5B0RBRPoQdEtXUcjF8q7LcGh+iwXRDbkjT9V0jYBnUgQNri
         zaf/BAogXt387tM/jQFYejoTXmbKskPC9dt4eVpAEqNcN5jmiLOIdvlUvmrB9gYiI/i1
         E562l7N9KXYsoSyJevGy3ZYlEikn/u6lnox7cbatBnTcvW8n8bB0kkE+/mg1DK0vDL9m
         7EKmVZ8LuiaSsZF6bhhVzcriAKhLzwRflqD+xtipwifwomUAC8/aPDMhKAWdZ1hJWgA7
         gZ9WBRJak+wG5OjBy9gt8gyfkMbLMuxIANhPE5KzD+GFWNm/rTRu0Fk3quTzkIG+te50
         PoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628176; x=1785232976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=001R/7t07n0Z2h3W1UkPArubc/R60QJ7+7vPomj4XII=;
        b=EE67MgtF2kDXrbfsFqWS7SER24tqHtLsFfC+8OdvwOj/rcYVinxaUZLt03SQCoszLS
         skpvmhrhwvcgJ8JbeOdOxA6DsvG9gStRysMTc/mo8HDgFscH4rfXjumyVbB8DfkcEgfe
         gzHzoOnV2bCDTzUmOg7ieX3Y/MerkQvLkNDGnFPm1sG9nr+3YpERCBQtr8YNyqS4NhrT
         T7zrQEw90W6o1we82WifrUrNrSuu1Ff2INdfI7FG6tF/1aGGMeMXdr9UaDlJuA239ETm
         par5UwRU3EOVpQXpRtge6N9lc9GzmEAi9jMsC3HexXKxQYIGzRICoc8xSGnSmLSH3qBZ
         FW3A==
X-Gm-Message-State: AOJu0YxUfKvtaNXIC1KkUE2PCjaZnKcL+Y6xt+CH1Wgk5G19xE00do/s
	HlisqRjzvTQfY3G3ajOJZS6YWyVsZRHSM+1YyPV3zu6y1WAvUPo0ZIvm
X-Gm-Gg: AR+sD109RtphnSP1rHMAaQoMSt4l2Hr/KkdGjdsJZXch1zE0cLQaP4nCuCzDsYkrMaw
	oLWcrKJoRtX/ly72puXWzknC4du5B0b+ouEOi6CaisFPf04rxKN9Qqg6q/KnLJeuVMyq7/FF8h4
	ht7SDHT3JBz6o5Gjvn9C5DMhrK4G2offPXZhwb/uOEw3BwLh2Mfwwh+wltgtHDGFQTH8Sh6aI4q
	k7iNZdfsgUQfllR343CsjprHPGenQy9CF6t8gZgn9LaHyTV8ywmOkn7fBAYeJZJpO3KhRWeJUyG
	QXb5dJimY3ZUjiKPoSd5vJ05aMvvfSPrGLcH1FUBDa3Qy+4qBmYdcRoF1XGsIETeKnu5P+9Qp7d
	5+qNJzZ3d6+4AUeiAS9EBT+70oj9qeWF1s+c25sYB2jsTy+L8HA4Ds7V8jjuG2GYiIWwBxeMfpB
	2YSleJh+aq0C0Bqvn6vfsq3b4=
X-Received: by 2002:a05:6000:178f:b0:47f:7261:3a58 with SMTP id ffacd0b85a97d-47f72613ae8mr13330553f8f.1.1784628176206;
        Tue, 21 Jul 2026 03:02:56 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ec7c69sm39976860f8f.17.2026.07.21.03.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:02:55 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2 RESEND] ARM: tegra: Add device-tree for Motorola Atrix 4G and Droid X2
Date: Tue, 21 Jul 2026 13:02:43 +0300
Message-ID: <20260721100245.444623-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device-tree for the Motorola Atrix 4G and Droid X2, which both are
NVIDIA Tegra20-based smartphones, originally running Android.

Svyatoslav Ryhel (2):
  dt-bindings: arm: tegra: Add Motorola Artix 4G and Droid X2
  ARM: tegra: Add device-tree for Motorola Atrix 4G and Droid X2

 .../devicetree/bindings/arm/tegra.yaml        |    6 +
 arch/arm/boot/dts/nvidia/Makefile             |    2 +
 .../dts/nvidia/tegra20-motorola-daytona.dts   |  107 ++
 .../boot/dts/nvidia/tegra20-motorola-mot.dtsi | 1194 +++++++++++++++++
 .../dts/nvidia/tegra20-motorola-olympus.dts   |  108 ++
 5 files changed, 1417 insertions(+)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra20-motorola-daytona.dts
 create mode 100644 arch/arm/boot/dts/nvidia/tegra20-motorola-mot.dtsi
 create mode 100644 arch/arm/boot/dts/nvidia/tegra20-motorola-olympus.dts

-- 
2.53.0

