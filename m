Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32290400963
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 16:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870807; cv=none; b=MqKXCvnps5OdWggI9IVnqku1CtfY4qaZ00ZjtjzMJ7sJHdzjzdzLWi/nSoKSFmAcpVdoRH2r39fSEP4Z4g6G6vk0Xh+ghXOCZtxkfpM/PzHWifPpoIg/PlPaoiaJqOoj2hTBzzJL7+SvgfueLjwHSlHeY4KfaBHTUbJ6HIyCLyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870807; c=relaxed/simple;
	bh=Uvy6WjK33Ql5QDc+7YeTX2qUEcUUi+n12SinkXVNwt4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LiGB+GzJA1wNSHa86iG8xHZuQC4KsMAQ5vmxdsIkyiCMl44eqv4BpURvXb00nOoh5qPjEpZinP29Nb+I60Lre7yhiw+Zww5jtYu2ujwIsQwCPqS+XXlOcMU4JrpOi3fCHzYfmwYg+bCAFWtTDca3ia8UT3ovj4TOIxLtOF5YwPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=pBO7Bsh9; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="pBO7Bsh9"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so50718185e9.2
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 09:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790870802; x=1791475602; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=;
        b=pBO7Bsh9IFzkkBlKILArCt/rvzt86m6I/e+X7Ke77Z+YRJx/V6ye3h+zK48c5wZibF
         7AKkXlVNVskhz6S/NMqf/hQilX1fsaAKeQXpzeYKpJyICEdXqmgR3bdsUufxgNF+WaBR
         TbmMBtYBNZqHRUGIy8t5e+FsOFCV5BWrT7hzMqvOlHMqLjuSQ/4uEb0Om2UxVPw3l8Lv
         nBB9NPryXI/2mqYa9YfYk44mLD9XnTeWOxK352tbPFrIlnKouwc2qlnvlq/vcK//kmjF
         ESZIBxj/D0mmW5zis2x5/EidaW+QOrns70iUHtzyM/aoA5g1B/Db9ijtiaR+9oRSPazg
         w8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870802; x=1791475602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=;
        b=TYC+CftXfXvDeVrRL6bxflbbom3OQlo5rf9z10LUcowsLo4Zx3WEtVcqn+/zqYzYvf
         qQHZ+6svoYe9zzIDcYGQRSYclJYodgXIaF45o4Y771vBNurcRkXCLdUPRgmhj8e4XyjU
         WH1jq1ZtKtnVe78wrRpkRDWws0oEMS9Z9BI2EnIzwWlbVSlQkRvbtvtE+EMQ14TGpwK+
         y+JEIJAcv87SdXGB2mwRC3FvOy4HpiTcw3zSIB6ncPk3rE2Cs8BDhKVc8VquhEoZYipv
         BBQG0oG5LBIf99js8semWfZKL2AgKNfy6i6jGdamF20PyHt4jBQ8OkOMdWQyX0DegT9X
         vTwQ==
X-Forwarded-Encrypted: i=1; AKwUvBy84noGhRK64p4Kfwin4pLEY5oSjnIlo0Bfs6rUnEv5kD9LhE3kUQ1s+Q5rV5D1gPxJQPbQ6RX0x2oI@vger.kernel.org
X-Gm-Message-State: AFuF++lfgezki8yIg/CflOAzQipNYTKhx17FlBwhA8nbsDNznnJhBKTy
	mIbkOsW3iCZ/eJ1SuyaWL+fVL+bxMizgq8wEeqvK/3G3Qj+jPtXsEYn66hET9qjqNM0=
X-Gm-Gg: AYBFou3shuOjoEiLTLIUFcEJwTsLu2Xho5U6unMQbXIa1uApI+eOJnmrb69/+CNvcL5
	QruVMtuMJyGniTbigOziFvMeKxfQSjm49MxrzLQahFiUVS96MOKvMqMP9iKIotngr3pHqSlitJI
	2zhP8rrzTEDlqMP6d3HOOTW1tSYpmRE8wYmiEPVGy5j7fSxfN7NoYX7j8IAqvdGIuMHHfFDUXzu
	/VPdZ62ox9MGZzh/WRWh73B0jnFp2UBAmZvHM5szZYSsqfsxp+Tly2g7h1LSpVc6g9ierQLNssz
	8lx5+/1DzhZ2p14oOsGMvcNJUv6h21IN2wnMUL8JuhKyXNPhJNB+B6+HXYBqRSOKlpaNnsXwZF9
	Lq/NtjqG5fSe982zC1w1YbWK75ypkRR7qgEbf+Q0aUTe/Er9VUGGq4627gSJWCEfemF/fNk1pTV
	aIlPdQuIx4jehULzah71pP6QFZuGEsqDHEmBW08Pqe3c9iZKa/TBndiIyfnc0jlmdc
X-Received: by 2002:a05:600c:4f88:b0:4a0:f4:1c76 with SMTP id 5b1f17b1804b1-4a0274f9c06mr2153635e9.4.1790870802378;
        Thu, 01 Oct 2026 09:06:42 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.82.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f93ad0bsm52969705e9.4.2026.10.01.09.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:06:42 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 01 Oct 2026 18:06:30 +0200
Subject: [PATCH v4 5/7] ASoC: meson: aiu: add I2S Capture DAI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-audin-v4-5-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
In-Reply-To: <20261001-audin-v4-0-2476646118b5@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1725; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=Uvy6WjK33Ql5QDc+7YeTX2qUEcUUi+n12SinkXVNwt4=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFn7Wrm1f9gaFjtvOB16V+bf14s6N/wc0k7OqqtkijLI2
 LtgmQZvRykLgxgXg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACZy9h8jw2ahV0o2Gz4cvM/J
 v39B8Rpf3e9rvk+crWh+ovLufvW84BiGf/axdec3K0zd/V9/XmbNptbWxrTC+MPrdvuuXRT61rR
 pMTMA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Add capture stream to CPU_I2S_ENCODER making it able to handle both
playback and capture streams. Captured data is formatted from
"audin-formatter-i2s" widget, buffered from "audin-fifo" into an internal
FIFO and then bulk transmitted into RAM when the FIFO is full.

As for the naming of the stream "I2S Encoder" is kept as base following
the same pattern used for the playback stream and with the goal to minimize
changes.

Supported format for capture is currently limited to S16_LE because it's
the only one that has been tested. According to the manual also S24_LE
should be supported, but this is kept as follow-up.

This capture support also takes advantage of the following commits that
has recently been merged:

commit df3c987ab3d7 ("ASoC: meson: aiu-encoder-i2s: reflect bs quirk in hw constraints")
commit e82159384a50 ("ASoC: meson: aiu-encoder-i2s: use the core symmetric_rate handling")

They ensure bs_quirk and rate symmetry across playback and capture streams.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 535fbf7c1639..14d0e20a4bd6 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -153,6 +153,13 @@ static struct snd_soc_dai_driver aiu_cpu_dai_drv[] = {
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = AIU_FORMATS,
 		},
+		.capture = {
+			.stream_name = "I2S Encoder Capture",
+			.channels_min = 2,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		},
 		.ops = &aiu_encoder_i2s_dai_ops,
 		.symmetric_rate = 1,
 	},

-- 
2.47.3

