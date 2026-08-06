Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B794218A5
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 08:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786006616; cv=none; b=kysJTFIUQAf3udLC+n2kGzqpPMozZIWcvVo5kZHc4XF9su/sNqQmEce/aGZbjXm/UjtzzA7N5+5xUaF4A4oRMym/9hkiQRoJLLRlGJ8mb9FGu7IDFI+hnHLE3qpNmLdai8WKhTZ+yGHcFrAIDKyHAhBNfoAsnEJS7h9EvKNaFJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786006616; c=relaxed/simple;
	bh=4ZppwTlfz6Ivjj4MWFvZ2LiBEjnO14YAj/9Y226N4TU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pbs7VwTE7uQOua5qkLvjL3si8g33n8mIgYfi45lJ8ZDEXOa5hiM0PUciJHKEJjG4CO+PNTCWlpDEJdkYtWwILyaindtYgZpsZQux/sZt786Ofmccue0J00cIkhLnl5nJ5+0U/k/VMOaD39Al95mwhMIr6Zsgj5HwQqlz9ORsrc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pA5c+kv1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YeNEbnA6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pA5c+kv1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YeNEbnA6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6763wn0h1070880
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 08:56:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cq/8JyU8SIsbaGoDGFHQq8vK/p3M+dPCDwo11HF+TGE=; b=pA5c+kv1Dyu9g7sm
	n9gGef0bcjuFUS39YHLrpZObKxOK85hBtCZcut1TKZwHRdyvmckcDNvmUmf1mQfK
	xPP1ANh5fI+U+b5QzkxhT9uPfjdlN8W4VE/PLRzbXeS1qDPuNNVMXmm4wWNFg91S
	YNJdMmblo0xw2KlVw7MoFxzYbfQX7lniIrHpxHvBSvo0ImCtZyHCkUoeI/PgT7Yp
	lPOMXKCIVi1oEJuyZcu+9VR+5aJqUp95uIbqrUgQp1DofYtl7zl8X/LowGHHWZkr
	ZALyMow21xOALY+/aUNU2ny/hjVoW1KTt2IqfqwlF93qbn9kML/qMjEbJrjMUTlb
	9SBMdw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjud14rd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 08:56:54 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84eee2147ffso2577788b3a.0
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 01:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786006613; x=1786611413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cq/8JyU8SIsbaGoDGFHQq8vK/p3M+dPCDwo11HF+TGE=;
        b=YeNEbnA6oLHstGOfE4jR+3dvqFWRwSte7tWJsYtBcG3fWgp573WAEwXI/okDb5+le1
         qlVjsdyjOQTEVxi6T1sNhJb+japHqbQV21nMb3KlQBI+RJv4fGJ636pqS728AeL9y4MD
         9PDdb2Fm7zy8SV2/BWJibGcDAON+yH2KmzH+NaIm/T/nT/u0YdpDiBtXe+6vNEwFIg5K
         qnVjWHcUWKikKHI6Syc5Q1tRRoNb0hRHPQyfY8WLB44hNYkvV6nw2S/Ro4ITRDK4KytM
         dBIe0cqau56fDETV4OxNABisJUe1Mf786vM5npxwNc3vrlHFcht+5wJeEqrvmgyfSvl6
         8rjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786006613; x=1786611413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cq/8JyU8SIsbaGoDGFHQq8vK/p3M+dPCDwo11HF+TGE=;
        b=cAy5woHTyJqye93t3FPePVjPvNGAdogfgFjhe2vFwmcZ+BsoGVUwrFnVkiWIl4VoYe
         rXXYN0KfnOKfT0U9hgcXz6j9LdIq+0BrH9ny+GvOY5IeslauiNDFUSlfaUjtYCbmUDzt
         LLDILGqPDl8M6ps6P4lautYPEgOE7q87eTvJBM4d61ZajrX+QY2UgKeywAhmRmHgLt4O
         nMVWunU2haoHWVPMjMvsd31ay9Ujwp45PEYyVzLPjtAIUbtb14eujcjOD4ilkPU2KZWU
         yOyJahCdTNS/8kxKdLdFo0VZSkd4UZGcbkUzvGLVYdtL/VTMDEcHVW16YybucfKP3T0P
         bmJQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro5/t7mC1VeumpIifFmzUHzwXC/ao69r0rTQV6NWXzu1tNbAvvDKlbXrDg/9GBckYZ3nkZ5PRDPSZBR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy64G0BzEKVb0biEKZHeBdJvgD2TFyRp8IT0FJCyiIN+457nF2R
	Bb5wFhE8BV+wP98cjDHcLTHKK99Ayn+gytJlNJoLMdPNA6cOztaQiteVHytVFuYIbmRCw5eGIku
	6LdzZoJbUQJr3PRSSj9H+KxPGtTbKbwwdDznNz+x33l9SLCyN+1of/r4BW/L9DzUV
X-Gm-Gg: AR+sD11BzQJiyNLAri3Mw3SL6z5JpFXEmUV1JoNOUFCGTe/8mHIs8Ak2TlVDY4o6oRd
	B/r4ttg2FLhRXdLEBCn+8K1DuZZqsRCN6JFqbsEPLMOgRl9VxoWUcuIYmg/WrOTx+Y4pNXx8bo0
	fdnmi/pYnaSjWAc0U0NfnNkTP8YOvKy1GUwJo4YvTY5toQle8TAP9UJjSBBKSMnh9i5KbJbQykV
	08Yh8G9vXnymUT4mMIxQLCPSNev8U/ncdnIunR9Ev2at3QCvnOAh3ZYOYIRM6GbPKGeorkeGGuX
	OYWt3hx8fM0mZ8f9oW0OQNqMgxKGLTm7JHqRTNGPWI10xGO0yskmnaE13uzZOkMktd2ae7FY6iU
	MmoH/q2UGhoyJy7ly6Elv0yoK7hP0
X-Received: by 2002:a05:6a00:1daa:b0:848:401c:98e with SMTP id d2e1a72fcca58-84f2e0432a7mr14696664b3a.15.1786006612994;
        Thu, 06 Aug 2026 01:56:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:1daa:b0:848:401c:98e with SMTP id d2e1a72fcca58-84f2e0432a7mr14696618b3a.15.1786006612596;
        Thu, 06 Aug 2026 01:56:52 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f456b7368sm953876b3a.37.2026.08.06.01.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:56:52 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 14:26:29 +0530
Subject: [PATCH v4 3/3] arm64: dts: qcom: purwa: Drop the Hamoa workaround
 for PDC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-purwa-pdc-v4-3-62467f4b4ddc@oss.qualcomm.com>
References: <20260806-purwa-pdc-v4-0-62467f4b4ddc@oss.qualcomm.com>
In-Reply-To: <20260806-purwa-pdc-v4-0-62467f4b4ddc@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786006595; l=1193;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=4ZppwTlfz6Ivjj4MWFvZ2LiBEjnO14YAj/9Y226N4TU=;
 b=5mG8Aa+uU4xTPGAY1nMtGuNS/JdMZBrC0S7pP/NQjP0zTCkAhYrX6vhPaLHOrZ8mZM9nMu/ik
 q4by26z5529Akz6LRRj3bOr+5U+yjW+qvp36MDIfmxpIyZCuOLzUsnp
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA2OSBTYWx0ZWRfX7XKTCwBoXwbs
 VyWSYnlwnnTt/VBxvzmnB4+KKoyN4i2kw/KUHHvitvAG595ywofIHNBPKVk++3MzcKnEo0yHczo
 scjJo7wLXK3Fn8b0XgrvkWVejRXct12ah/kWdqFjhtaX/TxfhYZ+zQTBLMs+H8uWaYvvx1BqixX
 9kr8NE3LABT8Ln+5s0s75+SYmvxTbTk+py9p+akwFuBUVB5nQ8v+wOjV4zKNMe6adgm5p8B6hm2
 wGiZTNF1Vc4zC0CYrafVVHcQp3dB2rttOTnHkCEwl30L3lajKQ0TnxTgT0rGtO9RmbAjE818hxf
 QS/9COR8AccBi/krszXsJGYY7Fuf1Og0WyF8RUA/mlLKjmVU3dVCQYdWn9kAM1elrsENz6oey4g
 2q/vw8AUP7cxEznOvhBic3LqjJ5ycyCw6tWt95vRSq4vOTRH4DxlSgu04qapWcvKyonqizm25Mv
 ugjphM4UXI+teEYH2ag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA2OSBTYWx0ZWRfXyQS5cfxNFGFS
 JkFjPvKgt+qByFn/AjvWVCrdgZk7tZAJJJODgx8ym5/U04CPLjAYTtlNsUqZrRsYs30MwKF3WjT
 n9OLDREBzoOUIl233vZT//r+LAfhmf4=
X-Proofpoint-GUID: QFIuWyuNDmT_fzhWhdeJy5YHy3zztSHK
X-Proofpoint-ORIG-GUID: QFIuWyuNDmT_fzhWhdeJy5YHy3zztSHK
X-Authority-Analysis: v=2.4 cv=DeInbPtW c=1 sm=1 tr=0 ts=6a744c56 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=vCmKDeXsP24Y5dEMWNIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060069

X1P42100 (Purwa) shares the X1E80100 (Hamoa) PDC device, but the hardware
register bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc:
Workaround hardware register bug on X1E80100") is already fixed in
X1P42100 silicon.

X1E80100 compatible forces the software workaround. Use the X1P42100
specific compatible string for the PDC node to remove the workaround.

Fixes: f08edb529916 ("arm64: dts: qcom: Add X1P42100 SoC and CRD")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index c698e6cb2543..4348dd3d1dc5 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -224,6 +224,11 @@ &pcie6a_phy {
 	compatible = "qcom,x1p42100-qmp-gen4x4-pcie-phy";
 };
 
+/* X1P42100 PDC is same as X1E80100, but without hardware register bug */
+&pdc {
+	compatible = "qcom,x1p42100-pdc", "qcom,pdc";
+};
+
 &qfprom {
 	gpu_speed_bin: gpu-speed-bin@119 {
 		reg = <0x119 0x2>;

-- 
2.43.0

