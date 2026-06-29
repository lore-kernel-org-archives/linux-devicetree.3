Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4190F374E59
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782714888; cv=none; b=DiqgGVK74+D7ZxpvyrkzB7p3mRc/s28F/fzLOMuFUTVFDOM8zCFgC780FNSB6tEyx0RRmoHrvn+pZwtIFh61xHFbELlRhbTKHlX2xd2Y+9x+T5Eg8bJIaA0MCbzR12iMvSFXK/MP5ktBtnN40/lc+zm2EgGyRqN7a+H/t61Rf1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782714888; c=relaxed/simple;
	bh=2oFbw+8auGzyjrhr2bja7oPmC0vDQx4B8uH4GD1Al6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UMtbmLDB5MxbiJi7O9woS0OsLheFcGsqn1oxLJwkA4itf+whtdqmF1Lw35fr3WRVgAr05t6VsVIlx8OA7BSyWwzYBQORNlbUI3zRXF0zSvABWKQKz2NDZEtDw1t2kWw3SCghvsh6Q6GD5NWtNt+BYqdwbZssvCT1/3FixEp/6h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oQdIQ08H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GFf5XS8i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oQdIQ08H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GFf5XS8i"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NCwb1771884
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q3STUd/qc8x8VEwzfjqwKu
	hIP/hEmsUdoVSV1069ao0=; b=oQdIQ08HgaTJw/UoE1EMwA8x7V5pduKNoOhppR
	RHJTCEbk/OOt+aDrcMErZYL39ZiUQu5I7+tDHXyDjOQavxaKQn9Dd+NHRWjtCGKr
	G5kGXS1zndiQXMibgqhCzp3zUyOzhDqOKaq2NT+to43Ztn+ytS4WYR3E9sMb78j+
	59nJGFcsXULiTSL7XxxBykxUH+QKQ2aOhsxbybT9537gMhT+TKa0DqqUBPo4V93t
	vmNoBoYsi7q276MGMTD4aC/kdEVopOuqf1NoWmLVBDteCnBbblGN1MjlYSh3wGQK
	2KZiIl29lTvxcKk+sBLVm4DHCob+fcla8tYbB+HE7TVHcglA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27084w4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:34:46 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-845c605617dso2385455b3a.2
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 23:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782714886; x=1783319686; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3STUd/qc8x8VEwzfjqwKuhIP/hEmsUdoVSV1069ao0=;
        b=GFf5XS8ivkJ6bxAHSx3AIjw2bww6PAGudyCRcwLi6ZAxMD9ARywIKY1YuDsV2UVRi3
         G4+pY6Nz6c+i2M7sg63dOmoaKTGWjINZq4qo7BwQjEppigMxS/WKCqjwZC+JY3KloMHk
         bGR/6JY3kyHd7OFxxb9uabkssNXbmkuL9WwAR6VTOd2gBE2rhMoMgNY8QI0+QkaBApv7
         72TfLkOIf58cN8n7WY4x82ZbYusWaQLvE3uvFcIUMBPu9SljavF67rGRqHUReqyAeM6F
         1B2mAAovOsFx7NCchWUwo9xlDEWs2oCLKZr4XmoUr+N/pICKYrQPPp1OvH9jcxFcmxeR
         S+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782714886; x=1783319686;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q3STUd/qc8x8VEwzfjqwKuhIP/hEmsUdoVSV1069ao0=;
        b=tX81aDgE/P3hZF66wgC18ypDEEiQtoNqQ6f7eYNy12+yod4mctIR1W07ZSUReWOAeD
         BNjA+jtI5Ksq52XIy6SmUFMa8AhEeqsr/jn/vB2ozMziBt+g0TcoB4FK2kexCOc7mQv3
         /R5ePv6d4BUzL3LU8p2LcC+dgPDaXMNgha3+NFB8wvuqRISno2XCloyz7SWiRhc4Qkdm
         IXBEM7f+A3Y8S2kfm9xkZDO5VayXzrCaaDXVg2vA4bBTlz1naocuE8n3uUX7cLKfKM5F
         mzOwCpnxdj+p0+jagGLWhFV1i7JkCM22dbV2m8f8E7ojeFiHpEF+Vg/f5IFfYFVKr8Dh
         WgGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrvhy/8XaDjeSe7pr4udO5EuzzQwnSVwr8ZlD1yN0Tttr3RPMXVcJgA0xmOHq+7S5W23Emm4obBqxUr@vger.kernel.org
X-Gm-Message-State: AOJu0YzeyyKgHP7ugO2ogIWYNnT99cCD4oe9vQuu/ABoez2uLAkqzU3L
	rFa/CbdfV0KpnaA3l9R2ibXmRjhnnVPKN7Y/FHi64jD4ox6zg/9O980koAY4u7cHsbXmMLvVxVr
	B2SIO9WS9j7cKECr4IozZZfUgfVTSvIhGX3aCun0QhFLhZwigfHeqfZCj2JEtPOXttmLH4mef
X-Gm-Gg: AfdE7cmjz3i9Qj+qwS426e96fkGo9TL43leJfeFUQUbbfDdqlFbrKXJ/mYjo7ROWHCc
	Jm0YvoW1aihh1RGCJiMYawPpQXw86qbJFoiHPcuD2b8Hb550vR5SkuSR5DiIeoIT1EjY5NV5i86
	Ff5u6V3+Cr9RkceA6hXQs3iWj3DLp6aueUdUOIcTaDyoSGjPEIbmyuzLqDuo0Me0rj41EY9wzlA
	/B2j9Mr/Yow1C7ZD8lzs4DJ5oY5/BeyBeUq/GH/jdgUN4LXpiFSTosnchf1MXfS9yN3USd8gqdB
	KXfAsODzX40+XsWzJEPy3m0Q/bW05+T/czC3X7aGv75MSq9XCEfpZ3WM4+Hg8QsXsIu10cH1dqC
	stnv92V+jgE7ZZyGgAs7/A6TEVd42F9Fowft9lnM2p30=
X-Received: by 2002:a05:6a00:4b4b:b0:847:94bb:30db with SMTP id d2e1a72fcca58-84794bb38camr207688b3a.49.1782714885864;
        Sun, 28 Jun 2026 23:34:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b4b:b0:847:94bb:30db with SMTP id d2e1a72fcca58-84794bb38camr207660b3a.49.1782714885233;
        Sun, 28 Jun 2026 23:34:45 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847849c842bsm1241380b3a.33.2026.06.28.23.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 23:34:44 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:04:38 +0530
Subject: [PATCH RESEND v3] arm64: dts: qcom: talos: Add memory-region for
 audio PD
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-talos-remoteheap-v3-1-4e23366c9196@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAP0RQmoC/0WMsQ6CMBRFf4W82UdKgSpODrI66GgcXuhDmlCKL
 RATwr/b6OAdbnJucs8Kgb3hAMdkBc+LCcYNEfJdAk1Hw5PR6MgghVRCyQon6l1Az9ZN3DGNmLO
 IKUWmVAXxNnpuzfurvMO1vtWXMzzi3npnceo8019YyOInpFkbh0uOGVYsSZd6fyDJJxdC+pqpb
 5y1aSzYtg8z25tTswAAAA==
X-Change-ID: 20260629-talos-remoteheap-3e0000501669
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782714881; l=1824;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=2oFbw+8auGzyjrhr2bja7oPmC0vDQx4B8uH4GD1Al6E=;
 b=fMWLgcIBHl/3dFUs/u3x9wQ0EI1Oo74l24jl9yRZHELLx4YLS7B3mv1JbBCI2hVmcqRlPqQLE
 JmPk8ovx1tlAMPMwuX11l8OMmURAD+qn1SbFIeN/ZP4ghp6yIPsgGl1
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=ObKoyBTY c=1 sm=1 tr=0 ts=6a421206 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=uTjEaTnFuuof5b3oI8oA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1NCBTYWx0ZWRfX76Cuh6yD/72H
 AWbpMwZVlXSUwgsG64b7sRXWK4Q02sERtyYJokzbaIG7P8eNhW/k6I49B85+Hp71hpGl6SAK+wR
 MlOKiGAjzU91cLACjaVF8mkSmpiJi3B/hxIrKmSXn/WGi5L47zlk0N/NjEBi4DWoUaYN7WVwR2J
 +9ujt0s/2tSar6QOlAz2LugpmwVtmN2tWjx7e3tNxW5CuARsylsHlpy4NIqE63TVxKQtw+k/2zV
 FgqpbED602WS+7tLJnxlsuP7sPpjiXxpRm1sIVfa0hV9yIJrkcmjqKU0Ut+cAVvYzbTt0DzL53g
 GqvyfYO4xdLGR/J0yZuBU+z1g22CF8ZepKLDoPIDOAzLbTk8X/CJuFHjSLnbRl1Fy0CoiH9DtGN
 RPZQsUV23v/3kLpmw5ItBaFdltERtBRRqlynnzlZPqZZ4HgFhJUtXOEGDQ85iSmcQL9bCTdGsFa
 1Kl4a3nkOdcsJkjAQ6Q==
X-Proofpoint-ORIG-GUID: Ajng7s3zCWwqzP1d4WJ3NNkwjVyKlniB
X-Proofpoint-GUID: Ajng7s3zCWwqzP1d4WJ3NNkwjVyKlniB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1NCBTYWx0ZWRfX+CKVe6KcxBDR
 9Ti4KzLEiiNou5RmEpbre6rClolqdj931Bq+2QBEpFK0z1AZaOL9mCDblRMrEjXQbzWNX9zOse/
 VfaL14KMetYEDcizhSrkIvrl5hIOzoM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290054

Reserve memory region for audio PD dynamic loading and remote heap
requirements. Add the required VMID list for memory ownership
transfers.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index fb1bbc51bb8a..d4e8cda993e6 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/qcom,qcs615-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
@@ -677,6 +678,14 @@ pil_gpu_mem: pil-gpu@97715000 {
 			reg = <0x0 0x97715000 0x0 0x2000>;
 			no-map;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
+			reusable;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x800000>;
+		};
 	};
 
 	soc: soc@0 {
@@ -5195,6 +5204,9 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
 					#address-cells = <1>;
 					#size-cells = <0>;
 

---
base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
change-id: 20260629-talos-remoteheap-3e0000501669

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

