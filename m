Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A055C1C84A2
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 08:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776759448; cv=none; b=Ee1xtaOchD72W83Pifg9TSpYcS2QnlCR1C9DqfDzaB4sUuNC28HolIv0IluVujeQk10Mb8j7ekxjOUEzcbEl4rGjSFGxyDcbv8e68MT3BFrMjRX/5+n+CG2LOslpmmyFGcke1fF4KFYrhTm8R5hpZga8tBSi8xJGFHQZIrTULo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776759448; c=relaxed/simple;
	bh=B+IlyedEhZNODOK1mSnA/Zegncl/8PN6pid22WrPik0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MtGd70PwiNudg/itVb2ywEWCrLeFMOujnmmSiHliCBaf/HnbpUGSl2qYlnYRiYhtnFmsesS39EF3Ck+75XH6QdE4KakMPCZpGqj9AKUADvYEpWxzWXdEaBsh/d3OGy3u0PsC5WKLg17ezWC2mB/r8fotddkKbFBGU7vGqvOgi0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gecQMdlp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GSk4Nqaj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gecQMdlp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GSk4Nqaj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L5g38h3455883
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 08:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pW4RvJ1J0WjZeebgyc1hyYHI
	FUKi/UttC0Wl6Mb4bxo=; b=gecQMdlpFY0k7uTpdGCoOknDM23BJE4rmHMxiFKO
	+iIjg9/Rn31epo6HUwOr/GlNEJCZ3Bh1SA+VULyJaNyNy950ff+YSwZnvZVowz54
	JbNzY6Ynw70e7MXSBLgxLxnm77dAe0Psiw25NQfyfzhCrEJaHP/F3qa8ke8MK/BY
	vxmTCs4d2lHMvPVnnoFRpt/gr62VkOIwc56S5ZO6xY0pyjwTxmYJiCTXgVtXGcL0
	MupbnYJD+g2aUoeO4he5HXv9PU9pTIVYufekgRyH81uNwaV5v52RAO/UDdd2K4qV
	ijXdCGI20rpTAs7x949sB9tvi8PMKuxi1PQ0h+1Tk0kUQA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfvjw34n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 08:17:24 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso5125690eec.0
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 01:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776759443; x=1777364243; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pW4RvJ1J0WjZeebgyc1hyYHIFUKi/UttC0Wl6Mb4bxo=;
        b=GSk4Nqaj4+h89mpf7T4jAbQl2wPLCBAgym4iJEazj2piFPRhN1QfBpjfOJygJT5sBJ
         jqO5Fo6IxIF0ZyC0Z3/9HrdKKve3M0WjMgA0fwLbYpu3mT5A7jc0n2UxV7LPrm2c7DAn
         EOnQ1Ni233Ph1b1ogJF7YRX56PS/rJ35Q2VSc9mTIMnKZc0cPCysQ1Z0SGxgpt6hiseF
         jjLZHniwLvBIEIpI9Apaq3WvVSihzrVKnfqgo2WezRjNPP9EN/6XsL6QR/nl5wNbvBM4
         YWt8/ITj0JS2vekHp0+551QiU/0hzHonka2aDmLJ9AxK2jwRiFUxZZmK5oNuL07tJBCv
         nmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776759443; x=1777364243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pW4RvJ1J0WjZeebgyc1hyYHIFUKi/UttC0Wl6Mb4bxo=;
        b=T/2Qpg/hPkP3CHk0F3I05zVRyux5KR39CHjY4cyb2QJ+LenxkSZk/rNv/+buW8Ex4p
         nmQj6jsER9UfNSmeqPPTE6hJ+BG+1kORZzNwU0yxUc80pAdDLmi3y/t1KAuoX4Izl1Ap
         I6rzDRnxyWdsAqpE0Tg9KYBkGU98poLoax6GzAuf4L444vNFnpyN40hP4r9kcHA8ax3t
         s1a6dg9YijN69YpC9Yc4eX8eVY8WrpR1D6nMfdDWr/fwII2aK8DG03UdLkTwu9hCnRtV
         eYGq54o6X9WAt8odj0uVMt/ok3nHzj/WBSK4oPUDUCK3iR1udjKj1bAh6zOpQGRkxnIj
         Ckjw==
X-Forwarded-Encrypted: i=1; AFNElJ+3sIjLUwcqHEDhltz9qTBs5qde6A3G90VTiyszVRxtJNjTmumXahBJ1pmTvV1YXXzI9HJYL6xN792N@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw8CM2Du1VNUojQoyXZR1RF6NnmSY4r/tzw4OCIdseha38PKRK
	LUeHXgKKK2kX2yY9WyLAI35x1fNh3w02u5cORp3+SRH33P3zdWEJ8w9SAMOjwjS1gw5MAv4J7Yn
	CNfgyqPUDkXVfJwqDLsqgso2Y6a9lU/TbC+RuL0WkD3/Kw2eqt+yKMd3QPFtV8MHm
X-Gm-Gg: AeBDievLg8ElEYlOG5UK+aGyYtaohiSAys4zAV6Gr0UC5hyR1bvR9IYrCMwJAHa/Sde
	5DF0S4kIh7Kf127ykCKbvQFdzsLTrnCj8lOhnhG5A7cJmlxc4yxmVA/+dUjtEDkD9/LhOH/SxdG
	GfRIW/UUQ6pLr3nlvFRtWvskUIO5/xGhHn0WfYii8drqMyjzE0YrMVSHyBkNz56GosqUWdACnpv
	JjdZDjxRd+juCYbWj2ti87N8M/tjyVJwhVszfyiMkz7Tbce04iIC9KbtPdzYdfMCd83egwCCB3r
	fqfTctqyIN25mdS7gGDD9vb+sjWPS/EdDu+MZrSQWruCL8GeOKLLrZmkVKzcPAdeNk51P5OaDIl
	NdvSnlqiQDQzvWa9XdYbiuZoPtfsbpuPH2fZNYgM0aa48qbn4b3WenlYju5GTBhRQWkBhEpOP7R
	4=
X-Received: by 2002:a05:693c:3007:b0:2d9:6373:ad0a with SMTP id 5a478bee46e88-2e46538fd04mr8455841eec.11.1776759443505;
        Tue, 21 Apr 2026 01:17:23 -0700 (PDT)
X-Received: by 2002:a05:693c:3007:b0:2d9:6373:ad0a with SMTP id 5a478bee46e88-2e46538fd04mr8455826eec.11.1776759442926;
        Tue, 21 Apr 2026 01:17:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa5c38sm17625182eec.5.2026.04.21.01.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 01:17:22 -0700 (PDT)
Date: Tue, 21 Apr 2026 16:17:16 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-serial@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org,
        Praveen Talari <quic_ptalari@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: qcom: geni-se-qup: Add compatible for Nord
 SoC
Message-ID: <aecyjAkRes7hC1_G@QCOM-aGQu4IUr3Y>
References: <20260420064401.1248833-1-shengchao.guo@oss.qualcomm.com>
 <177667402766.1199205.7736172019278854390.robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177667402766.1199205.7736172019278854390.robh@kernel.org>
X-Proofpoint-ORIG-GUID: ffh9OqkQ0_BPQDZ7zeDPTiwe8vwxiMUa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA3OSBTYWx0ZWRfX1r+v07qCBSFT
 O3lcH6YhXYR/XVBg+gaWX9rY9AjucAXWc19z+Bio3H41X0+o0Q3cYVnawSKX7PCyL/nvqQHeYbO
 mK4pk51WAL9zgdhPWivj7Y0OXFlxT842V3i/9U/w1YJvpFBavBuIAJn2U+kAZXh3ieyy9X2HBo1
 2m0vHSNsul7BhxO6xg2bwqpvDk7jrcfieypEhQtKNQkH1nH7Ao05vSkiXhnPdbow8mrbNCwUxrf
 zEh9vGRww4TheypSnhx8DgL5Yxt5E+gePyU50ltsEHM7GdnxX/79UQQ0VPIYTeS5zNrk8PP5no6
 JDZBv/0vxr5NKlDUUaylwR0LpsaVLJyJzUPqjVu7RMv1+YpzEHzsuv+3tJ0P6DVMYoOQVbp1gvH
 Qdn7xwLBQvr/fIjnla64W5++CeV53JBCyRMHFh3qlb5bI9RV8CZAupOEdXZtV13AAwO4f2FT5zv
 HIVqPQYIRs5SlFAlTAg==
X-Authority-Analysis: v=2.4 cv=XNMAjwhE c=1 sm=1 tr=0 ts=69e73294 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SdGosrV6Qt3YffhYJa8A:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: ffh9OqkQ0_BPQDZ7zeDPTiwe8vwxiMUa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210079

On Mon, Apr 20, 2026 at 03:33:47AM -0500, Rob Herring (Arm) wrote:
> 
> On Mon, 20 Apr 2026 14:44:01 +0800, Shawn Guo wrote:
> > From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > 
> > Add compatibles for GENI Serial Engine QUP Wrapper Controller on Nord SoC
> > with fallback on SA8255P compatibles.
> > 
> > Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  .../soc/qcom/qcom,sa8255p-geni-se-qup.yaml    | 20 +++++++++++++++----
> >  1 file changed, 16 insertions(+), 4 deletions(-)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml:77:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
> ./Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml:80:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
> ./Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml:83:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

Will get them fixed.

> dtschema/dtc warnings/errors:
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20260420064401.1248833-1-shengchao.guo@oss.qualcomm.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade

I wonder why my dt_binding_check doesn't report the warnings, as I have
yamllint installed and dt-schema upgraded.

Shawn
