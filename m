Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8B93F65EA
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 10:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785146852; cv=none; b=iRXmaoVHVMOx3DW5fYI8cQ0T/C44sN65dd/kjkjL/MlxuE8U6X6pG/ftOS5F9YIxcZ+pEZ0oYJs+5eHuhHQaFwkqNeYx7Pr9T8/+KJOcgTh9i7cBFwSvN6CkFbAn2blhpwzUvwpR23xKrh2W00034ismM4IaVCuZp/Yg+1br+D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785146852; c=relaxed/simple;
	bh=E15XfPG0XLJ/CQ6hsaGL76B/E+9/n45ilK578TAed5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hww/EZzqbIdL2kZWSPeYjHRDK22yyB5rk8fTgyZ6kyjC3QbZpwKnRHgf1lZXWzii5Nq6oEhaCTZ676TEBESW1GQoSWUPbBWUxIbCgqiePaGaJWhLTVT9HLUp2hVPZJ8lp3Qjmy5pNk2LnyutIxDxAmCP81yG0XU5xBU4wf10ulc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=phq/sV4b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y0vcZT7E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="phq/sV4b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y0vcZT7E"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R9bUQO3545730
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 10:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S1N2mWIMe9XAYKGa9HXnaqIztknAlWljoYw1v6FDc68=; b=phq/sV4blnifXumr
	8eBPUZfxbQqSY8HaTuCiy+ruRUfE5p306L0K/W7JZe/+3TBS+jTpDDDGOtHgHQ83
	y7qk/FqNvdhNrWUV2Vm2OmEJYYhYa3CWP/Akp3hKLD2cqzww75wg3OWrjA+6r4dN
	n70NxaqUCLTxLUV14KwjOrBAHTinl7P6v+n9UiJRDJVhe9QvmmnUhJZgReh52mfV
	K2nh3N9UyZawn5al6zx0oOWMpCroUV2jw4suvjVofsxtcG5ls1pPORzm9ZnX814O
	w8Pl3d82HHchd/i9dUoWi2DGuiRKqv9/uAywnDJAljGtJVicl1A66olwVpBxdUO1
	ekupzg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mrr5ug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 10:07:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51e9d892f0dso8336161cf.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 03:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785146848; x=1785751648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S1N2mWIMe9XAYKGa9HXnaqIztknAlWljoYw1v6FDc68=;
        b=Y0vcZT7EC8lwdWwK6SES/IPvVGNTL/IKD8Ee+8xRr03HBeDmnocfvl/M0LCsdM/Tcm
         W3Ad65xjDAME4LWdezO09u/exX+hHgb25Lxpu4XNbNoaTDj7xsf/a9eAuehgOEQkoxwM
         Y6C2lY33X02GUG8PDtW3+cQTFT4gTt2U8BTfjvTlU6WIOGE/Jq3ywmbpYVVA8ZA1M+e5
         e0tXq7wwxyh4Vi04DokJWIYIkvosMaEgPmOBpIf8PjdioeBo1G767Aj6cxbLRkUvZSQa
         KTnG3p8JGUNBJa2/JKXEhivj9AnejeuvPUmrXdBA0Gd5AYHb84lW9WdCgjlJibuF0P7M
         v6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785146848; x=1785751648;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S1N2mWIMe9XAYKGa9HXnaqIztknAlWljoYw1v6FDc68=;
        b=pYwFGLQ1Kzj4Lsk/L9bwe6UUuFWAteVLbTrBw17bTO9+iwoL6SR50PQNO97+oSYIMR
         33pwKe83krljLydBZiVpHWHwQiC/i+Wj3a28WtWDGM6O1y3ijMWpJJh7AL2GEPmoCZyv
         zFGhI2/yDeuNuE8Rpa0lwEhfb9BWpzLLTONGiJcJRplTZP/5EPINy5QBkmh+uzg84Al9
         gh4SJTXEAX69/zxACCZLu2iu7xmuwvWH0a3rN0TCEm0mM4kQ3AdAmHYNlvmmLrI6sGQp
         0irvZ1uvRFnQSTtEJnB2NedrEFceR2VTqC0+n0NW66Zs5YJ8OmFX73XPyPfL3PhC0gBS
         R1Gg==
X-Forwarded-Encrypted: i=1; AHgh+RqOdD5FMZGfj2vHyK8DBQbfslzCDLah8VAUHjJhHjI3dmPIBJxJTBOeDv0B8oatZQrZ3mul8620q8Up@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3oFtvRqZplxZOQ3B7Tkjhfh5xd7zc/t8qutPsvNPLLdo/7JJ3
	d4vDQH5fmvb9L9Azsbv5qJKFqTaAc50IN8GKhkAUI8XyyRb/UszPiTpeUY7SmPRgt42yVxbScLg
	vRRlN53bo7Tmx1v+cB6AuQtwmdPZderNYgHGzVHh9qrBnNhEjsUAuDBQvl7bRFfMi
X-Gm-Gg: AR+sD13T6jcjnwCpEWbBPsK3QI7T5J2YVpSSz/YRyhyfotoc3CNdR9PXVl2dDdGhF3d
	b54Cmm50stNPOU/h+2MZVvDlWYSCLQ/pb35fhjaHB7KraXrJJJBG5BzV0R6rM+tfOKDBFAuNgSI
	jt0b8aeCuNM2FvURP/zbXfrfAOQs5HFYtG4KDDndArryTX5ykLcmnHlx+rpl7gARzIYBVYVHVRK
	0rAEHCbyf3HEHqToO+4HyYkJEtjUr3zylhQgAdzCIw9ZLyrWFCY5kQuz7t1GSv1Q1/OMYHvvnBL
	9LdT4MMWpLsMlk1ti6z3fA743CdpxVFaYSNBeTW1kRHI4bGR6nCnD/z8+O7YAD4U7+LOtrLEs3r
	r7FTjIYNhMniJG997AcbeuYUQ
X-Received: by 2002:a05:620a:2728:b0:930:aff2:b1e8 with SMTP id af79cd13be357-932df77da40mr625325785a.8.1785146847631;
        Mon, 27 Jul 2026 03:07:27 -0700 (PDT)
X-Received: by 2002:a05:620a:2728:b0:930:aff2:b1e8 with SMTP id af79cd13be357-932df77da40mr625322285a.8.1785146847138;
        Mon, 27 Jul 2026 03:07:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb5746e08sm2376666a12.23.2026.07.27.03.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 03:07:26 -0700 (PDT)
Message-ID: <7ab0655a-52ac-4b15-9223-753c146a9469@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 12:07:22 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: milos-fairphone-fp6: Add NFC
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        David Heidelberg <david@ixit.cz>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, oe-linux-nfc@lists.linux.dev,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260726222405.153008-1-jorijnvdgraaf@catcrafts.net>
 <20260726222405.153008-6-jorijnvdgraaf@catcrafts.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260726222405.153008-6-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA5OCBTYWx0ZWRfX/Dwdvir4jHC0
 Bk22l5udVFRRQH5ompzOhYnnEQcTpreYLR4G5Ae+BeWnYbIfUIc900sir7rU3+znGV5Wodgr/LD
 NrY7OHNx2jYPui4lN8QeG2NjyZuH9GA=
X-Authority-Analysis: v=2.4 cv=UYBhjqSN c=1 sm=1 tr=0 ts=6a672de0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=GYSh3LzNAAAA:8 a=yBwHqnpkDyRxZW_GFQcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=lWcdFasyL5yHfcDTNXXo:22
X-Proofpoint-GUID: 0uUBI2Y9it4RF6KDJYc4VobisOI_V-0M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA5OCBTYWx0ZWRfX+Fo1C7gkA/tT
 GZnOqdo6DzkYrhKn/B+uHf3REpJMnkOJPI6WQtt1v/Nks8HSNG0XC5UVL3DmzwKT20tlfH93p6Z
 fT9rlUYjPPPjN5bMqluOqolNYqW/qSHa/zOZo+R9FwNAPKD9J4zvs/9+dSyGOFYTVR62v8rtplk
 /5vGNlzvEYk+12DZ1jmEsCJKCJaSusV+HtTl25ySBVViusD3ElTmv62zqCxKudEu7muDrUR1r0/
 nDlUzOGMT+IOJWmu/e6LkhjHepMff+P6D2H4j5hLawLT+FtXuF0ixvP0Sq/q04eyWJTWjvEWD/f
 oI/ysn3emnqg90atAa63CoJvsmlnm5/KAm8MF3TUVHf/0RAzQuWXUD/0qVmoG+t5wy40K8if9US
 ktlE30UXaa8ovl6T/AS7eSvXf3TgsM6pZCzN6gFVEGwdPrTfYEl8cNGtkx78TPKlqLhcaTY4yZj
 +OFAWEfCU1lmKJnK3dw==
X-Proofpoint-ORIG-GUID: 0uUBI2Y9it4RF6KDJYc4VobisOI_V-0M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270098

On 7/27/26 12:24 AM, Jorijn van der Graaf wrote:
> Add the Samsung S3NRN4V NCI NFC controller on i2c1. Its XI clock is
> provided by the RF_CLK2 PMIC buffer and gated through the controller's
> CLK_REQ line on tlmm GPIO6. PVDD is fed from PM7550 LDO20, the rail the
> downstream driver switches for this chip.
> 
> The enable line is routed to the chip's power-down input, which is
> asserted high to turn the chip off (the downstream driver treats VEN as
> active-low on this design) -- hence GPIO_ACTIVE_HIGH, unlike the
> exynos5433-tm2 wiring of the same driver. The pin is pulled up so the
> chip stays off while the line is not driven.
> 
> Assisted-by: Claude:claude-opus-4-8
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
> ---
>  .../boot/dts/qcom/milos-fairphone-fp6.dts     | 49 ++++++++++++++++++-
>  1 file changed, 47 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> index ebdca0e2d2f3..a1b86e4092fe 100644
> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> @@ -601,9 +601,29 @@ &gcc {
>  };
>  
>  &i2c1 {
> -	/* Samsung NFC @ 0x27 */
> -
>  	status = "okay";
> +
> +	/*
> +	 * Samsung S3NRN4V NFC controller. XI is driven by the RF_CLK2 PMIC
> +	 * buffer; the chip has no oscillator of its own and gates the clock
> +	 * via its CLK_REQ line, so the clock must be voted on in response
> +	 * to it.
> +	 */

This seems like something that's more fitting of the commit message
and/or dt-bindings (either description: or in a YAML comment)
> +	nfc@27 {
> +		compatible = "samsung,s3nrn4v";
> +		reg = <0x27>;
> +
> +		clk-req-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
> +		clocks = <&rpmhcc RPMH_RF_CLK2>;
> +		en-gpios = <&tlmm 56 GPIO_ACTIVE_HIGH>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <31 IRQ_TYPE_EDGE_RISING>;

interrupts-extended = <&tlmm 31 IRQ..>

> +		pinctrl-0 = <&nfc_clk_req_default>, <&nfc_irq_default>,
> +			    <&nfc_pd_default>;

You can create a group of pins (see below

> +		pinctrl-names = "default";
> +		pvdd-supply = <&vreg_l20b>;
> +		wake-gpios = <&tlmm 7 GPIO_ACTIVE_HIGH>;

Please group the -gpios properties together

> +	};
>  };
>  
>  &i2c3 {
> @@ -825,6 +845,31 @@ &tlmm {
>  			       <13 1>, /* NC */
>  			       <63 2>; /* WLAN UART */
>  
> +	nfc_clk_req_default: nfc-clk-req-default-state {
> +		pins = "gpio6";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	nfc_irq_default: nfc-irq-default-state {
> +		pins = "gpio31";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	/*
> +	 * Pulled up so the NFC chip stays powered down while the line is
> +	 * not driven (it is the chip's active-high power-down input).
> +	 */
> +	nfc_pd_default: nfc-pd-default-state {
> +		pins = "gpio56";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};

You can group them into something like:

nfc_default_state: nfc-default-state {
	nfc-clk-req-default-pins {
		gpios = ""
		...
	};

	...
};

Konrad
