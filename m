Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAC023E32B
	for <devicetree@vger.kernel.org>; Sun,  5 Apr 2026 13:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775396394; cv=none; b=KMMbelQmjdF38sjwq3Ozjx2XCmyu+L8mj1dtX1feQyr3rXNdWqXRQk8QT1QXNakp/uCACZPAlrZYA9/j0Ofo7+KAbVjWnc73HSDt6ANLDxpOyQ27Cj31Ko9hKohyh+8BNraGUD2G2MxeCqqhLrn1psKBnx2DEuv0j5MJO6WEV1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775396394; c=relaxed/simple;
	bh=c7rY3U0BLMnd4dYyq/r2WxlPYv4rpgM+0iuLRQlkkBo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u7AFxgk/omHidBXC1qQfutnsmV8Pi8FyWciWZh9S76w1pV9T3I7Uq3rhrnm8nJFKDp+NwdUEECn0dCIEMAsYLdaDF/hhzykQIXKVV6AwnCVS4evN2TUByqZHYWR1f8IZAdGzwkpv+r5ICQO1hDdBwUVvpvhLSULz7/no7+wGjag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LSl7b1Wy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WDa0dKoE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LSl7b1Wy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WDa0dKoE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6353oO6P2835782
	for <devicetree@vger.kernel.org>; Sun, 5 Apr 2026 13:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SfXQph7flkBlqH3cFKFOPf
	2eupXzaAVvoBnn0RCc2/k=; b=LSl7b1Wy0l7YxfzyS4vutwx3yZVwtAXkvpnc2r
	A8yEiHgVk+eVlt1Tb2nK9bg0mgUsS3+zU04zKm7QYM0ukjz+pdE6TLQ1ymflmJmZ
	CVUAz/ss9AnhE62LZpDiJQbxNQTQopfdUdzU92zBZx0oV+e0bZieRIM2bFyLIH/x
	KDD7WEIx4kzGXeuh4T3xZSfRlj1b8CW7aEIIxgd4KIqyZfxnGljIWim5QbUxubM4
	rEIs8ivjHpsx29Dd8Dqm4oYgfwPETjj8Z3ZPeRdeKx8Q/rySXXxHeg3zXTJmSw8Q
	NcnUZVL2YGyh6keInNhhlykT0zYBvtIWRVrKwMVc/8STougA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasyfjku4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 13:39:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b44f7b7bbso101676661cf.3
        for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 06:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775396391; x=1776001191; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SfXQph7flkBlqH3cFKFOPf2eupXzaAVvoBnn0RCc2/k=;
        b=WDa0dKoEQeVT30lqRFootWObhkz/OY158J8PHdUhTc45Kek/XPSy41+ZAecAq1uDRB
         SCzll1cTJc4zYqKuJUsyeRUQ6VN6VeKnSmKhKaAjirIKAs3Ww3p8xGZkdKuCNgz55zeD
         QoG2kZGwysILMCAWri435u8xw8VALh+vhDMC0bsgPzbIcDaXn/iRO4kmtG06ExX4Sk6D
         jZbZtxOqbYKxzKXhbAe45uTRDpc0Gl07plVV2HJ/9qAFj9pQ/73rWlNYfvVAdKalPKCH
         PyD0uaE3sQpsDgaSbZyOLP3NQRZpYL5lEO4s0FazQjX1b61xFNw1c2t+GM+5ygqnbFx5
         G1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775396391; x=1776001191;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfXQph7flkBlqH3cFKFOPf2eupXzaAVvoBnn0RCc2/k=;
        b=NEEiEo2OSDiQR77VIfi75mNT4dAsaRPUa5b0jsriNXP08UDaewCfpTSlWrtUWf4bvc
         Ag5UKPW/EgWG3OzaZlg4YawSGSSKPcKdgxNc8YYlU3LqVtq7KN/zXseJ2uApC+uSXhiM
         5glmBq5mLkzStn9fEmiZLbeQE2C9pQyW5ULwHra8r0WMSZhHSaCuJU6Fvhy/bozFRvJb
         8TZcI56XeogogaOQyjwZMk9W5lZ4izU9HFjwjRL9OcwgN/SCFYBOFeHR/Z98zXXkQTcD
         M+pUXXq4zP71777NZLCKRD10ihea4KwpztuUwt5bJuG5ZkVisJETvL6FQucIOMkSz8oR
         iyaA==
X-Forwarded-Encrypted: i=1; AJvYcCVBvJ7plN+EvmVFV6Yrrv+CZQkx4y4h/jE/7JLtioQbKCr3kX7IEF98QE+ASKctg6MTBRljVrlMV+Hv@vger.kernel.org
X-Gm-Message-State: AOJu0YxS5SB85nitsHXWyAFAzxaJqDN2AU3u7M87ErYI/0usVWeEXT46
	DGQn9zjWu5OZ0EzZRYFqCZkFzI2vqLcciMQMB7OIusT4t0Yhwd8lOzbu6aMDPXSRsiqEhNEe8aL
	UgYzHfYYGnrp6CmOg6uxww7vKKtlKy7iZJAWJf2WnbAm/KUOrDncFQ+BVcLUuJG5g
X-Gm-Gg: AeBDiesNimp8mnXZdQe7LJRtozaeB+nSZ2HUMj9t2s3mGJqjd+Igccq30p/KV+N+eWo
	pZSmJzf1kgLqUIATqy0Y74o/sN0SC+HxhNJomjKiNGnGLL/7YmQc2JMoBpZzbz8Z41NgTVRNdNM
	fD2e/AYwa46qYFyvJBxnYoYlm/ED1sspVDl9Iwf95JXD7wFt//S2QQG8VV3pAzHPwBkyzbSoGhS
	BakX900XrEWw2ZM/UtK6rpgG5xd3kEObqi8aJoQ1+E04f9oURe/0RbWL17cfTjcA9qitAwYqUnj
	IULZumabmABfIstzwMs22divZVGWDQTLQen+CuO7ddS6tqX1UZIglHscZV1u5WJ8l7c2FMyMkAD
	6u6T8hMJbVYeoMjMUxBlZ4autX5bwdYchxkzu0kF6NVxI
X-Received: by 2002:a05:622a:259b:b0:50b:37a6:e497 with SMTP id d75a77b69052e-50d62aa22b0mr151399141cf.44.1775396391051;
        Sun, 05 Apr 2026 06:39:51 -0700 (PDT)
X-Received: by 2002:a05:622a:259b:b0:50b:37a6:e497 with SMTP id d75a77b69052e-50d62aa22b0mr151398741cf.44.1775396390574;
        Sun, 05 Apr 2026 06:39:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f1esm32188774f8f.2.2026.04.05.06.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 06:39:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/5] arm64: dts: qcom: Few dtc W=1 warning fixes
Date: Sun, 05 Apr 2026 15:39:27 +0200
Message-Id: <20260405-dts-qcom-w-1-fixes-v2-0-1f2c7b74a93f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA9m0mkC/32NQQ6CMBBFr0Jm7ZBpAwRceQ/DooVRasRKB1BDu
 LsF924meZn3/19AODgWOCYLBJ6dOP+IoA8JNJ15XBldGxk06YIyyrAdBYfG9/hChRf3ZkFldG5
 tS7mqDMTgM/D+iLlz/WOZ7I2bcWvajM7J6MNnX53V5v0dmBUS2tJUXJRUMJmTF0mHydyj16fxQ
 L2u6xfj0/spzQAAAA==
X-Change-ID: 20260404-dts-qcom-w-1-fixes-1a25bbd0519a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1235;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=c7rY3U0BLMnd4dYyq/r2WxlPYv4rpgM+0iuLRQlkkBo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0mYcr/gMSmPXWvGNRol16mu0NseH2ycxyQc3Q
 NIJOYq59P6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadJmHAAKCRDBN2bmhouD
 1y5aD/4uMr7AK7fVazPh6mrwtm+vO8gjZasCphAKvvVNim6d+YS1nW4XCPF2Rrl8nR4TcCyx2u4
 ZlDwkgFQFnMngSv3cienDmWPpc+d56xZJUbwvFXJb9ytsGnUUT3clQJZdVYTf7Eo+UTCNLE/I3h
 fMuWzMvWt9AyfCUrDHT64wuLK/pszRDTosGInHUjlsngx6MsWaHWXJBaXuujDkzRnscyTgALz9c
 +Hyfd1Rd0uXJOjHJH8vkIP4FMeQg44mPvf9mRPPKFEYD+0bbMYknxrKZsI27RUVXoCy9nZnUe91
 JPnvG+Fl1dnHm1RPCS3g4HfIpk0ErwHijEoof8LMLU8zKpauGrZhfaUpe7CpcuSrtWfhY7mQKyW
 Hwa9PJXbKWTqS9IuSP9AbrMDDOQ8d7CYKpRoFxeV5J5fFdEyqSGZH279gYXI/N5/w5fZi25y41v
 r6OWETfCAnvZiL9uVbrpLF2KW6j2BOd9xLgmqdsD8M6rTD9x1/eU13ZrT9jFkE+xocfuoD7AtGk
 +RuPZsP8sU552F6MWbN12Owb09MD5ZvDA23n4VFteVX42Rre26ZdR81SL6vSIeTPSeExok1HrkX
 934uMbtkMvtojWRgEh5z0N3QEMlzy2DbKbuXEsuCIc//6CkmuHmEyJUH/N6zi+J7o7KU0O6aFU+
 /SUW5fhIZGFEJJw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE0MCBTYWx0ZWRfXyGEcfPbP+PHN
 /RiXdDHcglA0hKEupAy9Vj0G6odUneZYzYRyUHNwnAh+y6/2j3wpyXIHi1r5Drcj6SDMZhE3aIR
 4V3ulgUR49JbWQ+a6/3Bm3S48Rw32Dr5k+DI3jfxGOXw5e/8eZ/gQlfBs5pAZzPNqqd7vYpcr6+
 o2FxcTifWioRMkzGA9MqR6xXy1CCI7FPv5jEgoiEJYCeG1xn0g4ThRIsoG1wdZjJQoC7RH+y6Fs
 ibTFCSzWY6ZQqbds6x14tjAKpRssY8Vr/sW4yawqIAHxxQUZapOS4Ojzz8egrYUkOzplsU6k+EL
 8T2bc4tzCLegvLWAdliVVoSILSdQid6SqQHDQ5JVLKq64XIj8oFv49rB2SO7OTgutQE1QxC59gX
 L7Fbb6BsS/Y2r4hF1RNerxkwa5qWMsnVPUcPI3r6Qbq+IBNS9ozmLDnxWVGw24mPTgKf1v2+GaY
 imluSCtECIs+wDI+DCw==
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69d26627 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=KhWeNy8F5nQL820tRQsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: V7qxTIykxOdiGGZXzLK1S5_kATHJzLhp
X-Proofpoint-GUID: V7qxTIykxOdiGGZXzLK1S5_kATHJzLhp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604050140

Changes in v2:
- Fix patch #3 subject prefix
- Tags
- Link to v1: https://patch.msgid.link/20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com

Not marking stable as these do not have actual impact on user, but still
warnings are not desired.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      arm64: dts: qcom: glymur: Fix USB simple_bus_reg warning
      arm64: dts: qcom: glymur: Fix cache and SRAM simple_bus_reg warnings
      arm64: dts: qcom: ipq5424: Fix USB simple_bus_reg warnings
      arm64: dts: qcom: sc8180x: Fix phy simple_bus_reg warning
      arm64: dts: qcom: sdm845-mezzanine: Fix camss ports unit_address_vs_reg warning

 arch/arm64/boot/dts/qcom/glymur.dtsi                             | 6 +++---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi                            | 4 ++--
 arch/arm64/boot/dts/qcom/sc8180x.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso | 5 +++++
 4 files changed, 11 insertions(+), 6 deletions(-)
---
base-commit: d0d19917748b2611266a311841231bf635e6d80d
change-id: 20260404-dts-qcom-w-1-fixes-1a25bbd0519a

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

