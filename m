Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D13C344D8C
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 20:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775767908; cv=none; b=rIwtt5dQCtnBJaHlAdqbowLeFykCTucfJM+seNGv9bI5xHB0Rm30prLRziMV49K7OxQaz6a7PYSBXOT8+2t5p/0puvnueTXlhr7gAMS0AQ/7Jp9ogij6vLQuhANiLrpND+gR7jrhNJGAZSAisqXD3Dn5dTOddZuW4U5mNLb+AH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775767908; c=relaxed/simple;
	bh=nY2cCrjmARI7GzxQgMpI6R5HjZpsrjnJmfPbF5oISiw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=biTgnTl3dP1c0SCbVjeW8z0R8IUQAe8CJXxxKSbtZ98qzcOR3vdBrZrOZVpmQExlNw90suyOWWFSrV0vDOF8yTErSNps6pDjy7zrfyFuAIsRI1WHCQrGueCXFr0CY1FuESNp4mATYMDIU9r2Vy4989VFE2gfNPxWrPc6GikVdRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MY8dcJh1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XIPpqhSm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MY8dcJh1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XIPpqhSm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639DbuvE3934972
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 20:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EK3td8/fpTbEZK+SeQwvZoOgLOpUZIzxXPa2kZfoRSk=; b=MY8dcJh1YX8W3+tc
	GcxdiUnNgqIRS+WZyec4bRxH/Q3F4uXNFndJD6M901gkDfOIMW7++4ef0PmTZ8Jk
	Y3VXQOCMOr5J2EBUZEN04HwsksaVsIzqFiIWQhng4t9zK42KmCUkuiEvq+2KYwRm
	mhjnwS9RRozAIDJUjNrqBUhGcRVA4CSGt2PV5JyXCXh//nG2nuoClEkx4ZF0fiIS
	+JwFCiJMrNA5g89AHQHp8ItxTk2ucZHDP+uSxssAeV7EdGt2BY9Y6geVpvsbt+H+
	knhTI+HPF+iFYFAkgZ0N+KhT7xF4ZuaZUOXSCxQ54FzJjt3D8xsMY2njk5Kn5Hfc
	Swu3Tw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded5s9g3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 20:51:45 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so5430239eec.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 13:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775767904; x=1776372704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EK3td8/fpTbEZK+SeQwvZoOgLOpUZIzxXPa2kZfoRSk=;
        b=XIPpqhSm6qunOh85DGQUtKTM7iafbxWxSFMdDmcgEo16SbsW32NhpXBJZssTp3G76S
         TAHZQFZbfLXZgF5kQPcC/kj5ch0Z2DTOyFZ6hlqlRL8XmDoy2PRsyzBXO80dqX6/4t5V
         T0tF23wXf0TmPXDgFKt5CaNQiJSc/QT+4xPnjO+/6ff+zFheqy4wIoP+grKnovDy0YL4
         1ebc3jIigDdSAHfHX4ycqnIWGIa/3O4cLV6bIALiRsBr+veoJkhi907LyENn/YxrGctB
         ldyzBSwCmRQbMM6SR+HNnpcKKbcnfMaXseBgwqJ54r1Ch7GX1JbRzhzPwSL5Je4twR2d
         O8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775767904; x=1776372704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EK3td8/fpTbEZK+SeQwvZoOgLOpUZIzxXPa2kZfoRSk=;
        b=GG6oaCAZZqyCGjPuiYAp+FwsIO1PUYBS4WDfZGZJhwrx7wx2H/44v+tl1gkNx+T2ea
         7jzafxoC+fEz1cFWuE2dLqtLtQ2Tp60KAiLrQcqWb/kA9Vgt2KxVqGEgJ7ShdjC8kytU
         9eZPKQRn531wBWoW0KnkHEkM1HuuOu3UUs7BCDzsP+Zns5pNnC6PEVdGt/B3LzmWGiVl
         u+9S6CWmWm+1Hmk3vqRgTTgxPbblw5MhKQ2mDnNpX5vS7YTaTYJ850ONK2QpdiBclBri
         FifW9/5hjcR2w9t3R+PtsKXZirMp8r1oz2vkj6Cpuu4pNVttzXGC3RHy2d18zkVyOEJZ
         4WGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuHuUCdKiZiaRkh8iyIn4bb3g9DOjCLh3xymOTuVLjNoycxsuoYORU9o6nywRCtFsDtKKH+XaRbGtt@vger.kernel.org
X-Gm-Message-State: AOJu0YzrI+TT09BPpS5zzKEwiAFCYujPjSovrD8s555YuJjJPSopJM5e
	Kvv+5qRiERQ9NFwGygcwYCpcpaIvv5KFDp5Ygl1kanKdR7fmUjZK8GjQGeGfC5qZJ8L0GTXSD/e
	6lbOvc4zQeseHruJ8cIAVISBeOH8JdPidvp/mxFRS1mp25cS/xNx4tTu+n9nZ97Mw
X-Gm-Gg: AeBDieuBMyB/3/2SR3oDt3TcZLjkYWJ3LaxwFfQdTI/qxv0pWw3CIyrJHdua/UmFOTA
	IhXKwNZIiljt3Cfk5Mw+8QML8JZzBKPxN0sJ+iiFF8Laxb/WEOVYJX6+mXogl6xJqkXZXut95rM
	scKzRfW3N8XseJ3r9CIoo8rYGEJZce+W0mlv3klxRZUsjX+NApvgxG/VHYfy02tlOJWonDs1jMk
	4P7FlUFL15/OdAuE+KUt8Dl6o93DNuzoUyP92xsHeqDiZz8JwBYih1Uk9ZqqXdxdp0Udt4UUktN
	LtdtsmayliOMgaRb9aW3sBRGW+FdXfcEka0sC1S3JftfYnAglxCaP1A3VEUe9awNMDoEbZxnq6r
	6CNZYU0c9Mq0Z+UcTxUcMo5EvMVz2Zvi/2PkrEg2fjrjzGsU/81GK0/G6rEUHs/BZFppMq4XEMt
	1z
X-Received: by 2002:a05:7300:cb0e:b0:2d4:a303:546b with SMTP id 5a478bee46e88-2d58a8905d6mr343690eec.30.1775767904073;
        Thu, 09 Apr 2026 13:51:44 -0700 (PDT)
X-Received: by 2002:a05:7300:cb0e:b0:2d4:a303:546b with SMTP id 5a478bee46e88-2d58a8905d6mr343672eec.30.1775767903579;
        Thu, 09 Apr 2026 13:51:43 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562eb05fcsm1327869eec.28.2026.04.09.13.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 13:51:43 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 13:51:40 -0700
Subject: [PATCH v2 6/7] clk: qcom: clk-alpha-pll: Add support for Taycan
 EHA_T PLL
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-clk-hawi-v2-6-c7a185389d9a@oss.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
In-Reply-To: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775767897; l=2956;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=nY2cCrjmARI7GzxQgMpI6R5HjZpsrjnJmfPbF5oISiw=;
 b=tdLOisN46KKO8zB0Mgal4aiLJSqC1KhgfivuRFyd0KBHgXT3/O/ljhHgGx3g1Tt/7YDpqM1hT
 EmZwlw1lmbTCI17sKia7jk1j5HC6K60HT4kjAgIPx41EivoONkFnQId
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-ORIG-GUID: fKa8EjArMKunNRRjUVhh1zcRVldK3Cd6
X-Proofpoint-GUID: fKa8EjArMKunNRRjUVhh1zcRVldK3Cd6
X-Authority-Analysis: v=2.4 cv=Ko59H2WN c=1 sm=1 tr=0 ts=69d81161 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Xwuga8JxpJPgM73N45wA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5MiBTYWx0ZWRfX7CBSaeEKyUTU
 tlACB79gg/Zk1KZ4C1PD9mrEdQ8vPSEbNzT0BLQJ73C3yfwLbbjG/myq8cBzf6S+exn7k15ZR/N
 va28G+bpTyeOg2GJGTulMrQWWe+Wbe1Zr0+F+ysy/Jq1qhYf3MJYXUC3/J2/fhFFTvSAJ1tJAfD
 y3D+sWzeS28elZ8RRGuUFpqofEng91oHEl5XUPoV0J5HlnSQfddWZh4M0HRMqOEolSxbXnMUjfE
 TI5K1U8shLlrRk22TXRi14n43jVcj/dNXT8AuZSk1eL2HVtZ2eDuBtub5h1i1hTdHzJIr7gyYAS
 mQpHxJgsBzXYwdgN+twaXYjEWHxYQIjxSF/qy4UEVLyeOdZ3KYznJiIGtr2qz9xHP39ywBeG4eE
 TU5gBYZY5/pFbMZMbgdzYG6pFAAgJSS7/Lu5Ss6XvZVeS11EKjDJHMj/2HWjUHVYDGnTAnlUE5K
 WYmmQpgHB3Cvzv3B0MA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090192

Add clock operations and register offsets to enable control of the Taycan
EHA_T PLL, allowing for proper configuration and management of the PLL.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 42d334492145..3a2157bebc52 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -31,6 +31,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_PONGO_EKO_T = CLK_ALPHA_PLL_TYPE_PONGO_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
+	CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EKO_T = CLK_ALPHA_PLL_TYPE_RIVIAN_ELU,
@@ -198,16 +199,19 @@ extern const struct clk_ops clk_alpha_pll_zonda_ops;
 extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
 #define clk_alpha_pll_taycan_elu_ops clk_alpha_pll_lucid_evo_ops
 #define clk_alpha_pll_taycan_eko_t_ops clk_alpha_pll_lucid_evo_ops
+#define clk_alpha_pll_taycan_eha_t_ops clk_alpha_pll_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops;
 #define clk_alpha_pll_reset_lucid_ole_ops clk_alpha_pll_reset_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops;
 #define clk_alpha_pll_fixed_lucid_ole_ops clk_alpha_pll_fixed_lucid_evo_ops
 #define clk_alpha_pll_fixed_taycan_elu_ops clk_alpha_pll_fixed_lucid_evo_ops
 #define clk_alpha_pll_fixed_taycan_eko_t_ops clk_alpha_pll_fixed_lucid_evo_ops
+#define clk_alpha_pll_fixed_taycan_eha_t_ops clk_alpha_pll_fixed_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 #define clk_alpha_pll_postdiv_lucid_ole_ops clk_alpha_pll_postdiv_lucid_evo_ops
 #define clk_alpha_pll_postdiv_taycan_elu_ops clk_alpha_pll_postdiv_lucid_evo_ops
 #define clk_alpha_pll_postdiv_taycan_eko_t_ops clk_alpha_pll_postdiv_lucid_evo_ops
+#define clk_alpha_pll_postdiv_taycan_eha_t_ops clk_alpha_pll_postdiv_lucid_evo_ops
 
 extern const struct clk_ops clk_alpha_pll_pongo_elu_ops;
 #define clk_alpha_pll_pongo_eko_t_ops clk_alpha_pll_pongo_elu_ops
@@ -246,6 +250,8 @@ void clk_pongo_elu_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
 	clk_lucid_evo_pll_configure(pll, regmap, config)
 #define clk_taycan_eko_t_pll_configure(pll, regmap, config) \
 	clk_lucid_evo_pll_configure(pll, regmap, config)
+#define clk_taycan_eha_t_pll_configure(pll, regmap, config) \
+	clk_lucid_evo_pll_configure(pll, regmap, config)
 
 void clk_rivian_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				  const struct alpha_pll_config *config);

-- 
2.34.1

