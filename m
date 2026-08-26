Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676B53B7741
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 08:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787731870; cv=none; b=bZmEtZ5JUDZXRAm08zGX0wZP0aTvB5b8ZTGEuL1r3awUwFw8h427Jh1bOV8/CJg39gaNQBMkN+II/CDmNJpv2SXOUKRoJ265w2ZwIK6227U2kpLxDq6MkYRlipKyb4yAFu/YmtI/hRvNXEFbCLxY6jCbcFrDbfTN6klUl/JN4KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787731870; c=relaxed/simple;
	bh=O9cNyRwoigeVL3mb7kTFmiffIIJyBa9G6iUysKuCb6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eyuuzPBM8w/Zz/G/+chJqavgWd1CDVKZXENnMlIFSlCtsbJDc6meR8wkoehIoTFcZC6OR0IfPtIisOxaPUSQ9v75joM95sECxcJI66Bf4VkpY64lJy019frdH2ul4URxiYgNRXgsZuDH8jYtCa60k0IyWSOTDQoDA4dpHYqUpBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Etbtjl5B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b6tF0Dzb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Etbtjl5B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b6tF0Dzb"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q7N05Q1261368
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 08:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d67toVqUEwUZwq+Mat+ULLNDoJ/OriCDHESH2OmmQiM=; b=Etbtjl5B23tslwtF
	QtQlpkl/cgusRAHBrcj+ztohsHQFDQxUgF05QJhk3t+7FxIRuAzDIXLuWNqNR+VQ
	qZXFsC5qmnBK8rIF8uZ4I33yrHXlJXXxXxcbXNgCh9rZiK4MTiVDu70MEQEAZZ4U
	Z0YRz4+s8tMwYfkazs1fnUt0d8qv+B5KwvraFkKaXYz3nf9APAqfZZOFtjAhGTTl
	8puHhzHHB99gPE5ItEutU+lS1rp9+hPejc/6U88FWENyBcs2iwXwD4DmihABczhP
	n84PK7VHyLu4REDSo/7vplV9szgjSJAcDDyyeVyLsteLOfNWJw93qwJwx+FTJJIt
	cDCDmA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uq1r685-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 08:11:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51ca37ce4c3so1357201cf.3
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 01:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787731868; x=1788336668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d67toVqUEwUZwq+Mat+ULLNDoJ/OriCDHESH2OmmQiM=;
        b=b6tF0DzbQOk4TvTJYBRIWevlow8WynbyG/ECv4q5Dfwdq67F4nuAStWl3mGuqGv21J
         FpfwXpWGuqxw/+JEJN1JBwBY4GFVng0wdyoRzIJcuNAloDaw6t6FtvhWT7x463pN0iif
         Jsmii0AW+3n/w5W5hdq7ub/vSAvCOaJWgPTt4h6B3+cbD52TfoJxG3qUdrUcs2+Uq66n
         cxq1ecWSQ+TkUQvEh/vTNjZDGUyHlkE37lYqPuIVWsMy4fEAG1ULy17m5smjwWcixf8I
         N2wRckEVrqJXLZYz8dOCT1gJOtcfO3kEbG0Z3tTrjeRJlzXaZHskGRFzvx26V8TrZnso
         0gfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787731868; x=1788336668;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d67toVqUEwUZwq+Mat+ULLNDoJ/OriCDHESH2OmmQiM=;
        b=pwMnXcIrGeFIg7SMWLCB/y4BUj3Gu0JSZlkNQlEW6URRVfDLXSEx8kJaYpxHfQtR3r
         E9HNK/qD8JDvGvw6sSgbIRQvxcPgh9l7FjPLLYnkxnTAZ5ysa2aRKd1YcLSdqlcH6qcl
         ulQ5M69Z6frkjDg3YrmgrNazw0HxGeMBRe73fekaZu7IhTCKkaBo4fGRp2+YIateVeKL
         pMmR/rg0jAQpcxWLQkkuZxafbuoC1/XRz0rwLN4UDr/dbXTBraD0hbHPaPE0xw6z71UA
         oWKSVfZghhhlKAZ4EyHgnqlTfSyufytzab2fvI8xpQe6LKyXi8DvwtaJkqO84j0sDifa
         +ecw==
X-Forwarded-Encrypted: i=1; AHgh+Rqu6gdBT/iK3s71m8S1wSlma93NNwsWBuXkFDkPRBhKKZnMJhcwb8I2u40KL+6g6+17n4/pgAc9IY6t@vger.kernel.org
X-Gm-Message-State: AFuF++mRJPvX/Uw6yDbV25rWM9phX81djNB3wJUnO9XD5E+DIcCB5FGa
	CfO/JmCZGK7sUNHJ74SmAL4S2qruyM8pTN4sOjsHaZZJA+g6DDtPMMemZJqzZ4Etguu1Eb0z7OA
	87REppC26hNf4iWpDEp6A0u+j8RWN/qBI62khv1g3SsG2/t1VnuBf7yk6TlyNEn2R
X-Gm-Gg: AR+sD10cYcLGmQOID8/nTAW3iuNa+v8CmRUi43gt86WRyrXyCOOEe1kRJSg62vIR3xS
	PPA8zQnqcTfxzxKGayYwFlL6TAyXYUPcbP2rBinhpUDcFpVf9shdrgDx6eRzcy4PqZimldYEsXO
	9Oa+MrO37PN3BCu29vjnpBBHQ6pCAmUmnCpme0rEgLr2Z1p9b1uiAwpaa3a/ROGgLbVJVtP8oGZ
	pR4f1crRU3h78FeWKQqtOsQuBIukcqJI1WKJLJ2FZZG5/y8g1NmRYZ5HQxcq2sG5+Q7FRGWW5Ze
	87NftSfQwTT6NdglN/Nx6f/pf3AwHi0Qq9X6RrXiv/ZKXbpM41wpvVyZNNewvqC0wk+5BX0jGkD
	WJyw8P9nuqckMBsZkMZmSY/Nc
X-Received: by 2002:a05:622a:1347:b0:52d:8270:8e36 with SMTP id d75a77b69052e-52e424bfbfemr34210101cf.5.1787731867692;
        Wed, 26 Aug 2026 01:11:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1347:b0:52d:8270:8e36 with SMTP id d75a77b69052e-52e424bfbfemr34209751cf.5.1787731867311;
        Wed, 26 Aug 2026 01:11:07 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5deac24f1sm3072377a12.23.2026.08.26.01.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 01:11:06 -0700 (PDT)
Message-ID: <84d10253-b093-4335-9455-42ba821c1182@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 10:11:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/5] arm64: defconfig: Enable QMP PCIe Multi-PHY
 driver
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260825-glymur_linkmode_0826-v10-0-56ab597d77e4@oss.qualcomm.com>
 <20260825-glymur_linkmode_0826-v10-5-56ab597d77e4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-glymur_linkmode_0826-v10-5-56ab597d77e4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: thjL9J00lABUS0gIkykbO8iB9AZ5QP2X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA2NiBTYWx0ZWRfX+FkX6N58R7oE
 FVgdtrWpgmENsDQlb3qKXiomQmU7aUpfTgRybtr4/4OMMgNFphGMRGtpP6pzx2qRrYwRDkwPNOc
 xpJEXIc+OXtJTLsZxhkUwwG/dC1Z59uWdr9XC/tcDKogoAW7p1TCmOikpjKvcc3w8twfzSF1NK6
 Xc6tqYV++Tbma3q9V9/wBRqEC+yZVMtyERQ4c8ByM/hbheSV4eVBCwvT6XLVlRpPEWeHoHZGaND
 VKEoblL0ObiDMHUlexm5WbIz6XlMKqC+6bEMWsVpRvIL6hztNOr5RM4JV7vRfOa0EXzj7Srv5+W
 DDcu8E3zNLLyAp1pbb8gEk7X1Wk7J037vm9xPl2MXMYUVesWnzlkZUYrFI18fPSnUlc0V/MPSrk
 oVXoCBhCbXxdX1CKJV7DnptC1zu7Ccp52y7oMn0gJjUrCwSH/bGMJBX4IE9Skvwzmi1kJCt2nvV
 yStaKM7qxkwtLVo7u4w==
X-Authority-Analysis: v=2.4 cv=Y77IdBeN c=1 sm=1 tr=0 ts=6a8e9f9c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=B6dnFezVkazQL_yb00wA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: thjL9J00lABUS0gIkykbO8iB9AZ5QP2X
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA2NiBTYWx0ZWRfX1NC2YDGtwWI5
 2aVs+N+TE5ooHgT+Irt0L5fAA6YMNoeYZb4uItdLYyLRec4BSl7rA1kkEI+I0SIuXHUbgdLP3xX
 UcVSXqmHkykQB5MWHB+EryDDvk58iGA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260066

On 8/26/26 4:59 AM, Qiang Yu wrote:
> Enable CONFIG_PHY_QCOM_QMP_PCIE_MULTIPHY as a module to support the
> shared PCIe3 PHY used by PCIe3a and PCIe3b on the Qualcomm Glymur
> SoC.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
