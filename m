Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C4F257844
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776244378; cv=none; b=XFuN5SX/u8u7C7UVkTrkZlbFYWzQ19jdN6hc/kLguzRo3idjsYZ5LlU6IgE8JyookR4RHDCjkJR066POimU2D3VyWQX7894iquzcSkM59yFj2wAhxnjF/S0dTRUcWYXvvbVDfSQo1+s1FurPLW/6uzMitTEg5teWkdBAVyip33k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776244378; c=relaxed/simple;
	bh=sGTdXpxNCKuRfE07ndNB12uvcKLdyMxK5M9wbhEkJcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tLHm0op5mRDDWOGmrK9Qx7WBIUkr6Az5IhEtO4EymlUd4QVVaqY/WCqAa89kZmulYfPByD87o+HMDHdlVXAsW7vr86zEB6JG1GH3OC7l50Cv7lqUisXB6lzOt9dzqP9+VAk+VmMoREUiVAm6Y026ToKUr4QnWZoG9Ct+wLCa0O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uu+4hoAL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H82mlKNl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uu+4hoAL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H82mlKNl"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F2c16O731099
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hmB34MFBSuyjUwzKZQavgV0G4aSRkdm5OzKkkYdbP3g=; b=Uu+4hoALSjwbB2D+
	U9/yBY7CX1wvCPJFcv+3mTcGE0aFs9DlzvRjWc/wR1oxMYbXNhWaijZ2DhCDcUKB
	4ph0rvI7T/eL5dxuVABNCNGLNnB2qvKIgFXbtza2kmzE62F8oXFXNeNjMLivMsR8
	HXFgnpOSJ4rDSj3Kb41Yfp2gYAZukguFrwMGnLMmU3dBBBBK8GMui3Z+o20jOj7P
	31T4sC2FIJ5OfnEb2bFmm87d+dl8YpiNy2aZAw/ujrQn/nCuDi9f8zWw1F4PyQso
	6Y04NHbiMyvtsGzPOBzgceI7mKsj+j5Xt4/3xjPBpup/TjN1p6Gw4f8LS6mVMWa5
	9zuoag==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhruub1sk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:12:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8e141739794so71301685a.2
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 02:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776244376; x=1776849176; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hmB34MFBSuyjUwzKZQavgV0G4aSRkdm5OzKkkYdbP3g=;
        b=H82mlKNlMaBNKgwQNudicu3Iv54HYqBoM0W/5cnKbb4Ja4TyCmhLo5gH3SSWcMZW0D
         bGISazK6jomVz+HjDf23OjJtOKXebrEE03HLqtqNrsFVA//fOthUokThjDIi1JwlTCp5
         +10N69T1PFVt2fPhrPaLvbDTDw/hXxTdzQrYvxzd9eQ6NiVu/L1to8KFQHWS4D7R3c+L
         IonvgOaYPlAr+WrD9hZdMBBnOmosDB5YbBpUaisPiaZ6Y3vo1gzQIl4ooxpVIP2XSN60
         eFjW4mL/foG5zqgn6r+wdGSazQfn3dF6pDbb/jbFCFdgVOozfflLJ8nHDNFpXJXU0KxV
         bywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776244376; x=1776849176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmB34MFBSuyjUwzKZQavgV0G4aSRkdm5OzKkkYdbP3g=;
        b=SffR5CrEZomQzr8X1VrYxiq74/rS+yq6h47jMQJ+xq7/ouWDdy9LZJHXJsCHZ2L4ux
         x+RuaHr6cP1wIGJJ3NdsUNgufmDj1PZMzxNz3tDxoqRQbdCu+ov0GTpyUnay/VAkcqvm
         u91nMSKQXRIXMj57cDOoiOJuZnkwPfibiDehpLb4/gkgdnFRVmwni42t0jPc+jXBbP+V
         6VbL8MCuGvbxEjLQgjBvLMooDuoETHD+rNq3Z0Ssc7Vtgy+7fLJC2i3rWtxCm6rppJ2E
         dOLtwf8Am0F3Wfou54ilRkzfiGchOltm+N+BLwSc1f8iuYLrFSZku3xWhJyoozbTAFeq
         oLUw==
X-Forwarded-Encrypted: i=1; AFNElJ+qxhbF1ODke2eyu4emNJx/I6N9n8iEu5DULjOx8ULwcsiH+yUo8Eh1/nB9bjv04khlpOdeganQ3CeF@vger.kernel.org
X-Gm-Message-State: AOJu0YwQhrEfyuMdGbszCXRu4a+CQSbZo/XsL/ow5G5HqDGJkP3KkipM
	9/CZqQ8ijOo8KRe+j7uDQNbMNxKy5HbLljzHyZjKT0Mhmds4WE95+yY1sgtLqQ7dJMOac4gX410
	bfJUbze9xec8FiYXBezyzEoPyOqD9soURy8gURE78NgBNsrSUVxL3vC7XnXIZV8xt
X-Gm-Gg: AeBDietqGJK+/WskSm+36luCZ3U8niyyVViOosjzku0iYrJKNSi8t+TVCr6CNYwaO28
	8kSgbBpCpPfJg2XDnTNqED6NdMSxc4iUWTD4r/sXOj8hnFhhw2gbi+lUhfjyR+noghoFm1Yf22e
	wFZrH7dHlL+CSBrLfvvg41Pil5c8lodLk0n9o1ELSoDfSCyqI3iyen2izxcE6y0Aya9DAIrhw2v
	NgMdmhnZhTzN2NUCtqsPlw/tBp/HmRQtQH4zwlkGQ+LPijMFLZ4pcFIulUjvGcU2fo1wwWn/rJY
	fLukT8NvRDmQh7mZ7ba+QWXBD5j3jCdyrWpBnpEx4/20viyS//MpwqXVuWkGVQ71DiaKDTXkoe5
	gaCrizfRn/52vwPMdRTTmrFxJ2z5lcSWmeM66gRQqkRcSUlShum1n1Gfg5JmxfvIM+WbUYu0bAZ
	uiGyveFNo20Fy8Zw==
X-Received: by 2002:a05:620a:4002:b0:8cf:d2be:5796 with SMTP id af79cd13be357-8e4cbfa5536mr170164885a.6.1776244376104;
        Wed, 15 Apr 2026 02:12:56 -0700 (PDT)
X-Received: by 2002:a05:620a:4002:b0:8cf:d2be:5796 with SMTP id af79cd13be357-8e4cbfa5536mr170162085a.6.1776244375530;
        Wed, 15 Apr 2026 02:12:55 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67237d842f6sm225162a12.9.2026.04.15.02.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:12:54 -0700 (PDT)
Message-ID: <17b2ff60-d2e7-4f88-b2ae-f4dcad44fc33@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:12:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 4/4] arm64: dts: qcom: Enable GPU & GMU on Glymur CRD
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
 <20260405-glymur-gpu-dt-v1-4-2135eb11c562@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260405-glymur-gpu-dt-v1-4-2135eb11c562@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WquHJ0UZ9TK8YnqnxnssqoR1l6_17UDB
X-Authority-Analysis: v=2.4 cv=dpfrzVg4 c=1 sm=1 tr=0 ts=69df5699 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Vhnk_s3sKeSiNHHGov4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4MyBTYWx0ZWRfXw6pVRXnpZpPy
 IHmcudbsQtapRL8tNiiI6Iu2R/LMr1nkKTAbQjWLYpJtWj63ydF0r74RoiLsphw8msB3YhRrcaf
 PrBFYcH95OfMTVHBEaUYea8J4xYOJR9PeModurrvc95ERg5XTEkEm9HHWnsDJj+kqy/AJFg/CiN
 N7XBokWCHVnKCJUWVGCqzMHl7DuI/HVJuh6BZKRph0YffM3VlyNIs9RDT2tMmE5XO61zLi+3lwX
 w6dVz0bKcPwTHqapPZlwBS7PTaniRN7hmsqlryY9HiIPzQcDSwyQv0xUN2RTtSW5pJd88rjeLRC
 7Rl30qaAQ+pQbylVTSzAOPjgZ/Qgw9UEiCQ+lOFDi5Y7STRn905EkkkT69xUGNeJJ+81aOptnQe
 7Q7FZfjqtkJO+HQo3gONOO/gWD2AXgB64MaFL4CDdFvNc9/nmJfLV+alJOnQctDUgfyrdH6//Ik
 YRyfTMZWnbh6SWD9v3Q==
X-Proofpoint-GUID: WquHJ0UZ9TK8YnqnxnssqoR1l6_17UDB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150083

On 4/4/26 11:03 PM, Akhil P Oommen wrote:
> Enable the necessary DT nodes to add support for GPU on the Glymur CRD.
> The Glymur CRD boots Linux at EL2, which means it doesn't require the
> secure GPU firmware (zap fw).
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

This isn't a blocker per se, but since there is no more zap, do you
think we can just enable the GPU and GMU by default (i.e. no status=
"disabled" in SoC DTSI)?

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
