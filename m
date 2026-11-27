Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780925;
	b=4ziwztsw5FxxLJrGu4/fH1sP5KuErLtxgQQ8ezctrZPOj0lzY8/nbrMGWDArGH7T8/EC
	 QwXouide1cFnLaqH+shP6XqY0A3z7+PGqg4wq+MIDHV/J+nnY91kbRUb/WMpIExTyP4yh
	 hfrUrir8tqyWDCTV7AqKGhwcfgj387a9x3DQKxsU286TE1y40HlqmbP+E3WCieyXJQE0/
	 SlfeQiYBEM6eOO2sm8CsRvbHY9iMkKCwmGNxy9PXOA0aLDnGMDzUM/9wAGL1I30RZlCvu
	 ErlNgIMASJTDgB4uIeW568hBLW9n9CsV31gzrMFXtt5clIVMhsRJCgBWPgfh0d6vUdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Jf5GtpRuXRchR2ff5N5v4AswDiRdBOtYpnk/23HLdl0=;
	b=uTQggcLaAF0o0YTIdCfukUfLnBztO4EssB7CPqJcjbmYtiUiC2cLBUiiXBbDT1rW2z3y
	 2kkYACN5LylLLUmTHLcD3k1tNiqvhOc5ilivQh6Ql+Ylhup7vTDA37z3kKO0LhM8HxwED
	 Lagrc9qVlonU42x7UBunr2Oc4eTY1DESn7aq4EiOepDZLTqZecwI86/Hl5g1Vw5F1rxyY
	 5sqbh2/Tgc/hxa8G/YSdSH1Oq8r7xMPItRvd2CTh6nps0sfqNDyeSnOPnwHtNKCLnha6b
	 j7Q6QRUxMqwxZzPptKoQ+27KFffmTTrTsoFQHKI1waTQDkWmGaM4uqU/1vK2aeZNbsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xG8UIP57;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587F6606A334
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 587F6606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xG8UIP57
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so54733055e9.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780924; x=1796385724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jf5GtpRuXRchR2ff5N5v4AswDiRdBOtYpnk/23HLdl0=;
        b=xG8UIP57aQAh4LxxzZJ/TvkrRYPWeefgdJwtmYMs7xi6VJp4Or79E0tc8x+MfDB8IZ
         omaH8nlF9TBaEgC5gXXs3WkdnZdsY50vtZNhvKHnOFjXaBbEC+dYyHNhskpsbcNPhZOs
         okqYTJi827WMMzKYQ4/LvZnCP2LkhFMOStqPk/taF3Icqr7QBdA7iEK2PBTqzdrHVB2P
         mlm/6sPqd8sWJ7TR9oYOphDne76uC3brOhDW5JwVrjMD+OxxO4keMSi/Dq6Td0XzAWCe
         teduCj+kP7ZNVp5O+KFt77phDc3sjvQIHEKt/iqEGiygCbdroBkYQCtutIQIPWvw+i+S
         3Wbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780924; x=1796385724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jf5GtpRuXRchR2ff5N5v4AswDiRdBOtYpnk/23HLdl0=;
        b=ioP7StFtk1Axue0/PKzzV0N9vCu4ChgbdZIQYen0sf13UWFGpy363aVQucq2v8LScr
         4Wuok4P5mZrQfPfIVINO3Okuu/jkM3BdKEZX7bfJ0Q4X2gswROKSmfLV3+gSgUHTzA0r
         gLTCEaeSkdoRaChkz0KHfoAGK9ndI3NpyFl+6fpU2dIdcwIkIOJ292MGpo290UEJvvZu
         cfJJQUgj8YFwLFMKnOWn1JgsJbahS8+hu17XUVAzeTJbRUlVUv45qvtWS12QcuVCgbc5
         mVzW3sRnYzIpZtnsv3ZLVNHZ0VF6MYilLSrZPWFxKHKxLsyT5STnXc96fEgfUeAkoylk
         cP9w==
X-Forwarded-Encrypted: i=1; AL+hErFrl3DlrclhlVsxnDSXRtlOhzCZzR/a4o0E680HDa85OKj4vyduQAOsyDbtWfnF2BkWKSFpIWET30lI@vger.kernel.org
X-Gm-Message-State: APuU4Z+wIH3XhAk1QP2VPDl2jr6T5mhAQtsyp+c4eX7ZswtdES496Az3
	YZiN6vEIlNFlHVkizGyRpO/08MWljGYat68FkuiCtaSbLqGU430QpEqS
X-Gm-Gg: AZFdTZcBmOyl2ptkbGXFfiR6c6wXboMAoPsb/2AsZuwVuW0U6tq25m7tO/13KFkquQB
	/iqgknCqLaIerFnHiecMVMytO0kJIH1HNVGmdte2jqqPdIwtXy+PPDz4iJV2v29dnRg7w2ExIAH
	dwtEjnGmNKrH6aQiUmOlSFxhxOpeNgFKdTkkP335gYheLuZkYUQTE88NIrAmqz2a2KO3Sc7VH82
	d98kSbQTzWm41dCC4pYPI/910ItCHnYlu2tl9BK2vytaTDufCsiGmhemKDB5bdL140UicNwVhIb
	Ox9amRYlfvKfK4xK/WrfWl+VwYNta01N4ebfgp0JWiM/Uxn/9lshyOcE749876kZYebcaqf9IUl
	BC+nEwcr7MAo52qSP8vMZz+yB/TO+P4nasVnYUZeYE+Vi/ytDH/d6zRYyfhpix7Rve6YMutt+QE
	6zcRiHZ3d8vHQEpFMkRZb5QuYClEdUZes+PgCmL9FQbbyaYgkhFQo08pUhRUojY1tPqFQez4m3A
	HGo5ZaOyVw9EYXakOR6X4IAsLPUeqMOwcrHMp3S2sQx+aYghqOlMx4f5ZT0EGJ1pVwiAkwnKOEn
	z7DTfskISiEfEMOxrSG1QialpRkGNKlBCBTx6Qj+8kWZW9Y=
X-Received: by 2002:a05:600c:34d0:b0:4bb:6a5a:7839 with SMTP id 5b1f17b1804b1-4bb889428eamr488791765e9.34.1795780923213;
        Fri, 27 Nov 2026 04:02:03 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:02:02 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v14 24/30] arm64: dts: amlogic: g12: add crypto node
Date: Fri, 27 Nov 2026 13:00:57 +0100
Message-ID: <20261127120103.1532882-25-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
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

From: Alexey Romanov <romanov.alexey2000@gmail.com>

This patch adds a crypto node declaration for Amlogic G12-series.
With the Amlogic crypto driver we can use HW implementation
of SHA1/224/256 and AES algo.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 3135566df880..df1383f86366 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1742,6 +1742,13 @@ internal_ephy: ethernet-phy@8 {
 					};
 				};
 			};
+
+			crypto: crypto@3e000 {
+				compatible = "amlogic,g12a-crypto";
+				reg = <0x0 0x3e000 0x0 0x48>;
+				interrupts = <GIC_SPI 180 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc CLKID_CLK81>;
+			};
 		};
 
 		aobus: bus@ff800000 {
-- 
2.47.3

