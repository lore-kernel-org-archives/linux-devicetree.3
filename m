Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2E13ACEF3
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 12:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782132574; cv=none; b=DBjYlcP1yu4qRhFLObHqUfUqM4aMOFOYrD7fD5MOujSaj+Arq3GfmWBFY6WBZArUNj1eC7LQL+6plN3x81KiVEGl+sAoQeJW5mk/t2/EAjdztqwuTLVIeIyxzAkVzx0Xl52HLjTQEEuxuWXzTWhtGyIrWG2q2EHu3kZpcwfQmMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782132574; c=relaxed/simple;
	bh=jNMx3iwvsbfpD5vQQDO+RS21sWblQ8a23Qh7gdZ0oLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rO5iWtbI7ae21eCxncgMJsgkj8vS1Di36/DuXqxC+B3CwlfhyNRqiMznH9BJl/uCunfJMdV8Kl1TD+FCetaMU2lDYMGuPRowgjWBisnF3CitOgokxrb8Ev9SHJwn+Z+Ec2NunAWdVrHwz8k6ZdBv7RrBG4Ud0iuOz2uoa0ztiWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VrA9SgoS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZAphlMpX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VrA9SgoS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZAphlMpX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MApZcG960585
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 12:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gBgL71/3RmD2QYBALbwcAC5G
	yQQNU9UzYK85MCGr084=; b=VrA9SgoSW6PR2KrK3hJ5bdc+NBVoG7Ja9yzOw3d8
	ghLAxRdgPCIrruRAbbXw9boz4IEnitKpPsTPFqo5PAsyhvisTqP0GwcGKIHRrx9E
	Ecvi1w1fTXbSgqQF9w+BWU5+8Nx4IdexE4jbMzMQtO14rjNeEz2IW7UdpstfNTtl
	SFriAwswDsq2mCL/5vMK2O4yz3teAms+SXmAzP97AIykSQ8CW4wEMZ/ZR0pj1qLf
	8dELuPgck4SyUHR9Lb3Ee/sIsz4wClflQnnEGBuiZGSBAfUVp1VbFvRdEQ9KzdSR
	4geleVayiPs4m4/bj0EPAfZDFjv44DRlCwxqg5EvBWuJdw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewjexxk6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 12:49:31 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bccca5620so5810675eec.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782132570; x=1782737370; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gBgL71/3RmD2QYBALbwcAC5GyQQNU9UzYK85MCGr084=;
        b=ZAphlMpXIw7YbfEtoppaptOXP//CJixG3uvMv0zUIwmKmOXXCzj//BcVH7cR8BS53H
         TrDLoSYOxljr3Rc/cz20DbyXklFVzrE9Qll1c52/YCeLJOd2snjPycgl6/Zih1ZsCeSA
         nuFO/Y0UmYWwEzJYcRiIR1+9BtF3/sq4Ms7tf53E1zkKutxP9IfKvE+QytFouWAki73d
         1VcoYy9weuuRq9GaMxP52XkvRnVBduLXY57O9lwqkQnc5Uz2UCECKwJXPV+E5+U45q2H
         9LXjjcqctKT5qqaicMPlmkF9qnh6+oK6EkCinR+1zWphbU/ltI7EwFashLV4vwSMNbqj
         f4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782132570; x=1782737370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBgL71/3RmD2QYBALbwcAC5GyQQNU9UzYK85MCGr084=;
        b=bgcQmdyb2Nd/RxjIVYj9UxbtU9z8t9V9s5s48AGaUvng/79UaDLvs8ecvpWzY57GD/
         Sk58qzEC+tX6F1IeBs/thsMgie38hdjC/ZZVLkn1fT8BjOPb/eSC3ZXjX+mC2uFWPL2l
         k3KnPMTCNPEmL/7DzG+Iqf+ALBIkP5xoNysSEU5ufC8HzrdwE38LcIRncusXTzoNSTu8
         T3Z/q2b5XdcdKk5rzigwEPQKap83q6HwtPg8dmiYIssctvcCmkyhLQq9nQHFQ9/9y/tc
         fap53JhhEDYA/1BUXkso2uCkeg/GvXorfrfd1Ye/vpSfquXuQ0u2gDfLCYCtnDTKHvxo
         nv6w==
X-Forwarded-Encrypted: i=1; AHgh+RraFZ8lR2/9ngUxoDXyll7LpxsoeXbllVFLaxyc0K29I/KoPbKpwxUEjPex4epIWGkyAHC0clJBSMn6@vger.kernel.org
X-Gm-Message-State: AOJu0YxT0qs7/V2xTiChQMQhMVxCSV/1cDgovyfBMbYsxTFvaxcIJeX1
	Xy3ryJm6WvsBZ2ayMJG3sF5j3mbfUbH4nGAj1YQ5xEmuwVDEUDIN6wUUEmLGo36akEeeHh7jT7K
	ot6g2nqkU1BFsM6x7l4OXcz+UdT8hLNyuy0y/aSAvSma8irKtGwY55E9nUF/qcvVD
X-Gm-Gg: AfdE7cmcQPYXCBtf6Cn20FELnoUUOOK4ribZLoHbgDsgsZ8iSpkFR9IeDKdnnbTUrgW
	rFZtmUthCyDahOEMqTf3y6w28MV7BpKaIpuTRrfShlgpnq5DR1mvFlxxD1xDrvzuvvdg5jQG7p1
	c4VnkAl3cqV0FQdtVWO31FZQgfRGuYGx7eZlJRVLzxAYb+drTpjZ7kVn4ued/kThcRW2wJEBG5c
	V+AFYet7wELLcntVxrLlQstOfog4VT3FeLSIudlCi2XpoT0VdldZ8JHOk9alHaIighxxHYlSWfB
	80VursX4niOq2vJ/Hb2j1gwN6ENOOko+gl/bu0wF6fo/UXHV7OW+8YQpnM8l2r4RV0RCiX8OWYc
	98g7HS0Cn4FunXutu6f+T9a34uLyQ5JTrk61f3KFtTHoKW2Bz1E7KxZIXLA==
X-Received: by 2002:a05:693c:42c6:b0:30c:1b70:896d with SMTP id 5a478bee46e88-30c1b70d9cdmr5364481eec.31.1782132570488;
        Mon, 22 Jun 2026 05:49:30 -0700 (PDT)
X-Received: by 2002:a05:693c:42c6:b0:30c:1b70:896d with SMTP id 5a478bee46e88-30c1b70d9cdmr5364453eec.31.1782132569728;
        Mon, 22 Jun 2026 05:49:29 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba1f0a9sm10322450eec.2.2026.06.22.05.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 05:49:29 -0700 (PDT)
Date: Mon, 22 Jun 2026 05:49:27 -0700
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
Subject: Re: [PATCH v6 5/8] clk: qcom: tcsrcc-glymur: Add Mahua QREF
 regulator support
Message-ID: <ajkvV28hEWFfnwa6@hu-qianyu-lv.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-5-c939c22ded0c@oss.qualcomm.com>
 <5f32d4c2-f90d-4f66-96b1-c9c7987ac18e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f32d4c2-f90d-4f66-96b1-c9c7987ac18e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEyNyBTYWx0ZWRfXz1T/OjJVFEjT
 GB/ZohjWB3GrhcOjX5r201heFrO0TpSuAqkC/iAN9ZbwHYJSuYAYG+SWPF7bd6qBqNmyKG3QYbj
 m+Vcu3o/teMM01oKLA/ApCmqjkl5PPS+tUqHZ0RJqBuloSGXNS4HjJSTyBJ9TBeFoUtF2KTccxH
 wu5dR2nEsEZQznkdQRypI0RsZQdHPvrsXAXz4Fuiy7EUVGJvPh53woTeOoTFCJ8SOiC9chsEbuz
 HjwTMKH7g/Qdoa7CrMFoMp2do93rhCbuPWfsjwOkIGIMfjBzaK9LZMcfd4gq8FuMBSHfK+sM5uh
 NtBDktpEhDKabt0wkTTdifpwMyD51ua9UYM+AUVO5D0jJriIUxunips+J1wfgjE16/xPUjdQb9t
 dC7kIjwuEvX1q3Xti5COM+A239P+7tiV3AIiqwhR2ljjg+mwTEsE9f2TYrwSUS9HdWUglSB0+45
 glLvPtDsn7J1BJBd3/A==
X-Proofpoint-ORIG-GUID: rMshdkcGi-o0I3uj0x-4a16EQujQh_V8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEyNyBTYWx0ZWRfX3+TTUNvCAprf
 zvv3G5UjusLsx6QgFQf4Vlt56XHmhIGKyXib7tRL+nas0x6NG0seGsfwyQVc5znMKB2gdbd2Wq3
 jD4ywMUbBJx+Rt8M435USWRPhXdyXvU=
X-Authority-Analysis: v=2.4 cv=YtA/gYYX c=1 sm=1 tr=0 ts=6a392f5b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=a186fHh2H6T-cRz7arYA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: rMshdkcGi-o0I3uj0x-4a16EQujQh_V8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220127

On Mon, Jun 22, 2026 at 01:35:45PM +0200, Konrad Dybcio wrote:
> On 6/22/26 7:11 AM, Qiang Yu wrote:
> > Mahua is based on Glymur but uses a different QREF topology, requiring
> > distinct regulator lists and clock descriptors for its PCIe clock
> > references.
> > 
> > Add mahua-specific regulator arrays and clk descriptor table, and use
> > match_data to select the correct descriptor table per compatible string at
> > probe time.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +static const struct qcom_clk_ref_desc tcsr_cc_mahua_clk_descs[] = {
> > +	[TCSR_EDP_CLKREF_EN] = {
> > +		.name = "tcsr_edp_clkref_en",
> > +		.offset = 0x60,
> 
> EDP goes through CXO1->TX->RPT0->RX0
> 
> > +	},
> > +	[TCSR_PCIE_2_CLKREF_EN] = {
> > +		.name = "tcsr_pcie_2_clkref_en",
> > +		.offset = 0x4c,
> > +		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
> > +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
> 
> this is apparently for PCIE4 (the name you used unfortunately actually
> matches the register in TCSR..)
> 
> (ok)
> 
> > +	},
> > +	[TCSR_PCIE_3_CLKREF_EN] = {
> > +		.name = "tcsr_pcie_3_clkref_en",
> > +		.offset = 0x54,
> > +		.regulator_names = mahua_tcsr_tx1_rpt012_rx2_regulators,
> > +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt012_rx2_regulators),
> 
> This is PCIe3 (actually)
> 
> CXO1->TX->RPT0->RPT1->RPT2->RX2 (ok)
> 
> > +	},
> > +	[TCSR_PCIE_4_CLKREF_EN] = {
> > +		.name = "tcsr_pcie_4_clkref_en",
> > +		.offset = 0x58,
> > +		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
> > +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
> 
> This is PCIe6
> 
> CXO1->TX->RPT0->RPT1->RX1 (ok)
> 
> > +	},
> > +	[TCSR_USB2_1_CLKREF_EN] = {
> > +		.name = "tcsr_usb2_1_clkref_en",
> > +		.offset = 0x6c,
> > +	},
> 
> (usb_hs phy)
> CXO1->TX->RPT3->RPT4->RPT5->RX3
> 
> > +	[TCSR_USB2_2_CLKREF_EN] = {
> > +		.name = "tcsr_usb2_2_clkref_en",
> > +		.offset = 0x70,
> > +	},
> 
> (mp0 hsphy)
> CXO1->TX->RPT3->RPT4->RPT5->RX3
> 
> > +	[TCSR_USB2_3_CLKREF_EN] = {
> > +		.name = "tcsr_usb2_3_clkref_en",
> > +		.offset = 0x74,
> > +	},
> 
> (mp1 hsphy)
> CXO1->TX->RPT3->RPT4->RPT5->RX3
> 
> 
> > +	[TCSR_USB2_4_CLKREF_EN] = {
> > +		.name = "tcsr_usb2_4_clkref_en",
> > +		.offset = 0x88,
> > +	},
> 
> same as eDP
> 
> > +	[TCSR_USB3_0_CLKREF_EN] = {
> > +		.name = "tcsr_usb3_0_clkref_en",
> > +		.offset = 0x64,
> > +	},
> 
> (mp0 uniphy)
> same as TCSR_USB2_3_CLKREF_EN
> 
> > +	[TCSR_USB3_1_CLKREF_EN] = {
> > +		.name = "tcsr_usb3_1_clkref_en",
> > +		.offset = 0x68,
> > +	},
> 
> (mp1 uniphy)
> same as TCSR_USB2_3_CLKREF_EN
> 
> > +	[TCSR_USB4_1_CLKREF_EN] = {
> > +		.name = "tcsr_usb4_1_clkref_en",
> > +		.offset = 0x44,
> > +	},
> 
> ok
> (although there is a comment suggesting this may be NC..)

I checked ipcatlog, TCSR_USB4_1_CLKREF_EN is not in used. I suspect this
USB PHY uses CXO as refclk. If so, we need to remove this entry. 

> 
> > +	[TCSR_USB4_2_CLKREF_EN] = {
> > +		.name = "tcsr_usb4_2_clkref_en",
> > +		.offset = 0x5c,
> > +	},
> 
> CXO1->TX->RPT0->RPT1->RX1
> 
> 
> You're also missing PCIe_1_CLKREF_EN (+0x48) (for PCIe5)
> which goes through CXO1_>TX->RPT0->RPT1->RPT2->RX2

I have removed PCIe_1_CLKREF_EN in dts node because PCIe5 PHY doesn't
require QREF. So I didn't provide its structure here.

> 
> [...]
> 
> >  static int tcsr_cc_glymur_probe(struct platform_device *pdev)
> >  {
> > +	const struct tcsrcc_glymur_data *data = device_get_match_data(&pdev->dev);
> 
> Please null-check this
>
Okay. Will also add the regulator list for other instance as you suggested

- Qiang Yu
