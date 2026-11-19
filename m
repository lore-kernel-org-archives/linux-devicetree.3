Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075099;
	b=qwCnYJbfK5aMoY5s8sW4SW36S85viLpoACXcfEfiBFiCp1K1Bi2HwaT+sA8Os3YrqiHT
	 dTCbSDJnubdATtuRFGbMm5bMfCZvn85g+AKQt572ccT3fAd24h4xFfi5jZQNsrplwRo6n
	 95dTfsk6hoYxE3bvPjW/KmST46IEzPbfD5gLMbPG+Ha+1dlUzOaPCbLc/AkOGS/nBpPNj
	 F/BDGf2aQuhW76RGODPrVosHrRzvkNLHe+GlBn/THElTGZVt06tDybRNPiwlO/jWqVfsB
	 XIQqaQmNqKlxOAgxAxkh7wnvaIC7gL+hY0/zZe088/c5WXuJSqEZX+KWWNJOQ9XDF1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=pdQlb2CsGbWPGWlbFcx6D3f/AbXcJrTux+zl7o+qrMU=;
	b=FrHet0wnxZnUJIn4nSbwKPP+Qj1qslmrghHODGFuvTHQoeSIYULqWpfQe2bLCxERP5n0
	 bGfMmZ9Uxq/UHILJDhCFtDWSPhkOGm1e2nyJur8/CJuvruJOUWhh9kXrgBowFOrKYIkWX
	 hdx6vIfJZ0O++9rNEaWnH+1bJqdWgXNWCKnCaOcqbF2+dCDNrSeDEiBopeRTmKcLe8mvF
	 XklV0WjpIAembFbJQAarOk01oeb+Qs6zMbItfcHDQStg6/aW4JCmPZHtXnPJ0xrLfJc8x
	 VY+mP2VbiUgNZkeOCJVX3fZ4eaeLPq/Hwgl8X6zerRwXJTLIJr7zmjmrYk08EZ/brYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=obzcTnY7;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53822606A324
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 07:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53822606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=obzcTnY7
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so7609805e9.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 23:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795075098; x=1795679898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pdQlb2CsGbWPGWlbFcx6D3f/AbXcJrTux+zl7o+qrMU=;
        b=obzcTnY7fGwAiNjMoQONcwqMOC2Pz6h2x2/gdO9ehVt5BQgEwpHevwnoBeGRJ4ThQf
         EljRAFqrPCxntrGC3TSvkhA3+LAthBcvKwo9caK0Ju0PMWhiPvEB9l1y6yRovNOXkh6V
         lc8BL5oOBbtADVElfW5NDqGLF4HQjhzsZhUVThTCCNAQZkhFbdQxmm/u0xg4bdQjxh23
         mxLZokUQmXpphYm1HJ85/1yT6lGPzddefcHJykK9ImBlqEvQl3Mvf3OZ1MjC5sWNOERD
         J3yJLBxBem/qodsZ01YZKO0PwQQQ6pNGqwSzYfRpTEcuv0U8lLYYIeC4pUVqF0DKyDYd
         e+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795075098; x=1795679898;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pdQlb2CsGbWPGWlbFcx6D3f/AbXcJrTux+zl7o+qrMU=;
        b=c16pfaNsU4pWp7P47+WE0EA/RAbGWLbRcPmVyV/NEJqlgPUbWIo+18nyJ9XRHLimX1
         sohwkpwtXNIjK/XHyWSjLCs+OaehbHxHUjfi0tpFoyOeS98qSnf1nv8cQZOWHNjjMPZN
         2jvoRttKgWa5IcqGITvRXOkcBBvwNQt5lR+LJ4CdTxjKMaAjj+d2/PWYhBhVPCRt5VDI
         UwGQNIYxEbtCyM2cgum6zoIOrEXNSeS2lKvgbG3fgS0JE31fk//ZVDqPkDIgxP9shoQQ
         Fgnc/02K7Lbax1KPnnY7tiPoV/Zpb+hs00Eezqv7e/NEL3XNtw09NWqdApRPN++2kG0r
         91gw==
X-Gm-Message-State: APuU4Z89TYjaIcvWGF+H5olwC0+hqNQ31sTh5NI9z2bvnqjDHY4wp2Ua
	zFAcrHPYBmJgaU5hZD8hMzrf/4bfiqgQkA/xUAwy9gGjACuOsOMONq3vtX+qO716ijY=
X-Gm-Gg: AYBFou1I0YSiPLBSLVNhBHY6DCwrdNW0QThuBbN99Lg4XoFZHxbhNsTcRIqHm309Hm/
	OPNkqIrd29pto40fU403leMEudt1M+H3XmCaN1zMsL3mx3ErwzkQezxj1QHbu3H+1nR3MmEoI/5
	pDQNq3MLNrwN6JKbX9Rehw9pVzNKd0mnGywWjzuGBIX/xBz7sp6j5BHsfu6LhcZhGCDurQcDA09
	t3lk9B+krGDLRqak4GRd0J8LK7kB2vaj+68icUJibprLDKnzTyLVAwQU5Brej3f8RboKTAcrcRD
	IGKjDsoLkKRZUvd8kG5AfTjv+BWvd4NAiIOVZHvj7JWMrFKqPcdLCJV590qwqsdeAvuwIHULyED
	VMUd+qqiOsdWOr5EjFM9tXqt26pgY75L9D1/+m0sT/sEOfqYetYbd+FIn0nqpEUho6w6/SITtaA
	8Gh9XREmIl0KBzNkPsNGHvjNhSOBwCzxlO5IuvO4gSAhE+1Rm99N2v6XKbwiFV2Z00mVOIDpHVO
	/YcwIN4MydalkMOB20nacY5pQJ6m2BexJJtpxJXT2UBpHa7QjBKep8asGzbj9m9SWPjiOg/Msf8
	oQmZAcLEqNiP2SnG0hr1nv+LSITTUbls+uuPk8Wx2P99kgdtYB4ggC1UkvHOjjhCJ70fMhmQbg6
	bte9vw1E3
X-Received: by 2002:a05:600c:4e86:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4bb8609ad6dmr6876015e9.0.1795075097389;
        Wed, 18 Nov 2026 23:58:17 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:3611:76ad:c4e1:77e7? ([2a01:e0a:106d:1080:3611:76ad:c4e1:77e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8532f1a9sm15704175e9.3.2026.11.18.23.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 23:58:16 -0800 (PST)
Message-ID: <04447713-32bb-46ff-8dd9-ba00bce186db@linaro.org>
Date: Thu, 19 Nov 2026 08:58:15 +0100
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
To: linux-kernel-dev@aliel.fr
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20261117-meson-drm-create-hdmitx-phy-v1-0-9e0ac931381c@aliel.fr>
 <51831581-525f-418c-86ea-3b5c6a80709b@linaro.org>
 <bb027d3b-6a43-4dd3-9771-3448c86996b5@aliel.fr>
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
In-Reply-To: <bb027d3b-6a43-4dd3-9771-3448c86996b5@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/18/26 20:35, linux-kernel-dev@aliel.fr wrote:
> On 11/18/26 13:38, Neil Armstrong wrote:
>> Hi,
>>
>> On 11/17/26 20:33, Ronald Claveau via B4 Relay wrote:
>>> This series moves the Amlogic Meson HDMI TX PHY handling (covering GXBB,
>>> GXL, GXM, and G12A SoCs) out of the meson_dw_hdmi DRM driver and into a
>>> dedicated generic PHY driver.
>>>
>>> Until now, meson_dw_hdmi directly manipulated the HHI system controller
>>> registers (HHI_HDMI_PHY_CNTL0..5) to configure analog parameters, toggle
>>> resets, and manage power states, as well as manually ungating HDMI
>>> clocks and power domains already described in the DT.
>>>
>>> By extracting this logic into a standalone PHY driver under
>>> drivers/phy/amlogic/:
>>> - Hardware representation in the DT is cleaner, modeling the HDMI TX PHY
>>>     as a child node of the HHI syscon referenced via standard "phys" and
>>>     "phy-names" properties.
>>> - The DRM bridge driver relies on the standard generic PHY API
>>>     (phy_init, phy_configure, phy_power_on/off, phy_exit) rather than
>>>     touching syscon registers directly.
>>> - Legacy DTs lacking the "phys" property remain supported via a
>>>     temporary fallback helper (meson_hdmi_phy_create_legacy) to preserve
>>>     backward compatibility to be removed on next phase of component
>>>     removal.
>>>
>>> Overview of the series:
>>> - Patches 1-3: Fix compatible matching in meson-gx-hhi-sysctrl bindings,
>>>     add the new amlogic,meson-hdmi-tx-phy DT schema, and allow the
>>>     "hdmi-phy" child node under the HHI syscon.
>>> - Patch 4: Add the new Meson HDMI TX PHY driver implementing the HDMI
>>>     PHY configuration ops, along with the temporary legacy creation
>>>     helper.
>>> - Patch 5: Document the optional "phys" and "phy-names" properties in
>>>     the amlogic,meson-dw-hdmi binding.
>>> - Patches 6-7: Clean up manual HHI clock/power-domain writes in
>>>     meson_dw_hdmi (relying on runtime PM instead) and convert the driver
>>>     to use the generic PHY framework.
>>> - Patches 8-10: Add the "hdmi-phy" child node and wire up the "phys"
>>>     phandle for G12, GXBB, and GXL Device Trees.
>>>
>>> Tested on:
>>> - Khadas VIM1 (GXL)
>>> - dtbs_check and dt_binding_check run cleanly with no new warnings.
>>>
>>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>> ---
>>> Ronald Claveau (10):
>>>         dt-bindings: soc: amlogic: meson-gx-hhi-sysctrl: Fix compatible
>>> matching in conditionals
>>>         dt-bindings: phy: amlogic: Add Meson HDMI TX PHY binding
>>>         dt-bindings: soc: amlogic: meson-gx-hhi-sysctrl: Add hdmi-phy
>>> child node
>>>         phy: amlogic: Add Meson HDMI TX PHY driver
>>>         dt-bindings: display: amlogic,meson-dw-hdmi: Add phys and phy-
>>> names
>>>         drm/meson: dw-hdmi: Drop manual HHI clock and memory PD setup
>>>         drm/meson: dw-hdmi: Use the generic PHY framework for the HDMI
>>> TX PHY
>>>         arm64: dts: amlogic: Add HDMI TX PHY node for G12
>>>         arm64: dts: amlogic: Add HDMI TX PHY node for GXBB
>>>         arm64: dts: amlogic: Add HDMI TX PHY node for GXL
>>>
>>>    .../bindings/display/amlogic,meson-dw-hdmi.yaml    |   8 +
>>>    .../bindings/phy/amlogic,meson-hdmi-tx-phy.yaml    |  33 +++
>>>    .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  |  43 ++-
>>>    arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |   7 +
>>>    arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |   7 +
>>>    arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |   7 +
>>>    drivers/gpu/drm/meson/Kconfig                      |   1 +
>>>    drivers/gpu/drm/meson/meson_dw_hdmi.c              | 203 ++++++--------
>>>    drivers/phy/amlogic/Kconfig                        |  11 +
>>>    drivers/phy/amlogic/Makefile                       |   1 +
>>>    drivers/phy/amlogic/phy-meson-hdmi-tx.c            | 309 +++++++++++
>>> ++++++++++
>>>    include/linux/phy/phy-meson-hdmi-tx.h              |  19 ++
>>>    12 files changed, 513 insertions(+), 136 deletions(-)
>>> ---
>>> base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
>>> change-id: 20261115-meson-drm-create-hdmitx-phy-4ac40a654d09
>>>
>>> Best regards,
>>> -- 
>>> Ronald Claveau <linux-kernel-dev@aliel.fr>
>>
>> Overall it's very good, but I would've prefered a more sequencial move
>> to the PHY driver, with an exact copy of the code and simplification
>> towards the current PHY code.
>>
>> Anyway, the sashiko review comments are good, especially the one on
>> patch 6 to keep the driver working on old DTs, sorry my bad...
>>
>> Neil
> 
> Thanks for your feedback, I am analyzing/testing sashiko feedback.
> 
> About the suspend/resume unbind/bind, I do not have any issue on my
> side, but I can change the orders.
> 
> About patch 6 and the old DTs, I will reintroduce them with the legacy
> check. Do you know what would be a good timeline to add a require on
> those elements and drop the fallback code ?
> 

The problem is not necessarily the kernel DT but the U-Boot DT which
could be used by the kernel.

The U-Boot DT was using v6.2 before v2024.07 and after it uses the synchronized
DT from Linux, which coincides with the v6.11 DT which contains the DT clocks
changes.

It seems most of the SBCs distro uses recent U-Boot versions, and some nice distro
ships older U-Boot version, so it could break on those if a new kernel was deployed.

But, U-Boot already set HHI_HDMI_CLK_CNTL and HHI_MEM_PD_REG0 when probing dw_hdmi
since 2019.04 so considering that I thing the risk is super low.

Add this to your commit message and send a v2.

Neil
