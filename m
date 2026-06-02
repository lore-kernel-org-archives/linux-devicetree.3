Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EEC3CAE97
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 09:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780392129; cv=none; b=pvMS+GBCs1SW5b5VYta44m3vK8q9VK2R2BCi0UnYzL3NCSwsMrfjbHtro+1ns7GnafWdSrmf3D+zQzyKvwIMJAv5RqkDcyJuu6WieUL0zV6biUJ5+UhqWF6vtr0qEdaW+eT99VxjiRDluh6SXM5wHz/25TrKXwZqkxRdHrprjiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780392129; c=relaxed/simple;
	bh=CQJ/iTF08gDZ0QuTe5m6xh1x5y8gkRRGP8Ena/nviAo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=a1MLJdOG+doXHgIJRw/c4wKweEeou6D6j8TWMtrPsIe/YhNJiDxkJRe8k9TDifv1ye6DJOdRunHHegpvjVuEQkFtDBjDaPQu/jxnNVO7VWkAaPp9rKEL26FwcPfovdQrdd9LffgRYkPqLexmpVqZgqcUnzA5Qt0JA59vKN962Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jsXCy4q0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eQDjbozY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jsXCy4q0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eQDjbozY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65262Sdr2688155
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 09:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DfMxrLb3OJHrMpWUGy9+oc
	bAeO1f8ZxGjFUkokeI3AI=; b=jsXCy4q0ljMmer+AYtZe/xTHa2zXjNGdQcIx+Z
	7QvHnc+qxRiuLP5gKf3rW3z6Ucyt2gOpcjdK9Z+sLPLcUTgH0A2LWZ2e46BYcSzj
	SyRQ5io7MFKmc+2ISsS0Te5Zzmchd/jMiZ8emt9TCIsLrqM0kWG2vPx0gAKJfeGG
	TdbcqxpwGWhJX1dsc4z6Av1QkCWBVeIdkYcXR1zyIRaWsO6ea73IaV1iE3euxkTN
	bP6QNG5DHHNFqBJfQp1HhgwjIwrRDBLALi295Ep2rbW4OBNqaxrG/g9Fuua2FKkx
	swBuwdal3fgVtua9Rx1opy65OlcXJk0jQY0b1CANw0j7Eq2A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsja8t8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 09:22:07 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36bd4146cb2so4188133a91.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 02:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780392126; x=1780996926; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DfMxrLb3OJHrMpWUGy9+ocbAeO1f8ZxGjFUkokeI3AI=;
        b=eQDjbozYwFhT+Rvg/sD+NGxfuo0mgTHtiury7lGWvuJd1hVE5GD//3Z7RQUF7WYHxr
         R/pis6RiE1R5+Wyj+FYIM9b3AyLV100yjX7iIN1QbPTWMxie9G3C89dTLpUnQzKWPF0y
         AJ2cnEfVN0swF7A2gRR2J9s8BiAFBinJA85grEt2XgLoKQ/qBxvPPx71Ky2opCFAFkfp
         59zfALFawysLUOMOzxaqlBGFfZo46jBihZXcRwauWIKVUTZkA9DF1p35q9dnnxAVIXzD
         yS3NvcKBWJHrDLkLADuXKGfmXpABvMr3wMlhdje66uHi6C+lzzFAz4t0Qb2Dy8Ipw6ms
         JTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780392126; x=1780996926;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DfMxrLb3OJHrMpWUGy9+ocbAeO1f8ZxGjFUkokeI3AI=;
        b=O5i5f1ACvGagiGPGFF5fGK5urKb0dV/JnUBd/eS70c+GzAFiUP983x2Qp5MwgQ236D
         CHWjywSMPo2MKjPLTNRz6Tx5yIr90O3nU1whRtWm/t/Bd7jMrV5ASywEzTCH/XJey0Ku
         VfiaDRP7nyCE+byMlZQrhYkT7F4mffxSDBU7hkRJb3HevXHZm2GFge3rbTn218eWRkt8
         YsqBq9qtOJBKFnrPyYnX5OZgLXschAToJSHm9siY1FMaxPHzbssqGts1gQF9tOY9n99R
         BJAMxQuUXOA7croU2wGWWmfWLEixRBvQdlEkyTc4jqxWanb2sj8mp1F94qesFmzVJjCZ
         aLnQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ptbkmemasl4PruxahzHNNZuOGyCYrHuorQPBg5xKYTW7KTdDlkHIR3MbEB9+13QvDmW54qKODQ9/I@vger.kernel.org
X-Gm-Message-State: AOJu0Yykn9hPuNBFItmvnR1zc9vr9s0q162pucTki0DRjt9XKTKk5gEu
	zVbfjH3G3+dBk4glesUPkm48OVfOD2d+HslgFfi6kY5/ucOo2rZIxDLK+4MFldIbBrcvgyJrZv5
	yzypQGrhLc5BEI30ctEewj+ToyN7k4Se3hrWvJqqgJiI5TA/XqtMM4JUN+8onzncA
X-Gm-Gg: Acq92OFFZap9npgHeeIoruP7I0kZrSZ8hwKPI4wzp2HjEXXjr7smuTu1hO0alg3HYhY
	CUxrItXLj4SKVGSBbRbpR+L+D4IG3fufK1hyQjQlpx0gFsxRAfFiPFBNt3drpS/QPyw4RfHDIOJ
	EXMDbFQEx2y71urMsxSv0LXFv5LkxA+H7hHmaYaqAWgUbAUWScg8NoLGdZMpPx+3pfZyhXh5c33
	GVb3E4v9QrbjN0092UC5TFl7T26QOqlCO0d1ftohgz8p6+9h0i5lxnAMtrjkRvaPUCNirNt0a/Q
	VwDLuDx21qNKLyAi0lYhnKdBursolwQgz2bAeFlpjVXVSpJhg4PbjQQEdC5hOcvHCbCME6zlgli
	UtT9+HuAVR/o+7cZdoX2HFvc3iNEjkoYQ6zgxxdiTXfcMT7Beg9EMHJwiAmP1KxmX++2naEl7RR
	jXZiSf9pxvDXdvE8eSyh3HyyICeNxaWq6n8pe/u+xJbzPHTf3Q+FdFO5ib27odOiQhbTY=
X-Received: by 2002:a17:90b:1d44:b0:36b:769c:c037 with SMTP id 98e67ed59e1d1-36dd91f3ba0mr2368925a91.5.1780392126194;
        Tue, 02 Jun 2026 02:22:06 -0700 (PDT)
X-Received: by 2002:a17:90b:1d44:b0:36b:769c:c037 with SMTP id 98e67ed59e1d1-36dd91f3ba0mr2368911a91.5.1780392125751;
        Tue, 02 Jun 2026 02:22:05 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd91f1affsm2154028a91.11.2026.06.02.02.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:22:05 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/2] Add support for the REFGEN in the IPQ9650 SoC
Date: Tue, 02 Jun 2026 14:51:58 +0530
Message-Id: <20260602-ipq9650_refgen-v1-0-55e2afa5ff64@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALagHmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyMD3cyCQkszU4P4otS09NQ8XUNLsyRTc4MUi6RkAyWgpgKgeGYF2MD
 oWAi/uDQpKzW5BGSKUm0tAFTlHw1yAAAA
X-Change-ID: 20260520-ipq9650_refgen-196b570d8bc0
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4NyBTYWx0ZWRfXwDhsxF9D5iX3
 t9r4vPAfZYuttDB4b6Rqdpfo61qgQSFuZRLnNHxi4bD3kG+7Waoe84qWwZ/TDs4vxjGOQv1LqYT
 ZMAtNYnSctf7ICJXoIH5fNypsgIhAhk7Nf+C74K8NVvXNtcOGDWo0hn3GR6rqDqCzeTu6okFaM5
 jslZfZ4nhpsNlBTvJ9ZtwSpT3m8GiG5af92+MwR4NZT32ylgCNvVM8yN096iwk47h6A7HADdiP1
 0GPGl8CnDg8OrZiHzJAybLstaGTlgt2k25OoVqvTN6ZsDkSkkh28TjDoPpewccUGZ+ahwap3lZT
 /Abs+ozcD8hpw+D74lJXVbVpQUKBATMk0kvzFEfDbv2OvOowEy3AFpbLc8pnzL+t5jax5UL8mgf
 EvJByH2p8SlLO8ikFGwF7o/4uKDQt5NRzSHraFgcREpevMTan2rnkCbX1s4VS7CiO9tg3g/jrfr
 my1pVhCNGfCDh29TysQ==
X-Authority-Analysis: v=2.4 cv=Ld4MLDfi c=1 sm=1 tr=0 ts=6a1ea0bf cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=0aEQT0Sk7kFI2HZY0TQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: dHG_xVEGFU7sAFmBA-X35dbZBzSTRg-C
X-Proofpoint-ORIG-GUID: dHG_xVEGFU7sAFmBA-X35dbZBzSTRg-C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020087

IPQ9650 SoC has 2 REFGEN blocks providing the reference current to
the PCIe and USB, UNIPHY PHYs. For the other SoCs, clocks for this block
is enabled on power up but that's not the case for IPQ9650 and we have
to explicitly enable those clocks.

Document the same and add support for it.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (2):
      regulator: dt-bindings: qcom,sdm845-refgen-regulator: Document IPQ9650
      regulator: qcom-refgen: add support for the IPQ9650 SoC

 .../regulator/qcom,sdm845-refgen-regulator.yaml    | 21 +++++
 drivers/regulator/qcom-refgen-regulator.c          | 94 +++++++++++++++++++++-
 2 files changed, 111 insertions(+), 4 deletions(-)
---
base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
change-id: 20260520-ipq9650_refgen-196b570d8bc0

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

