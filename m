Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2F9423A70
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 13:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381775; cv=none; b=S8JruPeza49ucQQWPqvwYtyQQHXwJbQBTGqd/NuJQSe/c+211k/i+oF6/En079C84U575+EAca68fFGUtw1KgiWUehXoPGeM4DJo4pw96HDQRXg7SA+/b8fqOE5+FOnhMs2lPzJZqXNURIale3mGDkj/VIVgmpb/eWjotEF8vVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381775; c=relaxed/simple;
	bh=m772sO4CyrysG0gpG6Ls9qDZ97rEnegWhLZDBkp1D8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p2LxORCyQZ7PcHl6qoAEXINwb628Xcq+kxjiWdTNo9Sptf6DoU5/Rq7OZ7CGLi1O5BOlev8OSCWPT27Y6S/5+XNfsqvikSuH577WrH/dieneh79jL/PhJWqqF8tNTbB0UF3Ju948ULnsOR0Uw8lBMlLRyt6kvXDsEyUTBN5DumM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K+djEjs8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KRNXUNS8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K+djEjs8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KRNXUNS8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S9hXlJ2045245
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 13:09:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YYZ/OrtIVHKEhtlNApSiArPT
	0Xip7lxparc3a3qNDjs=; b=K+djEjs8s5s8oj4xdd8JvTFwovQ03p5dhVCK614Z
	f0DUnlqZqP63YU2dV1FQFOAtqIBgvrfrP/UHSLDKvzibPWzxQHzuaGQwl7tRoltY
	qStL/eAEfois2oH4MGB9ntoMUamX0eLsHELyro1Tk1tlvaV2M/hl8DF9whqCBM1v
	37+oD4Bpf3n2pndrJE2OsvWE5DB/zTnMyxTaYER9PFQXw/3KWtCT7arY3XUUAQcq
	a4dHXWmmD/wo97AXMCfMNbfk3+XsbNujMN3z+Ub/3YCWLWiwvabUu+w4+p4x6AZl
	l4x6CgPhfdM1XABt9bE6CV2SKvSrZ90IYxKh3qIwKSJfUg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttgyrrt8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 13:09:33 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12c8ccc7593so14459638c88.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 06:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777381773; x=1777986573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YYZ/OrtIVHKEhtlNApSiArPT0Xip7lxparc3a3qNDjs=;
        b=KRNXUNS8yyO76qKl956jNZwp8rVpsnQb4SKIHPxX3uuSY5sCiHsImyug3Vq/PgF2xz
         HewUjP8q2CrrTrIAtpy6YlQ0J+i2NbOwN5NtUlPywE96n2kNaKH+6D2D33BneokgEO1e
         6lE4RcggY0IU2FdOU/75W5RBBtgYXuvQD1fM2Q29colD/S/FRjZiow1j1zou4TTzOBE8
         ICiQ+ZcvODB3p8aTzlHRXhKO+lvCUO0S2emWEkHsCEMX21QlkSS2mriX7sNNEwOHpBnk
         9KVlD6e34ZnGomSWxj22A/CAgJh2sefrSXPhZMgpRRFyUoFpPXg9nnssjuGFfL3Cseu3
         hiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777381773; x=1777986573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YYZ/OrtIVHKEhtlNApSiArPT0Xip7lxparc3a3qNDjs=;
        b=UAoWjgqxDe6KPejjadhDx5S0ElQ7y3+cZJNgX/jb6AbPCNz1zOIXhniurJLk9LGwxz
         riXAiZHJP3wi33FlKWqZQp/LEiJW1FPFqwWuDrUT8Szxkn9lwY2dw9yK4NpTudXbIixm
         Rgvx8DrNTUncMm4Q7+5nu4Qc03nO/gs30N0bWWIH0KYG1Y2xWBuF0t0j6+mnszWzgrsP
         1kTHm4UNgBJEO6gd5KDfJZxFwoyXJC6w2TkGAbFDLOza+zK58ujC7CgPaK5pR83wc4h5
         LJnqXII4gqin+DcE7F851r6puTOjpmItQRaXKTt1YyjJL+pv8OUkCoPWKEU7yh5vsrNk
         mLrA==
X-Forwarded-Encrypted: i=1; AFNElJ8MAyyvbNUy5UDrE/8oy96G3UMtExyEHnk1Ke1HjMHv3wZctMj5Snf/XLiDDOQa5m+/m8VFNxIOEHll@vger.kernel.org
X-Gm-Message-State: AOJu0YwfAmKRfoZFL7fkrTa1gp1LXGAt7acG9kTlEdKZgGfsItpdo7XP
	YWQohY0lGVMqy6jZfjztWZw6BfR0DyeQ1Rmzz6qXpTySaFi+t8uachr3c8jF27v81LDq67FFN0N
	dpanN2gMjAXn3pTV1i44GXSvCzErALXKMJCcwXF4/eRP7BjTrCpLAcjfnV2xGGISvGSrMBYAs
X-Gm-Gg: AeBDietyNu11yq1g/wYRUVCpg5E0agZoo/c7TZisIwrT85UDVtzAvZ22owTlpGhzBgL
	+7n9NHJRp2nT+Tjny+RWsQCPB1d1hdh8ms977e7vfla9ilJQLqeJgIrB/LKCPCF1oXfP2jy/JqL
	Z25eSznVs/J3QcTwOogjKC0587QL/gqnfpQiVWrAP+mZBDVKASqDGqzTGL+nBuHoMvFjYKW4a29
	TlAzNiXZJMuuBw0GEGjyOQeOsEfPAoUcRsyfirkswM3Grh1t9mec2Qo4IGCXAQYsBorm9NJGxQv
	eHVDvOXfCren9czKKfzkRPP4Y+M78jy5mG167qXH22iV+LUG2yBovsSJOvkA/gbl3cJPmUPdbi9
	/DJNsbsGybHBiqAM2kpKV7JLqyguSsrjJg25mbN2q7KMcas0Xv3OXDNfLHuoN3S9eDL1o2wJHH5
	4=
X-Received: by 2002:a05:7022:1286:b0:12c:8d32:9378 with SMTP id a92af1059eb24-12ddd9ee997mr1169155c88.32.1777381772638;
        Tue, 28 Apr 2026 06:09:32 -0700 (PDT)
X-Received: by 2002:a05:7022:1286:b0:12c:8d32:9378 with SMTP id a92af1059eb24-12ddd9ee997mr1169133c88.32.1777381771926;
        Tue, 28 Apr 2026 06:09:31 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a103542sm2910901eec.21.2026.04.28.06.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:09:31 -0700 (PDT)
Date: Tue, 28 Apr 2026 21:09:25 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: qcom: Add device tree for Nord SoC series
Message-ID: <afCxhUaxLEcbosvV@QCOM-aGQu4IUr3Y>
References: <20260427023455.236410-1-shengchao.guo@oss.qualcomm.com>
 <20260427023455.236410-2-shengchao.guo@oss.qualcomm.com>
 <20260428-dangerous-garnet-collie-dacccf@quoll>
 <e1a84d37-04a1-4c36-b6c3-f8830df9a744@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1a84d37-04a1-4c36-b6c3-f8830df9a744@kernel.org>
X-Proofpoint-ORIG-GUID: te0JtTKhn_32X6YUHxyNxgqtscRMZTby
X-Proofpoint-GUID: te0JtTKhn_32X6YUHxyNxgqtscRMZTby
X-Authority-Analysis: v=2.4 cv=cb7iaHDM c=1 sm=1 tr=0 ts=69f0b18d cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=0Mm4--zdcf-dZL3D6kIA:9 a=CjuIK1q_8ugA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEyMiBTYWx0ZWRfX5afPCMZUFMiG
 qYIYsgu9fJODGzJYP6tFWujfdkyErWslfSlZMBXyBbwrp2+XyU5zkGS7v48G5nrMRmyfdPb8pVs
 ELLJQXlkJq1pImzvBiXdTHIkofyeEo0Lo8RvYJe90YngXlknoT9b2tb9pTbD4T+IhAPVNc3j90+
 OJZEu33uiylwiiKeO5Em6ibs4jphQs1Auzvfg6hY6RUTCaypkcHOqgLWzkPZj9Z0BFaaMBOVfVG
 pzyOxMo7Lz5OaoV6IopSgStjanF/9J/r6aYCtR+rlXtdWNUwedrlSG22TF60kxwh2Q0WDDXWv/v
 AoVt0+GLVdDU30Lx75zFDdgoGzQLKlHYJYuDquz2hN2dWVwRCctdpBaQpK5wquS+mxbGobQvnFG
 YyT/hmbBh9m92nEDWWcpkQjzYFVSy+CqQWOUQ0M5IZsOzKmTgTbac4/nR7oIXXRUjS75fbj7LJk
 mePXxSLmsYl46WPkVTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280122

On Tue, Apr 28, 2026 at 09:28:47AM +0200, Krzysztof Kozlowski wrote:
> On 28/04/2026 09:24, Krzysztof Kozlowski wrote:
> > On Mon, Apr 27, 2026 at 10:34:52AM +0800, Shawn Guo wrote:
...
> >> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
> >> new file mode 100644
> >> index 000000000000..00d189cfed8c
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
> >> @@ -0,0 +1,4511 @@
> >> +// SPDX-License-Identifier: BSD-3-Clause
> >> +/*
> >> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >> + */
> >> +
> >> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> >> +
> >> +/ {
> >> +	interrupt-parent = <&intc>;
> >> +	#address-cells = <2>;
> >> +	#size-cells = <2>;
> >> +
> >> +	cpus {
> >> +		#address-cells = <2>;
> >> +		#size-cells = <0>;
> >> +
> >> +		cpu0: cpu@0 {
> >> +			device_type = "cpu";
> >> +			compatible = "qcom,oryon-1-5";
> > 
> > I asked you to send this binding WITH the user, because they go via
> > the same tree. I see the user, but no binding for it in the patchset.
> 
> And few others like SCM are also missing. I am talking about this many
> times already, to multiple vendors, and I am still surprised why people
> on purpose give more work to the maintainer. Well, not my tree, so not
> my work, but if you ever wonder why your patches are not applied for
> longer time, that could be one of the reasons.

Yes, I should have sent all those bindings targeting Bjorn as part of
this series to make it easier for Bjorn.  But I'm not sure cpus.yaml
change is one of them, as I'm sending it to Rob.

Shawn
