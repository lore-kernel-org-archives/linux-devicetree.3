Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01982F7F0C
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 19:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779822922; cv=none; b=jtYTsRsfguwBOB38k4cvsg3cDL5M/pycXVy8KaW/YDx7TlY78YJS4qepI2shcM3MSMezZAYAuGvNzDs4q1cDCovUPWBQ4+57UiHpEAxcr1sXjBKh34zAFyjnN1teCtBSWgeFg0VqudObHJ8G+CXqHyKlgJSmJALg0ZI+Y4QRzIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779822922; c=relaxed/simple;
	bh=npy+hadqe6yQ6MJRKfNu5zTOKK2FcCG6C9YH+9UAZ14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jb/1WuV87qR3exbMdUwIoBBltwqaEiq49ihl62OVruFFl7+J6TO7+GuGCDuwbEhNe9QZoN2Re8FE/FMgbSlnP0ecVbY3myUReE2hG+ZJQsUyDJAztOZ6c2WbK8iswRaVyz3bvU5o2oxVOcTtcAq0ntpSymr6w8dA6VTwMYiJzAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1Wu0sOr; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1Wu0sOr"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so3161714f8f.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 12:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779822918; x=1780427718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYH2L56KpXSfSkcfo0wbOq3ubSGPGkqpLJelz2krcNs=;
        b=Q1Wu0sOrCwrljEYns5Fe76w9rahfuu9GnqirtGJUb9ZN05uQjVSvC7T0OuH/i2VS6s
         MXolcQQcoAV94NSsAmN7+cMxD+nIs+cNmtqwx51Yl3vRRifP0x/RE939GwOQzz3R0ImP
         2rU1WcRGojuYpDXyEpVGlOo12Jh/gFa1aEsMqHoY59YzliOp3/WuQeP71eKiBoOnMszm
         QAD8Hc6Heg65/brcNUOqoMITse/WnPOMAiXMLdTRenuKe0LdVlNcsB5PHQAjSnCYDkxL
         7+AY7d/s3PW7POyA70bd+ZePu8weVTd5/kBWyQd7H/n+1iIsI4tA99B9ni4vL1Kirewn
         Bdlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779822918; x=1780427718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nYH2L56KpXSfSkcfo0wbOq3ubSGPGkqpLJelz2krcNs=;
        b=YBP5MOhde4z9LlJFBeW6epnOX6CCTnBIA8NG+5+1PJn9jVYyFdC1HW0+r3pvz0ApEc
         xiMTKGqNpRUgW/8nQWTMlqIh94+GmqMnF0lz1VETNKNKEWsfOpwNK93ZCDy/q/HxVu21
         g1okH6RwTRbGlWqpcI6wHVxChXbrxPDqtrGWz67MhIX2VZJGe29KNLeHBoukqAXO57+s
         SmlgnVPv6gtw5JoXTMNvvxaBOG+HQAjVi41svdK1MtAlGW3x8SD5yNGApxUb2rm9c87L
         OZsAn4N3AxJRCPxT8sdrjP/JH1Rg/wEWLzUlDXpEjWbhGyiGDdn8sGm2b/kJZyMWp/pI
         JQmg==
X-Gm-Message-State: AOJu0YyeVbd4xyHjM7t6AXnsd2YrLTChivn5LsiiH92BndMhDgyqleUg
	EgmuXnpHt9h3O9O55NZV2KTiRN51UEMyHEb2zKP1dELz4WlAhilL8j2F
X-Gm-Gg: Acq92OEZx5OPmn4p9ADhM43cM649RmWszH1Cf+ooF6BCZutveDCVtxbLC6c6Dzu7xwZ
	fGFdcOKoQ9d1VLmpZq1NjNlMGPZkbJXUheoa5lcsLij571WPzGX4TojrEEZHKgbgiP72PW0xq2/
	XdmmE4TPaVHVEJutCvh5tbCDvEJecbFO6SmD32YHN1Yz3Zs3a8em5htAP7m9P+NmdHm1Vqmi6uT
	r5kAlMAuY5IfRr/Vdf3kqNwOpFd/w+1QYtby6Y8AgcWnE830OzraeXCHrjoG9nsRX4i/yMfaZmU
	oXRSYYZFEuksXFQA3hLN37yUb3EjjyoHf399LSgpJgcufm8DOlqRAYPiaoyZ/iCmBQ1eb4aL1dJ
	4Ny7i2rRblxYgVr2oKVf2VlG+r0lnfAxqR9/R4pVkg7OdC8VEcVr62nsvkcd7rWVHXMeUIBoncP
	wFatMDCsV8HGX+8LK3Oznp6OX5US295bsc6q3bq61BDf2kA+4zj9vOoEljhoIc4iOAXeDr1Hv6p
	6YcZZ3kvH7fCn5G8Gm1
X-Received: by 2002:a05:6000:4684:b0:45e:d843:27fc with SMTP id ffacd0b85a97d-45ed8432acfmr4284847f8f.16.1779822917930;
        Tue, 26 May 2026 12:15:17 -0700 (PDT)
Received: from [127.0.1.1] (93-143-222-3.adsl.net.t-com.hr. [93.143.222.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5b1c7bsm261529f8f.29.2026.05.26.12.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 12:15:17 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Tue, 26 May 2026 21:14:47 +0200
Subject: [PATCH 1/3] dt-bindings: mfd: 88pm886: Allow vbus regulator
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260526-88pm886-vbus-v1-1-f2bd1fd3c19e@dujemihanovic.xyz>
References: <20260526-88pm886-vbus-v1-0-f2bd1fd3c19e@dujemihanovic.xyz>
In-Reply-To: <20260526-88pm886-vbus-v1-0-f2bd1fd3c19e@dujemihanovic.xyz>
To: Karel Balej <balejk@matfyz.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=949; i=duje@dujemihanovic.xyz;
 s=20260328; h=from:subject:message-id;
 bh=w9yI8wCwzbrK5f5g107nAXx9VFMEYrQgjOz4ll/v96I=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGLJEPzqtt9r4r/us16d7UiLfJh103/4s+MSviLMSH+Oz0
 t/GiOuLd5SyMIhxMciKKbIwL5W7xJcaPtGhyDYJZg4rE8gQBi5OAZjIsS0M/4Nl9ohtjnbdfPOy
 QbBQU3zBi9d/J8ulxTMfmmQt8y0p8h3D/3rZgmDdUxzv3XYb3H34ZoX3NFlH2b7NO1N/uUp/1Qu
 /xQIA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792

From: Duje Mihanović <duje@dujemihanovic.xyz>

Add vbus to patternProperties for the regulators node to allow for the
PMIC's vbus regulator to be exposed.

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

