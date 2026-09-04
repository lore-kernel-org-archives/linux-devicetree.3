Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3582651C336
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 19:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788550636; cv=none; b=IF7s69mb1I1OMunftT/M+CduV3lujEb8giuIv8mipw20HJvdzW442pu5jqkC7EiX6buUIS4CcWgNyXgr4K43WuEX6TLDUW5yFdPFDzFCnt9inunuZldc1FV0ASvPDuRv/NNhEyrfK2oHzMjkaHZEwB20akwg2c66qCWD0dP5tYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788550636; c=relaxed/simple;
	bh=H4VfZ1oIflEf+NCaohJHEm9e23+ujGN59jKDZ1Kccrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dns2el3opKH0AWXeNo1HV1GHu/n0IQgW7GSpfkNQuoUKFAP6eWYrD2JTpm+pyHMPeFOLO4VTewIzD2co/mT31T/u9ah8FNAG0DBU/6RYgiovAXT+Jjs59Q0B9rWR42PE3/K01VUj8WOcKwyiUPhNlb/URBTS7cJb4vzSx3oxKzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vxf8LshN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cT/zPVrR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vxf8LshN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cT/zPVrR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684HHjQ41151795
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 19:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QI+uREPlD4rmiPWi7TZUnSdk
	1H6A3jyNKvxXKDFQ2+Y=; b=Vxf8LshNSH/7v6mkRNFdVN6MGE4b2fkBgEV7gz/t
	GRP1TSPrzMfOgL4soSgLEMMwpTMhYVorrbpD3J3LmDRaNBjtMKILdINzz0lz1JFb
	Vam2Aqa3vbX24/5SNKPJsVN1o2BD3KKF/B4J7ujbM323gTe1SR2QkVuWcWfWKPxs
	hroNdgumU3UUiSy99hD9/gozJDTC3qksmHQnN2A4c5zIbqHzEar+jAx+bqzi8UxS
	XUaC/ZGUBs3Dm5nxBQooAFt1SPykFZPK3IJbuo3uRecIdFaNGriLkzmy1+DxnVVG
	/16VZ+/4jymJxP4R51kk5iHO8sj33OmAeqLU81l7QjJRZA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg00yscwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 19:37:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1c6070e67so87335a12.2
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 12:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788550631; x=1789155431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QI+uREPlD4rmiPWi7TZUnSdk1H6A3jyNKvxXKDFQ2+Y=;
        b=cT/zPVrR4+xkZnBAkPeHNrFwnhbcAJMZKtw4WWFM2VOFo1FD1I9sXmcmDBIidAND6h
         MsdxSQSx8XDhfss45YaHT1mZ7gVPtyCLLGXVHQCATsm5uuXf9G09Ab7JYTSGAIfLY/kM
         kb8WYyJNhhJK+l0jEPMsGgNgcM5pSWi6UHJ++wtXMM9xdV19L8f6lmCsgLtOq+2/sk64
         UwXoPy4xDiLtf+rtj4ozF301TLoimPAI24QXeGVdFDL6lhYEt6BWXm49OsCGv33XyBGW
         yl39VyGFmu+SKjrsj83MmGkrQtW8Bq0qldoKckZhJXO/dtp7lZmDODqN0EoLYc1pNoeA
         E1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788550631; x=1789155431;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QI+uREPlD4rmiPWi7TZUnSdk1H6A3jyNKvxXKDFQ2+Y=;
        b=humv1weWtoZq4Gl2KtURdRSBUwIGm8gG6p2a1jQtRtj2AA+hDaElxw9XcLAVITZkwE
         IOW1Nk03D5nFCLGi16q/0ZCFJ2dwO4ktAMSRfywcPNd12VbCfAjM2V/qUT0deuenczpR
         MPI1N+6KJEFV/87hK0sDsKTNXJYYk3OxxDbXf/OpyuTb95+rDAJYcNePNEgdQv0eEtnS
         f8OIrY35UaCv28u+69kMtlRH0gmEofxOLcAoiXn3tTH2vN3KdAIvHOFY1lX0o64FUbER
         w7RUxBMml9eDjyFU3IqRXkvLwwf4IDGDI6A7qi3t1V1KHXOBUcH2w9mUepupkospRgYT
         W1Og==
X-Forwarded-Encrypted: i=1; AKwUvBzP/Jg3wbmAchskON6rSEgAC/D4GsLttdN6TIKIms8PFLhR/F5u7uJs5GRjRA/vMl6+UANmt/tfi6vT@vger.kernel.org
X-Gm-Message-State: AFuF++lyQXAAa+AY6BxD06auebfoosOb6KCqNoDKjIXgflxDLPkX0ZYu
	y7BuuS6XeimrtW5FthiOi45GmijCzG0EcN0MoYgaaltOSYxaBm+wM6v1J+Kigc7NX1pUXOwgZ3m
	L3mDsdfEf/LONjhPSCbRmGGt7cBvOKqFxqv1PUR5+16NAgyYmFMcL8UqEDYyb0IPD
X-Gm-Gg: AYBFou06CFSrh2Xh+VR/spgyyPZa9yNh0DVQ18rgpvKHTGjQLWs7QMPSCzCYOv1N/qm
	UcSFkSOh2JNLwV8oxwlqKbU7MTAzjo/5z0rAhAFoPqCuVflE+TRfn14sJKh3NG5R1rHvWdzY5+d
	mzb8kSJpI9Pl/cXHU9ZQSEmTLIC6EPG5YxPu0xmDD2fnn46nOeyLVUfba3aWWr4pNT1OdRCMHQh
	846seCV9QuCmn73O20Y9iPbXNksH34KSEq+HpAHiSj2iG4/0bjOYuYxSukq7qmXoe6YJZX4LOiA
	JUlmIhbJTQCDNibAQPoLFpc9nJeWm9/oP/DTge65rqer89V3/VstycC7ob8rU8zU2BUcao9DRJF
	TG8XaXJLQnTrTbCoqsOGpr/rY0AhVQgOgOUzL1zKRMHvhZHTwBnCRFJC9czzNOyyU0p3lIwNIYD
	JHaHzSxh7Fbq0H5zRL31pP
X-Received: by 2002:a17:90b:1e04:b0:396:463e:2eeb with SMTP id 98e67ed59e1d1-39b264b24e2mr7732992a91.0.1788550631430;
        Fri, 04 Sep 2026 12:37:11 -0700 (PDT)
X-Received: by 2002:a17:90b:1e04:b0:396:463e:2eeb with SMTP id 98e67ed59e1d1-39b264b24e2mr7732946a91.0.1788550630938;
        Fri, 04 Sep 2026 12:37:10 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3351c2bd2b0sm359941eec.8.2026.09.04.12.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 12:37:10 -0700 (PDT)
Date: Sat, 5 Sep 2026 01:07:04 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: lemans-evk: Add LVDS display
 overlay
Message-ID: <apsd4L0MNzgAhSHS@hu-vishsain-blr.qualcomm.com>
References: <20260813-lvds-support-v2-0-6b11035e8ab0@oss.qualcomm.com>
 <20260813-lvds-support-v2-1-6b11035e8ab0@oss.qualcomm.com>
 <049af81c-d05d-4ce4-9627-8b2212979f4c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <049af81c-d05d-4ce4-9627-8b2212979f4c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=baFbluPB c=1 sm=1 tr=0 ts=6a9b1de8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=XpLG6VMlNpcyACpXrrQA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: M_6Y35Ndj_sBWIE_cmddToRh1U2axgad
X-Proofpoint-GUID: M_6Y35Ndj_sBWIE_cmddToRh1U2axgad
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE4MCBTYWx0ZWRfXxhX0KHudylWU
 ACxl0SIghick4UiIFvnUGVEvzMlaD8aVsUc4btD3rgp1Mm449CRD3o/jEoSZEhdxRzcGNHHZun6
 wJl660EQ2xzsJ4FuqM9mRbqq1keS40wxjxVLxRtAD+XSITvc5J5QaTK79ws1RaQeP50KyR4Yq3o
 bLM1rinwy2iCRwmrkASpSUqBBaZ/6+LA7EJ3K1gfOC3XloOSazwFs1VEkBQ0h+RqXCl+heUHee3
 AEEwVNt9moUGvVPrOxLIMfdXZsOlLB6Wdi4XO6BHq7tXCkntHpjhpP6hRBeZ0l/7FMbKOKtnYOX
 deabyse1cMZdNYvjiDoydBjk7U77PjTCc2fvxPJk2K0OVfWMxb/EQP4R8PxefNJfoxlqNl4bE14
 2UQLIXzR6xKsUQ7P7CoQFd79LbTxC0kQtBuBGPFVAzn+dm+l9wa6AdPnTsMiYoYXUQrUGN3VBlv
 omx8RlpAulklPvrX8Hw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE4MCBTYWx0ZWRfX4DCL/6DbvqWC
 p5hEC8Z9o1icjf2ZL6L9TVNjdx2QcfAiuM9dlZ1wC6J3b/fnPxt8p5vxYpSn85lfy/ArdmmFXdE
 Xw3uopCRo5yqplVYMmdEFbIs1PrWxrw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040180

On Thu, Sep 03, 2026 at 03:06:10PM +0200, Konrad Dybcio wrote:
> On 8/13/26 7:33 PM, Vishnu Saini wrote:
> > The Lemans EVK IFP mezzanine supports LVDS display output using the
> > Lontium LT9211C DSI-to-LVDS bridge. The bridge is connected to the
> > DSI0 output and drives a dual-channel 1920x1080 LVDS panel in
> > VESA-24 mapping.
> > 
> > Add a DTBO overlay, lemans-evk-lvds-boe,dv215fhm-r01.dtso, that wires
> > up the LT9211C bridge on I2C1 (address 0x2d) with reset on GPIO37,
> > a panel-lvds node for the boe,dv215fhm-r01 panel (matched against the
> > panel-simple-lvds-dual-ports binding, which supplies the panel's size
> > and timing internally), and an LCD display bias regulator supplied
> > through the GPIO expander. DSI power is provided by vreg_s4a.
> > 
> > The overlay is built as a composite DTB combining the base
> > lemans-evk.dtb, the IFP mezzanine overlay, and this LVDS overlay.
> > 
> > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +	panel_lvds: panel-lvds {
> > +		compatible = "boe,dv215fhm-r01";
> > +		power-supply = <&lcd_disp_bias>;
> > +
> > +		status = "okay";
> 
> Nodes are enabled by default unless explicitly disabled
Yes, status = "okay"; will be removed in next revision from all such instances.
> > +
> > +		ports {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			port@0 {
> > +				reg = <0>;
> > +				dual-lvds-odd-pixels;
> > +				panel_in_lvds_odd: endpoint {
> 
> Please keep a \n between the last property and the following subnodes
Yes, This will be fixed at all the places in next revision.
> [...]
> 
> > +	lt9211c_codec: lvds-bridge@2d {
> > +		compatible = "lontium,lt9211c";
> > +		reg = <0x2d>;
> > +		reset-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
> > +		vccio-supply = <&vreg_s4a>;
> > +
> > +		status = "okay";
> 
> ditto
> 
> [...]
> 
> > +&mdss0 {
> > +	status = "okay";
> > +};
> 
> The DT which you overlay this atop already enables it
Yes, will remove this from overlay.
> Konrad
> 
> > +
> > +&mdss0_dsi0 {
> > +	vdda-supply = <&vreg_l1c>;
> > +
> > +	status = "okay";
> > +};
> > +
> > +&mdss0_dsi0_out {
> > +	data-lanes = <0 1 2 3>;
> > +	remote-endpoint = <&lt9211c_in>;
> > +};
> > +
> > +&mdss0_dsi0_phy {
> > +	vdds-supply = <&vreg_l4a>;
> > +
> > +	status = "okay";
> > +};
> > 
