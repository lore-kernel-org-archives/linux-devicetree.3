Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D62735F18F
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 21:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775253553; cv=none; b=IAS+eO+lzrFdhynwZuiz7RVn70Z7y9sB6E1zA2lfMsglsSVqQtzDa9Eghu124N3pH7BH8vbloY7iun4lsA5Ul9gGTalGCfPusYIOC3OU094vKaur8Bb9MRFOPs9gojiujpJAZdP4evUT9NM8qfxda0IuqJOu8K9Q7eBZ051XkIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775253553; c=relaxed/simple;
	bh=rqB937ggnhxRSdJcUTbnBDypko99HI/LIAG4qBwWDzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gGXlkEVzvPaYhOYp78HYaCHHcLSiPalYBihei66AcqkNsA6fh5CHoT2+giIrFJ/XJq9U/91fJSVvDx2uPnFFpDFG9iVU4pFndXCWnVB2yZ9rzN8xcA3WoZwdWfX7UpndIA/OBGq6m53zcsnD4r55p8T6chlrG8FeSlRE9C1AvaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pp3wrIjF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B3i0mY3Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pp3wrIjF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B3i0mY3Q"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633DQmPc3772751
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 21:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GgilH/CYlNPEdmGfxfOBQVIc
	9G2hmzaeFbna/a1eu+4=; b=pp3wrIjFo8OXhOX4fzWTgm2KCd8peDxDdfBUA2ff
	26lt9OV4smDsm8OpqItBds3aCS8VTSJEqRs7oW+baLWKyyZ844fWb4htxjt6SWq/
	XmZUdjy/tRg/HPSwGEG0BAzU66W5SKisMWB789KVNWxFVNuJ5Q3L68jyrCz1Gghq
	VZKdYbHXAhaKJVEavycJS3H4wdUZw4u5VXyKp7XDViAE1Yr6ssE57V15Om6Posym
	HBojY7gzgTG9NnszqWs6tIPhf03S/X5whKqRhv7J783xvh/SOOXhbvtEC0AufINi
	1HMYRcp2Ey/RQ4D4e2PMghAnWiVsAjYzVz6eqd1den3Xxw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9wcs4a9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 21:59:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5094741c1c1so72218851cf.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 14:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775253550; x=1775858350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GgilH/CYlNPEdmGfxfOBQVIc9G2hmzaeFbna/a1eu+4=;
        b=B3i0mY3QaIjARKiHOME9VA2iaBQY92mGNBB1nqmtLYOU0YL7Aj4GWP8j1wwjdn48D2
         pYKrwV8FvKB4H/jDV+WhQJGWdQvPQXzj3YTECGqQ1xWrpd2I0jZ8OQLky7kaDNEKO0LK
         no9eITAZU2oYmQ8jhjcBK0WDwxLkZj6P9Utn0LBebQdzqIP1Vc70H64mfNBBTd335tOa
         tM4e/T09Q8n/QypBI2fHcTZXWCtvEySis4rswi5/BdnKHZYIhRaIxQHTrFz0zNvRLIKZ
         puKWOFdWrKlVH9VE1eNePaq6IGVdcze7B4KtMWVcPDYaPVlAr1qsQAF5/Nf+NSSxeBMC
         nuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775253550; x=1775858350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GgilH/CYlNPEdmGfxfOBQVIc9G2hmzaeFbna/a1eu+4=;
        b=TQtKQ+s3Ejtl/3XAZc412QZan9eYHv6T9RnvQVQ61ihZq3OSS1kVJth2uTDAvJ6crm
         fbumVoQ0gVTWVM5hlrVVMeXforZAv1wcs2gxnd6tk+jjO/eodEPmFY7raBgWjDMqe8LS
         MFDJGYMVkILFgjy/0LGsWXqDu5mpM152HjvqyNyF3+tnZLAc1k5NJOet0mdkoDHRTDL6
         M3vqENo2/EVOg3MGdfetcMIdTEZafawrcHIakTMXF14tPTLLXpUIAiUSEjCmIj9aPzOV
         Wwsul4G4Bmu79zEuFI3AfACY1+65ms5g5XsaMO9Zg89EhlLQWdG253L2+tMZ4WVPa0CF
         LxHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWhA+58wRRBxdQz3MCYoOb50YxkeGf9PH2C++Zz7ailiVRDJBbIhKqVIJQp1D6hct0orIflKJQB5Ly@vger.kernel.org
X-Gm-Message-State: AOJu0YzKthAgqOz4+ytyRjFtw1CpRLYveZMGBiyDVjQOyVDSG4OxbG9P
	x4+TnkPjN1MugXR5ajtuFucMo7bR/cqlZRAF9rDC5Luunt6Zb6AeEcEertdRqF4+nPpF+7Pbm3Y
	6IAg97ZGO2JcsPneHn+uum70q1xVNegTjJzLz64t6hG0Ys2f5FR60Z2r2lvZBgr07
X-Gm-Gg: ATEYQzxZMG/vzIKaqOYHywUPDw7InTzaaBVMS9vQaR4T6M2fFigGx+P1VXwvZ7U1CJd
	T0PfJO8rBDy5y3qdHvAoKU17sV6Uk9EK5ccs40kgdnqPLYZvjfJX3BcKTboD6G4g6Yr5dEOQWen
	YJItAioLG1Z2Na8r5TNamK/pwjnAxgZc+0T3ZyLCyacGFv1sfiovUuy5kll48Q0P2FZRYnbXBX6
	DRmsQmJizyASy0hXTLWku3o61fs4L94HlsMk03zSjqk6baBx/EL7OZaP4TEF2y0cKis7cKZphK9
	7U1kbtlHEcGeEY7F3126onPzwptDsbtwrUwiqq3JyqkwQIKTpsMEibUpSIUjofRB25DbDPTVHqk
	Sp6hrSPqlbpusDpOkefFM/a/gNzmaNpBPc8+kN9+9EG9aKAg2CM5Xp5Be/8CWOHLOQoORpEiLWI
	c3znbrJtQmGIETB/+zGO6MSLVf2ieSe1FaX70=
X-Received: by 2002:ac8:5703:0:b0:50b:4984:148b with SMTP id d75a77b69052e-50d62e6a503mr60498321cf.64.1775253550471;
        Fri, 03 Apr 2026 14:59:10 -0700 (PDT)
X-Received: by 2002:ac8:5703:0:b0:50b:4984:148b with SMTP id d75a77b69052e-50d62e6a503mr60498001cf.64.1775253550027;
        Fri, 03 Apr 2026 14:59:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd6799sm1695259e87.81.2026.04.03.14.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 14:59:08 -0700 (PDT)
Date: Sat, 4 Apr 2026 00:59:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Steev Klimaszewski <threeway@gmail.com>
Cc: vikash.garodia@oss.qualcomm.com, abhinav.kumar@linux.dev,
        andersson@kernel.org, bod@kernel.org, bryan.odonoghue@linaro.org,
        conor+dt@kernel.org, david@ixit.cz, devicetree@vger.kernel.org,
        dikshita.agarwal@oss.qualcomm.com, johan+linaro@kernel.org,
        konrad.dybcio@oss.qualcomm.com, konradybcio@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, robh@kernel.org, stanimir.varbanov@linaro.org
Subject: Re: media: iris: enable SM8350 and SC8280XP support
Message-ID: <uiv4w3eptbniohzanp753f3wtwt4efjxupdro7kom2kgycco7f@nks5b4ctxty7>
References: <a1dcd0e3-db1c-4752-9473-7934e69198a3@oss.qualcomm.com>
 <20260403214140.7307-1-threeway@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403214140.7307-1-threeway@gmail.com>
X-Proofpoint-ORIG-GUID: t5mCva_l8K42SrXd7ifupF_Bl_kJ89kd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE5NiBTYWx0ZWRfX0vqHphcivuJ5
 rLQrVStD5cdy2WqDztJO2fJWhW3aIxdIgjzNPgiYG8R3kxE+a/fEJFUKSRpB7ZkoEcVe6lZ4UH/
 5uCwBeGMKO3nKNBZsHxFiZKFXPtAvGuGTNRxAjVEawtL2CwUa5e0KKCUtcYX7MtNpHGUXDwsYZ4
 j6HPLRcf7JiNe2jqlJWUlgEuyGbpExLtT2Z3Lp4P887Yk5WQc0ujG4MD2KSfg/8ckKzcAvDlup+
 6Lad2idxreEa2SIp0IYciRfvtpnGICcOHWoTYK8kPQqrgv4bnw+/wCCvKHJ87bkaJZiOhG12es+
 4SExEUNiGJcwYfzvG+X8BdBiaCXiMLrg9+WdNucqG/NmUcEFenZors+mnzMxRuDeSBUVLGJ4oUh
 QRBTM0DByFm1OdL8vONjh+E8iQtC36BS4zT/Jx9otyI7T/bJYybsgVdIa3EEUslfMF/gojs9q4t
 eKnzRvOoEQnUGayXkRQ==
X-Authority-Analysis: v=2.4 cv=ZuPg6t7G c=1 sm=1 tr=0 ts=69d0382f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=mZ2gADCCxg8TzUEfTn8A:9
 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: t5mCva_l8K42SrXd7ifupF_Bl_kJ89kd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030196

On Fri, Apr 03, 2026 at 04:41:39PM -0500, Steev Klimaszewski wrote:
> Hi Vikash,
> 
> >> This is not just with totem, showtime shows the same issue.  If I let the video
> >> play, it plays just fine, however, if I attempt to skip forward, back, or even
> >> play *after* the video has played, then I see the smmu fault
> >>
> >>   arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0xd51e3e00, fsynr=0x600002, cbfrsynra=0x2a00, cb=6
> 
> > please log the info about which "iova=0xd51e3e00" buffer is faulting in
> > this case
> 
> I will include the diff that I applied against my kernel, in case this isn't the
> correct information, but I get the following output in EL2:


But these logs don't capture, which buffers are causing the IOMMU error.


-- 
With best wishes
Dmitry
