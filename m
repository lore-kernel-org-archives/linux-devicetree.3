Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BE040D56F
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 02:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781750091; cv=none; b=XRySN4dg08PS8wMWBvjHVOB6WoiVmdIpWAh0LxjGQbca6g0U40azQ+RmwtreL1EGZc26BfLl2pEj17LwOtM+Kcgu8pvGAqsoAnaQGpj0VPOeEnX3p2iz6Tx+aqyyNZBRGWPiWlVww865sTSEYpUJg9U8XyvlmvOxO+FXaSK7XE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781750091; c=relaxed/simple;
	bh=CfuK7Yai7UVyLm8X0nYd0q5AiDAwYNu1UR8Y6QvJZ7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FlHSOVvPQ/z1e7aK5uQwnSDtey8SkZcPqqnmOJ0OQQcmLA7UTuYogt/+H1YAud9qVmiIyTnRN/AznhOb5lK3BfKVE/c34C8go9cHU9M4El5/fm/9W/g5+uwKh3YiGBhJ/G2ho/nE2hMIAOqqgstwx0/2ANL5PwMiwtGQTPVUNp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EV5vcgoY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X/ODIsBa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EV5vcgoY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X/ODIsBa"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HIsaFE3590627
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 02:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5b9KVnuPgA23rMKIBEpEA5dr
	XdebUDUhX9JkClEFb6Y=; b=EV5vcgoYtPlTS6h7mn5fpSXgCPtCnfgVWVGm0v7+
	mVRqXXTkCE2UUE0EoqUVq3ay8rtWJQsQpk5JrvBBCajwz3icu2LXcZy81aux9Nej
	W1LdCReisa2Nq9ozaDr8kaHyv627nD6mxb1RsB73Kx0BoQihnwh4qVGlVgOCePAy
	Ia164FmhqzmjGJoR+ecFFOYR+9vtNcg0yWHiV5mQ4vGGhlLTldKg/qz6tYv/3ZGJ
	O1rl+f839kg2q2UofaqnQJj0+BnQJS9K2sPs3RZm+INQSDi+sOSQUJwEQgC7Zpya
	kTCubDuMtArFf1Ucu8hdxh1rHHGCLsXNtt72fr1Kr70VJA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev19a1e9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 02:34:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304b8d0ee63so1179058eec.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 19:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781750088; x=1782354888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5b9KVnuPgA23rMKIBEpEA5drXdebUDUhX9JkClEFb6Y=;
        b=X/ODIsBas8YA6F0yI+L464nnUSewR+49Y+9wgQaTOJsTIMFxfqA7Sb/0bLN0fkN6Un
         sBfqPY4Hw3HcQ+kmRRjD8UeqVRakXXUHslcmBSD34WwA6ltuTvK8G9uOZGi4tlF+ZjiY
         5vU9Vh5/RauKfnAfNhH2RdAJMQhziVJoX9K/SndYaUjnpqzAehilFuzTJ0RbsN8ubGDu
         t0GX49maqIH/qtlBEenmrMwQvd72HjBwGODwnjI8X0CVaXQWQ0wH6qTRDownTnmm0xa0
         CHzwgCbqEfK3a8yp02f0xAZ5/HLmMia8c8M20gHBfwnND0R0lw/dlfRxltb3fmqDGPiU
         C4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781750088; x=1782354888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5b9KVnuPgA23rMKIBEpEA5drXdebUDUhX9JkClEFb6Y=;
        b=EwP5xdFZwx7JcPquKukcvaCBK7GxpUKGzp1KjJU9jKB14Qwn7VVfmAo758tM2qPv/s
         Y+m1mvJ537pKuWYCE/5y+pfyEbMf1FF5WhqW/655ix5WvL7GQNf9hiX7UB9EaZoYRe9W
         yO5ecMyiItelfIx+EdjqAW6mWRw1ZsCISTycOptKKIFa+NBlKqfT8UJhDCoezIkgseZA
         40lbZ0Sk1AHGIt2CcPP6yjtp8PsVNYa7YxAMcIOoPgsAFjrta5EHrXpHvCoSx1TxxkhD
         bqhIOv1k8B8j0OoCm8Ktg1n+tEHyQyMJfAKW5tSVvyXG1ucPHHBELCDlmx6CP7+eKRgx
         yZPw==
X-Forwarded-Encrypted: i=1; AFNElJ+8ylMzd9Y1gV3/zALKSjomk8+14oYbh30g4G+igTXLe8AZ33qQ44sk3qU1z+V7H9B0WqN3KIiGUlbw@vger.kernel.org
X-Gm-Message-State: AOJu0YzcqhQZr90xC7kzhIm8qwH96NpqqnmqIAcDP5GNmCiOESsO/nEy
	ASuL0xPzJm7SWvkVBw+sfYa63LaXd6KplnB3SiASx2u9O7pGztwIrBxm23f2wof3LzyXbq6NGHs
	Gn1Y7VmYVtAhtouwKmJD5aBsV7wUBCBAn7XonyX8pkRfDSaWR29oXoicvyKfS2XD2
X-Gm-Gg: AfdE7cktnxt9r8l1nXZtRDo4/OBlyI4abPHMgX1rSVsYMiFJIZ5M5ZaZdnPK5/rtl31
	W5nhhB7+0v9RUVz4msgjyaMvxKeTpZaRLxxGHT0l6IIUAugIMRM2rip5HVx/uo3SdV12mHwOoww
	+JfpKURY5sS+uhgxg4jn80zka+Gaee4lHfn/+fXaEzp4CNpVu9rl/clgpXCL7i5Z7WaK5Z9nvhT
	ypyEOROYeYUb4oAQZcpQ1CcvRfiRCDCwS93zfzKsvZVC8Mis2zd5IKghm7q/+DvYV4EISmJLgIw
	WJQl6NsXsMjSjXGd2Mdo5xZS83OY5/fu3HJGSFSeqHDXsCTWvObFZ9/Fa2kgbz5qL0OL3nDEfMy
	0M9m6UxI+vtx32Fyds22yt/aPWcrB1+AkAkUiLsqMw2UVMAMV348r/wKAug==
X-Received: by 2002:a05:7301:3809:b0:304:de94:1c55 with SMTP id 5a478bee46e88-30bf09f6196mr1183235eec.35.1781750087717;
        Wed, 17 Jun 2026 19:34:47 -0700 (PDT)
X-Received: by 2002:a05:7301:3809:b0:304:de94:1c55 with SMTP id 5a478bee46e88-30bf09f6196mr1183189eec.35.1781750087151;
        Wed, 17 Jun 2026 19:34:47 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30bd8ab412fsm4091630eec.31.2026.06.17.19.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 19:34:46 -0700 (PDT)
Date: Wed, 17 Jun 2026 19:34:44 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v4 7/7] arm64: dts: qcom: mahua: Switch pcie5_phy ref
 clock to RPMH_CXO_CLK
Message-ID: <ajNZRKln79gY5fS1@hu-qianyu-lv.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-7-ded83866c9d9@oss.qualcomm.com>
 <db074223-ac01-4ffe-ae82-187ef0cb2cbb@oss.qualcomm.com>
 <ai+9CYntPuyEEcLX@hu-qianyu-lv.qualcomm.com>
 <a956a733-7bb0-46f3-bf21-142d5cb8fc3e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a956a733-7bb0-46f3-bf21-142d5cb8fc3e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YbmNIQRf c=1 sm=1 tr=0 ts=6a335948 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=g0m48HacwZqLR8_YHKYA:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDAyMSBTYWx0ZWRfX3BnDhwQGy9E1
 ylwpI8u4bQZT9xamwqLn4TLof+evDFc3nJ2H7LulvuaV1vyCsfMndBMxk05LbkpRtFRzPLPr3Cp
 ni3pe4JgM8DpyHqzug9W2J7iNfJk9ic=
X-Proofpoint-GUID: p3Nmb1S1gmdHwFwDFgGMHEn10rrdQ70l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDAyMSBTYWx0ZWRfX1YK+cC8JLGoO
 WBTrFTrHhZRZvg3FaeHmFM94KQaovb3unW9l0/IPbdXr3rc9iZPEkVR9lYmaEz8LMCn3Jwful7z
 oBYdC+LRrTwk8zPu0TJTC7tJqL9jCI9nqIfBymSlWBUdynZ12o6NTLEazbwhx+69t0oWcCQnQbu
 /PUhL/f5Anm9kaFfhC9FGkD6/eqSQHMvCc5Q/BkTEPRCtj35rhvVUelPT0Ff42i77qAO7UDSRl0
 C/BX5rzZn49ziXev6oTXWkO6R9RqkL0YWOENNiDzUCJ128NWGqU95kLTg2whKGubBGt9PJNS27j
 IAcLLwp4bx3/SFhZcqai+V9Yn86zQpEAOo+Z5Es/ggSLWqT7L8trEaRfe9S17yw/6qGZ+qHOeqE
 EWLM94WNiH5KeQnFE7FeaM30U97ojfBZD8yFkazOr6JSx5xUgSu/48MRMuXFxGKzvtqNaIqZ+wy
 Z41gjaLA+unJXc3hDiQ==
X-Proofpoint-ORIG-GUID: p3Nmb1S1gmdHwFwDFgGMHEn10rrdQ70l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180021

On Wed, Jun 17, 2026 at 02:11:33PM +0200, Konrad Dybcio wrote:
> On 6/15/26 10:51 AM, Qiang Yu wrote:
> > On Tue, Jun 09, 2026 at 03:06:02PM +0200, Konrad Dybcio wrote:
> >> On 5/28/26 4:29 AM, Qiang Yu wrote:
> >>> PCIe5 PHY on Mahua gets refclk from CXO0 pad directly, so no QREF
> >>> clkref_en voting is required. Override the clock list to use RPMH_CXO_CLK
> >>> directly instead.
> >>
> >> This is the last piece of the puzzle that this series is missing.
> >> There's no QREF clkref_en, but there is a refgen that needs to be
> >> powered. For PCIe5 on Mahua this would be L2F_E0 (0p9) and L4H_E0
> >> (1p2).
> >>
> >> I think the easiest (laziest?) solution would be to add dummy clocks
> >> in the clkref driver and only toggle the required regulators. Another
> >> option is to defer back to individual drivers (such as PCIe QMPPHY).
> >>
> >> I kinda like the "one central node to drive power" approach, but I'm
> >> not sure others agree, since it stretches truth just a tiny bit
> >> (although not as much as one would think since there are *some*
> >> controls for the transparent-to-the-OS hw pieces in these paths still
> >> in TCSR).. Dmitry, Krzysztof, would you object to that?
> >>
> > 
> > PCIe5 PHY on Mahua does not use QREF at all, so there is no refgen for
> > QREF either. The refgen supplies you mentioned are for the PCIe5 PHY
> > itself, not for QREF. For other PHYs that do use QREF, there are two
> > refgens: one for QREF (voted here in the TCSR clkref driver) and one for
> > the PHY (which should be voted in the PHY driver).
> 
> Okay, so in this case we have the refgen regulator hardwired into the
> PHY block and we just consume it from the PHY node&driver, am I following
> correctly?
>

The refgen regulators are not hardwired into the QREF or PHY blocks
directly. They power the REFGEN block, which provides the reference
voltage to QREF and PHY.

- Qiang Yu

