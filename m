Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579911;
	b=dN/CW1oyyOyV4aVqwyMEDNT0fSzeane1oZJRgWH+JHQR9xiHRfcixG8G8o7r39ClsNEW
	 VH5YGMoBhcv+LB5Crv0f7cmyU86dAQnSRCfckgrrrCNKp8KVedwhOb7AeGk0QDTKi3Px7
	 rFSo/CCp2pG0AMO3pfz3f+xtadn0QaraAxGWeeWye7Glb2ih2hNI2+C/QXZuV1KBusi1P
	 xKNs1xqpMmv86gysnxI52cd84wrdTwiP62YqeV4sx9le6+ba4zL8zgWyZv3bl4PwC931E
	 ANsZoWHYRBsw75QwMCSbzkjW93juj1PSAMBoWRRFz6ZSsxEc+XI+6jvQZY+ehbpGDJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LPY8vdhVi6Xj88wwWO8EGGblZmNfcIUJaJL4gRNaJy8=;
	b=jDctkxg+/YgHpGZfnWJDKm8RIQutNVsD3PBGm+leC39dfKr5H0fBel5qXx3HECCBYJ4u
	 Tk2Xb/IhQE/S62BsgE8NZm1pia5PJcO8hC0SMW1m1MDC0mQ5LU/F1JZ+hOxK++RF/eTPL
	 MDjCjwH79RC6ao8yfw2qA1oUJM2lIe0wq+PnA/gRxeodYbAxkLTL4u64h8yq5rCYsCl4t
	 RzQwnINjrliZnRtvy/40mxxGTEnpJab6kWsB1ecVcB0s7mTYRPcKRYoSih39LUDIzdOdm
	 JKsrPcp9M2V10rskeoMDbpOLtVfLM5eGYvrqBfLIPizprr5PAwmo5vLDkAkSdhlJSOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YogfN1+C;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8024A606A31F
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8024A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YogfN1+C
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so3994865e9.2
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 03:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792579910; x=1793184710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LPY8vdhVi6Xj88wwWO8EGGblZmNfcIUJaJL4gRNaJy8=;
        b=YogfN1+CAf8JdXWXwZ7r6WzUlJC6+9QrZ2QzvQ7egcgdx4YlcjZmr8Wkq9xMSirwrX
         TQ3akbrh2/vSRJO7DX6s/eGHPkvD7n3zkOkFJMTFj4IvhQAEpMrUQBJEPwa4oP+CzXuY
         vowBguEv9A5WkWSVU6lpkVFR6GWylkbKA1AmGL1KfURAgMOX9BIgeG+lJ0Q3YnvsVK6+
         bvInFcxanHjXF9lDsdu/eX5D4W9tKVUUSpJ90nfpnp2+oBi+QIGjPSVvqP0feb/LGVTU
         Bzte3AyM/xczq1BDIOsPD3Qf15Ssq55++QBt+U6CAhg6W54uPhdf5R+7R81UiF0BbWku
         jB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579910; x=1793184710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LPY8vdhVi6Xj88wwWO8EGGblZmNfcIUJaJL4gRNaJy8=;
        b=qTre82p/esqtkhg+sz5SGrrDKTNwM66Wa4v+vE/6kKP3uK+ROxwlVsO2cGHZkVDCAs
         HoPkpb5fR7ngCPiCgZOehaFUDO1VwmHL5VvFeSrDjXKlXHAE/iPtaHFzNdv//GJgJthT
         pM3G8dLOf4TcRHLOLqJO6JHC6m57Se/tNEQa36Kah1EHwPcKGoqp44jYEq/wVr0g1rV7
         ak0n1ea1AWF9t55PP0zwOnZC0WH0Ep7ngEB1oUBsmjztrpEcJyahUhcbkfiaGFX6kkbd
         VJzHfKqvkUUmDmZZhJ66ZyBqUHUkKaA684nO5Y7SZEowm0VkfDlpSMe+fk4uNhd5V0Tv
         j31A==
X-Forwarded-Encrypted: i=1; AKwUvBwK5PjXMCFEZrl9PY3abJQJBTHXa7fORf9dq9s1FIGAn2SCaED6rg/iZLZtp9rPdKxAY3HYMcc4uD9S@vger.kernel.org
X-Gm-Message-State: AFq9FYKAIU6IB8CkmdI2Z+NijaRqjwpg+SFKPke87FD/JnZgyAM3dJzh
	gpq6TgMHL1r8SlEyEfw75lLpRo3yYaaIWMwI+1FbBwB/VbSRB0nRp7AA
X-Gm-Gg: AYBFou1GyTbWV8c2klzUH/VqK6WzeU0D0Zni+mGeTcpEut2o3XHWPbPZMdbolG3Kvp/
	PFmD3sEIcz05toxQjFL/WVZBI97ihTslSwy/F3J0xxALStasprg2nnpUpdkj5zQEVeFPywyLa0M
	bqiFjKn2Vt/XXEJzgzXwqCuyl50iYSDmjT3c5pjUnJRZcrU9HYFjvFmerKEkCKsH8a3rmEBzi4q
	FrQ8IHvnTkBIkoFpsSC1OirXIY4Yerv15QVp90yWhiRZCb0llgHqq9d/AkjpOkftMuL9/6AsM7D
	R6C3CJPtoSwUKygbkwaOCFdIt+Z3di71fwuozrxWk535tUBYLt23QuHpOVBml0SoEyaKuB4+nkY
	/fnQ5bvUhVmLSF3gseJ84rZgj88w6C/KxQfhFrM6zyxWJNvzdKe5I+SQNIq2YpdRF8xxZDfydzr
	thCafXHI2PJ2j3ZFZjdzhXQL2z9bD9EyrHf7WIwlm+c80eX4k/uRetW2VPqyqPDyehgeCYRI3HQ
	fO4hgbk1+X2wlVHCISIf153j/2jInStY7zlWXfJmShDzLP1fkY=
X-Received: by 2002:a05:600d:4447:10b0:4a1:d1f7:bea with SMTP id 5b1f17b1804b1-4a1fdd1e568mr25614785e9.17.1792579909764;
        Wed, 21 Oct 2026 03:51:49 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm153388305e9.13.2026.10.21.03.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:51:49 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v11 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Wed, 21 Oct 2026 12:47:19 +0200
Message-ID: <20261021105109.199886-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021105109.199886-1-l.scorcia@gmail.com>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
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

Describe the MT6392 PMIC and its RTC and regulator devices. This device
is mostly based on MT6323 with some similarities to MT6397 and is usually
found on boards using the MT8516/MT8167 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..da534fa324a8 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -39,6 +39,7 @@ properties:
           - mediatek,mt6328
           - mediatek,mt6358
           - mediatek,mt6359
+          - mediatek,mt6392
           - mediatek,mt6397
       - items:
           - enum:
@@ -72,6 +73,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6359-rtc
@@ -99,6 +104,7 @@ properties:
               - mediatek,mt6331-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
-- 
2.43.0

