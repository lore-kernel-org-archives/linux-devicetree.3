Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0494E3D47B3
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 12:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779798314; cv=none; b=qo+mMUX73oY627kBjL3WwcivzsU/HSOB/zUSMBhlfWm3UGy3nI4O9Ccz8Do0vBOJZ4Jsbs9ZNp6iyvpcmaC5oLVXMge6IfeqSyKh0nvsrT0H1zEy5GN/p24hK1LDQpBkrQSE6jrjk0KHFzemCE/SJT+424KFus9T+y6F8zQ2IeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779798314; c=relaxed/simple;
	bh=OBdNDmdFyX3Btzx0luHZFVbkPIZYv5WwtCm4c5mXnnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BYou7XJXV6ufbRZuKe/krNDWbYEvSwGrHCoY2ChEHEQNOdj4mPt4bcpgXTIN8GMI6d8fp1khaFWsF9Gwe1NtAlbDUMOJyPAaEwcRZmSjmgKGDAd+ehBfMZeZSYj9Swdb4er1v7gyxjZoRIDrMEBQFFB3hWAkcCQrJjCuMYUSJYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vLWZ+Thk; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vLWZ+Thk"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43fe608cb92so6404555f8f.2
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779798311; x=1780403111; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jgI53DJMq4E1/u2WXvBPkXuolOc+9wuhSnRSjksHASg=;
        b=vLWZ+ThkhFXsC8LKnSTk2ErfnJnZyY6y9PnwFfvGAO7w9sU9mJIqgXeSeV1TnIDUTE
         TNLsVyv01kkVJmeLml9elRJgJxRnCZgAFN/EbuO89QXYoLuLclXk1MxiueOnBvUeJ4cV
         jzgyrCxj529GO7l6U6qtrqHjBJ40RRkyLaOmzodRZRYN9YryNIDE5EB8rxQFSRccAID4
         22y78XIgzVNP/Px1ORKXRZC12ekjTxSLMfMU7GPEG/EGP7xZPJlb106IPbJOAmjmOnzG
         ISpsvhVohX+sp5gWfF+PqjQwGzNRNGc0NLY0jg7xdQFW9yVFxjHhK6LDqZVq8661pFYv
         KicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779798311; x=1780403111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jgI53DJMq4E1/u2WXvBPkXuolOc+9wuhSnRSjksHASg=;
        b=MjywdFZU8Uo8jn6ADlRrx4v4UoF1jyNXbY4z7yGE0V3l+ApQ4gqbVGyadVHQddjKkX
         +IrIdl/t2ox/Su67WINMCM6nU2hz+oADH/QwlHcnWKzeZjEfGYcVE7R3j2iOsFXxwOaV
         nbyvoP5zgWMqOux/qzh8P1xJt5FxJH/kWgAtl00Lhvz3I42EzwRfhHuyO25Oh+QtXZGb
         PGmELZ5MiID7+Z26zs4/DwMax+daafZGdDdhJjcuQH2nF/jhGLrXuYNaTPLGCuoKn72h
         OUW1ra8/pKABljauIEO391VhSrJ0AztncQGZhKQR//33uqKx1UJeCGijRnTk7BTRirLW
         bShg==
X-Forwarded-Encrypted: i=1; AFNElJ/y2JChT5KXPc97A/6IZa2tadxgUuOXGI7Ea3eNaITslWxeWS/GshQQL0pYZlx2aRXsIuHBQWXA9xlD@vger.kernel.org
X-Gm-Message-State: AOJu0YzpS31SMTonJE0eHAxbBMPI/av8NAm/UXWq/YVVgP6iT+7OBan7
	88TWBcjO7SvwWxlXvCs4sMOfTHyUxHXO2RKdC1ukHRV7Cvc6Ta74jy7/N98XRvzlReM=
X-Gm-Gg: Acq92OF6tbOtsMlyVSLheHSHEdciGqBit3k9+y4ERDmq98W0OURY0UTD/tYmCWetBAr
	6RL3FwvwCBoc/YpJpoW9s2OR9MX2/xZXZ46GtA2SwFM/IJAQsGMHTux0P1VBXWwMQvuKK2PxvPE
	DR4Lthhn17z542v9pvyRSG5M0XLyyFGvsrpZpCc8YdXImuwI4Qo15XRvGP+kG0gA9/Trg2eUop1
	HAh+vqsQO6NrbWYuIiGBhmti71V9bv340xxqo4qrZeIHjnnz/ysC1f/uzHoe+ibEPnje4wcV92a
	h20trJ8kCX3MCm5iqQ66+CCLuAeqrOFpOWKTdA3Z1QIAjQwtmHoM98dNqc9jZ+elt6SB5nxKiRJ
	6j6dgvy3gkFU/gJK3WFpp2dVDi1dWt5lB+PUrN0A0GlV/p7ULV1LQy9i9R2RvetRL6Aeb/zdnfO
	wy7V0HfxFReYX6A1Kw+9tXC+Tzpq7daGAHKZu062TOcl0=
X-Received: by 2002:a05:6000:2412:b0:44f:9b70:2996 with SMTP id ffacd0b85a97d-45eb38c53bamr33323679f8f.21.1779798311332;
        Tue, 26 May 2026 05:25:11 -0700 (PDT)
Received: from [10.149.200.45] ([89.101.53.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ed1939c6asm14041928f8f.2.2026.05.26.05.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 05:25:10 -0700 (PDT)
Message-ID: <9ececc65-d2d4-4310-9218-beaeb5496dca@linaro.org>
Date: Tue, 26 May 2026 13:25:03 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add
 Embedded Controller node
To: Daniel J Blueman <daniel@quora.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Bjorn Andersson
 <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
 Maya Matuszczyk <maccraft123mc@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260526112409.66325-1-daniel@quora.org>
 <20260526112409.66325-2-daniel@quora.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260526112409.66325-2-daniel@quora.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/05/2026 12:24, Daniel J Blueman wrote:
> The Lenovo Slim7x uses the same Embedded Controller as the Qualcomm Hamoa
> X1 Customer Reference Device. Use the lenovo,yoga-slim7x-ec compatible
> introduced by patch 1 for fan control, thermal sensor and suspend
> behaviour.
> 
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> ---
> Changes in v3:
> - use lenovo,yoga-slim7x-ec compatible (introduced by patch 1)
> - v2 link: https://lore.kernel.org/lkml/20260502063518.15153-1-daniel@quora.org/
> Changes in v2:
> - corrected DT compatible node
> - v1 link: https://lore.kernel.org/all/20260429103301.17449-1-daniel@quora.org/
> 
>   .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 22 +++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> index beb1475d7fa0..1ee2a2296129 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> @@ -951,6 +951,22 @@ retimer_ss0_con_sbu_out: endpoint {
>   	};
>   };
>   
> +&i2c5 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	embedded-controller@76 {
> +		compatible = "lenovo,yoga-slim7x-ec", "qcom,hamoa-crd-ec";
> +		reg = <0x76>;
> +
> +		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
> +
> +		pinctrl-0 = <&ec_int_n_default>;
> +		pinctrl-names = "default";
> +	};
> +};
> +
>   &i2c7 {
>   	clock-frequency = <400000>;
>   
> @@ -1352,6 +1368,12 @@ &tlmm {
>   			       <44 4>, /* SPI (TPM) */
>   			       <238 1>; /* UFS Reset */
>   
> +	ec_int_n_default: ec-int-n-state {
> +		pins = "gpio66";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +
>   	edp_reg_en: edp-reg-en-state {
>   		pins = "gpio70";
>   		function = "gpio";

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
