Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57075391E72
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 15:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791127708; cv=none; b=YWdMoEiWshPqbqrXAsQwlTUc7PF3PofRg0afyl/6Jn17JZXZ7SCD81DgSE3EHvwQ0RyGjkHpO8dOIiT4i0nPP62mJCxzoiFkkcefq2zVQ32zo2/5tPd/8MQ0dDMcnVzSInqZMHKsWMEBEiZhuR9vbN4REnc8Mt6GIDPPTCqRINU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791127708; c=relaxed/simple;
	bh=5mYst5Ullbp+HHdr6Uh5aXV63tNmZJUMGFOFHhbt800=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=n/o4hzA2kYKNexvkWvE/cn4ZPTXHJTJuTNvCsuVTxttpzeYh81zLuxEm8mHSjA9NUO0OVJCiTe9KqbC88+XVRozVtCo4B1GNtOzzfGnrDJOrWS8pBTTP83LGwNYu0DcykyUNn8tPq5p7z7T3daWyXrrzW8SUTXxdQyliBoFD7+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VkmrzzTt; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VkmrzzTt"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a0977b9c20so15287885e9.2
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 08:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791127705; x=1791732505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WA4cfENfPEbrDvuT53Cr6d7+lPDcZpBsXedFYV5NI20=;
        b=VkmrzzTtiVwoVJfHLdxekd5Up1C5u0redaUFy00gljCVl2Eu2Ly7UiThan4sMjS3QX
         gmbPcVp4KCoM7TGhzoEkoRymJguX1qgw161W/d05ikargI4OSTnw9PO7C5HzQpMOtorr
         ASNkChw3XcLaOYkVtng6ir9hKQb5IaU+osa1QAO3mi/4G/PtidlD1hhep7fvG4wW8md1
         eZ5L6X2FV3KnqZQp8POFuHCgwqrcY9fBzGu+Nl2qe7wGgtXVr6qnQsnWsv9AWb771p+T
         SuYhDhokZRWweYy/QGigdYACwUFBS6M8g1LB7QVesiGWPY3DNE+ojHLf2vobMShx1a/C
         lgRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791127705; x=1791732505;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WA4cfENfPEbrDvuT53Cr6d7+lPDcZpBsXedFYV5NI20=;
        b=ODjB7WpFIXiQoQ0l/P7m6k9ydNcWfDbOO4mf8MwsK+lTCGrEmP3y/qeN/OpbUa0n9y
         2JZ/ko+SSF+0pItFG+TyGI741IZbzrpGUKr25uv8fGBEmWg006hh8kEbnnOXR/BaYXAj
         dc9F/fx1FA/qv5AHzwC0gJwI1hjNCfdc6o47oK5BwUq1IURlXRogkzLCfDr0atB+x7Gk
         tdgwpTTdTkAv7YEcpahnHXPsYyElxekLuoY53QpANDbqfn+zhlRSQ74A7nKlujlVf6jw
         xbRnq0ipzj8deO+uxUFrp+We8a3myS8U4W3LCuXj/s8yEeH65Z0HN3uYnnSTHBKvy22/
         smWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWOzOwOsBrb1tf32u0bG8V/Gv2Z8c7logJrED3djklDjyVGgVCkV84Y4XXDS0uiRBXyVj0J/FtlMD/@vger.kernel.org
X-Gm-Message-State: AFuF++mwunNxCoEGzmfn2SSgR56RgoRmyxjJoHhnTCpp41pykwnnngs5
	zJaiP0boOJZJqLHqsh6e+8jqawJ6SPycnSP8wVxZpG6MuRmu7CogdLKVKuVpiA5zzyII0Szg3Am
	wPpNsq2Q=
X-Gm-Gg: AYBFou1U36yR6phi2RvPLPM5orC3k2e5W/jO/qUanUZ0RNDsmxk67+ggK3zUDB41vAY
	xqAbcWLdEO5KRlA7/Hv4l1gJ+n6efr2IYYHQgP64nAlaDPcyr788/y8UgveMr+8AXgBhLWTj3OE
	C8gfloO88H/21F0TADoOrlFBD/GcKQaUavrfS9iKud1Op2tVWwXddn1pjKL7hogAMQ1rNJ22otP
	3MrY1mQeWBjVSF/1TRvmpFo7RWPng46ys9h7N1gpjJqd3BMMXDBUFEwSdowU4c06tM7GTsrg0nO
	NwFgWfGRy0mWGZR4ZcxxYFN+WQ+cg0taERA1Rw5NqsjGeRbF1jIgg1E5nGm0bhY46AQJ1VtKI/s
	+1X/C5U+PsMLcjQhrH/GRVX3NjosdGp13pQ4RjG2HgcSU9O01JdXV+oYla1j16pLJyT/1ehZtkC
	dakHemRCyVm4Pm1t6ZAuuUnAr5WG0d9iWyLciFO7ibt84I8F+H0kUMWXsFycQZehRsxry7inkhn
	U4sh9tO
X-Received: by 2002:a05:600c:4e13:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a02757999cmr135331735e9.16.1791127704520;
        Sun, 04 Oct 2026 08:28:24 -0700 (PDT)
Received: from [172.20.10.3] ([37.169.53.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280d1e38sm220380705e9.13.2026.10.04.08.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 08:28:23 -0700 (PDT)
Message-ID: <162c3908-cbf9-4bf2-8594-8592d5e4c3e5@linaro.org>
Date: Sun, 4 Oct 2026 17:28:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RFC PATCH 3/6] net: stmmac: dwmac-meson8b: add support for the
 Amlogic T7
To: Lucas Tanure <tanure@linux.com>, xianwei.zhao@amlogic.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20261004144046.391444-1-tanure@linux.com>
 <20261004144046.391444-4-tanure@linux.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20261004144046.391444-4-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/4/26 16:40, Lucas Tanure wrote:
> The glue registers on the T7 are laid out exactly as the G12A ones, RX
> delay field included, so the T7 can reuse the G12A settings.
> 
> What the T7 does not share is how the controller reaches DRAM: the bus
> path goes through a pipeline stage with a gate of its own, and no device
> other than the controller has any use for that gate. Claim it and hold
> it enabled for as long as the controller is bound, otherwise it is
> switched off as unused and a transfer that has been started can never
> complete.
> 
> Give the T7 match data of its own so that only it looks the clock up,
> and require the clock instead of treating it as optional: the controller
> cannot do DMA without it, and failing the probe with a clear message
> beats booting and hitting an undiagnosable hang later.
> 
> Assisted-by: LLM
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> index e4d5c41294f4..450f7b4b29a6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> @@ -81,6 +81,7 @@ struct meson8b_dwmac;
>   struct meson8b_dwmac_data {
>   	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
>   	bool has_prg_eth1_rgmii_rx_delay;
> +	bool has_pipeline_clk;
>   };
>   
>   struct meson8b_dwmac {
> @@ -384,6 +385,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
>   	struct plat_stmmacenet_data *plat_dat;
>   	struct stmmac_resources stmmac_res;
>   	struct meson8b_dwmac *dwmac;
> +	struct clk *pipeline_clk;
>   	int ret;
>   
>   	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
> @@ -443,6 +445,13 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
>   	if (IS_ERR(dwmac->timing_adj_clk))
>   		return PTR_ERR(dwmac->timing_adj_clk);
>   
> +	if (dwmac->data->has_pipeline_clk) {
> +		pipeline_clk = devm_clk_get_enabled(dwmac->dev, "pipeline");
> +		if (IS_ERR(pipeline_clk))
> +			return dev_err_probe(dwmac->dev, PTR_ERR(pipeline_clk),
> +					     "missing pipeline clock\n");
> +	}
> +
>   	ret = meson8b_init_rgmii_delays(dwmac);
>   	if (ret)
>   		return ret;
> @@ -479,6 +488,12 @@ static const struct meson8b_dwmac_data meson_g12a_dwmac_data = {
>   	.has_prg_eth1_rgmii_rx_delay = true,
>   };
>   
> +static const struct meson8b_dwmac_data meson_t7_dwmac_data = {
> +	.set_phy_mode = meson_axg_set_phy_mode,
> +	.has_prg_eth1_rgmii_rx_delay = true,
> +	.has_pipeline_clk = true,
> +};
> +
>   static const struct of_device_id meson8b_dwmac_match[] = {
>   	{
>   		.compatible = "amlogic,meson8b-dwmac",
> @@ -500,6 +515,10 @@ static const struct of_device_id meson8b_dwmac_match[] = {
>   		.compatible = "amlogic,meson-g12a-dwmac",
>   		.data = &meson_g12a_dwmac_data,
>   	},
> +	{
> +		.compatible = "amlogic,t7-dwmac",
> +		.data = &meson_t7_dwmac_data,
> +	},
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, meson8b_dwmac_match);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
