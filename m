Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2C93F0A88
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 20:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776888174; cv=none; b=RHblRxaPWUNggOM1HFxf87l7tRcrDVxG5Ut6WgjMAmLpQqbe1GuYTp76bfuwr8Uhzt8HQo+3VrEHzJKnLzbwvSSl3iS8Tj2weVuhEG5pJ2gDVHATWCDmIssP0cGUEhntW/HhFQeZ9NvVxkq5BdUXhZVRQ1gmiIlv03AfHLwEeDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776888174; c=relaxed/simple;
	bh=jMYpbLL64WOaWpsgBTfjMt79RbB4917t21R2mPwgWJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPj10rr+Dkq19E5kAGQophbL45GQJR9Fo/zc38UjGIpUlSu2RFjHpG3WJWI0cGYPThkczgstx3JCWL4fKFT7Ur65cK83INDgnrI8imyVY6XE3Jak2dXWSflZSuvute6hCAPWAVWvnIOvAcZSMdJqW93+ge/y7jloRRqY8HDQOHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=euWayNQ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=enioLelG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="euWayNQ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="enioLelG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MG3gX31230202
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 20:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XlA+3Fg8UBxQ5lYzPMzvkMyS
	dKoVx8IQ0KNPVbZ/tKs=; b=euWayNQ6aS/msB4QyNSPCgqo4V2flm5fNtkCaPMH
	9RbWrFQsIG8La8+U60xsfBVl+WhrqsVDsyJvR31qT1bV1+oM0qlFuVP+wCZWjFoo
	yvUW3+cCFdbUwkMmRbEBh71ZW61hDN0ESzy/1N7B3Lqg2QvxYAWdlqgKst0XLIen
	azeT7S0VL0ESVMM9exHutL4aQADOSw8W5rrBR0d5BmTUn8rs8hvsj37pki4BMisK
	vCfu7APh1IW2g+7QjueTGtIPTxMRSDi9hl1juDP1MzMp2lAQKgw7k57jYeJQtmjk
	xUjYzuELKHumTs3PU+j/uzLYreK+UgBE+lYcfaJiHigcCA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h68uss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 20:02:52 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-463a1cee56aso7352904b6e.0
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 13:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776888172; x=1777492972; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XlA+3Fg8UBxQ5lYzPMzvkMySdKoVx8IQ0KNPVbZ/tKs=;
        b=enioLelGzskDQALZlbkz1qeEfon/19ywmi4mKbVUs60N3U9EpCMPjwPMII73AVvRrx
         hVCmNGXPbxaKeswb6d8wzMhhxm5Ttc/Gig9flICKC5lxX3Bdg2f53kMxm8ejHBmigjaH
         nEjn/NpnoH3dNTaQoVWIVVDnApTyVnCrezSvTNAKw9OUJRqS2iLMcoOXufgYE7u7zNEf
         hy2swfO57kr5xMaQk6IXeFX8IEKa70UD//0XwphGxyQQv8CE5SWSjwJpqtDNZDeRQ2BJ
         j51oMWkbkjpPMnHUxoNfq5iwWjd3S9Ba+CqaNGVQK4K5NJYluKbjICFXLcHyu6q5VrPn
         mDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776888172; x=1777492972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XlA+3Fg8UBxQ5lYzPMzvkMySdKoVx8IQ0KNPVbZ/tKs=;
        b=T8fkOX7Io9VbhgXFb/+MhrMmokXwMIv8y/1tjR6UPU1UnzPtKAF6zL1blBFO4T8Hwf
         3gn/a7WsXnqIsClxc3tN3h6TvYSK2X0iHZ3le/p+6tUh5uNPK2Cr8EGmAWITNwHTCdAv
         LnEz7t9ZYjsTlZugvZCXwxRuC2rmAI2ehV0wAx5w64fLR1b0aF9oJRNwFtfYbYZC3uTP
         I3IHpTnqDB5Wd9n3+s8JtUXWPwP6JaWUtRLWByhuB9k8GT+P6RiOFcDSI6ypZizKQY/x
         bLv9z0B7DXdabmHnQo+tcBVmd1bixKVQlIA3UU4+kqp3ACBsg6wf95oGYQvnjEe9aDNY
         7KYQ==
X-Forwarded-Encrypted: i=1; AFNElJ+0f1e9vMgbiS2AhpSQzIReqXuyY00kro6bWbxOKUMyjknDVk0wsbeb7kv/FJmwaFUNiR+xfm4i1xka@vger.kernel.org
X-Gm-Message-State: AOJu0YxNouMQpoPFRCXiP3wfKIKQ2XHuk3FmKr58CjAO8LPQny0lZwq1
	H3T2jpa/rcHZo8rWCpabZhfGn6t+VaoyvWrJqzNyBjP9zmoarWlAlq3VUQLTM0iSipuPonyWWrO
	PSOEz0gjieEN1ql9S979TWmUfvGd0OGtvrfO+0bOg2Wfz8o3lezuQwPQJ+JQN5Zf+
X-Gm-Gg: AeBDietRchMclNhLQgaFlfdxpprAi3PMPnKnGi2OIvMN123hKXqukKL6TRKEVG8LU+4
	xZoe9z3lwiR6b0pEQJPoeBk0Vw4hQ9y08WjZUxEq7eEsUuvncfFBVUAjWheJA4bT6jWd0VOyaka
	+gVZ05LspPsjD0MiOxtRz5IAt6dONGsVeEOY6XH9O99Coh8y/PE2Nf4yNrbe+4IIkQogEE1EJNS
	huWCxv6dQcI8640FgOvSovXYm5KC8fM2kF+2HYDg0NcN9eG2SBUH3CuYCrS/AjLMMgMJrI+Md++
	w5xssJXKWobr4XYknfMM4CuPzhvsvNHbhIsqO14LHLAp/z3lNdMNGxQNRzfkuqU4fa9LEqapemR
	aqfZN4o9hICl61UW4ISaC4RNihwqriTRAPwpxiQ9TZH7LMuOSkkhrDhatHJh+Vmc/DtjgwKLoCz
	KmvNN3mJeU5ZnDV83bkvmROT8jK5KPRti2MzTsZsvFt420Aw==
X-Received: by 2002:a05:6808:690b:b0:46a:746c:2d53 with SMTP id 5614622812f47-4799c917825mr12518467b6e.2.1776888171974;
        Wed, 22 Apr 2026 13:02:51 -0700 (PDT)
X-Received: by 2002:a05:6808:690b:b0:46a:746c:2d53 with SMTP id 5614622812f47-4799c917825mr12518421b6e.2.1776888171535;
        Wed, 22 Apr 2026 13:02:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb6f0b6dsm39086411fa.20.2026.04.22.13.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 13:02:50 -0700 (PDT)
Date: Wed, 22 Apr 2026 23:02:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] interconnect: qcom: x1e80100: enable QoS
 configuration
Message-ID: <ndutslrzvabc5xy56ooddkfs5jhxsefhdngqde5migrybc4nk6@m447f5sloya7>
References: <20260422-x1e80100_qos-v1-0-bcc2afe4cc78@oss.qualcomm.com>
 <20260422-x1e80100_qos-v1-2-bcc2afe4cc78@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422-x1e80100_qos-v1-2-bcc2afe4cc78@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=f4Z4wuyM c=1 sm=1 tr=0 ts=69e9296c cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=OjuMvAmBQBMAj6EH008A:9 a=CjuIK1q_8ugA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE5NCBTYWx0ZWRfX7mo447u5yZo+
 KgTqpePI23k4CXc4dzBjWd0S2Nobll3mcUJhexKL92zWL/ZcmwpMqNFSCU9Zv1RrlVDQfZWxGuv
 uydy9adJ51GW3B4PkixglKjsIFw7Wa+CjkXyDasPWj5poLj1+/eiRMBsWm0DKCYLb8sHC4MSM8y
 q7x3XMaQXgpSaBjHvTMiapfNUKqepqzB2Z6Ft3rQhB5SVZgSVozOiNrLo+3/0ixjNze8r/aPLS7
 +CWVrJZhuN7NxtTtTl/i21HgoxxNp/XgkfOdEmj9ijRMA4Cw55WomgLJm0zsSWi9K1aP8FRO7fj
 6yUMpdlaKY92ipnNMGfx6pZhoYfi7tLdFyIgdmSlReULjA52pk7vJV/dDAtrHIJck2tzmawm1Y1
 gYBGqezfngQVEx1lF6ed0fsU446Q40PRJCQ0lySM+ZzfYhZCZIFc45VIxTsX/8/dNmKIo9VnAzi
 lCCGaL0UyEB4hHcP/DQ==
X-Proofpoint-GUID: svTxRJJ5FkzEiv4Xn3YX7QbJqrvNHvWg
X-Proofpoint-ORIG-GUID: svTxRJJ5FkzEiv4Xn3YX7QbJqrvNHvWg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220194

On Wed, Apr 22, 2026 at 02:05:12AM +0000, Raviteja Laggyshetty wrote:
> Enable QoS configuration for master ports with predefined priority
> and urgency forwarding.
> 
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/x1e80100.c | 485 +++++++++++++++++++++++++++++++++++
>  1 file changed, 485 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
