Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84DA480962
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 15:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782918631; cv=none; b=nXQxel4HGQfdwy6VewrcsPWS/1VRK38N6oFK+W8G6wofJlXXHeIHDD30YV3JbAnDSfUoq3838joWKYbklvcwxcOnuAHLnpJ1rvtaIknN2V8yqEi2EAd3eVkFvsbbxdClg7Dz6hreIPBSpOtr1VGHqX8H9PwdNay0Qpo7tZ+auqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782918631; c=relaxed/simple;
	bh=Y8CJCopl2osjelajHaXS1SoqtaMdjy4EbFtTQBsiAyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oKExvadk7Pf7/8kMMRXO9yAfiI9MDHOP/BgD2dw7iINuVZFgXdTEXA6h1wkumT9on6k4Ab44LgTMgP8qkS634zSddU+uD1W9n5un7pkgLk8As4HhewJSHhFOVZZxJdOPf1fWC5twLJksZneMsI5spe5hh2nlzwE23Px5ew/1yHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jHaPMyux; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fstFlsgH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jHaPMyux";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fstFlsgH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AGewC794311
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 15:10:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g+Wn7MrdjOVOT8MzAqjXDORJcNbRYbYSkFaFfGJPCcU=; b=jHaPMyuxVwCPG6vs
	XD4YYHt/3hRWChzPMd6K2hoQ0cSGoqwBNnYFLWTwPD5N03Ib4XaGnkgApEUUVXeB
	WIZhB4+xwCX9FvPKxm+C8+0XUU3q9i58CggjI88BZjCTsz6+Q2z6AiY7t2ajlfij
	4BoowlMzoWM5XDlwAuo9FM6XRw4qgpSH8dffwA0h8uIReCuFu42v5nU1BjMnutDg
	QRgqHwj7DBffU0A95WRK/5yiyG5dEIrt+ZFSxIlWKIcPbqr/W4QCAWHSrjzKEpur
	fn4Wwm0JkMRKEnJSXU+Ifhl7xOoIQIOb3uW9CxRWl4EqLxWCRridauSylZZ6SbOT
	ozoiKQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f510ah7q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 15:10:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5e21552dso8985885a.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 08:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782918624; x=1783523424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+Wn7MrdjOVOT8MzAqjXDORJcNbRYbYSkFaFfGJPCcU=;
        b=fstFlsgHvSCNbM2fV5ibKzZ31QFR29Hw3hzZXgSYvOWzqqJVVskFMe7ZIjivRaEPEa
         oEndOf49iL0jIR/R7GXOYb9DLCPxckenOMQeDjT2YSYR89eStZV0DvPT6enCXzVGwrM3
         8+T9+9I59GRSYiwh/8lHns5xCvIrn3Ak15RITd9FqwKR1Y2bNVov3kKlTMYGNPOgfP7q
         wtTeNhPR1rd5MFT9tl8YNtY6Di5QqtS4zis0BE1OV2BvMNaqgoXgAW1by8wCHbg5pswE
         02JBHbZEAY/ZsTG7GDYMnmUyCALP+5w6FDh2yXkmvN7csY23jzKiO688dCekcZNv357l
         LtiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782918624; x=1783523424;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+Wn7MrdjOVOT8MzAqjXDORJcNbRYbYSkFaFfGJPCcU=;
        b=TSxxQhuna4YNTp6eiCa7tRYMpvNTrfCZbcBU2vRE2PSAe2bL8K6Ut98hVgfngKipTp
         1MU4NdV1w5EnVv8WTx86gUAlwuls9dTZVHFaEo1bbaaoHaOdWQqeAOEtFpVwawu/NT1l
         5pAUwWI8WUjaM/4j3nv9xg580A9Y2UkUhf9uFJ7J0uxeTPkUe2+hWaWV9ruQBn02u7ez
         HvnOcsAE01HHJaXGjU3Jj7rn9JkwMXDZb4mPYF2tluicUIW6tP1fliqlWYUJQ4nxv69y
         S8fhltAj0ndyUyHOAXD5OjgURFj8Pc0OZFCzjkJu09hQvA614LiNibGdornqa90cJul+
         cvMA==
X-Forwarded-Encrypted: i=1; AHgh+Rr64dKujWk4SixNkR9bl+zO6FHerOPPF8qn7v/asjgvHm7+MMabGM+VXFCl+EA0vPkfovJ9ykKc5UOG@vger.kernel.org
X-Gm-Message-State: AOJu0YyztvqyX/Us62HrF4yGYNwZVvu1/0em3sFpPnWo0NfBhIVN009i
	Fg7U0O6vnR1aGlnWfNbMXlts7oAD4a85nFu7b5dLD3NbjsXXnw15iJ0OeFC5qIBAgqvIkbLilsT
	NWiFuPbvC9J9EO9FQCsJ+Liat1ZIhU4P8j/EUyfHWmtHj2SYvX1vS60iP+dnDddRo
X-Gm-Gg: AfdE7clYoQASVk0sqgilRxRYy2WRc7JIkKI4C7iASNZRaytvPvLzMddLBiYXkx4xIZj
	xY3E0to1/ZA2/+L3+RkCh1S+EqPmGnW+GxX+z6Cbv/Iyh2gMekF9H59RFMiwo9XtD6aX1tav2ba
	DJHluay84SGcPlr+yzyIVujovZKu3z3D8EFpXre4DCSUY4g7ZVPNTjJ+TfvRzngQ2oIroFAntRh
	IRYnr38ZKklU/mTir7tL6w/BpndC8gAOOFKEIesbYDR4JV6S92l3fDkX1VSWxzRHnMcYFJRNNek
	cbeorysDk6N6AtNU89DHWBoANvenGrKYFFt96XvHEkNjO9TDu+OGKPF9n6Ftchr0tHYLVW5PyE1
	9LYYsfv0t3Fi1sbGAX8toSALTdE+FFsgum+Y=
X-Received: by 2002:a05:6214:588f:b0:8f2:fba:7f36 with SMTP id 6a1803df08f44-8f3c67c8e3fmr16072916d6.4.1782918624250;
        Wed, 01 Jul 2026 08:10:24 -0700 (PDT)
X-Received: by 2002:a05:6214:588f:b0:8f2:fba:7f36 with SMTP id 6a1803df08f44-8f3c67c8e3fmr16072286d6.4.1782918623638;
        Wed, 01 Jul 2026 08:10:23 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c95003bsm2787777a12.21.2026.07.01.08.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 08:10:22 -0700 (PDT)
Message-ID: <2cb32deb-4266-416a-8db7-1b3b46b52162@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 17:10:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Flatten usb controller nodes
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260507-sc8280xp-flatten-dwc3-v1-1-b18be56bebba@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-sc8280xp-flatten-dwc3-v1-1-b18be56bebba@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: P_joiqtsIgPUdkFlNkIXFOFVE_grkeWp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE2MCBTYWx0ZWRfX2byLCF6XT8r+
 yPgoIiLmcup1OpFnW0JxBvjoQ98LfZlbKHSkWmXtITrnEC/No1rN8opQecyQJVb+eQTrKknagMW
 Rx5ob1WR9YhAR4/+gk9nivrpQixRy7PGuOW9LcGMaZynRcjpvlOXnab1mnzDrwQU4R/Aub32x35
 GkiGMNnpfrOyAUmGOufeROo/y0XgG88cwz3/nIDwpYZdvo2QZUDf6OwjxVp6c+JTun61b2n/X1B
 Sd7jHISOgfxU99u/LQkUEGlG3nza/gtlaBJ1cdmremHn8UIEiNU69nWQ/TqhzuI/vbMQEU4khRq
 +oPtqyKJvi9FizDlmI9niUyQU6MVAv2TGosUqbnZTnZQddQJ7N4r5b7H8M9Gjs5mDH2LDnmjUfZ
 nHxVnwqz/BpRxje/T41ROm80Lv2FyDJIh+qxUsMtGU499wz85yhbeNc+BgwKxrM3t8q6K6XEHyo
 Co22pkMxj85Z9s3dRQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE2MCBTYWx0ZWRfX1Sh72f+q3WfJ
 zg21VEizXF0tY1ONwCXLiJn4nSfjWx0hIezZPpsAJPFUBUQcR1of8De+ugrDNFlA28jNkiX0Jdt
 Fg3E7hQK/Np6LxXcNb9S+JEK4Me7J1o=
X-Authority-Analysis: v=2.4 cv=JpXBas4C c=1 sm=1 tr=0 ts=6a452de1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=2gBu4Zd02xb1IUzQ7tQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: P_joiqtsIgPUdkFlNkIXFOFVE_grkeWp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010160

On 5/7/26 4:29 PM, Xilin Wu wrote:
> Flatten usb controller nodes and update to using latest bindings
> and flattened driver approach.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

I tested this on a CRD and an x13s, both work fine across suspend.

Turned out in my local experiments I made a typo in the name of the
interrupt that was carried over to the big node..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # X13s, CRD8280

Konrad
