Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247B9360EDB
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778592354; cv=none; b=K1ruEtFAQ7NhmYs5IbtBZjnQbnZotLoKo6YyL+JKABe8C1pEhC7fn91bLkpKwTT0RDZSBBmdrVwozO5HmedJuwz57HSiNXA8fQK1OJ3tfA/p201Bbg4YAmxaF6wJASMC/MvJyIYFoiPffIs8KW5LE1ucifQ98CMDxr7X7/dip+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778592354; c=relaxed/simple;
	bh=dAUT6urYpcci7+seRnPuuK6X6/yN+Qxdu2FzYuJP7Hg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kdqy59qW3O9Ftl9WMXCPsK+vO53NydUNcq50BTEA9OTeKQZqzE3Lz6iDyGH1aKhUdO9S6wlKGWOAmLP1ZxY6TkxXhh4/sjnJrEBpY8tsMfaL/BQThN5gJn8pyUcSnRYcf2GnDoS+7NOCKm89tEW0/t3kWKv7g1TIbj7mA6cZ9D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YcZOhgCD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bXMOsNO9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YcZOhgCD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bXMOsNO9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CBcjR2075221
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lMr3Au4g9Ol6K3jiliyVVM
	tkLtrNvcrj6O2G0UGOHms=; b=YcZOhgCDiWBS6xmV3kVm2KKAveDmLO/4b12J07
	hCfy8JEijGdANMUZOKd8K2JVqcYOlxOytZlO4/oilpPD4Y6/ZSJabHGu+NR2regW
	gzZoNBIwJCRrLdoFNcr/gpcbMm2SLtXDJyZlM+Q1+BJU9+rtdx/bhDW4+L5h19pz
	74yffHvL2ImViMiB5HSHCFprKGNg5j7NfF/T9g2AZXCc+MfiM9KACQQ8t1nY5tEb
	TmBjzIEAsU9V8L00tpnrfMbEZfd5yUZf/TzfxHxMFNGyYVxdbMQPTTetBN72XXl3
	h+iVn5RKhoq3B46puALfCLwxLdUftJ1FjO/PZc/ZrXU/BrgQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43gygf5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:25:52 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7c0de780bb5so54373407b3.1
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 06:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778592351; x=1779197151; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lMr3Au4g9Ol6K3jiliyVVMtkLtrNvcrj6O2G0UGOHms=;
        b=bXMOsNO9a/dR3Mffpf86x29pBBbZb1BWzoLAAEv9sR7zliYEzPRO+VGtADCWztts+p
         IL0+RAKrVKTb1BuMTBhWUWmCcAoenE+pwL4g8xpdL3T87hywcUXsEARAYolFbiYWgdrj
         kGibgQLUkRcfFQwhvdSznJJDnaD6EBejEd0jrKQNcit+/RROPCdXJq8cvbG3nX4y+Lto
         tLhAVT5Vpw44L5ztOz9B7uBRkQTIB7UIVMKLCpuUC4oIO4Cu0PoB3WIUYTUuUU0EoEUA
         7VVowUBAowHC+dP3sUPvzWprMD963fcxRcbYdEa7W+Rta451RMdFEgIAv8zxM71LFqXm
         QpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778592351; x=1779197151;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMr3Au4g9Ol6K3jiliyVVMtkLtrNvcrj6O2G0UGOHms=;
        b=V8nLe1YxmKazAYQ9fJzpXpblVFOJlWIJ/IZZ7ABXkqn/YVflE7BYWF5Q8LC/Ke6J4B
         f27tY/nXR/xPpnA+gXPxYZWAYu/ZGWoEsJML1Zv+VHc50GvvvSIdubPZgOPPlFvtKRPM
         X2HIaAueSbyDVAMetp5cuzWJqqdP0WUsj6lF5qJITeboZwMpJcJ4WDm6GEoMox35/nEk
         AkHqv954HYkN/HHanFzaImOsw0Gl/5z2pz0m5c6PpjpXUfnHSNcC9nIWN2Ca6poljRNX
         E+S0Tg9lufemI7nbvLU900DbXm7LZyMTsSkDC65SB77vqyzvBEPGur5F5ejE/GWJ3o3K
         yftA==
X-Forwarded-Encrypted: i=1; AFNElJ9nGj/hqDJd7IosTzRnyxddEYo3ZlBNomBMpQbi1Wed10p/UyemH3OSsorE1YAiLl30DewOtJlsWaQP@vger.kernel.org
X-Gm-Message-State: AOJu0YwYPhc5mjeZ8z8BFqjJUMo0ktGj2mS4hqZ10j6Bu0Ej/rLlzTqJ
	EC/eRVVxRnmFCMAffvn5568PmU4k8T65+s0xc8kuqBZhoWcq62gkzD/Wf2z/f6I+v4l8JJ8ja2Q
	2YGHyhpZlzAms8zploa1zv7N7qlW5fummYsWRWwEtOOQ+KS/V1lDbgnV9mdG8NhEV
X-Gm-Gg: Acq92OGal/Bi47HXoL7Xm6KFr3kf3Kn847L3f2Had26qWfo9GZzajBiOHJoenzI86Or
	8pYJuymKjAVrygdpKRQM3VRtF5hTDIMv0ia4yR0a0YPfUmZKUaxkajeIH6dM9qGfW9fv7S/dkq6
	Q9A88gEiCuE5y1I5YFtqWV7LlmC4xaidMLvRqCAmP/u1H6gWiuPRL45NqeWPRIK6VDzgk4CtP3c
	ijt4pJg6gYxphc2tYCqqlc3yicWiuKeGa6tr1nUPWtkWMLLCxtaXIBKPJiyflroRP9pihwQW9Ab
	DrBZRX8d/jFiqbXy+SpVfQoDc28+w9rK0v+WxqVko+eMjjp1TawXldyuAcjgRuBJDCGcJcrVbli
	/hfATfRpURXETb6xQsncog7HPT/xI3hEq4aIU
X-Received: by 2002:a05:690c:6d84:b0:7bf:3b0:27d5 with SMTP id 00721157ae682-7bf03b03627mr269366647b3.47.1778592350871;
        Tue, 12 May 2026 06:25:50 -0700 (PDT)
X-Received: by 2002:a05:690c:6d84:b0:7bf:3b0:27d5 with SMTP id 00721157ae682-7bf03b03627mr269366267b3.47.1778592350409;
        Tue, 12 May 2026 06:25:50 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd66861afesm164595757b3.37.2026.05.12.06.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:25:49 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v4 0/2] pinctrl: qcom: Add support for Qualcomm Shikra SoC
Date: Tue, 12 May 2026 18:55:42 +0530
Message-Id: <20260512-shikra-pinctrl-v4-0-b93c3a2e4c08@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFYqA2oC/3XPTW7DIBAF4KtYrEvEnw32KveouhhgqFETOwHHa
 hX57sVOq1RKs0F6SPPNvCvJmCJm0lVXknCOOY5DCeqlIq6H4R1p9CUTwUTDlGhp7uNHAnqKg5v
 SgQavOdgGnW8CKUOnhCF+buDr2y0nPF+KO90+72xX/aDmF82ji56C0IDSOKtRdjNfVQsZqRuPx
 zh1lWw1U4GxoJUGC5KrQrRGM1sHb8AJyaAFCGTd38c8jelr61es9YBnVWZOGeVWWSusBOOb/Zj
 z7nyBw7p5V55NnMVdqZl6UMSqKGy9c8I3pn6iyL+KeVBkUbTmpZvzTnH+j7IsyzetGTwTvwEAA
 A==
X-Change-ID: 20260429-shikra-pinctrl-fd71ab6ecd6f
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778592345; l=1860;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=dAUT6urYpcci7+seRnPuuK6X6/yN+Qxdu2FzYuJP7Hg=;
 b=lwNmKw1UkDXYNRZDZd15AAJPE5rNQldpF+B5wS5fwyWqxTDlc8Wn1+4c53ez/uQqIh7QzVA35
 9IZPGzivPSPDuHJO5wkWo6jh2UcdyxuBjny+aRGZ9M6aZCKlTu9zqkT
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=fMAJG5ae c=1 sm=1 tr=0 ts=6a032a60 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F7K3iWs-JhacpI5SHW8A:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: bkN2MQhZKh83qXObpgAmjWC0AEg86xV6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE0MCBTYWx0ZWRfXxfDCyZjeivVm
 /kI+51iUIINZKCKHYpvJeQfF53GK5tSFGvCWyn0NJhgHFe6oQMEB6sQ0+NS3jrdSFaYPXsRKcFx
 38mPu1GeXliIdricnBTObXxE8m0LTFXo+EvjwzG8ZS+iKqJ/8vMcS7xydii4/uY6EeRIqb+8G7L
 bOtHMW1IWksdC/rF8lRyugkwmy4kVTSG6qb1FwthURks82uPV8249iXTEfAZlottKEk/havUDJl
 bAwQku1C41RnnTITShOBUybynGn7JZ287+hyGG4hLxpnIeIuVxcyD4PP88rsXpotm0Kx+vWXGYN
 ddw+ZLQhPbUwm5ro+umrn2HerM1jzchEzCHiEIWeimPZDHONrEPpYyfGUTN7LXk1zkWxh08BSyk
 8npROi86kKJNSRCCp2nJj88QeEJW397OVXbRUvpIux0wl+wuE80KUJOPuKzTMGFiBu0RGmscVXG
 u2QMAi5XlsXDBycg3bQ==
X-Proofpoint-GUID: bkN2MQhZKh83qXObpgAmjWC0AEg86xV6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120140

Add the pinctrl driver, document the bindings and enable the
driver in defconfig as default.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Changes in v4:
- Remove eGPIO fields not supported on Shikra: drop .egpio_func, .egpio_enable
  and .egpio_present from the PINGROUP macro and shikra_tlmm (sashiko-bot)
- Link to v3: https://lore.kernel.org/r/20260508-shikra-pinctrl-v3-0-771144cdc411@oss.qualcomm.com

Changes in v3:
- Move MODULE_DEVICE_TABLE(of, shikra_tlmm_of_match) immediately after
  the of_device_id table definition (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20260504-shikra-pinctrl-v2-0-14e9dcc2d685@oss.qualcomm.com

Changes in v2:
- Fix Kconfig description to drop "Technologies Inc" (Linus Walleij)
- Remove unused UFS_RESET macro (Maulik Shah)
- Add spaces inside braces in shikra_mpm_map (Maulik Shah)
- Fix gpio-line-names maxItems: 165 -> 166 (Krzysztof Kozlowski)
- Link to v1: https://lore.kernel.org/r/20260429-shikra-pinctrl-v1-0-1b4bb2b3a8d6@oss.qualcomm.com

---
Komal Bajaj (2):
      dt-bindings: pinctrl: qcom: Document Shikra Top Level Mode Multiplexer
      pinctrl: qcom: Add Shikra pinctrl driver

 .../bindings/pinctrl/qcom,shikra-tlmm.yaml         |  123 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   11 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-shikra.c              | 1253 ++++++++++++++++++++
 4 files changed, 1388 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260429-shikra-pinctrl-fd71ab6ecd6f
prerequisite-change-id: 20260428-shikra-socid-a27ae38cb7e3:v1
prerequisite-patch-id: 843f28095c0d42d0d60ab7000095c64dcb2e90ca
prerequisite-patch-id: 1069d6880c3ff91c230c20fcd876738001c6d35d

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

