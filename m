Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7903547D455
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 17:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865138; cv=none; b=tnO8z1i0MpeHmwZp33/sFXLKmoeX3WjeSd7L0LqJ0/OHrrxyC6TLRqUEKQFeAqLjs1IX/UzEvWkigGa1xzUoxPPmPIXWhHypTsBHrlrDNWmVgjOMyOLhEttctFzjGPj3q8wg/w2Vq5hfIWlCGgEScOCk8IympN2mfV0RcnCXooc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865138; c=relaxed/simple;
	bh=s2QL+3PSUX8WWARCToIGXu835aTMJb1xf5KO5gaCYMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KD2+RSa1SR7M1wY1s7P73EVplJDwYbIs0ZMbSP+DeBxC5jhLUoo3qPNxUfYiMRZ/SJty3Dil4O3uoGe3dGv4m0JxpVrGHQFj5Nvd3YFbWWzq35kiXICGhHgdensBJ6BykPFj/pwu/JeWAHmN7gxHsrQw1s5SPz22MvntAyjsyfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TwnkhZD5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8dd6EWh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TwnkhZD5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J8dd6EWh"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674H48bQ064355
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 17:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xmCsB8ZDjKldxMX9ka94ekEnldBeOFDJ997UA1+0t7Q=; b=TwnkhZD5olQv7ZFw
	LK2jfU8KDMR73DxbrsGgbVNRlkWIrkP0qYCBVxHSXnpshrG/O5qetJkt21krNeVn
	EHvE0frrfWnQdps1gwTUpFFrSDyIy1HDBkZgP4gGM72yDWvVlJPLBLk6c1b7f6rL
	Lz6ulVx0PNYqCwUugXl2+9bBKm5Yr4wpgRWVDyI/4UgoCCtGVUzauKttVx0WHWhi
	35YDjMuNogwZJ4vWDRqJgLbAlrk/ODv7G3elbhb7qGcPqcjQlwDHBTqgnaAUt8a8
	vn4YHqq/QetCziVGYx0yuzKfXLoaPw0p0BOx0Uqz1T770ATRF5Cr0Zq+v09kklap
	65ELEw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum5687ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 17:38:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cd01a14e81so1257695ad.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 10:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785865134; x=1786469934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xmCsB8ZDjKldxMX9ka94ekEnldBeOFDJ997UA1+0t7Q=;
        b=J8dd6EWhlk1+TQWP+FZU1IMkCDSfp9kG0o8mmKttoRhDpW+NiNBla54EQ4niTFU+zo
         UX03OzFwdHXLVifeXR5KBesF7zgHxYAWltfw1XrC5k4uygsrtuTBpaSz2Hwwwl64uRis
         jGL/iTf84j0tmcp5i6/P2WecemYsUMTboDcTFsuC2J8g57UQyboNbusBIbDjatRwf8Yh
         BqJo1hPqkFgccIwHLznxDMsyHuVppvrwuHpfU8PNhEwi5Giia9zkOSKBy1pDTz9iS6Ub
         hlvdvHcLOhCbu9OeCUF7mTN9Rs+SFQyiYdRigNAkj0EjPC9K1QrdqdHvwGBzJdwvkTeL
         sRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785865134; x=1786469934;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xmCsB8ZDjKldxMX9ka94ekEnldBeOFDJ997UA1+0t7Q=;
        b=Vj8sNME9AIzzDYDJHlkzN0EALHNhtW9uey5B4Ww+j0yRFtihax2s3aFKpIOnUm9J4z
         koA5YmMkbuhzD1EYM8QKEhMjFhcq7G0Id07Re6d96DmK6H5Aa4OlQpjiQoEAk+9wrKKt
         iT7ROTHi/5LZk3JPknanIT4MtGsqg4ftbd6EGERH30BOFua80X8g97b+mma6toohwgAR
         hR6H6VIzVGwd82BbR/PBkPs9Af1fM7Aej/fMCTSSD8imvQ54PHs/5x1NiJjbMnO5sW8g
         LUyyinQ8NMyUIqhr8w3MjeLS5F+P9w+1aBL4tHqDcfAtyS8iYSkqjN6Ajq3fKNhIOeB/
         mQWQ==
X-Forwarded-Encrypted: i=1; AHgh+RrIvcPE9VokyRoVaP0jPbVjYLL0aKudtK/2V1KjeNUJbs+UzK2+AJitrWHeQP70FlAVh5uM4O5EM3A0@vger.kernel.org
X-Gm-Message-State: AOJu0YyMdcLtpjeGFYMIg87e2RYtM8TNYxC4fzi14qD+bufvaBmuKGQ4
	QzkC4S0MAOEz2oBNTGaS6oXLrj/P2A5tL0XaoYzRD4un2ROK4OoAemFSMrZQUWKFZKrOlEhZEv2
	jew/oq/OoRzb1fZVQC97oK5k+8HaiBk8DrUVx7gl+s+ebKw+sAKk7PQaaLI5+P4Ma
X-Gm-Gg: AR+sD128dXgi91hNwv4VwLjTGfyu3f5WQ7dSsoqDP6yVsFNPxYrmewzxWpnAAWrLHhm
	yanw99FpyiPdL8LYdQj282rRd+UcSSRWXOuDvIqYA47pKNEY5Y8IVQtjnqeIqdvryHcMLxZamXE
	6TOGp8x6PLDVnNBRfPCSGJyRg+7McJjcE14lPGNORAgnz6yVzvI2YJLyb7lk8eBVQ4FkJMVyUmS
	rGJcuRQEGewh3CEg73I4svmYRFTDR0Kc81jWkC0WZ920Km0GLWB30d6jNOVwzoKelp6NKyy0uuz
	T7IsmHw7aOxDW3iREYN0wkwgmshkBusflKdZ9IrsUhJ3Lz+UF4toq0vSrfKVS3ny5PJCsLOaTPu
	+ZcVcvBNx6dGzCY84RB352hmd2c5Imq1PP4lmLCh3cXripRj9PsQPwHUoZ33L
X-Received: by 2002:a17:903:4585:b0:2c9:960c:f73b with SMTP id d9443c01a7336-2d0ca961ae2mr5638255ad.24.1785865133865;
        Tue, 04 Aug 2026 10:38:53 -0700 (PDT)
X-Received: by 2002:a17:903:4585:b0:2c9:960c:f73b with SMTP id d9443c01a7336-2d0ca961ae2mr5637505ad.24.1785865133333;
        Tue, 04 Aug 2026 10:38:53 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586402e53sm10441282eec.11.2026.08.04.10.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 10:38:52 -0700 (PDT)
Message-ID: <9387b504-4506-4066-adc6-7ea73db086ad@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 10:38:51 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 1/9] firmware: qcom_scm: ipq5332: add support to pass
 metadata size
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
 <20260803-rproc-v14-1-a1f87b0b0ad2@oss.qualcomm.com>
 <20260803123537.utocak6hvhl5ijqh@hu-mojha-hyd.qualcomm.com>
 <anHLxOdGJwChDnEz@hu-varada-blr.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <anHLxOdGJwChDnEz@hu-varada-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0MiBTYWx0ZWRfXzDbSH18eqw6N
 hYXomTQWH3iJu0iLhXDMTBAecvNGNW76rlgakmzju0MstjuB8woNG3oSo5nSRUJ8oC9PTu8Asvg
 wujdBsV6Ci0MtrZBkDNnF5jJpgh18iUinf9zVzGAW+kz3q31gX17h8aCZZj9r+yzBrPj6CSzKNP
 ZGMaqqX0S36uLcTREFZjxOjTqRwIOStJ0AgakHrckGCqY8Z0ImlwGqabdEtn9yxiIqxwvHq4kgk
 yfGZXBFHuJlslp4XRGWRjobTDyIAkFzHOCbSgtv8HXJPVj+4ZrhKaEXThd6oalIvTOg3abkrquD
 JAh9N5zvPzMdu7WoSkg/u/oRpT7kcJaHpuVT0qOzzzoDZQoFYy3G/CRcuOnVyrfjnf6qOT/zwAe
 zBZ6wVcQY0sGFZRBGKEqT1IY1f5AhRtBLrboyntC5zt9aX4/EGxJxY9g9Od9c1sYMmw0frI+YXQ
 RKCcmDSGggajIMpmG6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0MiBTYWx0ZWRfXyyIC3l27GoW1
 fbu0oVjsq0xR0un30O5umNiJY8KkECRY4rRC6hWzzVS0342V+M0cM50ElfhB0UNKosniKM1A+b1
 h1rNPjDZ3d8bF0wiXKAJKEAkhMGCEpE=
X-Proofpoint-GUID: 3AC-Nwh55NS4gZ3R1Fzxz0ge2eVwIKqK
X-Proofpoint-ORIG-GUID: 3AC-Nwh55NS4gZ3R1Fzxz0ge2eVwIKqK
X-Authority-Analysis: v=2.4 cv=GL441ONK c=1 sm=1 tr=0 ts=6a7223ae cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=855XeEJFKU-ae8dwujwA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1011 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040142

On 8/4/2026 4:23 AM, Varadarajan Narayanan wrote:
> Mukesh,
> 
> [ . . . ]
> 
>>>  	if (IS_ERR(gunyah_wdt_dev)) {
>>> -		dev_err(scm->dev, "Failed to register Gunyah watchdog device: %ld\n",
>>> +		dev_err(scm->dev, "Failed to register Gunyah watchdog device: %pe\n",
>>
>> stray change..
> 
> Based on AI feedhack changed %ld to %pe to print PTR_ERR.

That was bad feedback. You just want the number, not the human readable string

