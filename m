Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793195963;
	b=cI2IPsqbVpBBQ6tHe/ZKQ/hI31O6ojgOvPP/9MNfRtWCjEOOCP/eEkt2t1SIx53gePF5
	 3F9glfigbVgtuxxiKK0uAQqM3DpiTjpAokxHEApLXGeWpQ3sux22o94B9ReYNwEkzoav0
	 Zy7bnW1qA1lxKDSHTPWGlkgn8Mi7A48oNZztlaXoY58QDjGLJHMyv2hiI97cgACs8vEVq
	 L1Z7A/ejgiLdrLySrkQGqBMw1XSROh6wmDjF/YkMwXmMk70iT6KVzAlyJaFpiCbXGX7q5
	 47VIemv2B1TfANcERypxdKSC6C3WNxXQsb52P0OhX4bUp9aKIS41wX56s1sE80qykCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=z4XBdpqyVTDx7Yqi6vugAln2ZDQbNUBV/V/PeOlv9P0=;
	b=vZY68UDp1kuqho3+2L8v7ODGeTbzlUxIL/6IfHmPMOb27Y9z0c/RvgwlLOx4rErqiZWG
	 UB60/NiOTW2JplRMVEtxW6yGiafxkQQKJDE3Byu0pLkhBNCnTvNq4c70yh1FpXYJ9kIEj
	 X21Er+ZTo6O4DUlGr0AJ0Hbv0Ep6wfZ6Xti/om55ayXgGiuALPR9k3bXY00g4Ti+xdIri
	 XlmSYJB2/awZs4QIDNchfIG/2BIZocEMSRDiJnGvNixG/BHid4cc3YtorGL8VLiFvqEsY
	 8d8SuUlQMu2YaG8vlIvg4itULGKf0HP/KJ9oYVQ83RJNr9RE7a2+gMEqZw3KaENf8aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=O5bU2g9t;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E9A606A32C
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 13:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8E9A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=O5bU2g9t
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so12455625e9.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 06:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793195961; x=1793800761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z4XBdpqyVTDx7Yqi6vugAln2ZDQbNUBV/V/PeOlv9P0=;
        b=O5bU2g9tAGNtcs25PP8o1bBqkcYL6qOuNmVDzlOrm87nuMneZEF0AQ1LOooHitR0XO
         NlDUWUMYi8rw7IvS2iRXP6iiGvbvHoy7zfPfiTj2eoW+Yt+Q68akRV2z/MSka2+UEDmJ
         WOFML2hZCOgjd8LDCFtVeXiz+9cXMUDmXRtYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793195961; x=1793800761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z4XBdpqyVTDx7Yqi6vugAln2ZDQbNUBV/V/PeOlv9P0=;
        b=ARlCQg4NTuXSVrZhNhtifXAIneq8lKbfXoYYZ/2sgX9TF10SBt27HJqEehB8T4Wlu+
         b7NRYMCSWALNn//wmLHMlB9CLqCDkqaN+SEwzQPxe0ffigGbkcEnsn+/YXq3US3ITGHs
         RRbqdQ1eh/gn/5+wtMIqsGPklG54vEEciGqyZo/n646gflw0UsCXH8LTLalF2HihbOXJ
         3qZOOYSZijauZd83MFe/vVQzolGcpx0CulJZPcTbRM/Zfkzq9OBjyBA/SCTKhC+u4De/
         V22Wn+s2UIcDTCTrCNAG1DVE49IKv5VvI8Ks50zxx3e44/66qEHnA8H3dRaY2VuRUxLc
         7R8A==
X-Forwarded-Encrypted: i=1; AKwUvBxqjeoZxrBbuROqRqG20ZYAKwblz7WuBBpukU1XaIzUYrbG/jm+xbbNbiY4rThuL3lFXQUG2VCZEE0R@vger.kernel.org
X-Gm-Message-State: AFq9FYJoWDmkenr3boTEyfpg3PShreH4VUCqcUiaflCCBf4Bt79P/TJq
	VVq7/Q74Tu01IDtAi/qFNAq3qQKgzym+YuitZUdndPV4eUjXh+CRLaxM56zb5eVgS3c=
X-Gm-Gg: AYBFou1sGeATcVMFBNrZ8JwgvfIJGW9IwVJA2EqDuvitcLwcQtPYfmRMzd6qAzRsAiA
	J1ZBqoMz9y5wMXettOTPJii3MsPRQwyzfpHYFf15v55RIXV2dg6l0yG59ETNtdQ2Qo4e8/MLx3S
	V2VMFAQEUlxbC7/aKDBP8LNimUxuSRvToeL/bLb7W40vklC1M1iwUsLQrIMo7+bG3t5M4FaaCE+
	Dg0tEsw0641x6Uwuz+1yzhlC+sMCB6mfbvPj6Yol98LHWVXYsClwHphuL+hTqprD9XHyRm2pFQF
	tOMH6b50IrU4u033LWbtFj+HUZJq8g4LmmVkUt3qwn78UY77Di/DgLEkvYILhjMgUOMGg3BE46u
	+l4RFFtRfx8NBqo9maHF/KDLnshHfQPNvW7PfJbffJc2cyrSHnEpSKy04Vq0cX0nl0+Mlv3ryQs
	by+l7UK5EaOJDuDHT2pGbvvXz7MBeH/3DKurCvczZhCkXj4DAQSOk9nzN/8W8lWLv0PajXxMBOz
	9BIRv79pRcOcb5UFxZTlpKxUyION7ZGN6YYj3jmfjXuyW2ngGKEUGRAuQXHkJwhHmcoP+R39Mff
	0vY9Sp4cPMUtwBsiltMslah+XBxNUUnr6wtJsBW5/DRGgUdMjaUtZ/7uw5SqCxzWt54emNje59W
	Q5S7al766km2iCV1CH+3v8pEirlbDnWjxwih+A//8rFwuSSbspA==
X-Received: by 2002:a05:600c:8b05:b0:4a1:fa21:fd90 with SMTP id 5b1f17b1804b1-4a965ec95ebmr53037705e9.9.1793195961149;
        Wed, 28 Oct 2026 06:59:21 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94f05f168sm37077165e9.4.2026.10.28.06.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:59:20 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Marek Vasut <marex@nabladev.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RFC PATCH 1/4] arm64: dts: st: fix the Engicam RMM RGB display pixel clock
Date: Wed, 28 Oct 2026 14:59:05 +0100
Message-ID: <20261028135915.2665857-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028135915.2665857-1-dario.binacchi@amarulasolutions.com>
References: <20261028135915.2665857-1-dario.binacchi@amarulasolutions.com>
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

On STM32MP255/257 the LTDC "lcd" clock is a fixed placeholder, since
with the LVDS output the pixel clock comes from the LVDS PHY. With the
RGB output the pixel clock is instead the LTDC kernel clock
(ck_ker_ltdc). Since no consumer references it, the clock is turned off
by clk_disable_unused() and its rate is never set. As a result, the LTDC
does not run and every commit times out:

  [CRTC:42:crtc-0] vblank wait timed out
  [drm] *ERROR* flip_done timed out

Use ck_ker_ltdc as "lcd" clock for the RGB panel overlay.

Fixes: bc7b07bda4e0 ("arm64: dts: st: support Engicam MicroGEA-STM32MP257D-RMM board")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 ...2mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso
index f89641bdb23b..7be955be58ed 100644
--- a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso
+++ b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso
@@ -10,6 +10,7 @@
 /dts-v1/;
 /plugin/;
 
+#include <dt-bindings/clock/st,stm32mp25-rcc.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
@@ -35,6 +36,8 @@ touchscreen@38 {
 };
 
 &ltdc {
+	/* RGB output: the pixel clock is the LTDC kernel clock */
+	clocks = <&rcc CK_KER_LTDC>, <&rcc CK_BUS_LTDC>, <&syscfg>, <&lvds>;
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&ltdc_pins_a>;
 	pinctrl-1 = <&ltdc_sleep_pins_a>;
-- 
2.43.0

