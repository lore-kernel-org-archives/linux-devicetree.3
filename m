Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3972635F8B7
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 10:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777024858; cv=none; b=jOZ2K2nEBaaKuAEJ6x1SJqPfU2BOyQsakuh/cu6xc9D1K5XML7LDhPA3LLyi0S0v0RWLNcFjHlDreC0oK+uDjZd+RQHy4otG7iwphGbyO/NVzPe+7i7nTugccdR7l6NINkFEcMEt1oR0a8OSfUoKwvRIIBM+Bcj+FI7E+FtmoCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777024858; c=relaxed/simple;
	bh=iRJN0EpeLnWDppG3Hz26XEsK22cIjFzJh5h4CN/uSXQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rXCkBRZ7hY3CKFPa12WuH8LdAxEzdOb2gdYccZkOc5JzputCbXb6D6KkV5KZiikvWlxa7B0YsP4boKjMvt/vkI1uS9D8+1ZsJVjaN167ilkoXvTFXx+gwVhwzmmCDvARMm0hsCgTGjog5MlGWSszWX82+N5G0PP++yGrJrJq1AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FOmZQqDr; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FOmZQqDr"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488b0046078so69182345e9.1
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 03:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777024856; x=1777629656; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xq07QUD8xIc4JRSL4PxKVMWxBFYSl0vshdBEVj4c9kM=;
        b=FOmZQqDrIZ/pmmpWN0rDw19/2X6h72ApvNLREix3SHA0s5rC5XUptqsdsOWhi/MXf0
         cvzMtAA2MTlTa3sY29S7R/h3mHcFtHlzCza53KSxuA1hpYBVfUo107flxpm96H80zq9S
         6obsgFkIOdFezvgZ4dYYOXr0eK5ygEHooY9P7xXcy8oRTE/aJYgZAHhxTxldnPLGRySa
         yWXYDoj2ocMCpFYtobp75TRSYTd1Ro3ocJXS+DaSkoWjprNhye1tENh1iqKw9YLnV4Qd
         WRM8MWD8ISAtNFTobE9Y/Lf4Jr5MTM/2e+rze7SrNqK6QJBy2HmyJGWPu9DnDruhQPIo
         scAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024856; x=1777629656;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xq07QUD8xIc4JRSL4PxKVMWxBFYSl0vshdBEVj4c9kM=;
        b=LWVPgBj0TnG7bqXIdc/AMtklK33ZHNntfukvtYejcorKrcEXCs/kUsGgn+YgXCnbH8
         BFdp5zXkvs581zrJG1QlLOzPrV7lFDKvqC6OX+sJyg2J/HJR3+FEQ6+uU1HowoJ/NF55
         /9NiHqf8aYvz1CqKp7S2TdFXvYaktoikn8Ppf9aeQLJluuLraer6ov9//j27t+798IKm
         f6wUrhkckREloAy70b9YrYR/0CLHzxosMuML3lxIc+/eXcuRAXJaE1aRHKpi3ui9h4pq
         Z3X7wnTSyZIfrtSkt59pDGtRB1fuKWYVFL0WMcQAW1tYuPRYDcJP1de53R07U7bjwJL6
         gWZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8WMoyBgxv7wauOuGkWwYhfJ00M6k4FwUvsXv7a4akrPFXFrMnUCsDvJRflho6D0WUUT37bvGXQlh0i@vger.kernel.org
X-Gm-Message-State: AOJu0YxTmw+l5vT+LBpS0w4Al0OZM6wChs5hDAZ+npJ9NwDcc3sgr/PC
	eYQo51o7U8b10wc+F24xW7+7/EKETQ3JwFI9GEJNsGcWO1Lj6JlbV4yA80Sz80z2Dko=
X-Gm-Gg: AeBDieuvyJFrVKl4yWlZ3ycNb7Tkji+oexoTMidFYSomLPkl199FGW6ufPJsOaECz30
	6FcZyTS9zRfv6LsES7cbHKzjc3ZGz78WsoCxPNBSaKKAkVQ7R6pR8pH3eCARkR6qkmQ8s8+gDdq
	2ei4X4Gfavy/rb/KIR9fTA/JDpdE6PSTX4PiMgClr5b06TSMILon9c66/+mYDUFQTwGsO5Zpp7L
	azENR6Un2Re/WCy8VMMQl5ADh1Rns1ilCdW1m8rX18EWPuqG/XsKnn/hyFvTvUJmyn+3Hl2nFMQ
	Ok3UrPEOaxuRzaLAGEwSzDwBRXlEri1uVBvyLwqG7pqos257xvPwwezmFHo2ioMTLDxOj+YBXA9
	wPhjN91IayL04Y8N1mh5it241+9rZRheDS6HmojPA8K135vgQ719ORhy6o6j0Zu43+Z7+fw/DeM
	LFwWxnjq+dl5GWH0cyIGv5GuPGU+v4j/D7NCUZuA1z67G2BPVqDj/P3nbitwH9cZ1UrS0OROT4r
	z18dOCtj+iAQ9FEag==
X-Received: by 2002:a05:600c:b90:b0:488:b99b:4177 with SMTP id 5b1f17b1804b1-488fb78ee4emr429943265e9.25.1777024854110;
        Fri, 24 Apr 2026 03:00:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:79e1:f56b:445c:ca9c? ([2a01:e0a:106d:1080:79e1:f56b:445c:ca9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7a0b60sm169961765e9.17.2026.04.24.03.00.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 03:00:53 -0700 (PDT)
Message-ID: <e65c3933-996a-4ab8-8431-3f6ae18e44bc@linaro.org>
Date: Fri, 24 Apr 2026 12:00:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 6/8] arm64: dts: amlogic: t7: Add i2c pinctrl node
To: linux-kernel-dev@aliel.fr, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
References: <20260421-add-mcu-fan-khadas-vim4-v4-0-447114a28f2d@aliel.fr>
 <20260421-add-mcu-fan-khadas-vim4-v4-6-447114a28f2d@aliel.fr>
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
In-Reply-To: <20260421-add-mcu-fan-khadas-vim4-v4-6-447114a28f2d@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/21/26 13:49, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Add the T7 pinctrl used by the Khadas VIM4 for MCU communication.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 7fe72c94ed623..e96fe10b251a0 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -376,6 +376,16 @@ mux {
>   					};
>   				};
>   
> +				i2c0_ao_d_pins: i2c0-ao-d {
> +					mux {
> +						groups = "i2c0_ao_sck_d",
> +							 "i2c0_ao_sda_d";
> +						function = "i2c0_ao";
> +						bias-disable;
> +						drive-strength-microamp = <3000>;
> +					};
> +				};
> +
>   				pwm_a_pins: pwm-a {
>   					mux {
>   						groups = "pwm_a";
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
