Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FBF395ACC
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 10:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779358578; cv=none; b=WKsq8n+mhHrDrgY6tlFRT/fvNsIndr1PcWLwy4yCzKO6hD5EJeTIfu0I8JWgWP3jGNfSXv5TnJvAEGlBk0XwWPxrifFmZOdX58bxbFU4F/BjTeDe/XfOgD+D6ZJNNaT7qvH+hqO3DQa83ZBH64L6f0mGdU8YH7FoVmnq1yqNRvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779358578; c=relaxed/simple;
	bh=w13oUWNYxjzA/ZqcnguND5E56A+PwLmpIwmDZAlMrcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q8YY63PNc+7JTTM/LfYPlPViOjeSbuTEs1ZzwTl6a9MPf8RlkzQ6q4TPYWiFfgyVIvIbgJGHrZ4TIagpCtE7Fd8ypjehlRe9RB/hccWnNwRvig7X9KGkGQEi2yy8NRLWTue/IpQE8aVNXPHcfjld+QfZapJ2Zx7+/FE5Jg9lxR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fmAyb/uN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fSBWd5tb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fmAyb/uN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fSBWd5tb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99n5k517710
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 10:16:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ojpN5O8pxFmzH9Ay6O9RehDva/HvmD7as/QChKxFYI4=; b=fmAyb/uNmVuLCXfK
	qerTvjwByfpoeBwJ7jY372IF8757ZRGvWhyLhHt2ymMhJzV79HM5PkcKgAdh7NTN
	0gjAkOQDyVCAdS2thYGUYrp3rrHQxDP4jVLuirD2qZM/d3/486ywl+unZVrqDNd+
	YMsmWF+NmfUhDf7eJEFHN2erjgpKkkne4wb5OIzqpCd8yskhNWC//bvDuo6L4ibs
	qsNdtyUSqSVfM4NksXODu84ZblRJqYINyy80REUAaTMdoz/T+mrZKe3xUXQB3tH2
	LZAevybC/UH2iTpRptiyTjv2o0NUv+UBwNqPbIzkq16Q/htNY9riptSt6CKBRhRA
	e08CjA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9saa1qm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 10:16:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fb98b09d3so19045071cf.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 03:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779358575; x=1779963375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ojpN5O8pxFmzH9Ay6O9RehDva/HvmD7as/QChKxFYI4=;
        b=fSBWd5tbq0QnQP2CoQj05PzNaCq0obvcAnYZ6iv8AKau3rqdmsN6qbqJvZ44Cv0kDQ
         b3C+lXP5dfuRslOt+J+t4mgPlReLWO3KlKp/Zn003C+FxX19PAwnydg6Y8Ds3Nt9+/3+
         WFQxIA3F3LvabkENmjBCG37m1cfdn4ZDigiExguWsNOGTA/2wGuRFxDRhEC9cLVI/xg8
         ZcCm6ipMLdhi41M2ZLrKmtTEZ1I2MgSCcRJa5qPcSEZmYxlYHIIu/yv+6Hjcyw2k4wxw
         x8/OvrM7MzecewiTy0V1yDrr39aMoIypUzu3Odja9XQEDcbyxgZ0nYhF8A5C2l4RWayS
         veLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779358575; x=1779963375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojpN5O8pxFmzH9Ay6O9RehDva/HvmD7as/QChKxFYI4=;
        b=BWxcjq8QsPMdWHfqAN0U3s/aZL92l6sOe9VPHkm7u0jzGKBArua1x7/GTe+/R1myqk
         fC7chjV4dLGbO2NADZfzc6gNSnpJg3vp7CziE59vFUVJfVbkE8h9r2lBEYoNB8zEBJyc
         /AyjxQvb/vI/uCkLNfLKWcWEGbPUckM8WEk//jH+hY8qSctN1bnwYT+XFrrERaSP0RyR
         rwfdH6NUJDwLQFCHCYmDqKluw+PlwWcFzAIamOAyVSfMBNmHJ/GPiB7JooSlwz/ii/5Z
         rGnNbWDqlJEnJsy8Uz5Hcp8GCGfpz/zMT5HJG7EPdkylyc5+t6SMSy2YLA/gB6DjKqb9
         F6yg==
X-Forwarded-Encrypted: i=1; AFNElJ/qrC9GBIqR6RyCsLzeAVRWjM2eiDyHdQDamhJbMzooXlfMmOsGfPPFNRdKD98P+5Wh224EtyONANkA@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk9GK/kfBl8pw/WdBLHYloy4CZsq2cbacjQJoYddWIBXve8KA0
	GuN+SauE0OoVOct7qQ6wlrnZObNwdLfowJNxB3vBF4pmP+eCPJIczJ1pG13QO14Jc9dC7ADC9tc
	+B3IE5qr/u21SwpcdK8mOcJvdJyFCgnBBdFjzN+alNhPCBSKCi2ixLqPh6IUIza+8
X-Gm-Gg: Acq92OFNGgBQv/0gMjpEjYNxIkiPtuianaqxe6aNP5VoJKZ7tbLzRlmh0B1i5UbPaaq
	SRQR6qnsR5E85mSvEqEpVtyP/qSK5FOpUNun7LajjhXq214ivbWG13NeuDGNhfMHiD/lwVYCyFf
	9PvNjtGQkXp2lsjUhyYzYAxWu8EL3PiZcFkUAvKnsCaIKUoTSPD7Iwmebh4AHpILiBfA3znJLad
	4nMmLQ7UvybiguEsGM3mfYicUf9kUiBEaFLB1POq8qS9yUqrxNI8RTUoPTMFQRPiAYuq3rFnyn9
	rW+jcE5rypPg+Gjl1GdIJT+KzBxihRnwczUe9eFQeXitE1cXRcq5FJvlhOMGBQLJCivlcd4I+OY
	mmAQEeAHmk/3TC2izjofTSdaqGI/cWYeEY0b4jovz4qKpHC6ubo02LnZDxUa+EkBHTK4pruIYT3
	xXnBY=
X-Received: by 2002:a05:622a:608c:b0:509:d76:fe73 with SMTP id d75a77b69052e-516c55ffc3cmr18949701cf.3.1779358575243;
        Thu, 21 May 2026 03:16:15 -0700 (PDT)
X-Received: by 2002:a05:622a:608c:b0:509:d76:fe73 with SMTP id d75a77b69052e-516c55ffc3cmr18949361cf.3.1779358574792;
        Thu, 21 May 2026 03:16:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8a410e22sm27141166b.38.2026.05.21.03.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 03:16:13 -0700 (PDT)
Message-ID: <efdb6359-a6de-4ee5-986b-cdb73b980d26@oss.qualcomm.com>
Date: Thu, 21 May 2026 12:16:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: kaanapali: Add minidump SRAM
 config to SCM node
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com>
 <20260519171442.1582987-5-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519171442.1582987-5-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEwMSBTYWx0ZWRfX1HxZBymWohHm
 nFsIIAcBQlZ3gLdvP2EHy3ctYqVMFxPJ49QlB1RA2TemuTjovXuOd7rk6+a/ANQasTAeUdjmQqr
 XsW2hzJk64ZCmVfLeYIj0H+uZNfTlAMdLRTuVd0fWaWDWHZoUgKYlBHDcCUg7gbVCYaRcf0amdb
 aNb48H2ytRw9zvuQ4AmHPe6itP+590kbOLkwRwEAN47CbR9ElfhoJx5y1NIpTrtWBSoHhD3Vahx
 8PMgFYvC1hzcJitONYmvabU3/HgQ3w+RNsVIwUNCxaxBNCGbQ2Wc5riv+UREY2lZ8wNGiGsQkxK
 oPAIa36XmkddUUZVnw2OsNmbk9W7sfQ5WNHthdE77w2u10La/VQxZKpRxPcVolSyP61f0yMxqGY
 +WfAkIgjUFqpzVXidhgkX5ZGA+LtApvuh1hoxiOBWZXm1MDa8/arkn4UuWprPdFoVabhKY0m1C+
 h5irTzrzua6VJUZSW1Q==
X-Authority-Analysis: v=2.4 cv=Qe9WeMbv c=1 sm=1 tr=0 ts=6a0edb70 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=eJDSHYLt-8gXCFyzMoYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: rSFWDi4bdyeDce9RAJ03W8hRkSr9ULYm
X-Proofpoint-GUID: rSFWDi4bdyeDce9RAJ03W8hRkSr9ULYm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210101

On 5/19/26 7:14 PM, Mukesh Ojha wrote:
> Point the SCM node at the minidump config slot in the always-on SRAM.
> Boot firmware reads this word before DDR is initialised on a warm reset
> to decide where to deliver the minidump.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
