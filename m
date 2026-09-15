Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9500B3B42EF
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459554; cv=none; b=lDgijaVDicddyQw+Bd3z+5hxvXMeGdwMrjjeQPDccZMkiAaLOrLRgW05fsOgTtGuvvbOdSY22tEV4wovMa3DuEp0hQ4rEHOl4v2c9nz60J515MsXHKJouDb/vrvTp6Qpo6r3/gtCq3zyHLsTb3g+omjoCUTAxwC1tvjlc9Dr0rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459554; c=relaxed/simple;
	bh=zUR5ieW/1xeMro3AUcJkNuU5g5wF7tcrOcN9Xqi85C4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kv25+neJ8v26eSbLhQzfYlY3f3/grK0jVKee+Wktib3HCYiOG9nl8c3GzoZ7elB1iR1CiVeDefVvJH5hEwn1SmkOTQ/uImM/3Qj2PJAatc7t/+ZYRrwD75irRvJu+2deqTtPPU3bpnnWQ/HHi1KWkebZo3a3CsPqbrP7QM5A5Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=edpY8qm6; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="edpY8qm6"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47de0093c42so3952510f8f.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 01:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789459551; x=1790064351; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fFvjfvuRHyiDs9ZL0ZSGaphdyLSM272ZOZkijKnwP9w=;
        b=edpY8qm6xz8j9w/4OMP+/X9E5LFuJX8xep8D5ygE+ILyYCEa/cSdym5s63RpXp7sCe
         TFIrmSNKtIqZaa6cm1077jOVRJ7pGfN4+socmUGNfj1mVdzvzZM738bgmrjsPTRgD6XR
         KIo+2QWacmghvxx9S8aLWzPGZwguibatesbtdg5xI0tB4kD++3CxL3w16311o2X99E6N
         MxKByS9PW12ayfIxafvZb34zQVaGcLgwYk7IpjB5jkg/X2bWTC+em7H7JjMCTv+orHap
         9lB1vuyJ3/syTvnN+aH7mhoM7lcBQdPzceGxRGGEsENTJrTNFnuD+FdMzV28wbm6jGjK
         33BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459551; x=1790064351;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fFvjfvuRHyiDs9ZL0ZSGaphdyLSM272ZOZkijKnwP9w=;
        b=SAO+dkPgkX3qlb1NmbEZRMkbDCmFLnUKXEgzT3ON816dvkTyQ5IMqL7DxQW30yaQj7
         ELDedrOYsxXn4M8ZACSn7DMpQ0EwX5KZGnmklUsA/ZRO3mH2JrPzuDf6O+tFU1VNgjM6
         raHQjDb9DNU+kPIWIV5NnSxgE+ExqoU5+EUnP4dtoAU7nUXux39/bgw47S9NQENMdv2A
         2WVDx4QN5f6GoX6t5L+k9jlnqyoIeFLhs4LrM/IllarFZd1bs47UP1OkrneRSjvWHX3b
         7A3liAZgptqNROhxhXKGwiw5hq48UM1dZ64WYbvewk2gUVmahMVTvkQqW63nouWWPgST
         Rydw==
X-Forwarded-Encrypted: i=1; AKwUvBzsA5ue3Q+25OGE2OZS3pe8SUqst+2T3qNQUZFKbnPEegZPy9Rm76Qq8ieehvLtKCnDQkQpb2iZp03T@vger.kernel.org
X-Gm-Message-State: AFuF++nqWPs3Bb6v8eMpbSdel30jAeh7qpJpT0EELzAHxZEqKuUNzqhH
	u1CHbQ5SwfjIzMZ1bBtQhWOltpzVoKqv1JL3E3+HKown+rZLZIuPWHmxbmUCAFH1rLs=
X-Gm-Gg: AYBFou0hxkNB2GDITq70G/fOm3HCTIt8feCAyNDbHWK4e1tjf7GW5HcGVNlQxQYAWYw
	uEz6GIj+glhQl0UPcAOXmiJFIUFKcuMmqGxCfmDD+5WF8M2aXrE5jiVA4agoF27xynq3FnvAaTb
	XrUjSEKWJfoOmGBLdnoavsDWwKLhLW7yHN3wEUyJQc9FNMGIwDSgC/I8KoMqS2dZPKMeWXZG99d
	M9CSkE/tSnYKvOqbohZZ8BXfT3SmLBApLipYJBmzL7uRSUHKwuloQkrVpYhFSqFcwaAywgxgzZg
	RX/e5efvKhVglSMWGOLua425MbQGRVH4XUoPp6HqrI9mPo3Anu1QAgKK9gf1N4tb+Ygn2XPInEz
	D1YTiDzWQr6BcurjSS1rsrJXnKYXnCQgniQ/t8Yy9fXf4QEZLRKFLzRlY7V0mYFAinxLPpZauL1
	P4t8OhkBgd8ySOTFaQv02OP+WZG7XPw0y6YiX/3hLX3wtJYFV1Z1LC9C5EY6DqQKQNlw7quFaRs
	F63xioOpb0VfDAN1RreuqBJcIlrjNz+4A+ZFX+66aiy9Ebj9Go=
X-Received: by 2002:a05:6000:41c3:b0:485:85d5:7ac7 with SMTP id ffacd0b85a97d-48702b0e846mr6483949f8f.26.1789459550628;
        Tue, 15 Sep 2026 01:05:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:ff86:16e:fede:9407? ([2a01:e0a:106d:1080:ff86:16e:fede:9407])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e7f5sm32371402f8f.9.2026.09.15.01.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 01:05:50 -0700 (PDT)
Message-ID: <107fc574-ecfa-42ef-b576-227dd5bae2c2@linaro.org>
Date: Tue, 15 Sep 2026 10:05:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 0/3] ASoC: qcom: allow SM[456]50 HDK board to play
 audio via I2S
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260831-topic-sm8x50-next-hdk-i2s-v4-0-a224aa073f9d@linaro.org>
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
In-Reply-To: <20260831-topic-sm8x50-next-hdk-i2s-v4-0-a224aa073f9d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 8/31/26 11:13, Neil Armstrong wrote:
> Following [1], this adds the necessary settings to setup
> the I2S link to the HDMI bridge to allow audio playback.
> 
> All dependencies are merged v7.3-rc1
> 
> [1] https://lore.kernel.org/all/20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com/
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v4:
> - Rebased on v7.3-rc1
> - Link to v3: https://patch.msgid.link/20260805-topic-sm8x50-next-hdk-i2s-v3-0-07a6483c430f@linaro.org
> 
> Changes in v3:
> - Fixed node unit number on patch 3
> - Link to v2: https://patch.msgid.link/20260731-topic-sm8x50-next-hdk-i2s-v2-0-42c1acee5a2d@linaro.org
> 
> Changes in v2:
> - Dropped applied patch 1
> - Fixed node unit number
> - Reversed clock names order to respect bindings
> - Link to v1: https://patch.msgid.link/20260728-topic-sm8x50-next-hdk-i2s-v1-0-2393a0fe4aa9@linaro.org
> 
> ---
> Neil Armstrong (3):
>        arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
>        arm64: dts: qcom: sm8550-hdk: Enable I2S for HDMI
>        arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI

Gentle ping, this has been out for a while and the related ASoC changes were merged fro v7.3 already.

Thanks,
Neil

> 
>   arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 36 +++++++++++++++-
>   arch/arm64/boot/dts/qcom/sm8450.dtsi    | 40 ++++++++++++++++++
>   arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 36 +++++++++++++++-
>   arch/arm64/boot/dts/qcom/sm8550.dtsi    | 73 +++++++++++++++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 35 +++++++++++++++-
>   arch/arm64/boot/dts/qcom/sm8650.dtsi    | 40 ++++++++++++++++++
>   6 files changed, 257 insertions(+), 3 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260728-topic-sm8x50-next-hdk-i2s-6d63c25eceac
> 
> Best regards,
> --
> Neil Armstrong <neil.armstrong@linaro.org>
> 

