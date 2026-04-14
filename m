Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D68F3E869F
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 14:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776175803; cv=none; b=k9jow7FezHOIyyB8Ces4Um03RgKgOhXRmyu/+kHzX9druJH3N666hC/7B0gIMld5d+X8DQFXsVWn80wbzEUhgrLcU0Fe9TrOMf77coK5CTW3ahTg/u2/Jw94vSof6H7294PrDKlspdZ6S3/yjGSm7iJq5cJAXPaONVNCD428ih8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776175803; c=relaxed/simple;
	bh=v7YJMKsGDlh1XdUvKRSZvUwbcwUrfvm0ci5obZxzHuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ETUwHzM0dabqYTPh2IvqUc8QIgblUSzbC5/r8vVBboES1ypoZS3rO/Ho8wQv7MIjPS8Xv/+UZB+ghb8Ja8DiVh2ctwki2yJMrh6KWRmD8mfpgEUkqbPNw4r+OUsYMr8qanVbRIt50mqvWS6kSZbYcULXA962+4GOKoBGlL7auO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NZbdmApM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iK344g23; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NZbdmApM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iK344g23"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBYQTk2386429
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 14:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ODMoVBUj25CjShpTfa2WXnly8YJTIG/0z1viPh/qBBQ=; b=NZbdmApMwdxzai/u
	WqM7682GFk6zcPLl/7afKamZ6/yMqrHypMQI8yBtEOCEn0k973OxTctZjQ+ygjdG
	drGQzBI52syqQ1KEzr9w3snpgvUWwHzyZwgwiRUpkqoYF9nPfVsUWT8axRZOdmO5
	3v2qRvwqp1mh0zGGcNZRtVcySbbmQNqk/yzV1v0sG7hAJS8jrZuvQajp7tUxrPJm
	6vDjrjlvVrgFb2OyiY+oi1KDPsIXYw1YfuR00SJQWwK7h0QsBTcXpuGeNk2bhGO5
	cgJMqCY2W3Rd243zeUeWsZSjHJJy16DsFYPna3kEGk6Ys09eFnwvA1tDO7QVK+9h
	oadbHA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86w310u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 14:10:01 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89f59c9bd28so12404826d6.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 07:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776175800; x=1776780600; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ODMoVBUj25CjShpTfa2WXnly8YJTIG/0z1viPh/qBBQ=;
        b=iK344g23I5kx95iGdZtCQx/7uVq4QIg8GxqCRxRSK8kLGhrpjgDUQ2K8tj1aA8jqc3
         mVSdsJhkOyQDeMUTThPp6h8CpUfQlG8A1s+Qi6MXWs4Ewmjb+yufZv4nYXi01R3BASRf
         /eCQ3IHGKkBAK8fB15NZnlgSly3/Q6SsInvObjbUgvMSmdO2mF91Tkzitb0OqZ/USCNZ
         D+w2jhyOjGNv/5xm45FfwY37a0KAg8+KzHBlVIAPQImXVrC3Cl5kB11SCxpa95MhEBSO
         AIFP/kRGSMo0RBmicNhXcMm57WUy7AtGWps8x+XvFfKlw45spAQf2VvG9RVVgBgfaLlk
         zV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776175800; x=1776780600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ODMoVBUj25CjShpTfa2WXnly8YJTIG/0z1viPh/qBBQ=;
        b=PxB95PPzwxQXJKG77gM52Fl6twci0c6uQVmykIWm1mrBuH7KggIuz9UrGkazdRgwBe
         otijJd/Td254St+5dRFUQw8g+95yP+1Km+i+nnFbpImY5EmQlQf9dV7B41H8gHNuzQn1
         8TwNCTuhzwD8UH5xZGpfxDGTPL/xitEzGCsfkYAKxRe4/4+f0H4yuWWGv8LZuIBqVtAG
         fJaBk4xfMLBwZFsAjUrA0hvpCI27qYDvHNLll9iw0+y4wBi89MNuRNt4d0J9gznnCsCT
         O6Cooek3mMXuNdbph4cgg8b20KgsvNIKdYG1p6CTEaXPAR5c7fBjukLpV+keheJjQrcX
         Asig==
X-Forwarded-Encrypted: i=1; AFNElJ8xxwlV9fDj01XKZBe6scy/dY3WGQeqJSOsErCyhFbOsj6hAV01J5WvPP/FBxothSxNKAC8923bamBm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1y09e9fs2k7sFxncFFUT+vyJVecwAdGXy4XGMgnfh7RGGL6UY
	JXP3A2pdeimT8v5/fLl8doN6MoXHrWjr5y6/gfaPB4JfbLo1YOB2IMyz53EL5O3BJZ4c9RomKyr
	+ZIpbqLmPTiv1kgIS3bH8bRp717trjDK877mTbtkHZU6bK9mcdh+CKetfZfKS8G5o
X-Gm-Gg: AeBDietWjpFGiS9RkJBOmiHl6Vuc1foJQxZzO+AIIeE+XNdj19GrHvC2MWXhmoIWCge
	qNkozmZOyK1L+rdneOkCHLgetr6ghaF+v0NlKnoFNmHJOSjNix3o2Npo4vqTxpSzvfuCM5xVsSX
	f+4UpLKQFn7bIcm4yHwHRT1f0HrIoqGT5HuPj8L4pIiUhrDVumu8Al9Z/oIK5G9UaF3gOlN7N3o
	78g1IgRqEfMbgrEmRoc0KFt1UObGtw+Dm5AYQ26ymhLHghBC1qJhHt53fyiiYKX9IT09EKkBW+v
	Nre+mkp5HbXhlNKbFZLJRnv9CW4HsPumx9xd2/KjohimMDiPEznxRcNh+WLyTPc1lGzDjBkJ9Vp
	h9qa9p4C+pjXypNXtr32Y1eO9p6yXFSGs4RxdgBs14tQcq0cKRpC1LYcR1GkRQezbFc4N4n1vcy
	gbbvlzIXYPV+J+eA==
X-Received: by 2002:a05:6214:ac6:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-8ac8629bcfemr204974606d6.5.1776175800035;
        Tue, 14 Apr 2026 07:10:00 -0700 (PDT)
X-Received: by 2002:a05:6214:ac6:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-8ac8629bcfemr204973926d6.5.1776175799410;
        Tue, 14 Apr 2026 07:09:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c5824sm403077566b.38.2026.04.14.07.09.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 07:09:58 -0700 (PDT)
Message-ID: <809e2ad6-258c-49ac-9f3b-4ced32807203@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 16:09:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] media: iris: Enable Secure PAS support with IOMMU
 managed by Linux
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-5-7d3d1cf57b16@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-glymur-v1-5-7d3d1cf57b16@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: O2J5phkmqlxlza_13m8obPheE-y0y4VI
X-Authority-Analysis: v=2.4 cv=HKfz0Itv c=1 sm=1 tr=0 ts=69de4ab9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=BowHXwPdtatiOUMbaTwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEzMyBTYWx0ZWRfXyWiQGUh/dsDZ
 g6HKChKdavgqsM5t8rfiI2hUWVgUqAa8H0D3fHFlmuhLfdg9z4aFjqA1m1vmt0uk+X4VnEqz7X8
 QT/rThjPDMwp6AOrQ+lNCpA4qmItrcPF/Lu0PkLsHrXju3UTYebjPltifh9p5tyj821Xrl+mE5U
 xt4XWv5TtZyMcuvqhFRvuwS4wHEJtDJMis4kn68MDQdCuYa3U1G2kepKaLgec/ZThIs2PWdtkW5
 CQHQbCidvo9wY1h8a1empA3vHc8ddLJitkYqI3/B46kYOM57YYirJHRcyPwh0RBKObgrINyBiK3
 toj4nGeIxEIHdiMHNYz/mg7fSy1RorqmnPhFpJKnLiMolMwwGyYx8nIzCeL2rb+LygIO+eniKHN
 2AF6eaZJcdUWqoSm8Yvd/3xnjh2fWtNU8xgEnZojKJv6IxPbyun7AgdHLVWbjWK7fEtrDoGC+xf
 NfOMPEU5KxGp2SG0XPQ==
X-Proofpoint-GUID: O2J5phkmqlxlza_13m8obPheE-y0y4VI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140133

On 4/14/26 7:00 AM, Vishnu Reddy wrote:
> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
> or QHEE), which typically handles IOMMU configuration. This includes
> mapping memory regions and device memory resources for remote processors
> by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
> later removed during teardown. Additionally, SHM bridge setup is required
> to enable memory protection for both remoteproc metadata and its memory
> regions.
> 
> When the hypervisor is absent, the operating system must perform these
> configurations instead.
> 
> Support for handling IOMMU and SHM setup in the absence of a hypervisor
> is now in place. Extend the Iris driver to enable this functionality on
> platforms where IOMMU is managed by Linux (i.e., non-Gunyah, non-QHEE).
> 
> Additionally, the Iris driver must map the firmware and its required
> resources to the firmware SID, which is now specified via iommu-map in
> the device tree.
> 
> Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---

[...]

>  static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>  {
> +	struct device *dev = core->dev_fw ? core->dev_fw : core->dev;

Maybe:

struct device *fw_dev = core->dev_fw ?: core->dev;

and preserve *dev to be the main Iris device?

Konrad
