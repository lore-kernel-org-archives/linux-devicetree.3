Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794704415;
	b=VU8XkjflcH4lUfrYNdJPXJvQ+3k789Q43VpV95AsgZ/3c/6NBCGDZ3EM5RmIwW7f0rFP
	 Xnzm2sN8tp6b/i37DHKLnWIafJhIS/r97iFoQCtWRl0CErUo1ZvzbrZG8xe4x7PH4kbr/
	 ZhgBZNs0a8FQRTtH4BNAYy4h2kMD/QCVUJIyJnVxb3niIhQ6U//M2hvoDUMSC3R8vIXXm
	 UguGI7akY6pEwOWBbIhNeyUxjk/IAoB76z00UrOadiCi3dxu5M0W1awYiQ6nrMzJ9Sl6P
	 +3oIf5l2Ir4hKBq2EGC8as18HIRQhqt5jzVIYMXE3W2mOpzZu4Tiilu6F+2OvSTJpFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794704415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5JVcksrPn6+Ig6tuNU22o2qjR3uSsPz6hcIi+8PBA4g=;
	b=F1SFvR4ZIU2QOAulW/NemlXeDNZgp4KhaxBfsUASf1ehpzqwIVpKq//MlRGki9304bLk
	 +1iosIZu+DrW7wjLKyV2oUWCdKc9AW75V04Znv3c9ml/ESiaBel7tyI477mDbAcYkwatx
	 WlSdZcfmIDWVU6aqM11sxgUV+GsF4ZxULws21ZD80JmsEwVGwhnfyUIPXOTkRz4CtV4Ki
	 Hl1gBVoU+alza5Z3hNSDmcw6w4EV7IDzU3AOnXMu8tcuzVHALhZOJ5jrBuc0EFISNrxmE
	 SZtUoCE+tj8XF6Y8WZ8tNqxYkpReTThpDblHrVnep9aQ0mpvwqz6+SJhcZQYNK9KxAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XcrRPS93;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB948606A332
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 01:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB948606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XcrRPS93
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36dbde64409so3370788eec.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 17:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794704414; x=1795309214; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5JVcksrPn6+Ig6tuNU22o2qjR3uSsPz6hcIi+8PBA4g=;
        b=XcrRPS936P40vJno3XvqyDp8fAli9TuND9KYSi1V5lmSwLiBH63p01bDAcdtZA4bTX
         J/W9I4NXICyt47rJfltq6+b8mnoNn5sCp1YIjAjkpT9u5Uq0y6ipNma8gZPZn+k1AUdY
         z+fOIkNd+wcVt5uX2/wOLwR8dQN9cgCwc9KvVOlp7KrLJwqEGJLar9ZdARuOoIe3VvHT
         CiHYsCOxpMRDw4MP9d3JbSzEONnWzYdpfjGvRxRSWlE1W+CyGw/dHDcxOAcO1Lv8fXxC
         OEnkpOWaEGBrRwsieMLA9wlrMVLqI1ceO084+uugzp4XTcYP4wip3TWr4R2VBgYf+ooz
         DX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794704414; x=1795309214;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5JVcksrPn6+Ig6tuNU22o2qjR3uSsPz6hcIi+8PBA4g=;
        b=oA8yrd6zDYi70MXpBB/8D6X+CrYLsUHRrO18ZVmUO7euUg++lXjEitKAWm6yinZQs6
         /b4IcoPJsd7zdspdtfMkPZ6nM/Wq6U+3+AK/HBDP3jMmUgL70qLlkqNi6MdzKH94Su96
         iVcd7aRoJLwAkGY3Q6wN8D0W7YgbR8UHgaO8iFXuvy9IyUspH+DNmwKAAGMaif12IJRR
         6yKve4+bZESigNU5BW1SkRSSsXR4veUoQjnAPMScMPi+lxbsKPeFlwiNTjWxZzabbY79
         EPfQa1d5k8tVlgoZa3a5/ZhwUNVfb5krRyyXqdW+r5RqjNvaaM+TrwVhjOtBV4NKQ1Db
         ONbw==
X-Forwarded-Encrypted: i=1; AL+hErFUJuCvWRBI4HUdRq12AdqR+uBSREXIiVK87kao4j/jfpAgJuSPH5nuA4VmaNHlQiyJR3vV/pk33j9G@vger.kernel.org
X-Gm-Message-State: APuU4Z+TVJAUEQNc0sT1jzogA0jArgZxDBm4MYFt7WB10J2b6u64hPI8
	8bvOsW0IB6oGuw5lU43Ijf13p0lR0cyOEQ1sdXmUjwRrtJxvebVsYknP
X-Gm-Gg: AYBFou3AUu8kErImCtUXQY0P0Pd9E7dXX60SG6d2JdUwnMybG08shliK/CVbVqY8B3b
	GoUZRSnPLXWtuFWuVgilUGHLYN0AXOz4UFFx/uplnAnE8oEykwHtDao4BgTdq1p/RMcyIxxGDc7
	QpcY+7fRg8miqLKZtZgX5fmSTUqNNHQyzjeiRmgLrLUxO7HN3xtp3v8d5O0/pXwHPuIW2v+bv+b
	bew+ssd6Dsc4UVZ+SsXRkNGoKvi2uK6S4KFlkdnHfoRy4NrQqdqFWfM6srEyS4NpcEBa5Uw0UgK
	PEP9VFQMo3cLgL+1oDpi+k9eucG8tG/tZaTeakdYkeu0wetw0hW1z9nzbdq3C21zxSBzp502so6
	WwciIkJ05cYyQTVM/oAYpWlLk1sZ/XxMjViuo2ZmiFvfU8AaS+2F9p8lnv83g3xGBvdILNpoc0y
	57y9LPUTkeUDxDFJrdKUX65A7BOLeo8OPoqanyl9hldpytp/XLlkJiCFJ487ItZDhJT4UmPrnNn
	SdMaB4R0+Q2N47EMGhFAut/ePdsC+UND2TdQhecTAgiOxi8iemW0pwYTlpsILpBJk7M98Q4KFd9
	1cG6Tqzv1FbNZHn28C05O/ReWKIL54zg3dejqneI7kl2B6ZHDa6oB2GFbF3OL3MLZ3c=
X-Received: by 2002:a05:7300:7481:b0:375:c5e1:931d with SMTP id 5a478bee46e88-37966e3aff8mr9267695eec.25.1794704413837;
        Sat, 14 Nov 2026 17:00:13 -0800 (PST)
Received: from [192.168.35.43] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm26895445eec.19.2026.11.14.17.00.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 17:00:13 -0800 (PST)
Message-ID: <c0b9ed82-3e30-4f53-809e-e7f35b0296d7@gmail.com>
Date: Sun, 15 Nov 2026 10:00:08 +0900
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: chanwoo@kernel.org
Subject: Re: [PATCH v2 7/7] PM / devfreq: rockchip-dfi: add RK3576 support
Content-Language: ko
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, kernel@collabora.com
References: <20260921-b4-rockchip-dfi-rk3576-support-v2-0-04f847016321@collabora.com>
 <20260921-b4-rockchip-dfi-rk3576-support-v2-7-04f847016321@collabora.com>
From: Choi Chanwoo <cwchoi00@gmail.com>
In-Reply-To: <20260921-b4-rockchip-dfi-rk3576-support-v2-7-04f847016321@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/22/2026 6:15 AM, Sebastian Reichel wrote:
> Add RK3576 support to the DFI driver exposing the same functionality
> as found on previous chips. This uses the RK3588 init for getting the
> DRAM type info from the GRF registers. In contrast to RK3588 it uses
> a newer DDRMON controller IP, though (version 0x40).
> 
> Co-developed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/devfreq/event/rockchip-dfi.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
> index 8ba97af78e3d..a895e566b4b9 100644
> --- a/drivers/devfreq/event/rockchip-dfi.c
> +++ b/drivers/devfreq/event/rockchip-dfi.c
> @@ -858,6 +858,10 @@ static const char * const rk3399_clk_names[] = {
>  	"pclk_ddr_mon",
>  };
>  
> +static const char * const rk3576_clk_names[] = {
> +	"pclk_ddr_mon_ch0", "pclk_ddr_mon_ch1",
> +};
> +
>  static const char * const rk3588_clk_names[] = {
>  	"pclk_ddr_mon_ch0", "pclk_ddr_mon_ch1", "pclk_ddr_mon_ch2",
>  	"pclk_ddr_mon_ch3",
> @@ -887,6 +891,18 @@ static const struct rockchip_dfi_variant rk3568_variant = {
>  	.reg_access = 0x2c,
>  };
>  
> +static const struct rockchip_dfi_variant rk3576_variant = {
> +	.init = rk3588_dfi_init,
> +	.stride = 0x10000,
> +	.max_channels = 2,
> +	.clk_names = rk3576_clk_names,
> +	.num_clks = ARRAY_SIZE(rk3576_clk_names),
> +	.reg_write_access = 0x28,
> +	.reg_read_access = 0x2c,
> +	.reg_access = 0x34,
> +	.reg_clock_cycles = 0x30,
> +};
> +
>  static const struct rockchip_dfi_variant rk3588_variant = {
>  	.init = rk3588_dfi_init,
>  	.stride = 0x4000,
> @@ -903,6 +919,7 @@ static const struct rockchip_dfi_variant rk3588_variant = {
>  static const struct of_device_id rockchip_dfi_id_match[] = {
>  	{ .compatible = "rockchip,rk3399-dfi", .data = &rk3399_variant },
>  	{ .compatible = "rockchip,rk3568-dfi", .data = &rk3568_variant },
> +	{ .compatible = "rockchip,rk3576-dfi", .data = &rk3576_variant },
>  	{ .compatible = "rockchip,rk3588-dfi", .data = &rk3588_variant },
>  	{ },
>  };
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
