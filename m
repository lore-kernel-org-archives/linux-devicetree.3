Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975CD31A813
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782725234; cv=none; b=XFVg7w4NUbLB530UypSHqX/8WHnfN4qELbpDOZN/id4O6hdOYnYcDkM8RtKLtNLY+RyZvoTL2ZRpQCYZQkvX3Arlb2zzuRrd/xlASMyJDiLmlgMMUqK4xn2GLNhxBSQJb+quyawdSOV+8c9UISNVlky8/9Fuv6Q9xHH3z+SXn3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782725234; c=relaxed/simple;
	bh=XaSVnKAnendPV6GPMJWkve2jJU5XwwwLUFD5CfyFpPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jCcvOfoabhPrV+IJx/5H7P5W1SxGm/1/V4nQHKr/4E8m7LNDHdyi8xdhtR6x8Zvf2CSrkvbrcm+bREA7+Ih422arl+i6T95yozXzN1Z2lLmwtf9QxeRmztsOIOXQUT1V+hMuHEN+hFGW4qtWaAqHcprCPte/XpTPi9HNvJMk0EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JtUI/vMT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jod1ktDJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JtUI/vMT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jod1ktDJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8wX652391268
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9x3KQzESmlpy1+Lxmk9RFz2k8qWnJoKmW7MCPTftJ+g=; b=JtUI/vMTp1/XzfGR
	2n4t2+a9or/JNF8Sp7keVp/VXFDOQD+PRk1I5VuUNfZgbfNGRSHlTUJh4ylBAiky
	jy9hjkEy8udk+SzKxht/xSQsdQtSbE9qASif5FZoOyK0SXbbwcOF8hTbVw2P8R0D
	sS74mzeZIAohC+eoX+7DBqgjAc2PNC9tK1j12WAiX+XPKD5Ts9Hytxxf/BJl5wo+
	kqwbYPdPY2muE8IxGHKRxFhF3mz3y8tA8PzTjxOGLi4p+Pryn0w+Z0vQOmzyZr+z
	hLb0EgyfekKJMdwJEmfylx1iOx6OKRv9Ivh1J3rNAvppBea1rn/HspZ8kYTaE6MF
	zPDZcQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw84d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:27:12 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-96917d46b8dso97892241.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 02:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782725232; x=1783330032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9x3KQzESmlpy1+Lxmk9RFz2k8qWnJoKmW7MCPTftJ+g=;
        b=Jod1ktDJmTxdRAJycQqZeNkDJcm7dKdz6568KfRvCNjvz1NPgYi75nXMkmk+Jb/iqc
         8qkLfh+PSZdVj+1Nx05K8VHtw+VTBTFJ9T2uEgWFG5fnLy1coRdvAhABsEa88Ux0AU1S
         O/jn1liBnRP2nKasuhUYFF+3ziBPihTVVWTDf9kzfkCkP+1fiIcmeygOW9Ur3GpU8f8x
         TVLVqKVPxiCPGcCMsTUhnAbdBbrEyxsWoylPoTTYn1qC37B3Z97rzOaQLugPoFcA04gP
         Twzt1KZp19Md2pARTNS8CKb3XPasapVsdVywwIw7vek6eCX9JLySTaxoK/1BnX5O0LZj
         OQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782725232; x=1783330032;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9x3KQzESmlpy1+Lxmk9RFz2k8qWnJoKmW7MCPTftJ+g=;
        b=KgOinP9Huy2u4GUagdU7J9/l06MYmqenJYoyQvXG5f3gC/FZmvBQJM+2b8jua++sOK
         mfahlNZeDAp8KeU/iE49QwMYWwZ0pUl1uum2n6gEB7QjlT2n/V62JqN3JbgQ6xnUDcdU
         rGH55VAmrRaOUYD30206k9lYCQrfIt0FXFxgZDMtI73TtdpeXd4OQ0i4wCUaws5/XAFx
         s2ozZeLmh0tRWiENfiQXzn8lKXuuVDPcDOz0wlBNaDLsj1ftk9KG8slih20V+875au+r
         l3BuRPWm2dq/jKkHVpR7bDLla58DtfF1ttG/CliQtbQ4BA8Pi5XcDAL5RfTIpJDi56LM
         JAfw==
X-Forwarded-Encrypted: i=1; AHgh+Rq5+jtnLFBk4sl5fS4MoWfhNE/KH9EWzq7wxDGTrFDvmDL+KiYxJsBy3bEb6rWkucs982viO4TLBxTp@vger.kernel.org
X-Gm-Message-State: AOJu0YyqLGUoAwanRynYMjIp5gruyZLzUr4w5WhOHqEKzjc071RWegBH
	abNjumEytgi1vv7r7f1ekEjow9a2IHLM2d5od/7D8LXoFpD7mOCNF2ww+X2GLZ4e35sWo5Y/H6G
	Q4Du0a27UZPeLLHufGjvIjOIJY0hFMszmO5jsp5TmDO4dHks5dkvG2YzBRQ5CyDmy
X-Gm-Gg: AfdE7cnOZWJQWZsA52lqx2O4ffjGxYJsXXfpjYv63PmlSx7M5K7e7Y69HgxiDmzo1pD
	oVeX7r7s8HgBRrpxkOh8P8lL0dKOxv2Qwk37XMUnp9vpl90uw+NLx7kBMXuD/P15VMkpEyskAC9
	GddbOSgo3y5LS0NOvnsGeW3vpTGtA2XlPRH4wJs+wLgq9e6MmmHy8QIQTXHkTJ5tf1TOu0HEBOc
	oaAvxSce+Y5AK9hFz8MPDBq6R071KH0yVB9Gzl5rNwbLU/vE6X0cxYrXmezdDZYribx2XP+MI9h
	R2UUWH15SEYThO67+Jdg2wOz1pOEz9epMeg7UsLV1EV8PCm3nDiN48Vf+9khB9Jt36u6cPi/O9p
	XlLzXHi71NwOzNRnoX5M7pKOjmqjjH7rcEO8=
X-Received: by 2002:a05:6102:548a:b0:632:9ebf:6069 with SMTP id ada2fe7eead31-734360a285amr2389421137.4.1782725231916;
        Mon, 29 Jun 2026 02:27:11 -0700 (PDT)
X-Received: by 2002:a05:6102:548a:b0:632:9ebf:6069 with SMTP id ada2fe7eead31-734360a285amr2389408137.4.1782725231519;
        Mon, 29 Jun 2026 02:27:11 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f46e15besm6673651a12.15.2026.06.29.02.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:27:10 -0700 (PDT)
Message-ID: <1b578c56-14b0-450a-a8a4-64204254dda6@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:27:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
To: Jason Pettit <jason.pettit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com>
 <20260625-glymur-send-v2-2-00905324ffbf@oss.qualcomm.com>
 <e6c95342-b3a9-46bd-aeb2-a1384234476d@oss.qualcomm.com>
 <20260627190615.27291-1-jason.pettit@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260627190615.27291-1-jason.pettit@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NSBTYWx0ZWRfX3fBVf5rWMLqc
 j8u4L4eh13UxsGfVEqiWH/k8vyuiocQT/gmg7tNhngJr4rPvlIRizxpqFdi7wUxW6RYLhbC6IoC
 VCWhLAllE9IPL6gDwpeGNfENGttDigI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NSBTYWx0ZWRfX/8hXz/dKE10w
 5JdLj8U3M5dPT/efQvz8cVHD77LFGxe0n/k8zeX6yXMSZFZjMGkHqbB5XSj4JzVnSkwB5oc5jWZ
 UHSQbtWJQ76bdHN0TYp8vuxtWWSGVnpVJVBwqaQ2vJ0UT644tk3WtYyQimzrQ2IVDFegMLNumG7
 9+2AkLNxE5fO37SYeE81lPFLhz7P6Wz2ifZ7ENpOuaA8l1xRJzBz/mKl7gUcFhQVvwRFt5jbw7K
 S45b26zlNqhIpWWT7TSqA2ycEag2s1GM7IqWh8eM1y9I1EevUORivKWtoHKNAf3qiKAKMuSgasi
 0qtUHASiD7ZA9JigdyK6x6dSypLp6tImHXqwYYGia4xwkP/S6nfry4s0inDw4687Rxi8MOO7nd6
 fYPiB2sM8F0lwCYJsNKCEdBsVuI9BhTQBILxOhidkPZIpgEE0fz2qOhUopo1laaWY5wHscE9ywY
 EVcW+/E9qPvCqifWKXg==
X-Proofpoint-GUID: 97huaf1aH6HQ-_f5HbyVAk-vdH4wJlhd
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a423a70 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=JTD8sfKJ8PrD1sga13wA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: 97huaf1aH6HQ-_f5HbyVAk-vdH4wJlhd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290075

On 6/27/26 9:06 PM, Jason Pettit wrote:
> On Fri, 26 Jun 2026 13:26:14 +0200, Konrad Dybcio wrote:
>> I would assume it's simply not present (as every SMB2370 is a separate
>> physical chip) - perhaps we should just add status = "disabled" in the
>> DTSI file and enable the nodes on an as-needed basis
> 
> Apologies for the duplicate. My earlier copy of this reply went out with a
> misconfigured sender identity from a local mail setup issue. Resending it
> cleanly.
> 
> I'm not sure if the chip is populated, but I tested whether it enumerates.
> With smb2370_l enabled, the SID-11 SPMI device (2-0b on the SPMI-2 bus)
> fails to probe:
> 
>   spmi spmi-2: pmic_arb_check_chnl_status_v1: 0xb 0x104: transaction failed (0x3)
>   pmic-spmi 2-0b: probe with driver pmic-spmi failed with error -5
> 
> The SPMI PMIC arbiter can't complete a transaction to SID 0xb, so pmic-spmi
> can't read it and the eusb2 repeater doesn't bind pmic@b (only pmic@9 and
> pmic@a come up). I keep it disabled.
> 
> Defaulting that in smb2370.dtsi would touch the shared file instead of just
> this board,

That's preferred, and in our favor, since there's only two boards
upstream today (Glymur CRD and Mahua CRD) that include this, so there's
not a lot to fixup manually

Konrad

> so I've left the override here for now. The comment in v3 will
> be updated to read:
> 
> 	/*
> 	 * smb2370.dtsi enables all three repeaters by default; SID-11
> 	 * (smb2370_l) does not enumerate on this board, so override it back
> 	 * to disabled.
> 	 */
> 
> Thanks,
> Jason
