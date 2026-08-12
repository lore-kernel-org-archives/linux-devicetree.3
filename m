Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B46E44D01F
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 14:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786546177; cv=none; b=t0+kLK2iIor7zQR17LH1+9QhUpbjZcl4E5h4fPth0vAYaJv9SifJYFpgdiq6veV0UrPVUNJn4RjYbF2Q8zyR2f4az8q/DcRZ80PU5ALcWkjMb1nebRH9+5dyk8mMGGYFPCstYoL6CvjV/rfeCWxpSFq4NROSf0GEdYZ5FGaiSFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786546177; c=relaxed/simple;
	bh=5asrc2jI9W+fjogIQv24KVzqpjr4gkEmKAxD5PlfoWs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P414pIp/T/VIqxS/D1FwZ8zLv/Zt4fTw1GGE1OuMJd/6NeKggltNEOj5VbAo6XrFI4X5CRfBhnscThmesdMX6fJW/Ktt3XocTKaTPUcB7l0LkriV6vnN2sJqF4uPN+KzT8+1UTWxJZ2ieER1B7BXdtETuqLQQ2i7SW+u5XV1c2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o80EkB7C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A+c+Nid/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o80EkB7C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A+c+Nid/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CDbpQq3875551
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 14:49:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E+b+RHoMCWxYXvezSsKUzxzNnQdAuHqXWxGDKXSBBRQ=; b=o80EkB7CWNNn9GBw
	JYJi5GYCe2x88f2PyYtW2XHX79WlYYjsHFjJBZCJivS/JbvN6m4CUTY3MKnSFGKC
	kzKjMkkkyUAWhzrHkoY8OVq6TgDsfGpH0EL5HCzh20eTdSzUc2miSpQIbhNP9vnS
	eIkLaDhsQ55bXhNrtgv2cMcMQqiomIYPzHe64n+2gctpD39kp0WKdoFApu/wafrW
	cR+Y26yd7cmevsWTkBoB+EvtPN5o7JbJwhSj3zd1q5Hz3sDZoOvGecfFwOoVtwf1
	P8/6QkZIauJLiHULPJ+be9bcRRScXvmHr/hsJbw66nd1OXY0vsaRTaluVbi84ClU
	bAUsNw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hj1jeyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 14:49:29 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848568a6f62so1453653b3a.0
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 07:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786546168; x=1787150968; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E+b+RHoMCWxYXvezSsKUzxzNnQdAuHqXWxGDKXSBBRQ=;
        b=A+c+Nid/ALMKGgwAwKxUH7jxPvj1PNG8S/nmpP5A1hE0ziGp8RY4/inGWGXyNPCmZ6
         uzVFpykskz7eIHSry8hndcLf6zApkUuY7uuZYTNhQ1q9m8bM9NN8MBux+hRIzt0B4KAi
         TJcQcL497RfRltHDf8eI07jL4X6KJrTM1nq2gXBm8g5DEpV+TnMFu1YkEgu+bpxSbfIc
         G2988EPaFmXBH+m3LOqtz7YFF3D0dShN1Ub4DgoKIA2WtB3JF1OC2P9fJmvvKmhrNsFC
         MARPUJ4WLIWNfSKbfjz6CLuEwZ8wSCmfdUQJRTm24Q2m9hVMTBGrVt3j/AEXfgxTGCCs
         0wpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786546168; x=1787150968;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E+b+RHoMCWxYXvezSsKUzxzNnQdAuHqXWxGDKXSBBRQ=;
        b=TEbbjE5gar7KACR0ff//JiOp64CBpXXTWNkSsLnlms5Gigprot1cxQ/0hPfyZvVfkF
         uBQeyzipQmMH1h9KswOR07JtsmQHJxrf3jxiG+1zRBAeCrqvoVnFO5ZfF1vw18hqMVNY
         +wHEUoaPDkCq5NO4mXLInYZ9Q3qlfDS3FwieHYd45vOmblg6+rn9GbfPMFfXDWIrFGxl
         mzcaBo6dF79VqW1qfATQF2QJGa9qrctrwQ4Pkf7CXrNYdT3NxiGEwBUEMrZrXtOWaUhi
         E19LMReJJ6Kl8yNuqF/79F7D0Ldb6FoxobHnVxRpFiNQCybSjRLlJzdArhYJbMXHLEd7
         mlBA==
X-Forwarded-Encrypted: i=1; AHgh+RrNvRTdd4+XP2Ww6Jlx3yqoMQ6lrpn1BrkzWM8qqxMhYhTT+yMw26Q4gZpBDIqGrjrT5w9DUvKHWBXs@vger.kernel.org
X-Gm-Message-State: AOJu0YxsNFzCyN2/aYGhISNOhVZpleT3nwAWDvOFZt5jOFN9ePGS0xrS
	gBkaoc655peQ/RX1kh2ppC/OFLLEabw/5WQeWYI38eSYOdTJbztj9i4OJ8uKgg1C9DT/ZzB9Z3c
	M/xMT0Jh4WRu8OHe0kAItC8swUlypPNUdw/02mAu7fyYEjMjv/svM0AcVMmTYXc3v
X-Gm-Gg: AR+sD11KDjmzjbXgqftIUjFXm1oqvJYc3XyA168pqqLMtb604O4Z7xa47ndrVxlpuw+
	f/WYoObMbKAer7/fkHq6lTkSZ4rTL0JHhMmwgC7f5SuShGZ2weMgMDnj9mCOE4UbFGpWTXAhMC8
	4bIGAtbPun46TXRowacAsbUOnnUSdRevNBxVW7TxVlHm+WQbgbWMG/3ph1Cd0kcZWfStKVQaWcW
	WLWLcAHwncDBd5gcp61h+xAaDAWq9S/qKr6yUOAznoCrd64jKDjdtQjOElEQzYllIv0X0y2iYPu
	1zjogyzhBcCxhiXIrWMmYG5kzg5QSYy4EKZbHs6StmYEPY2dig1QYVHp11w=
X-Received: by 2002:a05:6a21:6f14:b0:3bf:6011:53b with SMTP id adf61e73a8af0-3cc3f874b6fmr6837682637.38.1786546168394;
        Wed, 12 Aug 2026 07:49:28 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f14:b0:3bf:6011:53b with SMTP id adf61e73a8af0-3cc3f874b6fmr6837613637.38.1786546167935;
        Wed, 12 Aug 2026 07:49:27 -0700 (PDT)
Received: from localhost ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbee7d16673sm834155a12.16.2026.08.12.07.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 07:49:27 -0700 (PDT)
Date: Wed, 12 Aug 2026 10:49:24 -0400
Message-ID: <78f9d28f841a9b7cc251675ed01a3864.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, kvm@vger.kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org
Subject:
 Re: [PATCH v5 09/17] dt-bindings: riscv: Add Zic64b extension description
In-Reply-To: <20260701134251.360BE1F000E9@smtp.kernel.org>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
 <20260701-rva23u64-hwprobe-v2-v5-9-2c61f94a695a@gmail.com>
 <20260701134251.360BE1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: mlzpha5trsQFL8i85jbxBr0KZ7C3SBiP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEyMCBTYWx0ZWRfX9oYvHtAIPkaw
 p7vN+j/mR7D0ez1mC7yvaeVCJI9ZG7QH8B+7BH9hdGw1A7+VpsUggeZeOXz+wuQrrF6Uf2JA1pW
 ag57eiE9Wg4eSR/PaKlJ8ch66DG8EJ3DSuxhOTZ27dn1it0FjGA/srm8v/CRvFJbYNBiZzxofNi
 NBF+OVx5//Tcr+YIvy+4wCYhn9Ysrs6HsiJ9Chu/31QsjE1SJLvQgzM+DShUaia0Rlpme+ufeBn
 VRn+G2yFFZei+kx84FBPyEAoG8sR7t+rV5ghPSlzVBEd+ZKw1wY4cWEdYhK+IfCMj9oXuC2ug6Y
 ALbXuUtAkxLGozfzQlnTuOBYky7AIgatwjAzn6SF890gw7eLJCkgy6kgC3mB8WsYink1vad8+Dt
 wl5rtrqnPQqrWhYyWulV0L9AFxmpB2ArBBBb19yVrAYsmiFPQZtwpxOK585rmJejlWt+Y7rKc5J
 kfAJOnH0Yv+JG1PxrAA==
X-Authority-Analysis: v=2.4 cv=K6ES2SWI c=1 sm=1 tr=0 ts=6a7c87f9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=8JhW5hTOqIiRgY4thoIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: mlzpha5trsQFL8i85jbxBr0KZ7C3SBiP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEyMCBTYWx0ZWRfX1ZMASTCfkUuq
 0s6xVy2V54pVB+EdW/uwKi4JlALfyOdCRW1Qu7m3cnHNcqu6X0KZAonQ9mlyn90Jv+oLJkwN+TK
 AUy8ewafI6MqhrIoIICeWq0GHzNSPxs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120120

On Wed, 01 Jul 2026 13:42:50 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Incomplete schema validation for Zic64b cache block sizes. The schema correctly constrains the CMO-specific block sizes (riscv,cbom-block-size, etc.) to 64 bytes when the zic64b extension is present, but fails to constrain the standard CPU cache block size properties (d-cache-block-size, d-cache-line-size, i-cache-block-size, i-cache-line-size).
> --
>
> commit 31237d196ec63ec596da17f48f8410b2eee95c15
> Author: Guodong Xu <docular.xu@gmail.com>
>
> dt-bindings: riscv: Add Zic64b extension description
>
> Zic64b mandates that cache blocks are 64 bytes in size and naturally
> aligned in the address space. It is a mandatory extension of both the
> RVA22 (U64/S64) and RVA23 (U64/S64) profiles, ratified with RISC-V
> Profiles Version 1.0.
>
> Document it so it can be described in the riscv,isa-extensions property,
> alongside the related Zicbom/Zicbop/Zicboz cache-block extensions. Since
> Zic64b fixes the cache block size at 64 bytes, also add a schema check
> requiring any present cbom/cbop/cboz block size to be 64.
>
> > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > index f4dd34d446c02..bbd442cfbd904 100644
> > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
>
> [ ... ]
>
> > @@ -1142,6 +1148,20 @@ allOf:
> >            not:
> >              contains:
> >                const: zilsd
> > +  # Zic64b mandates 64-byte naturally aligned cache blocks
> > +  - if:
> > +      properties:
> > +        riscv,isa-extensions:
> > +          contains:
> > +            const: zic64b
> > +    then:
> > +      properties:
> > +        riscv,cbom-block-size:
> > +          const: 64
> > +        riscv,cbop-block-size:
> > +          const: 64
> > +        riscv,cboz-block-size:
> > +          const: 64
>
> [Severity: Medium]
> Should the standard CPU cache properties like d-cache-block-size,
> d-cache-line-size, i-cache-block-size, and i-cache-line-size also be
> constrained to 64 here?

No. Not constrained on purpose. Zic64b's mandate is the cache block size
the CMO instructions (cbom/cbop/cboz) operate on, which is exactly what
the riscv,cbom/cbop/cboz-block-size properties describe.

The d/i-cache-block-size and d/i-cache-line-size properties describe the
implementation's cache geometry, which Zic64b does not fix: the
profile v1.0 [1] spec's note under Zic64b explicitly permits
implementations to use longer physical cache blocks (with 64-byte
sub-blocks) or shorter ones (sequencing operations across the blocks
comprising a 64-byte block). Constraining the cache geometry properties
to 64 here would reject those conforming designs.

[1]: 6.1.2. RVA22U64 Mandatory Extensions, RISC-V Profiles Version 1.0,
     April 2, 2023

Guodong
