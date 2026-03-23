Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3BA324B16
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270004; cv=none; b=TBRlryE7+vai07O+gS0M3sKt2b7nEX8rwBVrQssrlfnvl/fYVEuOpBDTHyUUMf7q2HcdOQ9LmVRgP75FzRlThLT8pTMosYYIZgMkTBJEY31TYebphD8J4F2IT/u7cIlwi9Oq5C4iPDBOHEG3UOag1FvNfezJ/+ObMTqyFK1JmDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270004; c=relaxed/simple;
	bh=E0jjYOvnUOby2Y7SZRlZDVbQQDz7XP5UIBx2kAgRPq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BWjJ3WNkwXjitcz1gTF6xA0sHJzP273h5QXGmsBAN3q2IKPV+alb21szIlwVGn+9YdbhOilSM6NkfaaSKlXVhqc0UJk6qRSlbDOTUij5A+h/aIaqiS/pX8IRrWX+I8ZIJJiuOvvmQH+FsqzZQIz/tN6sEv1TJxLU0uAwRNSIaH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kOGFEeaz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gu4Ylt/P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kOGFEeaz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gu4Ylt/P"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NADmYm3539788
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OPpDI+20CmpGqDJiTGA01Z7mFkGhsPpUYB/uL5YaIfc=; b=kOGFEeaz6f27YdYo
	TjaWKrlt2Sl5gTShyzaqiD35ZRlIWR4XL3Cz+ktzskh2npxA69CzI6aiCAEykeBz
	efiXMmmPuWykPuggy5f52ye1Od+vJh6WuZ/bAfKhvVsy9hMj+kCCLUZtaJsD/wG6
	3NImOxUAk5jiymO917pz5ablhT3ohIcsQExIz72eKj9Yt9dIWLR/6dgoxgSYLC4n
	GRjyDssZaXZ1RovR4wCFOit9kB7gBEfC1WjN1C6WY3qY3GkT6NUWo6vRdbQ6YW6L
	fSCucSfCwmTqw/9yIKIgBFhziylE7Gq2L7vPnlcb2LMEUcaDi+CI1EaFADT7VAcX
	lhMO+w==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d33k30g97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:46:42 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56ce66c736bso257872e0c.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 05:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774270002; x=1774874802; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OPpDI+20CmpGqDJiTGA01Z7mFkGhsPpUYB/uL5YaIfc=;
        b=Gu4Ylt/P9c2h7FajIK4CBp+HEaOuK+b1/7sLZmflKxKZgnp7eHFthHp7rJudQ0suxe
         XFItxoXIClanfFLvFWlB6dZthb31FjgbWSv8htjN4OVP59klzqf0x4Ti5sQ0K9cs5ujU
         zmNKc2xbU1zfpGUyKojyWDnDEH/qV50l1zainnErk+y+XQfZr+qvln0JrelWnhAhBcON
         1396zXx72uMwkrLmHFg+tuPguM8nmWBtCJIG5usp4KhY1kPqLcrl2asQi1Lwir6Lb9e/
         8VNn843ly1uI7u9hC1pICN7uYFFmmZjADnW3sLxU34WxTTV10rkZpUPc/m0kiq+UJlWE
         bPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774270002; x=1774874802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OPpDI+20CmpGqDJiTGA01Z7mFkGhsPpUYB/uL5YaIfc=;
        b=pV+OOBoqcFtBblyC99O70eOQohS5fSdPaF9A+vF8ChnZfbW8hgYThUx0YK6cewLN0p
         t+S/FfmwVOWLRg0XLz/RJX2QlRc4ApUK8/bmQRpXTAYe+2/06jyn8PHyhErPnc/XDrx8
         F3hAlI2rOCRP3XdnXFzYnVnMw7pB44vGkzjl1Qkhf1Nf3J4NFuGwrRGX0e3KzrN/HwM3
         pYSqyMl8pBC1NtT+ZVv3/vXrKbboZraPMwNVSyE40ZV4FE28d9lBQ+eIkx6vUVt6aR1O
         ntkwCXAYgt5fNY9AhEXXd6FSzl+T3qNyNmuBynl2h1E+uJ6JNV/7orPOsVJUU9Tf3p0r
         JJBw==
X-Forwarded-Encrypted: i=1; AJvYcCVwt+P2BVaN/KgijUUYeaAPBMNSTHsKlVKFQ1iTPnP0YO5cr8+4BH9KD/TAmAHQdNW2sAiCR8kXt0yy@vger.kernel.org
X-Gm-Message-State: AOJu0YxraNkkxmM6ZGC+D1IFxuLrXXozMbUgk5u9xEMUcuQ6sFO0eeKl
	Zi+ro36wCAzifEuyvo6W9A8Ev+1BWhbubTC4Ucy6TrPv4NU+wyffd+zOMfhFREnmjSMq0p94On+
	wjTIDAQrVzL7DRu5XB6yt6oi/zrh3CWQXyAnOfTZZfh5wYs9xUWY76RDOemqV7f+g
X-Gm-Gg: ATEYQzwxPJeKemymD38d1xnq/xsvGMns+67rJEx+ZjIiGck7KtpDPJ2dOzArThLFXNn
	oJPbmh5um0Fm84FphETLIS2dRiLepNHek5IvE95e/8TLEwoY2M1G7Oq7+Y37E5rSJY+SxyT0bBh
	B+dx+wmwcUppJA7+whUPupWuZR411vtDMc/Amv/2aeEf9LeO484ynXScA3QdHiJypz1HcGaiDxU
	5dGI6O8b81gPhLWkDzojQx1oNrnIyODkhFJNujItemVmjgmCZItZ4ZQUpvfsTPQ+dkiRm4/EuKj
	2BufZ+WsyFZe4lYjjICnIWsrHY9Z4eCJnFcTVMeXK4CotMsjitSdbRCjFKmxo5DGR0xOIIIyDVJ
	Kbg/rKeW1tspL3LtlJjf6IX3gmyYY4UQ0TWUxBmKF8f8M7SF2WmWpPDYyeoyPmii3D9Tnh7ipgu
	5F5dw=
X-Received: by 2002:a05:6102:74c:b0:5ff:c831:b98b with SMTP id ada2fe7eead31-602aea86467mr2115668137.2.1774270001700;
        Mon, 23 Mar 2026 05:46:41 -0700 (PDT)
X-Received: by 2002:a05:6102:74c:b0:5ff:c831:b98b with SMTP id ada2fe7eead31-602aea86467mr2115649137.2.1774270001209;
        Mon, 23 Mar 2026 05:46:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9833871369sm486785566b.55.2026.03.23.05.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:46:40 -0700 (PDT)
Message-ID: <050d0156-1c4a-4bfa-a3e0-41984bfeeda2@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:46:37 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Support enabling interconnect path for GDSC for
 fixing Milos camcc
To: Luca Weiss <luca.weiss@fairphone.com>, Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CYYFJbrl c=1 sm=1 tr=0 ts=69c13632 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=6H0WHjuAAAAA:8 a=_xFa7kLeCwyeeWSXsRMA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5OSBTYWx0ZWRfXyY4ZvBmbwGQg
 BeigDAq+cUcwdGYCRq3hvPR2zaoS2/u2tbQn4W7dcNuJwDL6d3fmo0fTo/R9lU3mrhl2zK2YV1E
 hXwmNQxE57K/6gb08eegEKC0Y6DV6n6u7oARgsQn/4elQguT7tiYonGENr7U2Zk8x+XqRQr+6+e
 5tMiDbeXb1kbpL6PjwwnXQnpUY6AOFTx0kuU42bW+LpbQggpMK7KylIQ8LhL7o3vhKxJrYGlAxy
 uWg5gd4x36I67qh6roWWdE1pMUHmsv5NMOKpgk/548+3WXgEBVotbAMqd9uz7zbXzmkWzGCl0VM
 KP6ZgW3ZxJvuRIodaLm8f3BoDZwPqQSTIruLBi9pcYt3qiYctAepeNO1TY+Nw5JB4VIVLbK6UsB
 Rq/ltFf4wktUK78izWz3GEDVcIgXsF8Pz4Tc8ufTXdR0wKpBojIrzFpU8303OC01F+n2d0jA+Pd
 S0p3ydDtQz941blc3lg==
X-Proofpoint-GUID: O9Ou-99dmrJzoEceqINdzMVBs9HAnxN2
X-Proofpoint-ORIG-GUID: O9Ou-99dmrJzoEceqINdzMVBs9HAnxN2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230099

On 1/16/26 2:17 PM, Luca Weiss wrote:
> Some power domains like CAMSS_TOP_GDSC requires the enablement of the
> multimedia NoC on newer SoCs like Milos.
> 
> Add support for getting an interconnect path as specified in the SoC
> clock driver, and enabling/disabling that interconnect path when the
> GDSC is being enabled/disabled.
> 
> Then specify that dependency in the camcc-milos driver and add it to the
> dt-bindings and milos.dtsi.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

+Mike could you please take a look?

Konrad
