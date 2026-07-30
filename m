Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50D71D5CFE
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785454828; cv=none; b=YfcM6sBlvz6Wi4IWlZ38Je02iSV7AT8u6hIrM9bJLC80BUT56Gm1x1SZb/xI0n57El4yaA3pCz2pvxKhP/EVwdMDirasVWy9DItkfqc5OjG1A8+aeZBx4vBvDnNy5CLLs47imJ7IZSp9ZP1EzgwcuX19WMn7evLwbV/5bnEG7lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785454828; c=relaxed/simple;
	bh=6mdSfMYPnFWA38MhuTWG+3NJpel6NTFfjMo/Yp94zGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fw2w7VCj1qpDYW22S5ZowBqt/rMtr4RT+KtByCiBqo1ivHLRFkEwffTUsegnWvKaYbN6JBvR5xy1BClgn3VDWHLsKCWoypkQZjoa8ZP5YrBYUKvPPGbghixMDFIo9E6s6nrZXHqLpncRajNOwaCYZ/PPelf7KQsDr3l8UWzEgz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EhKrQHyo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F2haEI2o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EhKrQHyo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F2haEI2o"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMrKFP2011184
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y+J6WIwTXDgGuxn91mCA8eYm
	uhXMp9TDSyjOUKVWPfg=; b=EhKrQHyoBDqEF/zGiAV4SBAig1CK6L8eKGoOe95M
	ERycjqEwZ2PiRaPcHfy0wk00fK0FpYhbvwX5uErY0HmlLdcfXa2btfjkQw0BMn8i
	BoSuHTIwAnrBrPXg6BOco6NrsJ4JPPiN1IVera4WqIrnhsSIEawcwNpwlxMeRxy7
	QzGQ4rb4qeiPD8iFwz15ZiggtgRbHTLNmqg/xpY8xqazWDVbNifKI8FlKLSXEGfU
	doshtpc3nNx1tvFd1GntPhZQqtCHi+qM1b/kANKh0DMpVDXQm4YIdqTp9KcO8GOW
	UfYVRSUFSy0L5yOUhAUXclabT9KSf6rnXbfVwWrkJor3iQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frfmh050v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:40:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8eac2620cb0so4060096d6.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785454826; x=1786059626; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y+J6WIwTXDgGuxn91mCA8eYmuhXMp9TDSyjOUKVWPfg=;
        b=F2haEI2oD0CgiKC4PNYVKOzl1aaEs9//h5D1dIrZyGbac1YN7vX2p9G4mTRsYGJfo+
         oElORm+pfZ+4FGr/SRyuNLn7Q3rE7iULo354i35bmAahqjQbXYuI5gw7QZuCFOXISIcL
         WKFeGI7fKj9ZFS5mpcg7tcjK/sH2saBLBQ2WNR2aLHO0UGRgVZSSIPtuwGHt/iGyGalG
         wy7DTTGWJhvxfl4eqf7SUYnA+5J8k5GdqUuZYALL4xHTlkkob9Pr+ZEihKRCxXROhwnI
         TkY4SNLRYMJLgwFsRnoPDYCH6ITdkenPpcS7MGFTV3FlqD+4+SgmK6W7mzRSydek8AS2
         DX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785454826; x=1786059626;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y+J6WIwTXDgGuxn91mCA8eYmuhXMp9TDSyjOUKVWPfg=;
        b=RPrT1M5QoIpwAG2KA9IhoFVFKacEWwgwognapUrdYM/Rz0GKYhaA+TtzvTfx2xitS4
         cS85slrLnfzmIuoCGPPEwr1UYEAxlESGiQ4+h9KwzmCoTIRVYci+zo/ArvYW2T5ZjmUV
         m1ZQPIYSOKJ1nOSC+8TqPJcIIm0BuLLhCNPySQqgGGUH8Zm9OQ2uq20fTSJ4NMsPA/XR
         ofnIa0nOkaMreLmsyvkRd0dYCwL+5/MdJW/KtCXJenz2KwhU99IMRMFXZLg3/n+UBgMF
         VdNXfCeg1Tg+c8Gje96Ue/foz1FsVNLXtXrQMmfB7FiFDcXZcIWFuWHQ1M5xBZsZanqL
         9MtA==
X-Forwarded-Encrypted: i=1; AHgh+RoAzz5ZiNaHPsEiMN8lyMF3AsVx6E5V3zL6zfgU8CSf+iYRExQZ+McA1wFC6nWh/QM1dQp/xHck6ezl@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnmg8O363yHEJBtPFcx2GqlMAR3OEMZDyY4KfBdg6mjNCcdYaf
	y47NheVnli9KW5UKoUdikXPsFuxHcaUAuxJsuDYcIBys0j+xmpPAqG1F4cmGHNuH+S5r36PJA79
	L8BEoFeqJEn7iujNnV21nBCEzNC78qMxi1bup84m3cGsnBkkKOWR7j8MywnZYg6N5ByU0R6ue
X-Gm-Gg: AR+sD10wtASwB67/ni+lV2K8hLJeNjWhLKNUvoYis26zoLExMfumaVQ7mx2mCkOI/iS
	UXTFimKl0YYexDKO6xbvOaR7PIZV8XuIPhqg/bZEsAD1toEFKyMlGaQ7JO3AJWBJSFvPrQwikuO
	DJHFXL8RMH+468KDhY6x3vCnpuYGcA44kzlfz4SMeF6H94r0juAfxcVRvKVYYiUKfcpZCQ6Mz6N
	7R/XfTeuXW6ckq2cX5IWc3zSvqU1pqY143+PESsm/DcOSyEMGSK5DUZLWRQtanDp3k4vkBqUKqy
	77pIx77Lkd83k386QaQshXqfgC0at6Ek88jQoBDXzkRGBpApp50lxXEN2JgphiToYW3EmcFYscX
	Wq4b2c6/HJMOuAQtYwJoooyFNWgHZ+R8AAjcgIDXc6LzfjXKy4R/Ya+xs1TPlZJY90uBOuM4R0d
	e8cvwmBLCudE3kCA==
X-Received: by 2002:a05:622a:2c9:b0:51c:92a0:b2ca with SMTP id d75a77b69052e-52b3865b6a9mr51751431cf.34.1785454825898;
        Thu, 30 Jul 2026 16:40:25 -0700 (PDT)
X-Received: by 2002:a05:622a:2c9:b0:51c:92a0:b2ca with SMTP id d75a77b69052e-52b3865b6a9mr51751251cf.34.1785454825502;
        Thu, 30 Jul 2026 16:40:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f6acb98efsm5449241fa.39.2026.07.30.16.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:40:23 -0700 (PDT)
Date: Fri, 31 Jul 2026 02:40:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org,
        robh@kernel.org
Subject: Re: [PATCH v8 15/18] media: iris: Introduce buffer size calculations
 for AR50LT
Message-ID: <v2por473v27dfyon36cuks4lig2p2ehkg74yy7awgaujt23rcb@jeaizpccjhpm>
References: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
 <20260730-iris-ar50lt-v8-15-6597c08cea6f@oss.qualcomm.com>
 <20260730154732.905431F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730154732.905431F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2NyBTYWx0ZWRfX2uxlebu81zCn
 JDYSjgj2QWMdSlhybJpPNKk9f8HLDWy1i5mC6neGoHrRrndVLNEODvxZPGm79BJvV5H+5sMj0HG
 k+oOr5hsZjQzAjovypi++n27kYH5aQU=
X-Authority-Analysis: v=2.4 cv=evjvCIpX c=1 sm=1 tr=0 ts=6a6be0ea cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=0IO_SnwM649x6-ejsqUA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: rt29d-ZoH99UVyXN79GwuajiV0b9agPz
X-Proofpoint-ORIG-GUID: rt29d-ZoH99UVyXN79GwuajiV0b9agPz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2NyBTYWx0ZWRfX2nREETuSj2eH
 RKlGxpXRONzT+BqMcX6gvyA3Ez02UiJbcJuyooYa7lcs1vjc0geweJC3BsamEB3WauAtflY6yWO
 HP175kCkcOxQTcd+4mDdiMaWSxATEy+oM/sWYonFg7Yptpp/gRz9V/6O3wc35WoXtfn8dSb3udn
 PQt4FjMKagW3ITEnoeHbw3oEPoIQjYiF8JeylhfyMARib3xSb011FhuuyW4PD1xRQ94Wwafraxw
 x9Ws9TbO0l/f0HpgjeKn8noSmxeZOTm2UGSb1Y99iU7xy6HyuaSAuU2GMJ9BbwwnB/dDFXAa3ZQ
 wsz8uuJlrOcXsut0cE8TNcoNbqTMic28GfVHpTIZsdSEM6eGm6zoS6TUfnjC1x2gJkDnHCDqsdD
 KgKNBRB98ZWd9ZW4NyzBEu9w+FRQvZgPwHxc3rucvvJcDlckj1r3KvSE6t8i1XXf23LcKsuczWh
 jIaWiP0VH4EdCB8Qf0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300167

On Thu, Jul 30, 2026 at 03:47:32PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The AR50LT-specific VP9 line buffer size calculation omits several essential buffer components, potentially leading to an out-of-bounds DMA write by the VPU hardware.

No, AR50LT doesn't need those.

> --
> 

-- 
With best wishes
Dmitry
