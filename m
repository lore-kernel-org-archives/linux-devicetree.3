Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAA0403AF7
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781092340; cv=none; b=qqSK5MDqxfs0zexBFQJNSkFhX08nmQGdeg2WH3nA33I6JgCXPBjc6yjqbibojrsEfUoU/s+pfZyszSs1EQ3o6sALYawTB6TzsLJeAgl8n7+nxxYlHocZavZhoCbQxzJ8gIIYr/CE490ZzeMGLD+RrImCoM7Tj0r5cD7JzXNz9FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781092340; c=relaxed/simple;
	bh=1HmiDIsnKshMBl8c6DN2fBfkak63RnLLhJObnYlMCDo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hiTXNKHqA31wCIimZIatVcHcmB8fSyZ1MLz7sxt80CGOYjRv9w8+itbDbb/D8Z23tSZpVioqRWPYx2vzMEuGU9Svt2YOBC9v89JErs/CSz3V/BtUpChv3ob2RRLN101GTxJr/JrL9coMOF0pcsCUYKoRLb58nFxKOjTQ7aFUyAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wK9joYba; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wK9joYba"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4908b92904fso76594495e9.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 04:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781092336; x=1781697136; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AfIPA1aZoEhui6Mu5CjguI7eMbQ8iYAHHH0Gm8rNQOo=;
        b=wK9joYba3UIid3tmRjJtduQcid278DMmwwYrQu6GQv2OWohRCAHDM1eu7fAZc+I6gq
         Ol32n3xAvy96kZzhIsY3l4iHzI0CSCDAS3Gx8XWtBC7DMX6PrMEQDU9psRzKW+Wl7fNO
         ex6ujRfFHs1TI4XRzQkEk7HkJQuuHhAAME3wmlGvKDkd2dulR1MTPIN4K8Aem9G7w7Qw
         MWIHtnZG71hmoD2yA43RzOiKzxZfSGV2h1F69h0o2RttMYXUnlTO29QiEWl5Qy3jp6cc
         IdCn/ATSVviVdzQfZLgTvK3Kyuhk+zS2U7i4eyf25XpqTHaisBXVjJ6mZBiMJurwlQX2
         4NKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781092336; x=1781697136;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AfIPA1aZoEhui6Mu5CjguI7eMbQ8iYAHHH0Gm8rNQOo=;
        b=WSopsf2w+VoFQ2sP1FqlsYEo66TkjxC5vggRwgpjuK9tOpY81wLd9VZfBFWO29nRfn
         GXly3nUX+4EaIMKVzMG4jF3q5K8bd6eJ64P3OfdmiTW23mLc4lJ0t5WADT1v6PkuAXoF
         CaHIXMF17x0EEa1O3/fbeaL7stVMk+MlfOxGS7XBEaN2DLZa3ePI4iviIjpv5aQqo77P
         8huAHDcrWtmh++/OPJJ+OYvav+qyOpHS4GOS4mvXcnBarq9etNcyIrbN4+DJG1pTjjwl
         BonTb2VrtwoycVe9vEDn9v83B3KWaLTo9jOCH1MRGnbrUHdRRQe1akmRGl9qHPDelVac
         wcSw==
X-Forwarded-Encrypted: i=1; AFNElJ/hmNvUEaEkHcvItmW3Qs2pBAT/S6S3PNTZcMnI+AuU5+Seutt8TbRFkcjThbfPlKrEv62OWsMkZvy+@vger.kernel.org
X-Gm-Message-State: AOJu0YzOxrFp0wtehc01M7SrRcJ1emqgsYpthzH1RqXjTBzWSkfIbsgo
	09/Ugd4c80Bg1iyHUXgM0IW7RGW1VzGNoaF1OjmZNTyh80IUs9UXvJCHrRoVau6rO24=
X-Gm-Gg: Acq92OEZa85HOTlNBtIehhE9ZVsrVz1xroKKWGxSWdEOZj7nl7gZYKwTR236s4DYHnE
	GTJvayIu9EW9fJcurbWUfTQYyJk2VOnIULwcga2/kGz5R2WOJv6V0gDqfLpnWjkw3JpDnrKLBSP
	YyhdDDLUBwAUvP1XBdSmLDOI6opI97SKlswSB0kmuPtmU9fCbGEDm4spoGKbE73beau7RymGYGX
	KJIYWBtglyrsFoDqRafu7KLXKMamd7CfbP7+Mth8jBrjFtQZgauLq+PcdgKlv7JAXu6jBPl6boY
	9dokDsNm8qjiTB/FARcku5w5Nl8OMl5iga560q3yfd60cxlRf/uAwktQZbEM4eCw/d9Un8oVZqu
	QfCudoIYak0tw2yZ5FiV30mGruTOewo+6B9slZGuagBmHJiJbGXrt1hbEFT5ZKU+qo9uvKt4r/z
	N4zDQHb/g+9hSS/Z6YpZdGdHvp2ik3MIxnrcCukiFhmGEXh03NKAORyacaY44/V6tW/ov9T7Qlq
	nG3L/1G9tCDWmXYMg==
X-Received: by 2002:a05:600c:83c8:b0:490:40f1:5314 with SMTP id 5b1f17b1804b1-490c25b2b7bmr375153215e9.1.1781092335592;
        Wed, 10 Jun 2026 04:52:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:b5bf:da7d:ac8f:8fa4? ([2a01:e0a:106d:1080:b5bf:da7d:ac8f:8fa4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c1149sm494088735e9.4.2026.06.10.04.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 04:52:15 -0700 (PDT)
Message-ID: <fbb79046-bd27-4294-869e-dce8fc0ee79c@linaro.org>
Date: Wed, 10 Jun 2026 13:52:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/4] sound: qcom: audioreach: support WSA speakers only on
 WSA2
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, kancy2333@outlook.com, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
 <aik4dCUlumE1A-_v@sirena.co.uk>
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
In-Reply-To: <aik4dCUlumE1A-_v@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/10/26 12:12, Mark Brown wrote:
> On Wed, Jun 10, 2026 at 09:41:44AM +0200, Neil Armstrong wrote:
> 
>> ---
>> base-commit: 1ed783a6906ab62a54d631ff3e8c5cba0f4f4b54
> 
> I don't seem to have this, it doesn't seem to be anything from my tree
> or -next.

Sorry I forgot to add the dependency, it's based on v7.1-rc7 and depends on [1] for the sc8280xp card data.

[1] https://lore.kernel.org/all/20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com/

Neil
