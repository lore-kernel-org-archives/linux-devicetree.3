Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68A53939DA
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785166084; cv=none; b=QFNhDDVilczPdJBWvmEPApHdr+c4+q5ObG9tnn9F0nKpcS7H1jhnZkmuuTzPb3rhEcjAywHT9sB67qNJPrBGHINYnJrwnrabeTbfjTiGZjPvqmYTGac9dfhuEKffnE5D5SQy7mEJxAcl4LCGYyOg5E3UuCar6YpMGFNY+RTL0LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785166084; c=relaxed/simple;
	bh=ngaxqFOtln2nHsPTDS+hFwh07MaPzdPzfMxJ6KosXBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OH/EsOWJv9aIXyKkUg06Yntld7+cnR5C4bVEHKe/P6ThXqQMyJDhn9pnwVRlmeSLbAHPBjXvJe7wg8DsBMuCZ83J0k5JJ1P4lB/RHi8STR295bKTKFiGNShz3I02hMDq5Uomv3a4SNIptD1fnORD29aR/MRddv1aI5xb5nJ+Adg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aBUHu++m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Shjv13v+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aBUHu++m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Shjv13v+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlaha3414034
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uhp+lSfxStrLP/lbhM8SGKXuUYig6H8Cg7yd4lCGVMg=; b=aBUHu++mZJBWylru
	65PtEuN/p9e98wNE8PWt3MmbcO2T0GXJcoWxacD5oacEc7+QAUpMuI3CY6ZI+VhI
	JPCgpNfiURepy/eFjKwgUB9FW3uUUPE39bqXZhL1R50cI1210MAJg8OPnjh8ig1w
	P7poJ0goChEyo5mUMeplgvGelLYGNXX3FHFHNxCseGa0RBNeIK92FEAd84jpNAn7
	pCmQwZ9TiJjEKD6p8jCCluwUGNYMoP8qFow2DLtKKdUKw5cOYT8P/LPzfmkUXlNA
	zjjp8HaZcF2alSIqOgff7ZLCXyIs8mgjI838cp9jY/MOES6dBYVhHtI0oDhJIX1B
	srxQUQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4v69e3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:28:01 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb835525b10so3313655a12.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785166081; x=1785770881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uhp+lSfxStrLP/lbhM8SGKXuUYig6H8Cg7yd4lCGVMg=;
        b=Shjv13v+iqAXCxAPp+WrN7J2XWY/kF4SCn1HeoP8mkOM6y2ZjfFNlpazHUDuxpfiXc
         ZHwVJe1SvHAy34GC9BItsBqeAWrXEEfLlVKADQ5qV56OFwaeheyk1kqBDE452FvpLvrB
         ZlY2SDdBWtKjvDYDCARFtggUjsqj9fRbcD8vTNzdu8SOgtsF8Vj+v+kTlcdHLrH/9ZQp
         Q6ybt6WAz6hV3klsOAzHLJ6XiyFJ+MQw0dsj6KEUROjg/klONzwfZULlx6645vQ0x2wZ
         EtmAeG0mY1tsLmV2Ah9FB6VyLT+eud/aTOHIRpFvxicrJ9hebTKFkYNSq2YfmJ58S0aX
         hQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785166081; x=1785770881;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uhp+lSfxStrLP/lbhM8SGKXuUYig6H8Cg7yd4lCGVMg=;
        b=GOLeYChPwq7ONUPHaRKP7gWP6AQJtdMDMSi3JJmJc/BNvFYmgGvEftJOtbxvZTfeoo
         DFN7rVlaFjKP7yru5xaPTn/RAIEysi65IRAzUOJZOoEA2mcePAVD6fzdQHDaDCWmLjWR
         IKWr20tgcKqsekAVnxb2jwA1/s8H5ASGOtQ3QExw2f4ppXQvB4GyNMoVD2JZ2CGwybGd
         IXfQOM5W2yVdA5SWbpNBSqzf3H2YrdHAkvABz+7QpsIMZyiyUTY4NYiQWAARCK/OFDjU
         oxYFaaXxLTYQ3L4TpE1W/llBV9s4aDRyHsavOEagHs2/XUvbqFFUQN4Hx8RyQzPUfTOK
         iDrw==
X-Forwarded-Encrypted: i=1; AHgh+Rou47hnM9+lwqeubAu6+oPi9gSXVUGE2f/spHEX+wUTXFPux1Lo9SOzA1jO0fboweeNoNi38hH343kD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9xMZOsY4hkvFXLnkaFURjra//Lzd7eXNBf7wwQ6hpEWSfz4xz
	UNPFr0Y/CIwAwG04zuVlaFfOcEQjw1DjZGffpKBc1Ofw+VsAEw1tOTG/uiEaOCmime6Pd2EnNBv
	OHYPVLNpfLWDo1yuBG0pUNe24P2ioIDC9bKuQojeIIBwcr0q8aJFCdOuE6kvUacih
X-Gm-Gg: AR+sD11FPlKIzEgHEwajE5OaJt98psO7dEU8MqXl0SKqehPmfY4TTJrZlmtxpoaBoo9
	61qcCUERKQlNFlL+2+J5yOBPHLwa9U/YQwHrNjwHM+cxyD83Ia2sI0Ujv/A8QK4W/2UoUWnaP5z
	ajH2L0pnF3ZnvBVLxkk5zcP2iUaI4SJEOnQULmIdEexOQU+Nwbpwha01/RY1AUKpiXApkdVU+hH
	DHfOFrEwwyc2fYhG2HYNUsH4SpMmUwRnLPX79PMP4KM/MkdGXEwYQslV1+/IKbETNBU4bDnA/xM
	TF5tp7Xp6tWTSMFRJ9HhVoEF86+0HK/UoQUFAuti+2f6ivPiX0J3mWVFL7x29YNrIycIi0T09j5
	xdKWxOgisZ4cSfz/KkGwttOSGQu+N2g==
X-Received: by 2002:a05:6a20:9397:b0:3c3:cf9b:fb8b with SMTP id adf61e73a8af0-3c67e163784mr8639464637.68.1785166080976;
        Mon, 27 Jul 2026 08:28:00 -0700 (PDT)
X-Received: by 2002:a05:6a20:9397:b0:3c3:cf9b:fb8b with SMTP id adf61e73a8af0-3c67e163784mr8639426637.68.1785166080541;
        Mon, 27 Jul 2026 08:28:00 -0700 (PDT)
Received: from [192.168.1.3] ([106.212.244.189])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66dc15asm3383903a12.30.2026.07.27.08.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 08:28:00 -0700 (PDT)
Message-ID: <1e5ab24f-d836-4d87-a21d-3d172a03b0fb@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 20:57:52 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document
 DAI subnode
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260727151230.408122-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260727151230.408122-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260727151230.408122-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0NSBTYWx0ZWRfX1vuVgzap+XNs
 d/k9n8N56mhD9CS0wl7LvIhN71+SZNZXj7bcFsgHoHMJSPutWgm1j8LeJ25rLVpdvuzSM2ZOONb
 m8sbcA93uZicJjcpAN4gMitvje9R1MQ=
X-Proofpoint-GUID: sOYDoiBBdFr5qYBfIBxHaLgqQPjCPks3
X-Authority-Analysis: v=2.4 cv=ev3vCIpX c=1 sm=1 tr=0 ts=6a677901 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=yelsqLKVWbcqNe5dfEYUXw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KLQR4twFUm2b5WDXR-sA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: sOYDoiBBdFr5qYBfIBxHaLgqQPjCPks3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0NSBTYWx0ZWRfX9zNoqXjySXwk
 2noT9UPFUzQCARHF3vEJJaChbJDZJQ3JWH2CxKPFsKvyyobp2mRIuHIxqKhhaJfHhKj+wEbrfnS
 mT6h6iZcC0d2TByeo3inMsPtS+sNtkYOYS+EefMCLHWg/huUOTEInF74rXp6NJrGrYJd+n9LgWE
 GWrd9AXVbnZtaEBv76gvOfjJ/z+a4YlzRfyep3qASG5Vjo760mLCGepmQVbQOdvzJjjHY3OvLVz
 946STDswisj7FSlO7yeZ3hfgzx7iNt5j1lU037dTeNs5dxz3MXl/sfdEtNGb7AUpe0h1l97dWPe
 pTP0m4xNZHDwXPpyZnceUeqW7sHBdXOvT03K6B6VY0rcF+XsfixmumCqC1IHeW9P/8GnAhDuhUU
 4ITb2Uqbj3vAzD3HbutgAEfe1unNdlm4E81YdoX79cIkcRcpDt5Z0w1FKj9UEegpeA/EYETDpu4
 kXKgBT2Jlk0JWp+srZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270145



On 7/27/2026 8:42 PM, Mohammad Rafi Shaik wrote:
> Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
> describe Digital Audio Interface (DAI) child nodes.
> 
> Add #address-cells and #size-cells to allow representation of multiple
> DAI instances as child nodes, and define a dai@<id> pattern to document
> per-DAI properties such as the interface ID and associated clocks.
> 
> On platforms such as Monaco and Lemans, third-party codecs are hardware
> wired to the SoC and do not always have an in-tree codec driver to manage
> their clocks. For these designs, clock line enablement must be driven
> from the platform side, and this series provides the necessary support
> for that.
> 
> On QAIF-based platforms such as Shikra and Hawi, responsibility for voting
> I2S MCLK and BCLK has moved from the DSP to the kernel. This series
> introduces the required device tree binding support to represent and
> vote for these clocks from the kernel.
> 
> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>   .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 50 +++++++++++++++++++
>   1 file changed, 50 insertions(+)
> 

Thanks for the patch.

Tested on Shikra-IQS. No issues observed.

Tested-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

Thanks
Ajay Kumar Nandam

> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
> index 2fb95544d..78587139f 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
> @@ -21,6 +21,43 @@ properties:
>     '#sound-dai-cells':
>       const: 1
>   
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +# Digital Audio Interfaces
> +patternProperties:
> +  '^dai@[0-9a-f]+$':
> +    type: object
> +    description:
> +      Q6DSP Digital Audio Interfaces.
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description:
> +          Digital Audio Interface ID
> +
> +      clocks:
> +        minItems: 1
> +        maxItems: 2
> +
> +      clock-names:
> +        minItems: 1
> +        items:
> +          - enum: [bclk, mclk]
> +          - const: mclk
> +
> +    dependencies:
> +      clocks: [clock-names]
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
>   required:
>     - compatible
>     - '#sound-dai-cells'
> @@ -29,7 +66,20 @@ unevaluatedProperties: false
>   
>   examples:
>     - |
> +    #include <dt-bindings/sound/qcom,q6afe.h>
> +
>       dais {
>           compatible = "qcom,q6apm-lpass-dais";
>           #sound-dai-cells = <1>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        dai@10 {
> +            reg = <PRIMARY_MI2S_RX>;
> +            clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT
> +                               LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +                     <&q6prmcc LPASS_CLK_ID_MCLK_1
> +                               LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +            clock-names = "bclk", "mclk";
> +        };
>       };

