Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FF62773DA
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 15:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774625682; cv=none; b=YBG4iMs+tbfsDJHvCtqfVOteMEQFiAtCX1ZyctlUKItstUNq4M4H2yP+L3NvSY2i+5pd+nr2VbVwsSj/2e4os7oPG0ZpvwBz/P597M9Vj4196NRjJYS2+UMugDtba9OzPqYR4ReREyosQwenj5Ot18ih5HlsBBut8t1wNNamHZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774625682; c=relaxed/simple;
	bh=22hg9ZohCEfe9+7l3jFHcoMgRGtM+FSc8F/syRrQ/FQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cTYsJ9H262gE6QBvqKo12+Go2SDMWEhEbM21nvx4F1AnlwmV6SRd5yXmfeyT6MeKCRzpjEpLwqHR/T56lcR8jaYUK8CTzqc+Jjbzs6QubAA9yd9xMxI3h6xncGayhURLfH5VnkNYhfeSyd7AoPTuI/kcSeHyADro4m3fsLdZj58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lHU++UZv; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lHU++UZv"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48704db565eso32156385e9.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 08:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774625679; x=1775230479; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xvkzTXidkq1oU2J3drENCTO+YWf7SQg/DYufC7x3VxY=;
        b=lHU++UZv+mnGZZesTeDQ/OtUOMXTtD6JvDT9nMqi5pF+8QcNgg63w6aO4Gyi+/AD2e
         Yp9dgULCy5vqAY2buPUOfonPnbJFDGAzjskU6Ugo0vcGVfSYo63mlWkFtHB69t83zHyj
         a4k3HP8UwfoVmsEujPHKLh+s7/9hfTsQhMyD6pSIxB30yx/bmn3QsIDOoBn5aORLcHO4
         t8Lw6+NBrStYBJo9PS/8BafrFdd+UnV1lfO/Z0HV51AnrQRNep/8XqahfuVLESeQkvDp
         4oc7OGZt2zMQCV8LoN8pOm5f5JOMbKeaAl+xz7nUgcM3m0SUs0TOawCWORPZF45CsMKj
         rNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774625679; x=1775230479;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvkzTXidkq1oU2J3drENCTO+YWf7SQg/DYufC7x3VxY=;
        b=aHoWQLCJbo+D/kioH0+ygg5ZC5bIk1CEtw6mhgzl+t3Q8U/Sor+qK1d6RkbGUSvg7M
         cdmUdbiwhFNKT98P2AmXNWIuiYKGpzCwwr2r7BPB1vPtbi67VW7EIXPNqotwiVgifJy7
         exX3Bw+8obGCvGA3TGt88RuWUg0NEsOy2ALzpLC8F6HyjmyCMWRK8KrngcH4vaSCmCUP
         8hgNJXPgAy7QPKGTdZPmBeKIEt0FkYVF7BiREHNU3E1aqQJTstwolklcuXabF4UVZAwL
         sol7Q5j4pm7cqg2nL32P5clWVo9uGfLsvbXbC3lSXvhh9zwp/+yyWn4D51CRA/eGuPbZ
         KCIA==
X-Forwarded-Encrypted: i=1; AJvYcCWfB5pBCNFPXsnxHuzrmZfPn2CFBCKFMpzSJhGVpoUbpDUlxtMGyr6+nXhp3rFhrxFWj/cGv0BUVAtn@vger.kernel.org
X-Gm-Message-State: AOJu0YzvnmjxGSmIXXYqTawO00yro9wWTUlUw+QBDYo08gmQgdLfDlqc
	bxK8c1Da2eehS1rjzUjfeOJWZkHYOpbiUNzgqUaUIuuVzLSAoSdJ0JZmsJOvqV0fKuQ=
X-Gm-Gg: ATEYQzwfZ3/oXooOetx0VAZXq15SqtP+f26B5n39ew+WAT+mWyAvuLbeUO5piCMP3VY
	fmNsx3z6WVT1t1OVhFBp8p1oyCCBoKsrIadE1hYDusREXF7HyMuaMlqfznJFG1rjQ+q63iyMetl
	uat0S8/hopcOO9XcA0m7vwaRWJBE0GID6avh+cemm1FRp5GfplGTQUKrufn32fUXdoiJK/cDZEb
	zlZLI4fxHqQlKcNCMW66vaUDhwJwaFabl4l91OuPDJyKJLELLZVA+u3+iwiyNvOkPRvs9IpZdLF
	aneDWX9g4e0QRwfGm5Z4S0qtAhjXfqtP3CDAfOovtibmI6C6yGhv5ZqcWQJHI7LVGLYS51delkf
	0Ocg7YkVpN0aDhmz7dX+jTyRn2Z3N/2Uzmti8FgsSAfYHRuw69Oc5RF6A3VGbTs18f4GTF8DpuL
	vCtyhGNeAPTcBFg33gSLg8M41UNMhLiaVdVNwadZZW1adNeEy25UHjxjUwzLDuI6OsBqsHIaDNJ
	9utcgc=
X-Received: by 2002:a05:600c:3b24:b0:485:6ec7:2df with SMTP id 5b1f17b1804b1-48727d5f7a5mr45624505e9.8.1774625679470;
        Fri, 27 Mar 2026 08:34:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:39df:9101:d239:f5dc? ([2a01:e0a:106d:1080:39df:9101:d239:f5dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c9f58fsm161290455e9.11.2026.03.27.08.34.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 08:34:39 -0700 (PDT)
Message-ID: <4a6c04d4-2865-4277-8bee-abaf2710b04f@linaro.org>
Date: Fri, 27 Mar 2026 16:34:38 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 3/3] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s:
 use rc-khadas keymap
To: Nick Xie <nick@khadas.com>, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, jbrunet@baylibre.com
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260327093016.722095-1-nick@khadas.com>
 <20260327093016.722095-4-nick@khadas.com>
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
In-Reply-To: <20260327093016.722095-4-nick@khadas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/27/26 10:30, Nick Xie wrote:
> The Khadas VIM1S board has an onboard IR receiver.
> Configure the default keymap to "rc-khadas" to support the official
> Khadas IR remote control.
> 
> Signed-off-by: Nick Xie <nick@khadas.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
> index 7314e0ab81da3..99d5df71b9cd4 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
> @@ -242,6 +242,7 @@ &ir {
>   	status = "okay";
>   	pinctrl-0 = <&remote_pins>;
>   	pinctrl-names = "default";
> +	linux,rc-map-name = "rc-khadas";
>   };
>   
>   &pwm_ef {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
