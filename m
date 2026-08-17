Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787A6314A73
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 04:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786940589; cv=none; b=he+HaLqTjAY1ycFipUM4aNMuAB0V0DhRpfcNJRX960bLHH0LlZsFrR/KRUVOVzaSRKSYmgCU6s5jF5H6C3zmCZc9UtnV7cOMcG3V8Szm3kPxvbs4mzjkU+8BjiCcZQZCl8KqMF+/OrwvmlbHHvfX0Ut/UPVR+V2+wsXynbMQB2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786940589; c=relaxed/simple;
	bh=4Eq3X4KO/Ipz33FGDKM+RWO723WANUHv1aaioiwwoIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ya4VvCSuqNijNQhPlFt8fbEqHNoXEdeMSSLdPGbECGs4f7PWUxCxO12+R69p+4Oj51ZQKYh5/Lwy4Ae+NYSX2LOEIK4iNu+qyhgrWqGlV5kXjERqu5atc/uIUKsSsyV4kIvvNbsPDssSGccANfxW8prbmimtWoz9ViUxBj9dUeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pcLnJ4g8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y2KuPr4p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pcLnJ4g8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y2KuPr4p"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLCCAX4058134
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 04:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ASxHMr57CeRiHl4qluMm7euY
	Vc0vlVaWA8aqdtapJrI=; b=pcLnJ4g8fstRm2x/GdnWW2tP/k0mpFemKLTOrfy6
	LbgeUUHe+TtslOzAhJ3vRQ7mQDaLiPUh+E0KXc6TbFfzwXuRAdEdgeYioCBXT6JU
	HwNxCR0jJLS/TWO/UMZQpqbVOvtm6EzbiYKrnd1qU2+Kbb335iT0IGUjpgPqKCMj
	2IhocavzF/AgaO8LWAWIGiEkBSDSo9RedbiOODH4G2EGmK23G1lEZtc46J3+e2kp
	WShxWuQ82fQncfMMRUImdpnJMbuemr9fBfu/b5e1jN3rzYurgmNpAbeXi1nNjQ+k
	X3zY+1EnYXoXvXOcEo7joCPOu5t7tIgf1CVQbpBwU13Low==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2hd7vyyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 04:23:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so304092185a.1
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 21:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786940585; x=1787545385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ASxHMr57CeRiHl4qluMm7euYVc0vlVaWA8aqdtapJrI=;
        b=Y2KuPr4pvhWgq9H54CTGFMgyn8++/7SlMFOQSr9xr/6AkHEEAcCdIchzEZyqUNpzez
         s+E+KuNIkuuyOlsPSxK4ban7qbQSpT1G1bPr+s/4p2E6beK00sEWT7glbMyRIl7kFOGJ
         /ILda0fjhaQQ1Yjh/kLdK74gn5zYhjpYaqh8u+q2VSN5d6uYZaHlOkUKq+6Hc574Uhmv
         iX5/MKxClppDanAR6NO8vujKq7eYuEoT8EtucqsE9jvqvJgjGyJAJio2ypuSu0k+Lzjd
         rHjGGi6kWjOLKHUFLh6ML43F6BiGPN8dFdwmIpQTNoZ/A7EcrI90gwBFoHMo2GxJfn/i
         tYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786940585; x=1787545385;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ASxHMr57CeRiHl4qluMm7euYVc0vlVaWA8aqdtapJrI=;
        b=BJXVm8xNFG3ZnJs0sYWDXZtu1eH/jQQd5TDAXIlTZ2BRS+EdY6KCdtFIYN8PtH0Hui
         PCH1XUIfzMJK+wPyKXF1kMPB5XRb3vihjTIUahHmVi1Lo9CCO6Qkgfyt1OtBPUYVivpY
         hfbkXlGhNUoCDWh2JFzEk7dnR1B7ON1CPinEGg1+gEaHhXV02kGOKCCjBh/Wj/rF61Oz
         INEs0O9I9GZ7hzq5bEJ895WBD4AnBzhjtZGQzaZv+DpkWZoPOXpiMcv+eVp8kA2U9odF
         rnkqOPHhsCPrS2jjCw+uGmT/rIsFTl0dWLf1wL4NbYi57GMTwA6SRZ2oxdCnkOgLQ5lg
         q0Kg==
X-Forwarded-Encrypted: i=1; AHgh+RpSRmtKQ9rMz51EuZYXy7GvN50xqqy4ebR/E1ikyya9cQLLxhNyulWgKy90ss2tlXMFpjj/1arvifmt@vger.kernel.org
X-Gm-Message-State: AOJu0YzM9IbXGGoIMMOHAz6iS3GtH1xoIkqI5YwSp0Yhfl7aDxFL/d9/
	UNYR4UAdaZ1Xoo7MwioT0Ek4IOz6MBqCFd3mHnNicEBeBdMW+5X1Vvug/NDqb7Fjl53zmyCTE4m
	jAJVJ82FbdxwfwqI9d23IM92BEpVycEAF+H05ySXx44tLdklw4GWzBuEoHwD2as/l
X-Gm-Gg: AR+sD10RH2uutnPKnDvHSgPRrU9iN6cH2wYV3Px++ktglYHOPDYoVInPuHmy0+K39Zm
	I3mivb4w2ch5hRAOd1nUXbbvy2DKFq59zmBwqY687BqZsLEVpUtvLrf67sT2sLtLrAaiRpruAfi
	vRbA8J0JEOV7uX3gKBnSyHVhrm3UeApWae0VS4pd+8rr9Rpa31Xp2rYTHlvQeK4m6EZgc5x+knv
	p69ppEiC3+tW2wYH9bKlLrUS+gu07zs9D+9cNiEUijKeU6zaPBncZzVYWVvJEu+T3jQzo5Bu9FD
	hoPt1I8SASRc6Aatqq0zWZEz3qTrgOWLDiBXsRcUu/SZG2yoOMrR/kDUsSfqsrBPW8P1kFqFpoW
	s5ylQycUIDpOlvYyflxjtbtJwzZVeEghsV0Zpb9xrO5X2GazvhoP7xPQ+GKhL4D2WTgca9wfgci
	WiX//h7qAait4K
X-Received: by 2002:a05:620a:468e:b0:934:a0b2:9bde with SMTP id af79cd13be357-936c07ed845mr2962553085a.23.1786940584783;
        Sun, 16 Aug 2026 21:23:04 -0700 (PDT)
X-Received: by 2002:a05:620a:468e:b0:934:a0b2:9bde with SMTP id af79cd13be357-936c07ed845mr2962551585a.23.1786940584424;
        Sun, 16 Aug 2026 21:23:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cffeac4sm41308e87.39.2026.08.16.21.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 21:23:03 -0700 (PDT)
Date: Mon, 17 Aug 2026 07:23:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_tdas@quicinc.com, bmasney@redhat.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: rpmh: Add SM7250 rpmh clocks
Message-ID: <gjphxs6ixffy6hp3nbwcwbfvszob7hgfths3um2rnn7joiu4fi@4bhaf24xfw4t>
References: <20260816131646.10551-1-sreeshankar0910@gmail.com>
 <20260816131646.10551-2-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816131646.10551-2-sreeshankar0910@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDAzMCBTYWx0ZWRfX1gEkRNj44M9s
 d9ux7P6AcbCN97Ik1ClXKiRpml+0VagRShiKWeabGuIJFDUu7x0xf7bKpxcNVVQifFpSOw+Xk5E
 dJxEHXgcjmMkqJmojy6Z5HzIDQ6xQ9ndGovllUQqGvU/HaZcO1VmUgjqsoTUn67rP7+jLdJrKl/
 loTqo0d+WYa94gkMIV1dlERMTPuqVcojN8NiLf0NRlv7eIxncjRMDDNfldmU5rrWNXWKrr3v4At
 6IVScyDNECeW0En71Io+Wra466W8PPRWYFAbedpZmBYvVZIo/A33JeAk+tQDHrPp08dLre3WMbz
 3pEPVHdujRsZUp8RaRJ63y5XuCPC52PZ1kUqidG/hkGN11PsxIymK9VuVaXzoru1MEkFBBuvqi4
 +c15YXwHss+83USzb/ZszNYjeBJya+gmVRsLEFzwuwxop4ed1i6u04qWUs1weALiv4riDe7g+/y
 lUv2gxcd+bMlHpeH3Ng==
X-Proofpoint-GUID: Oat3W-VW_QqfuYygYkU49w1nVoUYKKcR
X-Authority-Analysis: v=2.4 cv=Ja2Ma0KV c=1 sm=1 tr=0 ts=6a828ca9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=ZfTvDAhhgTXKM-HDKzAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Oat3W-VW_QqfuYygYkU49w1nVoUYKKcR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDAzMCBTYWx0ZWRfX6P9t7A8CtjGC
 w/CYVhEXWZqZm5xv/OVVO02Pw7vsM8Zd5KivEN7ERky5JmFbOvdlEr6Bg+IsQ3fA0OeukplGuYE
 RbPLCThjviijkWOvMGIxgel3yz8RQyA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170030

On Sun, Aug 16, 2026 at 01:16:44PM +0000, Sreeshankar K wrote:
> Add the RPMH clocks present in SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
