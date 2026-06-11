Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8973376A08
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154030; cv=none; b=ldfr+b2Bc82F/psZqw9UaKXeVYFJ610GqM2l00IWiamDZZFpjv349M7rLFfHBziNs45n63QDcYT//uYK/0Bs6OabRmn13urluOei2p9ee/6/6gyLzxCdzrEx/DXOMzI6IXhvXi5V9bF5MOk5gdkQrQiV/MdVnt6ZoHqhpL3c/mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154030; c=relaxed/simple;
	bh=PxFeE4iE8H+mop4PjNTz4rASGopPuOb04tpGCfdaBGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hIj1E8Q9ozWOilamUnTLZz7whn9Brmh/3FgX7MPIgvpNWzrOluYdvosCQnl8Jn9lg//Lt7sPXDj1izFaZqsWFcKJk7KiTt0GMf3wzWj8KXqj/Ep4bhA9htfaSEdqBBGw4xe0zM4sbe7/dLJwkboIcwEV4hlElDV2NFb6Oi4TNbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DF4zJ1Gn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KWu/QFsd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DF4zJ1Gn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KWu/QFsd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NW8i1614597
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HNuNHDzkj7zsiUvpDWiTjAWZpkmlx5Eb/BqVvO8oXg4=; b=DF4zJ1GnqqaT+niA
	phaJ3yT03cim0UtMvTGQHTEbvX+g9Jbg3RNRVyxczHRsfEhT4LwO0DleekRPC2cc
	LN1SoPOxQ6K0bW+Qn8UjJHMJA6F24X6U9+rAtQodQBON3CcGSnFpW8sAZGhv3yqx
	73khZjdlqKifZ27OVTpwZYMJo5syikoLZTrt7vUGAgbG9+CAHVuqeFoG3d4yhmoX
	TkMdif34AW9tw1uanadON5HGqVHYSXCKLbQb/UTSX7e5vGrmx0a6LwDycTfdu/mf
	c885xPdtLLAnaMM2IAXXBjHSw3BEln4eDMVOEWY23ZL+V2mohcI5rAWqk9bvJ7pc
	3+JmRA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe79hncf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0bfcd629eso91693735ad.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 22:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154017; x=1781758817; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNuNHDzkj7zsiUvpDWiTjAWZpkmlx5Eb/BqVvO8oXg4=;
        b=KWu/QFsdAKL+ul5oeuRwDZgYVMGx0RDui+xB8zgVBtcWYGQw/ohvJ8dSf8yRzIVBAB
         0EgHOtjlMDrzukI/aptq4eqxxvDO8fgkQhu9vJxNy6e+Une4uIDk0jkY0rPKCSenzZmf
         PqFSXCQGSdiZDDBdiQxlrxcavQvsL/TbWm7Dw8adnTWLcGOk5IqQcfjmLB0Us7wZ6zjw
         p9Tuuj8WgNH4x+DHxKs1jnsv4vjRdQ3kIgIyZD2zL01R+GeE8naWgm4hdxZvUHtNfsQz
         yIzm1g5SjqsI/q/7QBOIh05waUVa0jqXs92xNqVvs+zgSEwkfe/W/k1H9KEzRRAnI7Mt
         w89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154017; x=1781758817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HNuNHDzkj7zsiUvpDWiTjAWZpkmlx5Eb/BqVvO8oXg4=;
        b=dUmF0gen1qiSs92pMeDwwkQFp5CcWAv1bcohw5nB2JPSmqRbTDLqiwGVagh9CsjrEB
         7PJpG//L+Oy2BvHiS04ULrE5rvBBXOic6LR3a5/vxlpN0KOgowbr3HswrEoY9KLnBArl
         R75U7ZYIQ+/WrbTdezsCSj8H2/p2XBlOwkVGf18yfpAeTOcbT3+Dcvsp73X9WclpYKQb
         p/VLPc2PpwPRml2/cJ8/P3anIvQEbOczceZ8D3fIs2/UH7kutvyDViSCelIYrSdhJmEX
         DBaaGMFC9UrInL+F401GKn093/CSHssRUgbu2vCpTo26jWxYV+o2IrKoajxlgbmVpGUt
         su/g==
X-Forwarded-Encrypted: i=1; AFNElJ+PHUcLo3kQ4AkeHDcHI/eE8RljtQ6XrvYtqt9sJhCdv3gxygWFISb3MK+OLeT0oWpBcIg32nWlvwYr@vger.kernel.org
X-Gm-Message-State: AOJu0YyzSzdiNM5sl/AnlgqbUs8a7XNG/JPA3FT6TrRKECg8OK3tdtfj
	yr1Ylpumu1dG1ufZo+U17iKvh2hOPvLuoPSe2T/5Wdy7Ey2AlL2WPcWiU1Utb44UMxLoxbnCQ8h
	Z2e0HEIPPUiPOsbPPKkE2nxKWM1Y2CSEckhtejaa8Y6kmqbg/7WbcmD5MnYckJMqf
X-Gm-Gg: Acq92OHgV9VyI/MTOdVOKWBhV+bg+9EWR/DL496aHGVL2RVEUCjKPJWfpb/CHpvqPi9
	mI/2uYT4ejhoiTLzp3WAuwQsy3f3E9rcf6pcrbHKxaNVFguiE0zJCQITP0L33ohE7rHqarMFPUb
	fnYj9t8mzsVx4LYxvm9xFKwzc2E5FWxXLo6acnqrSA0ekHWA3PTaGWHyj5Bx7qXPNit++e9+xKS
	RonN2MBp6du9bghvJEMte7yCvMiUcuKOVdtH65yXecyp65MUkSOl6Hvpi7+2mKOradJn920ojYb
	55ULr64oCpuN7m5hRWq1aiyLeXKlCf6ZB6wU4OkkfNs2YpTuMLu3p0HfKCQx4e7B+zj2LFK2rKG
	I91d51XYitbNLYg84WvSa+0jDUQOseVGsnVWKP0/Pl8WwtJub3C72PU7AC9I6jyA3pd0=
X-Received: by 2002:a17:903:1b48:b0:2bf:2114:ecbe with SMTP id d9443c01a7336-2c2f4208cffmr13323235ad.23.1781154012159;
        Wed, 10 Jun 2026 22:00:12 -0700 (PDT)
X-Received: by 2002:a17:903:1b48:b0:2bf:2114:ecbe with SMTP id d9443c01a7336-2c2f4208cffmr13318565ad.23.1781154006914;
        Wed, 10 Jun 2026 22:00:06 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:00:06 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:54 +0530
Subject: [PATCH v2 18/37] arm64: dts: qcom: talos: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-18-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=1536;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=PxFeE4iE8H+mop4PjNTz4rASGopPuOb04tpGCfdaBGo=;
 b=lBgk746bBQL9urzTDaOn4PHuUcZGq8u9NBmYMULzhvaHgN0gr+ZVlVVYVOeXoLXgEg+5RpKRZ
 P2kJtT35cPrDyi//VNusuVelAZi1D7LUYZM1i61UQ509oaeWjL5zIo3
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: AAqza2zqgvbeHWMphGm7CkxVrx5yWWh7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX+9gLwYEVor4Q
 YGj1f6rkQab2FHbORCpvl7ZwBAOHMOPeB3rby+qUByaatLOSuOYKmNQx1znI+I/mMmqG/sezJZI
 HBKPesQrpKd3l16cMHHxSZCcDu5Ryg/pSoU7hHAYDD87RVIw5OW+YqiKhyos+5RAcv7BeoeFaQB
 IxHHkAKOwGFhSQaDbGreaFBr+/LJI1PoK0opXSQAUc9ej57gievZK3xrEzCfOm47x+S35v8JEzG
 fdw4gyKTLSSCRSCkG3JGMWM83NdZtfpopOXl2UBBvOmyLKPiRizOcKiagDDHllD1dIwHishHmB4
 ppd1jEC0CXFmtb0H3kSRRaLgJgTa1opiw1cBNxhBtw0q7rAO4SNqM1BVeHRWeB+N5zzq7Wi8Vfo
 5+D62rUShKQauanSuRqPoHEAc2nwbIHeFoThRc4VYPcgnhZOhvhA6A5R9IK/7Q8T3QWvIC7lyuO
 QjSIGIBrlk5rU6Jb+OA==
X-Proofpoint-GUID: AAqza2zqgvbeHWMphGm7CkxVrx5yWWh7
X-Authority-Analysis: v=2.4 cv=fbydDUQF c=1 sm=1 tr=0 ts=6a2a40e1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX3qSPFOQzhUyI
 S1YeJFXJCgzHrQsFqBkQRidiIn66qobIf5nnSvltamfZ+13AuP/PGYq/Pwnue0j66J33BTTj1G4
 YtNSWXLSBGcpsbX1ifL0Bey8PmJgn7w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110046

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts    | 2 +-
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 7e05f873194a..d89548a2a3f1 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -445,7 +445,7 @@ &mdss_dsi0_phy {
 
 &pcie {
 	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
index 294354c034c3..6eca3791e2b9 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -359,7 +359,7 @@ &mdss_dsi0_phy {
 
 &pcie {
 	perst-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie_default_state>;
 	pinctrl-names = "default";

-- 
2.34.1

