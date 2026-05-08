Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C74C3815E1
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778231236; cv=none; b=GZZzZwXo8oVxrhhLDvX7mGshr5u6NnMOj4HaVp52vzhqm4rZ9nd4PazVo0LpACkq2IifPDkBkkV2CnBH4AuFn2F3XYr0xABdZKON6FApC1Rkn/F67lVFsgMe2TrY6XBmCWDpV1n8V9VG7piKogOQW2tjK6pAySVayOuNDQDRJvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778231236; c=relaxed/simple;
	bh=ozoG1JtKQMdebPBN28xZ8odH6izKFB+eGPEWMWDc7ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4yKhyJONNoyKMX4/CyMGzPddndNcnaYWQ4Ps5UCcfAuv/Rh06iWhijRBITuFhHkQ6b2+N3deD0aQSNMj/3wGtyfBntzkFe1J+6QaP7yuSOZG3OUs0F/VGSWPX/ff6iHYHa9KCbVNYa6SXeUTqH3oKCdEQDpSJ7OG9Li/EtdEnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BQiBj3Eo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PnGl8PRg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BQiBj3Eo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PnGl8PRg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64857AUd2183367
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 09:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/r74jUQh6hkmiCWXYVberFn+
	Mu7v2uGlN93+afWvpCg=; b=BQiBj3EonIlY2pG/tFj16uei31O5bRQu0tahiNRt
	obHM1pgAxk3k6b7dUPaHVjS9Iuq3OaFY/QMEsSa22ud2/9lGUoDTfUz0I3zbG6xk
	IcpnoU4VxHLaxBZ3kbui7RCHGjDBiK7rOCUYMBpRc0ZrZ42zw0BxUjzJd94lBahf
	RIbtofdB6nt4pTkPRBp2PA5Q3iM7W2U0u9stHMU6VmUydsGmwJCfsigrgCvScIyu
	lGur30BElZIRohlX+07G3aGobLbKUcehbfumrAijJiGiJ3GMCd3OZb96t0S3u0Ld
	Nzb1s4znC5S0QtcJPavS2NsfvXAc5CjnG9H1ectg9ANfcw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10pyam9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 09:07:12 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c16233ee11so2649696eec.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 02:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778231231; x=1778836031; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/r74jUQh6hkmiCWXYVberFn+Mu7v2uGlN93+afWvpCg=;
        b=PnGl8PRgNy+ZvcJb25YG1n32I/XeGSNF3e4g7HuNjaWLzUQ49LCXpLWWoTWwQW+cza
         aL0cz0UafduX1+hvORTm4Mc+JPlyLm5UZr8P3h7FyXufXxxGMJOCZquihkV4W9sJorEJ
         ViSEFEpUs6CtFB0zJipiVSCCpHtTMeorq1YUeMpNgk16tjpoWqM2fzoXdq7bBeF+t5vk
         iX23r7JNT2ciDtX5bus4U75J8PlW/2GlN/LZ+Jq0q77+Q/634mGGnEhMn9uPlMTZq0GZ
         2jQ45V1U6Z4Vt9GIpfPSQXiWetywR/5ut7qygzk+PxUut8Jyc/ZfGZF3ryVGMAWCjeN7
         2DfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778231231; x=1778836031;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/r74jUQh6hkmiCWXYVberFn+Mu7v2uGlN93+afWvpCg=;
        b=npIlS+J9fctK4bU3RKoiKRSj+pbP9rhyz2didUGIE3814lHc4ixcOJ7xngGDnVMj3I
         z/bBbjhrs594PeNX3q/BbBYL49Xs4AT9tE4+KR8SGI2Vxu3Cq45aRxAHrHCMr12aObRb
         hPXMdBFRwEcaNzCjRJt/it8j6+xdJUXg5iqU0JnLCYC4Z1IsGxLT/Lb/ReD7Brkc4Ok7
         wCk5aHAyEPm8cVfUpFsDJ361JueRCZlqNsvMKRyG6sDbhQ0Xe8loxsjfj+AbDfcSogXH
         2eeP9gfXyFqDl7+NHLYrbXsZli3ECdHlrpnyzHqJLH43xvBc8+gMIPkm9GHKVKaIgQII
         M3Fg==
X-Forwarded-Encrypted: i=1; AFNElJ/LaU6v7yvdXgjyHdOjM67N95DS8yHFfTNeqjQlbmAJCuaFrAafdBmPezR620tNifHKo3kwERpMHLU3@vger.kernel.org
X-Gm-Message-State: AOJu0YyFH0dnwVspQZO9gSV28tLF7+00VNDIMPU4xzbwzAZfREQcV/Gz
	1Nc4wWK19E/HjeNR6H00X1Xpmhp37U1ngegGE/nWmABnTTbmC4DnJomf9VMDg/8KEUApdsuIWKn
	4j6hxFh4jSJBRuc9u1kNl1esLZS90RTI4wZqmRgUkFkhahJ2jSKvMaiVb8iXHAYBS
X-Gm-Gg: Acq92OE4i2ZuVOK7rY9N9iWhlIUwtp5dktjChkeCYxPALTS93q+cgezML4FJK/sPaBr
	DC8ijt3S3X8kJ9Hy3urGvlmIWjwyYGDwGVAk9X/HjWYqs1zm0hK77EIRRzrefI8HBMXP7DWLl/n
	MgiT12k6ZYjdJyzGLju3k/S05/5bQOde8cYrTDVCZHf9rmwPpcOLamrN+3BPtqKfjdAyrPPTio8
	e7lW/VSYX+MMayfIxkYFqcwy0dh473NCrMqLDb58aTXY3Yi8gqvcnZr3uCdDfJK2R5I+k4sYpoL
	AcUt/5L9MfScwrNfOHnjT7wH3fBF3wc506p4dNb5yCmz07ZnvU3bSBVn0Ye8SuRZVeHwPepjIju
	f/nU7i5LRgl7XWT4u1bzzzAw3LPSWPyx99P14QPTaKzuRDGLetvsTvxSNpnZGAlbM
X-Received: by 2002:a05:7300:dc92:b0:2be:833c:149d with SMTP id 5a478bee46e88-2f54b269d7cmr5741983eec.28.1778231231267;
        Fri, 08 May 2026 02:07:11 -0700 (PDT)
X-Received: by 2002:a05:7300:dc92:b0:2be:833c:149d with SMTP id 5a478bee46e88-2f54b269d7cmr5741955eec.28.1778231230653;
        Fri, 08 May 2026 02:07:10 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8884752a9sm1341749eec.16.2026.05.08.02.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 02:07:10 -0700 (PDT)
Date: Fri, 8 May 2026 17:07:05 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Remove lemans-auto.dtsi
Message-ID: <af2nuRu5QX9mk4Y8@QCOM-aGQu4IUr3Y>
References: <20260508022912.1046618-1-shengchao.guo@oss.qualcomm.com>
 <ebc94f62-6dc4-4299-bba0-329675ae7f9d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebc94f62-6dc4-4299-bba0-329675ae7f9d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DZUnbPtW c=1 sm=1 tr=0 ts=69fda7c0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1de_3bmVjlGOHts2WbkA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: TO01wk80x5qjuFcOhT-8pCrqFewlJj-J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA5MyBTYWx0ZWRfX1dTpjaoBcAP8
 oI41fWHNqSkVhewZ4bataoRZ9kGtqf104pmZRUMnU1UsZPuIn9ssU6aOb4WTBjd9ybl2VHncaGC
 4HGemCge3HzoRf1mQMxNjE/5fFc2sBs7Syyhc6jiPhAjrFFJsZO/wLxZHglAR3j4VqJaMSyyDfu
 ZVX71AM2q34f973sJHhmnGVez+PCEsVL4TiSNuvBO8AIyoxLwrNaIvR2xST9xkbpEQwpnsGP0Wn
 44zp96stxmjg7xIbgfGuC1Y3/etgEOxVhRGYJ7DP89x3ACOK0KewHSQBY1QkrqIfl3urD6lg86P
 kiPSRve3ZEO09isvaK5bBzFakWfsCljamIqUqn80HkZ2S4ldjaJQs8/W/gPSXcAlPlCaRf+apVZ
 sWXFhcp0Qu4OGkQW7o/r+KDK9TaDx6YVsgEQUIerkWNzLY468FW2OTTA4CvR5YKUHpvRGSlHOa/
 htJy7PYLqZVows2knRQ==
X-Proofpoint-ORIG-GUID: TO01wk80x5qjuFcOhT-8pCrqFewlJj-J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080093

On Fri, May 08, 2026 at 10:35:10AM +0200, Konrad Dybcio wrote:
> On 5/8/26 4:29 AM, Shawn Guo wrote:
> > lemans-auto.dtsi maintains an old "automotive" memory map to support
> > legacy use cases, which stopped being supported by Qualcomm META build
> > 2 years ago. So there is very unlikely anyone still running it. Remove
> > the file and update sa8775p-ride boards to include lemans.dtsi directly.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/lemans-auto.dtsi    | 104 -------------------
> >  arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts |   2 +-
> >  arch/arm64/boot/dts/qcom/sa8775p-ride.dts    |   2 +-
> 
> So because RIDE is the "automotive development" platform, do we have
> anyone running the (effectively) IoT firmware on it, or should the
> boards be removed in general?

I doubt that one can run IoT firmware, i.e. QCS9100 version, directly
on SA8775P board, even though both are non-gearvm variant.  At least,
SA8775P and QCS9100 have different SoC ID.

I'm all for removing sa8775p-ride boards if they are completely obsolete
and superseded by qcs9100-ride. For the record, I haven't seen sa8775p-ride
board anywhere these days.

Shawn
