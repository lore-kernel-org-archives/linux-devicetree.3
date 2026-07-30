Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB23441B37D
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 12:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785413079; cv=none; b=sYRMZUOG/k1ybFhORQHPVMcDEiWFoRnufn34kDAIqrzgSvuEOcvdUU2jfmXxqMRD+1jeiNFNsQBYa7MPjYW2cG0bs1n3duhcImDJPbT+swtGLXOER/Ivz00aXLUrENdQjxZHiwwhW99q0G2HOPSBn7HdbNh7bL+vcVXI7HRaTQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785413079; c=relaxed/simple;
	bh=I5BgxvP34n+zMbhzzcluW4RhyvS0Cz4tNpajXB8Dj0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nb1L624UMCLgNBq5qyjqcYHu1PWvs4bbA59gr8WTd5jEqY1aS66tWQunSE6xOofW+iBW8xxtsW96ZbzQf2/Q4vTioBs5eSMRgXhsWJtP55GJKsrdJJEC/r9C7VFdrahMzS5KQa2EkZxs2yQMzUC/dEr4plxKO1etrTrsFmZmd7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VxApVZSm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ewvnhNNS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VxApVZSm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ewvnhNNS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UBcClL847094
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 12:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y+FHdhO5WfA1/EwScHXL3m5MMhllcwYguNR1eoqGLJ8=; b=VxApVZSmWdoJSwUo
	MGZbBJ27MkUlPpoENy82onsvqwj1TM2o7nONoxVwejHfWL+bxYRRUG6J9HNq/ulM
	KcxMzZFEyABTtlceMsC8iqHgWvwowkrdsknH4rSX3Hj8y+YomuCxlodN7bKlljHQ
	BZcdDua+QRgL+T27k/EhsoU7SDVVEJl3LhpG+a9giQF5SkqGvz5VTW7aD1NKRtZe
	5NZl0OC23GMHmQA7EsuwaF5O1etPc9RTgfCpa7Pu668WLS7NqZIevk9yoTcQCiqe
	Pgw3eMJh0Zj6EYh9QPun9T5wZh0Jtrf9fWJFcpyG+74yIUOQTP7I8ebSqcjJa97E
	ST6Shg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr5wqg3bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 12:04:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bf321d786so23755601cf.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 05:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785413076; x=1786017876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y+FHdhO5WfA1/EwScHXL3m5MMhllcwYguNR1eoqGLJ8=;
        b=ewvnhNNSKE19Z9uWShf3+CvCQCGlLuSzqD5OcTXa83Ci9Rsk9ckv3w8hzSUGtAxtvS
         TcVQVQkYDDZrfZTEQL5/rTXJhkCkespApfZUDXBzoHblWe3snYEWHFXs19IXDAS5RHHL
         zoTj9qiYbYT9fJ5k64NvX9j55HRXX39YjU+hszhCr0IPYgRoDkVfefSyHTNBjjZaRMK3
         bKzk0Ayr7Nh7YSprySVqgX1VHD3jEHC2zXWJln27NY/bEamTckAqnptidcKHMQ2ApXaC
         Vtat9zXz7loyMaFLRAunE6n/RTy318QWxmPzga6JtxVx1KpE8BOMtDiir3BNXIr3p4vo
         1bCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785413076; x=1786017876;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y+FHdhO5WfA1/EwScHXL3m5MMhllcwYguNR1eoqGLJ8=;
        b=IrRI/6Uco2MPV4RuOzzRUaIePi+zoOA4qqFEOQ9FWiawot6vxH99kesjwOOsTfQRp0
         YoaKmQVvvPSmxlL/h/wIiwPso0R6y2NTU2Gc2ITrzJcRr1CoUg2YgQKc0kLavxJh2fYZ
         R0uNNgBKFAJfyE6XsbHUXc3dzwJFMelEjL6m81wCeAgnlnI5Qz7leeB+nBRSZFgsL2XN
         Wo5bzJPErbmiIg08jPOFq/QtGcq8dgPdyYOYulzYBhvDvTyEQDfFycAG2FCzYI8k5FMA
         fFCo05XLZzzTDA1Hdy4KguBU2DvJScm36OdKoht5frN1qViPOTH/2JykG6cKaCG4vQc6
         0zRQ==
X-Forwarded-Encrypted: i=1; AHgh+RqSq8VnNfPhNPeyxHbOkgSfqJF5QfdyWXWZYYvxwaoUzh1B6xQDyHhyEeSgQp1SYTZ9TKPbevvJ/yIA@vger.kernel.org
X-Gm-Message-State: AOJu0YxjMXQHF56PdpoiWBErsThM/1wP0ktNDYmvZKcTfddrSdD9c+HU
	I8+YiQVWwwikRMfiR5zKuD9DlcNwJZNZvJev6LnBf9Qy4Wqsw2EpWAF9gdYvA5sdSIeH1LAzIn/
	Tb2P7dhnoDlxZUByX/vHQ6OHVA63Gk5AmbPbsjr1GYNTOx6eEnUHPU3LqZ+4SbP9J
X-Gm-Gg: AR+sD1155p3wKL9bmh9t4aTU0BhNDueCmWM212i1EVQrNUWxq4kIrjLCsOKzifpGqYW
	dYVW2VjyJKIcRBSVnQNP9IMOGUav1qjoZN/JHZbP5v0U5s6uBroMJyIkt0trr5PPxsxzF5UAtGD
	Vfd882FKlVWIaSmRiNbGvpvspRnilxd/+TvVDpuHRrl9wE5vKE6UulbqGsiq/JMC0IC1vtQXe0f
	xZ9lpZYrYnw8Mk9/ak/utTHuaHU5fmxFMAdA4P5OuMCQoHy1qqJZvgDOmw+NtRoFi88hb3Wq8Nv
	1BJ3gQTQHeRa4FcQXi4VB9IRmSDB5z+x/NHImnIb/s7ueQn0hoKrkGnGZJlFNH//6LuVH3v8Xi0
	R95aWX0s3W3V0vbrfx+M75GP0nqw=
X-Received: by 2002:a05:622a:14c9:b0:51c:7b12:1202 with SMTP id d75a77b69052e-52b386c73d5mr21919721cf.80.1785413075353;
        Thu, 30 Jul 2026 05:04:35 -0700 (PDT)
X-Received: by 2002:a05:622a:14c9:b0:51c:7b12:1202 with SMTP id d75a77b69052e-52b386c73d5mr21919061cf.80.1785413074645;
        Thu, 30 Jul 2026 05:04:34 -0700 (PDT)
Received: from [192.168.68.105] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c1fa8b76116sm59455366b.41.2026.07.30.05.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 05:04:33 -0700 (PDT)
Message-ID: <b882ceb5-bf08-4ab1-9f01-216733ab656e@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 13:04:32 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] dt-bindings: pinctrl: qcom,hawi-lpass-lpi-pinctrl:
 Add Hawi LPI pinctrl
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260724141708.2212057-1-prasad.kumpatla@oss.qualcomm.com>
 <20260724141708.2212057-5-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260724141708.2212057-5-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA5MSBTYWx0ZWRfXz+fggy5e6+Ub
 PK+kkx6kZ+x5sL/iPWkBicvltgpDGNT7tUZAt92PQsNkbTeT4PGkCy0hHYeLGZ/4PGkGCQKkolo
 IIhZ3TkRRZZT410AVBx2prnHtQHEaoI=
X-Proofpoint-GUID: Nny8wwnzawjeCRobrLKuc7CimpBNHiSo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA5MSBTYWx0ZWRfX/5M95a6qZVDx
 03MfajyfqLqbIZ+bLFZFdFQs7Z07JqzQ6V1MpsKgXb1uL0MpzFHygEL/JRL9UqR1jMXPVlRnRyK
 4ACJuWW9mNt4aNSk7yAgvmRMN0sXe8mdB1MHIVJ04X9sP0uL6WAt8u+IAWsUc1o8NGeuAOykSLf
 DPlKrEDbYS/k1BFiEUDBpmHOFK8Se/TkUNwGX0nNSsR9bVv82nvSoaUcNSvTofpukE+YlQBQEn0
 2uW2RmgUfnCYtnl4qwG2n1bTeje5OnhzX3/nkRHHnrVSaohJIE1FgShFxj/78N40dVwv3jgEJhE
 ARwYCxS/E7Ifs3BCman7LRTAcZ3JPCpMCQ+62bLZVbQu8JsAAozGY1yYNZtF5yLPu1ahLoBeoK9
 xUVVtGpZHHhjq8FuayE6xpBMZqQZI5Hsu6OPHbG7Lh7CWbicqInhYLU0SBcGtkRLa3QHra8DsFP
 4FglJOdR2MMcUY8QMXw==
X-Proofpoint-ORIG-GUID: Nny8wwnzawjeCRobrLKuc7CimpBNHiSo
X-Authority-Analysis: v=2.4 cv=B92JFutM c=1 sm=1 tr=0 ts=6a6b3dd4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=DP1ofWnUcdAMOgPlYdMA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300091

On 7/24/26 3:17 PM, Prasad Kumpatla wrote:
> Add bindings for the pin controller in Low Power Audio SubSystem (LPASS)
> of Qualcomm Hawi SoC.
> 
> The controller has 23 GPIOs (gpio0-gpio22) with functions including
> SoundWire, I2S, DMIC, VA I2S, ext_mclk1, slimbus and lpass_lpi_dbg_clk.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  .../pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml  | 109 ++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml
> new file mode 100644
> index 000000000000..af68581750cf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml
> @@ -0,0 +1,109 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Hawi SoC LPASS LPI TLMM
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> +  - Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> +
> +description:
> +  Top Level Mode Multiplexer pin controller in the Low Power Audio SubSystem
> +  (LPASS) Low Power Island (LPI) of Qualcomm Hawi SoC.
> +
> +properties:
> +  compatible:
> +    const: qcom,hawi-lpass-lpi-pinctrl
> +
> +  reg:
> +    items:
> +      - description: LPASS LPI TLMM Control and Status registers
> +
> +  clocks:
> +    items:
> +      - description: LPASS LPR(Low Power Resource) voting clock
> +      - description: LPASS Audio voting clock
> +
> +  clock-names:
> +    items:
> +      - const: lpr
> +      - const: audio
> +
> +patternProperties:
> +  "-state$":
> +    oneOf:
> +      - $ref: "#/$defs/qcom-hawi-lpass-state"
> +      - patternProperties:
> +          "-pins$":
> +            $ref: "#/$defs/qcom-hawi-lpass-state"
> +        additionalProperties: false
> +
> +$defs:
> +  qcom-hawi-lpass-state:
> +    type: object
> +    description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +    $ref: qcom,lpass-lpi-common.yaml#/$defs/qcom-tlmm-state
> +    unevaluatedProperties: false
> +
> +    properties:
> +      pins:
> +        description:
> +          List of gpio pins affected by the properties specified in this
> +          subnode.
> +        items:
> +          pattern: "^gpio([0-9]|1[0-9]|2[0-2])$"
> +
> +      function:
> +        enum: [dmic1_clk, dmic1_data, dmic2_clk, dmic2_data, dmic3_clk,
> +               dmic3_data, dmic4_clk, dmic4_data, ext_mclk1_a, ext_mclk1_b,
> +               ext_mclk1_c, ext_mclk1_d, ext_mclk1_e, gpio, i2s0_clk,
> +               i2s0_data, i2s0_ws, i2s1_clk, i2s1_data, i2s1_ws, i2s2_clk,
> +               i2s2_data, i2s2_ws, i2s3_clk, i2s3_data, i2s3_ws,
> +               lpass_lpi_dbg_clk, qca_swr_clk, qca_swr_data, slimbus_clk,
> +               slimbus_data, swr_rx_clk, swr_rx_data, swr_tx_clk, swr_tx_clk1,
> +               swr_tx_data, va_i2s0_clk, va_i2s0_data, va_i2s0_ws,
> +               wsa2_swr_clk, wsa2_swr_data, wsa_swr_clk, wsa_swr_data]
> +        description:
> +          Specify the alternative function to be configured for the specified
> +          pins.
> +
> +allOf:
> +  - $ref: qcom,lpass-lpi-common.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
> +
> +    lpass_tlmm: pinctrl@7f60000 {
> +        compatible = "qcom,hawi-lpass-lpi-pinctrl";
> +        reg = <0x07f60000 0x20000>;
> +
> +        clocks = <&q6prmcc LPASS_HW_LPR_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +                 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;

TBH, you could have used integer instead of define here, which could
have made things easy for maintainer to merge the series.

--srini
> +        clock-names = "lpr", "audio";
> +
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&lpass_tlmm 0 0 23>;
> +
> +        tx-swr-sleep-clk-state {
> +            pins = "gpio0";
> +            function = "swr_tx_clk";
> +            drive-strength = <2>;
> +            bias-pull-down;
> +        };
> +    };

