Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760852857C7
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 13:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778850164; cv=none; b=OdOMGyPduO8+GeIyPiELh4siRrYy6T5ZKFHB2Bmvg5dslzsOtLTs0bEd3/7RXEOXRUPwlhCI9AO8SCtjz8PmUZcHVVwqL47OnEvN7gUvvVsj2FsTiOCi8jSzFHxi/7FOk9yOgzudHa/65oAZE4klLVsOxEiCGJubunnUwMzpncc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778850164; c=relaxed/simple;
	bh=mg1u65/hNDUSb1m380zCiWkHQxdvyCwTPY+JWCPvED4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LM/cEo4JxVl+VyG1EAPIcJTR2lHDFHg4XdC7/nVvEmeuWDcZH643s6rIMIu6MFkBuG4tKJuNX0B9Jis8Vm9r17+K3Jcy4+pLgwsnosj/BSuQ4NfTD4x6xqcstbxO4OGfQaoXdFZbHGrvODuzDWefUCI3aJwF/eUoVgfG/0XNV7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ba0GAdV2; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ba0GAdV2"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-439a8366831so1999326fac.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 06:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778850162; x=1779454962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+2ydEn6hztRE9Iv70/dCmwY4D4SjSGA68XyIdXdlEs=;
        b=ba0GAdV2nPJFpratL+uvOROpayhGYkFDDDaKXRiqaInfHt3j9jZl37SIrXHMHxtgc8
         eP+HbHFlWPOJ+6n+iRBL9H9QXQAZE25ZbT5TvS5PiTz0R/Xs+NIawhXfPJ5Ow4fE3yOR
         Zc1UMKnltwJgo+/m1tpWG6urZ5HDADD9ZpYYa2biv0EYG/PPYZV/YzuZaZzluGcBBvUV
         DLEVeuTkTWTBXcZAIdcuXfxA7VuU7tbUo1EV8jaY0D+b4/8FMB0ieeCS1ylSTgvurRIo
         EODEVJJO2OUNwFmlhSDK6zYO7FpEP+cdpcT3EC3sn2Y5oBfG7wuF1zVge6SRiKjHm7K3
         IilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778850162; x=1779454962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q+2ydEn6hztRE9Iv70/dCmwY4D4SjSGA68XyIdXdlEs=;
        b=kdXfZ8JiAMyLzN7A9NRCZaqCM3+gGta4ZX9GfH1b3DUJRvIqqvUfEylWf4GqQkKwwW
         TKxYVSlbFKgxYD3BFjL/H6thHpzIu5N37g2VlEDpVB1Zmy72yVTns3RXP7ImssamuMeD
         NY9rlld2b7Mu9IQ87EyhJZBmoQfl0ArrJXa7kB3SqCejAJdmGe2s2kduCd1Cgv2KWQD9
         4wZViHktnONRas5RJsrMN9KlXi2yJyzSpgR3RssCvfksgbl1tYgX8zSyYuUhT9/+b2bk
         M9ibVH9OT2Tp8yjOaGjmv3w17M23qiW9ZmkGafYPcYKWINJUYR6ok64P7/Wg0X3BjK9s
         Ae6g==
X-Forwarded-Encrypted: i=1; AFNElJ+srxJG55y8B93YqAvel5z4vjDELmbUuZJoiWfornUZG8GUwDGfAEw9nhQwgvJlYRMqC/dqK/CT7DnJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwHUpgD7SULJ6YcrqGJE5uwzz+nDVag+D+SgfxBzzToFLD1xom5
	uC8YXODFk35o7opNbTuBwuMpWxpUFLQ8jN34nqEt+Tnk6IccpPM2a5wv
X-Gm-Gg: Acq92OHVKhXl+OaCMN24go3ciorFgx6iqm4NwPwwOpoEYpsOymMRzkd0ELXhUa092OL
	ki/A8iSgc3qhyUL5BvWLF9l+x5NQjMCc8IeKzI6lmmpfOEGfStarhsjZ2KFzkZPilY0Dv1uSoD1
	9X3oHx1Y1wKxFhi3RV+/thlF8B9SNZw+SBb7f9Hhiz8YqnMMNJlKrU5iDxejB5x+uDHsR/LSztu
	uUxMEfbyC2RW5vyoR5fO+NUNXv+Wx5VNaWIwDLOYJDSzO3BOR1KjiVsGArL9gUbAc4Yu1xkro9t
	45v9gDAzVfJpU1Vxh8qvExjjpv/et3GpTkDwj7xzUIiKXPUBr460TcRIvUTLIUyQ9j5wBPhdc4n
	qt6G6FQctO+6IlRMCo+VZZ52xvyXKdxaMIENY+JuMPgIHbQ01gXsAUGJmWjIbI9AIwiyPdHJ0Ug
	YV1fMSCi6VTFIkEdiIozJfWnDsj35sqjYNJz2d79JG/Q==
X-Received: by 2002:a05:6871:68a:b0:439:c869:f5d6 with SMTP id 586e51a60fabf-43a2decabadmr2469552fac.36.1778850162214;
        Fri, 15 May 2026 06:02:42 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0:8c2e:6a8e:445a:9169])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-439fc53f2acsm4155822fac.14.2026.05.15.06.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 06:02:41 -0700 (PDT)
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
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V7 02/11] dt-bindings: iio: imu: icm42600: Add icm42607 binding
Date: Fri, 15 May 2026 08:00:07 -0500
Message-ID: <20260515130018.237378-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515130018.237378-1-macroalpha82@gmail.com>
References: <20260515130018.237378-1-macroalpha82@gmail.com>
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

