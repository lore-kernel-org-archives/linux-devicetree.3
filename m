Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7482B423EAE
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 09:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738066; cv=none; b=bys9ixY0MZslzDTF7qAcKEFMK6Gr8Ue4nbWDLX8/GuMI5u5gKFsqUM2cQsw0VFkTsxB2iVUtKJ8DjH7Pblfe4K9P1DIZMhJa5dlIIraXazsa6AAUuYGDCdZ+VnuxsLe0kFEno4KauCTymAtaiVaPnn3MspYe/eUoP2DSby4l584=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738066; c=relaxed/simple;
	bh=8fFg9ED/ROd60XizeBWJbyCXDyM27TOjkHL+V1F8IPg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gJ+g0PKrYkXQavZCvV4gGC2MIEfiszQWIAXfCWr4A1Uwe/aNXc3x6hrqPKgfalX6z/LY8fa1ena3sLLxtl9egDpAFfi20GKvYxu4SvUzxezFOGx5f2IEoByqGZ4zw1wET4hxurXukjjW7hpSSiv8t/1d7fuZQsQVsFCAm5VAruk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bVzaqwoE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bVzaqwoE"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4996f1ee4a4so4869685e9.2
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 02:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787738063; x=1788342863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SDtTT4dCnjJ69lmBAdXwlid3ixyj5+6saySsWKlL1vI=;
        b=bVzaqwoExEz9+hlVQmykQ374Phnlo5f7OamtY7qR5fan7vtYAjC/590e4tl4uuH8M6
         cSL9lle7jmYfpxMCxcfb07udmnwXp5gCOvhm/KH930vKMSxXriFQ0aIG5mSiJ+C0X+TH
         6qO4kJRPlN8GEKQPQDgDiBHFfUFxvyCtRtUAO6yMtWCszVw8x8Ss8fktKcYgynDYJe4t
         Uab21h5hTJ5+oY+IZcXNJF/3qLubsCHR62cYg3cXckcFEPwN8W02VoxBFGwzeNHyUCLD
         7yTdNZM0tHe+T71TPY6Q/RQgV2gKVgikDJ1q3c8VZyHDmqXX1E8dINQSYDlaWuFn2+Zy
         7zjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787738063; x=1788342863;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SDtTT4dCnjJ69lmBAdXwlid3ixyj5+6saySsWKlL1vI=;
        b=GcE04e+j/CFdJu/VueUlK8AfKWeFqr+07R8QWk62J2nC6REAuS4OX1wBX3r5HNMBXF
         dzGusefBYQ0y8tJpmLOzAnhJe4acOyR6L92RfPG6ha8QyEuWxXjYQRNrlL9ONlSrIhzg
         TN3lqDKDENPl2hFQAmvplsLM47ywd37vHZJFOarKG2D0RyB+5lo29/Uj/TWGdWLrtUSf
         zBdR8Szs3UswQy3JrgXRFTi+67HCSIs/cvM8YOwuSo11r+Oz7HtoZ5VFbAhr9Cm11peC
         u2pZoXxGgYzF/TrAqNN9rSW+yXAu5lzrobPCzZefZ3eveaM19uM2SdJXq1qY75GN+cLD
         XrPQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZzOu13AqBy6v9dtPs3lnbnoitLhnHEbKWpOjBBgbeoqAUVgoJ3YlhiU6SjB/zSG1SXcBzu4xzLgnX@vger.kernel.org
X-Gm-Message-State: AFuF++lPQC29hQsgukWROHZEpHxm4W8heVP0wTs224GPaQGk9GJz7uh/
	vBEx8MzdElYnlRNp5Gd2aKUXQWsTqHu6BEaQ/MqqUkGewR0/bMpolcsasMvAmQiXqdua56AD7R6
	7jsK1t1s=
X-Gm-Gg: AR+sD10yFtI9Pii/FSBRW+ktJiaQ8nz0uj0O1hOVhUywcJOIRMuGzowcTTT3TRgeSEm
	SlUhsPzUOw+9GIUL5vtzcpQui7zkwo/pwih04I+Gw1N5PZ3sRvr5NLUXG4zbUaOgtnsjrFfm7J8
	LDL2GDyTfySn1pYHLvo32STtCUEIoOxfs7GKNvgkcTXA0AOJWxz5anQM1K6+GpgmBCfH9RUkU1t
	kOeMldVTqRVf9SYOd6Gm5ZqG9FAK9sJP3h5ilCo6egkhV7SoFErI1vZIY4gfGYZskdW1Nhl9tXz
	ZHcVrVd5OXcmac3deDH2n393YnkAgp/tNNUobsTKAn4AO4ItE+ZbM3QppAnhsB65XY+uEJWYfXP
	YLdI/WBSckg5TAss60PF5RJjNYJxL2ZdJXlWfKbTcFEjbb4tHptfHd7YKAsWNiqvsiR4hUey7uX
	MBJBlBA89OpLJg6ltDBYYcRY4eNfusVGgFo8cmuAE3cNhkGoezbTxewFpuBq/wM5ugWg9XI0C1B
	IATmoJ6MsSM+uvW5IVNupwYpVNk0f2D8p4+5drisG40lQ==
X-Received: by 2002:a05:600c:a43:b0:497:fecd:5b00 with SMTP id 5b1f17b1804b1-499dc717e27mr42328835e9.9.1787738062562;
        Wed, 26 Aug 2026 02:54:22 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:135f:84f0:37f7:9223:8e7a:9b5f? ([2a0d:e487:135f:84f0:37f7:9223:8e7a:9b5f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm21065975e9.2.2026.08.26.02.54.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 02:54:22 -0700 (PDT)
Message-ID: <40d0cb7c-eabd-45e0-aa4c-5638cc71b8db@linaro.org>
Date: Wed, 26 Aug 2026 11:54:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/4] drm/panel: visionox-vtdr6130: Add Retroid Pocket 6
 panel
To: webgeek1234@gmail.com, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260814-rp6-panel-v1-0-111c1aeccf0f@gmail.com>
 <20260814-rp6-panel-v1-4-111c1aeccf0f@gmail.com>
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
In-Reply-To: <20260814-rp6-panel-v1-4-111c1aeccf0f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/26 20:17, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> Add support for the 1080x1920 panel used in the Retroid Pocket 6.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 114 ++++++++++++++++++++++++
>   1 file changed, 114 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> index 805c9846c2a0b..5c826f95ec478 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> @@ -64,6 +64,82 @@ static void visionox_vtdr6130_reset(struct visionox_vtdr6130 *ctx)
>   	usleep_range(10000, 11000);
>   }
>   
> +static int retroidpocket_rp6_on(struct visionox_vtdr6130 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
> +	struct drm_dsc_picture_parameter_set pps;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x01);
> +	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx,
> +				     MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
> +	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0xff07);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x00);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x11, 0x00, 0x00, 0x89,
> +				     0x30, 0x80, 0x07, 0x80, 0x04, 0x38, 0x00,
> +				     0x14, 0x02, 0x1c, 0x02, 0x1c, 0x02, 0x00,
> +				     0x02, 0x25, 0x00, 0x20, 0x01, 0xd5, 0x00,
> +				     0x07, 0x00, 0x0d, 0x05, 0x7a, 0x05, 0x16,
> +				     0x18, 0x00, 0x10, 0xf0, 0x03, 0x0c, 0x20,
> +				     0x00, 0x06, 0x0b, 0x0b, 0x33, 0x0e, 0x1c,
> +				     0x2a, 0x38, 0x46, 0x54, 0x62, 0x69, 0x70,
> +				     0x77, 0x79, 0x7b, 0x7d, 0x7e, 0x01, 0x02,
> +				     0x01, 0x00, 0x09, 0x40, 0x09, 0xbe, 0x19,
> +				     0xfc, 0x19, 0xfa, 0x19, 0xf8, 0x1a, 0x38,
> +				     0x1a, 0x78, 0x1a, 0xb6, 0x2a, 0xb6, 0x2a,
> +				     0xf4, 0x2a, 0xf4, 0x4b, 0x34, 0x63, 0x74,
> +				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xaa, 0x10);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb1, 0x02, 0x15, 0x00, 0x14,
> +				     0x00, 0x20, 0x00, 0x02, 0x16, 0x00, 0x14,
> +				     0x07, 0xb4, 0x00, 0x02, 0x16, 0x00, 0x14,
> +				     0x00, 0x10, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xaa, 0x14);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2, 0x03, 0x33);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb4, 0x0a, 0x72, 0x00, 0x00,
> +				     0x0a, 0x72, 0x00, 0x00, 0x0a, 0x72, 0x00,
> +				     0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb5, 0x00, 0x1e, 0x1e, 0x1e,
> +				     0x1e, 0x1e, 0x1e, 0x06, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb9, 0x00, 0x00, 0x08, 0x1e,
> +				     0x1e, 0x1e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbc, 0x10, 0x00, 0x00, 0x08,
> +				     0x11, 0x1e, 0x7c, 0x1e, 0x7c, 0x1e, 0x7c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbe, 0x10, 0x10, 0x00, 0x0c,
> +				     0x22, 0x1e, 0x62, 0x1e, 0x62, 0x1e, 0x62);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x5a, 0x80);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x13);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfd, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x5a, 0x81);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf9, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x5a, 0x83);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf8, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xaa, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x5a, 0x00);
> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 150);
> +
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 50);
> +
> +	drm_dsc_pps_payload_pack(&pps, dsi->dsc);
> +	mipi_dsi_picture_parameter_set_multi(&dsi_ctx, &pps);
> +	mipi_dsi_compression_mode_multi(&dsi_ctx, true);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
>   static int visionox_vtdr6130_on(struct visionox_vtdr6130 *ctx)
>   {
>   	struct mipi_dsi_device *dsi = ctx->dsi;
> @@ -204,6 +280,43 @@ static int visionox_vtdr6130_unprepare(struct drm_panel *panel)
>   	return 0;
>   }
>   
> +static const struct drm_display_mode retroidpocket_rp6_modes[] = {
> +	{
> +		.clock = (1080 + 22 + 2 + 16) * (1920 + 16 + 2 + 20) * 120 / 1000,
> +		.hdisplay = 1080,
> +		.hsync_start = 1080 + 22,
> +		.hsync_end = 1080 + 22 + 2,
> +		.htotal = 1080 + 22 + 2 + 16,
> +		.vdisplay = 1920,
> +		.vsync_start = 1920 + 16,
> +		.vsync_end = 1920 + 16 + 2,
> +		.vtotal = 1920 + 16 + 2 + 20,
> +	},
> +};
> +
> +static struct visionox_vtdr6130_desc retroidpocket_rp6_panel_desc = {
> +	.modes = retroidpocket_rp6_modes,
> +	.num_modes = ARRAY_SIZE(retroidpocket_rp6_modes),
> +	.width_mm = 69,
> +	.height_mm = 122,

With the dimension in the mode:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

> +	.bpc = 8,
> +	.lanes = 4,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET |
> +		      MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +	.init_sequence = retroidpocket_rp6_on,
> +	.dsc = {
> +		.dsc_version_major = 0x1,
> +		.dsc_version_minor = 0x1,
> +		.slice_height = 12,
> +		.slice_width = 540,
> +		.slice_count = 2,
> +		.bits_per_component = 8,
> +		.bits_per_pixel = 8 << 4,
> +		.block_pred_enable = true,
> +	},
> +};
> +
>   static const struct drm_display_mode visionox_vtdr6130_modes[] = {
>   	{
>   		.clock = (1080 + 20 + 2 + 20) * (2400 + 20 + 2 + 18) * 144 / 1000,
> @@ -357,6 +470,7 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
>   }
>   
>   static const struct of_device_id visionox_vtdr6130_of_match[] = {
> +	{ .compatible = "retroidpocket,rp6-panel", .data = &retroidpocket_rp6_panel_desc },
>   	{ .compatible = "visionox,vtdr6130", .data = &visionox_vtdr6130_panel_desc },
>   	{ /* sentinel */ }
>   };
> 

