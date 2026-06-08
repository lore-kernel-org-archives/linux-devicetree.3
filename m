Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF143B7763
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 09:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780912462; cv=none; b=hCh/JqZ44RaesXRLxFqaesPT+pIHQW9tyfMoRFuU9z2rWx5VsRjJsbQihqZJgd+4lhWNB2kcCcx6qRxkgBAYBizeDG3SYATbJsOrSLQ7L5PQezYa/Ubil0SXvZBfctnWVZGA5qMqaFp6xX+EXiSZylNKg/z5C2gxfvn6LUXE/C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780912462; c=relaxed/simple;
	bh=vsKka7G3UmX3nzKB76Cu1Fakbt5a+HQd2kFbP9s5dNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bt+xpRzxAc+12Lc3V9A/rBRYjnrBFrqzWe2qqf9U89D1RzdGUpFAtM/NDj4JUPkotEdQF5IXQ0ALCMOwLPUQiNQPu6JgZqmKD+yb8ZEiZoF3G7uz2+6cBPlR4ssfBfmpbn2j/b7jilvG2bVumHDYw93eoAmFiBhWUlwk+NmCmp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LNPZCTzX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cYShVi+w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LNPZCTzX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cYShVi+w"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OrAu2274537
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 09:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Uf0btmHOdUL8kHEgziQswexx3pz/E+zEob8tZKq/+A=; b=LNPZCTzXuPhZKgwN
	LWdoZSqKJY+pA57plhC8H1zPKUTiJqYskr07jsFA+ethhPM/jI+d2EC3Z77vem+B
	+CEirqmLUW0KOr6sGth3k80oH4UZleEhS8G429ZKepkZL6B4DZVi1P+80x6jw5Jy
	EzDHaN9oQtxmTEUj2HmjEwOTGR2QLKWkh/rNSA6VTQB0vwSDnmHqE5BP9CVqH615
	VkdI1Spvh85Z/417lqis3ZjGdOP7use5XVSvmNFM0pq2JJAJ3MXnLRhUqE2qqF4F
	JsPqssmj1pRBXFRrxbcx9jxn+5LrUPkPXGappxISXb8HDGezLSWS/sVX+j0EqrMF
	k9tz6Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgxwks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 09:54:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915ccc2d4d2so35148385a.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 02:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780912458; x=1781517258; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Uf0btmHOdUL8kHEgziQswexx3pz/E+zEob8tZKq/+A=;
        b=cYShVi+woA3zREEjZOPN1LBdNBj9RMNHotGpvvj2S2dkeCmZXEiRgYCFJNiJBMnflJ
         HKYGLgwPokaEMSFFuu6TV2CFVioyntHu/uX5FITN49H+Ewp8QnuhjTMlIEbdzVn9wBEU
         HqRjNBLaiVhricOkcSHnyviyKXZ08umxj6a2Z1xcDeNyT/Jniu4buoPUt4yszO4dlvDi
         DKB3muwfWsws1xmjQ/VkINvq3565tx5kCjlQ9NIjq/B+wuSyGBp3qQChi7ClhCmAakUT
         jFk+xoF9csKJnO+xHyIN8vKf9MXyOmG1Nk/tveAqSADkhzR3BJuPldG0O5y4Mt0E8pMr
         MKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780912458; x=1781517258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Uf0btmHOdUL8kHEgziQswexx3pz/E+zEob8tZKq/+A=;
        b=eiMf9+KVbxCU1t3OpOPDszyhlBGGMi/Eso3ohaX6il7RCQ+M6Ln8gTo9La1zYdrNsW
         8LwLa5Y8dLRKcPyMBecB8gG4Oe/ah85g7UvVYNTEjd1Uc5E8RQmJnxM4FfhLFULGxGrM
         zGtqPiPPG0wi6lkA3G4dqy6Scn2TT5UXmewQoKIjRPzol7rsvhs4yo5ZTb0lyaM/24VW
         LhyeCTcXoiP/xdk8VMyoKKZMG5h4U4qoxj5zmR9xr1rDCN6NHTo0rzfZozLuyTW8tmAV
         jNdXciby7R3ndchxrGkQjGnQE8mym63S5062kSrcYPZ6pVHCz+NS2zxZNi8nfvW0aw0P
         zw1g==
X-Forwarded-Encrypted: i=1; AFNElJ8AM6xhb4uVzQiZa99UPrqxJu1XrpG2ledwr4OAg3CIWegZRirkJKIgTIvbIwavM8lRD0cbAbj+Fp41@vger.kernel.org
X-Gm-Message-State: AOJu0YxbCp0dHqG9XfRzmvaGcaSBQXrgQWkGkElOO7cINW0d+Bl/Aa7y
	bXt4WDBVXtDM9BMvNDaiF4SmV/7EGiH8CDShwN7k9b2dBJYA+Go+Y5ipxfcXa2bzxSVV4elkeTP
	EqlzbQQjCo888ZuGacmGVZyOqnvy2OYOd7c0+GqiOtEeftkrJdcyp54dr1l2WFxKn
X-Gm-Gg: Acq92OGAbbYWIlzTQ9YAziJwhDU8DnMsLFeCLyZ/Mdc4/krz08gI2pMqNsdcOJAr3B/
	BjZKVrrnsjq6Nn6xpUiW41LkpDfV6SV3+HOsC1afPvPTlrHtHPfGVgcFTP0zH0twvz+k//h1O3W
	sFMQqJa3c4oJXSCcPf2S3FAeKbwpfO0sD4aDMKwRSP3+AeAzkKRS1R4r/Y/gsV28MiGXz/4v/f2
	V5dZBpMCODmHhsToTz+hewBadqcO7OtR8NJvVMznmFgA9mPPP2ejnqvuFF7gmtiGNveT2OzEj8O
	BaX2BUOXkTIQGFzgfKjY9tN631+YjfNoEAw1+RIm3OWGL/7277rfk/DjwLMsXzmPktzG8bq8hvq
	1VvNcGlHquaP+mvIysFuy4FDsfGDv/nso+3V4kVMDsUxH+4Gy+vQdv8Cv
X-Received: by 2002:a05:620a:4145:b0:8f1:9e59:2208 with SMTP id af79cd13be357-915a9d5af7fmr1416235985a.4.1780912458318;
        Mon, 08 Jun 2026 02:54:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4145:b0:8f1:9e59:2208 with SMTP id af79cd13be357-915a9d5af7fmr1416233885a.4.1780912457931;
        Mon, 08 Jun 2026 02:54:17 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e051cfsm848509866b.38.2026.06.08.02.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:54:17 -0700 (PDT)
Message-ID: <f9136a2d-9556-4d5f-9e26-70255702b6cf@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:54:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gcc-shikra: Add support for the USB3 DP
 PHY reset
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com>
 <20260526-shikra-gcc-usb-resets-v1-2-6d9e7fee2998@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526-shikra-gcc-usb-resets-v1-2-6d9e7fee2998@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a26914b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=IyfWUWnWmjsiacPjz4MA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: i74dHg6UXFWfaYA-JlfHtZw6eelbgD0g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5MiBTYWx0ZWRfXxgvkBpdYsuoc
 HcxJTP+g5uvc4T3/ChDa5Ft1+Prt+v8Qh7ZaiPmjM+Y5yDSv/m9ZDkA8A+spGcK1qDC11AWyT+3
 SuZVZsfGAJCQd7k0aqONUo1r0rVziqwIUjkBMCQUIV5bMjS8+unofZOm7S+9Ijk8Q7cSfwf63Mf
 MKzlDnfSO5eurISOslJmkjpsP/9muiUtlYrcSsSy1Jm0GkcLY8vRtmplDsTdvOQjH/V6QiQ9br/
 QUl+6hCi7Ci8Lkfu3JZjbJ3QzikkVxCfj7Pk65iaqq115LcJWWKQ/nZAdPd2fNJKd2D8qx2KJeF
 J7eQXU1N2Aukr2GOlw7s1sAt/YQ+Xj7koyvt84vgFHQP2fIy9Mub1hEEH6Es+Rfz7whQjSwAcGd
 WGiZ9DCvlEEdSiHVRqv/VGHkvfaHorD5z/d0VQ6OYT5nmdHhHmgp4F1abqRkmQxhVd+yAqabz4y
 4kBZnp6ktRYCTBB+Tag==
X-Proofpoint-ORIG-GUID: i74dHg6UXFWfaYA-JlfHtZw6eelbgD0g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080092

On 5/26/26 2:54 PM, Imran Shaik wrote:
> Add GCC USB3 DP PHY reset support for Qualcomm Shikra SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
