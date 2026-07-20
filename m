Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F25931195C;
	Mon, 20 Jul 2026 18:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784571948; cv=none; b=WvzC2N5eU+O9NLXCFvsGfJlJ3k7wtHCSJnnm+J2FK9T+gMfoHgDLWXJhZCcEMBtyJY2UIQh7GIAl8o/aKjCMqAQmD09Ndm69D4x4BIM+uQhYJPATqMM0PnP9Xid1GCkRnLr/vFHBNQSNEaO+8KO4gVTHcfe3RueYgN8AIXzMqf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784571948; c=relaxed/simple;
	bh=niU35OTsrPpxKpiEc6Ztk9/dR+IDdhiWa5+8cGO46cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tPeu/b54ac2yNPWyztauplqaTEhGmY3Mt31XFqeQLTuiKAyVXb+4+jBuHln3kSbK+5zolLIF8OKUF7bH+zUIwB0v1CkSV2eXb5/WJ0Z2U/jGrpFx2lraSs/Lt72Rc8lwSCxyyZk0NitUfDuQTXVIEjAG/+tWqGh0+V0BIVLJamU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A8DJaNg9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A8DJaNg9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A4C1F000E9;
	Mon, 20 Jul 2026 18:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784571946;
	bh=8dn3DGV/HSINz76pb6geCJZCEdVzeK4RpPwE7ezZEAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A8DJaNg9n7n/XnuT1qRB1HSjKGmHl/cuwxU+AP73mi43T6zAV+jWxIBO6MeEbJoD1
	 rgrDHpyw1XlYTOhtLJQUXjx1VcEvykk3ZHe51pp1oRnCX5aVs0He0PGfCnqKBI5J+a
	 V+Dn5tig2sGxY2dGOAOiakUBdpu8Vme6ZWO+kNXexhq3MSrqFWSiX2yz3j3WgIOU5C
	 ii6TXsDYuPA2rsrTI2qCudDYVBPJWM5RgUsp7erY3zw3QqZwX2jBQOzNFl1Vw+Kots
	 VHjdembM3EwboHD+giCGuS9FvuxrzC7Hg36Gi66W7cAsPuxD64hdo3cFLdkwgCV9H/
	 rfpT0UVWAUULA==
Date: Mon, 20 Jul 2026 11:25:45 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, MoeLeak <i@leak.moe>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH v2 1/5] riscv: dts: thead: th1520: remove pclk for I2C1
Message-ID: <al5oKdC22LIlLbSm@thelio>
References: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
 <20260714074515.1959352-2-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714074515.1959352-2-zhengxingda@iscas.ac.cn>

On Tue, Jul 14, 2026 at 03:45:11PM +0800, Icenowy Zheng wrote:
> The I2C1 node added previously to the th1520.dtsi file has two clocks
> set -- one "ref" clock (CLK_I2C1) and one "pclk" (CLK_PERI_APB_PCLK).
> 
> However, the CLK_I2C1 clock is just a clock gate with the
> CLK_PERI_APB_PCLK clock as its input. In addition, when it's gated,
> reading registers from the I2C controller returns fixed value (the last
> read value) for all registers. These facts indicate that the CLK_I2C1
> clock is the true APB clock fed into the I2C controller instead of a
> dedicated reference clock.
> 
> Leave only the CLK_I2C1 clock as the `clocks` property of the I2C1
> device node and remove `clock-names` property, which represents the I2C
> controller only takes a single clock both as the APB clock and the
> reference clock.
> 
> Fixes: 2f60e3516330 ("riscv: dts: thead: Add TH1520 I2C1 controller")
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index 94932c51b7e39..db23624696b73 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -415,8 +415,7 @@ i2c1: i2c@ffe7f24000 {
>  			compatible = "thead,th1520-i2c", "snps,designware-i2c";
>  			reg = <0xff 0xe7f24000 0x0 0x4000>;
>  			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&clk CLK_I2C1>, <&clk CLK_PERI_APB_PCLK>;
> -			clock-names = "ref", "pclk";
> +			clocks = <&clk CLK_I2C1>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
>  			status = "disabled";
> -- 
> 2.52.0

Reviewed-by: Drew Fustini <fustini@kernel.org>
