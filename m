Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C18372EDE
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 22:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777673663; cv=none; b=kHexIs4DE9ADATBvJGrCQu1O3ttnsLMezh58c9DtRk0USHLtj9UgQhIxu71AOsg8ZjSsFpwxEz8UA258g5GUfh014STetD5h1doxiKuy70SHuf/mF67vaB1vobUjqtQvslXkRe58RAc8I+y3pLd6INB60ymrmsdkQbFGpY1Qj1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777673663; c=relaxed/simple;
	bh=TAFf11R9aLDLqch/+6yvhRCIXcRZtIkal0oYdv3f42U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dl3UwOcWWLmffy2LNYovD4aPDXuf5VDBxZK2hWM8mc2v3J4uL2EyAl/OXg2LIob4YUd3VgJl8lOxRjRfy7aINaMzJMFaAplodfZCKK6mLQ6T19S9Dz6LOIoQArwUIzmRBbHGpoZYn4mjDugj1DqBmJD+O4NJYm8VseCOv2dJ54Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iKO1b3d8; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKO1b3d8"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7de44ed7a11so2003793a34.1
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 15:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777673662; x=1778278462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rh2D404GmTWC6zLAhnnfq8RU6EGIGncop+92KcJ8XSY=;
        b=iKO1b3d8ON83HfTkMj6DEuMqF1tgVf7z6X7+5sqhQC42YwsVsnxZvFubcCMNg4/lzL
         CRuWNQ6Jrjs9ZgHCYXyilx3uFeVndGB/M52zU9hbpxJeo7CmchY9cNTwSKb+DOgt/kKM
         xQ8YedAalOiTfSnXaYDxCVhb3Lzhd91Y2ihAjThL43q1rBPxOS+72Ek61FsL3iXa026g
         38x1AGkEILeKt/6Gj0lQyOnzKcog/Ri+0HeoJ5XF1dtpRCaqjCu2aPPBc55ZApDDwvgV
         mr5QlF1m/mTKw8NvhxgqwbNIzGSiYgf5aW0XqjbxghI3rd1QOaMOh3gbWjXWC4pj7ASP
         aSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777673662; x=1778278462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rh2D404GmTWC6zLAhnnfq8RU6EGIGncop+92KcJ8XSY=;
        b=jScYucmCeUQaiFB3MXCTNDDmJAPRDn+6dasN4j+2c8LgTy9DJClmLOc9g0giNNFRiL
         HlJFyA2uGeqTA9bAT9+oSoBnqHIwE+9erIFaXISh4R4/0AgtvavTCjJkq9cR/LS20C9c
         lDGJM3ug0KN6nMXXDdmfG6IVebO9rYGxchDMID4JyS8iWR1YKZOv4WPxnn5YG7eJcjTl
         BCNfQBGnmricgV93dKqdY1sID1gTIZWyPWgKRJLoC1KIhXgNAAUqYlgNbhnr3av758l0
         8hP00VhZkLIpcOoOOqrSAf4iz3iJDmE/PLHiZSh+ttofT6Fq8YXG9bWxb3I1rLfLyCh2
         U2kQ==
X-Forwarded-Encrypted: i=1; AFNElJ8BQiW5l2jindF4h5qVurE06pUzBJw0lKJd9UP+iY0CrJB++9qo/hCL5vYxaRuRIxR94f5juBB6gcHe@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7sCECNUJJpvkW1+SlJgYsitxB7IudNwKm4bo3P68xTNRx4KBh
	4fusvM0UNEGA0ji4PAth0gj98LA4ShPihLqvSOQMtC0UQ4tr35EuHn2s
X-Gm-Gg: AeBDietZodC7tsNBurkXS4Fd+0+tHScD665ucy4bPRgqoRQpOuMhN3a5vdeswlVgexd
	jU9pi5pOB85hJPEQFUyMlc12b2Pni7wMqL5Yzk89+f02Q+0oBG+rGnGmkkXnuDdz9juA7EqJ5xE
	gRfa65SSlP2eLkcRHVl8g54VK65oGZnam3bDGmHIzJUizXDF8LXhEy/5FgkN9NFXV80RY2JE3k5
	IllhOnAd9en1K6N0urKd+BzZTBjxilz8/ekxUyltYBzCMT3rXtQYlISXjeBp4Py4zJHRSsBCZSV
	3ru2HvPWH+41fKfOAoIlrrjAYOEHOPUFWA1ePBNee6/6kY02P9rfnztgApznH5bzASab9cOqW4K
	SfxZtIoSGgCiFWTurDszo388NYqo+4Uv5rAmK0Afh37Kp9WnV6teJY2/VJg3GUNObCJIoYI2t20
	5nci9AhtxkpD3sJn0M/QAM+k7fdIL6Nu0oEqit3KgpXg==
X-Received: by 2002:a05:6830:6008:b0:7d7:ecfc:76d6 with SMTP id 46e09a7af769-7dee13974e3mr850626a34.17.1777673661845;
        Fri, 01 May 2026 15:14:21 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ded51a9612sm1827337a34.26.2026.05.01.15.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 15:14:21 -0700 (PDT)
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
Subject: [PATCH V4 01/10] dt-bindings: iio: imu: icm42600: Add icm42607 binding
Date: Fri,  1 May 2026 17:11:40 -0500
Message-ID: <20260501221152.194251-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260501221152.194251-1-macroalpha82@gmail.com>
References: <20260501221152.194251-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add devicetree binding for the Invensense ICM42607 and Invensense
ICM42607P inertial measurement unit. This unit is a combined
accelerometer, gyroscope, and thermometer available via I2C or SPI.

This device is functionally very similar to the icm42600 series with a
very different register layout. Additionally, add mount-matrix
attribute to schema.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../devicetree/bindings/iio/imu/invensense,icm42600.yaml      | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
index 119e28a833fd..b69c6bbb6f6b 100644
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
@@ -53,6 +55,8 @@ properties:
   drive-open-drain:
     type: boolean
 
+  mount-matrix: true
+
   vdd-supply:
     description: Regulator that provides power to the sensor
 
-- 
2.43.0

