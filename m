Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09845403E8A
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767143; cv=none; b=uLgEeBUtaPEonEw2QVMGuxdVdrrRNhmxy38lAZBsaqR1smfu7jYh3NbXpy++9QiK/GxGUx2rJ6umrWziVlWpQSZOow86vCTmiYtoYq9YZGWE6YC2R/5EQvN40IMTl64zrKZR1RzMNxVoe3ZeMpM4MdsZ1UKjxmYh6vowNXLTft0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767143; c=relaxed/simple;
	bh=LzTFy7YHECcLbcpiRen/GFBQVX4hobVrBXZ3KpATLCo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eBl2n/h6qXF2XQ1fxtSrEMFINJq8M2rIgqE0nxmNY+EsMjVqpXFHemlCZ6lFqbMX3m6kYhxq55aIO5aE1sMdoQ+kvHs6m1Bo5YM3T1euETgrpLsmJN0e6csIR/oWxAO5yPE9rYqPFoUG1UtQZ2nWHZGOT4fxwiKeNwcb22pjWiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHDpLeia; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHDpLeia"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8686f46e4adso3342862b3a.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 04:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790767141; x=1791371941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+yfqfhizfQ05zp6V77MZ9T7BSR5efZzEVT2zwBnQMYA=;
        b=nHDpLeia3h11J828OHZhOrfh3436mMn4Q28hviwNvMEwxYx2s9JIQKkR8yT78RvukR
         3N8cEfJ1w6Tvk9V4uFlAY5PWt7PdYIQj5jblATNaFTiICeCbAxHGNymLp+38P7PA+znr
         E8CjyfMmwTOF0E5HDOdX5jOiPYy8zBc3dKjeieGcWT+d5qXt4nyFTz8MFrW+vbkqICKg
         zbojej6ZluqMu2rYt44dgHG/RNYBxkcgYmZ/aFjgQegp5TVUkH/bAU0zQshMaZMESvct
         4KzzXXAgH3jBWcsSEi1mPuGr1Sppl1JH8l8UjgOCjlfKtY26hzudnVXW5iVeN03Al3z1
         1Q7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767141; x=1791371941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+yfqfhizfQ05zp6V77MZ9T7BSR5efZzEVT2zwBnQMYA=;
        b=1OUU839O+qnDlFCSRzbfFAzU84LOoyz3o8ezayGmaVq2pnJuxRWdLbZ20MGGYTdUey
         PSgN6bKWLxuEmndTztGFAFgfeobmN2IC2MHiT+RSxU/G0Jr2GxddBG/3nVgdVO0CuMIH
         G38CHr+9W5X/Wa7/X0eo7FCtpwkixYyPwkZfQPkK+9yn1QXXEkJtmT82aTmIkTsNXE5Y
         WPKZymdvEYbHUq+1FlwHF4pBcKGIWOifWjBMBSa8EiuMVqbWOVzHRqSpmErbzIutBmmT
         qnv6fswR4kwkSLAh5ca1hl4kR2U0itqdv22Y7etG4INZLZnSIMn64EbxSJ5YRtmpyD/I
         kGzg==
X-Gm-Message-State: AFuF++kHAX0p2HVFOjyGG1NVYIaTR+KsPqQttK+y/0ZG5KBLlwKydm6H
	2jmDPJi563o84sjxB8i01iXE6tTflAXqJcQhqSeI3Rbp9Y7WmW2Mo/wx
X-Gm-Gg: AYBFou2IJkrSKor/UjUyVrlGUYo331QxaHboRkBwYZI0J7Kg5a3xxcLuCtFnyDfRKYc
	7zlXGsRcLMGZwwdKmBThUIOPU2Y7SCXkoXqfmCz5nUsiSnXY/tXLfObzCtpDw+07ofPQLvtG8M9
	RYXi2W+8f+apLDskZi++3M8I/nt3pBuuTvNMsP+ME0WF+NvhVeDNvqKxZaRL+3Ki6P/kS/LzrPc
	8uUb1uu4hBQk9jxdhNgeb8+UqbaIgtDdaxntf/L5rhy4L3cIWhLoeiYTDHtq8THTElepjhNJLIs
	ls234mj7B3uBJvy3VXiYbNaCJzRtBJKA3nL1ScGk+uEChHRZUkjabBcez8dFGV+K+Bzg0h7E/A+
	goUJ6zn5KJ2FayY30kSyOl1o5e80dl1N37ZxBe3P/+uWhGmwiDcN1eF+8/cRmS7n/xQkoigHwTB
	7yY+sfSVnej14OSl2ZVuqdk73yhlfr3n81DT+bpWZb9twoF0jwtdomsEIgajTBMD+RP05x1LZTq
	CdzPNDlzVb3zpILNib6/3Fy2uRsYPhYmLA/q/vmJfeH
X-Received: by 2002:a05:6a00:2396:b0:880:78ca:8411 with SMTP id d2e1a72fcca58-8874c4ddee4mr771398b3a.11.1790767141213;
        Wed, 30 Sep 2026 04:19:01 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-887253992a9sm650257b3a.17.2026.09.30.04.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:19:00 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH v3 0/4] ARM: dts: aspeed: bletchley: Cleanups and second source devices
Date: Wed, 30 Sep 2026 19:18:09 +0800
Message-ID: <20260930111813.52396-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series resolves dt-check-style warnings, sorts I2C nodes,
and adds second-source RTC/LED support for the Bletchley.

Changes in v3:
- memory@80000000: keep "device_type" first, per dts-coding-style.rst.
- Link to v2: https://lore.kernel.org/all/20260729114312.3947300-1-chou.cosmo@gmail.com/

Changes in v2:
- Added patches to sort I2C nodes and fix DTS coding style issues.
- Carried over the second-source RTC and LED patches from v1.
- Link to v1: https://lore.kernel.org/all/20260714120816.1504058-1-chou.cosmo@gmail.com/

Cosmo Chou (4):
  ARM: dts: aspeed: bletchley: Sort i2c device nodes by address
  ARM: dts: aspeed: bletchley: Fix style warnings
  ARM: dts: aspeed: bletchley: Add second source PCA9532 LED controllers
  ARM: dts: aspeed: bletchley: Add second source ISL1208 RTC

 .../aspeed/aspeed-bmc-facebook-bletchley.dts  | 1315 +++++++++++------
 1 file changed, 902 insertions(+), 413 deletions(-)

-- 
2.43.0

