Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E853958B6C4
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 14:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789654792; cv=none; b=QFRu0wnIrEa44uknE4dR8jGYUxTj/o8mgAiitreys//n9BmkQxgV7YpygkgdoUsT5Q66tPQF8Ujmym0uic4rNOqpcOPd0hDYLn0cvGjq2Q7l7p1msOBhQEsx/vpMxBpss5WhG1i6Jw8mJL23iZSlx5kn/gqOelk/kAhe8OPoGfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789654792; c=relaxed/simple;
	bh=Bhe1thWj6EpXQXMQGcwRAowXV03R2FRCWSxRWS7uFOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l3hQn5ewxj34ZBCycg4cFJakEypfqrgtqC0g1ObKfaead0zRLL2ufwPw3eoA57b5u1am1SBc3c3C3h8pwdJ2+1yPMfM8Cqxef1SxpRtr2WOyQyCXqhMKM7vVp2X0s01eCUrbON9INkNHBG+Lkoz3pna2fTJGjf8RP8UzZ0F1pNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=afBN62mN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=apPy0h8b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="afBN62mN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="apPy0h8b"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDioog1137784
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 14:19:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Rg9K5jhjT9zuKkweVBgiD4wM
	j+8PYDWHgQtofVv+SRs=; b=afBN62mNrdfimBfF4yr6gPp84H9a2czZl7F8eZ2X
	rsi96Ac038KRzyVsnrZdUuhwd+vrELOzheEv1EIFebCxzO0XoU5YbQ274Go7Wyb0
	lOENXGEn2Lvwi4dBuWWu26YgZ6NHbBbP7pX1UE0v3LI5TEh9hzrovzJ/tk/IT0Gh
	gbh29+xWwGquumptaKoX0MHI9PMcsUfBb9UAl64a+EFP0qQY1Np+57PrHswHV73h
	KMMwOO4/Ehc84N1DAv/1yCKPtIg+Ee5id/VcEn5i59kJFIhtfStqqEsDWuHBaOhQ
	87Xl6j6bwJTcUEi5124H/MRf+AnlaZvuKkInijHB1xtlnQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr8uw2ht7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 14:19:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ced1ed870fso1781445ad.2
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 07:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789654789; x=1790259589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rg9K5jhjT9zuKkweVBgiD4wMj+8PYDWHgQtofVv+SRs=;
        b=apPy0h8b9g+IG6Bu6E11JWWsFoZaSsvPW9zwu4TviLa+FN5NlPzDxRGyI50DLPon0j
         CDvPZiveDm2CoYWMFQ2bWVr3N/bnhMxq+danIrVxYdhqs8qTT0n8XB5xxYMSo8QonRbA
         te1OB5V69wqoWRWzchk891Fuj5sfcZKxYSarP/wUfr1TpmLMVJG6RVWN/LAsr4sGjnrO
         iEVvX3OgGTGtb7ihomjJkOx+IzaXeJhZ/ST9J5u4ZEB3XU0FHmpca5LyLU2S71C6ct5O
         4lfVU8MQDc4FFoidqDH7Pl7vnCDiewGNt4BhkG89eWsjT03yKcAieMRQZinl5x4iBm78
         VCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789654789; x=1790259589;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rg9K5jhjT9zuKkweVBgiD4wMj+8PYDWHgQtofVv+SRs=;
        b=hkwhc004SH7zAKmc9U0sdNwy59aOUsGK/lVg9x40AyuBo5A1PQ24Y+/ErQ5WFH/p6F
         lRslwVoTgCgMYNyv60LP42t6wH3SmFOwDU8QD8lvyrKjwumarQHom0UefnPjkxiBk/zo
         OyYg+VjP4n1O2SaJ/R37pMewX/zRiYOUjLEcwTcu4236rz5Xi0k4UdqOiQR3xz2WvgS9
         IsDdVrrrhaZ7NeGDp/FIhr5kFDEvfr5yoyGxdb058Bc4C6X9YQ1njcfwpaMxlwTuEaxO
         m83NQtYSVnoC/VNyhKx8AUnfl7QKb3DTHWLApzt/a6z8vcpkkWksQC8Iu1DKRe4W3wMc
         EraQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2dprxHVunHQOLERc63o9H/j5wFF/dTxfRLDXtpi7Q2OWKM2LYb2hYbAdf5KedDCsTBODHih4iXTD+@vger.kernel.org
X-Gm-Message-State: AFuF++liX7RABrJx1BnJo3bo+uXwClN8E3zCWrOBeUTiyL3l/q8CGD/e
	w48TJfzxOE6u6g67mS0R56HgqTCT3T9/xCu3d7Bg16ijnRqosF/6aOiP6J8Df73OfIk4ZDTgR73
	sUSUBxOfSB8pF0hSN/sKPuDdxOYmhFh4097i2mmmcUy5sAknS+Q9r53klucxzInN7
X-Gm-Gg: AYBFou1pCYMBEhEfLShlMr06XRodVJZaTHA1E1FqLZ9SiqITpHde936r1YsJ6pYLyZR
	pARFk7k1fBgF0Ub95vpY7DdKzKVZNAJ/qJDqM6/OWi/UEAdSTNQ0x6c+zrwjIVzJhUifaqJcv5k
	kE9Mrbygz4AdsFuH/gaPvmkVByzWXULBItPg88Kvq4DYN44jSpCMB/xBeijcRBTz/uoY+sj5wx8
	foNnacSUhu93Of2FhGF9piumlhcRN1eo0330KH3bRpxSP/JPCVgeKffvNd95f7GHvgRXcuwkbgP
	thf7O6T+gPizGCSfRY05z9zKU7vp4Hy1+l6yK9sS+Q4TjEHFPAcMVO0HeCgB2yJh6UL6H4rTx+3
	IycTCnrz2TegfSjtVMKaIK3qdvd+ymcaFXoQk8d35ZH6wS5h4ZkA0qVX9qoaEpRLGY9TaQker6k
	Tk/lxMRwHJkZLT9vL9PG57
X-Received: by 2002:a17:903:2301:b0:2dd:8b95:d8f6 with SMTP id d9443c01a7336-2dd8dd0afd3mr102548585ad.1.1789654789218;
        Thu, 17 Sep 2026 07:19:49 -0700 (PDT)
X-Received: by 2002:a17:903:2301:b0:2dd:8b95:d8f6 with SMTP id d9443c01a7336-2dd8dd0afd3mr102547915ad.1.1789654788431;
        Thu, 17 Sep 2026 07:19:48 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f134c3sm27533935ad.68.2026.09.17.07.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 07:19:47 -0700 (PDT)
Date: Thu, 17 Sep 2026 19:49:42 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: Add LVDS display overlays for
 lemans, monaco and rb3gen2
Message-ID: <aqv2/nFNwN6Av6bq@hu-vishsain-blr.qualcomm.com>
References: <20260905-lvds-support-v3-0-b40a1b03f63c@oss.qualcomm.com>
 <aqsqE2-ocdV_W34q@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqsqE2-ocdV_W34q@baldur>
X-Proofpoint-ORIG-GUID: A1E4dHNbKxPS-zq6oYkDIb-kFO20gMHt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIwMiBTYWx0ZWRfX2ckqXvR6ZPfS
 AIlhpYXIJs3e8uAS0kJfNX1oyWPajKM54nNlAx+Mf+pK7VF4j4JcA/48o2lD+Ua5lyFdR1U30l5
 X9B1+3u1vyASZL0Xm/srSA0ilbDsE4f43otrSLfyP8dsVj4IBSV3lJr96AFAqgB56OSOYBOPFLy
 pLIdxOTZ93RSgjwCc5n3iQWkF6iX2wKvzR2T2nz09X2752zgJ773m+uCGYAq0+VrBgBdKBfnMU5
 o9yq9lsktCbJSq3SkFrjvNGToTxBHtgfQvSw2xVpLtXkt1524J4jopUfU9UrXCcLRdyJj6X+3+f
 zZJO6eoApukB4SI4yAj3ZWI9eXIC81LT+SvDMEOYWIX4usiSaXs+8m7AxASayrQJfZu9DYF2pyb
 mv+L6fANdhVJN7OHFphZ+tc7gZYkK+X45UXlMwR8vJr9aQHrJVFJMyyay6wGFNOlBFtujgBKoG9
 ePM9Nxcn41NEC9OpDpg==
X-Proofpoint-GUID: A1E4dHNbKxPS-zq6oYkDIb-kFO20gMHt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIwMiBTYWx0ZWRfX9PlQTWPHYtB2
 4TTA3Pb8CyR4oujso2zhJ4+XuotNESR51pRaKpp9jZwdlXJDIGlu92SWFmMEok7YjmwjWUD2vYc
 jk/pxQkjJY1uDDkUammQWkk96d6i6aY=
X-Authority-Analysis: v=2.4 cv=dMUzC+Zb c=1 sm=1 tr=0 ts=6aabf705 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pDfW-8FT8CKwSx9uGTYA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170202

On Wed, Sep 16, 2026 at 06:47:16PM -0500, Bjorn Andersson wrote:
> On Sat, Sep 05, 2026 at 07:00:14AM +0530, Vishnu Saini wrote:
> > This series adds LVDS display support via device tree overlays for three
> > Qualcomm platforms: Lemans EVK, Monaco EVK, and QCS6490 RB3 Gen2
> > industrial mezzanine.
> > 
> > All three platforms use the Lontium LT9211C DSI-to-LVDS bridge chip, which
> > converts DSI output to dual-channel LVDS for driving 1920x1080 panels.
> > The overlays are structured to be applied on top of the existing IFP
> > mezzanine overlay.
> > 
> > This series depends on:
> >   [PATCH v8 0/2] This series adds LT9211C bridge driver by extending LT9211
> >   https://lore.kernel.org/all/20260904-add-lt9211c-bridge-v8-0-36d66168e176@oss.qualcomm.com/
> > 
> > which adds lontium,lt9211c compatible support to the lontium-lt9211 driver
> > and extends the binding YAML accordingly,
> > 
> >   [PATCH v4 0/2] This series adds BOE DV215FHM-R01 LVDS panel support
> >   https://lore.kernel.org/all/20260903-b4-lvds-panel-doc-v4-0-861738a0d5de@oss.qualcomm.com/
> > 
> > which documents the boe,dv215fhm-r01 panel and adds the timings used by these
> > overlays,
> 
> Then get those merge first, so that I don't have to spend time figuring
> that out for you.
Thank you, next revision will be posted once dependencies are applied.
 
> > and:
> > 
> >   arm64: defconfig: Enable Lontium LT9211 driver
> >   https://lore.kernel.org/all/20260904-for-next-lt9211-defconfig-v1-1-97221f0109d7@oss.qualcomm.com/
> > 
> > which enables the driver in defconfig.
> 
> This is not a dependency for your changes to be merged.
Ok, will remove it from dependency list.
 
> Regards,
> Bjorn
> 
> > 
> > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > ---
> > Changes in v3:
> > - Removed redundant status = "okay" on nodes that are enabled by
> >   default [Konrad]
> > - Added a blank line between the last property and the following
> >   subnode throughout the port@N blocks [Konrad]
> > - Link to v2: https://lore.kernel.org/r/20260813-lvds-support-v2-0-6b11035e8ab0@oss.qualcomm.com
> > 
> > Changes in v2:
> > - Updated overlays to make them compatable with panel-simple-lvds-dual-ports.yaml [Rob (in panel series)]
> > - Added Empty lines before the status property  [Dmitry]
> > - Link to v0: https://lore.kernel.org/r/20260719-lvds-support-v1-0-1f1aca3213ba@oss.qualcomm.com
> > 
> > ---
> > Vishnu Saini (3):
> >       arm64: dts: qcom: lemans-evk: Add LVDS display overlay
> >       arm64: dts: qcom: monaco-evk: Add LVDS display overlay
> >       arm64: dts: qcom: qcs6490-rb3gen2: Add LVDS display overlay
> > 
> >  arch/arm64/boot/dts/qcom/Makefile                  |  14 +++
> >  .../dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso | 113 ++++++++++++++++++++
> >  .../dts/qcom/monaco-evk-lvds-boe,dv215fhm-r01.dtso | 114 +++++++++++++++++++++
> >  ...industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso | 106 +++++++++++++++++++
> >  4 files changed, 347 insertions(+)
> > ---
> > base-commit: ba20122d4c311bd9384f38e7ba1d0c122e21745d
> > change-id: 20260708-lvds-support-2d40d60654f1
> > prerequisite-message-id: <20260904-add-lt9211c-bridge-v8-0-36d66168e176@oss.qualcomm.com>
> > prerequisite-patch-id: dbba64d1ace696df388c5df3d1cb05a0701df194
> > prerequisite-patch-id: fac2b93f3e250589dffd7c076d2ef1aa7a2519a1
> > prerequisite-message-id: <20260903-b4-lvds-panel-doc-v4-0-861738a0d5de@oss.qualcomm.com>
> > prerequisite-patch-id: 1d3e40bbefcb2550afd81c5cced812a1d3b943a2
> > prerequisite-patch-id: bd3612ce053552e2ae7401a1217c4884413563f4
> > prerequisite-message-id: <20260904-for-next-lt9211-defconfig-v1-1-97221f0109d7@oss.qualcomm.com>
> > prerequisite-patch-id: 9e3233401819ca53c119e6cfab95b0c471ef254e
> > 
> > Best regards,
> > -- 
> > Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > 
