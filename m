Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5151442388
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789805; cv=none; b=IuX5wr39lbLpX7GoUG6+p3s9P5YFOK0jjmG+T7uflmXRo5GH9uJ1VJoPfp5yg68qhIpbijEmMoSSOJ88hBLJHtlZGVTHKCBPMAYkemOVO56DfmIZD9hxn/QFmrFG97/jVqwP5YRFProRo7hJY3JK6GjGMEBS8ah54n1q1XComow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789805; c=relaxed/simple;
	bh=FOch9b7+w5KNwJ642MAwVqCdr8QNGw05Updh5FF0AvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=knOVw5f7ei7kx0Qr57RJD9VUjYJv5QU5fn8YVOxe1OGqFyji/85Mi+FA7TqI+LesX6ySDjN+J07DdOHZgio4DUO6IXiC4jsiSoEoaA+60R2Hcdy9RFTwB4HvZV3opMD/qAphm2sdz9WEJ828bL2In2d5uETXRw37OEEsMOhi+N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ypt9RBAh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kpFjsqv4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ypt9RBAh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kpFjsqv4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55lvE1856985
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:23:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fHR2axNXIQFsXfSKOD8UvVz6O5+e53z3FnNarxH13PU=; b=Ypt9RBAhJtUZdcq2
	3a4UMj6n5Xg84XKE86UEJmzMX3ykeYUi4zgkZV5UStYcyLH4RJOWVFkA0Nni6uWz
	oymGL+OXem244xjHjzS3yB7cxlQ/LuDZ1pOnwwaj9ywk3adGFRzqgopTvNTAUwrk
	PgZ2lmTB6C60pnRNUBqSuKidWUQItBBvM1c0cUPUDsIVlKgI0WET7Psu5274sY4Z
	QBDemauwCWXoAKJrctZwJexontVMKLVgGQXigeyaFBzG66ryRAdkavVPSSr3dmKw
	Taf++1YJLArI9c/nqFvmsdCRoVc2zrz3xU1M4NTiBGCtmlJUlmt5R1oMmlNe7YLZ
	MHZ4ew==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cxxnf82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:23:22 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-147be78cd56so7241741c88.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 00:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791789802; x=1792394602; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fHR2axNXIQFsXfSKOD8UvVz6O5+e53z3FnNarxH13PU=;
        b=kpFjsqv4f4p0Yx9N0HQh/QXP0Tj6MbwTstoapkFemkO1Xc2fu9WbyszU4RRuCIn4lT
         0SvYKcg/saZJmdEIGmKC1xV9UXzmm0IvznvX9hxpSyPDQa5jbc7xdddxuoETKsQi8fq4
         iGtdQC1hh2bnSRfqFYqLMUT9XY8MjhRWxnTv6zNj3INJstJzb9p6FWls+57G/EO5wOIf
         h59572zz7XFKaNJpi8+NfBV7oVfx5reTvQ1inLSwVzqiWjdjsvlgU+GZTfbmQ6HSzdYb
         HY7O/uWJxZAS3Yff946HHqxPmitBeE7qj85cCeJJEn8ASgyvMNPG29yvoQYB95cV035x
         cU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789802; x=1792394602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fHR2axNXIQFsXfSKOD8UvVz6O5+e53z3FnNarxH13PU=;
        b=f/CFE+S1Mth0s2/KL3RpSawh0Cj7LldzZZR99jXLsWoBZJEFpmcESNXNSizbLE7mgA
         9cWM9HcF8F5o9PN2r51iBx43vtZnINNAWIsV74KGDtF0bGELDLQ0zTIRKI8tFE0BEzVA
         kHMcfFNLq3MuK6WbxMpHPTnqNy/PAGXN8GW0TvRLE/0G5zu2hPw/B1P1DMOYS7rSa+iU
         PDkuSyStKiBEbH4IKgti/b40OhkRNxoP9J/kA5h5YEH8WIyBi4XZ4hA9ZAVx26Op0J2u
         H48+tEoHxl3LqRZu+26as3xrMzOzb3sE/tqIg/NwfjIQ/51H/y8fkK4U9stiBEzNZPs9
         ebJQ==
X-Forwarded-Encrypted: i=1; AKwUvByGe4zAcBztOoQQZUmuObD6d8aaO5BxCcllcPtPL74VxhO7lwfX8ozhyjUZBZ7fYTv2OxDaPxHLBW0z@vger.kernel.org
X-Gm-Message-State: AFq9FYKZMkEk95L6AsAgzUB3Rw+JV2skt++oECbw+c4sK+diP7hKnW0V
	HnKy3cSR5ln4dRbrTGmYPdoyVAW+TKPa3PnHqJ2Kw2lt3jQctyqdSsqenjgmwwlRNkCmOG/dHC7
	JUIiU5diOAkfU2Tyz1g2C/hQ04fbQXbdF0oiKWrufzaq6rwYUyJIGZlK8Qcve8/1a
X-Gm-Gg: AYBFou0P6gs1JwtgJdX2HWCkZFnN7qQC9G1nDJYzhkLgaCXtEtYYcO567RvFYfbdQdB
	6HSqy4TOJOue7oobl+Jday1FfKbfd/xt8jZJemiXPaGHQLQiyaFJbQwUkyEQ2U1BTvu+CXffk6H
	QMagmeOX4iOiHAcDholbAc9Nzj2Z/Z51pH2uhpgNwwdk+zvLsyZEt2Pjoat8+dzQdAKUZ/I++2M
	dJ8NfoaObkzgA0aHOXAd6tzc/wZ0kg6jq0drh5whBat/QsDi6e1pX4/2FgQR6A2n32KWUVjvt1l
	CMtOsaiZBZBzg9vyUYJuodod7oKxTiDs9s80OUeMxbin/eQLnOeurlruA9c7s27T9v5jqxKipaH
	T62yiVWodbhy+4HTZ+Sek6HiSY2joAayBwvYZ6z9s5LkylYFpjjtuygSmhGklPF1NeyyGQq/6lW
	ZXINLN669awAOBza1o3HcjxRFzelfr
X-Received: by 2002:a05:701b:291b:b0:14c:aaa0:941c with SMTP id a92af1059eb24-16a64ba421cmr11652157c88.35.1791789801450;
        Mon, 12 Oct 2026 00:23:21 -0700 (PDT)
X-Received: by 2002:a05:701b:291b:b0:14c:aaa0:941c with SMTP id a92af1059eb24-16a64ba421cmr11652127c88.35.1791789800794;
        Mon, 12 Oct 2026 00:23:20 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm29748733c88.5.2026.10.12.00.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:23:20 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 12:53:03 +0530
Subject: [PATCH v7 03/11] arm64: dts: qcom: ipq5210: Introduce RDP504 NAND
 variant DT file
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-08-dts-v7-3-77bd3d68d850@oss.qualcomm.com>
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: oKtiMVRzOkxDYs7uXTF4AkBb3IpkVkU4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX72+4tNwbq/io
 q/Of0lITH7NpK0j3bgc7faiZUebU1DeNFZE5tfUJv7gRSngu1Lj+uvOJcKtuRH26BMtHPpDKaMY
 7TCKDfqzWaX2U/Op4NRItHR9Hx1gvr4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX8j7wP/yaHrEr
 oekAv46rXArYJKmf+IdBhLttYIIbJ2FZLsWOZ/dCTiWPWUV3m3WgjeHvFe3eY+ZjHqFN2XeXUyu
 6hc7gMb1z7q1RFZ/m4FZbiN7Fg5xewWVHdwgAvqCPvudIWGm55eihTKIV3i9ah/D6SaPd0oXPMX
 JGOjZX2H6okjMnxO2FnzLdTOuHbtAdir0H0Ac4lPW77amk67XMWxzq8WF4N+3BBjFNKdgkIckcV
 NApQhx+NrOFLfaijFy/tmzPVDEaLDcRv2zLnIJFRhsXRPrtZZSosPAL2vW6qCdzzpiGjihiHuKN
 5t8+1DwOeGAPheNrWKrN0Dt4M1DoQRL3zoNg6N3LGJjTT1zQKpz84l33drDzKEDnOi4G1VFNJwn
 a4naMd0OMBgdheDqs4faBTe/3zFl6VkhJ+og8FyQkrF2gHk+GFCq70bIcTJL4+wOFxNTM4JOImL
 KEGt8o6nIF1f7HPG1lw==
X-Authority-Analysis: v=2.4 cv=AsJ7T+9P c=1 sm=1 tr=0 ts=6acc8aea cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=vH_i_heqKRWij10IjioA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: oKtiMVRzOkxDYs7uXTF4AkBb3IpkVkU4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120029

Add a DT file for the RDP504 NAND variant and include it in the Makefile.
Enable QPIC NAND for the variant, and enable quad mode for it.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                   |  2 +-
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi |  2 ++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts    | 17 +++++++++++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..94ab6355176f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -32,7 +32,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-lenovo-ideacentre-mini-01q8x10.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hawi-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb ipq5210-rdp504-nand.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp442.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp468.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index 30c8560822b5..67f62c1acddb 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -91,6 +91,8 @@ flash@0 {
 		nand-ecc-engine = <&qpic_nand>;
 		nand-ecc-strength = <4>;
 		nand-ecc-step-size = <512>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts
new file mode 100644
index 000000000000..1145fcf0a302
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "ipq5210-rdp504-common.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ5210 RDP504 (NAND)";
+	compatible = "qcom,ipq5210-rdp504", "qcom,ipq5210";
+};
+
+&qpic_nand {
+	status = "okay";
+};

-- 
2.34.1

