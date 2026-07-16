Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AD142378E
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784213372; cv=none; b=c5dPz4CYycpzOXD/TKbYfwf5TOxwyYXISGCk0KC8+NMryhCvlWg9RhEv9+WyHty/7GlfYqksmDi4VtkeieTrxdINnTL9V7Y77lEWOUSEnPcWSHawlWfzI12KClNUB2WzcF5Iw6Oe0T6VAplA3sFk4HY6Twh0F1qgTpccvmaeRs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784213372; c=relaxed/simple;
	bh=fsjE3NE8koqyjOM+n1+CuSx4kksS91L+ouIjGrscda0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CYhAvLunFdULQs8OLggpYz3/2jlIckVi/xi6HEW30YaCSNvheDi16/p+mFk4u3b+EIEI8R1iNwAEGN3/OTQJtJlcILMlV6nZZgEDCQfkCQjmk2yg9Z68h3MQC7CWGwVKE1mCluPILOb9paMsRrxdhoZAUxqy7TuNU/H6Rud3RbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=djR4efOp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CqJ5nngK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="djR4efOp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CqJ5nngK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJlhW2721686
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:49:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jw5Kr1vOUYwUB+mfOp+2DENlLMaDIIjWPw4f1rH0pj8=; b=djR4efOpqXC6a2Xs
	77ZNNskCe9e9XWn5gEI8qRp05c9zGM7Ar84MIAUemwZi0cfxmYjPJ0cAI4CRj/im
	WVk241AKyJWn4B4NGlc3YuW4ZODCiWV7vapawM5iD5icDdyzO/0JbNtdOLmx2Ths
	CT6fQwz7bM6KuQyRsGJ7pRhl+e5eSJ0/ZMLg/tvs9uZFM42SSzSwBm1vjp29x6iO
	ivCchGQ21RjgS+oD4HIHoq0LCQzvUCaaviXEU3BDV9519Uq7lwvxzn+emy1itKBo
	kpra3niAnZk//Xgilj9z6V6mdSCqmTQbXHPPuRced9btL4YTyHs1omEAj7s8N18S
	Uv0k1A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feehvceqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:49:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51caa0b48ccso11584901cf.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 07:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784213369; x=1784818169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jw5Kr1vOUYwUB+mfOp+2DENlLMaDIIjWPw4f1rH0pj8=;
        b=CqJ5nngK1wuw2oxj1gE71bRBW7m/9/Lq3raYTFF8sJK71TBzlmzW+GjxEp9SPcLvqq
         8m4LKAFNU4CpI6heGqXBxZIfo7kNeRkk/uvZkVE0ZwND13cgTflPP+SpnrI8ZWfdFR7G
         JAej11/gyoNBagvKLOBPfmkfSVdKTwSXs3zATq/gZ5xFxJp5XSssigUJy0KtYi9z/960
         BdowtuRn2uj3pyBB9YaOqQJ7R80o0DZJpWYNe7XQlBlVtsE284snVtp7pFHp8hrlwvPy
         klhzI86KzI9SGmMXDIcctxh/fwk6Oltfk2RCyXJtflUYZQ335nDgM9OxRHCgRNSJQTeg
         CnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784213369; x=1784818169;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jw5Kr1vOUYwUB+mfOp+2DENlLMaDIIjWPw4f1rH0pj8=;
        b=Ot8VJcq2gci6oKWOulv54lFQgr5C4m8NNeeqzxrkFP2sVPA5IMwFN2dcSepZX0n72j
         eOb6FWp9nWnyB2u3590VL+Aq4U0faaXfTnm8vsLKu53zaXjdORRiqT1OzfCUsRMXvtbJ
         HrDfvceiY3GAjxchNpudzVJtA5r1fq2h8748Nj3Kw1IBr/uSIxImVe6P0kmlGAGj0grG
         vW9fMxFXmlbadHg4HWqW8I8eT/DU3MnhQOoJNPqytXcmBHpDQ0VrUkWtTsY46LR0/3Ki
         7TXzqA337PK1QNtT6ZB5vNIjeyNyTiHNog0POKnIHbWI7OmhYOlOa+S2htzlyzD546cD
         77sw==
X-Forwarded-Encrypted: i=1; AHgh+RqyYFpEKKNNBlcmXsoK0I1gxWfyIGghDOL62uslKx3vM7kU7iCidvLUSJAyrouT7VF3hHgDEfdvNPsV@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx9yNp27YvgedB9KXL5cixC6fu7MQQlbN9Ld4+5KTTisTKKc//
	zDPDE8IoPNYjZS61S7BUpqFWOu+f/LkQCUv2usumKk5iGCxRmmAXz09YPb/OYjA+rzzAveR5DrU
	7vFZ6+5y3/Vir2WlUIDDcuff29ratxBJBe7arLKv+uzL8B7nESOiHASwwgsJMJUx9
X-Gm-Gg: AfdE7clVUWsQAQExnFaBYJwn5GchEcNMLuY0RNWiZ2n82EliiJEMjmEap7RFcLv5F7O
	Q5Zl9pHRABxFr1mrQ+iNACghK7kujlDxyZgA71A7XCNLMrljzwVpeiKnnloYzij1wp6RlccVz80
	t9C61qxJVqN/zFrWPUBJLS6CLO6GtOFTLBh1SKrMio4Yq8OBYevbjURlSTJrH4c4hNZhjDgpWig
	y8s4jhwLW1+ps+4YFtBaOK2Mv5CGUCOqq8699czWryf2uRj6xk+UsgTGIaP8T/rRjTtfPYSEeLT
	N6o3D8Dw2fguAOu2zEcqoEld2QjIRomT5YA2gpqCMEg4r+TDwAV5GRvfnxaZmh4UEAWFHv5rzLz
	VrcNCBUr39QLUL/zMUFfGivAP
X-Received: by 2002:ac8:5dd0:0:b0:51a:8c9c:7de0 with SMTP id d75a77b69052e-51cbf2f40e5mr178600031cf.10.1784213368715;
        Thu, 16 Jul 2026 07:49:28 -0700 (PDT)
X-Received: by 2002:ac8:5dd0:0:b0:51a:8c9c:7de0 with SMTP id d75a77b69052e-51cbf2f40e5mr178599721cf.10.1784213368098;
        Thu, 16 Jul 2026 07:49:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16871962cesm234383366b.25.2026.07.16.07.49.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 07:49:27 -0700 (PDT)
Message-ID: <fe8f8696-d78c-4b80-8fb5-3978178533b7@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 16:49:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: add SoCCP DT node for Glymur
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
 <20260707-glymur-soccp-v5-3-053993f0c6fe@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260707-glymur-soccp-v5-3-053993f0c6fe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZpDd7d7G c=1 sm=1 tr=0 ts=6a58ef79 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dho3xQVaiACaCEetv_YA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE1MSBTYWx0ZWRfXyiDXKFqqattR
 9zeOpIGk1lA3QOpYYBcvRZye8mySSB//OQbAYEoSf5+NCfvO3Fvta7tAZQZO1ztrFAfSMoTqyxV
 L3I7KLq0R/j88X2Iwl4PQkMy0+qQPrshCHhviK+ZioDUt0v342S6oZ/8xUmI6GN/4hgVs5sF/Xp
 ku0BAxSDzZ+jdcTAyBE5jCw3eC6q3JF7h05DD1G7zrySjUlCyfKsEERTadP3kQT9yQFXNUkc63w
 y5Aq7l58xC/c8oPxknB4snYQKCk95AEpACQLg5/GhzvPOYvPOxROdIdfvnN8CDcRmkv9KaF5Bh+
 RAFN9RQwyILXkqAg0dJMWCDRFflo6LSI51DpokxvXvqOKQhjbTzs3nzzKEqQCpLkVNwE4k4kznA
 WbmaXvakTt5ro4Mbp5m2y0Qs0HhCHIBe2QI0uHrYL9R5Ed9nfCwuSOgEUoaailSRMB/oIA1syIR
 aFsD3qFYcCUj0RRvgTA==
X-Proofpoint-GUID: bpK77igO0ewfilO4lOoSQzRjGTDaW5Mq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE1MSBTYWx0ZWRfX0anYE3LkUR6g
 tY33zFEBDoClbE4RaZIuL3VqG1EPXKLReBOoL76Xy8U7TzPr7ezOEId1LP9dUy4beiY2E9Pwbf4
 ADBYTxlGh5V91p8SJMRYRHZg07jxknU=
X-Proofpoint-ORIG-GUID: bpK77igO0ewfilO4lOoSQzRjGTDaW5Mq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160151

On 7/7/26 12:12 PM, Ananthu C V wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> The SoC Control Processor (SoCCP) is a small RISC-V MCU that controls
> USB Type-C, battery charging, and various other functions on Qualcomm SoCs.
> 
> Add the nodes required to enable SoCCP on Glymur/Mahua SoCs.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

