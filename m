Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA583D0935
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 06:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776927041; cv=none; b=SsvCjCWIkMqQ5mgWP9JXBVz7aZkDvImf7uUaniBv+hBpq320nl4bpoDkyY9yZWzVAmmNj4RxTSehjysC7/FAiebcfD6wca1PrAYu3zkgi5XSgcDTvBi2ode7SJNVuogkAJHt1x6v8MNVgIw373Z/GHE732MphoJ0mFU8gU8oVs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776927041; c=relaxed/simple;
	bh=0fe41+WI6axE/tmZl1DmSgsC5MAEfE36ueeyk3WOP1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/6qCHMxS4lPcFlgyDTOEyr1LyfpBL2FCeB/w19hAiIogEZj50qoBgSoT/TLMR4c3D+kOt8mekeB0S7LM3dG8yB4JlP20BN0tqVzyvxJhhqNgMmtkYbnYi+RfEmPkXjDiRfqh6O58Di7KzaV4wt3c3fldqNlqDMFhEoLZ8io1ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GqwtUNsy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K3qE2BW/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GqwtUNsy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K3qE2BW/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N3Bflf3528314
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 06:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3E+BDv1BqtNk9uvpqnAxiRVc
	A/9n0o1mNCepDC7uVrI=; b=GqwtUNsyZeTN1pifBEb6dyC0JklgTlh/AXGtsZ3J
	oqaK1cZAeQoHonV5VhqIeoNPqOyX9gc1RAgyWE5wPy1JRFT/j4vjy57sVnrdlJ8n
	99koa3+00ddG2Py19i9G49X3e2RcrSSxzNpMET/dwerZTaAbpAlmpY90+mbRsL6a
	WwcWQpuIG7dd6sTQFtpsHUVwcEx0IfOX3nEh1uI4zxN5oEa16B3wEH84XzStnk6+
	yc6KAR3Enwv0gop9eVwDzNTS9/cgf1pDXK+u+8tNWR1ehDUuxURhSPJ8dLcuH5IZ
	n3BH1gMuUKNsOnqTXIq/K6ceXW/OQeo3N5GdtPUCVZ8jXQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16wtnt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 06:50:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso8252425eec.0
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 23:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776927038; x=1777531838; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3E+BDv1BqtNk9uvpqnAxiRVcA/9n0o1mNCepDC7uVrI=;
        b=K3qE2BW/QAs7e/qfN2g9rwbx1anPa24OryjVhvGfbZEYcgIl1mJYfKMUQC5HKdpi/w
         vjFmCGHIJdHfjfX5jlK2QPuz4hSmPTd3Y5Ogt9CIfOboubxfTSJuitsknaWt1Z+Noab6
         xvN5QhBFJL/YGaZaviZctgu95P6lxlgZ8aN0gLf09rWcfvVPr8e90mT+cjXWEtw7P4e7
         zM3llSIx/Qy1WvrjEoWLNV99IIRKMIZNr383URBQz8U7Is+XI0VhNgRC8c584B+xfW2F
         796XNbUn46EuL9ug4D6XStrxTF2uy1u7nAgn0245UpUHGimaeQ8OFYvTmL9XIO8PjDGv
         fCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776927038; x=1777531838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3E+BDv1BqtNk9uvpqnAxiRVcA/9n0o1mNCepDC7uVrI=;
        b=LLmY6YqnDA+WtRt5zxvIYkTOmgnUU6EcaDE8y/tUSerffbXt5M9hZrp3G62B0TejT/
         L6HkIF1trrNRfnH7QJldiCvDg0cWkJKyHrdsh4oCHaPjDjTXR6TqOrDRowRMObdopNeh
         F0XUjokML44uTo7unwY9+TJpYds0kJD49OoBmIVEvYUcqbKLsw2jzFskWLv46i8ov2WB
         qdrQbT+Q2A/K78pUfZdcmArWzbOPW984aJXtvbqeclP6WF2z2C1Wehme5R/l8INHk0A8
         hEJQgJrM+kJQsOJ99OfwE9Au/EWIOuMLcC+qmUqVgURu0Gmq48IFTLdQdA8hEtgWENR/
         Vikw==
X-Forwarded-Encrypted: i=1; AFNElJ+dYPzNrNIUtrIqGu3ygrkR90f6/eJQg/wsCOf51utmOC+Pa+Vhn0jyjZO/Sb2U0RaOk11HgpIdpvpz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4E5n3I5rqellehfrjF24aLHIF3elxDKMO27hAUJVOTV2fM3qi
	14VqHksBUIpzMqVu0d513irIcvfgAmiuVLq/sgVMS90juTWXzqIHirX1rhl0j6U3mj9fwNAn78R
	j9je4D6UJeVOLNGv0tPLEhqutq9a0XXF/hCiIFWygNhTwybP4ieEH2u3m4ZZRyG9M
X-Gm-Gg: AeBDieuS08DYqUbu/4Jqa3DgAyO+QPy4JFDmLYwC0jrdO4sI+QxMv9yjOfzIvC/80Zv
	BNWLQtcOqcWIaWEz2/GCoQ8ayybKs8QRq4B4XIBw7U6rOoFBKKL77eIT600TZVfKZDEh43QhEoX
	Jwj+skE42zusPt9WU0UXFCyTwGtQ2IwXoWxJz16D0tNa2LIPTP8+0lxGfJfmRVlLmT/Wz2XJkHh
	RjJf+bOBTVS+DPyGveze/5cp6+CIGpn0sQsLg/8LhuzRtDi7n+c8Fjft/pw/0XDSoULPU0REyyd
	LQpQROMtSBGlSR9/+h/A6vKgkZQk7LfcivCUUKa26cz15AEl9gc0ioE+RgQTJK6zaYW8MaXOSdl
	ri5BBpwLfN5bIEJzPGjwCESIMi6ymlaRoH85HgLpqhfiAGZF8hbmDvMK728FdaJtt337iGsikWE
	p3sVc=
X-Received: by 2002:a05:7300:fb91:b0:2dd:2d70:8aba with SMTP id 5a478bee46e88-2e464ea4fa6mr12166490eec.4.1776927037558;
        Wed, 22 Apr 2026 23:50:37 -0700 (PDT)
X-Received: by 2002:a05:7300:fb91:b0:2dd:2d70:8aba with SMTP id 5a478bee46e88-2e464ea4fa6mr12166471eec.4.1776927036986;
        Wed, 22 Apr 2026 23:50:36 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a7ff1sm26260515eec.9.2026.04.22.23.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 23:50:36 -0700 (PDT)
Date: Wed, 22 Apr 2026 23:50:34 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: qcom: Add QREF regulator
 supplies for glymur
Message-ID: <aenBOtb57KmUY5e2@hu-qianyu-lv.qualcomm.com>
References: <20260420-vote_qref_in_tcsrcc-v2-0-589a23ae640a@oss.qualcomm.com>
 <20260420-vote_qref_in_tcsrcc-v2-1-589a23ae640a@oss.qualcomm.com>
 <177667583832.1359985.10364830499161105694.robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177667583832.1359985.10364830499161105694.robh@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA2MyBTYWx0ZWRfXydOPORqIjeUR
 Y4TAPIXh841HT+X2JubuzGcvWJ8ZSiAFO+zSRowj23eALl4CcKBFcEeNt4krLEJDO07P46zvYIB
 NXQ+4hB9H2OwZwpSHpQasz1jdGCtGD4vi8ZXqviXN5GtgcdTQYmVvfq5xp7O61OjNdZlxz/j/EB
 CK3hh2qB6d3g4c2W5BCK5taqbCV1bDYjW90c2BL/45a643Lie0PpnDr12y5vtivhU7t0Q25JJXJ
 1N2rAC6JN3FeDLqA992ITSLtXYy9UHZWFGwQ0bPly3pnrt3BkIshzJ3P/nnnN/PeQO4eNob7lZd
 TXRa5RNJBEmeWLxJOlHXEFFI5l/FlQuQlAuTYV67PP35dyLwEeOsAVo6pQytm6jLh0kNHb4b8Tx
 pkD/fz2c7kgPSDIecVp4OwIm8iQwo4k5wj8cipnjIxJe+QbXeXwzGpNOMr/7StJelUV580BZqOV
 ebYYFo28j1hNK9A9+6A==
X-Authority-Analysis: v=2.4 cv=dL+WXuZb c=1 sm=1 tr=0 ts=69e9c13e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aLEXbJoCFh11svoGBvsA:9
 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: lDPeDM8qxHTgdNwN7QNFHQG5ctu3JeSN
X-Proofpoint-ORIG-GUID: lDPeDM8qxHTgdNwN7QNFHQG5ctu3JeSN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230063

On Mon, Apr 20, 2026 at 04:03:58AM -0500, Rob Herring (Arm) wrote:
> 
> On Mon, 20 Apr 2026 00:42:52 -0700, Qiang Yu wrote:
> > Add regulator supply properties for the Glymur TCSR QREF/REFGEN blocks
> > required by clkref clocks.
> > 
> > The vdda-qreftx*, vdda-qrefrpt*, and vdda-qrefrx* supplies map to common
> > QREF TX/RPT/RX components, while SoC-specific topology and instance count
> > differ. Document them here for qcom,glymur-tcsr.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  .../bindings/clock/qcom,sm8550-tcsr.yaml           | 40 ++++++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
>

Will update it in next version. I checked the pcie phy yaml by mistake
when I prepare this patch. Sorry for that.

- Qaing Yu
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml: allOf:0: 'then' is a dependency of 'if'
> 	hint: Keywords must be a subset of known json-schema keywords
> 	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml: allOf:0: 'then' is a dependency of 'else'
> 	hint: Keywords must be a subset of known json-schema keywords
> 	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20260420-vote_qref_in_tcsrcc-v2-1-589a23ae640a@oss.qualcomm.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 
