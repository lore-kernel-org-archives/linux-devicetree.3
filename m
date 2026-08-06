Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE9A47CC97
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 16:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786032849; cv=none; b=nYwUGbggTPybEb1EiIkt92nDMRQBuZ4tBpaJAONcQXI6jdw3cT9gf1PnJDGECU/Pif8Ghg30mgyl016/BgPwfl5XD0cxzWtdsuD7q8NYN5C4cglScNmo8d5z01/ZGpCfamYUAAXXsUZZfQoG7HO8iZKilYVPMC+1pEbf+2UQFGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786032849; c=relaxed/simple;
	bh=flhDTkGJSoCpzIL8bnxa4x1vBdVMKKtbu2rInh2HXPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IwiV4O6BNbVXhd3v4x0Mukx6EDwmCEGF2qA2+vri0odoAiOuAeNYzMgRMVfnM5DT43bQzmE6i0yRowZoGrepWkcqr/Scq3gZ/EfaR9mQewKsE+he9Cf6wLp/hqrgvPw/AA1RLdm7XTmJbIDRqGbCd+t5SPidCfw+lQix4UT/Trw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yxm89g/8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yxm89g/8"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4956869750eso17893335e9.2
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 09:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786032846; x=1786637646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tXxkSVa+2eu05dZjUDlR4s5Kc7ssR4Aj7dZF9elDO2E=;
        b=Yxm89g/8NlHBmfeWOlUf/I5/fUCNvwLkx1OkmIwJ+RDgJ6go6WfX2c45VniM1XPwe0
         3c0BctBq7jgGe/ZacC57HJ7HzpqR+Bk4+11/6+mm3vS3r4OYt4uRlZUWfXMWM/A72fbO
         sCWJy5eJYsEYiZV9K7BMkfNx8vw7P549crDRa1AF5npaTdJYypy+694bGZzj7MWIMGSU
         9z9anhZKKnqMQSsMJ2fx87NzSELeymS4gDpFGG7cnVR++0VPqJuKg0gQCtcw1RAhiv+p
         X8BX4XO/Lhki1kGMQse36XBg4H3Iz93B0bsJMlZH8b3uPR+2PlCaxJmYAvcmx7B15NgQ
         ld7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786032846; x=1786637646;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tXxkSVa+2eu05dZjUDlR4s5Kc7ssR4Aj7dZF9elDO2E=;
        b=X9D4VYVZEoNBuov8STwXdGavHzXxsKBLlLwo5IQi6NBM4Mnhz5MfSFSkHCgYBxZLBa
         BCES+jPigXftunsp1kGhRtJdPHC161/d3t/LI+jzWCYrbUyd4U9K6ORcNxNnjCI616Q8
         lla0erQqaAac9wrBdEYQJ1EZ/W3nULMxYD6bVmxxkDNVYK8eAl4elsCdXeedRvsCLHHR
         Z/B9WEaRHU+otCITfYWzImQh5u6qMHyBOQCEGyZRDgcXtwHFHNgKGELZWY8XG0qwxjSx
         z6V+yAu/OoxVFPbZB5mo7GkvsivCr/JlNy2GocKZcMYSyPwQ1M8wNWCFmsQs4K4Oyh/r
         cE7w==
X-Forwarded-Encrypted: i=1; AHgh+RosZEEjgCfYFNc0IhYkYtiKSt1y0xGfuILyJvB6oW9lPJ2bDyjuDVAycCkhGDQVMla6yhta470UYcN1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1PxOgRtMxL+cDWVhwHuGpi+zlFe9ZwaxeIKo3dTsgjmTs6gi8
	Liy02KX18Zrjwy7ELF0OAljyj6mXkDcoPUfCF6vey4hPL5EKKtRUJ4ZQfo2mq1bCLttKk9lc+F/
	NiyMZek4=
X-Gm-Gg: AR+sD12T/gMAKfg7bGm60xiTBy3PsbCdpC1fnhrz3n87BRfXFHZcD0UIX5Ef4jirVwY
	W6qSAbQ3AiLRvnO3MvqedSt5Ahiz2jyMu9zluiaPelVFdIoZA5CxSoE56M7t7WxzV4G5AxTWHBY
	lxerQZ79cX1bKOh5EIdGlT52Xzs2hrhmReSQevT0CqiHZUKpjHLoV/A5wbjnVl3EyTK1W0KX0pd
	VS/DREmZWeL+O22VRS31Zhfba2Pz+DJ3LY0ZG2XD3r8yqXEPQH4EXCeFVnkStFReMM76p+TiFyq
	osy8HLyP+ftCNNjl4xkjpdCgXjWv3/ESAoEmOcQPpU5N4b/6hZJsbodvOxFEiruFeYHhzoQEoXX
	VuO5EqwH7aezJQ1QcfTu6h7rXnsPZNe7zfRLM0JP4xi1hntu/xa/hUaHosPS0qR/wKw+k0VVrSB
	/LMajeTcKSc+Ury6izaj0aO5BfwywlrcCFTu9eRGXBrcyu7pdq9lXEqj9Ei5QNcflmqJ9PsSWag
	Q==
X-Received: by 2002:a05:600c:4ba2:b0:493:b6ee:fcb7 with SMTP id 5b1f17b1804b1-4994e7d3434mr142978515e9.14.1786032846564;
        Thu, 06 Aug 2026 09:14:06 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.115.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995421b198sm84909005e9.7.2026.08.06.09.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 09:14:06 -0700 (PDT)
Message-ID: <ccf41669-685c-4657-9ffa-7053719bd539@linaro.org>
Date: Thu, 6 Aug 2026 17:14:04 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:
 support per-direction phys
To: jason98166@gmail.com, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260726-dcphy-rx-v1-v2-0-cf9cc34a412a@gmail.com>
 <579EMzIB4QpX971YyewFrke7qDRTnb7VISWtBI86oM2PJpls9AOXn5nKFyv8PA9EiZWOiczXm9LbDAO8XTkrig==@protonmail.internalid>
 <20260726-dcphy-rx-v1-v2-1-cf9cc34a412a@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260726-dcphy-rx-v1-v2-1-cf9cc34a412a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/07/2026 15:55, Jason Yang via B4 Relay wrote:
> From: Jason Yang <jason98166@gmail.com>
> 
> The Samsung MIPI D-/C-PHY block on RK3588 drives a MIPI DSI transmitter
> and, on the same PHY, can receive a MIPI CSI camera. Describing both as
> independent consumers of one PHY requires the direction to be expressed
> in the devicetree.
> 
> Allow "#phy-cells" to be 1 or 2. The existing single-cell form still
> selects the PHY type and refers to the transmitter, so shipped DSI
> device trees stay valid; bumping the cell count unconditionally would
> invalidate them. A second cell adds the direction, letting a DSI (TX)
> and a CSI (RX) reference the same PHY node as separate consumers.
> 
> Add include/dt-bindings/phy/rockchip,rk3588-mipi-dcphy.h for the
> RK_DCPHY_DIR_TX and RK_DCPHY_DIR_RX direction constants.
> 
> Signed-off-by: Jason Yang <jason98166@gmail.com>
> Assisted-by: Claude:claude-opus-4-8
LGTM

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
