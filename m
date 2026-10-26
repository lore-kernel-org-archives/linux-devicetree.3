Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793005205;
	b=oLoKniBF5nCYLgrpDe92Y4opP6E+foZhZdYqU4i5S7607tXmHOReGuqE5gygAEBnYqPL
	 N9N1GXQUwaernZCGc6ocv2v8pxhIkzBwEhGTiO3yT9LmDBj7Ivc8gVvOZVbamB1ac50Q+
	 MU8KZatDoOH8Xu2ox9CzDY0Rz1EDJDjV5Z71VZpDMR5d8cKIBiXn6FK/KEdb9h4pzr4vm
	 H/mjkUPrYvd+wPHFtIIjM/zZy7xnHnW/uYeED55eJwUDkzhtSTcdyroG67ZhQWWuNzrT0
	 x0I+sfC2cBpHVC3jbJELseqgQU3fTHPTrQwtvoJT0vxykxIy6idkLO6hqs0GklWwW2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793005205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=pQgPzMtG93EgFqIKN+g+Ioi2l+YOrsAj4oztf0+jNvg=;
	b=XNwSrCa24IoRNi1QhSNEjAHpPmT+duslHb8fzl1jKwmzZlZCuYHJ7Zgw/jfJqxgCn8en
	 j9Hj3Excjz2aa0ySihndKANTvlOKAeskjieLIubvsMnORsitL3Nh8s9lOrqPHsDIH81JI
	 J2mrfm1E3xjwNtlRyx071m0kosAeo/Kw0RAOeT2MxQsj9GNdN1JW1TLEQO2Hnt6tq69Fw
	 MRsP4xaw2riwBpvKus9VHy6BEFGaIj31ZQWeTcybS8pkD7fVFJVkBJ9QbxcBlKsyohmBV
	 6p7cYMW3UlSOhjIl1b3edgeHlhfLRCJHLbk64rqSM4fXOonhV7DG1dn3cAhNdba7ouA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=u6KM09xC;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47E0606A31E
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C47E0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=u6KM09xC
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so11057245e9.3
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 02:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793005203; x=1793610003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pQgPzMtG93EgFqIKN+g+Ioi2l+YOrsAj4oztf0+jNvg=;
        b=u6KM09xCqYJ8JXVzXTUiFQILmdo+65ZgWXoyzsVfvN1EZTv+Aexm7+OMZgSYI8gmNo
         3cOhAcZEXlqppWqtQuejkeAWdltWe4/Wf2QoxrOht5Tc5GF1wywqMmrKE1zibdtjdNn0
         OjRYHiMdLLnRvIUfwWkB6RCHCeK6xY4Uno7rj6iiAsjJ0lshXTncY1Rh2b4+n46xShZt
         tqyfGKhjlg4HrEMD7Uq+PtwNOGpX3HFc82YpMZ7zmBV4pIUyaB1eqaz3BQgE0O6ntsUO
         gUMy/lLCA4j8yJ2Ix5PbYqyF7raWJWoTmtw0cLLWPtoUH4YEXo4q5i+kmssr4ReZfiWW
         nghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793005203; x=1793610003;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pQgPzMtG93EgFqIKN+g+Ioi2l+YOrsAj4oztf0+jNvg=;
        b=13Dl6VcgdCSWVr+8qfUcfsmS5fCLutoKp8Gh6yFZpiA/quHpFKCGsZ+2h+Owj2ZEd2
         ZYGmg8dR/khZaONykgw3j61mHjqZA07N5tbcyGOXNhDmZq6Er4Tva2OnHmr6jnxgDmOK
         P+k4ivQ16UjbYee1aoWY1eNuoULW8G7/FH61Fy/xUIujrwNoM2oiEtkwB/WtEFH6yw15
         kFftp6xtUvckUIlnMbNjO/TnuvcLkUK6JGDhhnhM5lm7rMqo+mTv9WHKJdcBYnBOC6Hn
         XRE1KLI4znPFZ2aqmnK6x3CkveE3hu1RDIE2I5RcUIS4dDWmkKDtP66+x1Rk1wgkQMgN
         FAiQ==
X-Forwarded-Encrypted: i=1; AKwUvBy44r6Ebutdo9W8ahdInxEq9O/e3Rq8oexLhqhi04sz+YaJGKXpvxG9kIAHIKPism9OOOwXkXqVxE8+@vger.kernel.org
X-Gm-Message-State: AFq9FYJ++KBrL53AvLZcGYAwyWtI9+2ldcPSZGYNVPGet2v9s5YXmgk7
	ch6TSBJiXHDqnligSPURtleiQNySTlUDBM0BWsLaySwO+2ISrqXANcgKkbLRxWmM71o=
X-Gm-Gg: AYBFou1A+l4gkd5spe41aqIReKCvHsvBj5ZhH1IX72pmBha0MAG8+oAswMkLyEu1xwS
	IpZdC1yGTwrr7pV4ByKIeiisvCUwaWy4MHuKoasPDVCHtVXsAhMH/GNq1mEmi+28Vnhxv7yu/FF
	57oNfYUuJIDuvzPQqp78GbZ3AlfqnHagzX46nxmPCSv1KYVaZxJHwIpycHawHFYTpoL1dLmA+xk
	fezQdBFV7VGprP/R/MCsFNyMvwGr+jbWv2j9XTa31/rhgHIUat6l2TVpCNWtmVciOdV32z8jHn4
	y/lbwmcmkagazPsI6KeLDBO8OgcjSWbh09+q3/OHDUFYoALgZH9uo1UWqqpplkqqJO3btyZwjmZ
	u2c81GCL9f3wNxqUrs4W4tmjA+2D5v/bpJQ7jXLHJu4gN/XJGbJAzxVxw2RLO/M7yc8/iH5V0dm
	x9zfSAYZBFZJmsG2r2Ld0dxCAu3FXUCf9fB5F5BKxnb70k5UWb/B7lWM6ky7r3u8/xCpfhFkpiJ
	Vn5uc7z4VpIeDsBISHh8FQ36h/83dJGKZGNhwbWoR8mxlnHDjXyn2wHpSXH4n7J5Q8UhQmiJM/E
	fRdAkBG7Jdoh2quzKUqKz9q22yxzXr4dLMUP
X-Received: by 2002:a05:600c:3e1a:b0:4a1:e250:b191 with SMTP id 5b1f17b1804b1-4a35aca6ae2mr113669665e9.17.1793005202672;
        Mon, 26 Oct 2026 02:00:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:d07e:c128:5c21:78f2? ([2a01:e0a:106d:1080:d07e:c128:5c21:78f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a029332sm159395045e9.4.2026.10.26.02.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:00:02 -0700 (PDT)
Message-ID: <7f04940f-df1c-41e0-ad51-d9dd9e6974c3@linaro.org>
Date: Mon, 26 Oct 2026 10:00:01 +0100
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
Subject: Re: [PATCH 0/5] arm64: dts: qcom: allow SM[456]50 HDK/QRD boards to
 play audio via DisplayPort
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <5a7wc4hqox6gbpdkttgbtwkk4rfohe23lajlnydk3sl3f756ax@ywultzk2f5xq>
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
In-Reply-To: <5a7wc4hqox6gbpdkttgbtwkk4rfohe23lajlnydk3sl3f756ax@ywultzk2f5xq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 12:34, Dmitry Baryshkov wrote:
> On Thu, Oct 22, 2026 at 11:36:20AM +0200, Neil Armstrong wrote:
>> Add the DAI link needed to enable audio playback over the DisplayPort altmode
>> outputs for the SM8450/SM8550/SM8650 HDK & QRD boards.
> 
> Does this need an update of the AudioReach topology?

Already done in https://github.com/linux-msm/audioreach-topology/commit/6040c950021b88c6db287cfffa17abbf917f56cf

Need to add it to the SM8450-HDK

When this is merged I'll update the topology in linux-firmware.

Neil

> 
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>> Neil Armstrong (5):
>>        arm64: dts: qcom: sm8450-hdk: add DisplayPort audio playback support
>>        arm64: dts: qcom: sm8550-hdk: add DisplayPort audio playback support
>>        arm64: dts: qcom: sm8550-qrd: add DisplayPort audio playback support
>>        arm64: dts: qcom: sm8650-hdk: add DisplayPort audio playback support
>>        arm64: dts: qcom: sm8650-qrd: add DisplayPort audio playback support
>>
> 

