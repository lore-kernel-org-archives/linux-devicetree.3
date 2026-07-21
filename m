Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC23D4DB54B;
	Tue, 21 Jul 2026 15:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784647335; cv=none; b=QtEt5j40gxpfRGxtqkJJytS5gt2wRbYIdM3z0/Yj6tqDaPYYRQ0KkyV6upHXJXeCs4nX8MqD7VeERgMDzF7mikHKq/GJ5nQxY4rVyJ5yC8VwcfrzF2pbk3kAnPDzU7JQoog3KiOejePQy6ULqDUil9oMrpo+B7wOrv3q2ba1xOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784647335; c=relaxed/simple;
	bh=3yd5wfzQJYA73zzDRI/tkKqSuzeMSFrzs8ehDN3AQIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lWxFaRcqwPvfubiscd3iIqrl+ccSXW7NW2YU3inTIL6/jjrDoTq7/n/e2/4Jpoo6FtZrxP6qpVe/eJ5JcvTYCwrXonkBunBumqQbarYEOV3r/lyBIYO+Xi7G/WNDrdvvRptiQnt1BvLK7T55rjZYA16D7SMDTdViJOt7K2510E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JrMrcNba; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JrMrcNba"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17C831F00A3A;
	Tue, 21 Jul 2026 15:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784647333;
	bh=nJaHaVr5BzHYmizk1MTJgPasJCK/9PeAKRnc6vBntIM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=JrMrcNbaHRzHmU8sIs1PTd+NrJ93S/7WCSKEmLc9WD5Sd5rkFklMIfk30aGC0VSbb
	 5GUal3m8WVSsf7792xao8P4aIJCm36N2hXpVGyYwE/mthPCrjELPHTJCJITNG4L7tg
	 n/FAaB4Mg3GN977PrNbWgFkW26gTiFg9bmocvCJgD2sVx9IdaRCjECOJyLM3fgkn0D
	 qs0+udhIwcXYP6JDxgjI/rbcd9qY7NSUz67pvTU6+yvXsDQfliAvzmZrlOXKNnFQ0n
	 V7aPfqF5a+pI2lIU6GNpzhYy2dYSsQQABWtutH/iWfJG5lulW0pAVBgj9KeQTvNUqA
	 S58DQB7qeCk1g==
Message-ID: <d92b7e28-4847-4976-968c-75b938740f0e@kernel.org>
Date: Tue, 21 Jul 2026 17:22:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: add Xiaomi Pad 6S Pro
 (sheng)
To: code_0002@163.com, andersson@kernel.org
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 map220v <map220v300@gmail.com>, code002-2 <hiez832670@gmail.com>
References: <20260721142147.1618-1-code_0002@163.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260721142147.1618-1-code_0002@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/07/2026 16:21, code_0002@163.com wrote:
> From: map220v <map220v300@gmail.com>
> 
> Add device tree for Xiaomi Pad 6S Pro (sheng) based on SM8550.
> 
> Signed-off-by: code002-2 <hiez832670@gmail.com>

We do not allow anonynomus contributions.

Please read carefully submitting patches document.

> ---
>  arch/arm64/boot/dts/qcom/Makefile             |    1 +
>  .../boot/dts/qcom/sm8550-xiaomi-sheng.dts     | 1788 +++++++++++++++++
>  2 files changed, 1789 insertions(+)
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
> index 000000000..170a67b37
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8550-xiaomi-sheng.dts
> @@ -0,0 +1,1788 @@
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
> +/*
> + * Free unused regions, these regions don't exist in downstream
> + * dts, and they aren't removed from DDR Memory Map by UEFI.
> + */
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
> +/* Xiaomi uses alternative gpio's for i2c8 */
> +/delete-node/ &qup_i2c8_data_clk;
> +
> +/* Xiaomi change for Nanosic WN803x */
> +/delete-node/ &qup_i2c9_data_clk;
> +
> +/* SM8550P doesn't have Modem DSP */
> +/delete-node/ &mpss_dsm_mem;
> +/delete-node/ &mpss_mem;
> +/delete-node/ &q6_mpss_dtb_mem;
> +/delete-node/ &remoteproc_mpss;
> +
> +/ {
> +	model = "Xiaomi Pad 6S Pro 12.4";
> +	compatible = "xiaomi,sheng", "qcom,sm8550";

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check W=1` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).
Maybe you need to update your dtschema and yamllint. Don't rely on
distro packages for dtschema and be sure you are using the latest
released dtschema.

> +	chassis-type = "tablet";
> +	qcom,msm-id = <536 0x20000>; /* SM8550P v2.0 */

NAK, not allowed.

And if you tested this, toolset would tell you that.

Best regards,
Krzysztof
