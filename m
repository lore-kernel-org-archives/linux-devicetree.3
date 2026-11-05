Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874040;
	b=lYBcXPVO1+abb4S351ZAOyiJ5G8Amj/lnjwj9onPALYuF/4FH/xcypZzKynZYS9Vvw3R
	 FpkzzWKzImIgiP7YwcOHtTxhlezdsDg57HADE5GWnBy+R1IltS55CzKCULW/UENGbGNJQ
	 GxvkDl2g2SsiR9oSCz/BH1RXDBP8tGH5NR6Q+xfg1iHNxIEjrPs02boqthob9L4H37ruC
	 WXCUuz+T+tDfkjmWf23FvqKVa0305zuVG1mBH0+I0z+0pLpKY6YV15HWczj+sHsHkzsAw
	 5WxMiEeb/WdnLgQfWGrgq4YB6kedj0MMMQHgTFYDfaH3ILo5JYUpTBhUdt7DGwTi7VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874040;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j3MiXUY5DliQEu2W104SSlUFqiy4PGY7JahO+C2gJ4E=;
	b=OfFtTF3Bsl/tNv0XDorfs8ZS+EGaTQi4rbnwmds6d7OPsMnKMsAZJrRTMI2cvcg8W3ES
	 ojEY4lriEMRmG+QOBTbHPPgXWXkRNMszRgL1bYNgE1VEd89zgeuSC1EeDFnwzP6vPEayk
	 noGKuc5YbDG0lCMKaxjfkCZV/vkkjsJw+ntkpXTGfhm7svg9RRY2T0CkYs5bMbu5Y+Xqy
	 eEgmhRLJzIYYWW8TmzWqElcX2PUu+m7/4cHTd9unSvynUwkPIASS7a4o/LS3RZGoP3XCt
	 2w9c5h4M4MC+D9G37t6NSiZM/Xeyxw+FFHSZ3ZBQs5Xn78YeNOP7zXA8Mr/UuelRv6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BIoYRXa2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gVnnB7Ks;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C882606A339
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 10:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C882606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BIoYRXa2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gVnnB7Ks
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tMhP1477195
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 10:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j3MiXUY5Dli
	QEu2W104SSlUFqiy4PGY7JahO+C2gJ4E=; b=BIoYRXa2x8aYOAwTsLZfTmGF8Y6
	XpAWstodhWEybFqn3hxiZnEnsuXocduhyZMBCkAEDcALVBS1fq0XMFmboTVpgjvb
	fFjSDzzsFtGeOqUtCjWTjeFPH+Z3WC+A9k3qK5Q0oNZBgMIELDhFXkCBTO0+p+Sr
	RSG8a+6LqhZV4MgAG9cRDJoPV11NSznKG7YCX4NVbL8NGX64e9AvU7Q2CHwKcvqn
	AbQEZ3r5CqCuGiQi1xJffhfUGt5tWU2ZDpcju4WYd5dhvBxequlL9AdIcSKKDSHY
	5PXiFco8rou2Mpm0OwnsOhqf/Andm9+pq6xR0OPB/5nlNWJJvvJ49hC6aeA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bnmh73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 10:20:38 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36de26cb4b3so1146703eec.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 02:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793874038; x=1794478838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j3MiXUY5DliQEu2W104SSlUFqiy4PGY7JahO+C2gJ4E=;
        b=gVnnB7KstJLVITcQ8YTexJyRr5zD/nTonevvAbVz4q/WOl1yvx/L1sricwba6fdOCE
         vROHQHjvt4muJhMZvfbD8mCQF3Dt4IlpU0+uS/UpZWqgdd8MLoNNcKnKb/mkUkSXmsHv
         goNSHEOte+i1pJr5jTHhYWkgPdimfAhEudTzcBjgrdidM19+RvFAkwBJbsuIJu+27PoZ
         jSliQusn4hcH0qPnSgy2/dt3m+YQuEbNFtb4DbLbrSitC/xlquQftOspl1R/IKSSWRpX
         afWUaPmKDAGWf8b4qnp0hfIugndvO9flGcP5bRBfTjL9UVrQjGT7f4nkpESAw0NVzmsK
         RE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874038; x=1794478838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j3MiXUY5DliQEu2W104SSlUFqiy4PGY7JahO+C2gJ4E=;
        b=O1QEtJdXqPVtEL3OgWjQhxeqN3xXXKMR32EkqRml4BXVSHRIur+rd/sHulPE5/uQHX
         g09bqXlTCMMTejv6R76Ggf0hi46qAcUaY1klq52FIhoXeWqTfD5jB/G7Ii+2JtZdCGnH
         a0IJPzzwPeiSoyIDK2gmrszAVIhJT5tOARoGpvWmhwaQ9indES+KiMgJDTKFm5GdgYwT
         Kjf/gaejk8tdyUf4Q5joR3Uypp5jcSBbDTOrAoox8ZT3rngTSI4Z4wHxwEOmGoRYMD52
         1Ow1oqn3GHrYToBrCvkHoZF7mE7qJ+G9MEogUJ8XnogIvr/lvXeovy+cJm8/cnk9DYol
         yrDQ==
X-Forwarded-Encrypted: i=1; AKwUvBysPRWnUyDECmxqHJWMBHQbbKF2OTJvOTpsIfOSioGfWVbi7Uj1TYMetb/kO0QZQ0Xdcrs7RhRcOPlO@vger.kernel.org
X-Gm-Message-State: APuU4Z/D/7nXmGpw49/j1JND0EUnpoormho9eT1HblI2+zMP7usHt08G
	OgBHlglz/IolH7RGdeDIltydAax5E3IEHmMYe+6zscyc5TKr9i8bF7IHoWc8Vp3/DKDWes/9ExG
	1jpAaQecY0Vs2WX3oq5UXbuRl0eO0PaVf8hVUifCht+4AHcBmU1+5KGvexQC0Xi/V
X-Gm-Gg: AYBFou0RTQPCh6OpCV3DYctef2WrMA1iVdp0+mQfemltSYUGyuzcg8EwaMmmKcJ2c6j
	Kh6RwyAcVeTq63v2kwaLbZphunITa5h0quOjrnLvSgENGAKIdKlbv/DUzpCFHmVeQIc0W5tQaeT
	uHWSSBzMvCsm4dTC+GGRPluKvwquKM+WHZcnnBnPwAOSTamsd7lFTjxrOKt9vFdSejTJRlQRdVg
	44oytd9eM2xxjIIGcb5kRXn1pxOyZWonTvqvQXZsMPgGXEtLPnIkAwoSc3it/15wJW631b2UbWH
	AfmmyQCfRgKpxUtwQpPgF5oOqk6oO6xujGj+/ufN2cmzVGS1Y9ow/6X+1gjJGXsGgq89fY4LEn8
	OX30wPJgEwa1EuJPr1RFhKz6lRt1Wbp1FebkdNNQaHtd7jRGPIdzc4dsKlWq+4iyklDuoDknp6N
	q+m66NFVLJ
X-Received: by 2002:a05:693c:6087:b0:369:f420:8679 with SMTP id 5a478bee46e88-36a42440304mr30656492eec.38.1793874037748;
        Thu, 05 Nov 2026 02:20:37 -0800 (PST)
X-Received: by 2002:a05:693c:6087:b0:369:f420:8679 with SMTP id 5a478bee46e88-36a42440304mr30656446eec.38.1793874037091;
        Thu, 05 Nov 2026 02:20:37 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm14115330eec.9.2026.11.05.02.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:20:33 -0800 (PST)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        shiraz.hashim@oss.qualcomm.com, monish.chunara@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V6 3/3] arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay
Date: Thu,  5 Nov 2026 15:49:55 +0530
Message-Id: <20261105101955.3732723-4-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105101955.3732723-1-monish.chunara@oss.qualcomm.com>
References: <20261105101955.3732723-1-monish.chunara@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfX+uKAWiHQgXOe
 Ua5PFVnWEHXOFMivZkBwZxQUmaiZETqSo3Nc0mDxIDqchjxeSS3klT4upFv0/uVUNu8y9RRvXAY
 AQ0UMvKby5eUYFsrOtJA5fZd+1AUNjShT09PR21sO2bIGvFCyb1WF0vm6yRExENAo1bG7kpliQy
 z5+CTgkf1bjt41bskMAevkKvUg7QLGTfikKexR1vBPbhkgdUdhbzQYtJpjdsKIjQHOjApuY586z
 ty4keTmmTzw6sKhdxpzlf/KlCgfKLPSCJdIxAN2EyBfjsMzDh30WbwoSjD6znCql+bScmM82B4a
 RTRrAnclNKRFGh/gdam8Q0wE3gvrAa7IzqrbJtLGnNBQ2f4c1qN5r526m0l+QpHBXBZktKro8Ni
 JsoaC4zqimWvROQA1hFfBkcSh3Xi+muvfCW02d5baijKyDl5p3TJk9h6TY55mHJsMZHGpMAv+hr
 /r0s8gx5s97McwiaMxQ==
X-Authority-Analysis: v=2.4 cv=KLLPn1Fo c=1 sm=1 tr=0 ts=6aec5876 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=eWlXABRqF5iA9XQ1jREA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: nlGPb69Cb-E9MsI_LnHMeN2uINvLcxDC
X-Proofpoint-GUID: nlGPb69Cb-E9MsI_LnHMeN2uINvLcxDC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfX9mS/l005d7Rr
 Jrop181hDs3S48m+L/MBoEE0spZQIFlCdWa+H0YqRzp3uc0rjYczI8ryo410zaQVoh1o9VO3Ugi
 jGNutM4u6Z4H2wzht+H4zWZwsaFtb4o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050041

Enable the SDHCI controller for eMMC functionality on the Monaco EVK
using a device tree overlay.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  4 +++
 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso | 27 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c5b2e95cb9d..3563ccbe771d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -80,6 +80,10 @@ monaco-ac-evk-ifp-mezzanine-dtbs	:= monaco-ac-evk.dtb monaco-evk-ifp-mezzanine.d
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-ac-evk-ifp-mezzanine.dtb
 
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-el2.dtb
+
+monaco-evk-emmc-dtbs := monaco-evk.dtb monaco-evk-emmc.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-emmc.dtb
+
 monaco-evk-ifp-mezzanine-dtbs	:= monaco-evk.dtb monaco-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
new file mode 100644
index 000000000000..6454efc03ddb
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&sdhc_1 {
+	vmmc-supply = <&vreg_l8a>;
+	vqmmc-supply = <&vreg_s2s>;
+
+	supports-cqe;
+
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+
+	pinctrl-names = "default", "sleep";
+
+	non-removable;
+
+	bus-width = <8>;
+	no-sd;
+	no-sdio;
+
+	status = "okay";
+};
-- 
2.34.1

