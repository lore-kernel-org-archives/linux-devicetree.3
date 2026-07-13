Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18B93859EF
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 22:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783980070; cv=none; b=VnxbmroQrbFVOV1r9dCb6vnjRKWyx/TBzfAV0NucaIO+Chu6qAsz2VCZjd7cYKBOaN/ulirA0Tb/61C5Vgmjbnccl5k2uEMGkBWK2K2xguOhPSS01QZwGsohBLxvlGMOjPKU6R3O6tQXhN5cWftyHA9HZOUJT7FziZfXtrRJ4/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783980070; c=relaxed/simple;
	bh=3i0VmZi+LYMFWsCmT0fJCkxvyZBQrgI6JxUuL2Gd5fE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SYnPk2wf+ZqRvQFEh5/ud7ct0EPr7oA8EJ9Vp0XaO61Fi4G5GbFPOZIZFLDxEzFIPD6X+oAvzvBfBYGUqoTP4EKZ9UepD1DcTkzLXTqhQiOM4yEqAqnIuOTb1G1gMYz04TKAHq8ylcVyT5yh++QsqLWIMgKpUoKJ1iK1LgpcQeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QSJuPC+O; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QSJuPC+O"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-491bc1d4e6bso2563807b6e.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 15:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783980068; x=1784584868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QrTVE/Mu6/5riJy+kNkxdxgxE9eXKFOB14tMMq5+tOs=;
        b=QSJuPC+Osxa1zhROFSKc6xuqXv8jnlOsGwCrGi7dnJ/Sj4ptyQZ4u5Zi5Gp32v7Ucm
         Iw3nlAA7R1/pelg/qcMlbFo32ZJuXk40oXl+3+3PMEJC6ihGDaJYhgEwvuJX2cRuRb6Y
         SkUhE4ZeyvMdsQKw8g6YxARln7PpYO5+7Q1jJOlyH02I2//+wLFbSm+Bzl7n+fFutRuM
         XnBOLVgozCHNpnbQ+U+a6sEYsELIcVyveSicfEGSe+FojvNO583rnrwrNH1DZzAET67u
         w/m1rFaplRKkTHlF+4w19rqduHHPbHJR74aY7UI7CRDamUnis3p0r31OnJ42u8Kx3iGS
         U09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783980068; x=1784584868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QrTVE/Mu6/5riJy+kNkxdxgxE9eXKFOB14tMMq5+tOs=;
        b=VQOANeTl6WcqHqiqYyNTovKGq1XV0a6M6TxXBqR/U+azt6Bt7QRVANNeZHzNRNV680
         fq4sz9jh3/R8a7Qhyhq5B71OAoMz2767choZenHmo4yv+dBT1oDJkez6Inx8UlUKVFGD
         QvG8yAPKdxRp1uZtCRGsS0a3heDqJhAPjIqUZjh2M+sfUpfReENFIYlfSDKuYwP2XgGH
         zTD1Qn2FznmLHG0KbbJ0cdj5OhhsNx4Ot9XXcBztp7gHnXjZKPk4g8w5tsdKKZyDvhEt
         8tsC4uTJy5DPRN8r1sq7x8455JEJsFOX0zWKqyBvwdF3zFPGAr3o9Cw9GOf0c5LC5w2F
         QYWw==
X-Forwarded-Encrypted: i=1; AFNElJ9zYubBivW/2+J6UUFoOmbHz/iYN4ob/KPcoLXpvSPoAcX9p6qKltNec48WkYxW0m9yn6KRUMfkawgM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm/tAcRlEZdK18W3ilCwNgAOSN/ZdwXYzcKIPiekUPc0gldZF3
	kHoqCt8pzZtAqvZG3Jg4ylNZ5kZP7UCFWAXIDMjefRGbFvoItU7WEt5A
X-Gm-Gg: AfdE7cknH+uGIZQz36ZA3JhD8zTFUBB13ERIoZFAUUVpGZmVPxtstLekbeJtY0y4di6
	s/02f56M72+0hza0BpgIVj75dWnqBf/pOvjfydNeVGShClXLPOk70AxGKx6Lq51JhjpRbIspO42
	eAuK+iVsGaBOZAJut5jaxtc4ggRHLyCMUGRhTEidnbwELUNq25o42dd8y/Crlq+okKWp2E8BEBV
	cUfJcK8dzot2fvCknCffBNcqoM4MmJSTBvslJRJlahXiCGPPqvZFmE/AZ6zsMom213pBXH6A+bc
	V5vPCtoHPsmprdp2pIQfuO2YwU3CYDc+p/MzJpCaP+2762r64xpbMwnpW4w/4ubbyJVZzW5bHN5
	ZCOP7yTBQ+MjefI3XS692X7AQ3ELcQcpTkHzqNxc2J1iNA/LqY7NbKPFQCHvdbUFR0e3zAtlYGx
	HsIxvZ7xcEs7A=
X-Received: by 2002:a05:6808:c3f3:b0:497:e15d:207d with SMTP id 5614622812f47-4a42b0012f9mr7109311b6e.40.1783980067884;
        Mon, 13 Jul 2026 15:01:07 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1acc82f3csm12939785b6e.3.2026.07.13.15.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 15:01:07 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-iio@vger.kernel.org
Cc: andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com,
	jic23@kernel.org,
	jean-baptiste.maneyrol@tdk.com,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	andriy.shevchenko@intel.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v16 03/10] dt-bindings: iio: imu: icm42600: Add icm42607
Date: Mon, 13 Jul 2026 16:58:33 -0500
Message-ID: <20260713215842.69097-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713215842.69097-1-macroalpha82@gmail.com>
References: <20260713215842.69097-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the ICM42607 and ICM42607P inertial measurement unit.

This device is functionally very similar to the icm42600 series with a
very different register layout.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../devicetree/bindings/iio/imu/invensense,icm42600.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
index f6f97ea03038..d62aa4f285cc 100644
--- a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
+++ b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
@@ -30,6 +30,8 @@ properties:
       - invensense,icm42600
       - invensense,icm42602
       - invensense,icm42605
+      - invensense,icm42607
+      - invensense,icm42607p
       - invensense,icm42622
       - invensense,icm42631
       - invensense,icm42686
-- 
2.43.0

