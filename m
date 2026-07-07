Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17BB3D891D
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 13:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431377; cv=none; b=U1iNzoNgWDS98eIWamJ7GHYJXWSLuNLZyukzYrJaVIAW0Sh7qaKWPggbqXXiTJtRHS9+tnC1HhBiocpuPHzUlWTLncBA1m1SzcNa2bi1AXeFaQ0qU54Bt7jay40Rc3rv5EC2dF3yKaghDXV8ZJFRKRtIkIOQ+PX006UxuEOlAqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431377; c=relaxed/simple;
	bh=TpjG8KBXL/ETwfRcMIxT4R3UQ2qbf18XqfUNh6z06Eg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PeJU/q31WvYS/fxqFM5VMAPQ9imqm+hbdU0ms4zJ0Q+dqRYeHq4otaHAxsIofUR/WzJ9J2X8NWoo2o+3kzVxPaUR+WjUIDdjicGDZmpWiADi7WbZF8HjBGwIujFa6ZqWDZ7eTKfSSi3LjU0K0SI+MZkVUawhXSjvLhfTUNXOMcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GZTB9GyL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BtTOcZr8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GZTB9GyL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BtTOcZr8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8fcs3606110
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 13:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=74nHb71VF2iGnRp45BZ+d3
	QgW57Sz5Tbh032OKc9l4c=; b=GZTB9GyLvty6RDtGJE3rx8h1FPvEY3SbH/DPw+
	xnb2axe1iaoqZUT0k0OEeu7xIU1FZnxOqAKwKwHK9z45SN5WgATq4vjPWA/2e2eG
	0R11ZBOvhKCnyclyOePE6y+/4j0ANQ9iLSf1wXi2Jde84tgsTxMaIYlHLetQdQiE
	YWOGMQDGdcrVPWMjXt7WmsF+ALtoxaLGEwCdZr+v5uBV5XL+11In2984CaocvhqT
	yJUHxOQzp22K8MukOKHyqnkvYvVNXzuskKl7mpmJ5fNH27bBR1Xcdf51jYKSpc1A
	TxDQKIC3QCFg6fFB/h+5zjsczqavSjaF870P9ZuZyDAyP/3Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8j7f6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 13:36:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfe3fa93bso55088021cf.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 06:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783431374; x=1784036174; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=74nHb71VF2iGnRp45BZ+d3QgW57Sz5Tbh032OKc9l4c=;
        b=BtTOcZr8Udn1Tf4OHjiV4vx4wkUqxuXHP4VQ8HXXOI4B4QPIK+06nUq8HvKom+Tg8o
         LQ1gR1m7Qp9zRFWywLo3LPESvuH3dp/adxp0VYP39/QJeJwkxK5gk5jhUlEw2Vk+oYVZ
         bAOkVVjnEw9tAGA8D4FLWTbYbYALOH65RUBnaEXl1nmz+OhTkZEF1OBOtJCQ0PiVpAHU
         qZQavtGMEa2tJ8v502d2stgr79vwUPxmS9sE2K40NkM05+ErCy5RynpaYyQ1ez5sQjJR
         Y7cw9c4HrDnAMSqk8+h3lxGEbTPpbq9mtsor4QWotpD9DwA5EdBXONnyjMgrnFyMlrg0
         u+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431374; x=1784036174;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74nHb71VF2iGnRp45BZ+d3QgW57Sz5Tbh032OKc9l4c=;
        b=DUnk8a4ntasErHyABWyO+WcfilWf3Fa0NvcMJVwGe8zo5oBnvdgi7RB70koOjyrgno
         8MS4U+NgPlRi8Vom8C5I9N46oYeQWo6okZzrhUhtYHOv74WFrl9PyCUOBE3iLawr/F20
         M2nf8u7XEEgflpdDbPJbjzkgHyG6GOx9wOSfnL6Hypjx7jsdQuNMrjeiVd+Zhn8nGygW
         FnzMSOr1EisswHGCWRO/sKDuARIeYqNw/cXO8LcjJDlIdwwZogNQtds615wjVNu7+ARD
         QRGkcvKr7xmh0Qi1Tb2QuHjlOrcvsZ6984vtqOsMCfQoxl18MgMT6ZWk+COWdMRq2D8t
         llXg==
X-Forwarded-Encrypted: i=1; AHgh+RoNDeJRueyLrsGhXSMxccxIfZcopdHsqXE1cMdk36RAcN3iCUr6VZX0qEoCOBxY8NsAx62WqT8Lps99@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+T/IS9+uhnCZAZ1QWVqM7jJyB3fGMjQfi7W79IWvuOQcmLl3W
	/rXBpAZOkYoo+ANZHOcmRPW8qq1xKTjRTj+TqVipyi8NQo2tt5JFHZA6YagS2L756dLxp8igzv4
	/xxWiovOo9XbjNbLR8zumom8DjexNpYCg18fTaxr5TnKpLRceagzjKJ192UrIoCqWRiXPIic5
X-Gm-Gg: AfdE7cmZizkoCcVX8UaZZ/iHLpyQZgVv1KHHdBHmtbGyPyiOLLp8t9NW55g6c/M8paP
	8COFatR5txx16zPLX1DshA9+ybOJeX1SwXuJPnqmA71KQJ+eKrYZMA8j87PHKMe9+6c+emchAWg
	XCvQYl8uUiJBlmx51ptfPq9/uQfur+ugo4FVkhTSRfzKEKIRYLgA9MOgnxzPOcM5Q+l/Zd06k5l
	z7VREPY9Z+w8R9gUWszLOfbMk5wnnXLEm6kD9yISNRyAgNMPdHOkQv/pPbm90SkwySwSHITns4o
	oPhCPtZhbruh3Q6hKhQ+8mvnt+d0vCMadMoUghAt+jFhmuX6QnCKeBARxgCLHslEfBYxDRv739H
	WpXQXSxbQc5A8WzYA9lxvIIGpyO7QUV2Yhu8=
X-Received: by 2002:ac8:580a:0:b0:51c:14f5:8f9c with SMTP id d75a77b69052e-51c747be19dmr57076051cf.27.1783431374011;
        Tue, 07 Jul 2026 06:36:14 -0700 (PDT)
X-Received: by 2002:ac8:580a:0:b0:51c:14f5:8f9c with SMTP id d75a77b69052e-51c747be19dmr57075691cf.27.1783431373546;
        Tue, 07 Jul 2026 06:36:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b0cesm34258187f8f.22.2026.07.07.06.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 06:36:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/4] dt-bindings: arm: qcom-soc: Improve validation of
 expected SoC naming
Date: Tue, 07 Jul 2026 15:35:58 +0200
Message-Id: <20260707-dt-bindings-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0K6dkhbAVNX3sOwKO0ANdJKB4iGc
 HcLXsDNJG/y8v7KCKNDYtdsZREXRy74BPKUMdNr3yE4m5hJLiteCgV2gsZ563xHMJowAAUDXg/
 pAUWrLhZNWYizYqnwiti691G/1z+muXmgmfbkbvSOphA/x/widu+/pUUAB85LK5WVldB4C0T5O
 OtnEoc8HVZv2/YF4+qlPN8AAAA=
X-Change-ID: 20260519-dt-bindings-qcom-soc-naming-4f97dec54139
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1537;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TpjG8KBXL/ETwfRcMIxT4R3UQ2qbf18XqfUNh6z06Eg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqTQDEV0YwrlDwQCNGrvVuuYXdBFug+wcWutk/8
 jgETanCVg2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCak0AxAAKCRDBN2bmhouD
 116BD/40yQkohCmeAv7WFXDDCmpRoGFDjRGCRMOINOYYQWWZjCfkaFXn75R7OaLYG9UOXoZWL1q
 had4ErlrIaRmXT97WWnd9apoRrREHTq3POuFV1wwLIt8OOucoj4wNDjO71Kdqc9ZDyF/Tkdzdub
 PZVwFMVPexNASEALr+ZHIwqwBz0aDBk4uE2xREsydIfzC93qMfOTpBWFWBe2BVvOx0xegQbpSaT
 xko/h2AC3w+rNg3LC+rPDtJBrPFd8bksarzMt1Rt9FpMcbyvQj/ebiYKLKJFmR45OvA99J2DgUJ
 RX9GxnuZwESKRtRtSuUw5nAFKMTtqW+Ct0H6nD0YTyfMgg0AD9FNuhplr+N1BqmQs0IbFcBxqkR
 XWLRkMCGWnyKWTXHcDO3D0P7l3r2F+BFKnJgTIXbEIjt7aioIeHxvqjXc+raFfWVPfznmqjFVAa
 E41Hzly7RfP0v0q1BejkfxIggsu/LQG8CW4XoTXGX1bmHMIL4nZ2wlzeLw9d9ZZTCqTGLxT6Zmx
 PUhTyisXKYHgOYGOeiesInI5lvhFJH5fTCH7NOCRC1uadJS3QZ9BA+d8tHCPeEYMfF6gVysAgzp
 am98vA+5IADH2xSVpkmwGnS7H/0PkF/gdjAhv7IaoYf3n+SJtL5CyrQg4q98DFc/NE2TrtiOT2m
 bA98kIUcuYuMDFg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX1Y6YTsLQR+gO
 C+aK3+94J56N9lUbLKeA6VcjFKIRYvNksgLY+I8cLXx+BWWTuyLRlLaK4xC+xCUdiwpS4PCdPxa
 fAnsN5Fd66TOUsHXoMCVaVaav1mDohswGZJL1z7r4Vk9mCAckPNrFfilAaGZUvoSaRdq/sVtc1s
 TkWE4p3POjoz7dMRgBX6FAjnkMNPu1CUfFavCrfF43Cyu66QFgg7ZSWyHgzXRN1celjo2O2z7zY
 jjlJd9kIXTeKt2NMQ6dx6chM6YTPFCuUFYXqhunqHjkumJvuvfLatlLQFAmaTkyE0saLYaTLQiH
 rkuscKoytcMmvmYi09VfI4Emsr1q19ar+1eANkWN58e2Bb1wLiVz3kuNyzorpun1Q6QSgXAsnA2
 0zUG69Xu/HjxXL+P6EewAU5mjzxnVVlVaUfz9CL6x0Z4KqsGYJ1j4VTl0uSqKiVUuvLzYI2b+Wz
 bJCAdLf4bz8nfH6M4bA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfXw+F7Kd8A3pdW
 gZuako0v0HOLyGM1kHiNNhRdJZ52YBVxyB5pnX9+XyTV2Wrx6ykbeA6jKWvqoyuB7f14tM+GywE
 nGraiQmMpexspCFk2jD9wdnVB7clOPg=
X-Proofpoint-GUID: 86il2M9h3xjenXuAm_R9BhqMkitbWdoH
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4d00cf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=pnvqO8KSa4PCI4MgiNQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 86il2M9h3xjenXuAm_R9BhqMkitbWdoH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070132

Changes in v2:
- New patch #4 for WSA speakers
- Add qcom,usb-hsic-phy-mdm9615, qcom,usb-hsic-phy-msm8974, qcom,hamoa-crd-ec
- Add SoC codenames used: maili and nord
- Link to v1: https://patch.msgid.link/20260519-dt-bindings-qcom-soc-naming-v1-0-005d29d261ae@oss.qualcomm.com

The schema checking for expected naming patterns for SoC IP block nodes
was really incomplete and was checking only nodes with single
compatible.  Improve that because questions about expected compatibles
still appear, e.g. we have
Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml with:

- qcom,pcie-x1e80100 (expected old legacy style)
- qcom,glymur-pcie (change to new style, ok fine, let's switch to new
  style... but...)

I am afraid that a new SoC will revert that back to old style, e.g.:
qcom,pcie-whatever-new-soc

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      dt-bindings: arm: qcom-soc: Include Eliza, Kaanapali and others in SoC names
      dt-bindings: arm: qcom-soc: Document more of existing legacy style compatibles
      dt-bindings: arm: qcom-soc: Validate nodes with fallbacks
      dt-bindings: arm: qcom-soc: Allow WSA88xx speaker compatible

 .../devicetree/bindings/arm/qcom-soc.yaml          | 183 +++++++++++++++++----
 1 file changed, 147 insertions(+), 36 deletions(-)
---
base-commit: 5b1fee48f42ff6563e3512c6ec661bd6685e4e10
change-id: 20260519-dt-bindings-qcom-soc-naming-4f97dec54139

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

