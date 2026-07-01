Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A948478861
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 11:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905182; cv=none; b=jy6HiTwYZVqGMoXEWX8dJAm5G3ylCs4FlzELoxUvzGN3YZEKjf9pHreGD5kCuiPAw+fB/lPRJ2rzGjDZh7+dPMejY+93pCdnrdsYelPOK936WujXKVu8smJRnJ4rlO9ZNFjupbz27iZyxnAeB4dEQLXtxNjFEIL6VpkGesFK/G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905182; c=relaxed/simple;
	bh=uTrm+Ei0a9srd5hJciY+cu5JM3xony2sOLFOtsmJUCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mIRHIwdEufLRMWeug3Pff5ZuUtODt42eTgSA71BcivzRqA9qdoaLNBW7e35fTQM438uSKFt+L715vL9Hh9+3eaGa70XsdlLm4P0Ic8WHG+Xkvk4aNrg6NyJGGt3Z97Tc1u22EkvFFwoP/ur3omti9cpIvwqCOd8pmfxsC0dnY38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X2xL6q2a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VjbjiGDd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X2xL6q2a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VjbjiGDd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8hJu683204
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 11:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xp5p/r44DsE2JSugRR4ejWJMNXTC3UutYVUvdegbYT0=; b=X2xL6q2aSFMnFie4
	oymcz7Ls6BCDIrvnwREX6mT8rz7+qBNkuy49jcDCZXrfhLbtdNJQ2b1jqpGsRMO9
	e+2d5CLs2N+u+rSs22hFXE472jTFFApGfdoFzSKHgBGzem4ftBoF7FDoDp6pqcfa
	ddi8s5FSIEwLN17mTB87wKtm7cVdthudVFtUnnjBv5i4zQxBHR7oXEIXMna69FqR
	oQXzFFp2Fbx36tWImEto3TyiuhYGnLLXzv+A6ccs3wLkLifm9EJZYHLPTP89c/ku
	arPM0X2KOkn10Ivt/1yXKY3CPXJRiggxMJEPu2mxcq6S5ayJ95qn1x2soUT1fnE/
	0TWAKA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jtqkyge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 11:26:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c07313be5so1040211cf.2
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 04:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782905176; x=1783509976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xp5p/r44DsE2JSugRR4ejWJMNXTC3UutYVUvdegbYT0=;
        b=VjbjiGDdWyxtf9tO/kvng5MZoR+Su1jycpTd3/sDAQM7lG3pQc50/heDsI9QOsKjiG
         zubgED5MWCkxXPmRhJgG3qP65FsOF/9WDalFIN5zOMBPp43LbIDWXftpjFxC9GatRj3o
         LqZ6bDkrPiDzBJaW0GxPtnxmB0bT/8DjvwK+3/aLwh1JL4nm+Br4Nv3R91iztHtUjNOS
         cagnETz3ifOxGwLGbgN2IP77w9eo76uF70FAvFe6IiF5kACtHlkVhnL+RWZ+40YwftBR
         +IJj4qpY3NrmnJ1Gnt6wZbzpwTp7iHbv2N0IZ6GxaNAI1FL/3a7THmZ2R6St2ep6ShPj
         2l8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782905176; x=1783509976;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xp5p/r44DsE2JSugRR4ejWJMNXTC3UutYVUvdegbYT0=;
        b=nLbfmagv6S3AfPF36aFy9HkfbkIJKRVgDkaNfQvd+UW2W+aIrb+R/fQwB38ZH5txsi
         vHd9FZMlEeLddgXLRP6JTwApanhekmQxY6q59IkIDAf0tVT+fSk1pu75xcjkuoZuE51Y
         i+TD8jC4GwYSCo3jFSi5b+vl/uwNczvyY5IeS0Fw/QdbbNjgJb39FerjtQAaAVWcx9Jr
         MO6JIaQb9aGEN/5qJN3YvzzZt21dueKu+n+A3V5bXPlIuO4kLqdf8gXPhnhst4ab0pLU
         ymGLlu+GjH3zXVWit6SiOUUEmmi8UWXi6syeyJf8lRdvnnnuddDqh+F47AeM0kvoU52u
         HCxw==
X-Forwarded-Encrypted: i=1; AFNElJ+B3a5WyluUIkv1hdbiXxkctopmp3SRSWpulKtttnwvA+8+y6ztxYAk2uXzq+wMCKhWdn2GBn3PvuDF@vger.kernel.org
X-Gm-Message-State: AOJu0YxTeNaaKgjEPvbHJsRHo4VIyWM9eEULDxB57JDcRCv5r9xNPScZ
	o+IvMF/UlYbcmL58pzAPDaTtvb7ePriQYQ10OFXDA8M/QT9QY4f1yBewCNZCnrbMM/jAFhDajqM
	/DwyOgPM73CZlqi4rVpPvMDRDcSDW9LktEChfDjs/56A+J97S3DbOiaAVF3g7/MLI
X-Gm-Gg: AfdE7clhmnZFr9JfZESd58BVOEY9tOj+sizp07wtG7hN9bmykhyZJf+3oAqjr8F93G/
	I5D5k9Qyv5r+NznYWeJyBNFPcHBV501CGPlqPfgnRkRKNk0tt68NciipehgD7zYAqFZGmQFrcWW
	YO+BvzLT2Qxs0gjzUYZjwpsGdswPpIHzdj+vmpLyPFwQxhjCR5TE74GTNGtpAUHzRXBesHG7O7L
	vjYm/rEv5Nqp5duCS10b2bf0YvTKNoRE3ssPJpZrRhwG6Aj6owVsJF6+H4mAzg/famZGVdfq6Xy
	zKbkju4jWpc58s3iVqx48Jy9yv6KZTYWsTrti0VFGOxPNMXBtOegsoKbFyiaIo+WJwTEXMFwLxu
	3rMBpJUZhy7PnD0+S/ylvJn+4UdkoYdm2HGY=
X-Received: by 2002:ac8:5f13:0:b0:517:5e32:f3ac with SMTP id d75a77b69052e-51c2693f551mr9876401cf.0.1782905176513;
        Wed, 01 Jul 2026 04:26:16 -0700 (PDT)
X-Received: by 2002:ac8:5f13:0:b0:517:5e32:f3ac with SMTP id d75a77b69052e-51c2693f551mr9876051cf.0.1782905176008;
        Wed, 01 Jul 2026 04:26:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12a42b51cfsm70242166b.14.2026.07.01.04.26.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:26:15 -0700 (PDT)
Message-ID: <83cdc9dd-65d2-48c0-b172-d66f513b9c74@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 13:26:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Fix pm4125 vbus regulator
 compatible and constraints
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com
References: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
 <20260701-add_pm4125-vbus-reg-v2-3-6bac2bac7131@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260701-add_pm4125-vbus-reg-v2-3-6bac2bac7131@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RW2WGAIM0TugY3ndQFpBMkLpTZPTErpt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEyMCBTYWx0ZWRfX3qT0ZjSsIbsI
 WA7QTCkFMV0qClSn9HjlwR4hFYSR6GAsglRULwWr8vhIi0VjypG/W6ZHICJ2xmj5ceT9lsxPGcC
 DShajZIIlwvfQ4kaH7x5EMgrxIR7SnKtqUnqNk09ME/BbCIWSPe4eyIkUvM/G0JmXSRjvJrWEGb
 RZhZj1b0NtnpBB506OlF0PlL0MkhaiYPP3VdM6LFeYBmj/ztItLXnJ4Yp2ygKvYpKdvcsFK8dXU
 mhZMZr3rTtJMrp6ixyGVc2L5yvLkeflcscdR/ziYHRb4BM5J5M9q0b+1u5XfLbpNSyeg1xPErh8
 UlJWYLxbrvwlZLW7Rs4FlC6OxlP16Ecnu5ppYbrNmx07xViAhaBIDlHnCrSjqzbOOGPPjSAhm1L
 Q/coCsySIo+KSwro+OvKgiE4u3ybqdob98rPUjWpjY7i/spCs8XieDx32XSovnfhlhwfNfdTqDr
 IyRDYh2wF3vRnary8QQ==
X-Proofpoint-GUID: RW2WGAIM0TugY3ndQFpBMkLpTZPTErpt
X-Authority-Analysis: v=2.4 cv=LIZWhpW9 c=1 sm=1 tr=0 ts=6a44f959 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=AFF9jj2RtcA-9a89tu0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEyMCBTYWx0ZWRfXwrGebcQrn4ZR
 aDjPboYqrXK2PV64xckMaNqJRuJvVSLN6s62qnRWE8YOtK9opXv64p+FjV1rsAHlulX7Lhjb13D
 XgNCR9nWdn+pfjvEiSt7iIVX5B7TskU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010120

On 7/1/26 12:28 PM, Rakesh Kota wrote:
> Remove pm8150b fallback compatible from pm4125_vbus and fix regulator
> constraints in qrb2210 DTS files to use microvolt instead of
> microamp.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pm4125.dtsi               | 2 +-
>  arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 4 ++--
>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
> index 542e8fe030da40dfefc7b744dcc30133fdb35e74..3dc8d667d091ceb4267081d32b7aae983fc25071 100644
> --- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
> @@ -37,7 +37,7 @@ pm4125_resin: resin {
>  		};
>  
>  		pm4125_vbus: usb-vbus-regulator@1100 {
> -			compatible = "qcom,pm4125-vbus-reg", "qcom,pm8150b-vbus-reg";
> +			compatible = "qcom,pm4125-vbus-reg";
>  			reg = <0x1100>;
>  			status = "disabled";
>  		};
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> index bf088fa9807f040f0c8f405f9111b01790b09377..2b50f3f577577d30a87fcb6466c7d7690270aaa3 100644
> --- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> @@ -235,8 +235,8 @@ &mdss_dsi0_phy {
>  };
>  
>  &pm4125_vbus {
> -	regulator-min-microamp = <500000>;
> -	regulator-max-microamp = <500000>;
> +	regulator-min-microvolt = <4250000>;
> +	regulator-max-microvolt = <5000000>;

Perhaps that's a stupid question, but is there any good reason to
not just keep it at 5V if enabled?

Konrad
