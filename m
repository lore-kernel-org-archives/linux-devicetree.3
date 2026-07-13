Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F4E3E7145
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783937864; cv=none; b=JIjOO5uXz1YWcjqhYABNaRmDZPU2827HMwVGg8/9vvLba8GtYWx1zDd8q5go7xtrS4WDNaMLCz+z3WFasdPxLPMwr0O3NsDsHMDnuVx7Pr2Usz+ip+QOob0/LkTbYijUojoIVaReNaVFs9QafN8E1VtF6ZEpwjAc0oH1CkNJKto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783937864; c=relaxed/simple;
	bh=Q35tEmThwDSV8taN1j3v6V0IvMdnGpuJ/m0IFsZUv1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RlnYncSkp6itNiSQfqR+26OfH9ewzx16nMAmzuC/Sg01gtgsp5d0w1zCJynyLsopRjTQ7hfond7amUZtaHZJas4f/8jsh4ANDlYshnWC2jZPbqBSG7EIEvzWzR08cUalbWvC0payiGJ3YPvYSQmuh5WRtXEcfsKvLmmVOCKBN2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xy+/TcMK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NnXzO8eK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xy+/TcMK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NnXzO8eK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D77RcI810576
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bz8i/lXrRxz8iYZk60vWniuTpNMwRglaoZ3pHR7JnzQ=; b=Xy+/TcMK7ol+A7M3
	qMktBs9rkfFhwtCQrphp4smiNpJNf2de94cDRESBRfifVjtrkr/YQVrrWOZmojen
	8GMLYoqhlh8M9wfm9v9w25KFnlQPPxge9CRtd4YG5aC5dAWLtudzxStl05Z/vIBm
	xZerU8oVDmNZX/c5QPZ/UE9VqJCRl8wQCZxMU2F1XIpV+e3Zi8lFU9+g3Pmtfeku
	/jVei1ndAFIszEIZeIHQ+oje77KWpUOQ3Jtsf4ID3M1jvkUeQRCZQfCYT5tlE7Yx
	qCAZqdFrMaQvq6Htt8XN01zvC1UY9+rWWRH8Ur5em2Pi8oan2OQI7xMtee1DOYTt
	OHlfBw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcubsrq0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:17:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccd1958e8fso40731805ad.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 03:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783937860; x=1784542660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bz8i/lXrRxz8iYZk60vWniuTpNMwRglaoZ3pHR7JnzQ=;
        b=NnXzO8eKTWHnV2H6DpUIh13vS1l78wQWSS92/JK7wUsWAAubsOQ9IJ/E6P8R/r1R57
         l4zy6NjyQnvmV3nEECJKA/rhrKpADl9HCSQCORuXFi5ubwP2uyfGECAcsytQfH/4Wocx
         p9LeE9Gh6w5DixLBxgLH9h/MW8nqu3pxkSv6UEE6co9nLoiEYVfqEH1SRV3boGxE2Aoh
         5w0rR9UCbmRlLwkomeFw28TIXi791uyvlDc8vrYMPlP+JmYEZxDuEy7gLGCBqm2AfStT
         Nm+k2HEJ+K825q1eo0H4n0Fuct1UV0TEpzqxnF0GhuuaSC+H3Ik6+dvVEmZ4EIXMeWpf
         UGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783937860; x=1784542660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bz8i/lXrRxz8iYZk60vWniuTpNMwRglaoZ3pHR7JnzQ=;
        b=FXMKw3JpwPp6Q3DAyiWIP4TlpS1jQDjeeO33FVTvVny8Wg2PI1YDz7QooqSoWsgsTa
         aM3Tb29leohsPxhEmqZ3quALH62gtONLHSVLcQXoFt0d2ihCtN7QJg/0VHrILvKVvcC8
         IOWWwlzVpi1nJ14T5JhuWnRHbooO0k4386QgbzhX/2FGW1k+GqbBvAVqKzyXHNwmE7Gn
         +K/XSb7vrga6wGf8kPvVzikA/XyBVVhs8xZi8wH8Da0XG2Xxx2wgLJW03wAD2JJFA4ra
         JecXdvZ4k4ee14ZQAnAvc+hllq2umBn7OOvCOWKJYhRB7L89xyRa3IsPaORi6BHwMpi8
         x8PA==
X-Forwarded-Encrypted: i=1; AHgh+Rq816CtJqYQD7PQetx/xm8K32pwKi0UFjfbFGLCDP9n8j2Uqru6hvavJxNHzJ8alUSbu5K2IYkLAUNW@vger.kernel.org
X-Gm-Message-State: AOJu0YwmCoXMp0pwYm7GBAxeLSG9DavyngbaFqRSGi913Wr0Nw7/Vy1j
	gaXND7suCE2JA9dbuR8xY5nWp35i5+P+14+mKPe8c0zn2d9jKtjVQGTd1k7trRBK8ii3W4Ax3L8
	mttGYYbp02TGnYFBMGg8Z4Uk4vxYkQ888k1f1oQAirNHkaCEIclMBeyH7DSvxgrql
X-Gm-Gg: AfdE7cky7T1RnmQuCuEoIcspwx4AKALZkJx8xBqkCAmrrueER5KbYuEVmYtzCAxcYMs
	V8vzdGxJ/WAoK120VYAxQX1UZAo4tET0dTUANeYcorAZ5YtI2aTXagitlGylGjSb23XOFl+/X0v
	Zg7BND1HCepwnIkvFEZ81hY8q/yCzCM8rpq/p8a4j/Pc/DHEJ8HFGcCXqatI388xOR2lBaIqRXv
	vYJRltEPHDNDwzh/GxjFcUadrCSkOkqx7D8LQJDDFR9ttLeKuplgAqmEJrBE5YjaeBRFTQTabge
	+VUkHdY5AJoH3H5JUzgkW8TCt1lv2dHf/QX5ThRArb/vDg1Lgz98EMYHahsr55Iv833hiQFpZSL
	b+rjrOFrscXZDj3xd55aezwP161V78THUn8j/RtiimcAG7OYVgoCsNYBu5hEZPZBV9YqTFOEyqd
	NF6dR4NhySAg==
X-Received: by 2002:a17:903:2445:b0:2ca:f21a:a6c5 with SMTP id d9443c01a7336-2ce9e5a5525mr79206225ad.1.1783937860478;
        Mon, 13 Jul 2026 03:17:40 -0700 (PDT)
X-Received: by 2002:a17:903:2445:b0:2ca:f21a:a6c5 with SMTP id d9443c01a7336-2ce9e5a5525mr79205845ad.1.1783937860033;
        Mon, 13 Jul 2026 03:17:40 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e1aesm98257925ad.39.2026.07.13.03.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:17:39 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 18:17:26 +0800
Subject: [PATCH v9 1/2] arm64: dts: qcom: purwa: Override Iris clocks and
 operating points
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-enable_iris_on_purwa-v9-1-633d7b87f0c9@oss.qualcomm.com>
References: <20260713-enable_iris_on_purwa-v9-0-633d7b87f0c9@oss.qualcomm.com>
In-Reply-To: <20260713-enable_iris_on_purwa-v9-0-633d7b87f0c9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783937849; l=2709;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=Q35tEmThwDSV8taN1j3v6V0IvMdnGpuJ/m0IFsZUv1Q=;
 b=wo72HXRncoBTvwUm1vYaME8z6ZUOKoFYm1OTG881Gpn5++x948dEwwppHAh0XjwszTKHOEgXn
 VdYqApBPrx4Aj7lm8FLDNNAIN5zvwSXPdhO3g0j+zA3l0TlbnOwnbGN
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=Oq9/DS/t c=1 sm=1 tr=0 ts=6a54bb45 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=4TMTxM8xbnWuMOlFmbIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: I4FIyDdYPKs5sNsUwx1oCTYeNNRqtdMn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwNiBTYWx0ZWRfX91JFD3p92ejP
 9uNnbdPDqmh3S0d1KPG66md2M3CUi2UTGLl5Wi21ftfwGQBrj1wan+Gd/HirVTk1gO+duTqlMLz
 /Fh4BsrZVjkdhgaB1iJmAUf1moH4TlE=
X-Proofpoint-GUID: I4FIyDdYPKs5sNsUwx1oCTYeNNRqtdMn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwNiBTYWx0ZWRfXxRopF1dLkLk4
 VZdfiKadjPQ70zlfx/ayU9sLXt0s23WPTtjllnmY1vokUhxdkNKdIHwSJhQ7B6JFqQd78zBzmQQ
 wQce8e9EI3/th+irn6NZUaQdsFX1jEu+UnXK32KapxJg5VlFbPQwvM0F76/FfSU05pyXEiuzL2n
 5cPku2I/R3Ren+/Y1EPXzQbQEZzdcx2ZlEjUVXU6cllSStzfngZ1Rb6TAoml5sPaOy4hPNi00jD
 UcYOBF2wO6cXs+wrSp0YS0ME+hXKPGZ2YUaoEWyuf5r+m4bD+rEKFzMHtxyLjltMwBozCW327UO
 Wd13kIgHTSncGcHnemra9JnRyPuvGPo6mA3ubFC/HhNYM7nQDgKXrVlp3x6j+cbVBwR8+Mv155J
 3/Ts1b/Fgpdz0IpgWPHxHZSZP6+PloZyJeQPpQKi2BeUvThMpt8onROaK2YpOENKXHGyzHjnUGm
 xaTbTPA4/f2IGmGd6Sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130106

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
index 3d73d1211cd0b31799a5c0ae0faf799d85495a3f..c698e6cb2543ca31e230cec3d5a8b7553a9cce29 100644
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
@@ -165,6 +166,55 @@ &gpucc {
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

