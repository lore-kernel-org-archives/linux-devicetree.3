Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43685493658
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467034; cv=none; b=qfROSW5mXQVSYdW3YRJR+pe5GY7b14TvX3eeMaY7gK0e8IovZaUF7AcjOx1cjXGWPQCV55YUNP/hck536ZjXrGSwojXUkT4tjHdr6zjeqGWrtZ6yMeOwTz57Nmiu9eEObrEBHRV6QhRJtibh8cAPFXH5R1nkWdrnzv6oB+e8Rms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467034; c=relaxed/simple;
	bh=r4/qj5nTuW+nCMOgKMizWOrGyBMhe4g4e7dRumSsf1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GcubHpnlUkN0uq/jYnlNJGQyY1luTl4Hl8OcOQAp2eM72wvcAxEojFFjUPXJmecUuF+7gSacTW+pMtTjKLTQE8K8By9uH9EUk4ji69XG/kAZExekreaaDpPIkD0Q5q2YMezotAWXF6R2UL63fGxTamqGo2dWtB8JRE0I2w/9b4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mtyDQlca; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+yGfSAp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mtyDQlca";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X+yGfSAp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hF9X2833241
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	trLgG9o9dNxaGAqSUsu2rJ8d3cOmfxBXCCOBMvJB4AI=; b=mtyDQlcavY5//1KV
	uHU7TqkuPzQf4sCNmIrqUuwvT/d7QP/2oa2TXT40nRNY39khiJiPRc+2Jif6e71o
	d9rUNbt5wmota7UlAUpEhad2GZst7lAzEIacEKKIvwHTngBFrxMMLSgeZ56lXgKq
	kOedHYMIBm3IVo8Hx6059anjddNkDmLKJPHTOYjbtFZsa6dl1SJxdQ+WsYIhFt7z
	1yzUsJhYWsRkRqNDI+WhiQMEte4D95f1FhMEmzw5/R8Cbd05HJYX2W7jbqkrbcpH
	cBYfvDF8RnYCSjMGxylaxJ9ZCEem5FS+FBErbOoEi/V4axyK33RzLOTyU49LtwYw
	xRqKxQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpxyd99f2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:10:28 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1bbd7d6e6so3435893a12.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 03:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789467027; x=1790071827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trLgG9o9dNxaGAqSUsu2rJ8d3cOmfxBXCCOBMvJB4AI=;
        b=X+yGfSApj3Htof5ybQi8d2X8Lk1ZCu2X8XtTAo88iE2xm45XoIcyvS5gPPgs7VCQlw
         Qh7GeifiSgHjKbbVK9c31qCbQ406M+z0NfADQG//vuUfILNjewSy5PBvQHKxolksOMAq
         sX1kBAgkoAHGCrZSKvF9w+3/HQGwWy4QlPi99ABPanjilTzITQ4cxz2IOpXUpcSNnSUQ
         LT0UMIVFnoV8jxVoiUnGUIkqHEvJD0ibUS0quus7ITY8EKlM3OVulCZ+UbzsU1kiLLtA
         f0ps+3kIVHFbZjLVlwZmxQhG2ToXDJhDSwhfO5jdWJj9EYPCYIIhnkVzzXIs+Us68xfd
         zHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467027; x=1790071827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=trLgG9o9dNxaGAqSUsu2rJ8d3cOmfxBXCCOBMvJB4AI=;
        b=2oadSphHDAuuxfkaB4HNH8e9zlOt4pXfJ/UUlBUg0Va5376H7J+WmpyiTAYcHM+sKS
         2g5hss5oFxk/UsYuaKqL1U1NJiwuPs2Sa+k+vIkYwoYvg9LcnDDjk2Z8LHdB5cbgNXTn
         ks5dosdIRsoqHT4XlDaStEkEL8iNzZ9kGaB/0crPRbO18yDb/pBiCX99VaUOiUt75K5O
         hNkCMh1RuWHaIprSlotpv+Lev7IpZaQumFXw2nUJY5mSg40Y89tjJnMjfQVX7TdF7yXG
         fbUHxahnJ/fieNF+RsWzAHRAflQ4xYmuPAuQTr2C9YIYdLAqym+OPnXtRlDLK44Rlc8Z
         IawA==
X-Forwarded-Encrypted: i=1; AKwUvBzVVy7Exb+HXwPNZgxL/KwhmFfu0OEjUV6DGmI9xIMFXZ0gOeZPKOXvO+VmmHVoijrRWYamIQBFcvyx@vger.kernel.org
X-Gm-Message-State: AFuF++lCb1wbGxdqtlNDeGlDDGuSfeVxk8DQCtx3ELuETmwIi4hVZ+IG
	R2h8XsdUxq2zXtwaVUgG0LYHh7RwAN85kaN408ETjrio9hBNwDnMrd7+1G2rXH+XyinBzyyj3iQ
	4OzKhkQTbbdQGmuL5WOKAh/Us2q3RpZ2YBucy3Fkj2hXuBm9SVwXNB+2lWY9IA0TS
X-Gm-Gg: AYBFou0TWUpk+6DnJ6o+BBqsp7puCgHJM+CpP+fpBJnk54XxG8p9BObINKzDrX31Eoe
	X1ZFRqmfDuZx8D9W0LuTcjkW0LpyxibF3OV1KHvUVSMdffucDO4gjazcMwavntGbpQaBVAhfRkm
	mLhRzLucXgqtzMqUkY19Q9SBPJ8rn9By+3wy75oF82zMfqp5ohlKL20O+jLOkvjA7kh0Alb24eJ
	QEzD8ePuS8clh8gRB1ZbF0sU7hhyGZU5TM/3yi5Uu4OXhVtDqtPII5aoW7e61zAVhOM8GAminsg
	YsQKlWzSQ33PbGostUvNI3iMpNc4Ik4DjM+7i4IiP5lXJdgG5D6bYCCdUaupg+sqJx2N1C79cDy
	QDw+/L3/e474n+v0WaGFMoYv41a8FoRE73+Y1Mih/RRRro3yMnSeNDAstjJ8Xh5UZKXY3Q64raM
	xiY5plBl8NIEE=
X-Received: by 2002:a05:6300:670b:b0:3da:15a9:a18e with SMTP id adf61e73a8af0-3dd528eebf2mr958644637.23.1789467027598;
        Tue, 15 Sep 2026 03:10:27 -0700 (PDT)
X-Received: by 2002:a05:6300:670b:b0:3da:15a9:a18e with SMTP id adf61e73a8af0-3dd528eebf2mr958589637.23.1789467027159;
        Tue, 15 Sep 2026 03:10:27 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14382741839sm14244091c88.6.2026.09.15.03.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:10:26 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:10:06 -0700
Subject: [PATCH v16 11/11] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-kaanapali-camss-v16-11-c9f3f6f4180c@oss.qualcomm.com>
References: <20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com>
In-Reply-To: <20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfX6ZLYSMPl51sg
 Azbr1IuTg2Cf7XzfeU1aI4PS83kXbQvSQ58hh0n/EwkJYYIo4aG8NWivBq/ZsNLs+c+s3hr+3be
 08ox3dUgIwsvRiSYo2afvDvQHrinSAo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfX5oo/PpI9mICR
 FbTFvUvZujmCj61mLgxwj3PYr4cI2BueGt33WuvcNlGBWyOsPbqXQLpCxAqeGGwOFT8yhlz2Qyv
 ovckcq72HuEzBhQp+Yh1b0fDU4IUx8mTqZCaiSez7mBKvxtpWHf9l98GsmZiScvf6/3YoXDz/PC
 TnkTTsspEATXebtY21LLM4OEuIymP7ikM4YuQN1GqVy1pkuCJm2umpYBsGTVC8NwXV210PfpD2L
 SRwH/gWzTxjB+kOOJTI3kCmkKIhj3Oiv+A7wJO22VNsxjkMzbm//2rIOc2wkbdG29KTWrRHcDQx
 X4nzUkrDZzluCZbKTm3VpTEaWZLkbthLGC24cvIR70E2SzsrGVjfExmj0wqCUw6b+UlTyEJ6aNy
 VkyYcGd7CCBU98DcueerAeGELJ8vt/GJ8IxjeoCc/JEPZlJloR+sPatFHM5u1lNoBJaVoT22d4w
 R83kHe4s19fQ6CaDr9Q==
X-Proofpoint-ORIG-GUID: PtXqMMWx0YwQFdZPg2i8-4B2-yRISxFb
X-Authority-Analysis: v=2.4 cv=LYepeTfi c=1 sm=1 tr=0 ts=6aa91994 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4Dwyees-64n8yO_2jeYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: PtXqMMWx0YwQFdZPg2i8-4B2-yRISxFb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150146

Add TLMM pinctrl states for the camera master clock GPIOs on Kaanapali so
camera sensor nodes can select the proper MCLK pin functions when enabled.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 02f8dab30b91..44fb673185cd 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4335,6 +4335,62 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio89";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio91";
+				function = "cam_asc_mclk2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam_mclk3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam_mclk4-default-state {
+				pins = "gpio93";
+				function = "cam_asc_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk5_default: cam_mclk5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk6_default: cam_mclk6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk7_default: cam_mclk7-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_i2c0_default: cci0-i2c0-default-state {
 				scl-pins {
 					pins = "gpio110";

-- 
2.34.1

