Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C500944E669
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 15:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821598; cv=none; b=nIoqaY5MdhevR0y0ywddI+yUd0cTq3YJuNl8Re3JXpMkGJA3+RM7us2pRwsRwtPA8wayVX1ENHlP9sRPsland0N5vbMD0Be0mKsTlJXt/LVxIyRp0qBSdqFXr0wC9gxHQp5lo0Katl4ua5s0dnEIAoA8kNJQVgtF+VMtOIi6L+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821598; c=relaxed/simple;
	bh=Lj4xwrzjhO1VDsmaGyHqoFbFhk83L/Zj8o9GcN8g5AU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n5MDmjUs9FsIx+qCbJx4EPtO73oBae0bsZd5Jjw3eFlz/5J1gKQrq3/UluGgFcZkm3YleBSwMhgI6p0lqcu5lX42+Bukgqa+nd5dP3eLUokbDdcthCEzirSUe83iAoZv0H+5TZVnPpAezncd+2tYJ273nB6T2Jc6HS+pek6BKRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ougav5BW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K2BUxwNa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ougav5BW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K2BUxwNa"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvWp24078372
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 15:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ETmhb4fSMfqSjG+CRnB5cvktEsrUC+oPkuF61xzIYw4=; b=Ougav5BWNpk2hGag
	wjso7eS+7F76gaqxYYWMIufEFSSEwXZy6fVgT2UbcBp510gpl8oqvfPlA1QeglZu
	CaprEh0HKYG4j6KvjOV02oFn60DSppqiYvnqilSDMs0NS/CBvCGS9pZXHUE6W+0u
	hcwO92kIXS6xebq//jYA2wrQW/V+b+kIbJZMH2r/3pmIbEuQ0TsWeV7WbC+AjgAR
	z7cWAxW7OHaw0VjfebwhI5QJPDOeMZQTzgUK0zQTEyfTWLGq5aEvnzPGrIpfBcoC
	v1Y6gEDvsmFj4yLxS9Pe9uwFloTuUXjTWQB9G5hUlVjs2BsZSjPv5E/FL7XTFs6v
	61utWw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkg521pas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 15:46:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cf1c86963bso6518555ad.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 08:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784821589; x=1785426389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ETmhb4fSMfqSjG+CRnB5cvktEsrUC+oPkuF61xzIYw4=;
        b=K2BUxwNaiNSLRTQz4Gj+vLf/4pZzB6kPdXNJ+WihpAOu68oDpOSngQybPLwvuuDgqD
         R5FMlzhabMugkPDlcmn2o0rRXnzocQocgkTqSImEUhRyIj0P9srOFrpxRd4Pe3XTIjYm
         yeR4bTfTmeQu7prwDajpjuZGgZKckpEq2QoJuac66k9aiyNnyOb4dp4xPRNjFcaH/iXq
         3iMJGe6oE8iZmkucLVhAvI+isVofgoHr6j8pMlbcK0gQnOK7qKEkLAzHLy1NWDsKQBNa
         F7xTYZY4wgnWx8fpWltMtQBpmZdXuvHgXzB1RzvbeUGFh2Ry/p2pIotd0RHE1mJ763nW
         vuzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784821589; x=1785426389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETmhb4fSMfqSjG+CRnB5cvktEsrUC+oPkuF61xzIYw4=;
        b=knjBiDuRtB3zVvmIWKO0Qwszuh5fKV68wZf5xPtvsmpUK02bzwSnHDYaCSOdCQjkn8
         5ednB2yn6yXpRpv7isAZMT7J3bObvMp3LwK9doaBSG9doIVfWIX1wR5yXrMkB5boNV0K
         Zfmx5I88R+NEZF2iRQLEv50A/y1mtagkjobmLywVXvwFaQ1RYijcOtXC7gQSNUN76ItS
         GJb5Vnp0DElqnOgBoyhKWb2mWU94+0zErys+rsdb0EnHORyC3N8y/Y/tzJqdkE1v7JdX
         0R2SKRi+4gHjuYdEv1w2ORzuQxtsZmdN8sAHoSOdKf7l/YenrH2z3bjH0T+LamST86ke
         F+Bw==
X-Forwarded-Encrypted: i=1; AHgh+RoJyxDNlgOHc9S5itQ5tnmT5MlB5QzXts5B32C9syMkFdl5fAi+rMT3Yzll4MPZKYz3tpDat3Flp/9S@vger.kernel.org
X-Gm-Message-State: AOJu0YxLJhxlduOlYtITZdgw9ixwk4mMtsD8/P5fXfqazD/gYUTVVIUi
	2Zm2t6OdOtOTsQjIClJjdrnmKD0GRaGwhtrDmjdINZMgrH1D0oRkwdju53TjZ7gnuPvB2n6L+Cd
	PD9/X3BBfsJarklXd38+j7h05Y6IHGd3JS50GI2vciKfEbaERaAKwmU53+mbpqQRMUar7M1Vd
X-Gm-Gg: AR+sD139vAZa6gbIzqtfpi2aWzG36swioGrQdDd26Hfj+99I5++yRCYerIu64coEMXt
	TrtELoNatHE0bedou5BikcLvTo+sDrD+wiWpDd26YCaX10jPsI2NrCS6JEzqTWGmJFD/OdvVGYR
	yW1ptRdBMYegnu0wTBvjBSvaubv/bQ9I+vntuCE6LtBBtm79b3e4/NwavH0wfETY//eiSavmUy2
	41PMqQ3JzhUSiJcLF8BMdaXDP11+KewDpyY5Sm2BXFEkAcF/hxV95DmpGfAEXa16HT7npT6waWJ
	+rxHryK6gBAgHquJOoHwfZPBfCOAeVy1pFVNwwdeg8eb0AP+59qTWAO09HvQjnk84/VvOT8aewq
	VIs9RzCww1A1NkvSS0uQyD8tbPLlHsIU=
X-Received: by 2002:a17:903:3c4d:b0:2c7:f5c6:c4a6 with SMTP id d9443c01a7336-2cfa947647fmr36538645ad.7.1784821588532;
        Thu, 23 Jul 2026 08:46:28 -0700 (PDT)
X-Received: by 2002:a17:903:3c4d:b0:2c7:f5c6:c4a6 with SMTP id d9443c01a7336-2cfa947647fmr36538195ad.7.1784821588047;
        Thu, 23 Jul 2026 08:46:28 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd7157sm36242625ad.18.2026.07.23.08.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:46:27 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 21:15:53 +0530
Subject: [PATCH v3 4/4] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-shikra-audiocorecc-v3-4-90b878ae0d4e@oss.qualcomm.com>
References: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
In-Reply-To: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=DtZmPm/+ c=1 sm=1 tr=0 ts=6a623755 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=3-fpjux48RbdSrvt_gcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE1NSBTYWx0ZWRfX6Zj6Z9fOg5ta
 Vzz0tdjdNBwTdUrjbI0bhu74sZXgIxCNUW36ugX6XexSgMipKQO61L2mDEXXzhLgHn9QNGOFBvy
 Msrs7JRZg99HxAz1AEkeV9pkZP7PQTc=
X-Proofpoint-GUID: ctYwA3_XteifN7e4SUR0ohD0e8hEYE7_
X-Proofpoint-ORIG-GUID: ctYwA3_XteifN7e4SUR0ohD0e8hEYE7_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE1NSBTYWx0ZWRfX3KXqGYD0pmEr
 bbzuEXq0aixhpX5fqQwGEqmPMDVz4Y8Fs6sqEl+ohBy26UETwyTbLyhuddQSQr1TQPPKFbU3Y6y
 +aTuE0PRf/WoQNZLJw0VA3wPf3SjDllt9wTbQhjqG9EPm/LZKHksr8MgpeP2QBkKyM21unwilB0
 uSya5e53gPemL8VnWfYmJGFQKO12jnoKeIy1I6osqN73cTvSapWLBZig4Hv9+RtTJv+PWYXGdSR
 TO3U9mclTJYnB1Yq9OkBLsvjJgw1h/Twv8Wa2/OdK3+m4p/xMpvmT0fSeW8irQcW/U2aQ8ZIlgQ
 WZ/TtnszXWA8GnqBmbWG4pegOl/3s91hoy/zkTyW6r9XQHhXGzqd0Yj//ulKgAM8eXDWQsDVSS4
 6VsVVao5IJeF85eg0Of/wYKKngJHY/+Z5QraLCO/rgtKi1Sb041MTKthyaqcscOQEI+luu+qhHH
 5fwIjwwuUE1UUPAHh7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230155

Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
differs across Shikra variants based on Audio subsystem enablement as
follows:
- CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
are required to be supported on HLOS.
- CQS variant: The QAIF driver runs on the Modem, and required clocks are
handled on Modem, so from HLOS only resets are needed.
- IQS variant: no soundwire codes, hence no clocks/resets are needed.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  4 ++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 17 +++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c34d371f5ac23efe59d1c9d2723f4..0883c480bfbc80d7bead966b9ba932dee8a77bbf 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,10 @@ chosen {
 	};
 };
 
+&audiocorecc {
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..b744534572d63349c4274ffbe5cacbb8fdb4197d 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/qcom,rpmcc.h>
+#include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,rpm-icc.h>
@@ -640,6 +641,22 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		audiocorecc: clock-controller@a0a0000 {
+			compatible = "qcom,shikra-audiocorecc";
+			reg = <0x0 0x0a0a0000 0x0 0x10000>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&sleep_clk>,
+				 <0>;
+			#clock-cells = <1>;
+			status = "reserved"; /* Owned by Modem firmware */
+		};
+
+		audiocore_csr: reset-controller@a0b4000 {
+			compatible = "qcom,shikra-audiocore-csr";
+			reg = <0x0 0x0a0b4000 0x0 0x1000>;
+			#reset-cells = <1>;
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

-- 
2.34.1

