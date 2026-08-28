Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5321C84AB
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 12:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920688; cv=none; b=jbJwxkSvoPTj0FJN1sQDAKb1fyFDv9Ugo+xbh9OmrfGdC58i1x/7zRf8gNCopKsQRellCqXCq3DqpyTLyXoTGrDUZsVjB9X6yw5sNL3KGygwbkUIYrWOS/GIy31+M/uTv2GL2ksy+4LUcEoU9DStudhoQktNL5fpUdiNsN0tAp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920688; c=relaxed/simple;
	bh=k7NXXUi0rpXL5Z02GeSpR+IuI5phx2Hx5nLBYaWCYd4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QdjVPXw30XpcmATSuZCCdAsxcbAzPsRp2mCGWDonch/h7BTHuraukFsi4kesOdqfVymtPfnsOTplO4JLEcyVnj/74h0nHO7wrySM21Z5mH3IoiOaP5XAOz8bPnyq8s3JWo8MU66CFBkB4k0b6U05W8yu8dAueO7jaC73vnWrGjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a2aIZgew; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EoKpNhD1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a2aIZgew";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EoKpNhD1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SCb4B21906656
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 12:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rgkV4xL3/iQYCcwz8bH4iOk0fTyVyhjY8B0uxqSBNRY=; b=a2aIZgewjJIZPCyf
	4rnBcwWgWCbs8XWMw3PcxokmsMPTqVdzS5Vh7cbE8PpMxdFrcdrCsuEmgCfasri8
	lvYC9wuoHVah5IkhK4v0UKc6lmbxLeQHssiW0SuI/QbfTFfkXaEumAO8WcKIrP7A
	mURVkNWbOO8zwwrRnPSQzc360/acVlK1P3bb8FyITXmXy5QN8NXFXXjtwduR/RpT
	R6IwlYm+bzGcS0ENtMupZRGWo1vawl7umo3KZBRuJi8Lgh/CJzAzPT+OmdoYFOL1
	FcBH5KqjQKOcYPHTleVFK8pNNn12Q19DzD4KlHm9VAiXQarBz4mI28P7ypku3Mra
	ILBCdQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbag9r02g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 12:37:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8fc6b670b4bso10157126d6.1
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 05:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787920667; x=1788525467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rgkV4xL3/iQYCcwz8bH4iOk0fTyVyhjY8B0uxqSBNRY=;
        b=EoKpNhD1WXr1tJ0f4aWhcp6aHuhMqoyz1gm+fW2TZxZdmotyHve+jO+qFIcZbd7iYM
         IcPaI8Gl3m3oYtLAC347C8fmgzAwYe8/8gvvJqJ1nRQTGH8ylKBldtf5WQFdjbcmYqyE
         ODGdv3P5F8BKodcC3UPX+lF4bxIb2igTj9537+pXFvQLBIzcfhOsmmQwjaK0bCoqhquT
         d/Mn/QMSn9Ao7rXNQkpDtnxpPjjFaGQyr3CZOk1NKKtlt96eBfW2dbZ6yPun+rsUh4Af
         eiNf4xaQww4iG69wxEdOkX/VXvhehGzNDlkzWVD5xOeR1aTk6YCmxa5KGsyxFPNqPphr
         3Pig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787920667; x=1788525467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rgkV4xL3/iQYCcwz8bH4iOk0fTyVyhjY8B0uxqSBNRY=;
        b=ebaxk7yIzq6hRZnrNyuzcx1LFG29FQQkzAbKyaeuZV68ksQEBIUjwfap9iIFR2tqt3
         8WQk2NU4t0mR2ioY4zF5moDbOwv9+J/NHRauywMVMbpL6Jo7GFLPDEsvRKVwax7icYaq
         QmSv1DIfsnPEHZYyjZ+ILvL3nWRywNJITYuSEAlpFX+7F9QzMcboPKYLT2OHUeOqP6E5
         VKHXyyOH8qK/+CNMXymfhYuIXSpF4YnA95vgV7Tkcnr1eo3YYXjkdMLWU52ttM0yFgaQ
         W3F5h4SoB/SNWHVWtUVoG6ETc70Gbw13wSiB4QpRwdTRLnwfIGOzU+BqR4i+yMep6v5M
         YS5w==
X-Forwarded-Encrypted: i=1; AHgh+RpEEzBaJtb4GGsoLvGYiPoSanmwtZFUPt68TRyn03syu7KhkWXGqEniInee6+4W2oalAO48UJjArah5@vger.kernel.org
X-Gm-Message-State: AFuF++njhYsiCllsHNbB03fu14I+LsiYPP+QOVAnKssdkQmE04Lt2HwU
	yhGO7sj7jqMqecvHrYzm2G9TnscZ0oJKYWGtZSYhAJb6L2N6WwkNgVaGYz+/h83gl/afEGywOjW
	OdTkwv1d+JzSi2PCGOn7UA8LXmk4JbbdHwOyRp6ij7TOXtNGNOMd4fwlIFF8VKP5z7qNnD2kN
X-Gm-Gg: AR+sD11Lv/fO9bz1OYI9DiBQud1yshB2O8osDO3TJDBUSxKryHyyd9Q7ICcBTwiyU3D
	2lveVXpSrW0AsRnwgHS06G5nR51I+E4Wo7mIXPrQL48V5W4xN8sDl42XHraQ259YZZ6SMsJt8dT
	nn3DAp6C1De9PY79RGwS0XeErjRIWUxnnxK34w+Lcox4Hl3S9d8ccb5JePzA0aAWegoRxJDELQz
	K6MgEpWg1Hi51vc1/YDLRtRWghpyTmjpfWgfRxtcXIFVPl4QsG3+9vntzX6nNua77jvpJiZM4xU
	FkYgNca29gzxCCJw8cSJKOVYVdcDK4PFZvMW6LPUAKk43kbIJeJBIN/gqVNuSkwc9p5uaW4up+f
	iskcCM1w=
X-Received: by 2002:a05:622a:608:b0:52f:b37f:35c7 with SMTP id d75a77b69052e-52fb963ff45mr71246981cf.23.1787920666918;
        Fri, 28 Aug 2026 05:37:46 -0700 (PDT)
X-Received: by 2002:a05:622a:608:b0:52f:b37f:35c7 with SMTP id d75a77b69052e-52fb963ff45mr71246291cf.23.1787920666299;
        Fri, 28 Aug 2026 05:37:46 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92671c0esm39338965e9.2.2026.08.28.05.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:37:44 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:37:20 +0300
Subject: [PATCH 01/11] arm64: dts: qcom: sm8550: Disable Inline Crypto
 Engine by default
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-b4-dts-qcom-disable-ice-by-default-v1-1-1d6e0c2f5a69@oss.qualcomm.com>
References: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
In-Reply-To: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3851;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=k7NXXUi0rpXL5Z02GeSpR+IuI5phx2Hx5nLBYaWCYd4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqkYEK3fT7277ogGYVlek38+n2Wk0f8qqjjnTKU
 I+G1J2TUT6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapGBCgAKCRAbX0TJAJUV
 VjnwEAC9xz4m/nQ3nUssVZ5X3AA0Q5F//uGIUnE4UkUNoyfRUSMHje+pHnIVj6IcFEtH1ijjccT
 dQ91XhM60V34lJJWufHvUGccfvUZKJtF5mMHPbJUuNyvzexONT0wKBEj0bmzt5rrlaDlVGeeSNq
 fG22zKuusAn5noYA1whBykbGYGxWg1ydzJQvdU/mSM4eO29hOTeKpB1jfrH3UopvCrSPXV+XTvN
 9Texhn9+cta+H6VTAmiDEfLj447x83OdLfTo4QJIupK60IUpKHYm7idln9QmpDVUDkgiCdVnsoZ
 adKpaYtmDp/qjtq4d0aTnstv+jKqkQGrj21EoDqShwGXV65Uvr/fGWxlqy9dOSjmJbT8JiHrnrN
 SYb89kY+a4gwBJ8Y8aGXDHHAO5WsOAc6iw8yRAuOzOWhhzkb6MIj6uM1Fyp6nnXauNJH4UF6me+
 JCPZ4Mj9WUjRgxPcEreg9ZdmpCvY0Oc2EZ8s14tybcD9lSYLIDMl0FAaH9MHZB/egAoK0KRJ+6i
 0yOyJlpfpSaVyYDfdLSuDDSuYUt5m8dlU0JQeufE0Vw79G1SZMdKtAs/rJFHNfzXOQTL8DoPI5R
 XTh4q8xxdfD8rZLDip0r1uyjJkh4ENxnim89FNLNb1oo1AOnuYJrVOklZKXNNku5AEQa3PJg3i/
 RvzAha71s2n3uxA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=UalhjqSN c=1 sm=1 tr=0 ts=6a91811c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=4GAT0stK_T4jbStqyDUA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX0jL/7Y0Wq2Uo
 SFqnwwjVJS1AR77JE/vvjomv2ZkxgnT3VLnrso6sa+b0f+tKHk/2DIOa/ht2CioYyp49+6EK6Ho
 HTgnV0fi2U+0mJF/fQOimLz1LYYslgo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX8mKonmcpjHuR
 Og6H+x2yEWqPjtF4wsHWtIRRQBVJPDFvaExiD2JWh2Zjghsy/SD3VVuQz1z82qilLelkIMh/IbD
 26I6aqdLArcwuVbG1Q/HYnfbgorEqASyBh9S4j/bBBewit9YPbuRuKASqKnrNlZfnYYzvlCFrT/
 Ipba14JZGAxaGoJQaD0/nYtH9s2zkflzaeeAfDZcmx7rRBDZy8Yfn+57T8iGIGBPANpDfdEpjDC
 GfKAVeRMeWXZ2Wooq0hIg+mSzkK76fogCpGPy8WC2ZEI3UIAtJG3DBbkroPgZwJ7fh/Ork/GiTe
 fPm5gZhMpAgF7M5+li/RLiyFGfin4XdbxQ3EK5UmLeIMRwjcSch/2KFAq90CB+1rVl5YUsNM7dd
 UKPTTX+gOTuwLtO3wcqs/vYkLSwdTxHzHSSlmkmjWURdxMHZR6OyCqXiS8Z9Q5KBrLSs4RSSQ/N
 J6TAcY4m/Mh9gPiJ2Hg==
X-Proofpoint-ORIG-GUID: zup4Ief3YonBeygOqLJQMpu0bS_e7TcG
X-Proofpoint-GUID: zup4Ief3YonBeygOqLJQMpu0bS_e7TcG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280109

Since UFS_PHY_GDSC is attached to the Inline Crypto Engine and the driver
does not currently enable runtime PM, the GDSC remains enabled while the
device is idle, even on boards where there are no consumers.

So disable the Inline Crypto Engine by default in the SoC DTSI and enable
it only in board DTS files that use it.

Fixes: 52696dbbe7bb ("arm64: dts: qcom: sm8550: Add power-domain and iface clk for ice node")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi    | 4 ++++
 arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts    | 4 ++++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts         | 4 ++++
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts         | 4 ++++
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts         | 4 ++++
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts | 4 ++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi            | 2 ++
 7 files changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi b/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
index ae301d78e071..ddcbdb1b9fca 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
@@ -326,6 +326,10 @@ vreg_l3g_1p2: ldo3 {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &mdss_dsi0 {
 	vdda-supply = <&vreg_l3e_1p2>;
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts b/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
index 9df8dcd6c62b..da460474fac0 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
@@ -998,6 +998,10 @@ &i2c_master_hub_0 {
 	status = "okay";
 };
 
+&ice {
+	status = "okay";
+};
+
 &ipa {
 	firmware-name = "qcom/sm8550/ipa_fws.mbn";
 
diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index 82fb10ed6b6b..cf4821716f27 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -1024,6 +1024,10 @@ &i2c_master_hub_0 {
 	status = "okay";
 };
 
+&ice {
+	status = "okay";
+};
+
 &ipa {
 	firmware-name = "qcom/sm8550/ipa_fws.mbn";
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 7c634572c6b7..f54cef78292b 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -672,6 +672,10 @@ fsa4480_sbu_mux: endpoint {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &iris {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 473ec4e27daf..e26c37ee5bb7 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -903,6 +903,10 @@ fsa4480_sbu_mux: endpoint {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &ipa {
 	firmware-name = "qcom/sm8550/ipa_fws.mbn";
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
index 81c02ee27fe9..3956941b21bc 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
@@ -509,6 +509,10 @@ &i2c_master_hub_0 {
 	status = "okay";
 };
 
+&ice {
+	status = "okay";
+};
+
 &pcie0 {
 	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 0e701e709235..a2bfd857f3fc 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2840,6 +2840,8 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc UFS_PHY_GDSC>;
+
+			status = "disabled";
 		};
 
 		tcsr_mutex: hwlock@1f40000 {

-- 
2.54.0

