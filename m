Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC763E8325
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177830; cv=none; b=qvJFASoYCpxlh2605F14T1tb59V0j5ycbxCKvHrh3+yr8O2QdEldgukN1S7T3H5wDff3xVpFBXzmuzRo2ytVOzSdTx+PyS4CiiU9BWiM0GDYLKCIyY7jYZPDaXQ+uDKGaiPf79oJ+aVulziM7xV8N6NQLRodrBMqYwSIkZxNJs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177830; c=relaxed/simple;
	bh=6U2EpQbl70iTBwLkHktdUzi2+kfxjlaFpz2VtqrjLCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LEw4VcvLpc/8y70DoiZBt+M8tFBYZ3ckZZQ3uUxmCX6hWFMR/jChgGzpzAHzNZmmx9zej2O0XqM9vTEYnzmNZFJVSbady0Lx2QbYeFf/HWbAxHLMtMxWevYBpCoMCGmhzdvZ0b0u8zI/0IUAQKQ5nkKma2EQV578iSdsTYxXl4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jO0st+7V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L180neu2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jO0st+7V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L180neu2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xIaV284136
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=; b=jO0st+7Vc4YI9sfN
	l2yHJPsrjU9runL9De3EMKIR4UX21YwYJxfwDUhAZZxB4DCoh8TeICLRdaC0gZid
	xytGd7vHlq2shgW0YV2jT7CtbFXpIEcBGhCCuqmamAA2LIzWAQ3wrrEGDZrk9+q0
	aA0gZsW5DU4jmkx76675O5c1y9Iau9lzZ9Qj0llM/6+WGdjVwltjpPYBcnLr1hUT
	E05jqNboHBOYSpEMEga0hlyyfnYXM+sFnUztQc9Kfhp+CgFOcYo+xcNudIF+hMoM
	mflFKDvHs/ILvRI/ImrW1h7AaEcljbiqM+zcSEuZzBngFW9owbXPwsovr2wX2xQ8
	B1LAOw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6tk787-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:37:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517647fbff1so25962571cf.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177828; x=1781782628; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=L180neu2fsY407trZ99u2hbOSOqCKu98XL6RyqIb8BnAVCPt1tyVjtSn5PD+6x7rNh
         kWH/bwhpxQBbqXROxbBVsxmY1+duzl+NqT7Rk285iZLep/adU6z6gqKoYaMnJqM/BV99
         ThH2BJtKW0QJUwvHxhInnKysUQiaXiCYBy1rom9aKN3Si0AlKI9cE9F2D+0oGdr8o8GG
         6oEnZN52/Wh9WCV6Oe4vRwWWkyDBtdHeTNZ/EZoOfJNrN8Z3p9PDCg5JfUz3XswgGK5r
         vP2S8oWgsr+/pg6l+FISMlpkPxSQtRi+nfIlieoHoZvrZ57H/C7XMFvkijGGgeM0yZ8C
         uAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177828; x=1781782628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=HS73aGLbU/x8+OLK1Mx3EceQg5H13u0m9cAieGihMUHa9/O6lKDF/caC3FITytOqre
         UtV8FJS5R1uWI2V9Jp2izb20Ngek/SQtrPZtKA0oNXQ4FvlwcFqeNP5H2AJV+yNYj63Z
         NyczPJCjjZyM2WKqi84vrj2KkSYJmguC1Wfg7RJmBL2UeEsgaCALm3XQ0YuJG85BNiPx
         eZhPs34+mKEyPPfMu4z7GXo8ofx2YQ4QheShHgi0LyYtdLMLTToV0ZC3DKKKmduzYcRq
         B73ACi5sA2oAiUvKDMoHXRk6J7YsY4e+tyLR33Mqbp382fQPG9zvpLcpIlmAfp+hoaaS
         97QA==
X-Forwarded-Encrypted: i=1; AFNElJ/zTptOF5mMnTOAQ5bL/wMD5S520diCSaCPx4SWfsPz4iheqzt2nbuXakfXj64i34EpT8UBjAFehB1W@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5jm4GKLiC6hpaxPqeN8IxLM5YLIG0hCaMhfNOCBFZRfyBVIPk
	a07/nL0yB2zi29NiU/c/FcMIlYbxbuvAXIyy/q/7XDD7xhJtUH3E5JPO6QnXk1BcLWBYp7rrhVO
	XUBWG6a90hjGdxOWVwc6JBPYpaIm1Vbqbsrt87ZVp8CmJhFE20CXoU2JMH1VDOpca
X-Gm-Gg: Acq92OEPXyvUIubTZ5sCNDdA7AyOXfqlwwwt1g4iA92mCuBOE3oQJe0JVMAoP1Zezdd
	AEF8j8EY6JNcyaDLkik/Key33w4cyymEmqWhdL+2ycLeemenMEGyB3L7rlBL0meD7JyjPv7rJkQ
	eYO5hDqHGh+csosaiWQ7P+ThuIj8S4F36WEG/YnUQQnYHaozgQHQ16MhyLD+w1pi8eYSaG8Jit6
	bhBju2Em1s062gcc1XYo96QNpJDtvqIf9+TedgFe/Tt+ZYD9GmpOtaT/loH/HDYjoUl9xsJGQmf
	wvdJYndiADBnsf6m3PrxB64QC6d7h4Cvi0rR5d8ycorqzIERthR6QDkBd6cAPHZf7+LhEM72ios
	yXMDcgxNqCJ1c7C24RPPmLJ7A6MiK8rA1BcT6IprkkUZZ9wvQhsfsid+H
X-Received: by 2002:ac8:5a16:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-517ee22d93dmr23080171cf.6.1781177828025;
        Thu, 11 Jun 2026 04:37:08 -0700 (PDT)
X-Received: by 2002:ac8:5a16:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-517ee22d93dmr23079821cf.6.1781177827462;
        Thu, 11 Jun 2026 04:37:07 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f147e2sm53745066b.7.2026.06.11.04.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:37:06 -0700 (PDT)
Message-ID: <f721f84c-03f1-460e-9137-9373ecaacce9@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:37:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/18] arm64: dts: qcom: sm8550: Add minidump SRAM
 config to SCM node
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-11-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522195009.2961022-11-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX3CJIQCTokyfU
 lbWO3boeva0Zkf+smtiJU5TCFIbeE3Hhob8HoCcIzINYU2PWYcbHc4/NscIKFqX9hfv8/glV6zx
 NivcaFqYE2r4RelWchlJ/0Zapda0ON5LXm636wseboG55VppGcbCWBqeDIjZWnwaV/B1hC3Jk33
 gvM5JpRIrhHUJG+alNAf+mx64ohm18iaokktR+gMjRXD6RImxwE+p8Y9wgIn97OanqriF7FAd10
 MWB2v5oflhYUcSZOrVl5CdEUBJXEtcv2PXTw3+m7SfDja4H2J/BrZ9pixswRvGSrXLTV1In1m2g
 5Elwjt3tr/fVnKTob5PUUlq2hleIPV79k7riQ/1RJlAX1MCLat2HT7ltMBgo2+FEW8W5iTjdcuw
 U7PbE4x3xBlLTxUZayZQu3rnSBNzusLoQpAuin4xARoLR8qWNDm8zZo3WO3UUuvRxxoTYh5DhWN
 vm8qOQC6DlFMtL0gI2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX2f9H3kCRb1KL
 q08sFFpbpCnju50k0nNx30njjOXtyUmG4HWruwJ3vZanJgzHd2s4yo3B1WzxbI7erQEl8vh/Ytm
 KTrkYD22ZfNMQMRN7c15nhGj2DaF10E=
X-Authority-Analysis: v=2.4 cv=AaiB2XXG c=1 sm=1 tr=0 ts=6a2a9de5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ZpVAhvDm8T4WZmbhYYoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: JGNmY_u83rHRphzIctZsrTC9KU2Cttnc
X-Proofpoint-GUID: JGNmY_u83rHRphzIctZsrTC9KU2Cttnc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110116

On 5/22/26 9:50 PM, Mukesh Ojha wrote:
> Point the SCM node at the minidump config slot in the always-on SRAM.
> Boot firmware reads this word before DDR is initialised on a warm reset
> to decide where to deliver the minidump.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
