Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2131B472F85
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 12:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787056418; cv=none; b=YQqdH8M90ukVCxplNtzo6T3tPHX6x0UZxFanDTivo0N1BLzY1X09tsDn6fvmxcIt46aXEXgpHZP8NajX4gC77iaO50GcPXYYTTerqF/X/yTmydg1+dkc7rEyIBJRkbLP2inHQmlkcCd5OFlES+dw6QtAV+lRMka6qLXbOCuoxw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787056418; c=relaxed/simple;
	bh=3vnlquusfDO3OCQI3ew07Qh+TFcndKHNQ6h/6Nu+yNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XU5VotGvRWXpHDSV6ixvI4+2sW7KQwKt5Prp3bspm0TNQQPT9v1+3LABWqtgqic97jT5OTSTSJYrCNMMEtOZGqnhpVr85dnDcdsHNaEIw+xWOXLeDVz7gG6ZCjoVw+flivpdBv1dRwTBa0JWNd52XHL8BugbjDuYs45Slt+liXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oYzKq5jz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kYWDwttw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oYzKq5jz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kYWDwttw"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABZJG1544897
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 12:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	14IBaCEa49pzmaKpgnV8Y/NwAMvT4ZjHjKK8MDfV4F0=; b=oYzKq5jz5u6QBv0i
	x+jcqaN6NaAJkS91y9mzw3XCZAvCe5wTQcD2nTZpRQigJe/6gJqV2MvLo35YuGyj
	DEBKQrX+Dpj1tx8OxpZNHSg7vnVKP6e0AlWWYvFzGb4Fmj71YN+cAo9NeuZcCNYM
	BPyQW1F5zMP96xJ9IfJ5kRkMIsPaJ68JOlxOq3LVZ9KyXWY3b8WICVNKrZfVA9hb
	HLfzwEV61SgoIiZbQQDqalKXwHN+rE6I9vp22mTM+aKbWCUxK/daQ5Tfc8MhU9Vs
	+DMyuAAFA9FYHREvB3kEVrSBeICVjVVi/6CaehgF6qAXhCKT8FISdwr2YWcA+yS4
	dl3bDw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4dcn2mke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 12:33:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52845bd815bso5787521cf.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 05:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787056415; x=1787661215; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=14IBaCEa49pzmaKpgnV8Y/NwAMvT4ZjHjKK8MDfV4F0=;
        b=kYWDwttwqBiTG6wAWTNOjx9dOchcLyxGjJePlyA+cZyBODk/cCjMMjToaDNavMdv4w
         2plJg8Hfr2ufllDLBtM2MzLfTJPmOf+MuGf4iagRB7kZYt8Rh0FgFkWc1VMjDIhrZXo2
         BieA8JrnhmWC46R5TT43/WoMZ5g52EBJkNZoeK8RmS9XcexW8c72Y9vYfolRnLfyqZT5
         AjoiyPqmdYdKCtewx5syay7Ksn4rpu4vM4KaA40SNpXtT12mo32dDcLwJxBwIUvzi94Y
         NbiWx7L/GP7bADdzAlaUswCCVuV1A5PkGZiAw/i/kuR1uFUBhgWaZX9h8HMWGNXN1loC
         rtmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787056415; x=1787661215;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=14IBaCEa49pzmaKpgnV8Y/NwAMvT4ZjHjKK8MDfV4F0=;
        b=hejzsNNeBz25lY6bIbQq7pwX5dByOSq8vUr0z+BEodKIZ+Zba7xWM2ntlbEyZVBT7W
         BhoRnWCR4qlGdNm42fgzcglTC8Rad3cTaLijqsYWvDvedmycj38DMW4xmGAl+mt0vt3e
         E4dkraeDXChRbaHrWATieaMl7xt+hGYvlbqmlQCWC7UYX6Ob/osnW5q94cyA8DY2Fvth
         X0REAHK5YmFuql0fHDW3I7Rvde2JLjTNng3R+T6xT1m5kJvOzxgBZ+KrwEAmSTTOO8Rb
         Jbg+zwpDdQg7ptHew7rP1Jc6EFugecKNXFO8dQcQ/0O2hpHJdCeUmWlIqvpoOyEOErm4
         RFiA==
X-Forwarded-Encrypted: i=1; AHgh+RoH6tynPydhd4wRr0mQMMXb48Xu5Nb3Ja0fa0HklR6jsaWw1eZuAAREP+TMZfFAMzvG9TOVz96KqxoR@vger.kernel.org
X-Gm-Message-State: AOJu0YwOXegmjE7MvgEcFh9l9fXGGv1IGKxPPrgozsuazcfT0d25EFZt
	czSswFAYSynB3u/iCTsimplh/KZJDQBnCD4VAWBl5OQ6eRh82rs5e4/WU5BpUKs7o6GNW07AlSG
	QcyocIC6SM3H52PacvSttPL3mGN4yIJ+liSFqkXLjGrg3L4zG88iavIvxyMa366Xv
X-Gm-Gg: AR+sD10a1Us4T2BhLlUGqcHo2i6ZgFCASO06wfprrV/hEycIy5vi8+hAqwvFVOxbpNj
	xT6b1KQJAR70LE+BfTPxxLV139EVynHuB/CXgAsgXSTEVp4NURNCyVNET0WxHsd+K+ZcMaH7KRK
	ovrY18m2jRc8xRvAR23VK59snvTaIcj/isO1FNbUkpjBfUgZ7xS+Vp+MPGX9jMrTJVYAsomUvdd
	MzrPrMnRSYzRtVzK0CTf4ELorqxf7oHrVb6iIuhCNAyhRy2cJPM5Ut8js6KHRMK0uOv8sYDQrHc
	5fv3oxMkhP3GhkUda9dKBY+gc7N7CHg4cPgws1bdrb+mlx8KRJD78/zc3sgmLhcKoi8HuUW1dds
	jPpeBz6fZoZq+FNj7hOBoljev
X-Received: by 2002:a05:622a:1a86:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52d9db28d13mr159453231cf.1.1787056414838;
        Tue, 18 Aug 2026 05:33:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1a86:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52d9db28d13mr159452511cf.1.1787056414300;
        Tue, 18 Aug 2026 05:33:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185bc793bsm146675366b.57.2026.08.18.05.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 05:33:33 -0700 (PDT)
Message-ID: <7f4995f3-585d-4789-a30e-c1dbd0a05ff3@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 14:33:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/6] arm64: dts: qcom: mahua-crd: Add PHY supplies for
 pcie3b_phy
To: Qiang Yu <qiang.yu@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260807-glymur_linkmode_0807-v9-0-dd1c7e236e29@oss.qualcomm.com>
 <20260807-glymur_linkmode_0807-v9-6-dd1c7e236e29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260807-glymur_linkmode_0807-v9-6-dd1c7e236e29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Wk4BIUBQRPx2pYoFA4lmihffrR7z7K3Y
X-Authority-Analysis: v=2.4 cv=Gs5yPE1C c=1 sm=1 tr=0 ts=6a84511f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=B6dnFezVkazQL_yb00wA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Wk4BIUBQRPx2pYoFA4lmihffrR7z7K3Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5MiBTYWx0ZWRfX81MQVxg+zdkQ
 le49FpZb1ZMBei7LykLN83Y8BiUDRw49BFx57q9w4MgbfHu0cSeq9pvSnq8DEFbnh0BXBuv3b3F
 UCPDL5jZAA4sXbSuZ33yDhW60xnKBHnx3V/1bMO/fCi1MoNE/OQZ7y3hS7TPKbHZAbxFNUa3Ye6
 4BlyVf+24bXA1oYUE9k7xnglIP1QOW7k7fNMyKupUK/k1Q7hsc0jSYe+RHsL+ZrXUFcBu2INX8j
 ngZMB8yweVoKF/x8pe8L4fEw6fhD+zlcfx0GbuoBVdJkuSSB8hCsSDPEqrl2IbBsqOdXsEvH/Jr
 hIwjxSstK/Tw4FNCBrN3EL8RgkBFxnTd80lR/cCD7zaQTo2ED8AJXWJg8WTH0J1mDIAK133NyFa
 szBBz1alszLKnFN6qKpZ7hTbWgbomF4IEcEQTpZ4isYCnbSEEhGfTpBUgmw8TZi4cnXBJHAcpym
 yDth9+hlGea4wsBCoqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5MiBTYWx0ZWRfX6WydzuUYzLiM
 fkJw5lFENKpiDB5SN82J5nR4gwsdi2nFHaAXTjXI9Qlzhujm1i5ujYD2F0U5qyqoovAVVJrVl0h
 ecNMSPYk1zasDZz15yoMJQttdHoITIw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180092

On 8/7/26 11:51 AM, Qiang Yu wrote:
> Mahua CRD wires the dedicated PCIe3b PHY's regulator supplies through
> board-specific PMIC rails. Add the vdda-phy and vdda-pll supplies for
> &pcie3b_phy.
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
