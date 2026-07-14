Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DE73BFAEA
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031337; cv=none; b=E3Uc7cI/fZOzl7MKx3YRqAfrZ2nNfDJ/pnVtSJrHduseuaEVGjoGKZ7WXn4VwDt3x2qCiSZ0q9IeX2WeZGW1VhsJkK/JIUx2eiAp6/dnjKqyXre90/o1eIq9qw2q5jv/HCZbUKkvkV+NxB5/pHXtYQ4JIBbeIVS6VagTtABjpzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031337; c=relaxed/simple;
	bh=W/pTqIwe4xUNI9+Bwfc1wa6dgdLWycDVCa4WxTfAbsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MAEFJohHIQOzO5vQ9E9lfR29PL0yGSOHjtBKucEPjn+LX+G1rDa48rvG/hFJsUtyNDRmtcAsOHqCZS4mIN5nd6u1XVH+RKAiSOYO5pTEriz5AQY0a+jUrVQVDFWyKb6Ier7vo5fZofPsM3vSG6OUwfzGOug3FsolHO9lft/nn4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BCwC3Yce; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FMYwXUZ9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BCwC3Yce";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FMYwXUZ9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBNshT355335
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:15:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EbjabJKfrypzaGJPXCP6Zom0
	cRMqI1dN1ZRsHgXVLeg=; b=BCwC3YceSfwa5tCq0n8uf1ZuEWzFe+jcfoePJfUA
	6ns6PPCOYID+3zmLzZ8iioTqcs/5V3hTiZEDX+3Ejj/ojYTb3YxMnDbmGXXRO9ZT
	oTfc/ZsJmtWzfUybVqva0uFoxDTQVcmNt5WgAmC2oNA92NC/rBbhoTDBD3OrIWcf
	59eckJZFwXgmTTWroi/hyhqcjwEO1FVT7WYq6P/iikr6SChYavatcyVRXQ2xoYHW
	T1EZ11BwMgBlNTnmgZmThZirGieP4xYWXUPP0XCgRYntvndYr5cJIbwpxBZnEbEY
	4LAfneq+4ISCv02BNnIkOP/li/HeJXpBWcbrWNMT7LmjLA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44j3nkv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:15:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccb687f82eso66039145ad.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784031331; x=1784636131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EbjabJKfrypzaGJPXCP6Zom0cRMqI1dN1ZRsHgXVLeg=;
        b=FMYwXUZ9kSKfBW6QhIs4u56FQsL5cvzgDpUxz06hmu5t2s9YpM+kFrdkFD/8SQfPu4
         s9L3OrXKBZ7EVQYX6uiu/TIVtZWX8Za6vnoC2AzqiPRiazSN+n604dZfgGL6xYeJrFgm
         W3gHIc9bll8G8KtDnixlybma7S070vtcn8XcJsqUzow4K9tsppuYxGc8ZMB4uJ5Z6yh1
         kZPyhB4VNv8ufyDl6D1vmck/PgybZI5loTPF+CF8mdczZGlPglSKcWq8duD2JCmtF+dG
         34WPPSLTjcFPG99R1VE+jLrTIBx2IFcUmkBPTq4gwosS2h9YQN7qTNQax3FXE+wt0i1w
         sSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784031331; x=1784636131;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EbjabJKfrypzaGJPXCP6Zom0cRMqI1dN1ZRsHgXVLeg=;
        b=pwqWbMBmWCe6xIqGhYxJgPXN5dTSdNl0giZ4WEBZTSE0KBM2moPIYD3QvWpr6C6W85
         Hy/SXFudotmnApGQJQs586hsQsqmznZTHWBdMJuWomuvk+vcE5+N3UE7rTm5VaKEw2wC
         CMc1Fd67YE5L49/PbW4D2shLwXRtmJfEfAopIdtKg3XK99aFkjyGEyUpSV0ME+MNZSl4
         DU87RjZDxva7q3xNRtNvC2RMDKowQsxbj+TKq4Ji4aVMxIB2bxsY7XnSQkGCaBkAPXHc
         62KvoU5jRuHfWrWQ8DYfA+NzkQgTkR5Hm6NWxSQtaxG3bOr2PZrWKGlkMuRIiBZyYbxJ
         RQQg==
X-Forwarded-Encrypted: i=1; AHgh+RoPs2fxZCoM7uL8aZXVaT+JyfHYtsHu0t2Yjo72rXhxgSjA2Ox7KoVBLSkWOrqEWXedruXm0alOW2Wo@vger.kernel.org
X-Gm-Message-State: AOJu0YwqnIHAgcNfloFRe8QqOYBqN27cxM2mXnImoMkVCWZtkmu3j4A3
	5r6Y5Ci7WlXpnhWs9NTF/En290FnTW+r7SfekPT8nXdv48wrermJStJTYBEnSht3A6CQav7LPzx
	+yj8qo2i0yfRp4cq97gyl7leEruXF8jpZra+ePpvGyq2FTgdzGNVxkPw5JGysfUOk
X-Gm-Gg: AfdE7cnDgDu3fUL2Ix5LD5A+o1DIbN3NN1Bbak4MCO7pPIPK+RPP/IR0pnR1Cp0toeV
	1vEWqaUwZIPgZhjy+nLI2uULBty6dsscLaXje0xHCdbvi9E9ODIYtTQnZctEXBcd18Ev+7/rYHk
	0fnQ7/tSOH5+qoBqJPFHkU469tIbkRW6gckYZD+W+foWSqu/AVz37z3mZRGtaFypzADs9oa48w6
	lAHkVE96//XQn+OutzcOHAHBFvqtJdrBP4f51jGtz9f+wS8N3FO/JjGvCMI8ETHaxO4NgWRsgBd
	9HQK547uKzgf43JyJDrC+cG+twfc7psNUY52VKylHO/MLPWYgqm9q/9Ivmw2BTfeBfvicE6roD+
	Gns1M/1IZbamtxq2ofP/HGwYOxRHg/9gS1sdPB8T/AFOvGfL8pzS90g==
X-Received: by 2002:a05:6300:218c:b0:3bf:6c08:fb82 with SMTP id adf61e73a8af0-3c1109ecd0fmr14656796637.50.1784031330520;
        Tue, 14 Jul 2026 05:15:30 -0700 (PDT)
X-Received: by 2002:a05:6300:218c:b0:3bf:6c08:fb82 with SMTP id adf61e73a8af0-3c1109ecd0fmr14656752637.50.1784031329973;
        Tue, 14 Jul 2026 05:15:29 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b9a67c217sm22222147c88.8.2026.07.14.05.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:15:29 -0700 (PDT)
Date: Tue, 14 Jul 2026 20:15:24 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v5 5/7] arm64: dts: qcom: Add device tree for Nord
 Embedded variant
Message-ID: <alYoXKxcXFd6vSNe@QCOM-aGQu4IUr3Y>
References: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
 <20260709132013.4096850-6-shengchao.guo@oss.qualcomm.com>
 <alOwD1G9plyy3BO4@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alOwD1G9plyy3BO4@baldur>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEyNyBTYWx0ZWRfX/zZuypUrZQ/r
 K8IJ/cIVaHfw5T7FPSpuMTT7d2KP5ucntWXbjLkAUoea5uxMisTTgsafpdi9E294qmCvDiC8GWN
 VB5ZvVb5/LufYQO0BsVAR3eKDxNiP6A=
X-Authority-Analysis: v=2.4 cv=N4UZ0W9B c=1 sm=1 tr=0 ts=6a562863 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=EqI0jlZnegA9myTLE5AA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: -_Y9gPtZcOtLmJXoLEpefKH2Hs3GQe0B
X-Proofpoint-ORIG-GUID: -_Y9gPtZcOtLmJXoLEpefKH2Hs3GQe0B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEyNyBTYWx0ZWRfX3DBKNIQFyDgr
 dEurcZ9Cg5xSPKVe6DiU7GSJsM8I0ahjCStx8boo7yYQC2uRa1NtYm4mLDzKbd+WNYGNBGn8Ozo
 Fy8odQ1n+T5OiF2LuD0lDwECv0Bp1AahLdDhCzXaQMTl5S0LeLhvIq6lSrWZvdDWFS6smraMyvl
 frAs0t1bNMmR3OBn90zUquzsvtzQcSZKBSZSJpac9cM58SoDJbPD6+grYnjY+mQshdUj4XEeKm9
 jsnCyJa+L2IKzxi0e3fsxOttp0DdwnH2+t/i/NKtBX9YSXKJMvE7LMTNEiFeFJPDZrpqIiRlbf3
 JOngb9XE/9UbnjKJslHWhiRdP0+Ie7Zpy5474P6Q6CUmpF4XEtvxhaI09kcJ55SmWafSSFGxY7V
 DSv4pK7X79IfR7tdS/SVlxE+QBilPLvZJoWExMnOe4V6tKlxFvGzFQunp4ZohTkL6JehnC4b3Ig
 GG2oD0Q/PFfbl+sXnBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140127

On Sun, Jul 12, 2026 at 10:39:44AM -0500, Bjorn Andersson wrote:
> On Thu, Jul 09, 2026 at 09:20:11PM +0800, Shawn Guo wrote:
> > Unlike the GearVM variant, Nord Embedded variant has platform resources
> > (clocks, regulators, powerdomains, pins, etc.) directly controlled by
> > Linux.
> 
> We're writing DeviceTree here, our job is solely to express the hardware
> and firmware interfaces using the agreed upon bindings.
> As such resources are "directly controlled by the operating system" -
> not "Linux".

Indeed! Thanks for the suggestion!

> 
> That said, this is a good structured commit message, starting with
> problem description, nicely done.
> 
> > Add a separate dtsi file extending the existing top-level
> > nord.dtsi with nodes representing these peripherals as well as describing
> > how they are wired up with the already defined components.
> > 
> > Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 1731 +++++++++++++++++++
> >  1 file changed, 1731 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> [..]
> > +/ {
> > +	clk_virt: interconnect-clk-virt {
> > +		compatible = "qcom,nord-clk-virt";
> > +		#interconnect-cells = <2>;
> > +		qcom,bcm-voters = <&apps_bcm_voter>;
> > +	};
> > +
> > +	mc_virt: interconnect-mc-virt {
> > +		compatible = "qcom,nord-mc-virt";
> > +		#interconnect-cells = <2>;
> > +		qcom,bcm-voters = <&apps_bcm_voter>;
> > +	};
> > +};
> > +
> > +&crypto {
> 
> Just to document my concern here as well, splitting the definition of
> IP-blocks like this across two separate files makes it very hard for a
> human to reason about what the actual platform dtsi looks like.
> 
> If the benefit of this reuse is worth the added complexity, I'm
> accepting it, but it does means that I expect that any changes to
> nord.dtsi will be tested across both models!

That's a reasonable ask!

> 
> > +	interconnects = <&aggre1_noc_tile MASTER_CRYPTO_CORE0 QCOM_ICC_TAG_ALWAYS
> > +			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> > +	interconnect-names = "memory";
> > +};
> [..]
> > +&ufs_mem_hc {
> > +	reg = <0x0 0x01d44000 0x0 0x3000>,
> > +	      <0x0 0x01d60000 0x0 0x15000>;
> > +	reg-names = "std",
> > +		    "mcq";
> 
> All other changes in this patch directly relates to resource providers,
> why does the UFS controller's mmio ranges change?

We can have them in nord.dtsi just like all other device nodes, but we
will need to delete reg-names from nord-gearvm.dtsi, since
qcom,sa8255p-ufshc binding doesn't require reg-names.

@@ -2907,5 +2907,6 @@ &ufs_mem_hc {
        compatible = "qcom,sa8797p-ufshc",
                     "qcom,sa8255p-ufshc";
        reg = <0x0 0x01d44000 0x0 0x3000>;
+       /delete-property/ reg-names;
        power-domains = <&scmi3_pd 0>;
 };

I will do this with v6, unless you hate delete-property.

Shawn
