Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005488;
	b=TMlRx2x1RW3A63LMhZ+Cme+m+0AjjWYBZFeI993MTsbS+GFvO9PEeMO2UJn4O06v52Da
	 MSuyYDNV5YY4UV+zSNQowBJjtek5sR3+Lp1YENM8SV6FGGESbipw7pPOaEOiu4SkzEpFY
	 Iqtmb8xKEa9h/6i7IHAGAeBAV0hqTTdSZqB0NJdzb730nXKKtCWw7Idn1p6hUWOaPj9m5
	 dMB/59YGAGEyyUEGeladxqhgkcZglDdhzsyVzsrBf7q/zdF8M4OflKvCckPH0aVhflMXm
	 mkKSGFBfoSVMUIiVUZosquY3gTjnLtamlkV8wA6xXX8ds9IYEbkVLZh7b2hxqOEAfvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=RJ0VV9bT726BqR7U9WtLSEERSGHBOqG4sqzOpQlDp4A=;
	b=v8W/kGkudwsJfCwsEH5cAEoz7zly5oNfvmjNEl7ng/Tc21VEQNmgiJELgHAjtUi6TJvl
	 y83vFe13QsjJITBea+s9J7Gq0NeJYmoH+s/cjbp4w0lHkVU8gNin7IYjh/t9+gdQuppT6
	 kiqFpqFSQ8txfLf1Y+IlHDssBuwh6w7UYhRm1EOOOY0qrt+/b4TuzAoiU9wyVDuNB7Sa0
	 BD6VdHHVqaen/DNvw1SrDVJ8oqgMOEzQpXw8eeanGDufuZQxVHzK6lVmlcEqD45aFaTx2
	 BNjRZedCAhJA8JZrk7GDiMtHk5Iig1jYUGMzZ4xXs8H5jjAj7fELl4niXHLzru7T+/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ce0SM0ya;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C2C606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28C2C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ce0SM0ya
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so8000385e9.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 04:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795005485; x=1795610285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJ0VV9bT726BqR7U9WtLSEERSGHBOqG4sqzOpQlDp4A=;
        b=ce0SM0yawDr5aVULgwERwW3DrJyKrfWoLMUAb8iuAV5Pun0RUKeYtbGytIX/8a7B+p
         26QeD90ID953fGE3+RTLQO5ZogGTTKM3oJf+cqEeizan81LmbNN5HU/rrMKn5L7zYtLP
         CTboDEMwxIo/2qeVwBb4d/eLfwiWrkYFeV/d6NQSWRfq2pzQqftZv1zdVXjrxzoMUfnr
         cwWcE7rPW+YWkHmK0/T3q32lyUHwyU5qBOHmEBBlARmpZ5yGHl4m/mTcFZmW0HJ5HjtK
         P94e2cCWMpYzlXFt4j7ZmyskxUcYJHJQERQw7NbldPHIfHEHb7MaN2jfE4un5ov88+7P
         PTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005485; x=1795610285;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RJ0VV9bT726BqR7U9WtLSEERSGHBOqG4sqzOpQlDp4A=;
        b=c4v4WWWXU41zC4D4K8c20CEcq6UFwlCrRJd6EjvN9dH43m+wZnDmGTETYuw2G86eWS
         L01MkfBa1fgnanL8nufNa6bJvbfoWw0F0qEDpSjsG/Y6AwtRVmVibEVjf1riXWvRUkE+
         suTkSRTlELgay4j4tqWjBwd5XOCx5DiPPHlG3qWJiG5drS6IHrna0S42SaF9yVDBQGPh
         zrxioaR8GI0WIqHYpu0NCOmNDYGKsDWkl5oaEuEhMTHai5lrJbUnze1oyZaLmPnw+JRJ
         NGIa8jO/hU75+chxfo/CQKLg/SGlYneU07Po88y4i4tcFDwVweHeJzI85NdI1aEgo3Yb
         fdxg==
X-Gm-Message-State: APuU4Z+V77dN/4u18HOcTTjJOkM9eU9IUlhH4wrQxyGdsLiUPyVdl3P8
	eBIUfR1LshglHt0LgCC9QGL+6KDycVXpICovjfIHIniJ6pDv4RGN6kTtQJYTQgRmbv2+Icljw19
	RuFRLQdqiBA==
X-Gm-Gg: AYBFou1KAxBb37XweyC1pXv9aAXJd9X5m6ibLWgkMb91G5oW82JBAZD0rD+igASIy9t
	Jatw72oOLYIW6/b+RtsF+anWGF5SMBtRL3m0BEjMPtw1tV1oZ+Np4LUnflAx5c03guRPDqPx9Z/
	vRQ8MKMor/F/KM+HjxveyavMDWHULo8Wi3468eocoLhoin71aqo2X6GFb//3whFWT0IBp4dx4I8
	+HCStlcxWV2DBsrGQ8itdydGlJE/MvH96vgDhMq+uIaZD7HmvGZvtzqU3KqRSewWKzCktibXm9M
	ocASVS2rbjB+jWwh29l7FRNVPh+Bq4RogHAar07E7tW8FgQ6ixwr4ru4fgJ8q3kCLd8ZW8XUiMA
	8eGDLJsVzKQoMg0Ql9fkUUSC9sf+EQh1tfYLSFzsuBVMTmsyeOb9Be/WS8Yw0EHtNebdQxSZvYB
	PYlIPsLGBJIExLEOmtZ9qIqFde8GbDjd7uPGBhFjhM1YFjc0I3CPBYydHb8jyEwasd/oELbWXAU
	cYN/gLXIW9kFnCJT9DgKxW++PGq2l2gzAqbmAjQa4onpe9T5Yt4PwIfLQ8dIQM/RgrcU8GEkMY9
	btTXnQEhKJ/xjtAvAAy3f1PI84FUzR5P2lAwzmTpLibqKlHX3Sy//ptlqzrCgiQ1BDQq3ex4MtH
	Ra0GSDHJ7FA==
X-Received: by 2002:a05:600c:8b71:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4bb7da2ba0emr41716025e9.29.1795005485104;
        Wed, 18 Nov 2026 04:38:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:6ca2:2772:9e53:115b? ([2a01:e0a:106d:1080:6ca2:2772:9e53:115b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a655f9f4a7sm4725911f8f.34.2026.11.18.04.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:38:04 -0800 (PST)
Message-ID: <51831581-525f-418c-86ea-3b5c6a80709b@linaro.org>
Date: Wed, 18 Nov 2026 13:38:03 +0100
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
Subject: Re: [PATCH 00/10] phy/drm: amlogic: Extract Meson HDMI TX PHY into a
 dedicated driver
To: linux-kernel-dev@aliel.fr, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20261117-meson-drm-create-hdmitx-phy-v1-0-9e0ac931381c@aliel.fr>
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
In-Reply-To: <20261117-meson-drm-create-hdmitx-phy-v1-0-9e0ac931381c@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/17/26 20:33, Ronald Claveau via B4 Relay wrote:
> This series moves the Amlogic Meson HDMI TX PHY handling (covering GXBB,
> GXL, GXM, and G12A SoCs) out of the meson_dw_hdmi DRM driver and into a
> dedicated generic PHY driver.
> 
> Until now, meson_dw_hdmi directly manipulated the HHI system controller
> registers (HHI_HDMI_PHY_CNTL0..5) to configure analog parameters, toggle
> resets, and manage power states, as well as manually ungating HDMI
> clocks and power domains already described in the DT.
> 
> By extracting this logic into a standalone PHY driver under
> drivers/phy/amlogic/:
> - Hardware representation in the DT is cleaner, modeling the HDMI TX PHY
>    as a child node of the HHI syscon referenced via standard "phys" and
>    "phy-names" properties.
> - The DRM bridge driver relies on the standard generic PHY API
>    (phy_init, phy_configure, phy_power_on/off, phy_exit) rather than
>    touching syscon registers directly.
> - Legacy DTs lacking the "phys" property remain supported via a
>    temporary fallback helper (meson_hdmi_phy_create_legacy) to preserve
>    backward compatibility to be removed on next phase of component
>    removal.
> 
> Overview of the series:
> - Patches 1-3: Fix compatible matching in meson-gx-hhi-sysctrl bindings,
>    add the new amlogic,meson-hdmi-tx-phy DT schema, and allow the
>    "hdmi-phy" child node under the HHI syscon.
> - Patch 4: Add the new Meson HDMI TX PHY driver implementing the HDMI
>    PHY configuration ops, along with the temporary legacy creation
>    helper.
> - Patch 5: Document the optional "phys" and "phy-names" properties in
>    the amlogic,meson-dw-hdmi binding.
> - Patches 6-7: Clean up manual HHI clock/power-domain writes in
>    meson_dw_hdmi (relying on runtime PM instead) and convert the driver
>    to use the generic PHY framework.
> - Patches 8-10: Add the "hdmi-phy" child node and wire up the "phys"
>    phandle for G12, GXBB, and GXL Device Trees.
> 
> Tested on:
> - Khadas VIM1 (GXL)
> - dtbs_check and dt_binding_check run cleanly with no new warnings.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
> Ronald Claveau (10):
>        dt-bindings: soc: amlogic: meson-gx-hhi-sysctrl: Fix compatible matching in conditionals
>        dt-bindings: phy: amlogic: Add Meson HDMI TX PHY binding
>        dt-bindings: soc: amlogic: meson-gx-hhi-sysctrl: Add hdmi-phy child node
>        phy: amlogic: Add Meson HDMI TX PHY driver
>        dt-bindings: display: amlogic,meson-dw-hdmi: Add phys and phy-names
>        drm/meson: dw-hdmi: Drop manual HHI clock and memory PD setup
>        drm/meson: dw-hdmi: Use the generic PHY framework for the HDMI TX PHY
>        arm64: dts: amlogic: Add HDMI TX PHY node for G12
>        arm64: dts: amlogic: Add HDMI TX PHY node for GXBB
>        arm64: dts: amlogic: Add HDMI TX PHY node for GXL
> 
>   .../bindings/display/amlogic,meson-dw-hdmi.yaml    |   8 +
>   .../bindings/phy/amlogic,meson-hdmi-tx-phy.yaml    |  33 +++
>   .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  |  43 ++-
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |   7 +
>   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |   7 +
>   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |   7 +
>   drivers/gpu/drm/meson/Kconfig                      |   1 +
>   drivers/gpu/drm/meson/meson_dw_hdmi.c              | 203 ++++++--------
>   drivers/phy/amlogic/Kconfig                        |  11 +
>   drivers/phy/amlogic/Makefile                       |   1 +
>   drivers/phy/amlogic/phy-meson-hdmi-tx.c            | 309 +++++++++++++++++++++
>   include/linux/phy/phy-meson-hdmi-tx.h              |  19 ++
>   12 files changed, 513 insertions(+), 136 deletions(-)
> ---
> base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
> change-id: 20261115-meson-drm-create-hdmitx-phy-4ac40a654d09
> 
> Best regards,
> --
> Ronald Claveau <linux-kernel-dev@aliel.fr>

Overall it's very good, but I would've prefered a more sequencial move
to the PHY driver, with an exact copy of the code and simplification
towards the current PHY code.

Anyway, the sashiko review comments are good, especially the one on
patch 6 to keep the driver working on old DTs, sorry my bad...

Neil
