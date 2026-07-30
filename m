Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BB33644CB
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 01:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785375949; cv=none; b=SFNBMQ86Er1UB3+Nfx7XC6pRsPaBXDBo7NaSIxkh08fCzq5arnRTTJFwhId3BaMWSFiVgcHm2HP7/4cfDYY6zmIEPpyiiswDqCn8TMjQxn55Md+JNtscVa1ycxtCjbh02nT6bEx/W1fvsiuA7OGdBI/FgZilkV0oVlPnQbVqHfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785375949; c=relaxed/simple;
	bh=4gmF7oY73v9xrZWWlnqdTzjuCT/y/ai8tlElEr8kbWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PtVhM+Nkj1PBzQgluBpiBKLIZIRSQQhM3VMDZNazB3Cn1Z5Z9VAiDglyr4rV86WOEQlxIBIpdd3pM2QTO8AY3633y/bKFgK7tNP67XDk9a3myWeaFtuYstlwmOotar5JG3XHqZ4wYOYBiLqT+5LHdJz4fqAOzbA+prNjIVeR6tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=N82fSqKj; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="N82fSqKj"
Message-ID: <7eae2da9-1d4d-4ed2-85ba-4ec5d389b0df@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1785375941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cRm7IwbGu3q8YeM4ynSjKG7wM9FJVcKfVdgP9PpsbsE=;
	b=N82fSqKj92njEtLA5uu1ppPmK6o0ZTu1V4rKdOnIqtEzgq6moueP0NSzCicAU4iPnJ6sCQ
	Iha3hZtPnZciiabpAGzOYQ55dIDOm67TThpJZ++L99TtEdCFJZDViZm4RHOi1EApd2cWex
	nroTGdnWNqMkpUXJfVyw2XtzSiWvZJvS0JABcb7hNvhRoxO7aVj4TCs2dDRhO+wq/nFHOw
	vj9R6wCaBlN6wCnoc9QTJdyz48JEMXm7ljHH1lhjFEnmN0c1HTEt+RjnR5FJEFyBLoLmVz
	GtFnmtUZYLZ7lRuYHhEgNBJpv1z5W31PuiHs68UO8E7pMdLA7ngp018clpMK0A==
Date: Wed, 29 Jul 2026 22:45:34 -0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: Add support for Acer Swift Go
 Pro AI (SFA14-11)
To: Kaipeng Zeng <kaipeng94@gmail.com>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, konradybcio@kernel.org, andersson@kernel.org
References: <20260729064538.19564-1-kaipeng94@gmail.com>
 <20260729064538.19564-3-kaipeng94@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260729064538.19564-3-kaipeng94@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 7/29/26 3:45 AM, Kaipeng Zeng wrote:
> Introduce device tree for the Acer Swift Go Pro AI (SFA14-11).

Are you sure it's called that?

I think GoPro (the action camera company) would not have been very happy 
with that branding :D

https://duckduckgo.com/?q=Acer+Swift+Go+Pro+AI+(SFA14-11)

It's only been called that (with the "Pro") on the ubuntu forum and 
such, all the other pages refer to it as "Acer Swift Go 14 AI", no "Pro".

> It is a laptop based on the Qualcomm Snapdragon X Elite (X1E78100) SoC.
> This device tree implementation references nodes from the x1-crd.dtsi.
nit: "to reference" has a technical meaning here (with the & references 
and all that) so it's rather confusing to say "this is based on x1-crd" 
like that.
> Supported features:
>
>   - Internal display & Brightness control
>   - Keyboard & Touchpad
>   - USB Type-C, Type-A
>   - Wi-Fi & Bluetooth
>   - ADSP & CDSP
>   - Adreno X1-85 GPU
>   - HDMI & USB Type-C display
>   - Webcam
CAMSS itself has not landed in -next yet :)
> Signed-off-by: Kaipeng Zeng <kaipeng94@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile             |    1 +
>   .../boot/dts/qcom/x1e78100-acer-sfa14-11.dts  | 1483 +++++++++++++++++
>   2 files changed, 1484 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index e05414290d8e..fbb6b0ef67bf 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -422,6 +422,7 @@ talos-evk-lvds-auo,g133han01-dtbs	:= \
>   dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
>   x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
>   dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= x1e78100-acer-sfa14-11.dtb
Please add an EL2 line as well like all the other dtbs here.
>   x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
>   dtb-$(CONFIG_ARCH_QCOM)	+= x1e78100-lenovo-thinkpad-t14s.dtb x1e78100-lenovo-thinkpad-t14s-el2.dtb
>   x1e78100-lenovo-thinkpad-t14s-oled-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s-oled.dtb x1-el2.dtbo
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts b/arch/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts
> new file mode 100644
> [..]
> +		wcd-playback-dai-link {
> +			link-name = "WCD Playback";
> +
> +			codec {
> +				sound-dai = <&wcd938x 0>, <&swr1 0>, <&lpass_rxmacro 0>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +		wsa-dai-link {
Missing newline
> +			link-name = "WSA Playback";
> [..]


Thanks,
~val

