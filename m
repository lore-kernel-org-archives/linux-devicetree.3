Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17A24398F1
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795572; cv=none; b=JzJiStRjZMIVCZi5ZCh4fO278SO0wpOU1QpeQ8dFJeSA1TXdFF7hNodlG9z8YvWSYYtBNV8/J2asR5PT1KWMp57DXBPq7R9lPAiKSb/WLIViCAUKgQZkrzIiwwrvBhWZQ5bc8uFVJoP0Vq/8Re9xv7IHb4ZTJaze+iFPE+bXlCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795572; c=relaxed/simple;
	bh=3IngJiPMEgDGzASPh/Q1xqdZtfsnoek0c4wnmQu2+lI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iooguIfHYxAcOwSEFSgr+/0LGRHubpk45t5nJA0TVeXGLUZHn7x3K7X/3cXL43KSrVPTnXHp29uko4yZ3YvR7Kcpq34DGzS7FAmSpGqFhQwLckxjC1kweOQ8BnTToONsd0co0taqQFp5cdtMMmoxCfaiappUzd99AnX2ucxydbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B45QCLjy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I3v3eZ2r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B45QCLjy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I3v3eZ2r"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8chhi955267
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=weJuO4va7UByhDnMhOaLlsGn
	w7yDncfK8KoTC5mlLhI=; b=B45QCLjyDFYKG/fizQbl+AGu/g3FJ5fD/opW1iIj
	f1eo+tI+prtvTz6J/3BOioudgKSRcKOlDRU4k6YGW2DBtBnTK+lnf5f5+joXkLBc
	GHsjNSLVuTqR3T+t1GLFV8UtmFH4liL+9oJPrHuBnOxKWCKC4+rWP/WYfVxP8p+B
	Gt+IOlFZ/own2VnocWklFAhtX8Lc78SMTsuTDrv3r00oGZKB8JS0jq5JTG4DpA0H
	+Uuv/YKKQMcpvL6nbzy+xOvWb/2jsfg3h/Hp9RW54nHvgVRPwKtvNgp4BInr+vgt
	EJOVCPsj4yvHmNpDVXCprThwPGJ2ZpHoBUZZRz3Y4mRfyA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8v7kr2qq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:59:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so2106663a12.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 01:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791795570; x=1792400370; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=weJuO4va7UByhDnMhOaLlsGnw7yDncfK8KoTC5mlLhI=;
        b=I3v3eZ2rztApUSwIeWq2MlXsikQuof2g+K9oLW+yBsNRBMAjxCPmAk2+fA1DDjRS8W
         sEUvwQAHZFkcCBVM6Q5UeS7rnHvXiNVEsvzFCc+0Wd4FccRQzCGTrPvGJl0qbkRnKvBb
         33bieNTvKw4ccRAsJgw9QHvPwijUuhE+BuXrNrzAHSIbvMie/mVC+iEZOWRY6pXxhksm
         tCr1yHNDlj0JyTmqVXMMsTvHCDX4u5t/ycfyTyctYWbE/EgzxnHudW7M8JnF+Zv89S0w
         3Qlm7fYGW5rdU32Kf2dQ/pxBxqQO7X33a8WZJnNrYP2F1zuw6w15hx2Qinif79JuW0U4
         v3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791795570; x=1792400370;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=weJuO4va7UByhDnMhOaLlsGnw7yDncfK8KoTC5mlLhI=;
        b=d8iF81goUtbcLJJ+Z6h95zZ4Nt677TxG+YFzVfXGB1S1rnAWwVy3+4WpIH5P8ZWkaG
         jlbgVjSF6ah3RZEZfl+6sO1Mf6VAsUweRToGy9uN+aaD+W34tRlEtDDHuny8a6lm3wW7
         oZJzyWpl7l4LKBLdXzBisJ5lmjOgv5Bj7h0a4LDg07dnqmzgAiXcolouH0c41B81EGsd
         BHBeWkEKC6znkR8l8YqTmyKLWx8gnsE/3DwmI8La5oP16JLs9mOk4r13PqqBI3XqZPJI
         scA7D19J+rCWn/EjGlEgLNao88chDQ1aynUUkOqoIvLRMEqit/lZUPVAQ4cXCcxNnN4p
         alaA==
X-Forwarded-Encrypted: i=1; AKwUvByCUTO52/mW/gnN77QH6EUl8WGFzw3mqn3TC46rbfx674QYP8eQu0v4Qd1Q5BjysB1dzQn7Og1nf7vc@vger.kernel.org
X-Gm-Message-State: AFq9FYIRzsQpSrMlvnQxrhYIWY47bteXB71lAupctOkKUQfmeg+6iqAf
	278V84K7UF1tkCkRfrcaaeQ8/SWzcT5U/QG7T8CphNvWXEYF52xlRSAQK7R/oW1+c7d11H6i4X1
	0RE0UxcsLgd2MRxcJTMgbtxrSOupTvfOxtTXAfhJlPy4fIzSKxriJCmZCrelvrXjM
X-Gm-Gg: AYBFou0xR+yUse5v8NHnHWj5Pa4M/AOnRruR/J6MYYlmZAkhMEblg9X3wUgX1rxs+xI
	BhRP45iDHLGLQLpD7M7jppfs0Oe3+MpYlB29xqXA3BgYlm+5NBkHSCYejPI5EMeyONpr0PP4BdS
	Jscew/BP+O4LkfKr6MEOTY4Tc1Bo1hofJqP1J12khjc9EmAFWcxcy+Miq1T75XexwcRtCuQCiOF
	sXuo4LK4t3As7XBgHwEqkkrDgh4LhlVI0M7KcEgfdCKQEDE7YFn3yAoJ9kJRa93TfUR0RDkEC+j
	AMl1+6fG8thCsUBrYbTxvOTAO2uCydlqtTlH1AGnUfBTYIQpbK9Z6R6ozPNvCGeJgASfQBfgRM4
	4R7OcSHvcSuQA4HKGzfTrhexaLtZH5/z1a1sRz+hgVA==
X-Received: by 2002:a05:6a20:e212:b0:3dd:dcc1:f830 with SMTP id adf61e73a8af0-3e16bf09ab0mr7479270637.61.1791795570416;
        Mon, 12 Oct 2026 01:59:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:e212:b0:3dd:dcc1:f830 with SMTP id adf61e73a8af0-3e16bf09ab0mr7479245637.61.1791795569956;
        Mon, 12 Oct 2026 01:59:29 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04d46asm4175732a12.30.2026.10.12.01.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 01:59:29 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:59:23 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/5] arm64: dts: qcom: nord: Add PCIe PHY and
 controller nodes
Message-ID: <asyha08n_He8Q8Nx@QCOM-aGQu4IUr3Y>
References: <20260915015632.283642-1-shengchao.guo@oss.qualcomm.com>
 <20260915015632.283642-2-shengchao.guo@oss.qualcomm.com>
 <asmkI-UO5oMtrqsF@QCOM-aGQu4IUr3Y>
 <086f87b9-9b9a-4acb-b18c-be37cd6558da@oss.qualcomm.com>
 <asyANRr8ac_SD0CG@QCOM-aGQu4IUr3Y>
 <2ca0fff3-aadc-4dcd-93e8-df2ffbac08ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ca0fff3-aadc-4dcd-93e8-df2ffbac08ab@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNSBTYWx0ZWRfX0CVkoKLS07rX
 xBXdmEHb/KjuuFSSO1oO2lBuPlR4VcN9ZDqiGy1RDQ9ZSCpZFgaJuLEYuWIgtoDQ9yPai4oGa64
 TNsoIBN372puDqonclLuqs48aDMjH34ZiapcPVuiuyhp0/Mvn9KV1o3n4H/weKYxBCzecmzWktH
 H1MP1lTI0CyNMam6RRM5McvyYpHfbJhC+yzM05jGftefGPZsxxZ29qKOeFQtxWlKaH3+QC4g0fn
 KDuybLWLguK45zYdFpzOTB6ngnQkPb6zFGy6c4erB/aAJ8qjU+KSRvLzI9ow7sIMMeL9t3iZCNh
 gBpHAu79wOvRuh/qoMlRdHOTMnl0KvzAIeCoDB/ndkDPTaQL2dSRtfEJ0LY2WNwrZgSZm82ki2D
 lwnhtkLo3Pt3sTw3p+W+HJGayfPq9pWvGGrvtRktzc1GFRqErgdZB05jBGG6WlZJEl7+etizOZS
 YdNQm0lCj5o/CiPlsTg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNSBTYWx0ZWRfX3QPmt8D0uBwa
 lj1tMrjggf4cH0O2RrXXotdTIq/huluaCkJuC4Qz++C2bGNyv4pMCeH/Ex03eZGgWDcZeoGm0j0
 0Kbft18MVPy8zqYpsRlatoy+/OhfcLY=
X-Authority-Analysis: v=2.4 cv=VOtIDNPX c=1 sm=1 tr=0 ts=6acca173 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=rYj7rt9JKJ1DByYstP4A:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: A_SsbEALuRRx-ey0XmfsGCQxFQ6Y-sw7
X-Proofpoint-ORIG-GUID: A_SsbEALuRRx-ey0XmfsGCQxFQ6Y-sw7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120035

On Mon, Oct 12, 2026 at 09:40:24AM +0200, Konrad Dybcio wrote:
> On 10/12/26 8:37 AM, Shawn Guo wrote:
> > On Mon, Oct 12, 2026 at 10:52:34AM +0530, Krishna Chaitanya Chundru wrote:
> >>
> >>
> >> On 10/10/2026 8:04 AM, Shawn Guo wrote:
> >>> On Tue, Sep 15, 2026 at 09:56:28AM +0800, Shawn Guo wrote:
> >>>> From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> 
> [...]
> 
> >>>> +		perst-pins {
> >>>> +			pins = "gpio2";
> >>>> +			function = "gpio";
> >>>> +			drive-strength = <2>;
> >>>> +			bias-disable;
> >>>> +		};
> >>> pcie0_clk_req_n is a SoC level pin function, so it has a good reason to
> >>> stay here. But wake and perst are board chosen GPIOs. I think they should
> >>> go to board DTS.
> >> Shawn, I don't see perst and wake gpios are changing per board, for that
> >> reason I added them here, but such requirement is coming we can move them to
> >> board file.
> > 
> > Well, we have only seen Ride and RRD so far. We never know how other Nord
> > based boards to come will choose the perst and wake GPIOs. This is
> > simply a board level configuration and should go to board dts.
> 
> They never do in practice (for a good reason, the reference-chosen pins are
> consecutive and presumably next to each other)

Ah, good point! That's indeed a good reason to keep PCIe perst and wake
GPIO in nord-embedded.dtsi along with clk_req_n.

Shawn

> and we have no occurences of
> that in the tree across the hundreds of devices.
