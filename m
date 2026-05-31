Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C6527FB3A
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 15:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780241983; cv=none; b=nQeew2UChDt1fraIn8OZSlpYv9fpGhiCveG5a8ThUoMCfDB3yu4scTvbm7s5+mOCaCYN4oH3mI1g+5EQ74KplU+Yk9xWbTfPIKtrD4TKhqjNDw+qj/fngbXzrVCebLpLpgpCl+f3mM3Ph7AzvfN7AFBo8LuIZjfBsp/9GtpwXa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780241983; c=relaxed/simple;
	bh=pWT4YdL7aFrko36KfFrjfSC/48ZOWlYVkyea+ZXaa60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IydxAaBrmU5AiPRgbIFoYtZYlMp63iS7k5xeh+onfPyIvZ3k98Wt1hhWjwd/O2aXIyW5fj2JpgAsfyKrfXcgE/j44NolK+pubm+UTn2tCfzWop0F/nF5jye5evkLRz6Y2BmD3HenhkW9Tu6VWde9mqLsjmbotLDFeUv9HS5OqvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X4IKnLfO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CfQgEJl0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4IKnLfO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CfQgEJl0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UNnqJG295267
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 15:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qRlXql9jyRKpeaWjVcXn6Fhm
	pC8o9vHCgk6e3sXjn8M=; b=X4IKnLfO24EOejgsmq7VTGK/SN3XuRdBwVBTReKr
	m8D+FbyceVeF8ARnmvB12/s2AFfSKPcqV+C3CgwUHV1FewaCI5SmOfR8IjF8ld4v
	BTZnWUMZbKUW3VZIksTc1s5SjCG7rHFU8MPuQQ6Shvdvh0uJKbGoQHKr1b/BHzZM
	+EsDYLiKeXqd5dntBBHmRmJowl+0AG61gHF7U6W+UV1zc9N5klcaozOoy+svFufK
	tFpWyOJPWgX663CPU0Ejojo+ye/VS5RBJqxNWkuBZh5xfg/MqnODS2gY4DDNL08N
	sW10C8Ud51T4bC7/M2XW7MaISj+ablEtnWroLIZhDMrkoA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efs2hbsjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 15:39:42 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-96391e58e62so2935511241.0
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 08:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780241981; x=1780846781; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qRlXql9jyRKpeaWjVcXn6FhmpC8o9vHCgk6e3sXjn8M=;
        b=CfQgEJl0TNGB2qDUdtyLGfHclScJEle2J3bQwDtf3nVg5bGkDncbsArHD0kyVBEsxd
         mfqGc6OmJyvUfHFIKIU61Ov1sCBifG0NbU+m6tqFII6CXbPs8AI5guGpbrO/NoyxTXBY
         Wr+NWKWEZD0VypAD9avuDxyfqzetEZFMS11UgCAIm2jAOQgCpEPAaCXMipLb4kUu7FEo
         lMv1rDBE1NutuSv4/SWPgCzD5IOOkcrWoEPetVb5QtmrNt6OzBIl3k+RnqMtLxhDEItG
         eZAp9s7cF9f0Qn0xSWRgQoA+3hAu6V6C9o7g5oBTk/k/F59FAsOdY0KXfw+QL1EWojIF
         yv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780241981; x=1780846781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qRlXql9jyRKpeaWjVcXn6FhmpC8o9vHCgk6e3sXjn8M=;
        b=NiTD+/xJ4NyWr5iDrpStGcXzEo6H9+FCSLynM+g8hRKcLtizXp8NbXW58P6h6rh8bM
         CoAmTQ40SiBVje7Zr/LK+nAKaVh2UfOwTwWKAC0n9loChs3htaAdFZwBobCBMgEWr3qq
         sJfMbg+79qGL9JNLo7LSVGNQXtDYzwEl4HftfMeY7Ed0eAtK2A5GfWjH2lNQIYrfZMmG
         xyAGS5BTRAxIcTYFEgMgj06W2c4CHHU7GiTXJpAi8gQ0dGNPk7FMjgDugRM5IFmsrDHJ
         qKhBUzioE/hL14qqRR7T5cYp0d5Nc6XgBW/DEm9rJaJUV0l6ZElzD0f05BjzxE4tgjOX
         851Q==
X-Forwarded-Encrypted: i=1; AFNElJ9BtZ5I+pcl63VszqMyZCtb0SIDxmX9EZZw3WCXdhyIhFvkfATedMt2C6W6Za7lVIoVUYte5nRiVAxq@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo2os54C6ZAOHs3ATIQNECzMmf4iZuzhgxvnBnaWWeppKSgUm3
	VP0mvxHnNV4hBe6IHrJY4EbkO3KmRe4JnHnuK8Nij2rptN+6vE8pU0h0083UzMhENDIBJDDIph1
	TvzSlGa3NAfEEIxRfSLRHyXqeQQSEziEBmwaEa84VPCi0eWcm1220GR7vDEPanOA1F93bwdJsLr
	s=
X-Gm-Gg: Acq92OEX9YfYWOZ1Ni5ENkUd3LeWvJBxKcBHnN83H/fZPEvJSlQykwFCOhH1JU66i0E
	sTbIiyV16fG/nAI7+c1ZgsJejqy5mD1aHxbDdeN52bl1OlWIzssZ/VKu3GivCjsYjN0yWLR9U5g
	GYUBrPaR/vTJ5LKbcDdXYiCUDt8uXChNZoDyIHGTldtvsggxnwWYWvr2L9RWppbTko0M+lu887I
	/K0otnNxy79eIbw8tNKmLc9ZTraDrzDp8aDh9K77bfSUUbQUnwYywkEwbhMDGdFHJurs+K2mbiP
	FsJ2ip9zzyOQDXVMtjBKXg4ux9bmdV76XXm9ZAaz3EbhA2EW+g/nwdh76QXd/SYLAJIuWxH4tDI
	EmgvTAYN1403pXv+HxMH7pv+RHg9MQfIKvK5+EnGPnpDjZDGu+H0vCJPSolqrmult9ghw7anmWN
	+CauMlqA+4PDn1OzC+/KT99nlUf+85lhuN0v5Axbr4ak1oyg==
X-Received: by 2002:a05:6102:46e9:b0:6d2:1633:1803 with SMTP id ada2fe7eead31-6d216332e91mr606223137.19.1780241981169;
        Sun, 31 May 2026 08:39:41 -0700 (PDT)
X-Received: by 2002:a05:6102:46e9:b0:6d2:1633:1803 with SMTP id ada2fe7eead31-6d216332e91mr606211137.19.1780241980779;
        Sun, 31 May 2026 08:39:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b07c31csm1538034e87.34.2026.05.31.08.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 08:39:39 -0700 (PDT)
Date: Sun, 31 May 2026 18:39:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom: add mmcc-msm8660 clock IDs
Message-ID: <vkgiekx3gbbl7nbgtgul7bx4u7emz4bfo5i24ovxnuze63y2g7@tsdsmulnmpqh>
References: <cover.1780148149.git.github.com@herrie.org>
 <bab6d4e4c147c02987423141c0841bcc5d1eb045.1780148149.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bab6d4e4c147c02987423141c0841bcc5d1eb045.1780148149.git.github.com@herrie.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDE2OSBTYWx0ZWRfX6CtfNBUMWHN3
 Gs/oqDmJW9JZynoQLaPsnvuM0t4YrMXL/CKMwkA+AtyqP4tzwdcsn0Dc72oRec8Nvf0bAfOlTUX
 TWraIrdRmj1x/GxM0XKn9gRXri9TBW6kz1F2JbvP0fufelWuJzdYjA/51Qf3gvy7wPNIxkZOhPd
 gqAUU785hwIasPUQtBQ807XE+75xA9PPgGF1mVf6LntnanLZtAof2iM2EMNIyg9K994GOc/HZXl
 gq9LkK10Vms/7o1JYL8hVRZgMW/D8CLubNuc9INPr2yRtWMYQG01pzePsYUTNeOy7iwKy7IOEty
 6WyewvI3bTFV+dD/XVHdFZiKQBTCp4FmMQbIbmsDqGGVxt9ZloE3w9HzJ3ADRKcw93B+rJKryW5
 o6Iss4wBYi+v3kGHJV5qmFM9BwxjgYlYWVlzISs0Wptq3MHPmFXkAjBMdXOWCSbD3Ymey9nqN6l
 SDsRJSanLecz2S9/YMA==
X-Proofpoint-ORIG-GUID: 5jGKP4QWlHzhL-2hK4VR2XZ0GAkMYnNP
X-Proofpoint-GUID: 5jGKP4QWlHzhL-2hK4VR2XZ0GAkMYnNP
X-Authority-Analysis: v=2.4 cv=UIvt2ify c=1 sm=1 tr=0 ts=6a1c563e cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=cTwmTnRGAAAA:8
 a=QThZvp3mIYKcT4gch-QA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310169

On Sat, May 30, 2026 at 03:58:10PM +0200, Herman van Hazendonk wrote:
> Add the dt-binding clock-ID header for the MSM8x60 family
> (MSM8260/MSM8660/APQ8060) Multimedia Clock Controller (MMCC). The
> header enumerates the clocks and power-domains consumed by the
> multimedia subsystem (MDP4 display, Adreno A220 GPU, CAMSS image
> pipeline, VFE, Gemini JPEG, video codec, rotator, VPE and the GFX2D
> Z180 cores).
> 
> IDs intentionally match the numeric values used by the original
> shared mmcc-msm8960.h so the driver's clk array indexing is preserved;

Why?

> only the clocks actually implemented by mmcc-msm8660.c are defined.

Please also extend the qcom,mmcc.yaml to define pecularities of the
device.

> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  include/dt-bindings/clock/qcom,mmcc-msm8660.h | 126 ++++++++++++++++++
>  1 file changed, 126 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,mmcc-msm8660.h
> 

-- 
With best wishes
Dmitry
