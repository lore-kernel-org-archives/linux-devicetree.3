Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B2032861F
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 15:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776871516; cv=none; b=rU8W4vOrnkCoglPuPkWcaAWgOtcqoY7jdzQ4eOTVGwF0QrbWvRHi6tGRKOF3efRf47OX3HqBMMJ9DjuT9NjKcTRxliyRHDUMi2PsrouBRS4mjZ+wSzRpkrNe+hxfQfpSR18VLTlVhO/5/hL4n7yINpiJMOi7xaJB7NThiBhiCZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776871516; c=relaxed/simple;
	bh=W/o4CK/M62/W4UaDTIsuYYRjmgttl5pkwqHmlVa8Yao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZrFA8fiUpOsHxrU6qVV1ByMmHGdEeNilupUZqOgdgx9vBwhwiHbodS1n6EvTX0ikU0m/kYSkcgrgbMjYPIaRz6IIs+2ULNe2H04fgtTcrM090FPKDxEzPsfS2KimR2LkENTSLSkhREsDfYKcOD2tAG8WW/mvBhtrtw0GftuyjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPc4kSjK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NxfZXHY0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPc4kSjK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NxfZXHY0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MB5jJY2000983
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 15:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XBjmt240DJA0WcHkbd/6a3tL
	PkKq8fZWKUi6P5JuDHg=; b=hPc4kSjKwiw6RNRSChLJe7eo/HHjzvGEqUHdedtH
	nl4KzpMt7sAxWIbK/rQ0fJRn8ydG3l+G+iVgvSMOuOXIQcsz8om4ZjSLva+7heRt
	aA5OsKjTPn1pp5ICPtPqS2KhkWDyHI7lhZC9KxfhVqO5RIie8oQr4jogB3J3NAfK
	QZiUEdI9JGeeTmk90huBd4eCK2TwtEh5medWpjOM/stcEC6dVNtDmusDtMk2hx3b
	YtPC1CrCq8iHecgbwnUkgUQfoKTMKwoxrZ01DaURBiyMiLpggLmpMfBQfRQWhd51
	ChzuBCPhnk0WvZCjcECD0pFddiE0AZdbTW/bIIoazRFDLw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfc3nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 15:25:14 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-60ff08dfb37so2714668137.3
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 08:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776871513; x=1777476313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XBjmt240DJA0WcHkbd/6a3tLPkKq8fZWKUi6P5JuDHg=;
        b=NxfZXHY0ZAy3O+ZzbBbv2uviqlSTIVpYu1YQGSWX2VrQo+uhPNpZlO5tSm/oe1tOHn
         SVjkh/pEYL4kwnRypH5dEpQvqmEQXXibInyqXtFQwnwjFvwHpfcyomMS8yOTwDLDwgLr
         xskaktsDcsgdLus5GYq4uFjG4y0XJ5KIHMGBata/XahjtSm+HJo+retFCHJolQY1IBl3
         wAMgnrCajhJqi/8k8Xl/Jd5jH9yM6RAQNR41+V+AZoQYzZdWdURiJMxO62URbsZV0uTb
         pNY4cCuww9AhH3fU02zHv/cczyna+MVZOvzDovu2Aby2EFaisjNiEu5gUNsFTTJ3NTxc
         JeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776871513; x=1777476313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XBjmt240DJA0WcHkbd/6a3tLPkKq8fZWKUi6P5JuDHg=;
        b=jkm+PAfP2XGkZvI+6D6LC76c5qNAT+4tN1/zpaz4q10ClBTAMsVsr5JnaiMeZNTXOU
         FNhVa6/HOSRYC+JuVeDq0lqPIJ5+hlxUclIJhrwrIrRTU5Ri3ZWKxyJXLh1zU1z30UYf
         tJEBSt2qWtkDO6hHH9ncHpEqUOdEPn/ZunsRomr0kXmhgt0H2YhYWFInaqT8u4k21PYN
         1QpZy1F5bBY2Umyc6ZW8+v45DBK5EslhNTsaJ0ZyKmBIVH0eREkvznv9qUwkCKO+S2Vc
         dNJKq6yAG1qktxg4qloQmQbLxq6Ut41cLTulyV+CxbsUKTxSXJJqiC3B6c+1CpQ2jm/J
         46BA==
X-Forwarded-Encrypted: i=1; AFNElJ9RFix/Y/noB0zljFmnLyNTNNZCpVxNANUDnXlRotfCyFIM3Y6ELnW2/vjVQicu0aMR4zkPh2w3GBJH@vger.kernel.org
X-Gm-Message-State: AOJu0YyItyfSs9urbEElteGRtJGBYRdSCmaYAIIHWmRHVvP5qJ/FY6n1
	8rW4ARI3TwEFY23Q/5JklOb4+VX/RuO9O1XJyEDNzUsxo/ugMeb1YR1N/yKyJ1NCnxSs47S7V5Q
	8VA9CCZWCOUxirgFYol5NUFAKpUjc/pkuyvLP4kp+40uTO8aqATSgjDijfW4v7Bul
X-Gm-Gg: AeBDiet9MDBhUHspaeJxLEm4vhqQEsiCK+2+l4TcLw+sd3cKuEhcDilkXcHDFcnQkaU
	hsOIV9Sgylyp/dCJwt2POAekqk14hHS1UnvJe36aKN6kbEYIxEd32npHv3IlZEjZe233yx2HMmq
	IEGQfpdyhLtx0SM+zSF4dFgAzOk9fEPyPBdwQvZmJOW/CsKUVbMvb6msoJCBki+BOF07mHKdvEc
	862kURTgyH7FIItIHASFjKA3W2UD6DF7gZoTQglV4QSPrG3PQPFaEmXmNtGzFja5IthxbjdKrCx
	IGc6/CZDe6FJsBBB/LGO3y4DB5qdcQzh6cZpap+e6sQ8mQEwwMH/HEkkKw/kISO6nZeIuREoY4e
	eV+seM93W7Jucv+ASSms5wsIveuO7lsxVUzf5AtHpJQdpxyip3eqkXodBA0xpsdbgAys/4CUbcP
	ASGjtIf7rvkVO9/kHr5c+mWg36D71tXapYxT8E+W1lUPUK9A==
X-Received: by 2002:a05:6102:5122:b0:608:759a:53bc with SMTP id ada2fe7eead31-616f1c595b4mr9994379137.0.1776871513023;
        Wed, 22 Apr 2026 08:25:13 -0700 (PDT)
X-Received: by 2002:a05:6102:5122:b0:608:759a:53bc with SMTP id ada2fe7eead31-616f1c595b4mr9994349137.0.1776871512472;
        Wed, 22 Apr 2026 08:25:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ebea2sm4416197e87.76.2026.04.22.08.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 08:25:11 -0700 (PDT)
Date: Wed, 22 Apr 2026 18:25:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] interconnect: qcom: Add interconnect provider driver
 for Nord SoC
Message-ID: <l2o2g2gci5o5wzfhxln323eym3vb6xfaboff6plfg42re6hc2x@oygjgy6tpxey>
References: <20260420021351.1239355-1-shengchao.guo@oss.qualcomm.com>
 <20260420021351.1239355-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420021351.1239355-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 03pmh0qhQT5bjFiVhZlgr0B-ZjGbm3jr
X-Authority-Analysis: v=2.4 cv=fozsol4f c=1 sm=1 tr=0 ts=69e8e85a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=wvzT7jLtkUm77yG2w9UA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE1MCBTYWx0ZWRfXxfkPA5+zLEC5
 dpPvuQ4WKhCg5Fol5QyZ7dN2ZeXXR6P1soc/kMJgDIZX3afzvdr4DjQ9CP7QPTlvpRVI7AL3ag+
 dm28SUXM4pwwiAL+xn0a+I4p7Qoy3V2+PIcEh9lb1amdsvgfkTmJR4q5h4zumGZc6ljqOarpfEE
 ChvJxY91rdB0LWFYY5LSijHSzXz/3M7V3a9FhqeJDCidPjs7ueX87XUzBUe5QCgLx/t/h8rU6Bw
 Mmp3jh0eNKMpkhZdA5dlgzg33+MfhTurH0vZMaMeXer6+88ve9ICdQygh83Rmoe5aNIEngybcSq
 jIaVaGKF1h1RKlxhQauZoH5BeiWFHx4DdP3syKim6Yt42KOnETge+zi5pMzApObb/gsJeD+pu14
 IBULOazuG1CDjHh7Vaa15/gjO38jZ44mni58l38hBjhSziraa1B2vp785sVZaZP/cKtFTKDivr2
 WAHe2fH1mJ1a3Dak0Yw==
X-Proofpoint-GUID: 03pmh0qhQT5bjFiVhZlgr0B-ZjGbm3jr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220150

On Mon, Apr 20, 2026 at 10:13:51AM +0800, Shawn Guo wrote:
> From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> 
> Add driver for the Qualcomm interconnect buses found on Nord SoC.
> The topology consists of several NoCs that are controlled by
> a remote processor that collects the aggregated bandwidth for each
> master-slave pair.
> 
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/Kconfig  |   11 +
>  drivers/interconnect/qcom/Makefile |    2 +
>  drivers/interconnect/qcom/nord.c   | 2682 ++++++++++++++++++++++++++++
>  3 files changed, 2695 insertions(+)
>  create mode 100644 drivers/interconnect/qcom/nord.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
