Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03073B71B6
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 11:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782472392; cv=none; b=t7cQX0xSon7B1Fm1v1+X3/FnnyoIYRefceHTe4eXIRBJ66oNFtorHgpQuNomC9SAAG4sZYhqdaD2taWtfgybTPuJNkALlGpP/p6VvMPUntAYiIENDlVpNe+Xi8v07mLp068AKvyE+6LcxjJpNwPHBRj8vraUceFz6ObjWaBQjpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782472392; c=relaxed/simple;
	bh=QYBgVQxskSazxcouL6gdOVq62NdDeciGPeouETYUhEg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=uaVxnyYvrCEggJCqSucs6IAK/JeEhdVSMmKpnAl/n36QbRu9tmfXb+vaUx4kWnf9EirfsuL5lDlXY73ZN4izYdyn0NhWqdtJz1bpKvWTmYcXMsp/RGEfAZzgvlyjfrKw5eJlrAg16/Qa4Qocy6qrux8NidaPE3tLdAiIU/nOQaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gprx1U3V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iw8UXptq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gprx1U3V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iw8UXptq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAcgWn858156
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 11:13:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nufNEXe6n6im/2o7SwFob+
	PGR9eOoydkvan90BQnLbo=; b=Gprx1U3VTnCX6jMDkpZs/K/eUXU/hSFHLoVyTX
	T0WVsb0ZrnpBkrA5K8R9o3negs/hK3KJLNoSu0BwRo8Zs3llNx9nlDvCxXPNtdNw
	smFAlukUKmvGapN8I6PrlhPkAhUEK3T5P7WIPxBC0krFbn1h1M3oDWdwyZQeQ5tY
	LthXlGDxrUex/Q/jqArRv9b0ccM/Xs1aggJ7siqlKYPA0QaYusQrB8XRnFB2JPqA
	7x0c/UPXzhSBcmLuMjXaa6vsF8tNLvjVtpuXpPkcaCWHG0e7aOZs9mu16kxYSow/
	N8Ixb10SZaWjXUiLAIkkrxu4b6VO7G53CPhjYOzqB2Z+28eQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1p2trgr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 11:13:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-845ba567d69so148869b3a.2
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 04:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782472387; x=1783077187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nufNEXe6n6im/2o7SwFob+PGR9eOoydkvan90BQnLbo=;
        b=iw8UXptqEFFr/QesEy7xk2IaQ73vv3SfTQCkjCKp0jzAgTnfp+A4ZbCh+H6d5YJTJn
         VGYhk1Tjm/9OMMkr800Ub0G8+8UwV/DOoXr6I7dRX42SVy48SCOoax3omSH2aXPH401t
         1HCD1vNpcOeqvFk3VI8hCIe6p18JOWs9FzjhCViFyUmkmTaWYckcUTLVUyXrNF1eHjMV
         fSRiLGM3Aft88U+yyyjbpBw/ms4NqPPBPx//yNaM+lhh71KE4qeqhvKnofT7HQO6Ulvg
         g4LeoAxga92Ipial87dLeGicGOqmEl74yDqv4gJC27mp7U84rcwKkVVAF9Tzlp7lZsXF
         TeTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782472387; x=1783077187;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nufNEXe6n6im/2o7SwFob+PGR9eOoydkvan90BQnLbo=;
        b=lFxNo4CmKcaFMcSSz8kdWqhGQBokzajqL2Gyaq7jkRye/87NIJKGs8bSEkgiQY9Lde
         95n4FiqwE+vZYf9pU8NnLiYK2ck1/P4PqJNeU+ZieWGG2t/ujutw0XSLrvsMMgH4ITfu
         0v/XxQT+EB6n7pltRbsnQ20KC0Kh0L/OWREhHajSiXrkhW9v8ctSGH+Ta2a/AVzROEk3
         GoSBMjKzGBFBPmSk5C/ukKSj3wGEUioMUNGW73jfMX2isBN3OhrbwT4g0SUKQo/Ykv8k
         P2JTHMy3TzHw27dxoxSjcoEkIxlS+GllN9oyTC1rC5X+tuiXrDaqPZDNf5Fl/lu0WxrR
         9mbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9mAJItCLXWd0KBunh5MJJgh3cNK9W0FCM/QPiOPW3nZPr6Owt4ily7RedzzaiyGrn23hXa1vKj11GN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1aZGLiZSD0jWbqmUKQwmAKcAdWT40xROWxOHABYP660+3bzUj
	pwQWMpiL1D0CkBhm9hlhYd+HwSeK9vvwv5R/ZWZGWXJ6RgdVp0fcts02zU40azUfuSFif866P47
	LbJGHjMimTROzfuq2MroLjPOur8yM4Xt2zN/ltgfWPL0Xhyvey6uXTWciJO28ZKiB
X-Gm-Gg: AfdE7cm1USN3KLK3KYjkDeF/vqmgQAXMauKTKGSX7JVZWQhBIlJeJkCuv9i6n0WSkKF
	HI1aYb2z6AKHXiXV1XFOM6pbi+M3VauYm3gX6Gs66Wd8XFa+1QxTkKHWHo9/WmbpXtrRun7IHGd
	/s2F2RkL+TQrTC/PiyqAwt6rEzQpOFapEzhLOEHs/DPKJsBnuxMoi6GQATxUj8rM2pp3GmYgQbl
	mDXVxCgOIgNsVR9W5VUkZUwG3UEtTw/TM+zCmwhFPy+9rag6QtAdzwJDTgjcodJPxua3/Q418Ym
	negs/B81gTnx11TwrF1C5j88ta33MK+bAxiaol9mjMPI/nFCr/HXbXRzaoPkh4Fy6Ygw8f6dBmV
	gDP6iRcZrul8441xQfVZtAP65pG+R11+rKgU+jLvEoA==
X-Received: by 2002:a05:6a21:9981:b0:3b7:a8f5:7889 with SMTP id adf61e73a8af0-3bd4af5174dmr3530794637.7.1782472387408;
        Fri, 26 Jun 2026 04:13:07 -0700 (PDT)
X-Received: by 2002:a05:6a21:9981:b0:3b7:a8f5:7889 with SMTP id adf61e73a8af0-3bd4af5174dmr3530775637.7.1782472386965;
        Fri, 26 Jun 2026 04:13:06 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845c7c935f6sm1097384b3a.19.2026.06.26.04.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 04:13:06 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com,
        mohd.anwar@oss.qualcomm.com, krishna.chundru@oss.qualcomm.com,
        monish.chunara@oss.qualcomm.com
Subject: [PATCH v5 0/2] arm64: dts: qcom: Introduce support for Monaco-ac-sku Evaluation Kit
Date: Fri, 26 Jun 2026 16:42:58 +0530
Message-Id: <20260626111301.3479559-1-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5MCBTYWx0ZWRfX2KZAa1Kb/9p/
 Q6AiTK/dKhoKlmyvJXAFmVCSLhunGje9fDJUoMAboxaoOkWBNutGoF9Klapia7Gey/JW/4gBeWK
 kYIfRRurbl86gpjGBXT2N9PwwDb6Zzc=
X-Proofpoint-GUID: rLNa-0sll9Jrh7122HK1IEg4-7Srp1U7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5MCBTYWx0ZWRfX7kQ3JJwLX/jp
 gKuZ3gnJIRmIf+ZKgU2dhNCRHrwuii04kgBzglvbKCoursqymEy8/3hPb+eC2vFJDVFuIhYRYPv
 pmSL31O1D0Q1UhcQYJ6vPV91zG/bxXv/d3MS7mBqFPnJo8u/+PtMm7ksXynkiyMFrD+LMvnajCn
 dccdaHcK3WPriWHYluogGBa9jytVAqZplpvWrySaZ3Ia/c+zEenOAcIbwPqLfb3YbQ54Wr0M30G
 1zbfIns9SDzZVo/FtJdMTK5OjGs+ROUu8VcCnuEHu2ug0tH6NJDRQ8t+H35cfohmwV/oZ52kLcX
 7VjoyU5g3zRuq80OQVAWWxSsv3BnF55DroMv0Sn+Qs2nqVKYbUNVWrFc0GMmI2BKYe10xxtZSK1
 ZRlt4W+m/hDe/zFyttatzpjLOIXBPjMLZbToyigETr1tHV9xNPWAQBWijxhLuj6T9pHI7fUZm+B
 QD4XSftuHDT+XMBxoDg==
X-Proofpoint-ORIG-GUID: rLNa-0sll9Jrh7122HK1IEg4-7Srp1U7
X-Authority-Analysis: v=2.4 cv=IM8yzAvG c=1 sm=1 tr=0 ts=6a3e5ec4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=Li8ycNgQwKCU7nWBN7QA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260090

Add support for Qualcomm's Monaco-ac-sku Evaluation Kit (EVK) without
safety monitoring feature of Safety Island(SAIL) subsystem.
This board is based on Qualcomm's QCS8300-AC variant SoC.

Monaco-ac-sku EVK board is a single board computer (SBC) that supports various
industrial applications, including factory automation, industrial
robots, drones, edge AI boxes, machine vision, autonomous mobile
robots (AMRs), and industrial gateways.

Compared to Monaco EVK (monaco-aa):
  - monaco-ac delivers 20 TOPS of NPU performance vs 40 TOPS on
    monaco-aa variant.
  - The power delivery network is simplified from a 4-PMIC arrangement
    (2x PM8654AU + Maxim MAX20018 + TI TPS6594) to 2 PMICs(2x PM8654AU)

Also, monaco-ac-evk board supports monaco-evk-ifp-mezzanine attach, Add
support for combined dtb "monaco-ac-evk-ifp-mezzanine" as well, which
overlays monaco-evk-ifp-mezzanine on top of monaco-ac-evk DT.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---

Changes in v5:
- Create a seperate board DT file for this platform instead of having a
  common DTSI file b/w monaco-evk and monaco-ac-evk platform - Dmitry.
- Link to v4: https://lore.kernel.org/lkml/20260427170505.1494703-1-umang.chheda@oss.qualcomm.com/

Changes in v4:
- Add support for combined DTB "monaco-ac-evk-ifp-mezzanine" which
  overlays monaco-evk-ifp-mezzanine DTBO on top of monaco-ac-evk DT.
- Link to v3: https://lore.kernel.org/lkml/20260413114819.3894307-1-umang.chheda@oss.qualcomm.com/

Changes in v3:
- Extract common nodes of monaco-evk and monaco-ac-evk into and common
  dtsi file "monaco-evk-common.dtsi" to avoid duplication - Dmitry.
- Update the commit text and cover letter to justify the re-factoring of
  DT.
- Link to v2: https://lore.kernel.org/lkml/20260401-monaco-evk-ac-sku-v2-0-27b5f702cfba@oss.qualcomm.com/

Changes in v2:
- Drop keyword "sku" from the compatible string of board bindings
  - Krzysztof.
- Wrap commit text of dt-bindings change based on upstream guidelines
  - Krzysztof.
- Link to v1: https://patch.msgid.link/20260328-monaco-evk-ac-sku-v1-0-79d166fa5571@oss.qualcomm.com

Umang Chheda (2):
  dt-bindings: arm: qcom: Add monaco-ac-evk support
  arm64: dts: qcom: monaco: Add monaco-ac EVK board

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts    | 938 ++++++++++++++++++
 3 files changed, 940 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts

--
2.34.1

