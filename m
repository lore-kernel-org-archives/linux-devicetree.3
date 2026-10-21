Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792604612;
	b=KzLMatOAvgx5SdsdDi8XOeHWNAgNq72T4wmihfFpPjB3NVhNVhLHDPMCr+yDB54JEQ2t
	 jeBrYY8VycGVPMDEMf16vqh/wxd7Yn6XUoL8O3uLI3dqQ0kinLUHJdBCGwnYFM6Fb1dPC
	 aJRZYHIFbilqUxh1XQOVh4omPrwp3UXUPj9leSG4kLI501MBber1crbLLX6ffXY1KBIfP
	 ciJ5Q5nO2K07j6tsQz/15yyjEIB57m1oOcFI2LxB2i2rzMivvdNJ1JH8bwpgHv+J6WrFF
	 VghHgnTqeJJleV6pATEH2kT1l9mxwvbVzBUDb8iZQPR4ePg0bMdSYWLQsWXdbtZ0UKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792604612;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aSFKPdeTRbaa2HPhrRZ5lrX5j562cGmEBOpF2qSZv8s=;
	b=CYtDA2UDrb8I/Ifa6E7HaYLxN9joKeL+CHxorx2BeI6fL4BdwvcZ/uNycA79OMkwT4Th
	 Gn0lcMkqZvKPINhA8vyUPfJmZ5bl6Dux98feR1V76iEIZISeViS1Y6Xh5yxwnCGpUNkAW
	 JSzB7ta44IX75Ykh82TY/Hgae8wzUns9QZEC92QYXykZuQT5I/Brr3d1w3TsSeOeu2rjt
	 czyDf6czGOR3YKJ4QDHxJfncPCypFCUWRUOPqv9aP2f2QDS+3U4xYh8aCJSwc5d72d4FM
	 jAdbVgvdjcDpEzH4lRFji287IbwHmiiqHND288GRxpqYWaX0cK6kx99Bw+YZdLP81dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=khjXYNgY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OayrCijp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A37606A31D
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 17:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8A37606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=khjXYNgY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OayrCijp
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFU3FM4158612
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 17:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aSFKPdeTRbaa2HPhrRZ5lrX5
	j562cGmEBOpF2qSZv8s=; b=khjXYNgYOHV8sfchxq2tMxChs5gp1WBoK0+wGuuV
	vrubl1HA/2f6mHJ/1GdZHeEEjTsGufVlDRIDYhhf6TlrLzYusF8ifSqsd5wE+Abr
	ewlyso1tgsJDKqPW2E7FEgTk2y/7HKmg1Tee05FkYZZF0zI428AXaBt9BhhVnQBB
	+SkzeP/dfIevydKZatyDL1pMO+Z6mte5JRAGq/IMounxO/iRlt3FVUw6CQL2Cx7L
	+ytgjwP39PwH4lCvSKTFDxhxr8BoRdcE9AFyqm/twgU+8QAulUUk1HqYGaxlswlS
	F6CAV4HrHchMvniE8akFXyUO1X2up4jPjZHiz4C1abruhw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5q95su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 17:43:30 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917baea8e5dso21644986d6.3
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792604610; x=1793209410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aSFKPdeTRbaa2HPhrRZ5lrX5j562cGmEBOpF2qSZv8s=;
        b=OayrCijp16EU3jPa5yO8/sliQOVNdMKp/iB4XHvSCVTnyR4HHdltnejRAZQyZdB3FN
         dBRSn6MpyyL+m4moC64PaPx7BGw80TS6yAsudVpQt21kHjdXUEuE/l032wm40hcl7Uqd
         C8uHVnivziK9SMc3d4YJ9DOGBuUyjju3qZUCdVQ4NhgqrHA30aLEi+iWIsUtanI2snc+
         y18KexqiONjCm8L5S00KuQJA/4DXTg5IkVH2J3pBzs2hew4O3wTXJZP72BitnlX1aYO6
         8ENNMbQ0l3XV4w8jyxn1cXw3+L+r5E4auZosU4O/NKMRBGPzgGmfXbQXIdEil61nTRXf
         GT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792604610; x=1793209410;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aSFKPdeTRbaa2HPhrRZ5lrX5j562cGmEBOpF2qSZv8s=;
        b=ImJEjrwwHiYA+su5l52W3g+WFGApJ6wb/YUphC0nQ27mqNsEpdIcZ/E/34UmGktmJG
         r6+x/xzjt3sKrTGdkvGigd2o7jR6QwFJIMjtwE5aZGqcsj44kkkXJRa3L/QKBm7xX/VU
         sjlm1LahVOd4BmK6G12SKjDOnL6LaCuhbaA2mF3HU3cDAj5NkfPRMFolQrHl2m10/DpX
         eQ6W0MF+c6qv/M1+dJzP8bbmQZqVZZM3wc0jII2lENYpcLY8HtXrvlSxZ5IDf2P1bCKd
         OYonINmtzQbQz/Cm5tZt/J/1tgEq1D+iWl7Vg5rmd0Sq7HOXMRUOMyYM/j/z0bRiQoOY
         jDJw==
X-Forwarded-Encrypted: i=1; AKwUvBxYh0ogTDWvPm5M1lHkV94tScMBvn+SeVMUtLtOtBgCxWZkPeqWghkSFMO/L/1DQ5CJHG77Gtf+m5pc@vger.kernel.org
X-Gm-Message-State: AFq9FYL25XfoENT1QXoLNuyVs3CZuGOLaLhhPGVtAf7aTfUpLmNRNBeE
	D0g2syOSMotIWV+sz3NXKwhdqwHz48Ut4RDjx0RrzcPkDKN7qgkMV0ymlnxLz5j5l8VJOWEFJUX
	TKqanyF7Wyfl1dv6zQ+UeJLwK3VkPD+bXgdvX6S+iAiB27z/uZk83MwROsggIKBLS
X-Gm-Gg: AYBFou1XukhBot75aBJF2MyA4EsBBVPm1GivyoJ5IyxYv6i1uAThclhWqy4KbZ/Z8tb
	hFl/2ryoeDAg89k3uytzFiqDWzL53S42buYUp7D19ecSm1y3HicT2aesu7ltG50wtj31Ytz2kRN
	rh7WhP1mQQGL/vebPsVRQmtoEN8EAmAvU+FR1BpEUNrse0Vzxq2r1g2KFK/MgSeX/NFv+g6l9h6
	DcUtfmGCnjFSZWGkHn7WbZea0dkLjvmUgHyoXQ83L01Ay13xaW8g2MtvaFiueIPnMIgsyITd7WS
	J3JMFK0amLnnD1M5ACtlGB7AyRqI6iWW7b4hOcPdUot0gul6CRn5sZ8JD9UTdld34pNOf6f/DEE
	JBTg8b5wb5sVFopMVp25+hHusoDQ9vj3gTjC/EYa5CjQ3oKsZqZCLIyppWNrFpFMvNNLUfZM/70
	kPz/1ykSF9Wy00
X-Received: by 2002:a05:620a:4496:b0:93e:5861:34df with SMTP id af79cd13be357-93f57feafa5mr527031785a.47.1792604609970;
        Wed, 21 Oct 2026 10:43:29 -0700 (PDT)
X-Received: by 2002:a05:620a:4496:b0:93e:5861:34df with SMTP id af79cd13be357-93f57feafa5mr527027985a.47.1792604609508;
        Wed, 21 Oct 2026 10:43:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa12040ecsm640028e87.35.2026.10.21.10.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:43:28 -0700 (PDT)
Date: Wed, 21 Oct 2026 20:43:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: qcom: clk-alpha-pll: Skip Zonda PLL
 configuration if already enabled
Message-ID: <tx64ni2u6paa7pofcylmlwytjjqsi23pbiqnhp7wywbbywla2f@3xaql533unhw>
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
 <20261007-ipq9650_apss_clk-v1-2-fd4c2b3cbdea@oss.qualcomm.com>
 <3faeade1-1bd2-4e74-95ae-7396a1ef1ce4@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3faeade1-1bd2-4e74-95ae-7396a1ef1ce4@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA3MCBTYWx0ZWRfX38tunV2hL3oU
 PNMgceS1iUy9aibceRuPTzlRb4rx7XEghPGiw0zWRoVt9ANU5nMXVkSyjoUCF7yOyct22mtXRl+
 g+7DrLKaZ7MrGKqY4ysFJlTmjBdOdK0=
X-Authority-Analysis: v=2.4 cv=eJaGH3p1 c=1 sm=1 tr=0 ts=6ad8f9c2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=JR2_SSPbN-Trn9morxEA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: FETZCp8GZj6sltN1eORsatpwmGvV3OPg
X-Proofpoint-ORIG-GUID: FETZCp8GZj6sltN1eORsatpwmGvV3OPg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA3MCBTYWx0ZWRfX05Pj7TxK/A0E
 nF+aAnbKj0Z5Ses1EA3nkIi+OTWCt4RRsVzhmmTTKiPbR1PYL+cwpNUYFs5uhQtvmpg1rjnAEqz
 ym9mVeyYDStKxtRH98oDq7EQDgLayIfyGcqZHFIe4Xqro/GNA1VNdwofhm3BXxnKZoN/F5f6pQj
 8vbp7Ky4PkytDlzpRg/gWLPlVkqLPRmfwwGdV48A+0fMUfERdQzKf8m4XovWmBP8FvRaIn7zTH5
 bF45SSs+iLXELOobSd7Ck++Ia0CA7NXBsFR8a7fjGZsjHH/YRdwWu2GYmTgN0cgH2jfBSmnYBi2
 5byIp4LsCBeRqKBIcaSphpD6UMnEsZiT5QeKlzYrR2QX/Tn8iofGa1luoIfl0aA8K5WiY37jdK6
 AQCDnQMpsiod4F6Z+9PV85a5JU1CDIZe+5lflewIre/Mvxz+bzdUwZfufvpDlBi4x95vwI3DgXR
 csqO2z+ThYlR7V1vi1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210070

On Fri, Oct 16, 2026 at 03:50:19PM +0200, Konrad Dybcio wrote:
> On 10/7/26 8:50 AM, Kathiravan Thirumoorthy wrote:
> > On IPQ9650, the bootloader configures and enables the APSS Zonda PLL
> > that provide the clocks for the A55 CPU cores and L3 interconnect. When
> > the APSS clock driver probes, it attempts to reconfigure the already
> > running PLLs. As part of the reconfiguration sequence, the PLL output is
> > disabled and the PLL is placed into standby before being re-enabled.
> > Since the CPUs are actively clocked from these PLLs, removing the clock
> > during this window causes the system to hang.
> > 
> > Avoid reconfiguring PLLs that are already enabled and return early,
> > similar to clk_trion_pll_configure().
> > 
> > Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> > ---
> >  drivers/clk/qcom/clk-alpha-pll.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> > index 60173b076cc5..3641b2da92cd 100644
> > --- a/drivers/clk/qcom/clk-alpha-pll.c
> > +++ b/drivers/clk/qcom/clk-alpha-pll.c
> > @@ -2162,6 +2162,10 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_5lpe_ops);
> >  void clk_zonda_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
> >  			     const struct alpha_pll_config *config)
> >  {
> > +	/* Check if PLL is already enabled */
> > +	if (trion_pll_is_enabled(pll, regmap))
> > +		return;
> 
> Please add a debug print to match the other similar calls
> 
> with that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

With that in place:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
