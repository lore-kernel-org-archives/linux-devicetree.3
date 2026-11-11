Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383533;
	b=aUscxqiuM18oiZ8qs7haA5kayV/Jh0SO3lTP5BieErWstnHlF/EYil6Q0Km8kWg7X3UR
	 oDI8XkG/Ubdoth8MdadZOqAhtWtVposQ5YfZ55HdxgEtJolGn4Tqv5halG7zJ4ph9+MER
	 SIur9lQJJIWITbxWVcy4d96VYjqu2v5cotSEesakrC6gKvc7jsKFLXu6+u9qzEGmtJ98B
	 IifmSMT8nwUYNdrZUdQp4PnY77/dgxarKRm32PpBARiVyT6QH5lOdd+8dveUAf61+FW+C
	 fUcNpGaGKr50nIYrc1/szR+5A6fgZmWBGazIoWw9IFNmYJBDw7k9vrsC9fKS/Dilm6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383533;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xvXRY7fo9j2LxYwG9sASKkXrJG/YBIxwy5thc/SS8HU=;
	b=jxb5y6+Ci/IgqrqyDtB9TVAkXwzQwkQLxHhVI2TIFUKZRvpYz3CXyjHs6ucsDTJLlNQm
	 /JbcEDseGqXEZLy6wLfXcCP+PUMkuclZsxdeAENLpGSDhA0B1EqpE6O0It542pS0SX9Tz
	 xs8yvuFPDWrfVqxT7SC0FCydadnafZfi3advNMDqOg3aXElkxY3cPjyV1QrwUm9oJLkco
	 82pP2nTN9B4NJsjU6DICjERB60WXf+jq8l/QzO3lTuUNXjPsti0a0TroyUqb0lDRCaSqw
	 Tk+3uqIpjjaNuBLIsOXrBUjzAr+3MobyXWKH/okz/OMfWsUlUli/VuiFYuCp3W5Cq9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BVno4fAi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nev7AnB5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377F7606A33E
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 377F7606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BVno4fAi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nev7AnB5
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KpwO1052621
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xvXRY7fo9j2
	LxYwG9sASKkXrJG/YBIxwy5thc/SS8HU=; b=BVno4fAiNnmG9s0uDvJ3iioUenb
	pOuFvrfSgZIrh9VYDr72xGeP/aJNshdYos6SldlQ6V0IK28Cdz9/xWdSUFOutIOr
	uYqBBczbMnL0Mw2CUeC2UtjZItFE7CK/1mxkbyLgqs0+LhuvM2FzctytxEo0lE1d
	cm9ZFqoNmECNIYvE1zMVFo3liZyiqOJGANsDgSMy6M1DmL/WuPj1KJzJRPOUvwGP
	WrqJp/Xz0GzqhwIPBg4K7RV+trqbo7YOzHMHUjdpGVhLGFHnAZwokXe5CtVG3O+E
	Hx2HpcdB0E4yeybZka6YkLACT7xgmdC+9KFmnw00o8ubqA1B/h6yUvVfl+g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdrh1fgr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:52:11 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36fa5673fccso1048424eec.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 23:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794383531; x=1794988331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xvXRY7fo9j2LxYwG9sASKkXrJG/YBIxwy5thc/SS8HU=;
        b=Nev7AnB5+ex/FQ0juxOu6Alfn5FduvyFmvYyry+IEPvMA8luIED+rCkA0Uiz77rFY1
         vZLtIgN3AqmQB7mBNVHZ3phKb1sns2zoMBIMGIdD9IHnP4aM6l5L8Ajh5TTx5NEhJ/MA
         KwnWI9ueoqtOplt0Y+9Hfl0i4rKHen1NUV7pqzGNKVeCFsZGA8lxymOLH4363cYYM31x
         3kohYIpygkxoizmiZlG3r6oFGi7J04OaTEJB07bBdf0pze5qD5yWQ/epZkbm8lo0vrFO
         HO35IxHfM3/Oi5hWcVW+VIt7Xh+AWnkeEnFtHPnPeSuk9wzdsSynJklVJnZUDhpvitnH
         0v6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383531; x=1794988331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xvXRY7fo9j2LxYwG9sASKkXrJG/YBIxwy5thc/SS8HU=;
        b=S+SrGKty+nd7mR+BPP2wLMK2HwpefB36oxYZEsHHKkjLz6zxqHdWy0B+Tf/67VNIPB
         2r0XavfWui4Th8Enb9LP1Qd1BXNM2BWC/VLfuq2OgqEwqZ4RhowGy3DGvfcOg2fXXc1d
         qSw7j9VGzBrimrFDh1Npn/iuiF09pavaFYsxVph/oRy+aXAQcqtzCMxt5LxO0Jx+QFP9
         cdDpcNCKFDCu5s1bhG2KOxaCMs8zTr7c/nZnMySVZUVnOqik19PZ3ArbOYHZL5EIWODQ
         U6kWERP4nFrdNVXeX7tTr5amEGA+jbMaGIv7u3ysEfMGu+XVQdNBe8ykYSHDvEddaXJK
         fs4g==
X-Forwarded-Encrypted: i=1; AL+hErGI553UmH1S8eafFBGntA5Q/crKtbF+nCXot+wyfWyYgjtgi/CwGef+//nOViDVtikNXDigmOAw8i8h@vger.kernel.org
X-Gm-Message-State: APuU4Z94jkzoCQVoub1z1nk0eDohcoITNDWo8AErpMNITy51Hf1HhK5r
	3Zd+LvTHFBZ5dGhRMssmwr//ZH0HR0LTHooiaNx0+utGG99zr3hWe2zZlP6LOfmT9eVDjvTQUm7
	9CbamIfjz5AMV1ZmWDtDDHlG/xid9AvkJxfFtP6gAUI0m1H5RTmm8fTdSI1bieeBe
X-Gm-Gg: AYBFou23Nk/ynEea1d2a/tPvH2ndtN4EjhuiruGE/g610xuoKTMUltKhF72//0y3A5c
	lyDIhjsNDrMYyRQiypwhS0VCKm+rrcRhhlz3BMGLD9p+hQUHANMqsKQLQgoJdxpgQtRavYx4iMx
	t89yZtFTZLIFa3vc4hUzhggnyx5oOTKPmtZcw3AgmIQKN5IK6vOg/gUX0V/ZL2y7i9+n9YbV19E
	JgGAgNps5FNeA2XBdXGdDvd6stVXIdZVB+sRnw1OxQr++FjZs8xd9A05NvQyhclw5P4wjcT2JwW
	BZYD5W4FUvF0eq/ira+Fk8n18JliXdgKJkqRxkvTkHdipKzqdfyNKH6fTRz1CogQiJgrJMUYZOo
	4isd7a5jPb77VC20VYaS4M7eCxK9gLi7IA8WBibA/DP1WA4i3SIErXKiR/EVwsF91Jr1x2hYPiT
	q/GG7VZ+1U1sYTq1u+osOH1XRET4cxpvoj
X-Received: by 2002:a05:693c:42c8:b0:374:ea35:9069 with SMTP id 5a478bee46e88-37687214143mr2418353eec.39.1794383530865;
        Tue, 10 Nov 2026 23:52:10 -0800 (PST)
X-Received: by 2002:a05:693c:42c8:b0:374:ea35:9069 with SMTP id 5a478bee46e88-37687214143mr2418325eec.39.1794383530277;
        Tue, 10 Nov 2026 23:52:10 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-377531d3287sm187032eec.0.2026.11.10.23.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:52:10 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 3/7] arm64: dts: qcom: nord-ride-embedded: Enable PCIe controllers and PHY
Date: Wed, 11 Nov 2026 15:51:37 +0800
Message-ID: <20261111075141.3710366-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111075141.3710366-1-shengchao.guo@oss.qualcomm.com>
References: <20261111075141.3710366-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfX/xmUV4GxYxYY
 P+PLpxOkoK546rSiZNAu4zIHuWkSU+QLSbfhNhpsVTwRpI/MbjFHr4BbTna6J7jvsZstR59pgGi
 aPOvC+Eei0El1wsMbEUBzQOpqqfR5sk=
X-Authority-Analysis: v=2.4 cv=PoQG/AM3 c=1 sm=1 tr=0 ts=6af41eac cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ccc3-NsNM3ZFeKEqOdcA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: MKlyCf2d6a-EleUBsfHPYySlxXDIMJQ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfX3Q0VpZrdbsPu
 WKN0WB0EzfZANEREYpZ0kQ7fkHlVXGPM21RjCFmE6FRb2Z3tLz6uEFxlzatUjYYekhIAnOiV9FX
 hn0JpcB/URK79Z3tDO1Ekpckw1byb9brQvv1NSLwCnTyr8iGcD8TaMZZ+/T4ug94tsPEBl2MIVO
 1H4Zwd+Y6WS37EjsZBfjgywaQFogHmIT9BbI/PIzhhL86lcVT38NZtyV/1FnJ61F3OJlpbTVKQ0
 N2vBDJdxuOT49VptXF/SDFyYxV+/zXsLbb5E4+mq92wzCVFFNpkEH/m1667l6TDr6Rqz1neOGti
 CtJZdopvEOlrYSaksIyL2mnJLkjfwK6LmiGSNVVvmOdPTDYk/cUZsC1ytMWP7915wJSrd3t84xm
 FbbK/m8iLGPDW6QVycmO9zrenm52KCG+rUni/KJWTyykmbkCKp8QlEGJ5+y1xFuwWexC/52ucNy
 ICsTbRN0fF8FwfSnnQA==
X-Proofpoint-ORIG-GUID: MKlyCf2d6a-EleUBsfHPYySlxXDIMJQ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110031

From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

The Nord Ride Embedded board routes all four PCIe links, so enable
pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL rails, and
describe the PERST# and WAKE# lines of each root port.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..cf760ec41727 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -366,6 +366,55 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&pcie_phy {
+	vdda-phy-a-supply = <&vreg_l6a_1p2>;
+	vdda-phy-b-supply = <&vreg_l4a_1p2>;
+	vdda-phy-c-supply = <&vreg_l4a_1p2>;
+	vdda-phy-d-supply = <&vreg_l4a_1p2>;
+	vdda-pll-a-supply = <&vreg_l1e_0p9>;
+	vdda-pll-b-supply = <&vreg_l2e_0p9>;
+	vdda-pll-c-supply = <&vreg_l2e_0p9>;
+	vdda-pll-d-supply = <&vreg_l2e_0p9>;
+
+	status = "okay";
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+};
+
+&pcie2 {
+	status = "okay";
+};
+
+&pcie2_port0 {
+	reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+};
+
+&pcie3 {
+	status = "okay";
+};
+
+&pcie3_port0 {
+	reset-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

