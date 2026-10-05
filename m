Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1464749FC
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 10:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791197125; cv=none; b=hUopmUNpUotudc4BF7HU6Piheskqz1ZH0sjZDrwQkvMrytKkKy3onnVLBB2rsf/V7B8A1G41vSABcUpt/9WbLAeZaKb+Hx+GKSa4wmmGj6qxVLkpQfQ8kYPSrkEK7Bjix20bDPs1BgZHt/0c3k9Kb7VEmTcAhPcSBnqunsO5VNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791197125; c=relaxed/simple;
	bh=Oi22PG/2WusMu/4lVK2j2cf/IGBMHwO0Bsn1RuvnEt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STe61TY9Ia9ZHuX2LZunTnWAWPsDH+y3gUeD/P5HA1pIpIhxZq+krIVRMSE01LESjq8mLYGYp0nQSL6kjjdnOz9KEx5oYvwjxgg3IoTSLRx/rfJo8xc11AyB5eZuZJYC4SsQSwO7RnZh1UagaCW2g4NOvMrOutySKPeSfOZAfsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJR9AuEv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CZlx5fVZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJR9AuEv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CZlx5fVZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958xQ0V1300182
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 10:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pQeClRWL5fMnV+jW+MgQGB0s
	7nSB8YFmEBzlXVtXF7g=; b=jJR9AuEvbL0VK2nl5a38FNlDKkChzxp1nZsKcG/7
	qXezKMQxYRBlj9igqMX7mlEvTWA5ESLdkAAkBHthWwd2LPNlrmg7ODkkcXtQ/nnw
	AI2zPgwsm5L/O7LE1Eu7y2U8N6alJ/OX21qZWSle0BLV1fGACI6NOLABApPUNZCK
	4cExS5J9BVz5O0ri3GAoORoEytWMUHBXNgmJgoWIRhkjpszBftt/tQAKQrl33z0j
	hMDBuz9iXAjHEGPjx/2hNwhqArsjLovpSPFteMfjBmGYhKv2YnLiGfNlg8aH6a/z
	m4tuD4QCeeKOhhT7s88IazqzvDW1RyHF/ZS/XkborU+3qg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xhs1qn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 10:45:22 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-147be78cd56so6259025c88.1
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 03:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791197121; x=1791801921; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pQeClRWL5fMnV+jW+MgQGB0s7nSB8YFmEBzlXVtXF7g=;
        b=CZlx5fVZQOb8klRHJpYygdeOtfJOKx0ERSWeJYcVq7mazinsfn4aUusLTjlZrz720d
         w5mLSyN7RhEzMxXmT6IV19brnqUlQD235p5d/lX7vNwelZ/uSOax7Q3CsZwEhhaZRIHS
         mGEafWqaygMrpPD+953jSZJD63893pj/cPlDs+ZsEkuzWAUZ/4kZwM6LsxQo9QXJ7ZMy
         oN0YGuBLuz1z8o8Gm1LY2w0ehl3bEWIZ/kIj0aMBc5ahyyBWLEXRgVp/pGuSabNfEqiJ
         fyWGWqWE4wjrHq6O3tEWiy8OlAoFDi0og3eLCc0J7Fzmqk05d786xCFoolYG2PTGCzvJ
         D0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791197121; x=1791801921;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQeClRWL5fMnV+jW+MgQGB0s7nSB8YFmEBzlXVtXF7g=;
        b=TTRO8ADDjTUGfOZiumN4L6yvhICuOszP4rqK62mJ6IT1GaA3XD8ufI6kJAfx8AoIU1
         3u8ClZgnN/6UAD+2XpeqOrVA1ciAUQd4QCmsh+rbY8Lx7ivdDOaPAklq8Hw399U64Ghf
         WIB19mvrANn0Oml+jqfJrGTMgyzuCWqt9Z0CztRhVRMiwjALF7sB4tzRsYqg58pyXmMs
         YRDVcVA3B4mUmSySYyh4OuX/NUBy3O6uZoOJCM3+bpv8kIJyFUB+pX9Oecg25NpfDVrq
         02gXlh7lWMoO/y76Rk7J17HcVKbJYX8nII4KbSO+56pPbjBEKqhDi17QniK+yg0YLaEG
         EbAg==
X-Forwarded-Encrypted: i=1; AKwUvBzLPalK3vBLC1+VQo8m26yvlOcyEoT8Fs2pMNg33j1xhwbVdkLUO6/MXu7CykkEB71HDNjFAvq1TGDQ@vger.kernel.org
X-Gm-Message-State: AFuF++nhulEuHO0GmVWT8VRBDOTj9DODLzOY2cRidB0tz4Lx3wVi39MS
	E5cKLP/qwUMoF1adtGXPhOvio+QWqujN2/JAmobkVB+Ta88STii+RSnDPSid2qkeHZNhAvrpsum
	s0oh/tL39qc/ovLHLwioQIJwSgHT3ByzcakgX1T1+HeN9uqJtuzLc/bC2zVRcuZSH
X-Gm-Gg: AYBFou2Gm1AK2ocoefKjJHcQj2qBVyiMov+4GkKeb/7q9MsYlFBSnDiu942qwGjGroa
	VS3F8qfXIzBHsUOlMDSc96RKDriOm+85d3GgwnGH0e9d6O5fzsGg9V2Lg9B/JZxmYcLePtVy2zf
	f7Z/CfSg4sbeGL5aoHrer7dXKTM878OP0Z4/wggZ8/GLbQ4kWfsclruNSnldGHJwsgw0RoIhMYp
	ZU2SixVvdkzGibT0NgTbbti4mxqLV/gA30H2kOB+DGGyoUAYd/T7/9sm84vRIDyth5Mg0EFLIm/
	dfy5A2jyai38Qqsh6zbigG7aJ0a+zLLrgNg1jFP+A6Yx/Qo2iA6ZrFtQtUKm8TvjpbaHDtVUDC/
	yUYbc4Lbm2Slhv7s97Nfx+sUDmpXlKURDrD8EfAXFRCRok65Cu/Hr1FLtZkTTMbakkwqNFEZWaC
	z+5yB418uLR+xO5VW/+LBqaSlmRWUAfw==
X-Received: by 2002:a05:7022:b057:20b0:152:3812:496a with SMTP id a92af1059eb24-15238124bacmr9694224c88.43.1791197121013;
        Mon, 05 Oct 2026 03:45:21 -0700 (PDT)
X-Received: by 2002:a05:7022:b057:20b0:152:3812:496a with SMTP id a92af1059eb24-15238124bacmr9694186c88.43.1791197120458;
        Mon, 05 Oct 2026 03:45:20 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fc3992b6sm24328004c88.6.2026.10.05.03.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:45:19 -0700 (PDT)
Date: Mon, 5 Oct 2026 16:15:12 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/6] phy: qcom: snps-femto-v2: Add IPQ9650 support
Message-ID: <asN/uLBfYARYXlhb@hu-varada-blr.qualcomm.com>
References: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
 <20261005-phy-v4-6-b04c4123ecb3@oss.qualcomm.com>
 <ck5st7q7rbnzfp26kbwzixorxlikq6hpmso5fzz33dlsqsrnrm@g3aey2pabkzb>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ck5st7q7rbnzfp26kbwzixorxlikq6hpmso5fzz33dlsqsrnrm@g3aey2pabkzb>
X-Proofpoint-ORIG-GUID: pbwYh3h6SdZhw6DJjtMRUe5XaGDQBhvF
X-Proofpoint-GUID: pbwYh3h6SdZhw6DJjtMRUe5XaGDQBhvF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0MSBTYWx0ZWRfX+9682T514PU6
 hGXu0384dgPhvJbcxNDm77xKnVQLmdn3YCMrUZkqZzYL+PmsDa72lMyFoRoI0ldCkMCPZTrP+up
 G9mdsPTOYXpU4fZV9t556nUQeqHJnic=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0MSBTYWx0ZWRfXze8E5WNOWw4J
 BC1CA4kwJxntuywXjRmeFmmxVklrvaCVIrexW6tN2sOSpJo955lMR3U+wCUHhp/I4bJGDXiXLf8
 qw+bB6DqacsTzGSbqiHWiMYMTfvV/yd8zFMEJd3as55/UqYWITHJITWwzflzw0mnZYO5LB6ZxWc
 kBZSokNuqIJ39JkqLLhG6DXVWKa2c3LNXJl1VwwiypqsdFdShKALSCm8hsDjxLTjz3fE5lT276g
 h970FrENFkjXTWK4SiPBUVfu4CDCrUA5cyo/SRscKSCReiDN04oLlNLBrITJ7LEtqxoGXrJcW/X
 00JNn8xPMl2IgQp9Ixujdfmq2tYS4aYuIm+hnXuKUidu8yGDhpbQ2T+hsXmgS0ivL+CJjUmaYW0
 7zviWfd0si2/9aeM8BbR4Vfu/VkD8LegnDizde34t9iYeFdUfNz5uE8sykPvMJ9hTop9IhHy0t+
 2H5DlRpkaxpVnNI68PQ==
X-Authority-Analysis: v=2.4 cv=Q6tHcI2a c=1 sm=1 tr=0 ts=6ac37fc2 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3-y4kEJGFriZeApEiEQA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050041

On Mon, Oct 05, 2026 at 10:17:32AM +0300, Dmitry Baryshkov wrote:
> On Mon, Oct 05, 2026 at 12:06:31PM +0530, Varadarajan Narayanan wrote:
> > Add the 6 nm SNPS femto USB2 PHY configuration needed by IPQ9650. The PHYs
> > on this SoC require a dedicated init sequence and override parameters
> > before they can be enabled.
> >
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 62 +++++++++++++++++++++++++++
> >  1 file changed, 62 insertions(+)
> >
> > diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > index b6bbf2b570c7..8957f208bc51 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > @@ -29,12 +29,15 @@
> >
> >  #define USB2_PHY_USB_PHY_UTMI_CTRL5		(0x50)
> >  #define POR					BIT(1)
> > +#define ATERESET				BIT(0)
> >
> >  #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
> >  #define SIDDQ					BIT(2)
> >  #define RETENABLEN				BIT(3)
> >  #define FSEL_MASK				GENMASK(6, 4)
> >  #define FSEL_DEFAULT				(0x3 << 4)
> > +#define FSEL_24MHZ				(0x2 << 4)
>
> Use FIELD_PREP, please.

Not able to use FIELD_PREP, getting this compilation error.

  CC      drivers/phy/qualcomm/phy-qcom-snps-femto-v2.o
drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c:449:53: error: statement expression not allowed at file scope
  449 |         { USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0, FSEL_MASK, FSEL_24MHZ },
      |                                                            ^
drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c:39:23: note: expanded from macro 'FSEL_24MHZ'
   39 | #define FSEL_24MHZ                              FIELD_PREP(FSEL_MASK, 2)
      |                                                 ^
./include/linux/bitfield.h:136:2: note: expanded from macro 'FIELD_PREP'
  136 |         ({                                                              \
      |         ^

Thanks
Varada

>
> > +#define VATESTENB_MASK				GENMASK(1, 0)
> >
> >  #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1	(0x58)
> >  #define VBUSVLDEXTSEL0				BIT(4)
>
> --
> With best wishes
> Dmitry
