Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD663128AB
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 14:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781360472; cv=none; b=SyUTb+FtKeRT6kabc3Ce4C8ypyn7swiq+n/t33s06u5X15zpC9GlF3N0qrSn0/UviGMCeqwft34akJ4lxhtq028j5VzGPLAfKKtpRz5DQ0oJRpI/9P9P5TIx++emOeNKqMAJAN35yDi0db1gyOEY+BOeZ1e18XBLBK7x5k3aUlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781360472; c=relaxed/simple;
	bh=dBKjpEpWIY+YoZpaXSyTr1vHWQHSlPyQ7j+bI/CPuvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rO0MoiGxl9gzH9sKOIegkKsQ1seN4/Bj1TY+gZg6hahoXFe0qkKHSrAUgLVsj2NyVsLk53X5pdWsqqjdQCu1ip0oJbAKbs45F3ODPGK6fkEMWI5G3SflJDHK3jDoAvK8RqT6MHa8mUwpKObEL/BNfqlUE8HLIv7LiQCXd/AZvp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g81P3dn3; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g81P3dn3"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef1629ff4so1193496f8f.0
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 07:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781360467; x=1781965267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6ohP8dsrr2qK8qEWNnxQ1LBIqyvgS8irkA8ITgD7Yg=;
        b=g81P3dn31CcomZ36pvcumAMuTEUL8BcnBvPTmcQU9pszc+2YgN8FaPiDfNpz3QJBo5
         uKm6qGabHbasYU9eMcIKUD+r10i2m4YOyf7LzOPwpjui9hQC+MklWwQXiASUnq4S93yB
         n2Wl2xoTvrc/Gu/3StTiHELn1wXKkQPkM5EKWlM12V6qdaUvMxmzFJQBaZXZzk8fEebf
         xUgcDtsEyPAtXNe9VxhOvUl9DtaTOs7u1/0oKz1dZuFRgTCvN/UjCCcPmcL+1QWWYV6H
         kGXAccz4g5mmL8s7EqImfSxUoPSeaNmVukNu6WSom5h2sgIfY591YpLfiby6UZB9mf8k
         f1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781360467; x=1781965267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g6ohP8dsrr2qK8qEWNnxQ1LBIqyvgS8irkA8ITgD7Yg=;
        b=VRkjC7y2EfNXzInBBxoBa/slArSXTNreChQ/BkkATxV9XIV9o+tIr6PoPAM3Ddi3Tr
         P3idP953k2fYWAU9TQY4h8FD52WksmQNubSCivssytIN3H7pOomI61p/4caiB2P4K5X4
         ziyNoXBrVABlz0s0GhgGbzIkhdAQfiSb6d8r3AGfGaoq/4nGNxpLVP7fm+V4LrD1kPTT
         q01fneJcVBM2AAy+pGlw+7XuqCv4eutWF/5Ssgptcno8cBThBsJFizd1g9n2oOiVzST9
         8QUqd14U8kc2SThpj+gRRmk12Z4SwSy+EAhbtNFT4LOfqciyacxAFD1kPZEsGpIJHyu0
         zEZw==
X-Gm-Message-State: AOJu0YwYRig6G+6XSlRomzjuF4R+TSrQGrhmKJHrXaYbi33Pda0ZfMPm
	Qd0oMPmtFL2pelJ7hl2ToeMyvNNSrugEMqyO6Rtj5Ob6345bgmGClbkN
X-Gm-Gg: Acq92OEvMSQUh/bBYKf03K18sCafX8lUUDTkKkuaocfy5cqLBIr7yrQPPVgkTMR0vIj
	Kxw73YAwWTUMqj3jXRbd4QxGwCuyhHh589hvmOnX90g78tdRcJECmAimY+zMndPV4CLyQDjP8xG
	U+2gOhscWNW96kaxw63+XpFYitT7pGQ5vd556PXNAQpVF4ejB5lIFeQUMNHh16sfh1GKES1JoPW
	X6Ypfy07ygUOuvWuKG38xTiCGvSBhEK63TBaQO0neMc59EqUGuPNrbssDY3SFyu8GhQBCqOied3
	jlN6xRtpAUxaRDtACwiP3mlV/Agwkq1DkixBPhFxBh3Se8GjPlB3e5XWKguWTaY/qKWMJmAeH+F
	3zZTtRGYQR2xOUCL0mqHHZ1MIBs1CyDzgdJGyJE64zlMAcTYi65tKKOvEu4t0sv8GgIaAqxYfzC
	Zzdxo3qWzYinz4Di4TeelSCI/rbo52gR34kXc62qrKvWwYB/7Cs7AZSHuJXuXamAWalxd918BoD
	tpY5dr62u4MmIwyTp/apCI=
X-Received: by 2002:a5d:5d13:0:b0:460:e2e:6e2b with SMTP id ffacd0b85a97d-46074a8a1b7mr4764639f8f.20.1781360467298;
        Sat, 13 Jun 2026 07:21:07 -0700 (PDT)
Received: from [127.0.1.1] (93-143-178-20.adsl.net.t-com.hr. [93.143.178.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26393asm16827223f8f.5.2026.06.13.07.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 07:21:07 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Sat, 13 Jun 2026 16:20:53 +0200
Subject: [PATCH v2 1/3] dt-bindings: mfd: 88pm886: Allow vbus regulator
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260613-88pm886-vbus-v2-1-021dfb02c6bb@dujemihanovic.xyz>
References: <20260613-88pm886-vbus-v2-0-021dfb02c6bb@dujemihanovic.xyz>
In-Reply-To: <20260613-88pm886-vbus-v2-0-021dfb02c6bb@dujemihanovic.xyz>
To: Karel Balej <balejk@matfyz.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047;
 i=duje@dujemihanovic.xyz; s=20260328; h=from:subject:message-id;
 bh=4gG38m60zNtEceURSA/5gu2M6BW5gWxnRcLhKQIPpkM=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGLJ00wPc8//v7OaWc3aUXjs3/r8aj1yCV4Lo8psHf1mpO
 DyU/x7SUcrCIMbFICumyMK8VO4SX2r4RIci2ySYOaxMIEMYuDgFYCKXnjD8L51m6KWwbXZmxVfP
 2ZttfJl+nr0/xT59azrTDNcN52sn72P4718QIByq+DDEfIlMQpKw6O4PV6Rao3kWLXpXvtyys/c
 FGwA=
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792

From: Duje Mihanović <duje@dujemihanovic.xyz>

Add vbus to patternProperties for the regulators node to allow for the
PMIC's vbus regulator to be exposed.

Reviewed-by: Karel Balej <balejk@matfyz.cz>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 Documentation/devicetree/bindings/mfd/marvell,88pm886-a1.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/marvell,88pm886-a1.yaml b/Documentation/devicetree/bindings/mfd/marvell,88pm886-a1.yaml
index 92a72a99fd79..940262898353 100644
--- a/Documentation/devicetree/bindings/mfd/marvell,88pm886-a1.yaml
+++ b/Documentation/devicetree/bindings/mfd/marvell,88pm886-a1.yaml
@@ -29,7 +29,7 @@ properties:
     type: object
     additionalProperties: false
     patternProperties:
-      "^(ldo(1[0-6]|[1-9])|buck[1-5])$":
+      "^(ldo(1[0-6]|[1-9])|buck[1-5]|vbus)$":
         type: object
         $ref: /schemas/regulator/regulator.yaml#
         description: LDO or buck regulator.

-- 
2.54.0

