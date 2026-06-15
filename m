Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FBF3FAE19
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 14:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533323; cv=none; b=IUEQid7PN3RA+9u9nAkbkhTBgnMzKIHGtdK2TrrerJgbqkXjPGhZlCzKZIt5l7qSUsx/A0tzvx8UrW44pTyw3mqbTq0GEY+X7kE0Ubo8ep2PeCEmZNTiTeyxFEi+yQf8o7lTDbyAkAgoWut91Mh5Rm7iIWIpax13JI3VizFyLjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533323; c=relaxed/simple;
	bh=TKWyalqVK8GLqXOJNE/S62cDUcMTVSr2CPvY1sjqxnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RyhU60lvUVF5O8cjed2V98v2PbROQxgtAT+1jCSe+KGALDCOB7hzPk/AGyiMDXiQFsnC4Vjy4iF+O+dFxhyiG4Y8GC9DfJw5qx1E1ZfMU4xndZdtfTTz/Ewj7Fixuv7Hj9fXJ4CUa/tuxmYGPJZxqnhAqgYsWBwXdq8xLZP7g9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEJDGcOh; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEJDGcOh"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36b9d265355so1638561a91.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781533317; x=1782138117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owsFweYleMPe5NnGNcwnhZSDtHrTd9WEDx+h/fQkjWM=;
        b=TEJDGcOhrf55fwRuUOEzs/8S1cypHRJSqGov2gK75ZVp81GrohBfjPVYQ4z3vjy12b
         sgCAooR+pNpw3NhPNhin8Lx1MoDXECRxUDU+hlivroa5hKnwao8AJLFz92wNfjHfwtYi
         wV5rYgt2xZhHgiplb8XOsCxRQ7/WiZlkJtoZ1l3lrA/32hLN4rA8kapd9Rm8TFoqr1eo
         tHDDRY/W+WkPw+FFZHH9ErppC93ZOm+zzkyggv6FftDTk9mI1v8DceSQXkyEYvTX2tHa
         XrU/YRUXrc4l3r6KUg71xFIaJUFFsZMMMx2SCopJh46K4vqDqKn9Dl6/mhBXmoF5uY1X
         JiWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781533317; x=1782138117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=owsFweYleMPe5NnGNcwnhZSDtHrTd9WEDx+h/fQkjWM=;
        b=QdkOeqMoIN2xAXdNbZ0wTPpEfFqf3/Aa4GH6doOdtKqqoj01b2HYtahbaQ3u1XbfW9
         z1jpSM8CXfnLntAUTgItRQam4ptDN17gLCbRNCXWJCdMkbrq9nwACM+pKlZ+kpwlIWZq
         2hkpZuDwaoaXkRLQTv7FgTltHrT5S2rseSpxuroIM7U9anw0STl5AcRL3NeyUR9kYHcB
         cEQx+kzAVHbFVDo0W8j70moBf8xdpzF9Y7F9pyfqPUIQPVRLiBeWpiIdc6qnRw9J1JYl
         c7zSdo0/t0ZXYITclQ36deosLn8jvXggrBz2ap8Y648QX0IJ8WWdiJYpiSUnkIR9weId
         wkmQ==
X-Forwarded-Encrypted: i=1; AFNElJ+0LBDLVKU2fvJYCOW7siWhTKljp+9NdmYPfo9r0HnnJZxDTRRyRF1jO4eZMAnecScXd5IKfMv71eXQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxfPttGp/FSi4s8ijP2uFQj2ODjcTyJwhswTcl281aA49zSobX9
	R9ONqUC28Vc2RqysvppffPYwIlK6TnbN7QzlOoV0jUndKIYU//t6eaDX0N27+bVJxizcog==
X-Gm-Gg: Acq92OHCMcJpubfczzf9jOzj/cF4morFkLASLRr00PM3LRT0OzhSv06eR6IiL8Cu8zZ
	5MuhW0jCWDF4wh1dvVYe3KcW+d+Cnw1WYnbeyeQQ8FoaFi7NIztmsIVqr076f4scqz9Hlp/HE9d
	U/MBSITIzgF/8aCehBch5xXleIDIpYxVYoK4E1+c4cT/t3T1axHcguIWk0vAW016W0BayoeYLg7
	Zm2bKhQ5sTVKIJN+qNEIHvUMJ00Wps5LNgGQByzfnkB43hpxkpDdCmMmBhvRYQFUT94qssyWv5k
	dFYLEYgssgiFuBfIfG0+GOVAaVmWdV7FSm9pnuFpgBTz2QhfHYCGa5SITRxw6Px45w1iN+kQmmo
	lQQRsdSFmWqOhOTqCcGcVFH+Bzh3SMRX8QLsEYdIBpRpluNaW+1MoqwYwvvrOkNQGxVMgZpriCV
	6qICMV9Atb5kPcdFHSy2Pu
X-Received: by 2002:a17:90b:380e:b0:36d:79c6:1563 with SMTP id 98e67ed59e1d1-37a035f00e6mr15785637a91.17.1781533317379;
        Mon, 15 Jun 2026 07:21:57 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm7178233a91.2.2026.06.15.07.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:21:57 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/10] Input: cap11xx - guard unsupported DT properties before parsing
Date: Mon, 15 Jun 2026 22:20:34 +0800
Message-ID: <20260615142103.352163-9-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615142103.352163-1-jerrysteve1101@gmail.com>
References: <20260615142103.352163-1-jerrysteve1101@gmail.com>
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
index 2e9382a721e9..c48ee8520a27 100644
--- a/drivers/input/keyboard/cap11xx.c
+++ b/drivers/input/keyboard/cap11xx.c
@@ -224,10 +224,13 @@ static int cap11xx_init_keys(struct cap11xx_priv *priv)
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
@@ -247,32 +250,31 @@ static int cap11xx_init_keys(struct cap11xx_priv *priv)
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

