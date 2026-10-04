Received: from mail-wr2-f41.google.com (mail-wr2-f41.google.com [74.125.225.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2813955D8
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 15:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791129111; cv=none; b=YWUjd5FmTglw3/lPVf1zzYh1BiCAXoNC6vajg60M+y3aIUVv3t971yQgbf8w8nzmKrM69BtDqEH3fzV1vkgOFR5pt1hXq+gSgKbX447C99u0AKW8Sv165cXFIdkmV6Qgf21FouL+n5S+lYSrLXrsnpodWjEnV6JYKsNO7pkrZDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791129111; c=relaxed/simple;
	bh=Is/vmCTEVS8LhULx4GLf0QLWowK1BBWeGlcSwDzadno=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=TjJ0G5Y0tQVu5VhTMEEHOcrRwqsRGoOvnznaNB1gBJgrKvtqEmRocUnbuwjxrJYw8E+jsMAiEuMI/b6Z/MUwFbZoNwBXuSB++ZEVkGwGBc7mylrOYRrGkoqf07v69eaPevywIr83ubkw6llORi5Dwm0fJulQgI03V0a3ipsa6qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PSkq/tme; arc=none smtp.client-ip=74.125.225.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PSkq/tme"
Received: by mail-wr2-f41.google.com with SMTP id ffacd0b85a97d-4834977ae75so442411f8f.3
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 08:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791129108; x=1791733908; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NM5YFNeJZiuDBiTJqEC+MHW61fR6/JMTqJRMvt7EHp0=;
        b=PSkq/tme5g+tZuDguKPAFtaaGw2XL71KaQutVmKq5LxMaYXBWIsAkAw2VYPFuxvn4N
         GKYlT73Ywy/eTQMra/6p5qjsflmaQyhYw3xYnjN/OQJcuUOGwejOWqVtF3u058145/sr
         wA8Ngry4ngZ6xiWm14QEUNXOfwUT7pR21FWzV9YZFZwUDPHl5+lWf5Rt5meFLnKqJPVs
         1JUV6JxqAkBpWb+6haEk+SVQReIydbL+Oc65Mfv/yJm8W+cps4iDDnX0z0ZMLVS0/XxS
         jmeA7JhtjhBjO9TJ4ei2sbypj3gYrQitdfx8//UgU6kedfrDg4ijN1NnS9mt7iLzhR6m
         SHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791129108; x=1791733908;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NM5YFNeJZiuDBiTJqEC+MHW61fR6/JMTqJRMvt7EHp0=;
        b=JwcqqmJLs5Z2YSunVXineOXc9Qh79TrWCQDx7CaMrrifuql/JVpifbedOSRDCc9Ey2
         LqSR6LMLmTVdCCJ4o1u5NDtpsEU9vsYcs+P2DP86zXOe0vMX3f7dJxgvTzK1BMVHgm1b
         c5KFzrmgsA0hxgePB13VzxuTIParwayEyMIcyZ45r6ynki5yFMZnmv/DLvjl45zQfXlq
         yAz/Qtb3LxUPiIJbZSO6LYm/lrXlN19KHKdEEBJrcg8/mCc54RrejjnmFQGkWxpWxqQG
         h9wW9fIxl0CqgYqO8N3M4o0bs20304gZww7yvttPdf1sDBjfHDlzml/HZkM2Upm1LwvT
         QoIw==
X-Forwarded-Encrypted: i=1; AKwUvBw01jJIt0lo5v/zpsHS3ueCWxOebCZhvM8QvuVte8GS0eMi1pMxTWskCN1fqx7zcuAeq0I/Lmc2i+LK@vger.kernel.org
X-Gm-Message-State: AFq9FYI+mNecFYVGRYEhz2Kr0yw/57Fe9B3P4QlZ9bIk4m0ZJDEGvm3e
	+uZMq1WVIt2XCp5/j8XOwF/p78f6AOibKV5SJqlFVNdJExcRq7OsuWM6RuecH26WJCw=
X-Gm-Gg: AYBFou3FJZC0aCXA7pcFbWfYF/lTxPqkwstYz+HCZbzlbW9+yBxuqyjVOaHqQXyQEGE
	8C2d1EdKQV8oUHKcTXl5Eo4+6nToMgKJJzg0yZMWR76IO9RaMk4A71CkyyOrejo5LNBs27cRtsk
	4v7gmT/wfdd5KgpP/6zwMU283zBoajBG3VlW6ivaT6umg2+2lsLHQKexYw1dSQjOCaMf2vCugrV
	uRr3m1jsNkVG0HzfOmmfbK329ta//tV3lMTwK2YyYzAylkkduj+/mnR7+zuE7KYF0J5neDeNZ+F
	AYKe9m7G/FbeWpoJ+8P45yLLQ/64kKFmpT76L94GwX+Z2ZUPP+sPXCpKRYg0qhaZd6bvHSXoC0m
	lQgmflsivmrNwX2eyzKUNkP9RfHxW8JLOXaq9tPSmrfRCzthw044QdUEh+pWIe/2W5fTP01y3B2
	Zn1a/OIRcl6PBcYXaCNqVXWxhVxHEy+5slZ9ZStAnIYBxyQ9LkRyCKljg/OYz3wsJXqzKO5pC/2
	AIu8NoI
X-Received: by 2002:a5d:59c3:0:b0:48c:5785:9b5f with SMTP id ffacd0b85a97d-48c5785a189mr3692503f8f.38.1791129107541;
        Sun, 04 Oct 2026 08:51:47 -0700 (PDT)
Received: from [172.20.10.3] ([37.169.53.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f0613sm21532685f8f.13.2026.10.04.08.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 08:51:47 -0700 (PDT)
Message-ID: <8cf6ec52-fb36-44e7-831c-2bb24214f591@linaro.org>
Date: Sun, 4 Oct 2026 17:51:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 5/6] dt-bindings: display: Add Synaptics panel support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jun Nie <jun.nie@linaro.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-5-c042266b9eeb@linaro.org>
 <20260727-spotted-winged-mantis-7aa1ce@quoll>
 <CAD++jLkX0m6_GJd4Pd1Ko4tghta4AXQ5ALZpLe_x-3xxqu1Cvw@mail.gmail.com>
 <668e83d0-a017-4f59-bc76-bf6c9a80b5ba@kernel.org>
 <CAD++jLkyEPY5cFg_pHb71yG52iLwS9tQDpcHu=TTBknQMeFctw@mail.gmail.com>
 <bc3e618f-2e7a-4439-9466-8cd9695242e5@linaro.org>
 <2lcpzwh7fxecpffnakpnp5lecrm3e6u64ztat7cd75nuxofxa2@clj27bzgjy3r>
 <4d053234-06d8-4268-b60a-2fccc78da654@linaro.org>
 <d3xs3kzc2wg5lkouaemdicrbtsoquff6bvmnlmuxwh4kspfs2d@b77l43axr6a4>
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
In-Reply-To: <d3xs3kzc2wg5lkouaemdicrbtsoquff6bvmnlmuxwh4kspfs2d@b77l43axr6a4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/1/26 02:43, Dmitry Baryshkov wrote:
> On Wed, Sep 30, 2026 at 09:18:55PM +0200, Neil Armstrong wrote:
>> On 9/30/26 21:04, Dmitry Baryshkov wrote:
>>> On Wed, Sep 30, 2026 at 06:43:47PM +0200, Neil Armstrong wrote:
>>>> On 9/30/26 09:44, Linus Walleij wrote:
>>>>> On Tue, Sep 29, 2026 at 3:35 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>>
>>>>>> This entire binding seems like stitching two devices together, which
>>>>>> might be fine (I don't even remember this stuff... two months old) or
>>>>>> might be artificial grouping of separate devices.
>>>>>
>>>>> I think that's a good point and fair pushback.
>>>>>
>>>>> Neil and Jun talk about it yesterday at XDC (1:15 into the stream):
>>>>> https://www.youtube.com/watch?v=6tNGW8PoSzw
>>>>>
>>>>> The current binding does not reflect the physical topology of the
>>>>> actual device, and the bindings need improvements. I have a feeling
>>>>> there is one display controller with two physical panels.
>>>>
>>>> No there's really 2 controller and 2 separate panels, but they are not
>>>> classic panel, they are a pair of panels+lens which are in front of
>>>> the eyes which forms a single "image" for the brain, so they are
>>>> technically a single display and requires to be hard synchronized.
>>>
>>> Yes. However this approach makes it impossible to share the code between
>>> the double-panel drivers and single-panel drivers. I think, that the
>>> panel driver should still reference a single glass+DDIC, while letting
>>> the DSI host driver to handle the bifurcation.
>>
>> Yes, and no, it must really be considered as a "single panel driven by 2 identical controllers",
>> and even this is really purely software implementation issue.
> 
> [...]
> 
> 
>>>> Describing both panels into separate nodes would only be possible
>>>> if we described a "VR display complex" nodes linked to both panels
>>>> but this would probably be solved by actually describing the "display"
>>>> linked to a DDIC controller and is out of subject for this serie,
>>>> and can be added later when we properly define things.
>>>
>>> I like the VR complex idea. In the end, you have two modes which you
>>> most likely might want to support:
>>> - L+R, having double-width CRTC scanning over a double-width framebuffer
>>> - Mx2, having a single-width CRTC and a single-width framebuffer
>>>     displaying the same picture to both eyes. I can imaging that knowing
>>>     about L+R might be an explicit opt-in feature of the DRM interface.
>>>
>>
>> This makes no sense to support both modes, and this will never be used,
>> and anyway this is purely software implementation.
>>
>> We're defining bindings here, describing the real reality, not hypothetical
>> situation that will never happen.
> 
> Let's ignore software issues. On the hardware side, you have two
> distinct DSI panels, each having its own set of controls, own DSI link
> and own backlight control.
> 

OK so let's see the problem in another angle, if we had 2 DS links 2 physical
controllers, 2 physically distinct panels but forms an unique display.

Describing it in separate distincts nodes is wrong since it doesn't reflect
that it's an unified display, so either we define :
- a "combined-display" bridge defined as:
   - a separate top node in / like connectors with a graph from the DSI links to each panel
   - a DSI subnode with 2 panels as subnode, port graph from both dsi to both sub-panels
- a "R63455" panel bindings with 2 subpanels as Linus shared in https://lore.kernel.org/all/CAD++jLkyEPY5cFg_pHb71yG52iLwS9tQDpcHu=TTBknQMeFctw@mail.gmail.com/

I think it would be interesting to have the "combined-display", with a connector-like node,
which will do all the split-dsi dual-panel logic for us and leave use implementing simple panel
drivers.

The outline would be:

=====><=======================================
/ {

	xr-display {
		compatible = "combined-display";

		ports {
			port@0 {
				combined_dsi0: endpoint {
					remote-endpoint = <&dsi0_out>;
				};
			};
			port@1 {
				combined_dsi1: endpoint {
					remote-endpoint = <&dsi1_out>;
				};
			};
			port@2 {
				combined_panel0: endpoint {
					remote-endpoint = <&r63455_right_in>;
				};
			};
			port@3 {
				combined_panel1: endpoint {
					remote-endpoint = <&r63455_left_in>;
				};
			};
		};
	};
};

&mdss_dsi0 {
         vdda-supply = <&vreg_l3i_1p2>;
         status = "okay";

         qcom,dual-dsi-mode;
         qcom,master-dsi;

         panel_right: panel@0 {
             compatible = "sharp,ls026b3sa06", "synaptic

	     	reset-gpios = <&pm8550_gpios 3 GPIO_ACTIVE_HIGH>>;

             	pos-supply = <&vpos_right>;
             	neg-supply = <&vneg_right>;
            	backlight-supply = <&backlight_right>;

             	vdda-supply = <&vreg_l12b_1p8>;

		port {
			r63455_right_in: endpoint {
                         	remote-endpoint = <&combined_panel0>;
                     	};
		};
	};
};

&mdss_dsi0_out {
	remote-endpoint = <&combined_dsi0>;

	data-lanes = <0 1 2 3>;
};


&mdss_dsi1 {
         vdda-supply = <&vreg_l3i_1p2>;
         status = "okay";

         qcom,dual-dsi-mode;

         panel_left: panel@0 {
             compatible = "sharp,ls026b3sa06", "synaptic

	     	reset-gpios = <&pm8550_gpios 19 GPIO_ACTIVE_HIGH>>;

             	pos-supply = <&vpos_left>;
             	neg-supply = <&vneg_left>;
            	backlight-supply = <&backlight_left>;

             	vdda-supply = <&vreg_l12b_1p8>;

		port {
			r63455_left_in: endpoint {
                         	remote-endpoint = <&combined_panel1>;
                     	};
		};
	};
};

&mdss_dsi1_out {
	remote-endpoint = <&combined_dsi1>;

	data-lanes = <0 1 2 3>;
};
=====><=======================================

So this would solve all the similar use-cases.

We can even add the "xr-display" compatible with "combined-fallback" plus some
properties to define how the panels are physically placed.

Neil
