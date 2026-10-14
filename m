Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE2847140F
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 20:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792011477; cv=none; b=HpokN9xmOk3Pvx3gk/Jn5bxiJgUE60Ab6QbBfr4ED8DpQ6NI6rYIeaFnEisIQSYL23ltW0TtXc3bIuF/IiZNeD+Fzy6l1G9/kAmAZgkxhl9DWfU1APAy249qqRiLNvQwW+yPc5tP3sMyf+ryjwOO7ktGYEl+xEEj7wxv3qT5Kz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792011477; c=relaxed/simple;
	bh=jiRBljgKuKiE+P6dq12P5OkOLeXucCVMJReCf6g+vnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LS5yhL3Vi3JcwhMBqSF/slzBfeC711aFfkX9dGPdvC824/2p8x2AK1c3v5rGsjpKbtE4Ul6OxUFDRjhbHUdy1xMI1lK9b6WYUsXGISKb7x6AXSzpYY0ZsNKwXp3hi+vzqRaQvb7ZQdP8K0D/TT/7ER2ZuEKu0IBGbIWSsxe7/Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GkHw6Xh8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cDafBj+D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GkHw6Xh8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cDafBj+D"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbLta3642994
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 20:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Tdom7tnqrfqhiAr3bCDpoJLd
	konZqaXCM3eCfjDGwls=; b=GkHw6Xh8yvBfUCJGvTj1kZUo/GEDtrYx/IkPailO
	U9A00x8a4bHWd7+s8NvKGyJnHvCh0ac+SB+ek/pSkxbn4dZrHOaDJh8YmurDNstR
	1J2AwTGh72QKS35T8YLeYMhcjMq8yxU5PTTYjHFc4FnmVP9i1kUZx83Iq8Tp0iUM
	0bS87QKAB74ukuHfRYfo+nd2H5T58rYMK4JGY6y3m6UxLlMH5hWEuI5NBliTGgDb
	5r/qQKwrWx6L/LM0u2EWkOgM3dSXtWGCrkRdcTvZmzokL6/t5xaR/fhfTLaajKWB
	gp32Pe7sOVcq/O+tg9wj3Umvr661dEUIK4q7vfkFjB8Aqw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha470bfbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 20:57:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cbf2fd504so142381485a.2
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792011473; x=1792616273; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tdom7tnqrfqhiAr3bCDpoJLdkonZqaXCM3eCfjDGwls=;
        b=cDafBj+DQLG4M7JRmsLs0yWpVs3+CbKVsuMeihqDtYBfBVnKMmJQ8u9RBtYahwsWz5
         klpg3ClW9ZavnKwLX3IBINtL3SPY/r87Vp7P7PdVAKMVN+6mIHSHU3oVILGrc/O4zXGI
         gxFzpIdRe5G6t2V4luaC3jtW+ZB3jCoN0RHpAo8hsdGg5Tvx7pPkebfXoZ3+n8/r0S2l
         9hgvCEerXLO3elG7H64p0It31/nV9jcdeL2AojPPXso9xCbglIpgeVDdRI9P5XbtEvLc
         uHdOrxmXUMiEMsgzFX3lccs6hoTc2MTjyXWy0/vk7Y1TWLuXeG0J7fSui03LHhHvetmT
         jWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792011473; x=1792616273;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tdom7tnqrfqhiAr3bCDpoJLdkonZqaXCM3eCfjDGwls=;
        b=bccEpQDJ9UfNDuqcZ22Qh2+lL2ecJQNsVWzcHDDe7LrhwUILcRpjhlx1q+CpLvBrtu
         M6vLc55dEB5K70YuYjtVp0r+YvtFxo27Y2PYXufW/JTqY6A8kFEnCIMeww0JR3apsiBi
         Tq+X36dScgPH5fbsbFzm7VDAmeNgPiWh7ee8K/1Y59X/WaUHXpQuyAI09ytvxczsl/hC
         qQjMElCN2rocDTGFuwLSAQSjV2aZjjYg+SV5ECrAciWN4DJLTmIG1c5wmGns3HVL0Gte
         Em6xWLtoYzHbSeYEiuUJL5Xs8lKgrCCNQxv0S9rbO1DJ5oi2yjY2dFiJgsPa8XQsdVvU
         6A2w==
X-Forwarded-Encrypted: i=1; AKwUvBzcUvczo3UCM3/lNJonoCVHlBiqGZaSkQvWeaMarh/rUf7bxkpWEtl9wCfitEG78ogyC6PPzofPM0yz@vger.kernel.org
X-Gm-Message-State: AFq9FYKAxEDplTe3MP0nbPsdik5MZB50eAHUqAW0Q1l+4tnyZRUvn8TO
	o43Awz668FpDoVo83TzsyjW39YKvTAMm7qVY6d2xsRpnn2d5r8WFTGCVuWR/yzuc8665riaOE4B
	X8uJIqsuzTN1Y/FjH3qs/VvNk71YkiOW8ItZDbdh7P2p1L7+78AQrkUwq0HuNDr7bwRzEWhDL
X-Gm-Gg: AYBFou0RdfMh70yEe/b6Bsnqmblv5oWWdO78TyDLJw24gIjmGq374VAv4zhini8RMPk
	IvaUX/moJks/Dzj182R418Te/p6/vS+TiW1LaLItL2M9kw6a2EeGbQrM2ZAqpqfY1qwt7OXyF81
	e9wlkORfrAVXWklfWtYDoG1jbdncSE9WeHSRbKivGkbVGiuwz2oGaEbN1AsKcNJ0TAdnmcaGn+F
	XifJp4y2oZ/JwMKxp7cWs1ke/zN7U9xy9wNOoORgg1mXLL7GSDfwyCc5IlyA/9hWCxmGq6NsSsC
	4wPozORqbKagMKIdEWzBtgnX7yGw6vOX/cZ8o51xbegKP/b1wt7/8+LuLmXN5C/AUdQsgZ4RiOH
	cbr3FnEx2GMGYQmHEzMar1BOU2OclMCF3yb6MKr06Zx3ziIo47MPsEkI9lZVcR+j9RuJ0RlW615
	KSGtae/kMG3FZM
X-Received: by 2002:a05:620a:3194:b0:93c:7d49:7b69 with SMTP id af79cd13be357-93ebd2963bcmr2795852485a.60.1792011472854;
        Wed, 14 Oct 2026 13:57:52 -0700 (PDT)
X-Received: by 2002:a05:620a:3194:b0:93c:7d49:7b69 with SMTP id af79cd13be357-93ebd2963bcmr2795849885a.60.1792011472382;
        Wed, 14 Oct 2026 13:57:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3aafdefdc4asm1613741fa.30.2026.10.14.13.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 13:57:51 -0700 (PDT)
Date: Wed, 14 Oct 2026 23:57:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: add device tree for SDM845-HDK
Message-ID: <rqsztjjpis5ddd3adpwds56svbbeugoh2zhzlat5jilozkzncx@jrwnidovsh3j>
References: <20261014-sdm845-hdk-v2-0-6d0b4b42f267@oss.qualcomm.com>
 <20261014-sdm845-hdk-v2-4-6d0b4b42f267@oss.qualcomm.com>
 <sashiko-outbox-171533@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-171533@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA4MyBTYWx0ZWRfX8Kja+8PN+NT0
 NeaLOfH+7MYRZnhNT5dFoc+I85Aksv8No2+ezVBVNxwcV+7vyn12MKDajjGEwfjrk78mWfRptwU
 CBL4ls3Ziu4/hRJkqp8ZJ200PKFQ11Xk5gNe2f8rYXvvgPFLbyBhgLUFpYLXG8hn3gprsqSaZj5
 qDfHbr8PjybGxWvlqPii4T0owVZ+uH9q7Y/KSlnDAgk2ALYR+NuTLoKP2FW3uHx3YOc0FUba8gb
 Z9dtMopIlAM4CV4MY/stngxeXlQR7XhADuz2WLz80WzsQ9YS6czL7ykk4e18UqYWKfkZfXZFe9t
 iyZCPVT9IISp8fHbRBSPxRQrimkJc8Li8t70NHHSBTRmf05SvyW5PC22tYpADzG6pBAA8FzfHA0
 csZFeA1mcbXGVEKLlQGw39/ICxSxM4NWTxLif6izefmFQu0VqAuXmLYu6RrZA80YtHjJ0w09jeh
 n7Zru+iY9Zg5OCnmJkA==
X-Proofpoint-GUID: RN0S4CS_Vy_Ai5v_uugSzXLqm9lha6L0
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acfecd1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=s4Caojyv45IKULvEKnIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: RN0S4CS_Vy_Ai5v_uugSzXLqm9lha6L0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA4MyBTYWx0ZWRfXy5W7pVBQeS3H
 pxHxlHpZyv4IzvhPuUyF/KdiCeRGHEZJMxhosRa+MoFRGPXe9X41O3m6WBqJ0tm9V/8ZrXT/U/6
 4IO53TE0Vjd205FPIVC6pCC4ywwYjoM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140083

On Wed, Oct 14, 2026 at 04:31:17PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] dts: usb_1_qmpphy swaps vdda-phy and vdda-pll voltage supplies
> - [Medium] dts: home_pin_a pinctrl incorrectly configures gpio6 instead of gpio5
> - [Medium] dts: impossible 1.8V vin-supply for 3.3V fixed regulator vreg_sys_bob_3p3
> --
> 
> commit 48f1c407e24f3899e533d5dddbd59a77b4901a02
> Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> arm64: dts: qcom: add device tree for SDM845-HDK
> 
> This patch adds the device tree for the SDM845-HDK board, a development
> platform utilizing the modem-less SDA845 SoC. It introduces initial support
> for features like HDMI display, uSD, UFS, USB, and various onboard peripherals.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-hdk.dts b/arch/arm64/boot/dts/qcom/sdm845-hdk.dts
> > new file mode 100644
> > index 0000000000000..4dd426912d20f
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-hdk.dts
> 
> [ ... ]
> 
> > +	vreg_sys_bob_3p3: regulator-sys-bob {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "sys_bob";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +
> > +		regulator-always-on;
> > +		regulator-boot-on;
> > +
> > +		vin-supply = <&vreg_s4a_1p8>;
> > +	};
> 
> [Severity: Medium]
> Is vreg_s4a_1p8 the correct vin-supply for this regulator?
> 
> vreg_s4a_1p8 provides 1.8V, but vreg_sys_bob_3p3 is defined as a 3.3V fixed
> regulator. A fixed regulator cannot step up a 1.8V input to 3.3V.
> 
> Could this create an incorrect power dependency tree, potentially causing the
> 1.8V supply to be kept awake unnecessarily or turned off while the 3.3V rail
> is still needed?

This is the least awkward description. This regulator is powered by
vph_pwr and enabled by S4A. Using S4A as vin-supply is the most logical
way to express it.


-- 
With best wishes
Dmitry
