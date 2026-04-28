Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFC2466B6E
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 13:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381888; cv=none; b=dZlGilRKNDNBL7IfA0wVTFhGz+57P/NCX901Q51mkKF9ufXamepO0Iv+CVzHur/LUr0tgMqi8ezWgQ9tAAB98AagAFdmHQhiIsf0wMypzB8c7tfeaEoxXZ38prEbVLgCMqRTNEZqy5Uf3S/G7uXPRdqJ9YpA7upNpROy9ZFkS5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381888; c=relaxed/simple;
	bh=ZV7gQ+vFpTm462vRo27QptIK65cykKtJURR/0mqEpwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mW5QPmkHegZ7jWZDAlWc/vsEly5HvDnYQGUbKrOefI+KXgkPZv5QT6Dr4Wxf/pLh69ziAIjtTkgKC7ySzvEkpZhDduNVWOyy8oDITLd/cCVgt/dZq1E84RH2lmsM/Yn6YyDCW3aoyG7ORACRi5VVubDPXah5SPTM1wS6btY1nWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IuenkFNs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bksDP77K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IuenkFNs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bksDP77K"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SAhQ9t818926
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 13:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=blI+99Sh7Qr7qWaUiHcHIJCf
	MzzoY5IQsQhu8lkmxlE=; b=IuenkFNs5yI+oKkt0osCDt0wUaVhV25n5hAcHF0V
	URW6M3IHAWQnh7kQQkqHs+a1V4UV0e+ts5XYjdYbDUhiDg8KfnKQ3t7zLdzR7XkJ
	9y27+IO7EoWvTVNwtaa33TRmedPPYbU0xSvMMdedStAImjXzh6ej66x+LOeZtYKo
	uJpBYAE4vGtXC6MvcDgFquPZ2GtDsyrayRy9M/e2EzIQiGWskScZ78idBw7FtOIB
	LNMnB0h7JX2CILYrhQu6+MoRFfPYhZLHU3Ry5mo2SMbrCLYZ+7mje46zDc2yT9Fq
	5469fIzGP2D0p2xksoI5P6FLbWQ6GKya5hJ3FDtJky7fbg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtud20hgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 13:11:25 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so18213051eec.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 06:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777381885; x=1777986685; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=blI+99Sh7Qr7qWaUiHcHIJCfMzzoY5IQsQhu8lkmxlE=;
        b=bksDP77KRrpxmsf9rtZRKlSmONfucuzxmfQMXAmCAnB8H9bXkwkYhfW00q+raQTsc/
         XdhA2Grf4dwRXSpuoJIIzSF5KdEFmdviBDVKdlAfA+Aix9Z5+w5ma7TYra4ZfLxMaPAj
         14mfr6YwSCjc+aCgjLdlhJNUg2SUIWf0CMxZcvrNpBSgWN3wb7a491Fu2gdQBze4p5mj
         tWYW/Yueq7JDuJBuJNmzPIBU3Lp25HIb5OOF6OokUYdgSaxGgcHpIqkK/hS+cb3K8Mfj
         9kjTHbr1y13pm+ZEb1BMuWKW4p/JzPVlqLbL8fcD8U10FttFhJRAfij/RtQYllDpgHCk
         Pk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777381885; x=1777986685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=blI+99Sh7Qr7qWaUiHcHIJCfMzzoY5IQsQhu8lkmxlE=;
        b=rxGiEmnVzpCjLImSMvaHvTfuwYDJs8fKuVF3hE9xbk8qstzs0W1RSdzKRQY40bN06I
         jrHXs49yLj+RaSagMsr6zoWjM7XU6j5fv+yw5Q5wYCSYAC3FwoUbB/KF/qBC6VURDBDV
         1CKzlYFrw6bCBjAPhQS8IOPZyq7T+cxYSi+eOHBDxaGs7qQ+XksgP81Tn+kCiI2iN3+x
         YJCK04AiVEgdXt0ngAe3dzDIGME2I1FyDiB3NCE1Q5lRAmgK4lxImqFJUyBu2VgSYqEF
         zN0XP6CqIYxsi+fDT8YY64+h+et0VOfv01RWFiizU7+o5MzR/m3opm9kI4aRP34rKC7X
         JCAQ==
X-Forwarded-Encrypted: i=1; AFNElJ9BFbGuvUQvPu+a1qhR3AkWrCJn99DDxiPqr/IL1ueN/0hMdHwz47pjO6aeXUySi9mKcAZEdwEbY/AE@vger.kernel.org
X-Gm-Message-State: AOJu0YzUVO+rKiWX5IvyH8jl3flc4wlRwEUALYGEU0WgRj/V4SGzD7eq
	9mZaRRkhgttke9xoxkN9K31Fs6fobG+xcv8jmxcZdJleU8hn5l2fo1sgdfMjGH/qLkD3Kqqbhx6
	jPH3RNt0jyfxbc97H2j2M5QBe/+gRzx3gOjtwwC6PwQrA6pyZfn2weZ+oZS1KWoRi
X-Gm-Gg: AeBDietek26A1GBuuQNrfUcGua1xSmvS0FZI6RK+4k4Ds/7WsNBTnvbJHlSBzfJHTnj
	x62WpONkyAK6cOLh4ro3IQzQDlPKpLpej+TqTF6cUUYu5l70PaRSOin2cH4KYlgPk7EpmV29j0m
	RDso0TqyMOcsbBwG2In/0a6t5SR+Uw/Vz0F4szoxlsq9k8ubZgMDg4tbm8VLAHFokyCcLlPaZ2I
	qvHIXQG9XsJkI2t7qI/BgprwMvQ48lIhioKoqjzfeSSTrvb4qWythdrsCMbVpufQfSbtnTXqsm4
	RSVrppnxCl+kxQgDiEzUnlgHVd+ENjdSWbUksWRdKglqyyPbr2rxMVKdM8yHM54PohvcLIUoDMH
	h9U+Mh8h/1n7j6pgXdjv7sRsRQ3Ux7ORsB7uZrV8ECg+DAkGVnN5b2P0Uui36WaWwVY9moz3RTu
	M=
X-Received: by 2002:a05:7300:e9c9:20b0:2e2:185b:87d9 with SMTP id 5a478bee46e88-2ed0a200d8amr1091272eec.20.1777381884644;
        Tue, 28 Apr 2026 06:11:24 -0700 (PDT)
X-Received: by 2002:a05:7300:e9c9:20b0:2e2:185b:87d9 with SMTP id 5a478bee46e88-2ed0a200d8amr1091253eec.20.1777381883972;
        Tue, 28 Apr 2026 06:11:23 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a0ce761sm2214447eec.15.2026.04.28.06.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:11:23 -0700 (PDT)
Date: Tue, 28 Apr 2026 21:11:17 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: Add compatible for Qualcomm
 Nord SoC
Message-ID: <afCx9Qwb9_gffTtK@QCOM-aGQu4IUr3Y>
References: <20260427011728.231026-1-shengchao.guo@oss.qualcomm.com>
 <20260428-tricky-magic-koala-b21fed@quoll>
 <afCus0_JslMgwdlg@QCOM-aGQu4IUr3Y>
 <b65fd25a-7175-4963-b623-7805979984b7@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b65fd25a-7175-4963-b623-7805979984b7@kernel.org>
X-Authority-Analysis: v=2.4 cv=a/0AM0SF c=1 sm=1 tr=0 ts=69f0b1fd cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=nc39diHjlmVoUhwZKG0A:9 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: ornMbWvqEvaGd8gFuNnWIro-UdyA7lmJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEyMyBTYWx0ZWRfXy+85uTJ9TD1q
 Rv0jOh1SAf99/wA/a1RtIjS+csDgNMkZDMfRQpadO2DfjddGDgOfDTximIS1gD5sOk2TSVe5PzA
 2q36z3P2jWwEO80KkfmqEvjjdYSz6FWkDubwJAox0O1DRZdXT8Df0+mqGLwsQhuB0GY2VPGuzwu
 kTi7b2KZsCWwS/8zu++l45PzjeLX75nRDE0hYbM+1/ZSor45GPJ7ks9peLXEjc2ess/QTf83BMP
 mc3mLXM81b0NuX8aYTOag93umQ/siPNc+4JL0wTCAi5pDJtijulORxpT2uxwHw2GF7oqirHE5e/
 +ulxKwiwcSVbKIdbGSIAsUKg/uT+kdzlJg7YNpn7S7WbArpMpAuvUvc912QwXYeFAwWdXCc4j2U
 Fg1gYNMJa7SnMcRIFQJ5pMh8S6YIreMrPQ6GMirZHnlTqW1OoufjaK0w50clWNa/Gj+hHpC5u2t
 SS2A/yMSDMTHGTIBqMA==
X-Proofpoint-GUID: ornMbWvqEvaGd8gFuNnWIro-UdyA7lmJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280123

On Tue, Apr 28, 2026 at 03:02:13PM +0200, Krzysztof Kozlowski wrote:
> On 28/04/2026 14:57, Shawn Guo wrote:
> > On Tue, Apr 28, 2026 at 08:20:35AM +0200, Krzysztof Kozlowski wrote:
> >> On Mon, Apr 27, 2026 at 09:17:28AM +0800, Shawn Guo wrote:
> >>> Document APPS SMMU on Qualcomm Nord SoC which is compatible with
> >>
> >> What is APPS?
> > 
> > Should be APSS.  Thanks for spotting it!
> 
> True, but what is APSS? Maybe you meant AP, which I think is known to
> most of the audience. Qualcomm names are not known outside of Qualcomm,
> so question stays.

Ah, I will expand it to Applications Processor Subsystem.

Shawn
