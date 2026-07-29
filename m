Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97DB47729E
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 11:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785325390; cv=none; b=CpVfeUo3sTM/nNTEKF59m8nns++oywVP2uEwDjRfHly1eqooBxm/3GED8+OxdWgFOpB18AzSyAc+G/iB4gjEeEgrkjX1y5zrehWVqGDpZKQdGGzyWjJZW79s68dPXhEUK74n8FIFkviRTRwCNUnKWCMt4Yi6HLEwUWM8N9o27V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785325390; c=relaxed/simple;
	bh=Xul55S/VLyUTZVZJGfGLsizDILZQ+pNaMeyBo7aBFUM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K1dx+N9DNzf9e5HaQjueg4fvvVR9nhq+Tjr3MDDlYlSh/f/bl8WpLaWtJoMxoKk4QyRoDHr/avKDbdZgo1UVNjIPTTKVqoVLE02k8ZZ55LW4v4a+4sf7PQFzOV5ZndvLj/gIRhz3oZoMk7+0Wpy3K6kdSW71NLMRyP+veQV6F7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GOdY4Tr/; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GOdY4Tr/"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-848595b338cso1005593b3a.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 04:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785325387; x=1785930187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c+h8NJ3p4DMHwqN+FWUP3u5Jy7dG3Az5SXXuJ0SBbqw=;
        b=GOdY4Tr/GZpVXai4T6MT4TZJmpviNUjFPeLuH4rQkZLSqPOfirWc3iMEVVkNy0rRlS
         mRBWkHVvDaYsN5dKU1sQOZF1i2kxFs9ZhMihCH/L7iK5ao5OqPxnQredUTsYLu5z/PqS
         uOz6Z+ijWn6Y6920GX2KXTxYAs/VhlXEHEctttS2JE8ywZVKqUH18PDbSORgEFjwWnOi
         YvPd9KnY2MtcQNnEEnob+zEq82VbtJHJd46KsQfbp/fBZRfvKxIimFvwdFYgU3qh2i86
         oCawI/QVSXgpbvkuvx1H+QXmy3r0+8b+OrtSsr7dT+TEN0/ePxSz3HVviSxlYSL/Y8aE
         TZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785325387; x=1785930187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c+h8NJ3p4DMHwqN+FWUP3u5Jy7dG3Az5SXXuJ0SBbqw=;
        b=Y0weDyoGQsFNcr3IuoV3UbN32Rsba88r1b6bK8k5zMSVPq/2GEAqoQV8hNydJzGtnk
         AjHRgsLhsgiQpARLGx0aVtJWRt0MrnRwYUQU5Gcsb5u2Fl18vCvAEX67wV4A6S9LeHS3
         YZgbtd1RvgT/K24tP2yYi5EPXpzNfk4QZiG5Ihbu309RQrLjVvA0dXUdog4y7/1Ex6ab
         6PLIJ4Bq8U/CthZ/BzEBajzDBrfG9n4O4WyvBPfMe1tNOyBDk2Mjt/yyQPLcmaZS6JQU
         ZhXOyh7fX//U7kRdnY1c4x0q06gLXwC5C6AVmp1GteQSihCmtg6lAJHxiP+Tea1Soxtq
         WC7w==
X-Gm-Message-State: AOJu0Yz42dcTWxSlzf7QMv6MxIjRoTPb3LR/MrQPt/NrI5WBXuZiXqYc
	jLUirRtPRpELJlsIxrEA7br6e64fZRpJArlgqfLdGfEsi2ndMmf3sMzf
X-Gm-Gg: AR+sD102iakgRqesdJr8PDAIFKrp+FujyOBvC5XfSs/k+VDLKMGk2qxJozUMO4rF0E9
	eFqP2q0F3oxX5dai0DpHId33gk837N/vgr/DeQKCVZ027n/LyvqJ3LWwbTxoRe/LvTvyOCBPFUY
	Aqu1oTL5YCO/rpg6BUmfIIqVeYWBydtDhHy0oSpK4H0gkawJv7W/nPFqzXk1Kiqrw56QTCwo9Em
	vCPS4z1A2ym/yhYBLqZrYJVCSEDasMdnY1Uch31nf+R0j5SOV9LPd4uegXhPvzu/hCwQe5zwSV3
	fSSyOaqzrgYr8XxCFhbP4MkF00vcCf/W0rxY7g+iumn2Qpxk8zD+rb5YICYrhEZ3hthSBrqIUul
	nzkdik6dy9Uhh5IAnH/pYrYTKSg4aRvUtaO0Nf+CxP6yGvJAyDOGxWdpYG/4miilDMxdgPU8I12
	84UmSecJIRhFhk0R1z/5Bd0T/qNrsuqsBX2D0Kq9fkOZ4M4LoxNvT6uEC1QSoDfvH6yWcVwB+iB
	x4n3/djM3cdSKaRtahZAH7z9iKj1TAWL4g=
X-Received: by 2002:a05:6a00:10c7:b0:847:83bc:d2a4 with SMTP id d2e1a72fcca58-84e931f6966mr6315709b3a.2.1785325386605;
        Wed, 29 Jul 2026 04:43:06 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea03cbd1csm1263532b3a.53.2026.07.29.04.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 04:43:06 -0700 (PDT)
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
Subject: [PATCH v2 0/4] ARM: dts: aspeed: bletchley: Cleanups and second source devices
Date: Wed, 29 Jul 2026 19:43:08 +0800
Message-ID: <20260729114312.3947300-1-chou.cosmo@gmail.com>
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

Changes in v2:
- Added patch to sort I2C device nodes by address.
- Added patch to fix dt-check-style warnings.
- Carried over second-source RTC and LED controller patches from v1.

Cosmo Chou (4):
  ARM: dts: aspeed: bletchley: Sort i2c device nodes by address
  ARM: dts: aspeed: bletchley: Fix style warnings
  ARM: dts: aspeed: bletchley: Add second source PCA9532 LED controllers
  ARM: dts: aspeed: bletchley: Add second source ISL1208 RTC

 .../aspeed/aspeed-bmc-facebook-bletchley.dts  | 1317 +++++++++++------
 1 file changed, 903 insertions(+), 414 deletions(-)

-- 
2.43.0

