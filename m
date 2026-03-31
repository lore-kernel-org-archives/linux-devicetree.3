Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE501397E68
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774951160; cv=none; b=OR1Hhn9VXDPDUVdFImGqtpVjnCUW9MzsO9KGkg0wPpSz25H1du8kX2crAJ37Pa3itBnxFyo7gMJAVQFBL+uv8koyXlhf1FnTxsBJXgCOKHqH+RyBjXHifUjEEpT8BdmiI/VXdDL1gQJ0udG0odRPHCsy55h9FLbiBGEgrsMFDlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774951160; c=relaxed/simple;
	bh=K67fp/R3crNHryaqNc/qaMyLhGOxVzxXxCmNqZMjqKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=epIu3iggrwcUNt7/phDvPfNFtmOkc5v5WU9uTdtF8Jk/T54w+E1t0IRsaQUE98ua32ZgO7wWwKjiJ7/U2DBOIp8MaUDk5CXpHdVTMFkPvLQJz8uzT8MNERTB2CLEjHAZ2kGSV+lcHvN6/I+s5KBZHHEKNDVQ2Sojn+Mfny0C1Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N2fZHeKf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VmPALYMD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N2fZHeKf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VmPALYMD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V7OZcj2465781
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tYVdhzyN/PgBq2nHkZ289xfo
	K00phIoatD6dXYcn2sM=; b=N2fZHeKfG5auWv2C0vp9w8f1qmx9IzwqdS/6uh0U
	OBBdLq2V+cjwOLuCLrXIJGPDKXjzCpeAh8335To92rTc+o39RmEYuto2GO8hIpwh
	LyoLlWWhOGtrR0VfQL5Cvaojb0HoUO0e7KWBb5Kp8CyJIc1/Q34RXME3Fq5PBVmj
	HQYD4XKV7KAaN4fwbZtojCXpEBSaCilTJa3+MX/ZHUtH5UAZUv6CCYllnreIrP49
	lRAsjEB14XVj5h1gj6govHOzbR4U8noRvNLn1wbs/H76gPdqTbQ2HfIzkamj+fje
	KmYsRogvClMEVCs214bSueHvuRGUDHi+Mw1wRjHHggU6TA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89ut8ns5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:59:16 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12721cd1a2aso2302134c88.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 02:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774951156; x=1775555956; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tYVdhzyN/PgBq2nHkZ289xfoK00phIoatD6dXYcn2sM=;
        b=VmPALYMDuWZ1BramO6QIklApf0ABOzh1vO+qgmXhdhunNcnsTG8L5PTpWk5qDX3m4I
         6r2dCxynF3qA2k5NX5fG2k0qUWDcqWS0OwTa7pslTPk13JjHY+HccOSJMZvdaV45zhmw
         0L2x5mNHBscCMnPe78US/K3yQpnoSZFIjusYhl4SnJk6SRthP7GfeUUqd+Xzilyp8jh1
         zi1mvrKVaiPfyYDbTmd330iBiXNdMWy+RFxZtRUzz9IjpuPh1ZVEBXpcbuJBz9+6eG12
         373jyqZCzgLuGdl3SlOpLovg/P582iLoyeTlXvZI4wYg1vm8MqSjbOJFbNPUt4WqA8vh
         VnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774951156; x=1775555956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYVdhzyN/PgBq2nHkZ289xfoK00phIoatD6dXYcn2sM=;
        b=UVAcOkYPGKePoC2ikDk7Qa7dB0u+jiQyYmjcBJYVFcLic9SQo4JkivZkAF0J4kjoBi
         TxD0nTct3zvtB0FQVCJHleJGtPU+8wBNupa6try1LfBqlyGNitKYQo+kyo0gXPQ04cVB
         YBJurn81h/0+YdV5sq4gW4j2Jj3MS/xM46GInAy8mwL3eZgjtEwOL//EqlHYGlfFZAbI
         530/hm8giPN+qtiZRg31zj3Sf+FrqdFN/EzIIycTVqgXxzyhIjbSOMEMWcZR1n28IuUB
         H7CQrK5nEEvv7mwGOOFfucIAM1t8tDcHdIy0Vjh4IrSqUJM1DSm1rDBzVPM4Wps9rQ12
         2/fA==
X-Forwarded-Encrypted: i=1; AJvYcCU7zq2jIGPbULCXdQytKC5yptx5AsTjICaGQplxpT0BCwTqRVcgf1XmyVwiJ0wAp4NuT/6UcvnNR+M0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm1UJO0lSJbWFUjjd2xUkOE9BcYKXxH7ZAKanKz/QIeMD6/jUs
	YX5xgt/nW5VJVsgfG4lV+0yDwhf1+xCYRpnvlQEjcl2D9dC83bSgi+dwkQrCpXk5qOZwhieRSgo
	DkTGriRql3NU5DebAqurWk83Out3MktWUt/MV33NAMrcGmdVxBKUuyvq6EPi+XXdF
X-Gm-Gg: ATEYQzwplvHLll9oOEnfXqba5toJ5lsh/sxtJic+WerUHg6L8olIhLFG34KGXWT9Pd6
	6nTG7BMewMz7kFTK+GoCuGFMcfglskWVV70l+xOj8khS5FGzlXP8oHrESlE1c6jWAKyz7iu7EHY
	RiKBS5oC6pepN7Fs1+vcViBlCXQbjqA+EuQ7l1jc+S9JDit8l/eZ/3fbRViyob1iZgXGsZw7aqj
	Wiy5CvCnk2htzefpGRauEX1dp+gVjZXKTnYk+WNgDbAmkQYUd+U29KR9c0W3Rd6y+T/t8JCK92f
	l8Qar/ayco9WkPTYY/keZynPMBttDoOGv7t6o6xdMAS28l18x2ZkYSHIoZWS60JzeGweeuDKtIX
	no19X7it9ei8UNHPVtpYDuhEJqxGwsSsMLpkAI1tHAWOiW4psoujKVLjjgwKXuveCCf0P
X-Received: by 2002:a05:7022:914:b0:11d:f440:b743 with SMTP id a92af1059eb24-12ab28451acmr9612930c88.7.1774951155508;
        Tue, 31 Mar 2026 02:59:15 -0700 (PDT)
X-Received: by 2002:a05:7022:914:b0:11d:f440:b743 with SMTP id a92af1059eb24-12ab28451acmr9612897c88.7.1774951154745;
        Tue, 31 Mar 2026 02:59:14 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aba581027sm15063809c88.4.2026.03.31.02.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:59:14 -0700 (PDT)
Date: Tue, 31 Mar 2026 02:59:12 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] phy: qcom: qmp-pcie: Add Gen5 8-lanes mode for
 Glymur
Message-ID: <acua8Me0zo3v/CBi@hu-qianyu-lv.qualcomm.com>
References: <20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com>
 <20260323-glymur_gen5x8_phy_0323-v2-4-ce0fc07f0e52@oss.qualcomm.com>
 <x3ts7to7c4qnorloahe7cgup3uekn4wolmmorqa3b3bjfslqfn@eijnzdp2ops3>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <x3ts7to7c4qnorloahe7cgup3uekn4wolmmorqa3b3bjfslqfn@eijnzdp2ops3>
X-Proofpoint-ORIG-GUID: Uk2SDit8Fpp4G7znfoa0LAQtzxVQ_hdw
X-Authority-Analysis: v=2.4 cv=C5LkCAP+ c=1 sm=1 tr=0 ts=69cb9af4 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=56H2F1Fm8OXBRpAn5E4A:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: Uk2SDit8Fpp4G7znfoa0LAQtzxVQ_hdw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5NSBTYWx0ZWRfX3HfMZ3M+5Z2v
 2F8WYzBGepBhDaQ7jH0Cufb47A3Zc4iJyQGOwZ2oqr0z//t6sw4x3VysSwqrINsPoI+ZioIcKYN
 yIoS0nGM2HppO8KAK/abt79+v/BY+qGKruo9blL1fRQKLjzRGTSlBNXiijUh0p15nQl7iFmem8Q
 jQtwZ4YbvgUQBodwxex9fw+hj2XFB5eZjQCfGGH1EwRbnXE7nR0hKDesEKWoQIOPWI/l5VZdvuT
 ZkOXaAfdFdIcpArDd0nNn+ogxqCq5MLjmzJ+wDYSSejD3bSBB833PMk0kaqiNcw93Zthat/CAsx
 Y2NaAKbxvBF8Vx0WfsBnLaYaOckwPN533FvRhcoGSM2SoZqVhQRp8iN9YXHM0GeSdrMxJQy25j9
 f/2PC1+nFk6CVVpzjEBLOd4EjgBI0KTDnCR5Spzddi7oSVjrCN4J1EFAInYzPA0PZuxzNGqNDr6
 p1kqHL844nZj3WVDcJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310095

On Tue, Mar 24, 2026 at 11:23:19PM +0200, Dmitry Baryshkov wrote:
> On Mon, Mar 23, 2026 at 12:15:31AM -0700, Qiang Yu wrote:
> > The third PCIe controller on Glymur SoC supports 8-lane operation via
> > bifurcation of two PHYs (each requires separate power domian, resets and
> > aux clk).
> > 
> > Add dedicated reset/no_csr reset list ("phy_b", "phy_b_nocsr") and
> > clock ("phy_b_aux") required for 8-lane operation. Introduce new
> > glymur_qmp_gen5x8_pciephy_cfg configuration to enable PCIe Gen5 x8 mode.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 30 +++++++++++++++++++++++++++++-
> >  1 file changed, 29 insertions(+), 1 deletion(-)
> > 
> > @@ -4705,6 +4713,23 @@ static const struct qmp_phy_cfg glymur_qmp_gen4x2_pciephy_cfg = {
> >  	.phy_status		= PHYSTATUS_4_20,
> >  };
> >  
> > +static const struct qmp_phy_cfg glymur_qmp_gen5x8_pciephy_cfg = {
> > +	.lanes = 8,
> > +
> > +	.offsets		= &qmp_pcie_offsets_v8_50,
> > +
> > +	.reset_list		= glymur_pciephy_reset_l,
> > +	.num_resets		= ARRAY_SIZE(glymur_pciephy_reset_l),
> > +	.nocsr_reset_list	= glymur_pciephy_nocsr_reset_l,
> > +	.num_nocsr_resets	= ARRAY_SIZE(glymur_pciephy_nocsr_reset_l),
> 
> Just for my understanding. If it was not the NOCSR case and had to
> program the registers, would we have needed to program anything in the
> PCIe3B space?

The PCIe3B PHY registers need to be programmed.
But we don't need to do it explicitly because there are also broadcast
registers: writing to these registers will automatically write the same
offset and value to both PHY ports simultaneously.

- Qiang Yu
> 
> > +	.vreg_list		= qmp_phy_vreg_l,
> > +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> > +
> > +	.regs			= pciephy_v8_50_regs_layout,
> > +
> > +	.phy_status		= PHYSTATUS_4_20,
> > +};
> > +
> >  static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)
> >  {
> >  	const struct qmp_phy_cfg *cfg = qmp->cfg;
> > @@ -5483,6 +5508,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
> >  	}, {
> >  		.compatible = "qcom,glymur-qmp-gen5x4-pcie-phy",
> >  		.data = &glymur_qmp_gen5x4_pciephy_cfg,
> > +	}, {
> > +		.compatible = "qcom,glymur-qmp-gen5x8-pcie-phy",
> > +		.data = &glymur_qmp_gen5x8_pciephy_cfg,
> >  	}, {
> >  		.compatible = "qcom,ipq6018-qmp-pcie-phy",
> >  		.data = &ipq6018_pciephy_cfg,
> > 
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry
