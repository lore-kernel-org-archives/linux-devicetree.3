Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6572FFDE1
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 10:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236368; cv=none; b=m63tbfi9JHfbjvNM0TaDmGhk+AIjSnM0O0qMJdIwwbXactxWuvQ9NCN2ueATpabj/c++ARYhi0iIuAgwcXhllgcYfWgD52lNzQzyru8J5UmMLnbH8bDOyKD3LcZPFnUxXy0hVJSF9OF5d1V7P8sMtm3PSgpFnfidYv/lFEQFN+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236368; c=relaxed/simple;
	bh=XFgOhQSea8H/x0Y1jr/TE2OHafMyIAqEOhW7qRyIjKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L2LfO/NKWSdUTWwdIyh+85YFMP4pQnnB6ncrheNrTxxdWp4ZEyXgvlym7zQLfriDO2v6x9zQXey/bl9HUp4tR8A31Ns6X9F5rfZBHoklHKQcCirOE67txT+T4aFNQuHBbk5IhWdhLr9GkUHIFT0Rs+9uUr3/alTd3wsnd37We6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y3cNzZTy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D43va9CY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y3cNzZTy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D43va9CY"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486jGoC257852
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 10:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	88KTNTZQBYZHxyZCHSKo558FfLLokQHJQxk8gQgi94s=; b=Y3cNzZTyONFzI6nD
	RRoYSXq4Yo6i/4bvOB0el/qeSnOg0s48t3R5isRqEWv3KtnoXaUgueHiw7OJV5s2
	WVNKeB+OZ73vAKO+nb2ORPICMlF1bTlWNZDW5IzajqNlhLY/nmUuVSFC4qIjmz3x
	5Uzur8ETia0DEe54EAzf1TpCli6lunwWBAtsnqtwYwWLdK0Mif448/97sM5uUaHh
	HdhoCgkkfU+F9Wsw1/8uHai2Mc0vfkgW3eOM5j2I9avOy5b07oZYObgFM1eafnbu
	O6EVEqzDaXPdHJW8QmMMrx64WAkIWKGsxSmt4u/fhGuU8pomyeFptQqPm9cd+KBs
	gxd1IQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1auegu8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 10:32:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8eec753a7bdso59647885a.3
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 03:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778236366; x=1778841166; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=88KTNTZQBYZHxyZCHSKo558FfLLokQHJQxk8gQgi94s=;
        b=D43va9CYoyrGrUlJDN98ImOIOjlRASiZf/2OL1iCwZ6QU1GsTnPsfJU9i94r9EopeX
         32PXmEuT2gNk3cGiBe0noUGQ6ixDSmirYY7k0E3ibdc1P8HPOcVbO3KhRhg+xfNaPbFe
         eeo0mCMOc5GcxqWwpsWbHeyaDhfHpHTLlLH/3UEB2wjh+GLE+hBwFid2Pw4XPYujJBrn
         b0W4ETU7ZbWiqmWYu0YvDusbQtzvF7jn9cCP2KRLy3sk1kozEOG9M6GgLgFzGIH1NabJ
         QBMFE0nXcgESdr2TGAZc6oHbEvnNbjcSbtxaJlmqUsEeHDnTgop2LjnqIOhdiDwWRRdZ
         tDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778236366; x=1778841166;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=88KTNTZQBYZHxyZCHSKo558FfLLokQHJQxk8gQgi94s=;
        b=RduGvnHdI3OoSJPoK6zEf6E0Z/jG5GLToPWTb9201DaHr9m7Vu1+KdGmiJFrCG2VTl
         xuDynlkRr2HtlTNEr0y0bJZtCVW5/KXYDAhdK2g+NRhxaeLGL33wUcyVEVRqgqAP4M4T
         SDJkZC8XkYzXqTFPuAIePLRxLj63TJB+oJ7Dlu2ulagm2cK9iKVMu+MEVPhieEzogozj
         gIh6hj8xQLvcCs5Yd+IWRmbB9FNJL85w1664yi9QI5xfUM8zPXxCjbvJAKRuY63WrRax
         4Vb6pbOztkjUkm1dpZlRubVoIcIfZ83QqGBTxH5oONzxi36qLsvNX4IQBKdLpctrNXJ2
         70tA==
X-Gm-Message-State: AOJu0Yxqywwf6yWMlApvC4klamvBXKW0DUfCuwHIa4MRS4ALonVuWmRm
	oso4jQJ15LKNtVoOsiRWq2WRJZr6/KLLWqB/SClq78AFuLgx8ym2O4nW2K2qrBfiJRa9N5MV9M8
	iASJXrSox5rNHJt5WsFKPj/ot3B2Ypx1N0C55u9rbuClOhLPhY5J7gC4UM+Q8OVOg
X-Gm-Gg: AeBDietCxck8VcWyLGim+EbQejhfAaaCFGkMjMu7Lfw3Q34KT/77ypYr2AxpecE7hAT
	BBGvcZmrgDPdYZiqAa97Z/XyfOCvtHhucN5IQAiDTWgndY1spUEygwYwumlpzq/Ek5BTidDBl2H
	HYDtYKhmUOOaV64qY024ZfITnndhoiCHEmPZ52ptY7E4hhu9aTrKLsizJPJQznzmnrw/fUu78TO
	t+AsSNg7HNw+wL0J8UVVbcDWRjvFXY/XIYYkYnabw6JKJETEoyfKqrScZReTL0z/xlnHt/5jeUh
	XoECB64T4H8IccwptyhexnR42d3mz6FLUTCis3VtpiaGCPg/ZEZZNESOurCgaXQuKfmRVonAKP4
	CY5u66HNT7VD7Q/AxmJ/i9ZivHdTw88XAoDbyb/jMXRUcs1DZ/JVTpTUwFlT21N1KvrcOMJb9Kc
	sWh5c=
X-Received: by 2002:a05:620a:469e:b0:8f8:6b36:fad3 with SMTP id af79cd13be357-904d78a863cmr1223117785a.8.1778236365740;
        Fri, 08 May 2026 03:32:45 -0700 (PDT)
X-Received: by 2002:a05:620a:469e:b0:8f8:6b36:fad3 with SMTP id af79cd13be357-904d78a863cmr1223116085a.8.1778236365283;
        Fri, 08 May 2026 03:32:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b3ba35sm509875a12.2.2026.05.08.03.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:32:43 -0700 (PDT)
Message-ID: <fa5c5ed6-afd3-4e5d-80bb-921d6f96dfac@oss.qualcomm.com>
Date: Fri, 8 May 2026 12:32:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] of: property: Create devlink between PCI Host bridge
 and Root Port supplies
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        robh@kernel.org, saravanak@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        qiang.yu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>
References: <20260506075625.8490-1-manivannan.sadhasivam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260506075625.8490-1-manivannan.sadhasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEwOSBTYWx0ZWRfX8aoFwcwqbB9L
 eOXnIHLZ6goQ7JWquvujjAYJ57eajgsf4m3ZUDEljt2HgWItSxc9FGbMhxbilI8G/Q/bRQeTLxP
 jGmpR2ZqPmg9tsmoIpfacQyyBQqJ8sIFrrUwjXd8IZZZ2bE4jnDedT2BeSQsCxYguGVeSwdGm9z
 cF+XF6uNDsqZ+VOagcNwTRn+P7QG+QMbmn4OeN7b/BY77VyzwybeGFdh5dBichfYaRjfvIRIRkc
 wJ8klc/pCFG7yKGZWlEyxhlMWclf910KsXjMjwJ2OLijR0SH/TIn0fSAn8lsW7fp2LwHXJTivSR
 rQ7R1vLX7CNAIKvHFJGJyG+I2oDbM4OCaSVe0DEj3qhsUgPuGMqQbLDI8a/JKhF+1cf/xWX+K6s
 AHuwjjKnjEcprYqY3lgQc2qd+hv/f9wz4SV6R5b01ckTkNjVNasNj5iuv9klJvzq2gyWyx192+f
 lm7311mmJ56JSbNgaLw==
X-Proofpoint-GUID: 6VCU_5KpBbdcVvboLb9fQcJCNPPtxnTF
X-Proofpoint-ORIG-GUID: 6VCU_5KpBbdcVvboLb9fQcJCNPPtxnTF
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=69fdbbce cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8Pzyt-o0a4R5NFuvPhkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080109

On 5/6/26 9:56 AM, Manivannan Sadhasivam wrote:
> Recently, devicetree started to represent the PCI Host bridge supplies like
> PHY in the Root Port nodes as seen in commit 38fcbfbd4207
> ("dt-bindings: PCI: qcom: Move PHY & reset GPIO to Root Port node"). But
> the Host bridge drivers still control the Root Port supplies as a part of
> their controller initialization/deinitialization sequence.
> 
> So the Host bridge drivers end up parsing the Root Port supplies in their
> probe() and control them. A downside to this approach is that the devlink
> dependency between the suppliers and Host bridge is completely broken. Due
> to this, the driver core probes the Host bridge drivers even if the
> supplies are not ready, causing probe deferrals and setup teardowns in
> Host bridge probe().
> 
> These probe deferrals sometime happen over 1000 times (as reported in Qcom
> Glymur platform) leading to a waste of CPU resources and increase in boot
> time. So to fix these unnecessary deferrals, create devlink between the
> Host bridge and Root Port supplies in of_fwnode_add_links(). This will
> allow the driver core to probe the Host bridge drivers only when all Root
> Port supplies are available.
> 
> Reported-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

[...]

> +	/*
> +	 * Since the host bridge drivers parse and control the Root Port
> +	 * supplies, create a devlink between host bridge and Root Port
> +	 * supplies. This will prevent the host bridge drivers from being
> +	 * probed before the supplies become available.
> +	 *
> +	 * For checking the host bridge node, first ensure that it is a PCI node
> +	 * and its parent is not a PCI node. Only host bridge nodes will have
> +	 * this structure.
> +	 */
> +	if (of_node_is_type(con_np, "pci") && !of_node_is_type(con_np->parent, "pci")) {
> +		for_each_available_child_of_node_scoped(con_np, child) {
> +			if (of_node_is_type(child, "pci")) {

Doesn't this go a level too deep now? (a change vs v1)

for example, in x1e80100.dtsi:

con_np = &pcie3_port0
con_np->parent = &pcie3

And I think the code now looks for device(such that device_type="pci")
*under* &pcie3_port0

Konrad

> +				for_each_property_of_node(child, p)
> +					of_link_property(child, con_np, p->name);
> +			}
> +		}
> +	}
>  
>  	return 0;
>  }
