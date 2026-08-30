Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7603939A4
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 13:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788094869; cv=none; b=FLzAJoy1Tl1Zk8uprCF83K6ZqTn5i/8x62jNJZbW0RaEJn5FswoPzcZ0pK+95zb9qoGehGy5IJwUJl+YvybiIt5O++NQwiUjuVN/8JaHIPd0MO8+BMjsVIH/udszZ1K4uFE4mW7QbKA/I0GRmkZmlSveiVOJhXvbWVHKZvQAbPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788094869; c=relaxed/simple;
	bh=7EUviMg3xn3ii2YdahPBJSv9i2OF+HCnfn2F5OI/9fQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=aznY5+v1Ca0Wkcryj1708QKp3cCKvstozKeyRFQ2V4gFYIRVz8slaaAnAQ+Gq2yQGjOrsSle0ZlYeF0j580Hd2+hsGtC/VEi13ZgpVkiO3YkarwMKiIC7/NbW+i/b7+aRIHdGs1kiLZmVADSKQ1FOGe7+HyEcG+zGNlSz0oGx+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pG98rZsL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pG98rZsL"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso16000795e9.1
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 06:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788094866; x=1788699666; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xAfuZ7JluHHOG6+wKchV68mnIiwDxkUArIKVwzrSUYI=;
        b=pG98rZsLGyQNuVnqLGG5HnUCQmBnX6mw7BWCk5md35nAcD9ei340Ia76JX4QtEi3aL
         Hl+4egXGzpREhJwk0qJ7jo2s8mur7GLzkSijTprR8vWtlaMRU0IITP9H8iETiFDHiYXx
         Y4CPTZQs4hrQWLVLQb4GwdoPyCAVmyscbxYCoPr/1oZoETvQZNLy2E4bmYcmVJoqD8Ii
         hI69XT7pA1vnc7DD+PSUVq3QTuMBrq7fEcSRwyq+qR+nDLAFg3ujOtDeP3f5jRqm0FUD
         mJkXhDdHinJorXVThyMvj5EPoVjinTMaGcNpbiBmGJ9kElRx+7+l/lOk5De6BuAnm78U
         9yWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788094866; x=1788699666;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xAfuZ7JluHHOG6+wKchV68mnIiwDxkUArIKVwzrSUYI=;
        b=WrFH6icWs2MpEGX5Vqid1qa8GDvqyLxjHKUwETV16LexAWVIc+IaHLCqp4zDjZx+6r
         HWWn80AIhEQCkyN5bnQxxEeO2tFQL0QtYmoz9Vuepi20iOKHxndIzJoEvbIk1/CzleBi
         QObNfA5Fr+fk8RPK660WHVy8wEzqw6eUrPC9Z8uzz12Nyoknp5XB4liibBzHDctunOZv
         rKEWMTxMCoTxNL3OnHhDlaF2I9AwSDIiF49+IqPqMnXgVPcKqsYvezZnXheboNcAPutB
         LKlChrBjksZEZO3lFGQTBN1TTGuIPaEAgczXSEZKbgxRv/o4IRyefDdvQhEsj0iQneZi
         dKlg==
X-Forwarded-Encrypted: i=1; AHgh+RrxvqlCCXTkjacKz1F6CBonyxwjqIF3ExWBr2dIOA9fSIWK/tObOhByZ8UfZCBRzyc/7WG/YWUcuwod@vger.kernel.org
X-Gm-Message-State: AFuF++ky54aLRgcMiY3liBXb5Dp6+3sOHGOq84+/ExuANRDMobQu944E
	t/wuMK3YH5r9PY4FYJlVlERXefZLQqaG8sdAWGUSsipkaqFVVNA9gyC8pQQxMJYqPS0=
X-Gm-Gg: AR+sD12/qdpVOS4mairiswNneKDmqlDRG/EzXAnNiRB6MuyT+wOCtr3llFecgs8NaRN
	bhxyNoS2xkM/d2/TAu6X0gyGwai5ricTIx05F7L6ClPm/WlkAj5RscqRx3FQeEedo5oBlU8si0b
	iQMwQTOBSdx+Fscpa4vknAExizq9jMtL9RXLJ+MlZX+6QYey+JoxdPlFSLpN8ZiHeaG50111Zya
	X5nxBDvMitwxZoLu+jav+b4nFKjtwEMz2JQp/PJ+t3OsLwy0w40PcB6VRBUhVy0O5FkYimkkevZ
	ZfntsYy/TY6sFLa2y9yEmypCWjSXYI+mQABO1kjd+Emkugj+E5JqSMoJNKOcWEC4KKZ4+0gpSp3
	nxDOTS6HAoWY8eJ+ExcxsT66pEcWqewILvPTObakyWasu3pTtejMMpAKhLMZwHZVEiQQ6l+LlRy
	yq6GkifasQrftWaBfZBP96q/YakzQTc6UPW3AsU+egQCtS3e2QWf7fu/dk1QZa5vgjnpF3xwo=
X-Received: by 2002:a05:600c:3f0c:b0:49c:cedf:f870 with SMTP id 5b1f17b1804b1-49ccedff89amr119461615e9.16.1788094865580;
        Sun, 30 Aug 2026 06:01:05 -0700 (PDT)
Received: from [192.168.1.36] ([83.214.235.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccea87e1asm81979695e9.2.2026.08.30.06.01.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 06:01:04 -0700 (PDT)
Message-ID: <d7380972-d54b-4162-84d1-b377d4cf2189@linaro.org>
Date: Sun, 30 Aug 2026 15:00:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: Replace spaces indentation with tabs
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260829193939.107564-2-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20260829193939.107564-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/26 21:39, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts | 2 +-
>   arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts       | 2 +-
>   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi                | 2 +-
>   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi                 | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
