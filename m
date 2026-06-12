Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958563F4110
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 13:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270474; cv=none; b=nOvg1A3PJiqhf2RASqkZNLJX1+NI6AxRe5orp5moYnIGnnurPtr71Vz7Y4c2K2UFiGANy8tspyUl+ehhmMEVy/RN8B3O8tzAhsssunJ+JlS17PSS7Gg//EqMN4IfB22BeLa+Ddk4TdGQoUYzXV5OjjVenUWXIvCp1D8Svz8lMqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270474; c=relaxed/simple;
	bh=vy9Su2m4DmwOctrPRiAwTZvTKMsMba4B1kY7ipGYKQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNsIgC65dEdRjQDvQpQeDeqaFio3JbBl/HphyjzO/HSHHS/q5bcKywUoWKkQb5NZeVtwcNYTH6Pdn8aIkvsKJzBGezKqLDRzZ0dvsIfsoayL5B5U8h53w1CNk0+8+O70IdLtnUsl98cCS/scWtAISiaV3ncar9etXFTapWw2m7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W+qV7bgh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hnHulXb1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W+qV7bgh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hnHulXb1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CCiqco3692771
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 13:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XukqHtEo3vmVMvPKYfaF8yIm
	I5hN+w7/56VOovRhwkw=; b=W+qV7bgh6VpTDqSKi3W5BsAs0y+R+mGi81qqxv6o
	jW7p3uTongRt2LCPIzzgwCL6i5gSrIsyGvHSl6vn40INI1jBz0AcOw9VAPB4ipuY
	9gURXwd5Lo3GifuHaWNgzGKgyfx/p8P9r1wHLgxFIf/KRW0Vwq1rheLwIq1VV1F8
	st7FuXsnxF1+KjAyJTn4urrulrhH/iKnt1f5GjLlT6T52z1bvyJHww2uHTEya8/u
	X1hKSuuHGJXeCAsBfFJh4YuroF91RImv+XD3TRrB4q+fHSiak5UFRsRc3ZJcT+zd
	cMPI5RMLg1y0N7oem2+zNNgNCkSPmiPnNuQRLwiQ50lhbg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r5txgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 13:21:11 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c4335eef08so1009980137.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781270471; x=1781875271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XukqHtEo3vmVMvPKYfaF8yImI5hN+w7/56VOovRhwkw=;
        b=hnHulXb1TP4d7athtv4W2pYPy/60J7DCXlYNPVwCB2eFDULdtXbijZnEhTZ+dHK1sH
         QMHQ1EHkzbac/unduYRrCW9LEefBVylHc4zIkBYBRM3fLeSmpoz8Ou4KXI1H9iSPed96
         t5LDabAZj9Cq8/b3hckeJ7lF842mxQjj7gHSVWwuNO7znJxNzWTq2DIUgsQaEX6hqilG
         KivM+64hjQMBW+F1ROipfhAgPxVhPVwwhCD9ytll8ydBvJ91wBOfzP9kRhRVp8PeW/n6
         k0K6e7YCrU1zVnln+a/P8UJfW70F7gBwOxkpgZ6KfS7IDoavo8KGUUX9/+WeB/thwVB1
         KlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270471; x=1781875271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XukqHtEo3vmVMvPKYfaF8yImI5hN+w7/56VOovRhwkw=;
        b=loSrT3CvfmlKk6BbiuJAzaBvf9ULTpOo5sgjSiDm9eZ19NSZ6F3xahEunyN5dMlLpm
         17exPmZqhPVLq16aaZopo+1JQyhDE7ZKewgIuUUxNE0f9j/Q7B494QsDwKbosF7X8fwM
         Ft+MeXTjZA3Gd87KV8hqhczie4qTSRmPDNKvUBkOj+swhLuMxzCyPOShekd5i89VeFrF
         pWl1IYWQGtK15DnP5ncQA133q1u9Sl9sb2N5jsB+M+7RlVBrUp6FFTPFiwcEVaVqAHdN
         3UemfTNRX7vtVm6Xlke82noR28Dwm4/CeV0ztghqj8l5fwDvbWgjOxfghgUQSB1LnsHL
         Jfzw==
X-Forwarded-Encrypted: i=1; AFNElJ8UCfdBRur813wravhrlncY/OQgse+gF/9EoO/k7ATMStD+WR6o84REuUxbeTeHfr9eW26t8KBXS/oL@vger.kernel.org
X-Gm-Message-State: AOJu0YyE6eYiA3ZJPu1nXrfGtK6bfbRL9ACoRoR3NAs0nEZfqpzdTiGW
	l3eaKe5h8LM1nj5zJwC8nzDIfg0YIt4IkGgt4sE8xVzA8VN9GjvHnDpNeakeYCarpxBYpiGl3BV
	/bYRk43HziViJGFb0j0ZYFVvWPkopBIdL/mbViS/EDeBlhHyKTjqi1ogiaR2qbor5
X-Gm-Gg: Acq92OH2lWheV457kJTEHleYzyVNNV73Zh9p5fDs24rQ4BNmUkuKN4CWNh5xAGyZLN7
	WMzPgRU4hpgYJvWW1WZ46VKNzwRVR0QT8pQN9pfkyU9rA9szZvFcpysdw7kZmii6FPFZpbC/T3D
	AfKAmLZs/P9PZKiuItZw/SRWxZkNA46ecn8G5kGaQXrcKqSThUolC2qf9D/Tneloe05waqIYK7w
	46mWRv/BbG7aCsQCt2NbJ6Oi7ydpPNaK9Jc+z+PB5HHi+EEEMHgDuljpI30CNjyOtOZcGD8MUWZ
	lnGAfIgN97gcFmyUoroI5A4YwbNSOn+6/d+i8UL7v6qlJ64aVTVhu8hil5sJeFtOYshUooxR0MS
	PWaoMTrhJ5VwzHrDWHXbfSis1Eyi/9biBWe871dw6+mM68mEBW4YuyCxuRoH9SQRMVIed2jimZN
	Nv1xaL5/dY6UEWSLkbDwOMp/NBxSTT1d27UKM=
X-Received: by 2002:a05:6102:449a:b0:631:4e9a:bab with SMTP id ada2fe7eead31-71e88c5ba68mr1408937137.18.1781270470820;
        Fri, 12 Jun 2026 06:21:10 -0700 (PDT)
X-Received: by 2002:a05:6102:449a:b0:631:4e9a:bab with SMTP id ada2fe7eead31-71e88c5ba68mr1408894137.18.1781270470445;
        Fri, 12 Jun 2026 06:21:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm5867081fa.19.2026.06.12.06.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:21:08 -0700 (PDT)
Date: Fri, 12 Jun 2026 16:21:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Sort pinctrl subnodes by
 pins
Message-ID: <yldq3k36hyzwz33lmw3oj7ix7uzs3sl56wlgo2ho7sosjge6hz@64zpgubj6j7t>
References: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
 <20260612-kodiak-cam-mclk-v1-1-fd294ff003a2@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612-kodiak-cam-mclk-v1-1-fd294ff003a2@fairphone.com>
X-Proofpoint-ORIG-GUID: VXeTt1lvCP1jLtG77f6VWAaohK06wlGU
X-Proofpoint-GUID: VXeTt1lvCP1jLtG77f6VWAaohK06wlGU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfXzbStAu93z5rJ
 9lyU0DzlLaviDVDQ77Io04CrETMiwp0gElDZ2SVhjxK1t7RB/kenPXYTnPsk0Z6pogh6S54BAeR
 6hTUXklbhZaDYXk7AMtiv3R6Ke5jDrI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX8qAb1BVR/UI7
 bveRATNxpxTP4D4Yiss9Zk4fRNPvB2+NnNGqPyVtKLdq10YUPBrg12HAZQHG6PxCieMsHE+0U0R
 9wF7AwnVtWNteecK1VBwL+7tCVtwysvqQ8OYJ/Ev+ohHpZgjzS15W/qHslouNIO6CzJLiY5j3G9
 u/862HaV8vtYSGezmQErLjBR2Kuloqbil6QFV/HJlKN/zDr7Lek93t2OhV4i7VNzmhCkRMtl+U5
 +jvawV98nkt3vBzIDUDODlEyL3gPPRhj+qzSWdnAklMtDZU3+pXwrzKhOg0H3/OleJLqUiHBCVN
 gLwsRf428VJ8NEEgTyIX+88S6wteupP8KN4GH/rKVeZa5UiM4jdv7ENQ8Z79Fwm7C/Lu9GBowkj
 KWQH3R1MLPRVKJb2mCVe9ktlg9uUimSXKqlnp9nCY+1XGsmCRjNPLj4ibb5TfCJJkqiGOb54GDb
 AugaFz4iEvOkzVFKp+g==
X-Authority-Analysis: v=2.4 cv=M6p97Sws c=1 sm=1 tr=0 ts=6a2c07c7 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=IT9ScGb9VJkqv4s7YT8A:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120122

On Fri, Jun 12, 2026 at 12:55:51PM +0200, Luca Weiss wrote:
> As documented in the "Devicetree Sources (DTS) Coding Style" document,
> pinctrl subnodes should be sorted by the pins property. Do this once for
> kodiak.dtsi so that future additions can be added at the right places.
> 
> No functional change intended, verified with dtx_diff.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 1382 +++++++++++++++++-----------------
>  1 file changed, 691 insertions(+), 691 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
