Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7FF37FF6D
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 16:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786636897; cv=none; b=srzO6sxrWdT/80X/t1L/4s05bN6bxjLwt2EC/rb84EwuihDDZ0oiyl5oXL74WwK2CGChR4TbaeFyk0v1Af4K4edqcKqDUL/p5JY5hzF6DthYfKq8s5BnjmURe3c7voaHxSl5CCMa1ROkmHfGgAWNfCa+lq5vT12S26XpDZ8PsT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786636897; c=relaxed/simple;
	bh=RusOvcBFXx6SE72ZSRuUQFYQliPeDRYlYBCL3AZMShM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnlUkNLNkcxWsWs9h0S+NDkG+vhqKx9fK4Y4f2PBEEkmo/NJHQD1Ry2BwB2pFjFWH/yYLlIxsnA73/1dn9MbJWKMb4fKfbGWJYpQ7Bsgj3CrXGnt91Iokx34B2HZ7Sbg5HkVYqpTjh/hrPS+FIzQ85ZGKAdiloK7EypiqeuIKfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UQ396+7O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YhP3l2wS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UQ396+7O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YhP3l2wS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFU1j52374726
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 16:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vrxU2QePt16cQDKb0SuC0GCw
	XAGtbpNoeaisWIEP/BY=; b=UQ396+7OVjyRMuYv5P6MZRCkabHXplnPXppfYvpu
	6PhVqvk0+5llxA5F9ONsu8oxyyaeKZM2DIiaI0WXcBuAayj9OMDET9B/k2TIYEvS
	+nN9yGMgvqFg+yhhAd6R/49BQ5cmcGHo7KOwsWskd/yv5VceoOg1Q/8x7lR4OUs6
	fCNCJsutXVITKPXmiYJZcvc1+Tp0gZeF53gq/9wcfQhRF0xTiChLpYQlXiZgtm+C
	1nmEKjZDnxvdnbXC3bImLvUE1naiMxKD3ABYCfhiw/p3dUYJLewnO1GEOv7htVH7
	mrkOlSReZvpavHbpsd1wzFqRcH+wjdnBUdzp6ecwgKz0Zw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g14syka3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 16:01:34 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-977e3b11cf3so78334241.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 09:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786636894; x=1787241694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vrxU2QePt16cQDKb0SuC0GCwXAGtbpNoeaisWIEP/BY=;
        b=YhP3l2wSdRqqt6XsG7pqyhcbJWBjzqwukfMKpylHN5gTL0qRnoToMJKStMKEJSE+DK
         6mQApJlllijAkRibz0f8WztTmTuyq2Vrn+0Ti2zPvtBQz8dbMYb0xhmvxgKN/cHoYXyv
         jD8KDeupPwlJKtCGU+E9+/yLxzNvztwHF01o/gyKSF+eEdmoq3fqYszmF6SaSz426kXo
         QIPP4TUJuQTpFxksZKSH/2NXly2ruZkGuVeeVULM/iDP+4dzQHnNYyvUF45Xi7+wi1s7
         eEU0gS/z9bUFwkfHsi5SlgYevzih98n0lAlRICeYQ3FsbwnZpdNU+vKWNOLgns9H3Cvy
         X5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786636894; x=1787241694;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vrxU2QePt16cQDKb0SuC0GCwXAGtbpNoeaisWIEP/BY=;
        b=SmV8EAKq7N867T0+KxuNIQZN1C4JX9T1GNYfDltGrUixJQ6T2StbJWgivmnaziSnzc
         svTmvTr/S72Ww8uq7Zi/e/q57IUJZCp5P4CD/j0I3EnEDccNRCAwPHwmSPPrP19XWni4
         KPxbWplzE097rxyO+4ZSI+hiPokMT/Eb9IUdyRBwdWy1LwmhQ3sf0ds0NvoW1tGKwUjH
         hYUTDmLD2/uyElAyDS8IAlye1bVJVT0aGpjtb/amsGXqsbOY0PyGY+3uaLtOBMqoOMQQ
         3ZTZG9NTyKcyFnWTcxIIwUXdHRfcqgLQLOb/IuSC8l4K2BupFNDsPISjAVgurg0c7YEF
         aq1Q==
X-Forwarded-Encrypted: i=1; AHgh+RplYmVwMhzHjRW+OmbZNDbcoPAh27O+eKXx2blaIGyAI8v3d8YG5O6k+jWvlkXPQYT3nIgbwFjOqWMx@vger.kernel.org
X-Gm-Message-State: AOJu0YxRj0ysdXE3Nz1S4daF0+OfqqJTQev+p6pEEcgrvbm3N9un8lcE
	Ri+4JbQvgFBM8AKwMeRy2jA9I6ko/lX0iOts3VD0i8sY4ie678rzNLaNgBCm53plriAessRENNY
	ls2LenxPv8/HJrKG75SWn7abP5o8yTtdAMdQS9A7Ebi6s6R9q7QZqPEhXiInnLJ9L
X-Gm-Gg: AR+sD10X6Fol1aAR/ZkvtJN6zm2YQ4jR70FHftPFsCTOHDkBCMKuHEgsYFaLm01c8Ez
	uvo6QhuYlzQsBUK7FlwpJH+vWOvYfvsyhaK9OHR5XeWE0nYShfp5O76kNhPce7IdV2BCOSTq43j
	VXQjiL5QiM/52ei5dxqZoVUl7Q0KYxpS14eGil+OjuQZGXXIYvTwanYkuYhWYu4nxKsY9dOR7RK
	fWd+KQcnXy8mm5LhpVfnmSHbQNIsTLvJtT90wYGwY1cV+aPy658xLCL88ye+p4HaBH0ReMY1pXh
	RtOekax/26r38fSClSUhlUoGgVXPWi06dYZbXqhzsH9/OPZqLmafKtSFUUJaog94hJLCjl1Irc6
	sPrTUbpEIS83Uc4Tf74wdJ1kuhi6+6+xrjrJajAJvGgoVKtAL7kQCFk+pm6Zpf4oBU+H0bhDqP7
	/vthE1vmTXxz8o
X-Received: by 2002:a05:6102:5547:b0:6f0:3ba3:7d84 with SMTP id ada2fe7eead31-76db5c7523emr1514567137.5.1786636893587;
        Thu, 13 Aug 2026 09:01:33 -0700 (PDT)
X-Received: by 2002:a05:6102:5547:b0:6f0:3ba3:7d84 with SMTP id ada2fe7eead31-76db5c7523emr1514553137.5.1786636893152;
        Thu, 13 Aug 2026 09:01:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b453a54944sm578211e87.46.2026.08.13.09.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:01:31 -0700 (PDT)
Date: Thu, 13 Aug 2026 19:01:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
Message-ID: <3zqx6nxp4wmzej3nokfggoji7nihosru6yyaquvwjfvtylf2fq@ucr235faztbl>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-15-5e0ede4a0c72@oss.qualcomm.com>
 <wjzyvt7q4vpirxclbwexrhsmcoi23hmsqbjjpfto26ofci23t7@uufz7ilar4qk>
 <20260813-generous-romantic-asp-be92e8@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813-generous-romantic-asp-be92e8@quoll>
X-Authority-Analysis: v=2.4 cv=ZcQt8MVA c=1 sm=1 tr=0 ts=6a7dea5e cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=foydBGwHzjCcBrRpJO0A:9
 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDExNCBTYWx0ZWRfX/oTslcaaTcGU
 TIGgoACLD2n8fa9ZuKE5+fDqfIoe+/GI1vGNB8dBMUXcpHLmZQx1RoGLSwe+9oONO77Y/pgQevk
 1cIP4d0USA7iUgWMGThTjUgAUgHi9EoXV4xpH/oQtvZpydKOoH3wXU04nNgKz4WodUqaUG9tzNK
 WrG2el6PdYyY05BiUG5iiw2ed9j9immg+NRlSQjHiLNYCx2b0PlR06dAYt7aWsp0S5OeE8mf9SF
 bNMR2jlxTCP/P2I8NXRaT8TYd1u1cmy9Fdiwz1t98++ZsIsyDuI5eyuxksG5Dy1EmAiBJlnuGTv
 hVTEQxuRQFdUjoknfYVlZmvm1Q6EnGql+eWt9eDpO+ie784eQlXMMrTzidpOeuZ1YyVTFMgtN1q
 5glJpkioOxuRBi0YpdfcdAINarkBobeUQQVIzj4vYhxB4gCozWsWrFh1F8T/HHHkbsrsCt8Avu2
 9lTTznBFybm7SUNcfmg==
X-Proofpoint-ORIG-GUID: TaKOr6iUq2WLUEZnyVWOV75okB_IFrqS
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDExNCBTYWx0ZWRfX7YQljSl/7bA4
 IcQVvFo7GoouTk7avoOCZAp0cFDZABdQCDe+DQE45bgNyO+r2IXwKE4kM4ojh7GFEt7+9XaHRxg
 Q0DREhpY0/JRc/CMPf6F3yFHzXpylTk=
X-Proofpoint-GUID: TaKOr6iUq2WLUEZnyVWOV75okB_IFrqS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130114

On Thu, Aug 13, 2026 at 11:44:28AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Aug 11, 2026 at 04:13:40AM +0300, Dmitry Baryshkov wrote:
> > On Sun, Aug 09, 2026 at 12:57:14PM +0530, Hardeep Sharma wrote:
> > > Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
> > > (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
> > > 
> > > Peripherals included in this initial set:
> > >   - Single Cortex-A7 CPU with PSCI idle states
> > >   - RPMh RSC with clock controller, power domains, and BCM voter
> > >   - GCC (Global Clock Controller)
> > >   - TLMM pin controller (110 GPIOs)
> > >   - Interconnect (aggre-noc, cnoc-main)
> > >   - GENI UART console (QUP SE3)
> > >   - SMEM, hardware spinlocks (TCSR mutex)
> > 
> > This is pretty limited without any storage. Does it NAND?
> 
> It has serial connection. this is enough for a start. At least one
> communication interface is needed for early upstreaming.

Yes, but then, as I wrote, it is pretty useless without the backing
storage. Also, it would be nice if we new the future plan. Is it going
to stop at this point? Is it going to be expanded in the next few weeks?
Will we see a spread of conflicting patches 'arm64: qcom: kuno: add
support for foo' with foo in 'USB, PCI, remoteproc, NAND, etc.'.

-- 
With best wishes
Dmitry
