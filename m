Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491023C584F
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779443821; cv=none; b=Akcum0VZofgELMcTPJCrxQDe8udWKFNVESjSzmQs2nQ3Q/teo3ul1q1e1kwXc0GKDr4Wrbpd1FVIBwk5LPeLz5RuEpMzuQ3rtMeckyHDvOsJe7OOmOWCHyRQtG590t7ROE9W4uS30jJMAC9YsX+l7NqR/S8V6csiIx5OHgZ5R2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779443821; c=relaxed/simple;
	bh=yIozOWRREihoVjWjcGnl8m47aIKtimgMJwp/8uurLbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gOszB7lrh/+d6QbjmzmU5T+Jzo8QQGMDBK20UX6nQKt+Eyh11Vp4vn1/mtYn0QsHEZ6Y9NOpDULvQ3Y9BnTs4p2cVLwMzV5vRdJKl8Tuq8qtE5TUkBulAT2IkYoMoE4Fi0C/qAmO1z3HYBL9QzyeqnQrUr0P+BLoID2mrYPeFLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j6CIlmTE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KMj7ZJoY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j6CIlmTE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KMj7ZJoY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9EFZs3005145
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R6Zu26CySy7F8kEACRFLd8
	GHoBOcnqSzJyxtGoTrkMg=; b=j6CIlmTEcZC73rRjWyUgdVGBRtxqC68jFIk/Yc
	7h9fZsRA3a+oLePoMeXW8+ex9NL5o9Vw+LVjTHP//n6vKqCOPUDQpOGzxE5wJz3v
	YoJeN4ISjZvA3tIRpojoSSwwd9ySfUdz3gZETSDLOkTvqjNStwkeuQlXTsFO/Ozg
	TgthCDpvEzhCraix29rtb8zBeMxHkpamAGRO6TuIHZdABHH4y6kj4zW1oLd+SImB
	U9G5MtofSfZogbAeKKDkmgjcvlVscXk5SCXudIHDkv4hKKIzX+mYSxHrvCII13eR
	+0diJvS+r09ZWwQwGYytRzJHvBG314BBps4K9N3bt+U5E5Gw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrt9e8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:56:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3684cb22502so6803260a91.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 02:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779443819; x=1780048619; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R6Zu26CySy7F8kEACRFLd8GHoBOcnqSzJyxtGoTrkMg=;
        b=KMj7ZJoYosSKIjkI/kXKbYn8vf1I+yGRJ0wMKElK3yeMTPe9VMMUOr38+pHmsJBtkE
         6uf7xsrePZY9PEZDS2QV3inpy5X7O+CloUO1PFGRXIaoSJZlILs/Lx4zP2zn5/prJ6Ui
         jh7nIeZoAgL+JHrAEZcNEcCZP/ZBHfsBecDIAZqmNTKYP/qoYoigsmy8X9aFBFogescV
         OSW61lNIPsgI4HVG8y4Cf2E+dzsJEP2VDGbolw2Kg3xChI9Wzq2xGrqoNwBjHbqrQAxz
         qvy5b0wHvRpTKj/qCZ6j1BEqSntaxjDO0Hh/fcXxdtE0Wn0Y2tkU83h4vQg/KJPlIGM7
         ni6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779443819; x=1780048619;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6Zu26CySy7F8kEACRFLd8GHoBOcnqSzJyxtGoTrkMg=;
        b=qPDtWaR9Gyg78hSwkEdr35i7briKjKfC6KHtLIfdCvBB4p79EVZ6gQevbnJWv7QFHb
         kU2aU20Lsdhn2HeW120B2QG439dTMMV1BVPLTj082xKlmV2287/g5oo7vvaFa/w0LpWe
         pCr8XAXPmsefhMkBYFW+fo6wnktY8w2E3UNyrhPxMjrs8FZmPyNzN47eDQtfMSAykF6W
         3L/w0kOySoAe4SJ8vTPUY4Alp0EiafnKSnMw1WgACrgOqzhJtCyRTUbevvbm1zxVUV1A
         BfcX2w2RVvFM7iJIj0j1u3bGiD8ztrGmd3TstjAq9FqPEKo2eQ7Oagcfmdhq4RT7r2rU
         F2vw==
X-Forwarded-Encrypted: i=1; AFNElJ8k1cdvnHwXuogz1nMn887mqpBn3YrfHhcCNZitkwFOSW3oXPPxMMuTQCXipVEjBT/CgtNdaVdqmohl@vger.kernel.org
X-Gm-Message-State: AOJu0YwF/3Bx5xO60okfhHMEaiMol4ohf2/yjyxLj7+FbZRFYSutrlx0
	5xcRqa1ZRGS9EVzAu6ihccU46qVNjb7L5MJrVD4IpvVsZA+uHo15RipleMT7cLKgkXKhNM6CFLz
	LI59MxGmyNQdgKAiET1rC2BedjuSuCIYzz7sbIRYWd3g+KYgAHUBDOtKuKBJ4Dvqq
X-Gm-Gg: Acq92OFHVYr6MrvnRH3irPlMNBT8FZs01ubKAqvbLdl2DijUh67Pk2g0bb8wem76v49
	vefYmxBQCK3Xy7jQOm2tRa4smKnIFifq+T0wrCmbqTDTP3gtBWXu0w3fwBVA0f9rEF42+WltZci
	VENDE/wraqcbBBPeUrY/SPRvLI7QeAdVD/pvqGRxU71Phcvmi85CRHGGG31Ymj5u1R114zUMhhD
	wnwuW7vcDrygwFf1/hEmcxc7Vo0stZvZEzECHpiQRVBGI+B9Jep5pwfIcqLosbE2yqxZ+pbSDQB
	8zd4CRckT/NkbB07LlVOAsw38HtRdOyq/fpoyfAtyVzcIziQJoDqhpRxLWWKWBEMjjRZyW3bJF2
	kwT7JbRqjUZB44073HQPd4dtU0NvG/gWC9ZZ98Q==
X-Received: by 2002:a17:903:41c2:b0:2ba:e42a:231e with SMTP id d9443c01a7336-2beb064837dmr31696525ad.37.1779443818835;
        Fri, 22 May 2026 02:56:58 -0700 (PDT)
X-Received: by 2002:a17:903:41c2:b0:2ba:e42a:231e with SMTP id d9443c01a7336-2beb064837dmr31696285ad.37.1779443818377;
        Fri, 22 May 2026 02:56:58 -0700 (PDT)
Received: from [10.213.96.151] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58dde4fsm12801145ad.67.2026.05.22.02.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 02:56:58 -0700 (PDT)
From: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:26:39 +0530
Subject: [PATCH] arm64: dts: glymur-crd: Add reset GPIO to touchscreen node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v1-1-c7653924acdc@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFYoEGoC/x2NQQqDQAwAvyI5N2BDldqvlB7WTboG6irJKi3i3
 2sLc5nLzAYupuJwqzYwWdV1yoecTxXEIeQkqHw4UE1t3RBhsLG9IBfH9PqMi2E0xsCMJi4F06w
 Tlh9LHDyaSMbm2lEvLExdD0d4Nnnq+z+9P/b9C64KDhmEAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>,
        20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779443814; l=1748;
 i=pradyot.nayak@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=yIozOWRREihoVjWjcGnl8m47aIKtimgMJwp/8uurLbE=;
 b=qwLxBcJHGJ7fhuZZqgy0PX+yLXmUjtuzbnSiJtL5AwJa8v/VT0lurpkpoLqTufbDEdtYKK3wF
 LX/9L4cPC6SAEuRR8X+0TyESS3E5IJK58zgNEtDNQ99L7tlagj5NNdP
X-Developer-Key: i=pradyot.nayak@oss.qualcomm.com; a=ed25519;
 pk=ZAwwH8thDSb6bq4dCgFHWr80BqB7MmUAKogkd9BsiXM=
X-Authority-Analysis: v=2.4 cv=JN0LdcKb c=1 sm=1 tr=0 ts=6a10286b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=lbRSShi60cGz1d_720QA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5OSBTYWx0ZWRfX12D//STGfCo3
 hu0dWAs/ysZ21CoSbetcYYDB0Tff8gBkAPJvdOju78Zec074MzK723HvQBUoEPPjAO0vvMLPcma
 2jcLMt1DUGjlxNYoYnsnxESBEDLilSC62xXg4ur52KrfahKduRAefObLRJMrpAee3Yak3EjqYC8
 pNe6PTvlzb1Lhj9tTF7biDv1nOQQh+5fScoJkxY8Fe0hIjS7WtLVza3eRnvgWVx0pqRU4PzV3KA
 7KoamrgSL92yw0ScNdPbof3ebZ9pMmvpJ0mQVpe3ut7Mks2w+ByzwYNNeBrkqGMhZOZe7VXd9b5
 smLtZvonDTiQ0sQjHF8oZ3vmv8rYHW0l8scQPAKoKOeRGve/0mOlYKVcinCTwtFNDvxZyGCq4S0
 7elXLdhpW1EWEChhJeJAt5SqbXrlMZ5cm91GmiYcTrN7jh3RvgmSevE2o5UiLpBQUkij2MnTOlH
 4NZB+MJeodcZA4XGWRw==
X-Proofpoint-GUID: 6hQigqA2rAlwyOd4AZTeeLMtwj4TnfEp
X-Proofpoint-ORIG-GUID: 6hQigqA2rAlwyOd4AZTeeLMtwj4TnfEp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1011 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220099

The touchscreen module on Glymur/Mahua CRDs is different from the one
used on Hamoa CRDs and requires the reset-gpios to be wired to the device.
Without this in place the reset line will remain permanently asserted
during resume leaving the device offline and causing all I2C transactions
to fail with -ENXIO.

Error Logs:
i2c_hid_of 3-0038: failed to change power setting.
i2c_hid_of 3-0038: PM: dpm_run_callback(): i2c_hid_core_pm_resume [i2c_hid] returns -6
i2c_hid_of 3-0038: PM: failed to resume async: error -6

Add the reset GPIO so the driver can deassert the line on resume,
restoring I2C communication with the device.

Fixes: e6bf559f7eb9 ("arm64: dts: qcom: glymur-crd: Enable keyboard, trackpad and touchscreen")
Signed-off-by: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
---
arm64: dts: glymur-crd: Add reset GPIO to touchscreen
prerequisite-message-id: 20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 1de3a49f49e4..2259577b9ae1 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -623,6 +623,8 @@ touchscreen@38 {
 		vdd-supply = <&vreg_misc_3p3>;
 		vddl-supply = <&vreg_l15b_e0_1p8>;
 
+		reset-gpios = <&tlmm 48 GPIO_ACTIVE_LOW>;
+
 		pinctrl-0 = <&ts0_default>;
 		pinctrl-names = "default";
 	};

---
base-commit: 1d376e58cb4a94f89de0fa9195d583ad6b86eb89
change-id: 20260522-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-5892beded29b

Best regards,
-- 
Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>

