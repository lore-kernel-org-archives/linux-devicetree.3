Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C58038228D
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 19:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778354501; cv=none; b=R4ckaEuGx6iTPoZILjzQbbIFLGqEC4MJ1w2jj6e4nyunEo6fNoq6sa8sLeUAhQnZ0YCCx3LJwMQ79umChJvVM/iEJVg689+CzC9TxSP/qR/nCJPOea4UX2Rc2XGYsVjDCj6G9T7hYOxSxxOHnEyyxY0RSFrTPO37NbDAnL2sPfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778354501; c=relaxed/simple;
	bh=pZ5AZCE8CUlKxhBSvGXDDmIUbmvrCQOnJDfJS2TH6eY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HYzQW83LeMDvjqJaUNi8+O9MV3c/gVbcum/NSZ1pXB84HA42tiotNxwt4VGFzLegqCE7XP03CwPJWTN9oH9Qz+Pt9O1Qbqn5FGNGiianEgfbRD8oETY0wzLZM5dHzG3jcO6wLlgM6CG0H06x6D4j97LUlUcyYMYvpKCYgt9e7Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NnikoRbl; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NnikoRbl"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7dbd23bc684so1871340a34.2
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 12:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778354499; x=1778959299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glwT5koQsVbYhX7I4MEF51k8vuLfNT2TtvwRkG3+C44=;
        b=NnikoRblWbrQ8O8eFLvDX27AfGrnuoMqrzefGwaX08rE0B+UUByKya8hALf9hb25Yt
         DytW9cJffj7Q5LWtdQkHvmkS7r88EtsDUaS0KNKuziCoacb6cVtPA/eZG8iPJDjHwsW1
         LM/rAbY/FJLzZoAc5ymjM+6sDj/uV6oMiIW6minr+YoE7xrfY3GLHBABCbPtdoU8K6ns
         uAE9GOF/D25qPC1qkNwEPZJY7hgXdbwzkCnkLKMvzAMIBGYEvdZ5G50h+tKDLd2UasK1
         3+TpWYhUQS4O9Q52KIAlGG4tcy5F8qCI9z9LUe5ZuZPwxv5pE3mYnHpd3W1YN/uZ4OHZ
         /imw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778354499; x=1778959299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=glwT5koQsVbYhX7I4MEF51k8vuLfNT2TtvwRkG3+C44=;
        b=lfQbO/0JJKZLevd/EzC8xMHOHOT6ZHVCSiFWyUtNVTGc6t5qkoEl4O3m/m1FZtFyEq
         SMquE5xe6iyV6fbMwK1QPrRFX/XCNuNQAzsZlmu40Z1IaTv76BEMvqcVW0LczAnyx3K6
         l7eH0fbsh2yKm5P+YifDv2ys1qChxc5mTKvRAv/o78LBhvKBap9jIYSdOW2xlyteMXvI
         3b4njhkryEp82cWab7+fA1c0yvhLE98QOMtShzqbIXM/DVORnl7f24yXBRVy4cSU8j3V
         EQb/ilppKgZRaZPnpAJNpyenEAdGrCSFQ1JHT556wMtSVpfFQKIS90J+yHgsksKHUK7w
         uCuQ==
X-Forwarded-Encrypted: i=1; AFNElJ8mT/eyEgAHTdHHNO0h4cJ/N1eQel/+1oIlMTb+qZ7GeW8qsJKaEGDwJVnxSMQPCpO2motDe4+wKT4k@vger.kernel.org
X-Gm-Message-State: AOJu0YzefheR9rkjsKCS9lC6W6QF7RRtsw1g/5Fu+B2Y3bihPJD+jVxC
	f+W2CkySGtbYw/TkutLzcSb1CRlGioHNx7qMSm9zSTOZXTyW2EwnWktg
X-Gm-Gg: Acq92OGedipVyPtc9i0Bo8zZLTwBWZXVxLZdEP3MRZY/OxD0eFm6p5ArIEfozwH4jOE
	g31btvx0f9iifoSGIn+EaVpq854TM8qnVAdoel9eF+UBFdRa7MqATvRKIi7vfzHSUG3JUU0SVMj
	IxapNgtxjIBY558tCYEbmPp4y/usCW41NdNoNAtHEo10LXqjYyTpp9PXWkv6nDNkS7BvUC9UH0r
	wM2MITdUo9QUQW3PxJqdzJ3TRZ9D0lPNpvd6NvghJ3M9N5RHj4mf0D83oS7nRo55xRQ0/SyslBv
	W4xqyMwZgl4PxVMf6bwK4ojZ3LUx1YxFL57UqKA6B/6PX7fwJOnxlp2XcdXNjoFX3dpXbdyE9IC
	B5Px5opuYj0o3d8CpwC7GTSBv9NN8qrGCYFGFXloU6DhsM7xgBgwnsdRyHVSBHD2IyWSTaMnvBS
	J7g8ijl7czZjll9C51zfrT
X-Received: by 2002:a05:6830:6abb:b0:7dc:d7e8:cb37 with SMTP id 46e09a7af769-7e38217f056mr2076083a34.21.1778354499152;
        Sat, 09 May 2026 12:21:39 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4355736f517sm5243896fac.12.2026.05.09.12.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:21:38 -0700 (PDT)
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
Subject: [PATCH V5 02/11] dt-bindings: iio: imu: icm42600: Add icm42607 binding
Date: Sat,  9 May 2026 14:18:56 -0500
Message-ID: <20260509191907.24734-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260509191907.24734-1-macroalpha82@gmail.com>
References: <20260509191907.24734-1-macroalpha82@gmail.com>
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
very different register layout.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../devicetree/bindings/iio/imu/invensense,icm42600.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
index 9b2af104f186..b69c6bbb6f6b 100644
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

