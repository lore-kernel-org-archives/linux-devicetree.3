Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD54395ACC
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 10:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779358869; cv=none; b=pkNN8EFpAFCee8xgHvf9tBayQmvut1jfKHslIsesqgsJigNzgq/52Zg67OPElHLG+Sc2Qepk1ebo6B6yo/fND6pDQSyHFqb2wgpv4QZB7sh6A9zsLcnCs6OdU8lKqNTUmTnSZFSnq+FcXJYxvhLjPJM/QqoNGrx+E7m3Fca6hnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779358869; c=relaxed/simple;
	bh=GlKwVxIKRPrLXP2M5NJL6ousDoY1C7FVqTiZqRGfsfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B+IdNjQNZlEQMIm1N678c22kq4OSezdhWvwuHTswTE0zKzFjj9d4gGmtYemUyf+kjwlkOil9kxlD7hTeuOl77qrm8ynISeoqYtOhbdyPg/knKfo6lkeY8tEgw1mu8JYNj8mT7f8vzHgHTZviHNmGvvOVUUmPUtWARBhnAamdTzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gVbyJk9Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZCyHGeaS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gVbyJk9Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZCyHGeaS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99qGk517858
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 10:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E8AgKI2FPi0wA1YJ7p7PafK1iciweieJGNbDfdWAWDs=; b=gVbyJk9Z9D3fPJva
	DVBd6GaFTX8IPKEAEAXQ2Q3gNWF6QF5AMvP4ZL3G6ovlJBzsTu0TcY1ju+Rqe7X2
	tNoDNHq6G7w6RSbWC7c0LZifV6pMwKmXbBgidAqIrAXChCJCyBHdB3saUSRil3yf
	QyLRsLoXYAX+Z5G3+N2NXhKOE9B+dB9Ccv7mSCJ8OZN7p1dJoahWbs7/U7skzQ3a
	QCTZ7wSGY1UqiMd6q+3YuG8ffA+r2WWCme6yb7iQ4fM432g5tPwZ6Hfwgjk9ukmL
	wmLPdPW1nR3zkPd88jFv3zO9+Zzlc53L4hSpDz5Hlgbv6uSSp+CNPm5efngfzxM1
	JLRqpA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9saa1r90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 10:21:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-90f5edb7516so137717385a.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 03:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779358866; x=1779963666; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E8AgKI2FPi0wA1YJ7p7PafK1iciweieJGNbDfdWAWDs=;
        b=ZCyHGeaSHtN/GPuaIqbdL66UGMbsURjzWKRsKL7Jepm5JB/m3CCpzqONObf2ig6tlz
         q2W6pzCn4CM4oTxIllLuIHb2KrqPQa8+dSozwHda7dE68FdYUG1RpYeCF9WSUElJcTKG
         W3m0BFhkWxXUn4bH9i3vk5H4zLe07KDD4Ok77e8dRrKT76tbTfkoEM0RAsg1SZGOND9s
         +sWtz4qJcWRTGAzqDlywEa5xS9yiBlzCZ7ChRASld+GgbfDFPpqrnwHR/avLUmKFh2Gp
         n5Z9u/QSdo1zwAJPHkQzB+kC/TrzHLFgGvJv5VECkgiFb5YLwSwtx1XgsbVjaGrGtuEy
         3WjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779358866; x=1779963666;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E8AgKI2FPi0wA1YJ7p7PafK1iciweieJGNbDfdWAWDs=;
        b=VNvZ78lyb4d3Vl8DRmlvG8dKW/sBXhoIbdf4NNFUphl7oE9ni95aXAff1JrJ9YWJkv
         6EVfWumrVDA047cTFK00+6F0uGZDEtu/j77ThLlMn/WzedvY58ar1biqkZqv0wXBEhK0
         PRo4YhyILcW/BHdE8FcVmhnCDj7fFmH3wvZVvqFFKWhP3y1wxzzgZ8BRHsQQgos1hSfE
         lyFc0a00tO9GJTKMWj/tWU87QwCs43rz4kfHfTR00f5bbg7A+rV8fSZ/WFdrsxNAiuCO
         ZExNj4mMjTtssbZggCdFHtY5HGBuY+Bt/Nt9IIpL7jlXsoqJWSX34RIX1vfRJc0Ba1K+
         XGmA==
X-Forwarded-Encrypted: i=1; AFNElJ94CQeqyH/LVgvwqF8zcur1rihZG0CV/4Bq0Y6YSlVujgr/CMexaTdhnerCLEQKMRF3oqsXUH0TEHGR@vger.kernel.org
X-Gm-Message-State: AOJu0YwlqUXhU+l0cD1WTh2G+PQorN8aJ1AmCrTLFK85XH+wvVKxziQI
	F/hn1q5MYsSJ0m5VOT96ITBlVUgrRmJZ2dxt+W42uIAKp9DCvK/cn/c8CSL2Ms5DMlB5JI4vJPt
	Q8wkNGP6OSJzTkyzWPDNOOff9nJhZeJtyU4XUUSokpq9K730AVAGrkUxsbWD9lIG+
X-Gm-Gg: Acq92OGM16YWlkm+z12jY7woeUjWibLKq6mnMptwfFbJFK3UJbE9BWmY+u8el+Ct+NJ
	v/bSkxfdisnYiiieJibXomJ/KgeAQW+vj+yXYjFJhcRPxBjQTDtR4gArGRUcEnkjiIXr4fPZvcz
	pnXxvay0zGhCQK6FCxwcaq7d3s5RXS7P+uhS0zMpykagyzG5ICMSORJpR1KFMi5q0ytjP9RbAwD
	iCX2M2doer0PDNYj9Ofe/hYsupPH1HOhzbJofVeOUwVL9lSOJiP7Y9YMpa2P0PdMsbH4BZEtfYt
	iMs6mcgxEfDwd6OjK5Wc5wB59xr6y1kwmDAnczb3cRM17ukrdffGE+4zmAXAPjpdGG6WAkycYwK
	E/l1Rj05IudoBCQ+F/yEXoT6H4mU475pHBZ6NPQQHN6RnarggYscPsQKajsZdf0IvMtN20uoNUI
	ueQbg=
X-Received: by 2002:a05:620a:44c1:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-914a2d26193mr164014585a.6.1779358866582;
        Thu, 21 May 2026 03:21:06 -0700 (PDT)
X-Received: by 2002:a05:620a:44c1:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-914a2d26193mr164011885a.6.1779358866118;
        Thu, 21 May 2026 03:21:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8a4101c1sm27619166b.35.2026.05.21.03.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 03:21:05 -0700 (PDT)
Message-ID: <1f8f46c7-8332-44ee-992e-0b9ca1c0ffef@oss.qualcomm.com>
Date: Thu, 21 May 2026 12:21:03 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] firmware: qcom: scm: Add minidump SRAM support
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com>
 <20260519171442.1582987-4-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519171442.1582987-4-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEwMiBTYWx0ZWRfX0A1vSi5Clvb7
 CX/W+IIEW3osqV6hSsm1/Bud395LAWntVzKgb9zVmuYQd09jY/YSPeasDFSMJ4mpCOp+hq5mYVI
 T/c5/TyinaZKc+kVt7u9K4Ici/y/f69OLttq2nHE3N1vTha7IhRPgnO57JFdimz3gD9DxV5kAnw
 ECE+LxbQGlzn+BTo7ZvCno7ATlEm4rQ5s8V2jocYRUPIrMncIAb84dSJi4i0+Ruv9fJIy0n0Ayt
 xDcffQU+6/H6VPvnhFqCc0U6bN+X9FXcLdgBmmVo7elbHoVduk21cgnxPkGqyV8MUhrmfKm5iHn
 GIChUgTOziGGDiY8ohb+gRPKk9YWmNRVKVuI6k07U5wyJBxC3TEUn/V7LYbaJKSE2LM4Be/brzo
 pW4NNCHQlz8Nkn+HdWELkBU21oSTEVGZnuOmi3yni4w3vAt6B5UKyxHzeCXmHHJT6L5YGjQXIOp
 RjPTxr/+e5n7FQsUI7g==
X-Authority-Analysis: v=2.4 cv=Qe9WeMbv c=1 sm=1 tr=0 ts=6a0edc93 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=y6rW8TDjuTIuaxCCkQgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 5IlFHX4YL3ilPmNndOQEZ2nJSyH2wGLq
X-Proofpoint-GUID: 5IlFHX4YL3ilPmNndOQEZ2nJSyH2wGLq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210102

On 5/19/26 7:14 PM, Mukesh Ojha wrote:
> On most Qualcomm SoCs where minidump is supported, a word in always-on
> SRAM is shared between the kernel and boot firmware. Before DDR is
> initialised on the warm reset following a crash, firmware reads this
> word to decide if minidump is enabled and collect a minidump and where
> to deliver it (USB upload to a host, or save to local storage).
> 
> The SRAM region is described by a 'sram' phandle on the SCM DT node.
> If the property is absent the feature is silently disabled, keeping
> existing SoCs unaffected.
> 
> Expose a 'minidump_dest' module parameter (default: usb) so the user can
> select the destination. Only the string names "usb" or "storage" are
> accepted; an invalid value is rejected with -EINVAL. Changing the
> destination while minidump mode is already active updates SRAM immediately.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

[...]

> +static int qcom_scm_map_minidump_sram(struct device *dev, void __iomem **out)
> +{
> +	struct device_node *np = dev->of_node;
> +	struct device_node *sram_np;
> +	struct resource res;
> +	int ret;
> +
> +	if (!of_property_present(np, "sram"))
> +		return 0;

I think of_parse_phandle() calls this indirectly already

> +
> +	sram_np = of_parse_phandle(np, "sram", 0);
> +	if (!sram_np)
> +		return -EINVAL;
> +
> +	ret = of_address_to_resource(sram_np, 0, &res);
> +	of_node_put(sram_np);
> +	if (ret)
> +		return ret;
> +
> +	if (resource_size(&res) < sizeof(u32)) {
> +		dev_err(dev, "minidump SRAM region too small\n");
> +		return -EINVAL;

I don't know if this is possible in practice

Konrad
