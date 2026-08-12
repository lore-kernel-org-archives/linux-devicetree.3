Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E3523ABB9
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 08:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786524534; cv=none; b=RJva+t4B/X4n20B/Ii64JKmATWaPwS5csmTffmmvyFAPAYhVo/uKBvKQZQunJMXTj3cmvf+DdPvldGzQ5m89t8vBVVM20aLKmfOeJCfzHI6RJH1qIQt9vWqHzpQlbA12nowM4CS680pP8xjB8N9+xc4B2rNkzXd6zCfTuf2Ry8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786524534; c=relaxed/simple;
	bh=MtyL2OiA7oE3lqtbOw34TPVm0XZF4mno7jj/+z+thf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i8PYPp3MhLXC7iz1IBwP5ZRTfvdS+Jc2+FYHYEUdPvcisk4yb1R4SRAwXC4nOPkhNVetxDFQu67suycc5UWVwyWjchO0GzMSDSaBZ+dI4b27qhEwaAemDFodCP+7TOvk+FGPuip+9A9iXPNt4TefWBg1vTQoRlVtmdGJIQoqydQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXHks6oq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aXwooSDi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXHks6oq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aXwooSDi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C8YIuu2987039
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 08:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uNg75FzP8x+6eRQp9BTSIYfThyHkdt1BwBxUEEnz554=; b=XXHks6oqYJ+EeKkV
	55jKxrTcb0fM2EL259VAfdpGRrUDsjptXtZNqWfmydVLmqDunffqnRIacl5Hcl/y
	D+ITz8LwbURWAu/JQ7hFV8mHTbL67AoypjHy+uLhTdtfYagHgNqMs3PawxdNtvLQ
	BHHhl12NQsEd0n6ckgsjQwWUZie+r7r6FTZQx2Dh/JweIsbpdGaK65LXqRaPnaC1
	y4XLEENHCCUdAUl2IlD3ienrmCTpPDykUu4/QqDufVmEUEx2AnE/SButJ8TthTyN
	U6QgVYTGQn/Prn5uccrtSuPl7UbFbrQL4ex/Q9pXcbOSMvuPGmgo0pSdKKIYOySF
	W4+LLQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049kmddy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 08:48:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5283df62d68so5132541cf.0
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 01:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786524532; x=1787129332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uNg75FzP8x+6eRQp9BTSIYfThyHkdt1BwBxUEEnz554=;
        b=aXwooSDiG5FE2KUMVrs9kCrSc72REql8icPsGFkbtYCE+wvkGRXH9np5TDockRCRmb
         uFf41amB4NEnX8kpytBLrQcvBmZIH0cQcnH1Rbf6DY3xL6vbJkSyb0e/N2Rleb+969gM
         i43/U1rcBELfsPx7LjqHMfcOeLaBljAuwaGMGPzc7lYVdceTupgDjTU/qL2V1sm/kA+N
         /R4ZJSgUlFXq2XbKp52zBDqafK80gPJ2AEzmCvqAWPKUZyvQFvuHG2mhCH+q7UESLZNg
         UBbHHfC5jUoDO3i8XDy3qXj/2bcuOmPq28Lyn+rYP8s2LcUPr4qVZ5qbkYQr8evrByHP
         8zFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786524532; x=1787129332;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uNg75FzP8x+6eRQp9BTSIYfThyHkdt1BwBxUEEnz554=;
        b=Pti1AscNI6wWkJSjbiVayTVzx2kJ8uqN7CfEnzqiEFo5XMOudRobPbz3FH32exVWTA
         /HXGOS03yn+LWZS8VT/EijTGBk5ockImasyAj4o0dkZYjHOuGhqvMxhnLlnHH513Sgzx
         Eg3IwnQZUaUzRQyjZ4zaqB5skT+VMlEFfgHYyKZf5W1H1VdpSMuJG3Fric2vJULBxcqb
         zJl3dy6pD6thdgPOs9KTWO46WTf5EH+DcmDYELIRX7lvwJjyRXVbhEnSTa105ZR52Elx
         w/Ajwxa4StigI/rumDS9OSG98RwMgXluiaCX0VoPOg+e0cWIvhe6mDaTk07a5/D4hhFs
         Mmdw==
X-Gm-Message-State: AOJu0Yz4wJ7JuOIoPvIvTxadp2nl/ikc8df5NaZBL25qsT4sSS8Cc9x1
	Xt4Y0Rx1EHAj6+/Ivm3efTCSyla3mL3ChuGBKeLHQQIL/pUn2KWnjDzU60L/CqWjEpSFz0cW7T+
	F5k++n+WD+5hIKHQmu4b39o9c56HTYnQY5u0TO518jFgKZt/I4Y+tO7Nm98o9x1/l
X-Gm-Gg: AR+sD138CcaA1FdJn6plzQ8UDpigC1XInP4EM+9Ioz1n5PWsP+B8VNOp9mXR+MzL8Z1
	4a5mFXodM8/f0/9LmUrBGDyAPNEZ4pRh3v0THMEMYZA+stW9LE9JqVq5Bfk6IBoCuPHTjtyt+Oh
	WQc6aJ5OZWgTS5qAxjrRfvQkLwniTWRbSosZe/6UDzCOtxn36xQDX9U/Bi2biSAUsGsn5RcG21e
	0y+S1hMSIMYM/C7rBIXqOTmEX3bfIggInbX6aIGJmmT8GTPcoC/1rgxsxxq+mAn1mR5ErKw4Pul
	w8iNF3wCzUbkJ9O2osIZWSzyofNLiC41h9Cj41+jvKA1LbVzh6l/vDX+TUUBFJGu8ldshY+zSfo
	PX08eT93gfE1LZ4Muq8+qr9n+g1TE3A==
X-Received: by 2002:a05:622a:590f:b0:51c:1a4c:3c9f with SMTP id d75a77b69052e-52d646a2a09mr26880511cf.4.1786524531941;
        Wed, 12 Aug 2026 01:48:51 -0700 (PDT)
X-Received: by 2002:a05:622a:590f:b0:51c:1a4c:3c9f with SMTP id d75a77b69052e-52d646a2a09mr26880151cf.4.1786524531408;
        Wed, 12 Aug 2026 01:48:51 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150c057f0sm5437384f8f.9.2026.08.12.01.48.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 01:48:50 -0700 (PDT)
Message-ID: <313b74fd-1a5f-4e1b-a4e2-a537f7939fad@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 10:48:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 01/11] dt-bindings: clock: Add Realtek RTD1625 Clock &
 Reset Controller
To: Yu-Chun Lin <eleanor.lin@realtek.com>, mturquette@baylibre.com,
        sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, p.zabel@pengutronix.de, cylee12@realtek.com,
        afaerber@suse.com, jyanchou@realtek.com, bmasney@redhat.com
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
        cy.huang@realtek.com, stanley_chang@realtek.com
References: <20260812020009.3480538-1-eleanor.lin@realtek.com>
 <20260812020009.3480538-2-eleanor.lin@realtek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260812020009.3480538-2-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0O0vLyYyQ73JGUBTl2bXFJhDCsG7n2_s
X-Authority-Analysis: v=2.4 cv=IO4yzAvG c=1 sm=1 tr=0 ts=6a7c3374 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=n9Sqmae0AAAA:8 a=EUspDBNiAAAA:8 a=iM2GKElL5x5HzuFTWzkA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA2OSBTYWx0ZWRfX1BCv8XXvSw3q
 Omlgdyx7GOYPPc7PP7KPPTbWd9oxghwb5pW+eqwGqxP9rgDb3MsgYpPdH+Gum2/IIW1mBp4UJdC
 oax4s0Ymo+IvMRIBtOKQdsZF/hXH5/8FUgytdcZg7z6tcWubtyxJhl4P7JKeioYga7l9e0Xc+iF
 fxirM40WOeiAlkyzC8Gye3lqbPtsM6c/s4eECjGs9mLDRuk+CicQ2FNwJr7oUj4YFzRd3TjZVEu
 iw9jpa2KDSObEviukDTeeGksNtWSHSNyBYKYOrA95yw2521plRn/vY+e5F2FKjl8NH58bh+sdNG
 YMliGbXHZ+pJrZQPp7E3m9RrBzSXNZeUcWGw6hT8Nz/D0jHK/QrvczC4c/22t8k+e2ZqNQ6kGyK
 bVoCn7PpqJxbJMkN+o6IZOUmSCBxVEAQuUHnDNmnS78GhmnE0Sno23AjMwkqcyyfHYoFXNzcsnR
 wYdxJ5ZL01csXVZVJWg==
X-Proofpoint-GUID: 0O0vLyYyQ73JGUBTl2bXFJhDCsG7n2_s
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA2OSBTYWx0ZWRfX5AUS/+h5Y9ZB
 hlZ7vBrpXBgPmD9A11ZChjR1tWViNNhP6eeBG987E4oeB5WrtWzgBf5tbpem89Asn7gIpH++Eh1
 iWz5mrDmMsCnJIZv9/Ji+jOQco1AaZY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120069

On 12/08/2026 03:59, Yu-Chun Lin wrote:
> Add DT binding schema for Realtek RTD1625 clock and reset controller
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

How my tag could appear here?

Look:
https://lore.kernel.org/lkml/20260324025332.3416977-2-eleanor.lin@realtek.com/

> Co-developed-by: Cheng-Yu Lee <cylee12@realtek.com>
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Who added my tag? What is the actual flow of this patch?

Best regards,
Krzysztof
