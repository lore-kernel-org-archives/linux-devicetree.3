Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26203FCB3A
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 12:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783598463; cv=none; b=Z5mEhTd/255masK/A4fFVS7btvOzfIkW7Yc/t7QEfsSaaACk9Bt2zyvrZyaGoLY4MFRV6wcN+SVc+/55TreY+kzV8omCCB75AATagzZboafaiufFQgeEmKYC3i/ADiBAJuL8i7GPljaDmZ4DWDn79aX6hJWkFbuetnYkO6GXBA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783598463; c=relaxed/simple;
	bh=ukjLxkiHe+tw8+6yxvy29o709TShRUnzOMu/rsFUy3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VErtPeWQh78lZg0ZlAEkCHsakbRqP23wKGI9k00wZB5Sizqj1L21V/4YnvP6FSIc/+BQBiUR515x7ZcTaZj7IOHfX0WwtHngXqasyw03vhwGF6ARrWUKlW/R0WcLTdEGVNXoSL0LTsvFAkFoZeFBQAK9vlYPOeb2pFRXUns1154=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d2d7zpJB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RS2fZvCo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d2d7zpJB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RS2fZvCo"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BN44T1668533
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 12:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2zHrV0DH0mQvkMRCsEmNZ1cpcyc9t41ij1zmLU7sQ6c=; b=d2d7zpJBo1tCDGHh
	IkcsmDQ2Ica9ZhM6vu5AELdqRdB4e8BILiy8krZoWLV1TfxAIszjES89Ec2T2S9C
	J9L2I0W4fTMyEce6zjfn5W+frJwVAf7wJLQyw0AHalTc+8tIyKLB63jxLbbWtkOr
	/r80LN39AXTc5Mw/nqgp8WS6cwsW3b447bLWV2Wy99L2D+0dgNfQZ2oDUjkU/RuP
	MWKGHm/nZEzXPljgnZrJPNeD7JSEVTzR1XmeAA2YsV5MZqsBCSxnC5Gnkq05K8EG
	SLJVgQIL3W9YF7+6Xu1nUK9AlC4gZvd+vRWcn8HP9DAeSfQx6zX3ap1G6w6acFc+
	57Jpug==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa418hynq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 12:01:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5e21552dso34331185a.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 05:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783598460; x=1784203260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2zHrV0DH0mQvkMRCsEmNZ1cpcyc9t41ij1zmLU7sQ6c=;
        b=RS2fZvCoIGTfU/jGv6A8W39IzkxJYOc2wKewZWyYOc1uU1nTJy4FmcS4rPflmgzbtf
         LeBsKhe5rDtFNV0we1HwS6Ej1k1ey/knEeip5QDJbFPdj1zup7dJNXbCwVnUHFfJT6+F
         e5yw2NhWga5VJEaNORfIsRYxAE4ZSRezsqvkLBe427E1Eks/sP3QmnowRkH4Q5Fajvat
         uD2fV9jJ0J7z5QjT3DArLL8G5yWJo7efMaP/n+08tl13XOyd51XiWhVWa3CCOyBjggD+
         hpoZ6cbiAh4SbQE5fXn4wUogRe78VPpzz+eUBDUpd5U4jvQ6Ek6IJnmI4OmKRFEmEWjO
         rxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783598460; x=1784203260;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2zHrV0DH0mQvkMRCsEmNZ1cpcyc9t41ij1zmLU7sQ6c=;
        b=l3ta2ZDHsh3r17xH2Sh0nk2yvms1sO8K1gi0LZS3b6h4rXT9bcqHMZnvO6yHezSE1t
         Fosyw/52MQWAfLhRBNOmn/YMxMna2EMmxTKBWvgXe3qlhqK15blFc+YeOitVzqHoRAcY
         rLge6KwTE7uyCyqmuZh8LwGjVHduvLxLmPipmgb0oZJHfUNB+EZsZyK9qdAkHIEwnPAM
         HM6anB3UhV1vWJr+/cxLeuFzwFUAKuYS7ANiPtaXqF1rmctSq1GzuikuCkTkMsWIV5Ds
         3Ri8dLtXqgE25NVpndvtVXoXoqGNod2NfUkb8zvX4628amziMc9wenMPGKKjxe72C6LS
         xyRA==
X-Forwarded-Encrypted: i=1; AHgh+RoTPgEek8bqSIuM5HStnuj6aRu4ZaEgZoRCyr+RzeIoYuMwKdpL0PWHQKF9DKerIeOaMljJmHzaJsT/@vger.kernel.org
X-Gm-Message-State: AOJu0Ywms6xR3E8OvwWTQYq32QvKA0h18s5ZL6XQC8AV5ZCa7gS9xZUj
	/UgLBn5bwG60CN4Hsh5Tmo+OStCTIifm9L5gg1W9irhOafOUha76AfXoqJqO3+DNS6EWgkD+4vN
	Any7Ae0SeTtijwfZgcQxlknf/qPT65HSw2NSF9D7reFpWvrFWHbJgYnW1gJv7m+75
X-Gm-Gg: AfdE7cnQSyKIreoistMk+5doRjlegYwp/T25KVIjQkbzc9GvPXV6bhXxoADEFIthMk4
	WzafEc++9/LCo9ylI+0CSCD6/SP2Dr3nOfHJbtGMuGYDJiXVujIOb3CX3YNhb9tWpfhAvQDdSZj
	zMAbHziR1/hwGNotrYvD5unt5Z8JZKnZ1fOYp14xyEflvQXBinoxAf/nsFUkBmN9CM12kr7R3DH
	cShjBZN0SX2eXoiD3R1fEFjmOlSjuebagnt6XMTA/u2fKjfGNY90VkinP5Bf5Rr51vPySnA7IHl
	svtUfxoIUbc6+vNMdbQ48hti725EnfN+rlzdkdQf50mieAJqIYYfYeaORqoFSlWnrdokRpeUkle
	OY9OcG4S2KwCdIVmE8GHQ5DHSnkjHXEYmHwU=
X-Received: by 2002:a05:620a:8813:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92ed764b013mr297583585a.0.1783598459574;
        Thu, 09 Jul 2026 05:00:59 -0700 (PDT)
X-Received: by 2002:a05:620a:8813:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92ed764b013mr297572385a.0.1783598458706;
        Thu, 09 Jul 2026 05:00:58 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bb94c782sm381852466b.40.2026.07.09.05.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 05:00:57 -0700 (PDT)
Message-ID: <71576059-b5cd-401e-b4b0-c1784f24ba46@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 14:00:54 +0200
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
X-Authority-Analysis: v=2.4 cv=UI3t2ify c=1 sm=1 tr=0 ts=6a4f8d7c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=tlOuMNSg9W14aln77gIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDExNSBTYWx0ZWRfX009/GcEU9Q6M
 2xzywz6ziYfYQIXjtZyNUzpZXIVk0pJ9LUH/sF2vDrJmBgjK9F9YtC05ASAqUPTSQ5IzXtsmb91
 hpk33UHkUWPZs3oKaXJGEf/2ki7Xdv0Xcxqex1T4pQODXZcW8UfHuNT8sJZrveEic6/GJsCo0KL
 6mjZuDAyotoyBvsH4iIMdx4NQtChY1CGR5pHSfMo8EloIpV//xsECCOuveRbTuLqm9Y6apGU7H2
 t+5uQxURoUdugkZKgz2b5Qvkd8GOqdbmBw0BblDkW9B1iKXmr4AuH0LWejJdEc7hS6LdEFJRVfM
 vlkJ1SDWnwVq0gAZxt7Bbzscm4NS88mYrTDIMmbgB8xTzaZnbd7Jsr6KrM7+WYv5QkuTvFnvp22
 77Ovu3OVxCE9g70zuPCJijdV3XUctZFHhyBIO5HgzZVfdPlTkKFm3AkKerdkrxVh6lBQWnQqQip
 WTCoICB587Mom1LNlWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDExNSBTYWx0ZWRfX2WMxKuzOi/8S
 CUVQMCRTlSzBpJqKhyynOCiBVgeHAizksvdyBkTlYN8GPFBOwBMhRJ4PTJRWfu7d2ia3ieyn9N1
 8jUj+a5dBF4viyoYntR60Ox7gN369Ds=
X-Proofpoint-GUID: jYDhX7E0yldul522h-QAeBlHMPPlHXKt
X-Proofpoint-ORIG-GUID: jYDhX7E0yldul522h-QAeBlHMPPlHXKt
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

For the sake of simplification, can the resets be enabled
globally by default?

Konrad
