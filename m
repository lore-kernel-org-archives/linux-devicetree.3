Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565331;
	b=X90mYGPP1ujDWwFFb1EOCtE7cz0KfS1FwJcAZO2qsoQcES91GSbdyc/eyVAzClS0cqk9
	 4guimuljPQmkYkmm5n9lU80H0nkY/bvTYrkAI97mO6nf54sW1g2f6jjUOKsUG/yFOB0NU
	 mq9EGkqn6WFX6F+oHvicS0V2S2Q1SolzElg3R3ScZutlamaJLrElw+B4yOUBJYHWQaQ0V
	 LzmsY3ceGekNO9Ctb/uAK+GkQqJwHqIfnubkLGezR0dQln6g9U0pl8VosUrI+P0EG4HpP
	 3cOhhKF9ScWSjWt5tTRXm7Hn847HIdBLZ/Smlxt45Q/Pdutc74EF1QuC57zaDkGX1qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565331;
	h=DMARC-Filter:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=JWO5eOPOWxAZPbt93E7PWjAf1XN4ASjz7QmgH9tcpEc=;
	b=WSlEObK6EcODO7fuHtA5sBkSQ8dmEMRwo746P4WYFu4bcNFRglW52DQU3rSgShN5iDGF
	 TlnMrdZHER6T3Ikph8keEX1lX7uj4nTerZIzp8pL1t3KUT/NMNKJ+6lE27DV83LOEn15v
	 OWAiE2VEwQZWyJs1q+KQK2bmdi39jqJ8LdODdo3blmvBv6NFgMRQ521JFncVP12Jp97F3
	 aidQGM3uGKN+E4iaXNkQ84LaAacjwIeOfppq96XZHi3lLpWYNq/wf0G/ynAhQDWWGvBDe
	 SGNBNLsFqVQaTIU+xDsB07UVd8muTqRc4KaIOr5ivQSzS2Ry5RcOczA6UmZOTWVxqEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mentallysanemainliners.org;
	spf=pass smtp.mailfrom=mentallysanemainliners.org;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=RN0C6Ro7;
	arc=none smtp.remote-ip=34.202.193.197
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16771606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16771606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=RN0C6Ro7
DKIM-Signature: a=rsa-sha256; b=RN0C6Ro7mR3xUBlTXWHMW8JzTNvfK1fed5xacdf71IeJEJwD3NWiUDgYMAhQp03XnNzPUO8oIKZAE3DwICH3FqBFfIMReUZPT/8RlV/qw8UBDW+4p/6iu/cxDyMK/21KDinJKBDaXxUEnuRXbL2GJ/+pJ62PvN5j3+1am3bJJpyWnOSe7UsfUlGuEErYZE1gI2GIWP/9J9+nuC4PrwKgGO1UU0Cdoy1TjbCN/13uMwHsNfTwoauw+t4u1EQoxgZMYdH4l0IdFQ2kc+C0dL3rGcb3EvvMUq6lyN7gIne+5lSu5TDMAK5EpABZ3GfHW3KOk41jJKMu9AKT/SIdxqu4Pw==; s=purelymail2; d=purelymail.com; v=1; bh=Z5AUULqU4STKqrKUgodGKeg+HOQYh1gNqO/mS1n3Tic=; h=Feedback-ID:Received:Message-ID:Date:Subject:To:From;
Feedback-ID: 68229:10037:null:purelymail
X-Pm-Original-To: devicetree@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1592599783;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 25 Nov 2026 00:06:31 +0000 (UTC)
Message-ID: <9bc95b2c-9b63-4b2a-b692-287e9cbe7d67@mentallysanemainliners.org>
Date: Wed, 25 Nov 2026 00:06:27 +0000
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
Subject: Re: [PATCH v2 0/5] Add USB support to Exynos7885
To: David Virag <virag.david003@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <20261123092244.1792040-1-virag.david003@gmail.com>
Content-Language: en-US
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
In-Reply-To: <20261123092244.1792040-1-virag.david003@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 23/11/2026 09:22, David Virag wrote:
> This set of patches adds support for USB on the Exynos7885 SoC.
>   
> The Exynos7885 has a DWC3 compatible USB controller and an Exynos USB
> PHY that theoretically supports USB3 SuperSpeed, but is not implemented
> in any known device. The vendor kernel also stubs out USB3 functions, so
> we do not support it.
>
> This is a v2 of a previous set [1], which was split into a clk patchset
> I did submit back in 2024 and eventually it got applied, and this set,
> which I never ended up submitting until now.
>
> This version fixes some things noted by Krzysztof Kozlowski, and also
> contains a change made by Umer Uddin, as he recently tried to resubmit
> my old patches from github [2], fixing some things up, but missing the
> previous remarks.
>
> [1] https://lore.kernel.org/linux-samsung-soc/20240804215458.404085-1-virag.david003@gmail.com/
> [2] https://lore.kernel.org/linux-samsung-soc/20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org/
>
> Changes in v2:
> - Clk changes not included as they are already applied
> - Add Reviewed-by: tags where appropriate
> - Use samsung,exynos850-dwusb3 fallback compatible for dwusb3
> - Use unsigned long for set_ref_clk_rate
> - (from Umer Uddin:) Error-check clk_set_rate, and fail if returns an
>    error.
> - Keep dt nodes ordered by unit address.
>
> David Virag (5):
>    dt-bindings: phy: samsung,usb3-drd-phy: Add Exynos7885 support
>    dt-bindings: usb: samsung,exynos-dwc3: Add Exynos7885 support
>    phy: exynos5-usbdrd: support Exynos7885 USB PHY
>    arm64: dts: exynos: Enable USB in Exynos7885
>    arm64: dts: exynos: exynos7885-jackpotlte: Enable USB support
>
>   .../bindings/phy/samsung,usb3-drd-phy.yaml    |  2 ++
>   .../bindings/usb/samsung,exynos-dwc3.yaml     |  3 ++
>   .../boot/dts/exynos/exynos7885-jackpotlte.dts | 20 +++++++++++
>   arch/arm64/boot/dts/exynos/exynos7885.dtsi    | 36 +++++++++++++++++++
>   drivers/phy/samsung/phy-exynos5-usbdrd.c      | 26 ++++++++++++++
>   include/linux/soc/samsung/exynos-regs-pmu.h   |  3 ++
>   6 files changed, 90 insertions(+)
>
>
> base-commit: 5d7b9f865597a74b323d512619c42f3e07ae043a

Thank you for submitting the fixed work. All works on gta3xllte.


Tested-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>


Best regards,

Umer

