Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F4E1991D4
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 12:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782130613; cv=none; b=cr+1buc4E7Gm8NaH94Q29FMBdWREMkwQ1iqMS00l2+53DOyaqdFafrCil5/ocXGXQSnkimd11xKIAvZSzBMdal/PeBB7ROjc1mU0bAH8yy3vPdcc9dShDaSLMPMCMMvmwoqBmr7TefufULNiTo0AvOufaQyn/lIJrT4smeaCQOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782130613; c=relaxed/simple;
	bh=d1OMFEczesT6aey4ICBnXcgo97VHr6XrDOsG7BRThEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=irnykuXA5ItdRZEmA8fLp09qw/tOPli3tii8ZT9vrfHzO+IwmZQ/O12YhP8H9pImbsAnXt+yGiCB5if1X7TotRbvDl4UUzr7rY1hz35BTIPcIjmxTB1svh71P6dStmTeSEAgrWfx1PFMDPNy7sZI0rlLT7/A75wXnhe644WWUVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HMmdZBaE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kj+hynIx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HMmdZBaE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kj+hynIx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAnAVq3213581
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 12:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wJOjnFQkq5H5GTU+SJrXEcC99r4XcJ7w+h5QuLxokTk=; b=HMmdZBaEF5AbzHWw
	Gq2l8ImwCXCvsGgHcj3OxVoI2aCMp7xXVYzYlvcTbrK6YtRo4+YA5qxjVF26kI0v
	VtwaSytjsbUvP82OVx1GAtn70FFzLoMUrxVP0ED/aR9Uxzy5RR9YSWveuATA2Lue
	QQFgzzk04VxF4MdnDTKUt1LeKsIs9HUsLazGrKG5wb/SbPmCnLjIy3nWZzh9zx8o
	PNHg9aWJe4FCTG4BM9wLIWfzscma8Qh1UhCWFX5PPHprl7djekgbaZ1jBLdO5l/w
	d2jPEBTx5xrtPXfCM9+woOdvr2kzn7mV5C8JwAhV5csDGD1tmVKPFHth9iZq8CQ9
	C3wGKA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey2yhrdsb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 12:16:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ddb0711609so25126376d6.2
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782130611; x=1782735411; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wJOjnFQkq5H5GTU+SJrXEcC99r4XcJ7w+h5QuLxokTk=;
        b=kj+hynIxJVK2O013DeHeT2aoCZK9ZgYHg3ag0/L5yGfF+dqDskPCzlmRGujfQEHPOj
         /Xz656xGjZYtAcXtIQxc0CNVXbEPeRLy9CsIllSFgeBDiojhlRoORCF5tPcbCahvrV1W
         831DSm/nUi3BMXWNv4/e1sJKNl0JOdfiGPuk5szluc5I6vJtSYi8FecPiJvDZAPEm9za
         pMCadF/kqxfgAjZB5FIv5dPcHFXvrlXIpHpB7Tm5UO73jnFAr8foeX+qUH0NxYIHT2Gz
         uegS275e0tzgHlI0qQDaurIxUjwTuQtz2oUv/tXM0eXkXD6aQEC0C86lP4Lyeaj1V/ck
         Fj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782130611; x=1782735411;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJOjnFQkq5H5GTU+SJrXEcC99r4XcJ7w+h5QuLxokTk=;
        b=WR9byZzub8DpOzyxAaliQrrGaxVvnq1GWctUENzo5frK8uauWrBN/DNOHB0pIktzY6
         ClMT5JResQJ1fjaIEBSupOm/mpkwDh38zICklIkN665ZPvbvoJFD56zIMAWuv9F/K0tN
         hOVKBibMTIrDRqJYWzxxnHIfr6E6M7trSYqRNnPIcfoWSun1JlSr7k1kU2ISk/RU1IAi
         zBP4+g9ExNs4NvOJffNBWRxbvQ5ByHbda1krhcKXN/Z5Ycm8y3yLKlnFZtQyfHgMmNKl
         lrotIfCXK/19TJBgufmwCaI+NrKraeNIDO8o0KWI8wVynMuI1e1ixWntklsmpOj21z+G
         kJvA==
X-Forwarded-Encrypted: i=1; AFNElJ+Zw1VPTvK+YQJw/old1PiGwom9EvD0Xp7zuplwzTPyTN8JtE180pwyRSIL53v61lx2M0bTlupsedaW@vger.kernel.org
X-Gm-Message-State: AOJu0YxfE8QKiYPE2tGJLUKK4abPB+YC4HffeVVwCI7XHQTA4MmprNKi
	z8PxG7GzDVCBKBT5QI/9tfqz2HlvX4bxoM6XB6FnwioMUSh+xj27/NSwmQUPsOzsk5loPjQRP/p
	rcI8ZZ4tslb6rwVMfPluS9yCfcZKtP7wxLq1ScjJVpU6KaWCcjJREY1mvB+Jm9ky5
X-Gm-Gg: AfdE7cnpNuD4eT7TqcUOKiU4QvpMYJf8Y6YVVnsfdVabwwMQ/tPxIJa4bAZCS3y3AA0
	D7D6xAQ5wUoB6y5CGC/khQ6/6DBtisyoqtY7/RHMoHTrtJvU3RTpFzApRGGrbGC4ASVEHscdPA+
	8SPjkEPOiAeUx4zANncGA3kpE/Z9+RwF7bAeAOQR84zSBK+jBFAyFqnXrVZ7X8nXdwJnH1OjUpB
	nhIOcp+jpD48OTi9knG2CMNI6UZ8IugTmiw8C3PUvTyOSnHSg6YH4SaW8PcsOTVAFPDf/OpHHxK
	7dMtl11NzUO3o/3HOvnzmtncmpQI+kDe1qYaIU7/+WcVuxPO/ZpiDTOoqcPAVXQW/hwZUeY3Uvd
	lfC2y0+mRGcnWl5/NUz0Kk0P4Ez0fxCLG1ZY=
X-Received: by 2002:a05:620a:44d2:b0:8d7:ed38:8189 with SMTP id af79cd13be357-925c393485amr18390385a.0.1782130611035;
        Mon, 22 Jun 2026 05:16:51 -0700 (PDT)
X-Received: by 2002:a05:620a:44d2:b0:8d7:ed38:8189 with SMTP id af79cd13be357-925c393485amr18385885a.0.1782130610418;
        Mon, 22 Jun 2026 05:16:50 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad5c268375sm1647281e87.16.2026.06.22.05.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 05:16:49 -0700 (PDT)
Message-ID: <314bab03-5f19-4954-9ad6-fe14d429ff5a@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 14:16:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/8] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-6-c939c22ded0c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260621-tcsr_qref_0622-v6-6-c939c22ded0c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEyMSBTYWx0ZWRfX7kGjtkU+RkV2
 nEfOGaHOUtFz5yQN4mScg4i/9E0+7aWOOTwR2+P+QpBDBr2SzHP4ZQkJ7jhX6/KQ5jESSblxEKu
 GxfWeLfHHhnM81feaKZiKFVuh/rrhEo=
X-Proofpoint-ORIG-GUID: dBq5owDsPs8uLyNtXLRIAr1Ws8drpp5u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEyMSBTYWx0ZWRfX6HIWyKyXuCNh
 /Rg+tEXLN7jDme3gUYNrW/5SbPVv1NS/xZyly7AUYKYmI4iZtR0csvA7PbEuIn2IJJQQHCOJxnn
 5Wj2Xx91ZgUWiAg1Lo2PeQEn+TFGSvVfk8SQS5youZ2woB4Dg3z3uyz/0a/xQYHwqZD4Ij0JFty
 oiQ16QHxyA3ab7+MK69Nrh8eAm2awQpop79KweHrHAGIkXXbKLdtPHdKBjK/Nk+zADU+bv314Mi
 3KI42cDDO8JmXWqQueu1KCMVYiAVs60B9S+0hCXQSMuO6LDosLGFTWjvnIcPu7SIBEtD8kdr+6T
 mBaO0n8CntMyvuHm2a3Ylb+pfQ4p77a34h0WTquEmKmk/LFBiv0ruTwbCJWE4SU85aqYH517ZVl
 qwr4uq8RYIyRWOvK8Mi+Ibnif1MZnf1l/dQjrYGhLwO27x6a/R5i4vcZfwrEe/T8VGJoc4E4BNo
 MZVfjBu6c3L1evoRwvQ==
X-Proofpoint-GUID: dBq5owDsPs8uLyNtXLRIAr1Ws8drpp5u
X-Authority-Analysis: v=2.4 cv=cKbQdFeN c=1 sm=1 tr=0 ts=6a3927b3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=5oxNwPwbBGZRK8DKsckA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220121

On 6/22/26 7:11 AM, Qiang Yu wrote:
> The TCSR clkref_en clocks gate the QREF block which provides reference
> clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
> and refgen blocks on the CRD board.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> index c98dfb3941fa..92b929ee3448 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -278,6 +278,26 @@ &smb2370_k_e2_eusb2_repeater {
>  	vdd3-supply = <&vreg_l7b_e0_2p79>;
>  };
>  
> +&tcsr {
> +	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
> +	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
> +	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
> +	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;

l2c_e0

> +	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;

l2c_e0

> +	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
> +	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
> +	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
> +	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;

l2c_e0

> +	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p72>;
> +	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p72>;
> +	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;

l4c_e0

> +	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
> +	vdda-refgen3-0p9-supply = <&vreg_l2f_e0_0p82>;
> +	vdda-refgen3-1p2-supply = <&vreg_l4h_e0_1p2>;

l4c_e0

Konrad
