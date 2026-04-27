Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EB137AA9D
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 11:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777290893; cv=none; b=ilMDD6krcl3KIT2Xday0FGQKvrtZ8ZI3D7kEBsWpVQQnDJUID0UaiTh2SKxAhi4zSDGtoQSiDtrANqRkSEJNpWciviyZShME+rMdvTy/z6QNv2X7kh7F0PV7t0X4bU5JJYdt4KbxFrAwYXav2OW7laJggSoQQ8owu/ViDgmgU0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777290893; c=relaxed/simple;
	bh=UXnDjoNy2m1of8IxTXlpdhm3Cw2z0vwo9egmu3TaZq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f62ozf2TVlYZOz0F6T9Rr1+CNl7riT4FF5+TWN3zfpO45Cfy8vUZrDH3lRvqlbiwUWKtIGElr7vT1Xsmufbc4DlynAwNnWp3wiw+Jntu8T1b2JdJOuZhPsD7DL5nzo9tsTq7fpbIKcdcpSSFk1/9YNlJ+kjvgiFMjt7N8viKLmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7+5mEfb; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7+5mEfb"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64eb84d1e37so7756255d50.2
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 04:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777290891; x=1777895691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H7YhJVo9bn5RrQLCw2y2cW4ZzThxtK47eAVmWLFWIXc=;
        b=Q7+5mEfb8qVuAln+62H6THY9iq29F1SkPuSHtF8JHPX16GTLQ81Of1J/yLJmvDE7yY
         oWqOKce5Vm5qI9dWpgs6acqP8tiCOoMm59gImMN0/EnmLg98z0qXppJB21DFlLg49qIP
         oVONM1O+TyLFD+oGPBfC9uqCn8lmddJWpAtnG1nb2scFuNPKHlVYApFOsdWvSgMCnVEV
         RigHEij6zc8QvBmd/xz9Q9+vcqB7v81pnLlQgKnqDzzv1niTdStOHPo8IdCA9N6L0POj
         weUHZod3B2rJZ6tJJXmRhwt5tM9V9IGH+wu5cBtOxt3qH9r2Z/2zYkevh7nHLjFGI26p
         J22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777290891; x=1777895691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7YhJVo9bn5RrQLCw2y2cW4ZzThxtK47eAVmWLFWIXc=;
        b=L5cxuPNLjqnM4Vj3A8JJM2L1xANUOAyH5EZ7IAMZc6K3xiwv5kw6zGrOreGoJHfpR3
         hfScg5aqj39LfFmcDleYaSadodvu2v4H9Xx54m31EaUQvGVn8j2Q4cvmKsBhnWHVMLNk
         dI8sSEoMGt/QJnjVe6+4tiSqWf63yN8QphWgwb/+3p3qrNnirCDtqS7axipQHmSbFO6c
         L61aqZ1FODauT8aNHeE8Skslxe4PvHV9yEeVcbhPweOgKQczAMcRxRmWSxuDWE5+wINg
         UpZQsyzOYO4QwFkK/yrxhyQ/TFYO995FdGdLpFC8zbhFMI/8/8ldkfotEdPCPrieq1ZY
         w2KQ==
X-Gm-Message-State: AOJu0YxM4KDeRUvlWYVOJQyNGsqD8yyuuvrSdeSxmPHP8wKYHNeEnYtV
	HaKVNw/e0ZC3+jc96NjKXVr4rHloKOt8kwJ8Ya3pFWZKMmDXLkeu0FvheILesDpmUoQ=
X-Gm-Gg: AeBDiesRx88IRSZoHxql+tB2/H/uBaXi4+R8r9oaf+KRKCpO9dwftR6s+kd4mrYeT4s
	LN1gLRigC1TknaGGyN7yf7ITJg06ggo15fT7gq0ANmZbCtD0xc8C91l8wBU5iKhwpSI5cx1sCBO
	IsZAVCpqswPlnxC4RFi5Ogbb2dFZ5O5V38sscNAlHW3PNaXoVfDkyYl+wgHxIpRy5pGAL5s3QdQ
	6tV2sMYsyz76kYnR/6tgeV6pY1DnQ71njdzMCbfSqkPTYP4GsjAGGq+AvTwkcCTfZBlR3y1g1BT
	h70qy/pP+f1jjEpOWeaUYzf0f5s4UYFyAUxwSkHKu9Q3IvUhT3k1gd13tG+M5OgbWunAn3dNUyS
	MpNgzEsA3yIK0XfapRexjpbAl8omwuRNTOslM04xgjKdZ7M62ZXLc0x7ssPLj27YNwXQ8gjzUlB
	n/Te4tsJVohDRAUer6b3nsUk9VuaIt0kaPKRoaCVz6FX6S0tLCww==
X-Received: by 2002:a05:690e:130d:b0:650:2ff9:d651 with SMTP id 956f58d0204a3-653107b8828mr38373000d50.5.1777290891073;
        Mon, 27 Apr 2026 04:54:51 -0700 (PDT)
Received: from gentoo.sknt.ru ([95.161.221.172])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65314e8138esm14187220d50.15.2026.04.27.04.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 04:54:50 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH] dt-bindings: regulator: fcs,fan53555: Remove vsel-gpios property
Date: Mon, 27 Apr 2026 14:54:43 +0300
Message-ID: <20260427115443.3224840-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vsel-gpios property is currently documented in the binding but
is not used by the driver. The FAN53555 family of regulators supports
two voltage selector registers (VSEL0/VSEL1), and the selection between
them is intended to be controlled by an external hardware pin (VSEL).
However, the driver does not support dynamic toggling of this pin via
a GPIO, it only uses the fcs,suspend-voltage-selector property to
statically assign which register is used for runtime voltage and which
for suspend voltage.
Remove the vsel-gpios property from the binding to prevent incorrect DT
usage and to reflect the actual hardware description supported by the
driver.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 .../devicetree/bindings/regulator/fcs,fan53555.yaml          | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/fcs,fan53555.yaml b/Documentation/devicetree/bindings/regulator/fcs,fan53555.yaml
index 69bae90fc4b2..7f3b74ccf8db 100644
--- a/Documentation/devicetree/bindings/regulator/fcs,fan53555.yaml
+++ b/Documentation/devicetree/bindings/regulator/fcs,fan53555.yaml
@@ -43,11 +43,6 @@ properties:
   vin-supply:
     description: Supply for the vin pin
 
-  vsel-gpios:
-    description: Voltage Select. When this pin is LOW, VOUT is set by the
-      VSEL0 register. When this pin is HIGH, VOUT is set by the VSEL1 register.
-    maxItems: 1
-
 required:
   - compatible
   - reg
-- 
2.52.0

