Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAF62FF153
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774846578; cv=none; b=ueAaGBYWeQxR1oIPWzanNNFU9DDsHyi+3p7TcM6H4KqkTHu5ZPCPfagenY1JUv3zIC7XBodGPORuFEypzihR5yXrpjnAGytNa0z2ew+hnZnZIAyy1oeRvs5Ab2b6rr+1zuHyD8tN/IR6PIVxMKz/f+3rGaHo+D30dhLe5/0EQek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774846578; c=relaxed/simple;
	bh=xt4nL01wX2KqbENJVRpe6EAYvo9duFVqMqTp61xxKmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jiDtUJXr3no9WYATJydpLD/SMsTF6o4XIBDjf9wbJrxlVvYJIRLNRN94Q2JgpjgYFNNZ7YVXbRr+qliiJWXM7YPEPTCMIN5WeuY4pmI0dFK8IK4u+EPRWXAZZdQvlkquur2Vtg58+Sg6/dU4ewDCSaXtm6WvMh2xfLdXJKixc8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inO+f772; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NzK767XX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inO+f772";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NzK767XX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4QYXg4008353
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H9t3pLpkMMGLYxzJ3ezf64g/HI5nzm3mmWJG7tU2bnc=; b=inO+f7722dcimJsd
	wbC+BXnBzjfufYRq+3NGwh2+tckSBOQM7q3UlUMKR315VmequwC+Y9T34pu+HFyj
	dH4XxYO0046yCRmgQyPv9Cbdk1WsFz1wR64TwVI3oFZeho2+F0uY+3rrSvmV8/hP
	c74PBp/5QU/lf1+Q4K5qW++p2hqusq7WMi++2k+PlCWhw/4jcQUe9OWhz66cxgEr
	F6F2JDmq/Kx7s/ZrpzV9ScRyeuzffKeWoYB9RzJOTKi18chDiaQPPiuqAn5V6TqL
	6JbX574PfLBk061KDQzRrMzI4zArTuSb7lbhzMYyh/deeoZSKB3YkukMeGG/G9oD
	4Z+0wQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d64bm4sc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:56:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3594620fe97so14345488a91.1
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 21:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774846575; x=1775451375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H9t3pLpkMMGLYxzJ3ezf64g/HI5nzm3mmWJG7tU2bnc=;
        b=NzK767XXpaj34lUgfFP1ZfXQQE76XRuAjNUF/AoxtkayHHwfSzIabNdinqXEidHVVn
         kA+TW7lcCUVPplhSrS9mPJvNrOwUGExofjIGn3ILsxMIJTMVffHuHOMTch3Is4xfj2pL
         SX0UnhodjQe9bbyUO1Tx1gqVeSQw4Cy11rP6aLc1wIGzWjxibD313LG9oz4Hp5B2djW5
         iPccqKlFuTuU3/8KYeCTul88aI5bVP5raX+vstKg+VeBXVL6cqYOEHYEExdE3aJMGa9x
         1rcPB/bn5aAsq0Ifu18yt647+OxzFgowaDwm0UiMOwJFovMF2ZJg+qGKLUYckquINFSR
         ujPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774846575; x=1775451375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H9t3pLpkMMGLYxzJ3ezf64g/HI5nzm3mmWJG7tU2bnc=;
        b=QEjS+HGvIt0fNilFV7KeJqUW64Cpj5rM79EtzqCwXw8doz49RL7mXt77yvpK1mno1U
         xTUsYyg0QuIz00AagO5kZ1jKK1d0A21r6oEvCVy8QAFK2162a5n1bGIwSQKAHwKTm2+v
         F994yriqsCfCSNcaOYPaXkwKN/0KRjv2z4nqZPJPKyFRgMWsPdb6WKcFBdNVrL5+TG2a
         eg+SfuKJyBG2ao6DhuD2gvB00RvTehDu/I09913U9ODKLpd8dXdHrCIHOCLCxY1ohlUu
         sUGzj9CQbUvQrVlU2X4KooFmmzwrHkkf75iPZx9zxr4CWOPrpYetZ6ypetuDOxWBkPCi
         2KKw==
X-Forwarded-Encrypted: i=1; AJvYcCUALU1l83j0pT1Wb+GcO38B4ffcc27/9jRocSS92O2IzqcyxbIm+VgtkJda1Ym+PAeaJR/mHcRab17f@vger.kernel.org
X-Gm-Message-State: AOJu0YyP1IrTUG+9wuR1vhR+1/z0kIqFEZ5MBFc551g2aGmOSVAg40TF
	BwSnZNBk0raK8d3KFmUMwxLcxdmknU1mZzXrxnwQs9Dkocil5biiCKOVR/c+TijNCBfO+Snq2V9
	vX2JXRSgA1vh73lq5nOVoge/x51XjEXdMRxcrlle+MbVwRzsoFhHmF5+9iGjs5hMU
X-Gm-Gg: ATEYQzyqUvuQBRTlQ+ktkDq3n/MUHTP7pquLjYYzH2fMCSLkr2DNl46yHtyVNfzhcGb
	crZFE/hamapTLbQ8162+8Jau545ZPp9C0aNz1ASSjYsfYFAYPO++yan7TVG9UxZOvLf1qRF0D8w
	VlhDvEQs3NYxogVi4nnxBqzJLYNfDCLRVe+GdULxdM8IX43Lo3x28mT3tnnWF7cYakJW8UtJ+CT
	UeBrh9nA1uSAB0Atp00lvijJJA72ykmP4o9vlXA5xcO2z49C5uu+aqcDRretIRaLT8URZQI7wY/
	meyayqHZ4G3QP4lzPgEJS+kuem4cYwwV7BUszzmzkPw7ImjE047EJmlAlyiN1t9a/Xhb9Ih43VL
	42IkeI/VRwyaQ2sVMZdLmLodS4ejlHESAqnC7FsUd1PRGSi2AENS2dERctTIG8z0v5g==
X-Received: by 2002:a17:90b:558d:b0:35a:329:73d8 with SMTP id 98e67ed59e1d1-35c2ffb03bcmr10608123a91.4.1774846575413;
        Sun, 29 Mar 2026 21:56:15 -0700 (PDT)
X-Received: by 2002:a17:90b:558d:b0:35a:329:73d8 with SMTP id 98e67ed59e1d1-35c2ffb03bcmr10608102a91.4.1774846574965;
        Sun, 29 Mar 2026 21:56:14 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9507dc3bsm5755629a91.9.2026.03.29.21.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 21:56:14 -0700 (PDT)
Message-ID: <095ba19f-90c9-4410-9b65-607d29413bb1@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:26:09 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: qcom: add IPQ5210 pinctrl
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260325-ipq5210_tlmm-v3-0-3a4b9bb6b1fc@oss.qualcomm.com>
 <20260325-ipq5210_tlmm-v3-1-3a4b9bb6b1fc@oss.qualcomm.com>
 <20260326-marvellous-premium-grouse-d1d1ad@quoll>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260326-marvellous-premium-grouse-d1d1ad@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8wkg5LJKjFsdGqceXazOQjPwnprBipLO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAzNSBTYWx0ZWRfX1dnRw+fco6kY
 xvpAUXGXSI0WWRvB3oJ2HBn/oOa/poUfNRRsATcnOd15ClgxRR+L9egM267iBmOuHeBeVp95rUe
 agn09V9ZJ9mPUbrcKU2hu5aXR68RjQsI8rQgZFaLVR13PAGLmKzxCXVvLyMkJMGRQJdssXBTt2x
 aERsCFBz4MD1flCJZpJA4ETLfkt+FMOWAxfOVG+szA55uDFwXeTWCqvVqp/1wpIGBih0c2+4wUx
 OtE4b0NLLkb3+IMkVDn1UTtbgoPfDgrT0jesEjQ+eZoH+swL6cUXAZL+6VSd+0hc5zzn5xt1fgF
 9i6HcHv93+Xv9h7xvlwdjsbBD/jlsmGP7CkICURC7BCnEhIwAwiy4PA+oihc5fB7ItJ5kv9bVxS
 icO4KzQwfvyJ0B2jBguHHNfAoAsPtA3pqD8TH5eMIIVGXDXTdyevhOOml7DrXIVfRThWzmuWwJo
 atdjVbLrgS5DZqjteKQ==
X-Authority-Analysis: v=2.4 cv=eJAeTXp1 c=1 sm=1 tr=0 ts=69ca0270 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=sbCXkxCAo7F0d2wfUiUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 8wkg5LJKjFsdGqceXazOQjPwnprBipLO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300035


On 3/26/2026 1:55 PM, Krzysztof Kozlowski wrote:
> On Wed, Mar 25, 2026 at 01:05:15PM +0530, Kathiravan Thirumoorthy wrote:
>> Add device tree bindings for IPQ5210 TLMM block.
>>
>> Signed-off-by: Kathiravan Thirumoorthy<kathiravan.thirumoorthy@oss.qualcomm.com>
> I don't see any differences here and cover letter does not explain that.

Pin control function names are made generic for some of the functions, 
so I thought I should drop it and mentioned it in the cover letter as below.

Changes in v3:
- Grouped the QUP SE pins instead of mentioning by function wise
- Splitted the PWM functions which I messed up in V2
- Audio primary and secondary mclk function names are expanded to avoid the
   confusion
- Dropped the R-b tags due to the above changes

Based on your comment, I understand that since there is no schematic 
changes to the binding, there is no need to drop the tag. So I have 
picked up the tags in V4.

Thanks,

Kathiravan T.

