Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600157;
	b=jDNlmbai7PccZW2xjP43+NJuSZRVAqoLTIBEtBvM4zn5A+f8Tr5k1f420ZXZScZnrX7r
	 ac7Q5ovxyupszNvAwH6KgtLkBsenekQoqXnbP7tT6Ej4TCxzLYMRPpcsZRYHVRFI7eDBI
	 DFWa5a/ZGKYbWSNhDvCdtj10LggFxBBh+q+eRHmNX/zcUAgVnD/7boZHuyd1XC7keIkQx
	 QevG6OLXq9Q0GSJFpg/bd3EkfO7k6C+4y+FyMv+nxYzOgZ8BGvuAPJAiC0XkUqMg5faNu
	 iie4dvl4E+URWIE7sLGG0Lm7QxhC5zdeWmQU84hTLJaha11kU7ZVXQqeLnT6D4FbYSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600157;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=7Yn6sJORWGIsC1ZVUYbbL7nWfxqpI4W2q6kyK2Foowk=;
	b=0//EKGNE6jBZq2KYRvmzO2M/tCcd0dus40gf9RIINAai1h4UHm1MDOwRRzcP/mXhRLwG
	 KXEVKXVfJy3I6Zq/z6QdDMC1VDdAZEtW02ME+NkG8+B/WQULGFF2qCrEf5skon/NK6gQt
	 C7mmQOrMwDDQ496jn8cePt6cswA8DBSz0y8jnTkSBKmRmuzd4fZGK8cmp7JE8YARgKZIk
	 x9M5xCciToKuZk6106EgmMVB5udgCOEmcBZTIkNr29kMtSUN0v5psG4XFexGXg8krEWH1
	 KrLwciDU4ktRxVGPce3xJOPmgS9CyiOJKFxYLigjRpY0IreqBn+YxDC/fQuHKp8mx6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XRTFH2Zu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B66D606A31E;
	Wed, 25 Nov 2026 09:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XRTFH2Zu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A611F000C6;
	Wed, 25 Nov 2026 09:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795600157;
	bh=7Yn6sJORWGIsC1ZVUYbbL7nWfxqpI4W2q6kyK2Foowk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=XRTFH2ZucxZHM83JzPFiSdcmPPT3wcsWjCHJjJCG7H97kVOPEDiRJ5ebLUh+FKM98
	 r8xsy4XCVGdoOBt22UG2v6+Q5DWOiTA8TK0x2eVyXtLNTvS1YtqAt5AmyJC7HM1Qcl
	 wvUXO+ltUiRqptPfnPw+yETuEsuW/UZGaYpZh+weR0DJVntSlc1t265KJC6pftEx1r
	 I/lCtAR0UwIL90pBS9WndZ/GYj/6mczD8DF6Hsv4X2mpmST1smHoiRRPb/rl2BNzBU
	 R4JIrTmg7KAdMju3X6/SWw5O76LllhCJVTWZ2iWCmAlXlTnPQzZ0h4NFgmN0NjBvhM
	 bpFNDvAe/QBkQ==
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/8] dt-bindings: soc: rockchip: grf: Add RK3506
 compatibles
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261122060114.773624-2-jonas@kwiboo.se>
References: <20261122060114.773624-1-jonas@kwiboo.se>
 <20261122060114.773624-2-jonas@kwiboo.se>
Date: Wed, 25 Nov 2026 10:49:13 +0100
Message-Id: <179560015396.14607.9966958712968902485.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-22 06:01 +0000, Jonas Karlman wrote:
> Add the GRF and IOC compatible strings for the Rockchip RK3506 SoC.
> 
> Table 1-1 RK3506 Address Mapping in TRM for RK3506 contains following
> related entries:
> 
>   Module		Address		Size
>   GRF			0xFF288000	16KB
>   GPIO2/3/4_IOC		0xFF4D8000	32KB
>   GPIO1_IOC		0xFF660000	64KB
>   GRF_CORE		0xFF840000	16KB
>   GRF_PMU/RMIO		0xFF910000	16KB
>   GPIO0_IOC		0xFF950000	64KB
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
