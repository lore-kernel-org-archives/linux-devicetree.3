Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E785E43F4BC
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433111; cv=none; b=TMeOuyhqQTZ1D/2jLVdZDmCukvGAPM/6tiHFD3CEnyr6+zu+/pBNaeKelEdW1T0QT8pBMtGUBh0Mvev8f+V6OZuD4bySkxfWZOAqKQDRn4qAYjzjLNrqrbFs/hWzjvI7IxTk8kV9qVk+EoxvfoHiS3xAoecLbxIhV0FK9YlfdsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433111; c=relaxed/simple;
	bh=KD9NQ4VrwXH+YnOzlGmhl+H6gtX7UsGtmTQ7l2ha+tE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=okB6Id/odKUn6vJzdOYLMP+hcryEyfwk1C1CbfXyUYNdACUu7K93zH//2eVyqfWUF/weCUFKnlbf3foOruTvQ6o1WQS6gTBfwuHKc4KSD6Kh32ueBSoAcYfa3F5Hld96Vjs+GacT6jX5JFCN4VOLUQBdotsjOtSzIYYm3C96e1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgycNsuW; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CgycNsuW"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso32949a12.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433109; x=1786037909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UJSODNr47/JeyVvuH0Y9enO/Q9DrrJJxT1zQIjnjitw=;
        b=CgycNsuWpEcuxco4TEzpqLlKikFvxjOCwDvfrOY78icnBI3i1u4xg4Bg0ljU6YuudR
         VCQZmwwNDIB1jBhRCcXA+6kAxpU/dbXuvHRadbefcnQO09sUONtszV2Bfq5qICPZyDl5
         nSZtiPHug/W4dBX6ImiI460JawUmtOW+ciNs5POb80EgnmwxyFHW1ZgRBhTGvG3F/jqi
         44Cwe680Pvx3tm0mREa8fscCjefMgcz65vVCULTT7Swes0CWK4pI0mkVcZRvpLACMDAl
         FyucgJQ1HFqmIrhRu8PiSQxaVaHTKJ1rcPoFgWJomRXvPHILeLw4bgLJ9SzlUEwvlASM
         fhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433109; x=1786037909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UJSODNr47/JeyVvuH0Y9enO/Q9DrrJJxT1zQIjnjitw=;
        b=FVTXfm6fdibnEX7oxwS6l00MBwbi5hiFp/yZjJE5B+qTlSN8e9kTCoceT1IZV6Cnt7
         jO1VcYO6itRIDG2ZYKwt7LyxaUaGd9tr2gWYekBvTSFsy4ZEbwMGSO/CWM9rVPAxbf4K
         Uy9UDNeE8dmmicP2DnpSdb3ZHhorV/GDEwI8sbJGo8DAxtu1a+1Awc/mojic3r9efzn6
         +xt4trfHFSPC1yBu7ZMPbErg6W3R2+9bSt+cT3p9QHUGIp/5yMVoYqx7iKNdAXlYdIrP
         wO9Rvar0UxF4OJmeC/WERnldeKjQhSZnQ/LpgMYiiixAFDwgfS+Qg/tDyKdX26AncVNZ
         danA==
X-Forwarded-Encrypted: i=1; AHgh+RrJfEoKwzZRMEtOmBtooAe0nSol69NJDhgeh44+LpTh4rPC7FTL94BLPWjef0aWJXpKZ3LduhtoJiws@vger.kernel.org
X-Gm-Message-State: AOJu0YxaoKFBsct+b9hxQ0vQuE7yPz3DFUj4v/WiJamUi7hjSvWtXA5z
	R51IMG3It4bJBeXgwrIrSOB8NIzHXQ4E8i0l6pwcdOkJOrpGKBSmM9Mb
X-Gm-Gg: AR+sD120n3Y3jzH4CR8NL0DoR0vFyvP00Mjqp8QJ+HxtuV/QGwKls1mIgLuMg9LiNqZ
	+FWIv2l/Nkp9W4Z7GcNFlWD9xt5yrIJRj89bPTJuNBo7NSc0prNVLfEZJ+tgABXlWUpEfMsDP9o
	0IvNzH2PZs3UWNDx9QhuUIGMAcJUM6cS6GrmlMEC1nmLPozlAFaajwZBlFuuTQDPJCAsBSxmkH0
	OyjBRAlmFFFeQWeCigc74PKHAjA+BlV17lnDZAcUAacndzy4Uqs/Eqn8uq5WUxmCbJU3mYu+rWU
	IjJavzPy2EMFiqZpMZwZ47xB4g4noqLhrYx03A28fnM9GASomrOHuQHP61krI8INEQD0mc+8aRS
	86m1SpHquDK50cGMN2fBT5btKEG/0tyxTKnYVi9IqD2dmPEGfop7yTDOqeXxGvq9QVvwT0KoNMB
	uPpFMMT+ed00K2//I/T01i/MnOiPwg/DdMznRyopqhKRHfa0B3vlRBGuI1JMOtyCc08Lxd4FQ1u
	WNy7q7XS/kSjsJ6VGKr+g8iTPh8LE8=
X-Received: by 2002:a05:6a21:7002:b0:3c3:af85:85e7 with SMTP id adf61e73a8af0-3c900740a51mr3370016637.34.1785433109133;
        Thu, 30 Jul 2026 10:38:29 -0700 (PDT)
Received: from localhost.localdomain ([2409:40e3:200e:f113:d11:7ca2:3692:a449])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d3c68asm26808571eec.24.2026.07.30.10.38.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 30 Jul 2026 10:38:28 -0700 (PDT)
From: Rounak Das <rounakdas2025@gmail.com>
To: dinguyen@kernel.org
Cc: bp@alien8.de,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	niravkumar.l.rabara@altera.com,
	robh@kernel.org,
	rounakdas2025@gmail.com,
	tony.luck@intel.com
Subject: Re: [PATCH 0/4] EDAC/altera: Add support for Agilex5 platform
Date: Thu, 30 Jul 2026 23:08:05 +0530
Message-ID: <20260730173805.19997-1-rounakdas2025@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260720201425.1538771-1-dinguyen@kernel.org>
References: <20260720201425.1538771-1-dinguyen@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dinh,

Krzysztof pointed out that my earlier standalone patches were confusing.
They were based on top of this series and were unparseable by tooling,
so I am sending the changes here instead for you to fold into the v2.

Feel free to take them with
Signed-off-by: Rounak Das <rounakdas2025@gmail.com>

Two other things from applying the series:

- Patch 2/4 has "unsigned long flag = {unsigned long)device->edac->flag;"
  with a brace instead of a paren, so it does not build on its own.
  Patch 3/4 fixes it in passing, which breaks bisect.

- I have not done the per-variant interrupts/interrupt-names constraints
  Krzysztof asked for in 1/4.

Thanks,
Rounak

1) Patch 1/4: merge the s10/agilex5 compatibles into one enum, since
   they share the a10 fallback.

diff --git a/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml b/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml
index 2ccb0f216318..34af88988b84 100644
--- a/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml
+++ b/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml
@@ -20,10 +20,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: altr,socfpga-s10-ecc-manager
-          - const: altr,socfpga-a10-ecc-manager
-      - items:
-          - const: altr,socfpga-agilex5-ecc-manager
+          - enum:
+              - altr,socfpga-s10-ecc-manager
+              - altr,socfpga-agilex5-ecc-manager
           - const: altr,socfpga-a10-ecc-manager
       - const: altr,socfpga-a10-ecc-manager
       - const: altr,socfpga-ecc-manager

2) Patch 2/4: use an enum instead of defines. SOCFPGA_A10 is 0 so the
   Arria10 match entry, which has no match data, maps to it naturally.
   The values for S10 and AGILEX5 are unchanged.

diff --git a/drivers/edac/altera_edac.h b/drivers/edac/altera_edac.h
index 30e35da7eb6a..79b51f051183 100644
--- a/drivers/edac/altera_edac.h
+++ b/drivers/edac/altera_edac.h
@@ -372,8 +372,11 @@ enum altr_agilex5_irq_idx {
 #define ECC_READ_EOVR                     0x2
 #define ECC_READ_EDOVR                    0x3
 
-#define SOCFPGA_S10                       0x1
-#define SOCFPGA_AGILEX5                   0x2
+enum altr_socfpga_platform {
+	SOCFPGA_A10,
+	SOCFPGA_S10,
+	SOCFPGA_AGILEX5,
+};
 
 struct altr_edac_device_dev;
 
-- 
2.50.1 (Apple Git-155)
