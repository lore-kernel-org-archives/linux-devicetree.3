Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E4B3CAE93
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985289; cv=none; b=YhLsgmYdyEWUTqyYlNQ18/XjT/6B4BIqU5NNkROs5lej6P3qCct9PZcf2tpOwD4rkNOR9kV7GEWTrPCDFMprUnGqxYhKaCji1HGD+OqWWHIVG46VnAWRYgOJUEgFUnk5GY4SeB4PiIolXj5JBkW0ONTzkH8c27q+x77OrLXaqXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985289; c=relaxed/simple;
	bh=e/d9Y32G5UNQuUM4EwtvkosLXFUT+qby0rqA6HKsbQk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f+dB/aLLQeU8WKTenrBca/jUkuTDb00vC0H4R/Zd0WOnGCj1wiRDAUa+TdDF3bVRBvPBy1Ti384jOKT9lOTJ0wYtSgGtlm/bpqj1lmMhkLLBTYNumFMQLC+36kMOf8KY45neWpjvUMQ3fp7mhSZuHg40Ij27eP9NlehqgaTin1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ONU+GrkJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZkeOO1B8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ONU+GrkJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZkeOO1B8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629KXRZ4115790
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 09:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aiXIqW2oqeN
	wOVB74YpZNvpA4JBn5gUrwtWAT9Tgkp0=; b=ONU+GrkJMR7AwI0nn9fasMEP7+O
	9DYv6YPp+OKh4LL4s7GXpZhAKSGLTjgsGeGp0w8UifuHWVFXvGTGSy4IivhOwHqV
	iGaOuIN+SwuRf8I0651Zc1KUR6gPFwsTjQ/Fj1TFRN3HM1cp+e24trQiehgMEXqb
	QoLRJurHm4nMqtYPbMyHjSAVyyBpwtZ5BXPmuDJe/wmsCM4cPdJAi3CmrmF9/Xvr
	UUiYx8lWtpwO/VcDcjKHxW9f/uQmG7Z93IaEc/2GsAkF+1n1NV3dc+E4ZWab7kTB
	ASlzMnxp3+EIwA+xjVFgC02GZbZcQvKI/rc5FAK0M1KTWctd6hJkjY6BiDQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9402kv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 09:41:27 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-845bc2e658aso1817564b3a.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985287; x=1783590087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aiXIqW2oqeNwOVB74YpZNvpA4JBn5gUrwtWAT9Tgkp0=;
        b=ZkeOO1B86XtY3LR9xWs9Dc8Oclcgh6Dp0o1m8Xksx8jGAsm9iQm29eYentgxLNsIi6
         Rd8ShKKqFlaHrg6496HTjXh/mznWANTWmvwqcJ5cGvDdYiwAbgpxy4gTdkVCfUaf8dkl
         HyG7XSJTsEjPpyvO4iP5c9/UGw4yN45acbSRtzG/iQAbYeK2MIKxJ40sR/qgUW8Xpyl/
         SFL1+0/H1iIbGOkbjmSQIBsr4Hz+7T9lrnRbQ4INQQhOP3NfjvZbIs/CGbG7ybU2i2mx
         SqVfldMvC8DGLp2IuG3qgqxvhTHFwTj6nd7H7x++igN4lKLeiPJiprUi95EDmia3MiK/
         QZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985287; x=1783590087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aiXIqW2oqeNwOVB74YpZNvpA4JBn5gUrwtWAT9Tgkp0=;
        b=DGoVOsXYQ6hkzCS1jknYcWSeL2/3TS0UFywjSk8wmFmuRwKSpFbJiek2OCXPsIEiQZ
         gppc4h7dgCUtK9bj+eL14ZSw54e57paCMgvarCfz1opeFKCdNN+VYfEHVr7GMGept3Za
         HwdB/Qbl+GSbiAsqB82jdvTLskhBKDExj3jpfM2AJu3oQ3aRXo4Am1wJJMA/Gy0tklOh
         4hKVKzs3iwaRooDQf25C6cvGI99HxtOs1D5e0toj0JM9wYa5Ok5gNeXb7qGApvoL5xgo
         /AXfiAXUwv+cG11/u8eE0gNxtWhtdtVjiLZU7K2xJoukVPBHQAbIFDkFGkViK12NVmTY
         dGLw==
X-Forwarded-Encrypted: i=1; AHgh+RrifseNyjAo1QwL8tO3YxeMABEmtvPNe5RWvtoRg9SFSPXu9HgaMQtEpzyknZLv86vRtLQ89x8c1QJx@vger.kernel.org
X-Gm-Message-State: AOJu0YzeyywXp8L1TCk1/5VY/ZcoK8eoOlYngPSBBusZ31ZuBjN1OvzJ
	I8Q/HaOz2p9UhxtymtadKVbfRDTQG5YZvs4dqD9KSPh2XAmRtRgTtAfG8K8ugKdojq8MlGzT0Tz
	YTbRw9HyQS8HY77uUmhZT+71Dtz3kHHz6h6CsSrJLZlWF+CcGIKNsGhqGFQfK4JdJ
X-Gm-Gg: AfdE7ckaF20RyPkANj6WcyocrACWih1nMnm8t+fc/iRBZCSNvxAIvNnwLBHBybCf374
	8fSO1AhQiCNYQqjTSqcVjOM01PXH9Sq0g2fWRYsy7FKX/aUytyvOM5bOWCeQ7A4YbQkAP57fkrO
	x20wxQnlp1T4tJCc3TYXJoYzPyGnocP5MBE+Pbeq37XPtSPv4lp5ZHq+7WLGnPTo9jrDi5xdsMm
	e+mc/7p+XrrqccrDlmpZ2giSSGCnG35esrO1+JFqGJ3ECys+nIMljrGOERogKPw06WgNfDtPb2K
	BYCW3aRDwFocUnmc0Za+q5jqlzuFFk4NEvgb+hfSMoxwdXYCUFQj8i9XOOHlXL74/i5schHb3RE
	S1/SuCt1TeXn6CATjEwmfy6NHqTaBywtBDrOoFQ==
X-Received: by 2002:a05:6a00:464e:b0:842:5bf3:c53c with SMTP id d2e1a72fcca58-847c4ffed35mr4034043b3a.2.1782985286855;
        Thu, 02 Jul 2026 02:41:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:464e:b0:842:5bf3:c53c with SMTP id d2e1a72fcca58-847c4ffed35mr4034007b3a.2.1782985286399;
        Thu, 02 Jul 2026 02:41:26 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb75d850sm1141595b3a.19.2026.07.02.02.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:41:26 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V2 4/4] arm64: dts: qcom: Enable SD card for Glymur CRD
Date: Thu,  2 Jul 2026 15:10:56 +0530
Message-Id: <20260702094056.3755467-5-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260702094056.3755467-1-mchunara@oss.qualcomm.com>
References: <20260702094056.3755467-1-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OSBTYWx0ZWRfX9Pk5II3xUUkG
 0669xo9UiCeBZfu1xvJpEM4fMIuvl6H0IBWExrBfN+tl7LcKD+HnxzWQLqgLCl4DuSP6gXvu4pY
 5ftoIIZ/6FZm4vX9DRFCJP7CK7HuMfzAveu5OY1IIWfezjs+5GNRue2sI/RxQjEu9YVyfaHjKwW
 XFtPvXi2WU+ZmRBxs0pXsN53s4JDReQVWk0QZczXF/GAJ3wMGAZiiLWq+1w82suOpWaQKXKtQUI
 A/1n0tGTsQf2NeMLeFJA1XV+005x4U6Ca5AKWiNf2hxT/pQgv7TSRYTlGvw1N4dtoB1WrUfBLDb
 F+Wz5hMyj8qPr4Cx3TdNfdObvXYZ0ydO/51CDWGlZdECw6eKh8/BosvsildyRCp2cky5cCRe3UC
 mk91eApSozmSAEDFRs00nkGhqZ5j54kiDOC4TwLQDKpjuGGz+3gsUALsjmxo6GcagxtTwF1Rb5H
 BFqqsgnnSh0sAR2tPQQ==
X-Authority-Analysis: v=2.4 cv=Lv+iDHdc c=1 sm=1 tr=0 ts=6a463247 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=BFOuVXoWwltGLQr-ouQA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: yt6kKwyM_L2C3bqsACU5-1u1ECdBIVh3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OSBTYWx0ZWRfXy4L+NG66lDoW
 bIHb2gaP1uu1SVLrkSxc/7cI5GTwKglcHCKB2E2Pez02ztVp+GGeP7ig4z/eGUkhZqM8ckYERsW
 Nge9PXFeYj+wvSBj+raMf7ZtoY8dmu4=
X-Proofpoint-GUID: yt6kKwyM_L2C3bqsACU5-1u1ECdBIVh3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020099

From: Monish Chunara <monish.chunara@oss.qualcomm.com>

Enable SD card for Glymur CRD platform. Configure the vmmc/vqmmc
regulators and gpio-based card detection for the platform.

Co-developed-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
Signed-off-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index c98dfb3941fa..48407e47aaca 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -268,6 +268,22 @@ misc_3p3_reg_en: misc-3p3-reg-en-state {
 	};
 };
 
+&sdhc_2 {
+	vmmc-supply = <&vreg_l9b_e0_2p9>;
+	vqmmc-supply = <&vreg_l2b_e0_2p9>;
+
+	pinctrl-0 = <&sdc2_default_state &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep_state &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	cd-gpios = <&tlmm 221 GPIO_ACTIVE_LOW>;
+
+	no-mmc;
+	no-sdio;
+
+	status = "okay";
+};
+
 &smb2370_j_e2_eusb2_repeater {
 	vdd18-supply = <&vreg_l15b_e0_1p8>;
 	vdd3-supply = <&vreg_l7b_e0_2p79>;
@@ -319,6 +335,13 @@ reset-n-pins {
 			bias-disable;
 		};
 	};
+
+	sdc2_card_det_n: sd-card-det-n-state {
+		pins = "gpio221";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
 };
 
 &usb_0 {
@@ -427,3 +450,4 @@ &usb_mp_qmpphy1 {
 
 	status = "okay";
 };
+
-- 
2.34.1

