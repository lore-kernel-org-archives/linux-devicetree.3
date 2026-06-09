Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D8E48A2A1
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 15:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019567; cv=none; b=CpmI8VZd7KBsUN9pReEIJBnAeeV42P8G/wuuRsum+chj3B8SZnkdSHlFCxgTiIYs71iTvxYTdHJXHmqdFhgDkUYXZ/+K4WZ+Qwz5Xa3rZPQ6Dg/3CJ+lQK5EXm22bI90jFoB58ybqzEpFPMoENcQ4Rxa4xNcZS748mLDnuPV8hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019567; c=relaxed/simple;
	bh=fgOk7XNvoC+u0MAplMmtgtp2T5pEkQWDQ4VLBekrl0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k61scgGHCrZUzBxigNXBZVUq4eRqk9QDcc21+ZP77zaM0pB1tz2G2NQme2ZxAd4rlG157S2e3EDxOVzC020FM7KmrnRCJBcGHVXFOFuzDahnItzYBmgpMjdG6HpKbUj8fGIH0ujYtfi1w7LuqqLTpkHAO4kSvWZDAEmBfNVYPqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OWfcRjln; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PLlQ3wKx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OWfcRjln";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PLlQ3wKx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CmH862587838
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 15:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q+18VXdPn92dSS/R99BoxzgkupqNoz7YMkCeENIzjJQ=; b=OWfcRjlnu5uSsEZB
	LcCnGnaorNqUJRueNjxa2AySkMDV7QGM/lXFNa9P40HNg4wtf1bM1yBgmuNR/m25
	Zl9pSAUI62vpYwmEYcpUMkXCGSJ7+FN/HHT8cF6vaPPhgLUJOvb/eVpPfC8XIADH
	ID9bym+bTtkbQt5GQYtivJcgUnbh7LUe4oFCU885zMUOzcoysiDIDWKIEtpyXUbs
	0AQGaAe9z/yO7yK1+RA3hFQNFUnbR1xFjXeidWjwVsmH34Qooe9bSyfZaWmkAJQr
	RD/tTDT2svcXTvnP5L/+zrN5K79PHlRKLidttYOmtCMJKL7l4plGoC6Wzwoo4nht
	0YmMkg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epee4j895-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 15:39:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-914b8fd12aeso151134385a.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 08:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781019563; x=1781624363; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q+18VXdPn92dSS/R99BoxzgkupqNoz7YMkCeENIzjJQ=;
        b=PLlQ3wKx54NOiMEE33d4J1fqMc0osLk66LCo0fqeSYJ5vBw+o93BvL1gGQm5aK4/QT
         hwB2DrXKxUEV4KhqI4VfQ+JLMQSPsAYt2amO/OQonNV2b/c7TwqvlyXsvI2jrXGJ5E8j
         Iqp1u6J3WqdbmPO7M+t1rpkYd34DopWfqkG1qgQ55Ul8cDcXmBmO0pKxSoCjt4nfu0Ei
         19icalejoSJuEejQ+4/2YKaL1Vo0e7OnipstXAXrJ9aMgDFdPlWEIBP0Ld/kt1E0BxZX
         jsRCDoSpBdOQrC3SnG2+0ojoA8zElJ2Rosx4gOvDfk7+T0U4NzAFBvfuKQadmOapPRi5
         FJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019563; x=1781624363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q+18VXdPn92dSS/R99BoxzgkupqNoz7YMkCeENIzjJQ=;
        b=Szz30GNHTMHyL6ACXyJLtsPGOkH1gmLNMYgK72wnSw9+3NY7xHiOgWYAhfflEgw+HR
         1tnssOn7MmC8g2LmHPBpmQqLFQ5hKM+rRNgP8K8JyLDJ74162JKQMW8eQWidXR08cIKG
         CJFo234HJHWFsSUfT6xCd+xRQyvl1YkTzwA4+EES20mvdZPzpmPH8cw+hwz/ZJUxEmjI
         fEkAgSHIT5Ku5OXxjyl3e+5N8kB9VlQ0Y/DIq9556n+Y5lg//DWJNnCx3ZEYJcHCkSKi
         MCXLabtzOdChxJvV08RPXahnelJkk/SOq4USPBsjKb9xfbqel+VsUNUtotJBccmlG+fY
         igJQ==
X-Forwarded-Encrypted: i=1; AFNElJ+f/DVN0swsjZnD6spwi1dd4JUvwqSBdgqoGhwJtiJrwOshQdUHfsfHAZRIua0SRGJ83NOAeB1lCIyg@vger.kernel.org
X-Gm-Message-State: AOJu0YxPbC1cW8ciemo+hY29hgDRnROo4pEFuVCa4UuXl0kJRzgyECU6
	Mg6wo9fYT6qkunFyCpZ9FAjrsbYPiFMdzxajbBHM3OVDOgJkRToJwaoOzU0QzPwF541cm9W3mHI
	zIcSijjrNx/uOubA7I6HhCNl+nPsv8iTk6ja0p1Xh+QkzDcYCKA7fFa/RI/XKGtM4
X-Gm-Gg: Acq92OGKWO96kwfEjaJ6MTBZMpq64zeX54TGXpB2y8eTTV7sQpmulCUHNPgrBL2rKoW
	BgpwF90yTXpanuNlgMTuyD+usoow8Fou/m8YINGzu8eIv2Iw5Qh3xWerk4AZt/bXDJIPLd17cNu
	55flG4iRXFncRBFpgyJ8tpeTVLP3F8Z8pMFu4p0+EvL3y+7qeoC28W9Vl06tkoAXcHuxYcZsbAB
	1V/KfprgjMDTaxz1/QRmCC1M3oRLMuBGQPQr9lmH1ox43q0d3iyflVHHKn1MVPcqSmyHlHsPkcG
	Kx1v/vWz018fpjhoL2Y5CHLHOAd3nzp0hLlQ24T2y0MauNarEu2S1wT4TnGovdQVmzhlqJRp1u3
	gh2bQH7r3Jzd+z62A0SJjtENpfU7wR41cANgS3srbMKJqpDZYdGc4y0vE
X-Received: by 2002:a05:620a:44cb:b0:915:7c1a:1388 with SMTP id af79cd13be357-915a9daebfbmr2099812185a.5.1781019563283;
        Tue, 09 Jun 2026 08:39:23 -0700 (PDT)
X-Received: by 2002:a05:620a:44cb:b0:915:7c1a:1388 with SMTP id af79cd13be357-915a9daebfbmr2099806985a.5.1781019562688;
        Tue, 09 Jun 2026 08:39:22 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6595c722sm8851981a12.22.2026.06.09.08.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 08:39:21 -0700 (PDT)
Message-ID: <21e09872-af97-419c-9009-8d84af2d4ad0@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 17:39:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/24] dt-bindings/dts: qcom: Fix PDC OS Direct
 Resource Voter region window size
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PIs/P/qC c=1 sm=1 tr=0 ts=6a2833ab cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=04ycsxgslHV-TqkOUZcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: E6gNqU_arREP2QGnNyEqVF6-ve37p1XM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0OCBTYWx0ZWRfXy46KxzAKLvrj
 NTA1LOwO07B6DYGcKfNOWWKknS4RksXJiY2tUDvZR9SZxLaGW1x7og/c8LoCc3N95EcGq3AgxDU
 2xRIDXw0UlcAcWSQj5l5dhLiKdDkyGnWOpN9d2k3cHJJHqYfa/eYP+UetV2aw1AEwTaf67dKGo9
 cgHsKiNzgMEW3y+9zYluBcLprOAJU9lb12GLXz3yK1Ul3oU4FDaYNLKUnAf8VLtfQ3oK6792Tfy
 1lFDydBjUqggZfqWZn4qO1jilHRWERBDqsSWdcExgnU7DWhPTIpNq9K3OGUlwPf7eeOikepKSs2
 Rb6GkG+hr3yv6wIIAlBp4sh9higgdNJASvMqd/fhk/vLnRt0GOMFNTC05wOLRwIA3sJUCIcFxhB
 C3ikdumFiUQWJM9aB8VHEUzg9g8Bzu6e2bLFWZ5RmnRUhflzr7Gj+1Sr77KRWUaqrxDoPacINZ/
 7767NSvip9QROob4EoA==
X-Proofpoint-ORIG-GUID: E6gNqU_arREP2QGnNyEqVF6-ve37p1XM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090148

On 5/27/26 11:43 AM, Mukesh Ojha wrote:
> The Qualcomm PDC (Power Domain Controller) hardware exposes multiple
> Direct Resource Voter (DRV) regions, each 0x10000 bytes in size, where
> each region serves a specific system client like TZ, HYP, OS etc. Linux
> only needs access to the OS DRV region.
> 
> Despite this, most platform DTS files described the PDC reg window as
> 0x30000 bytes three DRV regions which was wider than necessary and
> matched the driver's QCOM_PDC_SIZE ioremap clamp introduced as a
> workaround for early sm8150 DTs that under-reported the window.
> 
> v1 of this series [1] addressed this in two parts: driver cleanup
> (tightening the ioremap clamp to 0x10000, refactoring version-specific
> interrupt enable paths, etc.) and DT corrections. The driver portion
> will be send separately depending on this series. This v2 sends the
> remaining DT-only portion.
> 
> Patch 1 corrects the binding example, which still showed the old 0x30000
> window and would mislead anyone writing a new PDC node.
> 
> Patches 2-24 correct the PDC reg size to 0x10000 across 23 platforms:
> sdm845, sdm670, sc7180, sc7280, sc8180x, sm8150, sc8280xp, sm8250,
> sm8350, sm8450, sm8550, sm8650, sm4450, x1e80100, sm6350, sar2130p,
> talos, monaco, lemans, sdx75, milos, qdu1000 and eliza.
> 
> The net result is that every PDC node in the tree now describes exactly
> one register region of 0x10000 bytes — the OS DRV region that the
> driver actually maps.

For the series:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
