Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B0478F2B
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 20:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782506984; cv=none; b=kzpkhbkHvzlD5T1VeF+1esFjOEhSoAn6wwOXssealLcTRkjW+WfZzKymKMjUIJBfVM2jij4Iv9ssQVtu4MbI1vL9sP66jvMz6XRLe+VBoabvesM7Kp6ANeU7LblI7FecMe+RphmBZYC3nIgMcV+F/vuDlE0eW8cS8ZE5beJpYaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782506984; c=relaxed/simple;
	bh=fKeIsblTZ0E23FHRZVpCwRr64HLAxL+Wv28mrFvs1Vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=goG4T9h7nRfAcdDQnQxmHGor4NdTKoMUXI3Zwd1SzS19oOZwXrcMwZqSM51mKZU/+ZWYyU1cUv+b6CGSsNDCPBD0b6IMcu63gIYW5MSohkIS4+vA94D2W5q6MAl1b/GfGfkhVu40ChmW7fcSja6Bz4rBRbW1OGdLnY2EFhL8XdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mmgBY5Ms; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HDGlGqAE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mmgBY5Ms";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HDGlGqAE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QJ8X5w2308816
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 20:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2ky5oJQblObHqyE+E/5ZcFxz4/F4Xq5LfboN+e/NPrg=; b=mmgBY5MsyBNarjGq
	fCkNbaKz90Ha1k+46FNVNXlo1ap1dhf9TJmVaTuMznzEwv6wr8Uu/rbmc26oy0RQ
	oTkATT0fUsjjOhKWN8wsH1vBu8EHhANjBCLn6d3SUm/OXYoswaw6NPDSg7sWNbk8
	Aw50wT4mBGPlxuU41Twl3oehLQ9kZsUHVdznR9wRiVnv128HODRg5riSiJwU+H42
	HGZbAs1V11m6dWJaLoa5qPpuwWghr0oIwJoBwP3pzj54cewSWxchOK93zEVjOUHD
	1pLmCSxBcvpwIjaWdRmZTrRe+Fl1U1eAZuSQcyfcDhprcktNrG5fXmHigvVLfD5Q
	oXQuag==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1tc3hhhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 20:49:42 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8e05aa49693so38034676d6.3
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 13:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782506981; x=1783111781; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2ky5oJQblObHqyE+E/5ZcFxz4/F4Xq5LfboN+e/NPrg=;
        b=HDGlGqAEJWqmsg2cDgTOsbK+LisVdyLOxjLwfBEzYq984Qv+sz8i/P2Lh1ERov1oTz
         Nf83lGcZnRwKs3ZjRTe8BpKD33CwCsZC2fL2/kvq1LabPtin2yFVY+QfmRwqHZpPIMze
         txO+LInK3yAzVAZ/+ZHg6XhHNsLvxnv+IfaBMvZSQ9Y8K5Dw5kShEsYiLp0cifOdrH8o
         LtJ7IUOaltPnvM9xu3oxMOiBHdj7b1Ky+wdXt27K/4nZ7LyiOzTF8QL0JamAQJUWbv8G
         b3k+vXCAxU2YRPrrEvBVxAbh8rt4VAXZvDWc4cHNqRDZ1ij7OHoKj/L3rAfUfzu1px2d
         KAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782506981; x=1783111781;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ky5oJQblObHqyE+E/5ZcFxz4/F4Xq5LfboN+e/NPrg=;
        b=ehAI4lSunDv1pZZ+7AZ7GepJlTQ1lFDJTGiNv4jGpyLOAyll8oFsbac/9l2PhLWEJ7
         4Z0UQtWP6rXZd0QI1H4+O1QGskI4QmN/BPVxVFdmKBjYgsVyczdycK68FfCb7BLvWrzp
         03Zs94qDSUoQ8rh7juLBZ9JAeIbZ1zmf+HljeuC3PQOV8d5wZdruEl0ymMcw5z9Ysglx
         /x06qd8ZJ1qbZLaYnRS9Zmf6qwWC6Y/wqDm14krTefb4X9SyaKH7zs0JfQnYMjZceyUE
         BoMOBNvnXhesO5hhN0XfuOM1ZfjijkSuwEpsluq4UkjvYsiH8OeAXB5IJac8EbPB1Oy1
         KdcQ==
X-Forwarded-Encrypted: i=1; AFNElJ+PFWXbtshWQvx2f5GwRM/wlERqA6vOe3UoDo2mQU921nE9J3z3AV0pxSxSwcHZJbNTFYIA9kdldvqU@vger.kernel.org
X-Gm-Message-State: AOJu0Yz73xyt5q6zMixOSpb3ipCcihQvasS2+JRDIf0lShDk4C73/R9+
	d4WJF+wNdv+RT+6ZUGC1AcnolZUnfd4TsJDb+SlWIbq44IcZeqQMzse7aiBh7FnJ7h9NQrZSxR8
	KzCaUDMlcFq9gGUbR2b1THNnu3UG99S7Hu9TfovhAk/tQFlm3wZkKWnaAB4Cp15c1
X-Gm-Gg: AfdE7cl3fJ0zSbGHaGEI2Urm/pM6MJXSVPB/cHQMJ+oAeysX8Hj1Y0FPayf3get7Rnr
	BCD9Pr9Oqgp32QevKWYLKNtNK3yO/1A+o9uxWk2sjky12qsXznvtRcmzAb2EMjy7fwifp2rS+lf
	DdzpNQk3P7cqRrIEsEvBTolvVIB5qL0gPS+96/swAIJbaZondR0ULZ4NuMJ9fC9IDQBMpRkrGFG
	MYx/U1qALJLVDfMFQAJTRHygJq52IdkvIJidHacwL9Gu86UNSNvEcN2QA9ZNirR57K8wkFYX1OH
	yGp9rELh8WBuq+bWRbRuLJaxSuMOAzTJtbxlZYLUkzO591uBs1IKFhP7qdtrS6u8MIb6tFQp+Nv
	izLvRH5uazhpc+rN8XTrN0m60EwXW0UqBBZOCLj03Ae6y9LHfPMZDgEr/mFgDWZHAK4r499PjoA
	9VPkhMZtq0b28+G60pt80d3crF
X-Received: by 2002:a05:620a:a911:b0:929:e498:c102 with SMTP id af79cd13be357-929e498c1b1mr877300385a.14.1782506981550;
        Fri, 26 Jun 2026 13:49:41 -0700 (PDT)
X-Received: by 2002:a05:620a:a911:b0:929:e498:c102 with SMTP id af79cd13be357-929e498c1b1mr877296885a.14.1782506981109;
        Fri, 26 Jun 2026 13:49:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad6954a617sm3697560e87.2.2026.06.26.13.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 13:49:39 -0700 (PDT)
Date: Fri, 26 Jun 2026 23:49:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Doug Anderson <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahap@qti.qualcomm.com>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: kodiak: Enable 4-lane DP via
 QMP Combo PHY
Message-ID: <xcirlthd4ck2mf7r6corjw3mmd4gx3hbm6wty5grodhr63wxvr@4glvc4vdvpqt>
References: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
 <ag_QL5DIo7MxsdYU@baldur>
 <84ed2c32-16d0-4c29-a06a-9242eeb8e86e@oss.qualcomm.com>
 <CAD=FV=XQH3kng7MV=Jr=HmZQc4TEUCq+V3TsLNChr5vUHUtXAg@mail.gmail.com>
 <d4641613-dcf0-4437-9aaf-dede83afe04b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d4641613-dcf0-4437-9aaf-dede83afe04b@oss.qualcomm.com>
X-Proofpoint-GUID: LFxdl88pPhqkPtGe_3PSekKJZc-rUj0P
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE3MiBTYWx0ZWRfX+ypZO040wey7
 2uHTcCI7mSrwqY/zlt+kGv3rXSIitTmGYaB+FmBa2ab+kjWOis1PPO0/XW32C9g4GliIlGj2p1O
 FGn1Y24pn6BtTCrGWH53X1CfXvGjZG8=
X-Proofpoint-ORIG-GUID: LFxdl88pPhqkPtGe_3PSekKJZc-rUj0P
X-Authority-Analysis: v=2.4 cv=T4m8ifKQ c=1 sm=1 tr=0 ts=6a3ee5e6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=qgbJk5cZIR8ycAwPhMgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE3MiBTYWx0ZWRfX2MBDo/pzKLF7
 eO+AQMurOYPWBR8eoUgoNWLSf8mgy2o4WPklt8KJpQgwhGn9BWQQv+5GgAk612uYMcxGLwFUE86
 N1T4cxN3/+RF0lp6mH69VcWw4mp5BOdeo5u0dtYK2TsS4eZ39U32cGNd6Izy3VBKLz4ES0ycs0B
 S/G6xQEbu7YuJreHm/u+tkFs3pNCUPzTtlNhy2vemH/Im7M9c25qXftuc5BlSg0qHQkIlYxRXg/
 YeYxW90GJuYTYTz+HbOgCcdbto3mBLAuwhsh1UTdvx2zaU6KBY481kebY56APJyz1HP0kyN9Qih
 jCM1B16FvlZV0drM5kmTRa0zV/Tmx+stAV5iJwyepOSGvIg+qc9GLKalIGWKgQTYD+QVfMyr+DI
 XSbBt6Na7uTSgMD87Ta1pakS0dvWgGc/pXpUTQspEAJDktQHTIHpo5+LcQFU1nOQvilFipLxUzo
 mxMR+80qeMH0gXo5MCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260172

On Fri, Jun 26, 2026 at 06:02:12PM +0200, Konrad Dybcio wrote:
> On 6/22/26 12:11 AM, Doug Anderson wrote:
> > Hi,
> > 
> > On Fri, Jun 19, 2026 at 8:34 AM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> 
> [...]
> 
> 
> >>>
> >>> Are you sure that herobrine has 4 lanes routed on the PCB?
> >>
> >> +Doug any chance you still have schematics for that old boy?
> >>
> >> Bjorn, perhaps we could switch to a model where we define the max
> >> capabilities (i.e. 4-lane 8.1 GHz link) in the SoC DTs and only limit
> >> them as necessary? Not meeting these is borderline a board defect anyway
> > 
> > Bleh, I'd forgotten what a pain it was to look at herobrine schematics
> > with the whole qcard "abstraction".
> > 
> > My memory and a quick glance at schematics makes me say that herobrine
> > only has 2 lanes of DP. The problem is that this SoC really wasn't
> > designed with a laptop in mind. I seem to remember there only being
> > one USB 3 port and it is muxed with two of the DP lanes (since the SoC
> > is designed to drive a single Type-C port). In order to support all of
> > the ports that a laptop should have, you pretty much need to feed that
> > one USB 3 port into a USB hub and hardcode the DP to always use two
> > lanes.

This matches my memory and the abstractions that Stephen has been trying
to implement.

> > 
> > The two DP lanes then go to a mux where they can be routed either
> > towards the left Type C port or the right Type C port.
> > 
> > In terms of whether we can support the 8.1 GHz link speed, I remember
> > much debate during the project, but I don't recall all the details. I
> > think the discussion was that we were supposed to support the higher
> > speeds, but we had to disable them because they weren't working. From
> > my fuzzy memory, it was unclear whether the problem was known to be
> > hardware or software related. I can try to dig deeper if it's
> > relevant.
> 
> If anyone still has herobrine easily accessible, I guess a smoke test
> with a high res display and this:

I remember that it was not stable. HBR3 worked in some cases and didn't
in the other cases. So, I'd rather not touch the old grampa and leave it
as is.

> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> index 5c5e4f1dd221..a39e418fdabb 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> @@ -464,7 +464,7 @@ &mdss_dp {
>  
>  &mdss_dp_out {
>         data-lanes = <0 1>;
> -       link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
> +       link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>  };
>  
>  /* NVMe drive, enabled on a per-board basis */
> 
> would be the quickest way to confirm that. Although we can just leave
> it as-is if it's problematic.. I think you said there's some folks that
> still use it a couple years ago

-- 
With best wishes
Dmitry
