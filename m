Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4E1421234
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 08:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363280; cv=none; b=EdOInuvrqm8lP3DfcLtxKB2R2l/1Gyjhltain0+7a9T+MzL8MXN+hhDqilQ+M8on8Eat9xXeH1nkHm6Vwy939gtYfWrS3NSF1sgmDFC0TtaPH4VftvQk1MlN6dRh+C6i+rVMq3Zv6U/zq6DmUK6xVPz74iaDrsmto6rPZ9j8ch0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363280; c=relaxed/simple;
	bh=ns5/UMhLGw+gH1o3rceBplxKe2Bd6QRnvxxVs9U2EY4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TNhnQpSmyt8xNRxnUuHhW8zYlEXA5wLglHLFqW1vxYVNK04f6t/ZkElM5WICO14dgmw4UgTY7cF7HSFKKtyDtLY3xxHnbkpo5FbmbXZvUrD9fqix6N+QXXrupcv+SQC/AzLUhq7fvG1RzExBHjmJCWBuq1hr1/2TK11u3TelqzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ERHFbE6V; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ERHFbE6V"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so36319705e9.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 01:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791363277; x=1791968077; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBz2qXMgWojuZvA+gqIdsYCtSC6xw/yhzsi3Z9qc1oU=;
        b=ERHFbE6V1+V/7VOdb1ufLNWhqdmMi/ZZmRNdq8Uk87mYA6D/Usafy2JxF+pgfZmZan
         AineRSrkWlAew5VIfIiwgRR8T7fycBN/YAIkSXH2y89euS/CmzewIE2wYT/3RC/+/Msu
         y+PPyue6d1wnkAejn0wg7epoDyxjmHHveXhsl2vDw4vKuIsUGWW2UU4XFdAVNLsXbm5k
         JGX9w5idpyYFEV5KfOHelBVOieVU2THKbI7ji+y1eVF3ZCAe07qPcEmnXBfDOcpJ3Dhv
         HXGAtec1XdKMxZZj4Hd2jF+/PeCC1QAZoQD77QWDampIkt/v3BXOPLUNQVjSbyllxQ6A
         WVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363277; x=1791968077;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hBz2qXMgWojuZvA+gqIdsYCtSC6xw/yhzsi3Z9qc1oU=;
        b=1eMJPysehKRswlal77v55MaGMMmDnXVNWnT3jywgvYAC7B0maTjkl3A3qw/zcwKg52
         M0tB5DM4pn3JlPZvxorRHAWOWSNowhbIvlCgZpS8/JVHR4XJIRP+XLEtxS/f/ELz9sTS
         q1spzRPjHiNOhZ6oIqSc3EIs6cmZWE6i2KYNDpec9tukWRwFmUGQlod9qHI3GwycIX12
         b2t5VJ/W2CeJbVbsF46DOrG2qe/gCd+eDFm7I9PXnc7/UldZkqiU3RUSYIbIuePFl56J
         zo5hQF9IA3yhaiPJlpfaXX9REtnmCo48LKESC2nxNuWaxGxPYL3Vp36DdFGLiJQv6KT2
         qyGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxae8xjE7r2Zj0m999r9/LKlJjNW0u63DmRkWhNF2hR1Xjua6ogJmDzB0CyPcHFQd2K96T8bpUJZt34@vger.kernel.org
X-Gm-Message-State: AFuF++mkpzeCA5LiGZlNvJSHlPFySB1OFQr3KvLTRIFVwJsWInd+pfNS
	+4zXwQDUt0EedTq9YNdHv0b6yqbZrJabOysiiYWatbTh0H/24022DmbbuDZs/zR5e80=
X-Gm-Gg: AYBFou2mJvwAWtQOxIpi4YL29AmeXq5BdAr2lmCztPBC5+z7GhqDJFco7M3m7JaQMjm
	FayMTmqjNE4POku7pq8OMwSAMK9RZJPNai0F1JVukYdQh3K5kumoOUzg++GEuHZTQn33y12Fy9E
	UxcnkmKWmruP5jRb9IU1biZiScfHv6SPVqbOJ7xncFj61JeOHvqdUhRjR1DmYe6N/CFy9O40CNI
	hdHpmCGYGyTieVQ++K6lJ1mbvmeEQJc7UoaHTx88rD1fty53G6GAqp2S/k6NGGTdZ6PxaUlpPg4
	b5U3NY3/pTLlttsIXMK21ZGYNBlDxIjBV8E3CvmhjdLPLPn/22iFnZPFxnffGLobIa35OD6OMy+
	gVrZ6il+YXd80gHilB9zSwK7OPcXquSVAHSDptfHM8M+ppe+X8pvYpoEOujZ6sFg0rXXuJQ12li
	vf+H6D+KJuaKYe2ooDPBov6pW95ViUnelg6cSp43z1wZ25SuyQNNCjoRktCyN6CXSMU3/3DfhMB
	9iIwkCexOAZAoA=
X-Received: by 2002:a05:600c:1551:b0:4a0:263c:704f with SMTP id 5b1f17b1804b1-4a1804436c7mr20240445e9.16.1791363277470;
        Wed, 07 Oct 2026 01:54:37 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c5df75sm119201005e9.15.2026.10.07.01.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:54:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
Subject: Re: [PATCH v4 7/7] arm64: dts: amlogic: gx: add AUDIN node
In-Reply-To: <20261001-audin-v4-7-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-7-2476646118b5@baylibre.com>
Date: Wed, 07 Oct 2026 10:54:35 +0200
Message-ID: <1jwlrtyjp0.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 01 Oct 2026 at 18:06, Valerio Setti <vsetti@baylibre.com> wrote:

> AUDIN provides audio input support to Amlogic GXBB/GXL SoCs.
>
> What's missing after this to get capture support working is to connect a
> capture capable codec to the SoC. For example to test these changes an
> NXP SGTL5000 chip has been connected to an OdroidC2 (GXBB) board using a
> custom hat board.
>
> The following additions/overlay are required on top of
> 'amlogic/meson-gxbb-odroidc2.dts' to make that hat board to work:
>
>     &sound {
>             audio-routing = "AUDIN I2S Formatter", "AIU I2S Encoder Capture";
>
>             dai-link-1 {
>                     codec-1 {
>                             sound-dai = <&sgtl5000>;
>                     };
>             };
>
>             dai-link-3 {
>                     sound-dai = <&audin 0>;
>             };
>     };
>
>     &audin {
>             status = "okay";
>     };
>
> Then, from userspace:
>
>     $ amixer sset 'AUDIN FIFO0 SRC SEL' 'I2S'
>     $ arecord -l  # find the "FIFO Capture" device
>     $ arecord -D hw:0,<N> -f S16_LE -r 48000 -c 2 /tmp/in.wav
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
