Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EBA3E0090
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 16:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778860905; cv=none; b=nji7eX1o16WrhMBi26Yri8Gtk8vLpI2kc764Kqgw95QHCUklkigHozgj7ZJVrT8Wpb9Exm8kAcMynEFRcPaZbIa4qEewprLv/MSuPtoBiNMoAL1ck4YmZ3ODHXd1BafQockLrzHGzsktdMt2QHuHP3onlkiHcbk3i2K471OQ9bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778860905; c=relaxed/simple;
	bh=CIm5gXzb2skW9QjvKlxQ7m0BVXXW1t3N5R8DqW8dTek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ypqy3QTvmq8QHMcaDNk3Fx81m4GjTPUxn5Sx3bOsLjM28n8lT6qebomfOVvSOgdnjaQzAuyA4uglNbsM1QXXXJNfW2zM4OfP8aNxpXqtO/jhEFQbVJLKM/pNZRZlvlcKhbpGD82zQBm5YtBGjK3UlWfblAFo0RNbN/sAXAK/pRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A8z7y96e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QE23/5GO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A8z7y96e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QE23/5GO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAtiAR3670929
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 16:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ps1K4Vop1/6bXHDrnKIgQxIG66H4m58UWsrlV2Ynf9c=; b=A8z7y96eDfADXV25
	iScircyWZmnyPITN9SzcNpiUdgv37THL7sxyYQdIM+5xd28iPMrIUEITIckP83E6
	MH4q0DKeZt5S7bIog7Cj9FGRpnZZOncK2HBjznYDn4igDDBg4UxTOnCB/TbjJd/c
	mLmjY4T+m7TI9nZmPfcoj+U88pz6TRdQUk8vvHr4gd+Yz5K6NW+b/4GUTaySf+cf
	EpQBaCRrQaiiyR2motJx0e8H97jbOBNjZKd22yBbqKO70U5NX6gwMZaRzAQ48nLi
	XbTjTVidZGL8sEj5g5V//QzJ0SI+wf09ylSX6T1682bCPBuQoB9WIRebxPHW+V8R
	pVXCZQ==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s3ynj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 16:01:43 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-43a40a095c7so2265841fac.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778860902; x=1779465702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ps1K4Vop1/6bXHDrnKIgQxIG66H4m58UWsrlV2Ynf9c=;
        b=QE23/5GOMcwuI7lM8BYOmHX8C6ffU4Qsu6ER2lAXWwC+uieY4FB1ryc1BSeSDnadgm
         8gigIP+pX4YvMKrWl8qxZrNa9NcRfC1SvklYebp2Tip6cMm85VEwwtyI8DkS30xGkDjE
         oxLHfOo/kTgZVCzWK/pce8v0kVTePtjh9k9W/GzJsejhMdqrqJj7Uv5L3h/eGSLn+w5B
         igD0EQ3c9ExPgA4YzWCzkNMofiVSmyA0qszpn8woswmH7FQbY6BrTq64GX/T9qsX+WJV
         Hg+mA+bfGJjdOO2eh3P03E4diLOzx9wQRVGXdgElEe13EalP+VviWjWc7MygcJh0oDPY
         +0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778860902; x=1779465702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ps1K4Vop1/6bXHDrnKIgQxIG66H4m58UWsrlV2Ynf9c=;
        b=sPxfrZU0HQqTNUBVWuq+pufhiaNxp4M3KlKNa/bVousQFZQVFRCj7ZQKoU6Xo9WSyr
         /heW32HmHoz2WCHbDSLIARof2ZhiwdvfQFe9iZ0Igs93JYnkU6PDDihZ3z0lCRFUE8wR
         qdTVgEptXW0dAo5I1L6UCgMcXO23/xhUmi+3DFzpC3w1gi1UoMf8J3C7Uns8yEnHpAzA
         eiDW5UUCVuwMs4Bd8ZesmH7OLIQjfyZGO44lIMuIfLYMIQV68lSlFYp2aLKt8DZxVWp5
         /AFiS0y0e04rcLc4kKyR1iG+B8bljgQOl47Xa6YpAzbGJfC9zopBeFjZ8xmQ923X9W4v
         ecjQ==
X-Forwarded-Encrypted: i=1; AFNElJ+B2INsk2z5So19mhFS1JRlOEYZXVIQ78Tdkg+oEuuO557vBIpFeO0pGbFgdpdwg1uBkfHXzyEs8p7b@vger.kernel.org
X-Gm-Message-State: AOJu0YxlmsJW4LuqvDmkGlX0B2VsQNogrWh/MGXbjRsaTSPLRZXiSi1m
	uSK8L6p0IHi7lPdkU27+ok1E6OANGk9/2WA19/fCAmUJitphOOx3qCp5oM9fyPCs2hdWBHcwo9C
	m9oKzJRnBijUnG0QrvhfdahZ6MaELlAOGM+XuUoyNmBfRLl+kF4AlPPtPq8yhaBgg
X-Gm-Gg: Acq92OHE+Bxv0YcEkWvQYtQJCHE2nz69bYu7UWUlDSynVEEdHsX6LdBKc7DrQPLPCwr
	MwQwNHAfy7SgG/Nv7eCWLQWBV4NXX6T9bg3q2X5MxKket975D6LTLnA6l4oSEaHBS++Mm0CKQdV
	1FLPzDJFfIaMx+AWQ5PFPm2vZsnTAV/RM7yushh00LdDa3EOxhqT6RGW94dCCiRpYzMh1ERJMm4
	eMFAmGJy/R/JxUyiDyfGXQ8i+Y9gUddiZjKdCHCpHDCFCXQ76BgQ6vGUcPkhC4tB1xhOVlkemaz
	nWhYxppqe8Ex3NpXes6lb9Zxna6YYyGrhexqPzuTGkxwpwl8MN64jaeFaHw88XyDN+XxjG0fzNZ
	DQ2wMFcIvFvJy68ZKwLxlvb+VxmPG0sQTBaRzo5s=
X-Received: by 2002:a05:6820:4a01:b0:694:99de:9989 with SMTP id 006d021491bc7-69b884ac95dmr4425146eaf.32.1778860902422;
        Fri, 15 May 2026 09:01:42 -0700 (PDT)
X-Received: by 2002:a05:6820:4a01:b0:694:99de:9989 with SMTP id 006d021491bc7-69b884ac95dmr4424894eaf.32.1778860900284;
        Fri, 15 May 2026 09:01:40 -0700 (PDT)
Received: from hackbox.lan ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6449sm15135743f8f.37.2026.05.15.09.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 09:01:39 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 15 May 2026 19:01:12 +0300
Subject: [PATCH 2/2] arm64: dts: qcom: Add Eliza CQS EVK board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-eliza-dts-qcs-evk-v1-2-7169d78a33e1@oss.qualcomm.com>
References: <20260515-eliza-dts-qcs-evk-v1-0-7169d78a33e1@oss.qualcomm.com>
In-Reply-To: <20260515-eliza-dts-qcs-evk-v1-0-7169d78a33e1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2558;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=CIm5gXzb2skW9QjvKlxQ7m0BVXXW1t3N5R8DqW8dTek=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqB0NdaYdOMwLXGfPFbhKkba/JDdltxzOwi1eDX
 zk4NYo2ifWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagdDXQAKCRAbX0TJAJUV
 Vm+ZD/9xkcYA7v0mriyvCdXrkIQI8jpXTzpzrp16EH/rS9HSP9FEr9Lr2J58FcINOzJHmJtFmVm
 iRgMFQ7utgxz8SG5oyVjmlCnocuGSykbDaYBqSMouGYhyv8As2B8A4q66unUsQ891uSLywxMTYW
 DiEUYvv8Gm/rmWp6jESLHBxeZ26GkRrbUke2gGufhXLPNd5UVWKb0sT5dTgSPnN8FJNga71z2cD
 QKfe/rG8uhzkR6EVJvS/WiAJ+a/q4NuqGJtguWD89t42aC+iI2JyaG4XCtsY/MzyMfEYoq7ySB/
 oNAow/0+kiyoi2jO+oL0w2jzNiqoTPjpBPkqffdvjcUIPzfUm2d9GSgXUFy0LgYAd6zBnqe8onE
 EzccIE1q+J+E+XLVDyYQ6O8rI7povheLGg6q5Lkc5pkvF2PciJiVi2tR9qgWuNrWVpy83ujhdCt
 fHlOVlLAK4H9Lc0LzwafD+X1m3k5B4Fzqj1OM1idp15ytLDELRUpyGT9EIhzMccDqVJRo7NpqHl
 g3pXdjeFNKqSyqvX0fETlTRCDycqjnSN+XUlDLpvmAhaIlAUQL9McFVwlvXug7fbBThqIi5ZLF3
 JYr8E7ACB7RU5SKyGkrRlXB2vaSkTEJjXjoEhWYBlp0FzNMt2tPBWS29Bfy2GC+dyrLV9uA9IQt
 ILPrBH8KYnDwYpg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE2NCBTYWx0ZWRfXzX0mX+9thUWe
 5QWcST60onATkTj6IrGxgTFXFOrQ91RJfCrsfhPOhSq9bODVOgsMbaIbFWTllxXc2EKG/pog8U/
 SPH2M8XwTM+tFrUd3a9Bv+0NumZJyedNp5nVSfDED9caFqWbNrh+Gi0eoWdCzxTaRsiDKxeh7wo
 1fz+7JvLmgtA5VjRABb2FSSsc7J3LQcB7hEUaKVNWRaKA3PYya/RVdq+NgjujUgAN50vEYiESLd
 cn9RmtQvk0yUKuK0gc6m0XGwcMzCgtdNhAnj/HsuOwu/GCmD8vvlVd7n7A+selOHFo4BZR8H+uO
 NZBzq0TMFq6lvKZ0sDApdqfWMN9LgGVxWnIjtdUzxGwDk5StHIJZzUgz9Y9YNv4dv2U5PLfwiIq
 1e7Ovkbgl3KT+o3CkZcXjzhAYNuA0S/MFvI25ihul+tILbpBn3et0+ljm+I3gLxOAtBfjTDlYX4
 Bo9zmAHdl/KgRyhkWqA==
X-Authority-Analysis: v=2.4 cv=Md5cfZ/f c=1 sm=1 tr=0 ts=6a074367 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=nfd1YeTbQLvsyS6wM0MA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-GUID: 6IMnXn9YrIDtkjCv6keCDvhs3FHvSYlU
X-Proofpoint-ORIG-GUID: 6IMnXn9YrIDtkjCv6keCDvhs3FHvSYlU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150164

The Eliza CQS EVK board combines the CQ7790S-based (Eliza) SoM with the
common Eliza EVK base board, which provides connectors for different
peripherals.

Add a common Eliza EVK dtsi for the base board bits that can be reused
alongside other Eliza SoM variants. Then, add the final Eliza CQS EVK dts,
including the CQS SoM and common EVK dtsi.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile          |  1 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts | 20 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi    | 20 ++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index cc42829f92eb..7b452ed4e2f3 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -14,6 +14,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
new file mode 100644
index 000000000000..fcf7d9232805
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "eliza-cqs-som.dtsi"
+#include "eliza-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Eliza CQS EVK";
+	compatible = "qcom,eliza-cqs-evk", "qcom,eliza";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
+			       <111 2>,  /* WCN UART1 */
+			       <118 1>;  /* NFC Secure I/O */
+};
diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
new file mode 100644
index 000000000000..e47b24f8b827
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/ {
+	aliases {
+		serial0 = &uart13;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart13 {
+	compatible = "qcom,geni-debug-uart";
+
+	status = "okay";
+};

-- 
2.54.0

