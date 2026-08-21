Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5684360EF0
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 12:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787314753; cv=none; b=owyKx2JLQXfyWXMKmol2sONmrroUuy7KauV5/PQFZFrSmbkhaW2mUtX4sGKfW5jGioMCcLu1xkxpL3MCyGlWnTextTQ2VUXxu7cJR1sQ2e0EU3981zm0Daz1OkVi9ywx2Gp48tArOBggN9M5lVpGm9ruK8JLhxbZRt8EDWMNBI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787314753; c=relaxed/simple;
	bh=GtU3BwmWr5r04fdNMr2P/dLekVQQQO6qKHal+CTJ5SU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=USIW0M0ASCrZi5/yhObZfZ5xMhlHrbzeDLkxOsqSLeiNJWPZNXxI/uDc4U6ZTrf4xnx0cnFpoPdIs2Dgt59J7irUOU/2m138zNJ6iL6wmz6ymFUVH+pQn3wdrRDxT2rphA2m2F+ujisv1yewLtMslyIK3HJ/g2gcEqUASjo3oKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YNwhZezR; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YNwhZezR"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c15cb6f5c12so173321366b.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 05:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787314747; x=1787919547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fqnhzBAbwr00r53ZE/i4Zlj1u/RNPOU76CLxr9WNMu0=;
        b=YNwhZezR8ocwMwWJaHMAFQodJ2N4L9yebtBvagvqG0eDA+HSiuCDN2FXKYgy/AYHOz
         5bp4eLJG/H1TODcwJd0fsKy6Ck7ZtUhymvlZz8T4S2kwUCDTyUzLS4rtioqrfvhIBwVd
         rzks+c60J+uE7DFjwbslhDmelPCLTJX3/JbYINE9/8nfgymYNkM1fnbZbRCJh5pQE0Id
         UbzI+0p6E5fBbNwIQ5061YSWlRsdXVuXFf0Pkl08bVra2aQfusdYp4uq8HpiIC5smzmS
         ZM72vCU05Ui4NvP6hdmg8+4a9xH8i2cd1KKksbWaM00icF1iIXNgWWMhwbtdfcUNA2Mo
         MKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787314747; x=1787919547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fqnhzBAbwr00r53ZE/i4Zlj1u/RNPOU76CLxr9WNMu0=;
        b=IF1PKZd1IVwzOG5HDb5upPLeNIAQu7u+ooL9t3OrR1KZ86rE24FLjfGe4ahYnLLE8T
         21LomICTa41DiLeuzeNPs03aFBicE3J1jPU8UMNrDz+rjJ5uBLdykoZ5NA6oChjtC9eo
         qkY8F81O7WE9fLDWN/SUkUM4N1aDv9OHm2A4hR75w4+GpKM2NR6ySaF53WCPJyYSawpD
         tZC56cuqM1FRob/ssrqYkn4UfkHgzx4oTSB8KmoRkHOOvb1F9HOX5BxU/WCDa4BHQPW5
         6Ec92dhkGjJexenh6GAU9Il2kmAelBarG3rSBdYNoOySCMXYWX9FNyclRIFZYMrb1cgv
         ycTA==
X-Forwarded-Encrypted: i=1; AHgh+RqLKPdW5eDvYhMLo2YELkcFkKBsjc/1pDuTlwvBbseAL4MoZvX3ZoXtGyNorkIWZXF/LpCvU/0jp8dU@vger.kernel.org
X-Gm-Message-State: AFuF++nndC7lDVmSY3IlfR4BMQ14KTVkB8MymhC64iBrmH8kPDoF82W9
	Ztt6Cc8mNvH0UkCjTSZuv0KpGsWKwcr8vRL0LZwfXVL/YxY++ErWIvhZ7X34Uw==
X-Gm-Gg: AR+sD11864DRJYiLoGwqNvP9/6PLI8Vx+bvUEE2T5OTqLUtyK1XG0cXPixoWMnksHaE
	dEw6P4ez8QeOSZVsUOrKY0C+U+ZfRdSHWQ7FLupsrU8jM5prSkAri5Fkmtqb0kDabIk7VbFg//L
	QQCf+sqEPCOmsjoglMvZG5hGrdSekp0T+JwZietci7mN5fxEP8f4dj1gVBRAOzrLdWPqSIWh3ZN
	1gTVdy9viyR3W6Jy6Yc4c1QS7iTT2Ee7QSdBZzfeIf39fCEjC9NSR+bX7Fjsun70/Inp087PPme
	sjHThESV73GzsrlTYCB7M6dfLr7SNAjUfAq2jj0SmuAJPSofNVJU2v1XOGBWNrkU/ncjPsIGqDE
	3uV/4ysyZ+c38xuaUPM6i3NrYq5tNXguxWyEcy6LQFso0weY9TyyQIAt2WpITmuOgbNP6XKt4Yq
	BVcMu6M7ESTIOWfzTqwE/YxRnODjUNw5FrwM9EPaSvGlbS0El2pXMkGpKgJYauycqWH85FaeATM
	d0W8Ts7kcaVHGgEO9NhUeC8nRo=
X-Received: by 2002:a17:906:b849:b0:c12:6d25:2c7a with SMTP id a640c23a62f3a-c246a627988mr481735066b.17.1787314747295;
        Fri, 21 Aug 2026 05:19:07 -0700 (PDT)
Received: from [127.0.1.1] (83.24.178.112.ipv4.supernova.orange.pl. [83.24.178.112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589d9df9sm447823866b.1.2026.08.21.05.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:19:07 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Fri, 21 Aug 2026 14:19:01 +0200
Subject: [PATCH v4 2/7] dt-bindings: arm: qcom: Document Motorola Moto One
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-next-patches-v4-2-7ab02c0d4eb9@gmail.com>
References: <20260821-next-patches-v4-0-7ab02c0d4eb9@gmail.com>
In-Reply-To: <20260821-next-patches-v4-0-7ab02c0d4eb9@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Adam Skladowski <a39.skl@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Add compatible for Motorola Moto One(deen) based on Snapdragon 625 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..289a3de1d24b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -292,6 +292,7 @@ properties:
       - items:
           - enum:
               - flipkart,rimob
+              - motorola,deen
               - motorola,potter
               - xiaomi,daisy
               - xiaomi,mido

-- 
2.55.0

