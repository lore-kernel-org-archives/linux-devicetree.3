Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624777;
	b=H84doEVxzhLnFL2rZbSeXkOwu8E3kMUWDk++ZQHN6TImO4kENnr8dxDkaOsAn95bOTL3
	 JR8Ae2FOW01rVox0SfezUEJLGIjOoCmkqQPypLxdxfMhQ8SK6jMjizvY2Ivx4A5Qen9Px
	 knek9X2fgbW1q3rlv9I+GPbq82shu3fV/xYvritnnEPvjqB+NkIV9G5cBvptzjutiUUE5
	 SFZDyExSdZy2VKVnwYuAbffHBVv7wG6DyQDNKlEyadiaAEZmgvPgiuioTj+eGSxErbrCq
	 uu0eV9KTtsAPBAUKpN/E8x34SNtrpQgrVsnxwzZga/Z7W2kaL4LjBEL8+L10NocPGIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=A97kxCcF7u/RTY0AnQ5TCiwBkHgpiQmx35XWzV0XoaE=;
	b=VMDFvYOy0ztRDWk/KL9pNfZi1KVQ8wmBT1fA/cYfFJFPTGPSLBYB4neA6zpksMHp5Jib
	 0uO+8NYdKnakfA4WJ6jYLajaqrWvpkIaasbOwxBfF9ix+KngxNW69A6/v6auc7mx302dV
	 lTj6Q1q2IpXEQEEPli+vHhbwD2H47nihAI1K0MhBzpVWJOoigjDPLXsPUZrFpmptCl1ns
	 F/WDhNS4NF2v6HZx7Zdlo1R2HoQCSTs4yDzzytrnvClCyo4puOhCQkyvy6yc5Sd8ijDET
	 2OxRqEamkAaX0CNGYb/el/UPOY0naesIv5kIXqR5qlq4EX4j08BRfCRm0aU7aC+j+Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=timyKwqa;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27297606A329
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27297606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=timyKwqa
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so17926205e9.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 05:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793624774; x=1794229574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A97kxCcF7u/RTY0AnQ5TCiwBkHgpiQmx35XWzV0XoaE=;
        b=timyKwqaHaxhtvFxukfd6ZO5EXBLkQgQgPwtghmieITeO9A0RaXS+Mk/4KS97CIVFU
         c5cj3KKwc7xFMTR9DmhSXT6L/mrCbdsn1cRmztwj7YzIvmkQp3Xj/LklYtY1zoktrlfC
         aoyEn3UBghrgjOzmfLQTGQxJFT8ieu1hfIfRlJ2tHxCE7Wu0qLh+7w5UHhWX4my1EIwa
         r8cevp05X88mJyGt0AgZ3BJYhHQtY8OknVm78rXlnX/uXYCVItaD8g8kNQha38ICievS
         mor/9EgobEAZbpIjZ5FPvlWrZNeNX+Y6/dMi7UayqUvK7zzKGmu7+9LeV67APbRFtIln
         CC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624774; x=1794229574;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A97kxCcF7u/RTY0AnQ5TCiwBkHgpiQmx35XWzV0XoaE=;
        b=fgDiru24DL0hpiEjb4q8z3nd2q+8MXcAxk3oc9VFJReBiBeQLa7Cg+AEhWiSPS1RZJ
         wCVW+RGguHPkaYQm5niebMrc3miUpybSMnAau9IP4xiEfxyXWojRcN++cYJohtiMLtbu
         x36bNy8ui+sqHkpXLx2a4vL8nediNu2N+TrAzFy4bcKi4ohT/vgdFwxxbcV6cx76jvYm
         oKB+Ge8Re06JEdlzNRFhir3inHDi5ioMFK2p/209WlEum7oxl8PmblFP0ywwRsXUcmwb
         QFRukfe8/QTGfqo2v6dk2YAa3Nvf37rjVrcFTfN3cJZVqlCJCIU6vqQjiZsAETsMBaJt
         AtOw==
X-Gm-Message-State: AFq9FYKMtfYwLdc1SUN53ktIDvPqIfUc3ieH/4sop2LexpKXCXEIx96I
	KTke1wXtuDYBLLaYl8qk44WbKGT5fQXEmoeZ1QDgvbmMXVja/fzAZtOoVm9nXcToBPk=
X-Gm-Gg: AYBFou3zvLl1oxNIXeCNC/4uuwVIRu3U9RtChQ5V8MvU5iXsiRX+vLAZ/jHAFz9eKzc
	q2amgaIljnAYX+wa611WTCTtVbe3Feq9/gMW7NXkTAOrwd5rct/ESyMLqLk6HaeqckooB/mq1EQ
	8Um+aL6JXqfWk8TUuEaa+ZmqcWu83Se6wvjhKNxNBBtLBs/9WKeM/RH6XDjuzO1J0SkeX0xa8ZN
	ztMjPGF9Qq8J9lTjcqeFoH6YmHX37kKc9XVR5ka8k1b8V9DjyNVIM0Lxv49VDmY7kMob3rEv/Hs
	Vt2v783obLG4lwwt7CCE9Xsed5L7khTv6tRxNTUQ3JtJyXLFO9nB4aO1fFcGAp56b0TDBu1zXmf
	+o6suEDgQgoEotKJFZZ7bk1qkOkFIrUoRhP9m2+OJDYZUw7oQYfYJB23G2i51b2k6XO3/wplduP
	27UT0P+gSB32EPKn+56DDWtwSePde5yB2ga3aOvCR+Y6QMJYOQ1iuTRHdlX3LlGcvR3OLgQoYMk
	TkfuMwHAqLTEZwS5PqKShab1cqlYAlVDzWklWWNO1V6p5+LfamWCT6k/IMY4PaX0PmnNwIZ+pmr
	iRSfgjphINw+sNq9p7ksqJ1mVxQLgdKmJByhekEbCxdcfKaRRF5/GTmJhEoXoWKDnw4B5Gp5Nkr
	3Ailk
X-Received: by 2002:a05:600c:a00b:b0:4a2:180b:3153 with SMTP id 5b1f17b1804b1-4ac185bcc7dmr241323195e9.14.1793624774407;
        Mon, 02 Nov 2026 05:06:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9476:5165:3a16:262? ([2a01:e0a:106d:1080:9476:5165:3a16:262])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7c5063e3sm335996165e9.0.2026.11.02.05.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:06:14 -0800 (PST)
Message-ID: <8f6212da-a6a1-4435-984b-98f79fd50e41@linaro.org>
Date: Mon, 2 Nov 2026 14:06:13 +0100
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
Subject: Re: [PATCH 3/4] drm/panel: ilitek-ili9881c: add Mingjun MJ070BI30IA2
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Icenowy Zheng <uwu@icenowy.me>,
 Han Gao <gaohan@iscas.ac.cn>
References: <20261030-mj070bi30ia2-v1-0-a0f65b65c290@iscas.ac.cn>
 <20261030-mj070bi30ia2-v1-3-a0f65b65c290@iscas.ac.cn>
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
In-Reply-To: <20261030-mj070bi30ia2-v1-3-a0f65b65c290@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/26 06:44, Icenowy Zheng wrote:
> Mingjun MJ070BI30IA2 is a 7" MIPI DSI LCD panel used by Lichee Console
> 4A, with a initialization sequence matching the pattern of Ilitek
> ILI9881C driver chip.
> 
> Add it to the driver for ILI9881C-based panels.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 222 ++++++++++++++++++++++++++
>   1 file changed, 222 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> index c3d5ab67121d9..83148c40e25ca 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -2198,6 +2198,201 @@ static const struct ili9881c_instr waveshare_7inch_a_init[] = {
>   	ILI9881C_COMMAND_INSTR(0x36, 0x00),
>   };
>   
> +static const struct ili9881c_instr mj070bi30ia2_init[] = {
> +	ILI9881C_SWITCH_PAGE_INSTR(3),
> +	ILI9881C_COMMAND_INSTR(0x01, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x02, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x03, 0x73),
> +	ILI9881C_COMMAND_INSTR(0x04, 0x13),
> +	ILI9881C_COMMAND_INSTR(0x05, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x06, 0x0A),
> +	ILI9881C_COMMAND_INSTR(0x07, 0x05),
> +	ILI9881C_COMMAND_INSTR(0x11, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x09, 0x28),
> +	ILI9881C_COMMAND_INSTR(0x0A, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x0B, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x0C, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x0D, 0x28),
> +	ILI9881C_COMMAND_INSTR(0x0E, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x0F, 0x28),
> +	ILI9881C_COMMAND_INSTR(0x10, 0x28),
> +	ILI9881C_COMMAND_INSTR(0x11, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x12, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x13, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x14, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x15, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x16, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x17, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x18, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x19, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1A, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1B, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1C, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1D, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1E, 0x40),
> +	ILI9881C_COMMAND_INSTR(0x1F, 0x80),
> +	ILI9881C_COMMAND_INSTR(0x20, 0x06),
> +	ILI9881C_COMMAND_INSTR(0x21, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x22, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x23, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x24, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x25, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x26, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x27, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x28, 0x33),
> +	ILI9881C_COMMAND_INSTR(0x29, 0x33),
> +	ILI9881C_COMMAND_INSTR(0x2A, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2B, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2C, 0x04),
> +	ILI9881C_COMMAND_INSTR(0x2D, 0x0C),
> +	ILI9881C_COMMAND_INSTR(0x2E, 0x05),
> +	ILI9881C_COMMAND_INSTR(0x2F, 0x05),
> +	ILI9881C_COMMAND_INSTR(0x30, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x31, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x32, 0x31),
> +	ILI9881C_COMMAND_INSTR(0x33, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x34, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x35, 0x0A),
> +	ILI9881C_COMMAND_INSTR(0x36, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x37, 0x08),
> +	ILI9881C_COMMAND_INSTR(0x70, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x39, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3A, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3B, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3C, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3D, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3E, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3F, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x40, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x41, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x42, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x43, 0x08),
> +	ILI9881C_COMMAND_INSTR(0x44, 0x00),
> +	ILI9881C_COMMAND_INSTR(0xA0, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x51, 0x23),
> +	ILI9881C_COMMAND_INSTR(0x52, 0x44),
> +	ILI9881C_COMMAND_INSTR(0x53, 0x67),
> +	ILI9881C_COMMAND_INSTR(0x54, 0x89),
> +	ILI9881C_COMMAND_INSTR(0x55, 0xAB),
> +	ILI9881C_COMMAND_INSTR(0x56, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x57, 0x23),
> +	ILI9881C_COMMAND_INSTR(0x58, 0x45),
> +	ILI9881C_COMMAND_INSTR(0x59, 0x67),
> +	ILI9881C_COMMAND_INSTR(0x5A, 0x89),
> +	ILI9881C_COMMAND_INSTR(0x5B, 0xAB),
> +	ILI9881C_COMMAND_INSTR(0x5C, 0xCD),
> +	ILI9881C_COMMAND_INSTR(0x5D, 0xEF),
> +	ILI9881C_COMMAND_INSTR(0x5E, 0x11),
> +	ILI9881C_COMMAND_INSTR(0x5F, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x60, 0x08),
> +	ILI9881C_COMMAND_INSTR(0x61, 0x0E),
> +	ILI9881C_COMMAND_INSTR(0x62, 0x0F),
> +	ILI9881C_COMMAND_INSTR(0x63, 0x0C),
> +	ILI9881C_COMMAND_INSTR(0x64, 0x0D),
> +	ILI9881C_COMMAND_INSTR(0x65, 0x17),
> +	ILI9881C_COMMAND_INSTR(0x66, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x67, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x68, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x69, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6A, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x6B, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x6C, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6D, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6E, 0x16),
> +	ILI9881C_COMMAND_INSTR(0x6F, 0x16),
> +	ILI9881C_COMMAND_INSTR(0x70, 0x06),
> +	ILI9881C_COMMAND_INSTR(0x71, 0x06),
> +	ILI9881C_COMMAND_INSTR(0x72, 0x07),
> +	ILI9881C_COMMAND_INSTR(0x73, 0x07),
> +	ILI9881C_COMMAND_INSTR(0x74, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x75, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x76, 0x08),
> +	ILI9881C_COMMAND_INSTR(0x77, 0x0E),
> +	ILI9881C_COMMAND_INSTR(0x78, 0x0F),
> +	ILI9881C_COMMAND_INSTR(0x79, 0x0C),
> +	ILI9881C_COMMAND_INSTR(0x7A, 0x0D),
> +	ILI9881C_COMMAND_INSTR(0x7B, 0x17),
> +	ILI9881C_COMMAND_INSTR(0x7C, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x7D, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x7E, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x7F, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x80, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x81, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x82, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x83, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x84, 0x16),
> +	ILI9881C_COMMAND_INSTR(0x85, 0x16),
> +	ILI9881C_COMMAND_INSTR(0x86, 0x06),
> +	ILI9881C_COMMAND_INSTR(0x87, 0x06),
> +	ILI9881C_COMMAND_INSTR(0x88, 0x07),
> +	ILI9881C_COMMAND_INSTR(0x89, 0x07),
> +	ILI9881C_COMMAND_INSTR(0x8A, 0x02),
> +
> +	ILI9881C_SWITCH_PAGE_INSTR(4),
> +	ILI9881C_COMMAND_INSTR(0x6E, 0x1A),
> +	ILI9881C_COMMAND_INSTR(0x6F, 0x37),
> +	ILI9881C_COMMAND_INSTR(0x3A, 0xA4),
> +	ILI9881C_COMMAND_INSTR(0x8D, 0x1F),
> +	ILI9881C_COMMAND_INSTR(0x87, 0xBA),
> +	ILI9881C_COMMAND_INSTR(0xB2, 0xD1),
> +	ILI9881C_COMMAND_INSTR(0x88, 0x0B),
> +	ILI9881C_COMMAND_INSTR(0x38, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x39, 0x00),
> +	ILI9881C_COMMAND_INSTR(0xB5, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x31, 0x25),
> +	ILI9881C_COMMAND_INSTR(0x3B, 0x98),
> +
> +	ILI9881C_SWITCH_PAGE_INSTR(1),
> +	ILI9881C_COMMAND_INSTR(0x22, 0x0A),
> +	ILI9881C_COMMAND_INSTR(0x31, 0x00),
> +	ILI9881C_COMMAND_INSTR(0xA6, 0xA6),
> +	ILI9881C_COMMAND_INSTR(0x55, 0x3D),
> +	ILI9881C_COMMAND_INSTR(0x50, 0x9E),
> +	ILI9881C_COMMAND_INSTR(0x51, 0x99),
> +	ILI9881C_COMMAND_INSTR(0x60, 0x06),
> +	ILI9881C_COMMAND_INSTR(0x62, 0x20),
> +	ILI9881C_COMMAND_INSTR(0xA0, 0x00),
> +	ILI9881C_COMMAND_INSTR(0xA1, 0x17),
> +	ILI9881C_COMMAND_INSTR(0xA2, 0x26),
> +	ILI9881C_COMMAND_INSTR(0xA3, 0x13),
> +	ILI9881C_COMMAND_INSTR(0xA4, 0x16),
> +	ILI9881C_COMMAND_INSTR(0xA5, 0x29),
> +	ILI9881C_COMMAND_INSTR(0xA6, 0x1E),
> +	ILI9881C_COMMAND_INSTR(0xA7, 0x1F),
> +	ILI9881C_COMMAND_INSTR(0xA8, 0x8B),
> +	ILI9881C_COMMAND_INSTR(0xA9, 0x1D),
> +	ILI9881C_COMMAND_INSTR(0xAA, 0x2A),
> +	ILI9881C_COMMAND_INSTR(0xAB, 0x7B),
> +	ILI9881C_COMMAND_INSTR(0xAC, 0x1A),
> +	ILI9881C_COMMAND_INSTR(0xAD, 0x19),
> +	ILI9881C_COMMAND_INSTR(0xAE, 0x4E),
> +	ILI9881C_COMMAND_INSTR(0xAF, 0x24),
> +	ILI9881C_COMMAND_INSTR(0xB0, 0x29),
> +	ILI9881C_COMMAND_INSTR(0xB1, 0x4F),
> +	ILI9881C_COMMAND_INSTR(0xB2, 0x5C),
> +	ILI9881C_COMMAND_INSTR(0xB3, 0x3E),
> +	ILI9881C_COMMAND_INSTR(0xC0, 0x00),
> +	ILI9881C_COMMAND_INSTR(0xC1, 0x17),
> +	ILI9881C_COMMAND_INSTR(0xC2, 0x26),
> +	ILI9881C_COMMAND_INSTR(0xC3, 0x13),
> +	ILI9881C_COMMAND_INSTR(0xC4, 0x16),
> +	ILI9881C_COMMAND_INSTR(0xC5, 0x29),
> +	ILI9881C_COMMAND_INSTR(0xC6, 0x1E),
> +	ILI9881C_COMMAND_INSTR(0xC7, 0x1F),
> +	ILI9881C_COMMAND_INSTR(0xC8, 0x8B),
> +	ILI9881C_COMMAND_INSTR(0xC9, 0x1D),
> +	ILI9881C_COMMAND_INSTR(0xCA, 0x2A),
> +	ILI9881C_COMMAND_INSTR(0xCB, 0x7B),
> +	ILI9881C_COMMAND_INSTR(0xCC, 0x1A),
> +	ILI9881C_COMMAND_INSTR(0xCD, 0x19),
> +	ILI9881C_COMMAND_INSTR(0xCE, 0x4E),
> +	ILI9881C_COMMAND_INSTR(0xCF, 0x24),
> +	ILI9881C_COMMAND_INSTR(0xD0, 0x29),
> +	ILI9881C_COMMAND_INSTR(0xD1, 0x4D),
> +	ILI9881C_COMMAND_INSTR(0xD2, 0x5C),
> +	ILI9881C_COMMAND_INSTR(0xD3, 0x3E),
> +};
> +
>   static inline struct ili9881c *panel_to_ili9881c(struct drm_panel *panel)
>   {
>   	return container_of(panel, struct ili9881c, panel);
> @@ -2493,6 +2688,23 @@ static const struct drm_display_mode waveshare_7inch_a_mode = {
>   	.height_mm	= 154,
>   };
>   
> +static const struct drm_display_mode mj070bi30ia2_mode = {
> +	.clock		= 75750,
> +
> +	.hdisplay	= 800,
> +	.hsync_start	= 800 + 48,
> +	.hsync_end	= 800 + 48 + 32,
> +	.htotal		= 800 + 48 + 32 + 80,
> +
> +	.vdisplay	= 1280,
> +	.vsync_start	= 1280 + 3,
> +	.vsync_end	= 1280 + 3 + 10,
> +	.vtotal		= 1280 + 3 + 10 + 24,
> +
> +	.width_mm	= 94,
> +	.height_mm	= 150,
> +};
> +
>   static int ili9881c_get_modes(struct drm_panel *panel,
>   			      struct drm_connector *connector)
>   {
> @@ -2704,6 +2916,15 @@ static const struct ili9881c_desc waveshare_7inch_a_desc = {
>   	.lanes = 2,
>   };
>   
> +static const struct ili9881c_desc mj070bi30ia2_desc = {
> +	.init = mj070bi30ia2_init,
> +	.init_length = ARRAY_SIZE(mj070bi30ia2_init),
> +	.mode = &mj070bi30ia2_mode,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +		      MIPI_DSI_MODE_LPM,
> +	.lanes = 4,
> +};
> +
>   static const struct of_device_id ili9881c_of_match[] = {
>   	{ .compatible = "bananapi,lhr050h41", .data = &lhr050h41_desc },
>   	{ .compatible = "bestar,bsd1218-a101kl68", .data = &bsd1218_a101kl68_desc },
> @@ -2714,6 +2935,7 @@ static const struct of_device_id ili9881c_of_match[] = {
>   	{ .compatible = "wanchanglong,w552946aba", .data = &w552946aba_desc },
>   	{ .compatible = "waveshare,7.0-dsi-touch-a", .data = &waveshare_7inch_a_desc },
>   	{ .compatible = "ampire,am8001280g", .data = &am8001280g_desc },
> +	{ .compatible = "mingjun,mj070bi30ia2", .data = &mj070bi30ia2_desc },
>   	{ .compatible = "raspberrypi,dsi-5inch", &rpi_5inch_desc },
>   	{ .compatible = "raspberrypi,dsi-7inch", &rpi_7inch_desc },
>   	{ }
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
