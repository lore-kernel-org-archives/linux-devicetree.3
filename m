Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594874;
	b=gDCw6TkdzalUA8MERyW9l+UP/AOZ5YvxSlNeFJ9upjsOnVmjewbpbJEZmIqxVLxH570C
	 JZ5ppIFS9yoWrTkc2tstBxchtpkrDyOPla2JrHCgvt6Jh2Pn/y4l5yJ3tgEImXJc5vuw2
	 NOX/r25AZ8eTo+CdVTs95H+WzcKIuGOjwyq3pzxTy7/svswh0EtVaMA0dFb9dZBB1Ptwq
	 geJRlmIGwHxWV0oly8an0csFUwrbr6yH7uOyT0rWcd/MigUqyqYOsB3Dnzv+yNSx+M1Z7
	 aJftWgB0gtAc6+LMg9DUT2ywrPgWWk/zSQtL03lr1AgXriRqHjHXtcpZguDbt9HABjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594874;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9YX/v4KdXjYZAmZtmxLqFGtH9rrK2M2eIocX0pxXwag=;
	b=d1S1CYAEowiUkvVM7wCyl82/KA2/PUDZsXu+KlI8ul7BYdMfAc0dBFbXzWkQI4IevDNl
	 jCE/NE02bTvtQnoea96Wzin6gmBWg8pH7I7ABFWI1+wl+pcZXNyS+S/MydgATntnDlJ9m
	 AfewCdW3eJpKFPkxUikAybCaGc0yc7BuAZLHuDekwXhns/Y8cjvUmPb1KrpBu85aQCR+T
	 jI+0V3nOHw481+9+FqL0C4iZhsH/Ejme8ksZGyRdUEYq3ikYNYC0uHT+PuVY5JzbJ14JP
	 sogRzUFZFV30ZpkQv8DxJmXupxK86iKoQS3JfN3XvC26t2r8UK2dmGX5qsB5FjmsRtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jhadZxEY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LM8ULXLg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AF3606A330
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50AF3606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jhadZxEY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LM8ULXLg
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68g4X300167
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9YX/v4KdXjY
	ZAmZtmxLqFGtH9rrK2M2eIocX0pxXwag=; b=jhadZxEYV5CI5SSNpOiSzAglWkt
	k6r+va+QbFtvudZ4jbDFQzErTX+DemKvZoV9CdAMYepUDrclUwECiU2JSLmyPLzW
	mjoCJwsJHcIQfMcX0svpRWDHklXdwIfUNDocNcnKTUgiRZy21e2YrvfWT3jwp/PK
	lBFuCrDfl07SDEMNnHHkewX89UKfvEyzZFRkQ28Aow4hXmvIJ4bIzEyuYCetHkG+
	KTwYRB1aFNykjUKwm/MKklUL8nvGN1ba+hA7AuI9DqJRUeooiSCX5emPc6oxFdw3
	5MG4ObHz1b+Lw7sSgQH3gmiz4PLzPoHdagE+9fCSjGiw50lUGh7wQPKigSg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rsjpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:21:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2efe8f2bdc0so43839955ad.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795594873; x=1796199673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9YX/v4KdXjYZAmZtmxLqFGtH9rrK2M2eIocX0pxXwag=;
        b=LM8ULXLgAq+/urlUzCvyZ2yXuScxbIImKze0fNmrAnkyBOOorfZpvL+OZACOICRLiL
         S16yMk1H1wQs1hfb66VrjsdAzE171R1nVeShsfT1ZIGGzjjP84n4h3QGU2+lBvIXp7Hh
         exTrV8YeZf1gRxBgo0Zy3RyWa+foKFJOVF6DBhGy0ss3JPdyKGkHIk6XMAW7YkWZqDxe
         iSUyKETDcNjTQb/lspBacaSn2uFzuoOtjpOmAoZ17iuZ8QBAurHr7piT0PxpGmXvqczw
         xjp4c65JpYKT6iS4k4xlCcNKWJkXug5s4XmKwdGVpz6uoijFx+lqkbavlrcIxwfsrTnc
         74FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594873; x=1796199673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9YX/v4KdXjYZAmZtmxLqFGtH9rrK2M2eIocX0pxXwag=;
        b=EeJhMo+P/gVxuJTnedMY7v8ssvGo3gIJOxzzd1g9w7ktf0CaJDlr7CMJd4Tz1Yo1H5
         klTOdWZqwdjK92SpZdZTd/kMkCwIpivpS/IG9oQa5eHTqD+oA2UqoulzvfsiEQ9Hd7Ts
         vIKjShe7YTiJeKdrE7/jb2q4GQ1TOAZdE8vZ0HCnMJbowPT22eDPJzOptpfCZt1GV7Lx
         MFuwa5Htb8EJsJIsKIGWAC6m8+uCmez1gp1HU7UT3tEanSI7mhO7qZRThJJHfJyvLYS3
         8TCxOMVmNUBAP1vTIlM2+ll4WFBCd68Sxqk3muStpl8EpKlJmxI3aSrA3xiXnVAP+APv
         k23w==
X-Forwarded-Encrypted: i=1; AL+hErGg3Cdd8Sqq3bo0Wk4y1OzEz0jS+h8hvdXyasyrblPjGj/rJwLQwD9JkrqvSAQ9IV8Qvq8TtQTfjGby@vger.kernel.org
X-Gm-Message-State: APuU4Z+USDTpStc/JE/l18gPf7w9iy2MmRgFDNsacoDBws1tbg/+thPY
	SW8cnczIOUb6NR2yNUCLYe91ghkinxgc4Uypg7Czr/GTA18tQpGSVKRJlt+dRrR5XpYVwcXN6I8
	9APmJ/AhkvX7w5PSMlT/qNWXS+bccrCWKVO1IgajODV2gLxuIbLzuzphZtd5i5TnVsfWRFyIP
X-Gm-Gg: AZFdTZeE96s8nAzykxBerrAR7iO4aAUxz8XDhQeKN5x5GM/kaDeMTu79FSwL4vaM4kZ
	pYPVO1yl40EEcF0LSvWOMoivA5vc6yoEavDlNAyh/WXHgtYYKKJuhhU//vOY6HAzekMjWHclp2s
	tUgslXjESR0+34uOb7q0glxYaTH5VQZP9ZP3nv58VFuPxNh/MBD3bmq+5lLM2yl8ihji5X0peoP
	aLsMg8e5RZwJvF7mKd7bPS7NjibtX6FHF8EagatEB+af4KfFUUInUj7Gmjyv1zT+LVuM6wtTaD9
	eZX21BCf5/OKHNlyeJVpzH3mQOBeXtq91JN9KpcsRv7fpr9oBlVGKpnkd/LypVYuJ6Kh1fdGJZ4
	KDO3XhZ3+qPsGUhvLM7U/c5StRbir3HbXKJvb9NUm+UJWpAJ+3ahtdY6Hx4G1N1Nj2RJwugrFMz
	hCRFWZ3Lm9
X-Received: by 2002:a17:903:19d0:b0:2eb:3522:99f9 with SMTP id d9443c01a7336-2f03f15664cmr225685055ad.17.1795594872631;
        Wed, 25 Nov 2026 00:21:12 -0800 (PST)
X-Received: by 2002:a17:903:19d0:b0:2eb:3522:99f9 with SMTP id d9443c01a7336-2f03f15664cmr225684625ad.17.1795594872169;
        Wed, 25 Nov 2026 00:21:12 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0457fd68dsm73135825ad.39.2026.11.25.00.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:21:11 -0800 (PST)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        shiraz.hashim@oss.qualcomm.com, monish.chunara@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V2 1/3] arm64: dts: qcom: lemans-evk: Move SD card support to overlay
Date: Wed, 25 Nov 2026 13:50:53 +0530
Message-Id: <20261125082055.488583-2-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125082055.488583-1-monish.chunara@oss.qualcomm.com>
References: <20261125082055.488583-1-monish.chunara@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfX9Z1T+QkW6SX/
 7lQl9W5oz1o/Rodus/je0MiSWhA+FH/l+tPQuLLM71lY8bTRGIA9Ec7Mea7h3dL+I/RYHFEppa/
 Oqj1bBgayCO8wLTtDms72AmEAQxD3wun6u5k5b3A91P0Lpsl22yYalRNlIdhgnwuPF9kG0BLg9D
 AKyh7iLvGVdgftOcNJdSv5X1p+6K6oSrATSCUWhPVmd91gEH63LmhFJamB2V7tShDGyYuptC/4I
 zZt3Fvp76qNsWWD6nUeEfAGJoPCLVNWY2EyyBcQt8a74g1NGrsBK4+CeUDlbmHojX4YJcduMuG2
 /uGnuxJAO9oyx76OyBatZTn+mGpzTZxGhTIm1wZyvgDfyQ3ImyQdQM9LfCq5O2wi1H4wvS5mjQn
 22jBHv9ZdHq7sidpR+rx3+HQv8+R3WNw9+2zppq039Jks7Fyftem2vaSciBYQrhSLF3E0KBESVE
 aw6R/XPcEImszIrdbew==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b069a79 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=1d3nOwRa87lU75lj35AA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: rlvwBsDYNikwu1Vh7IUcYCX80I73UG8L
X-Proofpoint-ORIG-GUID: rlvwBsDYNikwu1Vh7IUcYCX80I73UG8L
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfX9BMQgKL+UTXk
 FMjPkHw/0vMqAhivS9Xp1+60kV2DrsZOvsSSPfbY0hax/TqRjbEm+IOUi67CaucHvrTf8pboYgi
 MpGDS+tErBYKeiVfuA3ZqWPnFnkCADY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250033

The lemans EVK board supports either eMMC or SD-card, but only one can
be active at a time.

Move the SDHC node for SD card into a dedicated device tree overlay.
This decoupling allows the storage medium to be selected dynamically by
applying the appropriate overlay for either SD card or eMMC support.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  3 +++
 .../boot/dts/qcom/lemans-evk-sd-card.dtso     | 25 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-evk.dts       | 16 ------------
 3 files changed, 28 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-sd-card.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 19310879349d..fb894ff002c6 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -67,6 +67,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-xiaomi-nezha-cn.dtb kaanapali-xiaomi-nezha-
 dtb-$(CONFIG_ARCH_QCOM)	+= kalambo-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
 
+lemans-evk-sd-card-dtbs := lemans-evk.dtb lemans-evk-sd-card.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += lemans-evk-sd-card.dtb
+
 lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
 lemans-evk-camera-dtbs	:= lemans-evk.dtb lemans-evk-camera.dtbo
 
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-sd-card.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-sd-card.dtso
new file mode 100644
index 000000000000..007ab6347349
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-sd-card.dtso
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&sdhc {
+	vmmc-supply = <&vmmc_sdc>;
+	vqmmc-supply = <&vreg_sdc>;
+
+	pinctrl-0 = <&sdc_default>, <&sd_cd>;
+	pinctrl-1 = <&sdc_sleep>, <&sd_cd>;
+	pinctrl-names = "default", "sleep";
+
+	bus-width = <4>;
+	cd-gpios = <&tlmm 36 GPIO_ACTIVE_LOW>;
+	no-mmc;
+	no-sdio;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 603a3fa18994..05a6e0c27538 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -962,22 +962,6 @@ &remoteproc_gpdsp1 {
 	status = "okay";
 };
 
-&sdhc {
-	vmmc-supply = <&vmmc_sdc>;
-	vqmmc-supply = <&vreg_sdc>;
-
-	pinctrl-0 = <&sdc_default>, <&sd_cd>;
-	pinctrl-1 = <&sdc_sleep>, <&sd_cd>;
-	pinctrl-names = "default", "sleep";
-
-	bus-width = <4>;
-	cd-gpios = <&tlmm 36 GPIO_ACTIVE_LOW>;
-	no-mmc;
-	no-sdio;
-
-	status = "okay";
-};
-
 &serdes0 {
 	vdda-0p9-supply = <&vreg_l4a>;
 	vdda-1p2-supply = <&vreg_l1c>;
-- 
2.34.1

