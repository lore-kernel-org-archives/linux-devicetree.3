Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C7E51A73A
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 14:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690892; cv=none; b=qgdKSzoKEQPROELFqu4mYsM7T51oarMR64dpq0BoLh4oWOJxTBH4VOupzYMeXKbLN6xlJYGgtiK7ugiDYSpsg0Ue8c0ZJ2U7iIu27h/OyboPkkhaC6wFACqo9dG2zKTBzFoqJYTqFGXXlBdXo+nmCfsuI8kbDTvXBxb1lxZUGRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690892; c=relaxed/simple;
	bh=/Z3PaVK7oAFmp3iii9Qe4p0K1MX0L1nF8sfYd5gbdz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=auqGCSbAQV7T7tWQX0YTlbpZ/Lhq5wetqRrw2iCKkKIsEhA+Azy5YN/E9aiIqT+ht+MQfkrWW8K04IjKV2V1JfqbJpUzws0RvqQa+JKVc2BHtgfl6ajM4poRSaRtW4uXBWHLsyo7VZnZHnAEsIoxMRXcICER6nGIncCc5rJ6z7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CwsMkXn7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PL6zHb8I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CwsMkXn7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PL6zHb8I"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TE5ixF128742
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 14:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iknpj6cjDsgT73juSTDvDpFp
	aBzMbtR1nZOpTbq3tN0=; b=CwsMkXn7GPMQoO96BVR6SI78E8zRgQyQcgeJiUkC
	4rGCxH5UliEujbfHR5KsBbRi7nYBxoVWvGbQLjXADst3tLSHhn+iKzqQ+0B88Ql2
	DZaT0FUDj4T6aW8vvDVZtRHiLEN7p3J2m94wHRq2apGnaDLWozwRZ9+sTH378lgi
	Wa42q0tJZ1hMnN+hzsW/IM0uhWDIuVqs7ChzFqJI3XysdzchvrOFLeXQ8DSIBbh6
	hhABNOC7AX8JRBx8kZoB5jX6oKh2ZEUJqow3u8AXQnb7/Y+mpkTeT1Uo9gGOAqbH
	hlOn9eoQYXUCYNbHayz257wLfz57+51aw2HqaFrY/8R6RQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0eswg0k3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 14:08:09 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b37620eb73so7917446b6e.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 07:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790690888; x=1791295688; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iknpj6cjDsgT73juSTDvDpFpaBzMbtR1nZOpTbq3tN0=;
        b=PL6zHb8IkC8uK5kYTneDDBswP/pk6rUKI3k6ui2ZY8f5jf2WUPHnQ1oJWZpKGis+2b
         bRjLkmo90k+v/xjp49q3mcUsMb35GMjj6qQiRGTOvbXu6Lol1BhW2XUOO0kZS1mPQU8r
         XajPCf6f/M0IBZX0WGDz3QjNpv/TCB+NzXoM21La9zCOmg9y3Hr2dX6e+0W5P1R0pd2o
         bluTTcWgDGO6M6VyceXC9tx6rZ79tBJN1J9+uOlneX4a+jyQ7ZrVMS8FEFJo/WR+3sfY
         9+hJfxkje3kAOg1AwOs6wpmvCJsPbpEAle1AesYkkjEogVmBOep6JQOD3GUCK/p6l9j4
         lXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790690888; x=1791295688;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iknpj6cjDsgT73juSTDvDpFpaBzMbtR1nZOpTbq3tN0=;
        b=evcwgNvIqbH5gSTbwgOjHK+uFZhOhnFUKHt7uRcfOWXkVvHuZPMk7nJOIbWsumJPUa
         L+Z3doydr+PITlG3qZ4TyaGLs6ym6oEzsCsNtTEsKFqbEw4CLdPC+ZRAjzBGL2Kwvb+p
         Mx7WBoBZPgyZv7Ltgv2QFwHcSfgmsSRzRXk8exQTit9ZsToxJCPExcDA71ETzRGHt/pO
         /cWV6n8Pau4Pfl1MY+gu45w9R5IOcaeLv0Fam26reY0xVfJVx1gj/FmVRNaOvp4HaPC4
         oBIUh6UDU/PSySFMyKRb0vz2SKxeL0JYgKqM+Z3y2PS9Y8W/OYEPfrobJaacNNItgCo6
         t6/w==
X-Forwarded-Encrypted: i=1; AKwUvBw1GEzNm2RNI1j8izPvzyPNJ9UaaeGH+q5iX+Eaw73rvRUEVRNBKPSFSQPp/5v+j6ahC3YM9l2E5yaf@vger.kernel.org
X-Gm-Message-State: AFuF++lbk3FKhdJaNtiN367zdlHoWLb82YfvSFV3WD47ILqIO27ZWvnB
	/ePVBcQxz7z/XKkP2UZyRu/2f+w99QZz7gatbyMye20GdZc7TUkNsKCVZ5AbaUiW8xjvfwAtz1s
	SeS46IrCkrLcGcgf9T+VBEIYxqsWMlHQod74F0QjNm6+grpZOidTDF3Wn5k1lDG5K
X-Gm-Gg: AYBFou1kK2U+ZorXdz951BJBgo3GIEMwKirRFtia//AIOvdyg/Cgr27zH3T8R/qkyCh
	JfzgB/nV4iBoczS7FrsAKONFmlQ3wTc83rrKAhPio2UvRmKYbriPcV+2WSoTnnIWEkPWQxG/MBs
	gjXl8YfypcBFxTUm2oXZj9mX2Z5Tor2XL+/U17bnao98Lh/GHPdZMcE+wvxW2wcDgZGX2E72wIu
	6eOR2jPVoysQKXhHcrQctadFHQBCe4TXMbMXbPVbFgYmgtko3XmxmMDxg1tvJp6qA4JPQ8Ml0yi
	Qd9guno1gtx2KCEgxO3BcyHyyZIE6yskjnX8BDC0xBkRm5uB887SD0eAq/4hXEgMpEu50yYA26P
	ztMCR7VvnQ7AdC0eWFRTCebVR5/VlLx6nNoRw/3FYsg==
X-Received: by 2002:a05:6808:3c48:b0:4d6:9222:9a19 with SMTP id 5614622812f47-4d730c6809emr14819253b6e.52.1790690888260;
        Tue, 29 Sep 2026 07:08:08 -0700 (PDT)
X-Received: by 2002:a05:6808:3c48:b0:4d6:9222:9a19 with SMTP id 5614622812f47-4d730c6809emr14819209b6e.52.1790690887748;
        Tue, 29 Sep 2026 07:08:07 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49abdc4ccacsm1106138fac.11.2026.09.29.07.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:08:07 -0700 (PDT)
Date: Tue, 29 Sep 2026 22:08:00 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom,sm8450-videocc: Fix clock
 inputs for Glymur
Message-ID: <arvGQKBY9DZlS2EJ@QCOM-aGQu4IUr3Y>
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
 <20260924161152.1162301-2-shengchao.guo@oss.qualcomm.com>
 <20260929-visionary-hospitable-beaver-e2c1a5@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-visionary-hospitable-beaver-e2c1a5@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1NiBTYWx0ZWRfXwx8dDashvp0s
 FYySiTcqdQfy/GXTKrzp1501inabZU9uN0sJIaZTNxyzo0iQns8+ZIi7BGIW9ZCLL12pEseawiv
 4/z8nXz/t+39o5rxcFu1FOhrN7bjmqN1HZy2CEi+lUfJYwVvCIauwh6irTQ1KKaQt0bknBxr4/n
 dQ1SHVst+tDsm0xjUH1TxSMZ0Kd/SFA2cishW5XB1QJFTTHaPSyP2zkJ+cODo88dmYJn+BG6YFI
 ZTUXtuMAKWufuSM2fhhAn9tUyN4/v6LBseCnZrssP20Aiyw62/Qj+61wHEe8wwzxKJPouW4JD0A
 Has2k2NENPJozZ2wZaBLoz9fl2T0jZ5N32x0z3deD/DkkWkg35IdnwO9jVObMIg1vBMnI1w4g+V
 O4YmE0nF5KquMvpBHjzgct459LMG1upVjcz3HufO2pFY9/ayUNgKONp0lIH/sYOHIgyVugpAHVq
 JfAF9fVnDkE08Rbeq1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1NiBTYWx0ZWRfX99L12lg0sjzC
 z6nSwyDuTA7fsk6NLAvtJKEI9W2+bx2qB5aDxH+MDndCZvwbIKM8fzVV4gBQ1w7+VCNHWwTqlh+
 WJx7ZT3IzZYjXM1Js52yphDe8iOTkoY=
X-Authority-Analysis: v=2.4 cv=LaWpeTfi c=1 sm=1 tr=0 ts=6abbc649 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=AY5MHz9oPD_TeV_maQoA:9 a=CjuIK1q_8ugA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: HrrCayISLRGALod9yL-Y99YbrJCB0zV2
X-Proofpoint-ORIG-GUID: HrrCayISLRGALod9yL-Y99YbrJCB0zV2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290056

On Tue, Sep 29, 2026 at 09:57:40AM +0200, Krzysztof Kozlowski wrote:
> On Fri, Sep 25, 2026 at 12:11:50AM +0800, Shawn Guo wrote:
> > The schema describes exactly two clock inputs for every compatible it
> > covers, a board XO and a video AHB clock from GCC. That is only true
> > for part of the drivers bound to these compatibles. videocc-glymur.c,
> > which handles qcom,glymur-videocc and qcom,nord-videocc, and
> > videocc-sm8750.c both declare their DT inputs as DT_BI_TCXO,
> > DT_BI_TCXO_AO and DT_SLEEP_CLK, and parent video_cc_sleep_clk_src on
> > DT_SLEEP_CLK.
> 
> I don't understand what you are saying here. You are mixing drivers and
> compatibles.

You are right! The argument was the wrong way round. What I should have
written for a schema is the hardware, not the Linux driver.  Sorry about
that.

Per the hardware documentation, the video clock controller on Glymur,
Nord and SM8750 has three clock inputs: the board XO, the always-on board
XO that feeds its PLL reference, and the 32 kHz chip sleep clock that
sources its sleep clock generator. There is no AHB clock input
on the block; the AHB clock the controller uses for itself is generated
internally from the XO input.

So the schema is wrong in two ways for these three compatibles: the sleep
clock input cannot be described at all, and the second item is described as
a clock that is not routed into the controller. I will respin with the
commit messages rewritten in those terms, with no driver references.

> 
> > 
> > Because the schema stops at two items, no device tree can supply the
> > third input, so video_cc_sleep_clk_src can never resolve its parent
> > and registers as an orphan clock. It also documents the second input
> > as an AHB clock, which no device tree using these two drivers passes,
> > and which those drivers would interpret as the always-on XO.
> > 
> > Describe three inputs for the Glymur, Nord and SM8750 compatibles,
> > keeping the existing two-input description for the rest. The sibling
> > qcom,glymur-evacc.yaml, whose driver has the same shape, already
> > documents a sleep clock this way.
> > 
> > Fixes: ed9ca8296147 ("dt-bindings: clock: qcom: Add video clock controller on Glymur SoC")
> > Fixes: b190eaea5780 ("dt-bindings: clock: qcom: Add SM8750 video clock controller")
> 
> Are you sure that you are not reverting review like it happened this
> week in IPQ? You know, the trick with reverting maintainer's review I
> mentioned on DT IRC?

That's definitely not my intention! I know nothing about the trick.
Would you point me to the IPQ thread or the IRC discussion, so that
I understand your comment better?

I checked review threads for both commits. Nothing seems to be reverted
here. Or if you would rather not have the Fixes tags point at those
commits, I'm happy to drop them.

Shawn
