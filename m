Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484824;
	b=Z1am1X3/FUtCCeoL2irKcpu/KfmNneWRyW42FBnLq88sK2UuS1rctT4PCfCt3kF1GzuS
	 iouY7CoWE4LvRT3fil+j7k0OzgFRaMunnnwcrfvlJNA/9HY2EA5Vo6rcTIgqD4uCl89lS
	 Kbz708HDHtQpZKmex4z05XQP8CEtSlQmsdtdLgxFK1JQZSN993yVB3lXGF1FMvsIP2uLI
	 JB0hxaVQu4psqDrjv5Od1w8nDAN8Hqbe8yTVAdgY/c8Y9DuGB0YRwdP6WxPcJ16mqUtyy
	 zNKxIonN9yf7lK87RDVz0GVF3X1etYEOm5kOzFgJEPrcSpKAutKLq+38wemdoAldvLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484824;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=dBS4Dm4lB33zliDNs2vZO8pI4/MBUTstFz/T9XYJKOI=;
	b=0B2ZI2Ju7nt2BADxRo7Ua1j6blQYvV7jdrwTtOvwZeWJNtfkYoj08Re+4JsOEvMgJhop
	 TOakW1+6BGZTN9TV5Zl2GYm3Tad0aqtKWpcMrU4bHcW4pMc9sZHBZthlct2/h4+44c6Z9
	 H2xVqMKAd4QFzAVzt+mpB7jkgIc7B5cRwo38yH//0S8EW9F3H5LDRIoalmirdBkc+scID
	 I5pWDnrRvKgmfdQpghMr88C0fz/TugVS3PIBCS2nQnktQ8HQ0RCOTLyPhrNZ6gISJrXEv
	 d7BzG97ab3YOROtuNhYgxc18DZDYO2KAV87bkSIt6Gb1U4zHRKk1yN1t8N8H6RG5quA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=ftwXH7BQ;
	arc=none smtp.remote-ip=95.215.58.123
Received: from mta1.migadu.com (out-123.mta1.migadu.com [95.215.58.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AFC606A31C
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64AFC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=ftwXH7BQ
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Z3J+lTNEbNaLQ7VizdV/95/7mp/QZefx1QWIaDIcaLs=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792484821; v=1; x=1793089621;
 b=ftwXH7BQhMjiqs9c7QUTxoGOJC+t+4nEBBHC1Zg2xkLKGfrolDzhDq6sCN4vd2XiOQ0PT6Kj
 uSh/VhzQYgWAH1gcMmuXC8E+8jqj8jBqv2Hf9J2MJIw5Np6TZJH/FsAt+Frxi51BHNFJ/Zdn9Lc
 8GEmY7bXinAWJyUFEl4Pi9ptzwJEBxscv9yxr6dx5DiVXT7KL8VHLqztGKyGI6gPZy6+SwxKg8Z
 WH1Do/wWRJzK83jzTZCyV82YgRLdRQvjQXp24st1CWoYMpdXpaqmxdL/PBfE8/KKOcuE0WPvgv0
 S9mqiY2iytveknw4XggR35bQm+KiQcCfnir353YborVpw==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1103d2f00b62989c;
	Tue, 20 Oct 2026 08:27:01 +0000
X-Mizu-Trace-ID: 1103d2f00b62989c
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
Subject: [PATCH v2 0/4] ASoC: codecs: wcd937x: add USB Type-C analog audio mux support
Date: Tue, 20 Oct 2026 05:26:22 -0300
Message-ID: <20261020082631.1509275-1-val@packett.cool>
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

v2:
  * Pull R-b for dt-bindings
  * Add missing `depends on TYPEC || !TYPEC` to kconfig (sashiko-bot)
  * Do not leak the of_graph device_node (sashiko-bot)
  * Guard against NULL wcd_mbhc / mbhc->cfg pointers because typec
    callbacks belong to the platform device which has a longer lifecycle
    than the soc codec part (sashiko-bot)
  * Also apply the same leak/null fixes to wcd939x, keeping it in sync
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
 sound/soc/codecs/wcd937x.c                    | 167 +++++++++++++++++-
 sound/soc/codecs/wcd939x.c                    |  18 +-
 5 files changed, 194 insertions(+), 12 deletions(-)

-- 
2.55.0

