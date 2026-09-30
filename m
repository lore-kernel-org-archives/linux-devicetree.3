Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFF03EEAC2
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753995; cv=none; b=LlwCwTOH2UpsU9Y2E1eF6Cib8kYlEPx7c8Inb9pB+K5EmXC6ff1yTK8C9O9V4JmwtiYdcuyKC3TW+uaMP8aC14ZX/OTFJfgZNh0QIxLHeLA9scEJuOXsiVnR1CRjv2d1hA/Ce77giP1wwhPr2sPUxAyudE734IlnvAOYAPwXhEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753995; c=relaxed/simple;
	bh=eM9YEMN0376wWN1d6mMXq5KIUAZSu7n8NX9ie88Xhyw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EPBWuixtzcgjY0Kw7+i6Ys6OoOJfoGo2P287uwRbkVfOLgWNpdAd16hyjCk1uTvcWDaD698ygrE8EVeGbGagtrf2LWLjbZZbpK5GmjytPkUDRnRKQwOljhZSiVLZNBthborfSCcnYx/JjZUezYF5FXQAFdEE594UGVvyDx91e5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=VmNuXzLW; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="VmNuXzLW"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so29136295e9.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 00:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790753988; x=1791358788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eM9YEMN0376wWN1d6mMXq5KIUAZSu7n8NX9ie88Xhyw=;
        b=VmNuXzLWHi4LHZJcw3wPJz9QbvnfiX2PxDkDBjAErpF3E6EdSjJ9zCMowbdhxtrGlp
         /+8kDQGPmSspeR0imKjPeAIJRhglj11ZGhXYpajRnDEddda/GXqyzMvfNzrtYZ2VCDWi
         TWWVQdE4r+O9Hu44iI5t02yvNomK6JeC5aMQ/Xia3EX4iohRLc3bb7o1FF04/1u+Qgy/
         q1qBteGnxFYC9yvPTbk8LAW2PLdtYzvdKvBzynlViJSO3g2yaRKIeSTF14KkcRRhJRbv
         TLyPJUHk7ZHAi8T553Lyvk9xVZuBVnON9iL7Mouh26WawwcnH2ZAPGElJFDIpdwTr5kL
         JJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790753988; x=1791358788;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eM9YEMN0376wWN1d6mMXq5KIUAZSu7n8NX9ie88Xhyw=;
        b=vLObBGco7p+F3cLhIUlScGcfIsJDNvpyOLVkzNOiDZ4TUR/o5oxZEi1J4erbJI/a9V
         S6lLXE28ZMGsn9zk4VDlBA4BF+hT068uw1TIJTUjkVc0zkE4Q1bkVPyYS3/Mqn2fNMgZ
         /hwKtcszfcD0b7i6RR596bbt9iXqDpLoNpbbGiCZR8YDPpwW+P3W2PBtF2fVCZGFcp9H
         24nAD9LorNNjPW2zhKUgtzCu51IZlfeYdIQ7TNTLDJHCIDU6NnkA3prRd2MavtINvMEQ
         tjSm3JvqCKkurAIbmVpg4/OHVB8B/xavkDH6yFgjBDQ85QeCt7uZewU1s65Te3Vrqzk4
         iE7A==
X-Forwarded-Encrypted: i=1; AKwUvBwpb54C85DNrg3WTVqhra1VMo8LVZL+eYXKjUkus08lw1FXp8JKtp9FhmtJwgSUn2UTpz/qUI7l4Dcq@vger.kernel.org
X-Gm-Message-State: AFuF++mZ9wa2IYmpo+Od9LBmPtkWDnLfDfAVT6qKGAr6Tjp/V4+l+p9O
	oDxO/v32ssZucDdhSKfADCVfkpSGiLZ1bhezj/5KvzcHFb3MC5oo8xS6DWBl38LcB2g=
X-Gm-Gg: AYBFou1Ti3wSdFUjQWGkbUFKEwBS6jie6HoqCjOZrykDtaqiZYNxBXBp4O8XMUsrFbp
	ftBFfa03y3V1opzSVGW8h3gsCHjvbMGZDzhZll6fx2REOry/XHWT43A2NYns1nrEuwN7f7ZPR45
	EpQDDpfEhKDhWCHyvoAsrYCxKNdJwpHWXzrjYiyYqZzuDBk3HjpfGUJ7aJIp84vjTUDXxd7k4ow
	DzUrBExSFwIbnQ3cXxNwP/t28x6wVgikfo+PCPpmV9LieZuk0d5T380WDftVlK8FuBPyAf2jAbd
	4PNQkkIYNkqETUzTj57Sa7XOjqG2e3SJO2WGJ/JwkIa/AlwWYeBjnb8jvDRSUyL7LcbSZtzwINq
	YcPo9bKfWd+plUZXnCDaA4AQEdIYXPV3QOlJ65R5L5vgqbl8nHI3k8OF27XHhV4vhR4vuwHikOT
	MCAEA27h/Ou0LVeDcv0xvuZdl1+8D3vc6cBRtpLdCDcJ+DIVfXRM96nOoH4/bLGhObf7cb0kiTZ
	zGZew+UL5SDR/EN5F+/Ba1p4Hmz
X-Received: by 2002:a05:600d:82e5:b0:4a0:61b:ede1 with SMTP id 5b1f17b1804b1-4a01afe1e93mr8170315e9.7.1790753988705;
        Wed, 30 Sep 2026 00:39:48 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b02949f3asm1432327f8f.1.2026.09.30.00.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:39:48 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v5 8/9] clk: nuvoton: ma35d1: get HXT/LXT from DT
In-Reply-To: <871pab6bhn.fsf@bootlin.com>
References: <20260929-perso-ma35d1-upstream-clk-v5-0-68533e935ee4@bootlin.com>
 <20260929-perso-ma35d1-upstream-clk-v5-8-68533e935ee4@bootlin.com>
 <20260929145618.187A21F000FF@smtp.kernel.org> <871pab6bhn.fsf@bootlin.com>
Date: Wed, 30 Sep 2026 09:39:47 +0200
Message-ID: <1jzewz2nng.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On mar. 29 sept. 2026 at 22:36, Miquel Raynal <miquel.raynal@bootlin.com> w=
rote:

> On 29/09/2026 at 14:56:17 GMT, sashiko-bot@kernel.org wrote:
>
>> Thank you for your contribution! Sashiko AI review found 2 potential iss=
ue(s) to consider:
>> - [High] clk: nuvoton: missing IS_ERR check causes permanent probe
>> deferral
>
> Gasp. Yes that's correct.
>
>> - [Medium] clk: nuvoton: hardcoded parent strings cause orphaned gate
>> clocks
>
> I don't think this one is serious, linkage is reliable because we
> leverage the device tree nodes in the clk_core_get/clk_parse_spec
> path. The fallback is indeed based on string matching, but heh, that's
> because of backward compat, not my call.

If think it is a legit warning.

Here you say that your "hxt_gate" will parent to a clock named "hxt" in
CCF, but you've got not guarantee that will be the name your externally
provided clock.=20

Its fw_name is stable for you but you should make any assumption how
another module will name its clock.

You should use parent_data here with .fw_name that will match the externally
provided clock and .name as a fallback if the clock is actually provided
internally

>
> I will send a v6.
>
> Miqu=C3=A8l

--=20
Jerome
