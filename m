Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA6A38CFE7
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 10:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780915119; cv=none; b=S2zohcd0kkYoqjNxbg+iNIMXAl5K5QMJ7se+d0Ip2STXBpPjXga9oMkBhHJisWUJZwpqAOAyZg7P9v/1P2FvuAu6tiIMNV41C9FH4mBUd3EUBmzSLoM/VXyBSp169Ivcx1A1/32iDLsQ9fi0RXzsf1H6JVFabUll5KfsYoSGvJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780915119; c=relaxed/simple;
	bh=+JH/Lqx66nobpXxb9GDa3eqxe6auJzl0KO4iyji7wM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R+8BI0zrhmSJZaLRnlm/7o1e72vz/kZi/ohFYXFwpipwB18+tgcH7+mFiEfNNPNvUtv6oj2kfyJS4P50duuQ+WBNyXUxim3D3FOwpy9hmT7cxR67WBYyWJfVlfhlwcuSxYJrc9rrN7Y2r8Y8nU81uZYZdmXwhwpEGz8rN/LcBw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W9G80LJ2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iAkJixdP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W9G80LJ2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iAkJixdP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Ro2H2834269
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 10:38:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PrvLWMsY3vuvBfthbzfCIdNmvnVMetuf4JkQfO6nt8E=; b=W9G80LJ2RijGIp9L
	AER8mJzbdY+0yxLvanQZhULwwyQeQEVdQd4XpHma/UYeKEslPdysAKYoBVu4/M8G
	RqvG5TMmuUSZ4ME+99s5k9AE9ZUIM5R85flkwnDnDFgH9YXN85eW2mk/kTxE6JuP
	1j8f8pKw8edYu7pa1VDxAgZfExvdhMgjrxa6zRQ1zUqqsI6e/TnQDmX3kV57gnB1
	ALXJq1L+TmfQlnZjNzI1HQBW3v7Xxgofo7OLSjIYjbZMHa7dpabu0PRaTxDXbaAV
	bBiws/gMWVHeRogbf04YaaSxdxE2bE+bz2gfQfvIu04ekX9abkmUQ6mMcd3GZtJ1
	hHJP4Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4ypmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 10:38:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915ccc2d4d2so36316785a.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 03:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780915116; x=1781519916; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PrvLWMsY3vuvBfthbzfCIdNmvnVMetuf4JkQfO6nt8E=;
        b=iAkJixdPkO7tYEHCuXsX9sn0Be7wJUaPn2UTLLJ70XiFZ8k+57qQaBXhv47zrtDfTx
         vNY+Hb+5j3DgzzQKPz9RgpjVu271qyI7DfQ/T00zPE10YvfSZ61GZ2GbYOe8JdtCZ63/
         PvycrwALwedJlnHoPa5oS1mgnLbcl2R4ylAbjmIEXlVt2/t/oUjslFt+nBcQMkF2vqG1
         6ht6tTViN3EMlKOYzdk0ocqOjG5eimAtZDD6TrDmlbHkbInq0epI1KgOnVHmnc2L3w5x
         iGoeAEhr/onnHSI7EsgFajavFGXTqJ+h/nGJdiGASXBsUMySci5vxbf6mnbefAK9ivxu
         2tWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780915116; x=1781519916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PrvLWMsY3vuvBfthbzfCIdNmvnVMetuf4JkQfO6nt8E=;
        b=ee+zhSmIBNCuqMHBuh6YKHriscETMco1MLeyfCODZFpS4E2Fdbs4DvTkbfgJnk55UJ
         Eiqiyw+53RS/fWcCcnnblUMdaab2izMYjupnxkqTQ9qIDN7SSLVP+Ax/kkfK6fsnucHg
         amSggmTlVdxRDyoIKy4yULVk9Lg6rDynKWRaij54vG0Pq79EakVM2KkXx9sbJXXcNYRA
         bkL+c0bfOidW9I3kEzm2k0R3rOWfX62+CvSVm0hdXNK1CrfBpXqgyZyx/jUJj/PKQUtI
         LaGrzIZf+GVVQPxJlzGMLktdOKueWLKM17wDonRJIyO/bendZ0nm/aUR9keN6nKbznE9
         PVUQ==
X-Forwarded-Encrypted: i=1; AFNElJ+nceLzbkzrm6+/qFY5JgAuuDChKhV2gCR8a15iqYPniSwj6FZqzumz7GfOJu99GvrCCGBx704r6ltv@vger.kernel.org
X-Gm-Message-State: AOJu0YwAhMCjOVAxNl8taqpmWF40TN89xARFd3qzEgSxBoY9HP9RKtqp
	+1DQNAQGDIB+05E7/mzYkd7Bv4syHm1U6J++trCVxM+6+zWiA6dSYjwzHkuVji2aG8dflSaLM8N
	ftft/xl1yadlFNFUmDW81vq1dnEsgBEaCc9Xmhs5YQMEN+6MIjnZrTaW6bLTHaFL5wKsLWiw2
X-Gm-Gg: Acq92OF5nZUJNsnLGhTRzeZxLOsBV+bNYTSy7DHV5RkofKuX8DqwsKWtxldOolrMe7k
	fcwvo5tTTC485og8yYJVpMyDRA8LO0s6GDCi8ftOf7F4yVe8vM0veL5dGmbLX1BYA940PeDKi2L
	/6JUI2JMDWBoS8p1IBTU4c9cqDI5rYRvWqcEb+DWEw+vwU/L87JU0HIVA49UzyGnJU+ADF1Jy8b
	X3uPVpZ0uj4k2gROWXJ0GJzZCBeCKrgd3tVLPvhR8l85EmcpkS08rHFOZ/9diiee58VlzMGcMQz
	gFfTcRG8MZSxMr7JiKbl+ffTtNQFs8o2LAXBuewhctWDhG1sXxQR8tDSzZm9nICvzcNdCjjskj4
	MJiAphJ7IHC+A24H5i/OEXBiDtikxb96AEm/DFmiwxMbOifpQNvV7iBcT
X-Received: by 2002:a05:620a:4042:b0:915:8055:3f9f with SMTP id af79cd13be357-915a9daea76mr1414089385a.6.1780915116324;
        Mon, 08 Jun 2026 03:38:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4042:b0:915:8055:3f9f with SMTP id af79cd13be357-915a9daea76mr1414087085a.6.1780915115935;
        Mon, 08 Jun 2026 03:38:35 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051d82a78sm839136966b.18.2026.06.08.03.38.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 03:38:34 -0700 (PDT)
Message-ID: <040737cd-60e3-41ec-a693-4e4e075808e5@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 12:38:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: dts: qcom: msm8960: expressatt: Add
 coreriver,tc360-touchkey
To: guptarud@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260527-expressatt-touchkey-v2-1-049dca41fc3a@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260527-expressatt-touchkey-v2-1-049dca41fc3a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: P9kOlkCP6YmhXd074cCts8CaZ8an6EAS
X-Proofpoint-GUID: P9kOlkCP6YmhXd074cCts8CaZ8an6EAS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEwMCBTYWx0ZWRfX8VP0+Ay+bP8/
 RK83zoLJavUXm2C9apXQxNHFQPWXVjKRn9Op+ttq3QIzXHJHj2Di+s83Cuxat+yiTOmJxFP04Tq
 EaBsZKRaUoU6yxQWw4iO+djYBa7dXcI6jzlr4sH3YKTmxKCJr667YV9LLpuxPZEnLe5X0EBqXCP
 3P4v5kdVmSUlS4v/XffohfEtoiRjiBVK2MtRs8sls3tGqKdbRgWapHS+64MsUCaiRyG+ZX4SpGK
 xQO3tS7D26sNCq4K0iYPomlEnCo85KVevMo9sy93JaWV7Do6EI2wRx+OLVva8xiU2S1U4DhvHvX
 ruy3dtjjNwksnNAldScpguQSIIRoampsbQIRWh62EEHPD9YAv4ul0+3ULC1OVROIia8q8bhFZ/m
 7Qz9lTvk6SKJfJme3GUgw1QM48hosvhGEZc8mvcQeibTIBGyTb6GxrFMS7XSRO0tLNeC5N8x9mP
 hyHviDin1bIg2oPgP6Q==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a269bac cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=OQN141zOAAAA:20 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=W2_YLVZPviVWVX_7ETMA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080100

On 5/28/26 4:13 AM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Add the tc360 touchkey. It's unknown if this is the actual model of the
> touchkey, as downstream doesn't mention a variant, but this works.
> 
> Link:
> https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/input/keyboard/cypress_touchkey_236/Makefile#L5
> 
> Assisted-by: Claude:claude-opus-4.6
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

