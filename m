Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929A949AA47
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 21:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678969; cv=none; b=lxdrMXDNyWr+SYdl7fLk/EZ648RsRIW9XOnm4wn8Dd/FGL7KTcvsN9NvouWxs093YnDIUdQrmXNqkBpz3aHEpjrmpRMaD8OLfiYQT9zG0pyeGM8sa3tN6WDTYml3A+vfpd+BvhshxG3G0CpnM1m0pfebUJVfE7D0mH1Uaf1DciM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678969; c=relaxed/simple;
	bh=Uvy6WjK33Ql5QDc+7YeTX2qUEcUUi+n12SinkXVNwt4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PrvVUUpLhTVC+9m7LPHa1NnB7cek4itIR9iyXX9HJPGatoIpyhLUQLrS8do2FsDqTZbbiq/2bTtZvDsV5QBYweY7cdaqdCAyMMOfN2+HL12tH+1UAqT1xuRM7TxAyTGqL2JRyjZ4JhMIg84XcBiklvwmjAhbBBv68bOo0Ipv6eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Kg29WfOX; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Kg29WfOX"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so969915e9.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 14:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789678964; x=1790283764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=;
        b=Kg29WfOXjW0/kjOCVjKbclVDnPh3qxPBMr1GjKk08d9lkTd0rQs2+Gzhyd+xK+mapQ
         g3bfeddu9K3OLL/poxG2PsWSGTmv42okVppmbTUHWK29IJyWUZufIiV+QsaFJc9/XwlV
         TWfQDTZu5T1as5y8p3HWHNxJ3IrzVgQ8PWCNsRKrcgkl7LrCwR2j2TUc/REN43WBlzm/
         49/J0zeduwh263aK+AFcaQHN7I7Lk6WtLAGir3sdBGUN2tLE49dwSY7nBRIvBYzxDg0e
         wIWseMXZ1Hgc5EwUPVXAm1puHUla8qYB8bFqeLUAzooFjchpvBzKrGLCSg4iMMfWKgSm
         VI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678964; x=1790283764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=;
        b=OoL23O1BDk708RUq8QvILFAU4IZ3++lsD6reiC/mC7a+hg+ml83+Eku7J25A/Q6KOW
         Tuwk0nckItuyS6DzqqhFCHtRVQx2I8ahbYWNENNLPFhQ6GpnaNZuzDhb4uAbxKeCAe5A
         VR1QOhMkA5cG9fUG0zvclzyyu2OMFzHlsjHN1AyLOMRSRaALldYhhhFDp0JJE2ASqp5T
         CPgcHVTagas5QuDQsAj3JsWIN82ytZouchKroymQ3cbqAB4TFIwXcJSbxLx76cCfCryH
         YLW1HViwsXI7x6oA5n7ixFd3oilZO27eL03FxvRj0VU8Uyh+dGauwl5JX2yzSj/TN9v8
         PLZg==
X-Forwarded-Encrypted: i=1; AKwUvBy6Wbju104yql6jK5LLXZaybQZZ2zIxu4tWroiDlpMVY2llVEMVWjpJa6LT5Q+fvB97I0m9EFuyY+iN@vger.kernel.org
X-Gm-Message-State: AFuF++m6PQuMzrfShVQ+9hDfIiaSNk0ZlXmbib+qtGxQTBMfMZ5Z6KFl
	hLPC9oz6A799W9+C+ObRyBjaLIUjJdoWeMsNG5+yTMJ6ibeFfmZt7/a04f5P3hkN+tk=
X-Gm-Gg: AYBFou0zl7PPPE9RYPqIuuoDJZvXsLj4W+j7oqeaCikVKxmoKQ8YcZshzMey8Pequk8
	hdxccj5RlX/irrfX3dUtepFx0We1dXrsDLhXGQa0rHtBzs61aixapeNFJK/+/YuID/gzoRTn6ut
	zHyOWfpBWZH7on6Urw99DNYIpEg1eZWSOGH9SyxgLUvJ2jOPV5yo57QWOu2W649pI5f+ZZBFLde
	Mgsyd+AWDdIZkFyPvkr8MtGfxsGjb5io7GutdZueSoQ6dVbQ39UgsPufMCE0z7TWMcqEDp6uYW9
	syWW0pEA8zaumXXNHOd8igh4uXOFHw49+IkqGIXBzjctoMeJSqMuykYC65YRtWhLcApkCOmbxpR
	lZixIkBXCU0VCe+6qwogYdKaDmtsaSPpxOTY6dTzs0h2LcnHOFx/8OEf3SYdd3QAK8aU806BALk
	4Eu6r6Iw0p2Ba3vwJ+aQvtqgE2ltzhLsHUzFSXEIyHNF0WBiv1Mon+WBmc5lrwToo6FNFQ63eu+
	5ZULg==
X-Received: by 2002:a05:600c:198b:b0:49c:fc6e:8cbd with SMTP id 5b1f17b1804b1-49fc574f05dmr1574425e9.33.1789678963884;
        Thu, 17 Sep 2026 14:02:43 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm3106095e9.3.2026.09.17.14.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:02:43 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 17 Sep 2026 23:02:34 +0200
Subject: [PATCH v2 4/6] ASoC: meson: aiu: add I2S Capture DAI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-audin-v2-4-38de4bc1de34@baylibre.com>
References: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
In-Reply-To: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
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
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlrQnPVXXIkF19akM2yaANzTvkv5SwOwx05M15mSF780
 rfPiNOso5SFQYyLQVZMkYVl+r3fBaVqD40TThbAzGFlAhnCwMUpABM59ZLhf0BKUawkm9T3o373
 JU4++fdX5HWgZ7tPR4R6xFNtM3WhnQz/TBt0/F/LRDzrEImSn2DTeaBkfTLbsZcn2dRi5yVor2h
 mAgA=
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

