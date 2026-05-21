Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FEA35F170
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352430; cv=none; b=ndCiW2Ar/BiorvdxNHxpNjU/xXhUMdlFfRQuupcxC7GFb0/fkkHnns6SyzOcgp1++WxpVSNBhFAOwiDdboIZ5Yr0JGNQAlLU2Z0PzLfmlu9wWNKsGwS9mUhMtudteZ83FaXMFEbarP6/17JZI9uFe3VmzzPCkoogVoBNkDP4FYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352430; c=relaxed/simple;
	bh=7imtNeGlM0Ij74pQULbNoqDY1bGqPc+5D3+CclMU59M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GNsZiDZ65ZuUvSee7GUGULIkARMAYEAgwsNQ8swdxxl0vl8yXmCYG/6lOWP1ok7BPQNH3dhwlGblSpqSDb4xbsZOqV35w9xAIoE/1Xo7Vm1WPKuRu1Nx6KL5IVCF5lmPyUBuodDVvOeBh1FeQPw/Rw1MQ09kz8HZIA2FbeWgpfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tZBXphiV; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tZBXphiV"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so46587425e9.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779352427; x=1779957227; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+lhtBKg/we78saKSTSBcOB5Y21fRXHQiMOJZNkYcss=;
        b=tZBXphiVf2zGYyexrxUAc16fRLl9l/eSMi86bmd+nH5NR+Es6q8Hb0+H32d6juKK5i
         +sGeM1pggnB+JkUrzDB0ywG5UmZh23tKi4ax4vmFCrfD92Ux0f1NYv13ULXEpaq8UmDR
         EauWq5GhY+yXpyF2FjeUI/JTyqXllTrKWeAkVLgtPok5hln3O3y38xm0DytpqUEzWT9V
         xrjC6WBNQWlu1a5nSm0D1jaygJDrEIGRgBTZ5sUTbNzZr80nklYJI2EWbtUMhjfHdLCy
         LR0v4mczWl4mkZkXy4yYzRDyPToOW6RqxxikqV9a0ngbzvDXI4/Im0lOWPmgPve5CdDs
         DlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352427; x=1779957227;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+lhtBKg/we78saKSTSBcOB5Y21fRXHQiMOJZNkYcss=;
        b=q371BYVDzuwvJbZp8Bvwr1cFMVEBnt77Arqe30Wf/SR/x/1cJnmB3mKHWdY1UhwnJW
         400/ADF66IuN5hRsKtLy1gyTF31wNeaJlUwlA9LgnfM/G1jAwMDZMFz1q6LLxDvQhsw9
         VC/gNt1fV57T7VWW+Bw8TNrFNF7LVniPqgC3KuICWN++5ZdIdEfjGujYPhZfv1ueWXK1
         yy1uK99k1mRPpVBWxdVd0CPdjImCj55iSFFpgsdwxuTK+gSpDM9p+6AByKmL+0KCNphr
         qNvZvnytRXfUp1hBWAOJW2cDKA6AxpCy8FV4Mqho40l+6Crih5N4jk5n8p1Bp7L0cxNN
         XmZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8KmVBYH19K6GeLpokmsNhwDtMg15JHLg57hhlz2fcUvcZxc7uy71Q8+SPcvC3uDjsyvGK/o8+C9BEs@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjc50pt+Pp/tBTP+tnKcNZ89zLdWHV2kN/qRzw16EjJWiIEyyg
	8ZEhQfd3MVXOxSYx1zE0cT4S5hcdhj3vsF1d4+95MxjIdExSYGLEn6myxRDlv5pkpmE=
X-Gm-Gg: Acq92OGCf8g8xYa+6uFLDYkh8YO9STmvwuQSpo+nusBA+0Ajpvat4lOQxXz9HYi44Pn
	4R0EyusI/tdVOk01AWe47GwTtwJWhQvwFm0aU9Kkg8Ta0ki2Yg6Cc7Fy+xmm1NS1/OEbZCzZ8Nh
	otbeDwWB7875zYglVzErB36S1FAEt/tM26D55FYym/RF/K96MOcYu3tgtUPiPv4oi9W6yjTlkWD
	XO89A5q25IlRAahrcTuiF5g1azAlQ9usyPILs7gVN7UsMk3tQCYun+cqUmDi2VzWawWKiQ/AzGq
	YErPU2bTlq9aR1dcQTk3/xHFgsDGyzfBY4XYWOOITZJokNUTuVfZo0q05G2b/BIVzTim/kQtfSX
	54Uv7AZgt6XLHHUnb3RA1qVIoR2GkIes+/hGBnwQvPVkq1POLjoDsZxptdewYlQj1Il3flY2/e1
	9sbjRvZ1m1n30F8cKbrsDH9ODMClAmwcwXNo0HCVnR1COJcYYxJQP29OGGvGyE1NYhLBHdmRI/U
	/7qX/8=
X-Received: by 2002:a05:600c:4513:b0:490:3cd6:db37 with SMTP id 5b1f17b1804b1-4903cd6de06mr6682875e9.12.1779352427082;
        Thu, 21 May 2026 01:33:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:e038:7e8a:7467:8c6c? ([2a01:e0a:106d:1080:e038:7e8a:7467:8c6c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d9eca8sm48056395e9.12.2026.05.21.01.33.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:33:46 -0700 (PDT)
Message-ID: <55466105-03df-4968-87c3-38b5f45b83ac@linaro.org>
Date: Thu, 21 May 2026 10:33:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: display: panel: document the Renesas
 R63419 based dual-DSI video mode Display Panels
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org,
 wsa+renesas@sang-engineering.com, conor+dt@kernel.org
References: <20260521-topic-sm8650-ayaneo-pocket-s2-r63419-v5-1-dd5700299390@linaro.org>
 <20260521082230.6BD161F000E9@smtp.kernel.org>
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
In-Reply-To: <20260521082230.6BD161F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/21/26 10:22, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The schema incorrectly uses `additionalProperties: false` instead of `unevaluatedProperties: false` when inheriting from a common schema.
> --
> 
> commit 06ab207971a6f54327d9bb05b5e8355cbba81b0c
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> dt-bindings: display: panel: document the Renesas R63419 based dual-DSI video mode Display Panels
> 
> This commit adds a new device tree binding document for the Renesas
> R63419 generic DDIC. The DDIC is used to control dual-DSI LCD panels,
> such as those found in Ayaneo gaming handheld devices.
> 
>> diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
>> new file mode 100644
>> index 0000000000000..adfdd2c300a35
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
> [ ... ]
>> +allOf:
>> +  - $ref: panel-common-dual.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - ayaneo,wt0600-2k
>> +          - ayaneo,wt0630-2k
>> +      - const: renesas,r63419
> [ ... ]
>> +  backlight: true
>> +  reset-gpios: true
>> +  rotation: true
>> +  ports: true
>> +
>> +required:
>> +  - compatible
>> +  - reg
> [ ... ]
>> +  - reset-gpios
>> +  - ports
>> +
>> +additionalProperties: false
> 
> [Severity: Low]
> Since this schema inherits from panel-common-dual.yaml in the allOf block
> above, should this be unevaluatedProperties: false instead?

No, it's deliberate to control the properties we allow

> 
> In JSON schema, additionalProperties: false only considers the properties
> explicitly listed in the local properties block. This means any standard
> panel properties (like width-mm, height-mm, or enable-gpios) not explicitly
> listed here will be incorrectly rejected during validation.
> 
> Using unevaluatedProperties: false would allow properties defined in the
> inherited schemas. It would also eliminate the need to redundantly define
> properties like backlight or ports in the local properties block.
> 
>> +
>> +examples:
>> +  - |
> [ ... ]
> 

