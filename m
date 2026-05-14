Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C693A6F03
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778755583; cv=none; b=r4jSvYPFfspgbH/9Odo1BLBFbO3sjB0p/Ry/nUtNStVv2s5osuGHk8x2DGOBXL+XnFmmEExqpXUds+iAhQswD89CXVHr3NdIdvqbb3oBMQsrmvxYn1uB8PS72VIedxJvZCzeZzsGrr4TlfpP2JNiXUpTB5cup9PiSoW1RRek7jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778755583; c=relaxed/simple;
	bh=u2yRYeTk+yXTAl1pm+t6z3kf8/ELAek6AheCZmfXdxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aFRxLGnKLWDaxa55k/2OdUMNhqL1ayNSg6DWrykWcknqMr6Kf9cbcxWlsn3fLab2sw9B6EuUkCdM3X0rF/7EiVH+HZnepZi5dJKh9hISzw1YqsdL9KRUm7mr9HDhUBkg4REJrt4/ZRcSfWeATezo7WB7EnEWuyLhUKMM80XoxZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mzVwWxAi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hKQ90U+m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mzVwWxAi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hKQ90U+m"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9k9kl3702038
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pv/Imfs1xInWX2bI1umtnP6W
	sGJ3pVBx28hlPbpJCp0=; b=mzVwWxAi4P3ygkGjm5V87OhXiOQF9dXWLQm/UzSG
	wvJhZk52MFp81w99OnxnWTY7BZkcXRB+PPOgPYDU8XP7HdqkmIwXi1u5i+Ds74ny
	ATTvaBkxCroCf+7H3e5iIA2cs9VN0mbMeSdYt4ziEEyl1rbcAPXtdtO1e1PLq1pL
	SU16meGVW6VYsvrqLGaJlxpFhKYcnyKRmTl50Yrsy/69sP9KNwj6ZOeEvva1r0cA
	V5dRuOwj9H90QFIWHCwyKoPd9YthQ7/Ft+pYLnnrWl9+Ri9h5UitnCdPR+SX0r6x
	vb3P7aXaK9Dhhxy21tUlCrnMv4UXKu21tLq3yM6rXRy77Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e57kss6gh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:46:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb3c7b989so120262281cf.0
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 03:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778755580; x=1779360380; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pv/Imfs1xInWX2bI1umtnP6WsGJ3pVBx28hlPbpJCp0=;
        b=hKQ90U+m+Uzr/t/v5TZEYpKBXJaVJH+ubQmFvx1m7hO7F4Yzb0LtQYt/depufUPT1o
         9mhWqIGoR0m4ml58jMVUxCj9ei6yveFAy4rR8v8SbUHRfiAvf50Wt9vc8ARRzLRc5xun
         QjitsdbEbMWnpOAq/gaVsyru6OhdKSPw7r+KJdf6xCA56hIUcV6j2anz+vDx+UD+j8y2
         zmEsre3PuB5xd3fpjXcX6JIdsbhbfDGMduB7ZCF+5yB6J0yrH9b2zTlrSBFMYpc3YaLJ
         FwRtbNLRIpAzGrJR4Am3Uagccbuvt/83j3uKQPVKnsmDLcc1N6h4U6OeLavlbqDEiPm6
         hY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778755580; x=1779360380;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pv/Imfs1xInWX2bI1umtnP6WsGJ3pVBx28hlPbpJCp0=;
        b=D0yIyRPUxpBLmWP48DORje1CtqlsOVTGBRcqeoQ+4yJaFpKbn+aBbTOXdujCmh0sgD
         rCyB5IHZRedO1gRVsUwSCmTn2S8gVNsHkLgPou/MjiTNuKrsHMS+55r6CZ9WCr0id9ae
         wsyLRrq0aL1Lr6Kvutd+U8JBJpX3SPqtqIaeMgtJTN8m9utsyNEmyfKcmpM62XVyyqht
         16fj265JDQAD1LCzPIyFMiubcDWLjxXYvkC5LNa89sACW7PfCL9tDXJShDjGqSF7zl1b
         vp5nMXpmS3bC24EsSiLzHTpmCvmcgyKiqAWnSIYsbHb7KLzCp5ohEB/2m3o9thPs4uy0
         b13w==
X-Forwarded-Encrypted: i=1; AFNElJ8HkDqSc4mgw1J5HYzUxQ4EAkhJiikGzv6w9ZZuKWGjpchkgap9QYLNrCWXiBT5vPW2RgfbgLO/BYJv@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl9LcTZYdTeKNuVIeFM10zmwxFVvycRBfBPzlHUZkwswY+6wyj
	k9kQOAZgVY+8xXfBwWrObWPsm5a+X3yy/Xxjjo2oFdU9aMkRt55RRWMi4cwi7mhJnHyr25FZXQL
	6P3ieHUZ5i1X1N5ho60UkI4ci2kszMpMN/uGsI9+r47UiweZuocHEc5WiTcL5I06L
X-Gm-Gg: Acq92OFa35boaOnYxJsHTeI9F3S9ahzAZbyl2S26eyq1IHMJuMlYCUdh1ugmU8dOS5Y
	Qc3Iq4f6sbauQY/okHFiQxa7mk2LbqmSevqVZNOvgYMO0kKCsJ20Ya5oi7cJa9XI3OjbYlIHGfm
	TJKMm4Y4zjAaNbqkjw319FyJ1cYgantBoP0q4NK9B6IAGMQZEqLTkiD+K9WJJzln1KAA2vMka91
	XD5eYsUVZ9OFSCj3hVvg2r5wwV5kZ1FQXWdjJpWl0nwsUeBlzpLlf9jH6q7XuO36+bviOcbb4Du
	q7S4D/cuJ6EKM8QZYfeeqFCWqoUYgVbOAZ96nXjUuRGGGWSJ7iz7yhOpKFekRYfDkubRM/5puq7
	GUfYY2ri11JFoOkC+7ofTdow1+qJl39DrxlTB
X-Received: by 2002:ac8:5888:0:b0:50d:a4e6:997f with SMTP id d75a77b69052e-5162f49dcccmr98843831cf.15.1778755580471;
        Thu, 14 May 2026 03:46:20 -0700 (PDT)
X-Received: by 2002:ac8:5888:0:b0:50d:a4e6:997f with SMTP id d75a77b69052e-5162f49dcccmr98843411cf.15.1778755579925;
        Thu, 14 May 2026 03:46:19 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a5653sm6111166f8f.35.2026.05.14.03.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:46:19 -0700 (PDT)
Date: Thu, 14 May 2026 13:46:17 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: qcom,eliza-rpmh: Add
 SDCC1 slave
Message-ID: <fnasmnyh7rf4wtyrv77lunx7spilgjxji3ejflvufouqrdep6n@uu7pkkfwkxyi>
References: <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-0-b1edf81bac3b@oss.qualcomm.com>
 <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-1-b1edf81bac3b@oss.qualcomm.com>
 <5c615bdc-3a19-4f07-a38d-16d45f318411@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c615bdc-3a19-4f07-a38d-16d45f318411@oss.qualcomm.com>
X-Proofpoint-GUID: aAUlNqarB65L3ma8MfaEvqqQ5xBy7JWl
X-Authority-Analysis: v=2.4 cv=KZbidwYD c=1 sm=1 tr=0 ts=6a05a7fd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=4NfwwHxzEUokdl6m7bkA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwNyBTYWx0ZWRfX87wzxjDjcEYu
 QJS1weLjrY2//hRqu4WWvPhcdYTSGxiwMXV24aTlKMlq850C8kcrVCBbg+6PJPMClX0dx+509Zp
 Soyx4jjIoYWt6AxljCqz3wN07+coo1PPexgzmpxIVXsb+lf6kM5Ngk605MqGIDCDMVL0ZDJgqZ9
 tZOc8vquJxn/9Nqced78i12baTR7GTFWo+cFHpi2ZOrtcPSMSOjgOKZdI/j7HAHaTvqPI+T5xbE
 VYaPOv7/F2WWc2OISbZTE9rOcYC+qZzIkJgbioeJrljkGDCHqu+b2T+31klvGThA+LgLMZD3KZf
 2qVSRJ+85wDvTeZDUJ2APuaPg0xWNEg72QwS+/k9T09zJMZSOHhAoXlonL2kDM5lsfVuzU1zJpT
 ARGSYGN2f4GFHiY0OMKyCSD838cUPw2hQx3s/vUArYIG7Q1naYH9oISsO6YHda7wUac1LUb9Qwt
 R8dEpubvLAFSo9ZlnOQ==
X-Proofpoint-ORIG-GUID: aAUlNqarB65L3ma8MfaEvqqQ5xBy7JWl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140107

On 26-05-14 07:44:12, Krzysztof Kozlowski wrote:
> On 12/05/2026 14:18, Abel Vesa wrote:
> > The Eliza RPMh interconnect binding is missing the SDCC1 CNOC CFG
> > slave ID. Add it so SDCC1 consumer can describe the corresponding
> > interconnect path.
> > 
> > Append the new ID to preserve the existing ABI values.
> > 
> > Fixes: 8300438dc424 ("dt-bindings: interconnect: document the RPMh Network-On-Chip interconnect in Eliza SoC")
> 
> No bug here to be fixed. Incomplete first posting is not buggy just
> because it is incomplete. Otherwise please provide more details about
> the bug in commit msg - why initial posting could not even work
> (although it did work...).

The reason the fixes tag is added is because we want this to be
backported, as the id should've been there from the beginning.

Anyway, will drop from both patches then.

Thanks for reviewing.
