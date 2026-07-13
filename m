Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512E237DEA1
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 22:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783980068; cv=none; b=n76K9XggIPEbmpQ8LAod7PMzbFk002BDjZhPaljdcQuLpMnj/McsgfQ50TQE0u2C/bPfJPlPXxL1PuDliEyUjHt70xMwx8Qa96aps01OjTMymCE0WkYIvPa2t6IKEKkfMZ3cKzaUJHnAm1WPja2s6hKFjA+sbpw8+1eRu2zq4Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783980068; c=relaxed/simple;
	bh=44wlK79p2iFBlaDNEJYYoVrsZ4V64y2DhfrkrngDWyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TfnSMiuxM+WLyAbjPSpht/EE5ScLr3J70EPHKiuj2wXlurpwJpgBFjRZ/UunZeD1y39SmkI1blyyEeqbn5s8B4+2eYtbf0qwP9PL+XkNkWSnanHRqNt/VhLPfimKgZof+q+WFx9h0ciHC5tR3uF6rIVI50WqYf71sBxglMorVXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIYXWdSO; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIYXWdSO"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-497deab2d66so323950b6e.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 15:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783980066; x=1784584866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KaUmQ9JpbnpkUCaTH5UXy4GKoNzMoHaVL3LWpQbAxts=;
        b=VIYXWdSOr1lqb01DpmTIciJSang1LexoD9oWWAQRYpviKVRF4Ke7XPwmxQDucVVoNG
         ozAJYJm62Dv3/gDtPnLG+n2FMooz65IucLweocg4iQOPs4OEF5HMHkFKsv98KdDKjwIh
         sMhlxGCL1WxSTp1HkFlplL9kGbq2tBJfdhANCJR2/5mIPyxpVQGRHbbstIY/8fYp53Wq
         YE7VsPe9gDP/+5FNdUumKp4dtCHwk/BvTjL/88E4Rf5bwQlGaejgnvFGuF92ckugVfIZ
         V06sJgopW0hrXP8YdviQcJqHmpP+BZNOnvMEB9RzHejFDXiGNZ8Bm4EYELlt2Hay4DBE
         idig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783980066; x=1784584866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KaUmQ9JpbnpkUCaTH5UXy4GKoNzMoHaVL3LWpQbAxts=;
        b=mkLqtG8pZri3H9f41G6iTjEzxh1iYfrleN0XWz/s6kJ4+ZaPg9FuFDBvN5agmOzrkp
         QZ1xvKs5CNel1ZAeqS+QNJQq5wAgI+9ucO8mfr4OtnhhHmORyGGdoxOvEj+JOjT5wdsg
         k+9z+tvIi7UhTTufqfH+bc2h+tndha0rhpzKjpI6pXsAeBQq2ZHcK3iZvO7CyFj9ioIO
         c58RnmUOrwdiP5Emqwc2L1HpGmEcjmNXe8tJhXjh9nmItynypJ/ExueY1UXfwQ/cS03V
         G5A8b8beM0eHgv6OjfpbGRz84JOZKYoi7mM1MKuJ14R+o95ZiRs4LXLniSKI4T2kD2Na
         i4og==
X-Forwarded-Encrypted: i=1; AFNElJ/EkMIW96tj++ceJmWPEAVSToe6Z2vTJbFrAj5+S8cSVMJqPgmqn76G26SGGrW7S0EMUD09sPzF8bxt@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1+uNoh2xgzsmM0vkq6IDPprJUxF2AcHH3UDtGUsi4ZO0kmxn+
	C2AJJCNG9SpWWG9OylFo+vLpbMlv7w/nC/tRld4PXyHyZLVyw0/JwV/j
X-Gm-Gg: AfdE7clVTmGUvYQ7X2aQVN8zmDIjkIkG95UQTN1wrkdaNXxM7dmyc6qIHWTzRNToolq
	oNovZeQWV6QkQmDxtBulsM36zQtHM9wlJQFfpFeXRNiGZvnENE2p7OuvouiuO/QoEtcs7DdvUJs
	HdXV6cvi8c1Bux6RELeePnVoiFvQvI/0xFZmIwt3M+DiHPwXOPTyt79XqfKkPJ1sdbqJkgPohSF
	32XCQrXdfSdN+hr9vHQVCbqtdgZ29GVKTM3u3yPyWeKKC7aObk+GJYo6xDKDjES9ErkuCZdeVuy
	hkSmEM4XjrbaCVxm2Ah7qRdXic5d+yKLcdeHvNGTnoljYDXPmqWppRS0Glh/Blhpu0Spzgb+wj9
	tmlgccIwdrNpctVlSA6H1fg7sCKPWrb7P/jAVKDDNXY6n9qcEXt1aSNCsiHIoH0XOdk8puPL8Y6
	jFV8AwOfnfNOM=
X-Received: by 2002:a05:6808:bc2:b0:497:cfda:3c0f with SMTP id 5614622812f47-4a40f048b13mr10541643b6e.29.1783980066006;
        Mon, 13 Jul 2026 15:01:06 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1acc82f3csm12939785b6e.3.2026.07.13.15.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 15:01:05 -0700 (PDT)
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
Subject: [PATCH v16 01/10] dt-bindings: iio: imu: icm42600: Add mount-matrix
Date: Mon, 13 Jul 2026 16:58:31 -0500
Message-ID: <20260713215842.69097-2-macroalpha82@gmail.com>
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

Add mount-matrix attribute to schema. This attribute has been supported
since the first revision of this driver, but was not documented.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/iio/imu/invensense,icm42600.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
index 119e28a833fd..9b2af104f186 100644
--- a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
+++ b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
@@ -53,6 +53,8 @@ properties:
   drive-open-drain:
     type: boolean
 
+  mount-matrix: true
+
   vdd-supply:
     description: Regulator that provides power to the sensor
 
-- 
2.43.0

