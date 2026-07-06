Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BE0395ADE
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 21:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783374045; cv=none; b=uIEqPGDqxMd5hWVc7aYbD7F/cSyIMy19RgO+CmCi2hOuP3YZhA3zEmx91K1+LtaWeLrSUbump+cNZWoNlcXbx/sfrB7JDS+UHdXu/tGc6bJZQn/5sWC4+VG9aMoI4tNXmpk/fZOuHTirmEUuh3tzMzYkmuPst3Ot0Kt/w9crBQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783374045; c=relaxed/simple;
	bh=bs+iDFNnM8Jvg3DP8d38QXtbWpKTJaOmfgrbI8NBa80=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=meg+HiFHMZ9SPFcJQkA9VTKjQdyBEM9VsJREB8oNCi91GR0dEiJGLwPmQg55k+PHyveGGm2LWdSl1au+C/mtZEUUY3DggtV66pCZ9vmQeQWIYSYbt4SJkU9oNfFTEoPnkxXHrf5osFMVhmejhYSWSG22wF7LFLXZCdn5j4q1drI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HJ/ojeK+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jr4FIulD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HJ/ojeK+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jr4FIulD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KE8qT1626356
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 21:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Sl1a701shpBJWVBwhh6ZP9
	Kq23RhfGUWyGD/s/IZgbw=; b=HJ/ojeK+rNwO5/4jDzx12MhnRCZul1oJFph8di
	W8Yl3e0LfnHow40KFW26JFj3+W3qYKDV0ThdvEkqL9uRdIcNbMlTnSrTI418lKoT
	HcS+0WsOkarsXHksd1jH1K+4H58sfNwi9+PMddDszR+cbSV5IgeQyDJ+ntG6W7Iz
	zeZrGa5oMyDGOs2y7JVLfXrwhK2cozLNPX66JchWQXlZv4Majx43CqdEbnpXmcCK
	cbRQzCkqDVWxSd4aW+JHVFDzexafSnUjkxgEIqVfvwlrRRVwzJxNQB9o/DOW744U
	0UHJJCZw8g3nXyosAH+SDzix1hWlNzdUwB8TOcyBa8nOt9Jg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9bfu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 21:40:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so145655ad.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 14:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783374042; x=1783978842; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sl1a701shpBJWVBwhh6ZP9Kq23RhfGUWyGD/s/IZgbw=;
        b=jr4FIulDwdsQILHt8LRNW0giRkSew0oDzz+LHicEbi3VBPVo3UEvtdovw5xnOq76Gi
         rLZIcjS+iwAd8p5jpr/JJvHLekTm6RQvNxqHsreh0lPccZXVshz9PpeZsxb9uc55hJbj
         sSM7Bi7pX56RQorF0s/GDTFMaPhaQq+C5Rl2MZM5Xk1XWGQbkYvC5VXFsClzQBwOx7sq
         LYgtUiHHu9FopgmfTiyyDzKBzK/F+YkJ/Kc5Jvls4hSF4YvQKDAYGFCpcul630dk7iJq
         Hb54/zxln1Us4qYWGoqpvaCxMalvRv2h5sJm9alerrBfO+HdhxzkV08XXx0w/8EnjRgJ
         7hoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783374042; x=1783978842;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sl1a701shpBJWVBwhh6ZP9Kq23RhfGUWyGD/s/IZgbw=;
        b=fB8q5ZT1HMNNEVTUvgJfe8CnsQAEHHdZ2k8ZI92qjI9uM+fXSLenLOC/N5aazmTslp
         SOqUvLpTuO/Qc3S9ux3lshBrdNqKPObScF7J+nP2ux3CyLWaGU7UxPdGt73PEAXmXgK1
         fXkEkflpqiXjwp1ltwycUODk1ex3yac+D7o5N/8A2WCwIUjrEH8952k2dGUV6mcbIunW
         EcXXSaLYiOQcaujHrF+ubmvRoR0mdUd4CwiGFVW1nZGpGT3UQt1/hypxMuPvWw90YMwH
         6+TGRhiXsQzsNnGdOATswR8crnZ4hZgVy6bj0f6fP/QlrFPysUbar+XjFS78d+qISZwj
         Vq5A==
X-Forwarded-Encrypted: i=1; AHgh+RpWKRJHFvvngLlElB+ZsEhxwIlIS7KRdW84ln0MjBAGuzANl3t6rLuV+CxADWpQSAKIhr25d3klQV+5@vger.kernel.org
X-Gm-Message-State: AOJu0YypnqqFsx4psmHEoT61vJQFgbxo9yv+pvKEXkJDwS0v6CFApyvh
	KrklcqlwBliqmtjNm25pcY5pYkTmy+jaG0P0kXDMD1SszLj1XeYzhuTkZtnEkl9PVPjLfGRsvrA
	jBnATo4+by6/xk4NhnbrI/Z94PlXvCfTpIaoY367cHgsHRI53VzhIluuOYQXmH4u9
X-Gm-Gg: AfdE7ckLlng6/Pk+jz/hG+pk1zmutPw6+rb6u97TEGNoAfJqDKLRqR7wwwbzNAQ4dU8
	UsDGLRrbA4touTRttRy9/Etse/SBvsJJ2tbwL4JjYs+waJEWiH7IC6acm2vTL9PBIkhj4pi0iJw
	XBz7rREVMA0+dM8xUbnYaL3uElksg9TROxnRQCkrFVtak66Y1iLbNOh9HpAGPVEVtPb0rVCYlLW
	xyrYdzPEVpMavufYI7ckKYuxXEMzkBz6hLPUY1EJKUNGNAzfSbKCBZsxfPpZR29xQfDXuCrIxcs
	jjbT7L/vzCjAsZvGX97EtpzwK7q3Gva+ZA3ZmIyDC0wfyPyftTRBURl8VadqpX0Rk2TiwdpJwRX
	EG5ywsrPXHunfjJYOYeoYoqUvMHIWdleajyo=
X-Received: by 2002:a17:902:fda5:b0:2c9:994c:9a5 with SMTP id d9443c01a7336-2cccaf33717mr555835ad.30.1783374042033;
        Mon, 06 Jul 2026 14:40:42 -0700 (PDT)
X-Received: by 2002:a17:902:fda5:b0:2c9:994c:9a5 with SMTP id d9443c01a7336-2cccaf33717mr555215ad.30.1783374041497;
        Mon, 06 Jul 2026 14:40:41 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm901810c88.14.2026.07.06.14.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:40:41 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v3 0/7] arm64: dts: qcom: Devicetree support for Kaanapali
 GPU
Date: Tue, 07 Jul 2026 03:10:18 +0530
Message-Id: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMIgTGoC/23OQQ6CMBAF0KuQrh0zbSmoK+9hXNQyQqOAtoVoC
 He31IUJcdPkd/LfzMQ8OUueHbKJORqtt30Xg9xkzDS6qwlsFTMTKArMuYCb1p2G+jFAFWBf7HS
 JXOZGCBYrD0dX+0rc6fzNjp5DVMP3k120JzB929pwyDp6BUhyiZIthcb60Lt3OmfkqZHmar155
 IDAJXGDpRGo8Nh7v30O+r7g2/gkbxQ/o0S1MkQ0Cm2UrEgVkud/jHmeP/+t434kAQAA
X-Change-ID: 20260412-kaana-gpu-dt-968a70134c22
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783374032; l=2226;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=bs+iDFNnM8Jvg3DP8d38QXtbWpKTJaOmfgrbI8NBa80=;
 b=aOWgjsH3Quqy/Ba4njoZ6uizggyqsh282W4b6iHuOyw2JsdoW3L0lnBNH6TZEF9o3L50kD17o
 ubko8wpOpbwD/Y9jUT9CfcTBibDg0S/mj6CTh3/lk6huCzK9uduPgpM
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: AMcIsediw-BqCNZTsZ_i49XXcmCmXqvH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfXw2UveKNE2YkQ
 4uOHaJHNG3+4j4iMJJO2xbLDBTcedXeBG9iTHmQaB4eXFomtQLsP3NyjFF/QGDdFLtNQjaJgMWo
 s70tUCjg1DhqGV5Jqo/AIJ6YGc9uznU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfXxp6IaJPoGPRN
 0dM0ZmKUG1SbeWilZxhETYME5ayBHxY/5X16/piPqS44SBZELIVJosIM3eAzDLL/0jhHfNVHxsj
 nnQvGGUHPuPYYCs8Vp7EQkPpm3Efl0Nngy1hKRQ7SgIA3GAMDxLeq+7JaBHebkuubDPbiUJ3B9K
 WgOti+a/gng81LC5337cMOAgTNPPvLIg2rRbTwObd90RNTSr0ffEYGE+Rh7ka1VH5dDPLT0cD4W
 qVizzl8AUyXgGwe3KlHiuCx5Q+/0/3SCt1YytXUVABllor7rLMbbfrs+q/QF5dLdK4plWEyzUXt
 LtQtEHwlUXSywkrAaNqOkQEC4wsNP/pief2tnFB882uQFEl1y1XwkqalHblQk4NZ+NnujmJ03nB
 LbQG5nRUPNEUapeMQsUbOQVmXgQX2xIsTC+T1eRexlE42pyX/4s6qiDPW8OU0ugxBtkV7Zr7uAN
 vKQHK5TGGV3pR7tYxsw==
X-Proofpoint-GUID: AMcIsediw-BqCNZTsZ_i49XXcmCmXqvH
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4c20db cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RSuC8zd2ZDaJPqFJxW4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060218

This series adds the necessary Device Tree bits to enable GPU support
on the Kaanapali-based devices. The Adreno 840 GPU present in Kaanapali
chipsets is based on the new Adreno A8x family of GPUs. It features a
new slice architecture with 3 slices, raytracing support and other
improvements.

This series includes patches that updates DT schema, add GPU SMMU,
GPU/GMU support, GPU cooling, and enables the GPU on Kaanapali MTP and
QRD platforms.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v3:
- Reorder properties of adreno_smmu dt node (Konrad)
- Drop updates to the HFI interface as it breaks legacy GPUs (Sashiko)
- Capture trailers
- Link to v2: https://lore.kernel.org/r/20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com

Changes in v2:
- Fix formatting in DT patches (Dmitry/Konrad)
- Update cooling patch to lower the polling delay (Dmitry)
- Keep both passive and hot thermal trip points (Dmitry)
- Update GPU OPP table to match latest downstream version (Konrad)
- Add a new patch to allow HFI related structs to accomodate >16 GX levels
- Drop the smmu binding doc patch as it is already addressed in linux-next
- Link to v1: https://lore.kernel.org/r/20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com

---
Akhil P Oommen (4):
      dt-bindings: display/msm: gpu: Document Adreno 840
      arm64: dts: qcom: Add GPU support for Kaanapali
      arm64: dts: qcom: kaanapali-mtp: Enable GPU
      arm64: dts: qcom: kaanapali-qrd: Enable GPU

Gaurav Kohli (1):
      arm64: dts: qcom: kaanapali: Add GPU cooling

Jingyi Wang (1):
      arm64: dts: qcom: kaanapali: Add QFPROM node

Qingqing Zhou (1):
      arm64: dts: qcom: kaanapali: add the GPU SMMU node

 .../devicetree/bindings/display/msm/gpu.yaml       |   2 +
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |   8 +
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts         |   8 +
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            | 458 +++++++++++++++++++++
 4 files changed, 476 insertions(+)
---
base-commit: b96de4afaea292f70aec05d40def1d993c04d71c
change-id: 20260412-kaana-gpu-dt-968a70134c22

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

