Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D213546F5
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 16:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783873294; cv=none; b=DoWyLPJH2sjCONCtX4FBL0pEBZPWl9AO7tM1C6fuQR4+Z0xw1Vdy+e4iBwebCkJYr0itPOetPBO3oWv+Tyo0Rzi3hwmvruBPG5GbxBX6mfsJbCYwKZgGer+gbWPAmEEdSYb5At6SdF+OLMiNTA1Z2xUPrbey4CczLYw7iXNr6DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783873294; c=relaxed/simple;
	bh=GL+VFhO8CO6do2DAPvHKDO+khg+wGy/uyXfCtrc7bug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bOiZHh+ZuV2Mu7lm+p7jpwoyYHZppc/GaHVLvYbnoWSD9QTzTZmfGsrmrb5LYVeTGiWbG7KuFG0wbIhmbf6P3+RvDubrfL8Cg6j9LBDhtvPlx//OolE7jfT1iqGR0g/wSAQ+d6ukvOyovpIoAfctfh0biZRK4ttMZZEDfhk5+yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FprvP2JN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SLw2/6/Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FprvP2JN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SLw2/6/Y"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CDZfne2649113
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 16:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GL+VFhO8CO6do2DAPvHKDO+khg+wGy/uyXfCtrc7bug=; b=FprvP2JNVM1jrc4j
	AYOD9ipjY59zXG7UPYvM1hw054jRSHagQ4b+KhfHUTZ1Y9eDYhzZXBY79ApIdqYJ
	FEsICGLjrRCnd2relGJk/9j6/NGNralETtEEiGhGzehP2lFaeuIFzBC8WDNrvV9D
	8VeWpLmeITqoUakEN0o5t2kjo3sTs8FbZd/ad7V2Kdc5WrF7J/q1m7WOFAViHhuT
	C1fURu8r8sPMOSYotY2Zb3vx3sFVvRhckIfHFiS+wmD9OPgpq0BQC8zLjj1wbtKB
	KVEhNjAsUfQd75Nby7VCcyIpw+yqBc26GJpy2eocjDvGf1E2//LZZzJzU9EYka1O
	IcegHQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe9134yc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 16:21:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1e6f602cso46187791cf.3
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 09:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783873291; x=1784478091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GL+VFhO8CO6do2DAPvHKDO+khg+wGy/uyXfCtrc7bug=;
        b=SLw2/6/YUOhhg9fWKoNBUgT41irMlWnSztxnpQ/Kn5X6MVFHF8OcK/c24EtXJR1xJb
         rZvTE7v6ULpcX4ZiMNc4c60nB2XL8rOOR2aMNrMO1B+DYCmhQApCnZrGxkImUUYptEaU
         VzE58uZhysyi3xVGYrzUE77FYY03aCSZQtKZd3HsrjKTdKrv2e84UUJARTcgyhmapknS
         KLiOy+qcGaTVB33XTI+WSEdo8ALwAorVFKxqcM/U6YSZ6+GVJ9r0+C72gyvEFogs5vBe
         xj/UGOxKPPxDMbjiDZNlPdqiQcB7oflz581u3kMmTVuKa2qlZJ5aG83jEugKJI92QAHl
         z6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783873291; x=1784478091;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GL+VFhO8CO6do2DAPvHKDO+khg+wGy/uyXfCtrc7bug=;
        b=e608ewR3DZd0JWqxk8C1NtFnVxjHyavCudIShfNU3+s7lxMt5hYRIPdnlqMTH5PbTl
         CC+JM3HAEfrhBehyJD2CwBxjjCt9YKDJu/MdY02jRRODuVQhqfmyc6UEcWv5nxgj21wi
         Lp4yd1KzMRlwjtOkEfOKy4DCRe2RH2RXfbECac+8nHYvTH2OIoXHiWkcG+6V+MBSQqzd
         HmWjb3Ed83r1H6yCyzL8g3lRYIkhiqgh/GUGE0/dtplHfTBVzz24itVU586gQEVj/Vp9
         UuZHNcHk7MyfHwwCaXfQZeLnetC5cr1IPPblI9xxwNSLjTmvtHuD7V+vL4/Sotm+IL1n
         i1yQ==
X-Forwarded-Encrypted: i=1; AHgh+RoEsqZQW5KLGVJ0UGkrVN1vkt2FKAYBfh/vE50Q6Z87Onci1qZhB6FOkx+AwqJ65qll9mhat97xKPSA@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbcwc+UvLmYPfFhmIwlXi3uFrAXNpHC5lPbmIu4m27JERXbKTL
	pVNsjvv1GFjDnGlbpNx36kkaGuFOgU8+xVU4HndAPsax3swXvv1oPS+ddxEjxKAiWiewl445Gcr
	0QCk7UVR+x1Bkk+ORUwsgmDGUX6KXUNK/XXYpxrj7y/X3A0vfzGW/tvR1PwuuL+pzWnD10uHr
X-Gm-Gg: AfdE7cnT7ej63/wC/HieZn09H41N4mDmjTteF/Qtwf+jo6+SiwpRL/FwXfUaluTbEyx
	WDvra7pvncCo8Fh6ud9zO+4wYyak0OTGQ6mxtnt/e/9V2gfahGlysJGDY2WByJAEikWCqjmuYCg
	vBF1Javz6TTEhdCjJOH/h0if1G+PcXptvOpZ5R08RZpC05peg9o5D+7em9HCC44Ziz+cYuWmcq5
	SgaSSlCTtW+E1emXYuLBITfqxsU5VPptJa+mmCbdnCn7nfgbjlZjdmxsk241KOPaYXfgxtvMFPK
	h9M73n2f8GVWVSnu3BWMQBsQXXJV7hkbXqjCwdOpv5k8sfpA0fXDa9PvP7v5kG15MLr559B0xaF
	s0jGIDBSRUS7f8Rs9pQRT7I6yMvWpIbvhn0hV7axr
X-Received: by 2002:a05:622a:10a:b0:51c:1d0c:605f with SMTP id d75a77b69052e-51cbf136b72mr67172531cf.20.1783873291341;
        Sun, 12 Jul 2026 09:21:31 -0700 (PDT)
X-Received: by 2002:a05:622a:10a:b0:51c:1d0c:605f with SMTP id d75a77b69052e-51cbf136b72mr67172441cf.20.1783873290952;
        Sun, 12 Jul 2026 09:21:30 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b0cesm80097472f8f.22.2026.07.12.09.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 09:21:29 -0700 (PDT)
Message-ID: <9f94cda6-ce06-4c3a-ae0f-ba264c876279@oss.qualcomm.com>
Date: Sun, 12 Jul 2026 18:21:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: soc: qcom,wcnss: Drop redundant $ref of
 firmware-name property
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260712145654.126171-2-krzysztof.kozlowski@oss.qualcomm.com>
 <20260712150707.83A411F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260712150707.83A411F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TbymcxQh c=1 sm=1 tr=0 ts=6a53bf0b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=3R4P5zgYZQQvAFKv3WgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE3NCBTYWx0ZWRfX5OfG2Z5A0RaR
 pOmzK49gk9j6Ykggp7HPmifGXj4uidnrUwLJr3Hdk8B9ev1g3AT4zFhQ21q6jqyEZ5EBB6OfiL2
 05vJQAVj4Bxd8DSZHUYIW6uglMelzN8=
X-Proofpoint-GUID: 8XLeMMiqEuiJXIPd7M6FTRioStuPTrZ_
X-Proofpoint-ORIG-GUID: 8XLeMMiqEuiJXIPd7M6FTRioStuPTrZ_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE3NCBTYWx0ZWRfX5Ssc414LW1Ra
 0aCJRBscA/UcpjpGCxewg7iLiCLaXEFKVWoCVC9u+LvJB3lTwWovLGSTQO0WKby/KT5KA5U9vgE
 kTxU1W3mzlu/zr9RvXg7huxIwAzpb4LRUGnZMKS/bm45iWaoeSTfRmpBAO7SW51Q419w3ErHoAL
 kEys2rgZGK0NMDm+wjXIy2iBDl5p0+JbpMfezaVZl38TDv9WcfGInvBSbUCGxaYsAXwFPCr0771
 DvkGMa7gZ+tlEx3Y10+pMXyLzXasopXwHCxg88O9NNA85/Z5vh2zUIfFP88Pa31r36zyE+ZPhQf
 NzqNlEo0ZwDz/mI5igvjeclKCd+zlXy+t0P8ucarCfDbsBwGtEtXCtnZtxQqGNcYXxtGADdSHdt
 QfROJ5WFsJYkQWqGQPzE3AQ6mCzNlbRZc3iheYEItA+hySqKunWXwb9VtmXoMKQJCZYgUKz8rkU
 NTUtjhjJW5tcYZwYvyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120174

On 12/07/2026 17:07, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Schema validation error: `default` value for `firmware-name` is a scalar string but should be a string array.
> --


Validation passes, but I can make it for correctness:
default: [ wlan/prima/WCNSS_qcom_wlan_nv.bin ]

Best regards,
Krzysztof
