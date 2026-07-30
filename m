Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0CF446826
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433448; cv=none; b=PXIcuMhbwbujGx2yzBgTAfNX02NRsvOjXXINKq9AFmOM0h8o+ojhd68MxjDcV/1Z7kQc8Vxlz6/JL0oTPPUOxO7miAEK6QGCctNMqtzSRPwDbmXgYC3zl1jMrTkbEEYYEqWAu/gqUtOJFwqMyGCsLhMfgtBGEbJ3X6EP3ak48D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433448; c=relaxed/simple;
	bh=XxR1zsjXquJvGPp6doBkikMoL0ZXC7DWLUtd/HUUeZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EklGURwk2t9yYq8vqldDqYcJrv+HAtmPbGkhwLeGT+meo7cMdihHAzo74NJsG29exyffspHYQE4YJyDfPxk+DZV/unIei94tCssDliddDB2b/VFmvFrdZw3FmB2gV4POWD47shu9uYch2T0kGhFlqL4CUUCE+yCL1oBv7yg3nEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AEkdeWiB; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AEkdeWiB"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51c1372f84dso209431cf.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433446; x=1786038246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TMHWykPqtxkLL6GTeb4aGCwDY8WgcFYj8yvcT4WAcAc=;
        b=AEkdeWiBohN8lYPsUnSx/EgBAGhADxfA1DFpzbc4eWizZv7+Wy1gtqm6lepGTa6NjL
         pK2MleCD9uzzmoWYEwzo0Biaq1H+w09DAP+98Awtk6OAN3qGGcwIkyl9iblLrgMovdhT
         SB9rQ8c++RhC5kfMYRRwWrkoBi+CLirhGyp8VG5nopw7ViV308U8uAewZfJ1M1cFajPP
         1EOXntdcp6MtN8rHwM7u2saCyNUNzWtoRFb9s19mWvw4NXdHwMLj7aZg+paW58UqBshF
         3cucf4dF7Hq9dEZH6I5Y5XGF+gFAKEF9hknJ+aXY1D6DQEVZvaT6OEBzFmzEPIhaGx2F
         k+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433446; x=1786038246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TMHWykPqtxkLL6GTeb4aGCwDY8WgcFYj8yvcT4WAcAc=;
        b=MD9mnRH5h2JeSBGnck764cDYzT2ek95BUg4NAou5D3JuPd2NPb6BUWHf/1iFdKCzKV
         zWikJ48QINZ600kQ3RKU6+w75+A0UdYrb4HfMrQ+E8rhbZxskMFq3ZQNci5cnty6CPPS
         FpFMFkSbeQHQQroPJVUFVf4eI8NQbkJp6Ihvvm83gzZSDAwPSNJ1GUuHUbOzuoFSjWVp
         mqdC7mlOj067Lz08IshbOwspMffZbIi+P2LHlOKieRZ5GNcSh+b47vVUVNdH9kCWZ+BF
         oOTntear9AY+iOMKpTULD95zIzT1ZRX10ue+eSvCdJMQ/f79VesxWofbq1IU1jNtcdQI
         pCMA==
X-Forwarded-Encrypted: i=1; AHgh+RqK5kI4S54qUNQbzSksTVCXdjo21j2/gizbLxK5oUmusbJO2AOo6+4KrYl4IgODjOpBXnd+gM23hE6a@vger.kernel.org
X-Gm-Message-State: AOJu0YyWInUs1smk0kguMrzbl816BWOq7Pm/4jECRBlbnmfR8PspAHF8
	1InYAPbqGqbjk7aHUE+rQUs4OGfTYc1a313ykrAxFCORdzoz+9uv/Ac9
X-Gm-Gg: AR+sD10Z5kSxCT0I+Jr8QFTTE+Pa5Ty8wxHGZ67YrOiuuUiK+FicYJLmBIQ6bQzioUL
	DoRK2jquxX4O88pfveBL2Y+G20V/6HmuOanHr+t6cUirB/2ccsmmjvAomsToMixRiGvm+r7qLqZ
	+aup9kic8m4R03v96UTJ+3f21+f4jalmT5lg/6WxR/q0SE1CggaNQ3SoeMLc+pcLyA/C8spT2nF
	sktNOAiwdefMLmJ8BehmzOEUyV/oZDNSaHvgZjhEJasq+4R4dhSH1w0Lr0e/2E5ZWy8RPbFUoiT
	t5Z8hGBmQsZDrOyUAiPEZytvp3m9rETwagYIWXiQ+iaU47lG483cOduPcVrPpkvjiMy7UQ6D59S
	FrAYQTOVWAGHZVES3a/XIU3d/6hX5+ULvVa8E+PLTJgvZRcyW/wzL8Hd/mgCpbEFtiVZ8s0MMJc
	DV/8Othdq+en7zdWYKTe4qSu2bTLGmtPgUPBDMNGFchwl3GrVsHQYsNvEKSko=
X-Received: by 2002:a05:622a:230d:b0:51a:89db:95a4 with SMTP id d75a77b69052e-52b385fd29fmr39604611cf.6.1785433445810;
        Thu, 30 Jul 2026 10:44:05 -0700 (PDT)
Received: from localhost ([70.54.57.80])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529e31f25c1sm47254651cf.31.2026.07.30.10.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:44:05 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v6 02/15] ASoC: dt-bindings: qcom: q6dsp: add support for lpi mi2s ports 5-6
Date: Thu, 30 Jul 2026 13:43:40 -0400
Message-ID: <20260730174353.108023-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730174353.108023-1-mailingradian@gmail.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are 7 internal MI2S ports per direction found on devices with the
internal sound card for Snapdragon 660. This is similar to the LPI MI2S
ports, and the LPI MI2S bindings can be reused for internal MI2S. Extend
the bindings for LPI MI2S ports to accommodate the internal MI2S ports.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml     | 4 ++--
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h            | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
index 2b27d6c8f58f..3b03e2acd67e 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
@@ -127,7 +127,7 @@ patternProperties:
               contains:
                 # MI2S DAI ID range PRIMARY_MI2S_RX - QUATERNARY_MI2S_TX and
                 # QUINARY_MI2S_RX - QUINARY_MI2S_TX and
-                # LPI_MI2S_RX_0 - SENARY_MI2S_TX
+                # LPI_MI2S_RX_0 - LPI_MI2S_TX_6
                 items:
                   oneOf:
                     - minimum: 16
@@ -135,7 +135,7 @@ patternProperties:
                     - minimum: 127
                       maximum: 128
                     - minimum: 137
-                      maximum: 148
+                      maximum: 152
         then:
           required:
             - qcom,sd-lines
diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 45850f2d4342..f0a6899b6523 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -152,6 +152,10 @@
 #define LPI_MI2S_TX_4		146
 #define SENARY_MI2S_RX		147
 #define SENARY_MI2S_TX		148
+#define LPI_MI2S_RX_5		149
+#define LPI_MI2S_TX_5		150
+#define LPI_MI2S_RX_6		151
+#define LPI_MI2S_TX_6		152
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
-- 
2.55.0

