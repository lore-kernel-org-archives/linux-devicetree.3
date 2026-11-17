Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919191;
	b=HOswxULLEP4m8pD7S4CHAueafT/0ImTwhG595+wE1fiOMs6RSlE6tHMiTR8sMh0wKSKv
	 u+Tm96PErg8UnYLyMk5/HH8RyptjR+R3dvuZTFH8D9ZVRFVgAS0T4b8bTOIhyuBrzTIEx
	 DrhNop4IzgXddd7dQPWvpCr3xaI0vTadgu20SDxCtLouSHScq/nZQ0DuFvx8NRIfVai/S
	 pxlCN5YoM0s2ZIWSrYQUjuVfTyi0kCxRj9J/34aygefAs0WDgMcsOjH9i1+BBvWW7xhpM
	 NvWCKhmmyNoH5qsqByX3ne/z29qNXkHknII6Znz9Ec1TqsDe09fidxewgl1PiT4Li2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rwJM/btZEuTlA5fjq2BpjxzgulZAXHvNDImvE1z8MG8=;
	b=rhpzxBhrydzpEwoJ3gr/CaghCMYCCJWvbCptPEIJze+KwwE33yYEXV/O0zSr5bkqrS2W
	 /Z66eApORC3cYkS0UuUtqTi9aHmFWqDNLN6vmC7TI66lEuVWWDBc3IDGFEGiUwd/Z1HPC
	 O8IjJ0Len4efsScjnrdkgbUz0b57jXEzBEQI+1Pmlrxm8c57L/tOCzHbY3zR3utn+ZR97
	 pXxGZzN/p6mbTfl3uc9pixr6OnNAVSh1GYVKSIweIJelbPGKrAqmwe+GxT5iM0iJOjoof
	 n3ZObnezz7Uua/u+l6pmLSkGZyV6OQhsrZ1Xv57mjm94v9yez11VK+4KNa5YGl+VFaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p2QL0sBf;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EE4606A882
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 12:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97EE4606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p2QL0sBf
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so5647615e9.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 04:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919190; x=1795523990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rwJM/btZEuTlA5fjq2BpjxzgulZAXHvNDImvE1z8MG8=;
        b=p2QL0sBfCSrXZK7z69n/Xb5ZdxxmzCyFRVDFk9wG3bCxvJeWlHMSFo5kACNIcbQFgc
         AGUGL9NwLq2UbaN39WK9LRWGrJy9A9jWBfhVlV7JIIVmIyrjHqDqIYzWNpo9+doUSEE/
         b2op19hmatQWsUEaoBJuZk0hAotqj4jEHwBiDmVlsq4qOmZ49EdcctCVV8pQzjYeuD6+
         Ls3mkpF1ZAoJpETbTHVANgq7VQfCXs/Yv54qoOF3Z6ImNn88EGN7MDc1SU0RHRWLKE4q
         GVe86wbn+mRFXQQteW/6yy/qNXoWf0sHWfr//IuZMSJlc+K44K9rVevgEP2urq3qYHwf
         c8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919190; x=1795523990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rwJM/btZEuTlA5fjq2BpjxzgulZAXHvNDImvE1z8MG8=;
        b=GuQGZzxLC9l++J7m2EAfvLcxnCgpFlm7ow3u32f9gWRL4XhYTXlTfoDDj0J7xCpzub
         SFJ3qac7B7Am5KzW6IbHbhMD9ul6WwB5VpfLcJF8abeo55tzaDDMZi4AmeEb0NePf7y6
         dwu041jnRvEidGS1F8aXI9Q7ab6XR2LwHs4zYLHde2xuuOXwcwqGE1yDbhN3gzsVZCKj
         HjcImdSfGcM7PZyfkiLBYfgr0dv1V+Y1+8m7chP0QrFnsXVdp1pVvbXZdc9WTcjWIFiL
         l2XmbutQNGM27X9CUv5faywc9FK3slw4Lu2SvBXx1Z+QgVDK+MLaR7xxkiV3qQHDqxu9
         ipXw==
X-Gm-Message-State: APuU4Z8JF/gQc1bopE7X2iYT8d2VT8AWWJYgbXxWsVttJiZRvoRV7FUs
	U5Q3wMT4n7V2INqL6oeQS+Do3VL8Di9IEEdg+oq205Tc/Oa/yyYrSWVG
X-Gm-Gg: AYBFou3+XEhm5Dgfr4iy6jBLv0Pz1hZ1aq5vGT3u6jyMhw7RyW20HhAJIYZ/w/7/+6H
	UAR1GIah0GTcqrZS3oG9/ANWcyTgxcD+Mlco+zXOuRwFuzlnjgvuhq+LhcW2laEzJxe60bv04yL
	2gwdzg2cqY91/rzOsEuGq3DlW+Dxhw+rID8xXMH3SGPhGi95k+4Drq4yklo//EMxebg2CYNJDS0
	N6KziE1cK1ro8hA3Bm/hY/qt1d+fYJf6lBCBeg/0tEMgYBCrtIJwZ2qV/6bp/dAjtT+owT/GCsp
	xoA/tgBsxKmM5ZzvSTIzTVChl/SetUAwdMQLGEglD3/r5LIJLLEiRIKUyuAjfeO1Z73vHHG7KC9
	xuGNGWosnj5WD2EzX0o+Ss9nab2srZIiwChbFzV3RJCLFFKWXFMH8fBrhwLueigXEhnyUmrM9te
	DXbBNHbUuRqttPt5ybK8mIwhQSxkij90n5iMYck1ouVWGnja36U3j81+28fiKQjKhzoWHLdmHR/
	fDi2pgdA/JiNNEjlDnH/GHwQRKx7Hkf/Vd1AnYQipMETHbd0A2pY9R5BHQuIzmd5rXqwMcf7tDb
	0xK49Fp5SzSlLlZ8ci2wwnsyT+lNptgKQwdhzgqcTQmqlneRfSgADaHPYQ1JxBGop0KLl1rpXs0
	qHTw3WkQjk2R/5QM=
X-Received: by 2002:a05:600c:4513:b0:4bb:687c:4fbe with SMTP id 5b1f17b1804b1-4bb7837c4e5mr56003575e9.8.1794919189862;
        Tue, 17 Nov 2026 04:39:49 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (94-21-223-203.pool.digikabel.hu. [94.21.223.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm71474905e9.4.2026.11.17.04.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:39:49 -0800 (PST)
From: rofikkerneldev <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	rofikkerneldev <rofikcoga@gmail.com>
Subject: [PATCH v1 01/11] dt-bindings: arm: qcom: add LG V60 ThinQ 5G (timelm)
Date: Tue, 17 Nov 2026 13:39:36 +0100
Message-Id: <20261117123946.668557-2-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261117123946.668557-1-rofikcoga@gmail.com>
References: <20261117123946.668557-1-rofikcoga@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible for the LG V60 ThinQ 5G (timelm), based on
SM8250, and register the LG Electronics vendor prefix.

Signed-off-by: rofikkerneldev <rofikcoga@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml        | 1 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1ef..f8b34109171d0 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1139,6 +1139,7 @@ properties:
 
       - items:
           - enum:
+              - lge,timelm
               - qcom,qrb5165-rb5
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f10..fa50a81880f0b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -971,6 +971,8 @@ patternProperties:
     description: Lenovo Group Ltd.
   "^lg,.*":
     description: LG Corporation
+  "^lge,.*":
+    description: LG Electronics
   "^lgphilips,.*":
     description: LG Display
   "^libretech,.*":
-- 
2.39.5

