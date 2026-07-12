Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA83385D82
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 12:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783858766; cv=none; b=sE6/FgkLnlsSeKvH0Box6LShbH1PDxtFVxTPg4i3eOzt/0Us0ERamuqb05DHnCXl4uXEg7PED58RNbiPC0IyMt4jgWp1m030sdPcsYdORq82VXA/8VEr36U47v34yWXcUbl2w0MJZdsq6kizufsZe0XUJbptbF5UoziH3XZqmDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783858766; c=relaxed/simple;
	bh=6IPk9HcggP18K+zdirzdUvoMGtt5SM+UOEmQBp+gdp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uwwd8aDdETrUDMi1Jwke/VhuBqwp7IdCuvNlTsvQd++Hf9d6DwgDoUGFowJO14ZR2aYnZ/MBRg1EUhPrmAuav9r3aI7tmIWW5eBI8WxRJMXbhznyu7UtWJCHI8rz7uQYYjJy9LNMMd0sEL+E4bqkDd0R5ROTsLQDRX0kEW4gYGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cisodzbT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJPq5er8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cisodzbT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IJPq5er8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CAcdmc2446447
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 12:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3P6NWxiezbjvCb/uAW4I0e+M
	ddZtoeR/tFnBxYO27XQ=; b=cisodzbTXyib9ov9XPV1PKyXlLMn4ror7HGrkXLz
	Gp4HczjK5LgAZlSRx3HN/tQYY8kjdngGkSPbCYHGJBBBzvJ9zrfGoSRQUMXqqgy4
	13zV7Wl+p6AIC2OnRjvW9ndK9FazOqIN1nbpJfDxd3XBg05GEMuuJeRxpcCf1JO2
	dn/Ozqy0ZmmTC27VDNhBZI5P+g9vaNUbGjSxEd/yIf6lNs5BAh/iXe0MIvr0OHI1
	VVkTuT0dtTADcK6LqtkAjyCoKyGkdtN1RlX0DlbI7aJyXUUpaylRa55HSdKw7jva
	b+uklOpbzmlFQtSX2LHhv3lumWJvPID67VwmIRlmqmfR7g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeafaq57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 12:19:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0e702df8so25210381cf.2
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 05:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783858763; x=1784463563; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3P6NWxiezbjvCb/uAW4I0e+MddZtoeR/tFnBxYO27XQ=;
        b=IJPq5er8m9IvFDJFlElotJ8RIlX2hqxScpDUc84CBq3QwGbPOcLPkYVhw08h+1NDOE
         WnCNZ2gpP7F1gQsCWnnusJNBDmBa8Jm+Qt8cjOyhRPewk3kQx2/HvJ/1+Nx0BDbJXKxU
         9OGG6CUoGG6fAhxxel7owBZM8leE/wQr2Eu6xR5SaPxiniy29sJiOZkgShGaqjx2f4hQ
         Y9VECQlcA0q4E0uahvvTcxVRWGJ+0hIFvI0iyVao89gMDy6NpoBQ5gC9yfkVG0S4J1Rf
         pgjpFxOmyzTuv2gk/uvneffuiJ//vHkLWIuJ4MIxWdaodE73/UDvckPyyUgBZtlN7jAH
         U10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783858763; x=1784463563;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3P6NWxiezbjvCb/uAW4I0e+MddZtoeR/tFnBxYO27XQ=;
        b=LR5H9RYLFo30mi3PBZypGjFLUYXMS5yblMkhOzPRN52Li2HWfIYCsxTM5MdmQvcl5y
         GdaJ4DciwtR/sY1Q55tLMtEqt40XwbHfAc5XpGzZqDx8EAY+fy/Ryenhvo9dTHr4zP8y
         W3zi1USY6sPFTP7I5nFhDAWZqPrxBiBAE+xvMCsCzq9MBBth5B62WRDJLsNJw77Jw5tZ
         GPqrhdG1819p6GvFTE1Bfp+9zKO1D7PLADm79K+jsmVNPm7iGTw/v2uQIg1Hp+1hV8ZY
         yq7qBRJjQuTf7Hh7JRt4Ki20TtnPaOk7IGaLdXm/bWWo5o4Non9H5bWT5TvTMXDaceHr
         TKvQ==
X-Forwarded-Encrypted: i=1; AHgh+RoCZe8s6VUUzqADXD3wzdLfX69kbO3tfqwu+HsJA/1X8nGqR8CkQ1YEq8/cWZZJmiGgCLzMZd4owSlR@vger.kernel.org
X-Gm-Message-State: AOJu0YzT4q1WiDb7jBNh++HprB5TpaQru1wsOzU1KK2MXgB6lnA/u65a
	OpZqLuN/oe1U5ZtoqV/wZYNt6lSI87iK+AZHtIrHD49gS+0YXzGG5YXk4Hd45CcHqTq5EpgZarA
	G08t7MNAE/atiCY7kQBebvm2iG60Ett4nopi280DvzOogKJRUEnnYcjtjuEzg4QlK
X-Gm-Gg: AfdE7cmG6nMmRgeCXN9MzInHsrkhBHOtUOLPINT/4wdcp1XxlLqKCzmlaXqlo8227hH
	FA2/a/eTvpH2cKWzmxbUCq9yQnjLQmjIQ7V/XVt29eAQ1K/QImMT/Y4YfshZ+0yZjrDIyKrUTmS
	DP7HJslZCPALVDeIpSLMPKRuFMg8BxW5dBe+SVlsoqwRZAWQgvABQ3QbyzoBNEYnC/Vg+cejJ4u
	Bq4iqAcfvfG3qGhaXstII2D/UjSledHG++1ayfOc6qERU9UVp9Hxxt2wht3/VsWLU86pCs0fbvZ
	sNX5ikp1N6VNd5DzeLb+hjb177U3gIBJGS4bpBIeeN9C/wSKVp9VuonnkNb1oe+a2WqxLghHopZ
	1OGNY7v5jhTBTY0ZSs8hjjtrJ055IpNE4DmeY2w3UnuVxFRvC0AFQw4CQqsoYcD0vR91nuT6epH
	A1njBt/o45vffjEidp5jWQNPCl
X-Received: by 2002:a05:622a:429b:b0:51b:ec5a:ec0f with SMTP id d75a77b69052e-51cbf0d04d8mr51443541cf.27.1783858763421;
        Sun, 12 Jul 2026 05:19:23 -0700 (PDT)
X-Received: by 2002:a05:622a:429b:b0:51b:ec5a:ec0f with SMTP id d75a77b69052e-51cbf0d04d8mr51443151cf.27.1783858762897;
        Sun, 12 Jul 2026 05:19:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caaf40esm2023077e87.71.2026.07.12.05.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 05:19:20 -0700 (PDT)
Date: Sun, 12 Jul 2026 15:19:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [RFC PATCH 07/11] arm64: dts: qcom: hamoa: Move Iris IOMMUs to
 sub nodes
Message-ID: <xrfd2dbhmpiy7ftpztcswba6iyzt3dsajqtr4fpq2iyn6tbeny@4wijspe7n2ig>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <63t_fLehIKEom4-JPN9kAGFEjUG4_yFoHMhB2aEAppwPHb2oPbK666eGkGgXxEAHRJnfTRRUwuf2EqNRYe_gjA==@protonmail.internalid>
 <20260709-vpu_iommu_iova_handling-v1-7-72bb62cb2dfd@oss.qualcomm.com>
 <5c8af0d5-2477-48ca-bd7c-0f2475a9dd62@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c8af0d5-2477-48ca-bd7c-0f2475a9dd62@kernel.org>
X-Proofpoint-ORIG-GUID: TyLaAzpxIILOeV4I1svWxt6FQkmgrFa9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDEyOSBTYWx0ZWRfX0DTjvLXfYCSX
 FBnlZwl/FrBvAGCQiIftnJw4i/+mYfB1eFvHcUuCKYsAXgm7WBmNJWuUjZYBi2tz1Wf+9F2ttvS
 oTcKOTq5S+mjDmbbdZaKarCXg5LguyFIa1E5xw7bRls1NmKYb6GTEJabUqnOQ8Fk47Y8yHvt7Jh
 n4KTjufDGbaGyu/4sE5MS8Bw0oimmd8zFsCc0S9qrQMNU9eWt9g8OfKkXZv+euBtlk7WZCvmqwN
 1qc+3fCVJQaVrvwtnFdnB5D+hhWNRaFnejHjK9fxqPOSrq0eGqjOyyJdNVpLw8N1T0NScu9y68u
 IIlwehEo9+8RENJaMboc60R8HAN3081TJ8qYmsyLyjuVwWtxamtI4lnJEzlnf/U3yJ5IuZnLkTI
 XxEcbo2L/09Zs2I8ky8pYD2B5GpTgMZlxk5GuHpX8YVZkTpzK0C8RIU040wsZJyMWpH1LLN7KtL
 h5WNNrQF9keanTtdNfA==
X-Authority-Analysis: v=2.4 cv=O5MJeh9W c=1 sm=1 tr=0 ts=6a53864c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=XO5u-L0pxnv9NeBEmIYA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: TyLaAzpxIILOeV4I1svWxt6FQkmgrFa9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDEyOSBTYWx0ZWRfX83eaKj6eOGWZ
 N4GfqILmL9cIk842jWTs8OB86lMLLNcMyWC3o/qToVVKdZxEh1kkZ5TIn/KcBXLAtRDK45Tr9M2
 wrPidGnfCzJOxg2AkEKXajznSVUwnf4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120129

On Fri, Jul 10, 2026 at 11:46:58PM +0100, Bryan O'Donoghue wrote:
> On 09/07/2026 13:35, Vikash Garodia wrote:
> > The Iris VPU has separate streams with different IOVA constraints. The
> > non-pixel stream must be limited to the 0-600 MB IOVA range, while the
> > pixel stream can use the full IOVA space.
> 
> 
> > Using a single set of IOMMU entries for the Iris node does not describe
> > these per-stream limits and can allow accesses outside the supported
> > range, which may lead to device crashes. One such issue was reported at:
> > https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> > 
> > Add non-pixel and pixel child nodes, move each stream ID to its
> > corresponding child node, and add a reserved IOVA range for the
> > non-pixel stream.
> > 
> > Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> The thing of it is, this _is_ a bugfix - perhaps its not one that can be
> backported, actually scratch that, this isn't possible to land in -stable
> realistically.
> 
> So what is needed here is a strategy for fixing -stable.

I think, we need to start with defining, which platforms are affected.
sm8150+? SM8250+? SDM845+? MSM8996+?

> 
> That could be apply Daniel's patch and backport it with Fixes: - with
> mainline then say applying this change and reverting Daniel's patch
> 
> or
> 
> That could mean some other solution for -stable - up for debate - what's not
> up for debate is this series needs to _address_ what happens to stable for
> all of the target platforms - and then transition mainline to the new and
> shiny way.
> 
> That could mean
> 
> - Applying Daniel's fix with Fixes: and cc-stable
> - That patch needs to be extended to _each_ Iris platform containing
>   this bug... all of them I think.
> - Updating bindings
> - Updating DT with new method simultaneously reverting Daniel's fix
> 
> And I do mean doing that in one progressive series - a fixup for mainline
> alone isn't enough.

-- 
With best wishes
Dmitry
