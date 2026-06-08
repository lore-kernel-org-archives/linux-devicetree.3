Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF1931F990
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 04:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780892232; cv=none; b=KFf2d4UHwUTkxARwoU0q2HPm6eo4na4RQTLL3MldqHYp7tvu1rJtekKZLV8MelN4yklj5yv8Z0v4PSFBSUzfDVIFdwdax8JmUQrNPYOl6xaNwbK5ZT6IQ0kipNELjLZt96qVYvR3PMtM9NhWKWuUWVFgjKnrPQeOnBkkCrRzU9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780892232; c=relaxed/simple;
	bh=GRIOiJQUe51hUrm6I0PO4qQaSoiSaOQxHQJG0J3XcOU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WbVUpHUSukNIL7ph7PXlaVhyM0VdBwS7rTSUnVs/4E7F7SiWlFi4wOWMLBFKvnOGSonUw2ThjvfI9ZwUkWI1jnJfv6cAdg4TxkibLjpnVLx6EQjg21gdMYGxUDU7vuqheLtdFOYTkS3d1lvmJENj6OqKlN41dpgwhbtZtBT9XPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I70W4owd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DjBBbVBi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I70W4owd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DjBBbVBi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580FQ8T2023492
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 04:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=D7J1z37mYf1
	RCx8HKQE7hAtdFkQc6VU7eOJptUt/pJE=; b=I70W4owdFdTL6F18sXhx5Bv8t29
	iyByATsfPrG/wifAuosB40OhcGHeALmxw3wz3nykjpThbT/+YkiIqTt6sKa1Q98w
	oouWGIsZU5kFxNzOJ21AQH5zjvxVLIyUlL1dPLC93Ok4Upe5nwhUKfrQ2+TIYxAa
	E0d+ZoA+FQzL5Kphb+EclRPdkXCYHxnPHpNx2y7t0fcSqAWIkAEi6AXjF2fpiDZH
	PNgJIck9oo52BsUuZ02Hkpv5csJ8vUGQa74f8X5oFPx9MhmS6n7g0/AdKY5PTjg2
	pecRpQvhcOa4vd4r8CL8j8EtkHR0ISAUHCVQwd6G0F2Gvppn1zZL5x4LRYw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrdtkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 04:17:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0a81c1738so24470865ad.2
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 21:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780892229; x=1781497029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7J1z37mYf1RCx8HKQE7hAtdFkQc6VU7eOJptUt/pJE=;
        b=DjBBbVBiapySy9E/1OFP0pvOaAIetNB+toPrYbkvmcdGFI6T7Ol8NamkURJduOcYBR
         v1ck8h/sCgrIJIgsgYgCf1KdAVB9FPARElMRC8UxifOg6AkkP3z9pqS1p3G1oBHZDBeb
         MPD+d0EU6zpeUffsyFGEDd8Pdvq4jCOyMeUUbN5Ywvlzzv59DnG5DDjNIKA4oSCMDUTJ
         J+vrKF6YtrESr5QWgcwu0QsiQ8+WiQMMwWmc28TPGuMNfoouHMX/NkLdL1xkMDU4zFA2
         /xgkjZKP3yWjpgBDlLH3AzJPhxch9SdPrvIo+YPfOLud/S+oc/NDRxzKw2BN5jPFMAbF
         KG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780892229; x=1781497029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D7J1z37mYf1RCx8HKQE7hAtdFkQc6VU7eOJptUt/pJE=;
        b=AR7Jm8hLGaLlupCoO5odg5yenREt46vIXRity9L7y8wtgryTRlY0D/kXcbUodJeIAq
         g5p5kI6CRV2IgLYinVXjepGu5b86iBhNbcRhjvSYKp74bEcmQ2/5lNPwG/is48VrBSbC
         1ZZ7fwvvVEg2+Z/+sul4o7qcUkWo7bL48/rI0Kpe6d8ceJ5INuIB7pKLgNksEJPvFk1o
         c6Jn9k4Pqy/GxdBR7zYzzv7o0qE6rKkscGtrernBwm/7jB1xXmv3Ii9rjbPnqm/K5LKD
         qGx3I0yG3UUD5Lpg+jXH+feOhbcmqeF8FAEimoDbMvsAVKsf0MXVptuLHeo6moCsfCGQ
         Iwvw==
X-Forwarded-Encrypted: i=1; AFNElJ992WZz1GEFfG8zKspXhofRpM6Tl+JuEZH+/O44/1yKRi4kKqpqtbj+NyUepuq+FH6DJBtroivt1yRf@vger.kernel.org
X-Gm-Message-State: AOJu0YzEjs3mK8cozKtpfZBvu4hg4sA1ptbncyA1CIjxeUhBskVuLGoO
	9exu+SWBIV4oQhx7XtS6GVg9rQvU6oWTk/P746tfWmOClt/9T9SRhwMr5lf06C58dQhrbmP5oVp
	fOMaS6QRKrMgJBPxLopZHEHEyA26nF0jSa5tS7asHetVuRlWOzYG1Kqg6QY/KL+ep
X-Gm-Gg: Acq92OFpwo/ixN5vv59R/JUgNUvm/EH15xFpqz35OTmwegC/krk8AaRgTgICX5sHDsT
	Cg6Gf3R6oe//3vwkX1zO5aJ5NUzQh6WjMTWIUUTATm4w/2Fy9qnbpmRRV5hJdMccv5B20qSbY6z
	Ox7JvTi2KmYFuUWFciUa8rTycYydPfKSZjVCLqtmxF4y658SckBR772WELmznu/VMeW9u2aA9sh
	TbRcDc7HddGK5al8NsV8c0SmDVd6xYQe8ua7nw0kIgy5wuPuOdWDNa1Vn1tx8Cu36Ak+E2DVtXT
	JH65SyEXWsGY4JoCcezWK79bQqpfS0HizfFSwIwqqas39DfEWX7dc67Jyly2olJ7IvhmrqZld8y
	S2FUps+DLpECX9H5Fqc/RoNsPH5LY6xTVllGjp6jWXzek57itfEQwgV88oeYK3Fs=
X-Received: by 2002:a17:903:1252:b0:2c0:c625:4010 with SMTP id d9443c01a7336-2c1e8102377mr151042705ad.32.1780892229332;
        Sun, 07 Jun 2026 21:17:09 -0700 (PDT)
X-Received: by 2002:a17:903:1252:b0:2c0:c625:4010 with SMTP id d9443c01a7336-2c1e8102377mr151042165ad.32.1780892228841;
        Sun, 07 Jun 2026 21:17:08 -0700 (PDT)
Received: from hu-neersoni-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649fcdfsm209392525ad.78.2026.06.07.21.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 21:17:08 -0700 (PDT)
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
To: ulf.hansson@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, neeraj.soni@oss.qualcomm.com,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH v7 3/3] arm64: dts: qcom: monaco: enable the inline crypto engine for SDHC
Date: Mon,  8 Jun 2026 09:46:50 +0530
Message-Id: <20260608041650.541502-4-neeraj.soni@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608041650.541502-1-neeraj.soni@oss.qualcomm.com>
References: <20260608041650.541502-1-neeraj.soni@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAzNCBTYWx0ZWRfX1axeDN1HA2wt
 grZNMiTVpl+Bb8ndddJaIQkZsgeMEsBAaqRTEAfnrSwOoKbv2O4+4QabDUSz8ybzUXtoPkAhP2g
 Ab63/AA1ab+0lcw18OqENsDG+PXOfy7FFXuJNwnEiMFAvL5JTRAuL3UDh9RDxlqlr07CpJJLTON
 eKUusN3EJTi33bpdVpyEYMAEUsbF9QvHxrZob9FbtCX3uyJCGYWaC3JGCrhq9WzRisvT2gGXgwf
 zqQ0GBDUc5MPGQwh6eROiFNTTiEdeq1bBmCjv8njZf9tlUfZrCOxXhOF6xLFrAJ1CvR0225pGUS
 uPC1JmUO2fvdNXt5YNwXzZXYl1L/N1harFiGDRD7MaXYq7wojOam7DkArit5IRfnHWgJ7fSapLx
 TFJWk9J13SfFWURRjsqiHlj7aUaNUE5DLirS8We5SOm64rS//wLm1eoB7uAQrJ/9X60Ht6JyiK7
 1pMbF1JfTSNvAyQcoAg==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a264246 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fZTdKWQFAU_LetDfPdsA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: fdu2T9QqAwzBBnlp8N-_9-yoy5Utprne
X-Proofpoint-ORIG-GUID: fdu2T9QqAwzBBnlp8N-_9-yoy5Utprne
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080034

Add an ICE node to monaco SoC description and enable it by adding a
phandle to the SDHC node.

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20260310113557.348502-4-neeraj.soni@oss.qualcomm.com
Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index e4c8466f941b..06ed34dfe135 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -4835,6 +4835,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			supports-cqe;
 			dma-coherent;
 
+			qcom,ice = <&sdhc_ice>;
+
 			mmc-ddr-1_8v;
 			mmc-hs200-1_8v;
 			mmc-hs400-1_8v;
@@ -4867,6 +4869,13 @@ opp-384000000 {
 			};
 		};
 
+		sdhc_ice: crypto@87c8000 {
+			compatible = "qcom,qcs8300-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x087c8000 0x0 0x18000>;
+			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>;
+		};
+
 		usb_1_hsphy: phy@8904000 {
 			compatible = "qcom,qcs8300-usb-hs-phy",
 				     "qcom,usb-snps-hs-7nm-phy";
-- 
2.34.1

