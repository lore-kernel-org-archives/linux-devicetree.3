Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37582D8393
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 14:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775052713; cv=none; b=gQirqsLkk5tlCv7gzAbPwvC2fNw1JK3xWAnBEuyNo73/Z+Fo6rEGN8ZOAzW6hLtmh9oJYLqO8sSNBQ0EFJPdBvfiarR0FmtpnHx+nPQ/qI8lVeVLt0Vk6KpkpX3uz7SQQ0YliwB+4t/mpL3STXX24oUea8HgTC+j8EZ6cDa7w3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775052713; c=relaxed/simple;
	bh=S517OM5WlNAAS+kBUQg/STHk0UdlVuCZkzwjcBcQMHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqPew1+3kKXU61Hx2sh2IJxblptgISoLQofp74ZbDssKuIUxsQiHRilLDSR7GHybQpm6ZA0L9XbE2naxxNWS+Fq5B0gIqLhho+zo5cQyLV/Rmh5LVxfJNVGAFdcLPkWP9ZWHgD/Oel7KWMuZkV0jaQ4dmyfJyqj2WDDGCxXHwjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c+HpWpDk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LPZIgTJf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+HpWpDk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LPZIgTJf"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6318m2w21459458
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 14:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mjtnpB4CNE6b3ELZpoYuDK4X
	mlmePDCg+17U1SlQAm8=; b=c+HpWpDkUo6J7Qz6tJ2guWXYu8Swc3Pq7ANUuYY7
	9kzfFQkp8afks1/Gk2eu+DLdsqzRRA1Xta8Hpow//5yEU7YLLXaf0YTSp8dpkoF3
	BV8NIfz7qdqucYhnFU3pcdWrQ5HyqNH0vTWY/KtL3V2lLQzhOrhRFNDwsxfFIp0I
	x+HYr3ef1qycq9dHYe/LVlgBQ6PMfte+lucW4McHp3RqGdt5NboBVOw3IvsMkViY
	wv/gjx3KKcBWEGtDMtOEOco1d2dc6pTT5qi5FrjL0oNlWEVWnCVcEC5eUw+NVGAX
	nn7iFIRqDg65O/1puGmFbtmvrRnEVTFPFzt+Zk3m/4qUnQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8uhg2mns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 14:11:52 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9518cf3768aso1710542241.2
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 07:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775052711; x=1775657511; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mjtnpB4CNE6b3ELZpoYuDK4XmlmePDCg+17U1SlQAm8=;
        b=LPZIgTJfrsUorTjIos/nppACT3uGd4KMASMMuZTag1aHhBICBpaes/HLUllKkozOXk
         ctwk3YtCb90TAbSTlgXZwYqON5QSUoLRdf7JUIlytLbojhmfyPKLaj17g/uCy4Qw0bEV
         aUkr6FXK8dpH5uu6C+LT7X1z/kGSQ00Nkv2yzD4xDdsd2CSSy6JP2/a4v7CC7KvzEkhv
         bHFRPGtwMK69lJHLlr4kDmsDEOF3NYUPyadfNk0rC8brMXxZZ2M2CEvRMsiyRKZM8kne
         dyxq2M4bywYsdhZW19Q+1WkSpM98WKkBi1jFFKu4/TibcEaPM7BnymtMuODi879WEpw0
         OxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775052711; x=1775657511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mjtnpB4CNE6b3ELZpoYuDK4XmlmePDCg+17U1SlQAm8=;
        b=MBkshIA63c0MShdSQxC4UiNHNIWB91X4HmY/qDspxMVl6wrrrc+IG/h+FWVngSFRK3
         Iyh+Ml0UzJPxxQkB/34rSA3NW1KHhKtQutrQX4usH6IfGe9lb7CHJpPNEAb3I2X2qrzw
         1xntaKmOywz/zXSTnnoXhzwmJmiCOtNnzB70I4e3WPYS0eJzXJj/ymBbr+pCvCwOvjF+
         m9l00CLsPC1aIhYVBaZwJCtzM4LgOfrdPAfObRbMnvPpC6NzUJ3/GsYxn0DQ8mZb6N+/
         BDl8rGoo0NX/zpPbaJMTUTFK6EE/Snpt0AapaAWLKXN519UeBZl2JhP4CsD+abcCqHly
         f8tg==
X-Forwarded-Encrypted: i=1; AJvYcCWRTwpos25UEnCtG6FzN7PBFObOdoW42Wlx+aFnRiqu0nPuSCYHZpEKLuDniXi42jsu1TyUCl/2cHPo@vger.kernel.org
X-Gm-Message-State: AOJu0YwntnNo1BPbjXmj0yHmPzXAcEHp3AsngE+mmy2ay6PQWH++QHTh
	3UYslFvIcnGabqt9JG4r5C2r65Abua8jBLzODITA2IH4IYZvqBsHITSFDTqCVH6l0M9DPfEH0oO
	PA4TJzfqafAJTL4GdOaafLEFj2VcaVVUudkL+kZgtHRI1XnfOXJnfyOHTwnEU+Jlb
X-Gm-Gg: ATEYQzyByeSK0ms1llrE1qwWHHkVeSsRVQk5Il2Y1htqlGG7uJ0gzYmVwixKAeE+Rfo
	J5UzVQmglvUa1eUO3NAYTiePifRqPpWvV4zr3dIypIpON0UFH9Jq7eP16SsroHM2ndWCL7AaoIx
	tfxFiG+9xCjC6/O5xUsp/6T4MfS/dHtwnGlYQPzP9K7PlcifbxIS7atLvo0YjBP8S44+HbJi4u/
	A/hDe1zrLbOaeXxkLxr7UbtrHhzn7DsACfNaCv42NBFOnq4/5NteoUPMrj0wyBsF5FpHnjOr7EN
	T84csIXK6nibsvVFFsCICzvJKpkS3Kf89eULOkIc45zloN9jJgbOkdK8ZbIPjfQ1I8CzrcQHsO9
	K3bDaFzPm0OVyf6CGGlq+6QhtYkED7qHCDCpwEPqgGwfOdvwmyN8EfBICuWIS1WDhgLeZ0fuveZ
	u5erBlkW3zJ7p4XC1BaW4MaQ0AsD4hRvAefBc=
X-Received: by 2002:a05:6122:860d:b0:566:2711:d8ab with SMTP id 71dfb90a1353d-56d8a83ea9cmr1301830e0c.6.1775052711001;
        Wed, 01 Apr 2026 07:11:51 -0700 (PDT)
X-Received: by 2002:a05:6122:860d:b0:566:2711:d8ab with SMTP id 71dfb90a1353d-56d8a83ea9cmr1301781e0c.6.1775052710489;
        Wed, 01 Apr 2026 07:11:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c4b9e1ccsm264894e87.29.2026.04.01.07.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 07:11:49 -0700 (PDT)
Date: Wed, 1 Apr 2026 17:11:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur-crd: Enable DisplayPort support
Message-ID: <3lbwog5ziomxshjg5t5ffchaiwjcva2sq5okdlhqvhxfmdmglr@aq27e6nrnit7>
References: <20260330-glymur-enable-displayport-v1-1-1543ad6dac3a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330-glymur-enable-displayport-v1-1-1543ad6dac3a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEzMiBTYWx0ZWRfX3VE+UzbBx2RV
 9dMMrohu/p8DmfNiMp60lbCiP6QD0sJ5uadvrHjITo1Tbf/oazhUThdkV5pIfw8wAjPaLQlBm09
 LGLxBIryblCJT/5k5rauW530o6CjzjEYyMQUYwPlZT1HOLIeNybv9chBvt5hP2oCiu2lJaaz6GX
 CaX8zE7XiU9Hpdj941hAuh20tzHWIEHVJYxCzYK6s7x7dXtuW27thVEViUD6wYOE38s/GxD2Oo2
 DX+wuGzma6ABRtZpP3yUbZU8vOfh85GQobOfaD9HeRzQA9Gv9V7IBeF/96FAo1sfvSWWgvR8HiP
 wPsPPgAFQSc8gIQ5qbcfSi19FAEX9OKKMHorUtwDBleh7BXj+2r97X3BSOymyNvykTIc6ggg6+Y
 W07x9x7lZmWEGzDcSQBYux8+m3WG5zAv5xoAtQlHHl0Pgp82Z/8C29wm2BSDHscUV6Nra7/13rP
 U8i4lNA/z/IYekCjMgg==
X-Authority-Analysis: v=2.4 cv=YcawJgRf c=1 sm=1 tr=0 ts=69cd27a8 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=mgjOwgaqgkQbYHjcbWwA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: e0FOmYi9fDLZy7_SZMsc-LwpoASnpLFJ
X-Proofpoint-ORIG-GUID: e0FOmYi9fDLZy7_SZMsc-LwpoASnpLFJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010132

On Mon, Mar 30, 2026 at 05:24:08PM +0300, Abel Vesa wrote:
> The two Type-C ports found on Glymur CRD are DisplayPort alternate mode
> capable. Everything is in place already for the USB, but for DisplayPort
> the controllers need to be enabled.
> 
> So enable the related DisplayPort controller for each of these two
> ports. Also define the supported link frequencies for each output.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> SoCCP support is still missing, so DP altmode won't work until SoCCP
> support is added.
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
