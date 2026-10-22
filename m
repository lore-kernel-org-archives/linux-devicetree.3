Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693880;
	b=3hQn+RSModFs8V3HwB1413Ew1hZ1X2nypC3LL4KBRMmG/LYK+U0NjcYYo8w5ZIb2RTGg
	 ddqz8UaNZdjnkNXhypuVKv7lyja1uKFoBL+Of/JigzKJVvLbCSmpdbcXOSfjWXxw20S0H
	 pmYq/lvSRabJBCDjEBAn52lJ4lbdo7TNUUCtZOWcZ7OHCFLMzovwdeKCl/8ZXzx4jjAgG
	 r4AwPYm+/tnXnH/ptmcedxVcaN7Syto8GGfwzUGJrnUUPciOcZLRcMYrm5qIfaB7sPm+e
	 ebf6Wv3CAvmdEN4aOoJWDv2wvRTBn475zCrpc6nF/eOLbP/MyCQOa6t5hsjg+Zr07Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=5W7z1rOfIZVI61tKSTk21lKhK4AufBt6SAL9admKOgU=;
	b=d0pvxlrFB155CXA3pxqM4dlofwRRU/3E3ttiG8rBnXcNYMl+Rgt33iGjUSxgYPT0zswv
	 Fr8JpsyCTqflf9FgVo09Wjn0QI9cA4OQ59STJdLzm5xDrMu6Ds0awfdMCQS0EZ6189L8M
	 GbS+DoFVjees5/xFBN8tD4+V09JVoCGloFPr05jUl62Qehnkad/kUDRr1volOBYq6SNmL
	 IY/hieoBtD1qsL14xWNTeRBuWcvYEKWAYLxHjkpTFmxkC2SMRyoQ72rTOskzbzGjm71XT
	 uj6tncew47+dxsVoCp8zq3n8wRE0FpSiV/JOnZj+pg8X1lIan4ZUVhez4zrbJDqZm9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=E6v5EUNN;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5BE60A2627
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 18:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C5BE60A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=E6v5EUNN
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso856875e9.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792693879; x=1793298679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5W7z1rOfIZVI61tKSTk21lKhK4AufBt6SAL9admKOgU=;
        b=E6v5EUNN+5BOi9tYzKYtR70MmG42qdv9hKstpdGQA/R+qVFpX4fMODz8hdgvjkGRHk
         FgXR3Sa9H5bGq8M1zhZ79ejs5k7OHLATUeuW+6kuLnM3Wc47IEsBcaVFzz5nn6tgwnWd
         ywohLLatJKp6MdAiwAVngN24lW1hlJo/nixyjXmNqj05zZ48Yi/3UFfGf9ij0doDlZg4
         XdFPqs1OeDaSFG12wHLB1c7h/x9CVQj+6QtVbVpjXg+qMTrBc5hKgP2T3NndVRX2gqic
         m5Q6+oHwGzsLPC6pVln7HNN++7wa4qEbH7aSl338o2nqUoxmIoKEeqroOGH4qxDw1hU2
         ldMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792693879; x=1793298679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5W7z1rOfIZVI61tKSTk21lKhK4AufBt6SAL9admKOgU=;
        b=afjGQDkdgQaIt1vWdcseF5h3mYoGhNb0a8gpb82xdCx5D8XV5oOVDH32wsUc6PdmDV
         PhtoID2YCmGeNs7u+Ckm3NzzcEVokyn06TpH2DAc42AzRKTsdMMd0Byncod74z8GZwER
         y48oqReBRFxz6rS2U/sKiRcP5W0WGwyqXPJJh9u8xQhqx1V0BS7wADK3FIv2Dm7m89qx
         lUitatNnyhNgna5wt7KE/jW6cwOWUZFasl6XTW7CvTVffFI2S2htx2TeK+PL2VGRD1d1
         bZ4vpebMWF3VoLm13DEa425DfzCJOFey6M0n6aEB0KZWoyvT5r7dI+aTO/+qP+zi2Avi
         Cb8A==
X-Forwarded-Encrypted: i=1; AKwUvBxtDTT9fsl+ICIPXImQJ5LKP4qH3pBn3y7odUefzotu0zHsBT59RhFPuO1C9x4exVJIIjLILazvq+Bj@vger.kernel.org
X-Gm-Message-State: AFq9FYIJYE1lkLgZpWU93fpFCbof7eveKCwR5MOg5iJec7qhf7fLXnq7
	PjJt50yecTjXiKdhFil6BYk8GAp43cVD8eA3Uf98NV6rlKx+VYv0eB5OnBi8nT2Qf+4=
X-Gm-Gg: AYBFou2BfTVpbDtRc5U620pRG1TsNHavnkRizLVfgwg9vgdjS31yPuQMaK2dRphIAL8
	yVgcp+SM8prj0dux7/K13eh9VyegG5h1SUPVYpOllV/3Igr8z2+Xs6gDxHR1KYbVXkM6JiFD6wt
	HyWxnMvz7lW3AouiVc7YdwEexr8ymd8Z2wsn7SZUdY0MMS1fl79wgg1lYXpIHnay5fzSSnfOLEs
	i4dpoi2hHFpoLJPdfTs7ZYARL87RWrNdUioRyB5ZaDodHJmcCYAS5mk9a4MWqfMQ6V1vG6Q3lHO
	e2sXP40PqJSyUILSxkZls5Z0fuCaRKWeYC/xYr3zpsqfaut5Fv/dtKV9UDMaS5778EjNFz3OplK
	XrZq7201AgiHsWt0/cJ9Q3VdYOTKQByfuXII5b6oXG2yqQZNmsWt1rLSPgAZjphzwe27Z8XVQuV
	XS0tC68JjtGWZmm7/8VXDdt1K0AZXgLg00GSdkWI7vInrtp48wF5f22IZDmSVDLs9Wk5G18+aYx
	ShGbnH0Kw0Xs+jxfPxUY+6fhz87NkfLgHmBPR9aNgm/q0UZi8HUtSicqrSoQyBafYMt/SCJU4NG
	GXcEvwdogJpagk4Z8itBjNxfmG5LFCP+1S4Hz98OYEYC4Pwh5zcpUaEJefUwi6I=
X-Received: by 2002:a05:600c:6094:b0:4a1:93fd:8f8 with SMTP id 5b1f17b1804b1-4a1fd89daa9mr116976045e9.4.1792693878853;
        Thu, 22 Oct 2026 11:31:18 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21143094fsm4556975e9.1.2026.10.22.11.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:31:18 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 22 Oct 2026 20:30:28 +0200
Subject: [PATCH 2/4] arm64: dts: amlogic: s7d: fix the GIC CPU interface
 region size
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
Message-Id: <20261022-upstream-s7-s7d-gicc-size-v1-2-8285053cf4ee@baylibre.com>
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

The CPU interface of the GIC-400 spans 8 KiB, but the S7D device tree
describes only its first 256 bytes. The GIC driver then disables the
split priority drop and deactivation mode, which needs the GICC_DIR
register in the second 4 KiB page, and warns at boot that the range is
too small.

Describe the whole 8 KiB region, as the other Amlogic SoCs with a
GIC-400 at the same address do.

Fixes: 1a30661c20de ("arm64: dts: add support for S7D based Amlogic BM202")
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
index 5593ff9e07eb..059a1bf37584 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
@@ -85,7 +85,7 @@ gic: interrupt-controller@fff01000 {
 			#address-cells = <0>;
 			interrupt-controller;
 			reg = <0x0 0xfff01000 0 0x1000>,
-			      <0x0 0xfff02000 0 0x0100>;
+			      <0x0 0xfff02000 0 0x2000>;
 			interrupts = <GIC_PPI 9 0xf04>;
 		};
 

-- 
2.56.0

