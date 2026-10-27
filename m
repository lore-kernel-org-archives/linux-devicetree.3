Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116534;
	b=VI4Dv8mA2xg0RClRqZAuMe2ju7nHYG2SzM4XvsorzeKrTL2gArOtMXtDS89dO5y5zHmF
	 3EZ/bMRPMxu5u/9/1yL7qFge7FzBTBolc42WhhVDQ46x3tmSOtBJbbb7a0GDr5uzp22EY
	 LlcRou5HpBlPuCHrmxaRzkuTEObbEmmTLumszlHcb1ZwQcudbpLs2uCiVa15Kb45EvCjW
	 jnEtijQ1h/ntyEUQQdqUCXl2oUXI09Z/JmqCGqDxIkypM6aqL5s2sTX0IzxdkijAczxnd
	 hr5EMivOnXhUCaGJ84tBUBFUGFkK/H43mCEC+e+NLdjQyoaKVMjYCH372CQiwxs6f0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116534;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LgOLWT1VDun054y1i10LpGN3J/+lPVBwMJuc5wTwrNI=;
	b=1ZJnb/VNxVL8c6+HUBNVNgEaFYAX2FYHOFaa+DCkGthvzjYjD8sCgiKVHc/rIaKz8cVA
	 6dsq7467BcG/R8VOjhF1JSl5bz5smtx8w3BVRzHM6OOuLXuiY5NwGaGvz6uTzFso+gV/i
	 h3DCJdVAUr2wFXx8rUt3mwPUcX0h/XFpVjT2bw5uj57u0cemQVYkBLYvMtIYggsN4JHKX
	 1SCOrRwbocbdFttfP2Pjc4kTebsKcEM0VOCRD8ix7RG46a97cJMvjaIR9MNkti6bg47d9
	 QqMwKYckF+XSZdlqE/OcFvp7o3ingF3vHV+0BiZmczZk1/MPeXzpwVsWF9LhgmBZXSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=huwPXjlq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BMfeOFEy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624FF606A325
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 15:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 624FF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=huwPXjlq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BMfeOFEy
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFKwNk3639478
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 15:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LgOLWT1VDun054y1i10LpGN3J/+lPVBwMJuc5wTwrNI=; b=huwPXjlqeu5xpVR3
	5jJsipH1meaqhS+82jJf0aSRmbG277MFBcREcFHooXLPyF1E2bED++lTwRxb9K35
	ehuR+r0ex3ySOknZ+BvefsS4pPFweTklJ+adJm3KHDIi7rxd+ozHvYJMwqy4nGHE
	be7ZuaBGJvBhzcLtgSohSNVpYehUhviqrEUfClWeWrAI1bOK4vZWZ+zGsR6t62GC
	CCh2OFa3aX/AxUofGx1RKrkLUWgpeanzLQJARbzpiHVUqNAUgb/gvVEGghNR9M8V
	qIuyI/EUveJG+drzBUigs1KA904Ikr92Ml1yv3qqqVyqLULnPKu747AsjfumgB04
	shPKAA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3dbx0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 15:55:33 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc2c798d76so95387137.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793116533; x=1793721333; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LgOLWT1VDun054y1i10LpGN3J/+lPVBwMJuc5wTwrNI=;
        b=BMfeOFEyxEFNXt/6I1OTRpw6l0PVEu+KgRFv2uCE4/RxiyvvAyN0WzHpC+4qDioDkX
         HGuBiv9Um9iB6INcsl+IJh+/kYXEZW2m9duImvAUP9eg42KuD0W6zubyuft0+FLCJo2Q
         LK0o9Q05t89fDfS7+mQM2ITwSiykCYPRAR0dsDYtOlwwRv7nfpQZZCYvvtqsLThC8lKE
         XW6H/lw1xFurUWMeXvDKbzw+Z7fdVx+0sOzlIjyweZ4xtcFpPzGgND9MA1FmHQf38jzO
         D3jyirJ5epk6cyoMj93Bx8MMyz/BxyfXkIe5xnEkD+FrbNvm26c00WT/B2JXxVUR2WAH
         4ffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116533; x=1793721333;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LgOLWT1VDun054y1i10LpGN3J/+lPVBwMJuc5wTwrNI=;
        b=cLgBBWg8lB7FWA89OozbVMpdpNsM3MxXB166hVlJSlOrdyxNmn6Oa8wkWeN+iY/Kad
         PIci5ckRbZrEwyrRrmHoP2SCzRhatbI4GjMhkbUp7bEznvTezRNXWSXK0YdA2+R814/g
         1j7nejhrLAPZeUPMD0tHJM/my6ywDcJllzADNU9rhxAbcRBkNtN18ZYp21PEflt8AvoJ
         ahpOM6eiB7fuPEZyKxRG3+ZliLSks9SepzPzvenp1PWn6pvdMHCdgnRYhQ8TTti65qsX
         hD8u/8b1SOz2nDecPR22kWhM0qcD+QQc17Qg0WhWpgManATxFeUcOgXyrrzVBjeeq6Pg
         hA7g==
X-Gm-Message-State: AFq9FYIumX5dylF+rXye49pcEOG42yVjik9svdoenR7V35AnBMdk5lX8
	S1lS8GMWy3PTmACQy+ejBpsC/q0VdlkMQJEt+/0ajhCY/CtIOC4Y7N7Xh33ivF8SaqTbH7BRmn4
	F4moBa3lMiNvKgOyktjSsJF/J0jVWHuPqsiFYhXGZjzSmFNOQzeqgA2wOkcYOVr2h
X-Gm-Gg: AYBFou3mVba2ij8xLEAXotoZuPjbwXbkNbd+PBR6gWRjwfcq6OO5GXMz+vesmeJX5Zh
	VqiQwtn8qL+x1pxVY0ySkM2HRDahhWy8JHUd7woGUhjgAoU2f59vHgfZ02Z8iUPmPS2C//0Jmsw
	OECztKLPGNwTRVXJ6n9r0TioEtvj0hOLy6XY+HO8tCAXQHaiWI2agZIaDwkVbbiugpq9nWZGApJ
	UyvZrkNdatJFzRxyf2RIwg3KXK7Kflht59RCB2jzdY+uy4cvnxJpmDOMs4nGuLtGsX1unZXvz06
	m9nSUbQXHnrBPS70BF0vmSlO2Dgj6pvfFwuQUR+lFoN1gTaafoB/M0okUMJRK4rlyfBZQTWQy+Z
	kvb+7hBk2VJLax+rxeaBuLw==
X-Received: by 2002:a05:6122:6b8c:20b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ec2331473amr4330074e0c.5.1793116532612;
        Tue, 27 Oct 2026 08:55:32 -0700 (PDT)
X-Received: by 2002:a05:6122:6b8c:20b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ec2331473amr4330022e0c.5.1793116532143;
        Tue, 27 Oct 2026 08:55:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66ca8asm483938666b.57.2026.10.27.08.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 08:55:31 -0700 (PDT)
Message-ID: <06818727-9a6b-4618-893e-5c1a78e00817@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 16:55:27 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Commonize glymur-qcb.dts to
 glymur-qcb.dtsi
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
References: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
 <20261027114955.1266499-4-sivansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027114955.1266499-4-sivansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MyBTYWx0ZWRfX8mE7nCHdaB2d
 sUYIukREN9RneVd7c1qnLr+3qAVWWEB0xNm+NNNGhpLbwIDvREkhDxiW1iCHoOHwG3L6PHpNc2Q
 y0jTrelbe5juJbj/EfsOSIxmviakkKg=
X-Proofpoint-GUID: 2DnIz_SENs_YNEDiiRqKGxQTkcZJxNhT
X-Proofpoint-ORIG-GUID: 2DnIz_SENs_YNEDiiRqKGxQTkcZJxNhT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MyBTYWx0ZWRfX2KG/be8B2dsO
 P7GoToVQWSS3MJ1/VBFRzN6+MnGxQfbprmOaso6eHtlAChy17HTKCzduXTrtAAkvYS/SZuEA4SF
 zuIDq+8f1AzL2MhJNI5m/UqLj5a1bOF+yuyjTGJQKNAhMqdXKnJ8qwhdXTKypU4pnII10LDRJy9
 P6RpZCHjEOz7Eow7V+7BPmGqirg/7joBxFM+8dyMvvhbJOd9fOvcUtkJOzeNsYqgRQMyz5pavsl
 wmJuhJfSXdUxOhbLRBrJDRlDbNIrDNZzqaIg8sNjW9yuKxy5WUD+xWPOC0rrL9cBwyrG/m0pVHA
 afB9fsXqO/CwtIMQPWLq90twwxbwBqou5YJFugpOtepA7OqDcUquCfdh57W6PtN8nBvmPTob88T
 L2EURJnIcmfuguINNMf1uChspBGiifaXpX+SLqLMB/5lSuSpjM1JrF0d9oM0j/2E/yLeKMwNONK
 JbPcDLzkwoIwaR1abtw==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae0c975 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Ih_i2Spn5ghOVsltRIYA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270063

On 10/27/26 12:49 PM, Sivansh Gupta wrote:
> Glymur QCB and Mahua QCB both share common nodes as they use the same
> underlying board.
> Move all common nodes to glymur-qcb.dtsi file to allow for reuse.
> 
> Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
