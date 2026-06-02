Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E6F2BD0B
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 09:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780393711; cv=none; b=umei/5MOx4fA+nkiTIDJNkpOVt46tJjF4CjE1SJ+I6HheODEik07RHvgYItuCdR1cyLXOShxa3JqPaa+u1bxUQgkHkk9HTTvL5n6GrK3lgJTM+RyVnkf38Y9GqSfFrMroH6tp5eccuGdjMrOfJ4hXpS4a4EmFwsefT2c8Thbgr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780393711; c=relaxed/simple;
	bh=/EKYeoql4uz7qFU2ossGbNSvCMyd/2sUqURgb/Ehhn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ANsR5IUUwh+WWRc2yAcXZb2T5KXUAPo/61gIclLi8xKg3CraRspO3KrRSZbaNZbO4v7FwJY2ohs3e26edIu5L5IBvhHKukEtJYIPPiU4gY2yZrhpJDXx0tRm26UtTNrP3RvjMxDUh4jkgThtUl7+A6D+4PA78yYHvvWBqakZ4xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bWNhX8mF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vx860eqd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bWNhX8mF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vx860eqd"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652452H61937322
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 09:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jQk8jqGT7pq34AKhFLCcMW
	XkDtE8VQOTCmbH/hEYdyc=; b=bWNhX8mFuMRl9p9/BtxSfUOYhKRQ7LHIClFX+W
	GDdkWoAUhh8xFks7VL9UVTudxE04GjvQH4iE5a9W7EXY8xI4zUp1E1KL4/ALekVt
	JYuN12w9PlAZvt8NJ3DfTVzDYx0eqLIvRXIuUSeaqYEvMDvjiIrkuMfIzqF9bDpw
	36tDdZ57YjNrMo58OksLLNxMn1Xc4DxhKNgg+qkopGmY1tZbXxzMsX/XYy6NMmyg
	YUHOLoiKHsgML/9QBStS5MnIbtbImdAou8ccNtw7aWMmWMhpahTWpAO7dd8yphri
	nTls/AIEHcKMH2d7M9eWLy/57bhmsbrUYXaI8776ivXkFChw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehqubha8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 09:48:29 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1353bfdbf99so7465045c88.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 02:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780393708; x=1780998508; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jQk8jqGT7pq34AKhFLCcMWXkDtE8VQOTCmbH/hEYdyc=;
        b=Vx860eqdSPKX8y99P8rrN1GSEl4scvyG2WRUEQwV6vgVCHBoivrn++jjmAVAzlnjsO
         2HnWypAWSoNQhwsG/vuHdTuKggIf4vHiW9dpvIWRuZCm/pjn2hJECGtvYn7GDMWr3U1N
         dy4UepUWhkTNtYsZQ/8nM1twqDDkZoc4iLPHXiATj9vETUAJ9ASyeTj3WbCcedMsz3qq
         ZpFshULVZKaEgJuciYgUUv1Cnn/xm03gN3WBAH4An/9DkBlb1FcjNpj3IccMspZiEQGv
         2TdscIQBP+Qyr0uGIrHnevGTcklQnkeoWgcuhhsq/scDnQBx4Cnm2ypW+/pR0mAxdi/p
         0QAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780393708; x=1780998508;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQk8jqGT7pq34AKhFLCcMWXkDtE8VQOTCmbH/hEYdyc=;
        b=XSVxA9HBo0Iag6dkHsuPq4ETwe+UoVRvZqXxxMi68dXYi4S8CW2HeTF7eQp1p4OFbN
         a7GhzCBN7OjVrN/+iAxCjEzMtm20X+WS+Yc06Px6U2EOKJ/rXHlBJezR+hJvCtjD+tb8
         2lFhlxVYdxTlAMPiXB4PXRCEYwoYav5KN44o4JLuosAiLQjqLOTmEFL+dxkZCYe/utej
         18bkRA6dZQrI1oMhgFErmlI90p0ZFocd40v+N6PuaXio4ERtaDkyFYsd/LDRY/psYurM
         LEhEb3NXK8c401dk4rMnBRHbDOScesw4TGITtqP0q6SYrY0JJhFoUHIEixr3qOo5hk8q
         wYOQ==
X-Forwarded-Encrypted: i=1; AFNElJ8M/7zoL17ejnJsoUnDP2XDoqx9h6iV6Xbsxywo6PlFg3cGC/UDaGFEyAs8Jo8SqHcdHqOEWxbcI4Cl@vger.kernel.org
X-Gm-Message-State: AOJu0YwUq13AYk7yhAttjQjHAPB6ogP7wVNeAQfA8zdnhqE0lJODx9nw
	VCwrmLK2ew6K1JieGa8Tgm6gemtPiXV6ziIC8gkiWdI/RsaEXcNdbxpuXSYJt5dYaKnEzQPfgxw
	w/h3T88J3GtC4UNwhhN/L19VDqxf92JJZKPUBCi0tVawBPWZfP7LJNSDlcAvv1+25
X-Gm-Gg: Acq92OFAymkRQIWc195Y2bLCVl1qOayQVChLNLw1x7WhyCF162WT/XdXAaSu9mcnEzO
	8nnPfnCHzzNQSse1K+Gf4RCOLOEWY84XIxb4KU590ZqX0kuyTtN1PaqZ7l/9m7r8ol0EHPYOpnM
	PxbWGV25A6Uqt7H7dRAh9DcfivdGDNMIAGcfDwQB0KSLtLr+fqwyKgBZsKQmUcTT8KRfe4VyZKf
	hldiXnuYabrB9SLxPDw4u0IDGxzMKtDjc5CSr9t1CjrbcmEbkaBQ7jTofOX/PkBWtR/ACWFiOvh
	EfFBjApsEYZ14CN0qf68AHK7ixJeGELPlJwCCXiApu2IwBnUCbKBNishzQ2rpTtABP3WZ1UasSE
	LOun9nn8FRlBDbwNCSukQvhw0fKNLDC7sLNZAwQ0kdBJuZJe0AQE9nYpBgzPVM7uNgLhbSGyN0y
	adAcMDL3ApSjs/aIfn5SYs
X-Received: by 2002:a05:7022:607:b0:133:3c47:932e with SMTP id a92af1059eb24-137d4251effmr7110702c88.28.1780393708455;
        Tue, 02 Jun 2026 02:48:28 -0700 (PDT)
X-Received: by 2002:a05:7022:607:b0:133:3c47:932e with SMTP id a92af1059eb24-137d4251effmr7110675c88.28.1780393707910;
        Tue, 02 Jun 2026 02:48:27 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137dc179940sm7091758c88.5.2026.06.02.02.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:48:27 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 02:48:20 -0700
Subject: [PATCH v2] arm64: dts: qcom: glymur-crd: merge duplicate
 &pmh0101_gpios node extensions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-merge-duplicate-pmh0101-gpios-node-v2-1-251107b3d9fe@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOOmHmoC/5WNQQ6DIBBFr9Kw7higarCr3qNxgTjoJCIU1LQx3
 r3UG3Tzk/cX7+0sYSRM7H7ZWcSNEvk5g7xemBn1PCBQn5lJLmteyRocxnz2a5jI6AUhuJELLmA
 I5BPMvkeoJGrbNFaVqmJZFCJaep+RZ5t5pLT4+Dmbm/i9f+k3AQJMqbuyUTerOnz4lIrXqifjn
 SvysPY4ji/PigBd2wAAAA==
X-Change-ID: 20260526-merge-duplicate-pmh0101-gpios-node-52eaf99f8485
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780393706; l=1840;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=/EKYeoql4uz7qFU2ossGbNSvCMyd/2sUqURgb/Ehhn4=;
 b=xU3boV6WV/veBQWKXZN9rS1v8cVHNiujN7Kpa6TNvY4aWY5oo7A6H0CPxseaWMpw9BmvOHN4j
 L/OEd9qFOhtBptMuiL56WmB/5UFPw5xPg65KX+E5U720P0D6JRXbD5O
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-ORIG-GUID: eSiJlOkE8n5-cRGZh-D2AhgZuFwmlqxE
X-Proofpoint-GUID: eSiJlOkE8n5-cRGZh-D2AhgZuFwmlqxE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA5MiBTYWx0ZWRfX1qKgQe8uSC6R
 POiNsRdQlBAJRwig1GWqw0x7+3x9DT4hYydCKpSc/+GD5khNVBb8ucfFM0UmNPDy+M2zlspEo4B
 vWeWHFZKBBw0DN0QRxtDP/gPR5wu6zXFp2pNvS27czi9eVldTol6oWeVVLWa3Hx7Bjq9iPTKVzT
 0hF9rBNNOjU2bRgsKBJiyACwL/ARaxpe1yG1fILSrMw8HMRqZMQp0YONJqN9x1F8MfYZ8AF7B6B
 ovbnHeBJxHLENksX2jzDLeL/de1HPWeuM4J+X/6eAq+8ErmfBbHUmFMy2dncpLqBlnue+ksLOjB
 H+XmP3HWbmDqp0tDH6MZAg6Kzq3Sdxvx2bQtVX9va24fXRjNPN8b32ROcczQP4cqCatCxGnxX2L
 Iz9R4P7/blA+VHnztrBvmhBn2uC10T0ruLMz7BH9gqzessCxwDzRUuT2hcQ7c4aQydzwgenQZvG
 vMk+9k7hlu04vkEptOA==
X-Authority-Analysis: v=2.4 cv=FcoHAp+6 c=1 sm=1 tr=0 ts=6a1ea6ed cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GPmNVz9IxACOmcSOMuAA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020092

The &pmh0101_gpios node is extended twice in glymur-crd.dtsi. The first
extension defines the nvme_reg_en pinctrl state for the NVMe regulator
enable GPIO (gpio14), and the second adds key_vol_up_default for the
volume-up key (gpio6).

Merge both pinctrl states into a single &pmh0101_gpios block to avoid
the duplicate node extension.

No functional change intended.

Fixes: a5ad8a8e473c ("arm64: dts: qcom: Commonize Glymur CRD DTSI")
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
Changes in v2:
- Reorder nodes in alphabetical order
- Link to v1: https://lore.kernel.org/r/20260526-merge-duplicate-pmh0101-gpios-node-v1-1-c4ab4983f8be@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e784b538f42e..782578a2c5ff 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -538,6 +538,13 @@ &pcie6_port0 {
 };
 
 &pmh0101_gpios {
+	key_vol_up_default: key-vol-up-default-state {
+		pins = "gpio6";
+		function = "normal";
+		output-disable;
+		bias-pull-up;
+	};
+
 	nvme_reg_en: nvme-reg-en-state {
 		pins = "gpio14";
 		function = "normal";
@@ -553,15 +560,6 @@ nvme_sec_reg_en: nvme-reg-en-state {
 	};
 };
 
-&pmh0101_gpios {
-	key_vol_up_default: key-vol-up-default-state {
-		pins = "gpio6";
-		function = "normal";
-		output-disable;
-		bias-pull-up;
-	};
-};
-
 &pmk8850_rtc {
 	qcom,no-alarm;
 };

---
base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
change-id: 20260526-merge-duplicate-pmh0101-gpios-node-52eaf99f8485

Best regards,
-- 
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

