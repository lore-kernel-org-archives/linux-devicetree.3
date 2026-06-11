Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62A4357A25
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177668; cv=none; b=Se9jhY7FE11r9DsYHnVt4iw4dAAGdi4oPJQDzN0h9k5toTyHYGBQHjBSs3UsXlmAq+KipeklAAFeVV2zOedNuY3Flr2RiZUXZ5oiBncUwEMNgOfhu/26E+/CH0BGA1+/bb6n04A+dVO2kQ9owB9NCvibaBCobFldkE98d16PbB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177668; c=relaxed/simple;
	bh=wxd0z1K/jMxfFNLgwOXIm4LHEBf7fMJ8Se4Mlgv2iBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VcDt3mSy2ufuc77IjwrSg8App/vm+ge05uBGlcEkJihLKN3zDbNI5YsX4MNbXPfCPttuh8ONjWfL1z128UCk97s3BWP7pK7bsHI81fDxp2Xmhk6hoA3joTu5eyO0pA9qM0mGUUdJIl9iTQpZWrGst9LpQqQIJxbUxbe2vUt4Jy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KJMEYbjJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bVzJEPMA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KJMEYbjJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bVzJEPMA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA10du304101
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sNFFQ8ITUaDjSLXfpTnELXU2+/IZ+KPg3CtsndZrQvo=; b=KJMEYbjJhX1QjJIg
	qzimgbaUHeghco3qBZaeKx+eUTQqB6pYohFoKEgNGjue/bi2VYn0FjiWljfC88Yz
	PL+WKpId0oxytkz02xxNLnWmuYzncdKdTC+tWMJtA/y1ffnYab7hQWhWRpCbasdu
	8CFJMmsNbZzAfR1wC7FqQ7gnFc06qapLewpyVyHlcSmLLzyzpmAyruC5lNPOygR6
	pGu5IObLcBSgsX3C4VkB8LisJkl110QzjrBMWrTNYd7hc3/tHbI/W3N52bVgXzvV
	iFhsDTHQZH8eOo0pHngUGsWokLgLZEUbjGfiF/2ZGjF9z0EsMNPDvZpYNGn1Kw44
	kbp/QA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqtb5gfb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:34:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51780e3ca44so15829091cf.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177665; x=1781782465; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sNFFQ8ITUaDjSLXfpTnELXU2+/IZ+KPg3CtsndZrQvo=;
        b=bVzJEPMAlfYpYzHxfXKeqqS16KyHXcpX4OPTOX6m6oCd9ztmR6I01rug3HmzH3rY0r
         yzyqeynE6sZPFq1m2xlC4FEky7wWU5AUgwbWz9pWvE29eXVrXNknuxr5ibRiR6YTvyrm
         peXaDd+wl74BwVgH7mSqnRV9rL4HPVm7LIq88HoMr4oNCg55OVefwQZnfJKCCZ65oQCR
         PfgujfoR1BrUoSCaz2ungWYBOEZ1Mixy5bSVc05xWxqeHjW/Xjf4RtfqlPMRh2B1teuK
         /aH/Vu8B7LHPhYG9sEzH2yPysWHJLz3QB6y8k38H7gffsBMbuH+uEk1mUg5PCQx5Iwku
         4Png==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177665; x=1781782465;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNFFQ8ITUaDjSLXfpTnELXU2+/IZ+KPg3CtsndZrQvo=;
        b=gMCxTTKOT7z7o12Qp76UwCEvvCmCCaDZTyHQgytR/ZXf+/z4OJ0YgCO/W45duJ9nuR
         cyoA3cMnzK54g7m3+jO8JE+y5Ldrnu8mbLQO+WzLs/vSebtUZLM7Szzn5bwiSMjnwmxZ
         YuHZX5CEQlpR1q+JUzaZAYh8E811r27vk7XyRDpp1Ie7PRwUUVKnh5KStOdNhcbmOFwb
         NqU+KLvM/Ki32/W8+6/58t0e63CQiQuzVcEKjiaD639EcedL5PF7jEjr6vJo5zTVGmpg
         k94u7SVy2UESbYPox0lDd1G/4wuNPmXeuYcbha2F0o7AZ9x0shY6BhDd5pxauqlu5YfT
         BQWg==
X-Forwarded-Encrypted: i=1; AFNElJ8AOxodTj6qBPt5NipNutxDQzz9e4ZR5a98k+CYh5vbC/jfjV/xah0PmqOGfeb4TGA8plV6lDMhJCo/@vger.kernel.org
X-Gm-Message-State: AOJu0YzwrfzJgPqXx3mHkbTujsiw6YzQq26ZiL8S9XYt9eemBj7PZyeD
	deeWpe7/8l3ZkuwGyEOQBEsBmGT2Jabvega59E+3M4ygvrlxqiB5Q6wBbDTmLIe5Y+snhPvrqUu
	KufF8F1jXHQA7hEQMlWmQDUw0HGZZ9wU/JgJknSjFdFgzkMQYhdSXNKW6IUmziYz0
X-Gm-Gg: Acq92OHszuFVZKO+d5A5zGDDHdOD6q+N9m9XdpKYhPrxZaK9J0ggWjFH1diU3mX3gGI
	0oKmae4vUWHQ8mkvR8Z2MRI9qfx9oUtBMXa8HpxZJwqnDJDdJpzGN7/P/MbFRmsXuZrasxTKLOx
	QUwvBAFK7bLxLXpAYuUJNZUR2fuCeW+54V52otyCFdFQikqlqTQRA2Cswin7bYee8v2ErEPz2Sl
	QF5yLpjcLrf2Jl1Y59yoLUgXttGw96QmbEGxDF9H4OU1x+CGSeblrmatxrf3LDosmynS79KopM4
	bk2PzGAofuXEkbRmR8x81rqHzu8tA2vOpGQZuNGjd8tCunaaBq0UmC22XFoOJCQDhWMiYk2UKJS
	IcD6bCuNYYEqhjEbpTVuxk4xYQAtiGP7tBZJOFW0bbvGwj/jwGLQQaVOl
X-Received: by 2002:ac8:610f:0:b0:517:71b8:ee37 with SMTP id d75a77b69052e-517ed7bff68mr23801211cf.0.1781177665031;
        Thu, 11 Jun 2026 04:34:25 -0700 (PDT)
X-Received: by 2002:ac8:610f:0:b0:517:71b8:ee37 with SMTP id d75a77b69052e-517ed7bff68mr23800781cf.0.1781177664661;
        Thu, 11 Jun 2026 04:34:24 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6585185csm10926810a12.16.2026.06.11.04.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:34:23 -0700 (PDT)
Message-ID: <1c5e6fe1-dbc8-4019-b88c-e7b4a45a1ae7@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:34:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/18] arm64: dts: qcom: sm8450: Add minidump SRAM
 config to SCM node
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-7-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522195009.2961022-7-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX8M06bRdtGRnE
 kn0VW0/l08BgSmOATuPpRVDBrKpl6iGWf0PHN5r4czp4rVDnQm51L5Njgxooh+UNMmOKzpwfOrF
 uL8kCRe59silssp2riY5rRgSTz3l321ty6eiksnEKUTy2rOUmfy8JLy8/Xct9geKVXtZh8L41zq
 cSUIZjcOoKKA9gvGqXgBRKT8RkYodP2+hc4iaWMF7S93aL4SWU6kbc+jTx0XPAMxadMngJuzRQa
 VXx3MPxWuDKftUHI3lO5WFxeaLijgAfDA/DV0MJMt13WLrrTxolaGx3X7wejxSLMN96ysCVzx1c
 y9XAk6A+LpG/+RBT6COOL/+bjqoXM8NgYGlgifk1tla+hajkeMxAtkx9SGQ6E2VB3+fVdcdH6IW
 623aA34YICvEDk4PVhaEU5TLNQlWjRGLYwkHo5pkThnZwGSp17dTsKx80oSWEHAvKbJAbOek4u7
 nq66R/n6NjJ3NIgMGRw==
X-Proofpoint-ORIG-GUID: V84LejkI2m133xp4tXS3CXyxImVHbp2K
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX+LJAHE5vjy8k
 Vhh4y0q2ErIDrSAyoZ73CuKAixukfSdC/7QE3qbUJg9t+iqAmYjI6fhso+5wc0I+9UoEK0bOqa2
 5d5ss0PzNm1owCWa8geiWm+pJyjGXe8=
X-Authority-Analysis: v=2.4 cv=e6g2j6p/ c=1 sm=1 tr=0 ts=6a2a9d41 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=EbZ0H_4aSGrsEeNKfi0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: V84LejkI2m133xp4tXS3CXyxImVHbp2K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110116

On 5/22/26 9:49 PM, Mukesh Ojha wrote:
> Point the SCM node at the minidump config slot in the always-on SRAM.
> Boot firmware reads this word before DDR is initialised on a warm reset
> to decide where to deliver the minidump.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
