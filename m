Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768262848AA
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 08:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251290; cv=none; b=Cq63aJP82wUMfrE9qxLLIm8bBA7g4YgQ8A9AntQzGH923axb/7HbHfLKeo3ymhu/P0CAVKRMau4MZ49+yvrQ/hk2R7iM0FQarZPzbbyv536haS28ZXbgiUnovXV3awCS0pgnzOJks7P324u1jwhni833x+jLmsrrlvxNN4AxA5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251290; c=relaxed/simple;
	bh=SQEbNHWiJIM6sDDgeR5ssNziH59tYfVqTFW3jiKDt3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cMz/Pk/TJDz5sNwDzK4CEQ88X4c409RVNkF7zzqwHBzZe6Pb1x6wIXkfSEbzj0KlJ4HrYIEmtQVxaeh8QbcblPxGSWtNw84HBWf6iydAWulgWJXll2DisQHsG1xNsXLihotCIF3YjX2Uy9Zne/l4wfY62jhYq21BguLYigPWuYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q9HtuOYg; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q9HtuOYg"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5ad2e029a65so32405e87.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 01:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781251287; x=1781856087; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGSXIXNGhXGoEinX4j2POzhiX7uHLTUs+2fOXh7YSMY=;
        b=q9HtuOYgQM43t4zBZXlB21FVE25oyLcRD1F4uQwL3u0to14xdP6RFZoN/bKLCZznhr
         lnHFlfG83UPLK3E1KlWYK4jUvyyxT0+NqYE9tKjREXcVB2zsFa0BXSdlv0oSRjACUk6g
         qxHQigTrx8B3fMMyNlZC6uIeV1wONBNeR3q9loMdWYgjFQeGtWrw25eniWJfDvAKHh3i
         IRPRUcG9NWzm/as51YN4xcLjW9PA/c9SzHyLmQG/NrJU6cLUHGelyGIeimf8rqo2mNL+
         eN4Pe9vz22XVt0dcNkAK1flXyb6NwqzCbTQWUotjEVj3CTTj5vfKqjA9rmJ+QrPt1LKV
         Cc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251287; x=1781856087;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lGSXIXNGhXGoEinX4j2POzhiX7uHLTUs+2fOXh7YSMY=;
        b=gg9LWH3VzL/K4I7lX1/iKpG/MwrfC0nbiB99X5UO0b8cEdTRVOp9LlRyRzeAqkNzc9
         JgMFi6XLGeTrfV/99133GVUk7mXP5eNvmcdmun+XkpnbK+VJGuJ7Bk61ckIQ7EnuUeaj
         MUDb6lOuE7LadeG7zfcB01BBGqWgC+CkN2Mzm+ButGepwI7Cu69qJD3OHPKgAnwseol+
         vsPwyH7c+y/ha2FQIfQWpwWDpUp9TYwyN2OS6g8mpVs9tvlk5/pybtsLzV4AVQrlPDLr
         EFqnZKu5BOfKokP1ksiPKQc1YZ4aa0dkO10mIEYnf9+l06GiB07UVfBkjcT3EHS1IFDq
         qGdw==
X-Forwarded-Encrypted: i=1; AFNElJ/LyVgPOZSOvTIIMm05xH+8JWglSYWK5eHYgcaMLXFc5yvTRhGV9M0FMaKCFlpA6v43b1T8ckWcxFaA@vger.kernel.org
X-Gm-Message-State: AOJu0YyH0XdCeGkUkhbLvXrD/l/62j7N6OS4cIWnHghB65FAxchLO3FL
	Q5bYhiQ9DM+XlhGX487o9ZwPptoCYkqjms6QhTFfMf3jnfixTEJFzvflzWX48VKRsqI=
X-Gm-Gg: Acq92OF4TbRxEl/u7+HXbpLtZv5bazN/dvYa0irB66bAR8cpCOvZWw4jEz8jJ24nLDS
	NqFOnnbgYHUhU1A3NBXQ+d3frTS9bpbpAKr3NAYZWuDtXAbo3YJB2B3IX+XeSa1lYA0hQ4q9Gz+
	3iSDv7wUqemf94Q9bqS7SDBcK34fsxTRBeLd89u7HZv7h6H1izKpt4XBkAy0B4ejHft5qai9a4Q
	52WWNQ0ktdt2htEwQwCmbitdBhbyImcjhX+xcULqKlBDmwiFJxb9eG3EC/0QzcMaNWyDVKgqqJm
	GvWyylNQuEjj7MPeFDYokIWR69GcUIfLo1We4s3mGPjO27iuWVJqiHxpLEIKAZR1Z5iOeI+OmmB
	wWMQFeDASIEwgPoA69cOSBvlSdXaR5je19z6Spc5+exduVxFFBvBjVAlUdAoGxF0nIC/GPm0DKZ
	fCIPsoa9y/tvoWKRZsqVxvtS5Kktnx3C0MEaZwRCmoCO8fGlIEsZhN1AnyZR5tDcpQmqWRxzzfD
	vIC9w==
X-Received: by 2002:ac2:4c55:0:b0:5aa:61ed:482c with SMTP id 2adb3069b0e04-5ad2db73743mr194365e87.6.1781251286462;
        Fri, 12 Jun 2026 01:01:26 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b7a3fsm319389e87.82.2026.06.12.01.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 01:01:25 -0700 (PDT)
Message-ID: <d4d75a39-3575-4bc7-9fa3-a6521619daca@linaro.org>
Date: Fri, 12 Jun 2026 11:01:24 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: shikra: Add CCI definitions
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-4-ca1936bf1219@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260608-shikra-camss-review-v2-4-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/8/26 17:06, Nihal Kumar Gupta wrote:
> Qualcomm Shikra SoC has one Camera Control Interface (CCI)
> containing two I2C hosts.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/shikra.dtsi | 70 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 70 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index b93ce4a92a998ea5d9d4268d2fd46030fafc4084..fed71131491ebf6e261bfcd14b5d4a2624837878 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -348,6 +348,38 @@ tlmm: pinctrl@500000 {
>   			gpio-ranges = <&tlmm 0 0 165>;
>   			wakeup-parent = <&mpm>;
>   
> +			cci_i2c0_default: cci-i2c0-default-state {
> +				/* SDA, SCL */
> +				pins = "gpio36", "gpio37";
> +				function = "cci_i2c0";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
> +
> +			cci_i2c0_sleep: cci-i2c0-sleep-state {
> +				/* SDA, SCL */
> +				pins = "gpio36", "gpio37";
> +				function = "cci_i2c0";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
> +			cci_i2c1_default: cci-i2c1-default-state {
> +				/* SDA, SCL */
> +				pins = "gpio41", "gpio42";
> +				function = "cci_i2c1";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
> +
> +			cci_i2c1_sleep: cci-i2c1-sleep-state {
> +				/* SDA, SCL */
> +				pins = "gpio41", "gpio42";
> +				function = "cci_i2c1";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
>   			qup_uart0_default: qup-uart0-default-state {
>   				pins = "gpio0", "gpio1";
>   				function = "qup0_se0";
> @@ -701,6 +733,44 @@ port@1 {
>   					reg = <1>;
>   				};
>   			};
> +
> +		};
> +
> +		cci: cci@5c1b000 {
> +			compatible = "qcom,shikra-cci", "qcom,msm8996-cci";
> +			reg = <0x0 0x05c1b000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 206 IRQ_TYPE_EDGE_RISING 0>;
> +
> +			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
> +				 <&gcc GCC_CAMSS_CCI_0_CLK>;
> +			clock-names = "ahb",
> +				      "cci";
> +
> +			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
> +
> +			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
> +			pinctrl-1 = <&cci_i2c0_sleep &cci_i2c1_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +
> +			cci_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <400000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <400000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
>   		};
>   
>   		qupv3_0: geniqup@4ac0000 {
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
