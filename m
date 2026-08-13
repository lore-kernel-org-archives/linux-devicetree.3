Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA4A480955;
	Thu, 13 Aug 2026 18:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786647001; cv=none; b=Xzj9us3MpESdFZQHNEcLFN69awb/FVJKYWP5z4K2MciutZ6cipTORGsiMJCCMGpSkaBIMmCYZi7n2zivoAmzCtf8flgZLEluON4ZGJA0BuHxnjZqvQARQo9YbdRFItnroOQLjXR8OfecnkbI+SPE4qHA7N9/dSmgHyk/pKtmmD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786647001; c=relaxed/simple;
	bh=N2tXyEP5k6siy2BStVXxZGhHfQNVOTkLt4pjp7m6PDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B2C7TbSdl4S4S0/Q3I0hmdTG1/FCg3rSzExIXfiRzBvkVVBZoQzyr+Uylbp1fXgdSFtr3B+v5GpPUqnRLjWYbNEpX6IZ6qX641sgjYepAsFo1l+kWehN9Hcp0zBWhrmCquU69PQhDZCKpfodVs1DDK3n9rj8keQhJQDx/CQ6J8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YkS6aTgA; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YkS6aTgA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786646997;
	bh=N2tXyEP5k6siy2BStVXxZGhHfQNVOTkLt4pjp7m6PDE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YkS6aTgAFuPqpi0u5/aB6g7a15Bilrqtg6musRFtx/4kw0wLutmPosTYiyebpbwXK
	 D4SjwtqCGdGEYgot7Enpzx39nyhwHjnI4I6Ck4E2psL1rnl2W8EUbV/gbg9EO57Bk9
	 5w4aihJYMG5r+9QVyAUF6u4cOAlFG23dhgsuLfoP11l3Oli/tGFkKfmiEhRIjY0FqT
	 iloV4uejjNmbKqiUd/ucjDoEXJDJuSz0pmSrrOcKosBhkaHmxpLH8RFgengBl7F49P
	 Im14ke4nAsRVxlWBT628o28kpmPidzmkBhf7I2KC/Pq7hDNT/O7jZ8YxWpyFwIUc0q
	 K1BInUr0PUmRw==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D5C7E17E013E;
	Thu, 13 Aug 2026 20:49:56 +0200 (CEST)
Message-ID: <7278a889-15a8-42f4-806e-7a28bc7d9495@collabora.com>
Date: Thu, 13 Aug 2026 21:49:56 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/14] Support 10-bit YUV422 and 8/10-bit YUV420 color
 format on DW HDMI QP
To: Igor Paunovic <royalnet026@gmail.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Andy Yan <andyshrk@163.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260709-dw-hdmi-qp-yuv-v3-0-a4a982a9f2e7@collabora.com>
 <20260813164356.9625-1-royalnet026@gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260813164356.9625-1-royalnet026@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Igor,

On 8/13/26 7:43 PM, Igor Paunovic wrote:
> Hi Cristian,
> 
> I tested this series on an RK3588 (Orange Pi 5 Plus) with a sink that
> actually needs it: a Sony TV with a 256-byte HDMI 1.4 EDID -- max TMDS
> clock 300 MHz, no HF-VSDB and no SCDC, and 4K above 30 Hz offered only
> through the YCbCr 4:2:0 Video Data Block (VIC 96/97/101/102). Without
> YUV420 output this display has had no 4K mode above 30 Hz on the
> Rockchip HDMI path.
> 
> Base: drm-misc-next dc2f9f7fed1a ("drm/komeda: Set display/writeback
> clone masks"), with the dw-dp v11 and usbdp v13 series applied, plus
> three local patches: board DT changes enabling USB-C DP Alt Mode and
> pinning the VP2 dclk to V0PLL (DisplayPort side only; HDMI ran on VP0
> from the HDMI PHY PLL), and CLOCK_ALLOW_WRITE_DEBUGFS for unrelated
> clock experiments. On top of that, the samsung-hdptx clock fixes v6
> [1] as the runtime dependency noted in your cover letter, 

That is indeed the most recent revision of the PHY fixes - the patches have
already been applied (available since next-20260812), thereby unblocking this
series.

> then this series.
> 
> Results on the HDMI-A-1 connector:
> 
> - The connector now lists 3840x2160 at 60/59.94/50 and 4096x2160 at
>   60/50 for the first time on this setup, and 3840x2160@60 shows a
>   stable picture.
> 
> - The negotiated wire format matches expectations
>   (/sys/kernel/debug/dri/0/state):
> 
>     output_format=YUV 4:2:0
>     output_bpc=8
>     tmds_char_rate=297000000
> 
>   and clk_summary agrees: clk_hdmiphy_pixel0 = dclk_vop0 = 297 MHz,
>   just under the sink's 300 MHz ceiling.
> 
> - Cycling 60 -> 30 -> 60 -> 50 -> 60 re-synced cleanly every time,
>   with no errors in the kernel log and the VOP interrupt rate at the
>   expected per-frame values throughout (no underrun storms).
> 
> To be explicit about the scope, three things were not covered: 10-bit
> output in either format (this sink's 300 MHz TMDS limit rules out
> 10-bit 4:2:0 at 4K, and my compositor cannot force an output format
> to exercise 10-bit 4:2:2 -- I can retest with modetest from a console
> if that would be useful), and the 4096-wide modes were only verified
> in the mode list.
> 
> For the series as tested above:
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com>

Thanks for checking this out!

Cristian
