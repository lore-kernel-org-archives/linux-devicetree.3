Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1884A31B130
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 08:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777882554; cv=none; b=CUDolUzBO/4PN7Lu5PJ99b444TLcsM1Hwl3jAqgtioMwk4l86MBjOIGryDGtxi6/ppKZV94r0JbXxJj1rZy2aszQkWIMlsCX8cK4ncIggiVIqHoeGriKmJPNi3wQCdLoTsb++TdJrRBYzQEUO9pBJBZMK1APQvETnRjX2/jgzQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777882554; c=relaxed/simple;
	bh=qqWBD5eaFIU9KizaLKzjtpxmiA1BR9WA4pFtTXKxQYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nZd8mwrZQbzIEUbBZs92pE3OLg4p3vVLCkuXRKvG91+s4fS3V8iUXjPn8rLLttXs3VB/cU6pS2s99BKmgZudPEjI0dN9oUTyQFmJ2kw2iboy16ZlSg41Q73Fu7whtOT8hzJqXnWul/4l9OmR5tkqnubc3E0bJN6mv5RzPGHkzhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lQfN2is+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TLkw+win; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lQfN2is+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TLkw+win"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DKcx875789
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 08:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QEN6qE9RlmcD09uj7xXZJ8VNTzvkyWhISNHUq57QSeU=; b=lQfN2is+SVU+nUJq
	IZloRGWJcBGAscEfNGPk6m2+Wd50I+BwQejTpDHcgilinJaYSNop81R0s53lbWoN
	4qPzxP7IeU2TRrYbT4TETpY0nLxgRl8JGylxMKh0e8w/Iguqk1nx/EY7jCuvutlR
	Rpi9VWjrho/iJD3swwtXKKagz/Q/tafrFIrXYdlgNtzjYQdmikPBXywLRnDJvYuQ
	EgISs+ko2BJhFdsi24UUYO4mkK6Wu9etD4m32Vw9hJqrKEvIc6zCncUpXdPFUiA8
	3LE+AnzlKGmVScFbw+NPY5gw2nhoreGxBmZuA9D8YOKEeBKa+NXyK0u/MxyyC1fs
	AjrKGg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwa1emtd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 08:15:52 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-62dcfaa5734so56508137.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 01:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777882551; x=1778487351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QEN6qE9RlmcD09uj7xXZJ8VNTzvkyWhISNHUq57QSeU=;
        b=TLkw+wind4OgjMMWqizylQhu081a3S/RN+Sd9CcNJEDEZanZjiAaa/JEeKa2FRyloR
         KwaoZdq/w6aY7zgXdD50mToonnoFCosPafhzSLAYitGlkLGYJark/TR+wSUBQjwtcyHE
         +nUvg9Oq0NVT5zKssa3GJXn3L5KwoP46MfQvTjyccimPqaT5HfhrQ0wZ7j2bYknSkJSw
         VZft3+vzNINanibQc62ppO7Lx5J1q1ovGOQDpJzqY+XYFpOIMXT1z2By+BmWSNKOBpav
         yY7GMK+3/dNffSd4rHle3ThF+ESZpcbZU4R98rHkmi0maDMs5NhDZ4txAUxAyT6Sogy7
         Mqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777882551; x=1778487351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QEN6qE9RlmcD09uj7xXZJ8VNTzvkyWhISNHUq57QSeU=;
        b=s/QjTEqDM33+c/4Mc5fTJ7SVWzEQeh0O+4Z90VdTDvuUBMlpOpla2wAqWc9m5Z7W47
         QejHkeyjHbx11CiKGWQn/j9lIa195wphwZKdIUt9qKvNMuvSD0WVjD758k8d6IRs4tXJ
         addKgPkxCnSttnS8LKNgZvsK+YOHjcrUhB9vhCxyeu81UiWyntKSGN8JQnx+bQYlpR80
         cc7JxYi/Mi4zwSZoIqOK993k+ffMpqIyj8I9p2iXquxpimofPnJqpjBC2FgeALHrItpF
         8VrLsxchRivf+ttmgPSl/X2Yads9rNXbV7BeRkBwWFBfpL72+T2HbvaRMWzwX/dypIMC
         agHA==
X-Forwarded-Encrypted: i=1; AFNElJ8FAllohQnIjoPrxW2aWfgy71VJLLvuHmXeiiY29W1OVfmI1jb2Tvxlz9Gynb2l3dqgUVEswaCczJvG@vger.kernel.org
X-Gm-Message-State: AOJu0YzrKeFufdx7ZrafKEMYtmdrTwC8wLKQPZ9geiFYS3o1tyNr7NW3
	nFF0AHVftJQnGcC5iwLPVdZmU6hU6rzJ8MEma2dK+of+z+2jajA5pOUb+IPCmCZl9jXi3ZGImuE
	OEGWxCJqqvcdSDKeo942vSDq88tiuujlV0v2Lrb66CkXl4O+rMiaQo8MG7eqhOPGy
X-Gm-Gg: AeBDiev+cNp2Ng5uPmFqYWcNbYjqKmqCjWU6TzxdIoZQl9YtM3Sy3u5x5xAOKv4jKQp
	Z7uFZ56cSekZYl8mRnHhafDKEq4QvtZTP15iKCuVL88HhuL2ACkbfo/Ue1ysa7wFhC7R3y0ILBo
	QWsvy471/38bVNzu1uZMkPUGPIkWowzALHBVLlT2C0FC1vMQtEMwt/KOOE6fLJO3pJDyqg1rYG6
	oNHAbNl/OyLFJKSFZTyVK29CEAp9LUqDYW781nz23FuoCCB9If7REThFt4QCJjoxD+V0kWyMC63
	vdPsCPIi0+Jinn4I6YC/PWHy0GfzqGeDy0kC1R34K/pKlgVs5GRo+7MGvocM3ftEybEji4iCnvi
	O5QS6pp0CAmlc7jci4EFHbzrDTT6vm/JH4cffml6fVI20MQgDOwRnFNL09baa8MueNvAQpOmphH
	h2/fTJMZM2FZNPwg==
X-Received: by 2002:a05:6102:5128:b0:62f:2f09:6039 with SMTP id ada2fe7eead31-62f2f097073mr652033137.6.1777882551476;
        Mon, 04 May 2026 01:15:51 -0700 (PDT)
X-Received: by 2002:a05:6102:5128:b0:62f:2f09:6039 with SMTP id ada2fe7eead31-62f2f097073mr652031137.6.1777882551144;
        Mon, 04 May 2026 01:15:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc1dd343108sm112820566b.63.2026.05.04.01.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 01:15:50 -0700 (PDT)
Message-ID: <a7eb675b-977c-4165-91b3-bd31a6d89ee7@oss.qualcomm.com>
Date: Mon, 4 May 2026 10:15:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] regulator: qcom_smd: Add PM8150 regulators
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kamal.wadhwa@oss.qualcomm.com,
        jishnu.prakash@oss.qualcomm.com
References: <20260429-add_pm8150_regulators-v1-0-9879c0967cf0@oss.qualcomm.com>
 <20260429-add_pm8150_regulators-v1-2-9879c0967cf0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260429-add_pm8150_regulators-v1-2-9879c0967cf0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: U9ZZLdmSMiUkJkRU7ZzGfAiZayeOzZjH
X-Proofpoint-GUID: U9ZZLdmSMiUkJkRU7ZzGfAiZayeOzZjH
X-Authority-Analysis: v=2.4 cv=e7U2j6p/ c=1 sm=1 tr=0 ts=69f855b8 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=D2dM7-3mFIAQKa9iRAQA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4OSBTYWx0ZWRfX7hpYibVPOxjU
 FsbFxuHb2LbnqYOjOypTQbb2Hd9p6W3taCl5PWmcj9trrRpoKwSb0IKqFhtM8azRYWA7QOt4kDt
 as1F3abgClPnjgzxp4upDsEfnEQ5hKGsKeWvnssxPFBF5yGj/5rggg32oTAjkfYIlLpfZscFDSh
 UUvjf2ZaInbN6L3y4DH1XkC6454909pxqpAoI2l4e2H6aLyvCn2I70/ntvcwmeZEU3ArYYyOFJ4
 Y8Sjak9fFST/aXHJV8ZMkdaEdybvpMRTk4GVbzRiTMQEGJkgZjX9R9bjYy869Tb9huEOoFMoulX
 mO4qqwros2g6rEwcjfxKQ8XBGSzuHxNaNtEd6O/xqvvMH9K6taCxR4SDjF6UmYcQER36WqLhPrW
 DfYaNWG8Vx55KnjjC+GpjO2/Gnvv11DHonQ1nnNd/LtpUrIQ/989mREJpgQ4BkyvbKr/OkTM33Y
 5ren3tRT/YZkCZ/2Aww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040089

On 4/29/26 3:26 PM, Rakesh Kota wrote:
> The PM8150 is found on boards with shikra SoCs and It
> provides 10 SMPS and 18 LDO regulators.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
