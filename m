Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676CD3DE442
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 11:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779966323; cv=none; b=fzi4zGqgJDJUIPrbQ9xp06xGyEmKeTA9hdPUI0NLrv4lXV3BaALa/hMt39SBbNR9d5nsgntESDMaSfkxAjkMNx62M5qdVTa2SF9T4GjtsXk1SYZtprKW0n0X0k58hTsPXY6OLYHINNLgGN84inX6c+n8U1y63EnuzaFKeAobHLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779966323; c=relaxed/simple;
	bh=/WxIwY/XkoRLLlx2TkO+oBdM9YRRcgTtohziHjgeml4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kvWsLvFLG463t1f3k7QHQg1f270y61Vtl4MWWHhuXPvUrLSfmNdxIJKYHH3LDUzRBbfO0WoGfhBqvrcf1S+/VbLETdREiXM3oWoNy4oiRBUkqc71WAMljG/k9Qy2xBGxbl7JK2Kr22rf86ITxxoY62Wg3KsB27B94zvzhzv6rYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XHO9Pm3o; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XHO9Pm3o"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ee6d32402so297596f8f.1
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 04:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779966319; x=1780571119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/WBV2stTi+BoMvjTn+6Wdm0ar2Vhc8k/vzOLTV4C0Ts=;
        b=XHO9Pm3oF4xM9wdP4a4ht+t6j3WWsN3wBkc0HFptC0KwFyRG5bjoQKX+YNpcV/SlNn
         L+Azpxrj4YJX2jpiSDLzpS6r/MrnOzgl6UjudW3OZXP3/ZHJ5lj1aflbUf279OFs8Z6v
         BrR5QgDfuNjUM/SuZLKzme0Ba3DoAIxHJ7ig7dOj6HbHMJlZ6CokTCisjflr7oW28rIG
         2eGfNsYnS8gLfYeQRkCU5cYDUSoJKEZsk3L5DcSzd9t3/sbf1BsMaqScmLrGJIFlfqgW
         BIxi6sdgxRK53XMVlsauk5xlfkDS5mSzq+yyJvsOsHGZGyJ8NRRW+dMAxG+FJaWu0Uol
         vCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779966319; x=1780571119;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WBV2stTi+BoMvjTn+6Wdm0ar2Vhc8k/vzOLTV4C0Ts=;
        b=ox0ITTl0UWt03CWaeEReu4ezPlj/60bqT5JHF6F+H5Z4voixH5dZoX6EkKuThp8JFX
         oAGfBI4GtCG2eJDE2ynIYyYmV06FqifX60dwepFj5BarIuPABbJOUwLhhY9AGQLZx1om
         lXpdZPh1rU5CUbhhTBaulFSiKKdJ/3wN/NemW0fyqYw0oPAl93WFcrPNqSnZ2phO5kSh
         14fP21N06F1fon0R4Iw0Iw6tUSncOcejOvIl5EVicIihKNUSFYBzAaym/ysaKVo4Mgp8
         cAqmmX8UW4zdZ/B4hrx9aEswV2mlhYj0stRne8eNq+2+5YRBFZHXyRjDUI16qTXkk2Tn
         NUJA==
X-Forwarded-Encrypted: i=1; AFNElJ/pvdkFw793DHYWApF6OHjxiBkjBYHnIauu5C2rTghNuP1NnW2LzcbYY3xBSF4b8euB/6SWA3hFiv5s@vger.kernel.org
X-Gm-Message-State: AOJu0YxXQ4M+zKBf+8KvDT1pDptW2TNZ16IliWdjRJDRdXatU2zjao/t
	7wYKy55dKWG491gfIzmc5iB1mpioP6UUVykoy39PQ37M7LqiBwc6AjPC7XijNr5Ntks=
X-Gm-Gg: Acq92OHHG3yJjeEeteK4aEyZY59UhTqy9FLR3qQZ1zmVC5mv/v9O0ddOxHUIjq6o/s1
	m4Qd/IvUtI96vxJ3vT1/3pkI64diWsdDLhOcUJpzad6YZda6Rb55Bqac83aNy/C801suglrCIRn
	2Uff3dG761GiHBLAOOBHISMJ3cCcECYyNoENDKBO8in37ScFXrVut0rqes5FGvCQ2WgkxehPftw
	dDkVL543S7smdNYaBlfWEuvniR/+Tl4XHTcZgC55nRPuVhNDGyQZeLGXR3hU0weCSg0eRgdtqSG
	Uh1AVRU5NqARIJfrOUSt3yGzN3UHHX9k1hj7wM8PJpvdGTEd53dFZ69ncEdpeE+DWcBOfSf46hE
	ILrI0MF1TMz0NsVHoC8osqtCDlFa0hznJ/25FK3kN0BKxDszyODCc1xQ4SdB+XbnDsukHSv+/LW
	SIhho85+ivNf+Gn1WNrb/WfX6saYnuOKfCK9flec6ekLo=
X-Received: by 2002:a05:600c:4f52:b0:490:4f91:5519 with SMTP id 5b1f17b1804b1-4904f91568dmr456980265e9.18.1779966318522;
        Thu, 28 May 2026 04:05:18 -0700 (PDT)
Received: from [172.20.10.2] ([37.167.60.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5584b8sm12243364f8f.11.2026.05.28.04.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 04:05:18 -0700 (PDT)
Message-ID: <e8526e33-d34b-4900-81f1-f0a16edca388@linaro.org>
Date: Thu, 28 May 2026 13:05:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/2] drm/panel: Add Ilitek ILI9488 controller driver
To: Igor Reznichenko <igor@reznichenko.net>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Kael D'Alcamo <dev@kael-k.io>,
 Kever Yang <kever.yang@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260527062300.88928-1-igor@reznichenko.net>
 <20260527062300.88928-3-igor@reznichenko.net>
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
In-Reply-To: <20260527062300.88928-3-igor@reznichenko.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 5/27/26 08:23, Igor Reznichenko wrote:
> Add support for Ilitek ILI9488 DSI controller which is used in
> FocusLCDs E35GH-I-MW800-CB 320x480 MIPI DSI panel. The mode timing
> was adjusted after STM32MP157 testing. The previous 14.256 MHz mode
> worked on AM62P, but was awkward for STM32 DSI/LTDC clock synthesis.
> 
> Signed-off-by: Igor Reznichenko <igor@reznichenko.net>
> ---
>   MAINTAINERS                                  |   6 +
>   drivers/gpu/drm/panel/Kconfig                |   9 +
>   drivers/gpu/drm/panel/Makefile               |   1 +
>   drivers/gpu/drm/panel/panel-ilitek-ili9488.c | 299 +++++++++++++++++++
>   4 files changed, 315 insertions(+)
>   create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9488.c

<snip>

> +
> +static int ili9488_dsi_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct ili9488 *ili;
> +	int i, ret;
> +
> +	ili = devm_drm_panel_alloc(dev, struct ili9488, panel, &ili9488_funcs,
> +				   DRM_MODE_CONNECTOR_DSI);
> +	if (IS_ERR(ili))
> +		return PTR_ERR(ili);
> +
> +	ili->desc = device_get_match_data(dev);
> +	mipi_dsi_set_drvdata(dsi, ili);
> +	ili->dsi = dsi;
> +
> +	dsi->mode_flags = ili->desc->mode_flags;
> +	dsi->format = ili->desc->format;
> +	dsi->lanes = ili->desc->lanes;
> +
> +	ili->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ili->reset))
> +		return dev_err_probe(dev, PTR_ERR(ili->reset),
> +				     "failed to get reset-gpios\n");
> +
> +	for (i = 0; i < ARRAY_SIZE(ili->supplies); i++)
> +		ili->supplies[i].supply = regulator_names[i];
> +
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ili->supplies),
> +				      ili->supplies);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to get regulators\n");
> +
> +	ret = of_drm_get_panel_orientation(dev->of_node, &ili->orientation);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get orientation\n");
> +
> +	ret = drm_panel_of_backlight(&ili->panel);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get backlight\n");
> +
> +	ili->panel.prepare_prev_first = true;
> +	drm_panel_add(&ili->panel);
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "failed to attach to DSI host\n");
> +		drm_panel_remove(&ili->panel);
> +		return ret;
> +	}

Please switch to devm_drm_panel_add() and devm_mipi_dsi_attach() and drop the remove callback.

> +
> +	return 0;
> +}
> +
> +static void ili9488_dsi_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct ili9488 *ili = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", ret);
> +
> +	drm_panel_remove(&ili->panel);
> +}
> +
> +static const struct ili9488_desc e35gh_i_mw800cb_desc = {
> +	.init_sequence = e35gh_i_mw800cb_init,
> +	.display_mode = &e35gh_i_mw800cb_display_mode,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> +		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +	.format = MIPI_DSI_FMT_RGB666_PACKED,
> +	.lanes = 1,
> +};
> +
> +static const struct of_device_id ili9488_of_match[] = {
> +	{ .compatible = "focuslcds,e35gh-i-mw800cb", .data = &e35gh_i_mw800cb_desc },
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, ili9488_of_match);
> +
> +static struct mipi_dsi_driver ili9488_dsi_driver = {
> +	.probe	= ili9488_dsi_probe,
> +	.remove	= ili9488_dsi_remove,
> +	.driver = {
> +		.name		= "ili9488-dsi",
> +		.of_match_table	= ili9488_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(ili9488_dsi_driver);
> +
> +MODULE_AUTHOR("Igor Reznichenko <igor@reznichenko.net>");
> +MODULE_DESCRIPTION("Ilitek ILI9488 Controller Driver");
> +MODULE_LICENSE("GPL");

Thanks,
Neil
