Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1255238F653
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 01:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784080615; cv=none; b=PscOEtPbi4+OMdbUACQAH+VT2GHWyyjzo3oBYYomY/ioUXkPrWjeDqV8I5RyZNXVe9oivD6+lXfjIvh39tN9Wl8+mW9NmS+WoMuHjFRhQOQvLMNof+brZ9FSvbnPhQeUs5vlwlypqcCpjVnzsFaoXGjS5VNsAG7lhhb7XCEbvC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784080615; c=relaxed/simple;
	bh=u2V17qhyxgg2JKFSjT9oimfPdJhN/eer9bOsaU7KjVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XMjDegrM4qR2OCf2n+j6jV0BmXnsj83DOHV0Jd/rOZBoeZs1iaGBhw0t5AfAh2ri8ka83EQSIOoHqwSc9nlDN4eHxkL0ncluwszR/k9HIUziS+NBUcPECnguH2eu7Xg2/faXnvi/LC//7F7S8gllUUqJ9Jyd5wNA5U/C0hyjGPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pfomCif5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BUjxWC/4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pfomCif5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BUjxWC/4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0IQh62171747
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 01:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j1NEzi3ll4gdZ52BqXNdruNPx4sABY2QC7pNcTut8oo=; b=pfomCif5gd+3Hlkb
	cZi2zrSktGeSpgnOcDMatkNWKIO9zn0xlT/6s40IuHSxZDsquL6GVkpaMT0yF0Cn
	KaUM4iMKDnNmQ7q7ei6l+HZfLpjvHJXzExx8Uy3fu80gcSU+PgSqp2q0n7W5R6DZ
	33EQdIkgGz/8KH2Nwwwfr0tparSSRrFLQuog26OGg1VEbIVdlA//rsnbDQN8FY91
	sQZjUKCLivPX/lXJ3uPq2dJb7V7NOJDKztJa8b5Y7TmBoHpoiXR5EY+gRIXgbrZb
	0DNIR12GF/PmpHMG+GGJ3SqCpcJXVfWKda5nRj49qzzcbeyxOic5biBonrSUws2r
	21m7sQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnqtjb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 01:56:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e04a53a7aso2780837a91.2
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 18:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784080611; x=1784685411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j1NEzi3ll4gdZ52BqXNdruNPx4sABY2QC7pNcTut8oo=;
        b=BUjxWC/4Ltp2jpa0NByvZGZJMWd7hB63TDpLfjk/RiDMYbWFRlrg72JjphxIjdQrPU
         Q6fDP4qK9MzOhwMEywPnvRbS9Pbqxj/wzIMIzTsgYBFBfaKHh6nVWdbKpOVQ09Zu/u/d
         lZb0wBE7VZiQg9MAAScsk+6bVA8ZbnIzO+XAXO0vRTKT86kDsQhCu0r12OVmk2MkbU9e
         BdCn4211AbPGTxu4iscTeQVCyp1uPMfvjIftrXs/XrkuLCRRJwK4VfWptT3PrHnbkaHY
         U5Ih6+NOyXHD0gW4C+vdVQtNI1EB9sqCFRH+xb0vWiFMAfyXKHgqIzqQVBwbrhKTyvhC
         79OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784080611; x=1784685411;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j1NEzi3ll4gdZ52BqXNdruNPx4sABY2QC7pNcTut8oo=;
        b=XonG5vXoHWymP2OI5rXglBBC623enNURZNDYirvOfzrHaES0y3xiI7iyJNM5SvE/aT
         sRJ2C8TNZ6Qg8wYSf/izCrOGs+IjH0aMInfULUamRt1tBPHWNJ++y+YxCo5I8lWpRKbL
         nnpkQSmQFKYTDbTauIrH1nrkYMoE8sjqW1yyCyYehUghjAdz4RQG04XRtQt8qCPOFY6C
         8/R7E3HLqpR8/KmlHODhP/1AXjKdRAc0G72KmFW67zYRTea2Sy01vS9rRRtw7S2g+EAi
         q6FUHe0w0SZLeWQK4YiHfob19VYGnOv0/d1CFeGF6Ujc5f84AKv8gEACkHi7kJsZ5cu4
         RgHw==
X-Forwarded-Encrypted: i=1; AHgh+RpHpRrEMik2GuJXx56lWM2DyJbHiIfMLJnGYw74MBsUwJT7yhrqmN/1K3gPRWPnGxVQsz2HsrQFj7n0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw04s5TrFroGmqJRpM0hmdInRm9T9wv45RPhch9Hx7WFe1MFN6p
	ILtUtb0L66cqqG2HJS24Jd6CZpxwypDpZpG0KXE0hMuFIQFqPQvnejUBF+4ljpxI6iRm/gDqKPD
	Jwe1cLPU4k/Pk/OoIRqYFWevxxE2js2amMk2/6f4tX4QrhXtgBf2y5LYEK0HtEu7b
X-Gm-Gg: AfdE7cma9Psv+26YuSsrbKcbjWa3XUEnO21BDClitpL+9kUvsdG0vGe6mEsGzEM6G30
	rK90guetsK9si2eXoKF9O/d+wKl6BdMiP7CdBRNm+ftFLicxMRisZIfvbagf7Ud0E2VWesV+5Ck
	cPwMHogc3698rIJxIqY3Au/R7M+Bt161IWZditHSDK1sbidDhD+XwHK0eUCuwc/S9KMKv9Ql1Ja
	fo0aNuv0VvV34PldXjP2q9lPP/R77mdJzUbdLSz0HxZPEQ9VfHlwWJxv4ULuP5oHBxvQmqn1aoz
	VtYeKQXBNcpvnt7zaaWaWSbGz/l5MZJA35HZoxmyHhX0+tZqwjivs0vLRE81d7lbZE0FyjYIocz
	cQEERONpMpaeds9qdTB4LeTX8nCt7bUwijrBwJCsj8MZ2g5xdh5gZxCCVerT990K58vbL+6BhTb
	/tqJoq
X-Received: by 2002:a17:90b:4a04:b0:387:e0bb:5802 with SMTP id 98e67ed59e1d1-38e2a12332amr946851a91.41.1784080610898;
        Tue, 14 Jul 2026 18:56:50 -0700 (PDT)
X-Received: by 2002:a17:90b:4a04:b0:387:e0bb:5802 with SMTP id 98e67ed59e1d1-38e2a12332amr946835a91.41.1784080610432;
        Tue, 14 Jul 2026 18:56:50 -0700 (PDT)
Received: from [10.133.33.197] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e1745a5acsm2245808a91.14.2026.07.14.18.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 18:56:50 -0700 (PDT)
Message-ID: <e3cd4067-8c30-487d-a68b-b4cf625059e5@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 09:56:46 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: misc: qcom,fastrpc: Add Maili FastRPC
 compatible
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260602-fastrpc-v2-1-67a55e22427b@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20260602-fastrpc-v2-1-67a55e22427b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAxNiBTYWx0ZWRfX8iuF77p6uwuF
 AjV+4L/xQbirMbebcRb0P2uAXqECspGJ3kWSB7QeULwtS/ZNf9MJNrX16Tt9PDt05y6vNGiOvJh
 DELdOb1xAntFmd6CqveDx0siVcE3EZFqO1lHdMSnctb9iULsVLUexGp52lanEHDNQpaWZcGXJv/
 XVOX9A88rImE4OOP7b85I+vWsi5AXjBnrGyC+6RoKJgdr5YdCEkz8laPhltOFgCrPvEbAEq+J9h
 Enq/dvPbo5UiVUwxf1pqB8nTtseo7Co9jQby19xJWPDD4carGwpzhSnLJnC339o7EJdqFXOLMAu
 iWF9GBUFQSJ1kCFiKps658We4FUcNqkvnbZE2UGDoQm00yBhVQXB+8il7U4FaUF39Z5uW6AVk26
 kWydoUan8mObn8q2cwt0L5OQQFY03lV39Dik7HGUxtYW70WyFZrWScrSN2E8Y/UuoZnrSgb+pMn
 73vPV1tbuqL+oFHA0oA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAxNiBTYWx0ZWRfX0gwLak/LCb68
 onl5rBg04MkAE12UHILNJoEMztYDuXofmCbmpMiuozitKXtFJ+l1tVArpFg0M6uYormQgzCGHLt
 pU63ZSfias3vcIbJYvBBLjJz2szn/LQ=
X-Authority-Analysis: v=2.4 cv=U+Oiy+ru c=1 sm=1 tr=0 ts=6a56e8e3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=XtIZyzpYV7b62ySdhoYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: Epz-sOEY0Pcr0Wzf1bkMi8s5k_WoMLEx
X-Proofpoint-ORIG-GUID: Epz-sOEY0Pcr0Wzf1bkMi8s5k_WoMLEx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150016



On 6/2/2026 2:51 PM, Yijie Yang wrote:
> Document compatible string for the FastRPC interface on the Qualcomm Maili
> SoC, which is compatible with the Qualcomm Kaanapali FastRPC and can
> fallback to Kaanapali.
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
> Changes in v2:
> - Drop Assisted-by tag; no functional change.
> - Link to v1: https://patch.msgid.link/20260525-fastrpc-v1-1-ae9add881952@oss.qualcomm.com
> ---
>   Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> index 2876fdd7c6e6..afe52296bf1d 100644
> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> @@ -26,6 +26,7 @@ properties:
>             - enum:
>                 - qcom,glymur-fastrpc
>                 - qcom,hawi-fastrpc
> +              - qcom,maili-fastrpc
>             - const: qcom,kaanapali-fastrpc
>   
>     label:
> 
> ---
> base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
> change-id: 20260512-fastrpc-9f3b691f8e2d
> 
> Best regards,
> --
> Yijie Yang <yijie.yang@oss.qualcomm.com>
> 
Gentle ping: could you please applying this patch?

-- 
Best Regards,
Yijie

