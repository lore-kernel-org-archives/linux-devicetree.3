Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794306272;
	b=MYCa9BM1gFPSxH+e74gHdnL7bs8hXH0ZYELF92pvTX5iWiIMQSg9OROxHpSnhd7PwW3d
	 9AuA1W40CaC+z7BDQw65e8uY0dukTnMM4V+s/LX8QAzGsgV2Q6jrjroYXOrkaBGUP8bp7
	 7QVgFhnflLazC1dTfKLeQOZoyCUWhu3TrXBt45tbrEI964O/0DVUNfEz3cdE1sbwc7yn7
	 1DfGmnFM5ZaHVuveOYxwxDkuzZ5wP9jLgt0OVT3VbfGlZcuX0XdQeW0Tvl5hiGy0ocZuW
	 edcMsWU+EbhHBn8yMvyNRR+wTnzWPo7BuJ43+cYyYHKpzJO3/JABISWU05nk+eh8eDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794306272;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=0k92K8b49X9cIdh2GF82mc+d2Q8OVuyS6TzYE36ZPtE=;
	b=NKHfWH+KMVh6Wvi2zrMM3kf1GJvjpgSQnR3uvUhArvC7pwOwVRRW1ccWGXd6Klh/zdsp
	 X3KSGhZ6rs6n2+6j4BZ1wfBk6haXbhrDdRqm9Q17ARJnZ2RIIw4kwXEtUHY3tVcjpRSO1
	 qDa8K/YyLy0NSWXzU1Cp1yI/+rVUwMxbfbJ2mRLzqtXKlRUasSTy3iNNJiVwfyOgO7vXr
	 c1/oG/A4CR3r7zO1kJGm/RwdP9AITzwlRC4fZJ7WncFV8M9NQfBBfEaUljIKFvHkTyFyl
	 EN+CUvykQjnUhwpZovV1PhDUI9am0tiufH7qQepfpb4ZDTPFYA9XHDwgtMK0HjrjIkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=CixjJzFD;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7CD606B990
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 10:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D7CD606B990
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=CixjJzFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=0k92
	K8b49X9cIdh2GF82mc+d2Q8OVuyS6TzYE36ZPtE=; b=CixjJzFDIKVpJGj+e0HN
	K1hHUYCLcVXcQKua5AIHTqIEXd5XLR2K1xiTJiW2GZNBtgbADz+FWMM9nZCm5O2A
	ZuOK98Piur0oC5bOuegmdwsw69YpeqRvB7bwO92tbfcETkfdXVUD92zjWf6oteO6
	XKkCKkyuLtfqXlmZriJXEm7hdU9Iyuw3nI7V9OP/3t/+WHRZG95vERR+3slbMEg+
	a0OOYfzzjZax/bZsoodgw4a8unf3OW/TkvCAUmHGjZKm8h5uvQ1C9b2Qe8gikhna
	7D9iw2niRkO5MQh3Xk8tUGLp562kgtB84GdmAOkIZkeIxxtr+6Gaj4Gt84AXxuPH
	gg==
Received: (qmail 187841 invoked from network); 10 Nov 2026 11:24:25 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2026 11:24:25 +0100
X-UD-Smtp-Session: l3s3148p1@rcKKe+lfZuoujnsO
Date: Tue, 10 Nov 2026 11:24:24 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/8] i2c: of-prober: skip post-power-on delay if
 powered on sufficiently long
Message-ID: <avLw2AiqcnO9Blun@shikoro>
References: <20261103043734.2179858-1-wenst@chromium.org>
 <20261103043734.2179858-5-wenst@chromium.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103043734.2179858-5-wenst@chromium.org>

On Tue, Nov 03, 2026 at 12:37:28PM +0800, Chen-Yu Tsai wrote:
> On some devices the I2C component is powered from an always-on power
> rail, or the power rail has been left on by either POR defaults or
> the bootloader. By the time the prober probes the device, the device
> most certainly has finished initializing and can respond. There is no
> need for the delay.
> 
> In such designs, the system integrators tend to work around the delay
> to avoid the boot time penalty by simply omitting it from the device
> tree and the component prober. This is undesired, as the device tree
> is not fully describing the hardware.
> 
> Switch to the new regulator_enable_and_wait() function that makes sure
> a certain amount of time has passed since the regulator supply was
> actually enabled.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

@Andi: Chen-Yu is the maintainer of the of-prober, so I suggest these
changes just go in together with this series.

