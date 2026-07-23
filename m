Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F209370D7B
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 04:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784781855; cv=none; b=l6IUixGL2InaWV//xiyzKD1jOf0MvOLfyV5hQ39BA70XrRdXEcBrNguiJLxPwAze2yh/uwWDR2hFf1YwA0e2VwvYEuYsr+Gq7ZXjCyVHGTeIQpQirLIQtb0fH6PiSz+oHw/Bo99cSMwrMgmelT5yRYZbRsriAIe9b2Nj8m11nZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784781855; c=relaxed/simple;
	bh=nKuit4V7ADhVypZf/Tu6SgJ6+Y4O/BLiqsj3vnOr99E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CY6xTValEds43lkhI2uX9hxCmNssQQu9gkAauoMRxKY3M7drPMxzd7ba/pPqEmsKZq/wD3fyEujxejvdoBHAfU8i7IObz7orTS1PgjhwPGwrDwTa43f224en/Ver3tCKaq+jW9Zw/vugBCe3klikCsX10B2Nrl7vcbwkkpHMU5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FnLKHSWM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hc8Qtm8C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FnLKHSWM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hc8Qtm8C"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0X1Mi1927395
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 04:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fIm37QC9vX5p8SeR+t8ls7
	pgjxqXFcRxcGQJdyZIRs8=; b=FnLKHSWM4Mn0tX3rmP0lb2evrdaHDNj1SQ15HJ
	2tMHG2u+8GIsqvbaUqhSrHMeAoOEbchqPoSJ+/RfH0EHXtGo5ojrYqi7OnLvrZ9q
	z8m0Rpo4e8qYkFMfwXaZKLqR2CwhWEFUYfkOO+Nh5NrD9TviUUP5VLj2wPOSPstY
	pghZrJF9+JNuX05/kio6AiL3lqEWX+a8Qs6C5Z6cOU6Iv+RrPqi9g83FcdK/fo6+
	RPwnv7TP5FPgSz2m3zDqjY1xtM2JsIFMN/UKKgU4Szrg1ONwcJfwZbLJxmClGWli
	q7kApwAG3rMvSmbeavWRJBvaA1sjiVfk0uFMBinyVGXQE2Mg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjxmgkbvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 04:44:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e04598adeso253090b3a.2
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 21:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784781847; x=1785386647; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fIm37QC9vX5p8SeR+t8ls7pgjxqXFcRxcGQJdyZIRs8=;
        b=hc8Qtm8CbG5NEP904caQh2JEFyimCOZZNvmG5o3MyV50esgAwO5/UqHbAchV6Dh4mH
         ODqvQ73YC35w5zDle4aafC1FHUZd3T30fiiVnj8AETlEEuWTNAg6vD70Kzc3OdL3nzL4
         +YyzSrYmfOSJ9l6VfwL5pQRDNVVlAv0hDw6XA71c1Kfa+4UEZ6M3UW8Ws4EKsNeRbZwi
         zMD7FSwZri8u/U/RgYg2uQ8p88SM5aaQ4eH6pjEBAMjzelriPr+xgi1//tYp1ST6A9Jc
         pWNtwN/zuNH1Jv3ZH92a6TIHNiBTxg3IkG4pWcAdawspFUgraguw1mDwi0ztTBio7Psy
         +T5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784781847; x=1785386647;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fIm37QC9vX5p8SeR+t8ls7pgjxqXFcRxcGQJdyZIRs8=;
        b=GxD1NUK8H0dVJdWoOfS1PQNp+Xf8NetNO7+cr4lhCnwRMxAdIQ0Z2stx4DkLi1bHVs
         hgROjngboglDA/CzazwG1VTqGpCWNe7UVaBnuFLbCvzpvVBM5bwo6HkYl9Cs515qZEl+
         RGTSMxat6k0K2vbTQ3ouAG/LUKhnoI0dlnFh8N4VL4l8/zov4W6pWnA6N603tBY93FYb
         kP43ZItQ/RIJkoRbgDjkKCJ/L4Y2WOzOHo3cI0A1fT7fkaA1diQ7v+KXTfi/IVmTJ8jh
         XqnFSdMink0EU+uEORpO3DLTTHqTqr1gwHmj8x6Jclwr4KtJxHT0bYXvdgismZLt3RuF
         Fghw==
X-Forwarded-Encrypted: i=1; AHgh+Roo4ROB23xUrtKkQ0aMj6ZGu+un4NSBu9dfaEkg8L4nlDWr7HOOTfZq0TfaW59+BFCRVMpYV5lUW4E7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx46bRsV8dSDuPuEU1dm9vsRQ6MenTwUMUG5JZz+Z7SLfpSrgui
	KEYes0gKuvC4CB8MI7q4auagXqqQA6FsnMt98w9yn0ncg9elUy1Uo2TPE2uHNv3bIF+sM7wX/VJ
	Y2lHGqzF6VXR/vzOhQvAMCj+P6y+qbBJbztuQnlWpMST3t8Mqz3jAajd4Wzle45hY
X-Gm-Gg: AR+sD10ArSPxeaVX+Kdku6BauygyrHAqeSQ5GtGIEP6lK8M7j86NZCEXOs/Kp+hicOu
	Q5aPHFmPFC0WUDGTuo/UPpJdmeDpwLXsI+HTDPeT+bagpWAz8gpkqTTpXf4FctbZkU4vi0ZS2Cj
	FuGc9WfhYzzalROXsRRGrJLNNBqochS6gi4MZikZ5MarEYFgAkttiLWxq14knDZgYIJy6RrB2Zn
	1VrwllvRkihA/9c7ZZV9SiCw0zpUr5DUADnB3SC6182kW+9QBm7Istz5BmjbT5uK+CYsNQzh7oe
	qdc07yUQTSnbkDxuICIeUWVYLXI4fuoBuHYfsRgg4vQS6FZ4M1VZUGK8MFT1hzWVIOnmLFiSeHR
	dXHvX44oAaA6xWn4tWWWbOQm2Q4d+wj8=
X-Received: by 2002:a05:6a00:a01:b0:848:2f74:1d5b with SMTP id d2e1a72fcca58-84e2bbd287fmr1748822b3a.65.1784781847337;
        Wed, 22 Jul 2026 21:44:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:a01:b0:848:2f74:1d5b with SMTP id d2e1a72fcca58-84e2bbd287fmr1748780b3a.65.1784781846738;
        Wed, 22 Jul 2026 21:44:06 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175aad1asm2327922b3a.44.2026.07.22.21.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:44:06 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v6 0/6] Add CAMSS and IMX577 sensor support for Shikra EVK
Date: Thu, 23 Jul 2026 10:13:54 +0530
Message-Id: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAucYWoC/43OTW7DIBAF4KtYrEvEAINJVrlH1QW/NWoT1+C4r
 SLfvdhZpAun6makN+J9w5WUkFMo5NBcSQ5TKqk/16CeGuI6c34NNPmaCWdcMeSKli69ZUOdOZV
 Cl0b4pC6qqJRxqJQltfmRQ0xfq/r8css5DJeKj7clsaYE6vrTKY2HxobQKuExCglked+lMvb5e
 /3UBGvhz/sTUEaVRM+ddi2a9jiMaTdczPtyYlfHyk78TimmtyleKWdgL5SNwGF/7EvZoMQvCnC
 bEpXSoIXUEKX27AEl/0HJSllnEZiGVqB9QOGdakFsU1gpb1HYAOidjBvUPM8/JOfS3hkCAAA=
X-Change-ID: 20260526-shikra-camss-review-cf6f66ac566b
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784781838; l=4764;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=nKuit4V7ADhVypZf/Tu6SgJ6+Y4O/BLiqsj3vnOr99E=;
 b=OB4LtKignbjqHtdfWglJdcGkTZjNsSr2FjwwBDwKd8jPrU+MBtLDuE4SPAgBkoDkVadcELSkz
 j81RBW1SjE2AXXCYf+nlTSGmfTx5CL5p6PH6Gppjpo1Q+GaB55J6w4E
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=D+V37PRj c=1 sm=1 tr=0 ts=6a619c18 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SCY8RljC4g58VSpTV0sA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: QOxLMmcbf3IvbCsPZO_0d05W7kj7-osw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfXzeIQU1g1rg/H
 AIpo85baJeDyzzl+1uGHrhCxpC9oAjWdbLFjifYuhOKpFlRvf6NgbakNeczguZBbdC/XyAxrPI8
 CVHai++yhB1xFcCmv9SvrSQLYvywMqI=
X-Proofpoint-ORIG-GUID: QOxLMmcbf3IvbCsPZO_0d05W7kj7-osw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfX9MfwydJ3MVWQ
 s1EYwvOWNi+nMqBFN5cgP2/j6P7hv32aIB8OKG8LjE2MqWsw+2mlvFUJYO8HPraxcEgsrqQF67L
 h+ysmDIzCKVbym4AsZjOfL1Bh2hTHMcLN3yv+A1IiwQXg1oTsywdfGCNJASw2dpZwp9prh2JWKa
 ENQcgafNB8tOPJHHjKYJFPeLtgBL1T+5dsPRfE+wDblJMb5gH9dHtnXaOQipE8aMdaQ1TOHl0iV
 brRKHmnu80Xg8PUgbqnMvk5bbu0Srh0JkIVi5fvl028U1NTY5GX3h5wW4LlI6sQuUBSnHQBBtuf
 IbVfiCbAmWgJVGGNTZSZV6QfiK60cTMhGqOUpKyHPuTlUcUOOiS0YvSOVJqIPscUEWDnqrR2dAN
 fBBfHWBrGLyPRqrdeorUdEchwMeLWt/Nw4LJu0DfKqP0HCV3Sm79OPDrsgwkXJnzrQCWclIU5A9
 WBK9UphaoVN3RP2iVHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230045

Shikra EVK is based on the Qualcomm Shikra SoC.
It lacks a camera sensor in its default configuration.
This series adds CAMSS driver support, CCI definitions and enables
the 22-pin IMX577 sensor via CSIPHY1 through device tree overlays.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl --reset
- media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
- make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=media/qcom,qcm2290-camss.yaml dt_binding_check W=1
- make CHECK_DTBS=y W=1 qcom/qrb2210-rb1-vision-mezzanine.dtb
- make CHECK_DTBS=1 W=1 qcom/shikra-cqm-cqs-evk-imx577-camera.dtb
- make CHECK_DTBS=1 W=1 qcom/shikra-iqs-evk-imx577-camera.dtb
- make CHECK_DTBS=y W=1 dtbs

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
Changes in v6:
- Rebase on top of linux-next (20260721)
- Sort CAMSS by unit-address numerically - sashiko
- Collected Reviewed-by tag (Loic)
- Link to v5: https://lore.kernel.org/r/20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com

Changes in v5:
- Rebase on top of linux-next (20260710)
- Drop dependency on shikra-dt series; now in linux-next
- Drop dependency on shikra-gcc-rpmcc-clks series; now in linux-next
- TLMM pin entries roughly sorted by the pin index (Konrad)
- Link to v4: https://lore.kernel.org/r/20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com

Changes in v4:
- Fix data-lanes numbering to start from 1 in all endpoints (Vladimir)
  Missed in last rev.
- Link to v3: https://lore.kernel.org/r/20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com

Changes in v3:
- Drop dt-bindings: i2c: qcom-cci: Document Shikra compatible; already
  picked by Andi Shyti into her i2c tree (now in linux-next as e3a8f8329397)
- Preserve blank line after compatible const in qcom,qcm2290-camss.yaml (Krzysztof)
- Add blank line between iommus and power-domains in CAMSS node (Vladimir)
- Move cam1_reset_default pinctrl state from board .dts files into the
  mezzanine .dtso overlay files (Vladimir)
- Collect Reviewed-by tags
- Link to v2: https://lore.kernel.org/r/20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com

Changes in v2:
- Drop qcm2390_resources struct and CAMSS_2390 enum; use qcom,qcm2290-camss
  as fallback compatible string since Shikra CAMSS is register-compatible
  with QCM2290 (Loic, Bryan)
- Use oneOf in iommus to describe all valid SID combinations: VFE-only
  (Shikra) and VFE+CDM+OPE read+OPE write (QCM2290/Agatti); add
  per-entry descriptions naming each SID (Krzysztof, Bryan)
- Rename shikra-cqm-evk-imx577-camera overlay to
  shikra-cqm-cqs-evk-imx577-camera, shared by both CQM and CQS EVK
  boards which use the same PM4125 PMIC and camera supply rails (Bryan)
- Add reset-gpios pinctrl state for IMX577 sensor (gpio33, cam1-reset-default-state)
- Add comment in overlay DTS explaining absent regulators are powered
  by the daughter board (Bryan)
- Collect Reviewed-by tags
- Add reset-gpios pinctrl state for IMX577 sensor.
- Link to v1: https://lore.kernel.org/r/20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com

---
Nihal Kumar Gupta (6):
      dt-bindings: media: qcom: Add Shikra CAMSS compatible
      arm64: dts: qcom: shikra: Add CAMSS node
      arm64: dts: qcom: shikra: Add CCI definitions
      arm64: dts: qcom: shikra: Add pin configuration for mclks
      arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera: Add DT overlay
      arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add DT overlay

 .../bindings/media/qcom,qcm2290-camss.yaml         |  15 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   8 +
 .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso |  79 ++++++++
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     |  79 ++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 198 +++++++++++++++++++++
 5 files changed, 377 insertions(+), 2 deletions(-)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260526-shikra-camss-review-cf6f66ac566b

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

