Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B86445AD3
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784626300; cv=none; b=lBxLskU5Dw4O88Tuh3ZbuQU1JEL+T48QML+n2sifjwoPw7Vb7QTMkZOcGVlJ/De7cJlSlhK74DEW1nFC+H8UqYfY64/UNUf6fLzEjXycoZn/rVOQoqN/Ow/EuJs3jdCCUSlMHtZB7PYUzmY6y7hLjiDel0xWfnDAWdg14uv+lCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784626300; c=relaxed/simple;
	bh=qwpCaE4iSbgcxf6Sa9SaP0nZccWjbas/9Y8l9TomYqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KUL6msaQFXGnkPpnFML7vsFcdtoJPab/cbA9DD4tv4rjki6ujfde3s135NBz9WGKutetFC73VX/Ijk7rRnqrTeMKru40ELc8t5G8NjfmWRQErG8XVDL1jtuN/R1Tuec1TOqP8+EPjIlxFvv+dS0/OowuDVqnTQAFxpWlK5MHJbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZFSeLwk3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fjlXbz5j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZFSeLwk3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fjlXbz5j"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L86X6a043254
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:31:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kDgDRn0R/usofanEpWoD8f
	q5D3Vzsv14fYarFbWGmPk=; b=ZFSeLwk3agAP2X5+BsvAAYjDUTxggWi4BdUXit
	j+cTjsM+bQnCCBojHXgHRHY+YFOkFex1JPBb1qsdLW0ASKXC5qQedVeGA/XtQnc1
	Q4ZQS8q9iHvYCRNkV2pTfbnD+oSN5vKa6N+w9tQnMUXVsKHHk6TqvLqcURTfxK1x
	BzQQzNaacLGXm8YPbt+APpmVXr8xBHPSnE+PGxP/AFgrgDbW9IIgZw7ACkFHwA6r
	P4riMnKEzdbqnuIh49kB6JzCc7gHNQ5Np9jMSXrAHNbgyH/ULHOmjvH+MYPNRnbm
	X4Xy9Uqr34wKlbR6gqIg5FTs92yVkG+yt+KHWtRCAwLw5SeQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj0as1uj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:31:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0e702df8so162108321cf.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784626294; x=1785231094; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kDgDRn0R/usofanEpWoD8fq5D3Vzsv14fYarFbWGmPk=;
        b=fjlXbz5jrUq4WhHoGMXh56kEYAMa0vOgmU4AEfMi9njV2b+XykvPFAzm004s2P3fks
         Ll9BA/Tn/OzMk0UJbbzJ9Qmu0wmVr+mf1UQ+XFUCJPG+XWSzvlp9OwqU0sDSZdkUoWY+
         nsBObO0bmqNGhVwPAgNItkYOi27z/nWz5LzQ/TsCs8szxvGwOfeRAFnOoY6k5byEL/kf
         ZdymXKGVCNnZwVh48G7ItJ8Bpg6Q8OIEuprw9ahOgExOUcFW6JRo+Eckvarhpjjw8Yyj
         Dtf+IypDdpertoxaNBH3i7zl33YOHl6Dt+V/ACiNHu5G3232x1846dQJ7jS7RkItxctC
         YPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784626294; x=1785231094;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kDgDRn0R/usofanEpWoD8fq5D3Vzsv14fYarFbWGmPk=;
        b=GMXOooCtiQ41v+2xyNg0aAYKU1Iml4vCTR8RVtML9K+rZb/pU5oUpvQW9KAeAtOQdV
         3FFJSrP+vaXZtrv4cIdfcOFP2Bb6WYtnjkIdb9poFlsYCCGg+zN3OnzOz2sfa4FYVVBp
         MpDFhv8O084jDAQ0yYohcoT8TzVTfycSYm4SbOLvZdGUeMv/69wB7E8zx7cl0pVU9MoL
         slZYk042Qe+of/etbtpUUVp67s0CPBgxfYKW4jR1ZKBAxbEZYbXf/UKAOM6+CM5w5NXy
         GYaSJiJS4rD/sSGRB8R/Yo6AmDqUa2Q8Ry9HKbEwGCOu2s0+0ODwgnjNgAzig5X+bDfz
         cJrQ==
X-Forwarded-Encrypted: i=1; AHgh+RqP0I7y6XNsETLAhdcEsRquDsHK7tPNyYSP4iQPap0tgrV2IVpJIuXauKHZCk23s+jN/SoTQ8kp4syh@vger.kernel.org
X-Gm-Message-State: AOJu0YyEF8mEQDeL/130kvNgkDBGcllAFgAaCGHE4oDGOlgDoVKiNWq1
	chFgfQWPYeYblCLIZuIj9MjoVCxxcQubtx0Wi0V46cFMj7770hM+IOm103AVFccZYNHPcRdEN3o
	dNU5KoRPoSYMmQp7KmrwD4UzWVAkeNfd0hzcP880MTimsYkeYY/DOg5Q1Pa+Opmt1
X-Gm-Gg: AfdE7ckVotn8qE+R9sjFHJSmt4dDq0embT5NcLaYI0Gi8B+sMDNBLyrDS6nXNl3SJii
	GZ9V00inVYz9cMS9aGNEa7FSgdssGl3AqjuM61iqZu2bd27QB0Fcj7CZNckYt8vIfUBgU0Cgv70
	h7KFu29jcnhMcLjPA7sU3WxgaSWmGzeHG+ctnPqOGjxa51ljZV68Yv/AUtMp7AYSo2bRVnPMGh/
	fAZhMluwYXJUzGoWQHAYvDkDiU/gWQ05qs9ZjPGlFPvWEifTPlOHlDE3EklkXcpZLoOgV1rMG0/
	ldAwnzylt8lWSZijkDmfF0gqtlv8blItJhmKyVsN4h9YrCgr0WizwWDc7CR6H7unF//ySLi01nn
	3YDySzMir
X-Received: by 2002:a05:622a:95:b0:51c:11aa:1cd with SMTP id d75a77b69052e-5213e28fc2fmr168960211cf.50.1784626293898;
        Tue, 21 Jul 2026 02:31:33 -0700 (PDT)
X-Received: by 2002:a05:622a:95:b0:51c:11aa:1cd with SMTP id d75a77b69052e-5213e28fc2fmr168959951cf.50.1784626293366;
        Tue, 21 Jul 2026 02:31:33 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4955df9d2f6sm120782935e9.4.2026.07.21.02.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:31:32 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 12:30:58 +0300
Subject: [PATCH] arm64: dts: qcom: eliza: Add FastRPC support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dts-qcom-eliza-add-fastrpc-v1-1-cbea68d8e01b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFE8X2oC/22PwQ6CMBBEf4X07CalGCn9FeOhbLdYo1jbQoiEf
 7cKBw8cZzPzZnZmkYKjyFQxs0Cji+7ZZ1EeCoZX3XcEzmTNBBcnXosSTIrwwucD6O7eGrQxYHV
 MwSMglyepSWODlmWAD2Td9IOfL6uOQ3sjTF/i5gj0GnJrWm2s1ZEg4x8uqaKnKcHWzNn/JFWs5
 /K4NwhN9MCFlNbUDUoUahS7cb77T+cD2DqzTdU0VFXf9GVZPsrAO9UsAQAA
X-Change-ID: 20260721-dts-qcom-eliza-add-fastrpc-c0868aeac9cf
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=5239;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=qwpCaE4iSbgcxf6Sa9SaP0nZccWjbas/9Y8l9TomYqo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqXzxyt6sXqsaEoS/UVIqObVOkIq0fo5f0iZ8j7
 cLmUE8udZaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCal88cgAKCRAbX0TJAJUV
 VqIXD/9jvb8mTb+V/A4FehaSs5ulN2ClhNMJUlQ/hNkGDqtASAxwM/fFdTABbUKOmOWD4DnRO6o
 smQIhzj0y4vx0RbG7iVojwL+KbY0EgK5Al4ZCy6J1QHcEB5VRDR1Nx6U7gYu4aJTvQMIloT/Jrk
 WktDcM2gp/FmNfZigoUgmL4znNyhxqUAfRpzOTTul8GWMLBrN1IuNo4D8zpDCMWrd40z2OoZDR4
 Q0Nf0W2ukoOuT7bSObVdpp5D6rGRlt2xCxaCyJxt4R9S4Dk75h+BuMmb+ko72JGBsSgscT4O8uM
 4N3yuhKScHOTuctT7N7ISg8a2IdKZ+sM9JFxwl4NVRw2yMc8acAga98gTtJW6YTv9SiAUD7xic9
 yEmOvmicNvfMUaw6UgIHg9GEHqSPl5KIPr9REq4RnwIgUQERussDmiyAL+lP9uWzSk3pOLDG4sw
 TrmP2v4KKDzWq5W9pH3xGTsMyG0sTd8d1jFy4csDHuXgBQI+RD0m0kcycKQpC0zpKaRrpeMRwHZ
 kmE+vPlcz2RFH7j/z0rTObKepOlAkMMEQWF3MGWTuRtBCJ7LjoPwvAHuaM3t+Aq/bsSaCRe0X6a
 o/h6Bgn4VlaLEB1BZ3S1ppGwmxM3oW1jQ5rZa+gq+ET00VOUkx6/N/vfjCjZGDYqkrV2dVQjytL
 nF/q3EVU2snxwBg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA5OSBTYWx0ZWRfX2yD4c/NbsWIN
 nm+2C2DhoT5D6Wc2DttiZS7VFH+TqMfNMU8z39JepZrYhxMtLAvclzW9rBkMsCK4i9AJ6/OVNvX
 1wfXKfMm09l4Daz5GMvUNCsojciC8A3dyBiAhoTrRZrYZj8vIr0rImpNRqoyrz853fz7tH3pSlL
 27JeKZDjRaxixxbYBSqmo/b2rXLsPThgx5h5P1MAHoFK4B9tkoAUTBbVDWECbKtmqkxPswdIxHr
 v09R/a5wArJDjEITJDInuJLYCShZ6Bk3z+MXZP683PrJwaqhssvv65mFUuwiOgxI+7lY2WcVlDe
 JedL+yyeW+xXhFqifo7qjAjXD7ZZCJyYoqx6jnzsmfGTLuTgQ2zMFuuUTlJV4NKQjUB5NOj62zM
 1qvzvyaUTGBIUENQNGw4nfTYFibNaxXSXMxAoT8Bm9Cl3awQj0jG17ws9U2ItPr0l5T4lCj+GNK
 Or2sPxIiTjEldsCQyaA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA5OSBTYWx0ZWRfX24X8C0fLAje6
 qFOC6M2j9WWdixJLSA6omLdl4t6oHC4WuzmPEg4tXM0LaXZsfVP/yx14+ETR6wTllraMM9uxaIt
 NbwUCvZg0nZ2mhhCaSQu4PYNkF7YOs0=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a5f3c77 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=dz0U4WSOQfGUUhdXrBoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: hRxqRCasRoN2R_iuDHvkdSKJQNJoYcAn
X-Proofpoint-ORIG-GUID: hRxqRCasRoN2R_iuDHvkdSKJQNJoYcAn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210099

Describe the glink-edge for CDSP and the FastRPC subnodes for both ADSP
and CDSP.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
FastRPC nodes were not part of the remoteprocs patchsets because they
weren't tested in time in order to be sent along.
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 158 ++++++++++++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index ef19d667c7c1..4576b00c2e5d 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -2038,6 +2038,65 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 				label = "lpass";
 				qcom,remote-pid = <2>;
 
+				fastrpc {
+					compatible = "qcom,fastrpc";
+
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+
+					label = "adsp";
+
+					qcom,non-secure-domain;
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+
+						iommus = <&apps_smmu 0x1003 0x80>,
+							 <&apps_smmu 0x1043 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+
+						iommus = <&apps_smmu 0x1004 0x80>,
+							 <&apps_smmu 0x1044 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+
+						iommus = <&apps_smmu 0x1005 0x80>,
+							 <&apps_smmu 0x1045 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+
+						iommus = <&apps_smmu 0x1006 0x80>,
+							 <&apps_smmu 0x1046 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+
+						iommus = <&apps_smmu 0x1007 0x40>,
+							 <&apps_smmu 0x1067 0x0>,
+							 <&apps_smmu 0x1087 0x0>;
+						dma-coherent;
+					};
+				};
+
 				gpr {
 					compatible = "qcom,gpr";
 					qcom,glink-channels = "adsp_apps";
@@ -3841,6 +3900,105 @@ remoteproc_cdsp: remoteproc@32300000 {
 			qcom,smem-state-names = "stop";
 
 			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_CDSP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "cdsp";
+				qcom,remote-pid = <5>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x0c01 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x0c02 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x0c03 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x0c04 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x0c05 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x0c06 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x0c07 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu 0x0c08 0x0>;
+						dma-coherent;
+					};
+
+					/* note: secure cb9 in downstream */
+
+					compute-cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <12>;
+						iommus = <&apps_smmu 0x0c0c 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@13 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <13>;
+						iommus = <&apps_smmu 0x0c0d 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@14 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <14>;
+						iommus = <&apps_smmu 0x0c0e 0x0>;
+						dma-coherent;
+					};
+				};
+			};
 		};
 	};
 

---
base-commit: 03cfefef0119410fc464d0d56e83626cb570b7a8
change-id: 20260721-dts-qcom-eliza-add-fastrpc-c0868aeac9cf
prerequisite-change-id: 20260714-dts-qcom-eliza-add-cdsp-0288fd79c8c2:v2
prerequisite-patch-id: acb10214e50e8fbd14ca66cc162c4e56fb5edc72
prerequisite-patch-id: bdaa37cca19be7fd8d6967689b7599aa2d5a1892
prerequisite-patch-id: 6c9701599710278e20f3077f560f20e83ead9b1c
prerequisite-change-id: 20260701-dts-qcom-eliza-add-gpr-f7714d399e33:v2
prerequisite-patch-id: 84282f8a368672c3f0f8944c442c71713cfd7390

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

