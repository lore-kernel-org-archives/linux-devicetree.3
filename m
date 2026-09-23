Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6058F457E53
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 07:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790150402; cv=none; b=DymMl2Yzuo2F5TFZYWDkFuR3WbihO5bUdp9FJKWyOrY1erSoF1e5KNb56k8MK1acgzCw/Gv34NfnMVXENw2gtd7a0EcRAdhVHkmYLu/xfSYv9i1hZJ78utX7e7N43NY1ufLQ2obS0FaKxKHjJJk9miZFf68de+xaFWDQXTP7dPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790150402; c=relaxed/simple;
	bh=VEqNlpxOEe1fMjABVwJSU8ejy3HEKdIzvDohBBnBmiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7J04y2Y6f1mwIvllpPkLx4e0hLWfVi+p3/I9JOeJDNqMfSTCwxndhzYJy+PU8x7H5fooigSGjeCXfVT5MEIIZcyztOlXGrMBPrHkRFHrQYcXA/Cg34EKJy2KYoBvQVgtCcXR5SViRvHf4E0IbVwXEQTuYwo53WCnEy8BQOBK1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+qt93AW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cvg6pAcy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+qt93AW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cvg6pAcy"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N79mPU1232174
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 07:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jlRVAzPdTtvrvPHTJO/m2JYQA28qrTWdb8pmwdvB0P0=; b=k+qt93AW5iBoxzIK
	N7HtfLFbROkpz7ZY3ck0/fD5KMHOkgKvY7ByiMsfRo7m94M1jShAkrgIqHNUaLEH
	ObxhLW0p0iTru0LrYyhPg1clg2YT2O8WeRTai78t3Od9Vk6DB6viNbMUaJGyNxt9
	0cjzJD4CyeLWGoP6LPsPLP5i4FCeFttw/YpKw8RYn4sFFjN0bmi4FZn0ub+ibS8t
	XzUZBfTbFfYyMxf4+p8UUZkfnFAAg9yM1M+MfWHqxVaV2r2NUneFmj5s2MwSMKdo
	eazMyuz1XHXdjgT13gSgtFKGm7l/0U7q7fQhie/YSx9FqJBk/jA7GzAbdE5wIWp+
	kDblKQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma2r6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 07:59:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93bfab40895so19247585a.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 00:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790150379; x=1790755179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jlRVAzPdTtvrvPHTJO/m2JYQA28qrTWdb8pmwdvB0P0=;
        b=Cvg6pAcykhv4csACJg1e6xLS3IkSmDDzTkSfC3dFPFGS8tP6YPoQikdv45Kft66EjY
         gmdWx0vO+cxVEbY3aywHcCOQHfo+BwDZRzJUBtTkGxMTOz330b4CZ2bogPx/KRsLtA7n
         Z9xiYxZKhgcki9wH85j42ecCo5z5FpY1pU3JN66CD9SNWogcKaQ6zWQ2NyQ75KrKtFr6
         MxD/k76hOsUrB/vhSNMGtt1iupbcAAp+NPg1RywsgNMJOparZ9IWUHfWGMYKDHURZJue
         qALLEItelV2/B2Snv3ao3EpaFLejiLVuShZjSRogNkZjcpUCXJ11SaSVi21p2TA0goq5
         8UNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790150379; x=1790755179;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jlRVAzPdTtvrvPHTJO/m2JYQA28qrTWdb8pmwdvB0P0=;
        b=bEeAl9Ev6XTzVEV1gbkodOcvapmIdY5OiBGmmRTL9OH4VID4teJKAXJsI9kW5/ZbXj
         4Cx5EJ4FV8JT86YQUOAqIKa3k48qXxnieBZGPZyGJ6EtuA+nTQQDz8LbdUgke5yayBjL
         3IQQwETyM2IZ/fVvMYqbHWOS9AghOSjOFgEAk6Ngqic3l/gvQpJy+MilprnIiox54ZeU
         mk3iYFD3TcYPVQs4A2GZBJ0/kzNMo70erHBsIOI1bYzvjVtUs9RYc5JsuHNX9n1P0u6g
         t6cjmdRarESY57nZpz8SCIIbZGMGHbOTzJ5K/TYXq41TLpUK5tJiQmTnXWjN44x7qC6T
         fROA==
X-Forwarded-Encrypted: i=1; AKwUvBx7MG56JRRbUjlWObpx3EXh0tx/jD7/QB0jxWzJaoP/zfhcQq1E/pUQm7rs3yQq2kjZXWAnpyU6CH6n@vger.kernel.org
X-Gm-Message-State: AFuF++m6z2awjOaxwCD3aBsLcZI8Y/EM+q9rgEZ2bT5wQekQ80qzoNQs
	QHDeDyaLt4C1Dwf5zEzgAty9BCqf1EZNHh2nNnamXYLWlkNfCypot9Di0InLmXtZcW8rcMle31O
	LXhi31TrzhqsKmExWedwIr9QzyALUrDGAb15FkQgTwBHKXL13oeryMAPTF4DD2P3P
X-Gm-Gg: AYBFou3UEe9+M5i/R+AAg0Ho4AO9xCafblEP/3M6PFqhZMzNVm2e5+1TcRG6TjKfDv0
	3pq/kyQqXLXHHs76UxaJSspU2ujKgEwWJtQ/VBOWge6wCm/vOZWCKuJo1xGCq03SAN02Oi4Eh8o
	Wwul9RZ/GH6556ljQ6LymgoQmCgILm3RG99HCzNqeG3mSOarW8U+XI9nu8EqDNLzHO6yj+j0Q8a
	g6qbVLB7sINiaJLtpiZRv+dJobXFPhK+XgOBHYpo5hx2T/JCVjFbcoW/3R7ofYziuEFktvD57ou
	+iLI7LdSJiPySO9GXuVPtSxFMhuownDKsCBnJtug+DoGCPtAu6hPvjz84Ivx1J39ZNsqIe8Fsr2
	1hzThot8iPv+bz5uPJNWxzw==
X-Received: by 2002:a05:620a:44c2:b0:939:eb09:4458 with SMTP id af79cd13be357-93c251efb93mr285628885a.3.1790150378890;
        Wed, 23 Sep 2026 00:59:38 -0700 (PDT)
X-Received: by 2002:a05:620a:44c2:b0:939:eb09:4458 with SMTP id af79cd13be357-93c251efb93mr285626785a.3.1790150378530;
        Wed, 23 Sep 2026 00:59:38 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab38bbd28sm1087675a12.28.2026.09.23.00.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 00:59:37 -0700 (PDT)
Message-ID: <681ca16a-7452-44a1-871e-81a5db82c036@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 09:59:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus-common: Configure MBHC
 thresholds
To: =?UTF-8?Q?C=C3=A9dric_Bellegarde?= <cedric.bellegarde@adishatz.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260922-mbhc-v1-1-bd123e7fb899@adishatz.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-mbhc-v1-1-bd123e7fb899@adishatz.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XJtaCkogPzQjR2rWGCUgjcGuZ7_LBHNa
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzMSBTYWx0ZWRfX5E/t6ty/Eibu
 3MWZ7YJLOv6VQqPy0gyJeSefg9LpxA6ySfJ33DelzOsgjoNVXzl4sqDM1fOPaFQhuApaqRhXddQ
 OZnJLhSwCsp0g0z26fgeGEwDfbAxHuY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzMSBTYWx0ZWRfX9mz12AWJ8JnD
 jFpJcsfZdH5ft8rSNZnpts9jGZoqBcmULjC7YaskdsNu3ghfirsCUb5NRb//zyiU/nyqaVhA0Ok
 I/rpRikzB8z1zMX5eQ8N2yjdcyFSo8Mp5NUsazDyfopoqRFCc1v4/G+v6oma9hMBUPN4VDokR0g
 folTdLbed1H9Bse5gV85Dp7UICHTexZTfF5BDj0FY2EeiTQhgIfjIv1AsohN7fInVkEwgAwO6IE
 l0MviPZ9dFEK4qh1ROWk+78FsgGtWkwemQ9O/GCiN+MYV+N3ryU/wGitj/yBvSGszN+sp8BjRtI
 03fn1cm6+flK9hloK+ftNYDJTaHMMhqn7CCx/cdk4qf/ISJ2Ky+Vso1qJiKJhYG0UYZG9MrO2uy
 qViDXLBZBhmecttUbLeoNzB5kKK5jbTtVSNqbat4daA0U5EgsgIGGJi2OYESTxI5nzF2iEOGubr
 Z2TNPMCEgoOODLU+GJA==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab386eb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=LCWlJkpBAAAA:8 a=EUspDBNiAAAA:8 a=C9R86eXXc2PCoiogm0UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=z1lahxahPt366DkPXCx7:22
X-Proofpoint-GUID: XJtaCkogPzQjR2rWGCUgjcGuZ7_LBHNa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230031

On 9/22/26 9:48 PM, Cédric Bellegarde wrote:
> Configure the Multi-Button Headset Control (MBHC) thresholds for the
> WCD9340 audio codec to match the vendor downstream calibration.
> 
> Signed-off-by: Cédric Bellegarde <cedric.bellegarde@adishatz.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
