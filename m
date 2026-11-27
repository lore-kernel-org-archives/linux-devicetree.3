Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778754;
	b=JG5HwSCpyyIVveEeDrcj8lmIDJfrowRFhUkKgqCkPcT/JrwrFrrnO9J2ZeS6gy9WJJLi
	 EN/QteEBPU391ZsQPkMvKMNN5AGpncVPFAveJ6sRMuCXzGWMOffWDKaVtW+Z4zeaxqCrw
	 icjPQcbf2RfWwXuLB3dbJBuhatWRgL/QtHSeMc+lWyfxK8vnlf3rZKpZYZ66h9ZGFNSwk
	 PX7IHQBn9Tvu2E7Cma2BJQ2uE5HAxICYWLYHyFgXWYiti+gWPs19817jYn/W/JMChX616
	 ygH+pejDH8MdTrrkOz8KykKL2oDHDU7xTF+/CxIwDjb+E31ghFe3KugLd1TM8uxmeWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778754;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Spam;
	bh=Tq0ifLki8+R9Z04IQ4T3mpI+vFaFEsTYZ5lfIwIDl9U=;
	b=2CD0xJu5/4ismdDKHpdn8S30D+Yh1Wx38uT2++iYUzpPAaIWNq/x5ZRPswmiOaT3DdZd
	 BVXKKGjqpa9csVnlFGB9kNcAANkcYAlgAHKwbVC4B9H9AkEuSPeBWBYJFoVryMBZUYSKL
	 fEizXDy6Yr0jsKpxTu3Uzs6qDOc1a7pCKg5nmCMGutVtWPfc2nDAl2sJ2Kh/t1rnKOOhv
	 FTSrHfOklwZPhBE/pus6MgoiRSUnpkU5Gchhc84dm9Yj2B8JCGX8YSF7Y3V38fFayuZEH
	 6X7+hltwxhih7SJXsaqAza7+1ktxfk7uUMgDjjD7JpInIv5P/6vOSJsg1BnBrqFy5YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=TszemNo5;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFB760A2621;
	Fri, 27 Nov 2026 11:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EFB760A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=TszemNo5
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 8ED284C98E;
	Fri, 27 Nov 2026 22:25:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795778748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tq0ifLki8+R9Z04IQ4T3mpI+vFaFEsTYZ5lfIwIDl9U=;
	b=TszemNo5XRM/GENxcM2oStN3IQMo3fkK4X7MEOuK8S/96WQbTf63x6MDAHsEEGU3YFQjEI
	vEtvWmzcE96yh1AMhoQZlSxpNcg2DoEltjgwROEBS3SrB09naNS5hauF7ZUX6PS/MQ528k
	vik839UckYv2qKm2zp7OMuuOyjAuPdNhnSi9oaxIX2jiPHL8rjgpLF9dtVYudOOUcmbb+c
	qZ0kSGyLDeHg0TJKAnRvf0Vy0Bxf92GUHrxoog8l8oIx3AQB2d+C1ilWOy5z1nVL99+/qL
	1sH3fIU2tXZoZpupmaI6X7Vfhl/Tb3KtM9ANEYlgCqbrTPJtRUUGQuJDl/4sOA==
From: Alastair D'Silva <alastair@d-silva.org>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Alastair D'Silva <alastair@d-silva.org>
Subject: Re: [PATCH RESEND v3 3/3] arm64: dts: allwinner: a523: drop the PA GPIO interrupt
Date: Fri, 27 Nov 2026 22:25:48 +1100
Message-ID: <20261127112548.2584246-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124215048.42074-4-pmazzini@gmail.com>
References: <20261124215048.42074-1-pmazzini@gmail.com> <20261124215048.42074-4-pmazzini@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes

On Tue, 24 Nov 2026 21:50:48 +0000, Pablo Mazzini <pmazzini@gmail.com> wrote:
> The PA IRQ bank is not implemented, and the driver now numbers the IRQ
> banks from PB. Drop its interrupt.
>
> This reverts commit 6b81aa0c8a4f ("arm64: dts: allwinner: a523: Add
> missing GPIO interrupt").
>
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> index 85ef492ffeae..fc4d714a96ea 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -129,8 +129,7 @@ gpu: gpu@1800000 {
>  		pio: pinctrl@2000000 {
>  			compatible = "allwinner,sun55i-a523-pinctrl";
>  			reg = <0x2000000 0x800>;
> -			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
> +			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
> -- 
> 2.52.1
>

Reviewed-by: Alastair D'Silva <alastair@d-silva.org>
