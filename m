Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482FC31E823
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 07:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779349643; cv=none; b=FB+5f1myqxfRrqPl0t944mcvinCAzRbQUgTzV5sm4+wZLzh7frN7LUErftAdP5D8RysYLumG4550Lg0gy8Xtu86mao3J13U+wxQLau0mX3Q8tgaETe/rvsbyL+p+t3Nn8Tm/XKk7/wS6i5R6GVvLLft62PupQSLf3uQBQ7k2aA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779349643; c=relaxed/simple;
	bh=iU5klorQ7artPAHJTn2tAINl+Tt6E9v7oVZsgl5gSZU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=amWH9EPnkkSU0BGFuRP6ustP4zcZgSthXN120i2xAMoLtnaV/E3gycgEZr602NVZAALjsYIkc3S8u9Gle8gmE47q6J1eDDRUtfxE2RFiAPqbT4HnF/H2UL/BHwKvkLCypoWzLhrB2cGMrnI9b+SkxgUJRqisVGzhGKsA8RHWUSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BPnezP8d; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BPnezP8d"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4903cbfad68so648955e9.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 00:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779349641; x=1779954441; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hQfvvIZHcwDFSAgb014S9o2dz5FFVIJPNRzHERKBSM0=;
        b=BPnezP8dZjRb4fMPlCulLVZgsmbXhacCDoiVloGR6HMhavVbXJcyKqC5aPktseUbOi
         Zt8ZexkRoHGEn3Xwa5Lf8w2iDVphho53lixo+6A/6Tw5Xx29s/Bb6644NjjDntMsDjN0
         v8kiPiQPqw5n4jtZvhOCIS0tLoD6/DaA6ik0TM9KUQDRjyPj15S6kUJ/5sqrBcROiSxR
         lXe0pzFHTb08wJWhYOlp4PsThc61wCQ5GeWodeXSNIJZ+PznNwBR4CDTSxKE1++rXasU
         AaQKePL+qjqmdmr6Z1UiM6yATnJPMJHlXgtj9VolyZJSAIxVWq7rMeb/miQDfT02QSAC
         emLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779349641; x=1779954441;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hQfvvIZHcwDFSAgb014S9o2dz5FFVIJPNRzHERKBSM0=;
        b=ss11s6MRi+ZohAYExCJmgJ7Z3JP5vnxPxAXHPKBX8vBG2XrKxQGLmFJjgRF1RfFCU7
         LheXPMyOat2QnNl8byCz+6DNSEc5Izz3lLoEKGqOJ98NFpmjVPzsmiZs1eEYz1aOlq5Y
         ExYXM5h9w9csv/BAonftq6mI8fHWaE7MfDs/vUkuOaM35GjX6bI81UlhtgvoJP0Xt1nl
         Bnh+F0AQnH3r/QlRIZOet3niesxBo8I5Gp57LrxlXjDAAxdm9VSuq410g0Hwu3+aGMt5
         gfs76CpcOCSFvivxGCLGQFZWNXdrntbuTIbkUO2K3tWQ1E6ksgahBtJEWAkbXmYM9lml
         DMTw==
X-Forwarded-Encrypted: i=1; AFNElJ9eapbdx9/JzKfDVjlWoNFwI8HTvLlRXGpUBgumjBEZaZ43vwAOaAkSPI+9VYgtpmelADo3vU5mB920@vger.kernel.org
X-Gm-Message-State: AOJu0YxHD8aa/kFuFdsw6UR5ndKRijWVlWu2YhxzoDmb+0EA2daVQUIN
	e4gZ4L2wUf0DU2qFOZEAsX7oY648hob8e4dw6r+JjyRPgk7C/GQN4Rn6pfoj22ifJdg=
X-Gm-Gg: Acq92OHBKbA2/KycVwILnN7AvnR/IHeR/AhMGWcoDXIYpYo7MF1SM7nS0KkGNepTVYB
	PeWHnqdW+qiiwxBWoufBglJzcuKnSVwmBF3P3pSkWK70XI9hvqwj/8Ol4o3tamsZuAbxrCm4TpA
	a3v91qyG68mF7ghkIyPmEokwq4dGHTdk61sB/QUeN8K/e0ldJurqAA3cDMGNtCVm2RBMrvTQbeO
	GJBQyO3cvI2052Zyq5rNb8ZNJJH5i8m2iHeKQp49lbIrynn7v48SbLCQJhmg2qHHPrYZLQPTBkm
	xZXvKQxUqgloBCb5iLeYiTM5b6sMaXgHxESW0DHDW3qTtnosZQlyAiKz0noN/dvVDMRq1Rv5n/+
	p+hqUH59HjpEorVuqbKvyEqRShhr6X+FLblUzlOk461gtIpwFRVXwU1s7z/fK4uBKKMa4Ws5rCL
	ggNEAYhs1qDRSCTnCRk+kadRsA3hAqTHHTsK9z2RfM6R7cCb7ocs6CTOJwv4aBM4Xl08uAIpVUy
	k9v/jY=
X-Received: by 2002:a05:600c:4849:b0:48a:761:5816 with SMTP id 5b1f17b1804b1-4903608030amr10856805e9.8.1779349640664;
        Thu, 21 May 2026 00:47:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:e038:7e8a:7467:8c6c? ([2a01:e0a:106d:1080:e038:7e8a:7467:8c6c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm6987345e9.14.2026.05.21.00.47.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 00:47:20 -0700 (PDT)
Message-ID: <fb1c86bf-44ea-46ed-b93b-6cee579647d8@linaro.org>
Date: Thu, 21 May 2026 09:47:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH V2 4/6] drm/panel: anbernic-td4310: Add RG Vita Pro panel
To: Chris Morgan <macromorgan@hotmail.com>
Cc: Chris Morgan <macroalpha82@gmail.com>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 xsf@rock-chips.com, sre@kernel.org, simona@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 jesszhan0024@gmail.com, heiko@sntech.de, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org
References: <20260515221947.299229-1-macroalpha82@gmail.com>
 <20260515221947.299229-5-macroalpha82@gmail.com>
 <c5ea73cc-ac1f-43ba-bcf1-0083a59bbef9@linaro.org>
 <PH0PR19MB9973388E4A62128DAC3D571E25A5012@PH0PR19MB997338.namprd19.prod.outlook.com>
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
In-Reply-To: <PH0PR19MB9973388E4A62128DAC3D571E25A5012@PH0PR19MB997338.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/20/26 16:29, Chris Morgan wrote:
> On Mon, May 18, 2026 at 03:55:08PM +0200, neil.armstrong@linaro.org wrote:
>> On 5/16/26 00:19, Chris Morgan wrote:
>>> From: Chris Morgan <macromorgan@hotmail.com>
>>>

<snip>

>>> +
>>> +	return dsi_ctx.accum_err;
>>> +
>>> +err_reset:
>>
>> And you don't check it here
> 
> Should I check the value and print an error if it fails? I had planned
> on continuing even after a failure with the shutdown so it could turn
> the device off, unless that's incorrect.

yeah continue and ignore the return value on the error path

> 
>>

<snip>

>>> +
>>> +static void panel_anbernic_td4310_remove(struct mipi_dsi_device *dsi)
>>> +{
>>> +	struct anbernic_panel_td4310 *ctx = mipi_dsi_get_drvdata(dsi);
>>> +	int ret;
>>> +
>>> +	ret = mipi_dsi_detach(dsi);
>>> +	if (ret < 0)
>>> +		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
>>> +
>>> +	drm_panel_remove(&ctx->panel);
>>> +}
>>
>> And drop remove completely
>>
> 
> I take it the devm calls above remove the need for a remove callback?
> I take it that's new? Thank you.

Yep !

> 
>>> +
>>> +static const struct drm_display_mode anbernic_vitapro_modes[] = {
>>> +	{
>>> +		.clock = 140020,
>>> +		.hdisplay = 1080,
>>> +		.hsync_start = 1080 + 50,
>>> +		.hsync_end = 1080 + 50 + 4,
>>> +		.htotal = 1080 + 50 + 4 + 50,
>>> +		.vdisplay = 1920,
>>> +		.vsync_start = 1920 + 15,
>>> +		.vsync_end = 1920 + 15 + 4,
>>> +		.vtotal = 1920 + 15 + 4 + 32,
>>> +		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
>>> +	},
>>> +};
>>> +
>>> +static const struct anbernic_panel_td4310_info anbernic_vitapro_info = {
>>> +	.display_modes = anbernic_vitapro_modes,
>>> +	.num_modes = ARRAY_SIZE(anbernic_vitapro_modes),
>>> +	.width_mm = 69,
>>> +	.height_mm = 121,
>>> +	.bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
>>> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
>>> +		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET |
>>> +		      MIPI_DSI_CLOCK_NON_CONTINUOUS,
>>> +	.format = MIPI_DSI_FMT_RGB888,
>>> +	.lanes = 4,
>>> +	.prepare_delay = 50,
>>> +	.reset_delay = 220,
>>> +	.enable_delay = 120,
>>> +	.disable_delay = 50,
>>> +	.unprepare_delay = 20,
>>> +};
>>> +
>>> +static const struct of_device_id panel_anbernic_td4310_of_match[] = {
>>> +	{
>>> +		.compatible = "anbernic,panel-vita-pro",
>>> +		.data = &anbernic_vitapro_info,
>>> +	},
>>> +	{ },
>>> +};
>>> +MODULE_DEVICE_TABLE(of, panel_anbernic_td4310_of_match);
>>> +
>>> +static struct mipi_dsi_driver anbernic_panel_td4310_driver = {
>>> +	.driver = {
>>> +		.name = "panel-anbernic-td4310",
>>> +		.of_match_table = panel_anbernic_td4310_of_match,
>>> +	},
>>> +	.probe	= panel_anbernic_td4310_probe,
>>> +	.remove = panel_anbernic_td4310_remove,
>>> +};
>>> +module_mipi_dsi_driver(anbernic_panel_td4310_driver);
>>> +
>>> +MODULE_AUTHOR("Chris Morgan <macromorgan@hotmail.com>");
>>> +MODULE_DESCRIPTION("DRM driver for Anbernic TD4310 MIPI DSI panels");
>>> +MODULE_LICENSE("GPL");
>>
>> Thanks,
>> Neil
> 
> Thank you,
> Chris

