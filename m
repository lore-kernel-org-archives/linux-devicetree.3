Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005269;
	b=fInQdM5fqAPE6kOuBkfQJq9/x79J/XXNMKiWpCbMFCUliLOJZBt43ZCPEOtRZFIIAIxQ
	 UylE0eT/odkl/FGexZIdl0kv0OfsMZ32tpatcb5SdjTzgUX4nkox8T3fPd2BSuEuaYtvz
	 N8QSQ70njVW3kST8o14zbpp45/FbeimWqE69QK/LGlc2NPHU5L+HRSPvd6hqNwhrr2yd9
	 lU270uvkeulb3vdeo6Q0IBXtP91YxX488yLJz3p/RDlHj1OVh9lmYXvXiC/ti+jig+VG0
	 P4vY0IYqWoAEUHT+KshZhkDbQWdIRkdVBfC5jJPZ+n6DW34EoO9VsaV2SahoucX5Wbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=nvPt3fCk+CsXSOqBkgE7UtRZc1xZmTaUxS/+53ef6bE=;
	b=Gz/96v115lYzBNwk8b7zQdxna/AXeiqJoT1TClBR56Q6HH1GNB1RVPxKOHu/CUvTmfKf
	 tTuKjzaYL24Wrf7eorO5fOLKy/Gr32oW2gS64QAmveBiW4In31S1M7B6CrAzpekXMrb5P
	 /flaeG+sMHHRIg04nH2saMEWhEg4XkPAY28uxt6OccIT4tktgTMaqPYaB0c7abw1fBTEp
	 S7MtKZcEmkB2oU4sl2kCjBOPiZwJa6KBWu7rL6Mf0vcTSjFk6FOqDXceAXsS70/jGvE5H
	 DFDHOmzkiyjlDxrljzG8A7qOlrUV5v8fWpgA8MQcaoggaWmVc3YFa8N1bwX+T+WiPkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zkKo2LEP;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18F5606A320
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C18F5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zkKo2LEP
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a210470b49so8329795e9.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 04:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795005267; x=1795610067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvPt3fCk+CsXSOqBkgE7UtRZc1xZmTaUxS/+53ef6bE=;
        b=zkKo2LEP3/ymgPRDW9n8rWDi1g8Go0sY5onHwOFAaXSRwN0FeYcbFR8oy0arRLA2gR
         GltSRRjONi/WfGI/e4ofJt8RaPzofSLBoAfjo4Tw814qvqon3h/OckCmAuE4A3XNcwGD
         pZQwucXTC+Sg99gQlZFOy1vjMY4daODSag09sPgmiFi+DE2dTyNyyE0k56imBNjIRD2P
         P4vxRJkbVUosV2i4p/hf7jjZfZ7BPqf96LJR5L2qFqlIWkVhvAB9DQGiSPNUDFi5WbSU
         tA5jUuwM9pQ3J+hWkkh1sIf+1Je58wUVIlEzvzLkZBMwx4K+U6GzMt28ODqIcRBszzHx
         E6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005267; x=1795610067;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nvPt3fCk+CsXSOqBkgE7UtRZc1xZmTaUxS/+53ef6bE=;
        b=GoM1ajTwtfr8EHB1P3DbdVyKim5c6Eoyn06X8n0nqrXm1CyjJ2HyXnOQuj/tRLoUBe
         RErbNNfe/xpmKsEW9dDjVyjBrgfzTcFKN352UF1IHbOALpK0QNKrCyeHi7aLfATLKjaz
         2V3pcNmRaX0ODN81G3okBIDYLdy5/hINsJwjkX6OG37se6QaTyGjPD1ThTf+Q/CF5Phf
         X7B4TaG0TMfym4zeC/U/BTOAtNquJaALVvi+4m0A/xvnP2Q1Mm1ha8+xIV0EpV+be9VE
         efTRY6PVnaJyDyxtGAb/DzIPBVnrmOzVHMX1WYmkeQPe8rOVTljY/dz9U4r4xuL7n0hu
         5OPA==
X-Gm-Message-State: APuU4Z+kRO55do12WJ5gmeuOjXWHVFFjZlMW/eu+1MpBVG/uicSbweUn
	PgeGKsE05o2sDA1rj734UnrE7BMPp1GrWCKovsCpzcDqpT49F1KvEH0BvkcuXEvUWQE=
X-Gm-Gg: AYBFou3rFVQWPVtGta02BPgJzd4iUCVxcPeIbueaMvJc9rbC8PIkpnDLY/CuiyFvbX9
	B3ZQpsGK5SRC9d8kmQCbjcNUv9b5WbhYJgwDBFI1BEfjljYd9R/jQHAXLSayamPpDB4PV3JntBz
	IyRMe+UtQ6ieGkQ7qGXWiASKNbxw5G9vfnUOwaaUxOf0XHgPyhIr46NRAB8zPlf51EjZ/tSj8bV
	kxsCcwf/yAaASU4F3ulyWTQ/uixaxm24YmaDUGpsQpjAq3mtBH3z856MlU+O76ezS4hLiVY+nK5
	zmJGwpScc6ravQkNHY75TmMXO8rubCxmbVWvWJ3deH0PkkZnfxeonpbxwQsoTfS79snBmRKvRt0
	a6XPfsuPsdtnXkN87Myzz1My06K9NiLFPrN0Pb5FbjYuG59PA3Zt9TtrO8xI8bdLTcnzPtqG4M7
	0nJwwBvusNbnwOFz3ilrHdCYJQMioUuh7ZaLGkqkH5Zgjk8BNAQlMtCdW3YSq/YFKTS3VD3Wtnj
	YSm70g1QlGmzx0nrs/aRU3XZ91fhLTb++zFywEA+KgNHG1A/z0NLD7T5ULchTE4TYM0EXfjmnyw
	3OsEzLYfcx890MBGV89Il/nPw0hPWe3EjBvoQ9uBkFXjL0fYNpc8QIiWF0aNUv9SSfyrNrEo49d
	OLovh/BNK
X-Received: by 2002:a05:600c:1d06:b0:4bb:6a5a:783d with SMTP id 5b1f17b1804b1-4bb7da25158mr46260185e9.18.1795005266845;
        Wed, 18 Nov 2026 04:34:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:6ca2:2772:9e53:115b? ([2a01:e0a:106d:1080:6ca2:2772:9e53:115b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7e57664esm26749835e9.1.2026.11.18.04.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:34:26 -0800 (PST)
Message-ID: <3e82658f-1152-4c98-b996-242abc203f74@linaro.org>
Date: Wed, 18 Nov 2026 13:34:25 +0100
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
Subject: Re: [PATCH 05/10] dt-bindings: display: amlogic,meson-dw-hdmi: Add
 phys and phy-names
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
 <20261117-meson-drm-create-hdmitx-phy-v1-5-9e0ac931381c@aliel.fr>
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
In-Reply-To: <20261117-meson-drm-create-hdmitx-phy-v1-5-9e0ac931381c@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 20:33, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> The HDMI TX PHY now has its own binding and driver. Describe the link
> between the HDMI TX controller and its PHY with a "phys" property
> holding a single phandle, named "hdmi" through "phy-names", and update
> the example accordingly.
> 
> The properties are optional so that existing DT, which do not describe
> the PHY, keep validating; the driver falls back to creating the PHY
> itself in that case.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   .../devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml        | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> index 416fe263ac92..5a033fec21b0 100644
> --- a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> @@ -108,6 +108,12 @@ properties:
>   
>     sound-name-prefix: true
>   
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: hdmi

I don't think phys-name is necessary here.

Neil

> +
>   required:
>     - compatible
>     - reg
> @@ -136,6 +142,8 @@ examples:
>           power-domains = <&pd_vpu>;
>           #address-cells = <1>;
>           #size-cells = <0>;
> +        phys = <&hdmi_tx_phy>;
> +        phy-names = "hdmi";
>   
>           /* VPU VENC Input */
>           hdmi_tx_venc_port: port@0 {
> 

