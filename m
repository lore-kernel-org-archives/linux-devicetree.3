Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813EE3A1692
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 06:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780034546; cv=none; b=XVYqli6Sag74XNWBpR+YNd8nnDUQw6SCEfkXk7r1rEtV/Zg5y5bLfy8+ewO5JWFAP4VKcxhLUTeGlMKEq0Z13WVPyrVsHInfyCahno+sTfmyD+7CtCPa8qUZI8FP3HUlIlNFwWiz9BOj4tbDJSoh8ADuaNMUSG/9TH38mfNPEHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780034546; c=relaxed/simple;
	bh=THHivrv5h392/d/ysU3/xwu1yF4Rv5QNxm1IsHFIIG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LXjP/PKqLnuTYYv+08lCZq3svzahF19Iil4enA86PVvGpXY+zhufqTtpeyl8yQPT/uDf2NRSZraLRMd0F1UISjB9ul2em89nu6D5MePJTv8NusTPupiTRavEU33VQn57ePLy/RfXg4YKw6r4kwygCWv8wfDvsMGVzbc30ZAZUIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ktiksQYg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RNk4Fwo3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ktiksQYg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RNk4Fwo3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SKks0i3253539
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 06:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hNrYnk4lnXXJn+zuG6R9jelZ
	mbhQiVGsdJjDOZ/vxjs=; b=ktiksQYgfoZbFxriECRnyQBLEwJ70YgsooQ4PJYu
	mkETrMYmyjSePBcE5knZii/oxd1rAwHVq5DerRmPQYpFsKnxmwJehV6mXavUthOs
	RXdrH3kRByIyxLa7Xheg/Sne2jURMfVdLBW82HyNC3XXPKOA0yWBwwY9tKD8TW7m
	Ow2MZ2+5Dxh1OEkkCmkdC80qS3neTEXV3n+9jppF217kazkL2WKjtch1cH1rma/P
	0t3ECUpIFq9H3QhPdWRb92mbtxAI30P40XbJlLvhFhFYU29O/oKkW8Hr/UwRKwr/
	A40MvxoER8dquLNgDDJT7dVYj5vZYUCmmRxhsJ8Hi0rlXA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eespn2vgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 06:02:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36bc5e97950so342418a91.1
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 23:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780034544; x=1780639344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hNrYnk4lnXXJn+zuG6R9jelZmbhQiVGsdJjDOZ/vxjs=;
        b=RNk4Fwo3Xf6tNVYMj+Ux615TZ2G3S0jAvPDNAS8xHfmM9TA5seP9EtIw6OvlQy9R/V
         lWAorAezgehTYNF1n7wNjkH5OgodM2TK6X9KeM+MfqqKcNjMzt/KVn/WNkv6iMoFM7vE
         QZy6+MsaF97LiVl6EQuu3ZDqld10kPB1vZXr/QjIlbJnP0c4jcDBsbXkRI1TYzLhoHGC
         Cvq3H9KXaVvkHAvdwBQPEtlccMKEgBKHnmicg8Om7wAW9Lw4QVm+VRdX/RZdL5xOryOv
         R/xpE0M2zqMbUZXJQM6+//qXgBhpseqFEkcAeyJKJrpWYRM3VHnjyKmjn9O4xX7L8/Pl
         8MJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780034544; x=1780639344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hNrYnk4lnXXJn+zuG6R9jelZmbhQiVGsdJjDOZ/vxjs=;
        b=Z1YMERV+5rNNag8cL7mtid3MhAvw25CYq0dSZfEioTDm4nVz6wOeG4TSvYoX2pD2qh
         KxyqP1q2k9LZun3fLyxaKIyAcRKsxli/VtirEOSwuYkg+rV6DhUf4su3PjGR6KVU2Mq0
         Kx2ybb4Felq9od0nf1vXregs0vPA6/myk1e7/kx9jIxscRofEO+BzYRO0TqI+QP9CRnN
         28AoE2G4sH8Y5YQ2IOuPJ/BxGlC4Bm2jB3CcuuGxzK/75oSRfS+fUA3CdCMP8ULtdWdV
         69NnY5f8uDEJCk0oRtCsF/twNfy9/gV1dzK+ekNFIlgthT4Mtt9M7Le/jIb2SSYZoxPg
         u2ww==
X-Gm-Message-State: AOJu0YxzOvJXmDtMW45I/8EDACM4dFjazAxSeK3w5YeQleomOCJ9ifi7
	qyrtowAhF2cEnbXxVK9VmB3h2rlrjNW2Yh1Sf6pZFSTZjq8GLdbxHeTECNqUxJ3XwfSjrAlSt1r
	Uoicdzcj8qeb6HWxrVrl4VW1NHlDoVaEOEAya2+7fB8WcSeFvG+ofz+P8fETBd19tUDY8NIAg
X-Gm-Gg: Acq92OEkLJYjPyfuQ0Zg1RPAqWsKVGyJ2iMQ6Y2XpzrXDbaCFB1BGtOeBeNq1XD/OX2
	vFHJ66tPjRZBqP9RSobnNUlR/NG7FOhSUOi/WQnemBzlc0yB0W9kE7Hms80FIWSTqvZRr32v0II
	poNplWoBMOr5aZBtVChYg+Prcpo7/1m0CKfXEQeF705Ko5+irFuxuZR1ZJzDIRk0jJoLNISkTBz
	s5NOPeWPELK8r/PlVJv04mwro40cbO6IgwTTK8dL66KOu255FVHaLFmYCoBVkKVtMyIbLeFso7T
	N5C8ICF1NW9GSBhq0f36R1hMNYUw9uMm36qx59dc/FF8IGsG8Qw+c3DV/cDZ0m7Eq7/M+J03biz
	u+9iCzudovzpnd1XAp9S/IgXvgdAdF/iQOiTSW7dMtMhaRaH804agtMzJM/vXIoBQjlOJ0A==
X-Received: by 2002:a17:90a:f950:b0:36a:f623:7224 with SMTP id 98e67ed59e1d1-36bbcd340abmr2032288a91.3.1780034544006;
        Thu, 28 May 2026 23:02:24 -0700 (PDT)
X-Received: by 2002:a17:90a:f950:b0:36a:f623:7224 with SMTP id 98e67ed59e1d1-36bbcd340abmr2032251a91.3.1780034543510;
        Thu, 28 May 2026 23:02:23 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc6bc0b2fsm638328a91.17.2026.05.28.23.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 23:02:23 -0700 (PDT)
Date: Fri, 29 May 2026 11:32:19 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: lemans: Add OPP-table for ICE UFS
 device node
Message-ID: <ahkr613YCCWR+EdP@hu-arakshit-hyd.qualcomm.com>
References: <20260527-add-opp-table-for-lemans-ice-ufs-v1-1-3f97f5ce60db@oss.qualcomm.com>
 <20260527101620.A83141F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527101620.A83141F000E9@smtp.kernel.org>
X-Proofpoint-GUID: rLTd78BpbH6eyD0jU3EM0k1t4qRcI7lS
X-Proofpoint-ORIG-GUID: rLTd78BpbH6eyD0jU3EM0k1t4qRcI7lS
X-Authority-Analysis: v=2.4 cv=auOCzyZV c=1 sm=1 tr=0 ts=6a192bf0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zQloMYte6k70bkImtrkA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA1NiBTYWx0ZWRfX4N0ZzvXns5ab
 FZPypMZD8QAMb7D+9Qkz3ajmKFq/oJPuJsTBr2AkF8GP3UHNmz/IZvqif5+wAgcfp9vsX9Bh/nT
 zFNcQmo/sJqvHEL84471u7+A0MbjNWNh1zm4BjArstYdnuI4tDuTZCOizqusb49tdI33OvUuM8q
 6pGzKTlJXqOiMdo2ch0zvxU9hHdeob3ZOCm0zZgHXoB3K3mdAyAY67L8NTR3e0tFOvwBdE7FwQ3
 gkZYyOZhgHmNFxGxGCS2ILz7M1hoXg2LkzKIGK286T4LKtcn8cjKLtNhj7XFLkkXE/DT2xXTT4o
 FPHx0IZTpy54O6+5AIKYRFS7Vn+4Mpv3qjGiXRLGgO6AhApMVWMP+VY09ZhZ5iTKhoICCWzi5Ku
 P/HXLkhc/KNarUuaPEhC3rSE3ogwUlzE/IREy3YyL7QNbLlfneZiK2dx7GoDaT/BRmncgwuBIyE
 nBQ92G/17b3RMO6x2GQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290056

On Wed, May 27, 2026 at 10:16:20AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Mismatch between OPP node name `opp-75000000` and its `opp-hz` value, incorrectly specifying 750 MHz instead of 75 MHz.
> --
> 
> commit 7df0ac8d5186b38efd03084ecec240e439760d84
> Author: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> 
> arm64: dts: qcom: lemans: Add OPP-table for ICE UFS device node
> 
> This commit adds an optional OPP-table for the Inline Crypto Engine (ICE) UFS
> device nodes on the Qualcomm LeMans platform. It defines the operating points
> by specifying required clock frequencies and their corresponding power domain
> performance states.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> > --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> 
> [ ... ]
> 
> > @@ -3109,6 +3109,32 @@ ice: crypto@1d88000 {
> >  			clock-names = "core",
> >  				      "iface";
> >  			power-domains = <&gcc UFS_PHY_GDSC>;
> > +
> > +			operating-points-v2 = <&ice_opp_table>;
> > +
> > +			ice_opp_table: opp-table {
> > +				compatible = "operating-points-v2";
> > +
> > +				opp-75000000 {
> > +					opp-hz = /bits/ 64 <750000000>;
> 
> [Severity: High]
> Does this opp-hz value have an extra zero? 
> 
> The node name is opp-75000000, but the frequency specified is 750000000 
> (750 MHz) instead of 75 MHz. Requesting a 750 MHz clock frequency at the 
> rpmhpd_opp_svs_l1 low power state could potentially cause clock scaling 
> failures or hardware instability for the ICE block.
> 
> > +					required-opps = <&rpmhpd_opp_svs_l1>;
> > +				};

Thanks for pointing this out.
Apologies, it's a miss on my side.
I will fix this in the next patch set.

Abhinaba Rakshit
