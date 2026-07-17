Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874E93ECBC8
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 10:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784284202; cv=none; b=f1EqhiaTF3fxsGDATdQEghQm5BsLXvkSQj9+EdeKWd8NmB/AI09o6x5W270+1TK/iFrCBHacIcxnLShqciuwkJJ5Xv7+pKsuv4pEUBEWTJDMJBfrsTWuarjHzjoSsuqq76jsuWNw6arl86rb26FPQ1Clk7OjQOdbF0Cye1AtFh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784284202; c=relaxed/simple;
	bh=qHe6ZlC3NRO8RIAOPo9zIJdPF2tWl92RPA2ZXw+M0Zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FkwSKApkjBUTS1o70D8B+SOU5eYkiexcr4V4UoHUGWmSxXZVA6RM+0XYnhqNYnAv8u3S/awxRk0OHnLxr8iVJmlQdbOSMQai5MhijekAt4SSL0LTwU8OK/oqv2lcby5HtLSFgc9Nuv2DP90QcRo+8CwQN+fBE1fkO522elQUiFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YXt7wPM2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N3i/mpPD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YXt7wPM2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N3i/mpPD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HASoMJ1695387
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 10:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jXQqLcZa4k3vOKE8Gg+Xq0ho5HHR9pHsqihv6Qjt5CA=; b=YXt7wPM2Lx+uXriv
	7OVETmQbV7NL6XlQ7eZE/7iBpT0BAQdqQsc6keobpEVAdWzf1VBjJbfFV+Su7cii
	3VOCXNgb9d59l617qQTxzYGYehHLEOkNzhhznkq7oRdS4xnQnQpDERJfeExxmv96
	+FU7FBl7XS/pRax518Dx6NK0y81yuJrvzFXnHKfwAfXkCT4354G7GGcl/5Qh+BwS
	0tlS+g7XgT8EQhMfeZdjmWn/hg4JoNh5UbeOoBzwFRmNPQ+/XrLI+96MF5mrv4Bw
	QgcxDWicQanA6uU5ym70lBnzSlb0bTMvVxumCZhGVFT2yOFM9p7F8HHubGpckjLA
	Za39sg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffd3asbny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 10:29:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso3521375a91.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 03:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784284199; x=1784888999; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jXQqLcZa4k3vOKE8Gg+Xq0ho5HHR9pHsqihv6Qjt5CA=;
        b=N3i/mpPD+a1OmdBIcGViO7uGXz00BUqs8V+S34C66j8tbknRnA4/e//RSOwk8LhHeo
         xfEc3uMnn5nftML1qEc5ShiMBCXkRW6bUZNy0UhkrKthptnXp3b8GnMp7Cj8EIqKG9or
         mXvc7u5Tl45TzRUp3mcmCSseBgQQarLsWdpawJPapCsY6TVfJ25Lp2NsyCbyjVAI8QI4
         jYledxk9M8BS3X/iGWJPzj+5jyy2DrueoW0sC4D9iMVBeRQkB6lEJ7S1vdjRcbJFrjP8
         Q0+Z4mmAxKup/OOF9bEPwo4GLg67/arIhFVHBk7iiyKhYzSFQcqGD440vX3AVIGeoj7C
         4YoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784284199; x=1784888999;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jXQqLcZa4k3vOKE8Gg+Xq0ho5HHR9pHsqihv6Qjt5CA=;
        b=RCDoonyTwObQP4LtnLUnVw3WmxcPCnf3mpXTmgVqt9yijam1YSrAf4YFSIMtDPSpmy
         iOMGqNS/WE6/tkhr1ccoxN0nn8TYkirTNfBja5F6Q0MjlNb1QWF+0fjVH215H5MiD4CN
         JtXZeDrc/hvBsAt2zcxsvj481H0mZwdzyaeZVHkqkxLIJF7HEbtsfKcC3j7Uh3lXnsfX
         bEcQ6+Wplnwpdk6Wzje0nH8lHkOmIzruApoLj2yfaQTTf8AFQVhb/phP0WP7bdrvjx5j
         nVm16eZ6M2KWgssizsu20/nFw9aPX1n63FKB0VyN+kN5QrH2oz8dx5n0tZRZQa5HSsuw
         M8tA==
X-Gm-Message-State: AOJu0YwnSF8r/csGoXw1YNWzPZhm2lyTXm1ojkKqwRCzI2tb7W14ma6S
	7rE+OmS5EJ5DUF4VGidMFl94fBXsUxBxpPJTUC79J3Ximi28yiI28raTq9RCpSFw78LfxnquL8j
	WPLEe4nRm7WczziO9MiUs9GOCKXPio8iiIID3hw/Fg3vMxmhUe+v8DAWfOVLjVebq
X-Gm-Gg: AfdE7clznMgp7e8/ml/JMsLKqTyc7b898vy8vVPyalFNYoTqv4Ju07Xco5xuWN0o0MN
	+1DDb2218xhQnnCTBGrQeNOBVP4QzlaqhAwdOKDaF2a4gcdaoPCGrd0YkRxISgdR09IEw1JvpI5
	5WO+bWWnWpUYReaXQaySzvaB2rTR3JKIzsoPJMxGUhm3P1z02/1+uBpeYTSVImX2kkzKon/k00N
	5/P9uJzZGyg4YzIwNXhfSL75QHDLvk/XoUGSwqMGRWHEbes2MxZ5P1JmqPUvwps1VTgDJjTVLcC
	v5kgMeE+Vg+FiBBIpB/awQYHD50Sfb4q9Ecu7MEsnl57av/Iy4fNJNuUUJr51hUP6DxMfYHSWGN
	OWo16rQAGwU9jlIEkLU1Ha/8VyP2/v/tmi6HEj66/JmqIKeU=
X-Received: by 2002:a17:90b:1f88:b0:37f:9cdf:f0ac with SMTP id 98e67ed59e1d1-38e4b538984mr2018245a91.27.1784284199039;
        Fri, 17 Jul 2026 03:29:59 -0700 (PDT)
X-Received: by 2002:a17:90b:1f88:b0:37f:9cdf:f0ac with SMTP id 98e67ed59e1d1-38e4b538984mr2018225a91.27.1784284198548;
        Fri, 17 Jul 2026 03:29:58 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39deab2dsm2671936a91.1.2026.07.17.03.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 03:29:58 -0700 (PDT)
Date: Fri, 17 Jul 2026 03:29:56 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v9 2/7] dt-bindings: clock: qcom,glymur-tcsr: Add mahua
 support
Message-ID: <aloEJLLGtDW9TBU8@hu-qianyu-lv.qualcomm.com>
References: <20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com>
 <20260713-tcsr_qref_0714-v9-2-373670ab15f9@oss.qualcomm.com>
 <20260714050831.0E9631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260714050831.0E9631F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEwNSBTYWx0ZWRfX/9Rp6GpPttm+
 Uj1Un0koskJe+sZC82dlgygxaFu24pyoKcWS+ZhxMAZHPB5UxYv0d+zr2FIim/FfT0XqsKpR++c
 NceUjdJ43m63ujmFG0sDfKeQ8KqH33E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEwNSBTYWx0ZWRfXwkAtvHGUg0oO
 b0ivXJnxmd3DVyROEyuwAyhw3iqucPZF+783W0jYXMImPkXGL7EdD9+vW+7dlfHGMFta2dzalRu
 8voQpNpYmp7EOk00kHZXmJ7IHO5N0b25m1VW6WvBPk49Qm2gNo/4K9xDcYK1FzpeJOlnowdErYe
 Fj+ZjpUf/B9edAjttLho5YYZ+g/eztvscEsMslAGq/4FXm0kPiUbXf9E3aZtxgih8o1x186OmnS
 HmgcOIFTb4oErn2WWds8Gyq/aStsb/vuHEGD1CS80yf2NOg+qfyWoIThbPiRsJOPTpTvXIiriyF
 TTwsqB+YgDr0Y4rj06OQGb+POmTol+Z0zR2QPFzxIUR6zYDsCpLERG0OVkkkA4UWKEjqobA9o7D
 4PkjGNWPWyejF0AQuuASajfi4AlNPxugWVhvFN2VVqazEXEhwM4JstNAraF7c9mxg01aqSg696+
 WhY2VVBw7mJccPXiuEg==
X-Proofpoint-GUID: wLr379fHqS7WxQ9H6sYZIXKjWHNhMtyi
X-Proofpoint-ORIG-GUID: wLr379fHqS7WxQ9H6sYZIXKjWHNhMtyi
X-Authority-Analysis: v=2.4 cv=e/M2j6p/ c=1 sm=1 tr=0 ts=6a5a0427 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=uKqSePO24bDyLZl5HWsA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170105

On Tue, Jul 14, 2026 at 05:08:30AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Consumer supply properties for Mahua are incorrectly named after the external provider regulators rather than the consumer's internal hardware block.
> --
> 
> --- Patch [2]: [PATCH v9 2/7] dt-bindings: clock: qcom,glymur-tcsr: Add mahua support ---
> commit 6be182ccdfcaa98dff1b1eb3997c0618159a4ce8
> Author: Qiang Yu <qiang.yu@oss.qualcomm.com>
> 
> dt-bindings: clock: qcom,glymur-tcsr: Add mahua support
> 
> This commit adds device tree binding support for the qcom,mahua-tcsr
> hardware variant. It notes that Mahua features a single QREF block fed
> by refgen4, which is in turn supplied by the vdda-refgen3-1p2 and
> vdda-refgen3-0p9 regulators.
> 
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> > --- a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> > +++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> 
> [ ... ]
> 
> > @@ -82,6 +83,25 @@ allOf:
> >          - vdda-refgen3-1p2-supply
> >          - vdda-refgen4-0p9-supply
> >          - vdda-refgen4-1p2-supply
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: qcom,mahua-tcsr
> > +    then:
> > +      required:
> > +        - vdda-qrefrpt0-0p9-supply
> > +        - vdda-qrefrpt1-0p9-supply
> > +        - vdda-qrefrpt2-0p9-supply
> > +        - vdda-qrefrpt3-0p9-supply
> > +        - vdda-qrefrpt4-0p9-supply
> > +        - vdda-qrefrpt5-0p9-supply
> > +        - vdda-qrefrx1-0p9-supply
> > +        - vdda-qrefrx2-0p9-supply
> > +        - vdda-qrefrx3-0p9-supply
> > +        - vdda-qreftx1-0p9-supply
> > +        - vdda-refgen3-0p9-supply
> > +        - vdda-refgen3-1p2-supply
> 
> [Severity: Medium]
> Should these supply properties be named after the consumer's internal
> hardware block (refgen4) rather than the external provider regulators?
> 
> The commit message notes that Mahua has a single QREF block fed by refgen4
> only. Since device tree supply properties are typically named after the
> consumer's input pins or blocks rather than the board-level supply rails,
> would it be more appropriate to name these vdda-refgen4-0p9-supply and
> vdda-refgen4-1p2-supply to keep the ABI independent of the external
> regulator names?
>
The vdda-refgen3-0p9-supply and vdda-refgen3-1p2-supply are named after
the LDO names defined in the power grid, even though they supply power to
REFGEN4. Renaming them to vdda-refgen4-* would not match the documented
LDO names and would effectively invent a new name not backed by the
power grid.

- Qiang Yu
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com?part=2
