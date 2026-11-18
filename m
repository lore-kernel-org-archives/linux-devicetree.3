Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795004912;
	b=o41jvmjWX4qsd8I9PV2MnBqTkO/2ln2DEWRfUaLnb5Trn9fT8Yuyfu9aK4R/iPNABrsa
	 KzwsPkS1xIm/1aQbdbxQKELa2Oy9ae7YPfyowgct6jXWeit+aKHHUNEGsK4CLrO0OcRsr
	 Jvpe6rIy4D7YLRHvLy4cKZK0Tzn5Yt4EwwMqKd8VqEX29Py77//gNwiIbIEvQJu5+dYl8
	 80T+YY7ozwIrwF8uvhY59zdab01hWlvIuFeYrOG/TCTwQUC9DMLbm8lfR1YXNh+GOIJiQ
	 N6GNaTOTchUcexEXe4Q+PadQ6Xi6HVE8y8iKHUIGad4kyEL8xVPzZJi7ALjI9M7ax9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=fApH6YF8/olwr8rszx1618Se8LLbeSsWPgcCTgBcSzQ=;
	b=UwPZBjtTq6yFH/BDxBy2YR8eqKKrW8WHA/ya5dxhQvsQanzAqV0y6QJM/JPa1YK/tnnC
	 SECDM0f4QRNrm17xbyXT/x4Q9CI150PCX6v5GBzF2cDzS4bs/nwww6MRf33TFnU1ulS8f
	 Ve4MQJPkZFRMvBU41eCIz84NSnSrGwmj1V4aDOpSN2oV9Zy/TcmyA9AIa+YzJV0yLvYLu
	 JmVnLERsEKpDxqsZjEiSEzpe6xiBBNlAkhneMD5Xt8/z8NvceXBKcIYe8dmk3ABdqgWek
	 /IBKwcAkVj8yaBr/wvWRoEPOFRaYrJWvFIVt/JLoz6MhNHXxGD2dRPbNfMmYyTr89qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QRVCfeCD;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475E4606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 475E4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QRVCfeCD
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so688908f8f.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 04:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795004911; x=1795609711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fApH6YF8/olwr8rszx1618Se8LLbeSsWPgcCTgBcSzQ=;
        b=QRVCfeCDZ50q55h4y9LENvb5jE829mfCziTdzf3Mv4xSq5+zz8ClfPFrt3SC4bEwvm
         yZpjuQDYojaQuIchie2BoCKzm1dvvt3cWcU5WTqAPJaCz+8jbjIJT4z1oghC9tHqxGDe
         kGy4C4WaH/v52F3BpzODMnCqHy40pG5OX03QsH3WBBTyR65czbLDyYPm2gF8yYeNlza/
         GXXW0dXuPvHlyy7vBx1JgTnjqHG2kVjiGq9NRuATTvsavX2uw/yacVlCcC8SbhcnxBP3
         rsB0FYxkyyXpgwDeYykmF15G47UdgTO2C/m+ftBt3r/+KxSDTqAYOdAiMMuZz99z5m6J
         S6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795004911; x=1795609711;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fApH6YF8/olwr8rszx1618Se8LLbeSsWPgcCTgBcSzQ=;
        b=FzZ6P5bhxI8LqlLxGW+xPoVYgK+mEoxeGvoH00WbnLY+RM354v8IivO18748qzF62q
         3YnN6oNWItuYRFkBiPNYjRXjr/Z7ialxvyZURHohpi1sA27NHUMy4wd9D7M3QBsiVPSN
         RAvGHUDS4OjYMCdC7UwbWvj402i3QMZPlB7MbgDmN1+NGJX27+DDusD+z9YpmdrEnr1m
         QQ3GAsAq2On9pHk7IkLwsBfWlYhzhwpTRRgevOz8/pxPFbUzN61El8GXWYi2nLEQB9iV
         bRouWbfNOz7lpfbgK5cmSrK17Y0Iwcb1q+dG+hDyj8e1kLh8aul+6QScOEtZqW0Q1PUK
         4LKQ==
X-Forwarded-Encrypted: i=1; AL+hErEwvWJkm3SJkrxXbJ18GzqjdpE1zmNvpbpK0/OnL2Gb256Km3DSFWUvcmCnnl9mnYtbZ3n7nlI4l2CB@vger.kernel.org
X-Gm-Message-State: APuU4Z+PM6S63hQcICYJ6c4qygvqAJAxOq8TP4N8v/L/j+hXtv5ro6fT
	QvS4dW4VBerWl1D8mVFyDqlOAzKhMpGxRRBKXDoaHjLz2iBuLpvSbycrZdqMTpgkIYY=
X-Gm-Gg: AZFdTZcM43uvYiql5UuZAgIdKU0F8H8hzWp0GUJaBCRj5NkY3sPel3wy7yrNIbDovOg
	lur8B0yZ29de9SxqU96VUcRcDXY8VQZ0OJ+XTkK3cGsO4Ncgj3IkbqLInNRwDxbxaipGB7CcyLJ
	VtCw+bugjF9uvXlfUpHXOyeS73CjLguB4wSNLYY1rReuBMBh94Yg5zVmNTdczneoM4QUZAq6reb
	AiosnmgNIjKY0u3dzEnOX/M+ecYggR0lWbWi1L/+i7dssHjC2B2jEUVWXQBGJrt7A74sNZujCmh
	IelpvgXjn3hsFFj5+iYq72/CjjVEsaSBt74npkwf9HsXuEzCTJ1Ufi8qYllm/0OypLVauVSXeVK
	3j4Aykjyb3Q4F4F61muJbQ0zeBeXmqYwlXqXtnJrqNu40GY4J/lO/yRbpRN3kYk1QVHkazXZI6y
	VlbQcS1jU9o96jQnWfJtlsLy5j1dKXFadNKaZqKxR471vkhQXrrNUgTwYqE/fVieyLTI/u/HRX4
	pI9qBLOhRxDCyxC2do8h5bKYB3LF+6KvyJ9cbaOm/5yDV8kLdtwP/LBy+/TfR6N34wemC6cNL8R
	/CIZot1dbkK95nye0QCDcl0Vzm6BrdG/tujX3TSKuVuAfed0wUJIGxWFSoMkJvWEi4FbzOf1Oj4
	sgQ==
X-Received: by 2002:a05:6000:2f86:b0:4a6:63cf:99a6 with SMTP id ffacd0b85a97d-4a663cf9ae8mr4421294f8f.23.1795004910709;
        Wed, 18 Nov 2026 04:28:30 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c406sm4567452f8f.14.2026.11.18.04.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:28:30 -0800 (PST)
Message-ID: <15dbc800-ab4a-4b98-8f6a-95d2ae80819b@baylibre.com>
Date: Wed, 18 Nov 2026 12:28:28 +0000
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
From: Daniel Drake <ddrake@baylibre.com>
Subject: Re: [PATCH v17 12/12] arm64: dts: rockchip: enable the NPU on
 rk3576-rock-4d
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, ulf.hansson@oss.qualcomm.com,
 abel.vesa@oss.qualcomm.com, sebastian.reichel@collabora.com,
 sidong.yang@furiosa.ai, u.kleine-koenig@baylibre.com,
 chaoyi.chen@rock-chips.com, shawn.lin@rock-chips.com,
 finley.xiao@rock-chips.com, diederik@cknow-tech.com, alchark@flipper.net,
 leonard@lausen.nl, vlwwwwww@gmail.com, jeff.hugo@oss.qualcomm.com,
 rfoss@kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1794615324.git.gahing@gahingwoo.com>
 <c0d64d55586774802bdd70defa016be6912ab83e.1794615323.git.gahing@gahingwoo.com>
Content-Language: en-US
In-Reply-To: <c0d64d55586774802bdd70defa016be6912ab83e.1794615323.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14/11/2026 03:05, Jiaxing Hu wrote:
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
> index f068794e48d4..72b251d396fe 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
> @@ -779,6 +783,24 @@ wifi_en_h: wifi-en-h {
>  	};
>  };
>  
> +&rknn_core_0 {
> +	npu-supply = <&vdd_npu_s0>;
> +	status = "okay";
> +};

I can't figure out which code actually acts on this npu-supply
regulator, even after considering the patches in the "pmdomain:
rockchip: RK3576 NPU domain supply and settle delay" series. What am I
missing?


