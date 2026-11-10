Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794340380;
	b=YTvtXsthHo+s0Zh9afO8xjgQunECv9E+TtcoOPT3JeFDEPU9A7m32PZx4UU9PLSPtRjI
	 zqeNXDB1YNPFKSiD9N8Wv8zUg35fueMwO4MTfMCYDyGi3qn6qEcC6oWXlZHlz3kOMHmAd
	 qgVJV+vzLXskNcXPWb6Zv49m7jJjC1Uv/1nyoHMKNvjn10/3ddqqvog0wqEktXULA8SqZ
	 J6hUNBNM7WNITpHBYlZSihRsB9XafhnmRB/yMwHUJIu2K0D4Hk2gjL1rg91fysoilEaGz
	 aNc1rG46yCHT7evd25MyK/ozY52wy8jhas8Htx9SXrpVjM/O1RUykOUvfcxjNsJQ6IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=mBu26pyTeT9bETEg9HiE5XJ66rAa9mCFfqD+c+2OSIU=;
	b=Ph9NBPrmkSOl1OMwkK9bJLlwG+mZOupm9wH3u1u7mnvS5CXHkN0mJe+UYhgJDSWen5Kd
	 20+RYv7u+7WJH9I5JF6MLiU4XCn/KIRZl91sVEYIqhozodTzmDmIgR7nQqNzxha5mz4vW
	 SU9oKM/s/O3yM0OCzjpTtIrdEFLzcyZJ6LQxr8SswwwQiYcqQ7+CTJ0KCaHxE8K3sUUI9
	 2sywwujt1pqPbddMqc2ZHsoUlBH6z5TzOGFC7naeMFCZSynvIQnN2wEl36LrS3zPjLHpn
	 1m0vPZ+bzxjelyTVoFnAKEARIB5gXdHfz8c4VdExcOGWne8L5z3sAo9K+K8XrdQo9Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yxf+eg6a;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED8E606A32A
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 19:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AED8E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yxf+eg6a
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35159e0092aso242331eec.2
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794340379; x=1794945179; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mBu26pyTeT9bETEg9HiE5XJ66rAa9mCFfqD+c+2OSIU=;
        b=Yxf+eg6aCLVazkjeYAnLQAXiYKmoPEjlCBy7GqXizgRVvQRUN0Eh8hG8APhTHMXCpv
         fJPUdCCeVndvWT+k4iCNgAW25nB8CBI8bdCXA53n5knpT5XTXtwsAMkt2Glyuc5os2ve
         fbOmCa2YNQtFN4ZJhAPfEBmPHPHxkP1jcdNloq4HOPRHaChvQwQsbUHANZcTel3xcqVv
         cCS//yS7yzSEoylTqmCxV5pD3JAWtdfduOoR/IndH55U8k1Xj1LwOa2/KLuzOJLuStcZ
         ivG9tJSpThpW+FnTz80UqzYnqvW9OI3qzMSZSrFa+B0pfGNdv5n/IaMF/Kn7hzexcixJ
         dNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794340379; x=1794945179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBu26pyTeT9bETEg9HiE5XJ66rAa9mCFfqD+c+2OSIU=;
        b=L4oGxyan9ZfsOQ8ahDdBCdMuIFTXq0+EaVbGk76Vl8Ob3jaIUaj3DlFR8B4tdFxMoX
         ZGoATI9UluWJvJBsnMXy3PXKP24if+BV3TnQYxc0sMP3QJg4EkxDDi4jKYbH48Wm1Pfz
         yUrCwb2/mfLdj55UFxfFBJupBPE0qjtLcGhEXG2HRJyaGMh/mwkGkp3QmF4exqXJqFPE
         i7XICRgZqxFWkpgwVOeEvJyUa7g5/MmYowZpDqYzDSioeyR7O8W/ZON28wzQvBlYc3Ve
         B6DZj73b9dAw1fjIWvDnnl2GAFYXc6fwNFESQ2NGFgtBnarvCDfd3ohGSUwRU2afpGU2
         G8Jw==
X-Gm-Message-State: APuU4Z9FRzWCegzNNLknWg7JbVmlwJ1UhygAVtVIe3TRtpLrDpq5Lny7
	9no67cOjaB1wkR42caAsm/gfTRIIM5jOqw2bOfhMowJRKSTd9ptJrxQj
X-Gm-Gg: AYBFou0qpmkl7+Uf0KYqS2mZ0BtCfe5tOF8VmaCSA+239OoaOx1AIDI21tgA+qvzlap
	jwGZE3X4L+aPG7bYD55BvpJ5RSpm047QCzxwJC05SgRFdOcU1BZ3n1h50mMF1/7Mlp2SzWk4gbL
	Ezu+NOLig5A+/YXT86xWH0zwbSk97TvRsU+96BNQK+eS8FWYbg4xAOa/sfFzqlv84U5odlTKPT6
	VNfvw5epRMkg4YfS0HAFf12YS0p+MsHpqjp12eEwPm9oFpLOMhz5TUMmIzJDFrW6shZCyxVJ5UG
	1myN6UpO7oaIZRAzxYHACKaj0YJSRE83ai4p+shYYX7+pSmC+igOJCwvGphvGxfQswXyVP+hp2a
	pVFhJkkbpy+JUuxRZKYeHyyXxyvfskJEnzTPt9SyUeMVrjYYXr9O0tY/dE9T1yFpJK7A1GVGmYV
	Ww+3ji1vx2Na9o0JdZGvE/CvdO3BukeZwZqkWorcnaRQ5y4LUUxm2N2xik3j+1xkXSc2aqP11rx
	2BYQMTDq9wzmNDiuITZQCgjwWUcE6G/daPmx31wCWkHL6UGkcstLFVSebieiVy8ewVJkCf2F2Df
	i7FvO7GXuRrKeffVSUIl/Uvcft44Ae2ZnabYH9Q=
X-Received: by 2002:a05:7300:7f01:b0:36c:a1bc:6114 with SMTP id 5a478bee46e88-3768076e52bmr664865eec.0.1794340378880;
        Tue, 10 Nov 2026 11:52:58 -0800 (PST)
Received: from [192.168.1.11] ([2401:4900:881f:d9bc:11f3:620a:3333:518d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm8834225eec.11.2026.11.10.11.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:52:58 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 11 Nov 2026 01:22:33 +0530
Subject: [PATCH 3/7] dt-bindings: arm: omap: document BeagleBone family
 board compatibles
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-ti-omap-dts-fix-v1-3-19022d1ff4b4@gmail.com>
References: <20261111-ti-omap-dts-fix-v1-0-19022d1ff4b4@gmail.com>
In-Reply-To: <20261111-ti-omap-dts-fix-v1-0-19022d1ff4b4@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Mark Jackson <mpfj@newflow.co.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, Bhargav Joshi <j.bhargav.u@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794340358; l=2011;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=HFD7yxMISHUSRTOxRHCJ1DZNRBnsW4DxRdCeVpvA1IA=;
 b=KibNFDfdnzCmfgogghjKl7j+PawBFGlgfn5VQEmbtrmRm7DHebL62iSv+m8SOCRuWuKBHnKyR
 Z1WMw60HA2JCIUmp8yPwla4WC/hU1dvfp+/XhdSuMiyZBthF+Hk+4k7
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Several AM335x boards derive from the original BeagleBone or BeagleBone
Black and chain multiple board compatibles before "ti,am33xx", causing
dtbs_check warnings against omap.yaml.

Document BeagleBone family boards (BeagleBone Black, PocketBeagle, Bosch
SHC), BeagleBone Black variants (OSD3358-SM-RED, SanCloud BeagleBone
Enhanced, BeagleBone Black Wireless, BeagleBone Green), and BeagleBone
Green Wireless.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index c97eb4953ed25..e0af554388669 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -159,6 +159,34 @@ properties:
           - const: grinn,am335x-chilisom
           - const: ti,am33xx
 
+      - description: BeagleBone family boards
+        items:
+          - enum:
+              - ti,am335x-bone-black
+              - ti,am335x-pocketbeagle
+              - ti,am335x-shc
+          - const: ti,am335x-bone
+          - const: ti,am33xx
+
+      - description: BeagleBone Black based boards
+        items:
+          - enum:
+              - oct,osd3358-sm-refdesign
+              - sancloud,am335x-boneenhanced
+              - ti,am335x-bone-black-wireless
+              - ti,am335x-bone-green
+          - const: ti,am335x-bone-black
+          - const: ti,am335x-bone
+          - const: ti,am33xx
+
+      - description: BeagleBone Green Wireless
+        items:
+          - const: ti,am335x-bone-green-wireless
+          - const: ti,am335x-bone-green
+          - const: ti,am335x-bone-black
+          - const: ti,am335x-bone
+          - const: ti,am33xx
+
       - description: TI OMAP4430 SoC based platforms
         items:
           - enum:

-- 
2.56.0

