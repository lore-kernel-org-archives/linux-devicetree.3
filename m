Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231353B9D95
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 08:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778487138; cv=none; b=NnEOwmX6JWS0u1XZ9sno7+Vj0v7GdJkSD99eI8Im16JLKlKA2BaKYL7Yyk0PJyY+x6MjQ+sqpM9ZkTKvc0jsN7dYtl8o1dJTXh0HR0A2RIE6k6gAtDjS3PpBaul7lTFfWeXOtiVkkSluLUuXjG0lmofYo+1DX44wxYgtWN9oFnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778487138; c=relaxed/simple;
	bh=gHf1kCByypJUPgP+JjxmSr6L/RX0X71RNUwmP1xp4rU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=uaXd23Ecij7dOrC8ZIXdSBkXEe17rO0M2HPn9huhBMZS//kGlYGEzcqdPjxg9a+uQxROld0PvTJ3uNQ+jhUCbMiRspZ8RHVj8fxMUuP7TBZu/rlnGzL5YQ66iJgYg6izCakoTsiKXDkKTxNFHvNjUGHNYC4/sl/Zuqn9ReQSpBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OXNhHl54; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OXNhHl54"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-452169ae568so3047249f8f.3
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 01:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778487119; x=1779091919; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=368/MaDXqGLA/8KstOIXQkFV/EZb8wNhtT4QvGJceEc=;
        b=OXNhHl54DLFO3JO4WtyXEtvuHeukRSu8WklPdvCM2SKBOSE2jbSB42LeFf+Ft2VrKp
         VUzbLdtagAG5GugFum0H+2YN0YH7LVuIV95n9Yx4rnFusqcnXxya/gnNw62PXXFaeAQv
         StRlpwqQ3J6S5txUDWuMuZhfxK+nhFOr/pELDhtX4DmNRXv6VPPMhh4+MWQ+QsHnl1iE
         oYBg2n81Xp1wZ6mGNGe0KoCXwS5EsCu6KvEOjjAq4KEbH9sCWmxQ2xRsAriWIwxfBfW9
         ci9zbgG6VfueAnEQ566cbOioOTuI2NfxZnxplKJ1WcM8ZC74OL3wsLq5xXP3i8FKB6EE
         OaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778487119; x=1779091919;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=368/MaDXqGLA/8KstOIXQkFV/EZb8wNhtT4QvGJceEc=;
        b=WjVX4WSPNTOkvQZ/zX4YL79F22EWXYEGhAnocROQz4hsSD/aMCSJnjtASUB2NC2pxx
         vRm1H82/53Y404bNByovM3eGJ8P49vHlSiPrOqu+VlITx5CO1P/szZV3ahPsD3nsCdvE
         Omsg8WjrlPmHPEGiIyfnvHAq+ao4ThNV8KxVSmVD31xIO87MYCfwHSRahjXQKu1Jefce
         AYcFlt3UdNOH5i23TNUoFMvqpPTn3F6YsNgfirqHxmtaLdzMRJ3tNE1jd5BQqyXiZjdf
         K0oiO/Zfab1A2DMogrXnzK6ugUasei+L6TRaSVJNMutVluHp7BZjFaf/91udQGpzj3fg
         pKRw==
X-Forwarded-Encrypted: i=1; AFNElJ8wtgOOeZlCjdbTKfZdduu4TqggSplfS2UudUvvVWlWVtX/5t3vGSbc9Ejt0g6wGe2NpXZuABvTca7a@vger.kernel.org
X-Gm-Message-State: AOJu0YyG6dUWVbdt+NAv1rUaFyxpLwpB0sOFpq6wsycpofOUm3xjeePF
	eIuHIyIpTHlspdpMI1Ff2IUMSQqCDvCiAqePyxNM9TbhwpDTQrDSNWvEBYzwY8Atvhg=
X-Gm-Gg: Acq92OG5hczbvufO48+9487w6emQF15nVL2WXX3NEoIAM49YNGEdJ+2y4yHQAeIRY48
	4BOnsEot+5LxwOSSsP9LFfDg7O+psMWA7RhpuJ8ketvjYTm0XhYyGTvk+tb82zmQCRtwei2Pn23
	DTUDmSesxI7RMxTgNmPs3YHQcXTQtj+LoeEvvR0fzLjUlQF/8sci79I6D/0M54KZE/+qBEF9e/K
	r6GaTlk5FzmU4MNTsYCAti0lC6oovFkgZ/OYHaqCAOaaPYRXt3Zgn+/icj7LjjHj96Kvkc1Md6a
	3gU9N8c6pbRINaGc3jwICTsCDwzkEx5f73/cXgyG/UmlppanSDRq/VAck+GUuJx/eidD1y/Ee1/
	pb7th56noT4SDDVT5FwHCbspSyUDo5EiCMVvlSoDLa7zkZqvAUymzlQ/NQ0nADQaPsRUTBo8s+c
	FjsStJuv8dWTG3kn76Au8+4JLO8gGCNg3XzOMB3UpWhHI+cm7wR8h2LAZzzhfCxCXrr3/kQE7Vm
	jMO2Mw=
X-Received: by 2002:a5d:5d03:0:b0:441:1c95:17e7 with SMTP id ffacd0b85a97d-4515b5243efmr34866108f8f.15.1778487118641;
        Mon, 11 May 2026 01:11:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:63dd:7879:45c5:21b9? ([2a01:e0a:106d:1080:63dd:7879:45c5:21b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454916df968sm24531817f8f.25.2026.05.11.01.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 01:11:58 -0700 (PDT)
Message-ID: <6a8da5a4-d42f-40ec-a834-b36d6da4431a@linaro.org>
Date: Mon, 11 May 2026 10:11:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/2] regulator: add support for SGMicro SGM3804
To: Mark Brown <broonie@kernel.org>, azkali.limited@gmail.com
Cc: Philippe Simons <simons.philippe@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260510-sgm3804-v1-0-e5e8799e0aa0@gmail.com>
 <agEoC0kdKoOVrjne@sirena.co.uk>
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
In-Reply-To: <agEoC0kdKoOVrjne@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alwexandre,

On 5/11/26 02:51, Mark Brown wrote:
> On Sun, May 10, 2026 at 11:45:25PM +0700, Alexandre Hamamdjian via B4 Relay wrote:
>> This series adds support for the SGMicro SGM3804, an I2C-controlled
>> positive/negative output charge-pump regulator. The chip is used to
>> generate the AVDD/AVEE rails for display panels and is present on the
>> Ayaneo Pocket DS handheld, where it powers the panel and is required
>> before any panel driver can light up the display.
> 
> There is a separate series from Neil Armstrong (Cced) already in review
> for the same part.  Please sort out what to do about this between
> yourselves.

Please find the patchset at https://lore.kernel.org/all/20260506-topic-sm8650-ayaneo-pocket-s2-sgm3804-v4-0-7495e7905693@linaro.org/
it implements full support for the SGM3804 with voltage control on both
rails.

I guess most Ayaneo boards uses common components, I also sent patches for:
- https://lore.kernel.org/all/20260430-topic-sm8650-ayaneo-pocket-s2-sy7758-v2-0-308140640de9@linaro.org/
- https://lore.kernel.org/all/20260504-topic-sm8650-ayaneo-pocket-s2-r63419-v3-0-9f61cf24aebf@linaro.org/
- Display DT https://lore.kernel.org/all/20260428-topic-sm8650-ayaneo-pocket-s2-display-dt-v1-1-ff132c00d076@linaro.org/

Neil

> 
>>
>> The Ayaneo Pocket DS device tree, posted as a separate series, depends
>> on the binding introduced here to describe its panel power supply, so
>> this series is a prerequisite for that work and for any subsequent
>> panel-related patches targeting the same board.
>>
>> Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
>> ---
>> Alexandre Hamamdjian (2):
>>        dt-bindings: regulator: add SGMicro SGM3804
>>        regulator: sgm3804: add SGMicro SGM3804 charge-pump regulator driver
>>
>>   .../bindings/regulator/sgmicro,sgm3804.yaml        |  60 ++++++++
>>   MAINTAINERS                                        |   7 +
>>   drivers/regulator/Kconfig                          |  11 ++
>>   drivers/regulator/Makefile                         |   1 +
>>   drivers/regulator/sgm3804-regulator.c              | 164 +++++++++++++++++++++
>>   5 files changed, 243 insertions(+)
>> ---
>> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
>> change-id: 20260510-sgm3804-c37a0ae6d7f3
>>
>> Best regards,
>> --
>> Alexandre Hamamdjian <azkali.limited@gmail.com>
>>
>>

