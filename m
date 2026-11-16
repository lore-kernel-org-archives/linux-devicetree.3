Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823224;
	b=gHGOVutAH9/ZpfM8PWMUirW+BmCaqlG9pY2r/xZ4EcXrT+w/i4dGI5at0F6k1l16LaHR
	 qlKgXf637myvHHZF9dJjkFW975Fu5HwquZS5uYg8mi32RKjUX27Ci2chWPMERXTZUcMzt
	 /nfz5QX+jKjuwWkO3FoHH0vEo0YXTu47s6HCvNfVZWMkYqrh877G3/VPFr1A6zTYcrrce
	 haoiW9rbv+CAyilz2J2OyKBOW4VGMdagBw1q1gSzrKegxa0byD0K6zTUcNX0OHvrdg8gs
	 InW+qnOXX7u/KEw2lWrPtvwfkL+p3Rxrz7dG92F44ZMA1K59QoRbS01kpiHqsVtYmkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=CEc6t0VeUS80Ev6G3pIRJFObgJcYoN6XXEJ5BLbIEVo=;
	b=fKr3mXYB1ukeze96o56Ipqa7aKuYiJRQXJmu630CtWmzZLSRujVTyQV/pOtipmb+P43o
	 YsX7C3Xtl2FC+eND6NgqqIe69ywxhok7mIhcfRmCryTK+Y+HPRZCD9UVgM5u4owtsIt++
	 GQ9F3Rfgi5P4SMCMFhCYVrVLPEL99t3OJAP3Mrs6c6OHd5K7ZTALMLZ/xtjFoHLzSgvDz
	 OirIZkJ6k4Kep0UVHMh9cYtT+V+T63OYDDOozj/CsZphQsfmPKXuO5ObqaIVTfVz2SvrM
	 Olgp2PAcTjBLntG9hFzMDOhBvP/2q/abQtkb3KBJMi+9x4LUldov/vMgJ/uKYyclq7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QPTiA5Jt;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F39606A32F
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 10:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8F39606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QPTiA5Jt
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso11624625e9.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794823222; x=1795428022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEc6t0VeUS80Ev6G3pIRJFObgJcYoN6XXEJ5BLbIEVo=;
        b=QPTiA5JtYMrbsMl0z8iJz6Z1kuNtOsLW8HHjgERJXiH0wb+LeyunHKf9R9M2HNk2II
         ikL42CGjtFQ4HGfxK4hv4TxHo9NIb0nOLjwT5EBK3NtTEdDmoyjzSOPFMXbm+/UCMVkT
         QCdxmRISD1pOOzkwFv8CzKsRJJ1Z2wBB+AtfFTu3Jtfr3dLv1RpB4rkc9schgefJ3Xrj
         +dlu9mwwMZUdyrtRogYv6qxhwLFuuCLyzb6kMTiOkdQ1uPH850eMPDut72jt+NXSzWuN
         /ab4+oBXb3+cgDHO3gIZ5eEfZeSJ398PLzQsPYaw9lnFGMCfxT4xxDn/9zx9NncIFGCa
         UwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794823222; x=1795428022;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CEc6t0VeUS80Ev6G3pIRJFObgJcYoN6XXEJ5BLbIEVo=;
        b=Lj9t5pExGJDb0OQXnJ59r2qWfBuCu5vJwb5HkdFQupQtHBhr7jHve9ONp+RznZ1lDj
         0o3Tc62JMSedr7/IYutBrFUJEr20jDjf9xRiudoPEN9DqN9IupSS1NEVFe8+WVBFSZHi
         zBYtfdkMGLwEIgbbX4elfme53xQrEAvfUYtxXUeEJxaaICjXVfp+kDc3cWyhTSl0agby
         C5njEAaYc+0aB0hpcg4haMAQGlMsd60Qu551+Iksm+YcNawbWKn7Z0Wl3nPk/XN/F8l3
         Vv2Vg0U5kf7alcL+K9qJcHsazZN2NG/aWiQGBw27zjD+ne+rCNafNeaHtP5qNVBM7yjI
         JGWg==
X-Forwarded-Encrypted: i=1; AL+hErEGgfk+VMH22b9GfyBuF10LrblrNBzAWrhCHhutBo/pavm2+2UtJFBY/0xPU+FoaGmus99uCuHMgFSp@vger.kernel.org
X-Gm-Message-State: APuU4Z8zzZmEQHsN42uIuIAXwFExi9sObMmdPztd3lPu8+blJD6UYqlR
	0WXxy2DIRyWjvn+/oQS4mDZlRDlL6SbZfUTk0nmjO0YIb9EIA4rn30g61+6511wMjUQ=
X-Gm-Gg: AYBFou2Wl8GC75d3E7q+WQa253AaDHeOauN05JoWmVg7AvpBnBjNfBmmiSWtVrLT72J
	90516s9KG2amoLlkS6PhBX/5GC8/z1HMaafhNhnmizoJNj89nl3AxTyJDSLHci5AnQSme1mqikP
	8deK49bMAvbsSnvmaM26eQnbNWe1xClPJ/Hzd6CIw3Ld4vgoGCmYsGaxBiFCGbxhx6sZzy8xI4/
	KohaNfCwC62I63SJ14bYZKFm0gQ8GUeVZqy9e4Wuq8pUgvphvJwREWBoU8ZL9J5Qtqq8zV8f/El
	jibp+Vd3/fzNzq/7ax3OLr6gm/Y/QT20V6BpJPRQ3GNlylj2oiox5dPTOWkUty8VE18tK4laJBb
	LUPvGxnzooBqs3QPpnYZwMrwRx8Y+kXij/45Ke3pYc1HYz+g5AEZ9YL4wnFjN0GqOZKxJcdI9jl
	iLsVm8Z1+Y9vxPg/iWb1B3FFOS6rtMokUVS0ZTxbLcBt1RY3jVN9HreBWw1VizfSm123p5gpEiC
	F5CjFzk2W/Az/Ev6sSOsoZt8mJ+kLaWZQb7bHf5U2AXBM8o5gRlD/oj1Affo8ZbSeL7z3ZbYvOA
	zxLNIvtY/kaskNzsvsauOtjqqWWYnXzyhUwyyHqmOG59RDZDfMzYpuWvGic9Emnmcuu5ZWnhk47
	oH3Sa4wjp
X-Received: by 2002:a05:600c:a012:b0:4a3:5aee:2c25 with SMTP id 5b1f17b1804b1-4bb55a907cfmr204744635e9.31.1794823221901;
        Mon, 16 Nov 2026 02:00:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae4414sm282702355e9.9.2026.11.16.02.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:00:21 -0800 (PST)
Message-ID: <0498194e-6428-4424-82b6-c6e52ba25adb@linaro.org>
Date: Mon, 16 Nov 2026 11:00:20 +0100
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
Subject: Re: [PATCH v12 2/6] firmware: meson: sm: Add video firmware loading
 SMC call
To: zhentao.guo@amlogic.com, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
 <20261022-b4-s4-vdec-upstream-v12-2-616240978792@amlogic.com>
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
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-2-616240978792@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 07:27, Zhentao Guo via B4 Relay wrote:
> From: Zhentao Guo <zhentao.guo@amlogic.com>
> 
> Add SM_LOAD_VIDEO_FW at SMC ID 0xb200000f in the command
> table to load video firmware.
> 
> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
> ---
>   drivers/firmware/meson/meson_sm.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
> index ab9751a59b55..887caa5c625d 100644
> --- a/drivers/firmware/meson/meson_sm.c
> +++ b/drivers/firmware/meson/meson_sm.c
> @@ -48,6 +48,7 @@ static const struct meson_sm_chip gxbb_chip = {
>   		CMD(SM_THERMAL_CALIB_READ,	0x82000047),
>   		CMD(SM_A1_PWRC_SET,		0x82000093),
>   		CMD(SM_A1_PWRC_GET,		0x82000095),
> +		CMD(SM_LOAD_VIDEO_FW,		0xb200000f),
>   		{ /* sentinel */ },
>   	},
>   };
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
