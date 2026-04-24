Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDD63D090B
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 12:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777035322; cv=none; b=NOi8x5P89Ym2nP6WfcIs8hv8lv7TSPzR5GNMIAXaINu9PIQDkgtwwe2I8A4kWX4blCkGCYw8TIYlPmQ4VxAoaun/C13wpGfuETy+gzve5o7BnOFErhBmLG0j/0ej3OycZm/RlSfXwkLgT377orZTLl4A1no9+OguSfRk4AH4puo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777035322; c=relaxed/simple;
	bh=SMWFUGavbE0VkV3fmehSGnnelO+VQoVhuLxrVUV1NJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bBhMS1+oM1m9SkKaSY3Mj/kWreVAe6ROQ+hVp6PKPN8QhM60Q5fnAB/rPI+8K8jTg/8oF5WVLuE8Fxk/b2yfZYhHWiQsVnVff6vV8awmW+jZQFJMA1XN++brdWcLaN6sAkrx/PIss2rMxKaSl7lVCL75NuUSyaO3TVKl/n4qf0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h7H627hj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LMMMyiab; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h7H627hj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LMMMyiab"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OCgkUo1822923
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 12:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zpLKuxXcZNSD9Vho3/l2L+f7
	A1uq769GitjtFC6qSuk=; b=h7H627hjnNzIT4c2kGVLnScxEsMoBp4avuK/E/Vq
	nHgRCQvHezOfYS2SpWo+6rP514C5dJCbGn6ryWrCF9l+VPYy+ukb5wUlUq13Q3RO
	Xr7cNqADfWiwTGzQJ9PoUupLwtNoLe1W9Y/SFZ4XBCyNiBTUBc7OfannRQUj4xWB
	tNk3aPmZ1+0zEJWl4QieEdBNTgxYK404wsALEvtUW4TmkisADwN0ej8yuVji+EyS
	00CmK8xulfKpL3QoVszjG0Ta9r2J3Qh0I+bDCScT1oCmt7kP7V78xuSLOQhjp6WB
	aYQhUGAcHINZLr5ZBylrVowY7OWf83qmj82YktxH6aoNZw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqv5ru3f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 12:55:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so9585722eec.1
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 05:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777035315; x=1777640115; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zpLKuxXcZNSD9Vho3/l2L+f7A1uq769GitjtFC6qSuk=;
        b=LMMMyiabSEcuqx09Bo3e3mEzAahpzlydP70Nw6bUedv92Rx6Un3lH6zdHIFyOcsc4S
         CsHsNQDFj4lFzoRQtw+xtKZ8SKdKtcCMTOA2UCt0TsfVM+I10YHUoq+8k/O2/rhatkEb
         UuMCnMk7E+b7vWIA0WjFIxSuG2PheAaJIJeInjofZOwk6Xrmt5yXeS2nvPWsoTcfjV/H
         Vydu1EEyxUeR9L7sUzp6krox42spVl8Lc9zdO5ZLgCYT0RjCsfP/T4eDTLClHRhNq54T
         ijKVG/AE5RrBmgHcu4OolpfpJ3ibRFtF/Aa4XlBCn9zUzVGcK8b8rxcvuAP8SL1722hT
         XlLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777035315; x=1777640115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zpLKuxXcZNSD9Vho3/l2L+f7A1uq769GitjtFC6qSuk=;
        b=SHnqcj9zWlVyOlXMqhxWYR6B/kKZCiAG8rFQPpPkGH7vk6MSZrKnpZGFdwUVj/ppV+
         m1aq70P9KGMDC1944VpFBohhpxqYKpUvQ2cpA4qBm8ByHYbEPVc/JaYpCSwX5vCyJBWi
         HxCMINAqQpJcFqqiTErAjmgc70EqO1N/8w0501PcrPTUMotdCgqhZRycwIpPYgvF9CSL
         yogX3xgq4ZAf6N7fsyWnf9F+Lj5YL2JAzXD6YHwbFVHC4Gvf6tmztZTvQ00fIUecGfem
         z1ZZp8ta4b/GbE7R51IQJU+0vsBS3LJDgOYTGR8TkejxA/rPWOlPwPxAIK0xwBK8+opw
         kS8Q==
X-Forwarded-Encrypted: i=1; AFNElJ/9hMQ+9jHX2/WkFthla70J/isM2d8D1eT+v4YZymAiGu+Q3NFg6SBhwwHOiFBzOO1+BMch70SVGZYA@vger.kernel.org
X-Gm-Message-State: AOJu0YxWrnrAvkWkRwEU2OiYTA8q+5moCgCnTWbYRiA3jS/2pW3Ka3ot
	Rfa+R//crRGF7yRqSfm36qEUFSZlnzo+g7sUDlToO7Q2Wi3DRQAGyzGAW3r8cz/dK86Xu8+DAe6
	F29kw1pgxCs0A1kkY8oW+foQ8cKvQiGk98KFK3I9YYQOM4JbpnIAYKtnfXBFjsK8Z
X-Gm-Gg: AeBDieuxRJy3Pl5XcBECcgtv7nJFY0Sjl0AzJs+X7bU7yEE9GDdX8tBgNel0YQa/rqq
	WPDg6xxeTXaSh141qJMmP+2GrIl33Qs5ntbU4NPTCfOMdNhfcwE5topxhf/9PO0Y0wcUeLIlEHg
	ElqZjhAtwVoli6QotEtOND4uUOZq7BiAg0DP7OHFq44R6WbC2aZtgwDg1ZMiuQgIEocJ427KFJg
	oXexX2aBtyScI49LchPjv9vfYK9LKl4KIidqYwrj5SJ7yhmXGYGHHj84Q7b65vYwzBwRderIgpA
	H/hoUgje6Pffq7uxKjSEfGTARE2x7ymoGqHbYlC8IqiKvo3wsKS/fSeCUNc4/ZpT++SmbcxIWt3
	IQE0vhRqD05fV6eaSgUFXrb/H8Ocy7FXCgq5GQi8x+xhu0vTU/EPFvAVI7EpVAxnEjHCJDxzTk8
	0=
X-Received: by 2002:a05:7301:168a:b0:2d1:815f:19c1 with SMTP id 5a478bee46e88-2e479c0427dmr15313620eec.15.1777035314743;
        Fri, 24 Apr 2026 05:55:14 -0700 (PDT)
X-Received: by 2002:a05:7301:168a:b0:2d1:815f:19c1 with SMTP id 5a478bee46e88-2e479c0427dmr15313604eec.15.1777035314221;
        Fri, 24 Apr 2026 05:55:14 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d8b944bsm31824043eec.28.2026.04.24.05.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 05:55:13 -0700 (PDT)
Date: Fri, 24 Apr 2026 20:55:08 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: thermal: qcom-tsens: Document Nord
 Temperature Sensor
Message-ID: <aetoLNvH5jeK3Cmo@QCOM-aGQu4IUr3Y>
References: <20260420065409.1249030-1-shengchao.guo@oss.qualcomm.com>
 <a4f6b7f5-6566-4c73-9c4f-e43c3cafa75a@oss.qualcomm.com>
 <68723e33-53ca-4a66-8777-945cdcfce6fa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68723e33-53ca-4a66-8777-945cdcfce6fa@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=LqiiDHdc c=1 sm=1 tr=0 ts=69eb6833 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Uo6MfCy8GOolxduyRh8A:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: diQMBO-10PIYCSzAKrXL6EyAVm9LXJZe
X-Proofpoint-GUID: diQMBO-10PIYCSzAKrXL6EyAVm9LXJZe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExOSBTYWx0ZWRfXxpRLr01FZkMj
 PwHuzuwqmEnhbiMXQwXVx5op4hYVJCkAa0rvJjDwVFOCu2d1TbFij8boItzjnjARMluMF0s8+Cz
 x5oLascY6G4ocpssjyehbi9pSbF0VQkaD2LI5JsLRnRgFNgGoFM0E9qKvaorrV80PZzTfBRUNwp
 CgM2KE+U8B212xelVlwMIKYfaXgg61IJ6XBHNrwTmB/XaRJMTy5RI44HrE61U8xsj5OhYRRBx1J
 HUt3YMSg9W0bYaW32eHf5arqbrXPWa3Wd0HENfDhvhKwCekcSYrwINduCojeq8YkQeDTa3p1NNC
 I/6vfiorhYe3A4GSSL17SZCN6c3Ng+FHEwq3bIHIF/BOkxETv0gPqbO14dAo2unmVPyGNuDi2j4
 HO7MLfsz8wquSO5HvJILWZpmWFGpBbH2egVCJESZAPapfzjq98i2zKciAYnFNjDPwL9chFaE2NZ
 5txMNsflZrs8hXZ4fJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240119

On Fri, Apr 24, 2026 at 02:12:44PM +0200, Daniel Lezcano wrote:
> On 4/20/26 11:19, Pankaj Patil wrote:
> > On 4/20/2026 12:24 PM, Shawn Guo wrote:
> > > From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > > 
> > > Add compatible for Temperature Sensor (TSENS) of Nord SoC with
> > > a fallback on qcom,tsens-v2.
> > > 
> > > Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > 
> > Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> > 
> > > ---
> 
> Krzystof,
> 
> are you ok with this change ?

Hi Daniel,

I plan to improve the commit log per Krzystof's comment on another Nord
binding patch.  Hopefully he will ack the new version.

Shawn
