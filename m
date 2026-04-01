Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E303EF678
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 10:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775039110; cv=none; b=gfhd5wPpUDQqj9F5cv48A7VrQGm4zLA3ezA0xuKkMjfg3utjXMoaRkRfUEyKDmgHPh+GEwBfGm7QrX+YxYQ40Tgkk3qLjAwzjDjhpPBIKNqE1180vUeAg4taQfNN5loRZ9qKC9Bf6Pu3BMCpCBp2K4ULFPrSF1SDbXnKWNs7f18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775039110; c=relaxed/simple;
	bh=1dmiooNPQkr89APsW+bAkLHkyd+sCwxlLZbOfdbo8c8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=np6oBS9SSwzt/gjDlcF47OZMygpgCuaTvuWdA77F0FRaMP4u287LnyQxgHXl+rU0xI8RJoX2UOO3+daWNZvZx9DIb/CHEUtBoBG0gxaFtgkXAUJs+cxF6zax6izo/6r0ROMYUVy77LtNNGs4nMZdvK33VprqZGQAxU8lLD8A6MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X7IPzeB/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g3xywa70; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X7IPzeB/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g3xywa70"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317ax0g3081559
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 10:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HuvnuIbyXBL9MReJmRv02x3/ZkWrCTMC8lwH6CcS2bc=; b=X7IPzeB/50VZdBfe
	WZdT8g5DHDDuHxY+IgZzKFbcWz/pqLcC9jHFdIW7zyiZUFD4GpeL4yjgFxjtPPuj
	qHg1+jUcVSTuB7YYlYSB1A6AaHWocwe9P8oQw+Mhac9qR+JKDtC/gQJVBtH51E/f
	3smL8iBcP0wsJVT+xMs7tpslxGR1dIS2jUERkoEV3rcYgqafTO/XYGyeAL89MRTA
	m9hke/b1yQXHIs3P5cErEUwWtTvFd1aYNubEJBBm9JQDayrIg6FCn4g254KClSd3
	5KMfD6N0DNGcW9t8NQG+Shl+hTLpfxhdVgh8JUTQ87yoKJZ4E3vSqDKKVfPnkwqw
	z9Zaxg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kdkujxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 10:25:08 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c769e2b1bd0so1886088a12.2
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 03:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775039108; x=1775643908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HuvnuIbyXBL9MReJmRv02x3/ZkWrCTMC8lwH6CcS2bc=;
        b=g3xywa70XLd0SA4syhIkaXwztbPGxGmvTX1UU5og+k0Mc6DubUHpqEoEAaDW5gu+U3
         jL2YJyvpVnRgvR5xo/JwiWV2UDAu3suIE/cZe9fk015SfYq16BmYkkUOipxg2u/RU9Pk
         L3YzuMP/GhS2fpZo9MJqOasviCs1LuddHUzA5DBkf1MYBI/3a7vi2DEVHuuY89BJU+eC
         HyAw5+GcRQjz/LXY+yjL7JJjvkAwTmEH6DGIT+OUcp+4SMvOUz4+RkKGQPZl+OCfHl1C
         Z8YzHRmBbI07gHqJOkqb9/UkqlxBgoUy9myVsvAfeImbxBWUrk/QO2RiGKdNCG73wLWV
         aa/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775039108; x=1775643908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HuvnuIbyXBL9MReJmRv02x3/ZkWrCTMC8lwH6CcS2bc=;
        b=m4XU4b2ACM6lbfTgKVdp0vtt3hRFHUudpCv6QgbD3/P6r1N0g3T87VIixSb8uEhYqA
         OXtM4QjCO3eoWsG27IzL+OcDp6UsVmu6f3f9Y9oivic9AdInTkUM1Xuc+O3l/uBlvonx
         HPEIDCytkq/q+uEzUs5d/fIIC1EdsEGWox+/TdmmBbklwTLdH2VC8UGzjEsy+LEfy6IL
         KrAN13b3tUs9Zw5hb8HU80owXMQ0e72awgZqxSgi4PllidzKFvC6soEx1VP4lDr6SRWA
         a0IacQ6VlckNgJIRpmMA4oSNIhWqRG1ekxjeINyN4JBSaJWyx/08fJk2P7hSW0/fdlkZ
         BH/A==
X-Forwarded-Encrypted: i=1; AJvYcCWt7YU24JF4EMgB+t+UmhWmr9lZ3wKA2hYOJZ5Q6Z3cW1o7O7LvQ+zjRhF540mRRpre+c4N6UUXsZPl@vger.kernel.org
X-Gm-Message-State: AOJu0YyqIsSkYed+9gcLODrsHL+bYJsXC/wkSDONAabTlC80wKwcsiWA
	8xPJPt5YncxnpsI6SphBCG24bSmk7vw9mJoVw7EZgHUT5YhfmUWxpWSChDDKCEFGj9tJCbqFqC9
	MQF9LV7Kyl/Q0Hr9OdEpt+FweK40/D4ia5YvMqxLxp26kJQNu6XQRFBRwetTIcQhP
X-Gm-Gg: ATEYQzxHdsGlqt/xyWFTqeJyrX1Uqea1dksjC5TlH6aSnYSdZQBLFHJmKgGwO+l7A/w
	WnGs/v/ukOHYS3L+OHfcDnBlT4t3YMCx3IefXARv2ZlkL/tHVDZf58oe7RD9iItskmOG1eL6648
	cJzHPQaZXvRNAkRzDgfb/gsqEYQvQIQ8mN6gfLrAVqxyiMu2HwICUAOnoH11/YX7oBgA36o3zK3
	w01mWOMql2THX/IOvl+Nz5cbj0KHKPDKMIDugxEerFQIgDtgSwAvwYa1tiqF7tbL3Jb3LwF1m6i
	wGkbRx9ZJcMd102w6E7o81LXp6/NfGBTTHEO+H/TXvQACkKgjY/1KNRvTXqJ70TAzPDwM4HiW+M
	gReRw6NWqcmvt8Mb+eCuDnsff6HVm/GJ0K/ZXEmMc1AMcTlwvEIwhRHMKNxk/RBkZqaBpAOWv4I
	7OFiWacY2LIZCDvm1sx88J
X-Received: by 2002:a05:6a00:4215:b0:82c:693e:54f1 with SMTP id d2e1a72fcca58-82ce8abdb19mr3408333b3a.45.1775039107495;
        Wed, 01 Apr 2026 03:25:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:4215:b0:82c:693e:54f1 with SMTP id d2e1a72fcca58-82ce8abdb19mr3408295b3a.45.1775039107027;
        Wed, 01 Apr 2026 03:25:07 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843bd8bsm13348329b3a.10.2026.04.01.03.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 03:25:06 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 18:24:41 +0800
Subject: [PATCH v4 4/5] arm64: dts: qcom: purwa: Override Iris clocks and
 operating points
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-enable_iris_on_purwa-v4-4-ca784552a3e9@oss.qualcomm.com>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
In-Reply-To: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775039081; l=2683;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=1dmiooNPQkr89APsW+bAkLHkyd+sCwxlLZbOfdbo8c8=;
 b=eL11ZkegQ9t6Bk4BhAQFCZ5TfjIVkGGknaDa8boLZszHRJBbjaUgifBFNLKX44TK4AMHlhl9f
 NEg2BQNY0DVDIwW5XQwIRDHG0SN8YtKEg4VxUXqHi2EepvYq1HLiqVi
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5NSBTYWx0ZWRfXy3/3BRT7+Ere
 W4g7L/RUPVCRGrnbzAo/uKMAvFjzwjlrU3MDuYvY59BMCzBnXdvyORGfkPkEPOGzf5/XhBEPJpV
 qjeQ1LNf4DmMaaLCuiyvcV+u71M4N3DJxeTLn0TbIbkDNnr+A0kxh2K/sn0QlLgRcCLynDIeDTC
 Vp/pL7fBr4l7ptS1GhIyzbmVrp//2ojvzHbtz/NTwa1NdxW8z5AUh1driEKRM5kDzg2o2L+rW4c
 8W/5vGMeM40cfiUdvQfIw9NKxTmMsfBI90MyL+2Bu9hJvtp+OzRfdubBTbevl1shKaCepgEtBds
 wuxabSduzvkZawpKMvL4B5BhC4Xyy4irBsKTNA4lveX62bljaY/VKPPiAa7j6cXwqUckNu6d2QZ
 Vx/IsdB59QdydaVYMnrD8y+Rdz9zjjQ9hLJlwycKzIDLcsxrfaYHC1Z/zkxoHb7mYkZx/+MWSn0
 r/e1xuz3SM/tJpopUFw==
X-Proofpoint-GUID: FBJ9U0EU7Nao8pzD5ZrSogJx8dg5tM2h
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=69ccf284 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4TMTxM8xbnWuMOlFmbIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: FBJ9U0EU7Nao8pzD5ZrSogJx8dg5tM2h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010095

The Iris block on X1P differs from SM8550/X1E in its clock configuration
and requires a dedicated OPP table. The node inherited from the X1E cannot
be reused directly, and the fallback compatible "qcom,sm8550-iris" cannot
be applied.

Override the inherited clocks, clock-names, and operating points, and
replaces them with the X1P42100-specific definitions. A new OPP table
is provided to support the correct performance levels on this platform.

Depends-on: https://lore.kernel.org/all/20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com/

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa.dtsi | 50 +++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index 70e37fa91f5db83e66f9706b62637f6e18dffa89..c2f4457b83e193cff20120c50b53bf4c67e57239 100644
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

