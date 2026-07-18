Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8B52773C3
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 11:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784373860; cv=none; b=mWINnlkyiR1CzwAfcOCjhN5sEo7SBUxafP3ZrLbIcaFo90n8gV3CTdJdYuw2bFwugrNso1mPD1ok4zo0ig8l30DFeTbT4kcwSo3DqtAozFZcP6nctYWJxccND6XRIAR3D4vcqHNVBlbI9sl5D3Gt/lVVfSOrCDxWkVamCfn0878=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784373860; c=relaxed/simple;
	bh=YWz9z2v7WyQPPaA42TELX4X4BjKpqR+/n1w7xOQyOWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjvAoYiY0sEJoyPmbXMLSgQxte2Gs2MbCS3PEMmDORvTxsaq6SNOeK9Iq73ckzy4q+sZWBHTl9+EroyElyaLsgrpcdZihDyZfqNDVBEZ+5ZA75P0YsNm4evf1KIdYUuuLh/agbDXYTp3h8C7JMtvWjrsUAw/wgc0dLQE31SIdq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QTlad+du; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kuIiNoiy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QTlad+du";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kuIiNoiy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHkJN502132
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 11:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AzDUyRgvDHVngaIEHKVhUBdn
	DlQ3twYyLRSt0qfwN+U=; b=QTlad+du8edz4t5mWhtU68EE999fXX7shAlXVM+3
	DZQrkECFySp2MiS8s02MxAepe6UbG8KsqO4tlN+Ffp17EauptDZ//tNle8rI+cMl
	lY8LdxH3BQsgVOAqgv5yWw4XJVTm1dSGEJZBDJ6UcikQOot50d+ddmpe5KAFj0li
	AkXekdh+tXm5MtIboT0gQ8S7ZFzlAQAedI43zLHWDNGE7NgyfLiceiCP1zVLVstn
	gQ+/AUhOij1lWX/DerAq/P7RG5vX4nfBKpTI2BnWdEYuNTEcujZ0HRQqJy2/NGQM
	C8I7ixwr15b3uyrmjvbHY3Fe6KcDaixSpQRZXisKOaIBwA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2c68n4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 11:24:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c856470fe9fso4574257a12.2
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 04:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784373855; x=1784978655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AzDUyRgvDHVngaIEHKVhUBdnDlQ3twYyLRSt0qfwN+U=;
        b=kuIiNoiygtgat2RDzEBqE6xb6D2Ww4qfUB1uj52N+WGB7ggYB8rF2sNkgUev7Aw1jF
         P35Lk+TF4L4d3BDlj/ZQs6IjAN8LcEIH5TYQ6+rHXkjMj6+BnGuYGkgw4gP1HHKNcyoW
         cP5vlnQrYmjZ++ksAaPVJo2cnav8eyJX1Tu4RxeTNz4rGext6W+oq8VPlBrHvUFiLdIZ
         bVL+tqGIixLPTUIEbLpsxBVzpLTQVYGrZYUbxTpiBkfuAoCQbD7+ghXWT8FhivgPEFvh
         cJyBsDKcx4zmnsgdACtGJqy/pwVp9OiaMUx0Hss43Oo1MDw7MveVYjT/wj5zN/XVRktr
         ByvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784373855; x=1784978655;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AzDUyRgvDHVngaIEHKVhUBdnDlQ3twYyLRSt0qfwN+U=;
        b=lvJ2DrJofZqBQMOqv7eQJvDeBxGuo04gc8STYd8YzFJewn+fE1JgOXAPHiSP+cDe5+
         ARyRNsIBco7Dc7SyJwsI0EJRzvYxQnQn0lGFeiPZZb5y/KbWyFcrCzY2EfAEB+P0sOS6
         eDm1mqX7c9mRmEdMJkaqqTiWCOy/IBb/FIspQs5ZMWjx2jpryhjZC2dA8gwoLUJjR4Mp
         ncM/HIxXmD4FaLonCEA7CbVB0XRabwFMDIMCjrH5xTmzfMHKGoVYGB2bBKkorS4vP8YW
         5KBx6Xjn9fN4jLpJ70dfLanuZUfjJdqehWeGlePj7OLu0aYyQpYLuXV3p3f/3cB3oe2j
         v38Q==
X-Forwarded-Encrypted: i=1; AHgh+RoUebvaHP0hG/Y7wC3yR3wqUtN2XnKn0a/cZwi+Sw1zSEQCRTda1G2gCmxNXeYtoGTLcEkfsXCCx04m@vger.kernel.org
X-Gm-Message-State: AOJu0YzYY9U4GWcqEJKIrPLtyg77a8THmFuU4wHiUOiHV9hBIk3+LQx2
	ZrSxNF/RNtFXxmBXavvZyuDRPnpDY7pHzUCk1w07O5HGYRx5IfqeYaE0QVF0jOBQzK7sorC5mCJ
	JjvAKJv7OYZbjzkqs9vlLauxA7RvVawd9kzCDponHI/YD/7eG6FAnKawxtilZOW/h
X-Gm-Gg: AfdE7cmRAG8AtNkjdMyqZAvSXVX61XZKHAFRWimQExSR9q6Es7rx2cn4klj/tNZ71ZW
	c2ps20g3R3WaJ6UPRwsrCzAHHQR9b8vrsZrAsdUV14WtLaQReKBSxafN0yKGoG0+fssMY+vd1/o
	zJioHzsDVYdKcozkh+G1UhydwN2kgOetp++QCkcirU5tDzIwzRwjz80R17oeD1Xmj1SEqbnXKfg
	KUSWe+e6oYQrSrZ7jrxNxFF8AXJMJBP8kQYKrwrjTxpwTV12nvDvMiAVAD+R04r7Edbqs/V2svK
	xpI+/CQaub3N33YCQ5c04fsVHZGuKI9Ub9QfJ3fa3FaqEIcAVhcf0900sqikrxncVXdGnGZb8UM
	0/NB8ars5c2vjiND8yJQuWD27TA==
X-Received: by 2002:a05:6a21:1519:b0:3c3:a168:edc3 with SMTP id adf61e73a8af0-3c3ad9717dfmr6290201637.38.1784373855449;
        Sat, 18 Jul 2026 04:24:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:1519:b0:3c3:a168:edc3 with SMTP id adf61e73a8af0-3c3ad9717dfmr6290178637.38.1784373855014;
        Sat, 18 Jul 2026 04:24:15 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20cfe3sm17579432eec.30.2026.07.18.04.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 04:24:14 -0700 (PDT)
Date: Sat, 18 Jul 2026 16:54:07 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mdsor@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD
 HDMI bridge support
Message-ID: <altiV4pSkfVs5UKM@hu-mdsor-hyd.qualcomm.com>
References: <20260717-shikra-work-v2-0-86ae8552259e@oss.qualcomm.com>
 <20260717-shikra-work-v2-1-86ae8552259e@oss.qualcomm.com>
 <04a9d8ce-e83a-4307-8b14-4afe739b31e0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04a9d8ce-e83a-4307-8b14-4afe739b31e0@oss.qualcomm.com>
X-Proofpoint-GUID: 8zqlPy-aICDKg-tCWjk2c76ccFQ5uWBk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDExNSBTYWx0ZWRfX1Z5iFFP0UAOc
 V7bjJ4Q+nkhFuELBId+3OvpLLjMXpBeEYnsfXK5A7RPbNFyv+ycmd2M5dLF6umeIFHoKKfCaW8d
 WJ0G7JhkaLl6puVdZHwE8AsFojwwHuMIZ+aseMoN90Dl+Akc7zBYxrB28VcS1/2TvMosocV0i+F
 xLyYpeE6Y4mLTvVPcgFX+Hu6ZVVmOxXC/XP0qLnya5AQ/pEdPKesTAth1LzkpyhwmpG692il4+n
 Q17I5cydKE9DvkqCSGQwO01EgGL2J0hyh4RFf9iUa0CwGgBs8fo2va5Kj0th6pgg5jh0Y329TjX
 S4w7cUPb1+KzjDOgf71mdITmiI83wNLwQfz+jorbhIMKCXKkoJKyo3kQNH3chaVaPx6Zn11/MHJ
 y1siA/2dkmEcGWNJRd9bHkk5CW5td9E5avS5ecLYzVVKs9/x7o1SBP8HzhDMEZR2sabOnu6hOPT
 4knlDC0NJvZAuueBt3A==
X-Proofpoint-ORIG-GUID: 8zqlPy-aICDKg-tCWjk2c76ccFQ5uWBk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDExNSBTYWx0ZWRfX3E8vkKMaV268
 F3pcqG5k9U3f6xekm3K7UeWJzvCHB/9JxSe5m94NqlJDPmIdRm3/R4gN8/XmT9RPEF7BEGI0Rf8
 V2maHY3eMZ8pTwCjkPteL+dXhkD4pS0=
X-Authority-Analysis: v=2.4 cv=CJQamxrD c=1 sm=1 tr=0 ts=6a5b6260 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=yFymH_mhhIGMXtPSOccA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180115

On Fri, Jul 17, 2026 at 11:17:10AM +0200, Konrad Dybcio wrote:
> On 7/16/26 9:30 PM, mohit.dsor@oss.qualcomm.com wrote:
> > From: Mohit Dsor <mdsor@oss.qualcomm.com>
> > 
> > Enable the Shikra MDSS display subsystem on the Qualcomm Shikra IQS
> > EVK board and add the Lontium LT9611UXD DSI-to-HDMI bridge node.
> > 
> > The LT9611UXD is connected via I2C (bus 4, address 0x41), powered by
> > a GPIO-controlled 3.3V regulator (PM8150 GPIO4) and an always-on 1.8V
> > rail. Reset is on GPIO76 and interrupt on GPIO85.
> > 
> > The bridge receives DSI output from MDSS and drives an HDMI-A
> > connector, with the link wired as: DPU -> DSI0 -> LT9611UXD -> HDMI.
> > 
> > Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> > ---
> 
> Does the other EVK not have this same hardware?
Yes other variants have this hardware but only IQS variant has
DS-HDMI as default, others have DLC panel as default.
> 
> [...]
> 
> > +&pm8150_l11 {
> > +	/* DSI VDDA - must be at NOM voltage for PHY PLL lock */
> 
> This comment is superfluous
This comment will be removed in next revision.
> 
> Konrad
