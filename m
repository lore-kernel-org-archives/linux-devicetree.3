Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A59A34D916
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 01:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775699688; cv=none; b=Tj1yu5uvhTUf+ZjYOlwuwX1C8H1NnGNFEeWV49nmp6EKXozoj4oDCfGlEztME7+hkGONl41/66j1VncHb5k83dPVTNYGgTBbx021SZmwJRPfvvIFwqJR9TNTeehrQj6LZ6WKe0of/7z07u62IC6riUZHqXUgpc3nqn8LomaBLnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775699688; c=relaxed/simple;
	bh=4W+AG+ac+JQIDWNhwfeu0QfLCRda4qkicwneics0M3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2gXSAGnRcpEvlsz6aVjoZ5WOjZkp4cJII5844zbWGkMuEtZs0g1FgSJCFLxu1+02s5tEYeJpYfhTw3+J8wnA3JA+p0XCgJxFUzAh8OYQKeqgbiOKutb4dgfH/TsxZkeC+NcHzdb3GVlcXrXHlKr/nioHd596yGHiuStKmUWW5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JzAT0BoW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=By75dVCx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JzAT0BoW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="By75dVCx"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638L2E5C1472114
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 01:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c6gJQ+eWHrSFA5vMe1GqQ6Bc
	0hkFIJuYP5uJVGYzRYw=; b=JzAT0BoW/EgwHiHxCtVfjHO+33h9PR2fTv/pQp1R
	c/SaFEe5SOdxDPYfrqcCcgD+F9ORmJQPtqkDUKrM+YCYbNo3SkcARZvMXGmT9Mxh
	Y6OTQS0PnB4thm/Z7PbJdlY8ftvAZ74F62qnKuP+tP/q2q6ZCKPECIWZhZ5RdKWZ
	EugPZkYSfcCFli6XsqKkQSTQmij8Z5+y0+OMd+oq5rt0WqJc31Iff9BZFC1M3dAg
	NLjiPeXbE73ALff6Tti/oPAhoz2NzPI7IMZRhCVua2GK1ydZRPYJNw4LqD2N3/z6
	yLIS1KPIin1xO9JBbY0RnaDipT7v91zqf08/LD7Nr/Ac0A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddrphacc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 01:54:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8a8ea3f1becso9640636d6.0
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 18:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775699685; x=1776304485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c6gJQ+eWHrSFA5vMe1GqQ6Bc0hkFIJuYP5uJVGYzRYw=;
        b=By75dVCx29qoY7dsfXp3PydGAU6qpv38kTmdqwYWx7OpPIVG6j+cKmiYG0uUlfzw2F
         vxu94R8Qd/bMtWwDANOrQFTGVejYqxqp7GIPXPKuWBcqRXT9rz6h/ilKZ2zjH5AeDvMJ
         0suwyYP9JC8NEiiNlivQ9gGVm8njj0xStmy3izNKO9WK+Y2ckXwwW5beao09Cr98gV0O
         Iw2ICR3QtqgXY3mZPV/V67CEri1fV5OMYcBBnob4U/smHhLMh9gQoBmO7qGhDg1cSN9M
         S8p/d9mVFK0owuBbn+b6hksLJ9Q0XNLRYDUcG5RV9i5Z20tU3j+aJEPawel6GBB/J7Ss
         tu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775699685; x=1776304485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c6gJQ+eWHrSFA5vMe1GqQ6Bc0hkFIJuYP5uJVGYzRYw=;
        b=iFdLXNKxAMZsVQ4nD2O0VJnh1152cIvMPojT19x1lc+tnhisycz9spr0nvBZt/drJe
         QtO+QFRz1JXiygJ+79JiFifWzuSOZZCcGqktikfCQrAgPpJ9iKAcnWMEP+9RYN8qquMx
         glR9gnnmFmm7x2W+y/zDMBhgPckrOkeek6NiYrxgL2UvYrh63JZG6EBjX1wTJ4mBDaZ2
         +C07hcjoGOOrn/N1uYMjzyfVJxn6NaXAz7nNh0kK18zgGhDQFphZD7qtofxL5Jtp35oX
         oxRh+Q1nPB+oiT3LVPlBrsdtMTHyCr7SD92fqdYxL14d0fo51WmuL+CCinK0AKtiIO3o
         rZyA==
X-Forwarded-Encrypted: i=1; AJvYcCXU2jtahiOmrG3n4a+zbXJt/7Q1LIuAcKYLJfR+bqyNczvlsRzZp2AbZuHBoY6qJLcRV8izdqHLkF0r@vger.kernel.org
X-Gm-Message-State: AOJu0Yz73MLTmElbfRl1NoPWYxo7dQZLqpxh2EVAEBjJL530AlAF5HYa
	3BhiDXc+6VLw2Lm9Pre7RW6U2jy4FBLsqWTaHbww+ceDzdzMZUlJJeZIdbZxziO4QTcdfxOmHLC
	1xornpHTSe7IkoXa4cll/saw0VKXwupAnhdYcFlSal9X9co3rzxut7U/18h2sBgBP
X-Gm-Gg: AeBDiesciSkwZ7Ba6ehP7ZLLTg34O6Nr2b24AF3z/4Y0vqkAo1tcNa7W9kYmTpggUM6
	qF9kb3xJdbgfNyUhLgnannSnSXBuDcwcossZ8JM86x+zK/Uvv1TICKT2bStZkZuBinbIo56YObW
	hg3f9pz3IdoEbNlCuk87PIQn55TTUyCsbtg1hEX38/BXuCKf2zEq5NBWnsGhBkIKg1S2pVUgiJY
	LNU/1N06IiWB5jD7ZYtN7nj5kDd+5DF2E9Pf/Qdghql1PX4AZNwB6bLZ3h7k+QfWUgiU1MQn7f2
	KMqnMYPnAkpUSeUze4iT+ImXVdFpDMz2yOdNR7Sa2fuha3k5HPKtOG/NshaIc/o0tqQ37MVF6VI
	0zYOVBbz5LMJp7t5qM7ErhqP1ETdo2+6m3cygyargseZWw1xeBXbG6OlUQ8xEptfvSHMQH2kjmh
	X1ISK02XzdxIyYRwiS89/NAKUqinrBhsT6IXA=
X-Received: by 2002:a05:622a:204:b0:50d:844f:3b34 with SMTP id d75a77b69052e-50d844f4107mr253617321cf.51.1775699685266;
        Wed, 08 Apr 2026 18:54:45 -0700 (PDT)
X-Received: by 2002:a05:622a:204:b0:50d:844f:3b34 with SMTP id d75a77b69052e-50d844f4107mr253617151cf.51.1775699684772;
        Wed, 08 Apr 2026 18:54:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9534asm5067355e87.9.2026.04.08.18.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 18:54:42 -0700 (PDT)
Date: Thu, 9 Apr 2026 04:54:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH 01/12] firmware: qcom: scm: Allow QSEECOM for Radxa
 Dragon Q6A
Message-ID: <wj52tzstbprop7emg3t4vjuhzq5mf6o3qddzqx3hdzz6acdtop@jrqzgjmdpabi>
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-1-14aca49dde3d@radxa.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-dragon-q6a-feat-fixes-v1-1-14aca49dde3d@radxa.com>
X-Proofpoint-GUID: efKPZKRjXrwR4_iUdG6I7V4wahr5m21P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDAxNSBTYWx0ZWRfX3Ou/Vov8iVOG
 rhShA2mCqXhb6tb9imViC7QJNYrQ5cGOa0sB6yQ+OkLWw/PxgoPYkaKCr70xaTa9HtGfNciW8rl
 RmsVdeb//bfybl/aKbdJBJsRQo6MGZtiDrXAcZLAH1bu3uwOOb49e0r2uDc5+kwWXgrheHseLDC
 bvnqjY+p7vfydB4Bl7WZniy97ax3AGgyfWeGkrePz9be5q6yUn4pAov6M+qOtiNQeVM1n2IgVQH
 okH1xawiX0jYZ4c6Eac9vywYFSDG/9u9XRaXghEW+3xYKWWQHBkMhLE61taa2ziDDlgJM1/Qy06
 xe5XDXtVf5RQ3FJtmnTzVlodgoG34p2/Mmm1TcjAqCOvNqaBDJ5ZaX+1UqSFkKVQ2LuDliiLPNH
 be036FpCASGShH5GkuGUjo8azzj53jkYWpp/jsKpZxf0pYe02I3LEmLu2jIGrLJe/dWaTjCmXLK
 MPSj6UL0kYIGfp4fP3A==
X-Authority-Analysis: v=2.4 cv=PMA/P/qC c=1 sm=1 tr=0 ts=69d706e6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=ksxQWNrZAAAA:8
 a=EUspDBNiAAAA:8 a=eLdiqSQfWnTWMVjn2-MA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: efKPZKRjXrwR4_iUdG6I7V4wahr5m21P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_07,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090015

On Tue, Apr 07, 2026 at 11:19:53PM +0800, Xilin Wu wrote:
> add "radxa,dragon-q6a" as compatible device for QSEECOM
> 
> This is required to get access to efivars and uefi boot loader support.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
