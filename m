Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467054C901E;
	Wed, 22 Jul 2026 11:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784719026; cv=none; b=CIPHNEwsq8Qg2VpqeQx/0dyrYRTFEQkeZDoNiO4cnsdrL585K4cpqjzEd0vymJGV3Jv8WYmucDFmEDMLpoEESdeKxAoyBmP/k6ZHk7eKidKQ58zBCe+7It5W3E0S6eEe2aez8VLiK3C3NTOzDoVDiL+HLSU/FTbzcpH1f1Z+PwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784719026; c=relaxed/simple;
	bh=xlp4pSl0bvwnXJb/ajjEuQN9VbdIaRP69Ncdedg8RJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fLvu3FemUu8nmCc79X/oAIRhPoOc8L1prz0b2CiYte37dnQJTuPUuk596em2LPTHaR4w82j5SGYDjrfCRU2/mHAN9MQp9IN/yDBCi0NEfgO4zbZ7Vnd/bJr5Gc6ZGxjPB9kollU1wgM49bs0+coSAL9ENFZFSeYVfrtqp5Jfcjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MNXZRUZj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MNXZRUZj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MA7SZH512837;
	Wed, 22 Jul 2026 11:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZiZiF/ApMkZZGGSEh1UiJ4kk
	ZomnamuVQmtY8jbfqSo=; b=MNXZRUZjN490D2gQXRaPB862GlmwJ+YXDfELRW/s
	LvqVMWJ8VFcLgXT+3KX4DSgWCkOWTb+du7klgHW4ETY2MTOBxp3nYditHQWbCgFO
	uZzu0+9gJHu/zRy055pIVxpBfCcY+53BlQXCUbPY14q/Pcp0T/92imD1IltLE5k1
	yGtOB/479vAXcLhbICWQYSYwUBf3MRvbl+KsQjjIl7+dk7pjcDEvvKFA8gIUSojE
	tEqD4tkpsyk885zidDzLK3C/S5rU3rYqmF5M8hsLSOD1fopW8TXFUQ+M5jixFZgA
	GooiODJUCSdtugsKGq1jYD2jeWJDUaRQYGaNDg02P7dvcw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjuu7872s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 11:16:59 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66MBGukK011280;
	Wed, 22 Jul 2026 11:16:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fgj54dbxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 11:16:56 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66MBGt4o011270;
	Wed, 22 Jul 2026 11:16:56 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66MBGtIP011262
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 11:16:55 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id E2A88B2A; Wed, 22 Jul 2026 16:46:54 +0530 (+0530)
Date: Wed, 22 Jul 2026 16:46:54 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        jishnu.prakash@oss.qualcomm.com
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: qrb2210: fix PM4125 regulator
 supply parent mappings
Message-ID: <20260722111654.th7m3wgmrb5thl6o@hu-kotarake-hyd.qualcomm.com>
References: <20260720-pm2250-fix-supply-parent-v2-0-60ca47031b50@oss.qualcomm.com>
 <20260720-pm2250-fix-supply-parent-v2-2-60ca47031b50@oss.qualcomm.com>
 <oq5sjn5yudd3nioind5cx2wxsuo4r6h7s6nz6zjhgthlde3xzx@qk3yyswu5aut>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <oq5sjn5yudd3nioind5cx2wxsuo4r6h7s6nz6zjhgthlde3xzx@qk3yyswu5aut>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: 9nhl0_sqbW7QlIiRNVKqwi3fTNX-bpzA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwOSBTYWx0ZWRfXyJf+Ojmyixkg
 S4/8r7QAECp7hhOEBPwFmPn4Lpz9nTOuytCuFgGdjOhjUXIO5GdOJ6gLUQm2BBnF98TXpOoQS0O
 nybFo6sOqEibtYzsnXZUdS26Xhm0AGI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwOSBTYWx0ZWRfXz8SEp8wPq0xh
 XKSEw3tXvKObGg9bcyOOJbmq8dx6D5w5DxCrAh/W59uCCmlu2JUbEI+EXIdiQ+91FXnRfw8HjeB
 SH367uLAG6qQkczUjIP+UY9NuGiddr6BEeUJf7V54h5nkdYlM9is21m1y6Eac8rsXU6H1Ye7JDn
 dsf2fa5QLXbu07BmvQqXe82WfarmRp84Pw0NleIGIDoY9XTkv3eOj0xE4nQfD+3NUZWjm4ZXoct
 e+dJu8K3BzVDebfGF4rkj/zRDbszWtKAWoHifBbei/O4hPOP1C/HXUvgAUPTNky9SfCQiatlifP
 7SqUIrOxxD7sTNejOLKJwya6TZno2euvKTgNu+vERTSFXVzHIDM5OiLfpCz09ZryUY64nlDT/j1
 U65tZbOtI+wPCxUmuknLf+P6KFZINP3KVYZoFUQ29flFEBovhI9rfYMT6jrIqKf6r/cOHZxNRl4
 COhDv9TvFaMdtpat5EQ==
X-Proofpoint-GUID: 9nhl0_sqbW7QlIiRNVKqwi3fTNX-bpzA
X-Authority-Analysis: v=2.4 cv=JuTBas4C c=1 sm=1 tr=0 ts=6a60a6ab cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=juQ7Jl_2yBb2wKwDj_QA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220109

On Tue, Jul 21, 2026 at 04:23:38PM +0300, Dmitry Baryshkov wrote:
> On Mon, Jul 20, 2026 at 04:25:05PM +0530, Rakesh Kota wrote:
> > The qrb2210-arduino-imola and qrb2210-rb1 DTS files used coarsely
> > grouped supply parent names that do not reflect the actual physical
> > pin connections on the PM4125 PMIC. Since supply rail connections
> > to PMIC pins are fixed in hardware, these grouped names were
> > inaccurate descriptions of the hardware topology.
> > 
> > Replace them with the correct per-group supply properties matching
> > the actual PM4125 pin connections, and align with the companion
> > driver change that sets supply names to NULL in the qcom_smd-regulator
> > descriptor so that the correct supply topology is captured in DT.
> 
> Two separate commits, each having a proper Fixes tag.
>

Ok, I will split this into two separate commits, each with
an appropriate Fixes tag.

regards
Rakesh kota
> > 
> > Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 13 ++++++++++---
> >  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 13 ++++++++++---
> >  2 files changed, 20 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> > index c472e13fceca..90e6eb284a66 100644
> > --- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> > +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> > @@ -262,9 +262,16 @@ regulators {
> >  		compatible = "qcom,rpm-pm2250-regulators";
> >  		vdd_s3-supply = <&vph_pwr>;
> >  		vdd_s4-supply = <&vph_pwr>;
> > -		vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12-supply = <&pm4125_s3>;
> > -		vdd_l4_l17_l18_l19_l20_l21_l22-supply = <&vph_pwr>;
> > -		vdd_l13_l14_l15_l16-supply = <&pm4125_s4>;
> > +		vdd_l1-supply =  <&pm4125_s3>;
> > +		vdd_l2_l3-supply =  <&pm4125_s3>;
> > +		vdd_l5_l6_l7_l11_l12-supply =  <&pm4125_s3>;
> > +		vdd_l8_l9-supply =  <&pm4125_s3>;
> > +		vdd_l10-supply =  <&pm4125_s3>;
> > +		vdd_l13_l14-supply =  <&pm4125_s4>;
> > +		vdd_l15_l16-supply =  <&pm4125_s4>;
> > +		vdd_l17_l22-supply = <&vph_pwr>;
> > +		vdd_l18_l19-supply = <&vph_pwr>;
> > +		vdd_l4_l20_l21-supply = <&vph_pwr>;
> >  
> >  		pm4125_s3: s3 {
> >  			/* 0.4V-1.6625V -> 1.3V (Power tree requirements) */
> > diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> > index bf6fb12ad990..3432022274d8 100644
> > --- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> > +++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> > @@ -465,9 +465,16 @@ regulators {
> >  		compatible = "qcom,rpm-pm2250-regulators";
> >  		vdd_s3-supply = <&vph_pwr>;
> >  		vdd_s4-supply = <&vph_pwr>;
> > -		vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12-supply = <&pm4125_s3>;
> > -		vdd_l4_l17_l18_l19_l20_l21_l22-supply = <&vph_pwr>;
> > -		vdd_l13_l14_l15_l16-supply = <&pm4125_s4>;
> > +		vdd_l1-supply =  <&pm4125_s3>;
> > +		vdd_l2_l3-supply =  <&pm4125_s3>;
> > +		vdd_l5_l6_l7_l11_l12-supply =  <&pm4125_s3>;
> > +		vdd_l8_l9-supply =  <&pm4125_s3>;
> > +		vdd_l10-supply =  <&pm4125_s3>;
> > +		vdd_l13_l14-supply =  <&pm4125_s4>;
> > +		vdd_l15_l16-supply =  <&pm4125_s4>;
> > +		vdd_l17_l22-supply = <&vph_pwr>;
> > +		vdd_l18_l19-supply = <&vph_pwr>;
> > +		vdd_l4_l20_l21-supply = <&vph_pwr>;
> >  
> >  		/*
> >  		 * S1 - VDD_APC
> > 
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry
