Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487077;
	b=h3VwFMb08amjMlJnpGDK6I3YUCNRGFNte1Gc7T1/Zb3W6Y7VelUefatP/VMIzfZV+M20
	 CTg3xzAp0Hqx687QrXnNaR5HiK9uyR7uWzkJT+ivjjQ2xmUJzk4+GDxW8R3iRPBeJg3xE
	 yMZC3uXRKoY2J2VnvU5prv2sKabw7nn1Hu43amGd2pHRYYzPk4o22SyeOzcDvS+wMPAas
	 W+3uQSzpThL7axeA1tg0wmR4PyPxGLtxxH23u5iDpidutQgt1QguZ9U0zwCgqP9iQP6gY
	 8RBbhKM6nwDzH3sMisKMrUD+tjDMaAxxksAtuxdJIBRoRA6DwmWuzC82/C/aUbIp2Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=klQOpf+HavRxRFNlSNefqEWhR0JJ4OucrEz4ZjfbFU8=;
	b=by4DCG9vTrFP20wtmdtU0M5aBfD+v4xFcH8w/PaVivr5RUtrjJSmrzxcvGe3ozSB0PIO
	 F7fAATlDdoXYLtXyg1E2ims9fJ5yjO6WGLm4+sdnr5e/WAE0ASefgLhVi0TqFdElG62EF
	 giW6ja2VTuyqI+A9X4wju9Af8BUsp+OJP32CHHK8UjkfmPJ7Y5XcI5gWBQQJXFnCIsd7s
	 Avk8PJcHvs+92dpWtFVDXpbHwhr5l5/0YMCtKtK7VABrPJ9W8EeGUfMHkbic9YeAh61yj
	 4QP9re6zpiyMqP7JcLCgKX4wMegzUjVWRrrCodc9sNZzjR3uMgBN9EN1RGFzFDivUeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPpIsLyF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EshcJ5Lx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9311606A331
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 12:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9311606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPpIsLyF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EshcJ5Lx
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7oW9v2818579
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 12:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=klQOpf+HavR
	xRFNlSNefqEWhR0JJ4OucrEz4ZjfbFU8=; b=ZPpIsLyFlzvsrJvB0C/y4EP13Vv
	jgneVLSaabLJyzCH6rNkJlgm9eGncJsFY/RtZPkhNuEQWua/wJgwpZpfiTVLJ7x5
	9pjcIixWQbc4MMQ+wZG8xuYgp6L8V66mAynaToTuGARCLDgK7xQGGykq121oxzpj
	eDapA4FOLK3XpAQKU9FGw6Bebwdg4k0ei+MrnneuzAMeZKExWgaST6rt75xW9cW3
	0C90NbS//4FVlF9/1d7Q8IX1z8dO/RqVmZZQ+ARkeYcx9ywGKvzBZX9ApN/nn3lg
	WIYIzrUaqDXsx4Wxn78PRy2+TK4LiGMF9W0ZVNshJ8LhlhcOvjuKbCIw3bA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e190rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 12:37:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-947a607ec40so297280185a.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794487075; x=1795091875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klQOpf+HavRxRFNlSNefqEWhR0JJ4OucrEz4ZjfbFU8=;
        b=EshcJ5LxyFizzXWgeXmVqSGNlO1yogXHmur2ZJtqg+0v0mK43qYlPSDs/xN8CKisqI
         628fwRrXPo4IqdrVtkvThDf1tg0joDG7F7FhUiCX3p0NgjmT5AzGIVHKYUVrzrO1LxTA
         3ZJD2xUsNhEt1XyTmZ8r3QAKdx7GAsu/Yuipkqlmxyl6+BstYGlTqTIhmcYk2eMsHFze
         //JLHzZSLFAhlVAdd0Oq1O/Ny0h/FKf+idnBkQycXisbG6NSPyQpLXYEMpXSNOmiqpfl
         HYqEBgVwqv/DcGt9MYzZm7iZEmgTu80+ath5+9du6A/+wFyUoTGAS22nm48g/cmXqez5
         AOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794487075; x=1795091875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=klQOpf+HavRxRFNlSNefqEWhR0JJ4OucrEz4ZjfbFU8=;
        b=QsTNuMuU7HDFKHELvECjC/ou3DCLZ8biq+gV5Y2q27B8yv9Hu4Sc1b1I2DaFRpbEDU
         OoW/alZAQ+o499hfdUVOYzpsnrkiUoNBcIb3EPwDZl9Nsg8BO+EUfaSWU6hPSMn7xyTR
         STg8CkM3ECv4p8UmgtBn1UeEhrStY3YReGh4Cgw+3H6QMt0srDNBzWGOh0v0uzHbK+uq
         meu/qV2Rnu5v/whHCeU83iinCAl558NqZE3s+7cQYudA8g73XaNlIR9Gpc3oIaLmdgi0
         HFyNizS8F62EUTtNztm3y7K8wgQFvsofBoVKQ2i99jk5BhdBVH4td/RmV/93okfBih0s
         R4xg==
X-Forwarded-Encrypted: i=1; AL+hErHTjECvvtxgQSOa6lxvQbFijinbBifOvuPRfz6z8CX5ls39YPKwhL8BcrzhimL316jYd+90PCCNf4pg@vger.kernel.org
X-Gm-Message-State: APuU4Z+8AJvkbWjI12ZpAnianIQkBi452IW4Y2MTnrKCINds25A9lULQ
	cucu+lEzuVqZ5r+1PvhbWWr9ITbAoynU1PRiDrwo5I2HnEEDY+Qwh1owBbuB9dyo84/zro8l/MI
	JvSAm2p/Jf5e1L5VybB3KAgPVhuAUS3H6JlaiJMnybtnHPZLFOqBeIAul+stusUVh
X-Gm-Gg: AYBFou07rR7okdBYCg7TAyWKrTZCSyhNLhbnDAJdVZNTbIfbA76WCRdYOVdDc8UU3ls
	DPBWuZX+QmM9nTYnE/52fMiC+tzSlYc+BOqTX2hjNe19H2CeELPqgWTtO6GXf4P/bGsF6D4n7mm
	rGF0bhhguJ0A4gz0JkqEeqwDtUO7WdC79lMZZTVK33cVaWMqkgISCpJDH2ikaUUn4FkR1mhnpUV
	BWlSSkglKs6dZZOkyjPYXlAy+aXc+5vb4XGsCmN9D7zg+Ch7R5isOoutmHPhk/Gvp3MF9wo7gh7
	mVltPTyYrE5FhmytEvZkUAR1LvT3vV/drIiNr6qbpnS97CnnA4eghoJ7AxB7G3Ma0g7QlvjjRoN
	W7SZxMkyh5w9wwN5w6/3PfjV9uyTj4rQ9YNpfJ1vz3lnuB7GKuErNINM2Ht3tOKqYc/g6WwqqPw
	==
X-Received: by 2002:a05:620a:2b8e:b0:93a:2221:5460 with SMTP id af79cd13be357-947affc0f5emr875240585a.40.1794487075215;
        Thu, 12 Nov 2026 04:37:55 -0800 (PST)
X-Received: by 2002:a05:620a:2b8e:b0:93a:2221:5460 with SMTP id af79cd13be357-947affc0f5emr875237285a.40.1794487074769;
        Thu, 12 Nov 2026 04:37:54 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a59437fsm331534766b.38.2026.11.12.04.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:37:53 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: Re: [PATCH v8 1/8] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Thu, 12 Nov 2026 14:37:52 +0200
Message-Id: <20261112123752.711726-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112-benevolent-discreet-warthog-1dbf04@quoll>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com> <20261110163909.78085-2-atanas.filipov@oss.qualcomm.com> <20261112-benevolent-discreet-warthog-1dbf04@quoll>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MCBTYWx0ZWRfX0Z7ajYKkwZbS
 P86eNx7s14nKgzauMEI8EsLoqQOxNJfM0/zcBDwQswkoSTxHv6yQ7O5gR8nFPv/dJ2SMbBTfpG8
 kdhnrovL5mQgUmZp0ckBgtzLHBlELi+s+C7MWbnXrYjfBWRRXm+w3YVFbTM70/dLVVPUgibAVpd
 yx3lvqh4pLEhaYTpoyJqwUEMXnE/XWjBRpHLRJfsI12gfYBcgtIL1xDnusLyLBYOSt4QsxU5HmK
 TzDq10KPCzt7y87ZOJFhGM9fU8+CQmp4eWxQffWtEJ+8t7KjJoAsKVy8pBiQrwKwkVsUNCxitLJ
 zLm+oRTRbXWl9tVYg8do1C7YXESYkE0Xi8Ohf2qboBsBMaRenqsQ9DJI2hFdZ0h7GtP3wIcygg7
 5e3CWYE1MC6d0PdYLsG2gknu+XAITxA2ZoYuZCNiXOHlxIdtDJY1yUqOYXJTomwYMxmRY1+X+qB
 pkqAsUY6gUxuXjuAemQ==
X-Proofpoint-GUID: KRsYzWYVbwJZVwxZhZe2jvHq7zS9GgJp
X-Proofpoint-ORIG-GUID: KRsYzWYVbwJZVwxZhZe2jvHq7zS9GgJp
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af5b323 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bWJBzm-gYxnYfWmHbWgA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MCBTYWx0ZWRfXwQuVKBgsvOX6
 va6PZr69MBfKyLzHY92Gg5c8jmLaPB4mjGO3iZZk/h+LmX2D85uDzkw9QGuakMtOFZ8bjEIkgZX
 9rZlhXTn2U8IT5qWWT6G3e0bh0RMM0c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120050

On Thu, Nov 12, 2026 at 11:02:13AM +0100, Krzysztof Kozlowski wrote:
> > +    then:
> > +      properties:
> > +        power-domains:
> > +          items:
> > +            - description: Titan top GDSC
> > +            - description: MX power domain
> > +            - description: MMCX power domain
>
> CX and MMCX are the same inputs, right? Then make MMCX second, unify the
> list at the top-level with minItems and here you only narrow
> min/maxItems.

Ok. In the next version there is one list at the top level: titan_top,
mx, cx, with minItems: 2. The per-SoC blocks only set minItems or
maxItems.

--
Best regards,
Atanas
