Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCC046C82A
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161485; cv=none; b=ql+82HAVMfSBvAReC0oB6gXGmH33DgKXK0I5F+STKVi8/oxmGV62W4k9RIcrtdKObyJ7Cza0zh3cQE9HUFCxinh+k52csy9LUqCXaGnYaFt8Wd1LDbdIM6hJvGtckA+bDyd9rofg8OiDxXf/Yf2C+euL1yB4O/GZv5r1caI5D8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161485; c=relaxed/simple;
	bh=9M1nPTo1CIuFQ1/rdy0C4LqeSuxLcRZilyOPwnHrM6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fmRjO5K2a8OJgqP6hK1gk8TBuEDdE41VauxfiB+cekt0tct4YqXi5cjYmF+2InfAZpMdz/HfmE3cn5HGbmc9/ns1QZKL1g7IrIo2Q8QiZy3EkedfmdehE8xBfC5pBphLMPoG6mkDxqrgGuGorz09EqC42CkrG96M1XqqLLuxPNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jhgMZnWf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SahbFupt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jhgMZnWf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SahbFupt"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2fPv2821229
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aWIsVlhgYhz5NzYHzdTprwTk+dhscOHAulUPICmnuJE=; b=jhgMZnWfKdBgbuEa
	WiLefe4pJbuEcWeFpeqqbsJ1aKFbcbZCbF4ITbSnbyKI6qyE4HO6maTDe6fO6oMx
	bBaqcgMc8iJHzFFlQww5iVLuPX/fUgP+ismfA1/HjUhmIqZMgirbrTMtWI6+4yAl
	JxKELsduWnwYTGZpou3jrDNP8Rxu9qjU5KGSu48axOmwggvWuDy5/V6HLFjpEXvs
	wojAdgAjJh3XKMGXCZNegvWqNOqiqrjE4IT79+bM+SeXTu8nlGsHS0NivVMMQDy1
	Jr8E9LmG+bszbKJfxMeQ+U+uKchf9gsl/RuJJKfNQhhcAtMIMcazuOQHpi/DFvvu
	2DD5Rg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwarf5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:04:34 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33310847fcaso1359774eec.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 04:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790161473; x=1790766273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWIsVlhgYhz5NzYHzdTprwTk+dhscOHAulUPICmnuJE=;
        b=SahbFuptsImaRJHqGX5S2NT/oV2Sfmw8d83bLtdMSALo6uBLFqZ9KyT2yJ4hxi2aIk
         ANqzr6fOQ6l9JdQiwcfG6olQ7XCZ4d0JZ+JHpuL6LClkrzKIu3yg3HqjyTYFmZw/hwiq
         NB3Y5xeLUxjCXhEACrTP3+XA45GR7eEndbFpum29b4ixYA9SwAFa7qVVjEJcepcrAaaB
         +gzSL1UDQT7VPNdAeiCIAKkBK/zvf3VZVhO8cwqexbK4tc92U4ucR5QYO4UeXjfWa+E1
         0FCCifwcEZNjqMwoqtu2Bc1/NzVxbpqlejjX357UoeBjPM+JXEAdcNIuznlmnDnwzpRC
         OfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161473; x=1790766273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aWIsVlhgYhz5NzYHzdTprwTk+dhscOHAulUPICmnuJE=;
        b=mWDsyfjKBOjLsf/vQbSmWQhiMCvg3ozqkbBcR8uKnJpyIP33uVFkUcFHGP2Uy88aW7
         fagmODFhq55Bp8M5OWOu0bL3VnMxCPurL2c2W36R/Y6o5d0OKUVvI6dksA0ru0lFqs9i
         jcoLSGPEUdcowFeCL70O0/XUD5UbLPK2j6Jaxu+BBaTDlQIXDSQ/tx8YZIJ+kp1a1dl3
         7S+kgLE7uySpofDkhEW4VJC4iJw4TFLs8IhwFWc+VbFMC91iBb59kP16EJrvf1qXC/FE
         Kho0vuokcowrJwBKCck8hIlyWag2Iwnu+khL3W3S4/sl3yN3bq9NToOBOZU9QbdmSO9H
         92lQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlPENXvEQmlsAcQ4BNCuaYRyiwnzl7V1lfcGJti6b9rl3+b9lKdOZ0EYbt7XhhtRGnMTM1lhJTm9FM@vger.kernel.org
X-Gm-Message-State: AFuF++lSdk2bQejMWeh9Qd+RyUpkJVsPRPQteiPAUze9TzhMwa9WaCib
	01R/q9NC2r46ooZwlD8i/yRoF2/UI4tYoGX3W85yqrtLUEaeHvwqXn6zChOZc2T2Zy32fy7BZ5Q
	Ev/fK/8ZHOVpVvxALnzqMTeHrcT+XY/q6QxzrwyT02ATdk1ZMe5Td3UtxoXFkXgKG
X-Gm-Gg: AYBFou0kNgTccraN07126hZMNVCvuSqwSNMEcpvRUQyneUyG/xKRHKaUPMVFLcDPkOe
	BpdZKODy6MPHz5zGIU+JaXa2kkpkBN0yUyxDWK/fhRKB1TjyM/oFDIi6s6Y8AXBZAqfjZRk5iZV
	CfYIZSndiBR7u0PU7ZZzqffqEsWU6eD/30ZTxkTMoeddiZMgPB59TObd6uy5Y0SxWSHPvT6XzVo
	5iPaHVtvVc4EQpegA4w6BFxJuhMcnMbMAJvyP9JX3HxsIBW0Z46sGlfVX3ZgwPQR0YNDWMno+jV
	gZULUJrJuaWqgNKvd9nYzRXcN0mpO1mAfqr7AqOrd7rHSpFxse68q6CP3YkeO9Lcd6YI2vSfcPB
	JFnsJk6V8KG+4/+AqacQ10qgo/4H5og==
X-Received: by 2002:a05:7301:2501:b0:33b:c29a:713b with SMTP id 5a478bee46e88-33e8c72bfdcmr2190344eec.18.1790161473108;
        Wed, 23 Sep 2026 04:04:33 -0700 (PDT)
X-Received: by 2002:a05:7301:2501:b0:33b:c29a:713b with SMTP id 5a478bee46e88-33e8c72bfdcmr2190276eec.18.1790161471676;
        Wed, 23 Sep 2026 04:04:31 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625825asm5905377eec.13.2026.09.23.04.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:04:31 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:32:40 +0530
Subject: [PATCH RFC 09/15] arm64: dts: qcom: hawi: Add camera MCLK pinctrl
 for Hawi
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-maili-camss-v1-9-cbbb42e534ef@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790161355; l=2026;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=xx492fU1yfGENWkKCTE6TQKz2zLJfMohArToVhMtg3M=;
 b=oJibmOSvDBR7RKqtqAsg/gVA06lp7FsF23AJ1+2gpdaj0hazu2yA+nnRCQNxN5e5TABgvFCjx
 SOzagjdVWK+DUkD7omJ+Cmcc6PHJy3b2qgfWdsxBDdPXrxafn3MhN9S
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX7MwrgHOgMOUe
 KvtpOzx2HOH2aROHALz9BuijxrqpR7OsnB3z9i1JiumdPhCpOzPqt2aSx6w7UhQ10d9c4jI0ED/
 jHcFE79RJVRc+Xq1vKa6nixPpQyxGrq9u0U02ooxhUeiH9rpIhV+KERLfa2gjr84pcX8CoHZ4pH
 h8IKGRO314IU7DFuYUGrR+KWVHrdd+W4se8aN4AbnIkJJktwyBmxOKILFIWbADROmg06W6pjyOQ
 iFSfZ8Rq8Tjr2gPUH7OTSTUlbYbKnWfN7lKR1KTITjVnxk3WohOU/39eGYpPK/WJj7mgzxY04Uy
 mpTKytS2lJ50yY/P/VZTA78ffwBG3jmZz6KAYfLlOMvJzf2PaiZ9icvQIxkbuQ7pJFSf27IGI9E
 ELlYV8WeJ5M0mBbXSx3UNH+5yzJVMfuUMlQPtDgY4XrBKIIubsqOES6sb21lEaQ8Zz8vB4PNRms
 WqRQWHBvcnB7EGGvcUA==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab3b242 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=LoLYTzTP-NOuDkKnZLgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: K3DgFzC7TuePHdiGXd3ov5vmD_hRZw8n
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX0GcAD5xOkpg/
 5fbhWpgMj2Sg4SNb33x1caIovCMoZauZUeQuiJ7RIei8NnHGgqcJwL/hI4Yi7mZiiThLmc2HbKh
 cwPD7T/nagy7F6U6yynJH2gi+LPcPh0=
X-Proofpoint-ORIG-GUID: K3DgFzC7TuePHdiGXd3ov5vmD_hRZw8n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230044

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Define pinctrl definitions to enable camera master clocks on Hawi.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi.dtsi | 56 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index bc7adf10bd4653cf50527a1ebb38518c66dba900..85a9faad59fc0387ebf4d7565fd08dd7acce1f26 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -4712,6 +4712,62 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				pins = "gpio89";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam1_default: cam1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam2_default: cam2-default-state {
+				pins = "gpio91";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam3_default: cam3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam4_default: cam4-default-state {
+				pins = "gpio93";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam5_default: cam5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam6_default: cam6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam7_default: cam7-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_0_default: cci0-0-default-state {
 				pins = "gpio109", "gpio110";
 				function = "cci_i2c0";

-- 
2.34.1

