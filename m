Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C9739BFF8
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 22:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778624345; cv=none; b=OlknKErmdrOjFDmLk+/wAwQg8Qm9ZoJsdHZNRTtijJBZ3IWMFjWmYwH6QHoIp7eC3aqzqonu5BSUtWq1Ipa8UWyNlDldnn6U1q6vdBnljEDwpztpMaoF5UUHOeEhGhTBR+gex3vSW60sIaFrZAuSYUDQZvK9DiYbfHH1IQopEdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778624345; c=relaxed/simple;
	bh=rzSuhraAI4cLyzTVmma+9iEM834IMLSQLVOxkCesmqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nZHs5gCN97e09B/Srld+bVrxwl10AH/nplC2RfsnYQNVwi8WYuRiJX6/+IQTB3CHV0GlHLj8zDnwgpcBoeKfPcr2fOX0s2ORegJOkH2NnnwFw5emROpj9+0P5GwH38HQ5pZWzCuCzt6IZS+FAx7yqjq8P4FwDUTF748RU0CrNY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Os/6+FTr; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Os/6+FTr"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-479d9b155deso2179723b6e.3
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 15:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778624343; x=1779229143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A10z2V6mAiVce4BytYqy/qmrWiH198BizlsZzZUSoec=;
        b=Os/6+FTrF6sOE0KLI5E70a8KOzVFxbHPSMkr1/rrne7MrXTc2MN+lEGRHO2fvjSi16
         67B52hOESa1qQNlVfMqpQ+99j6PkHfIzTivuMOQqVY5UTU+eaazbRgM2wCGgaIrVP8/A
         HK7QYN+xHt1B+aaiD81a36cS1yDRpE7B+tiKA2h4pVL9gKu5YNTWHPuFurmsEEc+E57V
         U9MXzXmQUPpSHyjC/idjSKBmBHnAbEqBuY0A88avwwswyiUrrA/cnT0CM4VughKrOZPJ
         L5dKdFqVGtz6suj32GGrKqEVTJEmbL4rHV8OYKWZzhngh2HzQ+cUeYJcouCT1Zp0yj2/
         lZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778624343; x=1779229143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A10z2V6mAiVce4BytYqy/qmrWiH198BizlsZzZUSoec=;
        b=mrdq4A82cM1+Xtc/SOcWfZzeK24NyId/lR0G9f0DjhKBj0Ho+Oib5WuCxxlCJXGb4v
         DbgSn1cAU1wXWSDvHEhAdIziYXCSdvXyWM4VbsQ6IRzr8jbwO1bAHnaYOkToKe6DUMxf
         VvDrzVIF7LsrLqm/70B3vVVxpkJkt8CBKPRmw8XOd7R/UuEOFHdJaWN2HlBGNgvYhQbH
         gXxv9vZX57pNzR6+kCFL2F7h2JbGt1e/3ONbIO87ld8z/qsbqluXrpWdexQz1iedq8iW
         KZKOaOdsblR5QIB9WwbU2VyWZ2JcTnJcXspO9wVKFm2rRwxPz0+4QXVRetYBaWo+wk+T
         GCng==
X-Forwarded-Encrypted: i=1; AFNElJ/gybK0Y0RpHSpGUG9V2iDJR+eEpcpC86DK4q6uS4sorhjvDlatskOeaiugeyXTWiVPVtgsGuxKUmkl@vger.kernel.org
X-Gm-Message-State: AOJu0YxMH/gdcPdp004bBBivKZaWTZu9d4A/wXncYidl1NHMuKJGbdtR
	jiw/rrOE1bhTAtj5Yk+kd0VwTHN+2vsGkPgzsNh8/GRHXvsA2/JVpwez
X-Gm-Gg: Acq92OH0DfZc6jpurD4ZLaM/sC+ri+zpMVIKoshKQq32/5MQnBaskMx++Se8185wpF7
	nE51D6qOYfdhYd9lGiqcOFV3GxW1U8tUN/L1cfP7PC+N4RHHF2hRUAIvMPluYE42TnfOmVPTosn
	9yByIhUNY6z1dxj3JZe+EipCLxDT6ou5aYH+TL7GfWbr9SDHLCVJUegq7NVpWmoUK4VZZC5l/0q
	FDEJDI9yzIYCtirZICVDR+5eN+vLhbelR7pE9GwVyzq1lsIYSjP+kn6ggIsfMr9DkrP6jjMCWyn
	5k6lPm9qpk4CFqEDYBdjJPUtr01FXzqyE+AkNk85UPxo416KsEMq+g9hDCHOuPIMb6VIznJF9Cw
	/elSdawHmG/kZnOB87r8w7ynu4fdh6rYV169UL1ioun9VAhKDmNr+CADq07ZQOQaOZ1MfO9WdFL
	l6a2rzw8CvLF/SzGlpFk/4
X-Received: by 2002:a05:6808:444b:b0:479:ac7d:6da8 with SMTP id 5614622812f47-482b2b2187emr786356b6e.18.1778624343187;
        Tue, 12 May 2026 15:19:03 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-47c76986f87sm23291473b6e.13.2026.05.12.15.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 15:19:02 -0700 (PDT)
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
Subject: [PATCH V6 01/11] dt-bindings: iio: imu: icm42600: Add mount-matrix to icm42600
Date: Tue, 12 May 2026 17:16:22 -0500
Message-ID: <20260512221634.256747-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512221634.256747-1-macroalpha82@gmail.com>
References: <20260512221634.256747-1-macroalpha82@gmail.com>
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

