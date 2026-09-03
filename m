Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6E22D7398
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 09:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427088; cv=none; b=TunwcxzNOAqF0jBU5xhC8ajm7uHqOKfieteHyDzH8/hMjywG0gKu/mAV5lpVfjYLO9ued1K34f8jtp32mecuo8tK92uMXP8NT4sz3TG1Z7NMoijztXvTwp+0969fv1eh6jq1BEY5ij1dMiPzyNfvKQfA84u9G9iAJorWc/Kf+M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427088; c=relaxed/simple;
	bh=fqq+mlUYVSwI/JzFFvGjx7+CV6yF6ELV/2oP+1IgVpc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=oFJ7JDNqMEHkHbf/j5+mGgWeJC8BkVM7Iu+4EyXMlBiefc0vvXCy/umF7Ypiiij7taKZqDWhfvKj/89SuaiWAsySR6gLpg0E2W5SDSkqhQKOog5TNuv1nEQwiPCSNfpxlRW9Pd5Xdx0IpGUN/L7iJ75VyGCD8qiWKpp9nFua9CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EY/gJ8VZ; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EY/gJ8VZ"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so336848a12.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 02:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788427085; x=1789031885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RADmv4XaLcIGOhGRtTaSCZnpqOtQ4Wu+K2frfCCUNZU=;
        b=EY/gJ8VZ1vHY6pgvxkwq0pAUKDy6Nqu72pAhK7Fmvd+c00lFoL6dLeTjnrHiD+sq01
         r+LSE9gPIFuGZTu59Ju/fLxrXl/+J9KFa/6/QfhKoCY+grDiZPJksWw99bRMa0TX5jn9
         SeEZywYAUzZW2s5nKJOh/XOIFDcRxtgmSAYp3VOYVD7eFG10lqDG+N3oqtqWwdkIoekE
         RwBLTNTES7XnsV2LnBuTDfJpFvH+Onbku8BAtbLxvoNjrJefFBTowRd8NWh0cGxy1izI
         ZfnZtxgF5PxyBbMnMZUU/S4115xY+XXbayx2mrsInMYkcv2XDOLcGvAHpxb7JwMFAACf
         Wjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427085; x=1789031885;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RADmv4XaLcIGOhGRtTaSCZnpqOtQ4Wu+K2frfCCUNZU=;
        b=kDBxXIVkeqofXxNFZ1g2n+7gf59i/03LYUWOjHX30oK3wqbfCPwTPh8kxlnPXWzLpX
         PT6ao8Pqy+4A+m8T+7BJgr3u8iijNZNEBVA1bRDOAfbx1MaHYO/T7Y/9f+At/l2HY5OI
         dl0464HYy6JWBtlTDdKrgyq295UsofWvCR2PKReZB33V7zqjNRiWri5rvb640z/3pKIZ
         4id75b4QcTVSC6Iv/AL9L7WzHcC4Zj2WIwtEeHg2NWIs6xLr6HrWHjN0xHU39cngKrbC
         2npUuX8B/ZYHOeV2YYI4fVlQi1bUY8uv0jQs6AuJ8hPQyiKDfqsheVtVSaiYcH2VcFpa
         xULw==
X-Gm-Message-State: AFuF++leJaV53bdKonxG8kBKjE9j9B4Aib1TkSGSACb+QUBytQ4PSl9a
	4MQnlvl+qrl4i/qfsfJxT6upwwNRq28OYfHDrRfgWq084LU3GRdLXpcEGVHHjLDu4Wg=
X-Gm-Gg: AYBFou2CcJ0pea4+ymk3WOed7l/uN7V8WxCqZs38/M0FD0lPWBKvhn32ZG9y213GGSo
	EsynWRoUgwUqdsGaB2hg67mVAuVJ2qSn1c25Cl+RyW7uq4cs+SRcnlQVSayBpnBIO8w/Fn9ny3b
	5SPuquAdeSVh1YlhVhTG77iLdb8dI9YqlO/n5MePAM1UXW9GzFHHJlm3Ap1UW69Dwzj0HsS+LQK
	F23oObZaEqfv7RckJTn+Y2Am0bD6kQpQcguAWAVkfanSyvIaqxDPYV2juZz/5vsmlFKFssRj58x
	H730KV4OW0Gtz4Npv7nYMZxcTcze++5OlcJC78XZg0BhLiHmktKsc+qvzuGqHzKBD4j9mfzlDuI
	6YhBqKYp8UOdrneFDlnw1+8rL05CtG9ZiqQgxnzpZpKmaWb7gR3nYzIU/wxVfGZJIK2vYtr7Kjh
	G8abJxbpNOx2WcaUShcTjHG5emwEBsrBTewxxBPvzfgqByc5IAXo2ijks8BSwkWokqWD6s6xTdy
	athrn+eKT6osZ1J8mPJ49e6VsID2Yim58G/gYnikC8=
X-Received: by 2002:a05:6402:52c9:b0:6a5:f203:ba4b with SMTP id 4fb4d7f45d1cf-6a6832e4e4fmr7309118a12.16.1788427084433;
        Thu, 03 Sep 2026 02:18:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:bc03:561f:5dac:f48f? ([2a01:e0a:106d:1080:bc03:561f:5dac:f48f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f932bf5sm2126098a12.14.2026.09.03.02.18.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:18:04 -0700 (PDT)
Message-ID: <0668e09d-3596-47db-ba16-0d8c053e74b5@linaro.org>
Date: Thu, 3 Sep 2026 11:18:03 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: amlogic: add Xiaomi Mi Box 4 support
To: sashiko-reviews@lists.linux.dev, YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20260903-mibox4-dt-v2-0-fbe7c04472a7@stu.hqu.edu.cn>
 <20260903-mibox4-dt-v2-2-fbe7c04472a7@stu.hqu.edu.cn>
 <20260903085901.9CD541F00A3A@smtp.kernel.org>
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
In-Reply-To: <20260903085901.9CD541F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/26 10:59, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Makefile entries are not alphabetically sorted.
> --
> 
> commit 70cc330a6bc43bd5cfd305fe463356587a2e4a7d
> Author: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
> 
> arm64: dts: amlogic: add Xiaomi Mi Box 4 support
> 
> This patch adds initial device tree support for the Xiaomi Mi Box 4, which is
> based on the Amlogic S905L SoC. It enables the main on-board peripherals
> including eMMC, Wi-Fi, HDMI, USB, and audio.
> 
>> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
>> index 57bc440fa55cc..9f357df5fc54e 100644
>> --- a/arch/arm64/boot/dts/amlogic/Makefile
>> +++ b/arch/arm64/boot/dts/amlogic/Makefile
>> @@ -72,6 +72,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-vero4k.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-gxlx-s905l-p271.dtb
>> +dtb-$(CONFIG_ARCH_MESON) += meson-gxlx-mibox4.dtb
> 
> [Severity: Low]
> Does this break the alphabetical sorting of the dtb list? It looks like
> meson-gxlx-mibox4.dtb should be inserted before meson-gxlx-s905l-p271.dtb to
> maintain the correct order in the Makefile.

And the name should probably align with the other dt names and align with the aquaman name (meson-gxl-s805y-xiaomi-aquaman.dts):

meson-gxlx-s905l-xiami-mibox4

Neil

> 
> [ ... ]
> 

