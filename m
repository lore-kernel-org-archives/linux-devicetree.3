Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68EE3B2FCD
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781513801; cv=none; b=dC3EUTEMdtKldAeR7iQfzkAQsaREvKhTbDKMbbC+IjvuPISFlK4GN34NdkFLNSKi0k7/9GyZGdu1nAv6kCPjO+y9KTrn9e2aUnWvuMQsQ5HCzT8Ir29Mc52Yp/mKlGUUDexyB5TB07jZ80xwqSv0XKf0cN5hU1JXFIEqXUtdnJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781513801; c=relaxed/simple;
	bh=XWgT1kGNO6ECwHI7KeVtDswPKVdOpecFG5b1u3WSEYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8wEhPL4qAI95hV/GsH0sOo8KyoteW/SAmMGQc3QYuk80VpLeeVPHdeQKnYVEJUH6RT86qgBaXFFwbirOhJxTMHZpxRa6B8xOJvJmU6QjJiVhIWVXsqsQwMjFbJhSM6Ui6QE8YdwcdYp4hEt0nnshF6da6nBUMuG6/UlUfdTQYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ASkc/cyF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OO0msEGs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ASkc/cyF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OO0msEGs"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6LSZs3889547
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FjpsFq93269SiO0nGjpKMG6V
	iOATVyX6+3QFq3t9WRc=; b=ASkc/cyFDpKDrVkO+Tmz64F/qqU2RFu/uczWRDEM
	37lMnAraBttpL+PaLdh7FJa+NJtqL/VnfaSuxfPQPVJVgF8nrzVwgWauRj+8hLLc
	qxUkro3SCgwLbqeW9h0NP7L515YeVVCLzD9QQVR3WB9lJU0a66W6qs4Tr5bsFroE
	pkLfOSqDAEb8sD921A6CpHPDjyfKp1j7vH5zaxsdVjSVqcme3JUsynqZbCJxcAId
	fT+2a9Ovl3ZInD8/kf6KedQtHgMXpBI9LtUtJ5JxbaswHIdFCgojYJYib9QpxWSA
	gHTfSzp6/YaSJNFivDJPpzog9qkBT0FfW/4Irw/1BmXg+w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery8wxhsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:56:38 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304f1820babso4739359eec.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 01:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781513797; x=1782118597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FjpsFq93269SiO0nGjpKMG6ViOATVyX6+3QFq3t9WRc=;
        b=OO0msEGsYEVStz7XtdQSTvbIkkrTKe3fteygDAYCImRSVf+npPEHng5ntTenjP67ts
         jHvAHHk8mLMg5TmkLcptbPGISeJ65Vs5mHPxYYKkVmy0TpzMPsEUUDDtpcvsq/eEgFiW
         UU1lRqLyRVdP93GGWIj4H1OH3UbeGxvTZNQXQgUhZYhKOqjjnyPO72qp5SHH0yd57uD/
         4krm43BU4u91MCZB3apgVLgFhdJYwuqMn+RsIFZlvjdXTNregJS6CKjLzaDYyEnuWpp8
         1ljAyM+jA0SoB31iPVE4ROAMf8eHbTfKl34LtcMtv5pr45lfy05v28cXcqZSK/t2rAQn
         pdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781513797; x=1782118597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjpsFq93269SiO0nGjpKMG6ViOATVyX6+3QFq3t9WRc=;
        b=R/IHkI6MM8GnTOfspzLpkxreSrhKqDLqkQHEsjKSsBgzv8pTA8ypYnOqT9wYfaJ6PZ
         0Ze5IBXagnId155h4yvZchNP7s8dbviocy+1TwkRipMVidwxdZ5r+FKFSHSxnGqA5orL
         B7YSNgX+TqO6UfUdHB/NpKN7Sb3vfIo4V62F0kJQ5yIM/FwBrhGcZ2sYw0k87/0QT5qq
         2QwHHWCcl4M8cqldq4EJ4pO5eo6LEynL/jK5xOxMZaQ84tIsO7qdXx9zofvn9GWPI3IW
         8S9nBGlLD0uBW17481Wa+Tno79cwl2xzGv0eszksHI+rL94f1D2X9HmR7Rrm+mB6OoXY
         APzA==
X-Forwarded-Encrypted: i=1; AFNElJ9g7FJmGOa89hsdUR15b5kVaMEDW0ZetXBEUbha+2xuIc0c1F9d0XoRFCm9PXv8jRZ6brgWR+BDHYVN@vger.kernel.org
X-Gm-Message-State: AOJu0YzFIL21HaZX6RLBGNmhgGquJzG5JoRyWDXRU+y0Zi3Cmt27Jv1R
	MVmQ/d3wAC1QqDF19SyFKQqUWA4+iN4ClJywRG9924ONZ2YMrI1/QdrXo+NCIS0IXNOMOlMu9lq
	JMwYB8p0KUaJrmfun3aqb5ZMrm6Bci6CJOJcvRq8DhjbLDBa1fSxNWeqMIHNjWTQn
X-Gm-Gg: Acq92OEMfZAkZ2Q/5FVInKBJOy1RFNdXRHsR0XPPSKpVGMAM0UxGG6dJOrlPThC6suQ
	dtbFA9s9MzN5sWD56YhAtssRaDHpxIzduBt624bAmg3ndChMhDY68YT7W+T8dS6dG2EfdWfz2un
	kYQejDaDgz9VssC2OAveYLcg81kjgD7JrBbwr7pAQUxIFnZ2FwfPtU9maGW5W4/CRIW6Nbp1y0C
	2zSO5VNpm/PIMbfQ36DcvYIa+dIbqHAQMnjV0r3fjhi0QOVM95JuQVjeIa6pNrTuogglLboT8Cw
	EE/fUiyCbdH570y/AnDutdxIhocu8iVqJuRZe1EN7OvdxpGLe3gbiChuORKhiE2xNPzNPnptn8f
	TWYRP384WXaEvgrLvcjXt2JQYnUDYjtXemZjd+Yy3VH4clzKuOPT4AINsYj4Pnsjl2YSw
X-Received: by 2002:a05:7300:8188:b0:2f3:3daf:3496 with SMTP id 5a478bee46e88-30820098dd8mr7313143eec.26.1781513797278;
        Mon, 15 Jun 2026 01:56:37 -0700 (PDT)
X-Received: by 2002:a05:7300:8188:b0:2f3:3daf:3496 with SMTP id 5a478bee46e88-30820098dd8mr7313118eec.26.1781513796733;
        Mon, 15 Jun 2026 01:56:36 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb95342sm14150909eec.29.2026.06.15.01.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:56:35 -0700 (PDT)
Date: Mon, 15 Jun 2026 01:56:29 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v5 2/7] clk: qcom: Add generic clkref_en support
Message-ID: <ai++PWgSGZnD4Haq@hu-qianyu-lv.qualcomm.com>
References: <20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com>
 <20260602-tcsr_qref_0527-v5-2-8ea174a59d7e@oss.qualcomm.com>
 <178139077723.819343.8364833855890359860@localhost.localdomain>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178139077723.819343.8364833855890359860@localhost.localdomain>
X-Proofpoint-ORIG-GUID: EB66aJklO_gad_4zB-YnTwDM77PWJtYq
X-Proofpoint-GUID: EB66aJklO_gad_4zB-YnTwDM77PWJtYq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA5MyBTYWx0ZWRfX1+TD0JH5QXlG
 M0SEOas3EvC4xFVjI0yHpkL+ROlJuzqr4F+mkP2OOPPWmI/QAe3ksAdxINSs/cWbjDgA/jR/U2L
 R0zQWr2HQ/dOEq12znZwtODUzePm2ro=
X-Authority-Analysis: v=2.4 cv=IqAutr/g c=1 sm=1 tr=0 ts=6a2fbe46 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jYBClPptyWQWpWkDfbYA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA5MyBTYWx0ZWRfXzZ015TYqP7pn
 ohEXmhhlPmxCRfjOlUwAVd+VrZ/H3SrUNrgaNhxN0S4jc8qSzsjQtOF5RKiYRverc9axkAyXKC0
 FE9mHjQJVUMVhAFY0yhtTG32TITLc9AwnwKxvZCYfwBLZj9cbVmheGzY8D/JVg+MYQsEVmiCbB4
 4B1QARX6kR6SQ12y1v6C720sT2MaXkbPa8m7Agdq/U7O3AZ7cAfsMJoai+10UOf1A3rwmvh6k5A
 P46TNNvhFW2ptROhkZrBW9DKkqCBMnvuDw94ucwIpf6SVzMx8KGVsdl0lTVZCFeCnlpPRgUGC2L
 MFIKtVlz9mzmtHVcIoy4qpt5wEtmXcTt9OJH6Py08lhnOVy9VjpvpBz7lXSI4Oie65lkA7Vsuxi
 oKlpTEqDDMhijFe3h/kOOiIV+H4syUR0f2ztN/hMY40lkKqfd9s47VU/NIMbcInTcEa7rjGtVUA
 ioT8rFfwD8hGpLwb6ng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150093

On Sat, Jun 13, 2026 at 03:46:17PM -0700, Stephen Boyd wrote:
> Quoting Qiang Yu (2026-06-02 01:02:18)
> > Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
> > a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
> > register controls whether refclk is gated through to the PHY side.
> > 
> > These clkref controls are different from typical GCC branch clocks:
> > - only a single enable bit is present, without branch-style config bits
> > - regulators must be voted before enable and unvoted after disable
> > 
> > Model this as a dedicated clk_ref clock type with custom clk_ops instead
> > of reusing struct clk_branch semantics.
> > 
> > Also provide a common registration/probe API so the same clkref model
> > can be reused regardless of where clkref_en registers are placed, e.g.
> > TCSR on glymur and TLMM on SM8750.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> [...]
> > diff --git a/include/linux/clk/qcom.h b/include/linux/clk/qcom.h
> > new file mode 100644
> > index 000000000000..09e2e3178cfb
> > --- /dev/null
> > +++ b/include/linux/clk/qcom.h
> 
> Why are we making this file in linux/clk when only drivers/clk/qcom/ is
> going to use it? We can have some qref.h header in the qcom clk driver
> area.

The header is placed under include/linux/clk/ intentionally for reuse
across different drivers. On glymur the clkref_en registers are in TCSR,
but on SM8750 they are in TLMM, so the registration API needs to be
accessible from outside drivers/clk/qcom/. Keeping it under
include/linux/clk/ allows the TLMM driver to call qcom_clk_ref_probe().

See this earlier attempt for context:
https://lore.kernel.org/linux-arm-msm/20260202-topic-8750_tcsr-v1-4-cd7e6648c64f@oss.qualcomm.com/

- Qiang Yu
