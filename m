Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F4546EC8E
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960086; cv=none; b=fOKZPMaZk1IZOCgQ3Z1AJDcqOAnjvybN10kt6BE4gITxc0RBvQ8/PqkGW9tt9VFC7lCgFNsex9kGpSnPDOp9g9PsNYfZjCjKnh+XU9sHuc1D0ZdYRVT91w6JI8BfrO5+neBv/3HKJLjSZJfYRdsXjeeYOkqQqODCzqdClcoUJK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960086; c=relaxed/simple;
	bh=IUYtuubMhhcN1ZF6PNMCch5PozFrAL2XyBYbmMT89QE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zan5FBTQP5ztXqmUctGEGheju6nw2ExQKd7qeFo74jTnz64Z7I8AbmGIV8zKnvH8cjGFTv4IbEpY7IU4bLThZGyBEINp0DXEJ2rofJRL9+NIx6SmfhDUNUK5BzjKichSxc56gFIUB4jSrVJRjTEDv+RBTNIFJ73mKrNeThfy8ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pU71pD2R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EF4BMVtB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pU71pD2R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EF4BMVtB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DNCraW2088183
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6Ps/u3Sf1Zs
	xovH3oOjCRJifXEv1rKPvAC83aBceATE=; b=pU71pD2R9FOq/dDRpkIqCJeMP3R
	I//bh7lZbQPLm/JjKt832au5NJ1einmbZSxO3/P0nNc5oVQU185ktQXmTgLQR+fU
	j670BJ5Oh50aH7MOxXVPeMKmFV7AJ+fm/+yVPOLyK89e6Livrta7DdLhEL35UYQo
	gYRTOXuEQr8RHWaXqqygm87m+yqJPlBRlN5VUKZDeg0QPkeszztdskIq2lr4sIQZ
	nYKEH/5tkyl4296j3Q4YQG4jg8te0uleZRcZNJ9XvrOIUlOgfQQyEPDgPKImd2fz
	KdDy9bx4sW1YWcTRNCllEg3P2xQGCbiA+cLy+SS0mP6wJun+fWlAb989AOQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9x49hdrm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:41:22 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8862ed0539dso165381b3a.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 23:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791960082; x=1792564882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Ps/u3Sf1ZsxovH3oOjCRJifXEv1rKPvAC83aBceATE=;
        b=EF4BMVtB+8we2SMOw7NEpO1e27fLdJLt/uZx/V59eTvmgm7Xpg/5CLulUzV+uTRg/9
         KT9ANrQwWQRgMm9Fn1p2+M5sv1YnwFIjqWAlwWU0NuN3V6XSqMkMKykFBws7ORjbYfhn
         Zp1iSKMrjG8jCA20XuLShQ6wI7BWMGbGxmyvJ5jfUmWqHLedoA8ttQ4XXMujD2IaNNc3
         yOulBuGz54eqHZMOq1iz+6ncv/QwqwuZyWJbXNores0gVZZC9Dw3IUYl8u60KE60eq4P
         4twfixJBJxmL1YsDkOQQb8V3kLRflmM7sc/eIrht+pPcKgKnS9EXh9rUeht3J8ZPjWPs
         m8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960082; x=1792564882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Ps/u3Sf1ZsxovH3oOjCRJifXEv1rKPvAC83aBceATE=;
        b=RM9CFLtyWPb9Aaao5QchVQmIYxdAwTWae8WDWSN6nLFHVgmNH6dlakvx2xvIBLv6gb
         HttS2mCKay66ms9MHmN2+s6wPYgPe3quuGfCwjtE9VxLLz0PSQELJLAQTrBdyk0a7sca
         +JtYF8bwVOX5Yf7x6MOnSE5IJcxlsVnR6SQr71FogQunZLTkOwcyc63IIS3PiMEBtKwO
         PYEWhdp4BZAcJKRiIXlS8T0ifH5B+3gVgf/QFvwtF6dTSTNfGWrDk9yPrkyCg7gW3cx/
         Es0g/C+7+TEW+5uYxAUgJ8ajlG7nvq10w36ph8Fnpl6z01rN7vvTz+gYXq8OU52/PY+g
         MX5Q==
X-Forwarded-Encrypted: i=1; AKwUvBx8KQnqdODQ7s3ZK2lo4k99L8n3WNfFbCKwTzGwkQ/knQWSZDkOwN5Y0GmAI2xaba7ayF5MADA1MqV1@vger.kernel.org
X-Gm-Message-State: AFq9FYI3w+0E0zgJI/0Z4okrk2b77pNgcy7Cif3jHtHApYSWKVz1K7jB
	DysNdNNVW58xDgRXSPTNNs+Hy/XwhkJ/5tbvOH8wJA4PTWwnFN5GlEg1kd5etqiznquYmC7zbMZ
	9AE7T53TW8tAfR5eT7VaMA4KpPbnQW1EGx39EewHBMNGQmoJp97P3h+d65Wog+wqt
X-Gm-Gg: AYBFou3VXfYv/sj7kFUgXlOdxWi1D2gnzipQECRrEp3Zm2fRSXlV3z5ZiLYkUwGC9ip
	DkMPbELpCaPvQXWmOlLl5vqL6wspNKYn2s0E1SIVYMSB/b8PNbGGkmbO5ynH5j7WXtrU1AakQb0
	8Te6J9ZLJn564p7bZVzD06NA1qF7QpzqWkDSMgZ8foNczxBU+ZFyd84x/QiRdkgGucbQgOOfya1
	w9mTKPtzd+ODTV+83bXvigDhVDsvagwF1kBfRF46x77fC+xZATbvCpVQBL5HX/hwBl8DBGZMopc
	AaFevJfcJk2AgDiLdG/G7z+6FmMLDJxWaTF1oGdHdGIm1/8oB7k2Kkt8fpu/vc4zFyT5yv4kock
	3haQGmaH43ShtwFgblIUZ0+3l+LfEYH5/1VEoPbHtXh9ZWOkh9t40v6jzOGo=
X-Received: by 2002:a05:6a00:2283:b0:887:3fca:835d with SMTP id d2e1a72fcca58-897c78ddeecmr13638260b3a.29.1791960081498;
        Tue, 13 Oct 2026 23:41:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:2283:b0:887:3fca:835d with SMTP id d2e1a72fcca58-897c78ddeecmr13638234b3a.29.1791960081073;
        Tue, 13 Oct 2026 23:41:21 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d7f518b8asm733221b3a.2.2026.10.13.23.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:41:20 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 4/7] arm64: dts: qcom: nord: Add the SPMI PMIC arbiter
Date: Wed, 14 Oct 2026 14:39:49 +0800
Message-ID: <20261014063953.549379-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014063953.549379-1-shengchao.guo@oss.qualcomm.com>
References: <20261014063953.549379-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YJcKWhGx c=1 sm=1 tr=0 ts=6acf2412 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=pTKKwl7rlpcWqDfdxRsA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyNiBTYWx0ZWRfX5/IDQkpf4OAv
 NnrTsuO9LQznHWlspLlqq5i1Wec/q5BQSgqoR7LVxdh/0YR+7RYynEbtVQwB2vuEwS+T+2XedLm
 5tMeTc2iGeU6FXgoQ92Y4cuh8GwZmXHqCaEOiqNBHs0WdP/op7H96sihSV+bnNqjgk+CQbND8U2
 OH/Vsi75y8vIyl8fM4gLHEUcyAoDKEK0pbsDqKI11PmRls/GvzeDl8jbU4lNAeJUGpRk4uwAzhC
 NAhmh/SAE3id9Q4pv1qnzSychFVPuohpYor/9BZe65TXkaBx0DGodTHQtwCs9lSmnOP7AulSFTb
 n360JNOx1lEqN8h/QaFs7OBwAKmZCE3jsi0Dhzav4G0jMM1/X8zsdLpXj9zslTmykxx887JzjAn
 O0sWofyEnjPv92STGXl+BJyJhKQr3Rgqo9RkgdjTQQbeCDJ77v3FIjjZVth/QsmUZFXZix0cWHR
 uV7Ei1pIbFI3TX0IrYA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyNiBTYWx0ZWRfXxASyw6TKa9vj
 QL1B/GxqoiKddCIRC/u+ADxqankyo6Qno12gMSsDIuMkI3eF1D0s8PGaRWFdMrWss1+P7xVYq/q
 9YNPnbY4V6PqxYofILa0t5T4YKN4+CI=
X-Proofpoint-GUID: AxKc3DkWEKk4OTP0P5KBdMbJmPuOlCiS
X-Proofpoint-ORIG-GUID: AxKc3DkWEKk4OTP0P5KBdMbJmPuOlCiS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140026

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add the SPMI PMIC Arbiter node for the Nord platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 1fb276e498c5..dfbbaf94a7ae 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1874,6 +1874,28 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			#clock-cells = <0>;
 		};
 
+		spmi_bus: spmi@c400000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0 0x0c400000 0x0 0x3000>,
+			      <0x0 0x0c500000 0x0 0x400000>,
+			      <0x0 0x0c440000 0x0 0x80000>,
+			      <0x0 0x0c4c0000 0x0 0x10000>,
+			      <0x0 0x0c42d000 0x0 0x4000>;
+			reg-names = "core",
+				    "chnls",
+				    "obsrvr",
+				    "intr",
+				    "cnfg";
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "periph_irq";
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			qcom,channel = <0>;
+			qcom,ee = <0>;
+		};
+
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,nord-tlmm";
 			reg = <0x0 0x0f100000 0x0 0xc0000>;
-- 
2.43.0

