Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61503403AE0
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 08:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339239; cv=none; b=DiBGjMC1XfQiQYZAOLjPKJdyzq8C5dTdRH/3mTJpw9gmftB3FJTSM77/fGpqLFsmeSHyYu7iZQXLJMGhDQBLoj9WaHlR0hxDlkU8XRdxhc7SopPZmOjbHNlUwb/aKnnEtjRKatcSEm73V8Lj+L5yeAIVn4kxnov0CWhADiWoGVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339239; c=relaxed/simple;
	bh=dLNPvtyLfzJQYiYO1+leMhmhyqiin9MHtSdwsymE+90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BG68xo4egKPHFSnNQJw3LhgEWzurcbRnn+RTp8DILh+dpeApwLK8ZEdbiEEK9rsA4RGCTUZH7Ulkn0vifuN9UiR7yDkdTkKMzXYyA4n+Z0j/XYylT+5CRNX0S+3m4oFP5W6z5VF0ndLmnfTM3F1TQJTYRKSOXFjjApfu23+4h+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MLQR9UWG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iJspL1dw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MLQR9UWG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iJspL1dw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VoPe3759256
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 08:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ROXUs3SwZXs49UllWw3FErqQbUnANYqcoInUD6cvKSM=; b=MLQR9UWG/RYTDl/g
	LlIxDSFUIfsVHOosDshPqn5D0kS/IaxMD4ukwvBe9qclL2M/bBK/YCZBwiUc196M
	sre97ye8MnVuHRYuU2kQfm4xJtsEkLr5FocRxjUwEHz31e1omWQt4fAA8XbTAL/z
	aaexd8Z4ZRrGn+KFJyLW5aceE4il+/uyQymZWrj3vmSWMukpF/3SvQ8s8gOwN/KH
	S4JWlbPsJD1UKuEUNYUUHDJ0AXOwtqX4Uv/9hFK+HDuZJWzn1ilvfzhZOaPj5LVT
	3qhghN3/lpYbvZGryQvGJSxBEmGy17pmKx3w1BG9lw71dsRLwqIskN8YawrytD5e
	rWGjsA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge39ck0cw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 08:53:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c9e97b626so1574241cf.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 01:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788339237; x=1788944037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ROXUs3SwZXs49UllWw3FErqQbUnANYqcoInUD6cvKSM=;
        b=iJspL1dw+whxMrhyiLk24ncofM83kEk/HjEPpDfwVwExuyyzWEmm6y37aQyCQnFHpF
         E2cYCiLZazb+rbK4T8Qp4u6UftaUr26Vo3mw0aonNcrXYEDQltUpg0l9Ar9gB2WjO1dp
         8g4NL1BkkwoTDvdErsWkN8YEsRhlvPaRU+jdpgWNpIzVu45FvwQTUtU+lokDS8ovKiza
         Fd3oOE+w7bFW78bqQGa0F46YGom4J0NCJBrTF0WRczMtruaOfRoG8W0VFO7G9sHz65BJ
         PrHgfIg4aZpGdOlU0aNYOW9qiYaSoyPNohwWxrFulfPr0dEpQUlFY/jx+OCvg9Grip01
         NhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339237; x=1788944037;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ROXUs3SwZXs49UllWw3FErqQbUnANYqcoInUD6cvKSM=;
        b=lrYRl85LLOTVQB3iFoIHvNX8hHxjLe2kohTVJFomMhXPkhs34mW3jra08OR+z1eTTK
         Hchxrs0i8WJ4eTiHaPgRA4HTpo6opBwfkOx/ELC1cpw2Y3/8BK70AjCNkiBqMJmdQgSD
         Vb26uJ06MPwQm4HtGTjmqJSom9EWCDrcHptkhicJYkpn3PHLXK0rEgYmZyecg2lCCqWY
         6C4wweSfmFbzYbVTOo3pZ+lb6kapRsFNUk2h4KbdYa2gb3Fswc2d0o5nuMi49lr7aWu2
         xzumnYlUrQOI9wip5v1fPeZUEMypSiaeHVPTBFFz23qLcet5uHy0ME7zWfyPuaYuD0Kb
         XE4Q==
X-Forwarded-Encrypted: i=1; AHgh+RoYqIt+Y2nBXEprq5cgqfbz0ewJB/wZ+eSwgFczC8YH8NgZy+wIw5ZjbIo0Jzr89OP/PH9aDruG/SM/@vger.kernel.org
X-Gm-Message-State: AFuF++nMVv0h+2UqGHuO6m1UhbI+EfMG2rBDisgz3hTcsIYTnVoutnld
	t+KOfU7jBgUv63LI3usxNkHmwTAGniyOzLBr6X7qiBrXpwA1n27C+wPejHjtt8nqrpv76c4XxLK
	DjDBSJCxrBhZC6ZT1l5UfiHvhrYpzqxJC0IvC96xDyosAhHca8/C7DZstwD62qrHh
X-Gm-Gg: AR+sD10gbaROOPt2hb9ySOSw2WGjvb9R7LtpcMmHwNbfeu7JkZjKGECrOOqVMN1uORU
	2DrFstE4k/FJ+3tNLIoIo+PPsGMx/6exKubu8TJkeyh8Y0MBYRSWbZfb4PcswsMOBBvFp5bD2YK
	HQqt1kduUukYEyFejnqh/2flWk1zRlCBaFc1Tir1y0NHaWDs3wu64YM5Cb7sehhq5kn/f0dEXfp
	xuJWrZkS0Cb4qtau2aDC3Kt8kx4zrbARO+hRpusoR2wAbvpCLS7C4d+dLgVg25KL6St5g1PXVRq
	BMAWb/h0onSpJv8kCQ+6jfQWSt7E4ycQ6itPoxPnBgK7XS3loGkcdqZQZwBEr7VsU8O5JqoSvDO
	W/6LiWkvITgroi8xsdWGctA==
X-Received: by 2002:ac8:7fc1:0:b0:52d:9db2:7924 with SMTP id d75a77b69052e-53036b81bb1mr17657711cf.1.1788339236756;
        Wed, 02 Sep 2026 01:53:56 -0700 (PDT)
X-Received: by 2002:ac8:7fc1:0:b0:52d:9db2:7924 with SMTP id d75a77b69052e-53036b81bb1mr17655961cf.1.1788339232055;
        Wed, 02 Sep 2026 01:53:52 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f942fe4sm715364a12.25.2026.09.02.01.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:53:51 -0700 (PDT)
Message-ID: <857bdc72-fa8f-4dc5-ab9a-16ecf2903a24@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 10:53:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Add parent
 supply for regulators
To: Luca Weiss <luca.weiss@fairphone.com>,
        Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
 <20260901-fp4-regulator-supply-v1-4-68288ab70aee@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-fp4-regulator-supply-v1-4-68288ab70aee@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T968ifKQ c=1 sm=1 tr=0 ts=6a97e425 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=fBQ15DjUyzdVHG486VYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: PP2m1JzhKcBFoypnYZCYiB0PLZSUfAv1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfXyegALJai+ngZ
 sWNOZ6gzuOYyErpGCVp3bezp456liyB/27ZMDuu5iJ6Wa9d3MnldCC1beqSOKakV4TCoNY1ks2z
 4gU7IG7jRjD5DsgadvNrm850vjsM/lE=
X-Proofpoint-GUID: PP2m1JzhKcBFoypnYZCYiB0PLZSUfAv1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX0CXGiLprllGo
 lpb4YfeGiCeR0IkEI5xDNnV4jjlQiTD/Qxo+sxU8CEkfHO8/a8bFJmv95B9Yrorcy8ooXsElFgT
 lUTRWoo6V0VF93WTMS4LtrB1c0WvWBhcYy6EDEOKdfWOcGx4aTJz5tuGPv6q0RK2YDdefJ3ejc9
 M2pXiSD59gpV9lU6htgp0aFBr1hlFkadeem9eyYdsr9oqCxMP8+GK2r6YbfNfZGUcTi0R6Mu58j
 iArOGaBQyNGeZkXACDObDRZTNUpzUcpecvaFoSbpCvpHAeJ3fixFs29oelr9XOAhYJVb/yh1svT
 FkaIB+bRFA7L5P7ljLHLxkv7f7ITQPsQU5gpsapS87o2GsOcPJcL6FgQHEy+4e4DwJzbrB4dvaQ
 +uHQvnSG+NW5F/NJWszT7nm0p1XBjc+73UzsTUDHgL7Xb6z4tCAJe0elRUnj9KJTMWJhaPSIWyr
 z7Zjy/hcU0uOT7FfPLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020078

On 9/1/26 10:58 AM, Luca Weiss wrote:
> Add the vdd-*-supply properties to the rpmh-regulators nodes, so that
> the parent regulators can be enabled when needed.
> 
> The regulators s4a and s6a are a bit special. They feed back into
> PM6350, but are not modelled as regulators (or anything else?), so they
> also can't be added as vdd-*-supply. It would seem to be possible to add
> them with their "Default on booting voltage" from the PM6350 Data Sheet
> in the dts, but I'm not sure this is desired.

Yeah they seem to be strictly intended as being part of the internal
PMIC power grid.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
