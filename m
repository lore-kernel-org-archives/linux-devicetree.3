Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8F0421EFC
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 19:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778266962; cv=none; b=tTV/Kcik+WyIZVMPCNNz5nvXJlfyO1dACFX2Sc03pHKDuq7HuiNnbbd7bExck80WAeoA47Wfe3y1YZ/RbiMWurgsCjeIOPLbI4eKvQvDEYQ98WENSwH3ozIja5MT2rShIM6EC9JTBsg3DG758clzJ+iMOE6NwxRlpMj/1VReMhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778266962; c=relaxed/simple;
	bh=DDN57pej0y3Ltf0ub6QCqNvBebv6aWZer0W3ArGFCCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O444wrqKYGT+bVXkHlC1l3264RSEUZHxx3fdb7Q3LdGWD63ENzAJrs0pgzUbwKMZmqQB3k6bgD/x9tfg9a9PyR2qr7LooArsAvdZPyDcG4aqJqsAsJ/9eWSYO0tSYnfbsfWXQ6SC8+zTl1/bmvAs4rAU2ShVvA9ES4yeIJvQ9c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZoiccdI/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=in/Xikor; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZoiccdI/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="in/Xikor"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648CGq3W852271
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 19:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VUfpAIf6lAkbIZyifhFThrqlqNv+nw276Cn0YLBJZDc=; b=ZoiccdI/+SBIEzg9
	A2Az9oCQElFc7yNejZdEsCIJ00/VCbC7tpKnJV0Iph/neJL79RUcIET/iB/z1FFC
	ryIiON5IuNMqTQZe3IOdbdtZeuZ1pxS1I7edrAyL/ltzeUrtXcrfvX8iBJGOIvsI
	XbHA9tbvoCTcZbjPjYEEsc5YtkbhaALxMmqeefIiRNNEttS0lFHY6UlsMX/Aoo27
	rwBMj/u9a0RhVm0wFO98NckbhQfOYEShTpKQCh8wJH5UQTHfRCODU9rwhCc7O7o0
	J1JbuBNuEKNxXepUA0CPJgqQf+c3TheZw8YTSDpOig/F7/Q3swqji/aYYwv4W/D3
	NZRmUw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1fpthk8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 19:02:39 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f6e6a3a76so2325321b3a.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 12:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778266959; x=1778871759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VUfpAIf6lAkbIZyifhFThrqlqNv+nw276Cn0YLBJZDc=;
        b=in/XikorPuEIbIwV7jJuXpYHMVykYDCJO10aZCs3pehZtuXYavWgA52epmMgNxgsvo
         cNduCpsKMKPJaXhbntrcl/psrvoWE0rFjTaLw+iIgFyd35Cz26oB00P348owCic3xadp
         U/x1azZlow8VWmRuMdz3IhefmjbkjFXAI1zxqq21R0Oq6ta45HGB1gCA3XQGSbd9rChT
         j3HAXzkIN6B8ydjm/mHoii1QtUVRzvMLADZE3QfYJert4URKhcSQUpzU/SP2OSuTvBkL
         MLAvDTg15d//JXrmhckTsuDlyiFIOSIGW+ldeDnHrh14QWAR6Sn1MlWMX9jUGgdQ0fTO
         vyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778266959; x=1778871759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VUfpAIf6lAkbIZyifhFThrqlqNv+nw276Cn0YLBJZDc=;
        b=bCBrAu4Sr/orDJFgMf+niaskRokLcT7acDqSJODwis5vKJ0sSo5vwLdwUQjVA15vUC
         3uyMQUmxretfJIplcOKa+8CeLStY5K6gGelbdE9zsRFWmeGLrkT8YzXnyDzSv7e0ANBf
         +X4Ob5BC8JMQlNE1rWu0ykOgOsYop5P+MTv+3S/LlawQf9nQ/A+t3AxtjvcfO/3SvtYS
         vSQtBxhgBnFPQqnRnLHFBabtv+Gp4yxzET0lUmT9dGzlQnteBB9tO294y1n1yBUiBmxm
         7Gc4v8HlxknHpgO2XY9BIgF/1qc2Nk5C8FPggXBtSvdN4nxEibxPID1iiDPcdri5GN6s
         ZfYA==
X-Forwarded-Encrypted: i=1; AFNElJ+e15driR/JRvWu0fXB4sbtVe+RM6vJMf+EoqlEQ6LPEFFNS1JtIOHhMOy+kf9ouhvjS8OX4c6LLgd2@vger.kernel.org
X-Gm-Message-State: AOJu0YzWtFF68l2j55OAfaNsHmVEKxXJiTTRFxHnq33zXyvbBqhBHmOe
	uuBjDD/AQktk+wZnZWfjdezGp41/brtDd2vz4wH5A9lw9RX3v4ANG/c3p6h3l6W6nHJky1n8QHL
	9jTrKPeQO/9Wze6Id0BrzEDenazLtsS0LkFFVph0xsplhLPge0GvNE6amp8w3+iX8
X-Gm-Gg: AeBDievGgvMemB4JwWcBV/T0vmSx9b1R5KjEvX4P3ylCAhtpr+XJ1e4fPojQk28rdEV
	fv9UNpOKyD0XzNYBut8UsxMlB4jb4yZ947FYIRwQqBLUYJ8UBCCttVo6o8prDBuNQjqmO649SIq
	K38Ee35GCC2JxDcIWAvcVPOPf3Iu0rdprZe7lTcLZMCQy+35V+EZLI/FPWDes/0YFAEM3VJXAPe
	vFIV12uFwnHevgj7EA77bZT5KQka14n10jXh0c5h4aHmXsVrpih7/LUyF7C5u8jpOgeNcxfhT/U
	M70/nINimvug8Gv3FkHqDz+tyaZaVrp9aPHFfwQ7kjlC1BBOV6WJ5PdhUkSehxlu0oivVSJulaN
	Nitva1eqvn8TgOS6cltOZq5OTPse+LNvpn/vQ7O5NJHQvvuz+CXr+hd0=
X-Received: by 2002:a05:6a00:4b05:b0:838:af72:fb2f with SMTP id d2e1a72fcca58-83a5badbd3emr13466858b3a.6.1778266958760;
        Fri, 08 May 2026 12:02:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b05:b0:838:af72:fb2f with SMTP id d2e1a72fcca58-83a5badbd3emr13466823b3a.6.1778266958288;
        Fri, 08 May 2026 12:02:38 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965a3e3ecsm13395550b3a.19.2026.05.08.12.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:02:37 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 09 May 2026 00:30:03 +0530
Subject: [PATCH v5 14/14] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-glymur-v5-14-7fbb340c5dbd@oss.qualcomm.com>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
In-Reply-To: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778266845; l=761;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=DDN57pej0y3Ltf0ub6QCqNvBebv6aWZer0W3ArGFCCk=;
 b=43GoEfeonHscvF5G4ZYHZZNfYPeq/aygoPj0v3/hqMHX2/+nPmJQ3WoIzvOBrug9x+yhhPKtc
 JFr/KTQrnkQACNGBhNoUj3l1N0rXNSwZa/klt7wlr+TtOon2nDNgQDS
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: tfjQxM4IEdN6214G29bz7RPituFlpA8w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MCBTYWx0ZWRfX1nMZQghjgsLB
 1pq7OhfsbNHqI8wmd0/BV/H56BT3tZP/xtCMXP4WCIs1x/d9pYdzT7yUmG7nrpqt+66A7Qlm7Zz
 p75uUJ1MQJupbHipmgw+b6mfnQanEuDBczmxhx6/FpITKf3kw1iWE6v0WtuQLD5Zi62X/RsePg/
 PA3sFf52GU1Zz2+t1cHSq6tOZyY7np33b8K9UnhzR+MUDrxFMgES0GBEFM7ec1OFWc8A/QRhPt6
 rWHv2a4IHPOYmxX7acPXm7lR5CBq7lq8mS5Y88TT4iJnpeUmcdtEY0FiBKP5prnsWbvlmjJQGF7
 RPC01oMSApchPrQ77/FXuisX8Xi7wRqCZdCSwjhU47MNCgXR23sObiA74eufxZZzy8pKs+PjveP
 ikne900ktLPZlLhHONUER10T8LnqK35yB2k9SIYUA4V1rd26UiUwvWD8rGwRYJr00iVl0tSxyPY
 QH1OF8JmplcEa9nUwkg==
X-Proofpoint-GUID: tfjQxM4IEdN6214G29bz7RPituFlpA8w
X-Authority-Analysis: v=2.4 cv=IYi3n2qa c=1 sm=1 tr=0 ts=69fe334f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Dn0IJEph4XI5J7oltBAA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080190

The iris hardware block is described in the glymur SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 35aaf09e4e2b..8d6ea857634b 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -198,6 +198,10 @@ ptn3222_1: redriver@47 {
 	};
 };
 
+&iris {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.34.1

