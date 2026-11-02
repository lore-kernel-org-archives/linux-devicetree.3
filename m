Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618488;
	b=FPHqu8mUpWuQJk6xyBU7UxHs7cXNTUuheTmQH+URvJn33cHRwbb69+wrKb6hMI1fRcDn
	 +p8xHLdzYr2I+lanj5Rf1vvtRYbZFyFvdHBaqYFbo0zCqEjXjprenKQD32Y/nBG8Ayhsu
	 9/mUkngd+ZBH4f5K3U2sWizczGgnVzzhwRzArs0lNy9B8NWDRnYS/MTAroQGzT9XIoLt1
	 M+XlyVPYcyizLpykziQ9KDvbKeIfy5vaxm5fibcbcYIm8vmNIAQaMm8BVzQtymZFYZKkx
	 rVeyNuw3paa+p9ELns+l4BILC8aEaUd0lxZBl1I1/GFtaLdAtJmZqscJEEEB8WnAxdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618488;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Z+J4I3OYPOxASqCh0EPXD1+s4XqNmGe7nydUZ6RpcEU=;
	b=gLQpjm2DEiUbHLrpfSI9zBiIzYZ66B9tMqsemqGOENaXaM37pa+0DDYbgnWmqD9qCKlI
	 xz4JArYRP5b6dKtaLOw0Wqb08QOUgpwVSpvS4v1xALmr0N2TxCdxZxNzpQ90epyABMjHR
	 YuQ2oaJZmWqTjXgZvkMDiduTQs5ZCWdXK32xXsnHlzfVDFy/ZuKlFYoHszyRrBSMcV3PY
	 dCwNA5BuPbgBXsfmcuMEYuImlOA8HAusHk1NYJGZVwT8WINof7+JVX+wjEhnS9Oyv9Tvs
	 LHKl+0zaZEqFzAWyn7JRc6aRYXWHEmKWgQBFtv/KE/NWmyZ+V/m/7KR9op/tpYRXMjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S5ES9IIK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NmbfcXGk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896B2606A327
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 11:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 896B2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S5ES9IIK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NmbfcXGk
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AJEb260836
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 11:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z+J4I3OYPOxASqCh0EPXD1+s4XqNmGe7nydUZ6RpcEU=; b=S5ES9IIKNcnmiLF2
	D4WY3xX8TjLvsvqzoRrYT7+2OlHiOzLmw5J42N7BB+OisyNGIXj9c2FGyLTqN596
	8hrr2Z46JCYPYOOcyTYXy5BpTUDmCmN7Ha7+mZoiqlHcb2B/Gjifx5mGxFfAz6Ta
	TiHpS/kEUpcFWAFDWzHAfk0IlUHEVlEdbJCPoJJMlnJharZy+L/p3435dD8REyny
	kzCWM5yZ5Q1ieTE68rVyZZR9y7CmjxKqNcbkbeGbUQ2eGwFy17RbSJwvHMNtc93d
	0k71iYPvoVP+n2z0sxp56+1OgyF1soHjZEkcsRNUOJLVtu4CIeI1j3phUYfJEw8i
	SBJ7xg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvrgr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:21:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-533962f6bc9so6705801cf.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 03:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793618487; x=1794223287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z+J4I3OYPOxASqCh0EPXD1+s4XqNmGe7nydUZ6RpcEU=;
        b=NmbfcXGkR7oPxeXBtyW9llbNn4f1LuGBjWFcdSHJfgVXJdRqnusO7b4LC3gGg8Xp4E
         bEebv6UIGg5sqAPdE1ufpHWsXqwCsI7yYuJ1LMJXJoyJiBsysg4KfLqbZYTeqdZYXd28
         NeP8XAyADMA8LWaWOqlZVbA1Uq6dTKybDQwYQWlaIu8pov15f6SN1XxNoPD3HsI2U2tR
         dbrwaBwgcdItfHpNbFY2KMlvLWKQEFFtBomPbydVqmQZ/8tMN4pi/lrQ2gqH6VIsv+eS
         u0ACUkyN3YvmT6Ng7IexF93acw9LF/q64dnkmRkch/SMoHb8Wx15qFKmzTV0yXts7UQH
         UHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618487; x=1794223287;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z+J4I3OYPOxASqCh0EPXD1+s4XqNmGe7nydUZ6RpcEU=;
        b=vy1jESjTuHdO44o9c9zEcZJteRGUphXZZt1rhigA1g7SecZ554bGZAND7jrpPcsJU6
         7tguTXA31YCU1nISpntBjSihGZFJhVhAzndcKT13irwP0rLSLdyN/UPaSjKy37lcbvVn
         YwfxhcenGjmzS/hg1MqQKxNntopeA5JA79w/m+ydSDxbmaDksnUuZFbw2N2hOVxcMVNk
         4aaavPIzl6AXC4YifnB3cMFRf6m+ZQU2sMhrSbrR2YAHpKB4gA7WjX61i6EgMq6gZgyn
         ZbJtxBnGCGXsPj6Lqrpdhb5tWJcCHQ5PmnBeYRP7SEXF4oTBeRO5fixYot8avMMJHw/F
         RVIQ==
X-Forwarded-Encrypted: i=1; AKwUvByFKSwOhTHKH0Nfj0r02T86vJ0SNiDYd3e74HVyBqF6gzlrXmvDe30H31niZrA4CvvZk/HoEyTy9uMo@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1AuVhlp8juG5Tzra5sy2rLPv3sbN4+Y64eaSjniIXlg7mw7h3
	jTlZfBcAXo/vH73ngGlG/O7vTCNdEhkcxuaxNtjHrMhHlnY0GcykI1a0vUChaOJt+/gA8uUQYyO
	bl9JOfgMX3bdiSOs3dGixYJA2r9u2n/EheqoHfTFF+EO6Cn0DdPMQK2jenMu1Ltq+
X-Gm-Gg: AYBFou3vVBRmVHK1QXgvaNWBP8qt9JrAUtPcTansZj6kmx3SRiCVoqjJ+qROo/KIRX5
	r3haF+UBErQ+ni5hVfXl4ds06iqWQvpkwuGHPKA2Dq/spPlhTyAnIaHNyev0Wrpg/2do7IXM5Kp
	47+l9FwfA7oYL7ViTNOjLf3a6b8sKX6qhRa5+Jf2yOtz992zOAqw9YpsqXks4pz539aNmG9LPtu
	w1og0Gsfa8k6gD6oVMGCzLjPgcNZLtTZA01igzAfsj+k6HHGoNJdaB+4ym7LX3uH9aR+L/516P0
	2AaRcO/Ghm6qLLOn4+PnxIiiFQVvA7nXLK2EFl3ZQjd8vxz5c7vNf7B7/RfgQB5Ou7lBpiIecte
	O7Mb/mGuW1ijsy1sODSzezOCsy+RBCRbHVIGVr+f/xKUnoEPKcwcdrkUmBmU6Z0pNAb4Fvz0=
X-Received: by 2002:a05:620a:85a:b0:936:2f59:dfe4 with SMTP id af79cd13be357-9442135f71cmr1736507885a.0.1793618486708;
        Mon, 02 Nov 2026 03:21:26 -0800 (PST)
X-Received: by 2002:a05:620a:85a:b0:936:2f59:dfe4 with SMTP id af79cd13be357-9442135f71cmr1736505385a.0.1793618486284;
        Mon, 02 Nov 2026 03:21:26 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc1915csm374500466b.7.2026.11.02.03.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:21:25 -0800 (PST)
Message-ID: <939bc61c-234d-407c-8300-638367d4fec3@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:21:24 +0100
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
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: add HP OmniBook Ultra 14-kg0xxx
To: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261101-hp-omnibook-v2-v2-0-1b99767deda0@oss.qualcomm.com>
 <20261101-hp-omnibook-v2-v2-2-1b99767deda0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261101-hp-omnibook-v2-v2-2-1b99767deda0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae87237 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jGN_E96kn2IweV2Cx-wA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: y_xF50Cmvb_XQjEy1bLyMTGApJmA9FMM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NSBTYWx0ZWRfXzIvwHgHAljl0
 gp4kR8GA0QBHONCl16SF3p0aTKYyCMLSFynnKY1ts1E5f0HM9W25oP+MBI9etj45McZ1wad2QLf
 xxb9oD1lnyTXwC42Z8yOQFuZ17uFvE8=
X-Proofpoint-ORIG-GUID: y_xF50Cmvb_XQjEy1bLyMTGApJmA9FMM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NSBTYWx0ZWRfX9Blfl1j4Uat1
 kNR5M9tQjvy+wsIuhVsdxgXKFiO6gKjVzR+cyOYjYYvASSTs1T6dtXbqTYalfBI+yFUpSVYa6zm
 IjlNKEIR/EZhjGmBkg+q5Jd+Si7aLM3DkcTvv5lt0FVLArBpUfnuqb9PW8H7Kp2PVzrb7cVogiH
 gP8Khz3gpE3IhzNCPsO+c/itRjjm2ZZ7wqm9NYDcDyywHlgNSxt/169ESVnBWp5bbjr0iCRxQqM
 nLRvcBqb23q6hLR9nsk6uddUJuid0duTqcCUGBFw3RcYHf6G1OR+6fg2Cy6BL6Q7GPaz05h0+gD
 KOtJhQVCf15TtL02E0pvIN1ZB3nb8wJ8/Zysg4fa8oemaCobKMPzfaljX6OM3OAXmWwG4j3IEsF
 nO3cAszc9t2A1D5aJx7w+wO5EciJSUrKiUOo0OeSleJl8Hpet11mbQEzhfrF6t24SwHpHTQgm0Y
 xbbjFeOJGZYNDXR58zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020045

On 11/1/26 9:02 PM, Jason Pettit wrote:
> Add board support for HP OmniBook Ultra 14" Next Gen AI PC
> (product SKU D29KLAS#ABA, board 8F03), a Snapdragon X2 Elite (Glymur)
> laptop, using the "hp,omnibook-ultra-kg0xxx" / "qcom,glymur" compatible.

[...]

> +	reserved-memory {
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			size = <0x0 0x10000000>;
> +			reusable;
> +			linux,cma-default;
> +		};
> +	};

This can be removed, see

https://lore.kernel.org/linux-arm-msm/20261014-dts-qcom-glymur-asus-drop-cma-v1-1-46f745d5b2d9@oss.qualcomm.com/

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
