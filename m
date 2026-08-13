Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05F1481AAC
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 14:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786632324; cv=none; b=kLx8oWKl2vT28P8r9ngUnAXb9f8HKyyfdELJGRF4b7GTQvrQBTiaKiZaLVjNFyywEmc+KDIIn3DW9cgRQnsmQJ4KtL4PirsEDX5+aucKfJcVGGy9v7tcJrt1m5VexUAlUJt2PUierrqwrctCyojzysn3tU+xS23GObe2f5tkGP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786632324; c=relaxed/simple;
	bh=K/bS4OawuWKCP1wgt7b/+KBz5fRpWlij9MbfH+npyXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OgCX2XZvpEid8JntkEcrA0w75Bwmokmj4WFcRNrakglERXnsBn8qvOdeiDYGeD4rDoDvQqJudrOv7Oy8kWJsLV8aZowUnAJ0vR3C2OxrUpmqNof63sXCCyNPA3z5V1aZhrX6EBhfUSodho/4QVk4OSU3iQC5U8L9C/FbYcR6R50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I6Mn+9K9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QaR4d2dm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I6Mn+9K9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QaR4d2dm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DCKFmG1955905
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 14:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uRZcIZWzwhsQClQoWCRDPoqO
	ksp7QGY7YMrfX9l8rqM=; b=I6Mn+9K9EspsjWvojXXfiCCEvAtQqFWih/Oj3jdA
	XBfRqklcUBgv9iZHlLDWXZ4B7id3CUEBKCkaB6k11rO0nM4C5iLFr2w1X9OxUEnj
	43C+WMeaFMj8oiVzOL7MPHbLHP+chP3QHru+tZXrNueJce+MFifTdQdA+lshGMfU
	hAEaxXBbBDgJqDvISz9BtTOg0rIz9vSnzyvtxIQG+N7Br4WMd3ed9b14PZk9Rshr
	VT16vNDfK1lqzS+B81wr0p8ZZznHfdiGqVl59J7QQRIqEKIjveT5MduteBiKUh5V
	cUdosNGb3TxlzBqP5580kEcfRP0Lhu7SXx6u+ik4n6Jmvw==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g14syjwm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 14:45:21 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-45a07949855so1006118fac.2
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 07:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786632321; x=1787237121; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uRZcIZWzwhsQClQoWCRDPoqOksp7QGY7YMrfX9l8rqM=;
        b=QaR4d2dmGYcqRqL/eh4XVkzyqVHVXi1Ptoxx28LPDHDP6rhbR1EFiQPomBdmr2XADE
         1JfBMRRixPcuJpzEoPalq4Cr/WVEvaUBPylslgBUJIxU+sxiGiOKIUDH1QXHPbcjGzGx
         ODW5RwMXV9NzAE1BDCY2HvpA/w+BnQdohYeZV7hWaA5nUW7x0b42eh23PuN/NDnVl36z
         pslXsKiHpwqg6mPGf3A2YyXh557TJyvbXVyxP7enFOKMcxU0/VhUiNi4gS8uadAAxKkw
         Y0K/lSA6eX5Uioy9DADL35H6B0tz3gcvl5xrsinL529Bz5oLOoJFCw2ZdounD4uPYEEH
         DRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786632321; x=1787237121;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uRZcIZWzwhsQClQoWCRDPoqOksp7QGY7YMrfX9l8rqM=;
        b=cPPt9IPNtZV7GHxn0uTdg+MTZCpyznNEv4VbdnlS7OBt6V51mPSEuGONKWQROc4Srh
         UE4DoteAJLG/nSJLh8X+9OvPNPrpK3T6Vo1r9FsH+meqMgjAmIYhdEqdg9je8gfXO/N6
         JdKkg7K8ULazAfQDmiCBC1m/3N9Za8y5JNxrfoowJ3H4Bnl/RUkIG2oukeOdbIe3SEyq
         xyiyWyeK7vPNw/64t7bi0mafye5M2Nvq8lMOvlxq4UHVW8XxEjsCcOimmWTen9kaTSkK
         lRiZztU6b/P1yyBpBdFqal8N9B7fdUbYA3gBZ0GGEfLQHMojYzesAyGpL1aZRN3UTq2P
         1LwA==
X-Forwarded-Encrypted: i=1; AHgh+RoF9vQZ+GMxXEin2WYm1D8pFqGm7zMG2JcBhoCFlES35Oj9lyCKljvnrEAoPT1sagkS1v9I7JvBtUrA@vger.kernel.org
X-Gm-Message-State: AOJu0YwrSlg+fT6WCJMH3J+jl3/PLY6k+2OJUPHqEjdk+QEn2Lpv3Jsd
	oJLogUeS0Xi1Mi+yorVsSvV+LwXmgUGjeanlnkseKqQAdaGFkqWIEomCgZ3jDU66dX5hTEzPSuC
	KSHG+9OYHMeQaqyURH0f2Sd5uydqYrF3Z9uwstn6+iqHADcbQvhrH2LsgW6GUqBvb
X-Gm-Gg: AR+sD11/MYcteTqzX5tL5XqFUVNSyTjkenQ/TGOldTgd8x4MRNVcObM0iudiMykflo0
	RSfLMl5cYuE462mz8Sx6hkUUsZIPDFprO7zk7ICZpvCR19RSQpFFW4COx7NdcclKgg4y01+AWVU
	a2m/g5yZo3hIT19nPJjoBIgiqmj/+Fp5GV5Oq1bHw9Gz+yrs9TWVmkjK9PFtnJNMM1ZN1vm0jjg
	I+/OsUPxE0hfXSXMDbRuIjLljQUo3YxyPdM8qTVdLTAeZVScnjslfBSH7ZMeijlTL6PpeEXYTdR
	shX6q3T2UrJ+W/PCOXdYdBolaYR6IzWJ4M+I9mJyxg8Yp+MkqPmHfHEjqr/2twiorRl/Qt1CEdw
	MbwBNQJlM7O7imQaohAYKogBuFIAIJwxZ
X-Received: by 2002:a05:6820:4b08:b0:6ab:676:7b11 with SMTP id 006d021491bc7-6b0c41b6d75mr5830269eaf.7.1786632320850;
        Thu, 13 Aug 2026 07:45:20 -0700 (PDT)
X-Received: by 2002:a05:6820:4b08:b0:6ab:676:7b11 with SMTP id 006d021491bc7-6b0c41b6d75mr5830203eaf.7.1786632320304;
        Thu, 13 Aug 2026 07:45:20 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45e65452709sm1652632fac.11.2026.08.13.07.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 07:45:19 -0700 (PDT)
Date: Thu, 13 Aug 2026 20:15:12 +0530
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com, vishnu.saini@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: hamoa-iot-evk: Add eDP display
 overlay
Message-ID: <an3YeOetvEJHE7V8@hu-anantiwa-hyd.qualcomm.com>
References: <20260806-edp_overlay_for-next-v1-0-c3aebbc81f38@oss.qualcomm.com>
 <20260806-edp_overlay_for-next-v1-1-c3aebbc81f38@oss.qualcomm.com>
 <anUgxo3BPt74Wx7K@baldur>
 <anWsrXO9RztrF5H4@hu-anantiwa-hyd.qualcomm.com>
 <anZGDietz47mE2wp@baldur>
 <anmKUoLFSDpgOjoE@hu-anantiwa-hyd.qualcomm.com>
 <annMk4RnQKl51Oug@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <annMk4RnQKl51Oug@baldur>
X-Authority-Analysis: v=2.4 cv=ZcQt8MVA c=1 sm=1 tr=0 ts=6a7dd881 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=JxsENykyxGhnw_pnO58A:9 a=CjuIK1q_8ugA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEwNSBTYWx0ZWRfX1Ok63jrjb1XM
 ClKnVZFVySiTrLVIZhspkEvwM0Ca6qnQa9JipLbOjcgoZLK4qGJS4VU6Lgj5COG+vFJRta2UIK2
 Esv7XQmtjTyeOi9HpMwU0yfve/5+6wX5jaxvM5xEoo3oQwKB4r0CBxVtaOfBHd8eSpvYjIg1JkG
 efixU216VVvqrYS6QU8b21kW21G4kHaHVI8oFxVDnSdIqL/ilqkbIs9F5rxSDFGxzafnocxqZuz
 bYl8RXyW0/whKz1ZFJMN3DG7/RkA9pAjgFeErbI2VK0Z/sznlPvVN70fCti45HKAVRCLBF2kW0z
 vxFXXFI9se1Ej1Q8Ki/K2rfI7XYC0CES/CfQBuJOIAo/sp1mEBvc+oR2ljatCmZGbNiCLHhzozK
 rYJuPVvZWLKaUyRIZf4xfPfRuo2vjAS80WPg7pzt/9oi0vbcXB4Vi6v+RvhnG6AnrmhnE4WtEil
 J5bEVNV75B70YMcvriQ==
X-Proofpoint-ORIG-GUID: Rhp3HQd41PrhyHgkrwKGxrmUCyUDQS2Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEwNSBTYWx0ZWRfXwQ5k2vvD6lPn
 EhwNhdZVPAAYhD0m5F9jXMf16pELvCJC98c6lf+Os2WZCukwkGJPdAXdgq8EGpf3BzT1pd8Swab
 M8qho0TcGJllwJBGiFgicfBEeaJghdM=
X-Proofpoint-GUID: Rhp3HQd41PrhyHgkrwKGxrmUCyUDQS2Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130105

On Mon, Aug 10, 2026 at 08:11:12AM -0500, Bjorn Andersson wrote:
> On Mon, Aug 10, 2026 at 01:52:42PM +0530, Anand Tiwari wrote:
> > On Fri, Aug 07, 2026 at 04:01:05PM -0500, Bjorn Andersson wrote:
> > > On Fri, Aug 07, 2026 at 03:30:13PM +0530, Anand Tiwari wrote:
> > > > On Thu, Aug 06, 2026 at 07:05:37PM -0500, Bjorn Andersson wrote:
> > > > > On Thu, Aug 06, 2026 at 10:01:20PM +0530, Anand Tiwari wrote:
> > > > > > Move the eDP panel configuration and related power, backlight, and pinctrl
> > > > > > nodes into a separate overlay. Keep the base DTB suitable for headless
> > > > > > variants and provide a composite DTB for headed variants.
> > > > > 
> > > > > To quote:
> > > > > https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> > > > > 
> > > > > """
> > > > > Describe your problem. Whether your patch is a one-line bug fix or 5000
> > > > > lines of a new feature, there must be an underlying problem that
> > > > > motivated you to do this work. Convince the reviewer that there is a
> > > > > problem worth fixing and that it makes sense for them to read past the
> > > > > first paragraph.
> > > > > """
> > > > > 
> > > > > In fact, I'm not even able to guess what the problem you're fixing here.
> > > > > 
> > > > > Regards,
> > > > > Bjorn
> > > > >
> > > > 
> > > > The problem is that the base device trees currently describe the eDP
> > > > display hardware unconditionally. However, Hamoa and Purwa IoT EVKs
> > > > are also available in headless variants without an eDP panel.
> > > > 
> > > > With current base DTBs, headless variants are not stable where eDP panel is not
> > > > physically connected with board and userspace is trying to use it.
> 
> If this is the configuration that is shipping, then it better be
> stable...
>

Agreed.
 
> > > > 
> > > > This series fixes the inaccurate hardware description by keeping the
> > > > base DTBs limited to hardware common to both variants and moving the
> > > > eDP-specific nodes into separate overlays. The base DTB can therefore
> > > > be used for headless variants, while the overlay is selected for
> > > > headed variants.
> > > >  
> > > 
> > > I see, then it seems your change does make sense. I don't understand why
> > > you didn't explained this in the commit message though.
> > >
> > 
> > I will update the commit msg with details, currently details added only in 
> > series cover letter. 
> > 
> > > 
> > > I further do not understand how it can be that nobody noticed that the
> > > display was missing on their Hamoa EVK during the 11 months since I
> > > merged the offending patch - this is completely unacceptable.
> > > 
> > > Regards,
> > > Bjorn
> > >
> > 
> > Internally, we have always required the eDP panel to be connected during 
> > testing. In theory, this platform is expected to have a display attached 
> > by default.
> > 1. The only difference is that the eDP connector on this board is externally
> > accessible and can be disconnected quite easily.
> > 2. Also, only the boards shipped to customers are delivered without an eDP 
> > panel attached by default, which is why this requirement exists. 
> 
> In particular since you're shipping it without display, that is the
> configuration that should be the dts (and that you should test...).
> 
> Common additional configurations can then be added as overlays - while
> the developer can add their own overlays as needed.
> 
> Regards,
> Bjorn

Agreed. The headless configuration is now the base DTS, with the eDP
nodes moved to an optional overlay. Testing is complete for both
headless and headed configurations.

