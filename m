Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515858;
	b=tbBe4RKjmXCHfaEUZZ/vv6DmUpnikqT4YtOIj5nvHZoDebZIwvO3Ht1zibzNfND6rk+s
	 Lpb9a0LIOURbMoRW5tNF87ktXI53XrXbACmodPLFZe24SRipKXXdfraUNGGbh4XG7B6OT
	 D1d+GSSAw3VjfcwgZJyGAqlrLceOSJBil2FNAOTds6zTJCRLTM7PnScIQ9PVIvQsYob37
	 DKaPDM/NfR0jOXV/WiCf4fQ7xgkpzzAvHuso6FufftGiPvar4eoS2OTRQlIZE5Td9iy4f
	 JwQy2T77UyqGYX3DFvK4/ceqqTy8RHpmgsCAs/J281gQXRVBRSjfQp9CpR6r381oxfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515858;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ilOCs9JW1eswWZldgI01PyWwMif6Q2IZWcYqSQMNIxA=;
	b=j4NDF9xx49vZvI5dtC/IDtbmrrFHzBckUdImEmvr0GLv5gYZ8QS5j4zCpARugj1K9UzD
	 bMcblLq8xCWIsUScYL1Io1peeKoYPK9N1TfKTPdv6rxmS5ip847pINh1Ou6BbQXpO7rpc
	 qM5WfkqagDVlXfhJdxbNybxdBBUtz+WvzVwKsOI37/SngJcWrvAXh4e4kNFFplN4TRX31
	 S3hp4dhhLhLQrI5v7mAMHLTI9G5xmcQSvFtv1xBoujEBVkIGvzBNcAPidzXPNmCWPk5Hk
	 K3PgtmRA0GUkNGSldYRWnJS1cpKEPiBF1D3r8A+3kOeFwEsEUTmy6TSKk/I2IYKSerQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=V+rMYEfP;
	arc=none smtp.remote-ip=91.218.175.103
Received: from mta0.migadu.com (out-103.mta0.migadu.com [91.218.175.103])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D9A606A324
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 17:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3D9A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=V+rMYEfP
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=V6YUdxWoTDNnXagrWvpsYWqhtgXuh09OxHBYpt8V1OY=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792515849; v=1; x=1793120649;
 b=V+rMYEfPpdixn7DUAqM0f7nVIQNQYqb4ivhnbZ6nr7ZMox6QJlwWWFMS2gRubbPmJrIoNfLp
 kWBRj1RWAieWO8DJEGFFBGKJbZLSYUYULAaZFtna9N0Hz7lNQc8rvl+iIMQqgCUDRjf1K/RDJSf
 yzs09BMC1YrcuV0O3QN05sh/0KjIx4Rq+EV+CgBCpmFmHNX5W+1bx9ZzGRTqYGlQom1a5LxSAnn
 XFRlU9U77fXLTfkORPiUary8PjzMAeigdrn5ohevnnV/krZq01+URA9VEL5FQPLB1bFJdDnMux3
 0dzf7fgUvIvjdbGG+I5p65ZD3Y9lnQwvEL+myflGVQ36w==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 22d13bc26f5e4975;
	Tue, 20 Oct 2026 17:04:07 +0000
X-Mizu-Trace-ID: 22d13bc26f5e4975
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] ASoC: codecs: wcd937x: add USB Type-C analog audio mux support
Date: Tue, 20 Oct 2026 14:03:24 -0300
Message-ID: <20261020170341.1641325-1-val@packett.cool>
X-Mailer: git-send-email 2.55.0
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

Currently only wcd939x has support for USB-C SBU audio in mainline, but the
older WCD codecs can do the same thing 939x does with USBSS, with an
external 3rd party mux instead. This series adds support for that based on
wcd939x code.

Tested on sm7325-motorola-dubai.

v3:
  * Zero initialize the device_node with the __free, oops (sashiko-bot)
  * Clear the pointer in wcd93[79]x_mbhc_deinit before tearing down the
    actual wcd_mbhc object (sashiko-bot)
    * Hopefully this is good enough to satisfy the concern about
      getting a typec notification *while removing the codec* which is
      something that has an extremely low chance of ever happening in
      practice anyway. I'm not adding an extra mutex for this. I'm tired.
  * Pull R-b for the commit in the middle but not for the other ones
    because of the changes above.. (prooobably would've been ok but well)
v2: https://lore.kernel.org/all/20261020082631.1509275-1-val@packett.cool/
v1: https://lore.kernel.org/all/20261018231244.1266926-1-val@packett.cool/

Thanks,
~val

---

Val Packett (4):
  ASoC: dt-bindings: qcom,wcd937x: Add USB-C graph properties
  ASoC: codecs: wcd937x: add USB Type-C analog audio mux support
  ASoC: codecs: wcd-mbhc: guard against NULL cfg in
    typec_report_(un)plug
  ASoC: codecs: wcd939x: fix ref leak and NULL deref with USB-C audio

 .../bindings/sound/qcom,wcd937x.yaml          |  15 ++
 sound/soc/codecs/Kconfig                      |   2 +
 sound/soc/codecs/wcd-mbhc-v2.c                |   4 +-
 sound/soc/codecs/wcd937x.c                    | 170 +++++++++++++++++-
 sound/soc/codecs/wcd939x.c                    |  21 ++-
 5 files changed, 198 insertions(+), 14 deletions(-)

-- 
2.55.0

