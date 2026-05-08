Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D6335A3B9
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 11:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778238016; cv=none; b=M9FPtFE8dqAc+OFlC3OWqMbKw22ljRULuh859r+fXUJuxRRzLYIhCiWFaXij3VF/QYOUV2rRgdgi8nKsubUs/M43DgP2cuD6nh8ooYKDnx1YpxpKnKEUho1LucjERdlIDJZc1dplwsHHvzTZadhCsvZ6OAIeK28xTnfh1c/8crY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778238016; c=relaxed/simple;
	bh=eBrkTg1eJBHNw3T8qEE8YXdjoRuq+XDqCjW1yXwpfUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HisTKPFFyEM7JP5zEbhvK4IT/2Dd2YJwE/uGgUAUArhgs/FEwv96iBhLF8OLj7k7CKzNkrmyZ4+Viz00RFFugJVyU0yNO1gUl2QUJ3mVCM28j64Zzdb0FG2oQaftIoiv5tefF5nB6Arzzh+GTZnXDlplplhyX7ZaxPOiF69wN60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=osuB8oRm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NxCVZO60; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="osuB8oRm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NxCVZO60"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648AaCIO2531551
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 11:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/KkucHUMJyk4ti7p83IgXvkR7nXFIuhP6Q7pNBo1vl0=; b=osuB8oRmeh9CaF4k
	5AELHHHkBeL9eoWyoprN0rxVX0XjoHEoSnW0dHd+1XvuVFfRx9yyZPOQXtJvgWCW
	iZLR5uammpTK7QXbmgvvWYjqGsrETKExUwprsaoyjQs28zK5brEqd844/WUSZY9A
	66PPEJCOA39D1fv9DZ+Mi6bisusUlBWM5D4A/eiD9DQfkboxQkyYE+koG5Q5CjzE
	S3YEI57XBM7YUbEPa+sJseCjzUn7XroQfI36wlqCfL/Md5ecI3nZTp+vsD/svS1Y
	k6jOv4NR6hAn4Dit+mUdHmadEvbxoQJeuAW/hZs8V3pjtS3xoBNnzOLCqDlihpH/
	gGzaMQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10m9u25k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 11:00:14 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-631284608a7so156057137.2
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 04:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778238013; x=1778842813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/KkucHUMJyk4ti7p83IgXvkR7nXFIuhP6Q7pNBo1vl0=;
        b=NxCVZO60aKXRGvca9G3jPFqedda759RtJiJAJUGaXKtHCzNUtFl6cOWLxO0T5p/tMx
         KVNc9wwtwu9bqaJ2iLzzonhZJQKfaQzzzhdwkRnMaglOoL+jsRKqAVNTNm8gaR1lfMsN
         7lbIlLUPKp856LPLQA6/SPNc4o296XCjOD2y9yQwDr/X9zGufLTcOD+MknIz//qxJgHP
         bnY6s7UHj7pbinTfSmpCuzxbWWO+8GHfnpavxhdYhjOqF5Mixct1glo60WOgEi2/5Pio
         YvyZPNu9MBVO8k9H0MQ6XsMxwDvapSllyB9EEH7R5EmbH5U6PFMK93DuKXJIWjhSfOOP
         O4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778238013; x=1778842813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/KkucHUMJyk4ti7p83IgXvkR7nXFIuhP6Q7pNBo1vl0=;
        b=IeWV9+NxmHTfnR9MxkO1mUWg/FbZHcARQMlfWTlJP+rfU232fMyXeead9pxmY3LI/f
         nCHnPKzXQM3TBeQWfx5k3BkeyuDVxrN0UYWqwS6PO8w2D6UOXJTHS5RAiNuXebSJUl66
         MZ0l90DgttaYO/sNgkYTqXZnrekrtxOVRLMP+se9mACSDS5qiEkz+qnSEh9yDU/u/XPy
         tU2FWw63hz/R0APhJz7QTg5POF1X6W7HHHvSE7e+CApzQ4mpqmGHYyEFsRum1WexVa/E
         +uMkFDG5Kiml/4i1bguQpXFX+NWJa6K4LoE6OCJSqtpdA5fH1RSBy70YuXVNO7D8Dp5h
         TjZQ==
X-Forwarded-Encrypted: i=1; AFNElJ9e2jTo/zVGauAMwo9+Cj0SuP3A5BkQK7cE6LFlAjUl+zzhYNie9GocgZcjvEGW25iFmXqywFTelLox@vger.kernel.org
X-Gm-Message-State: AOJu0YypQyNJukaWQYMAh8P6Q0k/fvfCwGhsE3aKHReT8SY6SQjUHRb0
	CXOXoNRvpR0bqqWAueuub5OoxcFAVdNf5tTwE04tRIT3DfflbxoSOD5zaDg3Ozdu+YmdFagr8bm
	r+tbYm7PbdtCEwKqD95pnileoVMLHvIY8d3nxg4jp0dgBvjBCuwFgc9E3WstBoSit
X-Gm-Gg: Acq92OHXLOXroACF2I1i/xqOC4xhKnFVA2qxyzyqEKEcNKFrIXkc+ao/GLBD03RG+1X
	e1aV1DY37lZInhTvDTDFCHTOMC9+Hzd5sVY93YaSfFIjBqSD/18Zjpo+UlUipvhYZLayahhLCtf
	tfVyQHXGHS2K+HBxZBFa4fj4z51uMNjLVxDanNCycDFqSLI5jYrD4rh3KWjbj5Xv/d3k/uCldwE
	5dCVbjTC8VbwXOMykh7v8nl24af1utsggCSbI4YVok6ywm5JKxvKafM95ftyJUsPTl3mMizv73L
	ocGihS5wxwJ+SpmYjV4fYxnQ6c3d3RQScuy0AyYkxxBFWJ5ZRp7a5Pyn0b1a3Cl+HuiBkd5J+vb
	aJRCVS8IsFdLg64ngOeusrmbA/EEdrEre6U3Nh6wPTf6b9+EyKqUC0eqOw0Hy1pfczp8RUy1CdY
	Fa+88=
X-Received: by 2002:a05:6102:3112:b0:631:2ba8:8969 with SMTP id ada2fe7eead31-6312ba89a05mr969554137.7.1778238013021;
        Fri, 08 May 2026 04:00:13 -0700 (PDT)
X-Received: by 2002:a05:6102:3112:b0:631:2ba8:8969 with SMTP id ada2fe7eead31-6312ba89a05mr969548137.7.1778238012610;
        Fri, 08 May 2026 04:00:12 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcb6ae2cb12sm6749666b.22.2026.05.08.04.00.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 04:00:11 -0700 (PDT)
Message-ID: <fb1cd8b7-6f51-4696-8a13-6c0395654180@oss.qualcomm.com>
Date: Fri, 8 May 2026 13:00:09 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Enable cpufreq cooling devices
To: haritha.k@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        gaurav.kohli@oss.qualcomm.com
References: <20260507-glymur_cpu_freq-v1-1-d566cc1d32c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-glymur_cpu_freq-v1-1-d566cc1d32c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fg5u78Sy96nk11x8oTK14fBcn8BCXxJM
X-Authority-Analysis: v=2.4 cv=VP3tWdPX c=1 sm=1 tr=0 ts=69fdc23e cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=3DBKQSvP0Kec86vzLcoA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExMyBTYWx0ZWRfX4yOhM4lukFNw
 yeEpUWE+dr6uHOnCDUJsMXyKkbHr2zzGOcON2wSmXaCnmf/nHUBW5JfJR5JcczExE7ALIpVRNaO
 pwKYSBS3qErNGpykIgy+b8I3BXGp6Bi/BTIo7KG8+oHeQfyXHdO/qJzhzSZ7K+KXky2iIVB+VnN
 PNbv5SdYQ4Hz7NjCf0gYPpaya5PJN8IYrE4zlblmO0Ly8MR6ewEZVHZSFQBDtAaxsRmVVgY+WzN
 QAKRJWdz3wUjk1lTgq+fcdFiektVBzDkiTyK4Zv3jmeE9OQ4/GdG0gQ4bPCd7NCahiWavziItSS
 C63W6ijbJPNBm5//BDt1BjIR7I2NTGTO4Dt6/YU+RXwCN/MPe3xy9Nz7fPgGOf4rV3nOWB6zqwJ
 hVS25kgND6lmEcWQ/TM5sL+TfkUVcN1Ihy9WnFMeTqQWRfWnwb1Bmren3gyTjBdfrpGBq0fVGL9
 m0oC82uH90/UwD+5KYA==
X-Proofpoint-ORIG-GUID: fg5u78Sy96nk11x8oTK14fBcn8BCXxJM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080113

On 5/7/26 8:29 AM, Haritha S K via B4 Relay wrote:
> From: Haritha S K <haritha.k@oss.qualcomm.com>
> 
> Add cooling-cells property to the CPU nodes to support cpufreq
> cooling devices.
> 
> Signed-off-by: Haritha S K <haritha.k@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
