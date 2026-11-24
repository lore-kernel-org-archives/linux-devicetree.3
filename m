Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536730;
	b=0f4k8KdAICOE+EJR8mh49BgmDhwJ+Kip4I/lBp/rqlOe0/cX9F7110Ar/eAN0JCpEIrh
	 P4/JohacRELbkkeXfoIH3tMnCv/0wUgIbrXiaOPxm69XwR+o1tzOE5U987iAkdwhBoezG
	 dubWFn2TtymVagkK+al0LFPSWguNM/Ca7wokp9AjwY6qq5XKgLlfqZu2l/usenFruH38C
	 ntuAtoBa77Ad47tyeeNE4EEu8jL72GycnZRhxWVYH+eU4dZIwt5qLs2kI9IIJtIFBeJ+/
	 n+zDhGjEfq54VZqmykIbEN6z5q7esXR46lXtV3oHpUstpLdVUfyQc8JqMwKv4cKPeeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=+6LKQYgkr2YxzPjh0brr5Y4vnuislFHhKsvQIh4zTc8=;
	b=A1S2M0UUm+cu74ks81tlJApzAy3mlz0qdFaFQcM+Ba4Lk2ykBRazypTFh3Sz16JRwuvp
	 iixWqx19UKdfs5fWMFVN0wigxZVPoSwHwFlIzb5gRV5UXlDkmHzeb4XLW/b0NJ6EtYVxB
	 ROkYaNlmaJGOAIED5xgLH5ZcgRe+kwbom/IlL+vkZvsr+4xNeHIJP9ehPJ0F82TZS8kLs
	 TAdimrEAHUpchDcrb8ep+RK/BW96gB5ueyasd0pld3tvxIh3ckkQmiSjlAbFqBURz6Cmd
	 +dH1NmCJ+I6tgCkh87uUZvopXYsw6ktTihUoqQBaQTpwHqoO/9ibi5yq7TUi8Oi1SsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="ZJYE2/jt";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4490606A33B
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4490606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZJYE2/jt
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so51080795e9.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795536728; x=1796141528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+6LKQYgkr2YxzPjh0brr5Y4vnuislFHhKsvQIh4zTc8=;
        b=ZJYE2/jt6lGQjQj2cd292w+No+yMVWNlWweqMu3Kt6/KvYFlwXBS5eGAWjV0Gp8bcK
         33iKu0PJhj1Nt/CsNt2h6Zb3qII/5KCkqk0JhNPvGyBjf+EkujG/FVL69nQcc7nB/s+6
         J8uDJ4InzJlSNf0we8ZEguV/TZWegeZHxV3g/QhsikzW9sNICftpP/8Q9FTv0bqbj3Ht
         Is/UBL4IJWVR9YVn1lTAS1LptJja55cZLuHaHU9UdmSNQmJF9ioaQr6iBVd7aJXIvg8f
         TLQnogIBXfpIOTth+aAYDoPOvQbrpaUCJeS26zqGSRUbBYZkySn/2gx+YNM9xJpsDkHJ
         mplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795536728; x=1796141528;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+6LKQYgkr2YxzPjh0brr5Y4vnuislFHhKsvQIh4zTc8=;
        b=reock+xiyGqrLe8TDmzpHzxC+hWKC1+xXrPLg3gvjxMiv/HeiCfkKdTAdlLxU+dmDC
         BhLpBJtnSbmKDczP3QnV8l9FjHtgezn40N7KBay/iZ1Q+orXCBX7XF30k9WFIpMUx3Z+
         WI82VABUiylgFyuTtSpFk1JaWGvoT7D3+8Wy31yIw/Lyfq7Z69vFRLmGnd6DjKieYtZT
         kEWoksGyu548vITSeCH9CCWdVJoT9UicoV/pXNW/sRfvFFzsN5AJArDTMr9j5peliTlq
         YJ8vP1+UTX6fJ2FLPNUxYujKuZAfTdH7dJlfmntDt9yGmekGQtMl9XsrMxAFoddEYzcV
         OLGw==
X-Forwarded-Encrypted: i=1; AL+hErG3d1DTZy8sjMlIpStymggoSnnsYdlpyVCC+6+gfdsAhmYYsfxdlMwotMjsENnb3FXmnCuap/54/ZKN@vger.kernel.org
X-Gm-Message-State: APuU4Z++Nl27s9KpTakQ1rN0YoBSND4AQbIqHPcCgdfFQ5IsVmd/Mwdk
	bxdoTcjpqM3OE4DYAcKLSIVVkmfA5gu83NT4mSXC9EN3EweJNL/oGDg5vcTs/UNtHh8=
X-Gm-Gg: AZFdTZcsvoUNUDOaF1DcCDSyKDIn2QUndRFBbWkCZYXGlmANcsdnjyes/4x3WOT7tip
	thrJwzoHVsH/Vj7vUfFzfmxQ9E8q2O00a2kC71Dr2CTW79dTdmLvX3fFvgf+pH0mGwca4DOweuM
	UZBOMCSTj7zmBur2Nv3EtrDG9tOk6FCk+wadPAOhcVmDjVSQf8r3RdbnIlZQpKYB61Kw7LLiEp+
	kBWqjHUV8aI9s/yTrH5NWNAMRxIOubvv4IB88KwETMVybVmGHUMpNJ/9anCaADWu4OS+h+8OP9J
	naMdKFI1wp+fyePppb52v0iRWpLQhNxpyZkfIcDQ/skp+VCncRgR/t1JwriqxHvz2+B+3tCYbkJ
	exJynADqKTrsv9RvSuq5CaTtd8gktG6FMeTDbYkcMkVBVWitsdXkihSG/qX4q1yWtufzt6baxoS
	t7JoYeVnztAzG4z3wnw+Y4yET0TalAnLUnBLIdfM5meBR6KUpSYKd9WjU34yz0Q3hxDQp5Z6qza
	E3Y/+SLF02bur7UOYVtwBsQEsHznWrmb9uqswOr7PmHpDsEQbSDn5jshK4GW4IgWW2FWOCh8Sut
	HoLoZ0v5EurfV0n7HWFGQl2nhunqMVgmw4z/0Ee1h2EZjlwNsnsURydqtW6dv0sqwuCv4G+T3XH
	dufj/N/+U
X-Received: by 2002:a05:600d:82d3:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4bb8880f0ebmr344659275e9.9.1795536727863;
        Tue, 24 Nov 2026 08:12:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:ac27:24a0:7b1a:dd94? ([2a01:e0a:106d:1080:ac27:24a0:7b1a:dd94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm358970025e9.0.2026.11.24.08.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 08:12:07 -0800 (PST)
Message-ID: <afcf78be-b017-485c-8e11-402b0948c9f8@linaro.org>
Date: Tue, 24 Nov 2026 17:12:06 +0100
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
Subject: Re: [RFC PATCH 0/2] drm/meson: add HDMI support for GXLX2
To: zinan@mieulab.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260718111527.119231-1-zinan@mieulab.com>
 <ac5ef957c03ab3bf3fdb464680f3b024a883aefa@mieulab.com>
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
In-Reply-To: <ac5ef957c03ab3bf3fdb464680f3b024a883aefa@mieulab.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/24/26 15:19, zinan@mieulab.com wrote:
> Hi Neil and all,
> 
> Following up on this GXLX2 HDMI RFC from July. Since then, users have reported working HDMI output on several
> S905L3-family boxes with a downstream implementation, including a P291 board. Their reports are here:
> https://github.com/ophub/amlogic-s9xxx-armbian/issues/3604 <https://github.com/ophub/amlogic-s9xxx-armbian/issues/3604>
> Before I refresh the series, would you recommend keeping the proposed amlogic,meson-gxlx2-dw-hdmi compatible and a
> single MMIO resource for DWC and TOP, or describing the two windows as separate named resources?

Please rebase on https://lore.kernel.org/all/20261123-meson-drm-create-hdmitx-phy-v4-0-3fb94f5534ca@aliel.fr/ and adapt your patch.

Thanks,
Neil

> 
> Thanks,
> Zinan
> 
> July 18, 2026 at 8:15 PM, "Zinan Zhou" <zinan@mieulab.com <mailto:zinan@mieulab.com?to=%22Zinan%20Zhou%22%20%3Czinan%40mieulab.com%3E>> wrote:
> 
>     This RFC adds HDMI transmitter support for the Amlogic GXLX2 family,
>     observed as an S905L3 (CPU major ID 0x2a) in a FiberHome HG680-LC set-top
>     box.
> 
>     GXLX2 is unusual in that the display pipeline, clocks and HDMI PHY follow
>     the older GXL path, while the HDMI controller register interface is
>     directly mapped: DWC registers are byte-addressed from 0xda800000 and TOP
>     registers are 32-bit registers at 0xda808000 + index * 4. The existing
>     G12A access callbacks implement this layout, but using all G12A match data
>     would select the wrong PHY initialization for GXLX2.
> 
>     Patch 1 proposes a dedicated amlogic,meson-gxlx2-dw-hdmi compatible
>     without a meson-gx-dw-hdmi fallback. Patch 2 adds dedicated match data
>     combining direct register callbacks with GXL PHY behavior. It also handles
>     the GXLX2 value for the 297 MHz PHY bucket and adds the compatible to the
>     Meson DRM component match list.
> 
>     This RFC depends on the separately posted common Meson DW-HDMI regmap fix:
> 
>     drm/meson: constrain the DW-HDMI regmap range
>     https://lore.kernel.org/all/20260718090710.70534-1-zinan@mieulab.com/ <https://lore.kernel.org/all/20260718090710.70534-1-zinan@mieulab.com/>
> 
>     That formal bug-fix patch bounds register iteration below the directly
>     mapped TOP block and prevents the legacy 16-bit indirect interface from
>     wrapping. It is intentionally not part of this RFC so it can be reviewed
>     and merged without waiting for agreement on the GXLX2 DT ABI.
> 
>     I would particularly appreciate feedback on two DT ABI questions:
> 
>     1. Is amlogic,meson-gxlx2-dw-hdmi the appropriate block compatible name?
>     2. Should the DWC and TOP windows be represented as one contiguous MMIO
>     resource, as in this RFC, or as two named resources?
> 
>     Evidence and disclosure:
> 
>     - The GXLX2 addresses and 297 MHz value are factual results of analysis of
>     the HG680-LC vendor kernel. Firmware SHA-256 and focused behavioral
>     evidence can be supplied if useful, but no firmware, kallsyms dump or
>     disassembly is part of this submission.
>     - Public Amlogic-derived GPL source documents the ordinary GXL 2.97 Gbps
>     values and public GPL-2.0+/MIT source documents the same direct DWC/TOP
>     access mechanism used on later SoCs. The implementation here does not
>     copy a vendor function body.
> 
>     Testing:
> 
>     - An equivalent Linux 6.6.18 implementation boots from eMMC on the
>     HG680-LC.
>     - 1920x1080 HDMI video was physically verified on an LG 27GL850.
>     - Two-channel HDMI LPCM through the display and analog stereo audio were
>     physically verified.
>     - The downstream 6.12 port boots from eMMC with working Ethernet/SSH and
>     has physically verified 1920x1080@60 video and HDMI LPCM.
>     - With the generic Meson non-CEA mode-range change already present in
>     current mainline, 2560x1440@59.95 video and HDMI LPCM were physically
>     verified on the display's native timing.
>     - The RFC port builds on arm64 and its binding passes dt_binding_check.
>     - 3840x2160 at 30 Hz has not yet been physically tested. That test is
>     required before a non-RFC PATCH v1 because it exercises the
>     GXLX2-specific 297 MHz branch. It is not a blocker for the verified
>     1080p/1440p use case.
>     - No other GXLX2 board has been tested yet.
> 
>     The initial RFC intentionally contains no board DTS. A downstream-only
>     HG680-LC DTS is being kept as DO NOT MERGE until the compatible and resource
>     model have received initial feedback.
> 
>     Assisted-by: Codex:gpt-5.6-sol
> 
>     Zinan Zhou (2):
>     dt-bindings: display: meson-dw-hdmi: add GXLX2 compatible
>     drm/meson: add GXLX2 HDMI register support
> 
>     .../display/amlogic,meson-dw-hdmi.yaml | 7 ++--
>     drivers/gpu/drm/meson/meson_drv.c | 1 +
>     drivers/gpu/drm/meson/meson_dw_hdmi.c | 33 ++++++++++++++++---
>     3 files changed, 34 insertions(+), 7 deletions(-)
> 
> 
>     base-commit: b0a652436b892eb9a036a031b33099dca036faaa
>     prerequisite-patch-id: 0a689485bbc3c1d77d52aeee0b81e4943d1e904a
>     -- 
>     2.43.0
> 
> 

