Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C4443031B
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330513; cv=none; b=V0Eej+p2C/absV2oAYd9R1cKq6AtNFl8XTRO3z6OGJgdCFPhDEWOpHMUCTZtKfKZpS6QGPbh7h8Nn3YEPpH/FHuF8BQfDLsj51hJ7EKZd4nBCaKDeBtGE9THbeGhVX575YcdTD/c0c88w+Ob7q2zGs9YWiFAX5+njOx7cHHZcpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330513; c=relaxed/simple;
	bh=iABAFPjBDMTBZVy1KhWW4R6p1ni/SRjQJrMoNv9Fw74=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YKKb+x7n24DtqDmCTF0gAGb04+io6CNMvf1hc5tY6YfIa33gLZDGAxLSA3X7QVvPkCyXt15Pla0rOakbnIBAewFZyiTJ3uEPCO9ri7uB+TsdOEtrToWlVRvdgfaXZvtBeIolbvf/4VXKUGNT0xUovvyG3GDLd/pOPYVZeRdjgYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EjZAAMje; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iBsxiZMH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EjZAAMje";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iBsxiZMH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666946Pl4172619
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 09:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wXn24FbqI0eHL+/K95XGoPvoBc60EqsV/lc
	hLMiq93Q=; b=EjZAAMjeEnz+BDdOZ2AbT23Eo4YTijLxuAouLb/a29mc2B3JAX4
	MpPKUKLOdva1pyWgPe4xOAY1bApLhcS4HFIzAV72qALMvyS1a60e0LgToUVfyJTv
	T5AOwdJ32UxijU+Mok1qZLZDSr3aotogTaXyzF+JnMpu6CwojpA9/RePwE8p7Elf
	OZvpJ5bLsV8OaCNYhaSASzDWA00T1rqpr8Hi6KysGhUKdOxMN088yq0v5FM//6Mz
	Ltu8weWIt9d/IHlMtYLpCk3lWpjQ1vbL1W1+1iFSUAfgqX3J0N2/pVniiP4sAxFS
	6UyX6OpaViBSZx464FWIS0QUI0h3TIp+6QQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t8899v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:35:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915f6ff639aso514052085a.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330505; x=1783935305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wXn24FbqI0eHL+/K95XGoPvoBc60EqsV/lchLMiq93Q=;
        b=iBsxiZMHMgmHF+EBsFnrHZLPP5DqYECClN8kTBHYwAACymFUzsrQOzo3wQIZucKuu0
         UiwWuZ5XuA+WlxlK8cdtKCN+Hz1m7Wj6LwhZ2GkySzmD/qp+KDY0jkhMdfRdu92Lncux
         +wuF+nPI0wLU5sHySqOK3pR+EiV+fC4onxWSOXP0FwHZBiU3jB2gLI4EEl4N1FsZssLG
         h2oIMFw1vV8xt4mRL+6C4NdZY46IO4c/eaAhkZXqLA7VBYo/3rqA9d0tGDUe04qnWM61
         su+W9E5dPfMKSQdcEsCzse2ctAj+nuaQt3prfKa8T107tKioHp4Lhy3wISraOjL38L2j
         5Wnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330505; x=1783935305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wXn24FbqI0eHL+/K95XGoPvoBc60EqsV/lchLMiq93Q=;
        b=cC1iK7zAu+mbr87VPnYfz9Q3yjXV4cdGe+OdI4kPHQLCjDZeZ+v5YR98SCKitjPS2/
         YWOopK2cS0oaNwpZpBk5RncF9bYJLiKnXOH16hTR+vC5ccJF4oMpgBZDgUMJLH7JNlep
         zXCmDwyC9Nf2rQqqjT/9ngErziSAWXXxsewi1Vx8sqSLEAEmjrsPbEW75isQWGXxxCUb
         aCygRhuqfgFYCPcVwcduLw5S009kswoXAcV6D66oXNE+ULevGS7Sls+7v8uasG7KAGaA
         SD+qgWOleyg8GoJKc8T2ng05q95Q5gvqBbA5BHpUgayp9mfG85pBvHsD7al3RcEFyTBw
         Bz3w==
X-Forwarded-Encrypted: i=1; AHgh+RoI/hMUCQ6aEmbFprmbzSjHoPGGLS1ra/2GrE7LlimF9b8NchDDNKb3i+9KokZL5aUND4cWAy4wVca5@vger.kernel.org
X-Gm-Message-State: AOJu0YwFN1aH4tzE9TEazUUuruF9n5UeN7KoNRYSgUNI/FmEKPHyZceu
	/9l0KiyS6iQ7BeJqSi27JGv6BLKIv+uxBqSi0yo5NAxAZf9jvh/bMGwQZ7RVhoh+IjdHpE4gdvB
	M6r92Wak7uRrEvA/iK1yaphFCFmOJ4dC2cdtroZodg+9Hb4ZCDbexzcRTMC/0nL+QJdjv0rTj
X-Gm-Gg: AfdE7cksxM4IYIAcK2ENRaXwMckSIIU/MPFWSdqJCg/EggKdqfnCEop/+bYlvCPyt8l
	YeRAM59J8J/TuIdjjLR+Jg6X29HFWS2helTCyCXWwXJ72J3StIdUrmDM/V9OBJL0K2SswqAY8FH
	EoimRc54xnwdFso8EE3AhwU+frnMZxeQzQCchZe5kN9WhFeqzxX5xQURXKZ+KcThvO6TXEXczN+
	d9EuXOa0lAF0XY1uiQSfNqMAy4EIMLzXBvIM0xP+ELV5OP7HEQjQZ+e+RxsANHZd43AXtcg1mtD
	cPhmfe1QhPwdtdgaU4XxI69L6D9PgSfKvtwKDroZ1dyZE56hSnHKp+kc+2ZRGyEXwDRb0D+KBPH
	bZQLD/X5ExdCd3Y758iNAaINT5tE=
X-Received: by 2002:a05:620a:6888:b0:925:eb05:d194 with SMTP id af79cd13be357-92e9a47d0cemr1280525585a.57.1783330505265;
        Mon, 06 Jul 2026 02:35:05 -0700 (PDT)
X-Received: by 2002:a05:620a:6888:b0:925:eb05:d194 with SMTP id af79cd13be357-92e9a47d0cemr1280523085a.57.1783330504861;
        Mon, 06 Jul 2026 02:35:04 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f21328sm23579984f8f.32.2026.07.06.02.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:35:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Wei Xu <xuwei5@hisilicon.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: hisilicon: Correct indentation
Date: Mon,  6 Jul 2026 11:35:01 +0200
Message-ID: <20260706093500.273922-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1299; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=iABAFPjBDMTBZVy1KhWW4R6p1ni/SRjQJrMoNv9Fw74=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS3bEK7RyRA4If/TsWEBH+UP2ctwIQdzBcCyfI
 ZImY/kyd8+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakt2xAAKCRDBN2bmhouD
 14a/EACNPZuLK1B+5wpUXdrSrvz28BwP40GujitLy2ltHRGoW8HkGUp8s1IXQZFoqXx/fTNLc0f
 VrnO9obpHxaLQXPZtafkfX0zt/sISb04x2dxnK9i+VOjDW+cUnymqb6gQxoOiDvkndLa023UPBl
 Weq369IHESH+SbkPIm49M+KGdpptIUTWGvaP7IBrmSNnJ390C7IbfYn+AVBbutuP1bt1ezoie3Y
 XI3WQ9m3POlAJgWJob0o4Xgr+JBQw0KscGNbaYK2VqO95vW3O/UUVpWYtrwFYvDanguA1YGc1Wj
 PgB/ol9FsHS+6Mnbsbv0znqvznKxro7iP7OUblKRfJIJxZKLEXxXxUESn5Niola6SgFY+gB/5lq
 OzIBQcKmJ9mrwBCQ0zIPtm01xf55X0p42zTnoeB2KreMIl2taX9rxFggqjiUlbBGPXEkWCuNZnx
 TTimwm10QBqeBylIfXDUa+hTGZcUNVRfk6560kY1vqAOI40ph6yshSpfWybIbJOXUPyXGP8WYEq
 9jcFag10KU5mdZGQe5Rh6VsCI4GXS4ZBMBm0upiFnDH80gCSkfICXI8RBrYgMHDuO4Yabc8DP4U
 1QcHZ82VRZCnQg4kwe6MZ1+8NBP943YV151Umx3L0EdsYsYUAsC2Vthy5yWO+frZ9v7qIqwzj4e raKeKzStOKxWavw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX70B28ji1DfLp
 MLBuKRyL1bPIX/KNRFQb0kL9TWBHzPc4IsOjkoFhTEaO+DOlruaPQehbdHGL7em6Sm1arW7wyhO
 HMEHB/cCfEpcNdUUUsZABPtWGrux8LE=
X-Proofpoint-GUID: GjWiXVb6Exa8ECxmEoWCJonK2Bhu4uNf
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4b76ca cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=52rqv5wQVAuTtBApVRAA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: GjWiXVb6Exa8ECxmEoWCJonK2Bhu4uNf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX7RbMPO3FfSAz
 kteXef3v8+tpJCzBba6zrwHi8ad1nCSLjX0DKO2UKjXUkKU2vD6diD45o1YNz4Ok3QnA+NfmH6X
 Npja9q1tUeOZyGOIy5Yn1w4jZ0lN4X/+8jDZAKXA+cYVgPk3q4dqRyojzD5VQazc7+oomK465df
 GsQHl4NocVJKJfkUE7zDNbOzQgxeI180ZTj10EkIsidfNWimik5wpDeDEHjkFwnSei428lgprBA
 etG8PxgatA70mJGop8ff0xMr+ZC5KM1R5O2wsgMRTE4i9ifJRXHe1hpkbbr8Xz+U5L03OaVyLoX
 Oqzi+945Ez4zRLQ9gd8CIbcXWzXloei6dEBq+qD5u2IsDNW0NH+txcjfk2f/i3/Xu/6Fl+a0bi9
 pc4zX8AlwqprBg8OBjGRjrIo3pUD/IEQjC1rnOCzJJNCcuoZ40ZMKZQNkw+Uk/qILYi//lQyf9A
 RftJUA7GE6jLdg5DT4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060096

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/hisilicon/hip05.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hip05.dtsi b/arch/arm64/boot/dts/hisilicon/hip05.dtsi
index d0912ca5f237..2d376b3d30dd 100644
--- a/arch/arm64/boot/dts/hisilicon/hip05.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hip05.dtsi
@@ -236,13 +236,13 @@ cluster3_l2: l2-cache3 {
 
 	gic: interrupt-controller@8d000000 {
 		compatible = "arm,gic-v3";
-                #interrupt-cells = <3>;
-                #address-cells = <2>;
-                #size-cells = <2>;
-                ranges;
-                interrupt-controller;
-                #redistributor-regions = <1>;
-                redistributor-stride = <0x0 0x30000>;
+		#interrupt-cells = <3>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		interrupt-controller;
+		#redistributor-regions = <1>;
+		redistributor-stride = <0x0 0x30000>;
 		reg = <0x0 0x8d000000 0 0x10000>,	/* GICD */
 		      <0x0 0x8d100000 0 0x300000>,	/* GICR */
 		      <0x0 0xfe000000 0 0x10000>,	/* GICC */
-- 
2.53.0

