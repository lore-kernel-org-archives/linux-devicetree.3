Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F80D3DE452
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 10:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419689; cv=none; b=exj8kp/Z2nsD/TQJ7HcTCNtWW0oU9smRC0EVMEaIGaHhEHri9Y0r1jDppsPsi16WRMa593ptzm7vwm2QFvBa7ebpv15fxggN5WkEibx0mXO2rWkyz1zsEbQWEcW5MYDJWXHZsPCGRKb2GmN2jmk4tLHlAoXXOun2vrsCTzeDf1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419689; c=relaxed/simple;
	bh=CFfKr9xzGI6ffVx4M6XwqWLSXJfpoH3uznILsiTSwXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GBv+tTaOA+14LD3HiupXpb7kRkrXVbxAUAw110QCNWI1PHSOv3gu1ig0S8tIlHRZii3UA6OVVr97W+hUl/B3wWGDn+T0uyAfcYh8L0tMrGYxSENKFmnX1GdSE/gfcNdKD+8VFinwOKR8VG6ScwuwPt4eFu+02JTzwXgyAl0fLyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FpCUP8Nz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i40LxH/c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FpCUP8Nz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i40LxH/c"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667A71dv3471384
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 10:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0QIPfSb0Mp9W7dJ34tbyFQDiEfE1kcRzhee5SFAsdYc=; b=FpCUP8NzwnZn+fZy
	EbqZV/VdlWANAjyPljjZ+mbdPeSkiKxmUjqejU4eaVfhCGTbxdxDMJEkwRfT49Mu
	NNH4FKt+YDGAxVGj2NR919Y2ieYU8Bv+nfZV9qogOCbEv5SO6DYTyHSa6GvFffI+
	3C4xyshcRSY8Tb2cgg/7OKGV5WEdeOvhGMsl2UQChqv71mMqs+77Y4zaK0vVvQIo
	g6HjRTGq6OCQfeqoZEFtbqBVhgsGGlbihzPh5dxzb9DjE+/jbg/QYueVxNGjfWLA
	6KhQlul0mJ9CR6QHUgWqZnXpUSbELgE/N1mlO2WT2hBBGAJKJU+iAtzWeSWMxbdW
	/tW20w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8ye0g1r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 10:21:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c267931ebso24302221cf.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 03:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419685; x=1784024485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0QIPfSb0Mp9W7dJ34tbyFQDiEfE1kcRzhee5SFAsdYc=;
        b=i40LxH/cxd91UCOFncqoEoSOF0A8PmuKDz7MiW65fvRTNPZOWeoMR5XRjUmyUNtXGs
         j0bsWBxTwAUsx+M1pAH3c+iC1pxFUJpPqM6bhDRFHVy6X2DyiCO9qez1791OscgSpZHP
         mm5ToLt70gEMPcE1UrkSbanpMm/IuBRI7FvCHQNynzDVbBYOZGKdB6aT4aWKia97sew+
         XwLyn+ixRzg5Xg08S4aKbcaHFjANrgfxNO0k/PrL2BGjIp0Pwd8swBJqwXdkzQMZjzRw
         zdct6s9o4a5fyEnMO2nOcX+P/gTFRgp+hlmbwerpZe5llKY4PIozy2zj8ULePfM9G3+H
         5S/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419685; x=1784024485;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0QIPfSb0Mp9W7dJ34tbyFQDiEfE1kcRzhee5SFAsdYc=;
        b=JnrvvafQePxMAKH42Be1IITHfreHflC4pgpbRChpnzvHTNkFjRFguuJ6KWbpRmvs9e
         en7xlsBrPpptfgKq/x/HmO+uD7PquOmvGFHUbEimS4tkFH8i1Ic+btzNTxVsz22a3u+C
         OSvDuw8tdJCQTafUl1awosb5wqFm/JiFFV+USUOyZilm9bUNGLPzeoHo1PniroySMVjy
         zjkHdPJqPtxEf2FBgYFzwzKpBolCtlTfj07dVdY7sM9KO9Y3Jn+EyNrFx7vh1MPdSTNl
         BCyKaKXpvBvq7I79TuMYwYA6tNisnq5cg1IGDJ+po11va6O+z7cV10h7pzNk9E6u81/c
         rrJg==
X-Forwarded-Encrypted: i=1; AHgh+RrECxojWUtEnL6EVArpsRIj1DvWi2VXocfY1UptiToqelYAoTRUQMO0jwhJpuhajI4Y5b02jT/lNekv@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0pfAgazZ0ME7zlFiEEBwr4Tl9Yxa+K9XmhHwxM8CK6K/I4FOS
	zs6ItYxL4oCIRh35I7ECBlWyt3gWHio+AiV2jB8M3pktv1rDT0xZ1FQy29oqglOL7fr0tsMidcw
	W3ZuVivPWipDcUOc1VQEwk/VQrRoyg2BTWJSc4bfd1lskmvL0dpScpnMorQoS9MgEQmb2nOlV
X-Gm-Gg: AfdE7ckEl+7/jkSe2IqV86LuSS2MCCb6LacaP/uBtehSwDYYRCChPZcaeXZ445JgvH0
	wrg3cvywCA6KZ1EIPO7LLTSoogP4hIlfI1ZqqyJhzrnfUqCTK5rMkGg/v0Bx1FMz4mZBdnlMAsX
	ssMb0NYgux91Lbn25GhGu87PkT75NcbsDblbSFWDtgWIzprvUQ3sFMS//6b05UXDrRor9zycrG5
	WA8rOF6bswR5GdNEF43d0jqU4Xv9s/H/6U8OVf7nL1Ret42P9H/k1ZIzpsBri2SZt8gVp2U7c60
	2tzpbIdoL+lVYPXSIr8fo2j5WbQoJrLvxA+jlkm0xOqm10zFbM9WPUeE3r+6y/oM4s7NYpN8JdB
	+3AGsICTnQgsl8aik+DqrolN67MjRD4f4ZjE=
X-Received: by 2002:a05:622a:1b9e:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-51c4bdba5a2mr121591471cf.5.1783419685477;
        Tue, 07 Jul 2026 03:21:25 -0700 (PDT)
X-Received: by 2002:a05:622a:1b9e:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-51c4bdba5a2mr121591341cf.5.1783419684925;
        Tue, 07 Jul 2026 03:21:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ada036efsm100233666b.45.2026.07.07.03.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:21:24 -0700 (PDT)
Message-ID: <04dfd2a8-a6b2-48d0-bd51-6cdca6250d38@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 12:21:22 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] arm64: dts: qcom: sm8550-qrd: add SPMI ADC
 channels and thermal nodes
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260702-topic-sm8x50-adc5-gen3-v5-0-8169953634ad@linaro.org>
 <20260702-topic-sm8x50-adc5-gen3-v5-2-8169953634ad@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-topic-sm8x50-adc5-gen3-v5-2-8169953634ad@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QKuX13l2ZOTI3pd87p66VJ4tdlKpNBTO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX4VLNjrpWsyGO
 uE6pBLwBe7RrpwcX9op1IQoZw3NTBDtAP/B6L7vzZLn8I4XXE5g/eIS4HZ0FBw8feJmk4y/MJCV
 oqMHs+4x57hEE7C+FjVNBtHfKVzrWPw=
X-Authority-Analysis: v=2.4 cv=SZfHsPRu c=1 sm=1 tr=0 ts=6a4cd326 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=FWBTG74ICMjwBxTGBBgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: QKuX13l2ZOTI3pd87p66VJ4tdlKpNBTO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX7Mo6GCh5E/1E
 TuWpF9o8cbQ0xRM376EWvebFhhOxO+BZVOYu3eughYUggOUSa54nXNmvBFZcS51YcymwdMLTVkj
 snu+naHRJ6wjUClun4cIjVoEX9B4rlJhfarCWYFTgrgj39GnYgCo2Rpzvk9/t115cDh6Hy25Tzi
 eweZas0VQ0hJ86JdXaCyTkzd5047y+v8tasxk6PE5joDUeUbX0MQKjnXtZVpxJkz9OxFiy713aK
 PDH0SeZJBGxTJY40y8+9EWPEWQYTG/xRxSsUP884Tli5uF1AYLhXVhJF7N2761P8TyhR65tWVzW
 wC9b99sGPGNAbpdRvoAd4/v2Rc9hm+qowM5cf+aW0X3LQJPKr6NJVKOhgYzJeU8jYVzRktJdC/1
 KOVEx2n6fD6JwlecxTZY+KmUzX4608+5RuisZLRvA4VrhuuF7wZbTbwwpHGrzCkjDdJgC2QAwdd
 OYtJoDlO3EypWDVTssg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070099

On 7/2/26 11:48 AM, Neil Armstrong wrote:
> Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
> other PMICS on the system.
> 
> The thermal nodes are sorted by the sensor channel to be
> coherent with the system thermal nodes ordering.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


> +	channel@749 {
> +		reg = <ADC5_GEN3_AMUX6_THM_100K_PU(7)>;
> +		label = "pm8550b_wls_therm";
> +		qcom,ratiometric;
> +		/* use the default settle time */

P.S. grumpy nit - I'd prefer if default was captured explicitly
anyway

Konrad
