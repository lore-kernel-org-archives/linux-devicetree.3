Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BBE3C5848
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 10:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781175043; cv=none; b=oVrEY4KI9x/lkWZBHpK490AGrP2r0HIeEhvEU46/JQp8o+qUjY32t0dN8QKGjoMB3N+n12kSxCG/bIvvFZZLGxV8ftot2xVw0Cb3+0cTRt66I245/VO0+Ft9PTyff6BZu7XhuuVyjLxWfB18wNUc2ix0X+ct1omqZq1yjaRXLfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781175043; c=relaxed/simple;
	bh=8ZWWOKTpAlEnSk2zG7CdZOz5PMMpg9lVIa4oHXZQlfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XclpMUgu3eq6+y6UapQwAMtHgDwyzqtD38iKX9CaeXlpNWxdzsKT5GVY5mrHm0yChzUVibGZYmvoR/oAAVKt4PIAnHbz0BkiUh77ACokjdjcsXy490ceXjdLll1zOFWbtka6GhY2+2Rg+r45DxQCUepmBBmF+pVIE/cY8tSmysg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QEuT0ujs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q/u/rHdx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QEuT0ujs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q/u/rHdx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA0uPa304010
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 10:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KZ/dU8Ix6ev3UMm7ySdSUm/kqyhRsf2+eLAI2/zCwiI=; b=QEuT0ujs5lGyDUK4
	22q/wYlbS5TK4iOx8WdigJPf5IcU3G5nAzI56/az6Lt5vvFBn9Qk3Mb9StCXTUIK
	S5tawApvciJGb68s3xIq70RSP3ebxgM3E484S/oFkiWTwafhy0F1Hg5gYo0P8XQ7
	uvt8A7Wi8h8nbETZ1x0df6I14lvS5OEh3WKhSYTYym9b5gQ8CpjswxMbX8N9AKQ3
	4IU92mjrq6+l9EHlZgPXsSKdwnu3+/hLYkZJzlNe35I5oNuRjLn4DVGhEzsFr1Wd
	up0uhyEr6FoZnDmMs0XnAnyoDICAmxOWyRuG/Q7ZGqDx78yFqXTWt7mgm887m6nd
	bJ9iXA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqtb5gaj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 10:50:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5178ac43d27so21879441cf.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 03:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781175040; x=1781779840; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KZ/dU8Ix6ev3UMm7ySdSUm/kqyhRsf2+eLAI2/zCwiI=;
        b=Q/u/rHdx3kxczXu5Rmi+xoPxTi5BMy1r/j26DaPx0Q/TgVoHYqagsuSH2IPPe/RXZy
         GIWaZicW+QIyXeNdBzufjXG3HCI83M6DzHXMwjhclK3OhSdYMycmNJBzsXUtVKDZA6ZL
         ANrZSY/yHtD8FUodKz056MpkYb0PmIo4vEGvgETHwAcK1seK4hBvS68e80zo0jgF67QB
         thADwG00DUVgj1Ri2CG+r4/DUeEgxzINPgpaZ74gQwxoAo/gbhNsHkEIeHVTAC8rtylX
         GEWKmWxfC2tBy0REmAX8e8OTweLt8fXpmy6Z23m94Hg+Ql1UnjlI7TYo3r1qCUZJNNi9
         wEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781175040; x=1781779840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZ/dU8Ix6ev3UMm7ySdSUm/kqyhRsf2+eLAI2/zCwiI=;
        b=fuMmtlKgLSKRjgpCX+5dFXVSMkykc9e/qFcXFFJ23HF1jnJk3c9A4J21KXiKBvObZq
         JvX51Q473LZ46KLpNB4y8+W1NKxrxdW83L3ByFVwB/8e8R/qjLI8bgcCGQgYcloFJF2j
         1Nmy1QU7sEQISYcuxuzq3D3ejEZv1byWhVE1RgNiph8kAedv127k5yh2wIBaM+Z5TtjI
         2fiS4witZJhnJ0UbysSwPyds87i2X39NVJs29WoJdCnogsSFyqIPm2UqDsRDDcDnfsAS
         T2dlARSVxw2f9VqXAeHIEE5wfbRwJZExuwfVPbUDtOWuemSv3LOK7UD3rWTcDyBtgOqY
         i55g==
X-Forwarded-Encrypted: i=1; AFNElJ/5PupRsI1bDMkUitsUw4YX8tFePhgAGEsQf8MkmkQo4IvcS661sIqPtn4iVlzwQ+LVLGbYl3aHfRc2@vger.kernel.org
X-Gm-Message-State: AOJu0YwBsxf2qLLp29X2tfqhn894R+xC4u3yBJPoZkjklYOsxwGFbDOJ
	o/Tda/hY9QqQcToeUbSoYPbMrywPD9olJH4wqVrZzT/t/qfteDi233w7kf0HsOLIMMIe5ZZUgrK
	VUkJzEgxFjjSa2ffVpDcxVE2jTDCHG34EQqC7VAzKoWaRntVn769WwyNkFMpSxb2Y
X-Gm-Gg: Acq92OHUJfDuaRMfvEWjgvb6sSGjfFTfbwXFQgcF4P9h5jSC7Izo3nOnr0walQWal/y
	Fb6GYBHc80dT2ACuKHOdzu4VZPzWpwNqEcXYXVyNEisXTmrd5IjSoqHRk4wawHJTJfpfO+Hctjl
	2KmdvLenrFBbErsqzGjIeuZtsxjYAYjnQcxczmE4pUmYUWkyi2G1/8V4WxNPRMHOdGyKnYba12p
	ljpT7k1xuJ4rim+kq63gYcy3ja5TZcEo+J+6FnOVEYzIdMiRFDR4FGHCWsW2TXdgY5gOjaXpoWZ
	6KfwPvGgtqZuhgrCoQUWZSh0g5wWkGzLLmSAWZRKk9YnzMtV5fE98tAB+4kxj2Hxd8fd/VYezNM
	0C1aRjdIw3gBT/cmyJfzN1sS95pONe25zCXbSVr4Pv14FGB2bzqUrJo7p
X-Received: by 2002:ac8:57c5:0:b0:517:8999:6c50 with SMTP id d75a77b69052e-517ee28c903mr21050741cf.8.1781175040375;
        Thu, 11 Jun 2026 03:50:40 -0700 (PDT)
X-Received: by 2002:ac8:57c5:0:b0:517:8999:6c50 with SMTP id d75a77b69052e-517ee28c903mr21050521cf.8.1781175039910;
        Thu, 11 Jun 2026 03:50:39 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb53c23c2sm48462166b.40.2026.06.11.03.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 03:50:39 -0700 (PDT)
Message-ID: <c036a07f-525d-4af1-9e87-d62e111cc908@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 12:50:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] irqchip/qcom-pdc: restructure version support
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-1-f6857af1ce91@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526-hamoa_pdc-v2-1-f6857af1ce91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEwOCBTYWx0ZWRfX2vwVnSkKA2y4
 WYhdolFVfj4cI0RPSZ97YWKjTVRMQTWQV0mfAOqy2IS+2CNobEoCwEs7uHLB6uHRTjaXDclIt4F
 mNzPMMB15xnJGxVaV+oclFHGaAKytTlvpd8D/da8uT1zbi6DUrbgogUAhpFtw1sii3UU9/zWyCj
 B7ySzTcnVzHKnk/mRKNFUYa20LNckSo+IdvfNkyXWf3iap5u5DItjGoAPnNTNTrsnloLLUsU4Mu
 YncuA7AJUEE+nHcX6YVcv90zAZjcqHHIU6JoAXmQpIQbhh8ZMX9riiACbwDtiAevHakhclQ7R9V
 MRhXlREE3X4ZuY2lOJjzjM+XTeVzy0y2kCmMLg8jKhNhK+7nlYsvWj/NXx/M45LNT0SsmAGo/y+
 AgxLPru45KT8FN/iStAXemgE7URQBJIireh9JL/L0HkiVTOEkSfcFwEf57jCYG/LmN/P8RJh7G8
 vlLE21cwoig3W+VxHuw==
X-Proofpoint-ORIG-GUID: xLeY6ciZzmKEw1WoHzOFvjMgYkW6gohH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEwOCBTYWx0ZWRfX+BPWW1Rvkb1l
 4Dgt58wIqCoNOFMv9RcyoIk2hUnd5XHKMu6+2XcHgUWMzjfIIC3i2n6uyj45tI49cvJKBPEDaYT
 Pwv4rDMlZcnx+2zUWWGlb6sQqA09+pA=
X-Authority-Analysis: v=2.4 cv=e6g2j6p/ c=1 sm=1 tr=0 ts=6a2a9300 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KDmjLdlVZ6sBUA2Pg_0A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: xLeY6ciZzmKEw1WoHzOFvjMgYkW6gohH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110108

On 5/26/26 12:54 PM, Maulik Shah wrote:
> PDC irqchip updates IRQ_ENABLE and IRQ_CFG and for three different
> versions v2.7, v3.0 and v3.2. These registers are organized in H/W
> as below on various SoCs.

[...]

> +struct pdc_desc {
> +	void __iomem *base;
> +	void __iomem *prev_base;
> +	u32 version;
> +	const struct pdc_regs *regs;
> +	const struct pdc_cfg *cfg;

"cfg" is a bit vague, perhaps irq_cfg_fields or something similar?
That said, "irq_cfg_fields" isn't very catchy, so if you have a better
name, go ahead

Konrad
