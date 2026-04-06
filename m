Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23BC2F4A0C
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 11:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775473289; cv=none; b=XM/fS+Z7hOcHYsnTyGKnJytpNPwaMRJtaydDtapam2h13Kd+HTjdEikWa5hl7gGom5SRtD5Abn2k1sjuosGRHWxn3Nzs9kViZXicq7KG3xcyI2uYUvJQ2s6dgCWZpBH8fTuhx6FCNI0kK0oXXfOgFImukZhPjnAEUBptD4vi35M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775473289; c=relaxed/simple;
	bh=XVSQJAsYoVMAR93G9UBt1XvC4Txcv9nD5uc2OvoYbDY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E0sr3OFES/kV4CyjvPlXgfxWUP/PdQZ0xdwBuyEreJqA3yZc9p1+nEpFugHXAKKwoesboOPnRySWzyl5Psj5USL16tW7O9464kxV0GcZ+9cu75t2B/XVUtszqggw8wliyrBmOQkP4lulsvl+E8DXWXz+Njx/XYT5kp2FHjJD/LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mdVsCC+N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BNz6NOJO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mdVsCC+N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BNz6NOJO"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6369Xxoi1053750
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 11:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PGIKvZFR8Ji
	2CYrEVqMneoJ3CnAcjf8CSViSgmS0ZCA=; b=mdVsCC+NPJB6KzZEjuZ+guRCPX1
	fZG78yE+ecl8xocedgdIZ+CVLP7Jmp0lF0FfdPQShcxvCcDwgqzReS30JfOXz/uk
	bXbgCSpOOuulzyZ6HBGTwKuA1Gx/9vbaUcd0jO8KF2v3q94NztQL0rBEpskofLga
	hEdeQV/K/53+EikiNytolOUCWq7S8Gev3HCsqgbHYXldLnDqxv1RpfaOUkqhaa9w
	O4kz3iWlqt0UGFgf9sendJArc/5VXIzRdBlR1mdLPD4jYtbGLZ7gWfGAIvU/Py2Z
	3ZfSp5ymP8NFJGmZlJVbEXwdFUuyrO6KxNx5kwpVshV2U5nY53ZEPnD4HjA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasn5w022-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 11:01:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0b339b8dbso40492715ad.0
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 04:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775473287; x=1776078087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGIKvZFR8Ji2CYrEVqMneoJ3CnAcjf8CSViSgmS0ZCA=;
        b=BNz6NOJO27n9IEl5vC1tXjYJ2CmWcr1+/XoQjD9wV5eii3nrntGoAph2RXU1+G1nxR
         nlCjbyLvEJp+x19qqOgyzAI89OF1SjSKSwWizZkafsurYBE4rtvc22uH27oORTKXi+cv
         D88IDlLZC7n57hmMpwmCHrLw/omNhY8uuu8L5wwtph3X2vmMSYu8ZMK9DcKhAynjEnKy
         FOyd7dIHxWU3Fccb0Ylwz0JxDi2XpP6F176mPogf6dZkIGHMcAAwA0jvkPJpcG7IC2A6
         jaakmNolCXM5km+94bLGomIien9z3DCBQoTYD4gfpE+rD5sonRidBQYIiP77iR0k58fH
         enKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775473287; x=1776078087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PGIKvZFR8Ji2CYrEVqMneoJ3CnAcjf8CSViSgmS0ZCA=;
        b=GgQVUDRjmlv2VsNdFDSpBorduZ0reIDa/bqG4+VpmiTIlbCXMDT3T8mCXSyVnolCZ3
         nMNhUlLYX8w3tHVNbuJ1wWoidPyqEtR5UAvDT0Ddx2bmNSzImCgp6vdi/ov7U4DC41U/
         5hunYholfwY+W7MPo5T6hYtu8yCNEk2ZPWl2uC6S8aNKlWdpJDu01ca/5fYcf4gawHgR
         kf4GivunqndVvfwPFinAg7/P6vBDE0+u5R+H9gmPTKQYtG0odoUsA9HLxLpVZqZsgTn3
         R2Uffr85j+bXXD+Xz7mmTYS+9hX4+UGKiGopsm86K3+Qq7rVmF84ms7ktCpe5LyIyJbt
         5uzg==
X-Forwarded-Encrypted: i=1; AJvYcCWqv4veW/Nmk+iPs7tD9FWfwpHbOMlQlsAZztmaMwCpUM8rZ8GeHhOUAFBmOkrYqxTkpZiw1lOyU5vU@vger.kernel.org
X-Gm-Message-State: AOJu0YxfH6cBka8vLtaQXxusQSwr//PWPFiiZTXqtYRzdxC6mzEU70sp
	k3hu1nzu+Hl3e/Jr0wmPY8xrLMPfTL7vVlPjHTRbwr/Z8bvMM4dP6EqWUeYLCwItcaNkVNEwe6w
	gfigNSQscCvXLDJyW9krvCo0UER064NuXyZwT0IvGfM/mSX76OVEvGXfHXSEATe4a
X-Gm-Gg: AeBDieu3CNSspLwnqni75loKyVDWvkieh5DuLYdVUCL5l0smYq6cBEHGzkj3y1xrVN3
	GYA5JzOcIFYO2HuhSrdmrlbce3If9qLx+VxD+9WSjb957EsK77sEAK1hCsdw+h00eW4dprYERV+
	nAINrvxWc1eYTunBvSv1meXHTr4U2VGOFHY083y6zvErqoz1bHGrHL93+f+Z+fIAInTns2iyPpc
	WGJ5tMIU+WuSzB78q9KTkUaZb2svqGdIwSO1SCGfkpxp5Pj0RonXUGKqL6h3g1YzaRLrqbIYgCQ
	kQIqebMHqo1y6yBTFnjqgP5ycI9Xm6t7t0C+hX3sAYHk6p+fiyC55bgs4aryLc6zQlu0hb+J0pL
	TcmmOr3z2aWrNQwP3rQ0iAhjzesh+1EZyIOhzZ/9So+qaGA6+I+8tkfw=
X-Received: by 2002:a17:903:944:b0:2b2:6df1:111d with SMTP id d9443c01a7336-2b2816d82c0mr126296225ad.21.1775473286496;
        Mon, 06 Apr 2026 04:01:26 -0700 (PDT)
X-Received: by 2002:a17:903:944:b0:2b2:6df1:111d with SMTP id d9443c01a7336-2b2816d82c0mr126295715ad.21.1775473285959;
        Mon, 06 Apr 2026 04:01:25 -0700 (PDT)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27475bc2asm141696075ad.19.2026.04.06.04.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 04:01:25 -0700 (PDT)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v8 1/2] arm64: dts: qcom: lemans-evk: Rename hd3ss3220_ instance for primary port controller
Date: Mon,  6 Apr 2026 16:31:12 +0530
Message-Id: <20260406110113.1709886-2-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260406110113.1709886-1-swati.agarwal@oss.qualcomm.com>
References: <20260406110113.1709886-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDEwOCBTYWx0ZWRfX7ewqtGSWb2Mk
 h7D24Uns0zbGxlVYxGhCTojgVI0ND3YuvtO5UZ6x5a+wGPT/DA+63AgM/0lBqMTpb67oft3PcZ7
 HFwcIGPdaOeFV/vfHAk07esr03kRKr/egmyEQa8/gCUkhHpSrHaoTCFAIHkkUe84vLTti3Tks9T
 f6Z09duSBhX/JZAOWcxosaMV8cK2MeILj54XIj26H3kxMQiqqeQkWH4cXSzvAqOySCV5HhczK6W
 8uESJtsxkv1FxWqMVARd1/OToCzV2QUNp3qBM+h4tkSgKnW78oBQdLRm7wxBvZ5qqRLwUg491/F
 7xNsr/+cmcv9GQ/S60FBtzX64l8J6c138fTRkW0U1CMYoOiT9j7ZvTdgBo9M/FGjHNOqa4vbtYS
 Dj3YYUp3XNgrgxMfGVReOeF+hJEHZbS0hSsmnjeiFSpkJ2Np9DCFssBIlx5S2oHUFssaH9ewYvM
 YGAhiJCohO273+iqA0g==
X-Proofpoint-ORIG-GUID: zZUmlBNa4KKmsvQG_-iGlnt2TW-_74Pt
X-Authority-Analysis: v=2.4 cv=K9wv3iWI c=1 sm=1 tr=0 ts=69d39287 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=917_i3xC6rPZgS4eXuUA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: zZUmlBNa4KKmsvQG_-iGlnt2TW-_74Pt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060108

Rename the hd3ss3220_ instance to improve clarity and simplify usage when
adding a secondary port controller.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index c665db6a4595..522d407c9925 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -63,7 +63,7 @@ port@1 {
 				reg = <1>;
 
 				usb0_con_ss_ep: endpoint {
-					remote-endpoint = <&hd3ss3220_in_ep>;
+					remote-endpoint = <&hd3ss3220_0_in_ep>;
 				};
 			};
 		};
@@ -551,7 +551,7 @@ ports {
 			port@0 {
 				reg = <0>;
 
-				hd3ss3220_in_ep: endpoint {
+				hd3ss3220_0_in_ep: endpoint {
 					remote-endpoint = <&usb0_con_ss_ep>;
 				};
 			};
@@ -559,7 +559,7 @@ hd3ss3220_in_ep: endpoint {
 			port@1 {
 				reg = <1>;
 
-				hd3ss3220_out_ep: endpoint {
+				hd3ss3220_0_out_ep: endpoint {
 					remote-endpoint = <&usb_0_dwc3_ss>;
 				};
 			};
@@ -989,7 +989,7 @@ &usb_0_dwc3_hs {
 };
 
 &usb_0_dwc3_ss {
-	remote-endpoint = <&hd3ss3220_out_ep>;
+	remote-endpoint = <&hd3ss3220_0_out_ep>;
 };
 
 &usb_0_hsphy {
-- 
2.34.1

