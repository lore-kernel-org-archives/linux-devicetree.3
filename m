Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39742D2394
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781223942; cv=none; b=s11/DgvXrUmGSjb4EXsEqbstO7JXTBvFQ+iiU6l4WP8tJnny2zPunr2bjWy7IDNnAMLZDhawilUSeiauvuFzsqhrplNQ1jWhw4j2dsKMrM9WePXm+qyr3mEsXYHeXZzcLELBYIBGbDhuqXhZeFsOAOGg1i7Ka8xvI+7vhS38pvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781223942; c=relaxed/simple;
	bh=ps7Pt4xseZYFFr2fzgHdw4o9c1eHy32wy2QzTrkSobI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APBfNH5nYTgxGVcjqu4+Fk1rDDPZ8o4pJZcWaMBwiy0uAg5tfgPEvFj0Is4t6Tgc/jVyaWqnlbKEqnvCb9mz0d5fl48WNMsF7GO9dN0h6PXTI9xLU9GZk2EoG7gXveAVJarS8TKLFd94g/cfy8ixmJmNcw/UlslPKqdobyScMwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FawRp0tw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LuWW1NSk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FawRp0tw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LuWW1NSk"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BMT0gW1917444
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iSS1+Hj+2kWYpMTK7YCbA6hsiqdGiTmna2KojhDTjkg=; b=FawRp0twJnaY8fg6
	9OpnSaqjKR3DLTIdP176OUIRxkykpEwlEOscVfLvKOJ3VPdDoaSxkUA6UgfdD8Xb
	zBYmu49Pa24KeadEBv10bX+tzTEIfIvWDV3NKOeaihdQ8xr/shprTIbqWM7sGm88
	DbgG8Dx70YOYtq5NFyI9DxV3HYFPDMhYox+8GqXoYh4cmxxLWEWpAcrUxO1Sj/HN
	61/Jzd9zVfKsZDN2zZWpHRtlUxfRrlupuFU3AG+ByD8Et7qCit8HnM6medvxD3xp
	rbn2J1eNPKXqtS709tPr0kcg7mLhxJBgxVBIqQxLSdtlV1hIoVnmDvJt/IQ5GphJ
	GpIGBQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0xd1nyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:25:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5176d949c58so8671511cf.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 17:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781223938; x=1781828738; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iSS1+Hj+2kWYpMTK7YCbA6hsiqdGiTmna2KojhDTjkg=;
        b=LuWW1NSkceuculxUlUNcX5/NO/qDXw+X4pNh1v1pATZYTlr02PW+cPLnzxMDmG6IQo
         fjSvztFzZ1Ft6TyUpLm+ArH2wMJUEX62uRWJ/rJtKelrfxls5JhxztnJ8W9l6mD3dRIt
         w8qTB8GKlhcG2PemHAeu1yQbsoOI4zMvv82RS18TAvGWJoRftw4q0HZQxnyZ0PnHf7XZ
         r97BdN0580nA5rVTZBjWGmfaTcE4MrOl62we9F1KvQn3e0txM+bOnXbIBCtjECMpBqaj
         e/OOhOZ1yDM1cX3miTYZLbPpODN/n/PLt+ncxw+6+02bY0cQWJRRyjkoSg+7kpjDhRxN
         gD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781223938; x=1781828738;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iSS1+Hj+2kWYpMTK7YCbA6hsiqdGiTmna2KojhDTjkg=;
        b=sE74xnwCVk5E40/LuNypCzyKZ8vTtxgQNTE9cqeQnlbWDhuIqL2ig3PpUPqaXHtVa3
         ry1KPg5TH79q9w1GPHvjJrHEdkdSYxAQOZWa0cB7g7FhEGxbYROKjBXaBBaPPXuhy1gc
         IyzFZCH8gbIaxYCczRJy0+yAfgYlRlWPBLYJRW+u+MROCyy+4KyX4kYbRGH3LOacAFYE
         bJUuFbAlRwIz4V9tDTdMTb5lI7TU3q5zuZW2DsF4ALj/5ZTE9Mh7Zj2XCCVo5GF4di4d
         s+EsFRi852WTV4cvwVBdJU78uBgP8iBHmaeIxANTY3Xgsug+KS2/QllM5q8Cnq4WoN/5
         JSzg==
X-Forwarded-Encrypted: i=1; AFNElJ90oQHiS1uGXG4Gjcx0kcpu0bLX8qPfawJypHDUXTHUh6w/1fvxL/+40vW1ePyZ2yPncsb6Pg38a4TN@vger.kernel.org
X-Gm-Message-State: AOJu0Yxiv8qACGxaj3f/oIGLOU2UGEqVNMGQlhtXGFjPXjM5oPlgpRhf
	STh0eETbpwcp6mDdYCUx50MC7siTxj+nX2WBmLq4mzahlFQSwcNCgjkx7pOEfkNvFiApXyECiY1
	LXtBn5Z0X8njb9NJjnZ75iCp75HKl+ik2OF1+4Fetb2Q+ihRgRiTfVAbykg/Y22hz
X-Gm-Gg: Acq92OE2sh36kEmumikBrUqTHZSkO62/e1LayESRS64Qv87oqafeiVUY9lezlub+gvZ
	sOUcZb6sFSDBsfkrtN+sF+DqrOIgwJv3O9ExXtRMQ+FYWmW73eYqYn5FYVDIKnjVw9Va3gylTh6
	His+PniPjQPzJybetPZrdYz6NRVU3QX99MFFK0Wnc9SbvhLP2u1Wi6gkxm8rB00eM+yec6GBOl7
	TeTSgGkIKOaDS9andAcBsSWUmKAaVxMHED6rOhGt1k67E1KXH88H4rxHbCvYWHA/IqmS1hKaCiW
	INWaU5U0ndzo0LmauVhWJYCCZ7i4ud986PRIYU26Q0CMbXyZXWoGIlvBPzzrLo/GF4ok2qbqhmx
	LNChKtY/CkdEw202xcflwUIIFtPgfpEaaTeQ7YPHAGl0J46AS7Dqah7QfkaRCfn6RI4TNLKrsCS
	+ifLPpM4Ri3rkigY99ssLD3J47fws6pVgFIk8=
X-Received: by 2002:ac8:5a95:0:b0:517:7ed5:b56a with SMTP id d75a77b69052e-517fe1d9786mr7577821cf.15.1781223937801;
        Thu, 11 Jun 2026 17:25:37 -0700 (PDT)
X-Received: by 2002:ac8:5a95:0:b0:517:7ed5:b56a with SMTP id d75a77b69052e-517fe1d9786mr7577381cf.15.1781223937289;
        Thu, 11 Jun 2026 17:25:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e162013sm57653e87.10.2026.06.11.17.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 17:25:34 -0700 (PDT)
Date: Fri, 12 Jun 2026 03:25:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: github.com@herrie.org, me@herrie.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,usb-hs-phy: add
 qcom,vendor-init-seq
Message-ID: <tknuizddyhfcyywmm36v4ok6idgpxridgur5qbowvmwhcbve5o@bp3z46gsfvlk>
References: <20260603054809.565723-1-github.com@herrie.org>
 <20260603054809.565723-2-github.com@herrie.org>
 <ti5p3oreibkae4pl5sn52g3ctv3ufcs6aklwgbterksrxvxrbj@b6scawz2cqmq>
 <66905f4914dc022629158ac02df1c7df@herrie.org>
 <46lrfwoahgzoudq3afnhv4kxqs4fwj3w7u2dnx6ns6soo6pxt2@qkqbelan2iwq>
 <0f6ea4d2-3865-492e-ac6b-b008843f8d56@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f6ea4d2-3865-492e-ac6b-b008843f8d56@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: -BTrY8R7SBYQmHQ5Fm0c0LCC3spBlUGP
X-Proofpoint-GUID: -BTrY8R7SBYQmHQ5Fm0c0LCC3spBlUGP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDAwMiBTYWx0ZWRfX8DnUzLU63WLU
 86U417m825i8azp2A6Eup3Cw5POUPX4NlEC5BvwLuisnrMwGdy6iEFaWMuXRFS3RK64WQ7aIlrK
 7bqfTwn+8b/VFTrvZJ+tc7vAwnhIr3c+IkeIVILLqcb4tIyUOTwSROeqs+tvxh8psmLVMiU2QH4
 PhXNBhtmUFvWENiVqdi8xN2YQK8eNcW+Pj1LVS31PpuC9MT/2AOfPiLcqwNu9fNYq/B0+oxGXNQ
 JxvwkFa+cbb9zI4dW9Z+OX7Y703V1PXyDeWeVEf5dcK33/j55aCNYVUVlS6OONouhhvELyBL2+H
 LXOZGY5k2I8/WtZKNy9AAGDAB0Y6y3d8DW5stYUAazvCrwJLNRqbI1BBG99xnoN6pSdGsFuzukz
 pocPnoPt8xt1CSClfNl1PBEsuQTNFvvzVNJuX9+Onir/HuLeH3KgfL6D3mOMCpET6Ov9KyohyCg
 h7jJ+lp9cTR04+/A6hw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDAwMiBTYWx0ZWRfX+Lqg0uQRhKeA
 MkA1jE1H10hWtx4h13IEejxRH+yf0+QTyApk5Zum1SSEP4JozO7lXl5Acp2O+sS+lZg3h4JOAVk
 LtYwzc53rWVymZeb0ouR0f0+YaViCUc=
X-Authority-Analysis: v=2.4 cv=O6UJeh9W c=1 sm=1 tr=0 ts=6a2b5204 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=cTwmTnRGAAAA:8
 a=zUIbg9vhP_L5b9AsXv0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120002

On Thu, Jun 11, 2026 at 12:39:45PM +0200, Konrad Dybcio wrote:
> On 6/4/26 1:02 AM, Dmitry Baryshkov wrote:
> > On Wed, Jun 03, 2026 at 06:09:18PM +0200, me@herrie.org wrote:
> >> On 2026-06-03 15:57, Dmitry Baryshkov wrote:
> >>> On Wed, Jun 03, 2026 at 07:48:08AM +0200, Herman van Hazendonk wrote:
> >>>> Add an optional "qcom,vendor-init-seq" property carrying raw ULPI
> >>>> (address, value) pairs that are written after PHY reset.
> >>>>
> >>>> Unlike the existing "qcom,init-seq" property, the address field is
> >>>> NOT offset by ULPI_EXT_VENDOR_SPECIFIC, so the new property can
> >>>> reach the standard ULPI vendor register range (0x30-0x3f). MSM8x60-
> >>>> class hardware needs this range to programme pre-emphasis, HS driver
> >>>> slope and CDR auto-reset bits the legacy msm_otg driver used to set
> >>>> via platform data.
> >>>
> >>> Are those register writes specific to the device or to the whole
> >>> platform? In the latter case please extend the driver to write them.
> >>
> >> Looking at every MSM8x60 reference kernel I could find (Qualcomm's own
> >> msm8x60 board, HP TouchPad / APQ8060, and some HTC/Saumsung MSM8660
> >> devices), the writes split into two groups:
> >>
> >> Platform-level (same across all MSM8x60 hardware):
> >>  - reg 0x36 bits 1+2: CDR auto-reset disabled, SE1 gating disabled
> >>  - reg 0x32 bits [5:4]: pre-emphasis at 20%
> >>
> >> Board-specific:
> >>  - reg 0x32 bits [3:0]: HS driver slope — HP TouchPad uses 5, HTC
> >>    devices use 1. This clearly depends on board layout (trace length,
> >>    connector loading, etc.).
> >>
> >> So the platform-level writes should move unconditionally into the driver
> >> behind a match-data flag for the MSM8x60-class compatible, and only the
> >> HS driver slope value belongs in DT.
> > 
> > Looks like it. Please hardcode the value for your platform in the driver
> > (with the comment), meanwhile we can try looking up the actual values.
> 
> Do we have the values for a MTP/QRD (or whatever they used to be called
> back then..), like we would usually put in there?

As far as I can understand msm-3.0 and msm-3.4 most of the boards were
writing 0 here (although it might have been unexpected). None of the
board files set the hsdrvslope value (which means 0).

Please correct me if I'm wrong. I see that for tenderloin kernels change
that to 0x5, but I can't find a sensible commit message.

I could not find the documentation for vendor ULPI registers for those
chips, so I don't think we can identify, how to make sense of those
values. In such a case and having different board-specific values, we
don't have a better option than having a qcom,hsdrvslope (or similarly
named) property in DT.

-- 
With best wishes
Dmitry
