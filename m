Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9FF3A380C
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 13:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782134698; cv=none; b=MChrAW6xO1QQWYONM6+//Zo3EtJw6HCEuyXtBoQJFSUe3HRaMLL7Gtp/zQc5fmliub1C0lJ8AAB4C2gluRV9Lubzo0rkjQsC97nIQevrvqVkzFg+VPWun3Hd/irDKz0C6w8zgRIl2BLXUBF1JzE4uNzSTlwdCMkorIf7kRkkhNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782134698; c=relaxed/simple;
	bh=Lj/oVPnB/95Wl7MnqnPwuq5mYkRXjp3lzUWb5YjTH94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7d+p3T5RxUJ04RyLHPN4qoTK08PQqHq1IurW2NgcJDyRSK8uEfcFylMOBBOq52B9IRVQMCxKMTzbnUcvSID2eAOEZPPEXfnw38aieXpML7YNKL/mg/H54k3KsLal1ZHJ3NQuBHT7VIMnmNzZGhzHAT50pBeBchCDOMfGmCmY1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jn26DHZE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VvNfCssa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jn26DHZE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VvNfCssa"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDGD152387035
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 13:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/EV4Wemo6ixakVHZXIVFrt3J
	dpQFipHlrf248A8xxAI=; b=jn26DHZE82vn6utMVr+2DPgeFvhX7yTZF2cXVepS
	Go4loYhPC6IjoEjKJT9N1U7POqW8RLF0hP6kGCfeAx/bhQctxj5u6YjYiHQ0zf8w
	LHkLgFm7bTBvbpNsTOF2K5SDjpdES46cJVldf3RlXdIesmKSNgTPA0Ns+MQl/G1m
	KJcx6CsxbXlDilH6hyUyYj+LNgwiT20BvbDWQQ9EkHZOFeVTE1T0r04ecn6RJCHk
	Y4IkKy4eB0n85J3f0ohyrhDnQgl1jWnJI+5UxKBdfrvgp4OGECbew7W3l6pAzp+S
	JVyyeGtWSsoUAS3OJc9gzdeKRtAi+Vf6H/VWyPWFkr9a4A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5sn013a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 13:24:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0a27ad86so10050241eec.0
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782134695; x=1782739495; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/EV4Wemo6ixakVHZXIVFrt3JdpQFipHlrf248A8xxAI=;
        b=VvNfCssaNzQd1X3JQqic3lm9+sDo1RB8pcwaNULodJxn/lGqwY4W06k1V9hHTQiISF
         sfqTlCt2gy7yQ/99zaVpHjLLxCUpgbxdCGUv/cP6/f+7vK62IRf2KTx04BKlardcRDjz
         1MYmfSh9qukBSsIeHjh5WW3jw6PdQnsIjhSuOnhluZin2q9lq2ndSvnaVGBv+Gq+A5L5
         enstYhbbdpvZdakQoBauAi37dqgPuGwGIahmvFI3xeWlq4j+WsI5VC8+aAPZd8ZsJSJ9
         o2LoUiuQzwNv6EMvBE+VpohfeCgsJCnFspYhQCkgbFiKzpQ5ZksuTh5ykKYwHmo7fc9L
         U71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782134695; x=1782739495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/EV4Wemo6ixakVHZXIVFrt3JdpQFipHlrf248A8xxAI=;
        b=SmZBMc0ehcc4LL3PVnHkdipBet2I3vlPk6he5GDUFvJkLq80XrxbDv4vm9DToFS9OA
         3PhrMsOlzcDv8/iTSSqXyqZQN3pUoC5ao5UyfmfisfcCLi/WX6YfCUnEZaAklBGD5tW8
         S+2Vo0ReafJnmoMhXL6WK5EYlMa/R8JJ71i02s2NeVl9aepwlHL7qV6IRQ79vh2g73QV
         UyD/yeaMlbD6XaGe9tmHQzIslwK8Fx72k2GpZOMLMvmv+C5PAHS2J/txD0fhpf20NXpr
         pP/LaV/f0hauIdu6y+NBHaCuZzErbJsqU3z9/sy0l7V44rI59iUCJms42fUUV4K0nZxg
         qHvw==
X-Forwarded-Encrypted: i=1; AHgh+RoksYhCWKv4l7Wl4VxtoNxiKeKwYW36n2XYPa4hRvY/Em8Ql8kNnDBUWKt+EJWFlKSj4Y64smpA7Qc7@vger.kernel.org
X-Gm-Message-State: AOJu0YzxEFDVmrEfFd7O6hpG/KVtZV5uu07HLMk0vr+WoEnxCGIa5fQY
	yVlYEAc4RKStiMR6jQlcAs8OTqRwtZPic3gRtjsY6Q0hDQsBShJ/CnDsC90JhiPtHvsNfH1TZHH
	PBRUkiRXMlKvPQByM4+tHIR+gOlrlmGsCmw8r1Ri6vmzYb2AbH/+ERf+jWdWZIo4Z
X-Gm-Gg: AfdE7ckRqE3DOs+pVqQdB1awtIQuhS/t+QkAKF4nMgabcmB2oP9T/KQspHfqgLCfkBP
	VKSGfh5wmmmSgc3J6oBy2ELUHG8alQwe1BFJ5/EMV/cy0Bv7WFWBK2bsAqgo+P+lgIa+8w+cnZo
	W3Oumn7KqEFgvdYHktH7Hkrbo9q0UTrbc0N6s1XqlfLKAxBBraBHOvRYq6tsg0hbwxxDLA+znPw
	wbTLpvaZKTOxXXBe6pVAT7/hXdf9zdi2Do+qvafCEAUyCOmMXYDB3A5cmbI28ZBfRcNemyG+itW
	Sdb4DbwUzUIJ0hf9vSHi7pEKwvw3IkGnGGJ6zaFPLd0NqVFaSH3MdavEki35uvRwtIDumW9GPJ7
	tLqfnYkT1q2sD4duX3yY6kWFek2RUOe1yP75I7QrDN4VnjZiYG2gbPVC7kA==
X-Received: by 2002:a05:7301:fa0f:b0:2ce:3aa1:d39b with SMTP id 5a478bee46e88-30c07006529mr9940796eec.20.1782134694836;
        Mon, 22 Jun 2026 06:24:54 -0700 (PDT)
X-Received: by 2002:a05:7301:fa0f:b0:2ce:3aa1:d39b with SMTP id 5a478bee46e88-30c07006529mr9940762eec.20.1782134694241;
        Mon, 22 Jun 2026 06:24:54 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba1c32csm11113098eec.6.2026.06.22.06.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 06:24:52 -0700 (PDT)
Date: Mon, 22 Jun 2026 06:24:50 -0700
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
Subject: Re: [PATCH v6 6/8] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
Message-ID: <ajk3opFNCQYrnwiA@hu-qianyu-lv.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-6-c939c22ded0c@oss.qualcomm.com>
 <314bab03-5f19-4954-9ad6-fe14d429ff5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <314bab03-5f19-4954-9ad6-fe14d429ff5a@oss.qualcomm.com>
X-Proofpoint-GUID: borWFYJmHtLZmzxqG87tbYNMgVP8WvH_
X-Proofpoint-ORIG-GUID: borWFYJmHtLZmzxqG87tbYNMgVP8WvH_
X-Authority-Analysis: v=2.4 cv=PuKjqQM3 c=1 sm=1 tr=0 ts=6a3937a7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=UxYOzgASb6pbHj99R6kA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEzMyBTYWx0ZWRfX33JyJBxfb2gJ
 i/q57ZoXhzCSclsRyb9LX6mJuO2pZjR42tlHbzUnSxDOvNbpOUXsart5T1+j4EQqmiYXaRE7kYW
 N9pWRTG6XbyWjv0o2dyVFMGChtnmAzk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEzMyBTYWx0ZWRfXxEQbK5KrjAep
 1lqdVJIjJ/BzawJscmi1FZRbfmDSKKEmAo/n7qmD3i/QCefkzzC5+u0cClSU+/ZSUV/Hk8w5qwa
 OBHIz57SFW4qnYX/2Ee3DBSeNrJfunRLIthbe31rpYitDAMOVn2pP+y4EVw7x/HNb7c2TFKoXrX
 CN45SrSuzaJnqmbqwmFsI9wf2NCUb6uicoaaIL2R5yycBkzDzh9Yc9SAoxdVjUVr3GgUljcwqNH
 Ud9jX8CV3e6p1YWa6D234HOf5sYTUEevEg+w8l6h7aJ/nlrnJMMcImaqm2IxF+Q3xlotTgRJIqm
 p7sOesxgJt3h21dUQ5qVxeTEyUALkE1A4qOUikH/MYAPPNBGhhWZR3Px39EVB08drzwpX+10vyS
 Nnps2aqC1cGBBaMEo4+tZWofgMiD2wFYyH/+HZPpBQ9d316b0uDB0+a9Nvu4ou8smeMdOmeFH7I
 VFLybR5jDWUgSbTXv5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220133

On Mon, Jun 22, 2026 at 02:16:45PM +0200, Konrad Dybcio wrote:
> On 6/22/26 7:11 AM, Qiang Yu wrote:
> > The TCSR clkref_en clocks gate the QREF block which provides reference
> > clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
> > and refgen blocks on the CRD board.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur-crd.dts | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > index c98dfb3941fa..92b929ee3448 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > @@ -278,6 +278,26 @@ &smb2370_k_e2_eusb2_repeater {
> >  	vdd3-supply = <&vreg_l7b_e0_2p79>;
> >  };
> >  
> > +&tcsr {
> > +	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
> > +	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
> > +	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
> > +	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
> 
> l2c_e0

For COB, it is l2h_e0. L2c_e0 is used in SIP.

> 
> > +	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
> 
> l2c_e0
> 
> > +	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
> > +	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
> > +	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
> > +	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;
> 
> l2c_e0
> 
> > +	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p72>;
> > +	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p72>;
> > +	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
> 
> l4c_e0

Same as l2c_e0

- Qiang Yu
> 
> > +	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
> > +	vdda-refgen3-0p9-supply = <&vreg_l2f_e0_0p82>;
> > +	vdda-refgen3-1p2-supply = <&vreg_l4h_e0_1p2>;
> 
> l4c_e0
> 
> Konrad
