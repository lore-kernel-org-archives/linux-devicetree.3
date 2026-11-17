Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942970;
	b=rmKpZtK5Okwehc4yiKpdOdBX2JISMm8+djZaTh3oqYig3w8IsqJDLuZ014muFlN1Rz7o
	 6ALTTYFFhr3IovxbZ4GWC9Q0ATuzSD3pej4WaPaE6CczxRGPKVQ1inxyEc0/EjX8B8+R0
	 zwSGDsf/tnwfuQv5oSeDDeBbIxVN5vrHUmYhh2K6eLSd6K1vM2RuuYqt6kj9pGJwswnAS
	 +3rDnC6sZ+L/7Ce2nCohCR0bruJp6roCrJuEig+c/pvDrPjOm+1n3V3Jl3gZLndSlnTSY
	 BxOZK7YNBRpoeWO6iJ+KsLt0zsXhNuFuqF/BK4/1EZbdJ3eHM+j74LuAcewYB1Uuc5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=4skSwwjgJ+QuhFrRzKzpNL0Sq3twAwTkr7WjFcD+3dw=;
	b=t+GbB/IFz+r4mbesiMFULW7yQERB50LBbGpLI/FzrvkrBK3PXHKPCAlXd5wEvBQWZMTg
	 MkEWX50aAjtmgsjdkncDSxZ+9RSH8ErtGTIbd7x9NHXatcU/6LytzU2Ix49n9PQNqkjCz
	 fxuV7b72hdrRQVE5YkktOGeZAGnPYJeFzJha2IBMOtSrDxzUi9PoxH1G7th0Pvi/auIDe
	 aanlWRbryMEMSBdd4N0qNpfEyNPk0o71NNDOUX5N4SCpGJyEOe1cr48AOWGx6FoD+0Leq
	 8qFkaJ46rLqAKnWvF0SRjVkc72U3h/HpPpXEjnreoBDTwEtf88EySmP9rSGOweVUakQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=X5H2WDaB;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5905606A33E
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 19:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5905606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=X5H2WDaB
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so62929f8f.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 11:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794942968; x=1795547768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4skSwwjgJ+QuhFrRzKzpNL0Sq3twAwTkr7WjFcD+3dw=;
        b=X5H2WDaBLf1/hp+ykf52OANmdNHeqPeAyMLtayjxq5QX1nmrphBnes4VKPPkFCrHI9
         1SDoss7Zk0PLk9qnjfh/2nVVRBz9FBcDmRshmggPBYUhWKmp9kvN+3NiZ/Ofnhf++Lg/
         F1AqQDRw5bfotsGccqFDKFGMlJFZmxTpsjCUaBL0ZUagR1Tk+lrhweaKQjA0eDRpvXVt
         k1OxXcEKFPVc+PBypetO56RMTXq6lpYmhHCBOkqtN7NXq6hNBD2KdqPiWnBR5jT7JtV1
         u6w8cDUa5jaDxMlv1/Hb27d4petCoWRdTn1EkYZeEmk39dZXAWVhlSdvKe4zuaXdHhtf
         XRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942968; x=1795547768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4skSwwjgJ+QuhFrRzKzpNL0Sq3twAwTkr7WjFcD+3dw=;
        b=fPUeDyH2taq3v1zGFZdoy2CZbSDhDwSYe+HFec0Jmjyl8g8v8UIxcnvun3bjkEeou1
         UKfZ5t8esBTcZQb31cHC4z3Iydu2oNvJaGJuPLjFslfUF76VNJagYPG88OMHRfKvDPa5
         dES1AXyaDZVVUWaEfKv2oCOafHbaxUxv+sTKjbAWZD54G1jbLiMcf3RYtE6gWeq284mM
         kPElZrpnJP1zcQbPLoxy11P97nHxu1VRx3bGSvWq8vf0p0tPWA/FRJJK9/VJ++CEHsFu
         5EfH+Kms+465pY/wtzy/VeF9/dJdwC+O/FvesIniC78DDJxFoCm7QpFfeT+/ylutNdlc
         Hr4Q==
X-Forwarded-Encrypted: i=1; AL+hErEdIwnAfBuBHqm+ZiLc2qKnn4bcfDAYIaujxB3R7xEH9WwAdl3OtJlA6J9GK20LlhdR0OcTqiGl9F1m@vger.kernel.org
X-Gm-Message-State: APuU4Z8sAu3+ndfqbO6tr0PmEZSIzvi/GZVNKe11Uayw65iy1TLFqctE
	w6ruspoOy1G6pXF2XmIxZzWbS634TlP++D0uxgfxZhdPsRhvFZglH4h3IKoCWoT6glU=
X-Gm-Gg: AYBFou0M8ejYH9PGsbmfOpDCqhrXQqLnQNKRch+OpKgc+PdDpsJJ7b91rRuL7i1sUTJ
	UMjUhoO2DgE0faJ7WJS4nTPAusb4BEdPnKwWMRjHELNmsLlSh09K0aP6ViNYQ8Sn0AMic0WUDnP
	VuBR2um2ceU0vEuszJgBFbGVozzKlExV7M/aSuWS918xkgiZY9ayrhMiO6/wgRqtsPypN0uULoX
	mM/swMF3QiTXU9gwwKBiLb1We29Pgp67O7gEBrdnmUdOMhQ5GY3XDQrJm5ZQL71VG6ftsbVb1BT
	vRvgh3Xk+3nl486vnsu2asbRA0XWYDeLi+j/uPXlYASg2PDv2CDDMmZh4X8ViLNsqQ1n0N2iQ++
	EbP6xlPYj2ip7xuJjWb6840ZS7FRp7EfwpF8jU6LIK1I4AO7JnN9pA7X4591Pg46KTEYDlqIEqt
	hbcDIb7bXD6V6CMyiDle1hPSzszn0BcwluIv5OhA0vh0l5W5GL3SRs8fTI49RrWF382gh3lWtTp
	9H85gKggzn7IUddnRhXN0JXE4iPaGpFP4E0aaYep/PTFOZhl6VTL5AFjg4jjcntrJ149xfmzJI/
	b/lKiXwc3EujkGzyyTQxYhtjBR4i513Jn7wpapS1o7kySp7DmqCsm0FotPY3E8J8VUPWDE1KCJK
	ADw==
X-Received: by 2002:a05:600c:3509:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4bb7d5d66efmr3616445e9.4.1794942968020;
        Tue, 17 Nov 2026 11:16:08 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b8032sm5658625e9.10.2026.11.17.11.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:16:07 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 17 Nov 2026 19:16:02 +0000
Subject: [PATCH 1/3] dt-bindings: clock: mediatek: Add MT8196 PWM muxes
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
Message-Id: <20261117-mt8196-pwm-clk-v1-1-d8725bcea9f4@baylibre.com>
References: <20261117-mt8196-pwm-clk-v1-0-d8725bcea9f4@baylibre.com>
In-Reply-To: <20261117-mt8196-pwm-clk-v1-0-d8725bcea9f4@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Laura Nao <laura.nao@collabora.com>
Cc: Chris Chen <chris-qj.chen@mediatek.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0

From: Chris Chen <chris-qj.chen@mediatek.com>

Add clock IDs for the MT8196 PWM source selectors, so that the peri_ao
clock driver can register them and devicetrees can select a PWM clock
source with assigned-clock-parents.

Signed-off-by: Chris Chen <chris-qj.chen@mediatek.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 include/dt-bindings/clock/mediatek,mt8196-clock.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/clock/mediatek,mt8196-clock.h b/include/dt-bindings/clock/mediatek,mt8196-clock.h
index ae0946ab7621..a8008fbf1713 100644
--- a/include/dt-bindings/clock/mediatek,mt8196-clock.h
+++ b/include/dt-bindings/clock/mediatek,mt8196-clock.h
@@ -290,6 +290,11 @@
 #define CLK_PERI_AO_FLASHIF_DRAM			31
 #define CLK_PERI_AO_FLASHIF_AXI				32
 #define CLK_PERI_AO_FLASHIF_BCLK			33
+#define CLK_PERI_AO_PWM_X16W_BCLK_SEL			34
+#define CLK_PERI_AO_PWM_PWM_BCLK0_SEL			35
+#define CLK_PERI_AO_PWM_PWM_BCLK1_SEL			36
+#define CLK_PERI_AO_PWM_PWM_BCLK2_SEL			37
+#define CLK_PERI_AO_PWM_PWM_BCLK3_SEL			38
 
 /* UFSCFG_AO */
 #define CLK_UFSAO_UNIPRO_TX_SYM				0

-- 
2.43.0

