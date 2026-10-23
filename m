Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740212;
	b=qHKciuOJGddxHAVw+aSKZdyiVVzPytu5ltuXSIywmpEV41oomqQ1VQN1sSut64hmEpzf
	 LoIGi8Qe0rLpabz56s1WosrbIvm+HwqGYnEiWODFRqf1FgDs3pKDx8wR9BmPI0lczfdVo
	 8THjnB9x4K4tc31khm0vMwjBvu9zfgYhIaZVKUkQRGPxjFR+MwFxTITIgHV9XUKcTxwvx
	 8Xaaw7WYFicue5acmuAKKGma1jTxabu6BVgbvxYeMX4Mj0WFnbEc/EX3zpZl550fbdj97
	 4QDmDkDTdiDiNc/q+2XQ0Ix+b+3YGhiyhvMNm1n0JCcoV0CWr7LhtGhHuQJD3vF3nfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=zEG/GVHCLQPnI88SpC5VPZ3TgR9urVz0hXrc0LNloI0=;
	b=BMEwVfe0Nc9vel+xq8SA/87dWWP5nBytgWxlqLuLLF429XnMKs93tWS6oU0s2KqKhP2S
	 vufA+fyI/G7rY5eraNOWrh43iYhKiCphRc960etwA5T98VKNQR9wss/mIzM28RPBMlFV6
	 UpLkW3iR/xIPRXyfW9lY6abOzSUVHoNlELFoxOrokd+OYLhT9ylhFgkOoG6PvIuz2mggp
	 1O7z6oxwoh8e/kzXnH07maMIvrMTrBSnTd51p4HCsAQmyliUUbNSCLAAlP6qybTFVxFa8
	 9aUgz31U6R5CWglFAqxpetZ//MqIVymjU8QmsCYeLqf/BG78wBo+V9RiiUflRRTlnHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ETT0rPWl;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCBA606A31E
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CCBA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ETT0rPWl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48df4f540ebso285082f8f.3
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 00:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792740210; x=1793345010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zEG/GVHCLQPnI88SpC5VPZ3TgR9urVz0hXrc0LNloI0=;
        b=ETT0rPWlyJHUiGfPOgj/71FpiLTcE3uORng3ml1Bl3MB1ZqY6YLvytXfgRE3exKnDZ
         dHKFoMCw+zsFz7IHzYh7iTgwVaFWZjYDH8YnkMBgJQNsFLTfGoaAYruXBgyGso4zznAc
         CJ3nfhCtdFI2iBsDUAZAYgcnAE/2z7Xo7aL6nQqOhIffGdtEJnag26cprTSZFfeQzfAI
         myPzmVaH9YaqCmOQfwrzzaTJa9t5AqTREua7lJ0h86PPtsdqRboVWIt1PclY7wvA8XrX
         hd6gVZFMIwBmJic6JMLncKOSe552Oj1dfjkVUAxblyhDWRV1O/SB+xgVvA7IchL/PWpR
         AZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740210; x=1793345010;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zEG/GVHCLQPnI88SpC5VPZ3TgR9urVz0hXrc0LNloI0=;
        b=xTV+vgrBb2NEm9fiVwb+CE7tMh5P43u5YhTN/F5faJdK3Q3YCxO8fliafMafNeMsMW
         6yYET38ocHL8RfCMjQmoIlHHnVP/mLu6Wd4MCdqmXsrmvNBNDBSNzz0oPSOMuNByuiGn
         ZRoMlX9IvaHiMPiEQ2ELlhH35cL6DNb0qIVg9BVnOkkE/yjcQr81Nf7FD0VPmbdfhoyg
         fzlsSBVAZXYB+TdIjfF98Nx8cT3GRncArccAuV/vAmqOfRRX5cL3h8CyRrk4icU4FwOQ
         rJSV4pTQnJY9Lc8amDpSUGz8iDo2VG+VvTroBQTQsdMotI6VsP7UJLxUescgsy8o+Ytz
         a0Mg==
X-Forwarded-Encrypted: i=1; AKwUvBzajxd6NeTbS8n1Kd11fr6i+GbCEKYt5ovc4AVyRxrlVbVrcToU5kDGuVJzNIjudPdC5wJLmuHNCCJQ@vger.kernel.org
X-Gm-Message-State: AFq9FYI92PZbvz8MsV3/EU4LFSuHVmlT1KvSywjLmYDvDd6nzMh8MpFk
	N1APhw4HS/Kje/jIkH3qo6MuQC7WOVk+PxwDSkoDRzgmRpUrBwCiTqELa+SW3FFtdZE=
X-Gm-Gg: AYBFou1wGc3vNppsjF9xtvX7KqMYKxjqWd0d0s4KLqQgKHmwx6Iza7jb952PeT+c65C
	OkgdhGvuIX7khhnHFkIkrYZZX8zy3bWZZM+pMlzmB8aYhOvchbd1ckq9I6MvlmQUgeuG/TbO/JG
	h59TE1OIBbRvwD9tJpYqCuwwtnh19l6ix4GdWph6uDPNabi5Eq2lbj9u0Cd/XaPsHuef1XVZRfL
	o98kC0jqSqAOpQIiZm2ZaIC9tQ+6TJyEToivQEXXywzGN7Kr+vgsSBUOie7jTNo+6/8TMnR+t4G
	wtZx1fSvGfls7UkmoxEhw8FzEOkUEaMSsjCuhXfvSIi5A66QDsCgROVE9msHUgBnkQDpcoH66RR
	olhB520378ep/PmT2ciYdJBGTKhoexIkBl9QsI/0dfhTUi0n4Sz6FBXNBpupNb2kbyQ3sREOvxz
	zX2WmkeXmE1zDgduto8RVVm6h64XLlLTGOcqOL4xHV1YPnXIWp+3TTo0dNQ2/jyxKwAwj473Nja
	PT8D7TZx4gHWtil5dMw7ZxtvdOnCUyPxGNRvZd+N0a2S1xABGGznox5FhK6iPCkZpXEkDYmPbTI
	tpdERhBdsScu81jDJekMi272F/auspeXQNM=
X-Received: by 2002:a05:6000:40d9:b0:48d:f470:6b3e with SMTP id ffacd0b85a97d-48e3858b5f3mr1960195f8f.13.1792740210407;
        Fri, 23 Oct 2026 00:23:30 -0700 (PDT)
Received: from ?IPV6:2a01:cb1c:fcf:4600:1c53:498d:36f3:7085? ([2a01:cb1c:fcf:4600:1c53:498d:36f3:7085])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37edce4fsm3456370f8f.6.2026.10.23.00.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 00:23:29 -0700 (PDT)
Message-ID: <3bf32179-dd0d-411c-af37-54d50eb7986e@linaro.org>
Date: Fri, 23 Oct 2026 09:23:28 +0200
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
Subject: Re: [PATCH 0/4] Fix and complete the GIC description of Amlogic S7
 and S7D
To: Carlo Caione <ccaione@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
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
In-Reply-To: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 20:30, Carlo Caione wrote:
> The S7 and S7D device trees describe only the first 256 bytes of the
> GIC-400 CPU interface, which spans 8 KiB, and leave out its virtual
> interface control (GICH) and virtual CPU interface (GICV) regions.
> 
> With the short CPU interface, the GIC driver disables the split priority
> drop and deactivation mode and warns at boot (patches 1 and 2). Without
> GICH and GICV, it cannot hand the GIC over to KVM (patches 3 and 4). It
> needs the split mode for that too, so KVM gets its in-kernel vGIC only
> with the whole series.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
> Carlo Caione (4):
>        arm64: dts: amlogic: s7: fix the GIC CPU interface region size
>        arm64: dts: amlogic: s7d: fix the GIC CPU interface region size
>        arm64: dts: amlogic: s7: describe the GIC virtualization regions
>        arm64: dts: amlogic: s7d: describe the GIC virtualization regions
> 
>   arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi  | 4 +++-
>   arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi | 4 +++-
>   2 files changed, 6 insertions(+), 2 deletions(-)
> ---
> base-commit: 8610d31587e139380db9cb8708f4263833b482d0
> change-id: 20261022-upstream-s7-s7d-gicc-size-db94cb656d36
> 
> Best regards,
> --
> Carlo Caione <ccaione@baylibre.com>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
