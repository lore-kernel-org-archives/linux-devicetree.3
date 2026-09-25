Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1531348E0FD
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 10:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331584; cv=none; b=Obtaqg8FkIhmcB4qKcjqDJoS1t5JwEBYMJ9iJDvizBzN/JI3llwAbDLf91xLPChg8eUdxMDcQwaS+odHCjrRMzvFE8qI4zSsGva3abiUioaxxZJMa5NufX+zeJgDKoj7OU/JW13H9zBSyjbH+7F6/bE3gI9asxRyLT0MePve4e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331584; c=relaxed/simple;
	bh=4wQz6q/WvEKet5IUg/SEtqhktT4UMJ3/CbjwvROmgAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IdEtr58nuCOuFWNBGnPftKJ7sn0wdmxs7H4y+Q7XteXWFuksg/FtdyBnPYUjrf8gbcTZlcCwHpDXAgxXOvE6cVrdBx7Hp0JqtdTS9mLr6kYyTXxzaJvBKvcuCXqz4QZfdNdd4aYV7fOWIvbpxyEdFJplRwbVZSX4tyi6wzahc+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7E0JYFA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FI9QhFEF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7E0JYFA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FI9QhFEF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5JWpV602052
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 10:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UKy4uRrDP1MEnH67izTbk5nL5p9jm1/EIV3ngV59HBg=; b=T7E0JYFA9ZEsW3NB
	r8i3NHnOoYNT+DaTyTzDHTa+z5SkzbhlHeX4vl2uVJ0b1IUwPZYBrLi2l939PMmH
	BubQuvmaUuRVQ3Y1kZOFoaHt2Wx/zTCggWfZ+6QzwEzrEiZ7pTtJoraZyWfMMJVE
	MfdaL1pV/RJJb8L36U71yPatOKO3jsAV3lp5uL7HBpVAHd5wNtwp0opG4ekWmdn4
	Hki4Az4YjO+aCFTeRXtqqCp7yGH3ZOjQG86HPcQOdxPEnNvLrhgl4nvjBzBvoU3p
	Al0NeN3wAALjPJIpD1AaSfDFhs4iZ+1qzjqt3PSZBPnMBHYIaaeNe3rP5z6kfLlh
	6WAvdQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvrwfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 10:19:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c29d85d0dso4064085a.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 03:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331581; x=1790936381; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKy4uRrDP1MEnH67izTbk5nL5p9jm1/EIV3ngV59HBg=;
        b=FI9QhFEFimLnkxJb8PRoDp4dDCS15nLXRKM73l9hIJwOwCbLNS+BrJqTAmodXE4bZA
         ODNDmnzODpcrbgKQM8yX5H2JrInag5h/I4tamBOWKNzG37Dz+J4lTdadUMJY+fLOCdxG
         +eUfvd74HNCE1PfFTru2BEE7rmUGdNT8aAxgDTE4T7FF0xupBVm0SQbp3oj/K0MbJ66v
         S8isVA+9c1i3glSCd1j5D0SF95L41UITvV7/d9nESSuLJp6/M5RNfk1d2qTSqeJI6Cmz
         rGwZ/J9nvJP4aPcFq7Z8mURATyDfJLdwIc6bwLvMXLyWjkqq22E7wod9eQb7bcsAGlSq
         VIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331581; x=1790936381;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UKy4uRrDP1MEnH67izTbk5nL5p9jm1/EIV3ngV59HBg=;
        b=YUicwZdxl/ROwxF79isDE+kmgopbJNDv1aybUjJ456WcZ83sHyWodlRVq7AJqQTgKR
         6k9+d5+4RkyTfznS+so6UGco3Y8BPR1ERZ8xz2PY7oDdD+jBf3RzJE4yI1EaovK9z7DM
         fRyuNPln4mAu04R3gxnDXcgWRMBCcCqqybEBxIRVKLREXjyssPsPj6p1tzdgwibEVHOD
         X99sD5mJ3NVvSr74NO31aZgMiyC4XBGxYfja0fWkWfy+H04lZbrGZzac7VqAKKNSoxfI
         fucEBi+/t5ovgC9xTzzHOC9uXWHLmSV8wxlxcytDY5qdpfuCn6GaSy5vO/IjxhIdWvYh
         3Hug==
X-Forwarded-Encrypted: i=1; AKwUvBwWUu5fsc5k4PrebCIoEQlYFfs4rPf1IL7qNbxaYX2Khj3lPD6SoStm2JhXvrgzqHG8WgF2whATGwMo@vger.kernel.org
X-Gm-Message-State: AFuF++kIMrOKvnW0KoJZUVAiUshfLAZiWPu5zbJga5tQAga7Oma3Oaid
	mhbgelsYJqnkurVVO99793RJFgAjPLLnE3Ebmk7elFToy72A5lPE+yMeVOmLKNsimiIiKJ/mRDz
	RpSoQbmn9kRXCwrY226r/X5WRsyYew6d0U4xDH/tMWj5Mrakscj8CJjdtJm5UGVJD
X-Gm-Gg: AYBFou2tQ2C4qqF1IJM1jMKSOndeSQFP3Mu1E3cBsd7wE+SjqsYCQDWlgYJJT+UO3Og
	W1Kst6bLO6TZaL7yfLtjRNg5MREoqBAjAQlkGikaDk1KpxJFht0ayiHF/Zk8YoJTjBAP347nf2V
	NS+bwDrDf0WNV7pESfyewdyITekQTGnTK6qrsUDzbTZxjwIARyDNiSBh4VD0xdwLTT8Jn5qDwns
	lOUsXyfn8BzHDm8H7Qg9gNowg29yFyUvMV+OFU+kJHZiYuPtZ7a1ur+D8meHusAPwTzRkLFGDDZ
	bcOLH96oKBPezwathRLG6ja7JlHBSU0VemnThSWp+JPSAczHAjZeBIfBvt1OZsYH96NJsiysQJL
	8J+i+angprod3Lotx3HYeog==
X-Received: by 2002:a05:620a:2b8e:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93c439dbd0dmr314997785a.0.1790331580850;
        Fri, 25 Sep 2026 03:19:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2b8e:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93c439dbd0dmr314994785a.0.1790331580324;
        Fri, 25 Sep 2026 03:19:40 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae74815easm93578766b.23.2026.09.25.03.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 03:19:39 -0700 (PDT)
Message-ID: <1736066d-b50e-4b3c-9db7-5752927978a5@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 12:19:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: mahua: Support GPU and GMU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
 <20260925-mahua-gpu-v1-5-0fa0bfd8d315@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260925-mahua-gpu-v1-5-0fa0bfd8d315@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fF_84zPOQiFU3IjVQlROJLE3pXyKo-bv
X-Proofpoint-ORIG-GUID: fF_84zPOQiFU3IjVQlROJLE3pXyKo-bv
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab64abd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfXw3NpZSx4zAgi
 u8xttI5jHyGbe9pVpmynPhk8HMrZ9i6nRTn+ObpIDF+dpqeV4TVCPAapC5qvdRT5CXv/FoVNt29
 q+sT2dr0dp2B6+KnD29YIw7phNJHCn8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfXyVvdB0DgBF3z
 Dv4Bbb76jYg7w5xVwwqswhfq3davxXiVjtwSpHZfe18hslQQf518C35FvTSWQiz7HjbJncP++aq
 E5uW/owkSMdC70O1jeewIWqEYTfUHCi57cTdJugJSbAuKSevPdGtwBzlp3a8DR3Tjuegw+HC7UF
 uXr6NtTBeuV9EHqjY6ocpNfRoPVywBflJNT4rEhEQoFBC5LUzigs2GINaAsR3SWZqwf0I9I+I0E
 J2f7FLWFmA5lX+YmqOcAAg1c0q3vxYy5npXeGo0svm22b4K1FBu3GiklS0W8eivLwohQ48EAjaP
 LTql6NNtM2KQtKmRxYx8xeDv8RbnNUtlkw6B7Brx6cMnhsjqLZLex1BosCsdRDBzSahm/Ev/yLO
 +y7EAQO/TwcyXMs/FPutkfrPCE/HK7DaUPoIW3itq6Y9ikyEoKHdbQ8Zgj6mWV+CHGxGCq/IDi6
 TLg3WY7/x1ImPf3Z09w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250041

On 9/24/26 11:14 PM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Mahua SoC has a new GPU called Adreno X2-85, a slightly smaller variant
> of the Adreno X2-90 found on glymur. Override the compatible strings to
> correctly support it's GPU and GMU.
> 
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
