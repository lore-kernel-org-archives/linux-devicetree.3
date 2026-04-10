Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9A173463;
	Fri, 10 Apr 2026 16:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775839097; cv=none; b=pjpuKvLRRj3E5xovM3gRCPoqP9FOFOv6pnNzfPrS63VSbcw8ciB9GGviZDOdCWvRz+y6sQuahutnHR3heB09MD+0qvxoGhLyBtydrPz2+KynVjY6ZV3mN6JXcA29VplwtH1G9pZl/HaMsmjf+HWvXOfoGVmyhyMVDZYPYrOh2Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775839097; c=relaxed/simple;
	bh=p+DmL+MjgnlwOS7U7TCoDsMNoz75sB3yscpSLOBV3MM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oZvd0Rop3fQQtQob1af2bkvKh4xTfAFuef6eNQtYUV65lAkM2slhoGljJC2+FLJPUKC/GI4FJWnSN+ipVM7bbnFPwIFm/b4dX4iQ7l/Na4bytDTwoeqJpQUpWF8MpjH0gcKUJZO/M7x2X65zlDIXTV0Ylk8sV1AxXWd49/kzYK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TxUep6ws; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TxUep6ws"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B61FC19421;
	Fri, 10 Apr 2026 16:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775839097;
	bh=p+DmL+MjgnlwOS7U7TCoDsMNoz75sB3yscpSLOBV3MM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TxUep6wso/6NWn5G0w2mnYkhpIo+ACtLXQ1rTG9Li8yjPeO1nhCdDxboOd54fZEv4
	 OZ2H2K3xeas/3Xksd9/zy0S1QyQGyZo0hyYWLgjGAv2yhvdV2izvV5YzistSM/r7H+
	 78G/KnF9S2tpNJCuMvhZ1gjWTrVhqkTxJigvTXZSAVaONlKEhyX/QPyr6QrcOVzR23
	 p4p/9WVKniKO+ugBZxQJGh0d6FzI8WRezj8A/8KW2ZG65bAHMK24Hy6C1c7j2OtLT0
	 DQv5rotpJ7NB9mDNdvC1thr+b2PRf7haMsDk4F4DtDKZ4iSZisQxHMdyDKZMNcyWbc
	 QRgK1MXiy2UBQ==
Date: Fri, 10 Apr 2026 22:08:09 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco: Add default GIC address cells
Message-ID: <lf6lnxfmivhluiuoneckl2eipv4dkfphc56tn5w3a4pykb2toq@ykesarjnhh3r>
References: <20260407201518.24949-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260407201518.24949-2-krzysztof.kozlowski@oss.qualcomm.com>

On Tue, Apr 07, 2026 at 10:15:19PM +0200, Krzysztof Kozlowski wrote:
> Add missing address-cells 0 to GIC interrupt node to silence W=1
> warning:
> 
>   monaco.dtsi:2326.4-2329.30: Warning (interrupt_map): /soc@0/pci@1c00000:interrupt-map:
>     Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
> 
> Value '0' is correct because:
> 1. GIC interrupt controller does not have children,
> 2. interrupt-map property (in PCI node) consists of five components and
>    the fourth component 'parent unit address', which size is defined by
>    '#address-cells' of the node pointed to by the interrupt-parent
>    component, is not used (=0).
> 
> Fixes: 46a7c01e7e9d ("arm64: dts: qcom: qcs8300: enable pcie0")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> 
> ---
> 
> Fix for v7.0-rcX.
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index 7b1d57460f1e..5f060b24d52e 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -7380,6 +7380,7 @@ intc: interrupt-controller@17a00000 {
>  			interrupt-controller;
>  			#redistributor-regions = <1>;
>  			redistributor-stride = <0x0 0x20000>;
> +			#address-cells = <0>;
>  		};
>  
>  		watchdog@17c10000 {
> -- 
> 2.51.0
> 

-- 
மணிவண்ணன் சதாசிவம்
