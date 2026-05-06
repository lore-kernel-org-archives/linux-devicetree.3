Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24D63ECBE8
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 10:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778063670; cv=none; b=myVuLbDMuzZV5xCA45BVcl9uLsiwOheGEk5n7Qu2KZ/KuS/Rw5fybV3gjdlnmhYGGmQAS2Z9TnGNqRLRWlqsI3rUwN5pyy6q9rMglq8BRiUGDSDxl4xvolUXrnv1JlItagukNViC+Cq98SMjmh+8+jo/J5+a2BojcCpkPLRTMng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778063670; c=relaxed/simple;
	bh=8pD5Y2Gw1xXO6MNf3qMxfxJoU4QawtyS04q9c1OQ93Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=idRem2f+sIZyMzr2Vzs98jrJciSxClP5QjlzhsIuBJ09ssHuAy+NO9HT+GTr99zrL69f7SvE0YGONTgKjsjMC8neyTG5VUkxgwXy2acGgKwBN1SmrPJP4Q2WZiB5/tcHeblLq0YV2N9Z4/G+PnJ93wo7gzWkYYcze5QCXXCiwRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WaCPXV30; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fKL+MEYy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WaCPXV30";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fKL+MEYy"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6467CYfL1527748
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 10:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SGXrGDHADy4VW0xAVeipqzNuBCg4PRMApMn7mO6mfPA=; b=WaCPXV30ob4WS8PF
	rWGmiAbm2TAM5Nx+VJqKv5GbdxsX8F5slc7lOzADZX6GJE9ryq1tkGvqWymy5Boy
	sAgqwGnrPg/Z2SGuv7XZ3ojUGE00LIPavhRijzteynWMlJiJwDnL6R4JsvQZxi+2
	AYS5EsmO/lEF37Nj5byPt3rMQbMiAzLtrIcg5n6q7zru9BAVQCW1fSdVH61NU6A9
	UhamLeGXL3EctLlGUm3v/idq6PuE7rqXFsXf3xyWBWaVqCWh7sjFbPMpVh/fAAAA
	ved//T1wgveYZh5pvnJc4QURIA4e1KC1i7ET02pAWtFc2qVpZ+FIN1RaQ/Kldgpc
	DDU/GA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e01288tv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 10:34:27 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-573ac60fcc2so579556e0c.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 03:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778063667; x=1778668467; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SGXrGDHADy4VW0xAVeipqzNuBCg4PRMApMn7mO6mfPA=;
        b=fKL+MEYyLwffKl/zktKjgKH2Qb9hz7OAE6LAyrNGH3IDvY7bQGGwvmVU4RDCfduknM
         hTmjx2MDj8k9rnvPOgst2if3Jmy0j77fht1fiz8rEE67hNuBg7kB57r+X37rjEwlGgiO
         IhL/csDqMRxDfGxj+9KU4ct31NYXGFTYkzqGTzRHI2TN33QjcfX3+1RBkXyqfEL3Ma/L
         gqdBY/ZLfcWHwGVnmBO232Fx0c7AxePOcgDoTAdzP+BF39r3TTufiMZvN2qFspdv1CTt
         GTFvs+doidfuHFKZDkKBIC3vOteTLq7Ekln3nQM6+lpRu7cRGqoai8jQwf1xwP72YU7G
         Uu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778063667; x=1778668467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SGXrGDHADy4VW0xAVeipqzNuBCg4PRMApMn7mO6mfPA=;
        b=hkQwjF7oDnY8Pqd+DvElcn/GXvZsh60vf7ompvx4Rmd8UJZWK4uXA/B41GfcZOOtDD
         sgayE2zGQMcuIM6stGzTrmHBnrGBNgOOOB9hf0VVhKedQVe+j5wmTFuNvBUIdDHxWO6g
         t9HDBRDkcmggvloTj0V67Mmyj7ocAc6L7IegXggL8RerzwHHNHkVr2VPpTW8/d6tzO72
         weEa/zVz6OlMy8elmeJsIbAGBIWrkMfGpJTamfFQaoTcyUht7mIUpc6WGPHr5jtiWjkK
         Xts54ib+rk3ZcyggHx7DYGYE8fCdYBsr3mD8qGHN8YBlGfYsD7PEA/g8+9UCevCyJowE
         B8yA==
X-Forwarded-Encrypted: i=1; AFNElJ8klfMHlJs4K6uiAf9Pu0VQ1dzQQfrPKzTN9gtdBOmZLVkzW6IcCyGUkT/V6zMqIG5jKu3U/gDgeQq4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1WVDOJCt+hhBXEJ02nQsL+0r6/ae42RsJRwPCZmDEkcVXK3cd
	g/mXZq5iPKOsXDRkrKzJGoI/9kjU2mHyM0vw8e5MGmQ2tgNVxiSz0umeSasgV7HudhjTyNX1LMW
	EhDuKhRXDjS/DDTc9mtFTxCOjDlJv6htZmxGXV/6OjVaIfj1+FwQggHEYbOJfcGMrep5a79/f
X-Gm-Gg: AeBDievlqXVHqiDDNDgsH2uRHm96aCo3abAIMEq4OEmHE3/wjERtknndJ3+DSsCFTdn
	WZk+yoJnv/LsHSVpAOujWzC3Z4F+g9vYQuPYP+6q8e1VzOrbv7Jwbozhr/aPLYSlMGtCDgbcoA6
	CkzBfpuYnjG0Wr5M1PFHaV+MXGgU1BzRgIRrAKCBmR8XhqrrpJ14b0QEDhMFLKXHkTsaaEqf/2S
	LD78NDX2xfSsd0VzDhix6JCBPlJbxt+9S9FMjdPpFOgTu6a2WqxAM4dTF2M6DGgf8mRy7gfLsQ+
	fRu/bcIAcdeJyitLK3eJ31lbWFb+SCFX+8H6iNnrFsvO3S0ks6+IykqbAHWvjDXX9pWQPF6cV31
	0Ygmc3Sa02GtB7zOyMiMF1EvQpBI6oGMnO8hxgb3vKArcYYLW7VKd22numlJd7ZR4LMObOquA5a
	H9niviPaeTozkSyQ==
X-Received: by 2002:a05:6122:5017:b0:575:24c1:f668 with SMTP id 71dfb90a1353d-5755b2b0d03mr285587e0c.1.1778063667101;
        Wed, 06 May 2026 03:34:27 -0700 (PDT)
X-Received: by 2002:a05:6122:5017:b0:575:24c1:f668 with SMTP id 71dfb90a1353d-5755b2b0d03mr285580e0c.1.1778063666712;
        Wed, 06 May 2026 03:34:26 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc55875cb59sm69779066b.0.2026.05.06.03.34.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 03:34:25 -0700 (PDT)
Message-ID: <031624bd-cb67-404f-866a-250f6362d941@oss.qualcomm.com>
Date: Wed, 6 May 2026 12:34:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] clk: qcom: smd-rpm: Add clocks for MSM8920
To: "Catherine A. Frederick" <serenity@floorchan.org>, andersson@kernel.org,
        sboyd@kernel.org, krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260505203845.192140-1-serenity@floorchan.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260505203845.192140-1-serenity@floorchan.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3rJuvLqCt9b6YDoMrJXZ1X1Jmg6LdDRn
X-Proofpoint-ORIG-GUID: 3rJuvLqCt9b6YDoMrJXZ1X1Jmg6LdDRn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDEwMyBTYWx0ZWRfX6jtiAEs89Jub
 FBBz1ly5322ivsDhgMi+P8dAQZ1SZvM+xo1l3HvXBQAdhGso9IdqIvTgzVUVmGX97zHnmgpoyse
 foKomeKPw7/pzEraNuE6Gj1V1GF55vKQblyXxbH/3a7qLlPKTts8Yx7hYD0esOo5vNQzL4SgfgG
 L9ArWJhBao8O/Oju+/5ZYw7mDpZlOntDYGej2ggJk9TsCgWyVC74APSRLkUiSYgmDMfP0T3alQD
 aJR0PVoT723E2x1cJipPeFWSKrZ8nF9FKpfoEa79KoMSwoHceHa34Rw4dw0HbJhuvk+yQ5OgNeB
 FTQVCj2EDgU2Lk9m+sJDaYWz3vwKyp/BYcn0GpJuzphccuJN9b6tSS6mxueVesrtQVFlwwspizV
 QgTDX+v5sRkECntgvr4EFjkbCxVOJnnM6Wmu/TeUIXQBWBYPyOmcyeQcOJ0EH26XM3JR5uD5jU5
 sYUzt4734CKE3XlZshA==
X-Authority-Analysis: v=2.4 cv=A8xc+aWG c=1 sm=1 tr=0 ts=69fb1933 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=DhTvykhhAAAA:8 a=EUspDBNiAAAA:8 a=URLdPFrtKwSTYNkRWwwA:9 a=QEXdDO2ut3YA:10
 a=T4Xa7w4Qb_kA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=bLiRU7DCRrRo9wiowOr6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060103

On 5/5/26 10:38 PM, Catherine A. Frederick wrote:
> MSM8920 is very similar to MSM8917, but adds IPA clocks.
> 
> Signed-off-by: Catherine A. Frederick <serenity@floorchan.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
