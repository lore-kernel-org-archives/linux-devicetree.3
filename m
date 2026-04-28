Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99A93E639B
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 10:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777371364; cv=none; b=ssFV5MCpp2dm52vH93y9eEZctKfy/uijFubPxXF3i8yOY7d2RhbJmaFqOv3RJujv/zrybhm1faV3hzs6t42+g1I8BjXSCLrul8nSISLOL2neiNwEP1D22RkiYUlN+gF1CvLyS9bbN9cHfSv48gzeTQwpCOgAAznC3barYXbP2jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777371364; c=relaxed/simple;
	bh=MvEi1EsRK25OVuV9Cq1QVbl75Tn+alqX625QMrIWFwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C5DUhda6sUtGLaPFz/IVlY8J6b1F7cQvj43F4g7rsqyV5YD3/FQ9uPFVgII8EvbYbi4ZGA0TOQtG9mEfgvrinNIjhfslLd+kUS+IilT/oi5e4O7E+uWBJlsPwyjSv5ZXBW9/4KtP+Oo+t/Lg3cfT8uslcerKSduh1wqjfChbe8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IMPm6cXv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EPW1pYTQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IMPm6cXv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EPW1pYTQ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S7w0Ev1745660
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 10:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DcuhAahfQK1r6Ves89P/ox+ku5EwRsjL3bpApW9Nzm8=; b=IMPm6cXvF7q/2tO1
	pdSAfsimIB6B1Xbd+JqIPJTE+OqA0Mo18HNHLzcV30C1WJn0P9/s2Qt4bCsRt8C3
	v6T7JRXNELV6z87MILDIGU71QTOFI7zFrTw/YsOJYt9y7aeP17KV3XEukTi9e2AN
	h6VW4f+azxqg4hJDchM3X4R69KhO0GTE3QJMsAIFt8QlYeQydAifr3IVsDCjwts9
	GCIAmuiVxn2Jkc0o3i0Dbt4bAtqRoyc9ULXz+6eZZkj6qRJqRt9RXACX50erP0rt
	qzZhEboZWcMw5xnPtMJf7JQpUu5CEwPGG2xY7bq24JNa7U5n1/BECB9nTEB8IqKx
	khAmcA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtryd8hut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 10:16:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50faec938fcso21896491cf.3
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 03:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777371361; x=1777976161; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DcuhAahfQK1r6Ves89P/ox+ku5EwRsjL3bpApW9Nzm8=;
        b=EPW1pYTQmfTaOliETu3iqe0s1V7dPgZRSYE+p8Hp/1o+PRQH/EGj16X1+QOTPrIiCb
         1Jg6nmc08cQgcwhPybvOlCkRjforu+U/4c1F0a7F45IGyImoOcKMopkcZuU0zi6xcdwK
         2JoWUmF2Ty7IFfy7vEuRt3gqeYgxjqbdqIcpHJmnd9eRueYZZQkQmKYUUOwce/8PWQPF
         XW5wlrbsEwDSBdAkRR0VXKNxVpYI390gxVCgd0UBS84NscPmJJOciCBruQY7IfgOexYI
         uJcph3HT4Qklhm1sZaRp7/SfVFi9MkjTd/hsyJ3AxfsXEcle2jgNFzncAfonJiqT0WhW
         Bb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777371361; x=1777976161;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DcuhAahfQK1r6Ves89P/ox+ku5EwRsjL3bpApW9Nzm8=;
        b=Ox8GeTm+3uFIcpPvPI43GC4cOliiQG4TUJcul51dnx0/C1c0k/8WaLoi9xpJF6sOmJ
         bH+0yGG9rAOFXhtyGMikiQLYGq/FTUhUzgKi/SiHy2Ea1hqe6xhYx1Ur8ONEpcueZNDs
         G8Wq737y/gvQFt/58qWFIoelAZjbZm7mWBxGkkETDoS1IpQ2M0OOX0l8jHGpznkw5M1a
         2GHQPzStmVrtWu1lyhj77o57Y5UgLNETvYsqw9IBgmYYY7vTM6Jkl5W8MRdCYNSBliPv
         MzXwfV/3IXe/Y/CXsf/nLXaB00pKH+vCmqhfn1JyionwrzX3Y053d2T3eYFw2reZPCRw
         FuWg==
X-Forwarded-Encrypted: i=1; AFNElJ+h3X8iOuW9iCpycSwGznIQE1VeBWht97QlO0DZGxnVlgzSOff4IETcHP4jMol+x4hKzbcWvxqBjCP7@vger.kernel.org
X-Gm-Message-State: AOJu0YwEUAOFWlRDA/1NHNO+jTdBkiEV6fs+3R05VuC8Bu58lbzLqBqI
	v5g8RxaRXlNocTvUvPhigUEWXaRbIRZemLiZVpxeUXc3YQ0UZCbg37sMkmpjTJOh485gCM/1Bc6
	+54t2vNNyFYzVkUbxeonBNtpqZuEAeqiHjLyhyKeTBR1eQvj3nqUqDFyUgZtIYMST
X-Gm-Gg: AeBDietfL2fYWA+U3POL8G5pmlk7qIdmwpuZTmO7MHn2sPZHKW51CP8xZWzKEYkudUx
	W6whEqfya0zJehULW9v8qq0HVIHSG+lHbR55b6Z/lQXBj/YMGlUnA7H3BV0fBtKjsTBDupIIV8X
	pe0fVOw0shgJRkyz77duJHrBzYITPv05l1GrjFuwGcD/pQ1wkCvkR19HdFF/XCU9MIU3jySTd4V
	nkwptUVLFxRFMDSsXEBtK7h9/ROQwZd77WVRgUQkc596pjm7iE543CBbywvrgpv7l+/EhMF8iGo
	dtSSCyGckSC8usDiG4tVsQFZS2woduNc/EwwesfP8TPh/syuv+MQA1i1oUJ0W2Oun8aVK1YH5SA
	+ROR4tsjaKTDqu5g8sa4zSYiMy6WUO+cJlxfl9w44rKQjq5wy4QCR9il/SXWbaTcmoOiaK5mUKC
	Rco/cdPZAGJ4uUug==
X-Received: by 2002:a05:620a:1707:b0:8f2:1ccf:46d3 with SMTP id af79cd13be357-8f7b5ba3b11mr259665285a.7.1777371361200;
        Tue, 28 Apr 2026 03:16:01 -0700 (PDT)
X-Received: by 2002:a05:620a:1707:b0:8f2:1ccf:46d3 with SMTP id af79cd13be357-8f7b5ba3b11mr259661385a.7.1777371360659;
        Tue, 28 Apr 2026 03:16:00 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-679b68632fesm536532a12.28.2026.04.28.03.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 03:15:59 -0700 (PDT)
Message-ID: <0c6c9366-a190-4143-a0fb-2aff38ed8804@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 12:15:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/14] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-10-f430e7485009@oss.qualcomm.com>
 <aead10a8-45be-4f7a-ac6c-35a99a716b3c@oss.qualcomm.com>
 <CAFEp6-38=hcUOvW1yd+hRZ2nHV8sLxiLeB18uu-au=LgA2bQTw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-38=hcUOvW1yd+hRZ2nHV8sLxiLeB18uu-au=LgA2bQTw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YZsVkGQptl5oc6z6Ei8W_Hez9agxvIvB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA5MSBTYWx0ZWRfX07HuJVolOZk/
 D9KXqH7oV2r8w7VnGNgr0K2soflksj0bOuRG9MhMmNr3Zpiz/i6ONHpfnkOxZZ/gSHqwvJNTBFd
 aX9EviMXtn3cQKJBhbQGnnpzW/IalxjSYbZhEWEqNZ29tizHottXyGk+HLEZuuk3UL+v66egui5
 k3+0hqR1bp03qcsHdhyjRo2dZeBln8EBTygRzUWR35dXXNNSIDsCOY1isRQYXlUT19Xo5UeCZNE
 FutEwgk/Sf+4GhRMAdU8AvPNeeWkUUVeXeGHf1jk72DRSVqv3HB7jWKa1AvGRM3CT2dIHHDEE2F
 tERvK38wBhqNEO3WjK/+JGg/VSfjGx5G7Fjh3fSWd9XauuTnyqBmMBnh+O2XFrsUqua3xtmLvAT
 RFEo/Pdeiuq4uTlhU3qci7hbfWxvccXYX/y66sqJTUblLJe1d9Md/9bHE0ajNzuBlkgcOQscPSh
 Uy7KrntVZ9+87xZBiuA==
X-Proofpoint-ORIG-GUID: YZsVkGQptl5oc6z6Ei8W_Hez9agxvIvB
X-Authority-Analysis: v=2.4 cv=cMnQdFeN c=1 sm=1 tr=0 ts=69f088e2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=V0AHvZjihEha2N7cGZoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280091

On 4/27/26 10:33 PM, Loic Poulain wrote:
> On Mon, Apr 27, 2026 at 4:22 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 4/27/26 2:43 PM, Loic Poulain wrote:
>>> Add Devicetree binding documentation for the Qualcomm Camera Subsystem
>>> Offline Processing Engine (OPE) found on platforms such as Agatti.
>>> The OPE is a memory-to-memory image processing block which operates
>>> on frames read from and written back to system memory.
>>>
>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +        clocks = <&gcc GCC_CAMSS_OPE_CLK>,
>>> +                 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
>>> +                 <&gcc GCC_CAMSS_NRT_AXI_CLK>;
>>
>> Should the two AXI clocks be aggregated by camss-top instead?
>>
>> Otherwise we run the risk of the OPE driver setting a rate of A
>> and another sub-device setting a rate of B
> 
> On qcm2290, OPE appears to be the only consumer of the NRT AXI clock,
> while the capture path (VFE/TFE) relies on the RT AXI clock. That
> said, this may not always be the case and these clocks (AXI / NRT‑AXI
> / RT‑AXI) seem like they could reasonably be managed at the
> camss-bus/top level.
> 
> The open question is how the NRT AXI clock should be enabled when
> required? enabling them unconditionally (similar to other camss PM
> clocks), introducing a dedicated CAMSS top‑level interface for voting,
> or leveraging an existing framework to handle this?

So, interconnect, or some internal, smaller version of it?

Konrad
