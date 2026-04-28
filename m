Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A952F12AF
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 07:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777362854; cv=none; b=BkxDAyotpnQHa2k4kZma8pwajNmyvKCtO67whKNEDY0t88/ilbH0ow4RfO/Jwb1KgT4T5dtqBhQ49WpazjSi4PxXr9I4zR+DKve14xNbMXBvNc3h1DUHOyV/j43xmu/D08/bCyhgogPN0ct9482uANcce0BRR3wcCuV2nR3B+vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777362854; c=relaxed/simple;
	bh=nO1qi5Dul8uWtQesLKW0caNwZn6kHn1r/ISffPi0VTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=styWPYQaV9gqpVnI12t4UBi3cYx3B0jgxh/RsqB5S9FLlHcvWdz0mC9ELXGOl7hFFq5cwkWVhLQIcV4uz3+qmqA5B+QPAoRlQJhMNOA+sOQpBn9ZG0rxKMk09sS08b5OrnMsCz5XXxQHSKmm1fpwKgJuAblCIlpYDRtriPnSE2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHDI5OGF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YcZlfKOi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHDI5OGF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YcZlfKOi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S2H6XE663416
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 07:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9cA7LAzSpt18mLOuNqWwo3S8
	rGMWsexeG+BWcJAofWQ=; b=cHDI5OGFrJg5pJb5fwr5FRv2Tuh4HH/uFFMD3beQ
	ElVtfTpLjzyFZIkFFz62IjZQvSZaNoB9fBFYZRg9/UOPmamOe+1NJAvzQXhSAbVW
	78PuTwTGCzUBbm/5t6w0JXvllVMP/RJYJ824/THltlXdhJLeLok5FTf8+y55YnLU
	fXC7qRJtAh9fFuJYqrK3vlNc/ngrfByEo4mTErC2ppj4DjWwSIRG/N+juLQZJX/D
	JabhhbauLaxFnr5W/Af4gt9jTYQZ07HFpfsKrIcqTKPGSiZG6KZcqSQFOnc2GWCq
	LEaCRTM9piJsfRTx6WbrHrmum2uW4tdUSXp5QNT4zrLDyw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtc5n2v4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 07:54:10 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56ee7e6ce4bso13847236e0c.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 00:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777362850; x=1777967650; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9cA7LAzSpt18mLOuNqWwo3S8rGMWsexeG+BWcJAofWQ=;
        b=YcZlfKOieeEvQ8LXE1ra+ja6gnJ+pvU3maGPlGVtInV1G8EYDqZttIXauxKs+FOXqm
         Hc1O8TJaQ05lsJwtE/RuhFZz1BlRpzER9mR/8M5Fz+GWKA0jedOmOtbHyE3qeWUO9uhV
         4eFe22jUdm2wulv/Uy+khA7oe7NylCoCggKvt63Icp9mLMjnfXqyNBrMu44X+Y1SL+7x
         99OQVnh4WPi0msqt92690jMZf6gmAw3Gs0y2t0/ku9eal7m3sdlQoQgG38wslbH2Z0eH
         LwuXt2guXwyjZtIfVYYgjaQuLej0Iy2k35ZY46jHzi1ekrRYBMsyTsh4PVMOC4i/KFBf
         rr/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777362850; x=1777967650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9cA7LAzSpt18mLOuNqWwo3S8rGMWsexeG+BWcJAofWQ=;
        b=kZVcLMGJ9fcKOhDfSo0w04m56qV0sHdV9q/RJwjZg2b4TOBudMhucChxncNTwE6dIn
         FUiWsac47LfRxA8A0KtAmOi2BKxtVLljdWgBTn5jfX0UVrkTR3znKqu+sI3k4tCU58NZ
         lynIRUXgdlGO4hOqXNeg2DOz90ed21FhdE5UjQSgl9NMuoecQ4VmeVSWTCWlrwghFe3m
         bgQpCN+v9uiBLfT9LrIZOGyxVTwjJNAK5AjU7/SXUpfUTGhetc2TtgmFDcoqzgOugJ/l
         gXnm1OH6tolhrQdm/bkBhf4Ah/cEhSPnJMYo0BusF8672IFq4SKHphuMzB5lKu+BkYSu
         y1VA==
X-Forwarded-Encrypted: i=1; AFNElJ9dKLBmnqlBWxlBV27+5VdQtP75cJjKRLDj0JbJlLyAJkmVZqf1sge4VzReg6iz1gzIGHax4eIReo7l@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3Aj6WloEBElcHVDmhEAQaTSJu9QP42pkEOkKrylEDFzUJn4lM
	iJMF5v0qeAQ9zpnG1vCC7P0E7/ZaOdJ1EENek5cwlSxNFh7XuisndcLmG3JNiorPrpEwzXTY4Hb
	o/KSmoMfdRcvWKyfDOaTMSOKmJ3gfq7VE0FXzbO8WXdaJpVu76o19zkJXgvCNVgFT
X-Gm-Gg: AeBDieuQdzPqUgCkty5trPrg1obtXrK6mMs9lTBu9VNF6mj4GfLJIw2HpiuE0x7e6NC
	yQf0ur8voppotoz0Cj+8QBiPw+g7R2y+op0z31E7QSuw/XKtlvSx4qjcxQPbbaAJPiqW7M/hG0X
	T2FYGG1CZbzfKQf+uM3WgkKc63TXEsSZvtFgPU9/myQ4206NRhnD7BrSPgU/rB/iVauGhlLyxg2
	ZXt2l+BXiDOVMTn83g/+u5bbPIfcLsBC7eS6wt3TG3ttAXANFvIEIyYZejOtKdNPqljds3jNbo9
	+AUenc25EY4jHD1OllaRf2bi/aHvJ8CVTT8plU8IifesXBdkAe9/ZWrs9gF2mdIx2FUAESkbbT6
	uukh9A5N2OsF+95/7mt4R/w62mJ/vY7T/q/BVIarzWaGMtdC9RZQ5K77r5eytnmMqAwNSd/RRXG
	AZh/YASEeX2XRSq5XVt7uacgv2D7AuDNjrWW19X/d1qh9n3Q==
X-Received: by 2002:ac5:c9bb:0:b0:56c:f222:7d7e with SMTP id 71dfb90a1353d-573a56d9161mr441354e0c.10.1777362850269;
        Tue, 28 Apr 2026 00:54:10 -0700 (PDT)
X-Received: by 2002:ac5:c9bb:0:b0:56c:f222:7d7e with SMTP id 71dfb90a1353d-573a56d9161mr441349e0c.10.1777362849827;
        Tue, 28 Apr 2026 00:54:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3923f31f2fesm5123161fa.12.2026.04.28.00.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 00:54:08 -0700 (PDT)
Date: Tue, 28 Apr 2026 10:54:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: William Bright <william.bright@imd-tec.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/panel: Add TSD TST070WSBE-196C 7" DSI panel
 driver
Message-ID: <wy5rqmwe5fwd3vneplwojuaavwdxi22cjgj4ytiiyufszgv7re@h75gdudgtwli>
References: <20260427-imdt-dsi-display-v1-0-bb2768de120b@imd-tec.com>
 <20260427-imdt-dsi-display-v1-2-bb2768de120b@imd-tec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427-imdt-dsi-display-v1-2-bb2768de120b@imd-tec.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA3MSBTYWx0ZWRfXwOiQZ4m8QBGG
 WDWhCF0zJDVYlIqi33u1IVxe9bNwy+gxTGSpuLrJ3FkISIcH3n+ROeINSNTksmqwQyk3kTamNlk
 fKMMhipkCp2FUGjv/Ww3Lvc2HeEECzhocDpXwWS1CPcOV/md17zy9n/NBhUbp5TkzMk0hxiYwMu
 Z/3prbtnXfU1SKgwcsaQPajy2L+j3DR6tLqh6oUWX2ZkvIgZh6I45QWMGMRzywb25877slhOezE
 A6yUDfIuE6lQaYgQrwiiK7zLgtWsqyZHiswXW+UMi0UUKSKQrfILIPgTMr9N+MddkRRFex5ZVYY
 yy3fYm/cUeyU1Cm5N14E7NtNd89rieHBrqUlFWLu5c5myWRSemJLckmd05XCe7vCLHUGQ3pMhTe
 AL2X9yy127uRlRQCDu6g6yc5WmXoy/pWLyj1NO55/LN3OPXopdAQBGC9oiFZCh8E7Njz9/mCPbB
 Vv/KJnN+7ZqKPZZRwMQ==
X-Proofpoint-GUID: 2a_aMnml02uwNq52BR4nSegn0YWXcoRe
X-Proofpoint-ORIG-GUID: 2a_aMnml02uwNq52BR4nSegn0YWXcoRe
X-Authority-Analysis: v=2.4 cv=ZMfnX37b c=1 sm=1 tr=0 ts=69f067a3 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=NEAV23lmAAAA:8
 a=xWt6wN_oAAAA:20 a=gNcS5RXMAAAA:8 a=z5WFC0DZfZEC-hT1myoA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=VeqYHxXNbGx7SVBbL1V1:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280071

On Mon, Apr 27, 2026 at 04:21:10PM +0100, William Bright wrote:
> Add a dedicated panel driver for the TSD TST070WSBE-196C, a 7" 1024x600
> MIPI-DSI TFT LCD panel using an EK79007AD controller.
> 
> The driver supports power supply control, reset and enable GPIOs, and
> the backlight framework.
> 
> The initial driver was built mostly using
> "linux-mdss-dsi-panel-driver-generator" [1], reading the downstream
> file "dsi-panel-imdt-tst070wsbe165c-video.dtsi" [2].
> 
> [1] https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
> [2] https://raw.githubusercontent.com/imd-tec/meta-imdt-qcom/refs/heads/kirkstone/recipes-display/displaydevicetree/displaydevicetree/0001-Initial-bringup-of-IMDT-Display-3.patch
> 
> Signed-off-by: William Bright <william.bright@imd-tec.com>
> ---
>  MAINTAINERS                                       |   6 +
>  drivers/gpu/drm/panel/Kconfig                     |   9 ++
>  drivers/gpu/drm/panel/Makefile                    |   1 +
>  drivers/gpu/drm/panel/panel-tsd-tst070wsbe-196c.c | 168 ++++++++++++++++++++++

As there seem to be no DSI programming going on, could it instead go to
the panel-simple.c?

>  4 files changed, 184 insertions(+)
> 

-- 
With best wishes
Dmitry
