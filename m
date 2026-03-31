Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8978A3CE49B
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 20:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774987584; cv=none; b=jts12jQV9BRWDvMns4MbDGNjpYOAP4q+ilXDSZ1CnodySrSyoq3Ii9/ZLU8M3vXIFDC7xsfUvw1o59tX2KfPuMNGolrMy45yqtAvJw9NdqmU3uWW/D9Je6qbAfUy5WaO6P45kFq1Eu1Tr2JgrMGWFN1edR/Uve8B5BSt/xqEziw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774987584; c=relaxed/simple;
	bh=F2jd4YlfKNnvFt29JpBxPwcNHTeYzsN7X8O4lT8zPQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZqZd9yXa3+EYpVWZjgT3ZR2n2SLrxyEPaluLRUeRQnVz7ownW3HWovgjk6FwcPpE0hBQYcFc9gZJpt4NJsF3AoRmckMxSxbouYRJwf2b72TV87vpNzkVWqd6F6gKkhrsfAHOwLPwORXy19wFb+m/3wNVHu52XgbXa4mPi0LYuCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pjk/78Ru; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pjk/78Ru"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8a176112e7bso30050066d6.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 13:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774987579; x=1775592379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19KHAW1LNse1noQ76jOhTwQRI/f/9iJCwz0Ji6ODvQE=;
        b=Pjk/78Ru/5PeRhGeiZ8TQKT3NzKBydjqXqjigkqcm/rC/MnLG0kuLbrIz1/vSfveYi
         4/4f855idwUVJstWczdLVOdNlCcwi8m3LTG+oQpnSaSC4IViXBmtClUGbwxl1IkOj4x+
         YbdUH1vr0dBvVaGIiTLH0/AJzcBc/BdgjXkkKiDA96nGrp+n5pCtXOtuWy0qLk4Sz+t5
         y77DrlXhbekguX+UtfTFJbs9uLI/zPTKaUrBNCFZAbcwEpi/4DoqTDfDEhPOF71BGOPs
         FlZa4oCMv+1cpP4XCqdWBoOulddZbcpaV8jfGRqhYVd+nyojr9oAjTb1O5Z934q5lJm0
         +YwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774987579; x=1775592379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=19KHAW1LNse1noQ76jOhTwQRI/f/9iJCwz0Ji6ODvQE=;
        b=X/ZAaji230g5UlPGFcefO+wAPVMtd4jt5gjjcK3g9bI3qN7iLsLug0jfeAl4ofES7P
         mDtrIuh/G8Ie+s2O+s7DQqNoGcBaO1Q0eVUe5dXpFb6q76Sos6gwlOlybR03Mp4yDOYi
         G065ZRKSkdgeBpPPBeUCWSsjQyI/SCbpOQ+z5xu33tB+Lc5A+46/JO8TIU59CEtTHr/4
         p0MmIlSMMy2hAYhRFt+uJeeq21dekkWYDGiK3me3TfuuM97p4WFj/A2Q2d4tyA3dhicc
         Y+nyznT0O4Nv1mwFVUbE+E/RvdF1gqGtkflHYqwkGLmbw+DvUnjUGs9We6p34eIu22VD
         GBpw==
X-Forwarded-Encrypted: i=1; AJvYcCVC6JKJlSgkjQ42q70limzh4PxwRSGuWyTP2cnMARabVK+C7baL1CRzNDAXvwedni6x1LiMsND4HAcG@vger.kernel.org
X-Gm-Message-State: AOJu0YxDVFxHFQFQSb8G752nfPJQDQ1Y8eLEajR9rfcqCiiHs3tStB+c
	1IWv2nRdwMdgeVNcb6YB9UgbWuqsG+R2ofP9fIj5Dbr0arZ+qYKJWHu7
X-Gm-Gg: ATEYQzzed5l+e1yDSUde3iYMWOtsFA19JKjuJHTKjfPYaH7JKEpt75XJGG7KcchqExZ
	pZMl4no0TYzbPhRJ0MNg93kkgnI8MaOm/0V5EYVdV37KszjaUTsGLH06kWN+pTrmyMNgw6Ap/ge
	waYwt8lNsZjNvXPnPkyhPy5NbrCz9vN7WMIhgR+15LK6Hj/9jrghWTAB/sNvd5M6iP9qothWIk6
	rOaBrVlTZsfWFxqjhq5EYSu+vWwSlmfkiGqE1XvaVVwyYo6S6Yz9IBvNUTDimBXOXOcXblKscL2
	Bs5avv7eEs0389eLkcJMTE0Vp3AuDaL70waa8dKLivi6s4ZnE/9XRHYX8Maa0V7FIkDm4F+NTeN
	pVb3MgzNVURotFPzgQUp0BGRS5XzwmkXAPX0wLX2FvebaIaZfOQSlK3vLFutsBr/GH6TdD9PHoL
	d8PrQp226tC5CWhYZ/5dzRGlA1
X-Received: by 2002:ad4:4ee9:0:b0:89c:a2c8:9432 with SMTP id 6a1803df08f44-8a433d4fb96mr17415776d6.0.1774987579053;
        Tue, 31 Mar 2026 13:06:19 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecbc9e086sm100400496d6.12.2026.03.31.13.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 13:06:18 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 1/4] dt-bindings: qcom: lpass-lpi-common: add reserved GPIOs property
Date: Tue, 31 Mar 2026 16:06:55 -0400
Message-ID: <20260331200658.1306-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331200658.1306-1-mailingradian@gmail.com>
References: <20260331200658.1306-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There can be reserved GPIOs on the LPASS LPI pin controller to possibly
control sensors. Add the property for reserved GPIOs so they can be
avoided appropriately.

Adapted from the same entry in qcom,tlmm-common.yaml.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,lpass-lpi-common.yaml           | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml
index 619341dd637c..30f93b8159fd 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml
@@ -27,6 +27,14 @@ properties:
   gpio-ranges:
     maxItems: 1
 
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 30
+    description:
+      Pins can be reserved for trusted applications or for LPASS, thereby
+      inaccessible from the OS. This property can be used to mark the pins
+      which resources should not be accessed by the OS.
+
 required:
   - gpio-controller
   - "#gpio-cells"
-- 
2.53.0

