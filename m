Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E16127510E
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 07:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774595347; cv=none; b=KP1/7VMPh0eeqw7hh/na9V+RZ2AZfM2lRV54QqlQJyfwpF4NyMfeouXiOKJVTfPPJoR620YVTAkjZuwM2sVIxIm/qDrQvh88AhlzQWkT2WmCYB2I7VyFUOt4RhiGD+OyfPdbwUD9PZqdf86G2hfz2zb0aJg6ud+Sw5E9ilQJdaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774595347; c=relaxed/simple;
	bh=9TxmuY/zdzq4/I05KRKA5AA8xMcByD8B7t96xzHGptE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MAo1HQVy99dh7Y7jq7shzjRovL70JEV8WbaOPhVTDQUofXPUDNrxd3iW/3anwmBo2KIFPY28fygNTppxT28OOU0KTOwXymlcQkWmoHtI7CCo99/i8cUGG7FDJlNsFzBBkgSX2D5Z3T9O7wehiI94tX+ruJ8U/wPY2bql66xO7k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y6l6YLXC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FBleDxFu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y6l6YLXC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FBleDxFu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vfRn2378998
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 07:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TaG90SVyb5AIepabbeQeF8TP+ZDwmTzW9c1DEzvGYD4=; b=Y6l6YLXCazICvbD6
	tSX5VJkeNF69GOc/D6o6j9CPQv/b7Akmua/LT0TNofDrO+UzpHWB/7Mmw5KIqvvt
	WNyiSy9VDfQRxv23VUackjAPXhQ8YkI/U2kz6yNGK0+KR5vRGyAI93NYXaQgHye4
	9IxOebMue2NWpa3UKQ+R7a4ZMTlw41vIXpeqI1CgfB62aocupzpTZQc2cyfk+Ax9
	5gbUrzj4zYMLAEIsnR7H+DVBmjpdvSNDo4MPUlAxMjCuirXJK01TwqD9Rxx4ZdnJ
	1pWd/vLp5uw5+EHuy5l2KLRHRWGif5KLE56zOcvahov+8bhAjM+X87NVjaQiu54V
	bDWrWA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5jcx0nda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 07:08:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b23af7d7e8so760505ad.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 00:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774595335; x=1775200135; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TaG90SVyb5AIepabbeQeF8TP+ZDwmTzW9c1DEzvGYD4=;
        b=FBleDxFuOAA+ntFPDDkGLl3U5EqM0VZiT62oR50CGTUuueNlhdfCHsV3y7UmhhhY6o
         VzAdVMbw6tHLBkUpTwX/gIO8PCF8KRmmErJPdeiLsxUyswVGPRPl8FIfaV/jIStTlS9b
         sPVNs8VSU7kItUrmMAXYQBiK0E1Xio5XirNizHfLYLnssZxEW1DJcDrf8FlBMgnvgQAD
         a1DJlEZi+N3VFlsd2eGqs8ZZw2RIZtJo5ZzeltCazG0Y7MNt7GfZjCjo68Sndqu6eWnI
         FXmJ9f77BA+kw21iCcr4Bi1PMkG7m9h19Si9MGfJSS0g/ndF8a0S9cuxHDZNeaIFY1Ci
         CezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774595335; x=1775200135;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TaG90SVyb5AIepabbeQeF8TP+ZDwmTzW9c1DEzvGYD4=;
        b=U4Q9xb4sTl8k2qiaCMmhjB7yov4ez267rkiVkoxAKnGYnqikdczpPtoeFeqr3NZpNj
         pxdhVNHGC3yFgbU80jZpwbx8vCe+hQg/x6X9Vyjg2QerOUIyNo/1B+48wp/hIb+zqGZE
         mMvCrGgya+ZVuZQpFU0RwOhYSFJ+p1OmFoLCalCqG0gm2Bz3HzUw1RCiliWpra8asD0J
         IGEq9pcYHyrdhhDSEPj93xiS7UaGzedg+0UI5/udmL0iobfX1bcJx+iEDKE1+5NLy5St
         wLB24AI2fBnn9hhdnDFQ1jRqSpe8b0FkNrlg/psIKvbrBQ/wagyHkkqbT7zHN1v5dS0S
         Jkwg==
X-Forwarded-Encrypted: i=1; AJvYcCWb5uR6IndiiN/OKzFU26PERFDUlMWYdrjQwEP30HNXcZ8hO7fICXP3EpUy8CWJq8072mMMH1eAqH6U@vger.kernel.org
X-Gm-Message-State: AOJu0Yz53x7/Xr+Oc8v875LdHpyerTK71jXsFQQfrYLhQMvGqx2S6uyu
	MJDvM8i1rrEQ8O4F4krt1/24DmbpiZEtvgVhovwHiSFMG4m9xYwZiGJUoPf2jx01S4wbuYW4EHN
	1E9GCniKG5e7fWU1Mfhzxs7q6gV07dCitxGfKC2vlAA0h68/qg+Rw+tEOWfWAUPht
X-Gm-Gg: ATEYQzy5QjHp+fc03m4q0GKCfaQNxPpKF2KlVjvSF5W4vMeKguGdGwUvus9WcSPjtS2
	lhDkapfTjYy9wuQuMviZioqNC25e9rOGlkMR5/ANUMUux2oXhWUfU9dXuzI0zA80aGL0U94rE+Z
	9HwivHxFWO1Accy968yZ+X85o7T8SZLYZZoCM1Ljuo3zAZulCu24vBnkqLtndtNwax4bUl5lxUv
	vQ+wXnNcPyQ44lMjVBSh4VRrSnAptdTES500SJ7VTLQdo63+ooFQC2YrOlkCCe8zI1J1+VPDt9Q
	ttiU+isdDDDrLwjJAXvLvv7+q5CxB0HBgXqwiNzkiqdjenJT8dvxbFaW/YCmXDD2u+15JaqFiLm
	BPHKW7gSg+MuDrx5yQWoYyK+vsblgYRy1Xhn3vPxzDwiaNVVS+q6LSPKlitoCMg==
X-Received: by 2002:a17:902:f542:b0:2ae:6133:d170 with SMTP id d9443c01a7336-2b0cdc3ec8dmr16769125ad.20.1774595335221;
        Fri, 27 Mar 2026 00:08:55 -0700 (PDT)
X-Received: by 2002:a17:902:f542:b0:2ae:6133:d170 with SMTP id d9443c01a7336-2b0cdc3ec8dmr16768755ad.20.1774595334731;
        Fri, 27 Mar 2026 00:08:54 -0700 (PDT)
Received: from hu-botlagun-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc76b6casm51125775ad.16.2026.03.27.00.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 00:08:54 -0700 (PDT)
Date: Fri, 27 Mar 2026 12:38:48 +0530
From: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: lemans-evk: Enable mdss1 display Port
Message-ID: <acYtAF6RkUHlEN+k@hu-botlagun-hyd.qualcomm.com>
References: <20260219-enable-edp2-3-lemans-evk-mezzanine-v1-1-969316806538@oss.qualcomm.com>
 <d54f4b17-a137-494b-b103-2734987c4f14@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d54f4b17-a137-494b-b103-2734987c4f14@kernel.org>
X-Authority-Analysis: v=2.4 cv=NfTrFmD4 c=1 sm=1 tr=0 ts=69c62d08 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=P-IC7800AAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=VUyFjh0GlgUWf4IQGBsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: FQgQqJ8TIvhr4OdF6ZPzCLNy070_JpeM
X-Proofpoint-ORIG-GUID: FQgQqJ8TIvhr4OdF6ZPzCLNy070_JpeM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA1MSBTYWx0ZWRfX8fL7A+SUDaSg
 3Zl8hpn+eKU7OR2pnA/b9iArtD3rBJzbwdHy/itJleDSDGz9e10e4KeUm439hP4275/sLKzjAaz
 8ax8yoLI6eTh2/48mQ5lBdG9Ap7kZLnK7aJX/i+c6zyA8/ZI4c4cp105CQp+eigfKATYVp1ZgLl
 bPMiDmoTwF3y/H3t1yhQHCdkt7i6FLitYOtS3EIvJNeM3rvxyZL94C5PpEHWJD+6hBP5RftFnvy
 zTTxZ7pDNRlYYWJu6z3Yvv9wS6WHiIr2xf+lirCZTCaw78zGKQeJiXfxEnh70WzniAt/q6fT6F7
 M7CI/I6mgfilinUsADfQh/mdmyNiBioYQcIqks+Tz5vGkb4QxWipGi7Up61JQwYXlwLge/YnM/r
 IFvf6cjpFTvZotmepci6R3pjEfWfThJPeb+2XvgMt9G9VYl7bujsyChwQph/aQaXACUwXdzbG6N
 3wQRYOEaMRpvMkHiAuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270051

On Thu, Feb 19, 2026 at 03:24:24PM +0100, Krzysztof Kozlowski wrote:
> On 19/02/2026 14:36, Gopi Botlagunta wrote:
> > This change enables DP controllers, DPTX0 and DPTX1 alongside
> 
> 
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94
>

I’ll update the commit text in the next revision.

> > 
> > ---
> > base-commit: 1a0829927afbfe654c632eb2e779fa32df825b06
> > change-id: 20260219-enable-edp2-3-lemans-evk-mezzanine-1bef9932ee6d
> > prerequisite-message-id: 20260203193848.123307-2-umang.chheda@oss.qualcomm.com
> > prerequisite-patch-id: baf07fce333b86c35c3d4cefbba5800a519952a3
> > prerequisite-message-id: 20260217071420.2240380-1-mkuntuma@qti.qualcomm.com
> > prerequisite-patch-id: 74a76fd6a1129cdbbd32d91d2a119d693dba78a7
> > prerequisite-patch-id: f4a858f7e707c8e330daf2ea1f4da58b4da00f05
> >
> 
> Why do you have so many dependencies? Why isn't this merged there?
>

The following changes will be included in the next revision of the
dependent patch series: https://lore.kernel.org/all/20260226111322.250176-1-quic_mkuntuma@quicinc.com/

> Was this patch tested (see internal testing guideline) prior to posting?
>

yes, changes were tested together with the dependent patches before posting

> Best regards,
> Krzysztof
