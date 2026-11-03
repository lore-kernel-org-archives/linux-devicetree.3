Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696109;
	b=Tiy+aD5B+qbMRqoAdOpRa62ea/2lr9r0XcXIMPJor2jMyLAayZWnwhv3exLIPwVyP8WX
	 nyI3Q7vFWTGNt5poOBP4AJFkE+v9H/U8WKWpydBnw5OeXE5A50sxc3RMS/TSYGsdx5t7l
	 OHXiM4206T8ErkBrTNGmobCkkAse8U2bRIfFSK7hJdfIdE5FEld8vFrwJrINKMtGPPjbh
	 C7heorAPv0NVcRkZGAX/63fECKX6gf6YBrNvyW0qQvSMLz1gC769Davtc6tEK04UZittz
	 MxLmz1JTb3ftAdzrl+ybjUQ+7fgmR0rL2rS0y5ZKAZAhBCAgZvA8/Mj8+AysMm9TIfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=agwTDlVTaDDjvub+/sVTXidA5drfVA/Xuq65aoektFk=;
	b=gDxZF/wZAdaFIbTeiMpyuRc7JYnnAQhlQ6HLmXI5RWdR320ZWBK3X5vy1qLqFqh+pnou
	 NPR+qjs1tYmxGHekVHvJWJ61i93GBA2XUcchGHIujClIWiC1W9BznqbUzyGtj9xA65j1x
	 mfNtLPCA5uavoBV5vCZvBhCMHHINHnY3IXElJPQ450yB23SGcfVT1YD2hKQ0I3M4onRI3
	 ImvI2q8L2nKUqGp0TIftpZ4U0i4j6BBSsKRRRopifUyGrdPQ7W2tJh/CMFZK8iyV1Kh2J
	 k8Ao8CXo1Brxr+dp+1lnIMRS61VFNYMO9hr6jbr9JwZrRF/ULx3AfHNH36aXE7yYhBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tb4P2c31;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D00606A324
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 08:55:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2D00606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tb4P2c31
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so26112135e9.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 00:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793696107; x=1794300907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=agwTDlVTaDDjvub+/sVTXidA5drfVA/Xuq65aoektFk=;
        b=tb4P2c31O94KPbtcM+9HGamMUoeSJpm688QqLQHP4hJk4CdmZcauDs+ZG3RhjL3OqP
         83U14EZE2dM08TV1PFO0bayYgxCjJAZwxYrKIi7hshc8+269p2tlnPEdRFkIv76T1oWv
         qQZlfREtbknavweStprVRQFhLexTTf1hN1Pk0B5pNaw5deRFADnUmYrkzSHWshHO/3Oo
         yY2crvWrFXr1MrZimgIRy6KNY6kPOi+hJZsm5mishijBDPEy7iBadj+NmHzk4vVU+CKb
         dabUBw5i9J7b0kVifyOAJ4NSJrBz7Fk83JdvUIcQEODaNRgF0f/7lrMUz5tL5f0LuWFQ
         jR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696107; x=1794300907;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=agwTDlVTaDDjvub+/sVTXidA5drfVA/Xuq65aoektFk=;
        b=OVpNlNx7b8Z8cYbYPwV4UCcP4a/BZoHyUOia+OE3sZgUOahlBeuSgKG0loZg9cGq3d
         YdziCzG9xJ89N0/S9cSodQ7z+9e7jLjJjsTC1sWfXzW3UXPDw1ji4kCP0gNRzPLwdgjm
         8QH+cwDoIYHQFdiY8iLU5sE/CtghA2dwP3+VmzV+Bd1kVCAlziwZBzXSMCOpgZPDuBFC
         br9Jj8KoCvPhz5F9knef2cHddoChMd919vIY7EBJnlms67JPBwHlSax7ONV4QCnZit1h
         kZthl2jzXTLZHAzpiSjp3yYT1YKa5S5ySXZ354p0rz3TeD6/qWlHtkmBVQVoroqFSvWZ
         5eiw==
X-Forwarded-Encrypted: i=1; AKwUvBw5BmzdJA+zT8TDSUMVgp/HVxbYaCrdnucTF1cOuU2toqVdIYz2cuPKuIsccxUX9s+6HU57/cX9xmn3@vger.kernel.org
X-Gm-Message-State: APuU4Z+tMNn5hBHuHgwVceZLzOyYUh+UdjugsjNfcketwlcidMyqkE61
	7MhPROV1P+WXeEOtJuhmHPw+BeEAwMqMUPX2N1QYQQYBUYfdY4F8OCxTTrQIIFMz8hA=
X-Gm-Gg: AYBFou3AW4ooaXb1ts3X+WN1oWvUKfyDOJ+O/2lFhR4DXugli8xxcDB/RmrvgH0ARWL
	3w+fp+7vPdGxSGSBfW1f5/CJgfUAhsHIEsHuCOVeBpXClP8yqgQNZby4QpUdLVl/7xhMvJy3tx5
	vi7KTpqpMIvoeS6Gh5W9LGwBS6Ln6BSLqzDuGf7SQJ7RxmsoT9p0V6O9apdogslPGPoPCelTcHi
	LpRKDeAPFKIWhy6ar4Jn/iefTw1tDEfJm37i1gQ5BPUQB9cctAHWDcdxiV9Dtl0epKizc3DdpK3
	XQNNJBu5c5g1J5ImKk+LmNEsdRmHNwYcw6MMEDQqXL6mKd7Jm0rtrCh+O2XBsg7scOZXCcJCUsA
	EapJW0WY1oyPI4M0hBFgbgkNAkBahZ0qnZ6DX5L0F8riQpZ+gMuxNpeV7AYn2ptXhc7hVcI7wuS
	t3m7XmKIN5zWceHBGmeA0gD3ik+WJHWnIv+Njq96PZt3bO5OTQSApOhF1tUtM9VvxD/N2nhLM2S
	9uTVbM2wv1rQZN10liGYIzAn2rqiGoApWyqbAV6qx0kgPXBIjmUwBqp2xDAocpMeZBq/oWy/cQd
	2i88asXLtAKeBm5qjGd7lJJwpnGmXigNatPONkcaX4tWyUeW8z43KN9gqEQ5BAR7hCOXYcSf/3k
	lDlKU80hF
X-Received: by 2002:a05:600c:8119:b0:4a1:cef3:fb3a with SMTP id 5b1f17b1804b1-4ac17a36a28mr255021625e9.9.1793696106916;
        Tue, 03 Nov 2026 00:55:06 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:95a2:4869:9f46:45f0? ([2a01:e0a:106d:1080:95a2:4869:9f46:45f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9bd5d9fsm40122525e9.15.2026.11.03.00.55.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 00:55:06 -0800 (PST)
Message-ID: <518cba7c-1aba-492f-ac6a-c5c4fe6da847@linaro.org>
Date: Tue, 3 Nov 2026 09:55:06 +0100
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
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm: dts: meson8m2: add dwmac 3.70a compatible
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20261101232011.1172410-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20261101232011.1172410-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 00:20, Martin Blumenstingl wrote:
> The Meson8m2 DWMAC reports User ID 0x10 and Synopsys ID 0x37,
> identifying it as a Synopsys DWMAC 3.70a core.
> 
> Add the "snps,dwmac-3.70a" compatible to match meson8b.dtsi.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   arch/arm/boot/dts/amlogic/meson8m2.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/amlogic/meson8m2.dtsi b/arch/arm/boot/dts/amlogic/meson8m2.dtsi
> index 6725dd9fd825..cdc47ee1a233 100644
> --- a/arch/arm/boot/dts/amlogic/meson8m2.dtsi
> +++ b/arch/arm/boot/dts/amlogic/meson8m2.dtsi
> @@ -25,7 +25,7 @@ canvas: video-lut@48 {
>   };
>   
>   &ethmac {
> -	compatible = "amlogic,meson8m2-dwmac", "snps,dwmac";
> +	compatible = "amlogic,meson8m2-dwmac", "snps,dwmac-3.70a", "snps,dwmac";
>   	reg = <0xc9410000 0x10000
>   		0xc1108140 0x8>;
>   	clocks = <&clkc CLKID_ETH>,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
