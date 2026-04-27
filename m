Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29358339708
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 15:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777304413; cv=none; b=n37Y1RjkczxP4oc2Ku+TvZ+Bw2VtlMFQUc465PIS+mb9Fz+WmesYe7ic8SwCjwdNTjDAf+mJHoy8tTlWOjxKLNzIYecTD1ZuICcvUJFUA97xD5OjraXnb6ymZPAECeXcG214H3OY/a7/La60tCY1kvaNziJCYYzCDAs3VgWKBzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777304413; c=relaxed/simple;
	bh=T3Ob6RGdjbwoE7jWGwSxRUaZfQM2UFdEvXHSXSQziCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UlVL4eIkZ6A8pex+PW35mrFoM/mrf7kDDsZnDlIi1rLQLWzZpvUfm4kkn34qGw/Dcp+vK83kqjU+wJ5VaYuNM65D3AFTEavsZBihrRPkTpKf9SR2ORg13rV2NiH/5/rFenND/73LCqGQTnDP6lG2atLswNUSsBqgcWtyjdpqdyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LxejcjNY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U8FlmrhW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LxejcjNY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U8FlmrhW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RE9nBA2913944
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 15:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CUviyHu5v9SxxUYlb7F9z3cM
	KSeIvu5TB0UyInkwE5I=; b=LxejcjNYF46JL8CghhnnWUgn7vAMcALbuZChuwMS
	xLlo0RXzncMth5mJY6jHE1iCzaow0ZiETxNZQ/8aVDNpwhsssRV6LR1sdO25WGxs
	oCrqH8tcFwsi9sj1+4sXJdb5u52Y4HJXR/GP+nRLzCrRiM0+Opc5mfn6Otd0+C5i
	vgkLXFOo9bcZqfzKs2yiE9/yc2T/3aj/ltJEtiIUURefqpeaf9a0dE9qCVpSByDC
	nZPzJ4S4IVFCOhUpwYnOlBXDRDfqZoOHEiMwYO2kAOBZyvxIFIFJszv38+GIKlhi
	xzCJe19Zuuf3xfyMK+XHkT5y6K9ibi2Jkxa6utP+NFCc3w==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt26xj65q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 15:40:11 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-953cd6f6ebaso4325892241.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 08:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777304410; x=1777909210; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CUviyHu5v9SxxUYlb7F9z3cMKSeIvu5TB0UyInkwE5I=;
        b=U8FlmrhWEzse6S7+g/JkJ4pJWHZwK+Q7N1ilsMvuuSRUIingaRmJA+aG9zFazRlhd1
         uA9aYqVyHgM3OMjANs48wdjDUZgv46D7uU2Ft7QlErKiSXCVlecX71+qPAeJvKII4aE7
         Yb8t9CneGwBs8/Xf9iyMxlPLjD/IIfJqNE6rxOdZM5gA/oEpflv9A2kxzzGUcs4Ynj8i
         Cdvn6c8ee7s41eREpZPGDZYPKmklNFf87BM0iVc5VYzhZM21PSPP0hGmylK1Gmku5Ruy
         QGcufGUMaP4rKn/UTtZq4Tn9Qwemls10uiILL/UTrBDpwFPFWwFwUutJvNqLNZZMSBk6
         GTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777304410; x=1777909210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CUviyHu5v9SxxUYlb7F9z3cMKSeIvu5TB0UyInkwE5I=;
        b=Wc9IOq2lUStUdfnwQhAL7RMMbP3xXgmsSLDpeoh9JN60Hh2SwkyBYtw6fa/wPBqLN/
         XXrTnRpfyFt9E0rbmlXtBD4e4TnOj2cEfZLdyUWJEcP3WrTlDJ3dfwyARlj5o158lFmX
         36n6Zvjut/foq2A3hh5+CJ4iOdu0B4CtYl5E0f3HciCWLl9Qm7Jw7YW8+fN2YP05FxjI
         PsnVSpQgqGYNc0DD+jY6RtcyXB0fBqYf8yOAPNSTPgLNCdM4jTL84w3cptgkBwYaQSdx
         g0ZC4LLKfZjybS1fvGRG3I9R/rdCLhZqEhqW11pWV5xEjip/coC8qt59Lp6L8Loi04yq
         VZZQ==
X-Forwarded-Encrypted: i=1; AFNElJ9DB3qyhYkitQeNNBslmhjlWj6kTdvPVvVY2Ep93za9ZV9WbKbM9eLtJTT/Ud6db+P+pqP6828weezK@vger.kernel.org
X-Gm-Message-State: AOJu0YzEyGEliLHRTRM+CiuJ4DyLO2LdPnxU84nIkLCI0TAatAlH17Dp
	gR5SO3OAF44agPlv8tJkSyIur1Wpaw1gAw5/oqm5HBjWeN3l1Kj8xqhdF/puoCAoHIdUSx3wZ5E
	CIB/i70zk7so7KmyI3luaoN6Z/KDdSWeUeS26FA7rllzEFZehNDf9I5Zh22t807+M
X-Gm-Gg: AeBDiev9kpx4keIvS3eVktkcjFcII0FlCWYpCFoTYeMSqpwzr8ZeDodCS/BfMtkALMt
	tYvILaW43Fsyh8FVTY6OqGQYaMIutbCHhbgZS0b2+tFAZzZJzCdEIXkWgoH+LNRur20EONP+ReG
	/CxemH9FXKEme2cI1QgdgbSNTAhkYcgpOrWPlmyS18eSoeMen6LPUu4WpV/CzMSto+BGpKgS7kz
	cozebyHyrjEhslQJPc4ibnbap7+IinD81fnxtYmcHgjfuvnahc/a8rMCrgQ6XEEEM2en0JpISYT
	SeHh3TMvHZxCkmjiwHrnck0e5xTlkLtUr8mF3Sq3k2bzDG0Y+R5PJt0crYZ3EPXxH52aXeTwQBm
	qNXygXSRvpxoLtVMH2KVjGymxTNZV1zoO4jMHXq17C08DaqowcElknF9fPXN13BcdjmeVOIrAgD
	6EXn/vEzCQ6aYpYGKAyaJgtOLgGllUmGJSp2HRy2yzOMok8g==
X-Received: by 2002:a05:6102:4415:b0:605:5e1b:1d2a with SMTP id ada2fe7eead31-616f68d398cmr19144017137.18.1777304410442;
        Mon, 27 Apr 2026 08:40:10 -0700 (PDT)
X-Received: by 2002:a05:6102:4415:b0:605:5e1b:1d2a with SMTP id ada2fe7eead31-616f68d398cmr19143994137.18.1777304409936;
        Mon, 27 Apr 2026 08:40:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb733847sm70648481fa.34.2026.04.27.08.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:40:08 -0700 (PDT)
Date: Mon, 27 Apr 2026 18:40:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
        bsatish@qti.qualcomm.com, akhiverm@qti.qualcomm.com,
        nicolas.dechesne@oss.qualcomm.com,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qrb2210-rb1: Drop modem support
Message-ID: <hfvrinoiv336g6zbqsxish2gyux6awgwlk74qh3arkkptligyk@74qfh23iaxxf>
References: <20260427112833.1160332-1-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427112833.1160332-1-sumit.garg@kernel.org>
X-Proofpoint-GUID: R5JilY-DQo4DsxAL2kLs7aHMWVt3cDhN
X-Proofpoint-ORIG-GUID: R5JilY-DQo4DsxAL2kLs7aHMWVt3cDhN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE2NyBTYWx0ZWRfX5kYQ0ALQLzyE
 /5YGl+HXFxbYhPLcva01PysXQs4/tI8VcY3PshP0zRfhe2a4TeqRACg03mSwyChqPhGiuWYPi/L
 503qw1C0tMViTKTakCitMJjj3wSskhiP6ncJx/FWkYzoNjSgjVbTRasPQbB44SV8UDQL5PEZTtX
 2KxY9oZh0jsshOOT60FrOQNo0dsv5OLZ7adJeh9NUEVjL0HFSdnaYduICtQqWD/IhP+NCvXXWzd
 u46CSOaffP27ucXeBoYZP5rX3ci/w2ytYpW/PcjaXmvQAO7iYjJ8R+BOPUa7c3089mrLpwjZUo9
 GMCnjpqo/hu/yB07NMfGl7AiWP1anZ6ipaKJ2PsF0vce3Sv14zmr3so3/pgqzrt39dgiQqm1Qti
 2x0ROkmIp4ifrC3YgzpgzrGpja+oxx1QhwAqEl8v8QiefP3kc5bRGKpH3ZGXdl55ihPodLkjM15
 lkiXcpUXQaKU9E88Rbg==
X-Authority-Analysis: v=2.4 cv=FM8rAeos c=1 sm=1 tr=0 ts=69ef835b cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=tTgMjHgdtQGs5P9gr_gA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270167

On Mon, Apr 27, 2026 at 04:58:32PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> QRB2210 has modem fused out as it's only available on the mobile variant
> which is QCM2290. So let's disable modem support from RB1.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 5 -----
>  1 file changed, 5 deletions(-)
> 

No, this is not true. On QCM2290 the modem DSP is being used to download
wlan firmware. As such this is wrong.

[    4.186507] remoteproc remoteproc0: modem is available
[   14.811564] remoteproc remoteproc0: powering up modem
[   14.883766] remoteproc remoteproc0: Booting fw image qcom/qcm2290/modem.mbn, size 8881672
[   15.505182] remoteproc remoteproc0: remote processor modem is now up

-- 
With best wishes
Dmitry
