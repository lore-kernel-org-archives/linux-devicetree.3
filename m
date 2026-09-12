Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428DD35C6A3
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 14:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789224447; cv=none; b=UzVQEfTRwa8ReNDoeT+e1wEYuPmMxDXYFQrNB4OMEMHXUpZNRvzovrAiBSThmcMuei1t/akVrqVPO7ctVGIrrSFrES4IgUh5new6iiWRP5jXTEG9dJXJyPmPz9CNXhaNrB67/Mdk9r0yAF48I0a85UZ4w0TCSw830yfQHqneR+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789224447; c=relaxed/simple;
	bh=5krW5Et/tiAldox4dzmZqrKcvKwNsM04JjUZx4bH4vY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ro20/8xemMzu3v9DkxCmhI46HcnKiGBNW5td7/I7EsdAyIWXzKnWqO3BAP+qPDuAS1rfZH1s7r6TdV9BkUYEwVxjtE4ifNn1Ni0MuxDgHHJ5pSc7A554KYwdHz7NerC2lMDcmfgM0VxC7j2yDrUeCfImo7dbFycHk+hTg1jZN90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7N9S5gV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SLIflH3E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7N9S5gV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SLIflH3E"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEe0kp3250484
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 14:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s2k6MkLzYKHJ5Uosmubx6+
	STv87/Tf/oU7QicZYandA=; b=f7N9S5gV+OXbdDYF+EdSiLEeHzJe3IOXX10GCi
	dakUBpRgu06D1/y+1LnvdDQdBu1IbvWhVn4tWZ91e/nJALHTGgQxDRohGJMLxhNr
	AazBJeuEmgW45TBPcQhXfIsUpyJfD+V44X2TzuQucMqvr9yfhHO43Q4qq1MQIhGm
	E5An25qHPuqwZuAlPGgvaI7pexzS7hZQCAuQeHMBeA20x13rvqN5CF+m0BKYFmYt
	QTUwT1CLccVA/AT58oG2W6LHeFRf++Dy22vYZcq7Tx7HdmBQn7+4VJIXS5FHG8PC
	cxNKS1D0UGCClPzO6nycYaD1dQhKzMH5oG/UNh7loctgfqxw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c15kq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 14:47:22 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc44d708055so3047527a12.0
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 07:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789224442; x=1789829242; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s2k6MkLzYKHJ5Uosmubx6+STv87/Tf/oU7QicZYandA=;
        b=SLIflH3E2E7zCdv+MJY1ACSqx6uMKuZlwPCZZjVXvXa6UeGFVhxys8W7HdBBxUhcEq
         5UFQIm4K+Zdj4auQX+EvUxBm1ANDBij1Cf9Nr8RtbzXSpk/i8qQ11hXcsT1Qh661pjZd
         0E7NruS/I1J16APbrsq1GpQhI+KGQYRrRQkL4GHDX1Gn8uyjyec0MkaCD3+CSciaW+vc
         p+RW4UsE3OmfT86aeDH4VjF3S1H2U7/YdBmtxGbUhWjpaKGuCeFoT3Y/Zb0S1KjKkFFy
         0kQQEUyImULJy5eap+3Vvcq9WJCM8b9nD774NuDup9GXNA1OLcQsB2OiaQwoQ2l/Z7Sa
         cZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789224442; x=1789829242;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s2k6MkLzYKHJ5Uosmubx6+STv87/Tf/oU7QicZYandA=;
        b=J+fFOcgArc+pqBDMvpn+B74usCyxo8fR9LMB2usz0r5Wq05t91GGfAN2a5dm4r8Mif
         7j3xy4E6hQ6kU3Ne1Vxc1RXDmce1UeXK/M3rXfynKEeKZA24H9bx6q1mLh3yOOEURTQ8
         eHw+XY1H7DH5RxUESuWXe9m3L9/eAcKPuXSuzJKgdVicrNOXxu9nIm6l1xMvrW8jos32
         D8oUeFWZB/waXoGGSNb54trdYzcRibiJhxycQScrSL/Mm0Fl2kRn4FVtZh1xZndUAWwx
         4dUa2Jb3E/Gjh0Mq3w9hZh39QL8E1KliZvCaoE1LggZqUphnsgV+uncocTU9+qGeRvas
         vUaQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7vCMIk959FndLVeTRNAUFBAozHX4g78+HnMo0pm4aIUVvChfcplLN/ydLLKtOnSPINi02ath6NeT3@vger.kernel.org
X-Gm-Message-State: AFuF++lSJx4tu2w4syNx17awC0RQF+Ag9hTtSFRTdGke+vEEkWto5UbM
	tsDt51JIQEDifo2Ab8nALwDtFnFX58yYPSJKk1noOguXv4gBvPJ3secf+L0iD3Hk1U5hdEgzbzn
	7QjQyRb6t25MznGQkVoMyq4MXcP78ZIVKSLDY7LnXfvt8sREduRmUpGEPOK7m6W9F
X-Gm-Gg: AYBFou1GxCFtly8XgtU+YdqBp/MhUE42KWn+IWI+1LQkZHjFTPrLGM+lT4hUoAiVIxt
	4UoJCm47zJ1V34pLhN4A5Vp5RI/BkpgKYm7zk325vU6203hWCQSB1hF4zGNF6bCsUrYrPvAyIdv
	l2pBTS6DWWjM0bfrIk8LSzDMQICuzYIwGt4Ux0nfgv7jEEVq/FR/fjOQ7+BrxG1qdBVN2i7xtOv
	3EkK8I5JtrTsZEZjxUK7UL/vQ4g1H/OyB9OuvarMEqUIlJG96zmmkGbm93UWwE1I9omcB/ENOCN
	pVhHgHOBfFRZTKi3+x0W0SPcE/HeKhCU4Kz9hURBjKNoArKfdAw6Lc6TBpjzS2ud2NNM5y8EFNf
	d806Ysg4LqgwK9xk=
X-Received: by 2002:a05:6a21:113:b0:3d2:2afa:d77 with SMTP id adf61e73a8af0-3daed68139fmr15874611637.14.1789224441802;
        Sat, 12 Sep 2026 07:47:21 -0700 (PDT)
X-Received: by 2002:a05:6a21:113:b0:3d2:2afa:d77 with SMTP id adf61e73a8af0-3daed68139fmr15874559637.14.1789224441354;
        Sat, 12 Sep 2026 07:47:21 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f7390csm14344833eec.26.2026.09.12.07.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 07:47:20 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v9 0/3] Add DT Support for USB on Shikra
Date: Sat, 12 Sep 2026 20:17:00 +0530
Message-Id: <20260912-usb-shikra-v7-v9-0-c7b507a0ec27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAORlpWoC/2WNzQ6CMBCEX8Xs2ZLyoxZPvofhULaLVIVqFxoN4
 d0tcPQyyZfMfDMBk7fEcN5N4ClYtq6PUO53gK3ubySsiQyZzI5SpakYuRbc2ofXIpxEZlCaXDe
 YmwLi5uWpsZ/Vd6025rG+Ew6LZGm0lgfnv+thUEtvc5d/7qCEFOqQEhU1SiK8OObkPeonuq5LY
 kA1z/MPuw/L1cMAAAA=
X-Change-ID: 20260811-usb-shikra-v7-2dc0d3afc3d4
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789224435; l=3853;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=5krW5Et/tiAldox4dzmZqrKcvKwNsM04JjUZx4bH4vY=;
 b=yoSPDV0Fo3WYuskJaGfqJcFQSziihrDj87XyMP2PY5EkbfKmEq5UEH2hNXowXyGYN+EuV5WeT
 Z7C3edCcKx6CnRMAiXmLDEpjKxIDPfQ9zPlM14FAJ49WSUhzLAN6mZQ
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: _3BG5KceUR8fBEJnhfUiEb8JfSszcB-e
X-Proofpoint-GUID: _3BG5KceUR8fBEJnhfUiEb8JfSszcB-e
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa565fa cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=t1oMc6EiptJ9flWhJMEA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIxMyBTYWx0ZWRfX2Wak3PJexyqH
 uyXA+zK8M9HGoGlNVY7g5F+1LcDBz2LxgEZlBD5X9ZWmeU6v1wYXwlC5M8V9XytDizHOcdcSPXm
 0Uaaqjg3fVF4A6S88To5lTIgd7eyWPHSRpGrEMk5DZs5MzUMWvWxOwyCNeBXVmaDx4mgvop4fvt
 XyR2hAt3MFcCEyKWOGyg3wK6fIDMemF6eD8lORo1s+wQ7wY364xZD0HxuT+2GGtSivZLgUbtpTW
 XjiDxhfgLzWM0yEvzH2SUsIRRAke4VmlcifRIM8iZbEGqQNND72nzwqdYXYBoa4xzkMDMHEtp4B
 foI/x2AWhaIcxI4Mt9L70Im23BInTGKon7aBJZ0hVaxznjoOY1R2ZjFuqR+7LUcLJ0HFgH2/ZAK
 5cFIGReZFtWlcB8+W9wClKFiOhOkAxPsefepKFTMUPUh1WnaLmW//pOL1hrKuQmOM/EvwW+Fd1s
 5gJNK+HVf44JwP1sATw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIxMyBTYWx0ZWRfX2i6nqvLntBUV
 clolF2KJqmim+o6Ain6xarBXWk7BeZYvFmyItX8g5XQ2YfvQquZvMnTzW0/UFU3v78ibi1Ws/R/
 W5wqvdq53n7OEiE8wGhX0IQjOvJbI6Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120213

Shikra has two USB controllers. Adding both USB controllers support
in device mode in this series. Also squashing Type-C enablement on
CQS/CQM platforms [1] into base USB enablement changes on these
platforms [2] based on feedback to squash related subsystem changes.

While at it, also sorting subnodes under soc@0 for consistency.

[1]: https://lore.kernel.org/all/20260818-pm4125_typec_changes-v1-1-6e6ede93db19@oss.qualcomm.com/
[2]: https://lore.kernel.org/all/20260811-usb-shikra-v7-v7-2-753e928f37ae@oss.qualcomm.com/

Changes in v9:
- Move usb_2_hsphy above usb_qmpphy to maintain alphabetical ordering

Link to v8:
https://lore.kernel.org/r/20260911-usb-shikra-v7-v8-0-851ee4bc0eec@oss.qualcomm.com

Changes in v8:
 - Rebase on top of latest linux-next branch
 - Sort /soc@0 subnodes in ascending order of unit address 
 - Squashed with Type-C support change
 - Individual patches were previously reviewed by Abel, Dmitry, Konrad and
   Mani; however, those reviews do not apply to the squashed commit and
   are therefore being dropped

 Link to v7:
 https://lore.kernel.org/all/20260811-usb-shikra-v7-v7-0-753e928f37ae@oss.qualcomm.com/

Changes in v7:
- Rebased on top of latest for-next branch
- Added Mani's tag from cover letter to both the induvidual patches.

Link to v6:
https://lore.kernel.org/all/20260729-shikra-usb-v6-dt-v6-0-72ffb4796a08@oss.qualcomm.com/

Changes in v6:
- Moved dr_mode property to shikra-evk.dtsi
- Merged platform specific changes into one patch

Link to v5:
https://lore.kernel.org/all/20260723-usb-shikra-dt-v4-v5-0-5b69d9eb0888@oss.qualcomm.com/

Changes in v5:
- Added interconnects and sorted nodes alphanumerically - Dmitry
- Updated commit text mentioning that device mode is being enabled
  since role switching changes are not yet present.

Link to v4:
https://patch.msgid.link/20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com

Changes in v4:
- Enable both controllers in CQS/CQM platform
- Fixed iface clock in usb_2 node
- Skipped adding RB tags obtained from Konrad since on CQM/CQS, second
  controller also is enabled in v4. Also specified dr_mode as peripheral
  for first controller.

Link to v3:
https://lore.kernel.org/all/20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com/

Changes in v3:
- USB changes were sent as part of consolidated submission in v2, but
  they were later dropped since bindings had to be updated.
- Remove double vote on USB3_PRIM_CLKREF and also removed xo clock.
- Uses &mpm as interrupt reference (sashiko bot)

Link to v2:
https://lore.kernel.org/all/20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com/

Changes in v2:
- Moved to using mpm interrupt handler for ss phy irq (sashiko bot)

Link to v1:
https://lore.kernel.org/all/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com/

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Komal Bajaj (1):
      arm64: dts: qcom: shikra: sort /soc@0 nodes by unit address

Krishna Kurapati (2):
      arm64: dts: qcom: Add support for usb nodes on Shikra
      arm64: dts: qcom: shikra: Enable USB controllers and primary Type-C support

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts  |  43 +++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi |  41 +++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts  |  43 +++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi     |  12 +
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts  |  23 ++
 arch/arm64/boot/dts/qcom/shikra.dtsi         | 515 +++++++++++++++++++--------
 6 files changed, 536 insertions(+), 141 deletions(-)
---
base-commit: f2bfbc3554ca6919484030729424b9dee2942d24
change-id: 20260811-usb-shikra-v7-2dc0d3afc3d4

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

