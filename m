Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ED53A6408
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776161105; cv=none; b=NmdFEGrGkDDJRX2dbQkYJWcvUQgfN/meDT4uf8oE+E9YFsCoKCAd8fhLKoEQGc4xWFTcYllzV+ncE0AoRVEbe8b4kuMUdQzYZ7HHESlRcRlf/NcgdFWzKtqXo9ZIb/wwWTvmOcLh8vLSSxTpxbg0NGy9z6T5R6JU3ioo+mLs8pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776161105; c=relaxed/simple;
	bh=8Wx4Krs6AGxwgNFSv6fzfnOE9NXDgIszdipj5pZUQEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jPrNG2gG6fxwlqERyra2vL3Wkhc75Pojn2g+eid/mX8po7jjITX+XwwVnK5Z+US/tNRVFBGWPYNOKMjPpqoE/4luJ0ht7igjdnvBv7Ln+AoCw316qQQJFoJogfOCgv3k5I8RadTLVD9qfcVsYLZXAQApyNjbMGuGuh0j+twn0fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oj/89Ahc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UVDccFi4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oj/89Ahc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UVDccFi4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6VNHw3157277
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J7qBFKS/RQGm4G9FxW8wVL0yrqFmIaMojcREHOXJ4Rk=; b=Oj/89AhcnfmzdOz5
	4p86RIKyspBCZ7AvemDpQBpEuhCySQj61t5z7URF6HDiKI5RRd7prrfigHRIJYgT
	TE5QqohxMss0pdclvW+a68lq1fiwjBtLszb0alJmqNQCmQ0NL8rN9XkYPBI21x2x
	6b/Y+Rcw2O/mECk+soofI619fGVe7xOjLhL76dzU/f2oTcrTUSKc4+O4GyCgg1x+
	nPRKyDFytphJ1gyAg0iZpqaCtVaWWiqkERwHwpGW3vNqlN8eZm4dEwQfPE2mdJqK
	5W59MJja0kqfuKY7/zwm+AJxf7LiUfo8saKtaB+0uoCAWpPpatGWYkh/RVfXnx7P
	7yYONw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86ba6um-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:05:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cff2297253so149337085a.2
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 03:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776161102; x=1776765902; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J7qBFKS/RQGm4G9FxW8wVL0yrqFmIaMojcREHOXJ4Rk=;
        b=UVDccFi4OpU0lFMACXOnyF6f5wBvRI4IthqRr0PMptQUceHgGZTklW7rAeb/6m4GDk
         c7UY4XKVNbCjiiFCBElEGJfVaapvyi0R7m5jvXwbrZu4cpniPvhQh/xF6kyOKapx/T0U
         Qvb1XJhX7XGv+3vvZc8R6arT787cudDOypjDHxyQisuaW5N8rHFEIfU0h86iVIY6YJai
         6N2K4ccyugh7El4nha+lyJIF8+zndB3LH/LYducApZ9tyYCAiS/ufpIQUDEg5KEEjFp0
         TlPas0aarLKeVXlXgUM/FOmP0uysPKQQLksBL/lTzuxDvaB2jpkKuH+0KjHiUO6r6svr
         fBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776161102; x=1776765902;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J7qBFKS/RQGm4G9FxW8wVL0yrqFmIaMojcREHOXJ4Rk=;
        b=ZniJUmKXoICg7fj0jJeLNu3Ner402gpUiP1FPC1agLnaPMXxOpBRWn5rlT1Dm2DUo1
         YZgcilL3PENG7kQykP9kJldvayBO2WW1cyKx9OBvJv04/kmYH3eIoXeEd79bHcpvsdu5
         I9w6dehfmA3kRThqFLTikL9cxZYLwHefRkyPNqS/Fl75UxweVId9iOldaB+OXo69P87a
         BZ3muozXnI4wkxs2Kqc38qMYHHP7aW7hGugtGUGDkK82pR568oVVPOtoIqJJitWIDXDN
         rKslWCe11Z9dbK2YUHzwtDXwBrrFZ13UZOWgL5mExzb79KS+FWyaQ6EY3UkynaCBxer/
         HYYA==
X-Forwarded-Encrypted: i=1; AFNElJ9YUwMysvaGkxurLJPA6vcHs9OHPY91Y63RKrVfxGlWd/2PgytdktXCnH3daic9pSLBLdwXtfqBt7Z5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9OOQTBNZMurGtMbPtZ0/ezAtmV8mv9WBVuZB1BZtnkQIczqGE
	Ie9ySpnbrvUgca9tYazqCcheSYV6aza9gF5umpz4riS5tPorhTIV7i8dmiQF8Dme/NtSXfzfue2
	8WwPGb3aR5GGUc87J3a8RH9MxU6Qh2PxjRjIZG0wctIDSkYSaDMLp9uucWkCQFkFx
X-Gm-Gg: AeBDiesyjorcQB0DLKo4Gf7iKQqmJJWeLnRdDELWZBFZPEtAJeCqt4BfyrD/Y2MI4Px
	gam+yZSSBXPQP19p1YwhHqjKiJsSc8luzDy48Sks0z5s8VFxPy+XW4/1llU3V4s7seMOgGEO8xg
	gjEjajGQQbYYW5zQ9vyAIs3k1mit6JOmJBys6QzfthfVFW+hkVcWoMFsYQWo95xKrKud6s2Llz/
	k8ALAMPM08Vp96X966wDFu3H784CDumc49esZQKdDtPMxVWuGjWuK800fpc4S6NI9HkThs9IeGN
	sVc3x79bxU2pybCTm4hoin5kewuCCwfNgXkLP2RZ56yncoiubq9APIJEmLUmVtZxa9DGKSy8m6S
	7KG4Iz9xp/5iNuVtmC5Gr5WAhaCQ5hdUsspr3WkCkkkrgPVAaz8/A0ahFLkwYA0AWpZyfGDSJtO
	zRoQK0sASGoAj63A==
X-Received: by 2002:a05:620a:19a7:b0:8cf:df8b:1e6b with SMTP id af79cd13be357-8ddcd21924bmr1557790485a.1.1776161102418;
        Tue, 14 Apr 2026 03:05:02 -0700 (PDT)
X-Received: by 2002:a05:620a:19a7:b0:8cf:df8b:1e6b with SMTP id af79cd13be357-8ddcd21924bmr1557787185a.1.1776161101945;
        Tue, 14 Apr 2026 03:05:01 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670e93f1898sm2113897a12.16.2026.04.14.03.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 03:05:00 -0700 (PDT)
Message-ID: <717c4b3b-426b-4e1a-b910-af466f8ef2b4@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 12:04:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] arm64: dts: qcom: talos: Add label properties to
 CoreSight devices
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
 <20260410-add-label-to-coresight-device-v1-2-d71a6759dbc2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410-add-label-to-coresight-device-v1-2-d71a6759dbc2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MyBTYWx0ZWRfX5aSULwY62pCW
 OPFyB/Jd0zuo2sGLPJJfBvS4EQG/ALJM4jmSI2aRcCLSsAowf0WQgCI3Gy+FvPYhpu5xAVSwStI
 1mLpBEOuF0wFFGx9H6NFeb/DmQw75N1Lm2YAi8tvn06kyLd76WxtbCWbuuZjgrSboIzK8nGHLtn
 WwwAZLSeTplVhPbkwEqHi27iRKV4IJewp9fBYClHwLoPQgjt5fxMNvTe7qZ6UOy+4v5nea4ReJC
 F7TU12O+/f+3s4/bbjpKU3c+A21ILs9GDaf3zc2nbr71mIruj8JjiGzlwrGHB31aJDSUYIuJYui
 9dl+U0CMbjrScOQ3r7XcdroUhjMa/SXHMm3hIOTwLG4JlwpNwikk55+4J/TQRzuVpVytD3ogYqK
 KEgSJJdMMwSl5I2Ks52CUcKSwHZZHhcoIoQKoq41ZmXhStP/PRmPaahmAaJUyMl4TcrD9zLfn+u
 n5jEHdp+HPpGzlhtmmg==
X-Authority-Analysis: v=2.4 cv=MahcfZ/f c=1 sm=1 tr=0 ts=69de114f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=DmPo0rGNWzzyqNjFmuoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: muZziKUav8zGgxhGEcdYZfJlshr4blQo
X-Proofpoint-GUID: muZziKUav8zGgxhGEcdYZfJlshr4blQo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140093

On 4/10/26 5:08 AM, Jie Gan wrote:
> Add label properties to CTI and TPDM nodes in the talos device tree to
> provide human-readable identifiers for each CoreSight device. These
> labels allow userspace tools and the CoreSight framework to identify
> devices by name rather than by base address.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad3597,6 +3652,7 @@ tpdm@78b0000 {>  
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
> +			label = "tpdm_llm_gold";
>  
>  			qcom,cmb-element-bits = <32>;
>  			qcom,cmb-msrs-num = <32>;
> @@ -3664,6 +3720,7 @@ cti@78e0000 {
>  
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
> +			label = "cti_apss";
>  		};
>  
>  		cti@78f0000 {
> @@ -3672,6 +3729,7 @@ cti@78f0000 {
>  
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
> +			label = "cti_apss_1";
>  		};
>  
>  		cti@7900000 {
> @@ -3680,6 +3738,7 @@ cti@7900000 {
>  
>  			clocks = <&aoss_qmp>;
>  			clock-names = "apb_pclk";
> +			label = "cti_apss_2";
>  		};
>  
>  		remoteproc_cdsp: remoteproc@8300000 {
> 
