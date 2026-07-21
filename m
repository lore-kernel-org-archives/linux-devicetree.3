Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBB83806D9
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784633741; cv=none; b=HDEfR+yZzBV/ABwHLukBzKmqoawCiBUeGV+WoQPxsxyFkhTUk7it5HeGF9dG96O0D3t59L7bMXRbiC2a4QZbtINeNXzy/zhZ0EjRglki8G/JOESmygXMZYh0xwDq0beiLd40ResFqZTJF3346S3+AwhRMo+bUyM3EMwoJu0SIyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784633741; c=relaxed/simple;
	bh=kYCw7kFj1Ar/UWyK7td5eGwp0BpfpVW8O/ifsQNLcUc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IyUvmOBiNxdI52CmJkjif4cOFadrZLvIGYfYT8LVLve9jHtrdnMcZeqJV/UzgtjpgYnm8+WgWgmnjt97whCA9XNtumDOsMjipxTcOSiAxrVI4kRsgudhkB1Cnelx7+8mST8Ce7nRHfQi2tbKhj5Jr7QFIAKEkhJWbo/t2W8ooqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N7BW3Hp6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i9VKRJPF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N7BW3Hp6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i9VKRJPF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LAQq7T1611735
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jRsxccGB4f3YCeySZ5zozK
	e+JJroaGspCDGGcBVYVdw=; b=N7BW3Hp66FiZCskxbZ//r3v8tyOKNznm0aYQ/R
	VbFb4X/Po0ayXjZtaE6x+a/8K2y1rxn8PIVcIRh/SruSM3mQw6wPuyrvlj6GYTPn
	8CCUoFA9eLGfG/yXMqdfRm6ksKqRhL/Jo79BnmF/sAhUpNwEHyur5NaUXO+QdpZ7
	/fEXLeQ3qiZUaAw64mRxxR1odL0EHvQCA2ijwe8NAkayF1oG2oRWVvC+9MZM8iYd
	XYnutqcHXJj6mMNTmjLFZIIyoCVSfe2EEkb4lQv+ph3DIrka6C0FNKRu1/SI6D5P
	jsbqZBEBDhRLfG8bVi5r7KngYeebygJapO+DsB+0+MEkh7hw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6r3gca9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:35:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bff5c7035so120432961cf.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784633738; x=1785238538; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jRsxccGB4f3YCeySZ5zozKe+JJroaGspCDGGcBVYVdw=;
        b=i9VKRJPFyWrLWNIoR7h52bNDDxgwq6T3xO6pwQjT6UUAYqHL+lFeOtdZglmMKQwLIh
         0AnUKW/WEtWI3LmGk0UWa2BLUARSd3cFDe2KSjo/LhTazPTyggtvgjxXcIzteS9+7X+P
         NlSMJBshjlan4wIPstjGc9wEdwWw5NrH3CnW8EqIYXhHYEYJvOG36VVrhYztbB78HkCl
         UOK4YxsxanahYkcR+yd5yGXparUq/V0nPUl4yI9ouPJ4Usj5fTEGd2FfvIu3Qu1EOcUB
         5ARD5qOfhX326RSj6zDQN+gIqU4R4DXioTMrOhWcmbV2niNHK9NE0SrTdM0r1Qk/1oET
         WFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784633738; x=1785238538;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jRsxccGB4f3YCeySZ5zozKe+JJroaGspCDGGcBVYVdw=;
        b=ca1uArOC56K4gt/7e7+vmmkOb+nycGmSnSascw6XP9fDlz0dFGtJrzbnZGkQ6N/i9b
         6eMfJvQGmAd08izqTXltNY6B8H+8RnrkuftHf1Fu3Pulbz/zeTT3Xd58NpieZ7n0ip3q
         fdQM4IwH+9442IS/nvxfwIWS4NWCQV4QmiINvWQ7zWru5hWVMJBUax+cIztkWHiPe2ay
         1xZTpdchrD/00WyXpTyCZB7ukGBozSrmfpG0KiEh5Wttm0E0rBiPj3O3TMTqWZA/IJlF
         OpXC68fy8zar1q8oByo2ZMrDlT9iZT+KKjVnKAI83AWYUluFVoeTn8SppocrmtXNeBT/
         Z/Hg==
X-Forwarded-Encrypted: i=1; AHgh+RoYLXqAi9NkMUPXoGDHGBGE8zKjiTh5taFnquzygQpOs/lsyl58gFJBE4IVwyg6MJDMrJbJ0ZR6+cWM@vger.kernel.org
X-Gm-Message-State: AOJu0YwROz8emEV3fHtLg9novOqGyQYviKu212t1Xnvg0oPjV3LsN3Ny
	wy1bf/I7ePqGZvJhsg+OevbhcNOIwCjAyu95aaDpOwEl9miZdh1mKrsLOuQQo1Wed/jrbBzXpPa
	Ei7KzPwhnk+AArirSMczxXgcrfwN8eehkemzaxfDF4MaKk9sF7lAKshilUT6eo0th
X-Gm-Gg: AfdE7clUQzt7g0wghqrlc6/2so/Zg9F8+4HvKQGoM/w3KBxExzAh0K9MYdtkoexDZr/
	eTil3jqEOpc4bWq03oXMRwoTtk45/qlWZ+82xANCdBLnCu+OCpmEClkFLDnxZEos5EklrSS7wjT
	aDX8z1LHU2FEgblGrYfFdr1w99u9b218MZsoaTtksx4KaluYekL4wmc87b2GAaa1ZxAixC1lhFA
	N9ubkAv5t5Bc36L69x/SqZzN0M4dAnZHYlv50m8w5e1M+ZkDVLn7GWi2kEDXXj2GSQ1UxOQrLqt
	ucMKOGPvKTcC+DWFoj8L3yEotpXBaFqEY6mM0KA6reUmVAjtqqzHRaDqE4wSG8wk9V0iYqDVfed
	kj9kzKvZs
X-Received: by 2002:ac8:5844:0:b0:51c:100f:f91e with SMTP id d75a77b69052e-5213cdcd5b0mr165068391cf.72.1784633737972;
        Tue, 21 Jul 2026 04:35:37 -0700 (PDT)
X-Received: by 2002:ac8:5844:0:b0:51c:100f:f91e with SMTP id d75a77b69052e-5213cdcd5b0mr165068031cf.72.1784633737360;
        Tue, 21 Jul 2026 04:35:37 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653bfed7sm69798075e9.11.2026.07.21.04.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 04:35:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/2] dt-bindings: remoteproc: qcom,milos-pas: Fix ADSP
 bindings
Date: Tue, 21 Jul 2026 14:35:06 +0300
Message-Id: <20260721-dts-qcom-eliza-fix-adsp-binding-v1-0-3a0b03af2ec7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGpZX2oC/yWNywrCQAwAf6XkbGA3Bxf8FfGwj7RGdFs3rYil/
 96ox4FhZgXlJqxw6lZo/BKVsRr4Qwf5GuvAKMUYyNHRBfJYZsVnHh/Id/lE7OWNseiESWqROmA
 KwVM0O5EDq0yNzfkdzpc/65JunOdvFrZtB7XDLuKDAAAA
X-Change-ID: 20260721-dts-qcom-eliza-fix-adsp-binding-b7712a026b20
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=kYCw7kFj1Ar/UWyK7td5eGwp0BpfpVW8O/ifsQNLcUc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqX1mDYQA/o7XE1WO+jkEelvdyN6iq2SAcYDbdv
 wqKD3XVU2WJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCal9ZgwAKCRAbX0TJAJUV
 ViBeD/9gWRo24vvE5d0ryfEjYZ0UdIFgccFzkJ8azz6JX3vheOQUMc1VK14IcbLaRJ/rB+tG/2c
 QzLdLMqY2TGUYAFfAU5dcWqAxn7swa4n6u/spLitDauWqIuIKeYAjupKwhzfDYtWHTkHxlcE1OZ
 DnzfoybLE+pC7HUqut8n6THb/z12fZnY85xXMxD6HzhxrJAJNYHsjp2OIB3HsvobvQyUsoIOrxo
 gEzh3tIl6yRiNcgLNGqT5iHK8DAyBzw8Pfq5GpFaNMaheax6YOF28HconTJmG2f7CNTNQfNIF1H
 yesxQIRmFGHtkvInkhH9DeYUHifRzaJUEM3pN03LQ52HC5UV+uDNfG1Hf52vmBaTKKxshqXDJYw
 megzIvlkt7l5Ex9hfZvYuFwNEBPLsHXmpVHjDS0ShcU+e9mIndvJM47IrwjSHVpI+X5gWkdpYLG
 h+w89QjIPuiuoKtgxREYnhW/Tvdg7zbk+tBrKYfXyHMSS6JxVfWwqgGYUD/N4QU4GJ9RnUXpny+
 IvNaFbvYmVOCa/xb54xF0Ibli71kj4H0dd5OhkfmsSv4trG4oL3bsefRs3x73rEgyKv+MYtd3/I
 LCcFR3ueLJsoVCWrflNRnTCv4+xPdwf3iOaGCxmhbLguR3fgIiOgQzNE8OXIVNbl8n73ty6kjYr
 RoW2tVbzcXWdltA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEyMiBTYWx0ZWRfXyLW6SyLSeGJI
 qb3CkydtM2pWO+0VEH6T37vHOIsvF4m9Cq2g1Nw89SPQ47ajRvvJIPy7WCd+a5vCICMLlM5jd1T
 GQ+wqCsF8ts2W/NaklocqzepLnEolkqfTBe7woF9ATOISc5hSBGZwP/LLhEchXn3IGfS01m0FIs
 J0w21tQYdZAUqg6TS0pwrqrJ8KvHoAur5PzHQ/FaWeIPzQPN20sPL/i718u7edeUb7829cFN6ub
 kFQvFMlqikvcSp5kFFFFrfa9/4szn+f2yTp1zOoXg5heLfH2rOiD1/SU4yaJgHs9jvKrJ9TvIwy
 9FD6ThDgf0L7rcqPQzNMP20NXl9OxkNIHBN99zKSjFcW0Bbrl8YeBk/Vom4cAxzmx9+M9RcU5bQ
 k56LlxfJH5IZknZUDz1hc2aAeNaAZxXrPgu2qGZOCY1kH3VvEkScz2oweXIaZSikkPDc7UIsIdM
 pf57TgFamC1NgRlfC1w==
X-Proofpoint-ORIG-GUID: IMbYGNiYb3kpFGfz5pqQ3e70EF4vlf21
X-Proofpoint-GUID: IMbYGNiYb3kpFGfz5pqQ3e70EF4vlf21
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEyMiBTYWx0ZWRfX81hlK3+HJ9e+
 OaeLZUERhUXlz0vlsanrlbAKPKPfJECeQMcDd++luhJRImBmUEgXiYCnkH3XUAG0eEOmvBbWOhn
 q3O8oOaf0CPNPDwdwvBiK62fShViNSE=
X-Authority-Analysis: v=2.4 cv=SIRykuvH c=1 sm=1 tr=0 ts=6a5f598b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mTG7cVE9mWrA2Tac5S4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210122

It has been pointed out [1] that, since the ADSP found on Eliza is
compatible with the ones from SM8750 class, they should be documented
in the SM8550 schema.

So move the compatible from Milos schema to the SM8550 one and then add
the fallback compatible to the node in the Eliza SoC DTSI.

This will also now be in line with the SM8550 driver match data which is
tied to the Eliza ADSP compatible in the driver.

[1] https://lore.kernel.org/all/20260721-benevolent-wonderful-kakapo-ca8c2c@quoll/

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (2):
      dt-bindings: remoteproc: qcom,milos-pas: Move Eliza ADSP to SM8550 schema
      arm64: dts: qcom: eliza: Add fallback compatible for ADSP remoteproc

 Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml  | 3 ---
 Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 3 +++
 arch/arm64/boot/dts/qcom/eliza.dtsi                               | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: 3fe08b9796f36ef437ab9328e7dd1e5ff2d66603
change-id: 20260721-dts-qcom-eliza-fix-adsp-binding-b7712a026b20

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

