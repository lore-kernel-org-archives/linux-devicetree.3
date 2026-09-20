Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7683C3F5E
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 09:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789896013; cv=none; b=uvHjvN8Vhx6QFl/kxW2A8cCodfFSjeaRUhuc+7Z2zv+ysniEljvNkirppIlI0kEu07KgsbbloLSndgsntAQIEiXnopiKRYzz38GIp5z0TOpeWa1eghz//KuWZxNHiMm+c7fOledtKdFV1U4F8MJPzfka+g5/pe1gK9byDg0jR+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789896013; c=relaxed/simple;
	bh=uPpsiPfsZW7SffwB8R+c+qZFY1UdqaJ5YycZmxJ54hw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MV9rZbCmVarudnBK40cJft39HTd0I14GhcKjcoaGQOBZsCRm89TKcjd8p7/yBvfZbueq8jxh3rw/NoAdYcBOjXUcZTsIgndpUBVMGhyn5YhDywWjvE9yxBJLm8ejnlHn7/j7YYDoNUYGS/whywSN8/zWHrMDLUTUP/LoVu0AIVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cIS7V/iP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hDQCzaUN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cIS7V/iP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hDQCzaUN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8Vp3s579019
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 09:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LD8HUyazyLi
	CHKBH7P6g09BRaF2l+Aj0hkNJ/CZjDVo=; b=cIS7V/iPf0iXEmdZEGk1wXdWPds
	M5QmF16M+iZpdxYDfjtmjPqQ2fVJPw78060wY69SMxZhKind2Yn2jpgM2Qxd+w6j
	sfd/pndSqVHr5IGFRZ2PBC1TudEWIGgIOTthOcr6opdubmwCLyviU/l2VGSL56EL
	HEzbP+fVDI7k9dSlxeVun5QiFJc+TJlIcns8SGpquNZaTVtU7ckY6K5mXtduh03C
	y+NZilNCnXxKLReWUqFscZs9SJlVChI9TfQlLlGljh9GaS8DjJ+gLcSFwN/4+Gj4
	NT4kSSj/FkYOAW0FQUXQuzpD55gtIZHdzi27jnnalE6nnQsLOsw75qDNX0A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskjk2jkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 09:20:10 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc73ab90ae7so385789a12.0
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 02:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789896009; x=1790500809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LD8HUyazyLiCHKBH7P6g09BRaF2l+Aj0hkNJ/CZjDVo=;
        b=hDQCzaUNLJz7u83BmOXYSSChvCh549n3uo7adq+mBbkaci1+JFKwYlNr2JkC5vwN34
         6wLZNnK+z5XMPxgHsrPBVwoKOtlhsIZF+NXvmJMRKiatUM+4bcCeel9vGpvpfYoL4dG6
         VImqaVSc1FnQSM33KtVMnnvXInQtCGGYxdZqgDRnaIfEBOhd6/JE1r+MC8gMD2zmJnQN
         I7KC2ickA6cPSW/CxJrPvN1sI994p9jmJ5F4UKc72cau6EjYuxjyUW4zWGteXeq9xLLr
         GztTl1CKQwGoKCuonKkG/ExcESnoq7QiD4+F106X7dpJ1sBASDqP+mjCGBFFRUdJ5KJJ
         yrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789896009; x=1790500809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LD8HUyazyLiCHKBH7P6g09BRaF2l+Aj0hkNJ/CZjDVo=;
        b=Uoe+dQc98EBM2N16SAP+daPE6eMNQt2M+3p2Oi0uI10Jzc+FqcBj6FWDBnIwMEoPy+
         scJ7ZQkRcq88LlJWewK8PP1m2+I8YilejR4ZgwmIjLYrhQaSPlrCgK3WzlwGHwlXz7+Y
         4o775S1rh8MABKB27/VUHH6JBiil657WLXwfkg5Tp39mkIhlSJKFiwfU17ut7Cmn6/96
         zPdomoYKsEu4B0LPwdsVOFIA9sTmYy9Rvcu1twoyBwU1/w8pQIUGZ9EIiVFDONzVJJ3j
         QMBqgeSbD4rcTLh7vFHgpaUIjHe95oiroq+8ssZHOq0yG7as8oEfd2dR04sAji1hqrT7
         StCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcfUe+IwGbWdAVWYgfvCgd38rvw4njZ25phqlpn3F5gLGK1EaEHxJY6HXUSivXFJeqAgrqP7ywvQ6r@vger.kernel.org
X-Gm-Message-State: AFuF++m0DsVMPNH9vwpAUHrWcFApTH1HkIdq8lFvPbzU2AN0RESXk3Zd
	MdD3aagVF+zumZcsECIUNvBzxIs1mto3X+JLvoqUn/Hr3gVc3T+Qjszu4TTlp5508PBV6Xyh9/6
	eFjQ2zsxaJAieByDajCkz3SM38ZJEMqQETa0BB8AlcRfodajDvdpiYRsih1Y6GPMp
X-Gm-Gg: AYBFou2BwS4cqPl3YU4f0bGfWX0kG2d98hmXE/eTK5p18Y9xcJF4MiSqEUv+AzMkCdn
	9k9QsyKF+u7uxCUzACmtYJbg1C1JBGJoXxV1JkYfmKDi4LocQk+p1iWqZgCSi/HHs4jr8qgyBRY
	RY28q+st2ogSmCFxLd+zE1UiKAHzIUXeN7krtuI19Ix3BJjnaRh5nFuRUqQvxNA7afxOvGY0/ya
	iosGsSqjSSLBVy5Pm8JYSIojig49YFFPZ1CH3qtnMjYpUECkAReNScWRbbs/BRnLnxj61MdgMYE
	S0pQotEtPKRTqhzcTSfFRc1wul4NhFUgzNxrhyMwkM0uYPElCwW9JytUIAeIPHrk6N1yc1H22ao
	UXmGjqPQ2iMFWX7zrl8YDnTXwJqimAoT+wIj5pQc6x/Ony/wH29jWKmav6WU1
X-Received: by 2002:a05:6a20:b78a:b0:3d3:ae40:51e8 with SMTP id adf61e73a8af0-3dd8c575882mr13402029637.28.1789896009419;
        Sun, 20 Sep 2026 02:20:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:b78a:b0:3d3:ae40:51e8 with SMTP id adf61e73a8af0-3dd8c575882mr13402004637.28.1789896009039;
        Sun, 20 Sep 2026 02:20:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm9353630eec.28.2026.09.20.02.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:20:08 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 2/3] arm64: dts: qcom: nord-ride-embedded: Enable eDP0-3 display output
Date: Sun, 20 Sep 2026 17:19:29 +0800
Message-ID: <20260920091930.2215803-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920091930.2215803-1-shengchao.guo@oss.qualcomm.com>
References: <20260920091930.2215803-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H6JOUOYi c=1 sm=1 tr=0 ts=6aafa54a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=F3f4s1Zse-zWnPoJeOMA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEzNCBTYWx0ZWRfX1RADCts+Vy2W
 3uXu4dE8CyhVWXJmzcgcnNH1GbrtG6eIDmwj1uBCJSfGNGrkm2gMs8uzMKwoxQH8wrmoFvD82D2
 CmalM+d/3Bh5Wz03ws5aPIvRzzoGwnrm2SQ73FdTyOBUp0DN67F1SJRPpD1jfX41bKTfQlHGzZ6
 hK+PP50Rv4W1ICs8qmNg/cKqJWuPsDoNAqeOlKthQild7nU/heVoPrmjUzA0A5xLACrKl8e6cbH
 HBKPOp8QqDH7gZLtN3rhF3C/FV13GU2E8LLlAixHdp0mq+LSdGgQj6yKJNEdm/dnbIHt7ZBYPQa
 SSfcCKvSRx5x9ABWst6iuF9HA6ZkrdqVgsstVsnOk4GNCd5dLuGUw0jOR1nkz2x4TQRMKvP3O82
 cNlzUSdab+X4WOl3HC5y7jw3WSyS1JPaE6b3H66sHoRtA6q+HpSLH7zdrh4kk9yC0q1fEKMWcwM
 FYGhdnd55WwCjqsOjkg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEzNCBTYWx0ZWRfX0eQ52rjDPlZ/
 FQLNav/l6sW0wUOQK7m5Kk41y1JNdCtnlsRaBXqVtliYd7IXH9vLgTsg/QuVSxzUcdysYnwoecE
 MDimvQvFfkC70C8Hy0syT/UZlEi9jqQ=
X-Proofpoint-ORIG-GUID: ALPOhMMGf-A_nDjo4mAIKSDBNdSiul7l
X-Proofpoint-GUID: ALPOhMMGf-A_nDjo4mAIKSDBNdSiul7l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200134

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Enable both MDSS instances, the four DP controllers and the eDP0-3 PHYs
on the Nord Ride Embedded board and describe the eDP0-3 connectors,
their 4 data lanes and supported link frequencies.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 128 ++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 09ee525764ef..1bb47b12e6ed 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -53,6 +53,54 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	dp0_connector: connector-dp0 {
+		compatible = "dp-connector";
+		label = "eDP0";
+		type = "full-size";
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&mdss0_dp0_out>;
+			};
+		};
+	};
+
+	dp1_connector: connector-dp1 {
+		compatible = "dp-connector";
+		label = "eDP1";
+		type = "full-size";
+
+		port {
+			dp1_connector_in: endpoint {
+				remote-endpoint = <&mdss0_dp1_out>;
+			};
+		};
+	};
+
+	dp2_connector: connector-dp2 {
+		compatible = "dp-connector";
+		label = "eDP2";
+		type = "full-size";
+
+		port {
+			dp2_connector_in: endpoint {
+				remote-endpoint = <&mdss1_dp0_out>;
+			};
+		};
+	};
+
+	dp3_connector: connector-dp3 {
+		compatible = "dp-connector";
+		label = "eDP3";
+		type = "full-size";
+
+		port {
+			dp3_connector_in: endpoint {
+				remote-endpoint = <&mdss1_dp1_out>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -366,6 +414,86 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&dp0_phy {
+	vdda-phy-supply = <&vreg_l2h_1p2>;
+	vdda-pll-supply = <&vreg_l1h_0p9>;
+
+	status = "okay";
+};
+
+&dp1_phy {
+	vdda-phy-supply = <&vreg_l2h_1p2>;
+	vdda-pll-supply = <&vreg_l1h_0p9>;
+
+	status = "okay";
+};
+
+&dp2_phy {
+	vdda-phy-supply = <&vreg_l2h_1p2>;
+	vdda-pll-supply = <&vreg_l1h_0p9>;
+
+	status = "okay";
+};
+
+&dp3_phy {
+	vdda-phy-supply = <&vreg_l2h_1p2>;
+	vdda-pll-supply = <&vreg_l1h_0p9>;
+
+	status = "okay";
+};
+
+&mdss0 {
+	status = "okay";
+};
+
+&mdss0_dp0 {
+	status = "okay";
+};
+
+/* eDP0 */
+&mdss0_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp0_connector_in>;
+};
+
+&mdss0_dp1 {
+	status = "okay";
+};
+
+/* eDP1 */
+&mdss0_dp1_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp1_connector_in>;
+};
+
+&mdss1 {
+	status = "okay";
+};
+
+&mdss1_dp0 {
+	status = "okay";
+};
+
+/* eDP2 */
+&mdss1_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp2_connector_in>;
+};
+
+&mdss1_dp1 {
+	status = "okay";
+};
+
+/* eDP3 */
+&mdss1_dp1_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp3_connector_in>;
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

