Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A192A25EF9C
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 14:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777472139; cv=none; b=BU2shaHKyvtjlhOdNQnsY5gKn6jCrYM0a+Zl2F5/wppgmqgNwxQzUR/2Lb9CAhAMYPYEMbLxjWTGMkZnTS3GTS1hnxt9qdLzGk0veFmBWo9dV6QAg+AOfF0LhQZ1sawZLMhhFXBTW1Cbc5MrhLzn4xWo83pcRw3Q47bgTw57pe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777472139; c=relaxed/simple;
	bh=6qiQEZhfqswwyTy6lGpZ8vDSCa5P9FHQo6RPH8unH5I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jMCbMZAFg7sHQsdsX4BkqRFnKCsPmUzt2O3m0iomxGp0hsMZ5AboDkUAASm18D/tZ2eBY03pDFELIfjyUsJWFQdQpFsaKc5oPWjCjQ1jB+ufgNBzps474WsRUl+PZE00mD0hcWFiyae8KvEIllOKC4vS5dyXLUO+dtFgEqlOfxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QJcH8Q5Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e0fSYAhi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QJcH8Q5Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e0fSYAhi"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qcIt870130
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 14:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iKo+UJYDFtR4I5B/NNi2ij
	yviGN2L82xHEIJ7WGjUyY=; b=QJcH8Q5YxT5C6SHwCtXpNBURPlQ0ln/DwgGg5M
	SY2XZs1CQFaUl0qIumL5BXsQnc5mR7z8/s+TWcHPZITx6WP1NvTuPuHtahnb6eyj
	453wxQuyDEdM7rtvq3xP2PjSn16hFwNdvgQZFNF+Te2Pltk2N+gj1zCHLQW23oZ/
	Jv0ro7R9PdYokbTXWVafnQp6pT+PZLlG2n5+7vklwKN7zfc6/4Gp6ntCZH4T7Ykn
	0wgpWFAjavMDGbBxEdOVB5rPfZ4nfPDqMDp5m59C5NBhUUBq/zC/5P8frrVdk/yN
	p9lamXvNl1bV8mLNzDoH+5/Q2mp6/ta4XZUFA0dTbBtKutYg==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0u1v93y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 14:15:36 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-6583252c117so6840618d50.2
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777472136; x=1778076936; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iKo+UJYDFtR4I5B/NNi2ijyviGN2L82xHEIJ7WGjUyY=;
        b=e0fSYAhipuJNCGQgUdu2XxeJYTfkNIPoGFeQBLwTCuctfXrlMPq4pkrYb3R56xoxvO
         1WQoXZxjbSKj8jOn4zXgVYdK1VtB1XbSZrOC4m2Co7CC7qCJ/Iy0Ik4wx/6iyT7Q6gCg
         hSpdEZ/4fmnZ6Qq4k8jCjZkxvD9ZzMpmJH6IGZKajp2Hjmx4gBIqgSSS9JMt36dcWeul
         FT9Pqxsn1Xu9kYQMGeqcgEenReTyyw0+wof47BipZazXPpgDSIx07Yub+SfVADmh57Fl
         OtqoWbvfx/Jx17v10Tz7/NLjF6uXUSJKXO0ZtzowS+jd/KqxdQdbLEYZKDo7pnmkZK3Z
         TIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777472136; x=1778076936;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKo+UJYDFtR4I5B/NNi2ijyviGN2L82xHEIJ7WGjUyY=;
        b=gdK3/cxUvDxuU1j0OSOuA4+IuSLE1Ul4R4kmkCjp6mnxUAxswxcR5HSmtLqzLod7Wx
         tUONSxQYDbAbtr11XJa/j7s6kM0PPnJ+McOK62Dg0P5a1Ugf6gNpGLyt6xmFnFkpEUts
         63HhqPQbaqnTWJCk0xUUUj8UUObkwU3nYUU7ZBZ8TzATEzGAaHMy/2FmJoWTt1HySxFH
         rn10TpsLroTMPhIe/OqdZ+Ngwc8pS/EF3+izUXNYfbcu8pWFpviOKclnNVDIq+WuQMhI
         pkWwB07mO0ApxXQ2KVlbyvIKzr7hSGZBtUIc8slc0CcTuSpDvxoounRoal990cbwDVT6
         Pj/w==
X-Forwarded-Encrypted: i=1; AFNElJ9rzBMX2XreF79uzXaIMRddnxcsnKKHY6DNJCEk2iJmNSZxlpHqa4ved6RPiCzM//vx1gL7tzzFUQ6c@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9w0kza9F3I3LHIkK5nh8IZEqU95c8UMlWKGtgpPqR79y1lCs2
	74+o/RS5feaZzKJfBToKA50B2SgCM0pRCfw/a1oimBO0McUSP4fktUXCAh0CR6YnyH+n+Lu5R3b
	mcXJstvdu9XERoxWlJVdI3tTC0iUGp5YAE+fgsMuJNJ0nkfqd2wQCfpSBrO14/zFD
X-Gm-Gg: AeBDieuTBzfDwbyGZdl6EbMGXjybkil36VCTllhPeUGSjH3Pae3+y8jl6BDjDlolPqk
	tfoCrkroGVchVsYmO/hSv7SyfLt8hm90yNPPL6W33GsZ+f2btoJgJMGZMZZDTKpg9oi1Izh1wvs
	jp2ldz646ArxKcAtwlu2A953+5VhmMOMu8VmT4Sk95T3G20dMr9K8exh29IbwDCiGOMvwL6mTN9
	/GWlIxTJwYlcJev61C45SMhVdMXgnIdTLxDicYol4JoQgzw4CPUPuz+O4SFs/brLIi76DaG4LKW
	bN3NNz05z31Vj50S8O4O7Jz6eP23mPeVvOK6W/cyKeQoXVHaruq2cCwmVzupowcI2RwWjpSo2bb
	qau4tnKGgC37eUKbHAK+OHnEq9cUPr/eqihg2U7B/57olWFv1kHD4wzrS2ihPNIM=
X-Received: by 2002:a05:690e:12cb:b0:65c:b99:607a with SMTP id 956f58d0204a3-65c0b996108mr810626d50.38.1777472136001;
        Wed, 29 Apr 2026 07:15:36 -0700 (PDT)
X-Received: by 2002:a05:690e:12cb:b0:65c:b99:607a with SMTP id 956f58d0204a3-65c0b996108mr810582d50.38.1777472135482;
        Wed, 29 Apr 2026 07:15:35 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65bff2c2eccsm1379533d50.0.2026.04.29.07.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:15:34 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Add camera clock controller support on Glymur
 platform
Date: Wed, 29 Apr 2026 19:44:55 +0530
Message-Id: <20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF8S8mkC/1XMQQqDMBCF4avIrBtJglbpqvcoUmIy1YAxNlNDR
 XL3pkIX3Qz8A+/bgTBYJLgUOwSMlqyfc8hTAXpU84DMmtwguTzzigs2TJtbw10rpzUzKEVT1aa
 v2x7yZAn4sO+Du3W5R0svH7ZDj+L7/UHyH4qCcYatUbxWUhjVXD1R+VzVpL1zZT7QpZQ+RlYev
 q8AAAA=
X-Change-ID: 20260401-glymur_camcc-de21745db58b
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: SgSoXxL_fEpxCtiWekoPDAcRU9GrmW5-
X-Proofpoint-ORIG-GUID: SgSoXxL_fEpxCtiWekoPDAcRU9GrmW5-
X-Authority-Analysis: v=2.4 cv=aPPAb79m c=1 sm=1 tr=0 ts=69f21289 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HjKqFMqo481W0hlq81sA:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE0NCBTYWx0ZWRfXxL067gSXS0P+
 nRsoOf7e0yyCAdqbdYsWFK2qSYbisZrAAqC3WzAtByPmeoZcwqxI4WHSzSlP0SL4bv2LNozIY8F
 7KnzsG6P/k8vCMKFV1g6UyANCivfm/9TYP4q7jlViSmL5jqlnqat6/8UrraCXle5fP1fitJWrn7
 B6Gtnm7npNHHSlAE+7XeW4dWDMjGVh3nEXjSWAAsnTBLWDbpP8+x9jsepDyyqytRGi3QfAlDWOB
 fzVdXWnkO6lGzxgB/0UTyNpcMXVP4lGgh6bTwv33/Dlzf7/3yTrTrGDNEy2Sgsk5pMYhc54X4Uw
 d7zzfDq7XC8w47XD/U5s7sc40RZzn/4RsIUT/ecJqUKAzPBg/VoA5v651XJ9hqSJ9e7rUJ6tOUC
 H2zDE7Cjtf07xnmFns9O1va9NBmbOc+bRcL1xdU/Sa7Yn30zi6OFFd9EaOdyMmJ/mRARZ4CWeFr
 AWZzRTGDoI99xmabXEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290144

Add support for camera clock controller on Glymur platform
for camera clients to be able to request for camcc clocks.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v2:
- Updated DT node reg property to use hex for 0 also [Krzysztof]
- Added R-By tags received on v1
- Link to v1: https://lore.kernel.org/r/20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com

---
Jagadeesh Kona (4):
      dt-bindings: clock: qcom: Add Glymur camera clock controller
      clk: qcom: camcc-glymur: Add camera clock controller driver
      arm64: dts: qcom: glymur: Add camera clock controller support
      arm64: defconfig: Enable CAMCC driver on Qualcomm Glymur SoC

 .../bindings/clock/qcom,x1e80100-camcc.yaml        |    3 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               |   16 +
 arch/arm64/configs/defconfig                       |    1 +
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/camcc-glymur.c                    | 2280 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,glymur-camcc.h      |  122 ++
 7 files changed, 2433 insertions(+)
---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260401-glymur_camcc-de21745db58b

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

