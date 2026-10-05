Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CDC40D588
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 08:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791190623; cv=none; b=T9z9ghwdZGUgAun+tfN7f7rKq0Y+43z3Mgzi3+Qrjs/pBLRXEOlplkyigEhXMbuUw0v5j/n9sFsmpxkWkfZhyBzTXH/Bv9oONQm7aGCHB3qNMbFH4LIR+HGlmai337Q87q6olwE0cpCCuB7saTqBs7OY6FTe4oEG4ok4GWS4cVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791190623; c=relaxed/simple;
	bh=T/qGk7sgu4tQdHs7CpSk1MQS0VxJ7UAu71qy7f9fEBw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YKnsriEkCJl2jnirge/kNW5i1pRDQi8PtBQxbM09ZkHPgDrrX5dS3NyQwb1iS+fTIom4DggUvYsStgtaEzLZQgVYEjcWWVlic4VRN3Wc+IyxN9butrNXnN2JBdOfODCAMoXhonwjBvESiBO4+r4tQfqVJv+QjzYvsdathR60Xk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A0tPDxG5; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A0tPDxG5"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af4663da5so1302281f8f.3
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 01:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791190620; x=1791795420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XejSzSbf+ABtZToUFlQIw9XxytbopN4NR3AIBq1eEBM=;
        b=A0tPDxG5uGEngiB0mNkHe7pZAF1wM3P6qS5CnqO9Ko5RFFVl2YKoo1/vC7wKKVWQT5
         7Js3BKcoSlKDh54M6GrcLontydVnQlbi+UeKcPeKcvlqU1mG+gd2dAmrNltLmlQZ3mqo
         TvBrNhTWYCpQ1BIyRAWIZyU28fk1lLDdwFiQ8rR7cKCjvMiKlOovJe6FTvPE3lwC2qMo
         f/X6iAUX2AvsY9pmvx0J7fo66BS6bt/bPNJyik+pR783aPWosiYPBGIOYOBJ1d0leIAd
         qriU0JWTh7aE6Qoa9R7ZyHSpkzEX+MNOAPwn4q04OnpfSzR+TjzQoDs8mBWv2O+PU8m+
         0zdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791190620; x=1791795420;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XejSzSbf+ABtZToUFlQIw9XxytbopN4NR3AIBq1eEBM=;
        b=UmNcvlDe5z8IoDUF1QhgLm7Yigvjv9s0oNaSHAZUOHCzqQ9ScPzDY7ZM0RX0sS2YrZ
         7NPxJKyQDY60pHnu1rcGT2zrP/TfK4PvggJizAKjcwvVc2uYuOpXt9QH70TjU1MED5o0
         i3Enn7jNu56Y34DwDieCpunZsex3Tn1DQY/z6M7VrC6rNs9R+af/SgPaPWYSlUD4Q+qX
         KXUUH4OUHmuwE0pmsw+qOTH/YcohCRX5lJmrQKjbXZ4K5DxKTIA84mkQqi44WEHYvgj9
         IZUYVlqAwNP9lEMKkwlMRmHKeB4dnwNLXj9X6A548B458Q+LvesGZiqBhcamC3F0ALw7
         RnuQ==
X-Forwarded-Encrypted: i=1; AKwUvBytnnCiSBmxHvq/oF8Rl0Io4af8UJelOqSUChOAD23KNS5HuWWOvL0Y1ub/njxGa4VCyqZ65Ezr5ZI8@vger.kernel.org
X-Gm-Message-State: AFq9FYKoXhY2TezXLFAqAP0k50B42msG7MwATCgekYcsKdQRKtt2Uf0I
	vsvThj2CuR8Ii+J2mjAQ5tM+5OcDyHCNIpCFoWcvCqqMeGDgg1hJFE9a1Rq8RwTwAnU=
X-Gm-Gg: AYBFou1bkF9BuieKHsE5iO1cusqKIsAWXZYezRD8iGSUHKSXMXn0x0a2aprfkC3rf4L
	l9fmex+a3dmnKsgXF2kjYCN9/OmvgBL5Wifp+3uZDBH7Cvq+/sFnR1rIDvCJcRCn96OJO4pABys
	a0z7LKviNEi17r0N/aKHTR3q+7TWTsPdeN/vLcXt4M5kdzP/xyrMy9+RD/x0zu10lZU19HHU+Ln
	wSq1Qym7ogk23i8nN0Yo1yA9MmKYGl/T7K6mtt8XBF+sEMpD9bQdIjMO1eceQFRz4JWA6WLOTVS
	6XNgFUecIVJSoKIiA87yN7DZ70v8wXSzHrPOOjUF7OJvVXfup0z2RQEmhbh40uta28E3PfW4QZu
	BCIKOVEy42uli+HGeFSdneFMOMl6hXSpfc0xppA+tibsrsT2VMzkFR0h1xyflmxUHv5JCvuLVh2
	pm/0czY9C69uM/v+WcH7Ue0KsyETDboR2dMWiaa3dHCPTJortLipaeBiSpancuEHOyh+uBlRJ7p
	v/jFc0eNaMgwiJpd/r6XU/om1s=
X-Received: by 2002:a05:6000:4a19:b0:48b:60d:2b28 with SMTP id ffacd0b85a97d-48b1273bb48mr17360037f8f.39.1791190619709;
        Mon, 05 Oct 2026 01:56:59 -0700 (PDT)
Received: from [192.168.151.46] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622ab5a1sm2214789f8f.36.2026.10.05.01.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 01:56:59 -0700 (PDT)
Message-ID: <538604b5-56bf-45d2-9a73-050a0f2b14ce@linaro.org>
Date: Mon, 5 Oct 2026 10:56:57 +0200
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
To: Linus Walleij <linusw@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jun Nie <jun.nie@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
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
 <8cf6ec52-fb36-44e7-831c-2bb24214f591@linaro.org>
 <CAD++jLkHk-2MK4vUAz3q4q6v6jHhBkt33eJL297axbRqLn6w3w@mail.gmail.com>
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
In-Reply-To: <CAD++jLkHk-2MK4vUAz3q4q6v6jHhBkt33eJL297axbRqLn6w3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/4/26 22:22, Linus Walleij wrote:
> Hi Neil,
> 
> On Sun, Oct 4, 2026 at 5:51 PM Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
>> Describing it in separate distincts nodes is wrong since it doesn't reflect
>> that it's an unified display, so either we define :
>> - a "combined-display" bridge defined as:
>>     - a separate top node in / like connectors with a graph from the DSI links to each panel
>>     - a DSI subnode with 2 panels as subnode, port graph from both dsi to both sub-panels
>> - a "R63455" panel bindings with 2 subpanels as Linus shared in https://lore.kernel.org/all/CAD++jLkyEPY5cFg_pHb71yG52iLwS9tQDpcHu=TTBknQMeFctw@mail.gmail.com/
>>
>> I think it would be interesting to have the "combined-display", with a connector-like node,
>> which will do all the split-dsi dual-panel logic for us and leave use implementing simple panel
>> drivers.
>>
>> The outline would be:
> 
> Overall I really like the looks of this!
> 
>>          xr-display {
>>                  compatible = "combined-display";
>>
>>                  ports {
>>                          port@0 {
>>                                  combined_dsi0: endpoint {
>>                                          remote-endpoint = <&dsi0_out>;
>>                                  };
>>                          };
>>                          port@1 {
>>                                  combined_dsi1: endpoint {
>>                                          remote-endpoint = <&dsi1_out>;
>>                                  };
>>                          };
>>                          port@2 {
>>                                  combined_panel0: endpoint {
>>                                          remote-endpoint = <&r63455_right_in>;
>>                                  };
>>                          };
>>                          port@3 {
>>                                  combined_panel1: endpoint {
>>                                          remote-endpoint = <&r63455_left_in>;
>>                                  };
>>                          };
>>                  };
>>          };
> 
> The core of the crux is to make the argument that this node represents
> the hardware and isn't just something put in there to make it easier
> to implement a driver.
> 
> If I break open the headset, will I find something like this, some wires
> going around in there or so.

Well you'll find 2 lens modules with embedded panels, they are separate because they go
for each eye, since it's technically a single display for the brain. You can't
really use each panel separately, they are mounted in a specific way to be looked
closely by human eyes.

Neil

> 
> If yes, this is a go.
> 
> Yours,
> Linus Walleij

