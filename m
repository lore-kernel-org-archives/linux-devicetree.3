Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004D825783A
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 01:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778549069; cv=none; b=HUUIkYyyRBBIoiJJYD/g0/bINyvJN6zr+6+t456K1WVfDH726XZzLQTi+mmHA3UWes/1nNyx/9JhtLAHeILF6pesNR7fsKqvba/gnEDnBOTcvq9vQvHmKsnSqq1bgCZjWePT8ZvU9mmqh/ZqBw2Qt1bKjIXwgFDAH2Wi2KiC2p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778549069; c=relaxed/simple;
	bh=/HY/3EXO1dot9m4fKKPMYAyghvHdtEvWg2sxr+fL9BE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ebggHFPsiNyerJ15Xpk5wWQ9qgJ4VyX8KroqBrqHWHSKFhKECFA/d3Q+lsRqtgxXA1rlTJVDHEdZM3KqKhLPNNRn2EvUukzlVVpSKkQK9qx2nYYIoHy6RjbaV9HefpLusnVR046WnghzNswDEfJZpaFFMI9TqaV6y7O6Ou6BUnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BPYVHwrl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KdLGf+61; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BPYVHwrl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KdLGf+61"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6cKo2518581
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 01:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UX9uGTJZqignWW15iG2/KEx2
	xOEStYHCdjhj8vGHywU=; b=BPYVHwrlYnVFlCqJwzmueX7H/uaSmd4KkjKJLVYO
	2lHOYlOu9e49t7eXy87BeHns8LxRmPGE6e+RUSJJ3Nq3cJOJvfAVGj+aEddqppjh
	v+2kIspTg/i9GYLQVrUxf33kUs8jMu0IRx6NPFla/wW01yl1u9etbIKNXfb78xbv
	2PAbKeT10q6apSSRbuRVE1hstX2dUuV61HPS3x0k78xn9XWvt4BdNb+RlBv3NL3d
	3D+396MHZZ9PvqcXIZSKqb5WwwnAkoMQC1djiCmzVuzqi32l9uE+wMniEh8EQlDk
	1iVSyCboA/XUtMMBsyg+0V3d4CUVDnDlc+f3M0lOjROVgw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv1gw4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 01:24:26 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ee34588671so7175538eec.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 18:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778549066; x=1779153866; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UX9uGTJZqignWW15iG2/KEx2xOEStYHCdjhj8vGHywU=;
        b=KdLGf+61XxTp/6yFURdvD+gLgVH7UzrBGfO0xI5RElYGHAv+1tgNs/xujm73ZR7U+P
         fmATKcSPiPva5UphFAt7mkSsv0qkHBnfPz3rWL/6DrVfVtidQIadUXDBoNgPepw+mWUM
         NMm5hJ/1Fe7oWpY2eVvWvY7w5Py66m3r1X3lnS8PX1F1iDB/5VijGBx6ifCgIpd74nJt
         UW1j0jhx35F6Rg2STNUs+S8nzifA3HkUyRkSVvJ/kJD9nyTjBdKPVYq8Gw92Vbxho4+M
         ffABom6DpC05eNBHC2tq2XW1j5L5RaC3tfM/GhyD47InGLY3/u12g2J1I9V6+AM1WHaF
         C1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778549066; x=1779153866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UX9uGTJZqignWW15iG2/KEx2xOEStYHCdjhj8vGHywU=;
        b=Pw5DbBt0yrfZLbnvqYHxQtzslyE9kSvRp/3z+btzt5+3lZxItDud5+1Zw4yPBMz1qh
         xcVkvHk3Km5p9GcTWLAZ8JIKqkmHQPQV6C85lXdNR9Luu1Pp/iO44UijxWiuUdK6fSA2
         yg+11CCeKTf2TDzUMSb/9NiqqYrturctkQOQ01yxltKDL/EwwNs5vEyRXEzD/ltrhh9w
         OWHGMkAXRcmSGMNyIR5Rux38iTmy1V8QDSIRY3yUItVNSq1kvtGeWg9EISNnkNrOzXes
         P4buJZNEZhLRJTxpfGD2LdolLI6y2nm39Yl3JXcuYJNf1rfeTAciDlpkMz1tNQXVcOP3
         t1tg==
X-Forwarded-Encrypted: i=1; AFNElJ8DFOvnWRahtTprYc8Gy3js3Fl2ne5Pg1OiD4C3WTGgbxuyUHfKHeSxrpK6ueF+GT5XGwj4VTrv0num@vger.kernel.org
X-Gm-Message-State: AOJu0YwPtPzceOFXK8oB8Fg+pPsOCFeTeJdKsUyhhJ8aHZ67MhR3FlpG
	twJ8bLs3JgGYnCR8Z2xcv/KPQr8YbDfV0uAsCaTj/Tzhd8XQ6b/3qdfoBnTIF9D23oO7y392VvR
	EJd9qm+KDs82Ie2Yu4H43ERUU/DusT2Cf1kwtC8RWyHYrBcVJuImQs52lB5Oyvp7r
X-Gm-Gg: Acq92OGiWaTW0HHMu5Pq9NjG+HiL68RR2gjwjnr3fEYrN6M0u3dFljrQrVoxiAbLTmy
	z/ta1iC2vmXvLJ8/sCBkU0V1iy4GrP/Ufqxk7cyYoj6EEnu4ELlBrVuzI0KjMPK4NiM+nM1slyB
	offfz8UfLG2mHBV2GCeO3sHnDYevEQCXbew58TXIj3Nc+V1LyVEzKZT069kkGFp7oacbvMq06Pq
	cJJQi2yWru3FK9Zv1Vxl5H2SaXT7fZ1h9AOnYNZe4UPL+yRZ+cAHr5F2ZH2t0/BUz3CpV8vJZ1M
	XO3SZwXZiuz2gUnX15oXXaF0460tCj8D7aUHQuKAGVlBQR/+PUlfzyyZNZq40LQG4xKJARcFsWQ
	+Or841NbLJNEo08IVydUUsXPrxmeJy6/YMDn+JrS+8unESjOtAzBueAxdCuJx5NZd
X-Received: by 2002:a05:693c:2c0d:b0:2d4:94cc:eebb with SMTP id 5a478bee46e88-2ffd5ace39dmr482920eec.13.1778549065873;
        Mon, 11 May 2026 18:24:25 -0700 (PDT)
X-Received: by 2002:a05:693c:2c0d:b0:2d4:94cc:eebb with SMTP id 5a478bee46e88-2ffd5ace39dmr482904eec.13.1778549065320;
        Mon, 11 May 2026 18:24:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885b87dsm19204916eec.21.2026.05.11.18.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 18:24:25 -0700 (PDT)
Date: Tue, 12 May 2026 09:24:19 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: qcom: Add device tree for Nord SoC series
Message-ID: <agKBQ2rRtapoFlCE@QCOM-aGQu4IUr3Y>
References: <20260427023455.236410-1-shengchao.guo@oss.qualcomm.com>
 <20260427023455.236410-2-shengchao.guo@oss.qualcomm.com>
 <20260428-dangerous-garnet-collie-dacccf@quoll>
 <e1a84d37-04a1-4c36-b6c3-f8830df9a744@kernel.org>
 <afCxhUaxLEcbosvV@QCOM-aGQu4IUr3Y>
 <agJ-Qc71PloUM1pI@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agJ-Qc71PloUM1pI@baldur>
X-Proofpoint-GUID: oyDBH771OahIrHS_pila0cpRmgDnMXti
X-Proofpoint-ORIG-GUID: oyDBH771OahIrHS_pila0cpRmgDnMXti
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAxMCBTYWx0ZWRfXzT8h320pD7ur
 +A0FEpd+FhQ5eXsBAg5Hr7XA1Dqwe5VovSlpC6iw8mwopdVVE44GcmyMiST5kP2KCjhnjbaVbaC
 CpWUYIALYpic9qLkRNRYw4tWl3BUZtemDnpqh3OPa4xmlzlYi+N5GlTjgu0nF6WN6cGbg9SIjOO
 BgniQUhDRN05xsLRtuyGf4UreqkbnKTLfEF7xvkhFAgKd2CTAYn1P78oAtIxVPczaosodGVapmR
 plq3pC4haacN9WScHDIYrl3AG/nJN4Sa8M1V33L0wlAZ4XfsxHu7kLuPaDVs/9xawxTory1SR54
 e0bD+zlqciCNm2DuULTiUJS7LTh61DzRLgC8SsyRtMtqqlULDVsRb7s8KSO5JXkvxI7krdbLC8t
 GIBVJlDWon+p7145E+hTDxcrwckCXlC/YMLO69YZxHfq37iUSXkUp/QLF7GM9zJlEj6f1QH8ltx
 Lib/xiFF9AGHbxV9uxQ==
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a02814a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=xjU7Otet6xYI0sZ-r80A:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120010

On Mon, May 11, 2026 at 08:12:01PM -0500, Bjorn Andersson wrote:
> On Tue, Apr 28, 2026 at 09:09:25PM +0800, Shawn Guo wrote:
> > On Tue, Apr 28, 2026 at 09:28:47AM +0200, Krzysztof Kozlowski wrote:
> > > On 28/04/2026 09:24, Krzysztof Kozlowski wrote:
> > > > On Mon, Apr 27, 2026 at 10:34:52AM +0800, Shawn Guo wrote:
> > ...
> > > >> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
> [..]
> > > >> +			compatible = "qcom,oryon-1-5";
> > > > 
> > > > I asked you to send this binding WITH the user, because they go via
> > > > the same tree. I see the user, but no binding for it in the patchset.
> > > 
> > > And few others like SCM are also missing. I am talking about this many
> > > times already, to multiple vendors, and I am still surprised why people
> > > on purpose give more work to the maintainer. Well, not my tree, so not
> > > my work, but if you ever wonder why your patches are not applied for
> > > longer time, that could be one of the reasons.
> > 
> > Yes, I should have sent all those bindings targeting Bjorn as part of
> > this series to make it easier for Bjorn.  But I'm not sure cpus.yaml
> > change is one of them, as I'm sending it to Rob.
> > 
> 
> Not sure if you have settled this by now, but I can merge such binding
> change together with the dts change.

Thank you for the offering, Bjorn!

I will include it into dts series if Rob hasn't picked it up when v2
of dts is ready for posting.

Shawn
