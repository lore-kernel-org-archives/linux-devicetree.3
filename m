Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F2F3DF018
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 11:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779794532; cv=none; b=kKRq8dyBoKZVzYM0GaRdksykucdxH1JsWTF1vsHdDJLpq0to84dohpPXOPwLEQ6qMZRyxMWXUIOC+Kld/hJ+7MUc9wPYVC/BZLH74fjY2QclRp/vzUnMAFktTfJdOYGGGz/NBIcgPLUP1GCkDYYPLwItbnaSpeXem+/pbc/eXpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779794532; c=relaxed/simple;
	bh=HPoC6rJteLMphgQNQ0wiQJqIp3sHCF1ZNTePGRjNoQg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kWFg2NYPJQOt8B6vD+slO8xrOs8N87VwJJ0Vi0atDUGSKR1uVarSVAft2AJIb/TPL+aTJHWdrJBIeiRAUQpR8BW2hgSmpLMJu3E8vXYUJYqghgEJPB7NssghsqAoYLQAOdEFIA+Vj4WOhRP9tbr8QOx4uYFmtTyJrgouIwu1aEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mo7nAypP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fhe6Nfv2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mo7nAypP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fhe6Nfv2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q9Blvu3658079
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 11:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4C2vpU+djMgOS/HeGKfY8kZwd/xIc9o8k0Mae6RkgkY=; b=Mo7nAypPes/lIvzv
	xVR7JEO73naddGGHYfHcC7+NItksSdRYHLiTWENtSdhaPPrRmgpfJpg0Gio8H9zt
	cERv4XL7qM1im4bZEHhVx+nZje9XpWmPS6MCVnYZn7XCdOG2BKPu2ancoPKZxyaZ
	A06CMPWJLOCw5WjpJaTMPbgHamf35EpLlKbUYBZUEsSDGqNBpgl/ymClPxaQv3jt
	c+Vf/OoGaF/3mKtXcPyvS4gsRxUwlhKkyNyoumwfCdo/QOrrnhxMxCedcxsUlWeP
	etB92piqhdoM5AE+1SEu03IHOMqPpxNQG5ypXR7ZehpDZpb+gFZIeZHXMb4HD1cG
	VRYCog==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqynbhww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 11:22:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-366ded5ab5fso20356673a91.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 04:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779794529; x=1780399329; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4C2vpU+djMgOS/HeGKfY8kZwd/xIc9o8k0Mae6RkgkY=;
        b=Fhe6Nfv2DIrwozQ8c1bL0GA3d18jEhH8gtgQIB1Ez/ByIT6fQcSVZJem/1YnrPqHqm
         32LdzbjAxXx68yeAVlW/mJMDLWbSdSkW8pJdhM3YQz9HVGMss9Hj51fwl/94kfenCU4m
         J/YJl00iNm4vqxEtDvcaA9peKSFubK3tnsreWyMs/v1sq36j5boQ0Eos+u3HfMFyxeor
         kgGo7tw4urH5R30UTRr+8N7IzjnJ7EQenb8+yuRt75S8DHQeVJyB1cswuNurWpl6lA37
         JcgyLGwkmZIAQHAWNeuuz7C0f0mQvRn01QNc6dHJPdIbvyGtQ2K5A/W1klBniZmP40Y6
         klkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779794529; x=1780399329;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4C2vpU+djMgOS/HeGKfY8kZwd/xIc9o8k0Mae6RkgkY=;
        b=GDXecDhsS6W91Z8ZUJRDj4agYg+C8nTV+t2++v5UK+p6zJUe7xvlnGbi8U/eD5xES5
         NinH7z8yRMC2QS4SaEqhLz6zy9KVM+VL5v1uM31VOOH6bwkup3ZNOijtEXZBsAtmVT0G
         QHOoTaF/YRfwang00pjss5DVBGdD/8M83o/ii7mEO6eojDbAmXo/RlVRBDU5cnKOzq79
         4PX5CmRABpvyH5A54lIKsgeVKOCctcE0a3rm2cbqYMrdLYvaGHTE6DdFO790jr7E7oF9
         9U+2gKpt6KS+flPyEVFdesFR/453XJDmG7O8lgZxgSFJNOWd5+CAM+LPpq/vqRdxfBqi
         h/nQ==
X-Forwarded-Encrypted: i=1; AFNElJ+x9huee0bqUL9tNYr/FOUYLY/LYfU1KVwbl5sAUM8/zQYAfsT07ZlSrSPznN3h6AI59NaWCyQ+FB2u@vger.kernel.org
X-Gm-Message-State: AOJu0YxODTHNA2ZKMIU3Y2sz1+x/e8QzLCFlp5Nhv0+VRNuGn5S8X1RP
	xXJZ0UyWux8ThaBw/DHJ17INt+jTc7MGBjGXztr4XtJ+Irpra2GmnYcPWsTuGAGVaB1YY90zugJ
	456mt8ak24XRNDSod8HAp9ddRWRtAkak+4hzH2C5Kpzqg8Y1iwAU5YUTsgV43Yp2N
X-Gm-Gg: Acq92OGRUYBya3Sfdgn4Mt/PU2TOj69rUeDewtdB7HXD5ehmfobjk+wDmxRgQLKdE7/
	vH93Cet2eG1NERBonSgdFDWqOkJo88YrR9ADHbPPRDKMkva8XRJP93xigNGCifONTHsEdlrk+Jw
	NqoXtX4rVigOgX/2v13uhzjyN8Irv9/Atn+Tc40Hueh/SH0pw0bq6EjnRKoBPQL9mCF8N+lsl20
	f2sK9pSIhqm1HhsM9GATyQypf0XDU5P0gXs+z4PaOiUSf4n1sZGoo6Xc0anbC0JVXe493SX3fMW
	z0c4Pfhse/nGbtPmlaV7r4Hcm9vY/e22JLtwUIPSV2BPmULLbjMoL2yKxZYzCvg5gxV8NxiOoSI
	1jcWkVMFo20OXh8yG6YpV1sIb8g5pKIOqEkJuKzx5vernSSuyR8IWrg==
X-Received: by 2002:a17:90b:3c92:b0:35f:b6a1:8d27 with SMTP id 98e67ed59e1d1-36a67626883mr17354834a91.18.1779794529227;
        Tue, 26 May 2026 04:22:09 -0700 (PDT)
X-Received: by 2002:a17:90b:3c92:b0:35f:b6a1:8d27 with SMTP id 98e67ed59e1d1-36a67626883mr17354800a91.18.1779794528749;
        Tue, 26 May 2026 04:22:08 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c4cd92sm12727620a91.10.2026.05.26.04.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 04:22:07 -0700 (PDT)
Message-ID: <b863942f-9c3d-ed28-aaae-542f230f8d2a@oss.qualcomm.com>
Date: Tue, 26 May 2026 16:52:00 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v6 14/14] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <20260515-glymur-v6-14-f6a99cb43a24@oss.qualcomm.com>
 <pockc2vpoobmhk6pwy5wluekbdgon5ndtltbs7lmq2s2hxwhxs@qp6bhwl5de7w>
Content-Language: en-US
In-Reply-To: <pockc2vpoobmhk6pwy5wluekbdgon5ndtltbs7lmq2s2hxwhxs@qp6bhwl5de7w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wpwb99fv c=1 sm=1 tr=0 ts=6a158262 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=SF19eQfGBgBI_wA4TrIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 42EKIa0H2EcA1cS-NnA9XL1sg8sONT-d
X-Proofpoint-ORIG-GUID: 42EKIa0H2EcA1cS-NnA9XL1sg8sONT-d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5OSBTYWx0ZWRfX8xLdVxJkFkqO
 ht2yMbdEAvE5xLovAsCGVaaUywHEHGOFAgc2X0fqgdetisURAx/6AyTXOCYisq0zc1v9OuGGvcf
 uu6T+4e0010J8sVEq6TmOwsL0mY0PDz+c70rCA4gEnVl9YGdBE8vLIRBcStkY5/sdgiUX4F3BCb
 NhoEM8oWcizqgfVFmV5Zrb+JeVkiHN+qxkDz9a7crdjG/aGC4TfcdvxT/snEjEfo4leuJNkkIwt
 xxfkdmjQkzsAv7kki7eZztmWaDGfAdVsN10xf2Jq2OA8p9zJKmCE6kJ1ZuGDCfBPSqH0OBVLX5d
 ngXsBf3aOo4aWI1V9zVM2weVZCAZQ2lwLPEdG1KfmVtZib5/FCPCQjf8eTTOVNUzXmGboUH71yp
 a9WkAOVB2jj3rxIz/X6HQOyquSieAJhC69PUAU3vg47Siluy49QgrQBADJwmzwVI3J/QtmhwRcn
 suMAmrXLY6f2jh1WRKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260099


On 5/17/2026 11:42 PM, Dmitry Baryshkov wrote:
> On Fri, May 15, 2026 at 04:51:29PM +0530, Vishnu Reddy wrote:
>> The iris hardware block is described in the glymur SoC DTSI, and enabling
>> it here allows the media iris driver to probe and use the video codec
>> functionality.
>>
>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>> index 35aaf09e4e2b..8d6ea857634b 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>> @@ -198,6 +198,10 @@ ptn3222_1: redriver@47 {
>>  	};
>>  };
>>  
>> +&iris {
>> +	status = "okay";
> Could you please make life of distributions easier and include
> firmware-name here?

Ack.

>> +};
>> +
>>  &mdss {
>>  	status = "okay";
>>  };
>>
>> -- 
>> 2.34.1
>>
