Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CD649252B
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 15:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708661; cv=none; b=ISQvmLG/hNYidPb8LqVNPu9wzFYLT9ulccJocpNk8JNrLYIsE/rzBXMzWtwxdUwh/jOhiDAToXCtxDmjQQfICwf6PdwbTYbr8ECpsBIfWQeM1h0ExCBIc4k0dOS8Gtffskorud62EYt4MJD82Y/k7e1FjwjTIrtNdbli0Iwac0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708661; c=relaxed/simple;
	bh=IJZYeU8nAGhKDiOr/eCSlIvhpsaaTQLsJcvcGm3GJ9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ll5TBM0AFu3Kvfig4drCroi3FdZ+NSe1jfy6p0gDhY+41AAM5trvKv2Io1znDtvQ1gAQUslqbu8P7dilEOasbZYze3CfuPpdZ+AfidRyeFlZSiSxA02ZJfTaBPEuu9/XPHqjH5mllAgoyFFDlMGpvc1uWDbn0v+Hg0v7jo/cmW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RpvZiZE/; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RpvZiZE/"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66058b880e9so5951170d50.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 08:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781708659; x=1782313459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCNmDDZkyDCvREs0izKIJJ9NBdHLWOor2XurOTFM618=;
        b=RpvZiZE/BngorazpIaOurds8ENQAhwk9Le1/QrZQAiiBf2Mw4z/prgdGJyTJJUrgA1
         LIXJvpNEcM86MO3mXuXHqY28pG1Dwir5Q7fMAUef+lsr3AglSLcf0LiDoXSsY5/J6p62
         2tkLFkRDQaPNo1Vycaxpf82GAiX9VAfZPLbx23SagJ81HuFRSi49aiEIvJOAPJ2WrwgT
         Vdu3uFS3pMc7g1+Z/p6jUoHxMrxVR9V4j+PiSuHMvAdfi3V3uZmdYGxScW8VeTjWrYAF
         EcpC3GalfOeqDr86KsQ9322UunJW/wQnyl7Bl4x1dsoKa90DGYRgi5nPo4FrCWjE6ywQ
         G/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781708659; x=1782313459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YCNmDDZkyDCvREs0izKIJJ9NBdHLWOor2XurOTFM618=;
        b=S+tn6TFtZnXeCXSqrxRikk3yb4cNM1KDN1Hz0J82VSnksOUFI57pUF34B9EwLEPqmm
         DfptQprknoeI6Ux274lfr+mni1D3JszUJwu6XCkgvMkw0rrWTQMjJq3IYL19iVx9IxDU
         MycYK8TYt67Ht90YHo289sICsisCaFaU4nJtLjtaWN6yB2EbV9Wf+DDiXqLI5iKbrM8C
         F8rC5OsEFxd2/ufZUHeeLhuNBwv/2yVgxLISHlrnGzDVsmtp6/N28kYc3/aFwUPOsGET
         X3NXnbrpVclZ3gMjzhVKb6q4jKG13zGDo8QZT98uuWYPeJNo03Ig8b+3mlK+5g20g1tr
         d7HQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Z5iWAd0GWmAUNPUOrNcuvEcxdiUPaup+aPQGSRuuK78WWYc4ZwYzEpen+fNIqXDMVhHbtKh+u7C9p@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/zzrSsp62Bl2YLw+9hWbu71VX6ceOgqjmDTl6MlSBV3grhmFH
	aTdnchwcK7jIiRst/550kKG+Zta3HlJdtwnZ/J4mjrx93/MBvd5GW74q
X-Gm-Gg: AfdE7cmpZJXGOsD9EHFEX5WFbFA2PafdRk4/7RqqP505X2PiDymtOR1eN3tr0w+6JHb
	+8VOgNzb4wxGAK4U3L62SrRshE/nhtsWInSsDUhIDhZLzcIoq+GFO6IB3jiZHXKfJI3DW5buAA6
	5F2hSl1h7abpCFymyWyyHOHwfCWL3LqvxaVDMS6+dUNFYrXXO9CgIGHsGtmbpx3iRSS+rF66dId
	VZZ6tSZ0Ukr9qqukLgxcJv7+V3C4Mm5nQXNKUX4qbCD9vLQ4CygPuzGKW9+piwGgrjNT+jucmBE
	g17bWD/Rjy3EtbPBRCJZNDWuA8qetfgEvOHyAYy+K6pfbIAglHmMYYo8skPPOa1cjQl8VQjeDsu
	Joc39uJ6lkcDAEzzimLkjk7E902UIlgRKDjWe8sDSG248BwktwvKRig+blYXFVCWUEpW0u6krCf
	aSkcf7JM2lqQ==
X-Received: by 2002:a05:690e:d57:b0:660:78f9:7e7f with SMTP id 956f58d0204a3-662cb87eeb4mr3643165d50.3.1781708659378;
        Wed, 17 Jun 2026 08:04:19 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-662b976e47csm4387677d50.20.2026.06.17.08.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:04:18 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 08/10] Input: cap11xx - guard unsupported DT properties before parsing
Date: Wed, 17 Jun 2026 23:02:47 +0800
Message-ID: <20260617150318.753148-9-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617150318.753148-1-jerrysteve1101@gmail.com>
References: <20260617150318.753148-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check of_property_present() before parsing microchip,calib-sensitivity
and microchip,signal-guard, so that models which do not support these
properties (e.g. CAP1114) skip the parsing entirely.

This prevents a potential buffer overflow in calib_sensitivities[8] and
signal_guard_inputs_mask when a model with more than 8 channels
(CAP1114 has 14) would otherwise call of_property_read_u32_array()
with num_channels as the element count.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/input/keyboard/cap11xx.c | 52 +++++++++++++++++---------------
 1 file changed, 27 insertions(+), 25 deletions(-)

diff --git a/drivers/input/keyboard/cap11xx.c b/drivers/input/keyboard/cap11xx.c
index 0f19ee036e78..275eb79a7193 100644
--- a/drivers/input/keyboard/cap11xx.c
+++ b/drivers/input/keyboard/cap11xx.c
@@ -231,10 +231,13 @@ static int cap11xx_init_keys(struct cap11xx_priv *priv)
 		}
 	}
 
-	if (!of_property_read_u32_array(node, "microchip,calib-sensitivity",
-					priv->calib_sensitivities,
-					priv->model->num_channels)) {
-		if (priv->model->has_sensitivity_control) {
+	if (of_property_present(node, "microchip,calib-sensitivity")) {
+		if (!priv->model->has_sensitivity_control) {
+			dev_warn(dev,
+				 "This model doesn't support 'calib-sensitivity'\n");
+		} else if (!of_property_read_u32_array(node, "microchip,calib-sensitivity",
+						       priv->calib_sensitivities,
+						       priv->model->num_channels)) {
 			for (i = 0; i < priv->model->num_channels; i++) {
 				if (!is_power_of_2(priv->calib_sensitivities[i]) ||
 				    priv->calib_sensitivities[i] > 4) {
@@ -254,32 +257,31 @@ static int cap11xx_init_keys(struct cap11xx_priv *priv)
 				if (error)
 					return error;
 			}
-		} else {
-			dev_warn(dev,
-				 "This model doesn't support 'calib-sensitivity'\n");
 		}
 	}
 
-	for (i = 0; i < priv->model->num_channels; i++) {
-		if (!of_property_read_u32_index(node, "microchip,signal-guard",
-						i, &u32_val)) {
-			if (u32_val > 1)
-				return -EINVAL;
-			if (u32_val)
-				priv->signal_guard_inputs_mask |= 0x01 << i;
-		}
-	}
-
-	if (priv->signal_guard_inputs_mask) {
-		if (priv->model->has_signal_guard) {
-			error = regmap_write(priv->regmap,
-					     CAP11XX_REG_SIGNAL_GUARD_ENABLE,
-					     priv->signal_guard_inputs_mask);
-			if (error)
-				return error;
-		} else {
+	if (of_property_present(node, "microchip,signal-guard")) {
+		if (!priv->model->has_signal_guard) {
 			dev_warn(dev,
 				 "This model doesn't support 'signal-guard'\n");
+		} else {
+			for (i = 0; i < priv->model->num_channels; i++) {
+				if (!of_property_read_u32_index(node, "microchip,signal-guard",
+								i, &u32_val)) {
+					if (u32_val > 1)
+						return -EINVAL;
+					if (u32_val)
+						priv->signal_guard_inputs_mask |= 0x01 << i;
+				}
+			}
+
+			if (priv->signal_guard_inputs_mask) {
+				error = regmap_write(priv->regmap,
+						     CAP11XX_REG_SIGNAL_GUARD_ENABLE,
+						     priv->signal_guard_inputs_mask);
+				if (error)
+					return error;
+			}
 		}
 	}
 
-- 
2.54.0

