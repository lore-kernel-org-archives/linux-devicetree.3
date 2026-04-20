Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96034225413
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 07:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776671392; cv=none; b=GrkQ/XUiPTvkz4e/lXu3HoZZYPScTgWz86vCOvYZpgb2rrymQQCbTI8WLrRcQ+Rx0iIVe2+qetD9tlDpSipTEczrBKEuOTf9eoFIswa/eJorExAPokvqpVBHZ7BRc4P5XDaDjjJoiB26maCkLCPDxvPAimelGMfxz0VFMMZtxj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776671392; c=relaxed/simple;
	bh=qPD6IW2ggKwlm1Ylhr+PVYU318puje6bPZN0Tg3JpUg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LSkFLIu7lNoPIdI/22wz+HXWOxe9rPfQIX06ZAtr/gYQcMWdChFo1ouCMypo8RuTggXJRhXlHrV3lQM4Au0jANIzOFR3SeZJqyGIxsweyv50liMN6GkbS0cktIp21NoWtviW6ECSYMVsz6/nhFB38Y4WtB07OQUkrLbhasXTcEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fpsOZGFn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XGhrU5DN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fpsOZGFn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XGhrU5DN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K5UWeN4005463
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 07:49:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=juMOu1sYmAvJBqqpvTr4V7omJWJEUlpkuYh
	aSUL9X8w=; b=fpsOZGFnaxKdl9+H4nGiabLAiwHA0q1O9f6Eo02FdUEr4O3FBBy
	fapJ2OVdkhasT14OgBEjLGW1+qKnlfXY0oaoRlhGfoAOIUDFZa0ggCwjpih6R3Vm
	qH8vb2GG+FDdzz3xOypUGs/nZ5YCWB9gspmx25Zzn3xCZ6sGzqKiSBMGSLVKamn8
	BrY89mXlDBRETBz6hzlh70PTDqupzVOZ3vjC/hyRqny4+7Jw7i3mcv1ev+IEjBQ4
	AwADV6eUWUfiTijb7yeATD7QrEPVgmhZkyAjNuy+paFJI25sHArdxrmtr8/79AuU
	+3ZNaVtV8F1Dsiq8yjXgc5m19oTv5cGkVsA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm34hcnxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 07:49:50 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2dd1c74508cso5209642eec.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 00:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776671390; x=1777276190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=juMOu1sYmAvJBqqpvTr4V7omJWJEUlpkuYhaSUL9X8w=;
        b=XGhrU5DNt/YT/gSvkfON+VVl+5Ix8Gfc4Di+2ou38G0A84CljSxG9B+1LQAKK6ynPe
         Xw/fhywPd82uvsjCVDy66x76bDY+/rSvw/N+HxpfL38HWH1qxJIlRgIXg5PSFdr4ePhu
         QtSGkrRTakMud+Zk3l68j9nGrNQHc4zSmBYlUzJxzkTqIHr4rUOy9cQ1tCLGG5vzLLdC
         kRKbveA36MGAK3uKeSwTYdB01zUME0qMfRWia3bwaIPtpyB0ZnJlKPkwVZ/38twugD+3
         1uC+NnqyTNWIKhtbgMYS2qI3Znpn6zqEl9wQvPjbIinUKHU7q9jBZr8YiNu4nUZl1Yag
         wfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776671390; x=1777276190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juMOu1sYmAvJBqqpvTr4V7omJWJEUlpkuYhaSUL9X8w=;
        b=mqDugqUoVayLY+nVV1xBNtpUgdsqU60PoCFJODPO+LV1xRP18NbiC/eSYg71N/8rhr
         FJjwORJvT1iLwIP5nkhAIMv0s8qus7DTAaFu6DxH0jgj8tsR6JNUL/woqVzD1uTlc2zH
         kv77THpcvf1f8kJtIR11jJNnEoG526h+NAUEZaXUQ0s6KHqQlMKC+1ELZ7RGKwPQdmXY
         BxaWeOITteWFEZvXQg17961u8U98FDkbCHvPiJ73+b1RO9/dpTkhrM1Z5Wl1KtEULxp5
         dJ7PJ/kWLw7b1fFI+s+NJIMzJ+lNKPbUAoLpwMcVDvEOdOR3zmD+sOk5JQ3U7YLHtc9Y
         rKqw==
X-Forwarded-Encrypted: i=1; AFNElJ+ZbEaJN8Sr+s8f91WrR/WouDSLb6YaDQZ6FIg0mXltMgx0oCM23QICYr0j+81I+1ezy3GoKU8tRlIg@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1dN1ylsewhDvjve0E/t/ZmcVTCPf1NwPa744fpgo/zf4qyDuF
	ZQjhxV/9q4T6yTa6UkY1G64qiwKRd2LjdAn3obOlk5OdNj/11Kk9kdYGm34VeeSTpKLvyDIrpc6
	2dEMMUR28/NW8Z1kqCVmtYUso+epxXupnQ6XaG+6UyjuhberVVN1Wa8hSbLTmG+T0
X-Gm-Gg: AeBDievk30C0e8TM9QkJEMflPY55pMMe99HxUUxuCMZ80Mrh3tHi9BGD0R98EvrHKSR
	cxd7eF504iXEPyJZ7zjCH5JydISVVujMnUoxPXk9dRvzhR2M5HFGS4ONq0OD/tkbSKEpc+UM7FC
	hpLA6pQmTiNG/r0+jPFcihlaVKZu9mCNaD7IbJGet6VhfX8lr+DoP4sIcGXvy7+CCmzKsXQcrLa
	JZuUqwvM3CJP+phc2TgI9b4ibBA+M/Xtc1JzMPZWIsPwI1uiAWKXGc760wTAgz0O6eoSYQQ8sp3
	KXyfBh/bEyZIt4dJqifEyRho8YDnYMkfcHtLEWYIAr3wjV5z2jMEdmR40MdsDwJAvBFog4rCUuC
	cR4LRT8z9iFNJ9wkRrRjcExGS6B+R0hGM37qFTMIPvDcs22sAuQV9ytLDU4/zq+FBlLpBuXxu2r
	LxldQfo9sml3b5vGL8
X-Received: by 2002:a05:7300:d70d:b0:2d3:f3fc:bb6b with SMTP id 5a478bee46e88-2e4646cca96mr6994776eec.1.1776671389954;
        Mon, 20 Apr 2026 00:49:49 -0700 (PDT)
X-Received: by 2002:a05:7300:d70d:b0:2d3:f3fc:bb6b with SMTP id 5a478bee46e88-2e4646cca96mr6994753eec.1.1776671389362;
        Mon, 20 Apr 2026 00:49:49 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d8aed43sm13181768eec.26.2026.04.20.00.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 00:49:48 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document Nord QMP UFS PHY
Date: Mon, 20 Apr 2026 15:49:41 +0800
Message-ID: <20260420074942.1250414-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J46aKgnS c=1 sm=1 tr=0 ts=69e5da9e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=i-cyXkeXePKO-ona4U0A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: NLnkV0FyPwCMeCj3kKX_Cto6zeNe_v6S
X-Proofpoint-ORIG-GUID: NLnkV0FyPwCMeCj3kKX_Cto6zeNe_v6S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA3NSBTYWx0ZWRfX2fOG4Z9V6chX
 wLNzElo4NyDlXRAUFAfRKYcMQeZR9WSlfGQKltP3oCdgt2tZZ1qNkIu5SJmK07UeCReuspMpxOZ
 Zr0l+yzpvfk36Krkeh772JMl2SwxJ5zF6YX84MzF9y7iDTv0FjCpzKIWsUI1PRy4o7KXL9j2H3T
 ISiuZp+TfuFCKj0RvtBd94CxRyldqpn0FpR56lKwQkoIXjbhlrU6hTbtdF7C3JCGvTmBDwu3fH9
 MosejG1nigwc4g0FdVagN1SIQPsXPTubAGFYsQBZN4fDqRyBjLD8OWgyjirQjNFLF8ByuYevG7x
 Dv58PUyWU0qz8INZegrg1byKIoE4VaILv0XBrGOoWwEEY0/MQq5smQr1jaLmfZGfRXR1VwoLDZM
 KRFoS+Awzu6Igogmuvjb3LkgomMJb5B6LJPgeyd6phn+LYj73UZphlxqPlLtoPsb1WkhweC8fE4
 FcYUZdd4rwW6qG6Kq7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200075

Add compatible for QMP UFS PHY on Qualcomm Nord SoC with a fallback
on qcom,sm8650-qmp-ufs-phy.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 9616c736b6d4..cc3457d6aa3b 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -36,6 +36,10 @@ properties:
           - enum:
               - qcom,kaanapali-qmp-ufs-phy
           - const: qcom,sm8750-qmp-ufs-phy
+      - items:
+          - enum:
+              - qcom,nord-qmp-ufs-phy
+          - const: qcom,sm8650-qmp-ufs-phy
       - enum:
           - qcom,milos-qmp-ufs-phy
           - qcom,msm8996-qmp-ufs-phy
-- 
2.43.0

