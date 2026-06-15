Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30193D5240
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512500; cv=none; b=Oawd1zVxSae2FWpUsyIYszAEOTnq+LZuip1PYzr0LkKfbUve6hIgs8bBiUVHe9wJk4RAoJnaE38JLqG7NCNOYXL6OE4jqq42mG+AlshlwhWbMQ0tT2Yp6Ztk2yLvT+vGTm0OCPon5hPbo3cgCIpH0dB9DjHuVrNf/xBMR1MkOyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512500; c=relaxed/simple;
	bh=ahpmKFOPe4LlOsmuVsaSKybMb/iYYSuAslh1JkXf3Ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tQaRKYeYtIzCGZ6/9VVWDv066poBbPEosoPPji5lWcdi6Nt0xqCnCx6j+bFERcuLcICuG5wP3uf35aMWDSBHqKvlwaWxQLtIpFY4XfmgVkeKiS3QuoDN9pRU3Lky4qF68z4btv3H4Z4gwNivLuVc+YkBbMvl7N9AC8AoeIDej64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KjqIPMh4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I/fhEF48; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KjqIPMh4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I/fhEF48"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6J1Ms3327542
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hPc8xs1suGXRUY4bN6+AiHsY
	kPpfPjS99CY9Muaoq8U=; b=KjqIPMh4x35FLiKxjJtT+6EebHU/3pbGmSmBKelO
	UADrAwRg3LVTZtcOoWz3H3GWDjmnHHyKAMO9zPUV7cb3nCacg9Y7gTsVRnRcF2RH
	ehMiup1wAazJI6n0BHsHeRmyiVuK+DMJ0gNPmVRwEYYkMgM+jze+TaNWM9q8Uxwu
	CtbsUw7LgW8FFJLQ7PEyj1RIwIHuEzmAOQt6JUiO29hdNxpAxA+B88DOguCpnsZS
	TuxmniLQoUVMJPeLd0xxX9LxiqefflM+dW/u6YXaxE9cMQdvXJJa3+10PG7g0n+Q
	2qJBjfq9JzGT2nOEnhPdwXKg5xzKOXX8fctI2klXLAwH9g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0cgp9t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:34:51 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-307625ee07fso10227963eec.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 01:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512491; x=1782117291; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hPc8xs1suGXRUY4bN6+AiHsYkPpfPjS99CY9Muaoq8U=;
        b=I/fhEF48tiJEErDW5c9L5q4cRFN59JOBqslABtc2KKIWxRj63A4MVIvia1AdVwi71l
         a4mwntJ9D7jMIhzaBW56tsdcdnqRpyzWRHgdXkfLR+yGjut3RHF6SyVQTBLCLUAdBR+D
         peSishPd6Prpv1bFGlE0pItOmPyO7MmITN2e6gafjy24s9sfXnx6t2dQET9KDbNF1/zb
         1LdZDHBQIEtekMCo95ueTNjiUOehCOe9QhfbE4BP2kO/qvLIb/+TsZdHtRTsx1khs2ZB
         gQiWRX4xZTuWQE1B3SGl3UhcJ4KbKCRlpwQWxfKt1mnEgpmM+lQbpSyv2rAB9POHgyzV
         OMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512491; x=1782117291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hPc8xs1suGXRUY4bN6+AiHsYkPpfPjS99CY9Muaoq8U=;
        b=H78dkqa9F+MqVbgd4cHIaclSs2MCZ3AlJ5/15yHWU0MRED5AdWxOd/7Ytui2xkDpHN
         ddoqbPplcKeJD6g3sQ3OGHoq52eRO/lRTVPxdar8xVM/cl37Y8JB14cCbnEyOdBXv6nn
         GMSim8v6ml8gN54hucMyGGO7VqTaKy4lfH/spm9qguDdyq9ilweOMx9/A6JUQEw3Pu0E
         Smxul0vgrW4FgQBSV1xHBqw1xDMk2NDdcDVl653pxZs3YGkbnQ2T0nAxvEGkDYWpmpBM
         +ZwKM1gOLK9RJ4AnTU7qV7k8NRHAS8ubDzb5TDcHwTJSgXk9IFC8iOsdf/IqUtEjHdeJ
         /g8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+w2eUUfboi71u2fnHb0R1gu9IKP1qKbDaiDu4uJ/XK5zGx6SPmVG1ptugLRCKWbAA0X2oQ50kRyVq+@vger.kernel.org
X-Gm-Message-State: AOJu0YyYSNJQLjN9rLdqEsTlrPkz7LYSCLDTLR+uV4DZ6GNEhqQRlT3F
	rtTGntdMwWFNAaWvxBE5xcOmPn5shLEuslbPjkHJKN5GxIYCXTKbezAgcQ/6rpt/kGYb2oGveFv
	OJE+X/V7yxwc8M0TOp4XlHCZznayeS0ib0bf7DTzWsrXu10wfPIbx54HCn/ICgDyS
X-Gm-Gg: Acq92OFLjfJ04nfHN+ym8cxp4OFn+qlV913MX1OH1/D1tdh9ulMM8JnVCymP2a6Cxdm
	3uBgJGof4YooHC+WDlHjYgTfeilMVBYAlnHHcnCTL7KoCn8WVKq0ixrK8X5K+0KrIzcc4jFg+0/
	lENvbemzYjY+/7ieXao1Az3JKVUKAC4JuEV+w+xJkP0YoGjcNbmIsdhL8UYphK8GmBgrj9gyF8t
	UeWmh9dPX1Eo7fZ83ntp2WndJZMDmrTK0tU83AL2LiAIMUP92xRct1ltdAxCoW7NCsya57cUvBS
	cClLC16OgiGvDenHg0T+vRyRJeFShyZFrbGUQWAdW49YFJjL3J1dprAxmySLTCNrkNo9xb06cMA
	/n07m2EooQrYLGyZbYSSAU3nVhhD7PHSmgX3cYjb2YIT2Nf0jwQFm/4SFbPgUzs5HZCLt
X-Received: by 2002:a05:7301:19a2:b0:304:ba84:a0cc with SMTP id 5a478bee46e88-30820262d7cmr7349894eec.33.1781512491199;
        Mon, 15 Jun 2026 01:34:51 -0700 (PDT)
X-Received: by 2002:a05:7301:19a2:b0:304:ba84:a0cc with SMTP id 5a478bee46e88-30820262d7cmr7349871eec.33.1781512490626;
        Mon, 15 Jun 2026 01:34:50 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e489621sm14099720eec.6.2026.06.15.01.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:34:50 -0700 (PDT)
Date: Mon, 15 Jun 2026 01:34:48 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v4 2/7] clk: qcom: Add generic clkref_en support
Message-ID: <ai+5KOgueiN9FTq4@hu-qianyu-lv.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
 <034a70bb-43f7-4b94-8a85-dce466081473@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <034a70bb-43f7-4b94-8a85-dce466081473@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: utedKDiG6L7YRrpETJZBrIHqjayNO3lR
X-Authority-Analysis: v=2.4 cv=NPLlPU6g c=1 sm=1 tr=0 ts=6a2fb92b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ukEeeJt9K7XwON3hb0cA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: utedKDiG6L7YRrpETJZBrIHqjayNO3lR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfXwSWxE/lODCDE
 DKHcgBVIVd/J8d3ENlzE0Mpdi+u3uI2+BDq7gNJ4prYKKCKVP/O1T1xOkOV0sMopblbKL5GKPww
 9IBcVDO7Xlo1mUnMxH///3t4efBVPsU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfXxCWaAoxEHQ1b
 krOBJr4WQlksBebpp36bDexpv67WGuvhtL+UvChztEvghIIBhCFFeo5tu45h8vtekyWCWR+XnaC
 K1iHYe2+g0sfqobuEibU9QRi/U69tkOwva+C1wQe9KEsEthC8MNIJrrL0xdASLPeF44TREFiZNZ
 g5KC2gdRdyhirNaGlgfcSXzBlLCiioiWiRqzKSA03KQvI5K2m+mr3ZL+JqZHkcAndkek3Uu9/9d
 v4KRem4Z7nHJXPvugErof2Tv5r7dYJUcuCUYiZlz75E5or2NEYbSlln81ZSnDWtQnJffLC0Sh77
 Z4miWADEny/uo6X1ThogJxUh+im0mQAkbMjcjdfDzDjiskDYP5Ek8AcGK9pSzpbN9p2XL5z7DDa
 B763lg4gfMehlMhKO5oW/22Qn4t9YA/56ntzMqAKyFVjDuMT9a6l9sHiE942TT36XKFHhFT91Zq
 8FmchiLyFFtvaqVTiHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150089

On Tue, Jun 09, 2026 at 02:38:08PM +0200, Konrad Dybcio wrote:
> On 5/28/26 4:29 AM, Qiang Yu wrote:
> > Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
> > a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
> > register controls whether refclk is gated through to the PHY side.
> > 
> > These clkref controls are different from typical GCC branch clocks:
> > - only a single enable bit is present, without branch-style config bits
> > - regulators must be voted before enable and unvoted after disable
> > 
> > Model this as a dedicated clk_ref clock type with custom clk_ops instead
> > of reusing struct clk_branch semantics.
> > 
> > Also provide a common registration/probe API so the same clkref model
> > can be reused regardless of where clkref_en registers are placed, e.g.
> > TCSR on glymur and TLMM on SM8750.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +struct qcom_clk_ref {
> > +	struct clk_hw hw;
> > +	struct clk_init_data init_data;
> 
> We don't need init_data for each one of these, we can construct it in
> probe scope:
> 
> struct clk_init_data init_data = { };
> 
> init_data.name = clk_ref->desc.name;
> init_data.parent_data = &qcom_clk_ref_parent_data;
> init_data.num_parents = 1;
> init_data.ops = &qcom_clk_ref_ops;
> clk_ref->hw.init = &init_data;
> 
> ret = devm_clk_hw_register(dev, hw);
> // not needed past that point, __clk_register zeroes hw->init internally
>

Thanks, will fix in next version.

- Qiang Yu
> Konrad
