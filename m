Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793238670;
	b=uvLEenNCfgnBXwyocNfYC5ujBswcKeWScoX1fMVOd1s4dl9K6JkaSqjN86xlgwfoxzzV
	 Y0kJy6uQjN58Aez2cGZtXcEaRl5INi2YpjsEZhS4Y7nFF4HXQlM92CsDTAdvawCg0WzGM
	 s0qDxrQzvYJdve0AvQOE7x6Li1tGX0Zy4tOjDZxssZ2mr1cVglYMN2hKruIEiJhKzfzi1
	 27kDiCio3uh5/lrKs3eOkw0ElO8v+KgHO1YxFa09TgqIWIJ7gciHe03lNOxmimy4aR0wF
	 Tev6haRqUjAWh9oKToyOzVYTlNPrbaKNZNfNK8HWZhTheop2gY+VBejPo2acAob8/qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793238670;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2NgBNbLq+9RK99duvmMJui2cE6p6jlGXHry0ZBzeGwQ=;
	b=GsjNygVkgWP4F+DtIUnOW7f3uyBAcQxft8uM5lCE0jaYz9Ic1QWqwWYUMj0Oj+sBAdWI
	 MGZlkx1sTzeTcIwdzuVXFDjwD7y43kIV2cioBtO8mLjsO4kIMaqUB2xhnUD4B1wz2+qvT
	 4R2amvSgV18TXwzUlr9ASJePxj99w1OZGExdxjFc8ZGpyvN2WrZdBI2fcQ7WLeW0ATAi1
	 //RZQwy5AW9rNS0mPvGLnVEBTl8fvVxD3p93QNX00p8neDFrCJIH/mZHR78mKGP9InZaB
	 nV2GkcbNw1N5rbn1ofEgOJQGz/nGyiUMBqWmV7h+uCosRo7KmTnKC4lwO8XFPL3Zatw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PjE+YALq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f71RSJsk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E01E606A31E
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 01:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E01E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PjE+YALq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f71RSJsk
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jZdB1791151
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 01:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2NgBNbLq+9RK99duvmMJui2c
	E6p6jlGXHry0ZBzeGwQ=; b=PjE+YALq5oSs0K/SsDeOpvvR0L5UI9h9ymC7pRL4
	Sh1CdtNvbAUhOeF+ITnRzndDlS43zOdQvMRl7oTlwDSxC1XtXQ0pYSP9QWcOM/Ex
	6lXeUF6dfiTvAdaP38CmtZ5/rBba9KVHhu3X1dfXrUyxkTG/jYH+QWCnTWmqY+iR
	uMyqAaqquH6+ior3SZemUKnpK8mwg/+epjGvrdVh96j11o2rocDcEQxzZGsLg2et
	Z1v9hBLCt3l7nq72oN5/TEdSlaH/Bt6/qRPvCdt2OM8IYQHV+iewGf5ppQM5gQrE
	kBVaIbnuhE4wrRxsyrtRrQCa6ONeslB1TOwuvj6hxKFYvQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp3rj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 01:51:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f37c94ceeso51794085a.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 18:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793238663; x=1793843463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2NgBNbLq+9RK99duvmMJui2cE6p6jlGXHry0ZBzeGwQ=;
        b=f71RSJskHUY8w0Up1IqrAWrSwJ7qGp7VMJPalzdmC6nWtGtY0GtO0lQvAIKMaDR+st
         OhwIHpUSb7y+7bsUEJqUOqeEinweGKXfKLei5UqkvHVFmTNgRdb5s4rv6suzhE3AA+ix
         SSwKewQloywHNNyJkKSTXIUOF9Xj2ScQfP+wmkaM3WuHC7e7ZqaynF1rTK4iZOqA7V5w
         pieba7oY8GrhYd6CtejMLlgoiU6wx1CYH5FWSSCo57w20zrI3EcOMO3+oyt80kmE3H1K
         /hdD7KQXPPAMFzhfI49agL10slInQvPueJC6Sb77zCNity0kgwVLQWDIUilpSsj1fD4c
         myUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793238663; x=1793843463;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2NgBNbLq+9RK99duvmMJui2cE6p6jlGXHry0ZBzeGwQ=;
        b=kGio2Hxu6zWUXrmsHvMIoC4Ul7QY8RwiXnfgGSMvPzqwntUf7vO1Fyx7GlWzqvOUdR
         3RMhNITLrl5vYaFtS7wmzzWOxIt5xI/gHdKUWV5AvFWtvNuAZHab59Fws1cIfCr1zPP7
         gklSwFbh1hobUXQ6EeP/XgZgwsjvU76jSqn5TqUurSSB7XfTOHaVk/2ccmQjcozzTOrw
         aFOCK2XBISQVnhM9JPjBlucedXUzT0jFhE7vDy3NXgAo3DnbYWvNDsON3SW8y3HNWiQ7
         GcWrN0zmIGj1Sm/bvhkDzixGuDBMpfVctSHeDageJLkPBrf+cyhJySdcD6TnDmoY4ZTX
         BC0w==
X-Forwarded-Encrypted: i=1; AKwUvBzyGr8S0yHS8NCeyU3Jc6Oaf5b4HynAxAQRKURXjkJq+Its6J7YPkxovBnYGYqiL5+tmIXb3ToxHfEo@vger.kernel.org
X-Gm-Message-State: AFq9FYIPrFNWvuWADLEylB/ovGDUBEronWxAtSPes1fOKCTCrFZLkrjp
	P3geScOJqHq6F+oD5/ZXtjAXbGotnHvcFJfizFNhJkn/FC73WHDJ/dfPM2bcJIrK/jutQ8GPRzm
	PUZAd6/hA1I/XC8MBhGujbTY+bNHTXI11PLx2nB90A6jcm/9SPJDbbn/ZAVinTZfz
X-Gm-Gg: AYBFou08r0Uty8EoVcb7kjW0GUiQDHryKT9jjD1/r6TtvzUfwkRnuoD5+BlW8d+nO8Z
	LLGVLXA8JOjMOEiqJmTAxzgqOT+beuZpN9tgKyNi+n7JatNBelKOtVK4XJTsr7c9kEjRV4oIwNE
	KWmjW2zQwCcMkHx7rdreI5Vs8Y3s21YvGPNi0fywkOifB1h+cFuN+WiXT0R5bRO9kS+ORhQXqx3
	pgEmEIuEUe3bDdM4FM7vtrDpEzKTg1IbEcb3lmHqxXmr6gjlLK+Qm6sET58PSFQMy4Z8P7JdGJk
	9Yhe2dNrrofqAAFyTPrw2CVw3t1tflbKJPhYRipMKse2yJYqtLCsSwK7E3QYSFAodqBuEnIEsnk
	54L1jhH2FbCoLBHSIRC5sDTkuDJRlJV4V2blNiK+CT3lhijPoDq4+DVk98ftYv2NmmpRJl5Ajyn
	WoBveRjuGWVOs0UZD/2xbdo89rq50Qc4supbYfcMjcBdFCVcTtC931tXzw66tl3w==
X-Received: by 2002:a05:620a:2815:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-94413381feemr207245385a.17.1793238662568;
        Wed, 28 Oct 2026 18:51:02 -0700 (PDT)
X-Received: by 2002:a05:620a:2815:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-94413381feemr207242985a.17.1793238661951;
        Wed, 28 Oct 2026 18:51:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca5c8f4asm982402e87.83.2026.10.28.18.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 18:50:59 -0700 (PDT)
Date: Thu, 29 Oct 2026 03:50:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom,camcc-sm8250: add
 interconnect provider
Message-ID: <uqtvrqp7rsmxcloz2fgzv2jbcofd3x7y6hm6plnan5mao4t5rr@6lxub7q3duti>
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
 <20261016170701.1504338-2-atanas.filipov@oss.qualcomm.com>
 <20261020-bloodhound-of-remarkable-debate-11afe3@quoll>
 <7ca815b3-4712-42e4-996d-4a1e53cad492@oss.qualcomm.com>
 <Sm-FvdxaOiXpzzGo30wECHdQF_-LtUaJCO3mGpBUxXfnVCYjOLE5DhNWdNmOMhYdkR1RMXhPzWuHhsZJkJ_Vzw==@protonmail.internalid>
 <20261028181040.3515955-1-atanas.filipov@oss.qualcomm.com>
 <f0618a27-cee2-4f39-a578-fcbf3c51607a@kernel.org>
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
In-Reply-To: <f0618a27-cee2-4f39-a578-fcbf3c51607a@kernel.org>
X-Proofpoint-GUID: xnvbdRt3ibcZkpmmaWMZuE8T_Brz04wm
X-Proofpoint-ORIG-GUID: xnvbdRt3ibcZkpmmaWMZuE8T_Brz04wm
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae2a687 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=z-wHjszcAMnUrtkC1bAA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAwNyBTYWx0ZWRfXxbXimA3/PSLv
 wELj0nAzJJAtMRZMjxy4jIGzt5RTwdwOIOY3kqjMFQV6St1zD0l5xTBBqHIbFNSJukTSW+LbkMX
 fEm58+tdg6hkbUh4nHtmkCBG0Kb0hg0nTf9ALuSLLSd1YoZpiAC7oWN9kIfrSk2YSif4L2Oys9c
 TE2/8pQczlSTXcC+QQUX8ujIsvui0byYyUzpnwWE3ty4/uaum0N45C1wgOaCdxj/PZOiII7ZkL0
 QhC6g7bd9sCjDd6U/eQrow5FRJZWrRf0DG3Gm1Mm4CoEs5u68v7XQGZDe4ah2uJi+IZzyxsiLQ2
 jZK9exjuBHQgXIsGPiWufqKDZUQ5GLjlUxpf25NsTs1NxPkBVY+E8f0yG5Q9bDt/nM9+loo7xfh
 JymJqJwrgVvZsUPaw9CXOHal+xQBIuSRH+EMYWBSqptMj0ltCRRxVea6+XZoaHOjBQSe8iDoXov
 f8gI2UI3BTNBh1L3o9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAwNyBTYWx0ZWRfX1am54nXgDJIc
 qSeZ47Yb1c/Per2o1Cew1OeYMXhLSL8ErUTK5fOdKAN0Ez4IU9WSb3mUyPYlpF7G5JNhEe1Kwss
 fHiAzMYAxjR7TS4ly/1Ah/ffHeOS4Ac=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290007

On Wed, Oct 28, 2026 at 11:00:29PM +0100, Bryan O'Donoghue wrote:
> On 28/10/2026 19:10, Atanas Filipov wrote:
> > What clock votes cannot express is why I think the camera NoC is an
> > interconnect:
> > 
> >   - The camera NoC is a bus with several independent masters: the VFE
> >     write ports, JPEG and OPE. They share it on the way to the MMSS NoC,
> >     and the camnoc AXI clock sets its throughput.
> 
> I've always conceptually viewed the CamNoc as just another NoC that happens
> to live inside of the TITAN_TOP_GDSC power-island.
> 
> I think the trouble here is the CAMNOC_AXI_CLK is just one clock, it's not
> interconnecting any two things at all.
> 
> Noc entries in DT usually look like
> 
> interconnects = <&gem_noc MASTER_AMPSS_M0 0
> 		 &config_noc SLAVE_VENUS_CFG 0>,
> 		<&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI_CH0 0>;
> 		interconnect-names = "cpu-cfg", "video-mem";
> 
> In the second case we're connecting an MMSS port to a DRAM port i.e. two
> completely separate producers/consumers and we have specific ports that
> RPM/RPMh is involved in managing.

RPM / RPMh are Qualcomm-specific abstractions. If you look underneath,
you'd see NoC clocks, being managed by the RPMh cores. We also have OSM
device, which describes how each of the cores / clusters is connected to
the L3 cache. On MSM8996 similarly there is a CBF device, which
describes connection between two core clusters.

From my PoV, CAMNOX_AXI, is just the same NoC clock, just not being
wired through RPM/RPMh. From this point of view the clock can be
described as as an interconnect, it gives correct abstraction: no matter
how the camera blocks are connected or how the connection between them
is managed in hardware / firmware / clock devices, there is a bus (aka
interconnect) between those camera blocks. If at some point the clock
becomes managed by RPMh, it won't (significantly) change the hardware
description

> 
> Which is not the case for CamNoc - here really we have some shared clocks
> which we need to calculate across components within the Camera power-island.
> 
> In downstream the CPAs code does that.
> 
> - icc-clk would I think over-provision clocks
> - CCF would as you've observed under-provision
> 
> - But a CPA's analog in upstream which components set/consume ?
> 
> That would work.
> 
> After all what we are doing here _is_ specific to how camera works. We don't
> really have many - any ? other examples in Qcom SoCs where we lump a number
> of different semi-independent components into one area - ICP, CDM, VFE, JPEG
> and ask them to share aggregated clocks - in a way that is specific to -
> guessing but - specific to how these components get modeled in silicon test
> benches.
> 
> My vote is to replicate CPAs in upstream with a CPA's icc provider driver.
> 
> The bandwidth calculations are already proven out in downstream and if we
> get it right - potentially its something downstream could switch to.
> 
> We could even use the interconnect API inside of the CPA's driver but, I
> think just doing votes via interconnect and icc_set_bw() into icc-clk in the
> drivers directly won't produce the same bandwidth calculations we have in
> downstream - which you may loathe downstream code but the clock calculations
> we'd assume are ~ a pretty good starting point.
> 
> So; make the CPAs driver an icc provider.
> 
> cpas_icc_set() could/should absorb the downstream cam_cpas_hw.c heuristic
> for calculating the aggregate clocks.
> 
> Its not represented in generic icc-clk right now and as we add in more
> clocks/SoCs this disparity will grow.
> 
> ---
> bod

-- 
With best wishes
Dmitry
