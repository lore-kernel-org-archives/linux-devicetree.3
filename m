Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3D247AF61
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628671; cv=none; b=QxHXFQaDl7XzSjX1ARLmgFAw1PaqDYHRHCGkvuKag+ajRdbR5bdj0s+mcpAOoqDCnl93dTbIDS3xHyM5AINvJ6AQGjTcJxGo8wNiXv5MHEMDkS0K5lqomNst5EWcOFvMteWwo8J0+b3uaftNPCwykErhBZs4L4hM0pIPguOaoMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628671; c=relaxed/simple;
	bh=nIdb/fBsG/b+YAwCgHXS6FdjGH/P6bepsDzowX5hlz0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lNEzau6k4nQyaA5hFGSBq+3B6ndKOce2DMkIluzrtEHcM3EVDAgF01kwGE2CrdkCnAEoitNqXpP3bCDFel1WguGr7iBftYAu7YGP4usswEwmMYdJJkmnI7znTEWep9P00hfIX0YI8MWHs9DpL2J9wKZ6QZ8/K/07yB2en2bl+6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X11b/oHW; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X11b/oHW"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4956869750eso2374115e9.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 03:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784628668; x=1785233468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dFSTYRvO4N3dQdiGAv4aH0rwTo6KGoapPKqZsOz3hkE=;
        b=X11b/oHWSPq8QUOTWQXHruQv6jzE8zpaNyNkqvVC2wnhmTNuxzf8E3tAEW0+virfWa
         zkcvc730thgzr/9CLXUB1binmdXkaW89fOxOyz6HTk90wDAVb07iL22SbFYjh/RYFdIx
         Fyzj0r78n3lv0tRNSTCbd/c2EaW4lJBXkfMzSMkv+GH1dyD7vhxjnm/p5knoLpKKaWOs
         fCPrtCaXBq/tZ0BiDjkXB32OUasLU/Kq7wfeKjtOBV/ItUO+mt7bNHkUkup0j0aMk4BF
         zDI569Ll5T1D4mIpJsMvQJc9Y4HXqclNcwZDitmJ1Cn+GiVmeosM4Un6UggT1RvVi1xj
         o7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628668; x=1785233468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dFSTYRvO4N3dQdiGAv4aH0rwTo6KGoapPKqZsOz3hkE=;
        b=rJW4hwaHvy0SbMJc/rseuY/ved8gRvwSzXgx6BoG35yscMGdx1rJqf1jNHkoV3sUgY
         MelitnNrQhtqBTIloQaEeWybfsaVCTXLKJ3oNpYKEcIjEp1kpJWe70ondDUfNKfSibeJ
         YmcdCPWHAQIBfEcvB3R2Oc8Zt7Uz1GR9+Q7yLY9CidmP0TsyaJ9eTSCOI7nWjqLA5Dtr
         BriSO1r5KIwqNSJd+oSJGRWNeGps86km1N/aboSkK1yLYH4gopupVd6Qg8DjufmdV9C0
         XWv5rRT7kpCpXsP37O5pGifj5hXffqfCbs/MD0rvNkgrFM+pUSH36sVblpVqNYkkouMh
         n+gQ==
X-Gm-Message-State: AOJu0YygmGf/znJ7+ydbbW/i7P84Yl2R6r2jyeeFtU4VXcjbCtMmF33Q
	2z/SzpcKPXEnzOrZ4B4hRAK2fIDLXPd1j/bL8l3YbbBu3VntNJRg3pKv
X-Gm-Gg: AfdE7ckyl9aQ79LsVgMaCfwPeP53DZlAh+VpnG6pWu9005Oh++xabEv4677HmJ8Lo2k
	dfQlQh8uRPAwgex9b/ecdrcLADMhXwPbDMfHiwVcgQUtDRqLUs+V1f7Lx3vMA+/iJxMqCN7trXz
	ncRD4ViUFfCIgWgfhqmvbDUb7khnTMh7N57gyemjD168d9o6tsLYjjJJcBOAJh6WJWAip8FGiGm
	3eUP0ExIiphDXGsyq+gxOlo4sHbzX7pfiKYW3/Ctunox5A8XlgW0ymyY9vGEAn44XFmCIPzKs6b
	u46ZKFHNPisrqmR9OG+KyvVteh6+j7vyhlhPocqSTbnS3NaYseX4BQAf/eCGr4Tyc2iizm94QNa
	KMRMyO+TYOn4tGDsXgHdV4Ik9mpl6rSmphJEXsbVlXkX5T3X2ieH7oa4RwdY5K3BhhHOQ5rv5Lr
	4OMWkaI6YuAHVW8d+m1m8OPkc=
X-Received: by 2002:a05:600c:1989:b0:495:699:84ca with SMTP id 5b1f17b1804b1-4954a798f17mr187455865e9.28.1784628667616;
        Tue, 21 Jul 2026 03:11:07 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956547319dsm57127085e9.5.2026.07.21.03.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:11:07 -0700 (PDT)
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
Subject: [PATCH v2 00/10] ARM: tegra: tf701t: Add new features
Date: Tue, 21 Jul 2026 13:10:49 +0300
Message-ID: <20260721101059.451699-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add new features recently merged like CPU DFLL, MC and EMC timins
along with fixing some existing issues.

---
Changes in v2:
- removed vdd-cpu-supply from CPU node
- fixed typo in thermal nodes
- adjusted MMC flags
- improvements of commit descriptions
---

Svyatoslav Ryhel (10):
  ARM: tegra: tf701t: Configure CPU DFLL clock node
  ARM: tegra: tf701t: Add core-supply to PMC node
  ARM: tegra: tf701t: Add MC and EMC timing nodes
  ARM: tegra: tf701t: Remove pin_ prefix from PMIC pinmux
  ARM: tegra: tf701t: Add thermal zones for nct1008 sensor
  ARM: tegra: tf701t: Tune MMC devices
  ARM: tegra: tf701t: Fix BCM43341 WiFi/BT chip configuration
  ARM: tegra: tf701t: Complete power sensor node
  ARM: tegra: tf701t: Configure UART-B line used for GPS
  ARM: tegra: tf701t: Add chosen node

 .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 885 +++++++++++++++++-
 1 file changed, 848 insertions(+), 37 deletions(-)

-- 
2.53.0

