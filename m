Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADD44B5CAB
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 14:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445487; cv=none; b=TS18QhcPKAGb4UhBue+BBRVN7TShJlC0YmXE7Qn9FXCAF+jVfqI+I2HtVOJI2m3jqxTcnxerLa19JW10MUOOZ71y2ixMokEGGb6TSvd+SortVN9jeWtTqcniclBSHfK+AhrCYbwdqW4Tm9caJgyzOIBuqQ9YGPwbcEAixr1mBUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445487; c=relaxed/simple;
	bh=f9MUvFZMACMIOkVZHxSlrtajpzL/cuxELYuqS2JN+pA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XRvUgTOZNTEJ8U39NdyhaF77z9So8TJwvyu4tBO5wBh1+ahKr1ht/5YPbFCYW2852TMoQqnMAIIs50ZhfXcqprlLm/SIccGnZjdHqO+cahqg2QR1z0P8ZcIS97SM4mhS1Bsoq8/Qn7ExbBcqQdbjjPXrancdNF/mB7xg02ygS4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=P0P6DQvH; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="P0P6DQvH"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-484374f54d0so1523682f8f.3
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 07:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788445471; x=1789050271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=94IZdoKFOFB8Yp+Vrvaxxz4fkqe/10RPOdJvdOjnq08=;
        b=P0P6DQvH0WvU7rbQ8GXnQuzfs/h+qr/4z09DzZg08Sq04SINAAr4m5vS8cW+7wF0WI
         kF3poomXRbjl5s0QznHzfHL1bqvXcdWUicTPhWt9UpllBfYYapI9IrDFgxmXGU+sAY7p
         zrAoee6GvPyxWmsQUlT9RcSTzkaeEOnMi0L+N2cG2T320jCroLqH9BMCF9GqonHpYsnH
         Lra293+GxfP3Szitx1mzu3KEXxAUrd1GX/BumaWei2EWaXc7NV2xTVl9yF8vuUCKB0Yk
         1JgiuwoxMfkDtwHMjDzg2BPMsHyWmJc9R66j43Sl1CAxC4KXAb0lWxnG+JnhGVhS91Nd
         xMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788445471; x=1789050271;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=94IZdoKFOFB8Yp+Vrvaxxz4fkqe/10RPOdJvdOjnq08=;
        b=fbHp+MKwQjwClszqkkvWLrF30c0hERX3OQfFaNI6VQA92mHJHBEO95BzoekggxdmNV
         YaqFi14mbXBFDoGf6U1t9PbBav5jeNd86tJ4pBj4JumqpUzhG4Q2KYor1LpmLy/Fstdk
         /n0pB8sVlZ7T/DTzMmUGYCp+nv6gyvymynnvMgcnrBoMk3PduX6JxznAYSmnGtiqAjha
         klPF7Tq64TOoC0B3qtdKYYifyIhp3vm8oUSWP/NTd/gIsGomdixtvFMOZ6UyIoCUXUJl
         /W3B7OarEunFMANhdrqEcSdE6G8kO8xgOPL6Z2yiALCtsznf1VQ0T6ijdDIipk02N969
         /NpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxs+Gr3Fl5fkh4XzCFb5zS9ZevrNmCWVSck+GzWIVZliTr/nY9wwD9RXmQpSVHftVBHY/YUxjSBtCY6@vger.kernel.org
X-Gm-Message-State: AFuF++lenQb+ydCIdwxG52pszacwuvcXuA1MFslymBcUfM3VSsCKlzhN
	PLJGbkQhcRi7i2+NhgRP0kzISbMeJG0QlqFIRN8HmjTp29EejrWCXCFEgn0Efnc6KZQ=
X-Gm-Gg: AYBFou2D8z+oPfp0Car1k7i0UHw8jtn4iPedCz0K5ghQ7WTPnJWti9BWenH0YQSs/ux
	c2Dp4yVUVqWulrPlh2eo/JvDM0J0U7NqSmOkni3VN88/A3J/qXlVe0yPp/G/S09SqO1gpZJZUj5
	xdiMGUq2wU4CRbCz4m7sJsH+1B2LcCWsPFZBPvUJBRRHrZxBqbUp++4hIBz4peCTL0XRuKpBkH4
	5dByyVXxe1WHipJQH8AfJC7qo0YAe4Y80lTrA0j61OKpKbwspP2WRKXNAfub0Jf2YiXRTxmnFEa
	N6DCXl18pCYkP3S7CdGzD1uespFDxQizhlxhHtsNclraFL4vEWtSzYGmpURzZU+uJi0zmDbZ/7x
	QAkv55VrgeFhipHlGyvnxOCPkaLg/51QoAFdwseCWgOMpXLdIBfjTEpdNqwlnRwmgn6y9mXneSF
	4cUZSqp49UN+8FTNMsAak/StdUPGN+VV7Rg4ZvsCTUMG4pmMULZZe/GTJkpeBxmxroBDg+
X-Received: by 2002:a5d:5e87:0:b0:485:8101:dc40 with SMTP id ffacd0b85a97d-4858101dd2amr5715406f8f.9.1788445466583;
        Thu, 03 Sep 2026 07:24:26 -0700 (PDT)
Received: from localhost ([194.183.24.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed3706sm14464261f8f.18.2026.09.03.07.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:24:26 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 3 Sep 2026 16:28:04 +0200
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Andrea della Porta <andrea.porta@suse.com>
Subject: Re: [PATCH 1/3] arm64: dts: broadcom: bcm2712: add arm PMU
Message-ID: <apmD9OrMiGRiU5Yg@apocalypse>
References: <20260802145109.728793-1-pbrobinson@gmail.com>
 <20260802145109.728793-2-pbrobinson@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802145109.728793-2-pbrobinson@gmail.com>

Hi Peter,

On 15:50 Sun 02 Aug     , Peter Robinson wrote:
> The bcm2712 SoC in the Raspberry Pi 5 has a standard
> arm performance management unit that aligns with the
> Cortex-A76 cores that are in the SoC so add the details
> in so it can be used.
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com
> ---
>  arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> index 9b36ecd7bba54..ae1fc9d728c00 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> @@ -10,6 +10,15 @@ / {
>  
>  	interrupt-parent = <&gicv2>;
>  
> +	arm-pmu {
> +		compatible = "arm,cortex-a76-pmu";
> +		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
> +	};
> +
>  	clocks {
>  		/* The oscillator is the root of the clock tree. */
>  		clk_osc: clk-osc {
> -- 
> 2.55.0
>

Tested-by: Andrea della Porta <andrea.porta@suse.com> 
Reviewed-by: Andrea della Porta <andrea.porta@suse.com> 
