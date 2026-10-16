Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2700D2EC09B
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 20:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792183719; cv=none; b=PgaRSavDrxX/l2FMKelaEWJ7YNnPOyI9kERWfKDKoTKOJ5qI9Z6rPmWR10G6bdMQxepnnAUxutTLSilBPAfIlrzlkSz4Ghd9EAKxZNe/+SUoZK7RkF2GJ5hTqb/1Npd/ehVtkV/cOgQXW/svnRr1kFsC4LGPNdXvTzd7XvIiQGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792183719; c=relaxed/simple;
	bh=FhSBZW7Jpj+THEoTkniaEwqOd1DSuDXMTlV1dtr09P8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XSd/fx70XUtFLNTFY4kGU7kEkzNOemHTza5x/ke/R9V7xA4nKXa3tNyQcGuMJTby/WtdjqcSa3c/m2eBzKEomdp5LHh63i8ic2LcyoOAeC9c8N73q4R0wffid6/2uBcA8rtoLgRlodU7NBNf6/vnxksJSYl7DnGFLERIZ0+BAZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZatJkpUQ; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZatJkpUQ"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5e941201928so226804e0c.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 13:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792183716; x=1792788516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IbKdCffk3oF5JNe4bLXvDyGBPerJKYVxL0w+jpUvxD4=;
        b=ZatJkpUQvzH21hVx3W/JicNRIOBzRECdaWrjb53OguvmgaO1rWMd5XiBv5O651MTWH
         7xqAyWToA4SjquRwHQoU/TRH/5rV1IdLyejSn9FSxlHniJJDrdZs3Szt6BisrfrtPIv0
         IY9JOw0LPTQhHuNskw4I8crkNlm+cvtv5jCFsgT2KZ6tMHpR7u6YIwhQ5dMNR7Enxex7
         MTDXpE0dxRYyiFQ1gb+P1/75+FFxo4lILHFrMWEeXb/1KEPKhXe2b5OxEdsI2/e5kjBX
         75StKUiA1ncX7cE2wNFp9YVn/gA/0AuSPUNoYZoxwUgMKAjSG8DoFlW9KGcIv59b+e49
         2yTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792183716; x=1792788516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbKdCffk3oF5JNe4bLXvDyGBPerJKYVxL0w+jpUvxD4=;
        b=P0KrOddYJR6FSsQdUu1cmnmj5j8TP3wke6N2dpL+MByrWLqoEn6e/N4v5KuxNyt5mc
         cXdZYv11+44onWQw0H+134bQzqGJlht2FR85oyBpILYQ5xjmqt64bDKoeb0XPCI2HGt9
         VwCXsROInpYasLRjvJGJtyQwTpxRwRpzkkOnbeZNsFC8r/XrW2fXRZ79LFrW3X/mElp/
         7UqnaFyUw/Ml32pvgc0SBjR6GdGdEFQID9EFFfI/Mv267WBWo6yAgUhM4PrQc7kbUKmU
         NMppZTP8M7QBssEe9ZaVVXaKVO/Dt8RqQtKgh0nRyzXP8xHZmPglWG1E+ITBEvnchpif
         Tkgg==
X-Forwarded-Encrypted: i=1; AKwUvBxsNwQbMwvkdQJC3OJlv6WMLoei9FruVmo6zTGKyW3gUSt4JjnQz+xjo/JrBQmUDWr06H/AoLQWiieD@vger.kernel.org
X-Gm-Message-State: AFq9FYITW7644lnZ+5comBOew6yKy0jI0Ue05p4saY7ohdnee4/fCmex
	SQE2MCa2Z8WVpExgBY0rm03CKBlcL1GbtwXiTDklOb4S5JSZWmh93B9Vf2i92Q==
X-Gm-Gg: AYBFou2TagZopG8sw9Xz/vFwc3SeUWcdgcYie3GdUT7Qb0wFgPVaPv66bJDbUHKAfdS
	4KF7maVbolcMZU08nsKLrQPQhpGATgMmdW1UAMdzd2fK6Ed44vq82oXAVHQbANxQv7y7GrCJezd
	boJ4Il62cb8B2DSFJZTZ88Dx2AhWg8xzn8X8Ea7pd76iP6nCCSpqdXMQUA2LC300TZvHgZ5ah4r
	lG5c/LSjqJ1UP2uAgue9eLEDb9mVlHcCLg6+gEw75nP1FEEega1we0GQ6e/3e3UkV/d7OLHvyyb
	hWIx7uh6mou+RJgC2fxlTLr9rMWlKd27kyrmGpafB7l8yMWCoL4IoVGCspUo7RlwOS9CoS16ObL
	nXJq+DC0ZU5VPD97X6E5Y63k7u23/H61PSJX4wxe+DsqKTRHmw0R9BcDNHZXwUhetF3MjLxiD3d
	hUGwCS8AXvrt/b5hoLEGoPmbf5vDCCN0HKe/t/BYmWsRNrKBQ+BtKj0MDacJZif6mu8spoJoRRi
	KP7LUdIW5b+KKvwqvUvUknY33XPf7SEdn9N7/jzdk9Fzv0=
X-Received: by 2002:a05:6122:4889:b0:5ea:9f1d:c842 with SMTP id 71dfb90a1353d-5eaaa6647cbmr588454e0c.15.1792183715924;
        Fri, 16 Oct 2026 13:48:35 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:42fc:16d8:d66b:d6c1:caeb])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b55cc65sm2463872e0c.17.2026.10.16.13.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 13:48:35 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: Frank.Li@nxp.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] ARM: dts: imx27-eukrea: Remove invalid spi-cpol
Date: Fri, 16 Oct 2026 17:48:17 -0300
Message-ID: <20261016204817.463567-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADS7846 timing diagrams show DCLK low when inactive, and its pin
descriptions specify that DIN is latched on the rising edge of DCLK
while DOUT is shifted on the falling edge. This corresponds to SPI mode
0, with CPOL=0 and CPHA=0.

The spi-cpol property without spi-cpha instead selects SPI mode 2,
which uses the opposite clock edges and does not match the ADS7846
serial interface. Remove the invalid property.

This also matches the driver behavior: ads7846_probe() clears
SPI_MODE_X_MASK and selects SPI_MODE_0 before calling spi_setup().

This fixes the following dtbs_check warning:

  imx27-eukrea-mbimxsd27-baseboard.dtb: ads7846@0 (ti,ads7846):
    Unevaluated properties are not allowed (spi-cpol was unexpected)

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:

- Remove spi-cpol from the dts instead of adding it to the binding. (Sashiko)

 arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts b/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts
index 26833ed3339e..cf5603ec6826 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts
@@ -77,7 +77,6 @@ ads7846@0 {
 		pinctrl-0 = <&pinctrl_touch>;
 		reg = <0>;
 		interrupts-extended = <&gpio4 25 IRQ_TYPE_LEVEL_LOW>;
-		spi-cpol;
 		spi-max-frequency = <1500000>;
 		ti,keep-vref-on;
 	};
-- 
2.43.0

