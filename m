Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721173DBD4D
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 09:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779181624; cv=none; b=cGDqHnxrtVa0M7buSqfSoh2bbd4s4ofd5LSx30is7OMcpKfKxzCBOcWVXFSnSbk7GxKTYoLIiTxEa7AB3aixjfJAwVCqploAfB4cln2KorRYYQUHeuoUVXfGOGDzMRZuV4LCabmtavvagJDDn204sLM2X8QX7Or5uPE3vp+G6f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779181624; c=relaxed/simple;
	bh=/1G2YM0mi0+Na9VXH838CU21tAtS0ne8GDt3z3YbPlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LIn9RvX7MbI13NTyNH/T1lJhVQo26phHRytnp6REfNyBVO6mgvEVO3yafDzbwPd5FmMqTHUVFYxSwzX//rVqcMDCXttIKqfjw6v/TUuRD2NqFTgQedvJLaC5x77k6aTR3UzyTvCBCH4fyHKkkAOAd13dehLPdjdn+10cwPFhgdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQcLFjLE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ka1LGDMX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AQcLFjLE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ka1LGDMX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J96tkG2091264
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 09:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4EVF9b/U8+xGgbPxnxX6Uyni
	Fnd+a8L/34u03xz4KWU=; b=AQcLFjLEhH1hk/EOzBZwyYsT4r09VlvfoXIYA8N2
	rEduk/UlK35i9ejC8Fsbu3pcZHTPwI7o8l0PxLsCxVj7+X4xnZARgqYS8qNcAwWm
	DaiGbNtfLSkyFD7+YQBXWBKvMQcQbrd3g8eKjjoUBHHSI99RXJgFuVlkSB9/fbSl
	ZOwRymRqhUhPpefdyoMQxGsJLRM6wq1fgEDT0PAzwu0QII3zY6ySCw4TviQr0MPn
	NaKdOfkjbVtGKohhWKClHITZx6klG6oUCn1wALDNc8KrQflNQkU4YGoeihUVZXQW
	jsQOxdC+MFBf4AuxWW1ZeeTjy+tUlD5Q0PyhQrC3/Yc3Tw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e80rpms51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 09:07:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3663cbff31cso8663483a91.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 02:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779181621; x=1779786421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4EVF9b/U8+xGgbPxnxX6UyniFnd+a8L/34u03xz4KWU=;
        b=Ka1LGDMXV7F6Xp9yNqpbIjXTVCH1N9mOLmC0aUIb+mbdSUUsq/hbZ1Wily7+siN9Id
         2Y2ZljwOg1FU+YyXBmXFIe8R9zp9iuHOE6TtPWGgMro4RYK3qE6E9hWmmssd8WLjudsB
         4eaLgk3f6zRGVqtpv0N9SS4pLte0Zqamizww8zpTpO1sLmY85xHazXVI+hYHPIs0u84B
         kX2y4acFDzDeKkKekuJKv/aXrKN1IUHks5iVmvX/hhR/tFmutPoppU473qg0wfxTgDm2
         yYvO5h+fccsowWAmkii1ZoXrXz9sTQeUeeG2sn4uAwL0uU2DnSH2wbQ7ZuQ+rS5dwQXe
         /WsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779181621; x=1779786421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4EVF9b/U8+xGgbPxnxX6UyniFnd+a8L/34u03xz4KWU=;
        b=BUxHuAaRZMbbKs9Kh6/xLUmhZP2BZlY3LGruh49IQGMoD6bXcxPF8ssEo/e5aTRbCI
         B5EHnCiPlt+xI3FumESowxghqJyu+028kR5oknRJJfOZZLu3i+KZuu1GCYDgH1r3DoOi
         2qn8Fs7VoVdq68zQ6atV8Jmx/d2jsgNAerTjVbpXtx3vJpOS/nxIXA2lpOsSh3chKd2Z
         rqUvWxIAKYKggOXbSg48csTi/BDBg12eWxdf4OFwPwEdHdG0p3FDJe5mvNvYs469/CXb
         VYG43tXQqgM7PSqG5Q01lU754ohFPpZP/tpBsH9ci5goBnZ/Yjmt4RpngAfSfB0S17Yv
         Z0Pw==
X-Forwarded-Encrypted: i=1; AFNElJ974PYYzlH/7boHXryAipdVfAslVRPoKBqKmu5B/dCoCr0E1QNM8wnhEfS+0sskM8B+V0nvtC/N26Lz@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4wvAbI1R78VQjoFbY9lAwFnEkr191mPfnMWfjmfmY4tQpfC85
	i3blutkzkOWT7vFXW6pjjtw0RGobgbM66TKhKzYIUMMep8kIenJ/LfC/FALmg91nppTQgahYWiu
	xxjp183bxGqhDFje3EOD1+oD36zsNmIQ3M5P9qkrxuyfiL4SBUJQvzAt+jg+9MpFj
X-Gm-Gg: Acq92OEITtueOmVmDkQYEsvKirOdTU3B2wvzO5pE/87LhY5As9KEz+5NhluDmSBzubg
	GfieuiqoZIpFGsSx+d0mYMeZ70L7ZRHbcnpDQmuQJtgf7pEZ6TnOG/OH9Rv42EmPP+x4Yisc/tI
	CsrcdN07x6E4YtfCS1lkNd26cTRDlJkOAhH/4dBy9cRfZjgZPmEK/o+Sv14uaLAn8/VjqZBdi2d
	cQoCjXxFnvenWsqbvVdVSIcPqII/TRPLTX02nkqsGFTIu9KnT9rFbiJHB+7epVPLlbWLhfsuSzL
	hT2e7eYxF8XKTerhKm7YS1ht+Up9f3R8NUeworTUwJN76XsF2BYRKyKVNo1lUV8x8wENzQebhnp
	5tszLWXesGyBoP/FFvuvuRWoMv+s1xVQMFFvA+P1GJY/c8L60
X-Received: by 2002:a17:90b:5486:b0:35f:c729:de9b with SMTP id 98e67ed59e1d1-36951cabdd1mr18772373a91.20.1779181621341;
        Tue, 19 May 2026 02:07:01 -0700 (PDT)
X-Received: by 2002:a17:90b:5486:b0:35f:c729:de9b with SMTP id 98e67ed59e1d1-36951cabdd1mr18772345a91.20.1779181620769;
        Tue, 19 May 2026 02:07:00 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951059f4dsm12998884a91.0.2026.05.19.02.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 02:07:00 -0700 (PDT)
Date: Tue, 19 May 2026 14:36:54 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Drop unused remoteproc_adsp_glink label
Message-ID: <20260519090654.ubbqrkemg5lyrllw@hu-mojha-hyd.qualcomm.com>
References: <20260409181329.556899-1-mukesh.ojha@oss.qualcomm.com>
 <DIMJ0GE2UNHS.VVZVQKVBXBLX@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DIMJ0GE2UNHS.VVZVQKVBXBLX@fairphone.com>
X-Proofpoint-GUID: THoj_RlAf-yqJa8gRZ0yR3dIwf9ZmMh6
X-Proofpoint-ORIG-GUID: THoj_RlAf-yqJa8gRZ0yR3dIwf9ZmMh6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA4OSBTYWx0ZWRfX+CDF3cN6+LQI
 cSPiQKyzOEnsLkXoWwhDXLevm4ogde8lbKQJPGj5kSEVwXP9otUaminJisTUFPcS6T+zUCxyKpu
 Y13wHpcp1fKuq6yOmSOUbgVxNCWDAF1lDv+fSP5Cxc3xRRwdgW5Z9A4x4CGq76aSTrNH2PjgHZA
 9i2We/IXeeRWPnO2/r4FP4X6SeYt5aQLS7zk2vWhcSmAiMSkImgpQ8FfvHykDOBBcJ0Hm+mlmNR
 5hLceO0S3e8me51wBUV1bsk5bayqU78luOvYjEC/UzhbtonUxP0v8g39HllSV8/ZSNg3V/yQgYu
 dG3Y5DLNOooa3PGAIfGAaLIJEuOSCucZ/2C4M/AOsWxfsTP89b4T4qblBeARQH770davx+kt1P2
 RQxN+4V0b7crSiQ81qUVfC0Lq6IrPTET45lmOx7DV9IJiF7V9TYWs80tyq5ATwiR9YJMPSMc4VB
 x8gtYIFvChUJQxbZBbw==
X-Authority-Analysis: v=2.4 cv=ecMNubEH c=1 sm=1 tr=0 ts=6a0c2836 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=C6TfXvH_hCnuVcG-yA8A:9 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190089

On Tue, May 19, 2026 at 10:55:57AM +0200, Luca Weiss wrote:
> On Thu Apr 9, 2026 at 8:13 PM CEST, Mukesh Ojha wrote:
> > The remoteproc_adsp_glink label on the ADSP glink-edge node has no
> > users in the upstream tree across all affected SoCs. The only user
> > of this label is qcs6490-audioreach.dtsi which references the label
> > defined in its own SoC dtsi and is left untouched.
> >
> > Remove the label from kaanapali, kodiak, lemans, monaco,
> 
> nit: Not from kodiak, as you wrote above.

Thanks for spotting it, it needs to be removed from the mention.

-- 
-Mukesh Ojha
