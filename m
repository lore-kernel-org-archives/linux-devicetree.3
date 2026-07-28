Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5EA377000
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 15:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785251807; cv=none; b=oPSZJW27EtY6uzWALLp2F2WkdSyO4xcSIn2AnZ6a0O+12c5gaEXJF7GTqFbs/yN+MK5+lBHamRr+Znoy/gcX4DxPN6/WYLbIZIgCGpbKzYBEr09ot9kbwtRg82ENXmj2v6ad2AV9mNRvLzVdvJj2DE32cVFpxgqDIFUcGmnKW50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785251807; c=relaxed/simple;
	bh=aK14xkLqG3EGDnWbtEmsGllOMpRnclZ579vZKBksQws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iv1wuSmCkFW2uinrWVWgK/Bbkjv9g7fhl/ttk0jEw021at2n3RBQwSIbIneGlCeNwGsjbrClAkFi960yjh0VPmptNs7TM26tVGKO9TdOd8gwOlkwU27y6wuWy/M03cqVkNpmWUv8A/kuEZaNTislv1wzH1kuoXzMrl3TpRC8y5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGkCF8/r; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGkCF8/r"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49553515a8bso49385355e9.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785251803; x=1785856603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4eIQcdRfGNlUtm4nFJpWfG0m8ngl2vo8ULkvsCbNlJA=;
        b=GGkCF8/r+VvOEgwtQnomXtwGBR5U3Lt/Rza9va0GSxKLxfhIQdakTDYQ2iKNPo227R
         Z/7+xb4d83Xd4TLbOUJ1x6dGHXONRSZd9srm3R21jEGM6r7asmo1+xMasfwFnnWo9OCV
         0IJ/vcBdRPxZy0QoS5tl8ZOu4U5O7FwZgOjuS6DxCiMsj9oxVajrtjtvgnD1vFDlRHXu
         bINrQaM7SrLfEiirjcM19pStGlRowcy6G+Ofkl1Lx5ltvARC5/+D65GJuWttsGW9TglA
         mFpSzC6W5R2++V/5jsEx4li2DU/BIdJ8jjgLFkOsOWRefRiFzyvZWrq39ZZdTufVuHFD
         VwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785251803; x=1785856603;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4eIQcdRfGNlUtm4nFJpWfG0m8ngl2vo8ULkvsCbNlJA=;
        b=CVUGE2Y+ljC5dnEddVlacbGnWH4rhVUpL20y3cDHjwd5c45qSV39qN6Q4AE3XnzZZr
         LVI7nTY9IT1tiSp0ADsnoGTMEUQl/FpHFrqSfdCLiBIFzCInPNHFdBY1uFIRAfep90Wk
         NekplDv63ZJadGfscJB0DSddzBwglCT8A7LylWpww16GdUQysJc0kr7kw8C0kP2Jr6+C
         1HP5JNVVWFD9RmeXcGgDCSBbNDNU4+9DjirykJY8ihi/yJYP9rBHv7Mp014I/l8CPIVH
         Ndkt+na1WBD6Cu0IUs+ye+xXQzdFkPTEJAsZkupSXK8jEQDlRHrLpZM1uCziiIol98Cp
         RlZQ==
X-Forwarded-Encrypted: i=1; AHgh+Roi1AJ6tMCwu3TCh0GkGoh6AywAL9G/UL+6WLrY+6SJKJnF2Hnf6E4OllILGBg8poiifD82aUpxb6+m@vger.kernel.org
X-Gm-Message-State: AOJu0YxyzHcuGiWaTBNJj1T6c33sgTdbeWbvrAXNzASj4QDEMj3xI2WM
	ZBCbwUtBOouCTey9aNj5827pHgEFaUidgivCxmxt5SFnwFAn4AyDW5yq
X-Gm-Gg: AR+sD11f1tYqA2qX64DcFYL1j2c1sqFbazsRmtqZN0Wg3g/JSEyxgSW/pDzIXE+c/mM
	6mERlKroOzEqsYBKCT+jjNalPqOfBuV/hhkzyen+L1RcSDgxfBqQwfdP3w9MayP5CG0RSWN7NjA
	JUU3Zvu0V+psVk1esijI8VQVwe9Fj3Dv4wfopHosmqlCNOj20BIjgJLK0evXgE1NBQnTHl6AnXj
	j5VDCs5BIxNBwxjdrYeunDgrj/bORadcmtMFjLkzPl9Cq91GQhB7f0mh4ZEz5HGhihsbFpl+sHI
	OO7EF08EPq8OwB5l75hnyTtO5fJ8rI17Z9GrZaWqSISXo9mVbJ5xMdeZwbzz9FfIirn3iFOlMt3
	1Dsi7ifQbBPHu3tu5jFYS7TTTyZH1lvnRxEsyx46pEY9Zo5i7E1aNLaq3p9z1d2xhHupRha+kj/
	sd6DOi6YEPh63NV5xq0yo+9mnxcmRTY+9P4UPl4A4b2FwW+w==
X-Received: by 2002:a05:600c:4e14:b0:496:bba5:33a8 with SMTP id 5b1f17b1804b1-496c658ef36mr29194675e9.33.1785251803412;
        Tue, 28 Jul 2026 08:16:43 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c631fdsm58422500f8f.28.2026.07.28.08.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:16:42 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Alberto Robazza <robazzalberto@gmail.com>
Subject: [PATCH v3 2/3] dt-bindings: arm: amlogic: document Orbbec Zora P1 board compatible
Date: Tue, 28 Jul 2026 17:16:35 +0200
Message-ID: <20260728151636.236393-3-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728151636.236393-1-robazzalberto@gmail.com>
References: <20260728151636.236393-1-robazzalberto@gmail.com>
Reply-To: Alberto Robazza <robazza.alberto@proton.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the "orbbec,zora-p1" compatible for the Orbbec Zora P1 board,
which is based on the Amlogic A311D (Meson G12B) SoC. The corresponding
device tree is added in the follow-up patch.

The "orbbec" vendor prefix used here is added in the first patch of this
series

Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 9f73a0054..2d6ecdada 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -167,6 +167,7 @@ properties:
               - bananapi,bpi-m2s
               - khadas,vim3
               - libretech,aml-a311d-cc
+              - orbbec,zora-p1
               - radxa,zero2
           - const: amlogic,a311d
           - const: amlogic,g12b
-- 
2.55.0

