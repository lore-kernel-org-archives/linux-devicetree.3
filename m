Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBA23F4DF3
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787218709; cv=none; b=E6PN6evHXCBGSm4gQIs4X424MliUpCjiA9laOrNEoqPCX+l5fdQJvM3BzHAaGKxsbb+Ba4SOKr4aASdZMT0kcKorB59F1sQbARidY0MbQCr1VsVriJEvkfwxMOJ2MKvCPZMiuV5GUFdxncP+vrhF1yGLOQOdhxI0mN66vQy1Cvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787218709; c=relaxed/simple;
	bh=nKQbp0Daa/E8QFMecrOY7hwz2JZeLzSg30HZjZCnOhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QIotlf+z4MhJPSCxhHtJ/fM8DT7UmZChsiQ/ObIRg4ueyb0PKs9+G+DSx0D0GgVqyH3UBu+R2ddy2lE1DU1vvK2CCbTmy3o3FHmh00508RmlwwZDk5Gv6IqgQYPloWmkT9Gfi0S+EQA2Pij2TiP4SBdnQj64EwnegqPRZ3vqYME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WvcnYpyW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bHh+laU0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WvcnYpyW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bHh+laU0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6VXWf1258930
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DySblYoDgYo7P1E6YAfd7mn1
	KljtrNAErhqBAc0/znU=; b=WvcnYpyWpZSWM1HON/To1TPby8Ro30MeWYCNLBaH
	evP/BBkCQx5Pf+ulBLXhdJfjzQO2X0EQ0Vs4bpHGuWH15zeaR07KTEzYF1S7onQN
	2zRRh895wSicD8zoscxFt2A6J82fI0mVWt7tNqdMZaZxIP+K5sBElFjm7mGmxvJh
	7mut0XatahuX6a24EiFhRGm72LNWLjAGLKyNiQlEl1yAdrkD2dxdFtCUZfPrvunZ
	JBjdsoh9S6MhIiBTDaO8LmFFrxDhvvC1RkiBeHZ4Tvx6Ets2QlaiBnJ5KgP2vNGV
	pp1I8Jr11/HpMwPJeEJI/LLuBbROpIf7roWaYbUxdZXFow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es644hh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:38:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e62e3459fso231419085a.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787218692; x=1787823492; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DySblYoDgYo7P1E6YAfd7mn1KljtrNAErhqBAc0/znU=;
        b=bHh+laU00KCnEo6UzhikFNsKwIcnhBMYhuqlfBG6MLXlNWX3Y3O13PSL7Cm0YpFiVe
         w7STKx+mSVywSzLptzoEreHSsYUIkWSbBwq9EWzRrzKjloe7kPY9sflZ11uWQNG859wo
         fD1Fv7NlyXu8EOhz/sP7Q5k2G1dFevPq5Mj6uAzNy29lVVO29eHHkfT3fXJsfupJTisZ
         4ZiYPiUoB9B472DxLdvA/Z5l2ZikFBbmGoX0Nz8FkuItl4wV8RnD2wSj6UqEDksD5C4j
         bE6XMkD5JkQvQZRMhypSfVf45Up+xarvYSTkXwygTFdAlNioj+IYzxqsm9hKdWqz5svP
         WZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787218692; x=1787823492;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DySblYoDgYo7P1E6YAfd7mn1KljtrNAErhqBAc0/znU=;
        b=dVHPKJoeO7BpAeDT3UM445XFqmCfDNqwMZjknjkbt6630yOMA2pczsXsQFl+5IqgvE
         X1MHI+VuMXRyUgerlIzyq0M89uxbAE0XVzOsF1RPGiYZanTFJJtPyecXXFWaFP1fmL9y
         2j/KzDf1TcpYDkCsmlHPjmXsj2IaXBSvxPHxUxRuZVYevIugPy8fnLcQkjvOSrvvIAXm
         zKBZavpZGFN8s9xnY798T8p4g4vWf4k8vEOprrK0iRZ9NUNP2Ipqu8PvLUh307EJzD7d
         stxzpN5biYejgRQH8SNph2Vvzc/nY5zA8NjVqqh3ApBfH8h1xbCkUi0iyqZMnGGfqTAz
         +Iiw==
X-Forwarded-Encrypted: i=1; AHgh+Rp6HnjfNvc+qGrONuZ0WE16bMl7xJaqLbzcX+nxwH1Eb8+Jbo5CAfavdjcuKWuji9XeZ/wg2T54tVBT@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy5BDWI+7xOtwyx/Z8eJrbHosBU6BcgTWFje0m1JQqR3aTb6pQ
	WKoGi+iprJABj1c4YXFc8G6Zkf4bnabNNSO579Za1KrcwPj3Vf9BZO35f08TvXvrLiiYh/+K8cM
	n25RG0PyBPuN61mnjnP2YKLMcLS8Z8DnWguAGdtypDJ5rWHHg0qdMHxLT9BQ6htNm
X-Gm-Gg: AR+sD10oLI+MlNTCMcWiUEx6gEeJGhz3IKcu88x50T03FYJa+3qDD4EoDrFNvaiYf1l
	FumG83Y3rEaG4ODKegZe+CdOK6uqAFuiwexgP5/1NtTBi4fGaMb23Q6rFgZCDQmK0VBWLnX342V
	3tEWCI8W6bKJYFGbkecUo7wGheKO98kH1gDFVpT5sf+PcR/kr+HfOpDp9jXIEHcICF89vhUYCeG
	Imv/XJ7ywVCfbfhOvoazVwpl1oidCmAT0ngwWde8xVSftsHg/rTB3GPw6WdYavPh8IQrhllAGJ9
	fWx9ALJvhzBOHNUR5Z2rbvY+g9foEE4QrdKfKMkn2j8R0/K14hkXOJ1H96wEXtW5jFeztHcsaDS
	wve2W+CeR3HYELYA=
X-Received: by 2002:a05:620a:4143:b0:936:e723:27a8 with SMTP id af79cd13be357-9371e2d3809mr936587385a.23.1787218691786;
        Thu, 20 Aug 2026 02:38:11 -0700 (PDT)
X-Received: by 2002:a05:620a:4143:b0:936:e723:27a8 with SMTP id af79cd13be357-9371e2d3809mr936584385a.23.1787218691258;
        Thu, 20 Aug 2026 02:38:11 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm170401015e9.11.2026.08.20.02.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:38:10 -0700 (PDT)
Date: Thu, 20 Aug 2026 12:38:08 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Xueyao An <xueyao.an@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: shikra: Unreserve GPIOs 14-17
 blocking SPI5 access
Message-ID: <4qqhyhy5jmruelj4isbawvlifiha7v26z4hl346hvr4rc6bftk@kn3xakfvje3h>
References: <20260820085347.822-1-xueyao.an@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820085347.822-1-xueyao.an@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=E5/9Y6dl c=1 sm=1 tr=0 ts=6a86cb09 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=gIkzSn-ZV6KDZrmDYscA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: JSmkR2MlUrqFgPdIoQma8jtTtR99exVL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3MCBTYWx0ZWRfX+4bsKWGAnNT1
 1/+laY7gpTFwpWIAtARVEzu+oYbCDbZnQAfXjRucc/9nEnYOF8Dw5vEF3BbhMqH/21gZQuajQ90
 xqA7t6R9ro1ZM2FF5xgo07rampVOgOufg1mq8azpx4qVOrCG986Dnenx2PAWVPu729lEnmcVA3h
 x05Yi3QbCUk5bNh1haEpnGEMXzbevw6/fIyiGyU9LBMFyv+L+Ez3X3+KIyvczIgddH01YEq7nGE
 +S+7C4QA6nb4MYtrQyEc3//lIaeSEK1b0GdKhmO+J9VIEdJaseO+I8X5mSyMEomqfoHf73wq3Rl
 cgm3GkBi/lMND+Uiag96iBOrqvYzKd1WJwP9K0eKM8eDkGQ3ymmSaHnDmzJBQBdtNw0CmMaC9Ns
 AOqg9Yx4SyO8o2aTVByvDIZU5+zoWVs9O6CkhkVpCT9RpgIVIMj85KvuyNNnxaLRHC8YXatpYtm
 YueT+G6x8lD2TOMGy6Q==
X-Proofpoint-ORIG-GUID: JSmkR2MlUrqFgPdIoQma8jtTtR99exVL
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3MCBTYWx0ZWRfX7tUrKzGvHIRf
 C4iuA6egrzVgFJmm1Aatdc/srXc9THTHW0iajh1w62WoCClH075amqW0OYGP9BlQ+SX169YuoXq
 18E6XbSiZXzA6wxarvRR7Tdx+Gi6cBo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200070

On 26-08-20 16:53:47, Xueyao An wrote:
> GPIOs 14-17 were previously reserved in the tlmm gpio-reserved-ranges,
> preventing Linux from accessing SPI5. Since there is no TZ use case for
> these pins on Linux, they can be safely unreserved. Removing them from
> the reserved list across all three Shikra EVK variants (CQM, CQS, IQS)
> resolves the SPI5 access issue.
> 
> Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>

No fixes tag?

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
