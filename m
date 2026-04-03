Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1653D6471
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 20:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775247717; cv=none; b=Cgi5dvBV9k61JnZH0mYsOc/p2zX3B1VBXcmfwZT6v16MxHyOBCwzvcnbn8Tmajd6KDTGQ/Bt8wtNFDfZwXZ40S8zi4+q1xAfgv00lNFvSHn/4ox76utTvaFht53nuBbsf7Q8lpOv5SutKNE5W+KKxqh7QXFm9TzJT+NKDMw3Xzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775247717; c=relaxed/simple;
	bh=nb8Kbg44hJ39/A055cwVAxiPWEhPh3mBd/A8GJFpz3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UUYH/SlKRTTwSmrDzQ4WqkBfDdqJnj2watf9VYgeu0DdfbMf6ijsaKJ5BvZUingSQRjXzIBmGhm/dLtnJPVwQXy7+P+JvREzpYhjqSVXUP+9Yfyi2lnR0qE+4btZpSGdNDgBaiScrnodqU3uqifnh37OQk+5Tw4MjZ69ZFjnySs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K/1At8ZZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c0Jva4r1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K/1At8ZZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c0Jva4r1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633BrYJM823314
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 20:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Nka63p93CHyAXN8AJpLbagLI
	q4nnZW50CH63xXuqh0U=; b=K/1At8ZZ2LNsZ9zkXJAmc/ai3e2aT3L0iv3NvR3K
	OgMSc89nG0exb5BYXt2daylASwFAkdg7V6BjZMpk1Yvt85D+7iLdhZAYWBwBn++b
	bGrIJUCH4kgP1HaRTtS0Ksg1TGx+xGcmHMZ/KxR6EUq0lZlLH0XFcETa7XFH32G8
	t45bUDg7jVUty6buVJgxvLzGTOCDDd07duSCpty5hWAyjkliKA4F2J8NxZ39YgIf
	FxKXRMW0GzLuhtHQ/XnOgFEH6e0vMYd2b3jbaa/M41kTeqjpYyAlBDJBt1d2I6Ng
	3Sfckv78jSM8g33ySRgeorv0q/PcGAT36SIn+BzPeAtodA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da673an4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 20:21:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509219f94b0so68991261cf.3
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 13:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775247714; x=1775852514; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nka63p93CHyAXN8AJpLbagLIq4nnZW50CH63xXuqh0U=;
        b=c0Jva4r1LP9bOzwAvfzVSXjpzd/OAluulrKQGz3RPnE1KKZ4evDUJtPioDA/kvEzLJ
         s7EqTK4f2OFApRyAzFOx9aTg7ECPaipe5JCzbYMmkt3FTHvwK42ywwMotwIhuFqjc3AS
         amonJ9tMITwIByVSTPhgyJBt9isw6v/LS3Lca6tjERTpdnjJkZ++VEhDBzzR/Xg5Ccfl
         WXNBG5qxDj0qYfbJcLLnuS6B32BE9O2KqTelj7h82oUoaZ5/DnJRyPhBAKYXSIMERGz9
         PILlHoA5AYpzmOxCCXULTn7cGTAwiV7iuTXZi3Pn7UGdpN622gK6pqS1EQjVX0cyJyYa
         yFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775247714; x=1775852514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nka63p93CHyAXN8AJpLbagLIq4nnZW50CH63xXuqh0U=;
        b=Krdh1+yOjPA9kmK1ni+kP+7WrmWlD72Co5pV297ufjn+hxQfRRhb0G3Fb3a83XOuXZ
         ZbZJ54M1GiM6k2PIQUQanOtCxUhk4Ci8bREn6pF2/G6iiNED6EXuB2MSwBmlqKWZJMbr
         K3qR6bVfAxCLb/1eljDHx0J3ethOQ0A8YAtqPrWn65+e6vQEeDrex6y3A3BoaVVFryiJ
         aZrXGEDZ1oip5nbU5jd6v47MemRy79zAApmtjT0gASHKNLWDnLLsv0etbInzllNrMWAU
         WD9t2QLDrrLz7vzpTXL3vrAo175u1cLZwFnXnCM9MFhOcJEuFnv2LRwr5APUu8kmBHRj
         hRdw==
X-Forwarded-Encrypted: i=1; AJvYcCXF8KM5Fsivfvsc1qhRoMAo/0nu5V1kOzU9LUxOh8Y2H01fQm8bOVWOXffZJhBoeWrk3M6565YItm2P@vger.kernel.org
X-Gm-Message-State: AOJu0YxaAFa3JOOzENyhzzn4NvurgkaM6UpL+m2KadmqSmhzR4jRar+8
	6GIF6LTnDqxM7xjjUep1g8z2hipBA+jOmaRryXNoPNxU7bgzndwOCPzmQ+uhHxWaaVymFmi0hwM
	vehnuh3eef61/eNOvXHcdMWThkeIiXp+JwVkfvEmL2axE4PZBba1lp9kV7BxoGhcx
X-Gm-Gg: ATEYQzzPCE1SWBZrFS7NEP6EWRL9yv1iBvMWmDeNyZtzR2x71fvtnt9d6meJcnPRC4f
	hJ4CFRpR900TQ2XE+WiEbQ0MY0T5BsvQQbwDD7g1JVbsGqa/j3Lg3jKQrA12jZGCPzCrjulBJ0s
	VYLtUNMsORKxrX01yyDL7MNSjNuyZRnABlo5ZVU5o5MvAtos+Hg63SmB60v4q0EL7vt+1P2Uh7T
	n9+dnaCrbhPOlWzaoiViCSp/bCmLsXU7nuOUePPLal3Kh1JbMVswN7Wu8fWeHaE0z0aBPgQAuGp
	4T031QIDXWqnt95HXCjMRvzG+o5iX4w4qvLPlJu1D/4YbuxHfvJ/F8RXpDzHVnSs9plnahXPR3q
	c4U3xqo++QVLtwypaDi6w7HYmrcImIaHTr13YfyQ3a1pMfQrxfPt0y6lifNglTiPE3NkYGHOvhG
	x94d7EnkScE92YlqVjubvQay9aZo1CgCaBvsM=
X-Received: by 2002:a05:622a:7004:b0:50b:4226:9250 with SMTP id d75a77b69052e-50d62a8d628mr44817751cf.44.1775247714116;
        Fri, 03 Apr 2026 13:21:54 -0700 (PDT)
X-Received: by 2002:a05:622a:7004:b0:50b:4226:9250 with SMTP id d75a77b69052e-50d62a8d628mr44817521cf.44.1775247713632;
        Fri, 03 Apr 2026 13:21:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c644basm1694310e87.0.2026.04.03.13.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 13:21:51 -0700 (PDT)
Date: Fri, 3 Apr 2026 23:21:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH 7/7] arm64: defconfig: enable clock controller drivers
 for Qualcomm Nord
Message-ID: <bjf4jxgvtc5mm4w4mqy6lnh444p46skwr4etxehx6zsz3wyhjq@l6icmwtqrvs6>
References: <20260403-nord-clks-v1-0-018af14979fd@oss.qualcomm.com>
 <20260403-nord-clks-v1-7-018af14979fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-nord-clks-v1-7-018af14979fd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=erjSD4pX c=1 sm=1 tr=0 ts=69d02163 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=0l0SkJvSUQpXNeVDXDcA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: CTHRH0gitfv8DvFjsia-j4J7cQytQB0X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE4MiBTYWx0ZWRfX0R0Qahza/ABE
 UyhpS5VOxpSboj3CHWhUOJGUfhUcDWVzv3B0NFXlGOzd5+5QVwx2heQuq8fZgkz4bbsUs9DflZS
 ZkPlmnzzMeq0OKxrjYl9s8vK8foZTxDy69wvP2ux/UvLvRiKQJj5UMUDAcfP5EZIgHefDdlOllu
 /jGSURHiXCaWAfTclWJX74qYOjBeRPt9DonTIfBN6BmCZkARMoqJE0XAf1FyZYOR2XVJWj3AFA1
 wE52Yjt1ZG/OZLjwUZKAFl3UcWFxR3EIXDb+GaJhB/euy6Psrncz/vajYn7URxlYzroCTq5G/mC
 165jyXgwJlUrJwumM+BE5TnlSfaQ9uBhLXB5fOI+WP4eX7meOjbcggqln+GxrqyQIkqrjTMfc/f
 vEAN9Q2sWyks/akBdhcNg9zHuTCRH8PKDuCTxokjXyZr3fM+3X4rH6dXoJw/aVZHaUOIzSRwiGs
 WsoEOAOATEF9XKJq8Lg==
X-Proofpoint-GUID: CTHRH0gitfv8DvFjsia-j4J7cQytQB0X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030182

On Fri, Apr 03, 2026 at 04:10:55PM +0200, Bartosz Golaszewski wrote:
> Enable the clock controller drivers for Nord platform from Qualcomm.

Same comment. It can't be enabled for the 'platform'.

> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 163b7f0314c90fc45eb6c4aa5e8faa549c60fdf7..f1a3333bb07482ef4f8b4ea9154b0f2c74587a04 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1483,6 +1483,8 @@ CONFIG_CLK_KAANAPALI_GCC=y
>  CONFIG_CLK_KAANAPALI_GPUCC=m
>  CONFIG_CLK_KAANAPALI_TCSRCC=m
>  CONFIG_CLK_KAANAPALI_VIDEOCC=m
> +CONFIG_CLK_NORD_GCC=y
> +CONFIG_CLK_NORD_TCSRCC=y
>  CONFIG_CLK_X1E80100_CAMCC=m
>  CONFIG_CLK_X1E80100_DISPCC=m
>  CONFIG_CLK_X1E80100_GCC=y
> 
> -- 
> 2.47.3
> 

-- 
With best wishes
Dmitry
