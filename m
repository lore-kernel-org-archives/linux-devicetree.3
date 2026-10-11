Received: from mail-qk2-f10.google.com (mail-qk2-f10.google.com [74.125.230.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E948E249EB
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 00:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791677414; cv=none; b=kKy319HwHmI2ojIp8xGamjXLGLcrJ8Hg8RmTL9PjImeyhH4thhk7ySuC/uwn+0+gKNaga/kV6GcQ+wK1Qg1Cvq1zaSIM1Cao1EHsPgsCZzvyi7+pn3Nle3P8e6ekajctusH/9HD9+F5Po9x2Q+wa9OFaCmuiOdA50Ec4CA0jeKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791677414; c=relaxed/simple;
	bh=3bLDDmxM9+7bEMwptKzPe5tuqwYOb9te2j7zoPqB9bQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ac399dLA0hvmavxWnx6AuNJIsuUfPfr7W7h1DmFlyg/JDKTDx43+0fAgKrMJOCa1LQ1PQ/5rB5B8fEF7JYVJuft0pYlWqHFPz2s/wNXJ7iwQTqq+3iUtwMRsUKTaFdn3Efz163aYBdDCXFHa/r+Kf/XiGRX8ptWT4NJPxM6BdwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T13vT2Hm; arc=none smtp.client-ip=74.125.230.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T13vT2Hm"
Received: by mail-qk2-f10.google.com with SMTP id af79cd13be357-930f59d1dc6so58750685a.1
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 17:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791677412; x=1792282212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BP1bz2pHwtNQXRUrZx5Fh8v5zRyVZJ76VNiARN43ayQ=;
        b=T13vT2HmzeACAmqRS9dvSj0jsE/RJgswQ3APVLhPcQ0l8dcglJaJux7m7fcR6NtA0j
         f/iKT/0+tz2aMef8WM8n0UFX9N//sbhxsBtZPaIUgp95FDjC7Qz29x8QhCi8ZziAepWb
         ReXpmGTM1D3iTiJCTM+RT/S2yODZyFWFbOMkEZCEKv78cpWkAiep2PuktaotLopBf1eT
         hqtFW+WR1dWpPu+SJoQ++0g0N1vu/Sqjk1SzzqU+iEZqvUy0sr/5biRY+auCbDqXbdif
         2JNglB6+y069X/9q/hgJ2BMALlvw5gOFt/1hDrPdalDcxttXzeZEwbbBU1Z+yduyxEEg
         WlGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791677412; x=1792282212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BP1bz2pHwtNQXRUrZx5Fh8v5zRyVZJ76VNiARN43ayQ=;
        b=Uzp1HG/OHqMKFwMenM8WxBDhoMj/VC55p0lTFzz3PCGtfEmVaIJdp/hxjGWVg7dIGc
         Z70vNLrqveFP9STFP1MO4cdbiNM285Zq3yzmlvL0kufQc2bFu1FUyHc95Bc0Hb1kHL/f
         rSi4qjbiAc+mOGcReUP9odGRinU87jQTJ4lzkaLa6d08/duEkRud+kDrPfCTtrAWHWIS
         n8M60PKnA9yLqGgsVrDh8+/Or7c+L2SMc5Bvkeg9a3DU1NEO5PvyU2u2BP9xkjTiQM81
         OtC8MeDKEaDEjCO6e1IadF3ecJIj99X3ATn37FY4T3dOX53bUpzINDB3KkYg/70WTjkx
         cyOw==
X-Forwarded-Encrypted: i=1; AKwUvBzoyPV4MG5uPqm5ghCta6P7AMnv1yAE/TQBK88/ocupbJzwGvJQBfLN08fi/K+UJWgvT7seNiLT4TVc@vger.kernel.org
X-Gm-Message-State: AFq9FYIOKOYylhsDDq3ckpx2Th29mdpgOoUVxHg8DHG+nnquIri4hOH2
	/BQ2FJsW93+0/xuycoVUPb0BZCnyLgr+F3oSy5kaLjnTRFsAcYCdaSAdxu0QdUWDsQen3A==
X-Gm-Gg: AYBFou34BzTb4xki+5pciPjz+8r1o6SPtmYtmu4eOFxVEY3r7MlbrRs+lxiMFwQmK/T
	/TuuxnPL8TgbmAhtRZa4w8ZNcdUqQpJQVzYDm+FP2cJAotEvWpElTknrKR1kTkHY7jksQPKrV22
	GsXXgAO5OO1RjV5ojz8u6vX1OfICt7YpiTlXyKNXXBKmEkhP1UCSWs/o4RfT5s5CNmJuBrK7/Vg
	AoLsSM/ED18rw8PgXHNj8RRCJrdKVomczMb30ZEevuGJDtVo5VTFGS6N2sz7jDqnRalfPkhnwz9
	cQwQEM+qWgQIMhK6ucf74BdBk4bvbR7ZpC7U4FHdGfZ7FVXGnFrE6InEl2ht1i9fKiBcIC+0n6z
	SFT8AQiKOy0KPl9aNB3SH6qkFh7lScFcL8G3acTZiZr/NIrtTcKUz8GwtsqzpgIfXxzWtXLsNFN
	U4xvbhkGSVWV5WL3iDRnfuHMe09ROfnjAJ1JPOKx5djCZCsXdteL148TwOraB3+FurWzY=
X-Received: by 2002:a05:620a:4692:b0:93e:95ce:539c with SMTP id af79cd13be357-93ebd0e4018mr1010764985a.2.1791677411682;
        Sat, 10 Oct 2026 17:10:11 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:6ff:277e:31c7:ac13])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98ff9d8sm523933585a.44.2026.10.10.17.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 17:10:11 -0700 (PDT)
From: zoan37 <agentzoan@gmail.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	kernel@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 3/4] arm64: dts: mediatek: add Genio 720-EVK board
Date: Sat, 10 Oct 2026 20:09:22 -0400
Message-ID: <20261011000922.1089313-1-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924-add-mediatek-genio-520-720-evk-v3-3-2ec5c80677d4@collabora.com>
References: <20260924-add-mediatek-genio-520-720-evk-v3-3-2ec5c80677d4@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Louis-Alexis,

A note from using this series' mt8189.dtsi as the base for an MT8189
Chromebook (Lenovo IdeaPad Slim 3 Chromebook, board "quigon" of the
skywalker family) on next-20261008.

The dtsi has only the cpu_off_l/cpu_off_b idle states (PSCI
CPU_SUSPEND 0x00010000). This firmware has no PSCI SYSTEM_SUSPEND, so
suspend is s2idle, and with those states the SoC never really sleeps:
the EC doesn't see the sleep signal and the RTC alarm doesn't wake it.
ChromeOS's mt8189.dtsi adds a system-level state that only s2idle uses
(infinite min-residency); when the last CPU enters it, TF-A and the SPM
put the SoC to sleep:

	cpu_s2idle: cpu-s2idle {
		compatible = "arm,idle-state";
		arm,psci-suspend-param = <0x020180ff>;
		local-timer-stop;
		entry-latency-us = <10000>;
		exit-latency-us = <10000>;
		min-residency-us = <0xffffffff>;
	};

with every CPU listing it after its cpu_off state
(cpu-idle-states = <&cpu_off_l &cpu_s2idle>, <&cpu_off_b &cpu_s2idle>
on the big cores). With that, suspend is real SPM sleep on this board:
the EC sees S0->S3->S0, RTC, lid and keyboard wake work, it passes
repeated suspend/resume cycles (20/20, then 10/10 twice), and a
10-minute sleep used about 20 mWh of battery.

I can only speak for the Chromebook firmware, so I don't know whether
the Genio EVKs' TF-A implements this power level, but it may be worth
adding to the SoC dtsi if it does.

The board files are at
https://github.com/zoan37/lenovo-slim3-chromebook-omarchy
(port/quigon/mainline/mt8189-quigon-suspend.dtsi).

This was found and tested with help from an AI assistant (Claude).

Thanks,
zoan37
