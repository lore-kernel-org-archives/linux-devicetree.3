Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F9F3FCB11
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 13:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777468329; cv=none; b=YqudBicAc2Tf4YILJU/mAfSIg8QKy0UpZvv4mwat8AT5OGRc0+qL8xljyPxQWnbFXxhjggYbXFsuW0qQ4FU2Px3EJkTvsAtX0j1BUKAoEDB7pwXzoYUXTKyJMpPLO5VW2f238/mnw5VoMKXE5Os8MRQ9uh13rQ6TsBCxzIUDKts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777468329; c=relaxed/simple;
	bh=sQlnEyALeWoqRjlSzoDym4TcWUqFIQse80DmfyA5AD8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iYFaaUGrJlKhcvQau79YKCQ0DEFwrT3prHBRUYbvMPnBKeDhV77ksUT0NRZaovi+nQsKjlROxWDWEcNoYcQ/tlO2SnG3IZvffhMnA54sUM6fU6cfszpklQJrRb9GU5EHElgbfmYX2x9NmQ2BN1wc0gclG0+rF2itNrHVvvkFU+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DYbvHdIJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ei0n/wAF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DYbvHdIJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ei0n/wAF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qVVK2889726
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 13:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5tcVTdVxFKWbPOvQ327MhX
	Y5HFY4B6nwROt9RjHUiXU=; b=DYbvHdIJcGqExfaDDBYQUX7jX+Vir7hdxBd5p7
	7/pKhw2zw5n0m07CDrDmI6b0rwqlM42pJW8VWTW44DKp7cHsX5CG9VuITpw4PUqj
	nR821edgiZD+ERbiBdn+bA2KT74o1P2MHK4s/ryvtNUb++ONTOriqfpyYLUDeswO
	GWAzELzslsnAK6JcdOv1L7smgGX0Bi+JBb+0Y/t7pCWzJPSudQmaXHtkm+p6avCx
	OUxligeTEwh7hQrAd122QYz35Vxlh90yA4nzOacjCh7rKzpQiM0Gjv1rtfRCYwdm
	6fYtCxWuBoCDNhUwHAkxv7EGQlL+fKzj9BJQoTTAgbGzEdow==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0wqc0up-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 13:12:07 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7977177675so6559032a12.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 06:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777468327; x=1778073127; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5tcVTdVxFKWbPOvQ327MhXY5HFY4B6nwROt9RjHUiXU=;
        b=ei0n/wAFqVFlFXKZJQ2NXcWSxBKbLa2IXzZG07og+f1MqyX9AWkP+ptrt2TYf8bzGd
         MRQRl5N146VKOJjnn/ZJ7KnvMbjy6KNiWKwKEN95kFbv0LcAxfsRWXFQmrP8Fo44ckFm
         gIniL7h4jTsPmM5ICmBL26HzWq1MEDuVliKu0qR/UqjrcB2nNgXSQHtGZFCj9mhnRCBe
         bvrHKWh09DbbmonzgDQKJbI1zLuHULMzAl2x2Mz7509yOmK7vcReZ15ZAAayxDq8baRI
         6xylOdWVtNR/JQO3f9mzSi+rKowYQ3ujX9IjHvfSToN/hka0TamhOCY5Z1txeMHlafZk
         hEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468327; x=1778073127;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tcVTdVxFKWbPOvQ327MhXY5HFY4B6nwROt9RjHUiXU=;
        b=fUFEDFdwAGybuWVgt++aJ+r95dQ5nVnYAG5RLxUQWLzWH9X09C1kxJ9fs2YPu2hwLb
         JufyY4Nqfb66kPEBUx09gkAs4U6EnA73qpOXOOYLNmw/uDQmzIkes96tF5eE6VR9YUD2
         QKpy3Zv8s6D9QlXwPPikE3cQhk+d57wFfnf4+ZQp5WjloM4+WdY4tozPaqOa716esEWQ
         fKmC7+Vx66TtbY1fIALIfNwaQjTGuWlaafBjbuIiizFui1fHMcG1lhk14kuayUhVKish
         woK1HJ3B9GTSxc96+89QT499H4rQl9e35fL1pvbsc8LueZzmEJZrr/lyQK7a0X73YYma
         3JiA==
X-Forwarded-Encrypted: i=1; AFNElJ+9r4KWTMShPpPuYHxwplqWcAunzj6AaoatQNTGB74xqO0xmKIpp9bR2GtoMTSvHmvGIqR+vMGQTwYE@vger.kernel.org
X-Gm-Message-State: AOJu0YzIw4U/CWa4N30ws7Ap3PKsKXDe768mJF/YJ4pKPhxwDr9MeWkv
	xXj3wjfwiDb160tByQPuvFTmVOxyO93a1hY467jvChSkAfn49NiwWzNwGOayCNNA9sku5cM/BbX
	6NsB3Lr9HZDLXGVrEgjGlhFf83yj8/kd7RqTRfsEESHXuI1Qcv9FaJfPY9wwAT6YNMLaoK58t
X-Gm-Gg: AeBDieuU15MaMjoHwnP6807MRK+rEP8pZe6w+rMm9MuzATaUZGxEKIqLm+ermDFIW5q
	xD1ks2kJCS+ytjtfubuJJ4Yji7FRSXqa6SxptKxoYBRqE30+YXqj0KkoKpX1fEDsN0bKr9byj/3
	zlUHQ44h4Tn5B8U+8a+rvloIuzUgFTMUX+YnwypQ6aDy62JG9xWkuHQ/8vh0jMLucTJnHwE+uNZ
	tok0AYH2xNM1HlAty2XD+AXaX1p5z/bTzqK5yvjiUM/NhHshwMMjftXuJ0RCw9+8hCQilfLbBAH
	aKwSK/GEwuWKtr9/YclLKaOxXcxd+Z+ePwzkKbepRPZ/LQYFlmWwsDa6H0TLUAQkOuqQ75+7wHO
	zmOrcg4oIUCqKJrpOVhuG6ndEqm6PRfhkYVLdE+vZBcmcLP8=
X-Received: by 2002:a05:6a00:b610:b0:82c:7356:f45e with SMTP id d2e1a72fcca58-834ddbefc57mr7895796b3a.31.1777468326522;
        Wed, 29 Apr 2026 06:12:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:b610:b0:82c:7356:f45e with SMTP id d2e1a72fcca58-834ddbefc57mr7895749b3a.31.1777468326058;
        Wed, 29 Apr 2026 06:12:06 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed6decf3sm2063025b3a.31.2026.04.29.06.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:12:05 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH 0/2] pinctrl: qcom: Add support for Qualcomm Shikra SoC
Date: Wed, 29 Apr 2026 18:41:55 +0530
Message-Id: <20260429-shikra-pinctrl-v1-0-1b4bb2b3a8d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJsD8mkC/0XM0Q6CIBTG8VdxXMeGQKK+SvPiAIc8q9TAXJvz3
 aOsdfn/tu+3soSRMLG2WFnEhRKNQ47yUDDXw3BGTj43k0JWQsuGp54uEfhEg5vjlQdvSrAVOl8
 Flk9TxEDPD3jq9o54f2R33sc/2xZftP6haXTkOUgDqGpnDap2Kd+qhYTcjbcbzW2hGiN0ECIYb
 cCCKnUmmtoIewy+BieVgAYgsG7bXjk/B/HgAAAA
X-Change-ID: 20260429-shikra-pinctrl-fd71ab6ecd6f
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777468321; l=981;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=sQlnEyALeWoqRjlSzoDym4TcWUqFIQse80DmfyA5AD8=;
 b=7suvmGo10znQ7hExo1MntSioSaikQqdZrIl8e00sFPl7ZeISuX5I8CZDGfMcHFtqL7p7E2xYc
 QQJdMSBePMuACWmZgCYMwlMcwyySOCTPJjyARq+m2RVKH6RsNa5tjcw
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: FuQcwBbPPNbXN9odHSr0dYJ6RkBVgPKm
X-Proofpoint-ORIG-GUID: FuQcwBbPPNbXN9odHSr0dYJ6RkBVgPKm
X-Authority-Analysis: v=2.4 cv=BfDoFLt2 c=1 sm=1 tr=0 ts=69f203a7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RKqVp3ilHWDC27yp5dYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzNCBTYWx0ZWRfX7RMEUJDuH/4s
 RUVIDds0oKxZrGtCaEuBOxjHGFNbUv9uoP8NJSGenGnrKpLx89Kpq/3APfPYKQnL2cZJEH0Pmlz
 262P4yPTA2E7vFRASWjnth8PnxUEQpD6/KT6YCrbIWc82s6DWg87blN8IKcxmaoU0ym4L24un/Z
 jxNhRIDz6S40KNsqsWtxtuwUv++QxSv7BWNTcMt9HcvLbtPCVVvPgq5izTSdHzBEA5ikbv+48tk
 FuLO5hHGmGsP26DiXEO6XzoaXNDmZ5OA8eOmx1CCTztdtkUZCZreP6XDTIUlTbRfgZk6dAbMpbs
 q2qllFfarA0K2UKGU96gqCPBjc1tWWWAOZtqLz2VkMa343uaAPDcFRcHXQTVkeo6ct2VKT3Qc6v
 CEleT/geDXWCoujVxcS93rda+PoRFW2GNe7nZUKLhqasIxJ9ANR8CtUgTei7niStWmbfRO4eUvh
 MNEUJfyyFfvCvr0KDrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290134

Add the pinctrl driver, document the bindings and enable the
driver in defconfig as default.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Komal Bajaj (2):
      dt-bindings: pinctrl: qcom: Document Shikra Top Level Mode Multiplexer
      pinctrl: qcom: Add Shikra pinctrl driver

 .../bindings/pinctrl/qcom,shikra-tlmm.yaml         |  123 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   11 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-shikra.c              | 1280 ++++++++++++++++++++
 4 files changed, 1415 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260429-shikra-pinctrl-fd71ab6ecd6f
prerequisite-change-id: 20260428-shikra-socid-a27ae38cb7e3:v1
prerequisite-patch-id: 843f28095c0d42d0d60ab7000095c64dcb2e90ca
prerequisite-patch-id: 1069d6880c3ff91c230c20fcd876738001c6d35d

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

