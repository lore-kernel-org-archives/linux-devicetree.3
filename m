Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DD6495539
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 19:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789758324; cv=none; b=QGNG3Qvy5kM2FOJ5nV4HoxoDqQyn6b2eVIMbGRBoqFvFtrcbA61JzKEeXbx3z7L9TA6W7wVD9OsZ+t9z6nOPESK4wYlV/cgf8f7qePTWsAQWFRVaGnS+FNRPmWUO0s8Pa7Hu7G7q7psO3gKtjEJpjX2s/Oid1fxXKSKnzBdEWAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789758324; c=relaxed/simple;
	bh=qo8jkdcJFEHFTzGipPaUfZqW7W+79EGKtSF4WXhEUus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L21GW45ktMo6/1Z2/2CWvEipezLfrPQUklOm7KYJDyC8ZifS3Ee4WqUvSf+u9lxfjDnj++VPLEfBMVbM6fAauDhrEBCOwvdtgblYjvD8sQTyy6B0vsxzfaQw7v/7sPG47xMXgiC43+1x9zFMAH0ujinahBCVzRwZUT0/Rlytidw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UyPsVzwl; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UyPsVzwl"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a6056ac81fso1785132a12.2
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 12:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789758317; x=1790363117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mkx2G8tVXZT5TMOyj6mqwZ1d2EOEfZ7XnWbPQ3SK7sc=;
        b=UyPsVzwl6OjyM+AkgPORANN70AhLBWcBZrUj7/fi6livn/ios5VQhXWQDO3pClInzz
         23IWai+ZRMd+5nZMxBBPtPUn4prQ/KYZTXLPdC0wTUCRnd45QtjFo4PlUSgK1tmXD3LH
         gRRJkUnoVHoPoy6QeQOFhBfgp9yixhT7aRaeYatYY3w5z2QNxHkTt2vRjtpgqDJRiQ6T
         m617/L1+1fu/BNBVqjUBAwcU7+qtGjiI3dRkCit1gYY+LP6hvZbBqtn/Gggp9LkPinkH
         5StMfxN1blRUVt+7Xqna7K60uZDzThs5Vzxtn9vEMs+qM1tJEfFnSSuh/LDPGmO/b3NU
         RxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789758317; x=1790363117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mkx2G8tVXZT5TMOyj6mqwZ1d2EOEfZ7XnWbPQ3SK7sc=;
        b=BIeXdW9j38fT+3VuqOT85Y9jUegmzMywdCUd9KIwRmbqZ87H73KUxQc6xJ/dMXgJpV
         qq/R2h3gEKM7fG40eEyx3K/F0gMNWFhiaB6TS5ZGmev9TJf2tE5lt177lZbhywL12Mjd
         Rhbm/IqXHl+Iyruqq8kjGHt/z7HPvMRYtubBBPbi0+UPLLiUJEfYpJ+WTTbNFa9oa7J3
         y7uzE/YAEdZFy3XHYOIhxvgsWGqD45i1eogqNfPF11LY9a5Z79HuTriNJ9wEzLhXGTRS
         hWttDc3AlC/BcM4Iy8WVQm5MMmzq+zshEnbFWPptbyTB4A8HfjGdxttJlv9tgi2pBV8l
         O2gg==
X-Gm-Message-State: AFuF++n6BjU9YW8QZORj7IXEgIcIVMo8hMQxY/oVKXk4QtRjqFHaT9LL
	vwkdT5C3rGqZqfnUnkrxu6RlJEpm2bqX1qrTb4xRIqeQHI6YemJguPM8ojIRGi/dvqE=
X-Gm-Gg: AYBFou2OQNmZkFQHBhft2L3sB08iZ5ZQVoEpGWPjcctQPpKVvIu73lxSt3i3cROGBnf
	xdMdHd2RlByk98C5AnnOJ80NrKGVCUFbRjSdIqz1U8vt+OSAtJ6YR54co/0YaXpyDTvoRwByttR
	ECapVQlF2oI+YdwvUn4j5rHUh7PzyR0O8DJ9Na7NT1QnS4kSc5MXFQtifDYS0sP/iFw/BWHiofp
	RFAWlHk2W82mI0W69WEpe1dgQu9J/1XWO+3Rf32KPuv4XInzsa5YmwZrBgnb7+brwcmb8bCuOgy
	LLsRxiZp7nHv2NS161u+v0UJs5vPnZgjZ/Tk+a5/l9v40QPVofEY9W1VDcP6IjExa4AhfSdjj+V
	X+nqENVPUDNEktcw+Yga9RSoteEKtSTXH+4kM4A076ejc7dzmOwvre8R1qRY9C9WJZnM1eAJBoa
	aDcthGypZUPJ/isRoWwpQkcI1C3qzSAXuLeNpa62e9roQWV8rKGtccmPB4BBq8CcpeiX1GqOh85
	25FKURRdYTY0Amt+WYLzKRUZF9uEfCJAgTnxLF2KtoVCxSQxs1HUK6FXV7iUNiGfw==
X-Received: by 2002:a05:6402:24cf:b0:6aa:f0e:a150 with SMTP id 4fb4d7f45d1cf-6aa531dfb4emr1718023a12.42.1789758317393;
        Fri, 18 Sep 2026 12:05:17 -0700 (PDT)
Received: from petegriffin.c.googlers.com (116.118.90.34.bc.googleusercontent.com. [34.90.118.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67d816b5sm276250a12.7.2026.09.18.12.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 12:05:16 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 18 Sep 2026 19:05:02 +0000
Subject: [PATCH v4 1/4] dt-bindings: arm: google: Add dt bindings for
 frankel/blazer/mustang
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-contrib-pg-pixel10-initial-dts-v4-1-745eaca28b1a@linaro.org>
References: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
In-Reply-To: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 soc@lists.linux.dev, Douglas Anderson <dianders@chromium.org>, 
 Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
 Brian Norris <briannorris@google.com>, 
 William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-serial@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Brian Norris <briannorris@chromium.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3553;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=qo8jkdcJFEHFTzGipPaUfZqW7W+79EGKtSF4WXhEUus=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqrYtqI2pmcS8DDE15Y6kLwU7Rls+/1BkckMKPo
 1Ot3huXeImJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaq2LagAKCRDO6LjWAjRy
 uu4WEACH/64PfEIPtlHF7mRZllDo+OtwGJokTDnXIq9Qff9FceYZHWhpnrIij79Q4IvnqLKQAMJ
 9QUNwYM2QD0AZBVywRUMXoKcJirUVT/6tAyYdVRGV7opieMmVo32VGG1FKyManKxe0zDeJRm4cn
 idREK2uVNNYklZ7J7ybatWZFSNS0qzuwscARZkDGkLidNnX6+lxus8ybyQFNKLIphskjcNLMn5X
 QsYujQmfx67gvId7QtqWa5vd7ty8NJpqV2AuRe3Qt1KfS3DRrmAb0ItUiMA0UNJ6ufUD44FVeks
 BLTaKdHhb58fifcbNqBW+9C9gj57kI6baTkNQcMqUxNIMdhT5hgDc5645uJrMxQZjqqwMS8P6yT
 Ti8fIfIMiAvm1zMf6KS3IrpmEra10kft4rXnxE+ZIeCBhZd/OOgd+xukNeDD9Zp+F4mEujCcKwY
 s1aldXmYHXtJn5AeBfH/9FYfGRMnfTQU64UCYkWh2BVZrn+Uc87+v98hBKMKxdSaMdYEer+FHM0
 fVoKJS4hzL7FVvPOt6gj/J0rmjihNrps5PwgPhaMd2+hCA7PqOvqydbUOVGVzp5+QX32OjNG2Ew
 4Ah9gStCKArRUewp6eDUvgZcIkA/cHm5DGckYUKrqHC5d1KGpJJh/YofOhaGOR4I1smCLyuIl9H
 AsrzGSuaJ0q6J9A==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Add binding documentation for Tensor G5 SoC (Laguna) which is referred
to in code as "lga" and three of the boards that use the Laguna SoC
Frankel (Pixel 10), Blazer (Pixel 10 Pro) and Mustang (Pixel 10 Pro XL).

Additionally update to use a more efficient and scalable way to express
the various names a SoC is known by.

Co-developed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Brian Norris <briannorris@chromium.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v2:
 * Update ect rule as per Krysztof suggestion
 * Remove all the pre-production variants (EVT, DVT etc)
 * The equivalent patch in the previous submission is
   https://lore.kernel.org/lkml/05c833f0-15bc-4a86-9ac4-daf835fe4393@kernel.org/
   but this is now almost entirely different diff. I've added the
   co-developed-by tag as I've kept the more efficient way to express
   the names a SoC is known by.
---
 Documentation/devicetree/bindings/arm/google.yaml | 48 ++++++++++++++---------
 1 file changed, 29 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Documentation/devicetree/bindings/arm/google.yaml
index 99961e5282e56..b5977e20f3937 100644
--- a/Documentation/devicetree/bindings/arm/google.yaml
+++ b/Documentation/devicetree/bindings/arm/google.yaml
@@ -13,27 +13,16 @@ description: |
   ARM platforms using SoCs designed by Google branded "Tensor" used in Pixel
   devices.
 
-  Currently upstream this is devices using "gs101" SoC which is found in Pixel
-  6, Pixel 6 Pro and Pixel 6a.
-
-  Google have a few different names for the SoC:
-  - Marketing name ("Tensor")
-  - Codename ("Whitechapel")
-  - SoC ID ("gs101")
-  - Die ID ("S5P9845")
-
-  Likewise there are a couple of names for the actual device
-  - Marketing name ("Pixel 6")
-  - Codename ("Oriole")
-
-  Devicetrees should use the lowercased SoC ID and lowercased board codename,
-  e.g. gs101 and gs101-oriole.
+  Currently upstream this is devices using gs101 SoC which is found in Pixel
+  6, Pixel 6 Pro and Pixel 6a and Laguna SoC canonically referred to as lga
+  found in Pixel 10, Pixel 10 Pro and Pixel 10 Pro XL.
 
 properties:
   $nodename:
     const: '/'
   compatible:
     oneOf:
+      # Google Tensor G1 AKA gs101 AKA whitechapel AKA Die ID S5P9845 boards
       - description: Google Pixel 6 or 6 Pro (Oriole or Raven)
         items:
           - enum:
@@ -41,14 +30,35 @@ properties:
               - google,gs101-raven
           - const: google,gs101
 
-  # Bootloader requires empty ect node to be present
+      # Google Tensor G5 AKA lga (laguna) SoC and boards
+      - description:
+          Google Pixel 10, 10 Pro, 10 Pro XL (Frankel, Blazer,
+          Mustang).
+        items:
+          - enum:
+              - google,lga-blazer
+              - google,lga-frankel
+              - google,lga-mustang
+          - const: google,lga
+
   ect:
     type: object
     additionalProperties: false
 
-required:
-  - ect
-
 additionalProperties: true
 
+allOf:
+  # Bootloader requires empty ect node to be present
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101
+    then:
+      required:
+        - ect
+    else:
+      properties:
+        ect: false
+
 ...

-- 
2.55.0.1082.g2b9226bbc0-goog

