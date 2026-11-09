Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213867;
	b=fc2Jzejad5YluGDM4BeR1BT2FXbYpGqNrsWGRbkgLceo7cvyZF8zFGkpbIiJuSEDo4UH
	 xdd+XAR4o8bope/AP0oSeY4s2wXMcN5L+3z1qJ4WSha23ctJiXjJrtWWEjnyk61Onps+G
	 83FXfAXLuxJvnP5Wb7WAEJ0bksWgrhbvWxFAdSnlUf/WuXskThVsHEM3IMIkgidNbFVKQ
	 T2f3uoicSNeZx8focZ4br7eje/GTGwAYH1eKzsz3W98jvOSWNfw7fToRmPfkSsNYELvsc
	 2kjlGIvb/v/Vrakb3NverU4CeSUJQJL7c4/zY+SMQl+sjUYRo/+KgNLK/zmY+WHzdYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=nONbKxpuEMSIygsHlA4QWrRW3DVRFl0YZx+k/yyrPvg=;
	b=ITfDaFc1xqJ8S+p0R01ykaeR8+WQzmZ+zUfpOnwxGncsfSLhpZL5VQYG+6kNugraguoi
	 IroR/2Z0PjOMdK1TLQ2txug4Sku4rBhwBfHAp2cVuiMvomc7Iv2heynsAAqOfqI136loC
	 pupZ1+i7QW2rAh7l9I4ntMJhYj8KNyT24P3nTCKnsv/RwqtY8E51mDmqo8OefAe4pRJpP
	 XvRpmwam3KjOOV75qPTSTGoeswcYrkRcnB99PIJgiZcBknkpcPtUp4Fbq7vmM8cjQyFp5
	 wxaTaNcHVmJcyYbv97uGHL7lZmhwyiL2KaoTMOr7H8T4fPri7QSKIJulngaUEDXfq2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ASZbmu2Y;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4449606A339
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 08:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4449606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ASZbmu2Y
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e10a70540so331673f8f.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 00:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794213865; x=1794818665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nONbKxpuEMSIygsHlA4QWrRW3DVRFl0YZx+k/yyrPvg=;
        b=ASZbmu2YCiXCe/l7N9uYGOlrzmDqdXQ41S5SgZ0zQtP6IoF3pabLOub9aWYCBYy5Gl
         kobRY7TDG2+MCJDciqK5HOeMrnPx9I4QAeUicsa/qMshDi2wHF80EXxOke2qj91MRC+k
         QHt4xuWu+mUt/IhpjVn6a+FtyVDKilEpAs/cNSQlIxwRSFgI4rd+dFKDGS8V2DJexdNB
         bP4vXE+cdrFDW9MqugkIQIcNjUsH9vHfJQJl3cnUXxFl4jYE5uY0V+nPEUEGnbtURk0a
         z8Dbr2h7fXKnPZWdU2ISxbiHhyTXfb/3+YUcIwSZkM6Ysk5vj8zORj2usq5o+pZ9lTfD
         SSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213865; x=1794818665;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nONbKxpuEMSIygsHlA4QWrRW3DVRFl0YZx+k/yyrPvg=;
        b=JcHiEdHq5VvFQblwpXkKIHO4oV1sHh7uRNZTj/+F6Z+if5p/z9npphHLVUa3Rf8912
         /Hmls7aGwQGUzGqmYdfioAcERfoFMAE7pioRGF/0O075v4FvWaWBp0LiYmlwyS03TlLS
         dDL2e7lttLh3ioGeinRjGAoRVmUVPTQSm2nGvyt5U0XjO0Sl2dE/jYUovlOzywSgDf5U
         fvcz98dQh0C38wXl7D0NBKtNgA/p+h1DJ20ZfmjbCEDbTdHplvcH/ZF3Vk3uxuSG6b7F
         o3Tz/ysn+39S3dGpvV8GiV3HM1dN+7gHzm0LypPWdT8J1hBI3w4WBt7uynZDU9iLb1QM
         Xuig==
X-Gm-Message-State: APuU4Z8xQexgOI/Li3RkNmLAheTXnSvXb0tekf65cQ3JmwG6hCu4zHtl
	/9stWLrVG+Dkc6HVeYACYwYeBD6IfCHwYrvqWrbv7QCyW5fYnjbnihWzS74CWMmekx0aLt+EA+2
	8AbdX
X-Gm-Gg: AYBFou3sWcIWG76yMJpHOjbjR9MRq1JlEx1FCb8iv01VEREodVhLqbeuWA3njbRQ3ul
	UwAbIe1hgjUrhSz3Vzs6/PwOiFUUma+qYD31JTMr3SUSG1Hqw42O8N5UMHJDXIXBJJA/RCmA2xY
	StBmbl6Idgsf5vVW+BUouwlCKVIqtIVHmU21IJvurXT0XBJWRm5nihQfd4kGDQ4ujF+FL3iiVlT
	vHyYRJLo5K5p+5Um5BQQjD0fFcXLGBu9gyH4SxG+MjqP81+F2DnoynBqdtfSvORiw3gwLgXszTi
	VdkDwSZUNKLEG//HtIcnlEauVUjNXtjIh7+xRyZbyrvcLHYbw1giOSW1/VtrttGlsOjyCMete9F
	RnAc6vyKe24JigydYM5FfJMWhX4Va/Gc8NJAHdPX+vpaNUouiMzHjlG8FSRma+Pb9MLfYxugrCV
	M+tuxTbGsb44oYyYp3g7mM31jsWNOukJ6frV5W+gYYXU6S/wP8SaaKLM/2gYGcC8vs3tJhUVVXQ
	gXB2YM9PKBZZxwzh/cLoNHCt3zZhmg2MN1nIL2IOSSFQH0lKBZyUCMDFD7MXv2sM4RZm8J3z86r
	woS8r7hC25jogwsI9Cuc5QnzXl+PQ6yz69fEanCkttR0x97lCJVO0zoyKTm4sTlrFPfxOgdYZkb
	KgfB9Mr0=
X-Received: by 2002:a05:6000:4287:b0:490:369b:f50e with SMTP id ffacd0b85a97d-49582e8e536mr6741411f8f.19.1794213864879;
        Mon, 09 Nov 2026 00:44:24 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:6762:47bb:1e06:ff70? ([2a01:e0a:106d:1080:6762:47bb:1e06:ff70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4974b7645cesm1840521f8f.32.2026.11.09.00.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 00:44:24 -0800 (PST)
Message-ID: <14a650ed-e409-402d-b278-5af4c6c0d6dd@linaro.org>
Date: Mon, 9 Nov 2026 09:44:23 +0100
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
Subject: Re: [PATCH] arm64: dts: amlogic: meson-sm1-odroid: mark the Ethernet
 PHY as a wakeup source
To: iav@iav.lv, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261109-hc4-phy-wakeup-v1-1-d98784ecac88@iav.lv>
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
In-Reply-To: <20261109-hc4-phy-wakeup-v1-1-d98784ecac88@iav.lv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/9/26 01:57, Igor Velkov via B4 Relay wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> The RTL8211F interrupt is wired to GPIOZ_14 and described in the PHY
> node, but the node does not declare that it can wake the board. Without
> wakeup-source the Realtek driver does not make the PHY wakeup capable,
> so phylink leaves Wake-on-LAN to the MAC, and a magic packet does not
> wake the board from s2idle.
> 
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> Tested on ODROID-HC4 with Linux 7.4-rc1 and the U-Boot and .config of
> Armbian: s2idle, Wake-on-LAN set with ethtool after the link is up. With
> this change a magic packet woke the board 5 of 5 times, in 8 s, with
> pm_wakeup_irq pointing at the PHY. Without it, 0 of 2: the RTC alarm
> woke the board.
> 
> The test DTB had two other changes: the RTC alarm interrupt [1] and PCIe
> disabled. With PCIe enabled the board did not resume 2 of 2. In the one
> console capture resume starts when the packet is sent, then a hard LOCKUP
> and a panic follow while pci_pm_resume_noirq() of the root port runs;
> pci-meson has no system PM. So on the HC4 with its stock DT this property
> alone does not give working Wake-on-LAN yet.
> 
> Not tested on ODROID-C4, which shares this node.
> 
> [1] https://lore.kernel.org/r/20261019-hc4-rtc-alarm-irq-v1-1-078fc79e596f@iav.lv
> ---
>   arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> index e6f02d738a21..9a4684dfbde3 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> @@ -277,6 +277,7 @@ external_phy: ethernet-phy@0 {
>   		interrupt-parent = <&gpio_intc>;
>   		/* MAC_INTR on GPIOZ_14 */
>   		interrupts = <IRQID_GPIOZ_14 IRQ_TYPE_LEVEL_LOW>;
> +		wakeup-source;
>   	};
>   };
>   
> 
> ---
> base-commit: 81e55899e134541583a4e611ff750e1868671c67
> change-id: 20261109-hc4-phy-wakeup-9c15ebaa311e
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
