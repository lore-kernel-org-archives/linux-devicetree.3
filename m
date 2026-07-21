Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0C61B4F1F
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 12:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784637080; cv=none; b=LmcEgcWzgHUb6dunMnlMt+w0eaFIW+yn2CFEgOO0hrJcCINKn9guyMoyKsqT8J3npmUeow5axDAUpBAc28smw68EAiuWhJAlWdbAx2UmhlYl5v+Qbxka8yog0FN8re27Zu9cpyLGc1fh9Ng8PD+yhPDqL86HfUsbk9aBchL1d28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784637080; c=relaxed/simple;
	bh=x+cDWxvd6iFPuJlJCy4UFeRhkEaX3CqxjQ93xQaMjAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oOqTt7PW0VGsJFgrlVmmQA0FQAyoB2qoTSzu9h8gAFUYUSsPLvBmPbmP6HM/zvmKu0MQ2DBi1cxT2znYF4t6xmAeS7b7HFzNuSBevdSeQhoHexJlO77OipaB3F5x4LDPp51MrwzAmWtxpHEg2ph4P5kfQ8UQGaykDlkcW1zdfPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bqNnl+Wj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDZzAhYZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bqNnl+Wj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDZzAhYZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARNn01499963
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 12:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z62EXaW1RVDbHshV45H1fxSi
	JwUM0Gou28eQQdxoWRs=; b=bqNnl+WjCSPD1v8OQLu9vvKVz0TC3IvBsmyTR7X0
	kJSfw7pjtlmqZIHR0u8d31X4FoEZ9DOu/ih5E1LAQBDzmCmyVvMOR5XJctyV+Wut
	FSJYAr6r7te4jk/cWy1dsmaIHrWesotNjjhE+2ICoxmuxm77arLqlqh210K4UIwj
	lgAiFZASCUBvQrmfzu7r/DH0yugxBWgYPHDm+ymqZxlNACDPkaaMJgbDx0H0PXwb
	+a62dppZUofX0RHUl09DzpD+5b6qqkLsYBjW7eVEJs8X28L0AxW8OfzC0UP+kGgn
	x9ZTDGWq31iM64wIC8nR3VK9Vr9R3dSmQeIMmAwaOUv85w==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvt9uh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 12:31:17 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81e6bb29581so118602167b3.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 05:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784637077; x=1785241877; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z62EXaW1RVDbHshV45H1fxSiJwUM0Gou28eQQdxoWRs=;
        b=dDZzAhYZ7f9qlNo88gORGq0Z7ifDlIDa/4lE6Ne2ldVeZRXwrdPm10HcsEXjYQc902
         bIXqQ43oIvkeIK722qfVX2J9u/BI5OILVqwiSZJLm91OeQvU2pnH2asq8d7uQJHm0mMR
         /kFesy31gEda2eH76thKA4kfl9cIJQ7SO0jjUdy+tSY1477Ls4Uw0RvYx/X/3mXV4XGD
         ClqZRLCQqMlmF88pu/8cwW0KAhwDCshHKiVXFUxQKQfmcargzSlmKD/vt0ADzlG3po+w
         cTvlADHX2kZAybniDQ4ImZHg6nOfieO+7J85NpeSktVsW8zRupZlyGQU0btwyH5YefgW
         ZegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784637077; x=1785241877;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z62EXaW1RVDbHshV45H1fxSiJwUM0Gou28eQQdxoWRs=;
        b=K11L8AOLBRvyOJlI9/wRAAebs0jWrmozT/ULybZNiAVBBhngSYBBoUs5BSFHK9UYIS
         ml8njMKrYF7Mjc4liZGEk76d9JXtB6RkX3J2qhODFmakm8zEIhT+3YChsv8+Y3wJcIZa
         LH9G+dg6netoWpnC7XP+K7u3iVrNb0TU8voefnsMliViURSXo05slHxEcn9ukRHQx1Bi
         2ayawH3B08UH01KAXUQY6be4q8s0yY6zdGZdoVTxuJq/K7NrTFfjWh6Rxe21JD+NKPZv
         4CrKFBBwBJjceYL7E6gJgPqOK6fPSdJXwgDb4nCbYITpHwfymtZSljZprVoeu/mvgHT0
         QRbQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr5X7foBs5qDWUGiCf4Dms3GJLLRhOnxIK6WXcDt7fP/5GKAtKeRUXziNrcskg6UzY9yrOTHKdRlFzy@vger.kernel.org
X-Gm-Message-State: AOJu0YxxMRPoxEq0oxbY59AjE2mbjqF9oq7NPcEhFdQjn/M5AYzRa6MB
	tSCnHRkNZ7417EMIVg2i51pBCOCsjBWZzdgec7w1X6d13p9xnqrMenIUsq2qRRXA2QobL/ks/4n
	eK0u82lu1ZTA2EEcka3F6aF+Q8W/F21s1MG/9npGpuDIU0ZnKz5IZ+LMF8kuriyzZ
X-Gm-Gg: AR+sD13hYLhxCa+6G79vWn5lhR2eE0RH65MVP9R8jkfHkAdNH9hgDbL+2hOYF0NHgTD
	zug3Ck8Pp5/xeKK0px3cW5YiwtOgPbAIxd8BSBIpW43k2O3CM+8ydP9BTnAXhJsThi9U5p/utPr
	eSu7fYp1Z8SCuWFiJiXadQLKY6/SF2tx2VPKMPoEMVP2a58IEQTwAKBAaZPNIyxZgjzcbPqDi+N
	AON0ArQFuTBXtTL+WEkGy+SBWm6s0MxzT8WRrb05bFy2TDWZvhtNqx+hmeLRpfCG0a4M8BeCcZf
	usrJtEdAZSvlDBiCZRiW69Rj0L63/jfVHGDD8mmfoVXUc5RgXJfniwpCR73E0DmoRoymHUBr3a6
	LDmWDoyUNgphALc4suRezzVyc7xcQmDWLr0WwibrPWI/jMH9jGLdNlUiDeauzAz4YIotHrNEmaK
	UwPS9Zmh9sq57LhQ==
X-Received: by 2002:a05:690c:c1c:b0:81e:8d96:a64 with SMTP id 00721157ae682-81ef256f07dmr57462077b3.13.1784637076720;
        Tue, 21 Jul 2026 05:31:16 -0700 (PDT)
X-Received: by 2002:a05:690c:c1c:b0:81e:8d96:a64 with SMTP id 00721157ae682-81ef256f07dmr57461887b3.13.1784637076311;
        Tue, 21 Jul 2026 05:31:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ee8cd70d9sm4444231fa.24.2026.07.21.05.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 05:31:14 -0700 (PDT)
Date: Tue, 21 Jul 2026 15:31:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
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
Message-ID: <asayt7nocnvfcukrjkkycbsxkgaqxyoqzefejvhbiqgzdaw5iy@vb3t5juxml6i>
References: <20260720-pm2250-fix-supply-parent-v2-0-60ca47031b50@oss.qualcomm.com>
 <20260720-pm2250-fix-supply-parent-v2-1-60ca47031b50@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-pm2250-fix-supply-parent-v2-1-60ca47031b50@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 5W8JWB0sB6lP03oaverEiOUH29XZtppi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEzMyBTYWx0ZWRfXxSHcaqoFzF3K
 ybwm8UPv3HaCMB51sfUFHVWe2YTRCiSnqQ9yxfNZUCu/h5vSCOrtXgh36AN04H3+JEhi6olXrxp
 pD5L6i7CjqwBQubvB4WGgkiOWF/e6B8=
X-Proofpoint-GUID: 5W8JWB0sB6lP03oaverEiOUH29XZtppi
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5f6695 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=QRU4spEsvDc2jYG_z8oA:9 a=CjuIK1q_8ugA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEzMyBTYWx0ZWRfX+HTnJyMJ/A2I
 /cSLnJvLx9oXip8cjJH4Ffhl8mOve15yPkiQwekfVAH/Lm8dVPhcvf/IveaZaCbymSCHkuVOqQi
 wXQismTknZTAtylE03lXX7mnNT+Y/r93UvKT43qmYU3l6NKjNzKLxF37cyld2NlbydkY+rpCI4A
 WMx3FpjiCIwWUMsiFMl1x/D4lYqhy7ywRHSK4z7cBNqKSgcvw+inkH2j8bfK8HUjX/MUvZT8pNP
 OpQoyI/q73R03qFL9y/LMwSb5MsWsCv1Y3P+uzKuUgOy16F+Xn09XR8rkSRQy1IdzVIym+vtMoh
 73b67jL4rDNUU9vsFqdZjVXF99JBBBGnISmNwV6B7PWALdPpVxcyvcmG4Er0BHy6PnKRyujSsNU
 WTsTDIaUU3JIVyS9xq5hZDUMglTQZr80Qg1UObc/u2b1v5LwezktoXTMcO/ednpPLZzAM0KXGJ1
 WQ2A2XK+89W+dQXjWbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210133

On Mon, Jul 20, 2026 at 04:25:04PM +0530, Rakesh Kota wrote:
> The rpm_pm2250_regulators table hardcodes supply parent name strings
> in the regulator descriptor, causing the Linux regulator framework to
> look up and vote on parent supplies from APPS. This is both unnecessary
> and incorrect for RPM-managed regulators.
> 
> On RPM-based platforms, the parent-child supply relationships are
> managed entirely by the RPM firmware. The RPM ensures that parent
> rails are maintained at the correct voltage with appropriate headroom,
> based on all active child rail votes across all subsystems. No explicit
> parent supply vote from APPS is required.
> 
> Furthermore, the supply rail connections to PMIC pins are fixed in
> hardware. The previously hardcoded supply name strings were inaccurate
> and did not reflect the actual physical pin connections on PM2250-based
> platforms. The correct supply relationships are to be described in the
> Device Tree, not hardcoded in the driver.

Last phrase is incorrect. The driver can hardcode parent supplies (and
it has been doing it correctly for all other PMICs).

> 
> To avoid unnecessary APPS-side parent supply access while still
> allowing correct hardware topology to be described in DT, set the
> supply name field to NULL in the regulator descriptor.

Why is this touching only PM2250? Should we drop all parent votes?

> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
>  drivers/regulator/qcom_smd-regulator.c | 52 +++++++++++++++++-----------------
>  1 file changed, 26 insertions(+), 26 deletions(-)
> 

-- 
With best wishes
Dmitry
