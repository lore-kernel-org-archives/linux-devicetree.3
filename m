Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4D343D4EC
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 12:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787228225; cv=none; b=Q0Lz7XUXyL9F3fbXELvEWy8fnstdDKpQrSFc1jnL4UOVzqgmePnfvCpkwzkwWA6fUQBnLvoV7lSTfo+N1Mkt16ETe0DRQt4VfRRUnqNfeIxxTGQnxCHuii8rYs5eTYBTbzQsINrJHxz+ImYxc+4t+3D9wQZBu830rUv4IKNLHEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787228225; c=relaxed/simple;
	bh=IfLSZs7XgelF0/NJACD1cJ8p3CERDYHl7sB4IP9i4xI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NJGkW5h1SWQboNFM8ZHC+e0C00c7Y020FH3O8s791wHIK2bTwzyX7fzLAHtQ3d/7NHtm1Tsq/cYNUhHt+6ulRoWaIPkWQ0TxitJdc4WVdWRX0aqe+b74CR7GSjffkIirakHHpOyzEI5/HPJPwgd4bg4+aW8RIKLjH+48jXjk/eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jz34Qy5L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QGgJfV/n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jz34Qy5L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QGgJfV/n"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KAP6xa2216049
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 12:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GeTpCMJLG00VDkgP1B7KDB
	KBv8+LJUVs4dqPY969ALM=; b=Jz34Qy5L9SjgqEaYiWzllyXFKKu/SD5j6iePLU
	VyhA3JkqR+kl2mnQ4EI46/b5QpWwLQWqMoRVXf7k6iirLCvuJafFRbsKCm6MENM/
	CxNZvZv/Ot0pQKqKmE1pbJ0DkWxHCQch9o92BY2UeWRLmH5YGnzl1phJ3pTsG8RP
	3vUSpaX6cEE58NM1X6iHJoQUXwONTQw0+oi8HvZCV6Ib5zuE2uYXNWldyjdW9A/Z
	YlxaQzAG6JRYa4kDQZO1DeZJ2H6G9SoxG/1Fkz0UzbXXtXI/BxolFrFbtc23iYYF
	zbxrltrFBlS0D/fKdg0vRJjKpsqSxrMR/eQCVHNy3fnNpl/g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ytc8c8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 12:17:02 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8485b7e18b4so3521023b3a.1
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 05:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787228221; x=1787833021; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GeTpCMJLG00VDkgP1B7KDBKBv8+LJUVs4dqPY969ALM=;
        b=QGgJfV/nP8q7P0+cPReOU4KCJaV8iRMiTx447r5jGlocOfPhv7sqvqp/xJTWIaZ75g
         Jj+c0JRm5tQCzvxEhTyIVzPSqY4tdUnvp0bcvK7GB1rIviUINNeGiqnsu3gVKQiRWrlk
         nfkb/rmzWN7OLTpKj33LvuGVOzQtxxHZMvjTHZo5yZRV/CpS+DOhaZntyAJaW2OfGZ8u
         gyp40e1T0N0RbXl/IRc32BBuW63f61C0FzKOQUIRHi6oRXwSajTQKxhF7MDBO8hcAe3t
         rDPHa6p8s7jy5jYnAThed63qKyLTm7j7MavEpEfuPrSKr9MSh3xsxTl4BoeXsDiAvjrp
         dS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787228221; x=1787833021;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GeTpCMJLG00VDkgP1B7KDBKBv8+LJUVs4dqPY969ALM=;
        b=PoEfhb2/CVPdFdF0EA46w2XqOle0YxwXXe24LrNb6RUWXeAVwLjMEAiN+lqU50965K
         vxKsj4uOs4lc/BtmtrdNre6Fkq77E6zzoDbBhRmMs6ZQ3lDqKZXGfSLNE5ip4wZB1UfS
         glO0B+F/iWHodQh1VJD02q2d827V5QOK2ymS/3bpqm7dK68yFsK1N9ZVUHOR3E+Ukwys
         tGjq+vjWbo8Yl+mo7ZZmCYkJ/c8Yb1V3nu77tNpppUI3xZ2vgrztcdNnU4OyYp9A289s
         D5gOyyAxI5t/0/ta9m6ZMo1qlfGhzELTNDtJoaR3Os2oGaGRNoQTG8MMDQ1A0qWSZ5rO
         Qa5Q==
X-Forwarded-Encrypted: i=1; AHgh+RowlUX/VcMHvuq+Lqv23Sxg7My+4BkT1RrvZsccA+sgq8f6whGS7y3ii3CebU+AJdi8Sk5SbCojHMW8@vger.kernel.org
X-Gm-Message-State: AOJu0YxQYC4q/avU/rCe4m3iOxTE9Bi4o5aPXIG4PHcd5hMi4/GXCu16
	nAZx7C3EFy1r6siaMRBsC8p6QOPDnzaVl5xRUvrLn3egvpcITvWwgXZcqJK0nQXSo+qELh4zYzE
	UHy/wBgCJQN7YPE23WaL0k6F+du0zTFPBsP+0zn3FU8WL10q5vcy1Q0P+pJk21+NI
X-Gm-Gg: AR+sD12zUlo4rEKh8gNZnD6jMeltS/aYAicgOjoBvmemumZ0UUXapP2mGhu/ybx1Xvu
	Q/zKQXvQN+xgMrznMVqEUw9dbe9PrDVbYyeOt9zLyAmI4SbLlAJI2VwqrDS244wMfKMSFiFuscc
	q9C9zS8ksCn1Qft7zKD1JhthQiA9o9y2hqjxcGFAVer9EO+s+mAeDRG0nNEvFl+hoBABGWesDgw
	AmWq51FIKLoaGugZnlFkV6zIi3sMp1EjRcyZljJorhx5hM9+Wygsp0/bsHry8bYinyg9oMwDqNp
	R4r2e4EMAK8QzR2l3CJfAMF7kiHMJ10Hq88RtZzjq+q207xhazrkkCnkNMeQsEI/6bBjp+RAA7q
	0HaktD67wJ6Kq9M45MC3Lni6pxebfjqPh
X-Received: by 2002:a05:6a00:a20b:b0:84f:d7e4:3404 with SMTP id d2e1a72fcca58-851d3911ffamr20757191b3a.11.1787228221433;
        Thu, 20 Aug 2026 05:17:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:a20b:b0:84f:d7e4:3404 with SMTP id d2e1a72fcca58-851d3911ffamr20757079b3a.11.1787228220896;
        Thu, 20 Aug 2026 05:17:00 -0700 (PDT)
Received: from hu-afaisal-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3617553sm1569156b3a.37.2026.08.20.05.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:17:00 -0700 (PDT)
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 17:46:56 +0530
Subject: [PATCH v3] arm64: dts: qcom: shikra: Enable dTPM on EVK boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-shikra_dtpm-v3-1-93cdd4f3e8dc@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADfwhmoC/33MTQ6CMBCG4auQri0pQ6mFlfcwxtAfZaJQbLHRE
 O5uYU3cTPJO8j0zCdajDaTJZuJtxIBuSFEeMqK7drhbiiY1AQaCSWA0dPjw7dVMY09BaV5zY8S
 xEiQtRm9v+Nm08yV1h2Fy/rvhsVi/+04saEE5M7VQEkqp1MmFkL/e7VO7vs/TISsX4Q8BiVBai
 FpWgltT7RDLsvwATC15AfAAAAA=
X-Change-ID: 20260820-shikra_dtpm-2bc494dd6756
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787228216; l=3364;
 i=khalid.ansari@oss.qualcomm.com; s=20251105; h=from:subject:message-id;
 bh=IfLSZs7XgelF0/NJACD1cJ8p3CERDYHl7sB4IP9i4xI=;
 b=WllPVCxXfaqNnEYfmXmZ3rDmPOgKufOXVN4QkZC1oitLKdUio8zxB5ZEeMm2/uJdvAGfZhSeo
 kAH6jrNs19fBSN9aUUH+H/clCACYvulZYJnbzygkOnLfeQ0jMSmj9ml
X-Developer-Key: i=khalid.ansari@oss.qualcomm.com; a=ed25519;
 pk=eBXrIUgTWV0cgG+GsNeZPPgvj1Tm6g9L2sfcoxMGrKo=
X-Authority-Analysis: v=2.4 cv=OqZ/DS/t c=1 sm=1 tr=0 ts=6a86f03e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YEDllJBE2-mRQRuHxjUA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA5MSBTYWx0ZWRfX33Dja2LwZibv
 bbSo0NzRMSL1E2KiMwffoMZ0TAXYteiFva9brQCQCj2v0BJTFGjhNMrSWZqESYPX6szndcGSz/q
 /b45pdwujJ/h3LIesYN+WntKS0Zu6PD/4CUMKqFI/S0HrPVSDV+tjO81eUKv3IYVD6kGNVADkwx
 L4vYFYRkyZcfPD8q74JRrB3JKPRqzYYtmMy1HUZGmpe9MUz9xCFcUcrY4CR7oSprZ2JOILUlMvh
 /6jLZ9lsU5eoUsGP4cxk+1QGNNApRgosyWUYtniyA7dN3A8jjHu59ZT45ZDyHY4PNBa+4s0PbWW
 h3kf1nsihcW79eWEaKQILHQGMMDQyaCeO3Cg6cee9v22eAqrhOZfKdNEkq1xlt4/kxxVoMcped9
 +eglS7zy5vuZLOevG4HMcKBTQ3EqU5++0H3LwUmDSvkT9jphUQ+vXB0zAbG41p50a5wkwSGOczs
 ELwNKed6QpY2yEe5Lpw==
X-Proofpoint-ORIG-GUID: oA8SezzRDoBhk_Gjy16zC2wapyQRhxWg
X-Proofpoint-GUID: oA8SezzRDoBhk_Gjy16zC2wapyQRhxWg
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA5MSBTYWx0ZWRfXyy3IDDX2QnhR
 v3fYqB+tz/xkeElEYyJRRHWV+pDDegdQ+iEX7pCuMIZvnr2TYBlAcMhmxaVQJ6/QY+r+o3sN/NG
 LASyluBC9ibxibkpxgM6/x8CcUmd+Zo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200091

The Shikra EVK boards (CQM, CQS, IQS) carry an ST33 discrete TPM
connected via SPI5. Enable the SPI controller and add the TPM node
with the ST33HTPM compatible and a 20 MHz max clock.

The TPM node is kept per-board as the dTPM hardware may not be present
on all future Shikra EVK variants.

This change requires SPI5 to be enabled in shikra-evk.dtsi [1].

[1] https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
---
The Shikra EVK boards (CQM, CQS, IQS) have an ST33 discrete TPM (dTPM)
connected over SPI5. Enable the SPI controller and add the TPM node for
all three board variants.

The TPM node is kept per-board as the dTPM hardware may not be present
on all future Shikra EVK variants. The SPI5 prerequisite is owned by a
separate team and cannot be bundled into this series [1].

[1] https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
---
Changes in v3:
- Added Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
- Clarified per-board placement: dTPM may not be present on all future
  Shikra EVK variants; SPI5 prerequisite is from a separate team
- Link to v2: https://lore.kernel.org/r/20260820-shikra_dtpm-v2-1-bc6698564ed5@oss.qualcomm.com

Changes in v2:
- Dropped invalid Depends-on: tag; replaced with inline [1] reference
- Link to v1: https://lore.kernel.org/r/20260820-shikra_dtpm-v1-1-40d96b8238bb@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 10 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 10 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 10 ++++++++++
 3 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index b112b21b1d79..32916e9df9d3 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -57,3 +57,13 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&spi5 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index e62ba5aef71f..bacdc7c77c2f 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -57,3 +57,13 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&spi5 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 727809430fd1..b42f94708bfd 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -57,3 +57,13 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&spi5 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};

---
base-commit: a4ff2be345d0abc943da8dd8da98151843b750dc
change-id: 20260820-shikra_dtpm-2bc494dd6756

Best regards,
-- 
Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>

