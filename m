Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7849C3FE352
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 22:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780524874; cv=none; b=DpjzPy9VvYjrp/gHWjhufzlQiptIs2+++3rISXdtiLai2D42dQYomXbywmm3Kmn9o5pqV5mG9OTIRKKlpT1Mo9iQB7u40kQe/vojz0pC4p91Bh9jEukYVxUON+LcA8O4HFRFX+EXK2npYyBulKNYjHKeYgytxiADXMXrGqi8Wl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780524874; c=relaxed/simple;
	bh=xza65rbfkM2Un1lEJ0wJL7agA0Xdz4vvAnnun5N6O+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4inNseekdGciCGj7eDJ4+jcROOAzHqWHeemw5pqG6HEgsSoaM1y05F91LhMiE1nHSuqKldxZtObJre8TSi3nRNxAt1EGlQThnWz375LyWt0Y1Uzpk7T0ZtOtkOIxp4Jj7Cark9ERIAvS7QtCqzPTpF3e2fusXR7jUfOkZMF8bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SY0UVSOP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QcECFVck; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SY0UVSOP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QcECFVck"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653Ebl631476841
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 22:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xsSXOlAcJwLY6R8+0TCnImJK
	D3AIKkU0hbSagYVOEpo=; b=SY0UVSOPXpph1zn/qRbhp4saP04lSrbHSxxQZ78w
	sIDiCyw0hMCV5J+KVCnuHQ965aHMPg6YQKGJLI9b8tvRcOCiEsZOT4P9FLUn9EKg
	2e0/69On81keTF3GBYzEjm9374fH956TGhM+TfhjNSrRnf1Rv0QWCx6rPOOWtPgi
	rIa8XvH4UTfqDlxCJb+e74auWy4N9YvZhMVpqDeyFmFhBLE1+tfMvTks24pPu4FP
	gVk99ezkTBuAdMWOlAJGc1fAZBRpZy42gjV/SiGumtO/wOT2SuQadusN9MR2RHnT
	jbtVdITEV1pFRhHNT1UB9lYOVXxlWTz+32Xlp+O9dT4Izw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejp6nsw59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 22:14:32 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963b11561bbso38539241.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 15:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780524872; x=1781129672; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xsSXOlAcJwLY6R8+0TCnImJKD3AIKkU0hbSagYVOEpo=;
        b=QcECFVckUMQdp+hHKJMzoG8RoRYcvkcwiQBgznD2KNK3xLXRw/dpNJc6GuEceXlW9O
         E7H1uqogUPPuKxhQEMQ5jc6VB9MZYcavGH2gutq4zztGTgkGGV29Je4VxHdB3MQG7e9s
         SI7epGJ8/pdmm4kbRYj5tuGzIg86yeVtbF+f+W/OJK/CdL6r81MZlirRPlRZAyV7k5HE
         oucLzxZIcvppR6x7fhT3zVVWoRr5dfMBRHClTm1fSXR0PjsK967wFzgtc7SN1nbkmziR
         PjX69Xze1dgGYNmdUeVzjzkIrJZXYLSoz+qAIzJozZGbiqSDQ7Ejfj9aMcfdWGeBrRPI
         nYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780524872; x=1781129672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xsSXOlAcJwLY6R8+0TCnImJKD3AIKkU0hbSagYVOEpo=;
        b=DI9s6iGeYUX3SmwcAbCqOo6EUM/1oAJ/950+UygZjW803DwccWyZVqVlT283cmmolI
         6gEqAXtF7qMyyndL8K1JGcev8fZf1HRZSGDJ0PZfzN7Vhd6U3GFfs438csU2aON1o7gP
         8wNCKL1xnIDiquFnqhBeBLPNY4YRAScd2o9lqhekV3/+Snh+6qH1cik/EWaElR4e1g7j
         F72JEsvIzKFSauT/JniaLNeLlx4zJuU8SFh1HPosMajrRu/oeaLr4z1Y2csRzhtn982M
         4kZ/Xx/BPJO/2WNiZLS9AFD/YkqZVNHy71tznNF7bgXh0Icid1t2TH20rYZgEDKWjSeS
         XUrQ==
X-Forwarded-Encrypted: i=1; AFNElJ/l8/S2ctJ5TxImTVWoTFzRXX2IldTcQO1pIH2NJlZ9yQsbqMY2ZV4kU3J+4DqqbA/yArNOPMkCdBQy@vger.kernel.org
X-Gm-Message-State: AOJu0YwS00bDTVK1IK6UiAoTPmJlUJRKX+Nch/jfCqk+QLZyXbD2aCau
	siK7sd0suJRjENJewXtdh32c6cfIT0r+yuJ3p2/nCOzavptW9+7X1hf/Xkown+xnXkkbPG94mIi
	FuhB1NejPj0e1uUex+tIQB8FJJiz+6wRqCI0+oR5EoCy0h2t6LWPfS7mFUDR45/uM
X-Gm-Gg: Acq92OEIfb2HfVt0TQ3LCF6HZm2VNLGONF62Oc6FHA8EOzqxYIjfeuBq2MrtVicXmMF
	Aq5eRQ9+V4xTXYDZk22MMjXB6anK1pskeJr1rkpWXfGE+74H+wDgsQldDivKO9DsH6QnyECf4q2
	MRR+B/8T0ZBJ7tTSw9eTSbT8sAxn2pFStC47M7GT287V8qXNxT85yq1C3NE9QEP/QIIT4s7eeJT
	sF6UA7RPDNDxiu71myB93qEMQvBBYhgNv4c9/2RFqszS7fjKbz4W0XF8aeaYOtZYzjTuMrPDc2U
	CguRey4Mgo2LzujS23I7v7sekHzM/MKc94CNE92AkaxMthiTVrU2TkSzEtGmRI2H8evIZ2tQMuX
	T1JFKCTGoAcKzK3b7BjMjTk3NNUIdFfaZDgwpduQT54mVEzzRZIsTm1WUlZDv/J/bLVgbz8qycn
	y1nYV60PHJEBuNDtwk+NMhALCPzx/8Mgl0pWChHDklIMWmRA==
X-Received: by 2002:a05:6102:dd0:b0:632:5628:6d8e with SMTP id ada2fe7eead31-6ec460bdf6dmr2693525137.21.1780524871658;
        Wed, 03 Jun 2026 15:14:31 -0700 (PDT)
X-Received: by 2002:a05:6102:dd0:b0:632:5628:6d8e with SMTP id ada2fe7eead31-6ec460bdf6dmr2693507137.21.1780524871182;
        Wed, 03 Jun 2026 15:14:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97a714sm869014e87.43.2026.06.03.15.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 15:14:30 -0700 (PDT)
Date: Thu, 4 Jun 2026 01:14:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Message-ID: <htxqjgwjczsghunsbvo44lwkadzeg2kp6wfcksf3hkmcubvs2d@cw5r67uxskvu>
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
 <54904b61-222d-4600-ad4c-c03a9952d337@linaro.org>
 <be3e1abe-5148-4247-930b-2e23164eea73@linaro.org>
 <c6aetoiz3dcedlxwjmt5cqh2mngswtmanf6p4s2molemnviwdc@btotpaqwcsoy>
 <f6c91099-0002-4580-a5e8-5611b089024b@linaro.org>
 <v4vz7cistjb2iuzha4oykglar7duw4y2uuyhumzs33yvpwrxcu@i5tsg4uzpuwc>
 <8eb709ce-3469-4303-9c3d-8d1a221cb8de@linaro.org>
 <b6a8c860-8b47-4250-a428-5225d0e64a1c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6a8c860-8b47-4250-a428-5225d0e64a1c@oss.qualcomm.com>
X-Proofpoint-GUID: sKDbhJ0F8CxFF94vnOEvPCWOfa2jZIha
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIxNiBTYWx0ZWRfX5cyV2bMwCd8d
 mqcZ+zQsZgfZ7RgOKe/oyw9HB060kR4XJfbsoCY/USUtKT5c7HhjrPl7KJPAZapeGtbquoQfuof
 E5nEdcwLalWPGLbfkhlGBBw9IFjSn535LEy6cqDAmgOdsRRhShImL7gl3qj/p8qIqXemgBEj0i0
 7/BLellqCtVw1Q/wymPr0TG+Wz6e6R0ftX2ILgkAa5rw70HuiyZ8woE1152JJtF5+fieWWiANs8
 ECOVTBl2mWY7RQMf6RhNBNJ9wQcwQngrOcwnrRBkS8SUHQHJRyPuE9M0MI/eGuKikOzYFpqqwsM
 pA7IU63eKuhrtoXYWKXO2E+fqrJLCHl7yEd4hFjUh8JYJMscSsKTdplFTQaBdSbtV4Y4/z4ZI/6
 kLLNB1Ne6CPpFYzV67/HK6kST5dvluwQuL6QY+iZvt7Kggj0W8CvIveyqC2glj3K0cN1fbCwfah
 5du6pe5N6keYf8fo5Yg==
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a20a748 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=mZDqFNyF9VkgOTRxVPMA:9
 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: sKDbhJ0F8CxFF94vnOEvPCWOfa2jZIha
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030216

On Wed, Jun 03, 2026 at 02:37:48PM -0700, Vijay Kumar Tumati wrote:
> 
> 
> On 6/3/2026 5:57 AM, Bryan O'Donoghue wrote:
> > On 03/06/2026 13:40, Dmitry Baryshkov wrote:
> > > > Are you sure about that ?
> > > Yes.
> > > 
> > > > ipcat I thought designated lane 7 specifically as clk-lane i.e. named it
> > > > CLK_LN of some description.
> > > Split configurations explicitly use other lanes for clocks. E.g. check
> > > the RB5 Navigation schematics, CAM0B connector.
> > 
> > Can you please check:
> > 
> > CSI_3PHASE_COMMON.CSI_COMMON_CTRL5
> > 
> > 0 LN0_PWRDN_B Lane 0
> > ...
> > 7 LNCK_PWRDN_B Clock Lane
> > 
> > ... just a badly name field
> > 
> > CSI_2PHASE_CTRL10
> > 
> > Bit[2] = IS_CLKLANE
> > 
> > Right so CSI_2PHASE_CTRL10 controls lane mode, indeed. Thanks for checking.
> I can check this with the HW team. Although the SWI has this knob, there may
> be some limitations to use any lane as the clk lane. AFAIK, only two
> specific lanes are clk capable in DPHY mode.>

Having clock-names property doesn't mean that all values are valid.

-- 
With best wishes
Dmitry
