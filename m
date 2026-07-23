Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BA643F8A5
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799618; cv=none; b=R55HF+Kqt5RebNXkLkSNmURGx+KUXNgOuFqspyDSm3IDYRMq/lPafLsh21xcuKtaLyL3s3z8p/yDb81dtLTxUJS5RTaBb4XLREdB9o6UzUYA7wqkMZxnEgSAI2L+RaqWeLiGxzGwrScfIluvi3TFYtfkfhG2BPi/U5jgn82KjGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799618; c=relaxed/simple;
	bh=Z6kQuyieMuopwJ1tmnc9HxmIwjhsdZNL6CTw6x57HJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sqXFeCMVBLGPRFstMX/lXO6SGTJjZtvuXRm2T4MN2wOjbc5e8c3on+OwONsOel5TrQPdlsyubq3IkufaoY27nZqRoutQmeSmTg+qJlr6lLoxtP2fNHb1cJH5Bu8T5royrUEG3884ZYj72W4kxv7FK22l/mJpVCz1vELYe21C+CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com; spf=pass smtp.mailfrom=arturia.com; dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b=Iu6qTWaE; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arturia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b="Iu6qTWaE"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so2992705e9.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arturia.com; s=arturia; t=1784799613; x=1785404413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/U/4pTpx6AbELcRk0BkaznBQbTZTpi3siIIG3MSwhjA=;
        b=Iu6qTWaEZe8ESssDQebJ9r/oZE0c/m2oUaUZpSRUKaGPuMcY2WOAJOJp4/C3EozF9D
         ZZYDW2d4y88gx3QIZFAcHRoIYuA4r/hAaILcstDQC1xvhjHOgwUymqO2ak7mKLwt0cKB
         tUwvGatGuXGkNl495gc/dl+G/E/l1J27UG6S9SyvOzTDy2D5sL6ji9eEAFNOSDrsySgO
         MsTlMi+HSYuV5ak4yJvciJd0g1zSbCzrWrDjqgXT2NmsTDoDsMfJYmFpVWiNpWzF5ebS
         d1sSYyKHvYm8AFHknYo388HtbBY+9PSZV2eOnyasUmv7xXfNMsnL3Fxr1Nhf+T2cTKq8
         Cibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784799613; x=1785404413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/U/4pTpx6AbELcRk0BkaznBQbTZTpi3siIIG3MSwhjA=;
        b=tR/s74E6dwJ9vSsdD+Ds7/qaGi3YDjUlb+R4W8pwN4VJX02hREbGvhI/6b83d45MD2
         N7oyoyNVgsCDrV+1ExShUY42wmHiT8WZleB6tbCabxEKbT69+EqZ6SP3aHa1uYUtEdQA
         GSKUXCyOKHxX04PTM99MNT16+dJFoR8cwt4pPFVW4ebUsa2uLmnqmDRKFxi/s9YvBRLG
         vW77lChDCTdq/QliZEMsQVjSKXX0HEJf+bxzqxALDSrxI5NmUWSYOooS1ULyCoKj25LN
         kCVP3R83eE/6sy027rxgeRgBevvbwk1k05+HbgImOiI1OEYyUOcO1t8jQ3ERbxjP+7B9
         BRIw==
X-Forwarded-Encrypted: i=1; AHgh+RpsT55N9Z+Yv5EfqvKJuYX/EY/zW8NVmIHt0UIk9/MheeJlBmK9jA6D3+oGIL6hLdYhG4VWe0KAGCQs@vger.kernel.org
X-Gm-Message-State: AOJu0YyWmTPPLjpySamYjsCE3rfCSeHiA7+79aQXInsPdl0kFKhuBqy2
	MZRLV7UPPCBJ2FBcUh9FCP8+9xfKZtD+cy0ZpAEKMIuJvjS7qPoVcwIBuZP0U3tzBY0=
X-Gm-Gg: AR+sD11NiBr2H1PsyULbEtW7hyuS6DefMyx4TvMlgy6xkowC7McDJOK6maPU6ht+eG+
	kMYJlElkFt+s41rY771ZZvQ8Un2vtkMU3KXDwVb6er1ld5vYE/pNkknW4YX8pMsADbadbuZRRMc
	6vUYK8nnRVCLKcG77P+wt01yHOXQ7Wp759Am76xQ0m1xM+tj7Gl64v5zTUk3Py0KWVBH6gl2dEr
	ivuppBiq+eBu0Srq4F6reEiWfNEl7mWnLg4stSUB2bpS0tHpm7GrGPv14BGxPglbjEP5yzBf5ru
	rH8RJ7F1HUUCVpYF+QKDzNktLD+GacZxEZ0qsRUuHiCrLZBWN1ufBjlHvBb0tbC/9gPa6E2yjLt
	UZHsmG23LUMcJFmMgDt3+ZqguEv8K3UpJR1DWpCpSfArck8aeog6FLTZpBr/eWRhjcMkzkXMRld
	DTsAywoWXvJ/iREw/kw14OzelGgi0cvtsk/ljl/9y1EHRaWttqYxs=
X-Received: by 2002:a05:600c:4e93:b0:495:7287:2930 with SMTP id 5b1f17b1804b1-49573c8c2a6mr23171755e9.8.1784799613019;
        Thu, 23 Jul 2026 02:40:13 -0700 (PDT)
Received: from vkrawiec.arturia.team (226.142.197.77.rev.sfr.net. [77.197.142.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956b030a64sm100986245e9.3.2026.07.23.02.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:40:12 -0700 (PDT)
From: Victor Krawiec <victor.krawiec@arturia.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Victor Krawiec <victor.krawiec@arturia.com>
Subject: [PATCH v3 3/4] arm64: dts: rockchip: rk3399-hugsun-x99: Update SYR828 regulator initial mode to use device tree bindings constants
Date: Thu, 23 Jul 2026 11:40:00 +0200
Message-ID: <20260723094001.120264-4-victor.krawiec@arturia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723094001.120264-1-victor.krawiec@arturia.com>
References: <20260723094001.120264-1-victor.krawiec@arturia.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prefer using a device tree bindings constant over a hardcoded value

Signed-off-by: Victor Krawiec <victor.krawiec@arturia.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts b/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
index 352c8efb37e0..a2b7bab63553 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
@@ -3,6 +3,7 @@
 #include <dt-bindings/pwm/pwm.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/regulator/fcs,fan53555-regulator.h>
 #include "rk3399.dtsi"
 
 / {
@@ -237,7 +238,7 @@ vdd_gpu: syr828@41 {
 		regulator-always-on;
 		regulator-boot-on;
 		vin-supply = <&vcc_sys>;
-		regulator-initial-mode = <1>;
+		regulator-initial-mode = <FAN53555_REGULATOR_MODE_FORCE_PWM>;
 		regulator-state-mem {
 			regulator-off-in-suspend;
 		};
-- 
2.43.0

