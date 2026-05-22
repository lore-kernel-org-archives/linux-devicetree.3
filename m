Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1CC385D9A
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479713; cv=none; b=pNnf1sJeVObCS18sWxHsIStP4J1eu7DQbFmzGZdLTy9mEYv29cbOTsFK/gWcmdLR8JRONC4cZcQ/GATZ30e4KJ222gBmc+toaaE3azjKHX4VDzXahvmk0fLFdQLoI5Pd+EhHet2o1SWyBiiKi43sb+qayQD60DytnYPet4kU2wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479713; c=relaxed/simple;
	bh=6CDMXyktl1avhKseT/l3D8WHvKV06vYs4Dl3eYzR81M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uegBrfqOji4ao31khVmOjKJVMSpaPfdjg9kZecuF9RGlt27FTRxf0PZlxFfxTtf7raSGu7VKlE9FcFJ/2dF/aLofIC97wC+wiOqBHCV3YcvPxQsk5VY48YK/NjC5Vfwa+WRDs/TYK+YublQPYOG2DjFpU+PQ1r1LvtZqxPqbqzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WqerWLsV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WOE4yUrl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WqerWLsV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WOE4yUrl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MIERKi3344505
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oPXMCoG5fsV
	njzHE4626TGyS0PRH/4mTNQAzDdiSDaU=; b=WqerWLsVmBabMEyCBgtZwUckFuZ
	pacs4xu3aIVTIJzssT/fFzUriO2CWTsbUOBlLWI4+vx5Xds4ZXzNN+NVO+meSUL3
	m8u/1wdywZRNJpeFCo+0E+fuJdr181FLglitmvb3dgClo8SSXJGhECHXEM40sXFj
	wAdtw919J540237y2s8NJIx3Y4157C9X4DD48ReS+1TpPd8OPYc0y/wsIS2qzeEk
	ciW+xAlbKzjLx/lUh1VlpzybNnbXEaA0x8PqqA0wzWBwE92p/tButRJ3j7R3BLm5
	RQazdZhP5NC/VE7CQ+eIaNwt2u6auOYFiwhzlho1N2uRaJcIt7HYSiIufFg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eav87r9v3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:55:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b9fe2d6793so173082825ad.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479710; x=1780084510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPXMCoG5fsVnjzHE4626TGyS0PRH/4mTNQAzDdiSDaU=;
        b=WOE4yUrlYKBSfwQ7Adp4yHBSzO6bgzwG5yPY7ya6OfpcwuKub2szv44+8ZSM2kHEZt
         VIyPeZf7BJ/FDRSdEpjfygDRGKQh2Umx4IYdKZrsmBGajpWeY00SaJfQK2D7yTm+rxvg
         4HWGOUY5JoqEn2GsPcXmLqekwJY2pXAW/QC8R54iEo9WR0pB8P7oQSucmT4ZY3Q+Kq5s
         gwJQnaIw2KXqrG9r5ggBL9orPmLGwY31wcsUHT0nMjMC0w6DHzrbS42UlpFV13ZkCztc
         dcN5yuLP8VE72LtcBGBv196pLKY1rO4ckJ0X5SCwXTMi7qNxCcQ4YSl3z7T3EMxC3UP5
         FxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479710; x=1780084510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oPXMCoG5fsVnjzHE4626TGyS0PRH/4mTNQAzDdiSDaU=;
        b=X2Q303dzrmbENCUmffotvDCuUcVt/R749GeOuQnDNtuZKUtSLDh9YNrE8tyZfuRqF4
         1hKX6M46LaCFpfkW5AcyXM9+yNeJ76MtPqYJdYkUo+eEpO4wy3H07q835Dzvz3Pgtko+
         dAdk810CQbdNVRIjEs6KU8RRPxl1IIiei/kpuZpgoA5rmLtOCpK2irsdRaivyDlWbcB0
         Ux3avkcAiNBDfz5vjBTtQ8YV8LGsanf4r/hnwxmw67WpVl80KsZ6PVeTSKXmjGNrS4dW
         kxUAAlq8QhCaepy6EwBxvrGbVhZPuzIjvxIPEOgI8nPrC91UJh61+p4lgzo3QLBRm3By
         1xTA==
X-Forwarded-Encrypted: i=1; AFNElJ9lLpjGIkuwmuW2HAzmOF4DHpEChqeIyd5CpTMdrhDQIt5Y2aqVHEpuZ/iP/7LUWx50An7A7BYCnvuE@vger.kernel.org
X-Gm-Message-State: AOJu0YwYeKvytN2VH0vPp1urTXj6kg7JW2Afd4P/8cvJWOgC2cz7/qhh
	K4Erb12AgrH7Dnr8BHORbeOs0NXmesXMGNWoBOe03FcsT3xzYqEk9pzCEe0FcLkhxXaT5gNyIDn
	QtufXJnrWRo1LT6Q1Wz4T3k4GM7SBEmY8pvQGQYJfZqRpk+n4hB0g/XulLNKcdtcR
X-Gm-Gg: Acq92OGhJuK5c4sCU6wI/tzN5cW9x/64BysL/+FHPK+PpuXZ+R+V7Ly0kyR2ra0HfdC
	GTKsAB/wdh/kWH0KDiGpqZnQ1wf7SqLUieSkhYF7mmIDbHAwQ/VvvjAmZiTyFjAIN9Az4OCGFhs
	rywGuG00ZhkHZdypRWxUadlgYEd7J4KtsGBSGZFkXoEApLhVIUkJQsBH5ZXtqVYQc5ZjTurVSXI
	xiNzXB0qql32Jre6dtlnwz0zNs03ufwLYrep7qSlEp8G4lrec/s/1eX027MIgyoRDjEzes6Ku+p
	MRVem7t/XJXTsSNTSvKhRsg+D93xhIxVrqeU6IX+nO0XhRyAw0M06kowYww/O+21Bj9lTGj0ZU+
	2Po0SMSyyK076GYvOMtJDT9pYS+J6EaYD7L8pJburK7wV9dp4
X-Received: by 2002:a17:903:1247:b0:2b4:5d51:ce96 with SMTP id d9443c01a7336-2beb06fcc8amr55332375ad.24.1779479710080;
        Fri, 22 May 2026 12:55:10 -0700 (PDT)
X-Received: by 2002:a17:903:1247:b0:2b4:5d51:ce96 with SMTP id d9443c01a7336-2beb06fcc8amr55331995ad.24.1779479709577;
        Fri, 22 May 2026 12:55:09 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:55:09 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 17/18] arm64: dts: qcom: qcs615: Add minidump SRAM config to SCM node
Date: Sat, 23 May 2026 01:20:08 +0530
Message-ID: <20260522195009.2961022-18-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX2tK2FPSgRxCM
 mNE4w409qML2O0E5HKk89ncpHRLZ5O71MGaKxqZtqn6dsO8/qL+tL6+Ie57fXgTLpiBqJodaCaZ
 vC0yQBWNy9Gt1gyrcIFU3EqCjWqkxkYvjeJsQksPk16X7OI9A5gRv4X4PoOxD+PGJjvEwZPF14b
 8gmy1/Go3FOS2wkG5l/TNE0E9LYExfViXYyvBd92kqieQmPOLwv9ehczMPWXExe2i7Y9PZhhc9t
 x5C0Vkei0Hmd/zorhQ/NDs/9Oi0EY4EfUyH97wAlXNwtpWiS0pvZoW+CQuznEJ4WZLVRxNvl8CO
 YIIBthtjm0oePjnIyGQny2BLI9hGo7NQzAYlH1n9+XgJlqjeYxzvICSeBznXL+Bu8YRLZGxKJ7l
 X6mVO4wFIvWExZsJYWXyCU8gKmuYgvRV5KP5uqx3y/FXP8tUvbf6geRTBEHu3bwurc9mVqIEsNc
 ZpOD9ql9v0DxyE71C1Q==
X-Authority-Analysis: v=2.4 cv=dbiwG3Xe c=1 sm=1 tr=0 ts=6a10b49f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Y2DO1TD2eDIuzSEqJuEA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: L1vL5sFYvRMADjOFa4xVmE4a6fDW1JEQ
X-Proofpoint-ORIG-GUID: L1vL5sFYvRMADjOFa4xVmE4a6fDW1JEQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index fb1bbc51bb8a..a358d5441fa9 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -473,6 +473,7 @@ firmware {
 		scm {
 			compatible = "qcom,scm-qcs615", "qcom,scm";
 			qcom,dload-mode = <&tcsr 0x13000>;
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -4654,6 +4655,10 @@ sram@14680000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			pil-reloc@2a94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x2a94c 0xc8>;
-- 
2.53.0

