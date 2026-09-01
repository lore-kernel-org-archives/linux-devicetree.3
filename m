Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E88346DFF8
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 08:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250941; cv=none; b=saaE1k/FqYVl3mb/745oPgmDE81hhVA6mINDeCEjXTqdZRHkKLnFSRMl0NcZbTwhL9PBIzyD1ZuXKs6b7+4Ll0+HWZvhwEtRwvp+9554Stpo9+qrwhrTMoqhsJ3GLr0WiQ0tWbm005R5KduVNyBGyxzUcr0XJwP95pSarbh4/3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250941; c=relaxed/simple;
	bh=7W8dlflfJi7kPJgIimIv76RQuie08B7ma5y2MHYzck4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qI8Q98v9YbbIAWj3kXa//hv5oCez7r8hLYmDAOXdhlO0QS78cj07YyxWJ6tHNJNipWER9LOB734ZaElsy0q/uhtmEjro87xEPy9ETVkS4Vjb1R8vFVjF/A58deTpd+SOdBt0yvV1JbhNbW9ZpdH0zQY7GreLqu6aKEa0kNa8vzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QDG52/su; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E72ktijO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QDG52/su";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E72ktijO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179Qrs1811488
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 08:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XfjaGFuOKCHKjsex9Rw6ZY
	sXxZt9KMZNWFnFOl9Q/U4=; b=QDG52/suVAej9blk5y+w4kfUmv/hjGUWxsLkEG
	eeOXa4TWBuqDBoilSSNPo0s0oGO/XRVpbEcNIst03yntvHQDDs8GRCT9S3Y0iPEu
	s6KU+oFIaXz+JQdkAY+1Dh4kDzYZSfr/jeRkLGKv4HeNtyUdXq//dd+hF935uaAV
	vEGwsAT57rNXymaqp62T5ClapGi1MIJnTezOhf51cOl3odjnO8A9aNwbCVTtKV+W
	XDK4d1gwFvPWFUDRgs4NQRmz0gaH+UbAmhwBeYC9gnUuvnCj9TJEmf9iZN0fmpbR
	khIiZpDOhkechrYcOLNspcIY5q4w7cjZfFQY7OGEvigr4GGg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdd4dus3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 08:22:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930edb4362dso622745885a.3
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 01:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250938; x=1788855738; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XfjaGFuOKCHKjsex9Rw6ZYsXxZt9KMZNWFnFOl9Q/U4=;
        b=E72ktijOebxJyCERRfFWB5/syt6luI10wmUWERrYcZvyAE58XFPFOEfiaV79yVIlpW
         Vz2M/L1O/lWEnFQSnaWPEG/OAJ+FnMZZmrRlAytA62L6dq9PY/76p5h91sI1T+UZHh7P
         0A0Cwx1LHPK9PPaiMyaHEmDapCU3MjVY0i4APhhjxSC5FmkObsxl9zdyolvsyPXLyfup
         A3bxEExuyW64Or7FmE44ioK5Ts6txZlmZMSKXtjuWwBiAY4vTU7Gqk2ashfXN/8chhZl
         /yYCdQD4cKMoJ+BCDLQAvPqwZtqZ7Kgts2dPj0rgkTae6R+PHsuy0MORAyIFbS2W6bQ0
         KQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250938; x=1788855738;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XfjaGFuOKCHKjsex9Rw6ZYsXxZt9KMZNWFnFOl9Q/U4=;
        b=UTPCfjF4quq5ejlcnNwxrlb9vRIi7AgMynxoOfTh8Hbm/MV/WD3gubcKgPsLxnCW77
         zr45zvM11lRynIsfQnFaepn5mRKkIzAjPULmzgUGpLe45jd+vyYxX42SUmWvmxxP6+6q
         zPQluL3XCVM3zpiHc4dbIvhmagtd/0Gwy/E3MYYvwJh5CJjy84gSrIr6yzQLhiYN/7X/
         Awp5+TXBmj4A+KqVMrTiTwjlPkusXrVTiCgk2/8Nl+bMGmUPl4jOYWsOTb/2DLv3oQ1m
         0Mlu/An3Zuudo8WkQbiDGGw2vn/l67hoC+3Ube36Ou7bfHgHmB9N4eGcVzReefCws1SV
         AoAg==
X-Forwarded-Encrypted: i=1; AHgh+RpJ+4CkW7rvqPVOd89rnt+YBcnEFbK4u4sPExhSuidziCsaaHx1RYGMAoMk8JtsVGKeAc5oh3FWs2BT@vger.kernel.org
X-Gm-Message-State: AFuF++kd5JDnzUoz6ZzxmZ9L69fPlVCEdB6OAjV7uUbTgxq0K0LGDUbs
	Cd8NVf0DWQhN46aQnMDcJU8NPMzZe56pTPobbEjx0Ij1PcyhryM5Zu0fiB4yRb7H9HFg06iSFxG
	rUt0gNcAOAD+S+bPh5Yq/D5KxcMJa7O4xRmY1Z6YGp9gRCrnbb2GFJUE8BXytCBoA
X-Gm-Gg: AR+sD10cMRt3gLU6kl30quUosZvqGZSvkSmopwVSsm+ZDXf49J/T+qvn260Zz1hCp/V
	3w260yrdV9rbyCkjY/mGBWFdJzPNXkN5ZA2XfY/tC+hH+qLqDR4CsfwwRgJ16UYMqkZ/BKQFnWq
	95zGRQHfk1V1qdVVQxTOxp9KEXqHJbtaSK4Fmvp+v+z0uwciO4OfZrrsCeHrN0OxNN051D1rThU
	ba+u7PFPvQlqMi28X+bwNiuRw3NAPEvxjWy/ZejhWLpdZ3Izu1X6xxstMJQeHiYzzHkgOZbzSOH
	2XXGXUfHw9SKaOGGY7JSgIZOoi6qcJiaRvrSTy9Cnsak9xx8NdzBbflehsSGnkI5sGZxjFihYRf
	SPW6/bXq8
X-Received: by 2002:a05:620a:1293:b0:936:a5c3:512f with SMTP id af79cd13be357-939138df43fmr2927324685a.34.1788250938297;
        Tue, 01 Sep 2026 01:22:18 -0700 (PDT)
X-Received: by 2002:a05:620a:1293:b0:936:a5c3:512f with SMTP id af79cd13be357-939138df43fmr2927304685a.34.1788250933137;
        Tue, 01 Sep 2026 01:22:13 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3b86dsm3273791f8f.11.2026.09.01.01.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:22:11 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:22:08 +0300
Subject: [PATCH] arm64: dts: qcom: eliza-cqs-som: Enable Adreno A722 GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-eliza-evk-enable-gpu-v1-1-a7c3fb27b4e9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAC+LlmoC/yXMQQ6CMBAF0KuQWTtJWyKJXsW4KOULo1iwA8RIu
 LtVlm/zVlIkgdK5WClhEZUhZthDQaHzsQVLk03OuMqcjOVmUn6F4cno5eMZy4MRfd2D23Hm6li
 6YEsb4C3lY0y4yfv/X667da7vCNMvpW37AorSEtuBAAAA
X-Change-ID: 20260901-dts-qcom-eliza-evk-enable-gpu-6532c131cea1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=989;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=7W8dlflfJi7kPJgIimIv76RQuie08B7ma5y2MHYzck4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqlosxYTLk4ej0pM1JeEv58+Oh6DoIUvt0gfQuM
 +bDrV6sfpSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaLMQAKCRAbX0TJAJUV
 VsjiEACGJf1Vvf7AKSuVXVZChgo58N97+FU1VkOOzO6dp756tauzrxzHEwRTv8+E1E+g2FCXfqW
 Ai0V8KzF2rjsG7YVxSSHRS2nhP1dpDlYUVN5UrLfkYgW1rv8SB+QOibQ9oxpnZsLKIyBO12+ByD
 x1nQBmCqajOdHXSgpCL9m1jhzwNDJGUNOJqvq+P9qVi7XSXKCTBuvy1LBDH1/PqXlNkEJs/aCjE
 TV/nq02ZpaKD+gwcrw3Hv9O4a1XlKUpjn2vw9sJlc6pkyKOqWoEa1H9uSC54JuEtX5pL8YHIk50
 QHcJLGeSzTwqacdKsmoy6/+k2W1gVVhS72h5awk7H4Iql5IY9yQ/o1SzMUZCq934cLCSm1TIefA
 ggXmRXwa+DRS7CNYRSfk+OL3xQrf+6KiOJOy/+l8KJMnJwAAb4W996vwd5cjpA02Q3j33pLoUi6
 vt049BuQ9OiwOI8FfVUIIJWIlvzJKHzOpyQIcNix/zJwKgXuDF+aZHs4dquMkIhjDiaO0JMe8zO
 aw/xACbrIkxnltr5EE8FwWXu1qJDLSGtsCSCC9qrhqod/ZX0/m68/zf1tyuFbzeblE4NvA056UO
 LhFgwP9mU7isa0qpGE/Kom7z4+TmEKDo2wHv3Mx6baPnTI5Bi8WoSkUduzgLVdAs3caLHuFYVz3
 cYCrroA93imGTjA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=b9qCJNGx c=1 sm=1 tr=0 ts=6a968b3b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=MAnxEFDIZuXvlbMpwQgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MyBTYWx0ZWRfX0vR0uJG1hgGp
 rPA0HcSCdUd4YzCfKW31+SEifukZLmvyFnJ0mhgAeik8ltEDLefpqpa/9Nz1++DFjCIB/YkeE5E
 jWxcY2JlYhRGVOI79HmsYtESRcQ1lnnsyc2Q/X78jaj60SVOBoApIOnCENw16Lzx3cmcW+TLZgA
 R67bHYvXT+q8CSKluu7JaNQrkDTTg50eBQf0PeFVdzwuzMdNGFodWyWSedYtqqxlV8MniPDuRDk
 ZVrqgJiEaI1EAix0h2teu2uQLRikRfOTl+rwBDmOPecj8PHxI4T4H4Cic62P0HB0Funon/uA8WI
 2Ai9z8LbrzloUcBphl6X0lg7/kLGlkKUFoZOovMDQhHqLv9MK7iP039SOq96l+E23kTQchm+XVT
 96heV57XIyzu2tVs/kRcm3EonFYyX51rUHcVzr9ni/NHGPAhAUueW6hot+MER9aQPip5+UJ0PBD
 k65qhiiKa7cx4hZanNw==
X-Proofpoint-GUID: O5RLCg7hkKYNIqILkT1yoofMz2fKp20A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MyBTYWx0ZWRfX4MAFLuGnZikO
 e+lO6O1bmohiJ+z02V1852c/3+FWM2lanpdxE6fNosuis2vU5ScExd7hopr+5Tv9bsPFRgHBq9Q
 Hes/IbgQk61y0LTUjIIlYnD3XZi/Z2o=
X-Proofpoint-ORIG-GUID: O5RLCg7hkKYNIqILkT1yoofMz2fKp20A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010073

Enable the Adreno A722 GPU on the Eliza CQS SoM board and provide the zap
shader firmware path.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
index 5ef6c51618bf..27831ea56d08 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -374,6 +374,14 @@ &pm7550ba_eusb2_repeater {
 	vdd3-supply = <&vreg_l17b>;
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/eliza/gen70e00_zap.mbn";
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/eliza/adsp.mbn",
 			"qcom/eliza/adsp_dtb.mbn";

---
base-commit: 1c8fe8863780705aba77893fade65f728e82b67a
change-id: 20260901-dts-qcom-eliza-evk-enable-gpu-6532c131cea1

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

