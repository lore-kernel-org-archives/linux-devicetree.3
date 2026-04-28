Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF1C4534A3
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 12:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381055; cv=none; b=VAXIBjHLRpe4FZYmdLJeGA7KAV9znf3ZI+tz7ZNXCo2S27BB7pdkhN7s4bsW3CpGcK3i54oO44AyoSCbIG7jJtgZbsdl3GlHjG4jayj4bgMNtf728mYVhqT26LNlAXvFGz0yJsCIpDPSC+yvZHC370LYFrT1A+6o9/D74EhaOzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381055; c=relaxed/simple;
	bh=ldxgjdBrYYeVXaUnxUUU/B4GwN76WLx+xuzOSN74aEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b7gePCUfqvnx6EAy2JM7hm1CFLl2w8viJnmot57zI5OjRwP4htfi4JOhcyqVe7oPNKHP1yHqiKBPOOIZ2ir7Xs3EF1YSZequ8FPlNa+El8/EsnV2G4I5MzzW8RhF+f2fhhZyHgDmJ5/SUB3eSJgfntZQNUG85dgrPUWXxHTgBjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WgPUl3+4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V317HW3t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WgPUl3+4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V317HW3t"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S7XBkD440834
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 12:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cAZoI+HEz2rp+EzYdEX3uozy
	F0yBJpjpXc9xmiJV/pY=; b=WgPUl3+4aDAoeH7Sq59lei5hhbH3zHqoLlqRAslg
	T/FigfBneLbUj1F/qCCk8DXIcx6j0juHPkbozwmSb0w4kufUHloVNhW0naABMSuY
	5I6gZ5QP2Wy3Aa/NRAgqBdnpAXFiEu2NyJmdHo6EutUd89ZvcqSyIcshEjKpKkVo
	Q7urZ97JR4dQCzRkX0pMKbGIfzXiJnO7e8HqNi2/eeGu+DOLui8B/J0kNP2g2U2p
	01vikdClhMGASoG5HBr37hLAdPmmJqZQhNSKbFfdnqukbPyvzw5ZWXkcj8u3qJ6A
	yX9l8GMZWnr3MZZ6rWcLuyfcbsd+2Vk0UiK/Vtl+8QSv9g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtac44g70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 12:57:31 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2d889997495so30343247eec.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 05:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777381050; x=1777985850; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cAZoI+HEz2rp+EzYdEX3uozyF0yBJpjpXc9xmiJV/pY=;
        b=V317HW3tvI23yR0tUp/+WFUkJRSSuNjkw9r6crPBtHPh3Jhj6HxLDtoPU6DdNqzyvy
         X0PbjHkwDNk7MeuJ1gEvablSvyJb5Mwn0dZEk2GFWqF7fbYQ+RPb5JolysQYml01limd
         Qj8B3B9BcuyFPNEtwfJC0Zb3BcBJcWmI6CroAC3I77Cq6WrbMlMlzsJ47sLyjGDYqQ5D
         /ars9hf3GaDuiK81JLO4uNtI6wulKcXXN10h9HqVO7CdJXOCI/bqz2O8PjKABOoYQrNT
         UFiDNECsJQiNWKLNufUrK6SCe2nTja/gVwZCzKEcUhEQRbuJcAO26hNey2KXJDPPnMqF
         PeYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777381050; x=1777985850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAZoI+HEz2rp+EzYdEX3uozyF0yBJpjpXc9xmiJV/pY=;
        b=obiAlE74uT4er3UfHxpIJTegmBgYYKmtIrcgorxyM7n8caacXjCbB3Oyh7aVFA1wJu
         s2wzSducY15TNnbTvkAWDrJejJizTagNTtQXsiEEQEqYhgCoZx6fZJ64lpM9aLqs+ii2
         Iu49DHi3LxaNdei+XO5stgVY8p6rkYnr/ZHyCuvRjQ+MxJGiAk9o/TVUkU6VRiUd3lp4
         VcKO9K9PFmXKr+AMHGVajeHA+8yDt2i7nMrmi2EJVtyDlR1W7eiFDwbwvQGwGX9CgmoG
         HTdEtkNIhomvl1V2N27KeaKgiu39L9tt8b6V5jkT/mrUI9asFjiTeT4T1BsKxks2DVvm
         dAIg==
X-Forwarded-Encrypted: i=1; AFNElJ8fA6NkKF85//Qo0pxTviv37ztAypnMFcvfK85CbrCXHo5umkrgNcNKkfE6iYVhTzNNlEhaIv0q3WYO@vger.kernel.org
X-Gm-Message-State: AOJu0YxnwdpTYWllqgfI+e3JMCi26pTmbs8LZU3tgIcIuIEY+buFPpZ3
	Z+YCE820X/K4dTtp3W5xCDsU0MU9NKvHd6Il/gtgeu3Kpl24hku+GqprDIPpN4Zv2abLCeIWx9u
	Ppe4+SBliMaN11FmxbDRg7GL0ZGqHtAvadFP2P1+X7iM8TJ7kQXZkWrnnF3wNK+1p
X-Gm-Gg: AeBDietZ907u40uxcfc49bz5e5Gg8huPRxvzoN2kWZTiBHZ61eRUZONlDCEtoTvofv6
	O3dcnkBY4mmeaE1J0kxDmWG1WT+JVGV5OhSZKHMd3IzJ8GdYaQfpHg4nvEkJ6EXkXAC+QTSKRkb
	0+6XIfSVPwH4zW3q0uSuzTnNjhMHcJ98cRQzYe+4g00iHZKMGPQn2MZQbrwaBuv2UhDpWHVg9Ul
	Zn8WjP7IaKo+j7TibpmVZ8s1bt+tvBkWczZyIDaw5dVUbl6soB/tCk2cZSD08QdJo4Jyx8YTYnY
	6T8hrOJMQ1D6iJ/Fd3T0Ei76jg4b9TgCI0ktz3Mj/q/INhIvN/1onbPm6q+y8DPS2/JQTJDd0Cb
	nBI03fewEwscnA8BqgI9WcYXhj4qcQGLZYq7hYdWNYE52LWk5/nX3lcrkCacnC7SFL/8ewPfv75
	4=
X-Received: by 2002:a05:7300:3b06:b0:2e1:f72:3f18 with SMTP id 5a478bee46e88-2ed09fe6f94mr1542597eec.1.1777381050180;
        Tue, 28 Apr 2026 05:57:30 -0700 (PDT)
X-Received: by 2002:a05:7300:3b06:b0:2e1:f72:3f18 with SMTP id 5a478bee46e88-2ed09fe6f94mr1542577eec.1.1777381049572;
        Tue, 28 Apr 2026 05:57:29 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a0cea01sm2118609eec.18.2026.04.28.05.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:57:29 -0700 (PDT)
Date: Tue, 28 Apr 2026 20:57:23 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: Add compatible for Qualcomm
 Nord SoC
Message-ID: <afCus0_JslMgwdlg@QCOM-aGQu4IUr3Y>
References: <20260427011728.231026-1-shengchao.guo@oss.qualcomm.com>
 <20260428-tricky-magic-koala-b21fed@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-tricky-magic-koala-b21fed@quoll>
X-Proofpoint-GUID: PsMJMG2dj1CsVH-v30foiw6O-euqxyw1
X-Authority-Analysis: v=2.4 cv=D7J37PRj c=1 sm=1 tr=0 ts=69f0aebb cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Jwcvy59Mha0-J4ocVUkA:9 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: PsMJMG2dj1CsVH-v30foiw6O-euqxyw1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEyMCBTYWx0ZWRfX1KkOmxZ8lOQx
 vYUNYs9sCLClUpxmDXrl4I1zKBeS4MnNTsRK2PZzDfgkPhI86s4l08zKAC3837BXIfEMxxDFMmK
 S1C0gktatSfN2FfQHUdUS3nYp+m+Q+nixwMbRhToiFtGlzzomaQUjLYj8/rJhbpSNoP/8M3tmh5
 SmSFaoBIznpQua1LURT/djoGdRKDWZSAMEy3tmBiba+z+QjOndY5aPYbeC/Tsck3xECsr0Ta9nu
 bc182i0rZ39V1BJYyTP579Gbs3IIRnBWPMxZCJYyGoTxLDE28ZRh2mn/ngRnZpsDSNpxyTUylAb
 0CmAnBTRqIsR5aAlzZsNp3gkUKsOt78T0vU7ak9q6o5qiCL+mPjoYrunuNSlSRkmsdjT0X0UMRb
 JkPG4JfRrAkawJiPaA+5RDCnwq46epEt7IWZTtrVwSLiuF+S6iwUixMnf7LDE8NqHIkYm+OEyWZ
 C+yiSJpgvv22yf8EFaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280120

On Tue, Apr 28, 2026 at 08:20:35AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Apr 27, 2026 at 09:17:28AM +0800, Shawn Guo wrote:
> > Document APPS SMMU on Qualcomm Nord SoC which is compatible with
> 
> What is APPS?

Should be APSS.  Thanks for spotting it!

> 
> > 'qcom,smmu-500'.
> 
> What is qcom,smmu-500? And which one? Adreno or not-Adreno? Please do
> not add any obvious parts to commit msg.

Will drop it.

Shawn
