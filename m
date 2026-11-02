Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625853;
	b=1VQozp3JpY7YkDUftBtBKfv+y15/dRzBznRRjbQEqRmx175GRaciAWujEy3DJva4j0dB
	 74X5IY4hTPsUnGXPyMhvdkdpOLKGExrwmzU25c7KH4cxDsLcK2LtT7J2aZN/uiKyyLt/a
	 l1WzYJ0kVlGUT9adsznfONCLQoeE2K7UnN0BUSwM3OcPOal4Uh1KTPNuDBctjwXKmoqn2
	 IvW0YdYxHi/vJ7QL0nuFJQAdIPo53QKBuE7sUoUL3pD94q39pSNWw2Hjo6EV0qyL2+kZD
	 /DIgWX674gOKsgLwb0JmSmoE3/G+owvt9olGlhA1P7lzV5TTG1E5vngHcvdP+hEcwJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=wrlc0uPOpWufY4Ha9PM3YaR+47hyRCDT/vlwyZbcxAs=;
	b=AUQbRNkF1DqSamF5mpufVBBmJeISgHRDV+9qOyXWw7aWt5VmBOv4zJF+yriZjsLqNOgC
	 +B91Qd28Mhyk1YVK4b4lbwSWTsa/EWE39KuI74jXD3YGUMkvzic5hPi7f+XO53A+N67/c
	 clhVYt4X7lr/eJyGvlXRy8dccPlsOBtPdt6Q7B7CIpPtU1IxEtCD/Iii/ViJiXnbKEXcO
	 jGPGYXZvEXuY35pUdFdhEqKiDIrfHjqvIZkWIwxJDtjAaOyKqKWkPXhMW8SLyNOdNwaPX
	 8hnA7wDiH2mY/DeeB1YKdGbN3PuhhqBhNy5djnQkoDVV+94WMV57P/r5MCc3j3CwQFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ho7ooRX2;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E157606A327
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:24:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E157606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ho7ooRX2
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso26595435e9.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 05:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793625851; x=1794230651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wrlc0uPOpWufY4Ha9PM3YaR+47hyRCDT/vlwyZbcxAs=;
        b=ho7ooRX2b+ftGMMlHNxcrpTVg9BtdfxBjbgVRteQAi3eHmrF22rXICGR/rpE/i+LT9
         J969Ox0wbROQEo2Z9qcFPgXPI2GJGGG+I+60lJaFKmCnfW+1qZ1XW2Gz2Qc+YZGBgrf3
         E/0t9WbDqlF9jU/qNsnOUfnocCAyQfv3MOObWc5w3OHsMlvz8CuTYewbwUuPZzxW3jzf
         TKWsqNjMdf62cazsY7GRs3P0EnoD1oStfU1HHiNUlRfE9lSYoPMcJZ6uJaODLTMx2BmP
         lgYwc/eRwPO6dNLpMVgP05iCWlZgX6q2RCGEBKimIlS14jnKYjgPTm7dSLN46RASuzTx
         6XoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625851; x=1794230651;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wrlc0uPOpWufY4Ha9PM3YaR+47hyRCDT/vlwyZbcxAs=;
        b=jXuusgZdTtMiBGovPLUlF7IJSAmc63Zgy0azeEe9VrWuc2P+xc7SjV2KqVVZ7FQk0w
         EeF86VXSoQHBBnETJV2JARCwxTYzFdHCoT41R2dEHDRWpujEILlrWmtq88PQv0BLUfQO
         48fO3Ny+wgVv3Pct3666Hf/agy7D6kgFTkS8s0jIpnrROBj4lRG8iydUzenOYH1EL9SN
         sYe8gQ1ep/zXRFbAlWaTgfcRI+SScgCXV9GGHPDVQQfOuNUqf3X98vlwc8He6/e7hhDd
         RCWUcSPZBzDiPGbixO/Emg0gG/x8YA+YKOVqUNfyOrhShaxYjLv7t0FxXFhc1IaFsaHd
         gnQw==
X-Forwarded-Encrypted: i=1; AKwUvByNoB0xMg7IHV3vhgtn0nuAY5QXQ7ry8TIOsZ+3cZPPx263trlJ68fhsewgFOk4xFXZb1HRR1jBJ3dL@vger.kernel.org
X-Gm-Message-State: AFq9FYI2xkJykjSZQP0F/M1VJEW51vepcA6y08AA2gcAcSt2PzKQ/hld
	ErNe4I6ScXduzhQx+14cSpn9qjttw1pD225EQ96KUtb/qVgOCYP5udQvxibICWWvLFM=
X-Gm-Gg: AYBFou0xtX2uRgSyb7OLvJF39pc1ARmwj8ddnQPdbgekPYcfbAQDMiSgU2XIg34L4Zw
	wFJjUAEZ3pR+zyR4k/TNIY8L/gBJjzj4qgwBFsyzs1YZT10TijSWW/V+huVJXrp/rMc5mAa9GeS
	O+yX5E28ZFeWJiCdQeEBLw/6+eY4qtVNwlj7DEqYFM2MnjGm4dcbSZ8aPowpvOmN2gYZxY3Qd/x
	zgcGJk/lQA8vx7tIrXjTiaVo7QPMq8+uP40CUggaZUwOvCOBzO1sOT2z5beG5sDjek0s0b6jsFq
	JCHj/T8z3PUOfxJ6nze/sR9OYj/nM7wNecaFKzqcal6Vdouq0jV7ipks1ZhBgcH8ohe8kg/4U74
	WVTFeG7Big42P1ZRX3FQz7vKsUGYB1YZljf01jsxtD/K1Ow3yt3Gl8ho/T05HkODaZHJEC2eRww
	CnehDMCUwaAhsdmN/sNrPIhJdw+J3jY4hCAPWwB6VaT/YYswECnTRFQd+XYD7LIaxn5n95xGjH/
	rs+GP4WFJHqv4RKEXhGoCooPxRfGyQF5SYdqE5Rf7W210363StubK2RdbBvcQW22cOYNxwbF9nC
	SxZSicJuEY3s6VQFfaznHmrffbkc/BnWGDcLvXjQlqvBCmPZVIjnxoSEDXW2grxH7yEq8iTtq8r
	pHwKm
X-Received: by 2002:a05:600c:4e88:b0:4a3:59c7:f226 with SMTP id 5b1f17b1804b1-4ac16bc4713mr239062835e9.6.1793625850979;
        Mon, 02 Nov 2026 05:24:10 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9476:5165:3a16:262? ([2a01:e0a:106d:1080:9476:5165:3a16:262])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf7146621sm276611165e9.13.2026.11.02.05.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:24:10 -0800 (PST)
Message-ID: <620eb58a-bd8a-4679-84de-0285f10e0262@linaro.org>
Date: Mon, 2 Nov 2026 14:24:09 +0100
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
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/4] drm/panel: himax-hx8279: add the VDDP supply
To: David Lechner <dlechner@baylibre.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
 <20261006-panel-himax-hx8279-vddp-v1-2-50d884b42aae@baylibre.com>
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
In-Reply-To: <20261006-panel-himax-hx8279-vddp-v1-2-50d884b42aae@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/6/26 22:25, David Lechner wrote:
> Get and enable the vddp-supply along with VDD and IOVCC.
> 
> The Startek KD070FHFID078 panel has a VDDP power input, which the
> MediaTek Genio 520 and 720 EVKs switch with a regulator of its own, so
> the driver has to enable it for the panel to be powered on those boards.
> 
> On boards that do not describe vddp-supply, the regulator core provides
> a dummy regulator, so they only see a "using dummy regulator" message.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
>   drivers/gpu/drm/panel/panel-himax-hx8279.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx8279.c b/drivers/gpu/drm/panel/panel-himax-hx8279.c
> index 9e443c719843..fe665cd3a3d2 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx8279.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx8279.c
> @@ -112,7 +112,7 @@
>   struct hx8279 {
>   	struct drm_panel panel;
>   	struct mipi_dsi_device *dsi[2];
> -	struct regulator_bulk_data vregs[2];
> +	struct regulator_bulk_data vregs[3];
>   	struct gpio_desc *enable_gpio;
>   	struct gpio_desc *reset_gpio;
>   	const struct hx8279_panel_desc *desc;
> @@ -769,6 +769,7 @@ static int hx8279_init_vregs(struct hx8279 *hx, struct device *dev)
>   
>   	hx->vregs[0].supply = "vdd";
>   	hx->vregs[1].supply = "iovcc";
> +	hx->vregs[2].supply = "vddp";
>   	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(hx->vregs),
>   				      hx->vregs);
>   	if (ret < 0)
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
