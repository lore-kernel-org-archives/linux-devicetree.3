Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793A72E8DEC
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 02:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787713196; cv=none; b=Tgq4nzqxlIVw/45BxrtQ9lIk6HpRUVJOC3pe6EYJ6iMIoI8pQsug7WKEkfb9TwK09+dTjur8inKd4WNmoW5crIuCLMxgVF4j5T28YFjje/XGyyZDYLrCYjPk5J+JIehUGnVpf7srvq+huh6goPpwZe8J1Dk4niKaybvlH4UaTEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787713196; c=relaxed/simple;
	bh=xfSeMIln++UVhRK65VIx8sgrep0LonxwAM+JGGCbE8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Er97Mk/bxSafTg+7C/RNV3qYvnQU454CHpRpPv6p0HW+9Vuzs9PFPyPz05+isI97yQelf/25dVxgtvH/2m/7iapow9utDoNpmwWaaFo3/d/HDJtY8JMFVNZfXidFm4/M8+Tw8PeldeiTC7m32LJ/i41aZmYGgm+8ZGrzcFXHVWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F1zOxJ9r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hev7aKk/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F1zOxJ9r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hev7aKk/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q06oUR2972625
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 02:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nmhTlsH9IlSEOdBu8T9ac4bE+ZN/wrQucNg8DtCyyyI=; b=F1zOxJ9rMPnZLfEI
	9329WsDEk+PDqrJDkyh1duBhitRy9+xtgJMODZTOoawknSihk3DQDs23kyqoqxjA
	f6pouh3aI0vdbEa6cC9/4tMB8704o/4qntNT/XkOhulsSHzS15Ox0x2V9FZh25u+
	kIzf8Yt4mDmB/By6MWR8enO6zgPWTaPvMorx3VU4CQ+Rdj2qLEHlIAZP/IFsw4gc
	BGlYG4qE6u/2H6dGopNe6PK8x0Mr0dd2kTInayt4dzFASqeBw8I1Ge9gLBQqGWDa
	dH+HREqKSRfrFY55VPDAn//XBalBAZQPTXCLBW5Yy/mr2dYt2roVMuy/CfGSYUfg
	tFgPYg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g98hp3pbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 02:59:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f0fe57470so1835320a91.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 19:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787713194; x=1788317994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nmhTlsH9IlSEOdBu8T9ac4bE+ZN/wrQucNg8DtCyyyI=;
        b=hev7aKk/8qBe8V93jvZRmrvGM9T9FxopcFjXo+qolqjKGBu+56SWUaUlWAqNlhsd3a
         a1+HRXithkw54byvhhnGd4xKZBLr9QhNfhCclfL+rOW9EscYecFU/phgQw1Honi+SCU6
         nWpGmEpTqkRzd8+K+k9TJsTVJQK82ixXv5YCiLJ3GkavG2YhcXevGQhbxedpeB+BZmJE
         Wvt3fF/NNlNNEjxaZANuee6HADCgOGd1geVYWdGIQJu9Y3qS/yLktYu8GXVYhI8MfrHp
         0hO7SpGX9nrIR9A91qpm7xAQb/bnaSa50orp7Rhhjq584aaRdtBwdVVBIeoGJzKPC0qz
         k1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787713194; x=1788317994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nmhTlsH9IlSEOdBu8T9ac4bE+ZN/wrQucNg8DtCyyyI=;
        b=Smt4CHaGU7T7xayjGNWzGWdcQJbx55xN6DYQSJP7aRQxNyPme5UpatmOsJ6Zain2T6
         OPeEHKgNbbTo5JotpxTUDtbIW4B7AJ0dkNV7crIt2USu8zrYwJniwRX3rr2jdIvexsvF
         ttGxjS4+Jpw41gv49WE9DXfZYTWgXXX5VFlRiV5Cr+qcsEmbHYFE5RSTnrfvFQ0A1VgV
         PpWXBu36mxh8IQtjcrB65bZZeGMnTg1hys4j3kNgT99LlP1NjtZcrUylwModz6KIjcG4
         p6I2Lse0XmkqmUGGIJKKzn8O+3EeIOEFa6IbOBTJpeKuyGF8Q/EixiZrkOs2r2SRBqbs
         hKUA==
X-Forwarded-Encrypted: i=1; AHgh+RqIRjJcjrWsOTnHKP+hwKMT8NEgIY0pyzL9QJmy+nUYypEUbHCC49S2kvXHwG99mWptLt45i/IHpCc1@vger.kernel.org
X-Gm-Message-State: AFuF++kUPSPWeWGW010+uCc774tREfoH2CI9IDEXM5wl0KyAx/fWxSKh
	uyeBjUctWAbR2zrJXqnlqAtXPqFhRhTEHiQ04isZD98hrzqE5e5Y0Yb6KRRQrHxA/S4CQIJPc6P
	yMsG+SSqbKnIUU4oQ4+J/tufQEPC38P7izmYWXVlly7zxexSfBzq+4eVMW11UeLpP
X-Gm-Gg: AR+sD116M1oUXp/rVwdt65mfPs/QVeyKGInewTIvMHI+DTiKU/Xk+qhJT7XHqm1gDB0
	zzgMKni2VKVq41UP3s5rNlIlqhSBlC+j0VFqLGVIPayc/GDxaAxvqdSRun/f9TLdcbaVAx22OsY
	YhhHH3fLA/1xRQlJRU6/RXfcLUR0ANfkGRHJ34njCuCyVhAetryWj8jz48zarSr9Qr3mtAieayB
	d3auYgc77WqhgI2g39gKfR2FuhBYdePrWldngHY1LN+HOhYtdMAucsujHgyNDPhb0s7BSFEf+vr
	Wbbpmbq5z9/t69oZb46qrPcHSwrhAK8lPP5oBlJ5FS+5dmD/e514WX5IiZebv3eP5XsYCgo70hh
	dfPcDtjK6Ue3ufylIlVkCRv1lx6rxwHqyDgUilQOz4xIL8nI=
X-Received: by 2002:a17:90b:2e0f:b0:37e:1620:dabc with SMTP id 98e67ed59e1d1-3964543b889mr15530122a91.0.1787713193979;
        Tue, 25 Aug 2026 19:59:53 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0f:b0:37e:1620:dabc with SMTP id 98e67ed59e1d1-3964543b889mr15530076a91.0.1787713193566;
        Tue, 25 Aug 2026 19:59:53 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8f20036sm5222405c88.5.2026.08.25.19.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 19:59:52 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 19:59:21 -0700
Subject: [PATCH v10 2/5] arm64: dts: qcom: glymur-crd: Add PHY supplies for
 pcie3_phy
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-glymur_linkmode_0826-v10-2-56ab597d77e4@oss.qualcomm.com>
References: <20260825-glymur_linkmode_0826-v10-0-56ab597d77e4@oss.qualcomm.com>
In-Reply-To: <20260825-glymur_linkmode_0826-v10-0-56ab597d77e4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787713189; l=1201;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=xfSeMIln++UVhRK65VIx8sgrep0LonxwAM+JGGCbE8s=;
 b=5fWFuGdu/SJ83HXD+pXtTrfl7H4aGf5+eAShGusv6IQuu8lVR9R+sLxg/luwE1yHo9CbvtWHM
 VlL5mftUliPC/35RFaw4uMh0YNQod8fEGa4eMUCUPXcZS7Gt+4hv12B
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: 5edAr4PhTQj0ZucUw2TB92eeGgK_t6gZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDAyMiBTYWx0ZWRfX90l4dm4WPn16
 oNEuKMkwSf+fJUPF0Jxoy9iuGfs8tM6KWs2AEMga87qIjr6SiIYAjwTnZHpSfRzCkUxBlJ7u/8A
 KDFa2PaeZz74SDZJSLsNxvELuob5Et4abFm+5C/xVuB5yhMXsLFz/k+OHnMQhPJJjrrJdyJ6zia
 VbmmddPQznfBDfKOvRW8RCblY9V9uhnZEwJ8dJRU5wm3DKwwlj2cenMpaBs6qVS0wGZoBymEmJc
 9Z+Z+SK61jHcq0IxgRb3y8s9faj+Yvz2ppz34sDkm83gnUyaDVrI6p7FwtWBaF/Z1bGc2nQacxw
 iUeFr+2s7Wgj7W8uN1OKksI8J6fJARPDqgdrRNXKhl9GGUrmD0o5MP8pT5kiKutODiGKeR+rCF0
 MVPsnL3RITrwqCnPsu0dZyP1xPciG3RLxvdXggj24SApWdXrxb6wY0ple8wGkSSTjqQ5gX+ofRx
 tf8gPW2qNeQU9sTVUIw==
X-Authority-Analysis: v=2.4 cv=B7CJFutM c=1 sm=1 tr=0 ts=6a8e56aa cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=QdOup1CusybIpKGx1HsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 5edAr4PhTQj0ZucUw2TB92eeGgK_t6gZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDAyMiBTYWx0ZWRfX0BZ1T0735cuW
 Zfgoeg3oTHa8i/9e6NrLNCXprkywgOs1W5KJnf44h2UnztbBzAfqUBxgmUFD528w2A/k+5lQshI
 I/iXewBla/qQLmYclwIq+m5OzRuho+M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260022

CRD wires the shared Gen5x8 PCIe PHY's regulator supplies through
board-specific PMIC rails. Add the vdda-phy, vdda-pll, and
vdda-refgen0p9/1p2 supplies for &pcie3_phy.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 44766a73b0d1..b8e3fedcdea8 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -29,6 +29,14 @@ &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
+&pcie3_phy {
+	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
+	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
+
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
+};
+
 &tcsr {
 	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
 	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;

-- 
2.34.1

