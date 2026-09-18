Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6B74D2EE1
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726756; cv=none; b=O2yRBEFQAj9i8HIrnl5QoQmfiqlhDj3H0mX00t0qDcXRhQdpTcobhT6c1Nk7rXTrkyaKY+inZDhFgWMtipIheqYFI9ly690rkAWL5sGKoZW+MZ1eesQx0/Vv9lCBvADlDFxI/1HjiJSmgsvT3YRjiNtRB5sn7HlpVyWwsTSqqiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726756; c=relaxed/simple;
	bh=8fjQJiJEzWPsbO1frulwQqvRHirJed2i4uBwsSljtNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VjhsplLUNaNTi6XkFU0TDH6dgikUXdj1wiEww6gAHU95L7ao69zRmqstk6ibjiAvmnwX9KsIWfZCm0O+4jjqAyGEqQNMrxC64Mc2sRJDd6nAjqlypnGICf101wucHcO74B5kBcuZtoNDTHnGHOvHmInWeh1B6+xlequ3g612zWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=adl/+FLh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fTdbz8KL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="adl/+FLh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fTdbz8KL"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dOx5250720
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iHkJ75ewzmbvKgcRo7Ae3mDKRV8Ptv+pXDHjf+M9sE4=; b=adl/+FLhGpkds4YF
	5Wu0pL1wJyLDZlwF8otazc3I/JEC3tBX2alBFe19Y1JwoydHubHxIb6m2MDZyUui
	d9f0n+KfMPx3PDd+LncuqGyRb1Zn3S3foEtntbE2IhSBHyX8Kysm91y0ih/M3y0D
	Z0FqAqQNkGc1NhMLZt9PK402OLh6SXGPCQB0Suo3LirlgkW7ADHxoCQl8vt13+4k
	XmUeQTbN9qdbFCq72mwy7F8I/o8tBL2ImKyQJDjN0QeHVN0QBKTlJkrJvkrhSRrz
	bP5XfoupKL92lmSgTabvD1xRzbcfgvVLfff3l7/AAz+s3AuBzBflSj08KdpK6/3H
	uwWb9Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs2390ccy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:19:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9390a2c895bso177997485a.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 03:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789726747; x=1790331547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHkJ75ewzmbvKgcRo7Ae3mDKRV8Ptv+pXDHjf+M9sE4=;
        b=fTdbz8KLKsuCiSBUPeq7aSXD/98QZNwOh77OB8jt4DU9fm9bYkSTBUlg7hDGUrMdHf
         1/gyX7uDVHldxKf4hxb/+sKQATPkWpa5Rc+WYsq89YT5TC/stYwHYAx1jMChofBrcNF0
         5uw+B2aa4JfCkD8r4iMiM5Z+HDMqAlXoY5afyWXnno2XheS6RQwIPUExHm7ekcuaF9e1
         C1gSmNREfmDgs6aVa65PhvD6lhJdq1JRZkvDWsWyp7J7hzIR+UW+THqwuYg2YC0jg7kf
         9TWg/jpzsjf3+1E2WjxPvIUwXjQdJhzADYFfU4l187QgAdQiVY9subLwDce2reMdVCK4
         Lecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789726747; x=1790331547;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iHkJ75ewzmbvKgcRo7Ae3mDKRV8Ptv+pXDHjf+M9sE4=;
        b=McmJyZo+ds0WtLfOj2ynGZlSD5X8OG+VB5676bMZptTRcq0Z+B6b1T3tvtJrda98wU
         Pv0bJDXpnHR1AW7iFUgbYgYlbZpNlkn6SX+Tks+uusgmIAeQX5aKwuaDYKIQxOAtlS1X
         whzdD/dYmwinJhFhXAf2TGFCVkBcB/udUG/b4IG7ZaMaw9xSksE7P32i422uWGSAI+jP
         x16PXqGG6pPE5cK6aKt9rcnYr9EsWH/WZE1yIUotW+F98IR2hEQH5v5WIvIUffq2lKLT
         NmPHlNnVGRQR4OTf6ZuSIoXwext1GrRGzUNnIFvb5o6TDXTlQi8S2IFYa6qBJc9E6/PM
         mUIA==
X-Forwarded-Encrypted: i=1; AKwUvBxwqVNT5sddGiJkZpEsTjFDRjTVqTt1kr1VM2mriL09uZZLrvWL/qV2M+/OETDPK1fJuC37REZodGyR@vger.kernel.org
X-Gm-Message-State: AFuF++lTEiXp9rcGRWNb5Zudm99BDwJc0UVTF4i4IcOL5WuvllUSNKvj
	rAqBgz64matmm17XurQ5GF9Ar3O44iT8i7voNN6PUyqap53sMpMbPfp6ryuufAYhT1yK1ssJpIP
	YWGgpXiaoKpP5F1T9u1lbYqBSWKHCxnwIq+IogCLI/z/5wilOfA3BM3eTYBOmc4dO
X-Gm-Gg: AYBFou0/9ugomgcxy2dhLngne9WUgkSInpvAkqbI/7GWMbf9GgZ5ZUzAl0dCHGEOy3U
	ZSeEPmMqbGcQC/ye/st2DGMqaeyolbhB6ksMbjTs8cpSSEf/uRT02frCi65+eDqcDOTP+TQAsVc
	SXLSmX1XfdRtmrb2QRrnWpE1nfs3RvnSeszikbdamMS/RAmCwPR0E607OATMbfJppUEjsHc3FUq
	eKKBXK29hk+i5ztrs8XnQzj6Eq86rEEbxr/mnBHG4cv1pWUej7QpvazvGpgOqEFXa2vXhQ2mqEB
	EfGNAE0BHdZS8iGu25auxBLE6CjsXJgBFmVXpBN9zyce0tD/Y5LRf6PUjj6RdBiTuOGZI6jMksl
	T7Vo34sDDRs9glPbj/Npv6rjRKfqp/cbKCl0b/LKd67X3sF3xbaKwL61r3xBa9Mw=
X-Received: by 2002:a05:620a:268b:b0:937:5298:7820 with SMTP id af79cd13be357-93bdc6a6c91mr259104385a.8.1789726747214;
        Fri, 18 Sep 2026 03:19:07 -0700 (PDT)
X-Received: by 2002:a05:620a:268b:b0:937:5298:7820 with SMTP id af79cd13be357-93bdc6a6c91mr259101785a.8.1789726746850;
        Fri, 18 Sep 2026 03:19:06 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:82ae:cd75:d970:e66f? ([2a05:6e02:1041:c10:82ae:cd75:d970:e66f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd2160c2sm150832725e9.6.2026.09.18.03.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:19:06 -0700 (PDT)
Message-ID: <a2165ba7-e259-4e0b-a533-3961649b1803@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:19:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: thermal: ti,omap-bandgap: Convert to DT
 schema
To: Bhargav Joshi <j.bhargav.u@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Eduardo Valentin <edubezval@gmail.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com,
        daniel.baluta@gmail.com, simona.toaca@nxp.com
References: <20260811-ti-bandgap-v2-1-6fec2a71c394@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260811-ti-bandgap-v2-1-6fec2a71c394@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MiBTYWx0ZWRfX/Xa5t/2aRrtq
 AZ6t284DHXaD0VRaf7gq0g6BfabZ4pbOGvMQD+BG9f8RswTSvVF607308foJmZxJznVVTQWUyHC
 5w2CUikrOOpea0ugD7ELyzCLx0O6Tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MiBTYWx0ZWRfX/1EoE5sy1qPJ
 GxbtWlMZt3338RN9ZaW7gYMxqyNYPB7kpclt6H9IzKGeCU9F+svehuyKFtWlQ7uNRh4spQ086/Y
 onxd+ZhI/AFBAh8nkjNpIIkxjzUcca/i2NDV78JtWVDoxZl5r0e9qh0ld6fUe4eFaNfyvlHIFlL
 KbtBm1Ugp13psIcbspmM9FkYAAoDgJaZaT9rtY7VDRKKh8jbFTx4yyhy3kgwYzpYhzyPJ5fIZMA
 EMiZ8Leo1ZLeO28xEg6Sx+3r8fwUEz8UyVR1wht4QBExg978Pz8ytpWPT6M2FnSZ/blbNsfDqvT
 crqp595Yem3agmkb7Dpq4A4nEpnRAxwZLs/ouRxI+6pi0FKvVYQbkYHDs6YZHTOso4mjUbsqbad
 c1XV305a95kgwsJw9dTPlkN+6LXr7PBQVatmjMqeWE8K072TwSI5NDr3vlCSlzEtww749r99+vM
 txiVyAFBRNqwx2FEcfg==
X-Proofpoint-ORIG-GUID: gNAGsdR-XWNYWfpTk-3XwJzoxZ7O65Ol
X-Authority-Analysis: v=2.4 cv=I7zw19gg c=1 sm=1 tr=0 ts=6aad101b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=XW-PbBF8hWzyniDVdj8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: gNAGsdR-XWNYWfpTk-3XwJzoxZ7O65Ol
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180142

On 8/10/26 20:49, Bhargav Joshi wrote:
> Convert Texas Instruments OMAP SCM bandgap from legacy text to DT schema
> 
> Add "ti,dra752-bandgap" to compatible which was missing in text binding
> but used and matched by same driver.
> 
> Document the "#thermal-sensor-cells" property, which was missing from
> the original text binding but is required in practice by all in-tree
> users via the common thermal-sensor.yaml binding.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
Applied, thanks
