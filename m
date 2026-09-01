Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC723DA5AF
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 13:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268361; cv=none; b=aqb3uhY2yMvu/rEB/TF9v7StpdYYBMJgx6KaRO28K5f7ZD3Gop6ZurpL0LtOq4BpQxqm68NRbZJx8KFZz9waa8a+sAbVwsJse1kshV3Y1cSuhpA0GjvHFrQ3BTO1gSLBDcFIkw3Y8cB7Mo8OhbHWXYAJ3w9TMktpZBtrrcVo+QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268361; c=relaxed/simple;
	bh=zon7jp5adl5Y2eAG6oMwJian/v+Jmhd9AHSeiXrsZ6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pn6ugAonQqtsr7+Ia2z44Ir4zd4UkmKm6CQkXSSx+q8AZsdG/U9P3k9fGPcvGHRqwAGlsa1dFNJc0D1I+RbFwcGD65xLFOMXU/zOFJ6uZBNnRcflIbf29E79evg5IGP2KS+RyPBuXcCDJibmGlP8W0Q9BHnpPkVSWoHCcFseTRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DcohuhmE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L+aGBt6v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DcohuhmE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L+aGBt6v"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJCgI3406520
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 13:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b4svtbf1ssYRglJJD6Szy4t0jDZQ1u+zIb5rrNp1VYo=; b=DcohuhmEjpLNEsP5
	+fXbY99VV61e7fZNptdUJbAuWi/YmvyDnnevc7K5Xkr7CEj5X4aJqdB88d1+mhW3
	HdYuZLQ+sG6fViTl6TYW0Qfrfc+FKq7PgQUA+0v++4qsHAHE+V4s1cKtMsCGi0Nb
	KjpAcNsSwoyJkpVO3bfvwSpPn5RcXNvzUxlwViTtydQwn5VFks6sv7jzeMm+P6r1
	hDpzD36D8r55NIWpK+RLS84IFhwrqSFhpPmyA4BgGwBk8Px4awb5XSi4XEFCVwa0
	o2uPwGAO215NpiTe/jaEKCqcjT8LzlCp/JM6HHRaV1/SPH3GY5IE50ol/ZH6Tfik
	ScrVFA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdsnu1pbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 13:12:39 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-789eb1bdd79so27511137.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 06:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788268358; x=1788873158; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b4svtbf1ssYRglJJD6Szy4t0jDZQ1u+zIb5rrNp1VYo=;
        b=L+aGBt6vJ12MxVnkGEFWFYMpAgeXiPowDxYiNzoThBJ3SUGX61PxoF5KDOIW0n0K3Y
         Xa+SKnnSoXPly/dZBPyrp6qMWwqA7YCVnhlYhUwee/fX9D4LT85EUoBN18aOX1t1DFJ3
         oYNcrIHd2moEYkBJP7KO3ZImwDXiAdThMhf1sW3FRRV5fAR4FCfO8YV2DY+uxTDgtXMf
         GsLmtAFwSzrfkdQqLtEQsw0FJLYuh7TDO6u8r4XOL6oG8t0cIyXvZiNskUrx9kMUNH9t
         IfSgfd8TWsKbadL5/QyZVgrwO/DUDgvIEL/wLaIiMQpZOgh4M7oqVUidnniHivRwyZoI
         dAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268358; x=1788873158;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b4svtbf1ssYRglJJD6Szy4t0jDZQ1u+zIb5rrNp1VYo=;
        b=DjKoLKq+rsb1WxAasXybiZOXSa9I1jwxQh4zGBwQOH4Mj+qwqfHMP5IouZGiDkrYQ2
         K8+ayKsAVJ9Q3Gb0LbCdENOTH+nVCduVGlVTEw0IfNmJcBCm4NMb7SvZAUc/U3sZDF+M
         fcEqrY88TEdbdGwMEx4965wfV+wYekicFLX5i61gzfyYmypljnuIv/g+rN4w07drpOny
         ShDDvI9b88jzhJc1UKSwxCmsD0Wp61MxhtKEbGIsxyF2YJGw6UQXh+2Rm2tprADUrN5E
         exRDiuAU2XVQLcQM+EJDYpKqQ35OTUVnZymouhLEUrQWkY9aP0sMyfIcohyf2rHPJGhu
         zImA==
X-Forwarded-Encrypted: i=1; AHgh+Rq0m8gC7rv/zOsPNESNxnS/7vjJmXij/7/TdXDuWkucNFn+1z3JtCq7xpivR6BJT0l+xHlA0lARAWh7@vger.kernel.org
X-Gm-Message-State: AFuF++lfYms1GeqpFlrkyGcq3jprbRuqgnofzdfFk8fWSHxn5IC3yL5S
	+bpD/Flv0MxCg4d82Rxr1s38/asNnw6l0UxqlionYxda7fCvG3n0K2z1PS+9nIqlPAVHgFQIJal
	rmkC7d1J9yjSSI5DbjFhRPOn1XISRMV68C/SkVm+uvdFykkDMmK0Az5H1daYu7wc+
X-Gm-Gg: AR+sD13tiZOoJXfTiLszR9u9KcFUwH0p6BfLqxRbasSG1onTWq0F21jsYWTqItWXYvY
	wN1MSV5m3LsXRjcDWIRCS7EOUIm9uqSjrSFRRwXuthX+dmWcpsiyi0qzu3/F0zW+N2M4L52feFZ
	UlYOdGD1k1LdEmVy4UyPIy1hktXU4yThXpy12wyrspqabvJdGE2usG9XLj1RnOj1P7rVydcZLu/
	MFNMVDhxo9tHyRcsut+XJrM9FntOx1K1NW+hF9RmY+EfRwXHwvBjvVdYgphBZAy4PpbvEcAhEgJ
	3esJv5B4BSyxuymqkOvBI7m2oVf9pY/m22g22dnbvkOusF1Y0LXde+W6ALGUqZWq+ilWJxVZCz+
	W8orawIFkvThf+7kUE+xQcw==
X-Received: by 2002:a05:6102:5044:b0:780:6fc7:2181 with SMTP id ada2fe7eead31-7859956a0e9mr4248239137.2.1788268356866;
        Tue, 01 Sep 2026 06:12:36 -0700 (PDT)
X-Received: by 2002:a05:6102:5044:b0:780:6fc7:2181 with SMTP id ada2fe7eead31-7859956a0e9mr4248202137.2.1788268354886;
        Tue, 01 Sep 2026 06:12:34 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b605b1752csm32498e87.81.2026.09.01.06.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:12:33 -0700 (PDT)
Message-ID: <8651e227-5038-4684-ba87-df74b89bb903@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:12:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/12] phy: qualcomm: qcom-uniphy-pcie-28lp: Convert to
 PCIe/USB3 combo PHY driver
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-3-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-3-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX3by0qGa7eI5e
 +LueYHs/9QP0TJ2wCTrPTvYG+O6Gdq3n0OD4niX4rzF1zK4wGgSb31bE2B/ZJNFD0teP9JwfO2I
 k9aHAvPCbZkQiev1CnjgTvhCovNdwo9xm4oPx4hXZYjVKTbRNDK+qERyzavuUlPoj3X2OGDb/ke
 JMtSyFdI8KUpeg8yTdg1wIK2CmljrOC29ogL8XymhrZfecNgk4YZsU/ps6J9K3NvZ7lI9oBdXFz
 q8to5th081IcJ0BTr7NjFyuXJbGceL9rvXc+Dz5x2NHYYYugmaVkFbnNHSLPn4upZ5Kamvkf5SC
 ExhmRhBldpEk+vFNtr1CQqNoLcZtU0fgTF+LIvxNcG3J4cwKaeu3l7WUrtBeV1FyNQ/gbjRz3MW
 xouvuXmdm7zv8OHoWI5zqc78VYT6ZO0McROvBb3irDlamjzw4wEnQqf0XlLQcD7ys1aIRQ+cPfR
 aTr3+w6bnhqFSe/1gMw==
X-Authority-Analysis: v=2.4 cv=L6ItheT8 c=1 sm=1 tr=0 ts=6a96cf47 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=1f8iOkyuOCog2pG1YhQA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX5cCvK3Bv4qys
 61HgQktGRLL5wyKd1KbJFfpu+glMyOesgib9NWQV3UG/asWc4ByIiaJYNXtpYW5JgiR03a08g5W
 BxNONBlEVtd6KV7OD6uB6Cb6ysEGyMs=
X-Proofpoint-ORIG-GUID: dwAb2aQq9NRhyaRN5Ih0hdK5X9PGsQBO
X-Proofpoint-GUID: dwAb2aQq9NRhyaRN5Ih0hdK5X9PGsQBO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010117

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> This PHY found in IPQ5332 and IPQ5018 SoCs is actually a multi-purpose
> PCIe/USB3 combo PHY. The driver was initially created for PCIe PHY
> support only. As such, rename the driver and generalize function and
> struct names to reflect that it is a PCIe and USB3 combo PHY driver so
> that USB3 support can be added in subsequent patches.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
