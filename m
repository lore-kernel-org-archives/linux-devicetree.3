Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE022F549C
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774944773; cv=none; b=noBfXjmHZaRqovRnn84ImRPtbl1Qf1Sio5+I4US4m5t3KkmboFhWOq9W0lc6wJo+V7Y6RHahIcrFYp5EA39MDwUotH9knNPY9EHDjlMrn8LqDLxpMCDbJmP4bdQKOgQGu8eTbYhsf5kVy7x95fIzHRyVp7kkL8pEPBt8vlhBVbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774944773; c=relaxed/simple;
	bh=MrpfVQAtlKn6pPN7wuY2z9ZbZDqOvXvS9V2ILVLhpSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PPiRdtI8FuwWE52ueWwMxI7mSTqtIP1rjb9Q9RGToXIKj7KkTdCqXn3wbK3U/qM/dyjpSnp7YgtHIkREqklL/UGxDnae0lQW9nvEeahIBKGQ9+O7Tobq6KIDdTUVzGs/pEEfLHu0ri+l6alw3aW44v0CZ7jfCPGSh8BqrxQqrzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sq8enHny; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zp9xgnMV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sq8enHny";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zp9xgnMV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V5dopr1841965
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mk4lfVHBGntLyWxGlRgv2XqqqWoovfGZOwVg3346vwo=; b=Sq8enHnyg6/+Qhrk
	Rbl2vngOd2uxjbwBQ0lkFCq3IFJnlsMfjTc2LZxJerWRCmMns5znRl/oi7rK6RLC
	WSGG5GnYAtl5IK/NFD0AG2rMCYqEXSWlQoXUB6W0pu9im3xUJ8JqbxFy2yiZIQkK
	wQb2dRnszEoOUvRK1fcpZBFh+Q2Ky39EHNtkGaQQVgmA/rDniC3anzSPS2Pru35L
	Ov4EbnT7ZiWOvxkhtGxVUa/zKD7JGOnJ87+Frw1rlr2NzYex9N2Bq+NKSH3kGALm
	n61zvYXnn3ilgtX2e+Xor7h5drlKuuPdRq4uMa1mGc0tL2p378eBGILVLimu2Dao
	xLm1Yg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80rsj23w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:12:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89ed6f0c71aso11793116d6.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 01:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774944771; x=1775549571; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mk4lfVHBGntLyWxGlRgv2XqqqWoovfGZOwVg3346vwo=;
        b=Zp9xgnMVQ+FTrCpNZ0sXDtz0K/Yy4MGeceIilMk2kd7WOVtTRD+giH8BP7peOj3OW9
         Fr4R5ocmJXAqMOipna5nLFJdKTlrYDrcJnQJYxM+aiCGZ9VtEPlgNPXysqClrhflafU3
         k1EkYsymTNiu22huNnjh6gBx6tlwLFTkCRDXo/2RlzgzFmFAGexHgDnF9zXCScyt/cep
         mxPm1qfGaxNC/FFP8eN+cSaBzSiyGTpLMVvTInoSSs0viRYHllIXDHUzgvm2TAUnQmYs
         1Q2RcjHpackSisa13u+Isu3vjn+i+WbWv5+ycUiHfEQ6ylR3geakXVHWVE0dT6hzXG/9
         gRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774944771; x=1775549571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mk4lfVHBGntLyWxGlRgv2XqqqWoovfGZOwVg3346vwo=;
        b=iC3goP2DGGtr5CGXkKjmyKExFs9Sbnjtz1pwWcBZNfcwQglAOBdI+IqPCg8iNON6Yn
         CYmEpXWEVq78cC/s/lkSqNkHYvaRez+lEW5ZU/ZaD+fCgsToGS66LZcbM5nEPy7V1fcd
         588BzfW5h9iHLqAQ4/fwhupcrdAQi9X3Ips9fugogjR3JJFSO1vIFKKgCSfJYCsBPEIB
         g57ga3wNgs/+P+FTwODPjtJn485L5VVIkDBLbdNDYVbUOxUdliD2pIkYHfUPaVRDWWSA
         e5fxpdenLxB26qAzFHVMesTwj29suYy43fBUaCDFrXycxqWIjazt57IC+g503skauZuG
         UCVw==
X-Forwarded-Encrypted: i=1; AJvYcCWeRi0EtZoLLkSCV/YMb6UhyxuotS8tY+7cvFi0h5c6Q7kwMxG3fD6o5MVmWiE5kN/Z5gt5l6/Y69up@vger.kernel.org
X-Gm-Message-State: AOJu0YyPqVjes1TRl+66xJVcbolWenv5Y298i2R2IfvBrnhvchdSZO8a
	/i1H8fbyIJ+B3rql+GEQppRI9vyBhLm7vhnVSPXu4WuR4YWMAGcZarYwyp3t7eMYlePA2u9E3lP
	S4yTw0AqwezEf2ue/FrKIUtf2qkW0NsYOs+cxvaDIRFneoajXq9h4bbn2ufnXZ8oC
X-Gm-Gg: ATEYQzzc7QyOgDMyQ/rZ/THoaZ/Q6o2FMqZiHJoZ0k3993796BYgV8G/SyJ2RX2U77G
	MUhpKS5NW27vCgc8yT2bei/h2ySwGLuAdpNRdK87JrmEfkHbFBbpAG/5f6paAB8rjypwlBjBFC3
	fRyt1tmZNzQtrqpr2cSroN8NZ8GElHDfooONielPFGQwUJvUhXA2CdWzmaKrnV2liJ/ySHcSOOL
	nnTQ3g+qeSEccFJ8dHZKt/ThAMNdmYRC0VOR+RVbVHjQJU9LXKQXGRCmz5nbrWDrwFwiO9ZG/CM
	2/OuJkACsSx+y4FtxkhAzjXrlpfzRIL2jRr7FaAOAU55R1qeIMSzj1xL7BOH5NAbAa5Xfo4OcP/
	A64lN7PsPYgjC1iglb/73hyT0fjBkRzrhJeJPe9Q7GgPJk/EWjR1GkKe7EahM++GgK1Ftc3BoTv
	1xi0E=
X-Received: by 2002:ad4:5aa5:0:b0:8a2:2cc3:2764 with SMTP id 6a1803df08f44-8a22cc32bc5mr52131606d6.1.1774944770853;
        Tue, 31 Mar 2026 01:12:50 -0700 (PDT)
X-Received: by 2002:ad4:5aa5:0:b0:8a2:2cc3:2764 with SMTP id 6a1803df08f44-8a22cc32bc5mr52131386d6.1.1774944770482;
        Tue, 31 Mar 2026 01:12:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b225f1esm378843466b.61.2026.03.31.01.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 01:12:49 -0700 (PDT)
Message-ID: <dca38974-629a-46df-ab72-4b11517d2c7b@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:12:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 2/3] arm64: dts: qcom: talos/qcs615-ride: Fix
 inconsistent USB PHY node naming
To: Sudarshan Shetty <tessolveupstream@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260331060107.501561-1-tessolveupstream@gmail.com>
 <20260331060107.501561-3-tessolveupstream@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331060107.501561-3-tessolveupstream@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EfewclW9bia1SJeXzOvlUdaB05qNfMSN
X-Authority-Analysis: v=2.4 cv=VInQXtPX c=1 sm=1 tr=0 ts=69cb8203 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=bZZ6jWn36qTL26E8i_kA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: EfewclW9bia1SJeXzOvlUdaB05qNfMSN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA3NyBTYWx0ZWRfXzBdmKI+kFpYw
 izE2TlPB84cgofPp3FqJc3T7RWKT2THgdx38JZE92eFJlF/29DP8joQlpSamFnxNtGW8ukOqqjl
 Ukv5ZkzZd3ludsNNA98xHjLwf7HzIVJInqmkj2HuteSdd6MOGNFb+3+v6AJi30qMOS6Qt9tmHLv
 c6K5L8uejeFuwuXzWIkudeRGeIYA7kx0Mxg+8DyfGMOrmgFNt7kXBChwJUt01fPfLxdfMX8S90U
 zYNFAj+tpdlyNWg8Bj8+Y7U0msVfb6OqoA1ChHddMy0Zxu4WYftRpMtSSVZO0vPc18UuBof32r9
 ofNnMWmC1Ff9iKL1nZ9UjM6mUV9LdCDnr65y8E9W8bOXiva8+fizk+oiDDD0E0IsLMVKyysRNIB
 oz3MBLmmGpRMXo0qh8+R87eH3KoHwBMqcpizl/vi5V97oTcFqxZkQB9dP20CgAquVpPp5uOfXWX
 1cvax+jMuJG4ddb64rA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310077

On 3/31/26 8:01 AM, Sudarshan Shetty wrote:
> The USB PHY nodes has inconsistent labels as 'usb_1_hsphy'
> and 'usb_hsphy_2' across talos.dtsi and qcs615-ride.dts.
> This patch renames them to follow a consistent naming
> scheme.
> 
> No functional changes, only label renaming.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
