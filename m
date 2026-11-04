Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796076;
	b=2hUcMnF4RWoG7uczVi9bFQEJ+5WtM5EoSAGpfgF29ya54sqXFPLMOBjmojZig4tydnqQ
	 ZdBnA+8AY01RhERmkFyYdqusJNOakUYa7qku2xZ39IcwCj4/pGa5MHy1BchTrdNghja6M
	 dFDIQz9psRH2PPeDBtl7vgZJNX84xdT5q3DTDkU6xDNC/82mEn+hWDN7r9mMt9ujQzVmT
	 ogNUBy8kIShrstE9OXM+c2a1976WHG4k/IPtNIptdgxJVbLh88XB/AtDpWJzY0L1anEho
	 jGoAy2zWCo9rAvyJfSXOSZ09Vvgqn7e6PJBkLfig1Xa55Kx/+HcFIViv38fNeKWpUqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uxGm/Yrjd5MEXUcWESeXbd0G9QFvbGF+hfdletG5QcQ=;
	b=bkUL1YEr13ZWD/28NYpNfX5Stt5brrwLuQuihlgC/LH48h2X5XfYbGiupjU6i7tCrZd5
	 ZtSJsmTEg7Sss5NkIZ45qhXe5ngQM3SDgJpfvMi13ejrKmzwDOvvsy3MEJfXUrnT3DL9r
	 DyQlbveerVKJNaF26LVIcOB8GeWSg9/wXR4rpZzwGil6wyu1IosdRVhZxJr0FAptKVwNO
	 rco2c/IfuOqGo9c7QGXu80dAe4bSrYYi2ICA0cBPdjJCYB9c4siUxS+mNPm6zOvoOwpTE
	 k3qNoqTbbescbNXVsM+QeQzSfJIVpl36LiJ8PMyimr4FlsM2JCHjzn1NoP4tiHOsFsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OSqtwQi2;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A08606A329
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 12:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20A08606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OSqtwQi2
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso3906165e9.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 04:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796074; x=1794400874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxGm/Yrjd5MEXUcWESeXbd0G9QFvbGF+hfdletG5QcQ=;
        b=OSqtwQi2DvYdW/9NDnsfd4FgY18hSmMQL1OgPhtx7ddG+pD8os18yaDsqXQNiF6K5X
         VfzHIMbUnVLQipkK7O2+ICU4WweZWaeNl8oYNGHQ3ZNFu2wsz266jOZQ93OMmmUgB667
         d4kkuvpbx69nmjeyhn0Hyulzm4QxVRNGNsMEjYdBp2L8tQYEk49N91F3CL/98GmGUJ9/
         c+hRjuXNqwZSLEtMhj0CoNtvytO8U5NlcqcODMUb8BJSKRSRB8PNkbnkHSVQNoxF3p4Y
         rg0lTVu9OdjgDya8m1qSsJeLYCrU/vefTFGv4R/X8Xc/OAK2QAPPHfYO+HRO2YBdIMSt
         xyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796074; x=1794400874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uxGm/Yrjd5MEXUcWESeXbd0G9QFvbGF+hfdletG5QcQ=;
        b=d1RY6HUbcohGAh941e2Ed2WMuvKAdlLKFCzBVyN+/beFCQAdtABWTQFg4nLhZTG2H6
         X1kHKjWYb2oEWHB1c2axsBdepDvgI1JaSlRz70I1RheqKwVN3Yt1aDgAQxBIvVA5uo3I
         F/76aFVIDdESQEbBWGKifWwKXqtNagSffuXfUapqs0lSHPsfHtuGe2P9QPquHr9zUQnP
         7kdouvaT4IRqYxswIjqrJbLvyoNhM/uda2p7np2htEfAJwrcMLua5Qgdc57KxpeUoWqh
         dWRdm3M7gk09jjBUhR3qheQopyECyhDygsRMQnod5ZMP+PEim8tkgV1Rp3xW2PEZcwzB
         m2GQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4hgq18Zqz8vFzZ5QHFQqWywHa9DCyZTtH1v0TmbhLbSppXKzfxJBj5Xs1OhnbCEl8GXBT0B5Z+8C/@vger.kernel.org
X-Gm-Message-State: APuU4Z+zSZjiNMwg5EhJrqzwX9O9xgxs1GTY8KmySEMhr0ofa+j21oYU
	fbhx0K3gTa8HCNiwv4KZU+BRMp68FSc3nSCGGjqqKi2igFagdHz9vwqX
X-Gm-Gg: AYBFou2oDIEuHq/Bgdl8OufGCa3N6v3HH0rCQeLgtNbhSCClfDESJ+1fh2cO1/3sIi6
	wMso4PjQvvNsozc3jPfzxNQUXd27GazrXaBJZONIrd9CWOjQPY9EvTTLBIpzUC0Pov5vfNrm96x
	Qdl07jmE/L/u1m17RDwgIbW7q4k0Nm2zpJKljbxN9fQIWAXCkCGS2xnATHari1F5vASXhr4HON9
	elKhHrtkoSfS+u6RH/Dtc6trT4cRtlAMfHmVPUoeMuYcymKbuH1waV7DWvAQ74LKVjoixK95RIv
	xVG0SRcBBaQzg+laK+4Tzj+3xj5WWPra9lVuu79IfojcJ4xScD6VE1CBy7dyhPqB68WdhUULhto
	10ShVsAwb0GhkX993OZLoykOLmQONrGLbkpy2O/KLRWBsxpEmdhrgCHRKHW1FknzPC7geNiUAws
	e/Cz25p+9fjbnfI4YHUG6QLyzSiKFaLbOwpAEiazZdOg4VH6Zd/Nw/6MfIOmfzvlc4pUzZ2pcU9
	czvghdBM6vUHVP+rAhRTdqqUzPm8eTtIdJtM9BfmEfzKlaeiCoG7QLywN+2SpRybooP2d5lbUGo
	8IKGTS8oMO5bwAciYzlyKkz8Le2Tm5NoBdUl1a/T14R6fNivHQ==
X-Received: by 2002:a05:600c:524d:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4ac18993ca7mr370091705e9.32.1793796074373;
        Wed, 04 Nov 2026 04:41:14 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm46347145e9.3.2026.11.04.04.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:41:13 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 3/7] ASoC: dt-bindings: realtek,rt5631: Document #sound-dai-cells property
Date: Wed,  4 Nov 2026 14:40:53 +0200
Message-ID: <20261104124057.240288-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104124057.240288-1-clamor95@gmail.com>
References: <20261104124057.240288-1-clamor95@gmail.com>
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

The Realtek RT5631 codec provides a single DAI cell.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/sound/realtek,rt5631.yaml         | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
index 747a731c44c99..3f5f7638cf84c 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
@@ -36,6 +36,9 @@ description: |
       * MICBIAS1
       * MICBIAS2
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -49,11 +52,14 @@ properties:
     $ref: audio-graph-port.yaml#
     unevaluatedProperties: false
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0

