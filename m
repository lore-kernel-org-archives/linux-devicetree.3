Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A870B3CC323;
	Fri,  7 Aug 2026 05:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786082174; cv=none; b=q29L17T58RejRLnRDTvZQz4eBdoY/uuEERrOMXpGc6SlDhuONb78iTHN7WwFRgOGnfVCcPa/hQpKM9lq4o2h2toKI0sDDlwyWRXfjumZ4MuxWj9r22fiySIPYYNY/KyAKrHK7iqcfITJeIvwVVhnLd4n5PNdhGh7YuQw0wnTOm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786082174; c=relaxed/simple;
	bh=LLO0AdZ0ovztFCnz+ZwHKqX8dG3RKuq2WBfgZXurLnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LTA7cC+oTxJDbt2JXVFkMuVVC1jgIfp3ackh43dRlyHgteMyBl+Q/um5+VKycxj9VOJhRXdHono2bctwC3tPsn/7wkIBNFyke9/wYJK+1UAxQ2aWuWcrE8F5vI7S0S5WKQkIJIUbvsaCPks7QJmYZsrvlgPMlqGyPr11cxzImtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cAGjj7rN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cAGjj7rN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 837C91F000E9;
	Fri,  7 Aug 2026 05:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786082173;
	bh=k19OFrvyg5UiLtCz3AyfZzGuAB3TGsOXj5atTGRDZXI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=cAGjj7rNvdbhhYF0sp2/zr7I3abQgSpUvKNmUsGJp95xVU0pl3vk3Qk7InrpNPqQt
	 0uJFRIncQjD+zcI2IiUziJHktPMPRI81+USIyrj6mO+76YiU9MAWbJbiPxYkmxg9xl
	 Rw4PV5DEheykOcXVqX3eus7d9o5gAR+Tb+2MRHb3sWGkMSm/e3Z1CgSprT+xUUuJsR
	 vSUBoVxhy+9AjQ6E1V22gOxHsNKPWooN3ybRIk94k8agHiCm0EDENA0McpQ3skuEzN
	 8pj9equcwwAG93r8umm+lOFwhVYUQGknEoLj6IWlzk8Op2YoVu3Z5sBjCOrupvauc+
	 8/O+bYJdUaMng==
Message-ID: <56cff854-425e-401f-93a8-e700e8c1cfdf@kernel.org>
Date: Fri, 7 Aug 2026 07:56:09 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: add Nokia Lumia 920
To: SuperHacker UEFI <zhuoshizhang@hotmail.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "andersson@kernel.org" <andersson@kernel.org>,
 "konrad.dybcio@linaro.org" <konrad.dybcio@linaro.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>
References: <OS7P301MB178480466383761525E3887CCFD32@OS7P301MB1784.JPNP301.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <OS7P301MB178480466383761525E3887CCFD32@OS7P301MB1784.JPNP301.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/08/2026 14:50, SuperHacker UEFI wrote:
> From 7580a1d391863c24750dab4900249dcfb9fc1626 Mon Sep 17 00:00:00 2001
> From: UEFI-code <zhuoshizhang@hotmail.com>
> Date: Wed, 5 Aug 2026 20:32:40 +0900
> Subject: [PATCH] ARM: dts: qcom: add Nokia Lumia 920
> 
> Add basic Device Tree support for the Nokia Lumia 920.
> 
> Currently tested:
> - eMMC
> - EFI GOP framebuffer
> - initramfs boot
> 
> USB has partial functionality and other peripherals
> remain untested.
> 
> Signed-off-by: UEFI-code <zhuoshizhang@hotmail.com>

Please read submitting patches, we do not take anonymous code.

> ---
>  .../devicetree/bindings/arm/qcom.yaml         |   1 +
>  arch/arm/boot/dts/qcom/Makefile               |   1 +
>  .../boot/dts/qcom/qcom-msm8960-lumia-920.dts  | 361 ++++++++++++++++++


Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

>  3 files changed, 363 insertions(+)
>  create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8960-lumia-920.dts
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index adbfaea32..31532fbbe 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -204,6 +204,7 @@ properties:
>            - enum:
>                - qcom,msm8960-cdp
>                - samsung,expressatt
> +              - lumia,920
>            - const: qcom,msm8960
>  
>        - items:
> diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
> index 3dfb1c8ce..9a7fa44a8 100644
> --- a/arch/arm/boot/dts/qcom/Makefile
> +++ b/arch/arm/boot/dts/qcom/Makefile
> @@ -31,6 +31,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
>  	qcom-msm8916-samsung-serranove.dtb \
>  	qcom-msm8960-cdp.dtb \
>  	qcom-msm8960-samsung-expressatt.dtb \
> +	qcom-msm8960-lumia-920.dtb \
>  	qcom-msm8974-lge-nexus5-hammerhead.dtb \
>  	qcom-msm8974-sony-xperia-rhine-amami.dtb \
>  	qcom-msm8974-sony-xperia-rhine-honami.dtb \
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-lumia-920.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-lumia-920.dts
> new file mode 100644
> index 000000000..a5c8d1a5f
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960-lumia-920.dts
> @@ -0,0 +1,361 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <dt-bindings/input/input.h>
> +
> +#include "qcom-msm8960.dtsi"
> +
> +/ {
> +	model = "Nokia Lumia 920";
> +	compatible = "nokia,lumia920", "qcom,msm8960";
> +};
> +
> +&soc {
> +    qfprom: qfprom@700000 {
> +        compatible = "qcom,msm8960-qfprom", "qcom,qfprom";
> +        reg = <0x00700000 0x1000>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +
> +        tsens_calib: calib@404 {
> +            reg = <0x404 0x10>;
> +        };
> +
> +        tsens_backup: backup_calib@414 {
> +            reg = <0x414 0x10>;
> +        };
> +    };
> +};
> +
> +&gcc {
> +    compatible = "qcom,gcc-msm8960", "syscon";

Why are you overriding SoC nodes in a board DTS?

...


> +
> +/* eMMC */
> +&sdcc1 {
> +	status = "okay";
> +};
> +
> +// usb1

Useless comment, but anyway decide about style of comments.

> +&usb1 {
> +    status = "okay";
> +};
> +
> +&usb_hs1_phy {
> +	v3p3-supply = <&pm8921_l3>;
> +	v1p8-supply = <&pm8921_l4>;
> +};
> \ No newline at end of file

You have clearly visible patch warnings.

Best regards,
Krzysztof
