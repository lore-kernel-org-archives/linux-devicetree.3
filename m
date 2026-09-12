Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B3F31F9B7
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 15:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789226723; cv=none; b=ORS21WWOIeQeoWTGvfQGastqqg3/eW7FuomlDDr8qSxhzMojO/LCdCL+db3tzebr1/XQscXWArKHnIvvoFmFCa+Aae/rAjPnLMm7FLBaRk2uA3koSIfjdvvEtbehu+tpyb+TTkIkUAVZdmJxF3ZS2t0gGfcWyWBWzsErW77MFvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789226723; c=relaxed/simple;
	bh=4eBxf+Fj6KnsrotgVdRczT9ssOraNNtjnrJCSA/YZhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhAPv0bNHQIKs6pk7YcSBBELT1QwiUJDQH8YaM5xpYqAP4J+7/nmpMevrBx1/BESaV/JRDbB8EsGKgEFnmo9YrgR5PKJjwwhUOw/aroMNQnaA6dgXd9LCzL9NJTxBa7i/APcMSZh82w9wAyuEPcZAX9/vKpGo903NCxpKYm+DAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/zkERln; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NOuYFyEV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/zkERln";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NOuYFyEV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEdVLK4128198
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 15:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JkBknVDne8chqJALpu4JqR6J
	qVDi0RNKgdcUBmrEbsk=; b=b/zkERlnK1V/oyswBfo7UYW6xqbhpy+Koj6yomt4
	tSJ0OEuhfR8Z1jnI2/MoYbtQqJ6PcM3BEXL8NobyceqSn4uzD6K7yhnUZu+tRgdf
	yfQu27V6x02r9RHvg8vpYj900nrdW0Xwe9zEkl54CvimnETTSt6jY0kX8fyZtKcn
	Ah5y4MldPCiePveItAkqNTjHiC+afWeAIn/WsZER7BqvJHdXfnhN999ikXCe8P/O
	JTIxeQhW7RV6CfF7SNv/on5M+QNpg78MVXP28vTMyBxl867wUGA5/fS2tnFjTpNN
	hVZ2EXDAAGd9pw6VI+gsM2MwvWzuCbEzipknWOS3VW8wcw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c998m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 15:25:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93903622880so613821185a.0
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 08:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789226721; x=1789831521; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JkBknVDne8chqJALpu4JqR6JqVDi0RNKgdcUBmrEbsk=;
        b=NOuYFyEVNzVS08trRZDCDM20EZoFfwC03gmT1OdJrOVpK19gEIubZ0sDrD7z/+zcz+
         BHzLGiGaeVyGFO84l1mOZKUfRxgyXq8bDOxWNzQ7GWh8wLcGMWHYZY9UENhFJNdj1aV4
         rVPRnT6fRF4fJQExlyZB4oJAZ5hzTew75POkQBEXyYG1kjjai7XkxLYQxu1bRKHa5MzX
         rLafLWeISxkybbAurLnhrlj61LnJsydTZhAcS3E8L872E39Tn5ii9TzkN73+XUXtz8Go
         yuF5OnzEp79DH6FWaRufhPleg5uBaRWZ4ZtwYWV7rKqJxqoEXbtUhHlx7rYgAYkD62h8
         SNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789226721; x=1789831521;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JkBknVDne8chqJALpu4JqR6JqVDi0RNKgdcUBmrEbsk=;
        b=dEwgDQhTlqu/wk504GkAYHA1PTP94E0g4B2OgpbNpd88vqnjF1LRtR7S8vSJ2bKFOs
         tEyo6Qr8ef2r6OFALXhfIKwQSrrnheJu4/jrKlgvV4gI+DqfU9e3M2PXn9z2GoN42ARt
         kT5kEPWlFXM6GnmazdthhWuIby2edP0jnPayMPyYpKUb1C0YR1nV2urH/hnRh4Zoi+2G
         h10sI8vsnE+Pe4U7O7wmwkyx9A5KFrELRflMMeNg7EiowecjfchbJ2gZC6QyZpYKVCwn
         GZ6UHsqJqdzLJ+FsEEOubEMkjTfzNcOCOVCT7rQufPuXNBuVtCXnTqVQRJD4zXkTslgb
         TjTg==
X-Forwarded-Encrypted: i=1; AKwUvBwOlt6b1JgjU2Y8VpnEoDPUkp9sL88NpFi6L49fmgpDycyuXWfvKGqNC4HvWZPfUTEFS+iqdjEZwnty@vger.kernel.org
X-Gm-Message-State: AFuF++nwkvuCLJ9V/NHkSJRgr9c3vGxgry2Bc+v/BBtHctSxI8yWD47S
	K6ZGRfn7eKBnw9EoErSJBZJk93aM8+3Pus6y4JOBz4pIsmnXs/lHuD8VdW9OMrgmQOSMzJuQUwX
	h5BP10uF2UW8LDDY/xHoImrXoVcgcQA3OcJYKerBs7SpYj90jfdXYparMl24n7b0i
X-Gm-Gg: AYBFou38JFUz0F2tKjStNP9TAZ41B51KU7mqhkcVQkDax6WMZCpGuN0xoJrp3g1lvd9
	C2FsiRwdSfCqOUFbUFFyNG/yl2ChBtu/ESXXWinojdnXvsNYJnkFCvgBv0tUyYWHu87gnl6MfDn
	CkQJhmSItqc0xXVfh5M7mVH3v5+70kmCPEk9R5Q/roRd3TLKFcTjE+/O29mowVxIpZAynv4Qyhn
	QonQPecmOZo2R5as6BdnKTtcw1rPkAJy/ob8Ja96RuLFNJV7g8x1TMUEYE5UvpN2uIHDa8T2JlL
	C0Ya4TRelBL246CC/EpPxbzNHOGP8vNbxWGo1yBDwM1tRqM2PdqVk2IkOoChNguwLUEs9zKa2Wp
	8WWvbeBPbflDz6JU=
X-Received: by 2002:a05:620a:198f:b0:939:72cb:bae1 with SMTP id af79cd13be357-939d7f878d7mr1732161185a.24.1789226720612;
        Sat, 12 Sep 2026 08:25:20 -0700 (PDT)
X-Received: by 2002:a05:620a:198f:b0:939:72cb:bae1 with SMTP id af79cd13be357-939d7f878d7mr1732155785a.24.1789226720030;
        Sat, 12 Sep 2026 08:25:20 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a81943sm108257005e9.1.2026.09.12.08.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:25:18 -0700 (PDT)
Date: Sat, 12 Sep 2026 18:25:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: nord-ride-embedded: Enable USB
 ports
Message-ID: <yvhvfmdzjipxi6eyybrwwdfle2jkyffahenvdp7s2ieuvgjmp2@bte2vyprwnsf>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-6-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911142040.100263-6-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIyMyBTYWx0ZWRfX7A/Svwla/JCh
 kEc4gul2jVCTjEizQ/Pnn7mJp0aMw0MTqUZwTkgphB/wcF9vG8sB3VSGd4w97/pzrMZgIIkY9/C
 /g55Y3A6vtMvRI45Qm4VjgBVC6HTzWA=
X-Proofpoint-GUID: 0Qk64WCNuszUDuExvRHeaQ78eWXtADBz
X-Authority-Analysis: v=2.4 cv=BdZNQbt2 c=1 sm=1 tr=0 ts=6aa56ee1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=rlnnUfXKZFOWfltiA5oA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 0Qk64WCNuszUDuExvRHeaQ78eWXtADBz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIyMyBTYWx0ZWRfX99cMOc0kRpBI
 2EiYHzzKqMYyCSu4q9qVOsf8p5EJRdFhKzvN11xBycWgWsLeUFGJpLMYBGzMZdneboP+EKYB2g0
 0JLDyFT16ZXiJeT5iQGyS6XCeKBh9nV8iRxcV7i36J7wl7ORHUHSyAlP1g0AXmPKIhjQ6Idl0f6
 ptqwbkvag9yWZQpAtmMU6OUeoKS7FHnPrtVuigzjPtPfrbv/KQW878xoTCbZENO1x6s0GrknZ7X
 vZhiJvLJHi3EeVRUfoyvRK7CowcKvxK58pR8PA7NRkyJfbaRuzUGFFRpWd5gQWc7Q9BEvX6TMJj
 9L/6jZXxi0lD64Ny6d29qWU1S8utpIMRWv/AJM3yVhW7vtOJpI/5pm61H+3zNCbKoXrovj59o0o
 RRKHa/UJjpieAvrBpHOb1H4XUSYogsdr0hV7NCNzEwJj/ZOH1q50H5YEf0tPsXk1AckEHgjWIeq
 QJvLJb/g2sVVv8tvUCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120223

On 26-09-11 22:20:40, Shawn Guo wrote:
> Wire up the board specific pieces for USB ports. Enable i2c9 and add the
> three NXP PTN3222 eUSB2 repeaters (one per USB port) with their 1.8 V
> supply and reset GPIOs on the PMIC GPIO expanders.
> 
> Add the onsemi FUSB15201 dual port Type-C controller at 0x50, with
> its interrupt and pinctrl state on pmau0102_i gpio8. Both controller
> ports are wired on this board, so describe two usb-c-connector
> children and cross-link their HS and SS endpoints to the dwc3 HS
> endpoint and the QMP combo PHY SS output of USB_0 and USB_1. Both
> controllers therefore run in OTG mode with usb-role-switch.
> 
> USB_2 has no Type-C connector, so it is configured as a fixed host
> port. Its VBUS is supplied by a fixed regulator gated by
> pmau0102_h gpio3, kept always-on since nothing switches it at
> runtime.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
