Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBC14279E2
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 12:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783598511; cv=none; b=Q4ShUgJ5WQo8eJ0E8bcSg/NS4KCoA+YWtTvexMmY0IspfgoeZ5oEBxkbSrfS86hWKsMt3As6+WXY5rxyQFl+EUGYrqFMQwLtkcCKjY35sFIihWXtzTOHNfVcXJFoftR5bl+O4s7Hvns7T/6BxU21+GvnxJ0ILQRw+dbWiD1ZNCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783598511; c=relaxed/simple;
	bh=T8vWUTc/hDoiRVM9ZSQgSy0Glicx4wdpiqsdixf2nhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WSxainf0nLXHcw5elwKpL5bwa/bFWaG+qlAI1j72R1jT2hNS38FWh/1IMEmk5yzaIWb7ak1rb6e8GTmsR6cjwGfXZKI4MebkN4o4w3CNMJ1Fn7x4UmpfjVvryPoK1gzFV6T2YJvuCuG1FJjnD+332ZWitQY2FBnUqWwoXMtK8KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bV400bX4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PQn32LpX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bV400bX4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PQn32LpX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BN5td1668552
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 12:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4X5IwwBAf5rNwTFzeJZ0uNbEuRCnPdo9QpS32w2RVt4=; b=bV400bX4pgrZOO1x
	SyYkxGkc532NtLElCvba+j1rxfLxEeXCwq86xr7wfB+a+NoxjVO7iQVbELle7KvM
	sOgsh/pOWPExaPbJsHnxn0L5ZbjQNDxWFILrMVcwl2al9WsbdgqLqxkbDoZTIbGk
	GQaxhPYFR9miPsPZZYnUMPUhaQsjalGl/9WgQqsEz2W1BrJbNeLNinr+lYJbr8CO
	hk6NCLMLcKWet0E6l90SJziaLvoNwIW3zQ5EafgK8tosiwMJyR6BSB4bwzjZYwM6
	UpmEsKtw1nhPXnfglk9jjsTNfHQFF8RXiRLvQu0Jcd0yAM54j1CWmxZ/qQeuRTTY
	J5qQdQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa418hytj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 12:01:48 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e6b5a8836bso787017a34.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 05:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783598508; x=1784203308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4X5IwwBAf5rNwTFzeJZ0uNbEuRCnPdo9QpS32w2RVt4=;
        b=PQn32LpXrv5YgQigWMEyJcWqY/zqDmZ896xikr7OYl4iBFTzLcb5e26aLt1HQhhXx7
         9wgu9IoorVbHbYxqq0g7gL/yKO7lEj46dxgmvxv71jVihc41lLcq0drl0wFef8Edi2M2
         9vSSYlh8PVDR5T2IsA9ArXGfY/m4qVmM7PBvQnstDfzK0HrktuxzOY95XeN06HI1jpCA
         2g5OhC8rmhLQVT4CXI+hjHaiKe9GuXwD3/VtL3+gi5gk58n4u97mBmAHJTm4piQvahny
         4saBKVsm42yJZN4o3giDt6gF9iJF//OGJGnFutQ2d/rHpc0EE2DZiwnmUBwfq2IYtcf8
         qItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783598508; x=1784203308;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4X5IwwBAf5rNwTFzeJZ0uNbEuRCnPdo9QpS32w2RVt4=;
        b=DAVEqLCKoGrwxfqdbJYui3+S4zketQw+WdUwvffF/5amqJecFN8VGm0dOb7rY1M8o+
         l7/xGsel7C1Da3bCO2mj+kzozRrRa1NYegZXqHst7OPnRO1qYIxPt1HRff9+MnD7V0zD
         Dvs4Vj9eXJ1VksjDTY5xHKxz516Dp2Jjwyd89VMF2tEkKjMVue9MdGaPyBwZfy0wHxwA
         wnYuAs8X/yrg0oLZ1XjWDR2bUhv7TG1Uodf80jFZIvsnN0K4cH5fLoTlrrXTRSaj1NVN
         RwBeJ67LzjlPGT4PFJHi3ehC+Dh9jzAffmo+YxVvPuiqmqt731OjLVHT7G6nOYCC+9Jo
         s+WQ==
X-Forwarded-Encrypted: i=1; AFNElJ98R43tMpameYsSSSHiVbDT+nbcq5iHVlwtGbvUAVhetjQL1BAJtsn+66rAHIXK5nG7STk5sn/hyYv4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy33888fHhVyfdsgrx+nnIvqQZg0ISysphBXYke3QvNs13Lecs5
	eWOFZxXemeWor1vnrfJuYQer+YB58e05FyYiEpqkGX39PyPzXiC0H69XXkxFyFdPFmPzcfuGRnW
	8GIXZxaoUyVBN3+qj1OmFUu65UwdisI8RZDKJKvCoKV5tQZt+0U5u3ddWMOnE4qu2
X-Gm-Gg: AfdE7ckaM0UMHxfKRl3RJMOXSaZiWj2D+u+wBvD9OgSK5WnGb0xfTdIuCQ8aF0D5N7D
	/EDF0VZtPDTcSm9gTQzHIitaOZx3RnBp9B82nM9R54OCtZYaVnbELptUb3tXa3Bb32uCf6v89yj
	yUd9/FeUzKv7UZeaJyfu2sv1h3bdjRbHeQ5DtpTu+Al4D2BhVqqZgQ4Jq+DJeC/hJHwhls2iqc+
	nGDtEj+xLb0pO8e+V2V4v6rDNYtItL0/mXCCzPtFiwPH7TzOe57L5kugDuXMxpDUzovCekGoswx
	I0F2BlVLVNgH77hg5Y9sC39zJi/89TyBMuck5dQQy0f053Z7SWpNuFS5wogAjmiRh7d+KIk0CoH
	fgwRaaQIFVZvYSG8Rcob+I6CV+1Zg5UghR5Q=
X-Received: by 2002:a05:6820:c44f:20b0:6a3:6bb0:e58d with SMTP id 006d021491bc7-6a3790d0157mr1184960eaf.0.1783598507691;
        Thu, 09 Jul 2026 05:01:47 -0700 (PDT)
X-Received: by 2002:a05:6820:c44f:20b0:6a3:6bb0:e58d with SMTP id 006d021491bc7-6a3790d0157mr1184929eaf.0.1783598507195;
        Thu, 09 Jul 2026 05:01:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad821ae3sm464361766b.5.2026.07.09.05.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 05:01:46 -0700 (PDT)
Message-ID: <47e3cd69-9800-462e-94c0-f2987066cf68@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 14:01:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-4-b320d822cdd0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260708-shikra-audiocorecc-v2-4-b320d822cdd0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UI3t2ify c=1 sm=1 tr=0 ts=6a4f8dac cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=xaeihZ6KTXLYonzE1EUA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDExNSBTYWx0ZWRfX6viqCXar9/rd
 BUvD3otg11MfFrK2/B0kDRoHUnDH8iD4I7G3ArHZiTotDksgr0GVt7/ug5FMJgaa+JwOKOk4vte
 BeO1WwuBvbHtf++1YpZi9I9KUvO68tEtlTYaKYdF6h7cu8VrYclrTAjyjw93pfU6OzJ26zTQBSm
 3ZRizORTzw1XMP68+wDcopR8JGvycYIlOFP2rHYI1icHR234rxQkMU0/NRUunjbevjGsVxv9LKf
 7p3fWBQ3yAPJAlLyY0wvBpFbifTadar3x5WxAVrrNQnceu9MKaxMpCTzAD6aow5MOYdy8a93F5Q
 J4KilAO7iwdY644mthO/xYgMIRmgvxpLyS6ermhUN5lkbI5OuUKk1paxx4e2NQ6FEn2UBLiOQCd
 GgoXK6yDXwQSQeTWBZEJa6nfuI1yKy2bpe8HG7ZSPFyZe2Ieq00VdB9rMUJxPR8/O4BrS0c1yCR
 Y55rDf5KdSZ3KOGK2VQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDExNSBTYWx0ZWRfX9eQrVLBK/oKE
 so0+OmAmhdrPQpLxLNF3MXjpthts+22LnbGrYpTwR/2/CJa65XrikjdDODdulwgfV9O6uxBNg3Q
 RmxvTl0Es92d+hCPqc4hrv0jBBlJsq8=
X-Proofpoint-GUID: kmVlP1qo4wesZOpiU5xRQcilRvz-R5xB
X-Proofpoint-ORIG-GUID: kmVlP1qo4wesZOpiU5xRQcilRvz-R5xB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090115

On 7/8/26 8:25 PM, Imran Shaik wrote:
> Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
> CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
> differs across Shikra variants based on Audio subsystem enablement as
> follows:
> - CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
> are required to be supported on HLOS.
> - CQS variant: The QAIF driver runs on the Modem, and required clocks are
> handled on Modem, so from HLOS only resets are needed.
> - IQS variant: no soundwire codes, hence no clocks/resets are needed.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

[...]


> +		audiocorecc: clock-controller@a0a0000 {
> +			compatible = "qcom,shikra-audiocorecc";
> +			reg = <0x0 0x0a0a0000 0x0 0x10000>;
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +				 <&sleep_clk>,
> +				 <0>;
> +			#clock-cells = <1>;
> +			status = "disabled";

/* Owned by [name of the DSP] firmware */
status = "reserved";

Konrad
