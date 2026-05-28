Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B551E7C18
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 06:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779950143; cv=none; b=XZzFbNavuqGNW83OiEvDsZJwCZXy6gK+FsVb17qXvj7lvr6czspfLipX41xU9MZAvFiAI7z3AtXgGptwF3w10WqGcSNg/Ymjj815GZoO/fKdtZFqPYgcqsrtTdxL08vltX0PsCRURjWODMzd85ZKlYmABvsZJ89rwFDX7NU0h1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779950143; c=relaxed/simple;
	bh=c9lsraxF7MF5yE6tUfHnBFZa9WWpihdkME3ni/W2xQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R6BdF9AHXtU2H58NiqqfplAjds2RD3AL2ODbGPwV4VT+jer5fYRDe8EYa/Ld+LzmoWvq8GhjmdzvQoCSSgGbUQY6v8l54zFLjzHecdHxwAjYceRGZ4jXwxb2wV0w/6nQWqGSTFj/AypoBhGYVcXl2h7y5NaWSm2Nz/UoHKYZdOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IwopzICG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QPx6StsM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IwopzICG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QPx6StsM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S6Va0f3010177
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 06:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ydqXkzCJxOfG9FXBf1HMLa8s
	SWgOAyO7S9cyz0soJm4=; b=IwopzICGE7TpKNQU86K1MoME3hmW3uvZHZGtKirT
	PgRpw1/wuIZaiLUyLcT3b+bpeDna2S5cMyo7aLbepYkECNKaFiXShnZPlHCjXcQf
	9DxIkkeEUIsOvHUvWaol5y3hoM4aiOKd6tZdqnaeDRngdI4oRflzaS6MDe0aCxVe
	KLX0z9MO31T0/y3bUvmxz5eprcSqBhQtVdZJhqTQ6LOt+d7bxOooirkN8g5RdZpv
	TiaHo5YupxK74ASOBrSc3SwprkvwAb0L/kW/u09Zq4JbxKLWEfB8lYdn3sqOeSpP
	H+ER9bXY+Cgarxy+7yxZJObNMTOXGIPEEOntZBQIioRWYw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yrhma0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 06:35:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5165d10e036so220683221cf.3
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 23:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779950140; x=1780554940; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ydqXkzCJxOfG9FXBf1HMLa8sSWgOAyO7S9cyz0soJm4=;
        b=QPx6StsM+VoOU5rzYssvMpWJTnQ/IdC1csvTsyUTTClkwj1fylP4EL/gVToJDZnpEO
         DmmiK3eTtsjbAmADXep3aJga0ijelKZgc7QH27z55hGMTG0rAgzsXCvIRXxD4IRjvV+2
         9WovUZTrJbUW/Fjiah1XqDbA+Dnw2iLyYBsHhTtX3s+cXILDwiA7ApnMNXS5U6r2/sf0
         SdHwtHlAH2/+Q8BC4C72uMWXFVjRcTiO2uLHoPZzcr0R5Eim9uXXyZ6LcjhqmJaXUOWR
         yIDxk9Pc8QFwCoz6LdYBNIZMmyaJyji1ZUuuXbb9nTC34wZ5xdEuQCF5KiFSM2jtq2pR
         c0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779950140; x=1780554940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ydqXkzCJxOfG9FXBf1HMLa8sSWgOAyO7S9cyz0soJm4=;
        b=McNlaMv9ffWwhfoiSgPrE6pWL1v7ZJilWNsVs3wWp1kAkqFDyLBuIA7+BlODoX6dQm
         b8X5uagYxdM55J4Rf5Zn0yc4ekeLmB5TCMiePsxGEKaz8CdH+yXiFuY8hnbdFbRb2Aqu
         mzN47VqnMLNnz7CbjO3ATU8zMcYlmDu15Ed/PmJ04C0NCIpWA7Eo80SUHQFuLzvli0r4
         RhxEcamhbrjAwtURo8nBUwIaargz0/LUaOZMyjlmGV7Laz7avtD2t2pVdLZCTg2BYvML
         Q1SRR92dIqIDvPoRHlzhWCY/8oqHivhJJ8ZdllvmnWmE/+ESMBm3f8QPM7iWExeWQEb8
         6zZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/+LsScMhid9Wl01z/3ZIgCpiY7AybqQIpvE69+/jAo7hQG/YWjpzS1wwOFrSV6NiwSsdfuJfGyBE2K@vger.kernel.org
X-Gm-Message-State: AOJu0YxYo+54/nPRw3LExoL0VYh6v+xpnYS5A+5t6sQmeLfA7bPq9+tK
	ecsPuCr/2oQj1Yq4+L4WZ1FQ0fhoDgIQBO25VWvvNSZzPeX1DLR2rc+Q6MzPCOzpUfukc3git77
	LObrI7dhSZV79s8N/liuK9KAt7kdhFAfo6eckJWkZc3o1ltMnQxJ8wfbN9EndVKLH
X-Gm-Gg: Acq92OHL72stBcrHfs/k2g7N7k5xsHKDEBmFe6Tf741tY6MLiNCjyhfWQPOKrZxNnDm
	cquDrYQ3pX4t/P9ffZ6Lw/ZiOsI8ZJ7ouc2boRBfNri9At8YHu5TCQx+rL3cHTS2Fq9kSaOCmpd
	YykRfXXjv9M/KfP1BPyOdA5BKXBFdJLJdA7mxyJj8DfDeY0vk8LCHddsl5/HqZifoDEOcbfXmkZ
	m8al1g3bjJxTNQ3eI8s7t6x+vjlawaoHDlnnO3xnX+B8MET2P098ZEvGDiNjfBV1LSuAuNwTbvI
	ea+MG4osyz0Bp3TNo2wLXrLVbAAIH3MKR1Q+kv/le+TpKJ4/6+V2msjG1j2XdMY/RdYWZD2wSvK
	FGoYaQQ17x81lCRzG4SpKQirPKsluqNx0cpYPWfv82Xan8DQD5PE+ptQfN47zij1lEbOL8bUQpa
	s7VWhy2r6cuZeJbU5tJhQ/HXXq1G3Wtpjy13pmOks6EpWSpg==
X-Received: by 2002:ac8:7d47:0:b0:516:e0bc:f485 with SMTP id d75a77b69052e-516e0bcf5f3mr290292111cf.30.1779950140578;
        Wed, 27 May 2026 23:35:40 -0700 (PDT)
X-Received: by 2002:ac8:7d47:0:b0:516:e0bc:f485 with SMTP id d75a77b69052e-516e0bcf5f3mr290291721cf.30.1779950140011;
        Wed, 27 May 2026 23:35:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcaa226fsm35385481fa.18.2026.05.27.23.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 23:35:38 -0700 (PDT)
Date: Thu, 28 May 2026 09:35:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: opp: Allow optional -vN suffix in
 opp-microvolt property name
Message-ID: <wwzqpnkhdepkgl6bdmcuwep7v5m4rb6h3vfdbqmphxvmw4ao2m@efgv7wvm6cty>
References: <20260527-expressatt_cpufreq-v2-0-b9b7726ccb6d@gmail.com>
 <20260527-expressatt_cpufreq-v2-1-b9b7726ccb6d@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527-expressatt_cpufreq-v2-1-b9b7726ccb6d@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDA2MyBTYWx0ZWRfX4VeInuc06F4e
 Ovc5RK/TGqXUWdqCv4dAF1uIBBN2A3Hxh0pt2zOcAecBp2FqjJRQ2uhQNXpec22256elhSh/x+7
 lVU7LqIj8RzxYRNKCC4zVpYRImSYdxfg4anhIQepuEAb4z2EWzmXEBlEltQITCRFxz/SRjj13Dq
 Bn5lkbxivHNUD9CJeDrKbklXFPoX23xmlksdOxlwM1OraTnL2zuJH+ID9JYZVG5qgUkW9HXFYBb
 VwgntB7ct85+OGtLEayrBehrezTdqHXWwV+i84FZ6dxvDuNUjHk7ES7TiSAonjBQ40GCjJMtJmd
 BReUrUKsiy5ZUsuDcjldQJj0gSUH1/TJqFnusdIqkg0Vz1BZlUvc+whKg0jdiSPqoOUn5tNZfE2
 xDqHdeZDOEUIbU2StENS+vGUHZfTtQqL7UmPnZOC+QOwa5EhhifkMFqB0+mTmUVa5mMt6jYlL9k
 oi/0xPwTYgSmCNij0JA==
X-Authority-Analysis: v=2.4 cv=PLo/P/qC c=1 sm=1 tr=0 ts=6a17e23d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=jtOVCDSMMUdUVPAGS_cA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 3Pp4lRPf4Xm2-KApj8mhAltLJeOjN5uS
X-Proofpoint-ORIG-GUID: 3Pp4lRPf4Xm2-KApj8mhAltLJeOjN5uS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280063

On Wed, May 27, 2026 at 08:39:28PM -0700, Rudraksha Gupta wrote:
> The qcom-cpufreq-nvmem driver generates prop_name as
> "speed%d-pvs%d-v%d" for Krait SoCs, resulting in property names like
> opp-microvolt-speed0-pvs0-v0. The existing schema regex only allows
> opp-microvolt-speed[0-9]+-pvs[0-9]+ without the trailing version
> suffix.
> 
> Extend the regex to optionally match a -v[0-9]+ suffix so that
> devicetrees using the full prop_name pass schema validation.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml b/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml
> index fd04d060c1de..846f49a99484 100644
> --- a/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml
> +++ b/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml
> @@ -81,7 +81,7 @@ patternProperties:
>        required-opps: true
>  
>      patternProperties:
> -      '^opp-microvolt-speed[0-9]+-pvs[0-9]+$': true
> +      '^opp-microvolt-speed[0-9]+-pvs[0-9]+(-v[0-9]+)?$': true

I think this should be fixed differently. There is no version for
MSM8960 / APQ8064, per design. It is only applicable to MSM8974 /
APQ8084. You also need to scale the core voltages.  Would you consider
picking up the relevant parts of [1]? (also see [2] and [3])?

I got stuck because I couldn't implement L2 plumbing properly and never
pushed the series further. On both MSM8960 and APQ8064 we can scale L2
cache to follow the CPU frequency. I tried adding the driver for it, but
RobH requested using cpu_subsys, but there each cache device gets
created multiple times. Maybe I should fix that in the end, then we can
scale the L2 too.

[1] https://lore.kernel.org/linux-arm-msm/20231002185940.1271800-1-dmitry.baryshkov@linaro.org/

[2] https://lore.kernel.org/linux-arm-msm/20230827115033.935089-1-dmitry.baryshkov@linaro.org/

[3] https://lore.kernel.org/linux-arm-msm/20230702175045.122041-1-dmitry.baryshkov@linaro.org/

-- 
With best wishes
Dmitry
