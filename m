Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B363A3828
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778673714; cv=none; b=Eo0tpFzdgjHF57bKnOYUKkanQZw/bfzQvOYBpWBVMm4gVnXTnNzpfj7bgyZKQce5+fI/+mzAdx4hDlxqCRKljsU3GvlH+bEJvpYSYCqE/C5HNogOjY73ncjx2LWKmW1EwfQm+QEvDJCZ41drMEtkoERGXbF3zKgRZ03ge1V+Ae8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778673714; c=relaxed/simple;
	bh=l7r4NlK8GxrngcUyxh3lBxyq7gyU1/f8+FQ5izPScLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4TVNfX1SQlGst9JI4HP0eGNr5vJXs1yCMBMMMTNyObr6QNQc7GvAyRhlfl5He7YPVhYSrc3U+U6h/as4SYtL9inVnF1YoZRqfldx0ZJEoRS9TwwZA1rXkB+X17XADa1grWvTxwntzON0urRPcVmklsCiBJWEWqXEDUsM9+bUKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aE+MQUZL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d6OJ/yDC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aE+MQUZL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d6OJ/yDC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAWHCG978465
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dY9hc/f+wkbZ17ghb1zJTtuvuVvCHXDi0+lDIqQHkRE=; b=aE+MQUZLedjmQBPB
	2BqLbPF6GSyByNBJxAaUbm1GE1qS5HXaBSw91lS2ITm6Z3T8RnnJ0kM00Q863Mb3
	uA1nRsnUADS2ZtGAEwAGZ0eff/lYSrg6hBUu3A30R0sy1lPWpUarou2TbM2VbJgZ
	IkhTivRoAwQJiV581iETaWS1IUkcgofOPlltGBVNN7Ctg+S68TPUv8gSEUJXVcWW
	E1z5xHH+lonY8b2PQX2nyG61R+q9CDZ2zDetrmcLfb+j98fmg7iPCvVGF88r7AUX
	Qh4p1JwFsH3DNlQYFjPyH0QAZqAhYx+6Nor/o6nQoIldsGrtk18xnaAr65Uhq9jb
	kllIDw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e46s9v4qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:01:52 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e3a5fc58feso7992896a34.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778673711; x=1779278511; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dY9hc/f+wkbZ17ghb1zJTtuvuVvCHXDi0+lDIqQHkRE=;
        b=d6OJ/yDC2/OW1mtlRyHckAU8NNoD7ncQcp0Z5WBGI577/McDJpihbUEwJN9ayj0nzp
         U6sYO4rv02W1+jQwQUgL3IafSdvxe2hGwYZf6g6T6e9bxG125U717u1KWj02AHJkYLIb
         4LIHnO8GP1x9PcBJFkmxbhvL7G69dNj0qH0jtE84vIwJA40zQdYqQJk+n+10lhgJll/x
         EYQDYoRD2osJMUz9fPhQVp12Jwq14qn1Xhs8oE+WaBTCBEPAkWQgxBPC+2ELXEvQCZud
         JvmTdaoHzc5gX78A1sSpugtuIragGrV+KY9p0gBz7F8Mn92NVTi+G3MItFBUrJOsEgL5
         SCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778673711; x=1779278511;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dY9hc/f+wkbZ17ghb1zJTtuvuVvCHXDi0+lDIqQHkRE=;
        b=R9pZr7sZk8U1tIamq0Zxu9W9oEVWDn3RBICg8Jy3Q5Vhk2FcL8h5BoxqFA/KsFsoAn
         AZcr+L29POAKPK0etqfMNw/oWN62cWlHnCg8ZnV7cfVDTdALoSHaAjqWSUGYZXPqJ+TA
         0aqNwCtuhW4MaCjE1uTtZo1C6wT1Ky8rKVQAvtJlEZJ225x3cRRXSd64NFMHzBHYGE0v
         fggP4QzDHVJZshMEtE5s45Kz9rJSqJmP7tGFmy8ZkPn5atEnGBeGfIOnE4E3FfvkEFqZ
         3K/j8m8OnD2Y7MkIi+HJDcrayzozXLt+jzTCZPnl8nfCTEcaa+Ss3iKK49zWh0lGfOnn
         lhGw==
X-Forwarded-Encrypted: i=1; AFNElJ+eiil/9hD6Qneu3BEhNNznYNMGhJlxj10fIL1ZCNm4VrdN4zODHTgS2cRHvFzQITgu19kbicx/J1AM@vger.kernel.org
X-Gm-Message-State: AOJu0YxNjcFMXjHMSFxuZ70E7Ka2+DHldHJx1Ic+y29v+dlQHnsssuoM
	Q6yyc2tAhkVAf6bu0ilPCo6HneuHV9D9Tf6+HOVJ/LQFN1AQLLZTd9OPcavIUte3sv1hWIueO3F
	Iww2e+otbTgLH+V/SV2+qxvc+AIEqvwePsyV4nxrC8J69/Ip7i8y3Q/OqFIGdWXFw
X-Gm-Gg: Acq92OEfjMCJ65YK+JC2jECdfOdkOyCZfMGrj9WdiOotp/DPmlcyKW92ZgfeDO9O/Eu
	aOWIVoXi8xDex3tx/K03/9xv82GuwZDFXmf1lpZwZdzcc0bDCGA5X5x2ok4vqR91JOygbYNk4Dx
	82cERXRm0qi8EyLTJnq+/MjE2BYAfkpQ0wpieo3lvnuRAc78U0EJYP9FQp96GVWyswaDFzr5iom
	yYuI4VSTS8U+I7yj+ExvHNpd7KiEhq1c3kXHSxIekcUi6Uj0HINYWR+7ywnBVn7GjL72BG559GW
	WU7trV9qdmU0Ga7FGSs9HyLfQsYBhQj/q1I4dQ4mAWxta0y/DfhYuUnhKfZ6UksXyI/wSdwZ01R
	pnxfYpVh+o0Oy5EuqBTUSZI3Yzfp1BgxPu9dsXNYLNuaboTb0MMoNl5A6JPqXc84gvGWbnqBLkq
	vYRAI++ExQiCifh7VNPODaPsLofoxAwvVIPrc=
X-Received: by 2002:a05:6830:4998:b0:7dc:3d7e:40d8 with SMTP id 46e09a7af769-7e3da8411cbmr1739043a34.28.1778673711225;
        Wed, 13 May 2026 05:01:51 -0700 (PDT)
X-Received: by 2002:a05:6830:4998:b0:7dc:3d7e:40d8 with SMTP id 46e09a7af769-7e3da8411cbmr1738996a34.28.1778673710670;
        Wed, 13 May 2026 05:01:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951cfb4sm4026836e87.20.2026.05.13.05.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:01:49 -0700 (PDT)
Date: Wed, 13 May 2026 15:01:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, robh@kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        vkoul@kernel.org, olteanv@gmail.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
Message-ID: <t2sw6owdxy5iyodjqsldbw6bfaqnezhgvc4hhylxuyrrbjkjto@iwf4dr5nmot3>
References: <20260512-shikra-dt-v1-3-716438330dd0@oss.qualcomm.com>
 <20260513042836.073F9C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260513042836.073F9C2BCB7@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEyNSBTYWx0ZWRfX3kNQT6ftRR1C
 sRS3AjlZgz2x3wDLIytdXa8fYg7FQroqOE+zlNb4g+tmFZClOHYHYnjXVUV+KWz9Les0OQEkV6E
 2zd1LSMjDWMzNaHogPdZB9RSWGJSg3TUHCcCvD4wAzrXcq0x9EkhJCpCrG/w4y4N3jXXojF/mjV
 EN8rYb4I+nKx33zaro/BsRhdK+hnyafU2SygxzbMrSppI9oxkJu/Co/P29D/aaK3kRrJBe5GoNQ
 a3wDIoR0/r/bqV/RuoVyAzkS5jiZEm9zCSuEBzFDG6qd0QFewiqAOoIcy6HLhlie/HQDQi8I1I9
 /UD8zq0KbLhAJofZfbPHMcYSLIJBHbckGVWSYbOnK8QB0VWikYJc4kdcGmjASVmdmdRiuzKFo9Y
 g/VQJJe36Q2bl44ccghivyFBR2i8k/w/LTjPtmhpn7A2MwTUCvwCxxbUntj/xhUNmPutLuh8RQS
 JncTaX9WkS8iOy8rdjw==
X-Proofpoint-GUID: irKiCChdXB4l1sWaPffPxog66jTro0dT
X-Authority-Analysis: v=2.4 cv=L68theT8 c=1 sm=1 tr=0 ts=6a046830 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5d6JBiFWPPR-1DGLDXwA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=eYe2g0i6gJ5uXG_o6N4q:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: irKiCChdXB4l1sWaPffPxog66jTro0dT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130125

On Wed, May 13, 2026 at 04:28:35AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The PMIC regulator definitions omit their required input supply dependencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hierarchy.
> - [Medium] The device tree inaccurately hardcodes the `compatible` string to a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicitly identifying the actual hardware (PM4125).
> --
> 
> commit 457abf6e7ac410430c866842e08e602ec3daaa51
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> 
> arm64: dts: qcom: Add Shikra CQM SoM platform
> 
> Add device tree include for the CQM variant of the Shikra System-on-Module.
> This variant integrates the Shikra SoC and PM4125 PMIC. The DTSI includes
> the common shikra.dtsi and adds PM4125 PMIC regulator definitions.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > new file mode 100644
> > index 0000000000000..401e71720519d
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> [ ... ]
> > +&rpm_requests {
> > +	regulators {
> > +		compatible = "qcom,rpm-pm2250-regulators";
> 
> Since the commit message indicates this is a PM4125 PMIC, should the
> compatible string include a specific identifier for the actual hardware?
> 
> Using a specific identifier like "qcom,rpm-pm4125-regulators" alongside
> the fallback allows the kernel to apply specific quirks if PM4125 errata
> are discovered later.

This can be ignored. The compat is a leftover from the historically
incorrect naming.

> 
> > +
> > +		pm4125_s2: s2 {
> > +			regulator-min-microvolt = <1000000>;
> > +			regulator-max-microvolt = <1200000>;
> > +		};
> 
> Do these regulators need to explicitly define their input supply dependencies
> such as vdd_s2-supply?
> 
> Without these properties, the regulator framework might be unaware that the
> PMIC regulators draw power from upstream supplies.
> 
> If the kernel dynamically manages the upstream supply and its reference count
> drops to zero, could it be disabled, causing an unexpected power loss for
> downstream components?

And this is a correct comment. Please provide missing supplies.

> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com?part=3

-- 
With best wishes
Dmitry
