Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156F43E7BC7
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 12:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783427967; cv=none; b=gTIwl8EbmWzAMvFQEjqvFfaXlXKjh/cD3rzEWv86p9qID3TRWxSGFtLA7ObcTkUG5ZHa3L6Wk2ffSwJOr60pfW+vUs/MbJO/ScRhgAOAj2VOLiz389ad1aOag7W2GjWdPXOJaN/LxKpGSLikqtAoZoLVCpIdgwaTfWjxtzv5UHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783427967; c=relaxed/simple;
	bh=LTIMHvuK3M9tT1SxrJYkj0HNZwJ0ICb6uzn8EiJHg3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uUOQH5JKz8qpMByZ9MeJMtIqgF19O/LwuHtPUNyXP6NhWEvk/7GfVGLptjgugFjW8zjKUilzDMpp8USIo90HYhR0pWnZWXS88XJIR2A6IyoPRDqj88LNNoOxAJE2a+5l9u5vj5MC/w8TzuiMN6l8l6G4xIBx3H3GBzyAa4TPU3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KWD1N0er; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gOS0vPZX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KWD1N0er";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gOS0vPZX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8spT3617086
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 12:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WA6g8A45s/DNa2YvVJag4x
	GtW+Okp5/lWtz6/DOOUls=; b=KWD1N0erpn5UpRn7A3gk0x7kZqD51/eoMNJ9jL
	X5fkv7cnsdFw8riwPkLqlE+qtGPhfISqQrey80EbaBP7jqEtxRmfrgQ5jHkQBXMT
	i+mB+P+ntBCFJoZUSFrrKF64EmF7bW9Vp2BVJK0YItIf7m7ZZp9t9Gwzt4KuagFI
	gxOgOfmQ0BCMTcnz466jEO4odABfXhTlS/NSlet+wKuN/Sapc+xkPzuKjOFfRtiG
	gNgCxGSbysTu/8WQg2mNUqzM64h77+ezNtbwkMdYyvE3XbOiayldahMR+7rwTp+x
	EbEkdo+gtlOZ0ymiYwo6F1kpXOVlMYYXXmYuQY0U2cbXgCXA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vun18u6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 12:39:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f0ed4fe79aso88974516d6.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 05:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783427964; x=1784032764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WA6g8A45s/DNa2YvVJag4xGtW+Okp5/lWtz6/DOOUls=;
        b=gOS0vPZX9w7KzTE9bSb+rrS1Etdxtq7tB0ci1Tzm8jf7MGJXwpoggn088G9B7zbMPy
         UxgGl001KZvhKDyLKrh9V/PSCMAdo2TryFUnwd7C+Cz8h6k16kuuj+2Ft/Ks8Tu7dW5g
         HOSPjQ0DvfmtxibiIEZl+SkwGHmQOLwPQIUear5fSrh9PSburw7pkSJ0eIXkF2xgwhmS
         hFa85fL4kVCq3ThJ1FlxAtunk+LNezPexxXkGFuBCMaEOhnAGoP9MYPCniUogB1794oe
         FpFHXt9EwASowK40+bA2mi8FzEbw8i5q7IRortWCbolTaaiVPjwT/z3cInytusfzLtze
         c/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783427964; x=1784032764;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WA6g8A45s/DNa2YvVJag4xGtW+Okp5/lWtz6/DOOUls=;
        b=RkSRbIcYSfr5kJaTU/uOpRAP7ZapS7G8/hb1dBw5Ajz8dEpGQ9cAxrzmaiIDatP7ix
         K5raZkB2WkWGhUeQ9tuSbp3M+lFFX7U8jLB0cEHvCoyGAmjkRP36JmpuiQCbd/MiWGqG
         Y4pypbGbq70yMmPAaqnzSVFDh6r0y4LoCwR3Uu7WbMLJpuLCEUjSJcYMgaDgjQGi95IJ
         lRWCfdZxxUiHlYkYG5fpJ0rZa1fbNLVa5i7OTTLpElH5frnYD3XY3WUXkWMlewGPT2XM
         hQUyzuiuWjnBJxEKGKneoSfWwVcXth3HT6X6ituSxko90b586aMivz+2gBfySExOlBX9
         7Zqw==
X-Forwarded-Encrypted: i=1; AHgh+RrtIE8zst0Q668DuEFADzKVhP0Dwctfoa4eyMbZGC5Y2FA6DEG8cxlFxtKnqrj/TP2FNpKGJTNyfE2T@vger.kernel.org
X-Gm-Message-State: AOJu0YzByRQPh1KT5oyrBBZpJ/xKPRz3Ixl2aynihfD7V1WH0JltIPaR
	WApIyXFWLulHqjXAPTmY0qDaaD1W1/yEDqbz3BY0rDgriethibBzwhAz7DdRbhj8jf0hdFXVewG
	CeVDLP5S+vU0BQxoCzlzSddSB3oMVVl3nvcekZ4u7heyyqh7LlKGRMkuExnT5BWgu
X-Gm-Gg: AfdE7cnetdETMurLu/M9pWbXpXPb3OltpTnXfNv6YVmRuNMPPiIxUif6o4G8fzVTkN0
	8DZwCrKIblalVkp/ZXVnLd4ERQ7bTE2ztqOHMFqGFeuhwJuhUXVjSY/1Ya8dc+NezYRIEoANRp+
	AN9czci4k1EPc0lmYZykhCbYItFoRz2Xgh9y7WLc/shjtZb53xnoVy2B4Z40otTSymut+XrHJ1V
	enLTC08tzyZ/7/TEzD+A7Um6no1uBoaqKS/+CbGz1oIA7VxlipyigiMScAv3LVHO2nPT/qrUC3b
	ibt1g3TMvPBUw17BfBzkZnqEvwJCnAA6b0RsV9ahLkHccdhb287oIF/A1JlAFUy09MEMOSaU4Uy
	pZ1EHj1J+87vCgGX9LRyho68z0q22+2eV+cfTu8Of03RZaLLcpsYkd576aamvN9NlvwbQ/uo=
X-Received: by 2002:ad4:4ea6:0:b0:8e9:f5de:d614 with SMTP id 6a1803df08f44-8fcb4fe941bmr55595446d6.51.1783427963947;
        Tue, 07 Jul 2026 05:39:23 -0700 (PDT)
X-Received: by 2002:ad4:4ea6:0:b0:8e9:f5de:d614 with SMTP id 6a1803df08f44-8fcb4fe941bmr55595126d6.51.1783427963523;
        Tue, 07 Jul 2026 05:39:23 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46ea3ff80sm159724616d6.15.2026.07.07.05.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 05:39:23 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v4 0/4] Add initial device trees for Nord SA8797P
Date: Tue,  7 Jul 2026 20:38:58 +0800
Message-ID: <20260707123902.3868016-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEyMyBTYWx0ZWRfX3uXsv6K60EFD
 CjcgWu/v2HQrWH4YrRcKWKrwiDS5K4OAzA4lc2zKsPZnXM0wDTWDmqsWiNI1tpRfKNxuV5e+CJe
 8bFjYTQYEfrMN9FgvUo7pzsIco5+WcQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEyMyBTYWx0ZWRfX0/iPNAv0Ph5z
 9vpJIAGW/3EC138fBOeoiOq0qZAxZmikf0QAZWiVUlSMcLTpiBHPhoTgZsVaxl62in9gn9zmdeS
 cHoDsdVfQncEREAClBCNrSQ9CkZmP2N4Kaw6uRnXVUUhvfEkLKA16GpfE2cQyT/9sRyRQYkJdyR
 MNJ8V4RVYQoA4+RaL/IM2uI12e9/juCHjfXdCynBGkO0BSEylSJDTrLkNBLqNboCl8qK2p02OmF
 uT7syg0yfoWygavfdpFcrVdRVvOWXHh4aRqnd7XrmbRoJC0M8585SV8fM/lDqkccMdruoq1kpWG
 lO08uQst7desfIdjlEDVk0df8v2mY5EuIkh/p+9YtiftezDw7oAO6VU+iCc1Y8hpgYzMbLcLa7a
 lvlBw6sjjWj5/jDz03B8UZMSZlabme8ycFTGyfVmZ9y0XTlp4OYoRLE5EfX77vad4J4H6aGJEo6
 rUbCMZXdBMkC1Yrd2gQ==
X-Proofpoint-GUID: NNEbE-kwDSH2aujVlThmViHMRNeARWo1
X-Authority-Analysis: v=2.4 cv=N+IZ0W9B c=1 sm=1 tr=0 ts=6a4cf37d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=x_pV9o5FX07ATpUlUboA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: NNEbE-kwDSH2aujVlThmViHMRNeARWo1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070123

This series adds initial device tree support for Qualcomm's Nord SA8797P
SoC and the SA8797P Ride reference board.

The Nord is a new generation of SoC series from Qualcomm built around
18 Oryon cores (qcom,oryon-1-5) organized in three clusters. SA8797P
is the automotive variant in the family.  The IoT variant IQ-10 will be
added later, by sharing the base nord.dtsi with SA8797P.

Binding Dependencies:
- ICE: https://lore.kernel.org/all/20260704004408.2303468-1-shengchao.guo@oss.qualcomm.com/
- I2C: https://lore.kernel.org/all/20260707095708.3801043-1-shengchao.guo@oss.qualcomm.com/

Changes for v4:
- Rebase on next-20260706
- 1/4: Drop unuseful comments from arm,gic-v3 reg property
- 1/4: One triple per line for qcom,pdc-ranges
- 2/4: Improve commit log as suggested by Konrad
- 4/4: Drop 0 polling-delay as that's the default value
- 4/4: Name PMIC thermal zones with prefix "pmic" rather than "pm"
- 4/4: Drop 135 C trip point from PMIC thermal zones as hardware will shutdown
  at 125 C
- 4/4: Have trip0 at 105 C as passive and trip1 at 115 C as critical for UFS
  and SDRAM thermal zones

Changes for v3:
- Rebase on next-20260525 and drop patches/dependencies that hit linux-next
- Improve commit log of "Document SA8797P Ride board" to explain the need
  of SA8797P model compatible
- Fix the real issues reported by sashiko-bot
  - Fix unit address of pdp0_a2p node
  - Add missing compatible for i2c15 and spi15
  - Drop GIC_CPU_MASK_SIMPLE(8) from arch_timer interrupts property
  - Update commit log of "Add device tree for Nord SA8797P SoC" to match
    code change
  - Sort sa8797p-ride thermal trips in ascending order of temperature
  - Fix sa8797p-ride thermal zones with identical trip0 and trip1
- Link to v2: https://lore.kernel.org/all/20260519063505.883379-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Rebase on next-20260518 and drop dependencies that hit linux-next
- Include SoC ID changes into the series
- Include ICE binding change into the series as the prerequisite change
  from Harshal [1] was merged to qcom soc tree instead of crypto
- Improve commit log of SA8797P Ride binding change
- Use label in nord-sa8797p.dtsi for referencing nodes defined in
  the base nord.dtsi
- Link to v1: https://lore.kernel.org/all/20260427023455.236410-1-shengchao.guo@oss.qualcomm.com/

[1] https://lore.kernel.org/all/20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com

Deepti Jaggi (2):
  arm64: dts: qcom: Add device tree for Nord SA8797P SoC
  arm64: dts: qcom: Add device tree for SA8797P Ride board

Shawn Guo (2):
  arm64: dts: qcom: Add device tree for Nord SoC series
  dt-bindings: arm: qcom: Document SA8797P Ride board

 .../devicetree/bindings/arm/qcom.yaml         |    6 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 arch/arm64/boot/dts/qcom/nord-sa8797p.dtsi    |  937 ++++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 4516 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8797p-ride.dts     |  240 +
 arch/arm64/boot/dts/qcom/scmi-common.dtsi     | 1918 +++++++
 6 files changed, 7618 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-sa8797p.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sa8797p-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/scmi-common.dtsi

-- 
2.43.0

