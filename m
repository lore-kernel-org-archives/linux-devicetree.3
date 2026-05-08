Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7429D3EB7FA
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 14:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778249982; cv=none; b=DgdV6nv0W4t/rpwtjlglUksu32A3CK0AvElBneUCirNR+QlEm7KEh8MbvtDcs5x/TnPNtdF9reMBBIwQf/I3p9CkIvNg6EnhSzNBu2MnAGHQQ3hIinEyff7iNef6hTQJTOIQw+ezLyibjJ5SNsxlKvkAchLWiF0cyhbMtlT0h90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778249982; c=relaxed/simple;
	bh=IwXMW0qh9NvCeGP2d+pD/AWSCBQ787imGla0vNKaSD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ompJLUq3dWxXOYlK3Vzy11P3pL65QxOY3K/BSCnn+GqbcNUO6ZWjYUgGio+r56IeLn1mc52G6HsY+Ze6BL2c23HcRXJcZwB6tnotI+nL9hvd4kkxDhc4PseRPciqdx+dfZOzer8AVo0YptSKE02QYSrCbH7FCMuBk5O/U7NZy0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EKjHyIYI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VT3h5z6T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EKjHyIYI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VT3h5z6T"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648CGsum852278
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 14:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ThaOuhJSP60Br/1921KJPnOErIdEj/peiE0Jh3ulHIw=; b=EKjHyIYIncXwxbCa
	rctxJ04W1wqVLB/mfQNg9KpAWGW0Dd2w9FNsLHE6NEK9OKw38PsBy3Vlf1DRVw/b
	u1UCeHr3lM5JAqkqSgP2c8MvHiiNlOtuFhMXFsdlhh31h2Q5YXPwarWckulEuwY8
	65o+oxZHUdwKgZAB79nat7edluotzNNWVdDpeySNX8HK2UL1XEi/8+cIxrk0vyEt
	xuqEuuEARB12jGzCZy2nvq2OuGukbqdIbplFqxM7IstfWgE/uDcZLugS2N6KcVNi
	B1vcr/Wurraqj1r5ELYr14+JWLS8po+6kw+4HuznupttiNjrWg1JLTtIGqGbray5
	Qe0ozQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1fptgg8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 14:19:39 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-575287c467fso255348e0c.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 07:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778249979; x=1778854779; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ThaOuhJSP60Br/1921KJPnOErIdEj/peiE0Jh3ulHIw=;
        b=VT3h5z6T3clbETDlz76i1yLXo9t21UMnBgxtfokXtVV2foPRKFiFFPVRDJBnmj01k8
         eJ2UmQWl+MTpycM4BBFibVz90+GRua9TpigEW7Ib+nZb0tyzlLfuLZqGax4JCMn4kC8J
         vM0jHgAQEOGbrxAga+9LjGiu5zgJoIE/52jtvojCBLc54KiCkIxZcalYRAnd0xEBAThQ
         1hGXBFLwN/B6wVrPM75L+e5SF96dKUoaTyIEYO57odUnVzJle1bpKcPU5fXJ3SYOsX4l
         XdQt+0WVP9S+OCg5YudAon2Fm0enjnufoCHVeo3sRnE/GyhAg0wNoaqFx8+J28nKvn9m
         DuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778249979; x=1778854779;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ThaOuhJSP60Br/1921KJPnOErIdEj/peiE0Jh3ulHIw=;
        b=Iec/V/kzDad800Xua0CbjFsUPFHbxOpJK1iRC3atgb/pT+Zz6ml0DXP9+pypbsqEUY
         ICmlVsdLmpZMzyd6c1z/gJj38xZCcg1g1Gc0TXBZkMoIchKRKHrtAwdW2Y2QC6pb+99O
         OnSHN+vnjopyMwoFLMUruYcLB5rGM6/0TmjxL19Lh4SOSmAw6EwqQeg8kCpIvYvdt7xg
         LvqV7fmlbiyVC1UMJcVA/x5JBQ/4zTegJW/A6GvwcQ6IwkbAe8s1AG2uvCot+NTr0f76
         d52DysJl2gkMNvrXGmenLniXmzR2SLpTR2GgfBY/qNEEkbP7RwLGfyU/jTMR2RxdKAqu
         ZGHw==
X-Forwarded-Encrypted: i=1; AFNElJ8ryzQslCQKlC7vaN/XKcqkm+v+Z+15k/N7J+VmglgjlJAmPK6K8QF3PkMy+Htmk1rUBQuJWm+XVjOx@vger.kernel.org
X-Gm-Message-State: AOJu0YxCpzPgSk9TPE8SO/hCwRhSYscIZ/j5wT6AadIuwoFH/dauQ84f
	1ohQZGmY7AEQyXdLngXYmdoAFDvtCEa936EDVoZ0EcNQhGnmLytOxdHK2AiBwKiqDCGlDEe9Yuy
	5gNxQq04yhy1cRfnToZ4W3FKm57fQUbWYiSKVuxvJle3PowY89tEmuh3xuV5N4zsT
X-Gm-Gg: Acq92OHOxTkq4HTIt+ruonbMZ0W5uJvXNZ/8QP++Bs2ovMxw4sMW3wqMZ16M1oDqYk8
	fzonGrlPTUWKH5Qpi0LdCToTq2hgWzwBXEHsFfIITJRQ46u69308fROdNv937gxTGSPSinBs3G2
	5GqtuXxUjyxA2B/X1ekPcjjMHxAhFeofZEdtPVyFZy9pEfdZWThBD61tCc32W93sC+PRYkl95LN
	OLkkYYhr3xMnuQNyOfnATOdQdUhQOFT0wIt3p2OjRHzqAphNGl54/nBGQWcreIpvxhgsypIMMOq
	bqPf/2vgRK2RQZtdsvVwnC8Q2641ToMvKnBheyn45Xzs9hIZV9JQf3juwyDg7IQYvbVgkcXDN90
	TYYPBA0Epbuaou+xtnX7ORCM1yv8wpORO9Qaebm4mmRAo4A+bCyHDng3WFmAK8oR2SYp++7ds/h
	O8EOM=
X-Received: by 2002:a05:6122:6810:10b0:56f:ba80:5675 with SMTP id 71dfb90a1353d-5755b435e5amr2404248e0c.2.1778249978740;
        Fri, 08 May 2026 07:19:38 -0700 (PDT)
X-Received: by 2002:a05:6122:6810:10b0:56f:ba80:5675 with SMTP id 71dfb90a1353d-5755b435e5amr2404234e0c.2.1778249978276;
        Fri, 08 May 2026 07:19:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359ea4sm84735766b.50.2026.05.08.07.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 07:19:37 -0700 (PDT)
Message-ID: <256cb012-9e5b-4660-bdb5-6c58f4403c4d@oss.qualcomm.com>
Date: Fri, 8 May 2026 16:19:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Mark FastRPC context banks as
 dma-coherent
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260507-sc8280xp-fastrpc-dma-coherent-v1-1-e92aed797865@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-sc8280xp-fastrpc-dma-coherent-v1-1-e92aed797865@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KX8S1FJG-jIHelevOin3iaoUN2d6DgCa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE0MiBTYWx0ZWRfXzYHJYFcb8R/1
 5bNSFw43J8rULCMAGceYzOxeLGYkiSBQl5znGX2RX0izU3FBXCpHyN2DFTWQnLvK80g89hWES1C
 jFaavWhF+qbWDMhu98b8KUfCaJ+GEehJRHRCAxga185Gz63dWuAW1Avcb50aiwWZMXpOkAJFO44
 6m1ynvVDuPmNolEZmN8pclkRW60IfDFSwVbTs2+GeSWV3Q59sHA0uml92oVPrn9W3GetyzK+IVO
 NGC2v5XSLaoB8re3K6gIrZCKw0MOeabNH1gmY7Kw9zO00T/dyyc0QGbjNrwlHekYSer2rQUSOTh
 yU/VwEq53+NewOsbNssH9Kp0loCgxB0W7Se2cNe005wJHXScsRS1UgFS4UAr9xnvF+pra6OT1lt
 vXcvQ8837J8TxccCx6iAPSwZBRGqTvsNRbAvdEe+K0VfMTDSQQQacXm16RUmgBvfdaBMVNEmpqv
 d4mtKm3iN3P5QMx4mbA==
X-Proofpoint-GUID: KX8S1FJG-jIHelevOin3iaoUN2d6DgCa
X-Authority-Analysis: v=2.4 cv=IYi3n2qa c=1 sm=1 tr=0 ts=69fdf0fb cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=ksxQWNrZAAAA:8 a=y7TbVxhv9jjjMkO9NuwA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080142

On 5/7/26 4:50 PM, Xilin Wu wrote:
> The FastRPC context banks are DMA-coherent on sc8280xp platform. Mark them
> as such.
> 
> This allows running AI applications on the CDSP using the Qualcomm AI
> Runtime (QAIRT) SDK on the sc8280xp platform.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Did you test it with/without this patch?

Konrad
