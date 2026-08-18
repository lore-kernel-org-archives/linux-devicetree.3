Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D913ACF0E
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 03:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787023972; cv=none; b=beZ4hqWgo6aDrt9y0FUdseJgVdTiXFcutAjFpIV16uLWxG1r1t6pX+ODGf7Yp6I4230NhLZzkHdOl+SDRO5xou8uNE2Yc+pLYcvgF5Hf+hWbifwrZM5IiS3Q5/dpBViPe+qgQFkwSxuWPVsnAMukhEVl7caiQf22PEHEJWeyAS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787023972; c=relaxed/simple;
	bh=05mmTgA6Rnt5XSnRQE1Lh2jV3yVtAM4f2nkEjq8ypgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JdPV9D0gPWhTl+jE5KJUyVMiGSUrG7CBu0OyOfCSuh6yiT2kwEFglrI/uRdxd3LP/K76S4uWYQwyOq0FlmkO6zwwaCxXQ7G40SQG5fOaoK2WxnzC8j8qWui7fAVQz3NPOYV7bjgRBS7hlj0AEd1qWRGdPTFlRMw9dRog+40nPvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b2jxQ239; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EA4G2Vp9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b2jxQ239";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EA4G2Vp9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLkXsg3464536
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 03:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6jrYo2RZtbsIDb/KF9qa9avTbzl1dNVpFeA9zuf0xzo=; b=b2jxQ239rA/pNoAP
	5M3cv5Txn600212XZtTGjjas3/wySQJZ5YxWlf0bVRzTO5C9uSYPw7Th/gf77jQv
	KRMGuvoMUv5ECRYtyFJ8kKsiwnT/69Y+NTtZ+vvmQmtU5+mMDqKuisK+vbTjM37h
	kA85xUdcvjLbKm6D4YCRoGSkpk+evbpnOqPETnL/bOqO5997GFZPUIcfHMHYon6N
	PiyEkgdhTW9tUdcE/bIGeByH31YC7nM63E3pLtPLN2dD0MALwYOkFYfDNmHZM4FG
	nbeUa5BgQRUdicwZEwPgt2tEvv88aoxG7ipnMCQAiBkUcFX10Ygf3qAXe44n1AxX
	qA9XHg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4611adv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 03:32:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930a098ea19so560853685a.1
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 20:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787023969; x=1787628769; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6jrYo2RZtbsIDb/KF9qa9avTbzl1dNVpFeA9zuf0xzo=;
        b=EA4G2Vp9QzdYWWw7UMzyICFYnjHLfgA8fTmPlZuiuKShx/l4WDv/5Y6u/nrDVkPp5f
         Fv04cu391UJQPuEAn9pskHM4giOOoRZ2z7zWoq5PFww4Fw4AYEZC95PoZuKUnAGVUruq
         6FIVHy41GXCldnizejnPNWWnsVHu4qu0gCrKP/gffG9bDp77G2GAhKXREC9UsTrGLvOt
         8j5lruIUGhOE8ZVMy87NLOCWHgUAe7h73LdRd8izQLQuw5ye6giENfL4d8RQMwZzUQV3
         gECo3/wxM1ZgJFGNFiFj1qPr7UMRo7sjpNm7sr8Bq2qPWUE6CKSAgxhqSr8z6ckfgkUp
         cH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787023969; x=1787628769;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6jrYo2RZtbsIDb/KF9qa9avTbzl1dNVpFeA9zuf0xzo=;
        b=NPujejs1IZy2PmhSVWS0Nf9D8l/YhoASGMMv2WaAt9X3+6rCBaZ+bbOV4j6jFHQWS4
         Pn1zAd7buP88kzrp5JWcAcTZ8mbOkyHPBuaIgNa9Akxotdpu1zAHx/1zO+xmehplJqJo
         dyGHcbnFX0X4OnU6ggQXWfrxlZQHVWXjnMOrwEhmE1zY7YeQqZbz0zlnlr8tuPgeFkkI
         88or85A4yh40a6BiDtNMFBt66vmIonHJSc15W0gf+Q6Uo64cmY/5hNHj0DLckf8huagi
         M/iSaY4zaEI6CHVOtB+HiJlpxPjPFIrcwOOXZXjJ6D9IY+ToaS0EYF8yqOxttmxc2Sjr
         S6uw==
X-Forwarded-Encrypted: i=1; AHgh+RpVPUVBSUsYCRU+KnsL87buePjSbb/wq8jjUF8X6y9tdHKOr3KciZu5HeWyNsIESqPDLupiBKowIWbJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwDCYvemqbhhocS0NyQA51GmXQvfgZdrulzxLiO531pijpeALxa
	nb6tZGIkrdJx3XTmuRCd8l0HMwp3b8vOarChJdFDabPnS3aS6i+SWJAEEKDricbELZGrn3fTytv
	uGJKE4FbqovkgmGBEeKJtL0rkqhqOzB9te1WWrmK9/CBKjhSJ3iLGbrWof7lD/phE
X-Gm-Gg: AR+sD12BDG0XviONzzaKnVHgd+N71ZOzqxC57eGE0BoM6PxxGlXis8SO3iORh2Q7yTd
	mqdQqiq7wDrW9nikj/ucik3FClJeuVpNYOyiCXl8Ufa1sbC71SEb/O+Xu4hvyUZeme64q/FEXvl
	hNltEcwta1TTYPcRX/ocVW3a7kOacaZT1b1m/swkIAqXIjajWxTAQTxFZt+YHlQzNNF13SabE5A
	ZwnzhorwERJ74wo4hQGTCTlfY7VP8+28V2A+jJWckAeR4zK62VsvND6L6qVeVha4M5tSaMODaSx
	cXu1CDrh6z1DOUkHGV0g4TNTmnbVtgDtfjZ8LYR/CupsOuerVAcyeOcewmxKeuUBkQYL1gMaNtt
	yxuuCvIL9E1lHuCHZPbL0kC95gFTJcU1HTcn61UCKruehH9uQlMxbXE/7YL6F00vs5h/MOw9EJ9
	0gbCMivRMk+Cj6
X-Received: by 2002:a05:620a:720a:b0:936:695a:185a with SMTP id af79cd13be357-936d2356e91mr2661690385a.44.1787023968539;
        Mon, 17 Aug 2026 20:32:48 -0700 (PDT)
X-Received: by 2002:a05:620a:720a:b0:936:695a:185a with SMTP id af79cd13be357-936d2356e91mr2661688185a.44.1787023968128;
        Mon, 17 Aug 2026 20:32:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cffea7bsm846691e87.50.2026.08.17.20.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:32:45 -0700 (PDT)
Date: Tue, 18 Aug 2026 06:32:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
Message-ID: <6jwrfg2vffra5dlqrp46l2ehtmwhfguu3s4acfixiue2p2ei3w@g6k5wxdmchh2>
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
 <b36691d3-e996-4fc0-8955-25beeeecc385@oss.qualcomm.com>
 <ccab8aae-d980-423a-b39e-3ce2a7c82542@oss.qualcomm.com>
 <53a32af5-daa8-4a11-86c9-10b1fbf01566@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53a32af5-daa8-4a11-86c9-10b1fbf01566@oss.qualcomm.com>
X-Proofpoint-GUID: BUeL1oqbh2Xv9-zf52pgLTuWX6c_5s9j
X-Proofpoint-ORIG-GUID: BUeL1oqbh2Xv9-zf52pgLTuWX6c_5s9j
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAyNCBTYWx0ZWRfX8LPvValG9swq
 zq7DkhAflefgSJSEcReN5E0JGN19C6NnloGkjH+7LWyyusLtjiygRvwUcuTRPyk8ieDj9OhGWmR
 9HbjDwX4CJU8rCJhRwUUICG0iAcnWs0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAyNCBTYWx0ZWRfXzyU0ebWbpX/V
 2htXkfWeOlWlOuA1OoHKs7tmKKW6c/arIUt11wca8TIW2p+BYH7GLkd1vxglJtNSAdYnF/fiRdI
 0/dAZHalRYcPo1iCZkMDIrdt5bPVvIOV3ktPsDhPwTuFrxSsaW4SzV9SGXLolNrrdeEmaSB/plU
 +bmRD9L082HPjFK5Ih4FYn1UZ4zNELMvHg64OddOk/wNwBRsVyvDYFa5u2rzFALu0c6U0jP7fmg
 7huLmot+82b+47SDSJyhgUelDIlEDEk6ikXExy39kCqsnjKTTucwiVOXbmt41gjKTx6IhtW/ELn
 IiigYWPZbfWNZ1/i503jbkut6+5O5r4clu1zEi8SeFBuqqluaINWAyuLnsCQD9mVXX0tUOI7xD6
 60AhgLsDb2j77XS3a1FVB3bjPa0RBmWJcTdyjPr0u/VIyOtBAfQVRQmjV8OLDNWLDPW4af28zsu
 hR8hgrMLI10v9t4ZQ5w==
X-Authority-Analysis: v=2.4 cv=UslT8ewB c=1 sm=1 tr=0 ts=6a83d261 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=F_vBso_8M4dMwCL1aLIA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180024

On Mon, Aug 17, 2026 at 04:12:51PM +0200, Konrad Dybcio wrote:
> On 8/13/26 9:44 AM, Yongxing Mou wrote:
> > 
> > 
> > On 7/20/2026 4:49 PM, Konrad Dybcio wrote:
> >> On 7/20/26 10:43 AM, Yongxing Mou wrote:
> >>> Kaanapali (SM8750) and Glymur use two display power domains.
> >>> CORE_GDSC powers the main display hardware while INT2_GDSC
> >>> powers a subset of SSPP blocks.
> >>
> >> Can they operate independently? Does INT2_GDSC need to be
> >> powered on after CORE_GDSC?
> >>
> > On Kaanapali, my understanding is that CORE_GDSC and INT2_GDSC should generally track the same state, except that INT2_GDSC may be powered down when SSPP1 (VIG2/VIG3/DMA5) is unused.
> >    - CORE off, INT2 off
> >     - CORE on,  INT2 off
> >     - CORE on,  INT2 on
> >> If so, perhaps changing the clock driver to make CORE a parent
> >> of INT2 could be the simpler solution
> >>
> >> Konrad
> > That would still need DT and binding changes -- DPU has to reference INT2_GDSC directly to gate it independently, so it can't be hidden in the clock driver. The two GDSCs have independent GDSCR registers with no HW-enforced sequencing, so they appear to be peers rather than parent/child.
> 
> No, if that was a reasonable change (which I don't know if it is), the
> genpd core would take care of enabling the parent before the child, since
> the genpds are intrinsically hierarchical

That sounds like an interesting quirk, but then I wonder if we end up
spending extra power in cases when only CORE_GDSC is required for the
device

-- 
With best wishes
Dmitry
