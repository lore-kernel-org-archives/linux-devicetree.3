Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE165479882;
	Wed, 22 Jul 2026 11:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784718885; cv=none; b=CaFHNyRGTTCvtkcJPV0gv6e3/S4wsSls4IsD0ZpvRGs92PWS6Zhol9HTGhB22ZfpF6ezh+cWoMKIrWHdw5N+dPHV2rt3lgMzaTlxwsh0ESdMwRHZwj8c+6NkQ1wWGfEuKBYfwMt0OCSG/VqIyxp8ne2UuFENz0PYtIcCeXc54ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784718885; c=relaxed/simple;
	bh=cof3uyMoDDPCCfs3+72CTEQj6DOMMXwj11cmCAu9iZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IH6403/mI6EzMyu7MfnZnAtu/UMnAhelKQPVqiaBTmdfbIgsaB2ZlE5MKZrhPnkxQvSURRLDAMWb5q8jDlT6DJTskUFhxpi88BhNPsODJ0d7n4so2S25aNk2HP/X2qC+dCYw+gq9z0YTe8qho8vD8qn9+xafMtSerpUV6w9QB38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QlucbqgP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QlucbqgP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xLZ5412301;
	Wed, 22 Jul 2026 11:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jEaX5v9RSZpsdoP9oka3r6Gi87ZbRs7ZRZg0MleYd1w=; b=QlucbqgPXOjKvUi4
	oWWpm09HPq9Dq4I/9KYRNelZTfY6ASNtUTrYqqw97LoYxDQLqTe7be99XKwDCgTl
	MXwbL6e0xoPz7r6QuhJ0Dj3rsmuloTZPbcgUYpjB7Zmf8VlEeRQfbQXnnBQebmoj
	H7ZwFEU2yXFCbsgbOyH5cio+YA/1mXcM0rdREncys+C8R6anoS/CWw0OR8RLRQ5w
	piAdU/gqQLAOV1EH+kcBsjsw5yh5yGO1I/YmHF7TkXwV2k3MQ7ZSlJ/GbXsFNf8Q
	SsJuvXIP+98d+y+XEJFpdZgU6jT6L75FuipXCkYeqWFR/H10j4Np2XMIaEQPGdi3
	brTPcw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjpxdhhbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 11:14:33 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66MBETds008319;
	Wed, 22 Jul 2026 11:14:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fgj54db6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 11:14:29 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66MBETgv008310;
	Wed, 22 Jul 2026 11:14:29 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66MBETTf008308
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 11:14:29 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id 89A24B2A; Wed, 22 Jul 2026 16:44:28 +0530 (+0530)
Date: Wed, 22 Jul 2026 16:44:28 +0530
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
Subject: Re: [PATCH v2 1/3] regulator: qcom_smd-regulator: fix PM2250 supply
 parent mappings
Message-ID: <20260722111428.lfxslgf3fpjggila@hu-kotarake-hyd.qualcomm.com>
References: <20260720-pm2250-fix-supply-parent-v2-0-60ca47031b50@oss.qualcomm.com>
 <20260720-pm2250-fix-supply-parent-v2-1-60ca47031b50@oss.qualcomm.com>
 <asayt7nocnvfcukrjkkycbsxkgaqxyoqzefejvhbiqgzdaw5iy@vb3t5juxml6i>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <asayt7nocnvfcukrjkkycbsxkgaqxyoqzefejvhbiqgzdaw5iy@vb3t5juxml6i>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwOSBTYWx0ZWRfX71yGxTW+Vcjv
 uWc1201yvqMWTK6SdUFwM9o1pRNMWdTenlrlA2PcR5/x7N7ZQxa+wo+DVgVMnUZbYLKfNu37vQk
 TiWCyh7yuJ4krtjHFdgGYVGO+4cM8zcXTcIPAAca2l+LXLp2cRdACmy4wW72DLEkPsD7/EPdlrL
 OlduYYUoSQZtnvsUNH06lGgNeF5yCT27zaSBK8aqBBGs7kCSBFVZyx8k/I+TjMtBwjLasIdH26X
 0x+HjzI9HWmgkP4LbiVlNHCf1Zlq8gWlaXm3CEu5Vd16yAo6aCnEH76+v9LijRI1eGfOSfyKLSr
 rkIxzN6i66104wQ/isSy9vBmAPUyVVkyC72KiL31QlEXL1/rhgueqpi0E6EG74ukxHbVsmuffUS
 NP5inIq0cPHi/6LJZ2Juv6TWlZxncYc1+fPog1X5Dw9QFelRmqeOheo5VeYAjn46LFETQBzXPi6
 iLfsvUl0zBTX/UBgk0Q==
X-Proofpoint-GUID: tKwIJVUCGLBzPrsYOlGgcid66EHaE8m9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwOSBTYWx0ZWRfX0nj5H91LMHDb
 +za50KEw7fAqsACWRsuEc10p0zyP6njinrarmGt5ug2+NKK1/Knk44cJtVa0kxjLYfMUZpIlcFa
 14k4KTY5oxw2hbZu4EuS/5xHtjSZn8g=
X-Authority-Analysis: v=2.4 cv=b7iCJNGx c=1 sm=1 tr=0 ts=6a60a619 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=FvKUVRC1Di6TM8Q9WzYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: tKwIJVUCGLBzPrsYOlGgcid66EHaE8m9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220109

On Tue, Jul 21, 2026 at 03:31:11PM +0300, Dmitry Baryshkov wrote:
> On Mon, Jul 20, 2026 at 04:25:04PM +0530, Rakesh Kota wrote:
> > The rpm_pm2250_regulators table hardcodes supply parent name strings
> > in the regulator descriptor, causing the Linux regulator framework to
> > look up and vote on parent supplies from APPS. This is both unnecessary
> > and incorrect for RPM-managed regulators.
> > 
> > On RPM-based platforms, the parent-child supply relationships are
> > managed entirely by the RPM firmware. The RPM ensures that parent
> > rails are maintained at the correct voltage with appropriate headroom,
> > based on all active child rail votes across all subsystems. No explicit
> > parent supply vote from APPS is required.
> > 
> > Furthermore, the supply rail connections to PMIC pins are fixed in
> > hardware. The previously hardcoded supply name strings were inaccurate
> > and did not reflect the actual physical pin connections on PM2250-based
> > platforms. The correct supply relationships are to be described in the
> > Device Tree, not hardcoded in the driver.
> 
> Last phrase is incorrect. The driver can hardcode parent supplies (and
> it has been doing it correctly for all other PMICs).

Acknowledged, will rephrase.
> 
> > 
> > To avoid unnecessary APPS-side parent supply access while still
> > allowing correct hardware topology to be described in DT, set the
> > supply name field to NULL in the regulator descriptor.
> 
> Why is this touching only PM2250? Should we drop all parent votes?
>

The fix is conceptually valid for all SMD-managed regulators, but this
series is scoped to PM2250/PM4125 which are the only platforms I have
tested (Agatti, Shikra). Happy to extend it to all entries in a
follow-on series, or do it all at once if preferred — please let me know.

regards
Rakesh kota
> 
> -- 
> With best wishes
> Dmitry
