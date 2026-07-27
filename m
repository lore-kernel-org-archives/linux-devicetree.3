Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0363368D42
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139462; cv=none; b=FpFuLF3ksi5eluWM9+rtKyY1PqBbPW4gtQzm1mZwtqyBzJNVfX2Xeh+i/SRp7L+YD6ZSZeRctyHLdmpvb9dx3WbL1MTEIYcolDTnOymGjbR5veAx6DBx1xyiB7pPSFNBQcB1R63Nh/lsyG2SlvXiXZTWX4HecT4EetGNDpyNxVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139462; c=relaxed/simple;
	bh=3u+hYJnvNRGvMPKdiEFaTPyEulePqko5jh/9uPRz/H4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LvdG3Zxf7lo6SdXx2sV3fF+BbkcgM8NYLCC2cxQharoPOm6ETP9Db9fgPK4saA/7xFGbrMwZ5Qn4EOvELjyJa7FvAtaccHa+h9M0LlR6+TOdQTdWw9Ua1xvwoUgl1QN6eIMY1Y9RAaz6wsFsJt16yLOUIlqFcVu9dW/p43SO+e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aftQ7V+8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aftQ7V+8"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4954c0833b4so17724605e9.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 01:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785139459; x=1785744259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xd75XOFG6MI6SSmMzmzUNCQ9J2ICEZ+cfKFnWtQ1msk=;
        b=aftQ7V+8U+Iefp+YNAmO/wzc36pCJPTxSSw1iWBrlEyltivt9cyUy7M8WhqDe4r0yt
         u+4wNTR6ohf1KEKLgn3qaDUHa5Vd9WLVVYrom+tAWHMvsRxEGbgnktIhaibnOFIU9PLx
         tdyPfW2wckSDi3KDFOUa28N7H4DHDKntxURqrJ5EcHILPQ24Cl4Hg/iMOHSibN3TsF79
         /deZHJPglhmd7+b/LnRqLP7V4ysdFuuXeb5bD65lHJp0SM8HOY74J7K4izsTiJOCBbLc
         /l4DOCU7jfwkQ2pHuKU2YvvdJWvR4/jyJG8+ttLUfhRgQNT77Z37VG1DxHQNV7B9p0XN
         nRTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785139459; x=1785744259;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xd75XOFG6MI6SSmMzmzUNCQ9J2ICEZ+cfKFnWtQ1msk=;
        b=shTaV6drovTpl375qBad7IQ19br6hCJA0uWKK+LFHP5ix+2D1e6y1hTmhHld9u9Hko
         /Gr/0BBiaIsoY7IDMiLrvk8WH8s1c/p0aW2UZiodj1xkEQVl7WKUPzTdnS+Bxln9vtIU
         eSsXomvASkd7cjpmtK+4I46noz0VNRFUjm4Qj6Ije/u3Z4/SBkB8crpMAZUFdByEDV0v
         I2HbC578F5D1gI+yWJ0qzbVh26uu/CXYe9HIYVNigJIAXjXj/TkCZix10qqr9lEyRo3a
         UqSpuoaXmczEDaH3qngYP3AandUjro83Xo+1v/2+++3szgcw637VeDzSISQK2/K8KneA
         yckA==
X-Forwarded-Encrypted: i=1; AHgh+Rrwe4QMSJTiEqa5R52ZAwqMN6arT2xl+6NWeYAUiarqrFmVbGQmXM4YSPkWLaKgtBSvmGOv3iNL6pd9@vger.kernel.org
X-Gm-Message-State: AOJu0YzgN2ox1InVislG3BJ9UvhTpOF5+XCoioFotHiSS4GRBf8iggoh
	RKMpbL8NEiWMi4m3CkMa2/6ZwhBuTzuQ60+o8zvsbYi5FG3x/KsQBmVtfM5FL/cfM/Q=
X-Gm-Gg: AR+sD13JcEj2KpUzzn5tWEXy+oMd9vocC/qJjmfHXwqzbINVhFI0yKvpC/XPan4yTLQ
	eA3NMs77vxRg0vPdK0jHX+YkFMlQ4kuYlghgXoqoG4W+3ItG16gmasbMUoyO2POVFggu8AJ5cr9
	5UoUHrPHVFlCEmsOrjw+YMqTrmb9Ue4fzZ2l0/miZn7shoRAtxwgfr88yKYvt4TZwNS/bgnWyuI
	4x7esqVw0TT4arG6VGSUBOgc6A6qB6hYFqPDPnJdJ8hxhn/z9Akc1jJrw1lZLwE/bwVLJ3WPFys
	UwmDsA4VklKGhTQoGWWtfIZPqROR6+eMpnTLJLcmJjvvF/iL5g3ccKgR97/pnVWhyvuXSZeDozK
	ZTYlQQnKK4NEfP4gRAveC4FLpnYxtI0sh2b3vXgdJRGQg/g1FSzkbrqfTqdgf1S7UJZzIMUWW9K
	M1wmNC2ye769g1D70qwCIETN0KX0fl9hMP/dUPKegZFzXVFv1iU2vcypreKg==
X-Received: by 2002:a05:600c:e549:10b0:495:7040:c7e9 with SMTP id 5b1f17b1804b1-496b56e6e65mr62075395e9.6.1785139458852;
        Mon, 27 Jul 2026 01:04:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:9be5:334f:bd8a:8041? ([2a01:e0a:106d:1080:9be5:334f:bd8a:8041])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496ba82468bsm148945385e9.4.2026.07.27.01.04.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 01:04:18 -0700 (PDT)
Message-ID: <6839921c-bfbe-4733-b61d-53c454de958f@linaro.org>
Date: Mon, 27 Jul 2026 10:04:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: st7703: Add AYANEO Pocket DS Lower Panel
 Support
To: azkali.limited@gmail.com, =?UTF-8?Q?Guido_G=C3=BCnther?=
 <agx@sigxcpu.org>, Purism Kernel Team <kernel@puri.sm>,
 Ondrej Jirman <megi@xff.cz>, Jessica Zhang <jesszhan0024@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260723-b4-st7703-pocketds-lower-v1-0-e3db246589f4@gmail.com>
 <20260723-b4-st7703-pocketds-lower-v1-2-e3db246589f4@gmail.com>
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
In-Reply-To: <20260723-b4-st7703-pocketds-lower-v1-2-e3db246589f4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/23/26 13:26, Alexandre Hamamdjian via B4 Relay wrote:
> From: Alexandre Hamamdjian <azkali.limited@gmail.com>
> 
> Add support for the lower (secondary) panel of the AYANEO Pocket DS, a
> dual-screen QCS8550 (Snapdragon 8 Gen 2) handheld. It is a 5.0" 1024x768
> 4:3 IPS LCD driven by a Sitronix ST7703 DDIC: every command in the vendor
> init sequence maps to an ST7703 manufacturer command (SETEXTC, SETMIPI,
> SETRGBIF, SETSCR, SETPOWER, SETGAMMA, SETGIP1/2), and the SETMIPI and
> SETRGBIF payloads are near-identical to the already-supported Powkiddy
> RGB10MAX3.
> 
> The panel is mounted in portrait (768x1024) and rotated 270 degrees in
> the device, expressed through the panel rotation property. The SETEXTC
> unlock password ends in 0x87 rather than the canonical 0x83; this is the
> value shipped by the vendor firmware and is kept verbatim.
> 
> Init sequence extracted from the AYANEO Pocket DS BSP kernel, via the
> ROCKNIX SM8550 port.
> 
> Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-sitronix-st7703.c | 96 +++++++++++++++++++++++++++
>   1 file changed, 96 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> index 6c348fe28955..bfc03bdf3816 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -47,6 +47,7 @@
>   #define ST7703_CMD_SETCABC	 0xC8
>   #define ST7703_CMD_SETPANEL	 0xCC
>   #define ST7703_CMD_SETGAMMA	 0xE0
> +#define ST7703_CMD_UNKNOWN_E1	 0xE1
>   #define ST7703_CMD_SETEQ	 0xE3
>   #define ST7703_CMD_SETGIP1	 0xE9
>   #define ST7703_CMD_SETGIP2	 0xEA
> @@ -673,6 +674,100 @@ static const struct st7703_panel_desc gameforcechi_desc = {
>   	.init_sequence = gameforcechi_init_sequence,
>   };
>   
> +static void ayaneo_pocket_ds_lower_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
> +{
> +	/* Init sequence extracted from the AYANEO Pocket DS BSP kernel. */
> +
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETEXTC, 0xf1, 0x12,
> +				     0x87);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETDISP, 0x00, 0x01,
> +				     0x78);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETRGBIF, 0x10, 0x10,
> +				     0x28, 0x28, 0x03, 0xff, 0x00, 0x00, 0x00,
> +				     0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETCYC, 0x80);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETBGP, 0x0a, 0x0a);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETVCOM, 0x90, 0x90);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETPOWER_EXT, 0x76,
> +				     0x22, 0xf0, 0x13);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETMIPI, 0x33, 0x81,
> +				     0x05, 0xf9, 0x0e, 0x0e, 0x20, 0x00, 0x00,
> +				     0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x25,
> +				     0x00, 0x91, 0x0a, 0x00, 0x00, 0x01, 0x4f,
> +				     0x01, 0x00, 0x00, 0x37);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETVDC, 0x47);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_UNKNOWN_BF, 0x02, 0x10,
> +				     0x00, 0x80, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETSCR, 0x73, 0x73,
> +				     0x50, 0x50, 0x00, 0x00, 0x12, 0x73, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETPOWER, 0x55, 0x00,
> +				     0x32, 0x32, 0x77, 0xf1, 0xf7, 0xf7, 0xcc,
> +				     0xcc, 0x7f, 0x7f, 0x11, 0x11, 0x00, 0x00,
> +				     0x32);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETIO, 0xb8, 0x00,
> +				     0x0a, 0x10, 0x01, 0x09, 0x00, 0x00, 0xed,
> +				     0xc5, 0x00, 0xa5);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETCABC, 0x10, 0x40,
> +				     0x1e, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETPANEL, 0x0b);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETGAMMA, 0x00, 0x00,
> +				     0x00, 0x25, 0x31, 0x3f, 0x26, 0x29, 0x04,
> +				     0x08, 0x0d, 0x0e, 0x12, 0x0f, 0x11, 0x12,
> +				     0x18, 0x00, 0x00, 0x00, 0x25, 0x31, 0x3f,
> +				     0x26, 0x29, 0x04, 0x08, 0x0d, 0x0e, 0x12,
> +				     0x0f, 0x11, 0x12, 0x18);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_UNKNOWN_E1, 0x11, 0x11,
> +				     0x91, 0x00, 0x00, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETEQ, 0x07, 0x07,
> +				     0x0b, 0x0b, 0x0b, 0x0b, 0x00, 0x00, 0x00,
> +				     0x00, 0xff, 0x84, 0xc0, 0x10);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETGIP1, 0xc8, 0x10,
> +				     0x04, 0x04, 0x02, 0x80, 0x81, 0x12, 0x31,
> +				     0x23, 0x2f, 0x80, 0x80, 0x81, 0x27, 0x20,
> +				     0x00, 0x00, 0x0f, 0x00, 0x00, 0x00, 0x00,
> +				     0x00, 0x0f, 0x00, 0x00, 0x00, 0x44, 0x00,
> +				     0x88, 0xff, 0x00, 0x22, 0x44, 0x66, 0x88,
> +				     0x88, 0x88, 0x55, 0x11, 0x88, 0xff, 0x11,
> +				     0x33, 0x55, 0x77, 0x88, 0x88, 0x88, 0x00,
> +				     0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,
> +				     0x00, 0x00, 0x00, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_SETGIP2, 0x00, 0x00,
> +				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +				     0x00, 0x00, 0x00, 0x11, 0x55, 0xff, 0x88,
> +				     0x77, 0x55, 0x33, 0x11, 0x88, 0x88, 0x88,
> +				     0x00, 0x44, 0xff, 0x88, 0x66, 0x44, 0x22,
> +				     0x00, 0x88, 0x88, 0x88, 0x23, 0x00, 0x00,
> +				     0x00, 0xec, 0x00, 0x00, 0x00, 0x00, 0x00,
> +				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +				     0x00, 0x00, 0x00, 0x20, 0x80, 0x81, 0x00,
> +				     0x00, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, ST7703_CMD_UNKNOWN_EF, 0xff, 0xff,
> +				     0x01);
> +}
> +
> +static const struct drm_display_mode ayaneo_pocket_ds_lower_mode = {
> +	.hdisplay	= 768,
> +	.hsync_start	= 768 + 110,
> +	.hsync_end	= 768 + 110 + 45,
> +	.htotal		= 768 + 110 + 45 + 110,
> +	.vdisplay	= 1024,
> +	.vsync_start	= 1024 + 18,
> +	.vsync_end	= 1024 + 18 + 6,
> +	.vtotal		= 1024 + 18 + 6 + 16,
> +	.clock		= 65946,
> +	.width_mm	= 76,
> +	.height_mm	= 102,
> +};
> +
> +static const struct st7703_panel_desc ayaneo_pocket_ds_lower_desc = {
> +	.mode = &ayaneo_pocket_ds_lower_mode,
> +	.lanes = 4,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +		      MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.init_sequence = ayaneo_pocket_ds_lower_init_sequence,
> +};
> +
>   static int st7703_enable(struct drm_panel *panel)
>   {
>   	struct st7703 *ctx = panel_to_st7703(panel);
> @@ -916,6 +1011,7 @@ static void st7703_remove(struct mipi_dsi_device *dsi)
>   
>   static const struct of_device_id st7703_of_match[] = {
>   	{ .compatible = "anbernic,rg353v-panel-v2", .data = &rg353v2_desc },
> +	{ .compatible = "ayaneo,pocket-ds-lower-panel", .data = &ayaneo_pocket_ds_lower_desc },
>   	{ .compatible = "gameforce,chi-panel", .data = &gameforcechi_desc },
>   	{ .compatible = "powkiddy,rgb10max3-panel", .data = &rgb10max3_panel_desc },
>   	{ .compatible = "powkiddy,rgb30-panel", .data = &rgb30panel_desc },
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
