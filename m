Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF7F3B0AC3
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780040131; cv=none; b=ayyJxnLfLzl1WWen25OkJ4V6mnbK0lX+tww9FLKs7Zcf5V4ar3Rl6OmCeKilbwZmW2+0R8GtoMI/lIJoRZmC9zWXt8vVzFGYGAhLvQycAfATHM1HAC4x+ZxCa91HcoKgM+aCqWYCz/fpDKn1Sg4m3U8L9XaLTLvu/7mA8WDzAiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780040131; c=relaxed/simple;
	bh=p/8Ia+hgACUnCJiEOKz2KDkUiywwxeTKUp58FnW6600=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lVrguv+MkzBPLx2DLgo81ZEsc2DTc9e593/OGP20UfatE0+OAcl263Y+PEfVeOLu3EsGTK9iUyTTGAm+cEyar5/RFYBwXpUN7ha5/YXeyFvzchEecBoNVA/rfoTXCmwsJaq20ZyPhwPmWcvDXhHSG5WtEU+auynYMdfBPaB5elI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Abxio93K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h57XX5N5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Abxio93K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h57XX5N5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T4TYSG4194078
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Djb8deguTpEm5n069GC5ISx+s3tNXXuO3yNPHMRx/QI=; b=Abxio93KkxwDMH/q
	GivaRgY15OP6IUBTdTDtu+GahOpygbL1JPP5y0K7NOSWijyir1KvcV79isx2BpHc
	cwzeWW/L3ILzEgTPT1jvHWmDybWolV8n/xnBGZTY2bc+/cw+9K2z4NP/KfMJYxCw
	pYv9QjRut48yLYm6pAi0oIh3yCKmhlJXZU7H6zZeIsrFUxW/d5BUOcLkNqLuLekl
	vLffQcHgkirvdiqGPX9lrxFq+/DNZ2JqhjcMrLC5x/r6ssSeFscbOO+FVzolpXbt
	IO0JbAmmUZEKCgR6FXBNfEbCQsAclwqkpp9YxhIOofoRCv7jW4BrWshATdPT+W/S
	Jyz7kg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef3te0qba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:35:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf0453031aso22546615ad.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 00:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780040129; x=1780644929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Djb8deguTpEm5n069GC5ISx+s3tNXXuO3yNPHMRx/QI=;
        b=h57XX5N5anR1K6FkzQ7B80lZyYHqf/0NgpgPuysLc7I/hYW4Y69Pe+5NrekBzfKKGz
         C06MOOaEY/YnEs0EEAcWN6LpSHjO83NRZKzxFN+IVLfTWcyna8j+JX/+mwG/aMHURY3Z
         Y+sL6yUicQItunLR9JsZ0nuspPGgCDGBmBT4PLA5tQ4rSWl/ZEo+KNtGXxTLlwkiDune
         2pNDgk4xN/Ky4f8Q3Jnlb9+bJ3rBlNuxjRFbpttNZ03K0pZidaIiXHzma4CXhBreszo9
         kDdEwZiB7p0N/qMBsm0gqcY1X3ePuNvY7vMuQGzpRjU0MKdm7swQAyeFmd2xF2h19MMf
         HZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780040129; x=1780644929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Djb8deguTpEm5n069GC5ISx+s3tNXXuO3yNPHMRx/QI=;
        b=ELhahP0B5Y07KE8vtLTI1qEDQeMxY3Qh41Hv+TZ07DrqQ1BlCqNgh+zuNDpMWHs5TC
         ZryLHvH3hf3OoTUgfkOHHtfigJFbMrCX04fejT6IYWHMJYk6sfh50VctsZ6R5bVMNvPw
         OUkP5ENGMU7wqNL2+7YfM0hTuMxIyDOgOSihvRXQhUcohps5Xr5rFxk6stBs4TMp7r80
         wbP0X4gWaTiFh7e+wmSGyrRettzMCEb2jHXCPL04BxCYm/D0j5PXrESS8ifRisTMIDUc
         ZxKaM4ABKmwwbRn82Gxy34awhdMXftpyHP2SWka0MBrkopF0sJYyBnTMB8wIM5jOvOtM
         jmCA==
X-Forwarded-Encrypted: i=1; AFNElJ/b6DspnHAzHBVbyanOtnjPRC8qIRrrZB4mhf/7ZOEH9zKnbHmoMhBz2kEcncUP3Wee99zTNSiPYYyk@vger.kernel.org
X-Gm-Message-State: AOJu0YzCS0HsNZgzGLNTxWk5m5/AftZFhnr0Q0lkslBdPULOE1Y04GM7
	oNX0DntZ1ctR0EyYVJLhYx9xSeZlHY5HUvFmPB0Ydr5dJsQzzAXc+2igjthgM55pfmx+8OI9Ch5
	gjgBaoM2HMk8BjvMC0jF1B7sztFpAO3gmssDjka/6O5zv+GtxjE8tqmwOlCE23NCX
X-Gm-Gg: Acq92OHwIfToBXaaBilnACas02kQH6Ton8hJI8St1l3vjWR3RDBVzsMOe104KiyTHVH
	1UHsamq7k+IMZEIR2jz77ZjEyT7PxTa6L3THcU33/+DnF2j/5f0jff/LldaWB8sE9+hR+iEnnld
	OQxNnogpqFyVplyvJQaC8hkEkBL9rpg2qpiz8cHb5GTwIfrOgB+j2CR3X0WRoUzq8Xzgb0W32yp
	pr2wwwvN3inBc2DdPR8DSpb0UtZwKD3K5iAo3Dlp1lz5sq+3jUoyETgUE83dWaNk7FqvisY5j5k
	oBG6LuJRtMupi/5eBXS64ySKdpXEzCj39Tf51Vy3LDfUn0K6uwQMkzIhhqkO6O2/Iaef9ccHzCs
	yYa7EQXYWGrLjePZg6jZ7g7z3LAClpf+z25rkTnT903VCVT6KmsdbChOfsaFaXSpIOe5KGkys6v
	OHrD7/8hJWm+Hk6/lblFKKUQOG+DzoR9w=
X-Received: by 2002:a17:902:f601:b0:2bc:ac76:c1c9 with SMTP id d9443c01a7336-2bf20639bfcmr22650775ad.16.1780040128734;
        Fri, 29 May 2026 00:35:28 -0700 (PDT)
X-Received: by 2002:a17:902:f601:b0:2bc:ac76:c1c9 with SMTP id d9443c01a7336-2bf20639bfcmr22650465ad.16.1780040128310;
        Fri, 29 May 2026 00:35:28 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011d3sm9767335ad.52.2026.05.29.00.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 00:35:27 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 29 May 2026 15:35:01 +0800
Subject: [PATCH v8 4/5] arm64: dts: qcom: purwa: Override Iris clocks and
 operating points
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-enable_iris_on_purwa-v8-4-b1b9670459ab@oss.qualcomm.com>
References: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
In-Reply-To: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780040102; l=2709;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=p/8Ia+hgACUnCJiEOKz2KDkUiywwxeTKUp58FnW6600=;
 b=YRBWp6Nmnxj1NLZ3SmAqYZLxZbS7upY2RlHghXw2JU4k+DrxOO7d6mNiCr4tINfW7Dh4lKWVU
 dIYtBVX14qGCPj1TyD4iyTQnCuVqkSKejthc442czcqXfcZTZUopbKi
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: gWwfYNQJPJLRYFZTu6kHZ_g3THot4bzN
X-Proofpoint-GUID: gWwfYNQJPJLRYFZTu6kHZ_g3THot4bzN
X-Authority-Analysis: v=2.4 cv=daSwG3Xe c=1 sm=1 tr=0 ts=6a1941c1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=4TMTxM8xbnWuMOlFmbIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA3MiBTYWx0ZWRfX0lNRfQeGbu4u
 39orM88bmm6GxOMPa/3zkfdcyoQ1FahOOSGfy7W5e2QCHf9TH4owGnz2tFVl8S7l0HNZK+0UqsO
 C6sxVEOy+mKv3a4XpcEPuz2WjN6DJ72BN+eKUQmwDgpUdnbli2RQlOw2bTpEytPi9A4xqO4K9Pw
 UgEhZCilIVjTWa7hz8LPpQBswyp6hFgoVdszdA3YPH/L7BklnkKJijo3k0JsKjUPhd+Ege0py+J
 yeartZUG6enPerjYXN3Pkp3iK9zqv6hEOvhcVI6I4yAFCg+Jmjy9ILuCDMDzeiuT0LZ4Gdn9skr
 NlpzOTlxsks/xClKkqj+8Cw0ouKunQiBQ7pMXkWv6jVk0dLIOxq8BWzpQ00OFYOWk0KxFv84IHs
 CvChGwp5ir7/k4lRHIBmUhlmSl0yYxjTyByksVShNZzLxVz/lL1WdjxzPCVv/S5ftEkiGAyvKsf
 NT8cdT8lqF1Be/eji3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290072

The Iris block on X1P differs from SM8550/X1E in its clock configuration
and requires a dedicated OPP table. The node inherited from the X1E cannot
be reused directly, and the fallback compatible "qcom,sm8550-iris" cannot
be applied.

Override the inherited clocks, clock-names, and operating points, and
replaces them with the X1P42100-specific definitions. A new OPP table
is provided to support the correct performance levels on this platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa.dtsi | 50 +++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index ea65b8448836ead83f837e973ed536e8ea0ed8ef..a503deec97d75dcfb6792b007e0b74e517404cfc 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -21,6 +21,7 @@
 /delete-node/ &cpu_pd11;
 /delete-node/ &gpu_opp_table;
 /delete-node/ &gpu_speed_bin;
+/delete-node/ &iris_opp_table;
 /delete-node/ &pcie3_phy;
 /delete-node/ &thermal_aoss3;
 /delete-node/ &thermal_cpu2_0_btm;
@@ -167,6 +168,55 @@ &gpucc {
 	compatible = "qcom,x1p42100-gpucc";
 };
 
+&iris {
+	compatible = "qcom,x1p42100-iris";
+
+	clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+		 <&videocc VIDEO_CC_MVS0C_CLK>,
+		 <&videocc VIDEO_CC_MVS0_CLK>,
+		 <&videocc VIDEO_CC_MVS0_BSE_CLK>;
+	clock-names = "iface",
+		      "core",
+		      "vcodec0_core",
+		      "vcodec0_bse";
+
+	operating-points-v2 = <&iris_opp_table_x1p42100>;
+
+	iris_opp_table_x1p42100: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-210000000 {
+			opp-hz = /bits/ 64 <210000000 105000000>;
+			required-opps = <&rpmhpd_opp_low_svs_d1>,
+					<&rpmhpd_opp_low_svs>;
+		};
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000 150000000>;
+			required-opps = <&rpmhpd_opp_low_svs_d1>,
+					<&rpmhpd_opp_svs>;
+		};
+
+		opp-335000000 {
+			opp-hz = /bits/ 64 <335000000 167500000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-424000000 {
+			opp-hz = /bits/ 64 <424000000 212000000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_nom>;
+		};
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000 250000000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_turbo>;
+		};
+	};
+};
+
 /* PCIe3 has half the lanes compared to X1E80100 */
 &pcie3 {
 	num-lanes = <4>;

-- 
2.43.0

