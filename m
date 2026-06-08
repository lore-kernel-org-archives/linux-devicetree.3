Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E087A3839A3
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 06:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780898660; cv=none; b=bO/b3CyMhsbNPa0Oej5fVCuwWejfx89fvuRvBfYGvqM/4w7vzAgXVxeEtcAuqcIaTEenSWLiksIvZ9Agyzmgo4swa6ou3tVpJvQWhuNmvPpqldSHaZvMnikBkADaNDdvRybFqi2d50SPEiU9sAhKvV5r+3S6FHA7Imvbbrkte88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780898660; c=relaxed/simple;
	bh=tQ/zYygJXIMhmnmWlkNagbooYmXGxdVLFQV+VQ4wmnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISoBPUzH80klZlUT4v7/i+Be9xOOlO/WVXPy9xH7IcUzORY9Qpmo1q8/rtrBHOo+OXZLGfHDfF7pXhRlYb6zAeRXouQPGDs1yo+BLhyJApigiIIhjrnXJuA2voEip6yuBem7iZLh6g3oOf4gwTIHGJvSNhsQTknF0LCPcECBcag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IWNQyrMk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SE//Xm4i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IWNQyrMk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SE//Xm4i"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580GhqO1517322
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 06:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bL7RrCSQB6iOyve28SUhhCIRdGFRm2bK3QU0AFb5LnI=; b=IWNQyrMkOngUtDtW
	YfWDc7pO7gwTyhqdYJJtIqH983UEJSIMBKLXNp0XeZtlNNK3DLWKSFWZqxm/CTWj
	MUjCsQNxunru12y1kLnUJrb/AE0ODIOV2JegkDVQ9myiDXQi2xvad6+fMy4HW8Vz
	5KI7IVuWxEUyVxAPLimBsDsg1hDxw7S2nKLHsSK2Ga1BQefrSd0Rnm5/jxvC+HTN
	RG+BwUEK3LnrvJ11KWwCSKl+xDr1Sur4/3s4c1//XmKtpHVsWfEmzNjBCtgJlkRY
	ygSHX5UMEu7seDTN62wbWlA59KEOB4L6FLMhe/lJ6lazwbuNpWppQHeb2w6ds6b4
	nc0T1A==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadwx2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 06:04:19 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5a7cbf971fcso2176305e0c.2
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 23:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780898658; x=1781503458; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bL7RrCSQB6iOyve28SUhhCIRdGFRm2bK3QU0AFb5LnI=;
        b=SE//Xm4iLgdj8b6TETsBiqBwulka23ng0CoWs7hT9q3cCJ6Yc0p/KAUMBWMLZdPyVe
         UV3d1KywlGNITHjUMSRtdFgqpb4y+nUKOtp5Ebt4q6eM4OElqRtjQWpQpuSDszJuuNjI
         e0NcJbHsgiUHH1U4YtaukWBZLOX0OGueCjTfCYK0hprz89fraa0Ru2Y7IfaUngST6+l+
         IYHTGKW9P0eGaEz6Pe9lpMD4TH+JvJ95BUmn/RHtaD85cucVcXRgA4ijqeWtygOz+dUM
         JlcPQyHrBzudGt5UfEjvIRQ+XWiGY/036lFCX+2vRtucpfFzDmpuxPPubuojsIgLj47c
         oC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780898658; x=1781503458;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bL7RrCSQB6iOyve28SUhhCIRdGFRm2bK3QU0AFb5LnI=;
        b=rTqTDdVfO0kMfDDiIHDPlfyOQs+25TZlFDAquv9mENzMmmj0p6hrCCRPwtm3x09XPR
         alFUD8CyXykddxR9lITRG8CC/sI5qIP8HlIhgx4v5swWsuTTJy6jP39sEUQLRy24cqGl
         klq1OX5mh9M4njFc2tMetSK2dA9evk2NI3mRNbLphEw3Clxpz/E/PGpRCAvl+3k2HDQt
         /X4hmkklCksHGFAk7s3TNRwN1LI2gAOz4zfbQHMG0/dr02fo9H9SqFmNlVl3IwZRVL7i
         tM8HRFWnGJZkMrizwu9l8q0fAeMEMZtiODbg3C4Vb8xLXbW7FhqWbfaOw/kPbIQ//0+S
         3VQQ==
X-Forwarded-Encrypted: i=1; AFNElJ9sxCCcLYopmiijYRMWEAs3yPmoiibBib+Fn/eYudKbGLAVWTrN3yPELs79VZXD1PTqvOnxSogaWcs9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6/3YDuLUhcvDgVLytPDCpo7c2yjIVBFT7YMhmoONsT3BpqzpR
	WEwaj1S2jQ0NiqnTVo6a3P3VR3gvH2ImkZbs5v16KfkNYgAEW3s6UQcnFWVYT/MjfYwHT3zTom0
	hXF2xt1iJEhp/0mdmrsGWJq16yOp7EAFC8DlcCrBX7wX5PWAKleqkU6WTBDuV52B0
X-Gm-Gg: Acq92OGODpyBCS2sUCOxFYhGV8faqCafC0Qfdemssl9RTK8JWMHgx6wBDdtwxRutgNs
	nI8BNq0/A0xYWwIRYRza7KNgtync+8qlRHcwMCUEAO9GOXKuZg2rsR6vKcCeC4jZhvXrJ6RlPo8
	vPNw5RdRwre1wafLcEuYFHGHg9A9de6s6WNqoohAWHJ5ZKsTbfqSO/KJP9y31R8ngMdeD7weiRO
	/5EvCKKl3mrB8ctKsIOdM5gsx34rKB9Pz9tt6WNBU3EsPRKvslqxxtidA0P6kfL+N9xonRuzwwX
	Qd2Fc2axb2o9yIlmSB6FQqiZL8GBDkaU3KNZVbRy4b6xKHhwh4Y0B5lE1K3DtQojwVF1oks6M5n
	dL4mnWIBn+aXYCWN9+gMqs6kDgoIKD8Z5qaEjrXdbnDiR3GLeSNE1yMO9AzImVfvsVnKjXXFjLF
	QAOwkc4u5nlqgnGxM0U5WMWm+4bTsVBSxCy3gUVluvHOORoQ==
X-Received: by 2002:a05:6102:809b:b0:631:28c1:154c with SMTP id ada2fe7eead31-6fef92b85dcmr5513736137.9.1780898658083;
        Sun, 07 Jun 2026 23:04:18 -0700 (PDT)
X-Received: by 2002:a05:6102:809b:b0:631:28c1:154c with SMTP id ada2fe7eead31-6fef92b85dcmr5513719137.9.1780898657668;
        Sun, 07 Jun 2026 23:04:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed2d3sm3551255e87.5.2026.06.07.23.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:04:16 -0700 (PDT)
Date: Mon, 8 Jun 2026 09:04:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 3/3] phy: qcom: qmp-pcie: Add QMP PCIe PHY support for
 Eliza
Message-ID: <ywabwqbgjkvurybqsc5faq5vhli262nqe5gplki5gio2w2zsve@g6h5d7tigmvc>
References: <20260601-eliza-v2-0-6b44c9c23d5e@oss.qualcomm.com>
 <20260601-eliza-v2-3-6b44c9c23d5e@oss.qualcomm.com>
 <k37nby6lnczb5qajku2shpff4rsisyynlfmzu46lhojl5eiwqo@wkpy2tbeoa3b>
 <29763928-2301-437e-8787-916930b64a88@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <29763928-2301-437e-8787-916930b64a88@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a265b63 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=5G9BQlURLoUVyWWmJtQA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: HNZZst5sYJcjDE8aa1Hlxi0UimQw5cnP
X-Proofpoint-ORIG-GUID: HNZZst5sYJcjDE8aa1Hlxi0UimQw5cnP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA1MyBTYWx0ZWRfX4uzJ9MVEBV/J
 FL1waSnKS4aGtYpCa/f5rcIdQ1v4MlSCtoKuoXB+4jy0h/bxRXUB6ryxnfXXOgtS+MauN7xgC7Q
 iVBBAxAnr8K23gJn0eGrQNebFFgm414YOsnLTIQv6CtRpzAzAXMsBlj3ngmUgszf9yZYXrPX/kh
 IU8vWXMYzJ+3Wl+5gnvsNaT8/EUKGb9ji3gtzBf4AywETdkYi0XJ0mKxjKYszxG4LktGF0Iogk4
 nVdFnzWqt/X3ojE8E9ja739k/7FPd1KxtGJiqAYNknIvwUMClMdfTczvvmUbsSKjsljms4Bp1jC
 SpspGeUyWbz76AhGWIYH2D/pdxbKQ08hlCAl2Qj+zm5uH0wznxTxjXWEa2x8qQASsWXIVoJ4vdj
 7GYRAfzcgrAXrkiwDalSGWS5kQrTYJH2lmi8dsHpzzeh+aePYPXREY54Iww69jPcbcaxGZS+gH1
 AiChNjFydzzoqN7g49A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080053

On Mon, Jun 08, 2026 at 11:12:13AM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 6/7/2026 3:59 PM, Dmitry Baryshkov wrote:
> > On Mon, Jun 01, 2026 at 10:59:46PM +0530, Krishna Chaitanya Chundru wrote:
> >> Add QMP PCIe PHY support for the Eliza SoC. Introduce a new Gen3x1 PHY
> >> configuration with Eliza-specific initialization tables, and reuse the
> >> existing sm8550 Gen3x2 configuration for the Gen3x2 PHY instance.
> >>
> >> Also add the missing QPHY_PCIE_V6_PCS_PCIE_INT_AUX_CLK_CONFIG1 register
> >> definition to the PCIe V6 PCS header.
> >>
> >> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> >> ---
> >>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c        | 139 ++++++++++++++++++++++++
> >>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h |   1 +
> >>  2 files changed, 140 insertions(+)
> >>
> >> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> >> index fed2fc9bb311..257b4df965c3 100644
> >> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> >> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> >> @@ -198,6 +198,112 @@ static const struct qmp_phy_init_tbl msm8998_pcie_pcs_tbl[] = {
> >>  	QMP_PHY_INIT_CFG(QPHY_V3_PCS_SIGDET_CNTRL, 0x03),
> >>  };
> >>  
> >> +static const struct qmp_phy_init_tbl eliza_qmp_gen3x1_pcie_serdes_tbl[] = {
> > Thisis exactly the same as SM8550 table, except for three extra writes:
> > QSERDES_V6_COM_VCO_TUNE1_MODE0, QSERDES_V6_COM_VCO_TUNE1_MODE1 and
> > QSERDES_V6_COM_VCO_TUNE2_MODE1. What are the default values for SM8550?
> For sm8550, the default values are different than what eliza is expecting
> 
> *PCIE0_QSERDES_PLL_VCO_TUNE1_MODE1*-  0xA *PCIE0_QSERDES_PLL_VCO_TUNE1_MODE0*-
> 0x53 *PCIE0_QSERDES_PLL_VCO_TUNE2_MODE1*- 0x1


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
