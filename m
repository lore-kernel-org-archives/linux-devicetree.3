Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFCF386450
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776765825; cv=none; b=DTB5xgePxrALut6jwwHNTlgFzqY3qA1qglczJdt1mFdXIrqd5w9CKKWbQML6OlGx+fIwCa0lXo2Gu+bti3mHp5enNM0ErrrXmpQglNSt4owyROuLWnSI4wR8JM30n9bAw0Glb8Ww56GxlSBj6+rq+ZE0YhkHGkS2EXe4fdk4x8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776765825; c=relaxed/simple;
	bh=fUoxY+osAZD3kce95kAP6oBIib9fL/J8fl6XUc8AkO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q9sRe/y2o74dM46N/GPQdWagS8dDe2tz+eE+DZN1bkgFBGHG8syYY1UuSYUQ5pcRyk1eWbi4ewUwsUKsht7KzEgcYUDUpuAb2T9oPg/bFKpT/cO0qBeAdDI+kQwmkAhqggosb7eCCtI+f6a2IcPeQI9eDZlgBCR1pFLsl854tOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oQinYadd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gg4GoBqE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oQinYadd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gg4GoBqE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L6ebXJ3574522
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lsBGUUumBzahguNfhdaERVA35xazIx6Q5OSh6tsxb84=; b=oQinYadd4rkxwUmd
	XWTTOtGmXCjbCAW7OKbU3H6PSL29CVypC3IChafirLUkdzfQuj16GTbgh576GN4/
	w31KHH6WQ+g6nZ5bWUNVpdHGkyfhU/PA2KuRsnh7rc6PnJRkXkqacty04PD+3iXO
	LxRnltAtSWKjQk9JSuu4hXEAHniZMFST0tvtk0pMzqiUaAQwHfWMllHZxyTy8EqO
	esyWMgRA92nHb9YMqqzFVg8TysmucnzA6QVqu3GhsHwNn65q7bj+pCvdhVKh/fKd
	MCCewVw7prLFMBUrTwyEdnnJDb0+IGy3YTlNgz6q16j/79X2i+ubn1dwXkvekwLT
	A7J1DA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp465gs52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:03:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50faec938fcso3541991cf.3
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 03:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776765822; x=1777370622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lsBGUUumBzahguNfhdaERVA35xazIx6Q5OSh6tsxb84=;
        b=gg4GoBqE9nB1FnO1bY7gXq758ovoI+cOtb1kEfsv6J2NPutym4rxJi5ngxzSJD2diT
         EUogi0vu6NIox7fmjDRC48RlrhhX92ls1jIWgN3b5bCnHqpqsLsa0O25FTaEEdXArnyW
         Djtwk+2lteaVJwLPy5GyqJXiQYiPfTM86lI5ebQyfD/JroIIH+mtXoda9XvBuz8ppSV9
         DNZx1hhP+FeO1PZnP0lETGPPDhL3Tach2fvh9Mz8D8AGZvnxdHIFZ330UZiiKFnMDf3B
         rbbnsh+Ot0sMxZncCEVcUa9rQi0cI4kwPcaN/vhHf7B0mENU8fA+05mNSxLGlzmVohiX
         Lv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776765822; x=1777370622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lsBGUUumBzahguNfhdaERVA35xazIx6Q5OSh6tsxb84=;
        b=YbuQ68K2UmqjPHetdYQhYqX1BDc8Gv/LxTvqjdaGY374q2YnQzhVYLu5Y0FzTUEVz/
         OO2pIM7ETm69/aVtXHcoIfOxEeHEzQsALQm+DhFxQDSyZxNNwkChZZ0+FJFSZkRxkQGb
         4lZX42Krbc5E7k45A6YnrR5t4CYW2XI2JOJmwc31kn5NNYAU5QVTj7CV9a3bR1sCk9Am
         0ZCtHQuUGcZh5GO9+KAKMPt/BPhT7jzyjlh5wacbSSajl8rpuPEo+drkYUavmGBBWgbE
         ZKBdqiA+O3YjGLi4jSTN8d/wgIEtQ5vyXMO1U9tta9YkETxu+3el0AEA+FJorpFOrH6i
         UIDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/G6DO4mh7cmniFDY1GMsHmVzSmac35Tnb1DHdI4NDVRnEz6fURJqGpHfpKu/h1U9CTqXygPdCqkVJ6@vger.kernel.org
X-Gm-Message-State: AOJu0YwXmVNNN7Vwt43W35/852yMvFKgh7DEYa7w22S/TatkJWMxgpr2
	HwLI155Exgq5Mdef5QF6QIaB8/jVOu1mmEpMwmhzAnFxQzdIJxH7IZi/h/PpQZMLm6ok06hxQF3
	EhBmnjaKXIgIoPktM8xIxAqQ/iiqsjIF77Do+9kwe192yjYvBGd9sw/IEgYqF+Pd4
X-Gm-Gg: AeBDieuXiN4H9zHnGNo9bZ1AXMfDBoKMea+KRiNHupiMDxPAmV9x61nL+5itIvG4kCI
	cW2X2iM8tXGJ90u6gCB0jgXpbho7EcYr9iPmnxTbHGW2rdPGaY5iiKbQmsZ0Eyzco3f0CHXuBkp
	xEV9VIIrQcJXOqAiNSTK4b08f7hgRrp1YEQl9Ttb7nMXqfLT8w9KpqQbWF2xfUPU1A76Ng94vjs
	JmrEsUby0H1oghDpCc5H9z9n+1VOGSlHo4sUenW9/5zvwUsOB6DP8klR3SbazZpE8jAgRXuaBh2
	dmIzbeKjMP4d7vjj7FzJfLn+mT+H9n/NfoUh7lM/Sl06XWYxso/4S4NGox+9oR9RmqGR0Q7wP9Y
	fmsly1pvzcXwLpC3eFZyTnibPozhO1bdSDkoAVyYVg3EMkZsReELOOdu1I70xfzkOUHJ1M/E37P
	CzIZslCLdfLuS3Lw==
X-Received: by 2002:a05:622a:44c:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-50fa53b0cbcmr44662181cf.2.1776765822197;
        Tue, 21 Apr 2026 03:03:42 -0700 (PDT)
X-Received: by 2002:a05:622a:44c:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-50fa53b0cbcmr44661851cf.2.1776765821742;
        Tue, 21 Apr 2026 03:03:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c480e18esm2586174a12.10.2026.04.21.03.03.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 03:03:40 -0700 (PDT)
Message-ID: <46a322f5-db18-49cb-afb4-ec1a5bf23717@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 12:03:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] dt-bindings: extcon: qcom,pm8941-misc: Add PM8921
 compatible
To: contact@alex-min.fr, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh
 <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr>
 <20260421-mainline-send-v1-sending-v1-2-bcb0857724de@alex-min.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260421-mainline-send-v1-sending-v1-2-bcb0857724de@alex-min.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA5OCBTYWx0ZWRfX3RGTHCxyKUtJ
 4xZCTu2UxeS7P1oJ//UMTIZjCMoqFzcksEKtHmZ9I95iv0Qg0CH46mfhwzSgxt/sk/rTlGnYq2w
 IR2sSNJvAqkul20u8MudnjTZYk+lTFR7SpahodEFvnI1e6ThOwf8iqqMotCX9zXFCXOv/e4V+aM
 lfd/4WvVMlpSLLgK1Ns47w8ldk+syOjpiEvGH85QwOhZsT5hHK1aKC7jAvs27LJ7JcN2O9OSK96
 VHoTqRxxuhmmBZRPp9hw8Ihy2zZLrlsvBVeN0GB15aXyXukPHOHOFMV+VXWiUVXHSzZZeeC6TMG
 LUwf9oH9TuZFNWdHiBRCAzEwQby4mjGPWaJfGAjbN1JPMWls6quLTOM11BUfkjZU6cjev17aYXY
 82I7RoW0GIiC5DN2zhDW4zpunMyGtVXOK0NdbGL+qRmgSuKC+C+DrBE47X1qDp92WQ/y6RGLGYC
 rhVRRVYOzu8XiNYXC6g==
X-Proofpoint-ORIG-GUID: sknJVnZYOPqD7hXuX0zdHU4bDas2SSYw
X-Authority-Analysis: v=2.4 cv=YOSvDxGx c=1 sm=1 tr=0 ts=69e74b7f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=-ROfvrG1s7MAeRIb7yAA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: sknJVnZYOPqD7hXuX0zdHU4bDas2SSYw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210098

On 4/21/26 11:45 AM, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> PM8921 exposes USB ID state through the same interrupt-based logic as
> PM8941, so it can use the same Qualcomm PMIC misc extcon binding.
> 
> Unlike PM8941, PM8921 does not need a register resource for this use
> case, so allow qcom,pm8921-misc without requiring reg.

That suggests this block doesn't really exist on the PM8921.. I
can't find any information that would suggest otherwise.

Perhaps what you're looking for is "linux,extcon-usb-gpio" or
"usb-b-connector"?

Konrad
