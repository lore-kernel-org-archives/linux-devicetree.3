Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8812346D561;
	Tue, 21 Jul 2026 15:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784648823; cv=none; b=YqhBTyXgnyccOtPI/sMnyUDOIXw3vYVOHa2KQoZ9VAAhS4JyRQysh2ZrhZA07DvCYbtfGJ+zDxC/EffSeWYf+RrKtjI5NRsjd2MrncuGs3AiXJQoChmG+XlmrmW2x3VB/nmpWj7ZQ96UjzlNv1DXNLWrS09L87EYWiHZVMNiuGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784648823; c=relaxed/simple;
	bh=s7wilbjUubJkEgBoShqLu6uKMWWtv6AFUbfsmLhsqs4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M66mbHFCgbFIbYv8ZujViysloPpyXzrsLs4fXEtRUBYImzRPm3GMFHQqNhkzKIo+0cO7LarFlN82rFBzYVogj2ga6NTfCZ4xT5LdKW4H6BnnqnwSI2GGIDk1ek7hQR8fIj7ISLcgj41i8hR5zEBWwFH/cKMESk7C/QqkXu3dUUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lyPKbPT4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lyPKbPT4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6123E1F00A3A;
	Tue, 21 Jul 2026 15:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784648822;
	bh=dOdkwEF0Jr//yAZhXQ9kOxYbUp3VHLV82EiaKduxk6o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lyPKbPT489X8goL6QtGrryGh9hp3uvqibBgae6XcdlotZZAcaEeZ01RfKugcm0v/A
	 uAEHstc4r7FS3kR2LzkZTWaRPVC0ZGebeynSQyKVR6Lu1XyvO6SeGu2OFCKe1xIX9F
	 kLCDLBpNm3iZJsoL0z5K4zRgaeA/Xwijz0qu805QpcMcEWdUxC9e1DcqT/rHF3EjOK
	 XDNG61DfSEGrvyBlyRfG4EpjZPIGE2jwJdtzjX5+Z+wogQ1PxxzaeNbwG9PKkLYZzT
	 aYWAqhLISp4ZR34a4FeEedB++T41Hf8cVA7l/Zg8sqJrswTUZCnxuTo3jNZ+w+Nfza
	 G7vZfNVuE88bA==
Message-ID: <77d6127f-9f15-43d3-802f-c265c3062f11@kernel.org>
Date: Tue, 21 Jul 2026 17:46:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] arm64: dts: qcom: sm8550: add Xiaomi Pad 6S Pro
 (sheng)
To: Tianyuan Jiang <code_0002@163.com>, konrad.dybcio@oss.qualcomm.com,
 andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianyuan Jiang <hiez832670@gmail.com>
References: <20260721142147.1618-1-code_0002@163.com>
 <20260721153444.423-1-code_0002@163.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260721153444.423-1-code_0002@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/07/2026 17:34, Tianyuan Jiang wrote:
> From: Tianyuan Jiang <hiez832670@gmail.com>
> 
> Add device tree for Xiaomi Pad 6S Pro (sheng) based on SM8550.
> 
> Signed-off-by: Tianyuan Jiang <code_0002@163.com>
> 
> ---
> v6: address Sashiko AI review on v4

What is happening here? v2 was sent 1 hour ago and immediately this?

AGAIN, read submitting patches.

> - Fix cs35l43 reset-gpios polarity: use GPIO_ACTIVE_LOW
> - Add "kinetic,ktz8866" fallback compatible for backlight
> - Add map220v Signed-off-by (DCO chain fix)
> - Add assigned-clocks alongside assigned-clock-parents in mdss_dsi1
> 
> v5: address additional Sashiko AI review on v3/v4
> - Add assigned-clocks alongside assigned-clock-parents in mdss_dsi1
> - Actually remove output-high from i2s1_default pinctrl (missed in v3)
> 
> v4: address Sashiko AI review comments
> - Add GPIO_OPEN_DRAIN to shared cs35l43 reset-gpios to avoid -EBUSY
> - Set Bluetooth local-bd-address to [ 00 00 00 00 00 00 ]
> 
> v3: address review comments from Konrad Dybcio
> - SM8550P has no modem; confirmed on device (dmesg shows no mpss)
> - Rename fingerprint_fpc -> fingerprint-reader, use interrupts-extended
> - pmic-glink compatibles: one per line
> - Sort DAI link subnodes alphabetically (codec before cpu)
> - Reorder root-level nodes by name
> - Place pinctrl-n properties before pinctrl-names
> - Remove msm-id, board-id, Xiaomi-specific comments
> - Remove output-low/output-high from TLMM pinctrl
> - Remove udmabuf bootargs (confirmed not in use on device)
> - Add "xiaomi-" prefix to firmware paths
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |    1 +
>  .../boot/dts/qcom/sm8550-xiaomi-sheng.dts     | 1761 +++++++++++++++++
>  2 files changed, 1762 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8550-xiaomi-sheng.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6f33c4e2f..d8e485521 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -386,6 +386,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-samsung-q5q.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-sony-xperia-yodo-pdx234.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-xiaomi-sheng.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-ayaneo-pocket-s2.dtb
>  
>  sm8650-hdk-display-card-dtbs	:= sm8650-hdk.dtb sm8650-hdk-display-card.dtbo
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-xiaomi-sheng.dts b/arch/arm64/boot/dts/qcom/sm8550-xiaomi-sheng.dts
> new file mode 100644
> index 000000000..fa24b1c1b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8550-xiaomi-sheng.dts
> @@ -0,0 +1,1761 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024, map220v <map220v300@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/arm/qcom,ids.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include "sm8550.dtsi"
> +#include "pm8010.dtsi"
> +#include "pm8550.dtsi"
> +#include "pm8550b.dtsi"
> +#define PMK8550VE_SID 5
> +#include "pm8550ve.dtsi"
> +#include "pm8550vs.dtsi"
> +#include "pmk8550.dtsi"
> +
> +/delete-node/ &rmtfs_mem;
> +/delete-node/ &adspslpi_mem;
> +/delete-node/ &xbl_dt_log_merged_mem;
> +/delete-node/ &hwfence_shbuf;
> +
> +/* Free unused regions */
> +/delete-node/ &hyp_tags_reserved_mem;
> +/delete-node/ &cdsp_secure_heap_mem;
> +/delete-node/ &trust_ui_vm_mem;
> +/delete-node/ &trust_ui_vm_dump;
> +/delete-node/ &trust_ui_vm_qrtr;
> +/delete-node/ &trust_ui_vm_vblk0_ring;
> +/delete-node/ &trust_ui_vm_vblk1_ring;
> +/delete-node/ &trust_ui_vm_swiotlb;
> +/delete-node/ &oem_vm_vblk0_ring;
> +/delete-node/ &oem_vm_swiotlb;
> +/delete-node/ &oem_vm_mem;
> +/delete-node/ &hyp_ext_tags_mem;
> +/delete-node/ &hyp_ext_reserved_mem;
> +
> +/delete-node/ &qup_i2c8_data_clk;
> +
> +/delete-node/ &qup_i2c9_data_clk;
> +
> +/delete-node/ &mpss_dsm_mem;
> +/delete-node/ &mpss_mem;
> +/delete-node/ &q6_mpss_dtb_mem;
> +/delete-node/ &remoteproc_mpss;
> +
> +/ {
> +	model = "Xiaomi Pad 6S Pro 12.4";
> +	compatible = "xiaomi,sheng", "qcom,sm8550";

So you keep ignoring the problem and keep ignoring review. Not
responding, not fixing anything.

NAK

Best regards,
Krzysztof
