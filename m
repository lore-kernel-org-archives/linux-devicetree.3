Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F3F3EEAEB
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932944; cv=none; b=gB+BbNORTcvW5GZTcuLrTnNmDyeUMbCAV6orx5WWsFgicnUELHY2uFB16f+jM+Aof3HoSHZ3EB6Sz4pufcQqArdp1klYGEQPlaqNMDGMIkzj9leH8+d+wetny7Itp+nX8oMQE7DlUe3WPwTW1ZxlkSglLxgkB3xAglzoNvU0JU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932944; c=relaxed/simple;
	bh=OZS4begbuoh9vpydmIeZJ6GkCEOKWg0yMsnbMG/Tsf0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hXACNGTSVfCGO7ChI7FFFMQhhZWS8ke81483G6ZemMbaUtARsEeo1EWm41qoonBJ9S5od5gvGr8J5v3/qvyCGGgkAT3qiJkS6l0u2kxjdbbhurmuonRAT9ehJmxOCXp5ZYDjREce03spB+6FGx83PlT2U/WHp79OSu+XvouBfpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sOc8hM4k; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sOc8hM4k"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so39633375e9.1
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 02:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790932939; x=1791537739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sisy7zZIPgc2KpxP76gexIt4R+mmsTYOynHiu3xxYkg=;
        b=sOc8hM4kt4nLS4o/VQXYbi7ex4MdleJno/3yEi4zHP2Yc9WwpiyroLVpGAVEUYWUkl
         wIQXNRXlwPqL8fKPO7hQY3IVwfkziU4YqmIaO06sxuyc/AIaei0pQFDE8+y1ERaZ0DJZ
         1iS54SmtyVy5OUrIrlA+VrwSvusTxTdsQSaAmG7r7zImMjYmxgYvdbPAy46QOHKlltqd
         0KejyNB7606WhRcQUDVDV0FwvRAXwY53rAUxc8OMn4552sXdzjlvKa2F9fJdixJODDqA
         sxLg8Ga3b/gBAH0W5CBqPHQ/pGPE5RUQZtfXzL/gXYo61IDGEfgyPXOcuoKpIIXuDnK2
         mjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932939; x=1791537739;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sisy7zZIPgc2KpxP76gexIt4R+mmsTYOynHiu3xxYkg=;
        b=YMRubPpkH92MtZYIqaobtPqwwCfxaOz8ksgnpe0pSfFVS9IiNrHoDDYkiEx1nOY1Yu
         hyGVvTavhRzQv0W5eZGNIFGenmdFvAerIOoeusZIytjIqkqBgmimrrFV/6IVlv/bjSG7
         dEgEahHiyZLC7Vkmmp+e3lyiSCAkM++XjjcPj1la9Xk+eipV1gCv2A0FbouVu4vOkmmm
         rD4haJPE4xZCe373m/IuZo0oNEDoena1ibUjJ7T0TEdfYnf49vYWtWpEVeiyhjZNBfZV
         2ZWLgpl48ENGL8NYnZFlqBYt6/zt3SC83jUCbh1TR7XpaZSHCqrF9f1XaPtGEx3C2PaT
         9FGA==
X-Forwarded-Encrypted: i=1; AKwUvBzNmuykDff3+wFlK13AhMSeR7sKbL6iUcwPzNkjBHJoTAOv2Na1PTTDPdfiSzIeSvckcc+Sz8GKegLl@vger.kernel.org
X-Gm-Message-State: AFuF++mu7mskaLC2jr1y2qFQDHOtGpRzk0wp0RZxuj+aqaruLFktyPMg
	bCOSlh25Lk/Gk5/1RFymSaWY26ghfH6j1aQMO89jm/r3wjKkWjam4OyXiVpBUPMlvtc=
X-Gm-Gg: AYBFou3YF4eZzZPAsFKeh76ZgZGRfQcUr05RPQm095znKXwhoDseYpVAtLWTwHErTWJ
	9Iggsw/mUBl2lRQEf06Jtdrnv6FzL4zLLITeMffDy2S4YCS6nxbQlrLf7OLDrR/h0DNl7rylmsp
	zPUuHgEL6g/WbcLmb2sHv6DSeKF4pr1vPZRTVVqiW4ZtVCZ15C7Se41Yd65l6p4/hKbKtlzbr1v
	VFgUiAnksI3xygWTePUiVry2B22nTcRAb+yt9u5qN7bklzpg8j+4KWKM1b0H1cHKe1O1TypIWxX
	NGhiFfgbrfGj5pQw0kfVfl7kh0UaN78+pDVk9I1j40uNIK+aaa/rev0KOhBEHN77yduV0oNCgAl
	9umEh0sf4eArbIQOVRrPstIJSywmaayajbyDMIi8hfPvLZlssW7zbNQuBpLc9gTgSYoFKoe2Bz0
	3H08cgx123SALSC7j5LdWc0VFRFQAxrETaIx2CCM0WA1aap6rT9khGj/rYIUnnPqh/pblvud6Bn
	7mr8yXOK6RKsCuzDqZqVy6UyFIzbS8X604VfgWMC+aSqiPl96C+xcZ2F27DQM0=
X-Received: by 2002:a05:600c:3152:b0:4a0:2500:2cd0 with SMTP id 5b1f17b1804b1-4a0275977eamr36418335e9.18.1790932939327;
        Fri, 02 Oct 2026 02:22:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:2f62:6d3:721b:8c9e? ([2a01:e0a:106d:1080:2f62:6d3:721b:8c9e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280d924asm71505645e9.14.2026.10.02.02.22.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 02:22:18 -0700 (PDT)
Message-ID: <97e7014e-69a1-4ac8-8278-9e3795b05553@linaro.org>
Date: Fri, 2 Oct 2026 11:22:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: meson-sm1-odroid-hc4: run the
 SPI NOR at 40 MHz
To: iav@iav.lv, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260930-hc4-spi-nor-v1-0-9a3351e2984e@iav.lv>
 <20260930-hc4-spi-nor-v1-2-9a3351e2984e@iav.lv>
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
In-Reply-To: <20260930-hc4-spi-nor-v1-2-9a3351e2984e@iav.lv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/30/26 18:52, Igor Velkov via B4 Relay wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> At 104 MHz, reads return corrupted data: bit 0 of the first byte of a
> transfer flips from 0 to 1 part of the time. The same byte read as the
> second byte of a transfer was correct in all 100 reads. One 4 KiB block
> read 200 times came back wrong 157 times. Writes are unaffected.
> 
> flashcp verifies while it writes, so a bootloader update erases blocks
> it should skip and can abort halfway, with the flash half written.
> 
> The Hardkernel vendor device tree for this board uses 40 MHz. At 40 MHz
> the same tests pass: 200 block reads with no mismatch, and 14 flashcp
> runs with no block erased.
> 
> Tested on ODROID-HC4 with an XT25F128B.
> 
> Fixes: 7178f340e929 ("arm64: dts: meson-sm1-odroid-hc4: add spifc node to ODROID-HC4")
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
>   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> index 5ce76a1bfe02..8f09f2b74bdd 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> @@ -144,7 +144,7 @@ flash@0 {
>   		#size-cells = <1>;
>   		compatible = "jedec,spi-nor";
>   		reg = <0>;
> -		spi-max-frequency = <104000000>;
> +		spi-max-frequency = <40000000>;
>   	};
>   };
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
