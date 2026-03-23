Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDBB35F19B
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263940; cv=none; b=slKIl0M38Nkw8Cl5ubTdez48V7hePs2g0/UHiwndPlsHeVjUe3MyFHl7qAkWjYKZU5w/imTpw54CvxwGnC5ywySJ2SZDse2EjfTsyynZDixf6vqvVCd/RCazMrn/Fz6gAhqoyGuI9BCHoMS1mo0BuRsjOoj0cnM7zIhqbZzMzUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263940; c=relaxed/simple;
	bh=x9OOzDnvB5GYQePAw/YFLOmmk1AGm6wHhZwblVIQ4z4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IPjMBd6DqG+32TxxNpCHB4XyXvEDnoaOrPSodmxNX7BRQhD7xMc8ktr/uceGspMP3Zp03WIT2kiP897aw661wDER8o6NCjh9IRpm923zIlSdJsEc4TZx3AVs+51kQ5Y6u/OBETnYhJbDE8gYCZZdI0uoIXGegqsk/UFIlEx6sDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=do8LW9GH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fQ7SXKUU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="do8LW9GH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fQ7SXKUU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N730vS3507946
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3v0RMqPfyyqTjEKKAspByaGNg3c24B4gWVzItxAZdmY=; b=do8LW9GHI9q9d8xj
	sUI2cL+jHXGIuS4etxBtbGWAlH9vPVvNhJPH2rvHlUyhhV9BjFeIYBehZyjpmEAA
	nLEY1B5zNPLTrQSr3xei4xKpEwmGNMew83aIN6X5DZTBlSo3mAzB3YBsZeFtn9cB
	M0cPIlIndOO7l2ik6ZwO0eG2quh5E1Rvq2h71WKoUGEEdx18WcG20rrpB5CztujF
	qIrht6SJC9cU5IY8PhD0BeArAfqklVbbtlXONjW9H5GwYEFUvlC7vUzcMebWI5nX
	J+A/aNSIfEZKbqH2l3BDmSkciO3YgKkzfcsIQETiDrS/AGhMBQIVx2zl0FA1uhVS
	G3YJug==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8k0am-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:05:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2955cc1eso25595471cf.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 04:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774263936; x=1774868736; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3v0RMqPfyyqTjEKKAspByaGNg3c24B4gWVzItxAZdmY=;
        b=fQ7SXKUUO0xMu1DCKJclg78Yb1gRITqPIE5+Vg064P0EbyniWWL+n8qPbLouaU8Z9c
         0R6unNAFdP1xQCH+pwHdB1Lqz7/xBhWuYFuClH3sHmz4Hzdjv2Zg650tt5rUl4hhK0OS
         a4Yfz7LHKTLkq0CCd85r4lvZOaNHIt/EfydFCGn/YgH/r3pKaVeIa9e7bHU0SkuznCx5
         HJx39oLAK9U6iEr9SOODjvMEvZUk+zDxPnFhVP4f/elmqm71jbSUW2ze13PyxuqCufIM
         ljqJxq5gZnbDrH4ptTp4gOgeos+yQ/SqkttotPX/HaAnIs79MraFQHlByoPtZJf2b0vR
         lxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774263936; x=1774868736;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3v0RMqPfyyqTjEKKAspByaGNg3c24B4gWVzItxAZdmY=;
        b=RNkbHdcukbxNc2IcVLLmvEsbyS059lbf4yjRzkiTsC4rhyxlyqV0AIQ021s+Jwv3xn
         ut3gAxqhPdgbn1+pxIaB8UgSPbgdZKNXNANHcJcS/81k3cfMUWfSlIaxg/y5o2Q9LoKT
         jp2ExThPcJzWBDNgKyViYmt1YbxbAfN9WIsbP8bmRtan+8juYbB5loxaSawzd7KVDCMg
         GVoLl+nri6nW8idnZ5M8cxBKLDdFWLSl6aMrGKd+txfBHkte3ZOpeS3suT2pjUrg74Oj
         rndcIvcauZrt+qlPggHR5lnNcXNVvOYKh2cPh+ObfABhwFOjVVyiojBJuPrUE2gU+gZI
         dHig==
X-Forwarded-Encrypted: i=1; AJvYcCWuxkvMRyFD/XUtt3R8cZrJ8wNnd56ykrFqYHdIeIbYj3A1leHowQCUer1XUim9rY2aZH9ZEwn7AvsQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyA5U8Y/becML6ClBvdFshrtbvAkbhCZJImenhcTpDz1KjAMObI
	wh7bLuyRfnsGPRb6RSQxZ74ryvV+Uoo5dsPTy6ZpnqsE0PtUu3tJQXZk2fcypzxAaC5Rxipb6F2
	gZoNVg6vaTWvv2AxKp/V7Wqe1ljp2JnJAJEazWdWJX00zU5Icaz/MzG74tOOGjuVa
X-Gm-Gg: ATEYQzxp23bkPyKDpR8ib1psNPhfGXzyXLug9q6pzQ6V/RlSrJaM6kjWb7eADelqLpR
	qCNRCmLocL23lQEm7BRHqXO3JST1Fl1XqTeg4sShq7IloBWBTBQVyIeY4j24dFq1+Onfr0DqGno
	TkHYdQBdvjftDSx9t4vXPiAQrxFcazY9PqAn+IPmNzZD33ssnZBYivwl9R8TlcqL/yRfcW2+m7v
	ZdZRjUJfDL1b7ygRLTmkHQdXNiLucXWEuNJKg7PCIZ9tI7nTBQQXxQA6yvhnNzUiUjd1ChuR101
	jG/uLbZdSiEYVvuHEMyJn18Y+ovGxfyecD65+wUQQ1B66wC71lAMDAaWLHE+JmeK6g4VYVYVpP6
	o/4mn1rhzLzrQIGLOQWAcDPohFkTxPo+uSIKgGq2xzXutYzX+tpCP2382UTJNxk82vMCPgPEwfl
	XWfSs=
X-Received: by 2002:a05:622a:188e:b0:509:38b0:c44b with SMTP id d75a77b69052e-50b37564ed4mr140703031cf.5.1774263936160;
        Mon, 23 Mar 2026 04:05:36 -0700 (PDT)
X-Received: by 2002:a05:622a:188e:b0:509:38b0:c44b with SMTP id d75a77b69052e-50b37564ed4mr140702671cf.5.1774263935680;
        Mon, 23 Mar 2026 04:05:35 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f44034sm486654566b.4.2026.03.23.04.05.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 04:05:34 -0700 (PDT)
Message-ID: <ef89e328-fda6-43f4-b40c-8834d16e2cfd@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 12:05:32 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur: add coresight nodes
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260318-add-coresight-dt-nodes-for-glymur-v2-1-d76e08f21fa5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260318-add-coresight-dt-nodes-for-glymur-v2-1-d76e08f21fa5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4NiBTYWx0ZWRfXwzqH91iO4gJY
 aTKzD+WrliEsaJ+0TJ7IihMU3sYe06b6i4Yqx180yIZoYchxS62L1W/vyY6UtKIYFxAZF8l5xBa
 /lBe9QK3q5FQQ3QCtXyzao1BW/nxc+PTD3TxHcSTc8yqSHznZ5F9gooOQHfJd4LmG18RIOWCGce
 8VIi2TGy7JPeYJbySGKEJMPn+wAfBk4LLuGbOardPBcaf1HrVZSUULz/wVqoSKBrmNyp6deuQbO
 yIAGkmjlne2YZ/Lg55Vgw+ag5osncJNsw85wOaDdlJu/zYJX534wqra/cjcajvDqg+y4t7CIWgl
 H21XWxbv/UxSkbp5Gz0L8iuZz9lf0Ia5Cf1GyP4FuR0po4z+M7UiNrZbBMSDmKUM198Tsye0KmO
 ULGV4yDl871kP2ryowrKX3yG6qZaVGv/+QIfixieCty2ZuX+APJkOpPqg+7OWzCxCRAAgD1Vp3K
 ngcUJoBA34k4tJvPP9g==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c11e81 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=aZZBkmzhk5IA7hPeShgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: j7dvD50E7SUymDx19Ybpf7B1wClHzEWk
X-Proofpoint-GUID: j7dvD50E7SUymDx19Ybpf7B1wClHzEWk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230086

On 3/18/26 12:42 PM, Jie Gan wrote:
> Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
> These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
> some small subsystems, such as GCC, IPCC, PMU and so on.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Changes in V2:
> 1. removed two cti devices due to GFX block is down

i.e. "because GPU is not yet enabled"?

>    - cti@11c42000
>    - cti@11c4b000
> 2. changes two TPDM devices to static:
>    - tpdm-cdsp-cmsr
>    - tpdm-cdsp-cmsr2

They were TPDM instances in v1. What's the reason for the change?

Konrad
