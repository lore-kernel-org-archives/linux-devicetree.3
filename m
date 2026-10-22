Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693882;
	b=os6U3Pb3GkvWxnibnlD/My+pRhIs6h1h51dnvGY69kviEbmHao+AiIhzvAX7ipktnpHp
	 jYHXz0YdigAUbE2bNKj90F2OXdsSZs79ssNsLiCeisI827cUii1uiluN8r7Xc//NmW1AY
	 NlOs8XJ4JfFvgRVQay64DyaR9EdUrjUSyFZes63TDmzE3SkuHNDvFcPt+QwkPTEK92ZS8
	 b5BjdovlP8T3GqYh7zb2kx1ckLJr1kWUe3nmpOAlraQCkbWJ6VALtSuNURat0aklkoyor
	 RB6XiYbwwLA9lPcMMk/ktCJ8e7aG/D3Ub/zE8nFyNIK23Rb+3/G3HIyeRJsvNKcsIOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=IJuRgpS46PrkIeywrDiw2DHESA2FABKs2wGEh7ENPpA=;
	b=hSFAllCse1d2LKnWIt4bAmB3GNBhlBmOKypAmz7pNPVCf6rcxZ5olEO2cBDsXwy5PFx2
	 uIvlrYmZbHTu/jqV2wP8hCPdYOsYe/gNyWfdNJ/xbs39ayexMoIwhV2FQNQg4NEa4/XPd
	 eE5IYECuuVP9XO8shauKP4DZbRpaSgWmg2+hxT9Yzp2Km7naoRDyuqgxxyDg5xI7o1pm6
	 GRm7+HYPvPeruia8YJs7xJBo68FXgR05Aac5xiAYynX0QiWQmC9ZhnoBa+gY+WH9AUL/W
	 qinxgnaOkVoz0aNAwIx9APzYgbP5BBMX1wNTOi2YfYytKCwrL9vHMkNgc1Xs56ykBjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KjKe+Bvz;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B03F60A3810
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 18:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B03F60A3810
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KjKe+Bvz
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so1058745e9.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792693881; x=1793298681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJuRgpS46PrkIeywrDiw2DHESA2FABKs2wGEh7ENPpA=;
        b=KjKe+BvzTptSN0K2ZmRLfVOyeFZqs8U5sGp16jW++fdAHsyQer/1PnfR4yfZ2lTeZZ
         FvJEpb9T+/Ofp+wHkOH7Wmltu/QgXkM6xlFY/s20AusszxB+cyPXJgI7dj0bttpcaKLG
         9kWJm6mqNaB0CTVojXgt9MEmvTWh2PFTbsbENTwsYGg/Vh28Ir+2t8towbuQLMt1EFWg
         Lqf7J5u44Bf+EVhhcN2FzIryqeY64QNWZqRNYRgfigOS0g1moYGP7yD4/vtd6Gp4cRly
         wLQnvFc7QlH17poZJyeFzyhJoPOrRqKukConU35IVFAiVA2YqahPfagXv0BW8SAQkzlO
         s2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792693881; x=1793298681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJuRgpS46PrkIeywrDiw2DHESA2FABKs2wGEh7ENPpA=;
        b=auUeXehSq8X7O8YBInNFqdiE7I09M0Co/ZIXD/udlMj2novbhuSczxtQsSSrUNn/gB
         wB5ZL21CSpvid1Faiyi2KDElqw6XOJY6BqhG/AdkQ7YrwOdy+9IPXL2ovvwJ9CCu3x/T
         qFLVevdT2HOE594wHeWbdMHxEP1kJ1TCn42nLxWT+F/6HMU7BAFmDbVjmc703IhMqrsR
         9DTUI1RACL4zYF9HapbSuqQdDAbXfRIVVKEhib8aD2pncxTuOgARJOzfr+KQrkvyoSeg
         D03Ij9UcpmPpCY8X1oZp5PFyy9gtN4pmBq99tXjJhnQodtqciFf4rSjpZIKNe0cCfyc6
         Y1lg==
X-Forwarded-Encrypted: i=1; AKwUvBxD5L+vtB0To3j1jP9h6vCpjiGnMPex8laQrF8RLrGngi/8qCgamozXmDlIHklqdHyTfGp0AB3JB26j@vger.kernel.org
X-Gm-Message-State: AFq9FYI50ek6K5RisPu1uqwyh2z/op5H4g6tOc6RBRSYOVSbGV75vpCE
	estLgnBl5FZt3az+SypqFTfCpQYoxJyK7Em3soy1xFP0VEcOa2ISdhhLdTWbsJFvUuY=
X-Gm-Gg: AYBFou13YoXaM7ysSEx8NgD3xKgtasMXBwnjX+UHbmYIXm0K7efdB2tBGRkGphHRwQa
	q6fRfHUTcKmnYhw1h0NlbiNF/qcVg8M6CKPXWKGtgkjVNFMppNfhlqHZGUxl/r5UDIcq7rQ6yLM
	ISoM0F70VctZYDyGf3Q6F8Lj2e+ixe1CsBoelCMXijdaoPgXlEmum1bKRZryg+aeQ6qeqybgPUw
	k4YHx9TYU4aMbwbbuDG9+lY9PiYkcn1L4kLl+3ACPpJLgFVQ4rhXIblU6N815ArhFByixhYez92
	2lL+FRV3lf4GmtDT4q3Ke49YmGSu3y8Nc0OSho2fKFgFp5p9tn/POV7zyZhqw1vlnbo+Uij4Edq
	x4cN7JHPyywdAiGOlw0zWsSnkN8hqYtMBsanyvtYEETDtkcv0QktFgwgxUUDt3ii4sneLFskKUg
	ClnjZtI13/CQfqHeJRn4Nvo3TNH7KKS3rxdRlba5rldjOj3/f22wk744cl5TSwOsxTpMrxjUYjU
	7HiI7StH8FFtiYvTU//WPb31zXuKDAJLmbMkUkm7e+UbWfX2uuwPlqN631NOVuJ1QULp4cWhCxr
	Z+jsr6vuNMPPq4TSgQbzGMQtZWf9saxfzl+mDLFCtQ==
X-Received: by 2002:a05:600c:19c7:b0:4a0:89:6727 with SMTP id 5b1f17b1804b1-4a1fdd2f2ecmr113114475e9.16.1792693880575;
        Thu, 22 Oct 2026 11:31:20 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21143094fsm4556975e9.1.2026.10.22.11.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:31:19 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 22 Oct 2026 20:30:29 +0200
Subject: [PATCH 3/4] arm64: dts: amlogic: s7: describe the GIC
 virtualization regions
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
Message-Id: <20261022-upstream-s7-s7d-gicc-size-v1-3-8285053cf4ee@baylibre.com>
References: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
In-Reply-To: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

The S7 device tree describes the distributor and the CPU interface of
the GIC-400, but not its virtual interface control (GICH) and virtual
CPU interface (GICV) regions. Without them the GIC driver does not hand
the GIC over to KVM, which then runs without the in-kernel vGIC.

Describe both regions at their GIC-400 offsets, as S4 does for its
GIC-400 at the same address.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index 89b75bec40f0..a337783c7783 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -121,7 +121,9 @@ gic: interrupt-controller@fff01000 {
 			#address-cells = <0>;
 			interrupt-controller;
 			reg = <0x0 0xfff01000 0 0x1000>,
-			      <0x0 0xfff02000 0 0x2000>;
+			      <0x0 0xfff02000 0 0x2000>,
+			      <0x0 0xfff04000 0 0x2000>,
+			      <0x0 0xfff06000 0 0x2000>;
 			interrupts = <GIC_PPI 9 0xf04>;
 		};
 

-- 
2.56.0

