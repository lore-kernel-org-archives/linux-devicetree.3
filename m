Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850373B4E9E
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 10:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775643686; cv=none; b=Q6PHjZSl6Mnp1mbWatgycPvmMlZLfW0iHAlrVSpZ/jdswZmB1N2kr6ujFKPgrU/Xv/TcsQzNXqBGBJ0GQ6TPEbrfBRW+x+I8IsddQwJ7MrEbrklENYpiLdBeF7wrPRcIZT3Be+56amlV6MZrX2UUR1sJh5xr/dVxVivpfPzv/Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775643686; c=relaxed/simple;
	bh=k+6pByxzbiEmi4bdhUkMDOcHI/ODXHVIqz/rq3Hwa9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Xi6ljCgbVabaslFUS0TGJ5scOTNWtZeLBC4f3W7kn4PnecyS1ygey3HhNUNTFkg6o8xADgeT2a/JpbknRXSSHkBR5kJXlmpG9f08OftOGOuR8UNOXhgRmwG7nyyinrFky31g48AU+/rqS/z/9osP9DX8oAxkcqL//PKkRkHsVa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RSZNno1F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H+W/gT4j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RSZNno1F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H+W/gT4j"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6387v99r1796070
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 10:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OX10KDbtGGFuzKWw5UHzfyZvSGgWsUmXt8J7ju9paXg=; b=RSZNno1FmNAmsONx
	V+IsZd6/aTrywJay+htyujMDQrJcx6sufd7uf/fQxX4KkmLmAB6OqnXEWBrrk1bN
	T4L3heQCYDt+v3EhOr6IUftxJEL8kPQxLRdzDQs+808eFo7HlhM5rhSFSKVE/cbZ
	p6pxU+ri7aeuIWtbEqT+OIhWQfx92N0fewGHHeEdeeEN1dzXpQKDzoTx4+jGc3lb
	zTZM+/c5YqcH4Xxs0j989X/+nzC9KcWEfFijTf4Asfnx5AahVGs4+4ll47MtbWhV
	bWPj5jYZuX00PGaBaND2ExISBLBWYWUPWyu60DQXho4lpJsm6mQy/Jhzhjb2Tjbh
	z5nHvg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd51dbmum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 10:21:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89f548d0872so20421926d6.3
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 03:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775643677; x=1776248477; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OX10KDbtGGFuzKWw5UHzfyZvSGgWsUmXt8J7ju9paXg=;
        b=H+W/gT4jgB6BZTluXNr33HXAPAVQhkVLEbweKsA7uTIEjOZ164Tw5AyFaapDWUYk2h
         s6GCNuNM5t1b42LSHyBO54aaKt0nd2oRTofCXryfhSHFegznEDZCYdq5DPi+wk9C6Au8
         c1+SIrA2ntRWV89KxvO/1XzPg23hQpTl2ImISpquiGJgmHFAQ3zPlszpUwP2I7lpukpH
         3riQSrku5mprwS7XtEKVoxMpmC0mnGcYAH0gmMhrktfe+0+aE/FsCHvhVN6pnnDFB3TR
         IxJnsndAzPfuPlpdVquBC73i0540aFbSsnFte02Rx6itTxexwn92u2vTTa8ZIsT3JnWx
         ZdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775643677; x=1776248477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OX10KDbtGGFuzKWw5UHzfyZvSGgWsUmXt8J7ju9paXg=;
        b=f7PbkY6LV035tyxqkKI26Ck9ZrgXo6pzHntD4cKR0OwitHaxDXYlqQVVH9OdfWivRG
         MAwPDE51B/1xyVHysFx+ChUT46WrqB2iMBEZ51tVbnhqSfDqhVAmCbyfer1OFIatj4+z
         mdY2Afey7VKRhpnLOzSB9kbF4U2IuI7926ZVq6/ddVa6SpechS1cIJ8uH66saiTT9SWa
         DPXlEyUcmmUZzSZT1Ex+C456pXgkQFcgtC/DBfyc/K67i0gsxPnWIexuHQunZ3wjqwhV
         BDokpAx8ZMFcY0v3cgJpEt7R3E563WZWiNnEZ2O4VOZQRmrR5hH9WMl51GfyfL02Zw+k
         93RA==
X-Forwarded-Encrypted: i=1; AJvYcCVDqks0kMij6DReFuZ9SZau9OY75nklf4ENq/LcVB8lbU+3/x7tx8uPT5LK6S/FaMLjv2+30DclyLK5@vger.kernel.org
X-Gm-Message-State: AOJu0YyVqA3fd8oXlfdFg+X79mBPZnUjaSvAbx1abKbu4ypuxzhazX9a
	Lb1I6r6uy9m443i4CpG+1PNQRZb3njuqHCKLWfxFuiRpmttr4FwkcLP6XwpXgNf2REabDn8KXjM
	aVjAzmgrmL3iCzd/hVCx/nCWDV9zTJ+K3Qg68O/LQ96cEABkeCld8HCPhbM1Qr6ne
X-Gm-Gg: AeBDiet786CQH/1hYwgttptkxEa4X6Ll76wNLmS/kfO/1lP54AFtOGY8PfAHKykAvoc
	9z/nnevc2o3JO/Ry+1EMpiWBwMfLZgAkcPIviZEfjmTUp5vpno7kRImFQZ0bgE9DKZWmlI4MiNE
	YhfQV1NS+A/wRQEWWS/OWf5MH45Y/2xth9lwXePKiaUG8o9xFIIuiuFJFM2emX2yBlouBtTFmdP
	XDLxdKZ/T0tpmdv+Bwl+kGuhLpAHBXt+B507sKBRhrYILOWYd65XmxUrnLxfncdNZnXyxbDMxip
	UdULtGcZdv0xV0Z5gi8h1Bq/kowts+twtSgATrMEkrkjyuvp7elyIsdej+20ya2bUJvZKuh8WB/
	1gHooTGy6zc8ztPd5ZaiofUM6VlrEHPx4CtRyy6L5YYONGfar2l2fixPUwhpd8aAcKSJ1fNOnmT
	FHN3A=
X-Received: by 2002:a05:622a:13cc:b0:50d:9138:3322 with SMTP id d75a77b69052e-50db0327a7bmr33843771cf.7.1775643677384;
        Wed, 08 Apr 2026 03:21:17 -0700 (PDT)
X-Received: by 2002:a05:622a:13cc:b0:50d:9138:3322 with SMTP id d75a77b69052e-50db0327a7bmr33843481cf.7.1775643676986;
        Wed, 08 Apr 2026 03:21:16 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff0a1esm629483366b.43.2026.04.08.03.21.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 03:21:16 -0700 (PDT)
Message-ID: <87350a3a-b227-4375-9f52-86433f5eaf7a@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 12:21:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Use GIC_SPI macro for interrupt-map
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260407201839.25759-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407201839.25759-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4EbCeLhY2JXBUS37Ckfja7NUA9juIZQX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA5NSBTYWx0ZWRfX0tqGwJHCVeZ4
 RcOV/75iKZVykxokTQzqrbvaAmBwQifFNJIyZizIUgYKJcEV2lbdY3ZKp49WurT9BKZG65SJY2b
 qzA+ODSiqVV6deAoFgzu8+KRDiY9cq/F4sSJIdCllvVRUPlhSFzCZObGsDZSYu+TwtD5t9PnmG/
 lIwCQwH0EcIP0KJwdFzMeuwtRaWJNnyvIWRBWTtWXd91r5VYu5yp63RU9jCk3lfaQnZFHHHwW3i
 hTo4RWHR+0ufGh4MFQ6HeKC5Z8DBpJG43FjwsQOR7KYUT/eHET29ExUC+0NnnlC0M3YPjrBJ0Sc
 9EWhWXn3cPWhVoMT9xtJlg2NEm7SxbZG9K8AvtSEaDqSwJsrJGxnBrbacD5uggIjz28LpUWA6U0
 ZUvr3aG8HSB5YQR6h+PeQSgxVeDbSfXhp4HNIoUblx5cBH4R6mqvcuTG7RpEML3Sz4Ta+0Q6QFR
 FbmJVfjEtrv84a843ag==
X-Authority-Analysis: v=2.4 cv=AcaB2XXG c=1 sm=1 tr=0 ts=69d62c1e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hdY4OLW_gtqzIo9ogFYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 4EbCeLhY2JXBUS37Ckfja7NUA9juIZQX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080095

On 4/7/26 10:18 PM, Krzysztof Kozlowski wrote:
> Make the complicated interrupt-map property (with multiple '0' entries)
> a bit more readable by using known define for GIC_SPI.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
