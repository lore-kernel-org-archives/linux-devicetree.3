Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CE41FC8
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 04:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778558917; cv=none; b=CQq1TZyME40l39gN2j3MdCkcpDcSun6O6UmWpcSnd1i+NO+qb44YbUiaRov3AqWYDck5kX8YfXxrX4FB7RQx4vADJ7ZM0JW4iIN0xwpf1EJaL0eplhLwg/Z80B3OMVIXxUSHSkV0c8fDre/BPQH3slrZnNKnv9QZaORG9isjYc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778558917; c=relaxed/simple;
	bh=kqP7cS9MWJQk4SwABtNVCsRBxc/cDldsdq63dxndWoI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RmKY+ueTOtFiKLyUK9kfu9G491QrtTdsH/FovKADuDDdSHnjQbta4OfDUI+RM4UXxcm1Jqp2+U5TguQeMORX7TnPWNMBsaKD2AJ4wXVq/4P5W6Afnhw1L45iqAeY/zzLvtEY/EL3jO6Pybp0LjvJiT29bmoTWnY9WuGzBMOtLVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VLMvUSye; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TCTIqn63; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VLMvUSye";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TCTIqn63"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6sA22804232
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 04:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Rd1E+u+bedvehaMv+PHJC4
	fcSrBbt21nM9G/UBz0nPw=; b=VLMvUSyeQ3rb9EXTPdeW9jyTM4fVJ9pZrJqssD
	nbJplBVBJ/LyHInMhhHZ34ioAcJwUrDLEXRm3b7Jo64YMHqDZ+8b5e3XUNCts1Yi
	a9bwC+qL0YZ6BYQywZvanjIlEqOpkUTo2xCm41LoYrq/AFBMbWi9QOKqTBOC7d8u
	CMIEN40FCURtd6L6KlMsDey/oHqNSiGoZ80IK6zYBUybQcUdvJtnDlEVu+SqDdqi
	6WqLiA/1CUgoUiOdit4c4cXXio9PBBtp3JzHx7t85RT0s7ikbB5Rusd4l6MjR+fo
	pQJ9MGZJOKd3DOe+SW6wRx9IHbgfrIf48P/zyVdCExh1c8OQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv39e1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 04:08:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba6fe41283so59226735ad.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 21:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778558913; x=1779163713; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rd1E+u+bedvehaMv+PHJC4fcSrBbt21nM9G/UBz0nPw=;
        b=TCTIqn63SduPuwSlm346fRRVi9pEcnvtiR/BL3Fl0+gs7GBPREsQC110cNaw9v7sJa
         IFTFq20kXMEF0dBG0I0Zvw+Pnyj3Ioaq6LKWJKt9DPuAVb8L9Y0jqsHUYGIrLEn8L8+t
         rqcuAC6zq/8HGdgFIuvLTUqFBQcjgRgUz4uRLtPeZklJsOygJIJGDYTw0fNUiNMsiItE
         4gD7o74tecwDgYWppSnLUtXiIm4hcdD6OAryuHzI3KFWVMjnnJOpkGFIj+ZcLxB5VrOQ
         zrVBWBrMDEzXe2tFkcfY1VGPoA9AXm3Y+gombqCh227Fx1s/rXEdNtBcWEB5HuqF7Wxz
         oX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778558913; x=1779163713;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rd1E+u+bedvehaMv+PHJC4fcSrBbt21nM9G/UBz0nPw=;
        b=aj3oWDX/1Eh17QrYsIqLvV22tcbbS9FTk8DukirJxWSsashsFlaAw+ejJDAS6+h2Wz
         vH4eDUkTahlrHIIdEnBX/eRssP6rU4Eo85fYO8ly302GRGcdGXKtza2F6l1fNCyo2L0N
         QyEMCuqHVxNy6bcnmLMJLUR9U+FyNBCgAdAlxyaXmif2CxiowS/XdDTzxr7/QIQ0vpYN
         CKPKXwGh7VBB1JyGmOYtDdoXtWjJHad6XjDLumLdxH41ZtKaX1KxNinknNBM/OjNvvBW
         b+7iHllv6ccNk1/hqXmRL8a+HWhf+GTDB8EJN/8JhbC1KyuXYlHg65kwWHzjKR6o3P7t
         fIxQ==
X-Forwarded-Encrypted: i=1; AFNElJ98/akeIYIaAnmpoPZTMfQynEENVwNW4FWyPsUNOjuITxlbp00BQbmbbeKSEt655U+zEcvwDauwLmSK@vger.kernel.org
X-Gm-Message-State: AOJu0YwBPRwpnN5GgT3398uUDC1CMTbcusaiUQm5UFRm18P/RIi9weB/
	FhM2bLh6vyaoQFCQlqB9V7ondud/vbEBEAPxDLr3Zebeo0w/bj9vrymLBXBMk+RHZqMosk7Zq6f
	fD19G1yC6SC+v5xAaPVwR1SwBH7KvRV1zV4Eo1NJHIh70nxv3t9xLlMp67ucUF06hpSSDMtON
X-Gm-Gg: Acq92OG8jbPMdTfSUTRYMlLUTeDUDzCsHEZnQRpliiVqsjUAiIesqjymAkI3Td2a88G
	seYYjtIcQJvO3fo0wFt+GC+pZ8j4xB8tG6vGQji4juW03xsmGhUGdYCSFB6kR6bTuVG/VVEi6lY
	ztrzyJT6UmPMBTpP+REf7Yj1Ao9lJgcDksBTSb0PlO1t9MY7O4WEFPLK2SlT0fLSpOL3HKaivyv
	1WoHMB6B3Jfv44/FBtHg+wBXiBamx2z5dwxbYjJgSta4zE44j/lgKgUeS2GJtjrHstzkoRAcgSo
	FGmz0VwyXBzM4g8wBRlvrt8Qg2hDfqjolg5Hsd+StxfcuYJyuXte2de5ZW7MZiTHABXQIiVurhZ
	SnTeHUxstM7STJDZVzT4f24oxTxgSwzbprImY
X-Received: by 2002:a17:903:289:b0:2bc:7eee:200d with SMTP id d9443c01a7336-2bc7eee20c3mr130044425ad.33.1778558913283;
        Mon, 11 May 2026 21:08:33 -0700 (PDT)
X-Received: by 2002:a17:903:289:b0:2bc:7eee:200d with SMTP id d9443c01a7336-2bc7eee20c3mr130043915ad.33.1778558912667;
        Mon, 11 May 2026 21:08:32 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d405adsm122646725ad.28.2026.05.11.21.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 21:08:32 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH 0/4] arm64: dts: qcom: Add initial device tree support for
 Shikra
Date: Tue, 12 May 2026 09:38:03 +0530
Message-Id: <20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKSnAmoC/42T22rjMBCGXyX4emV0lp2rfY+lGJ0mEbFsR7Kzh
 dJ3XzVn2LrtjWDEfP+M5h+9Vdmn4HO13bxVyZ9CDuNQAvJrU9m9HnYeBVfiimIqsSAE5X04JI3
 cjJwSrlVccMllVfKn5CG8nrX+vFzi5I9LkZwvlw/F7easx2l705vCYOfUI3CKaCO9dRK2J1Y99
 3GlGMVXqgvWIkPAeuCCUOpWiI862rluig0RuEt+t/R6HlNGmikGgnnDm1KOfAWnKU6uu7YLQjW
 KGQpa2S+4a/autFnwctr+kBHFLfcOAJjB2xP9FGb3N0YdejO+dno499BdUouK8wp841vJb5OKP
 mf9LCMwJwpL0da0oYJRRNAhhbwfdH1Ykp70HH6POdfHRfd2jLEux6oQF4rgmgpFyxr8UGj9XSj
 HuCATBheGHVLGg+fCW6B6bZ4PNEQf76hWxrSOApGOrqAC3/c222cSQIA2DsMPyNnmdEeLeUQ2r
 ee4Vd+jf924u6OMlc1xFnRD4Hv0CFMaHy1bKsvOkeI51iurIzC9wX3/8T9uI24YNZR7UPxW9xO
 bG4KJ4LxWTDKiis1xHIrPtd0vg076f5Nf3t//AQSo1x5FBAAA
X-Change-ID: 20260511-shikra-dt-d75d97454646
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778558905; l=4319;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=kqP7cS9MWJQk4SwABtNVCsRBxc/cDldsdq63dxndWoI=;
 b=xnYAwPQZNvI8hno1y4enJ0vASb+aefg/M4t4rAphz3RULxjOkXgFmX7yYO+EcW/3mWeiSJkLx
 +0jCaB7tZuTA9U5snyHskrQvnoZZzcmBPNAKGxJT8FwE4iAnLWCUEVr
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAzNSBTYWx0ZWRfX8mF5LW8UwIEu
 JLBrfpVWoAPIhQt2SIQ6tRu2vVaI812X14xJv1UrYydM/SY62V3MmaCDTbZ7PPpVgLV1unazC7L
 58YWEa35OZ3r2NOkk2lEnqkj5p4Nqko3FDzcZ5k+V7Sqdu+3r2QgMUbzKDxI5+xK0lkdp2Y5qnJ
 +rlxJdbw58lQBg4q0uRf/lfc7kr9v9s9cw6ijBXu1GgjtC6Ho9PIIKQhk2ZyImEE0GoOkEu5+ES
 p5Na6zDylv+i+EKJw83aF2bpy2eqqoFW8M/jhDSTE1iDIakfgdxzGQFhTDlmU033zOCNoKVnA6U
 2Dc6wtqyNRaxQS1oc/uMJO110cerCB1dgFSCObLWHbTe9R7Fnt5oEXIGjNXy1DVXqGwnRHeqK9V
 +MNIVw15eM7KPfwFa9W67pzHpRmecgfNorbq7Tf484M7sg5Itfg5k0/XZC+b8jokLx/EHEMIK4k
 7oGpMqvYgJjyfPJ4kTQ==
X-Authority-Analysis: v=2.4 cv=Kvp9H2WN c=1 sm=1 tr=0 ts=6a02a7c3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=uX85a7QtwIfg7uBTYAUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: TIqVShF9_ora4pTMUSN1cy6TQjqeLKLK
X-Proofpoint-GUID: TIqVShF9_ora4pTMUSN1cy6TQjqeLKLK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120035

Add initial device tree support for the Qualcomm Shikra SoC.
Shikra ships in a SoM form factor; this series covers the CQM variant
and its two EVK boards.
The series adds:
- dt-bindings for the CQM SoM variant and its two EVK boards
- SoC base DTSI
- CQM SoM DTSI with PM4125 PMIC regulator definitions
- EVK DTS files enabling UART, USB, and eMMC on the carrier board

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

---
Komal Bajaj (4):
      dt-bindings: arm: qcom: Document Shikra and its EVK boards
      arm64: dts: qcom: Introduce Shikra SoC base dtsi
      arm64: dts: qcom: Add Shikra CQM SoM platform
      arm64: dts: qcom: Add Shikra CQM and CQS EVK boards

 Documentation/devicetree/bindings/arm/qcom.yaml |   7 +
 arch/arm64/boot/dts/qcom/Makefile               |   2 +
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts     |  61 ++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi    | 112 +++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts     |  61 ++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi        |  13 +
 arch/arm64/boot/dts/qcom/shikra.dtsi            | 966 ++++++++++++++++++++++++
 7 files changed, 1222 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260511-shikra-dt-d75d97454646
prerequisite-change-id: 20260429-shikra-pinctrl-fd71ab6ecd6f:v3
prerequisite-patch-id: d84e0b4c2788ab6cfcefc9806e7a6011eef8f91d
prerequisite-patch-id: b173720338ac515e3c89ab2c96d7b1b9ff99540a
prerequisite-change-id: 20260320-shikra_icc-b1fcef45122d:v3
prerequisite-patch-id: d36ec191324b7992a56c463a15ff09bacd8d7ba1
prerequisite-patch-id: c6edf2e05d1409667c9674b765dbd0917401a903
prerequisite-change-id: 20260429-add_pm8150_regulators-a373f53eb48f:v1
prerequisite-patch-id: b312905695c635bf1e3deab87b718c92adf07f54
prerequisite-patch-id: 390dee07914f18c7df08c57b3c59c25d1588b62f
prerequisite-change-id: 20260429-add_rpmpd_shikra-f57873b2fa7c:v1
prerequisite-patch-id: 2aab0b42cafb535b31c5154002c12f381a52be9a
prerequisite-patch-id: 491f7ab91ee90ebe98d78f7a9d706208ad74be5c
prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v2
prerequisite-patch-id: 5a0fbdd458785da2d0e850c851a05046672ecadf
prerequisite-patch-id: 1f98e515a52bbeb25e2a960a804afe16c6a472a1
prerequisite-patch-id: a64476b2ba6e0f2a55928baf72ec32672ee0123c
prerequisite-patch-id: d0c8651205232862b40f942929e1efdaa3084eb3
prerequisite-change-id: 20260430-shikra_mailbox_and_rpm_changes-2de7fe8e964f:v3
prerequisite-patch-id: e80ea7940b9817449cec21afa6e9e443e007166f
prerequisite-patch-id: 2526e0507d3b5c065eafd75a657d7f903af8488f
prerequisite-patch-id: c3b7e18cd60d1f779b88ace2fae1227d3d37d83e
prerequisite-message-id: 20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com
prerequisite-patch-id: 0cbcb69abbbf83da785619c266c96af624c38a87
prerequisite-patch-id: 047b2e1c1db0a5928b951a3f0bc9b0416032cb2b
prerequisite-patch-id: 6126fcda921fe53b86b3a18c649fd8ff2e1f43d8
prerequisite-patch-id: 8d1bc1ee4b4c1009a953bda66e849198d9e16352
prerequisite-message-id: 20260504145710.257211-1-krishna.kurapati@oss.qualcomm.com
prerequisite-patch-id: 2d2cba33f2dfbb05b620484e9c46eb31306fa72d
prerequisite-change-id: 20260430-shikra-smmu-binding-7befe45ecf2a:v1
prerequisite-patch-id: 657d2fa91247aa0c222b595c41328087f04f01a2
prerequisite-change-id: 20260430-shikra-imem-binding-a7bb9d2f16d2:v1
prerequisite-patch-id: 80d8ab865b7b0663c5b2878b45b55e2e4fde9c19
prerequisite-change-id: 20260501-shikra-scm-binding-a7ff5fabd0f2:v1
prerequisite-patch-id: 8e645e1c6ad6182de4813a726c293654324de1df
prerequisite-change-id: 20260501-shikra-tcsr-binding-fff1689e4097:v1
prerequisite-patch-id: f6781d2cf0829ccb32f1400623c95739972f2ee2
prerequisite-change-id: 20260501-shikra-wdog-binding-33873dcfa81f:v1
prerequisite-patch-id: de5184831054bcb48889fca16b2f4b5e95da9935
prerequisite-change-id: 20260501-shikra-qfprom-binding-c262fa19640a:v2
prerequisite-patch-id: f284f0dc01674ea0a78c8cf40ada72a7a1636463
prerequisite-change-id: 20260502-shikra-llcc-binding-7832b24ef74f:v1
prerequisite-patch-id: b9e53d2b5b494d4a957a691340fb2563f3dd681c
prerequisite-message-id: 20260508101544.736317-1-monish.chunara@oss.qualcomm.com
prerequisite-patch-id: 2a9d88175f19bfdb9495a704681ff0093da5566c

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

