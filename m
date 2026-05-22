Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA86421A15
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 15:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779464647; cv=none; b=U4r2ucFNEqkXTkXXYKOcMdflLiY0H5j7kh39/oJOcTnTIh5H0f2jkc7tGjcRVcqVKHRzyItd+mFOgbXm2CtjRvLtn9MLEIjHCjibu5GnGL3/c6R3g4ISdcLIACAg4OpK5uxb7WQoDe5zzMzvLml2JJZmXRauW/d3DqD3R9YTjuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779464647; c=relaxed/simple;
	bh=+cinnw6Y9VwbjXfyJKlVZVcGbAJrS+FTeZxf1cXpRvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPwsF0pIgySGhN2WQSzUOzs/80IOiPuTR8CkTQaOra/YwPlsamEH3ecUVVZTSNznHIMx5cSlH+lDU+XVJPxcS4svl/GFLz9s6EkcBGVne7MpcDAvLYVu804PyD6qHCAu5YtW2OPMgqwbKsLU+biqpmzGKJhwi3P+zoomjrc7kJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=feSElpK3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M9Ee4kdN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="feSElpK3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M9Ee4kdN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MA5Wv8312913
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 15:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4ULdp8jbgncmplX4NK7yQ8Yu
	Pjb+MjBQQl6bt6kxSd4=; b=feSElpK3G4qbocPRgZUipwZWKLsvhcS9/2YVj5MT
	CmBFvaBbEGv8VZzMIQqm2MtJSWViozsC/27FntMIeF74cfyJXoNAp+n7vD1xYO5B
	UE1okLlbilaeBlmne2lQQHswfcfgKZgyNsJbRAb8mL94+NhQS4+rcpA+xwQbRyH8
	4R87aTjDFgnlcgY/+0iJPshPAn+ZPpll3KY+TjjwJjRZm9yIwcY5zqIg48S8pSZ1
	x3vWm+701B0uKooObYN1ah6lBae/35wzf30xHN3CRmzA62Z7NIOn4cA+XaNn1Xrq
	hhTe4C2SJ1jkRYcWEAq+oxlHdOR/AyeeDJE9Bu26sohUHg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea8834jvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 15:44:05 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c829366cf25so10606640a12.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 08:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779464644; x=1780069444; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4ULdp8jbgncmplX4NK7yQ8YuPjb+MjBQQl6bt6kxSd4=;
        b=M9Ee4kdNo8exgCwZdeO0e6pUKugU3V7KjCeboAhUyTckwSYPUwOC2NtvlBt9IoiCrN
         4xHC7NlFz+pH9CsYMByTl3fo8gfhAZaBxKkbGN7FcKVObb2KPuH602nt4zZ6uvCQDjKy
         l4/0A6QYNP9QQnN+u7dg/a0f9cQH/TIsZclaAfLDU8gXyWt24pnfzB4/lETG/xr5oFhx
         eAiB0fhKy/q9QIRWjYlG7TOt8EGUU/ily1JcvhTc1lZ3cOGCLp+D7pcqUTzhIlx5OlsW
         mRDS2RpGSqiy1MTpf2fs/XTx+ZZU2/NzCjFyyDyyYHqN9B9E7GWqQ7MCH1mOJQpvI7aU
         tg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779464644; x=1780069444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ULdp8jbgncmplX4NK7yQ8YuPjb+MjBQQl6bt6kxSd4=;
        b=BBlYakVKAqYtEbjuAb68UpcRrg0/Y10LlfCyQK9tCy++XVOXgmeinlfjvFUnr0+b/r
         s2DOsARfo7fKbY4BpSyzuRUnVOAUAxi14lvPJpguCVbzcV5cSLJuHnoqfCVFOfxQvbja
         fHQZEIhHGmlxbmW5UafIH+9ZiwlVdQP1RAgpeQao3OnmP49HbYn84TFb2Ev7Rj+R7P7n
         qEM+0wBmF4CBfGPU9IpwUKkNl+oXabvpw0/jj7zKa+uOYQrIZ8BlHxOa+cE2twEECjmM
         +H+HrHmXjEFSO4im3hj/0DrQMkbNdrdDNqtWOpo3pqk3rLUtSOUnvpXge8PrUEeQe75K
         vB+w==
X-Forwarded-Encrypted: i=1; AFNElJ9DqjdYW+HFnMJHOA91kqJTrcikpY9cljHulsQ0i6g5dUZNDKqb47j+IfiqbnIx04OeA9iILblr9xBK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx19S3y7kV7ikXUTqXMHbL+s2Lnq48nssOrYZnCX7tbEge8yHeW
	Ni96pzycwKUd3adI1nV8VSJVz6mVC0JPFdfCeQM3LFW9mS3Tu6pQay0dhzIvp1Tbe0kLxJvmsf4
	232OmtlMpVothKbvN5fUswg9rbC4RnPHJV1cN5Azd/MJX1dBXlCrjLTJjXmQq6yUw
X-Gm-Gg: Acq92OE2TKloc+MTH6zondMVVfDkNW53yK6JQM3hVZ4hVYOCCT4dt+yjPN07j1qY/sc
	JbkJFl0htXCeuMYtsFDQSha0HPMmzavy2+fLqIciaxgozEtyYMtwA/KUGtJAv8S/mKSb5dnkUi6
	3nSiAeimb2nsU0bAVgIeCVKEcEZX59KIzmuO0tsN04Diiz1NUcSWa44yLMhkhgsxC2BsmKdwl+3
	Xtw2ff875SwWVKmzfHmUhW6XhMkXQi5TRd9N0mGLSfSvGaw1vidgnPEoZ/kG5mgr1cieYCNJxhf
	pS35yJZ+Q81SjQktwwPY+5zS2Uz+wSAjsB4fuD0EMHadb3zhopHJnfEHcoeLXn9UqmCpc2tab2m
	tcf6ZSVwVAiFCF/wBRPsAjeUbk6MQe2S0I/xlfixdZ/Ok8yvt
X-Received: by 2002:a05:6a00:2d20:b0:839:f1c0:13ce with SMTP id d2e1a72fcca58-8415f385301mr4381733b3a.40.1779464643957;
        Fri, 22 May 2026 08:44:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d20:b0:839:f1c0:13ce with SMTP id d2e1a72fcca58-8415f385301mr4381697b3a.40.1779464643296;
        Fri, 22 May 2026 08:44:03 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac9c77sm2606517b3a.2.2026.05.22.08.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 08:44:02 -0700 (PDT)
Date: Fri, 22 May 2026 21:13:56 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: firmware: qcom,scm: Add minidump
 SRAM property
Message-ID: <20260522154356.sc5vgdonlyhxokqp@hu-mojha-hyd.qualcomm.com>
References: <20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com>
 <20260519171442.1582987-2-mukesh.ojha@oss.qualcomm.com>
 <20260520-hopeful-beautiful-agama-ecbebf@quoll>
 <20260522075200.lzpj3cfqvrpzv7r3@hu-mojha-hyd.qualcomm.com>
 <04465873-17bd-4c84-ad51-29e648a88b4c@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04465873-17bd-4c84-ad51-29e648a88b4c@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE1NyBTYWx0ZWRfX3WpdYq4fPn7R
 CABa0nLtiH+/GPFMQvKJ47omHORLoiVwuqUJBBlohdSQOQaD7zGtcXUHF1yzN4tu85i4lIDzK+R
 sIRSrpWwGqr2BefxCGFocI6xmOHmIUesc5k3F7VVHZXbKvzWk+r8MBn8OaEF5h7to7GTG3EdzaH
 zFOTSvTiRWrzGmA2acrZMq7ueWZtXGcFbYcj0AGDsPIf1dtBJbwI/ny9RBLWvv4eo0LMw4CHcUo
 eQNNi3UX6wZ9o5s9ucTjtwZ8p8zXRHfIs+QwnW1A7yb5tSYV7BC6el4C5LmpVycbyGU7yhlrppE
 JrnyQZgCd+xemzys84yff6jC6fhrk0qw62D4mtcWNeL6Dx2pnrcFI02U+jIvJqHLjUaVuPiQh+V
 Y3E3Z/ozFJEVsRzMtNv52WlYxDkVEzI9JztB1x4ITjNnhmCMuOnDGufiUYv4zmLnWhlaN+mvwa9
 PyfoiAjUEWKZmeQPDwg==
X-Proofpoint-GUID: 2uFgVPmcWNXv0hbRh3H07UsDs3WVSjwH
X-Proofpoint-ORIG-GUID: 2uFgVPmcWNXv0hbRh3H07UsDs3WVSjwH
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=6a1079c5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=qneNUlL64KDMy1TQF5QA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220157

On Fri, May 22, 2026 at 11:15:22AM +0200, Krzysztof Kozlowski wrote:
> On 22/05/2026 09:52, Mukesh Ojha wrote:
> > On Wed, May 20, 2026 at 12:17:21PM +0200, Krzysztof Kozlowski wrote:
> >> On Tue, May 19, 2026 at 10:44:39PM +0530, Mukesh Ojha wrote:
> >>> On most Qualcomm SoCs where minidump is supported, a word in always-on
> >>> SRAM is shared between the kernel and boot firmware. Before DDR is
> >>> initialised on the warm reset following a crash, firmware reads this
> >>> word to decide if minidump is enabled and collect a minidump and where
> >>>  to deliver it (USB upload to a host, or save to local storage).
> >>>
> >>> Add a 'sram' property to the SCM binding to describe a region in
> >>> always-on SRAM where the minidump download destination value could be
> >>> written. Boot firmware reads it before DDR is initialised on a warm
> >>> reset to decide where to store the minidump either to host PC or to
> >>> on device storage.
> >>>
> >>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> >>> ---
> >>>  .../devicetree/bindings/firmware/qcom,scm.yaml   | 16 ++++++++++++++++
> >>>  1 file changed, 16 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> >>> index 25f62bacbc91..27422d00b8fc 100644
> >>> --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> >>> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> >>> @@ -129,6 +129,13 @@ properties:
> >>>            - description: offset of the download mode control register
> >>>      description: TCSR hardware block
> >>>  
> >>> +  sram:
> >>> +    description:
> >>> +      Phandle to a region in always-on SRAM used to store the download
> >>> +      mode value for boot firmware to read before DDR is initialised on
> >>> +      the next warm reset.
> >>> +    maxItems: 1
> >>> +
> >>>  allOf:
> >>>    # Clocks
> >>>    - if:
> >>> @@ -250,3 +257,12 @@ examples:
> >>>              clock-names = "core", "bus", "iface";
> >>>          };
> >>>      };
> >>> +
> >>> +  - |
> >>> +    firmware {
> >>> +        scm {
> >>> +            compatible = "qcom,scm-kaanapali", "qcom,scm";
> >>
> >> Incomplete, missing interrupts.
> > 
> > Interrupt number comes from firmware and has not even been described
> > statically for SCM  for any SoC and so I am not sure to include it in
> > the example. Perhaps I took the wrong example here and should have taken
> > some pre-Gunyah Qualcomm SoC.
> 
> Then you do not need a new example. Difference in one property (reset
> cells) does not justify new example.

Sure, will drop it.
> 
> Best regards,
> Krzysztof

-- 
-Mukesh Ojha
