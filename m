Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492D13CC7D6
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 01:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437424; cv=none; b=Q4mxgFsLowIBgbMDIBBCnR+MOVjRod0ROh38nCnC3X354c6/zpCFSRbSroXKZM9idzxMqiBmqxyxBiEMkaQN8Slw4rr0Q/K0Le4KNd7S9Wvt0XRz8f9eQA7MSnC3aJK6OI4OkHl0e3U4pev3PNhEpNKwYgnVHs6CWMN5TmZUtm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437424; c=relaxed/simple;
	bh=EBXnokNYAwuZSJHYusOo2/w/M/vgOB+WF5f424LJH/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X1SyD1z88lRB8xECc5pi0CE5VX1ZZwVPkVcwOFjJ7Aw8az3dA3oYt50eZDltJwtOugtb7b+zhFZk82y1eOC+DGQUkIVzAQB7IRF9e7C9DbJW6yQ9smF8wm3zHBgR+cb7HYOrwW4GAuxYW1X+y9L55v58Qj3/73dMP+Id/LpTkrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jb5AH3Nb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gbAl3kGj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jb5AH3Nb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gbAl3kGj"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EMxjYL1439486
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 01:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=E4UfmlZOgWH
	Ktr6G6kxJDjNWp3Hjne97y+2Wx0uTOxk=; b=jb5AH3NbedZ1uG+ES/jJ0oU0sHS
	H3sD2vGNCCBjFfLCBcrHvU8eXKqGP0saGuAmxRVMBb+gT1AMAelgVtRIwJrXj6vc
	QMIuqTzmUfHJc2hZWJascEwR2fkE7spgQTBPQUsgzpU9gCjGRzXLyAmyqs/Xdgom
	iatqV3UjK2xCSzn/s15SKkc/YH9WQpb1tAzNbTZ8698Nnl1CdrBCpt+0EU4TmCEC
	cl7qY1WIX0OkbnlTtyHqD14uyvobmqm8sJQCHE505iyWpeBE1+NIFZyQHHmNLqGC
	a2c5Ocx6IWz4Uqh1UGO5S2veL919V3I/Ep8ruZZcQFAdQus5CI+FFrsYsbQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuqbdjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 01:57:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4b524ce78so2946949a12.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 18:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789437421; x=1790042221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E4UfmlZOgWHKtr6G6kxJDjNWp3Hjne97y+2Wx0uTOxk=;
        b=gbAl3kGj4FImP1y1ynHhKj1STHTXbcpIDCiD7aXcOD07c7hiKNFnra3xR0I2FXyKMZ
         MOTrbmGSh8zYgW97QFQ7R2qm4Ut4QfbDyQCG4px6NGTq87O025RlzKatMYXfEpBkw8SQ
         yjfPGutx+s9LJsPd9A1mxsQ8jxH+M6FXmnkufb4Mnkg4dAMgDtEZuUv7bnlEXSe0hBFz
         yjy4Q56fwwKzefIoY1NQ60FRYLgByNCOtG74JmHlckKo7kRNeYm3s+zKwfYJVCs25I6X
         85X4U5vWW6tL1E4h6yuhJWqO3rydR7ipE1qtRLrKqRAMmAXrbfOpQToKxPXvMBhSNPVi
         mPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437421; x=1790042221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E4UfmlZOgWHKtr6G6kxJDjNWp3Hjne97y+2Wx0uTOxk=;
        b=Z9mtiIf40dpw2evAuy2duMQ05ZWEJZqEWw63ssLkNI+Q2APwJkRLt5SwAQWH/TR8za
         0CHNbw+6RxZ7TbTbEFeJcs31RXsONdZFgc9ZgvJdvNSoh6myX2XVV2MPzwdE5H2tlr2x
         33LtZxd3rYKWvuCr+W3rUDu95pc+JWul+sRR8tMJC8WcwnZBIO0Luu5PJu1N5pJeQeC6
         8F1oiGT4oS/mfyKjOIhAmgVmjCRPVs6tknrkfRhVIkZ6Mvam8W9qCbObUc8U16vZwmDN
         Woz7pD4oFdCGs2r/aZ1CcDlF5qiM7cYUmgluoVVEDdYGblL6t0qE3A/OOz5dAR1cszKv
         Lw/A==
X-Forwarded-Encrypted: i=1; AKwUvBxZq1gQyb0Y8zaUk2wCoXmxSr+tH49gL/sSMifAAhWMbTpn8hcJRda8oHeMskHP/lW6NTWaplBp2YUC@vger.kernel.org
X-Gm-Message-State: AFuF++msFGJQ3DbCfMK9hAbqHRmQiEV9rT01vwPdZ35wrNbfKtlj7A5t
	BXjsRabUFB/mT9YOn1X9VVE95Hm5qgaqBVIT4S4YxdrYdjFyANp0bm4fw0iRM7VPasDU9/CN0t/
	Kx+hatiCTo7qyXQZ40sdOhN0d3AIVU0ZeEXYShuowC2Rgmtlnj0lhbuv7Enf5dfnwQOj/3eIQ
X-Gm-Gg: AYBFou1HT/YocBYno+8HXLniu6a8F0s46OCuABwOlGiQjMtFJZRbUBGRqCDifuwz+os
	dz3f7Ykp4lVqPMcOjBVHNcl7BXJbUjXCyyeOiA054NkjgqG2SN3JAj+wI9VKD4+9MvSZLTvaDBl
	j3c0qfKeiblzL3+6VTzJdB0sVSY+rN6YCLdh1EOgrj94L9yV3hb3mSz63M9hcUjK0/wXb/5JBRs
	yD1g6KEX7UFXO91VHc+c56M/HfYUr75Z9iyVsVuPSMYJLb4017AZDdhDV1MKC+orLucHTh04Bsb
	3u1TR3dmQg5ZY2rZOSd1eJfp6YwrpJhwJO4EY8g/nl6c9B5GlNBawBivhDhTTHB47IgFAiVenfO
	YUU9W4qkf2OzdWqxWroNfrKF8ffZxeIgMApQ+yU+J6UUce/kLri46A0xLJp2H
X-Received: by 2002:a05:6a20:d492:b0:3da:3bdb:b22a with SMTP id adf61e73a8af0-3db4057bd97mr10740886637.20.1789437421616;
        Mon, 14 Sep 2026 18:57:01 -0700 (PDT)
X-Received: by 2002:a05:6a20:d492:b0:3da:3bdb:b22a with SMTP id adf61e73a8af0-3db4057bd97mr10740834637.20.1789437421179;
        Mon, 14 Sep 2026 18:57:01 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50e3sm31115791eec.29.2026.09.14.18.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:57:00 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 2/5] arm64: dts: qcom: nord-rrd: Enable PCIe controllers and PHY
Date: Tue, 15 Sep 2026 09:56:29 +0800
Message-ID: <20260915015632.283642-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915015632.283642-1-shengchao.guo@oss.qualcomm.com>
References: <20260915015632.283642-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAyNCBTYWx0ZWRfX9gamDvnkzmn+
 NGFTJ8XOqpmbaV+XhF+hUCsYugyTlCf8+l5pNylo0o1AWooiL49vXTpviLJP+55j1EIj8ljOMiC
 BVk+NgjYYZ9nKdE3bJm647F/ObPOcO0g3AC6gjOHay8fHs/HnsWsK85t+P86te0dsmuyg7+s5Ho
 7MzhDYEKTsqP0B+2KCGr6TvO0xUoKa3y3YntZU9X/SDCrJTZSTsMBxvMNDJIbYmNoU5x524DsTB
 uTkIYWUJC0mrkXF/Goo1pjjz34Jh2ADspRF1EUsCUBOjWo0DyS6VQ2wZlQMv1Yu+SGui2bwLa3I
 Ko9D3mln+pG7nS5gmOKYdfGJI6kGr6Zk99BTRXuH5DmI0iZtO2muZ29iXxyCexX0SdfSzigt/9R
 Q6MXSfAUyXFeYZrXf/0ss17ra5p4GcAq1u2tYKUiL8IyqajEW6c1DKE5dXjWyupXgvLL0wdrdkB
 f39/38JQX+/FyrEjF4g==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa8a5ee cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=f6-OUQb2phOXiqkgZ7QA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: c-K3pkaQgNmJ37iDFLMYctqrhxucFqi8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAyNCBTYWx0ZWRfX1cIQbri19NpU
 le6K1Cn1llsK2WrVjp2oPBoOEkXeAXAzcXB65tE0YCV0xJMISeeNPb6G9GgfLhH9Jyrpl8na/su
 Ch3/8V+UAbB3ISv2z+URVjck8hyuhWo=
X-Proofpoint-GUID: c-K3pkaQgNmJ37iDFLMYctqrhxucFqi8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150024

From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

The Nord Robotics Reference Design board routes all four PCIe links, so
enable pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL
rails, and describe the PERST# and WAKE# lines of each root port.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 49 +++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index c547963371b4..4c4d54d7aa90 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -377,6 +377,55 @@ rtc@32 {
 	};
 };
 
+&pcie_phy {
+	vdda-phy-a-supply = <&vreg_l6a_1p2>;
+	vdda-phy-b-supply = <&vreg_l4a_1p2>;
+	vdda-phy-c-supply = <&vreg_l4a_1p2>;
+	vdda-phy-d-supply = <&vreg_l4a_1p2>;
+	vdda-pll-a-supply = <&vreg_l1e_0p9>;
+	vdda-pll-b-supply = <&vreg_l1e_0p9>;
+	vdda-pll-c-supply = <&vreg_l1e_0p9>;
+	vdda-pll-d-supply = <&vreg_l1e_0p9>;
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

