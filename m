Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984D4375F87
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782804180; cv=none; b=exuWCJv5Nge8pkBlqmL5ODqYhAPeRfYK/CU7YcvGVdDuXipB079F5McIy5JD3EFLpRRVkUKwz674ksPNcycs0Hrcw5tdt5jWWWfT/KXuk6lCoSQhw5lmM2WiNnBG0oYnjwd7o3VLXKncR2oTOOLf8wRukNezKrOTg23Zmi37pbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782804180; c=relaxed/simple;
	bh=LISlRcfKm3g4YXZU2nLP8QOghv77ebuR79OjXXjCvPM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pVgN2MT0Hv8RzUcZgxFtCM7/RENW01M+3Er5+zwmtybKqoX1q1wcbDvKpmogS5IROePSBkuU3gw5MUku4WuwQyApFNuVZzehsHuur5ueQi0y24ccwEUBAyg/N+rL8R8aMlAKVIUDHVmWWhf6xUUXbCzaxUUwSFkt6Hf1E+hVyYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MRF8yas0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZCc4aLK7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MRF8yas0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZCc4aLK7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CaCq1009194
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rT2vbwcNUEl9FTDv8LclD7
	W+3Yr6xVMKM9m1hLL8j3Q=; b=MRF8yas0eYmsKenS/iNnpQdIEiaGVK4vJR18JK
	H9hzSJMi++cSYSyhmdJq+vvR7RTvoV+xGMfWtw+9PDH+i0bbZNzNr+U4wrwQ6/a5
	scVxywYCqreOssOUrjkFdIHH4N6xhyPvHxhSgMT39C7SgqYehcqZJvJ4acChUiQ3
	JZ0R0u5po+f4w2i+uCVbTD9Al+8edjh8KJNlDsSJvzZGdtTjEQa/fY7u6/bQDBwX
	QuRP/6ms53IWjkJaBMsCqRFpPRI9DOtCmvQ7PDYbZ14IpaX2ExfivApB5WnrqEat
	DKmLSafOB/OM1r1fhzBwWKWTBGEcMUJ6keuDAcgtpNHk4RAw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3yw91yj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:22:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e66f9e2baso57364585a.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 00:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782804176; x=1783408976; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rT2vbwcNUEl9FTDv8LclD7W+3Yr6xVMKM9m1hLL8j3Q=;
        b=ZCc4aLK71fbLfXid1JkKtvsXr3OmoQzr+LLk4yAcrPCN4QYE+EsuEbG7Y/3JWj/gQj
         WZ65wrFRET+kQ93KvOFXdVtKFe9ffJbjvou2KbInnqNcOhP0rAIsMlfgqBtBw4MP3dpb
         ZoMRgjCou15CWYJ/UQ/hv2DJn73TbeFI01JwbGo3SqdcVfaz0tjuWJlF8K6I4L+KHGUi
         tJcDy0jOcSxROuL81NX6o0slRgtO89QSJfGcZz3jWf201udSVmdOyFfpHW/WTeUJ3SBh
         ZyV8RgIMzyNloprXZbfsUJ0JF8bRlhpbHhMqHHRHe6LSSqnMLLfu4CtEX0q2ikXNt8XN
         I1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782804176; x=1783408976;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rT2vbwcNUEl9FTDv8LclD7W+3Yr6xVMKM9m1hLL8j3Q=;
        b=qUTsRbWK7FFp0dgGRJcg/nUjw3r7Hy6jY46QX4Jaj86bHhP/TEQ0WhjNheNNQcbtIg
         BZs9PMklavYJbSNJdg6mRatFQrdGX05MTggCiQEcOYOvpMBt/bGIZaehkVOqhPeW11o9
         gf1w74mzfyRtSRmTOuBTcC9w7hcLuDvaZqQ9v6yZ7t0zwd/FIaIrwU0xBzB+iAjX3YMF
         SAHp7pQSgJJvurCeIryQJwhytyI5zjkHAzZt3RRPZbbR92b8qlDL0MeX4wGsrNYs3bix
         pGOBe575jnOnjmj3LWb3drp89PFFRisNp2cwWd9nVZOHd5hh5zPFazS5j8t993RvzmTr
         3MFg==
X-Forwarded-Encrypted: i=1; AFNElJ/fCYjI21h9lKE39zneRqxhGNR6lKp3+FI6z6jYzEfSTxGXp9qrnY48vOAFROW5wvQ5mGuOmjjEYu3y@vger.kernel.org
X-Gm-Message-State: AOJu0YyZeqHSH5+fxfhFAtRqqiL3UtIFS8cq8bTxEkFI3TxibnWHevWR
	QZAN3RTDsN0+GyMDZ8eDw2WzjuOTEWqmG9hwCh7HrY1+CstTlvloItpR9ikpoujGwjlpVvw4gTD
	vkjvOmA4J1ASfKARhh3RUrG8WnXdBMHTuogELim/smBIhBIf6FAMgSzJ5hUku3DpW
X-Gm-Gg: AfdE7cmJyK2JmceV875lBNmcreRePbnXkRb2dX8/wim2Lz5EAAeVj8HjYcZBnAP3diG
	7RRIanPKk+oiMHUX5ksg8NVyfP2NmWPpIuUVveUXjTLqVeINdVFtoSTFFTjIzIfGMDt6lR8U/FM
	pv5Tj37NG/mM6vpk+GXwm13xjflCKYJxXZshLC+AZskc6DIuOmgA4Wjyf5ZfpNQ9KsqJ3Ax9zgC
	b7wraA8ORL7hcBse8s+2wZH0YfT+dvBZ/aU1122zDA7YNogTuZRrtlsrJpVxE+vlZqpMMBme+w0
	cguH/CJTBJoIXICxrbHVZKeBnu0+7HuOkO+2N+DoBmZWjjoYlqpRpklTIoLToavkN/vGV4k2ide
	w2ssjP3SWbrRrc9g=
X-Received: by 2002:a05:620a:c55:b0:92d:6961:9519 with SMTP id af79cd13be357-92e6249fe27mr419626685a.8.1782804175738;
        Tue, 30 Jun 2026 00:22:55 -0700 (PDT)
X-Received: by 2002:a05:620a:c55:b0:92d:6961:9519 with SMTP id af79cd13be357-92e6249fe27mr419623685a.8.1782804175133;
        Tue, 30 Jun 2026 00:22:55 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756778fac3sm4718622f8f.32.2026.06.30.00.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:22:54 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v4 0/3] arm64: dts: qcom: Add Eliza CQS EVK support
Date: Tue, 30 Jun 2026 10:22:39 +0300
Message-Id: <20260630-eliza-dts-qcs-evk-v4-0-18cbbdba6e7e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL9uQ2oC/3XOTW7CMBAF4Ksgr3Hkvzi4K+6BunDsoRgIaTyJV
 UC5O05oRRdhY+lZM9+bO0GIAZB8rO4kQgoY2ksOar0i7mAvX0CDz5kIJjQruaJwDjdLfY+0c0g
 hnWi154qbDRe6NCTvfUfYh5/Z3H0+Mw71EVw/Qb8TEbohl/WvsUPAvo3X+ZLEp9+/0nKhNHHKa
 MW18dXGSgl82yIW3WDPrm2aIj9kQpP4D5klSGTI+koyme/3Qr2B5AvSbBGSGaoVmJpJabV3C9A
 4jg86cVkscgEAAA==
X-Change-ID: 20260514-eliza-dts-qcs-evk-7f1419812659
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2468;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=LISlRcfKm3g4YXZU2nLP8QOghv77ebuR79OjXXjCvPM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqQ27BJC4V6wk3zn0VqzRjJIEpSATOW6TlOM6hl
 uGYrTMIcQmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCakNuwQAKCRAbX0TJAJUV
 Vv60D/9aMsXjTy4JbSJA6+SjGiE4VsK4WgR7OdAEdrI/nWz9RHciVInN6Hez+WD4kiL93/Iv3sT
 35TuuS8cP5vcXTysBheDkEDY+Irm999GMFHuEvOnc0hPmF4Fh5P9Bis6LbNNYx1xsQ0ELozok5B
 iA+hUPLMB26B323R6Z0Ag3tuQVzjwlh0DuTOBtpxd6zkIKa8mzfz3r9d695/aC5zBeILwATzfeE
 ei+/IrQgKw8VYRzSv2y7KNWrS1JjfBrem1+wutqRhP741WyzZzMnoUgz3v+jfdSDUdRuGFOLhFb
 I4uTP9qXBFjmNBfPaLTmaMRUjOM/xrYxWPJ9csWgh6vJzMOq7AO7MYZlb5JIVPpmR1TilfnpDEe
 CXb1pSG/N8xUD9xopEnfaa9uxWXPFEhXrRxbxEP6m1V/yvsGYeODvUpTO5k4X1yZCpr2ZWvKxOH
 smeKwjL0CsxvijG+G8U2NqY/Gol6/ViiUxroFnPEWTl4e5/40fTBIRAs9xGoJW8uA+d3wWkB1CT
 b040J/FzCl+MlUC/ZEhhNsj945fy2K3ZHI/FehPOekj5/Lg8TPmR8skzkvDZ1MwJ+WdbUnvHxVd
 Mogwb9bdfXKaXUc+mYcrv52EOYSaY33FBDm0PytrftUjVM58ChQFA32KlMtTaHL2SEsm8XrraaJ
 o75WSz3IGvJCJJg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2MyBTYWx0ZWRfXxm2t/nTTjOiV
 FzHd4VChi9jC/WH0XOyqtUyQ55+YhP0jylKBjAMwpZErNG2e5kWNOgT5ET8EjDPbHo4CuvMPgep
 FCvEhgYngWpPmotrl6nUj4CpR7ocWgo=
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a436ed0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=2gOZN8e4eSpdJFbEdPsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: egscY7EgmybzcEoKDbbF4Gl7IRbbeTlV
X-Proofpoint-ORIG-GUID: egscY7EgmybzcEoKDbbF4Gl7IRbbeTlV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2MyBTYWx0ZWRfX2KzAK9zpIaCs
 RW7eeouZPppzEosmlONYOPyyJrUVS9kCs89o5rtcvLfHTZ+8pSest9IK3CJ00UIGiQ/5RURaRrP
 KuEwIHxZGDym2jQV5fRcHBrmvRySY/9hKKm5tmT8aTUmC4NVKbf/umNj+mRLB3g9q1J5q6stYIw
 ugQOe4jBQXrhWL6ieC6pph2kjZsYXxH3FvnlyT6UcyCikKmqaRmfKYASo33DV4rrLU8sP3f65xS
 SP3EMaiRfO6dHdkkzJfybF8GOSbD7cevBxuzK78ZrZLxgNgx2/Tf9d7xQtNr51Xic0iMG1YB3PQ
 FRnJ3owPEiAUZhXg8PvvADfN1ClrLNMAcMuN/z4FwvTi1x76qc242mMfR1vZ0h/XSai6vIg43ms
 Li9THC6L1kOhYWg6/vuN+SqX7Ck/BR0diJIrTp1Io2IW1N3kYkYYMS9XYicGk0KinXmyFmXK6LS
 rhHB7e8VuEp2lokGzEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300063

The Eliza EVK platform is built from a reusable base board and an
Eliza System-on-Module. The base board provides connectors for external
peripherals, while each SoM variant provides the SoC, PMICs, LPDDR, and
eMMC.

Add support for the CQ7790S-based Eliza CQS EVK. The series introduces a
CQS SoM DTSI with the board clocks, PMIC regulator supplies, ADSP
firmware and eMMC wiring, then adds a common Eliza EVK DTSI and the final
Eliza CQS EVK DTS that combines both pieces. It also documents both the
CQS SoM and EVK compatibles.

Do this in order to be able to boot to shell with rootfs on eMMC, on the
Eliza CQS EVK board.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v4:
- Rebased on next-20260629.
- Link to v3: https://patch.msgid.link/20260609-eliza-dts-qcs-evk-v3-0-b4e9b033a6dc@oss.qualcomm.com

Changes in v3:
- Rebased on next-20260608.
- Moved the gpio reserved ranges property to SoM.
- Picked up Krzysztof's R-b tags for all patches.
- Picked up Konrad's R-b tags for last two patches.
- Dropped all dependencies as they have been merged already.
- Link to v2: https://patch.msgid.link/20260519-eliza-dts-qcs-evk-v2-0-ad7303659d24@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260519.
- Added missing qcom,eliza-cqs-som to the EVK dts.
- Added in the bindings patch, as that should've been part of this series
  from the start. Also dropped the CQM as support for it is not being
  added. Also reworked as Krzysztof's suggested. It was initially sent
  separately here:
  https://patch.msgid.link/20260515-eliza-bindings-evk-v1-1-8deb81ed86dd@oss.qualcomm.com
- Link to v1: https://patch.msgid.link/20260515-eliza-dts-qcs-evk-v1-0-7169d78a33e1@oss.qualcomm.com

---
Abel Vesa (3):
      dt-bindings: arm: qcom: Document Eliza CQS SoM and its EVK board
      arm64: dts: qcom: Add Eliza CQS SoM platform
      arm64: dts: qcom: Add Eliza CQS EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml |   5 +
 arch/arm64/boot/dts/qcom/Makefile               |   1 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts      |  14 +
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi     | 394 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi         |  20 ++
 5 files changed, 434 insertions(+)
---
base-commit: 7de6ae9e12207ec146f2f3f1e58d1a99317e88bc
change-id: 20260514-eliza-dts-qcs-evk-7f1419812659

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

