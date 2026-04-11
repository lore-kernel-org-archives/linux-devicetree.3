Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEA02D738F
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 06:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775888634; cv=none; b=QjY3dYhbjycu79/WuWZh14edfMZGMIwRdBHc8LgL3ZzuvbcgcLPozhGYdPMjC93yOFE4vhgnwo3yikv8oOlWoITXN+zmZnuPlHKfsoRSrHc+JeUdAZQLGERBQyLSlT7S3764X8pUsJJKRdnVgnjd+3nIw0tMVJ1oBOtHmEy6DUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775888634; c=relaxed/simple;
	bh=3YPHg7r64YrngGP40JXKZCB5q0R1LvMBFjLN1Aph8GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHkJHePBupK4G5CNR8fjL4Jp0XaY9LGGrK+aT5rb1O6pMUeIjDw3i63ZxdvRyvadsiDpokL+vKBSWKQoXz5N0wjx8E9Td5zy2KxM0UwqJHQGFld9kPJ6wVpYM1O3Mx0HsetXiKGIJkyhkJtvaHKmShrEpuDwB4aH10F5nYT6tkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=djAW899L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CcEH5YX2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="djAW899L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CcEH5YX2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B47qZd1200725
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 06:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EON6Gc6C60/l73Ca3YOnXhe0
	CaA7ihPiKL27DUJ/8XU=; b=djAW899LiaxJD3cSs72Q0V2k2KMowEaNstB7gpqH
	6gtdLxeJpsQl0tb7/cAXXWJ0KqCZGt/2qhmJn1RU+r4ECI54ky/TtYd8gsSDFLx/
	nBKWFtfRtmugNIi1gGW37GBnHVydkR3GnF1+JlSjGSz+mPWorrf2qFEjfvjjicVw
	A3JggY0c6srzzFzBMnjo787g0KzcX7tjIrZ3AQKNDlc/e2mvM4GZT3KGoRCxfEy2
	7YFkHk9jWGPED+cMH0BZbR20xQq/nJdVU+e5dl58Eqz5Mwz1AdNHH/Ifzhm69w69
	LFn3LrHv+ytyIck1jwnaWbr7ISTce2R1sgxggINlWtr2bg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0jr708-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 06:23:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a90510a6d1so21883275ad.0
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 23:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775888631; x=1776493431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EON6Gc6C60/l73Ca3YOnXhe0CaA7ihPiKL27DUJ/8XU=;
        b=CcEH5YX28i4U/OiTfTS6BTbVP85ixqlvGYNrsyWH/K39OENmy2omaw2IHhrzXLRvct
         Ol5EmEnvrkM34xHNH9/0VuHbdd9H742ydxocdxDkETy8H1DB9wzrmFTwztn+/HrtbxHr
         LCSidJPoUtDg2T+gNeXTE8lkL4ObedAoZ2InczlzPI4TyZ3S06A30vm10ZRTNnZ261gn
         v0ifPwZhPHFVMnkt/46aYsTL2ZRGdb9G4+mYzGJ1pwY1KpTsb44acvGE/PWrhBCaEk3B
         XK1u0/HlmiV1gotv8RR1HXJQ63y6XSWV548cyl7T6JgaZq5D3qHSzn97qTxIh3kUt3zQ
         4+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775888631; x=1776493431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EON6Gc6C60/l73Ca3YOnXhe0CaA7ihPiKL27DUJ/8XU=;
        b=MyhlS5vXklzSuIvwWpRL6dBSyCJcNg29cMsoehYYkjXIRy55GhBFeBOalfi8BxIFQu
         DsnNFglNEPlWnTpcmqWkcFwmanbHaq5YHcmXkon49X2qXzoXjjg4zr6gGBWSgeSGJUNA
         a/v8BOgHZ1VAEZdL0UXn4pur5g/9mJJed9gMBOGbHKBLcSuuQvhaRtqbRTX3KobK7/6S
         cSZP+rE6I2c+bs7JYO/hdoZ49UxpfDM4GyaRCd/ZZ2/ZBdDPEQQZwn3VHJ3flIqLQpO1
         5XkibpeY0Irz3SuJd/gtl5PeB0wUXuootvmVgeVbfjEtXRhizRMuUTNle872trhKnDWN
         2Vmg==
X-Forwarded-Encrypted: i=1; AJvYcCUb5vYSrLTat9x5sOo3wYemYRODlBuU93n+DuKRLOI8Ugg49qLsD5VNtWa9uXoyAhsIK7KguorBR/OQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyjUMviNHMQRj2s8DbTchNhmveuLlfd8TCO/weZJiBFya0yRjeK
	ROkl2QELYBhRs6fw1tM6vz+7WVs+uXzQeTIjgQSZCIqxfA0p0b9R3HIFXVKFeQ4GF6RFioceogh
	3rd0O4aoqJNVLZumkfWvucD21QJ60tDlqp5ATYviuARBEiHdKP4SA+9zPqXRFRlmp
X-Gm-Gg: AeBDies+mba74ULR83v2ZxqrN+zjV6S6vX9reLt4dyLTYilQ7fVCD+0RVDxu6DgDsos
	jp7/1xBHjey7W5xGGykSD3r48ZEWrnhhrGJWGcS0Xd4wAkFSrXpzCOGcYIZoaWpORnjNCBuV2Ub
	LRvvRD7ay65l0o6FPuy3gg5+2EXJzkxR27vB9vzD6rIIIUO+4sKO3VE2zOzbKxalTOfKmrRmtxa
	WESvRUzVdJm7NpFMGJE7wv4+RM/GlVDMNqZ48I3jUpSlXjWnvRBL4DhQYTFu7sJflJehrus+oUZ
	1FqYtIyqAlhppOM9tgsZ/BtGu12lJq7PIoliqmvahU2IJlHTO1Y95xShe5xR/mHfKzCIotfMNqL
	+56t5a9Q4UB8XQjkYVOHj3iN3RbpFZVhqGLoKcfzJPVx9bTxg
X-Received: by 2002:a17:903:120a:b0:2b2:6cab:3127 with SMTP id d9443c01a7336-2b2d5d7a278mr50669885ad.20.1775888631010;
        Fri, 10 Apr 2026 23:23:51 -0700 (PDT)
X-Received: by 2002:a17:903:120a:b0:2b2:6cab:3127 with SMTP id d9443c01a7336-2b2d5d7a278mr50669585ad.20.1775888630373;
        Fri, 10 Apr 2026 23:23:50 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f26a97sm65595815ad.61.2026.04.10.23.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 23:23:50 -0700 (PDT)
Date: Sat, 11 Apr 2026 11:53:43 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 04/35] irqchip/qcom-pdc: Replace pdc_version global with
 a function pointer
Message-ID: <20260411062343.moksimqxjomts44a@hu-mojha-hyd.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-5-mukesh.ojha@oss.qualcomm.com>
 <adm0X2ybeG5McXVv@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adm0X2ybeG5McXVv@baldur>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDA0NSBTYWx0ZWRfXz/iciXM9eYd6
 7qlQCm+OyE9yhcF1nQPszOonFAf1CMFAEZn4PUvScYj2ucOvjQWUoy9rKkJM3xXNw+nnELk6BjS
 Vr9GUuJWLlMYcL5RMcBoTKJgobTWcWyxSJ6Rx46ga/aITydKZxu1bcSb49NcJprp7MhX0Zyh/5Y
 Vvkfu1lJL4Wr/iOCAtmJA+3JO9LOvHO3Iov9uTxCpEdgIsivemjVQpiJSr4R1omBCpfQLKm+WRk
 oi+YYeDxjsxTrB/giWbI0iTipw+rUvbkM7uenwks+L0oV/2gdXmkBryWoW/QfqUB5CBymc1Q1b+
 /BZOsEVyMAua34aTHg35H8uWlKmgpkNgRmg30z1zt2nocSjca9Amw2cTLYw3mXNw2ABujN+j4kq
 QKVM0PPnfPJ/khaFtMENg8pOJQfSpiDY3D6fH6eJ03IlsD3okPhjV0KUuaW27ZuNIwJLyyHc6GY
 5zzzBA4Mifw4Wu3jSRQ==
X-Proofpoint-ORIG-GUID: 3j2qrlJ3PL-meU8wIO-L4B58FttRTL4K
X-Proofpoint-GUID: 3j2qrlJ3PL-meU8wIO-L4B58FttRTL4K
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69d9e8f8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ASaocV-rLGzqRiZtC3wA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110045

On Fri, Apr 10, 2026 at 09:43:10PM -0500, Bjorn Andersson wrote:
> On Sat, Apr 11, 2026 at 12:10:41AM +0530, Mukesh Ojha wrote:
> > Now that the two enable paths are separate functions, replace the
> > pdc_version global with a __pdc_enable_intr function pointer. The
> > pointer is assigned once at probe time based on the version register,
> > moving the version comparison out of the interrupt enable/disable hot
> > path entirely.
> 
> That's what the patch does, but why?

I thought, it was odd to compare against the version every time during
enable/disable instead of clearing the path to take at probe time itself.
however, I don't have data to prove how hot this path is ?

> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/irqchip/qcom-pdc.c | 13 +++----------
> >  1 file changed, 3 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> > index 21e2b4b884ee..734576cdce0c 100644
> > --- a/drivers/irqchip/qcom-pdc.c
> > +++ b/drivers/irqchip/qcom-pdc.c
> > @@ -51,7 +51,7 @@ static void __iomem *pdc_base;
> >  static void __iomem *pdc_prev_base;
> >  static struct pdc_pin_region *pdc_region;
> >  static int pdc_region_cnt;
> > -static unsigned int pdc_version;
> > +static void (*__pdc_enable_intr)(int pin_out, bool on);
> >  static bool pdc_x1e_quirk;
> >  
> >  static void pdc_base_reg_write(void __iomem *base, int reg, u32 i, u32 val)
> > @@ -123,14 +123,6 @@ static void pdc_enable_intr_cfg(int pin_out, bool on)
> >  	pdc_reg_write(IRQ_i_CFG, pin_out, enable);
> >  }
> >  
> > -static void __pdc_enable_intr(int pin_out, bool on)
> > -{
> > -	if (pdc_version < PDC_VERSION_3_2)
> > -		pdc_enable_intr_bank(pin_out, on);
> > -	else
> > -		pdc_enable_intr_cfg(pin_out, on);
> 
> This style is comfortable to read.

Agree, code readingwise, this looks easier..

> 
> > -}
> > -
> >  static void pdc_enable_intr(struct irq_data *d, bool on)
> >  {
> >  	unsigned long flags;
> > @@ -400,7 +392,8 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
> >  		goto fail;
> >  	}
> >  
> > -	pdc_version = pdc_reg_read(PDC_VERSION_REG, 0);
> > +	__pdc_enable_intr = (pdc_reg_read(PDC_VERSION_REG, 0) < PDC_VERSION_3_2) ?
> > +			pdc_enable_intr_bank : pdc_enable_intr_cfg;
> 
> This style is a mess.
> 
> Regards,
> Bjorn
> 
> >  
> >  	parent_domain = irq_find_host(parent);
> >  	if (!parent_domain) {
> > -- 
> > 2.53.0
> > 

-- 
-Mukesh Ojha
