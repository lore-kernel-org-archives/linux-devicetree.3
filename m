Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AFB306741
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 08:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168133; cv=none; b=F/Tb5hgTxt2LyhNKvI/gunyip1u2O5Nf11p4SYbfz3BrHpoX85DqSAbUHWOQk4fZtYMPvRqUlMGhhwbyFxoa0CdvxEX9l6ubisq1FIIY/EA8EnDRBjyF7X02Xjm64n6FsQOnYkBl4JO6kWg7A45n0ltCtPOy5ueHmOAF4m2gwXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168133; c=relaxed/simple;
	bh=vegZTJ5stIURfgR2mKRHVprpsIn1kwMB4JrdDzxl6SY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPrOzwirLxqRKhNrweW/uefoX8fu+IfdqeQVl8ssBkM/6TQCLmvRMHX3D6//M9SJVWdlUr0Fm3ywjubq1IIBOoQb6xKRM4IaDWopI7eVazHIpn1ufxhCbShqdlWN7KHo/gb64Vy+iuvEEeQ6YHULALnygFyamYve5YsEuYjrzX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ud9Ei39l; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ud9Ei39l"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490abf12f0fso3623095e9.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 01:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781168130; x=1781772930; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RQRiBzPaWcJR9c/ch6vou1uNViVKhmg03M5U+EBTNzY=;
        b=ud9Ei39ls/70jtAx/FgfWa+uSLkyLwoUjdTZeQDAHQNozKfn7KjBSJUKy/hOIGWthL
         ktwr7+Kc12oQtHFDDnu928b2kc6btA3D0CST43SIsns6mj8ED89sKR0fjHMwOw3yKU9X
         2JhG2uISqNJR6qKpJSO6BKZt3EW4wSbJWIB6+D15/qerlIASEvx7qi6JSqi7yMSdftrE
         3kk0kJjE4vWW7oa6C2OUwFip3jnPxrqt8aBjQVAmUGXKV4j6l5GS++Eu7Vnb2DaJdAl9
         xyV+QEnt2/FttrpgUV4zV56Fx+VWkqYaWqyQ29VAtx0dXBLKL3wIJmEYRLAQRvjDQW4Q
         jIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168130; x=1781772930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQRiBzPaWcJR9c/ch6vou1uNViVKhmg03M5U+EBTNzY=;
        b=D/+m2Cq9pFEfgIRuS93J6uJj74yE6BM3LAl1Qz6AcprsOKB7zZPBw8LZmKtNbadS/C
         6x+U04DMBTOojxTZcJHJDRu/APeUhyrb+kP8+faLfnXmKM2vBMYoC7/C0QL5ZlGDw2BT
         6/jXQeyHkFQK2p5PS+oWECGwEi15t25/8ZBOfJs1RZLZwtTvBuG/jDTz3pnk2N+kMDNn
         8vSxphIBDlg6NVS7fvBvmd9BZd2VX52JfBr35UzlVKywLCE8kS20npJ3mlIkRrVA65oE
         Z89iKN3trgKNTrPYd1gv1o5XuUOcn4qV7LOXi/1Ctz4WhWGLJ00KkJaoPba03aERGiLF
         7jPA==
X-Forwarded-Encrypted: i=1; AFNElJ8U0k7/6FhyEjjRLQCxxVECDg3/QMqQBdARiD8oEktWE1TlKRVsxaXy8ikar6nT66hVIQs5zT7M+lU7@vger.kernel.org
X-Gm-Message-State: AOJu0YyU+SMIWRfGxUP5WDCQUAjHHQvzwzIOYufqxthswuCuDq6hwBET
	nr4qfFtME6moceXQlRi/8Z7/4tX+MAWsdqoQ22cL7AKmLhG3tNZPP2EG0hBvhv/q33Q=
X-Gm-Gg: Acq92OGeyuhxwLyIeNq7SDc4e6KhnBqG/AKWyTX5Ez30cD4nsOVdZmB5gRsGtxiIgAS
	tEsnKHim1N1EFOJpfNHQdjKsc50+W98Mgkpr3hjzDpJd8QFylawdaVodj/o7QwJl6SvzVQZYVZu
	uEgAqJbnDXDHgY7DU736Gp9R43WdBWHRZEs7xrNsO302e1Dlm1gocCWX+tZ4CZdeK8zJImVqiTh
	jfUht8bcoKVu6iPtC5Z8dw6KzdqWnB7h79jMrG/bDZhzKefLE1xurk9vrGhL8k2wry51O2uByZR
	cx1Ck6QkCMKkXK895FPqjb3z1w1aFDzFWZYAxqwQgTWE9htx8KXC12MKhXIBLR+hsGJoKFcudpH
	oJpPNVmi+sQJRuXuriLiT6F0ogQ89XRUuZiayJ28YGGPXTX8IOEG6X4r/WMsJX7VdoZFdG4AXa0
	pZVI+7mSfc48Ri+OKwjXihpZYZ0oZBBVMDBoiBva9QhbSKqA==
X-Received: by 2002:a05:600c:354b:b0:490:bbc1:c9be with SMTP id 5b1f17b1804b1-490e528451dmr17995005e9.0.1781168130047;
        Thu, 11 Jun 2026 01:55:30 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:7bb1:6476:9114:cf39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e2d09a85sm47321735e9.14.2026.06.11.01.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:55:29 -0700 (PDT)
Date: Thu, 11 Jun 2026 10:55:25 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	bjorn.andersson@oss.qualcomm.com, chris.lew@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add BAM-DMUX support
Message-ID: <aip3_fyE8tMtJZIW@linaro.org>
References: <20260611-qcom-shikra-dts-bam-dmux-v1-1-43d0b43d41ef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-qcom-shikra-dts-bam-dmux-v1-1-43d0b43d41ef@oss.qualcomm.com>

On Thu, Jun 11, 2026 at 02:11:59PM +0530, Vishnu Santhosh wrote:
> Add required nodes to enable the upstream BAM-DMUX WWAN driver on
> Qualcomm Shikra SoC.
> 
> The SMSM (Shared Memory State Machine) node provides the power
> control signaling between the AP and modem for BAM-DMUX. The
> BAM DMA controller node describes the A2 modem BAM hardware as a
> standard DMA controller. The BAM-DMUX node references the DMA
> channels and the pc/pc-ack interrupt lines from the modem SMSM
> entry for power control signaling.
> 
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

I'm quite surprised to see this 15+ years(?) old hardware block being
brought back to a new SoC. Is Shikra not using IPA?

> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 51 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..3e59d5f6323c0d857f376316faa26c503e67f6bc 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -17,6 +17,23 @@ / {
>  	#address-cells = <2>;
>  	#size-cells = <2>;
>  
> +	bam_dmux: bam-dmux {
> +		compatible = "qcom,bam-dmux";
> +
> +		interrupts-extended = <&modem_smsm 1 IRQ_TYPE_EDGE_BOTH>,
> +				      <&modem_smsm 11 IRQ_TYPE_EDGE_BOTH>;
> +		interrupt-names = "pc",
> +				  "pc-ack";
> +
> +		qcom,smem-states = <&apps_smsm 1>,
> +				   <&apps_smsm 11>;
> +		qcom,smem-state-names = "pc",
> +					"pc-ack";
> +
> +		dmas = <&bam_dmux_dma 4>, <&bam_dmux_dma 5>;
> +		dma-names = "tx", "rx";
> +	};

This should be a child node of the modem remoteproc. See msm8916.dtsi
for example.

> +
>  	clocks {
>  		xo_board: xo-board {
>  			compatible = "fixed-clock";
> @@ -314,6 +331,28 @@ lmcu_dtb_mem: lmcu-dtb@b4702000 {
>  		};
>  	};
>  
> +	smsm {
> +		compatible = "qcom,smsm";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		mboxes = <0>, <&apcs_glb 13>;
> +
> +		apps_smsm: apps@0 {
> +			reg = <0>;
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		modem_smsm: modem@1 {
> +			reg = <1>;
> +			interrupts = <GIC_SPI 69 IRQ_TYPE_EDGE_RISING 0>;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
>  	soc: soc@0 {
>  		compatible = "simple-bus";
>  
> @@ -640,6 +679,18 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
>  			};
>  		};
>  
> +		bam_dmux_dma: dma-controller@6044000 {
> +			compatible = "qcom,bam-v1.7.0";
> +			reg = <0x0 0x06044000 0x0 0x19000>;
> +			interrupts = <GIC_SPI 74 IRQ_TYPE_EDGE_RISING 0>;
> +			#dma-cells = <1>;
> +			qcom,ee = <0>;
> +
> +			num-channels = <6>;
> +			qcom,num-ees = <1>;
> +			qcom,powered-remotely;
> +		};
> +
>  		sram@c11e000 {
>  			compatible = "qcom,shikra-imem", "mmio-sram";
>  			reg = <0x0 0x0c11e000 0x0 0x1000>;
> 
> ---
> base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
> change-id: 20260603-qcom-shikra-dts-bam-dmux-7fdcbb6fb662
> prerequisite-message-id: <20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com>
> prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
> prerequisite-patch-id: 2acc300a68ed8c5364fb5f2f7d28fc0d56ab07bf
> prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
> prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
> prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8
> 

If the DT isn't merged yet, you can also just squash that into the
existing series that adds the modem remoteproc.

Thanks,
Stephan
