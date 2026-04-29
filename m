Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBDA3947AA
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 08:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777449754; cv=none; b=AjImXToLOzpaGItmtXu8c1Jh/z3dkHp73bftiukE9qR8FpWlog0a9RgnDQF0WoN1nNGZ5pNgX0OmftSn10xMd8V+j3omPUxSsp1oYnjaPSR/dsds4TBXVGt1cIqX9nhscrzxA0cpf5ryU8cHaTj/MTbWDlsU7MracXKC8QJrFc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777449754; c=relaxed/simple;
	bh=6b4er1NOQyvs8cPrYXvyddNJKgS3bjdUkS06JygQzTI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OkMlGXt0GErSbJECUjZeMky30XVNBrxiGebi4+t0yGWM7szaKw2FQNrCuE8Mk0/libue09AKxdEIqW45n+2zlVuL4Opfe5MeTTMCg7E/iIXksDoh9MfXfKdmdhgBiVD/0HECSOa95A3OAidCcdV4/vNe1GM2qJnY+uG2hclGaJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q7dwgrkZ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q7dwgrkZ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso5385835e9.1
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 01:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777449751; x=1778054551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ggee1ozzA2Mh/uKU7rZ+emKZHTYb6DMgCPHUTf94hJE=;
        b=Q7dwgrkZnyYRZ6n1JkCrJK63nuOK/wTSAvwMSoFgOowqERl0jgcTAxR1j3AbnZbv+Q
         xz3WxCiXR/72558kG0b7AoH7vhjTkhqeefNOkd2/dSr7TmhEgTLpaPJmPjNhiGIPaNaF
         H4XlrZiUdBDROzbZ6ddKmI+45a7hyJTSJBjVj0QWy1ZDRMvs/neb2AFiPwxivRqoNsE6
         cEwapwMI0hDqJbC9F/ALKLwDvIiXyDa9XOOTOD6iwhBk/hFtkZjuluOBaKhjQYtTBAxs
         LF6nkWuJHLG4W+COUknWKgiqjriD2HrEQolSlQdmMQpjlovdXJPVtDeVC0uQeSw5YdDX
         B4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777449751; x=1778054551;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ggee1ozzA2Mh/uKU7rZ+emKZHTYb6DMgCPHUTf94hJE=;
        b=Dm2Gduik3wIxy4bMAjXLcPc6ArBL4bVhfi42dihwq0ff4JDVGPi+5fDTMekFglVE29
         KG0mP3/44m97YlOsYzuWKExI+gQif6xm5SXrxBFfL0JQ6d8X+obMlor00mmwysiypsOB
         YhaQ3gv1FOIOnnCDOPlzih3EnACMeqDWX3Az55LYfnXgbB4DYcibo/9AhfOmjRB3HAeQ
         A0g1lUnPHAapP/IwZdSe3bbX2vGDKD8uV+IcWn5QfMjc3ekgENNm/krhFG4h3B+MhUgo
         gzymXuwl4RvLAwbmxlAlha3RRwo9GyBCTYtWzBWBpO5XYKrAFQM1TFvCsKWjZfPxMCb5
         ZVLA==
X-Forwarded-Encrypted: i=1; AFNElJ+m1GmlGWS6FqVF2nWMv/Cfx6CVq8FIo9S8pLZkp0ItpPGpIuV4B14XAI06+P6TekWzs8Bq1iGfFV03@vger.kernel.org
X-Gm-Message-State: AOJu0YxhN/PdThALGgapwgN9tOEds/xifY3zYIZCVTFHZMzwFNKAoxQx
	etGLcKxOSjy491ytd0m3AH+s3mT+uQ1fLLwDhM8cdbSfszOeaFgacvsH9vFS6cvzsHM=
X-Gm-Gg: AeBDieuZ54qjmxQq6qf5cSWRlDEnOe3KP4PuITMXejq2kBHxJ2JE3wFLCfeL2QT/5uu
	uPVsEtG7ar65CWJxXBYUXCTp00kt34h2B0QdHkiXCs2pjPv83uLWJWo2aH1GhUM8Sfkc6ohsd0N
	2RhZgJY7KsxWanCIhONpDgVTmBloxOgQBiPqL3sXtT20UgPcL66+w6Zgy8XrEMwxYevvH7JbpzG
	TST9IdXLMFNdWIGlYaqKDEt+eITvxyH7nFsFgDwV1KHYk9fSWH3UIA1yQysLJsPU0oI/aQ2OXzk
	4ZvEKF2JNj5djiirdRaiqcYu5+HelbIA3sjFVdE0mdYYe6ySaK1sAJPBuYjrifCnCZXUXOXSJzG
	xaqnyZljjCRd9eVnGY28eBJzYkXvdOdTV0O9j/V/V4PVh4ymNj54SzUQ2+lnFXxsz7BlhmE7eEj
	M19bq0PkNABsWWMYr3UupPKalc0hJFTtMlVeTAkeidLRXqJndRTKvLvSrSdGYqspa17TtDi35gM
	mCgBUVrGDLQvutGhg==
X-Received: by 2002:a05:600c:3e86:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-48a7c1bcc18mr36601975e9.14.1777449750889;
        Wed, 29 Apr 2026 01:02:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:b679:2e1c:a552:545b? ([2a01:e0a:106d:1080:b679:2e1c:a552:545b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b92adefsm19748565e9.3.2026.04.29.01.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 01:02:30 -0700 (PDT)
Message-ID: <164780ac-2e56-4169-b42a-1b06e592a303@linaro.org>
Date: Wed, 29 Apr 2026 10:02:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: regulator: document the SGM3804 Dual
 Output regulator
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, KancyJoe <kancy2333@outlook.com>
References: <20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-v1-0-1d8dc7620256@linaro.org>
 <20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-v1-1-1d8dc7620256@linaro.org>
 <afFTIlkS7Vg_2Eah@sirena.co.uk>
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
In-Reply-To: <afFTIlkS7Vg_2Eah@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/26 02:38, Mark Brown wrote:
> On Tue, Apr 28, 2026 at 03:52:05PM +0200, Neil Armstrong wrote:
>> Document the SG Micro SGM3804 Single Inductor Dual Output Buck/Boost
>> Converter used to power LCD panels a provide positive and negative
>> power rails with configurable voltage and active discharge function
>> for each output.
> 
>> +  enable-gpios:
>> +    maxItems: 2
>> +    description:
>> +      GPIO specifiers to enable the positive and negative outputs.
> 
> The driver requires both to be provided, either it should relax it's
> requirements during probe() and allow only one of the regulators to be
> instantiated or if that's not a realistic setup the binding should set
> minItems too.


It's a mismatch on my side, it needs both gpios, I'll fix it.

Neil

