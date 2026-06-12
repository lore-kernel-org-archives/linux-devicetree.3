Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C551A3E3C48
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250949; cv=none; b=jKpFycOxoxn1DH13Mey+ix0pXLKJxNssswKG3vtfvFeDDhLukbNnfZGAPKHwL8WoZc6wvLSgGv0bT9RdZIMb/4sEczIaTSipZoiaQmRMlUu9Aux3WKEsEwOU5VDOo2cIb2usFyP+v9U5lW+i85RTpc9KBoEQXXqN4EShMy0D0f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250949; c=relaxed/simple;
	bh=xj6Cf2BFkU51demOt7x8+AYXxPPZBpyfYO041yfzpz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bPNeO0xYptQ4ieA5GBRXgIW5vtoeaaH9ikqXC6nMPfA0hhUITNrZ13+PFElZQoq4A5ZwjnIYsLhlpjCGp8DoOs0HGSPKmg6czbbky2gL1XY2QRvbrDQsE4lFBN8XrGefoMPGJxD9CUzMumggWV7JT6y+BvwfKR3nXrfcQ6LC8d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pdxCmlAk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M2KweZx5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pdxCmlAk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M2KweZx5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3Bl9g2450943
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NuE4PU1Q4pHoGlJdh3wxKiMh
	dG8JaFJTJYhR0esJV/c=; b=pdxCmlAkM2SjE+v2ERBB40Gjf5EBbMy/cVjKrLvx
	zcIuKZpReK6ie12vexN0nKyOaVbne3vn+WmQrOEHnshUriy1RtNaarCmFGgMXf9d
	scYKdW+VuBY2+DE2UD20FZwRzfMdi+ZIkcTtBwTKddAIZaU8fhSZMeRjBE6wsTqU
	IJtQg07+B7FywFmRfuEK/hgw+WKBuYQ1YDExs3XSr8Ac76G5V2SMPc25GF4l5CRn
	H1HpByWWlD7qPgUx3+2SfscbwJTW0VV7v85B5Runs1mb0pqiDtjUmdSATkEVG7lh
	mN0ntIyYX3xjEqMe5dI4Y7YbBOl3hIPKJclCWWSwzyu+/g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1xcjdh4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:55:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517a00fbac6so15085751cf.2
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781250943; x=1781855743; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NuE4PU1Q4pHoGlJdh3wxKiMhdG8JaFJTJYhR0esJV/c=;
        b=M2KweZx5+3VqCz/gVJwFS6EiLFAcQKG+bFJiMv6LW4M3pC6D24UUkcuzM9YwnsipF2
         DKaHrwhZ9XPbM+kRfOVrsT2tjcjEqkS7PBxF+TrZ0yT34U0SZvjEDs7Qo8RukfWhl7fP
         S3fv/JQV5nBnwLYR/QMdQgWx0Dm+7Lmn6KwerOp8RJQpsvtfjg9jFVI87CEYwxjekWZA
         1VnsGHpCY3uS+SOgQBNjReLflm0apBzGSxDB4BF4/wT3XVwhI4+66RH7wV48+dd5Ig0Z
         uFGd28pDZk1srWPjkpJgc5jCW83B4QrnOCPeOp7xCNO4dYgnaPlXxlVSVdc4vTkazxQe
         kyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250943; x=1781855743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NuE4PU1Q4pHoGlJdh3wxKiMhdG8JaFJTJYhR0esJV/c=;
        b=TRLnTMgG+poGDHfqjU/HSGggC5Sj+JETxYGYldHU8MUKDfs7IfL1hOCgbCW1KkC9zS
         wzq2gBMYD/o+r6XNL5pI+ZzaqwSUJWzlOOqKHz4AKwhdV+QoWWnZ7el3Ps5+8gpTADnD
         vqtTEmojPaM8U3vJW/N4k2sIn6cudofMdQYoY0f592n/+089UTq8k6Wn4e9mtwD4zGfJ
         3svxmh4MiJrPAAkG2Fw/4W9KNYbgxbm5cH/GoKaaxSrwWJ/wd1s+cbisBlMWDXWOKzYd
         O5CqwXdT3HLRjtghFB+JJB6njprEpRi5m3u7NieJuY/aBGTmFVaKRXGdXUgiYvF3m3hB
         ZXXA==
X-Forwarded-Encrypted: i=1; AFNElJ8dKh4IS0I7nsniiCQIJYnAfTb7ct6dBWKgPAu/M9SJbCI6ccrzTs7tskFIh6AZ1eVeHObOhFqXb1Ar@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7kztuRzWh/qydmi/jpdrtbv14ysuTJl5ByO3fCTWJiSi8/2Z7
	nABvLdlf81nJaVWxL2QyqDGUbCM8aXjR450kt3OkIo+cdrbWEMpT6a6Kq19Jr+VkVygwqr6ni3u
	Udx/Wx2DXR4/tq4jGYW43XoyeUWG2XDR7j1pS5KnI67kWV91tXi3k5+49hSVPNn2d
X-Gm-Gg: Acq92OHA8xDm5/RGWIxFt7jyKOcLOfDTHJNJ57X3QOYLwCJ73zgXYB8riatjgjkvcWa
	F3BpGq5C084AF37/2Y2OYmg+KZqKbHXyAObxwxOeHTZQ/P5N4eT8qTBldKS5e+96yizXJktjNvl
	oEMB1aPTNyHAhm99/ddHZwCLR4eWdI4dUZcNxzd8er3wZkcCNEoRsyxizWspuyCiXE6it6SBzVf
	WIak9LFobqIoR3d2Rl7FFpou5YRK/RMidE5yOqwKqWY641NnruK4GMcrijms2w8pMweBBQzY7S0
	5yA72kH1jCRtI3RMNfCpbJBIb9TZ05UGCbMhl9R/UYvx87/BQGjAqRdIYBRKiDROQ61p0hpTRWD
	AI9KM7WlKFmWawXvwqdZVxEdzfu7JNjRt7dAI+SUxN75UL5Ybb57yAiOX4HJFZg/j+K+TZ9LqSP
	otTWyVcs7s4tF5I8Xe82YxBFVaF5hezxVo8sU=
X-Received: by 2002:ac8:5c92:0:b0:517:a9ef:ce23 with SMTP id d75a77b69052e-517fdf19634mr21653561cf.16.1781250943020;
        Fri, 12 Jun 2026 00:55:43 -0700 (PDT)
X-Received: by 2002:ac8:5c92:0:b0:517:a9ef:ce23 with SMTP id d75a77b69052e-517fdf19634mr21653341cf.16.1781250942593;
        Fri, 12 Jun 2026 00:55:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e16217fsm326756e87.15.2026.06.12.00.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:55:40 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:55:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sm8250: sort out Iris power
 domains
Message-ID: <ijevonu6ib5daesvvzis53qh5ztufrdlqdsfmx33kiajplqwhm@muhxbznlx5k4>
References: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
 <20260604-iris-venus-fix-sm8250-v7-1-7bd2f0e5bae8@oss.qualcomm.com>
 <5eaea87f-5fed-4869-93e5-55c9da5ced84@oss.qualcomm.com>
 <cacfl4livqlkuk2c223hgapl45ojd6hsqg5sqqd7g5g2q57kk6@codcnqhfz3e6>
 <73a30753-527b-4662-ba99-2ebc3878861b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73a30753-527b-4662-ba99-2ebc3878861b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA3MCBTYWx0ZWRfX4wUV2pqX/oPk
 b91QDMGK59XN3B8RjuzWbHhXBARNeULH4L6/vfTBYFSCPuOBH2Frgc/XrxCI2LWHc6cklHWeBwv
 4sfmHiRH6bo4HW1MLtwKhsHanO/q6PWC61UU0PCUZpil0EfShBThgPplE35dm+J5EIpXfyVPN67
 YAJ30XUdawek19rot8wNgO7Nb0OjV3QgDgRCkhqhTzqchpdY6NTBIgsofo+7/kqkKSqa0uzoNsU
 Vgx2GtgZZmvEyfoFxGX0Ls8OiPzDbZLmHHJcI1KvlfnsIrK9e+K4i1ZjLpjueD/mzXg4tFAKj6o
 H5ySPFTCYyCS99N1Kleynf3uuRW+2TZHS7t0gdX99wBxyAA6Fett20yYXs7IJUZ+6EXYaA6E8vk
 L3nMKvOduQEy89qsEtm8TMj4tmCLbiZ1Cs9JeGoWP4mYKbzYZ33N20bod1HeKGIif2OmripHpmk
 l7ZRlk8yaAwY2Y7CrhQ==
X-Proofpoint-GUID: 0A590fEemhdcim-t6eLjNMAdy8u742VO
X-Proofpoint-ORIG-GUID: 0A590fEemhdcim-t6eLjNMAdy8u742VO
X-Authority-Analysis: v=2.4 cv=NZPWEWD4 c=1 sm=1 tr=0 ts=6a2bbb7f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=mcP3zJosRo5iYj3H2dwA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA3MCBTYWx0ZWRfX1G/4uktzadgV
 A12wGiund3YIrRXBok+jXsmY2i1rMJ+YXOJEMpc+hRaII4hbG5UW1s2RgTj1+PMfPZq9VZINwTa
 vqAun7XcKwIrM6X4nkbNYANhFEJ70No=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120070

On Wed, Jun 10, 2026 at 03:52:09PM +0200, Konrad Dybcio wrote:
> On 6/10/26 3:34 PM, Dmitry Baryshkov wrote:
> > On Wed, Jun 10, 2026 at 02:24:24PM +0200, Konrad Dybcio wrote:
> >> On 6/4/26 6:22 PM, Dmitry Baryshkov wrote:
> >>> On SM8250 Iris core requires two power rails to function, MX (for PLLs)
> >>> and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
> >>> qcom: sm8250: Add venus DT node") added only MX power rail, but omitted
> >>> MMCX voltage levels.
> >>>
> >>> Add MMCX domain to the Iris device node.
> >>>
> >>> Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
> >>> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> ---
> >>
> >> [...]
> >>
> >>>  				opp-720000000 {
> >>>  					opp-hz = /bits/ 64 <720000000>;
> >>> -					required-opps = <&rpmhpd_opp_low_svs>;
> >>> +					required-opps = <&rpmhpd_opp_svs>,
> >>> +							<&rpmhpd_opp_low_svs>;
> >>
> >> So the computer tells me low_svs would be enough for PLL0 to generate 720MHz
> >>
> >> Is there some transient dependency that bumps this to svs?
> >>
> >> Your changelog mentions you altered this in v6, but I don't see any related
> >> discussion
> > 
> > There are two sources of information. The "clocks plan" and the "pll
> > info". For some reason, the clock plan doesn't reflect actual PLL
> > requirements. See the info on the corresponding PLL type.
> 
> OK thanks, now I think I asked this already in the past..
> 
> still, both point to LOWSVS @ 720 for sm8250

Not really, PLL type points to 615. I've posted you the screenshots
privately (sorry).

-- 
With best wishes
Dmitry
