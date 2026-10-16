Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DA047986C
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 11:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149443; cv=none; b=hzjhYdmL7Tf4okkLf+17PeqR+RE1QVC/dM5ZEy0hdzvy8dm9h9kUdEG/PLd+C3Vb51+an6PPp0fjeRr9tknRiTTyPjMYhLACodYeiSx6v/mokenGPZ36PUocGq806fInR3z02odCXfV8nu+x3Ip6GfnNYXE2xbFT7Lkh6ohZqS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149443; c=relaxed/simple;
	bh=IbCgg4z28hRd7eRsRoCXtFCpbgA5PnjLQUnM4sY+tPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PfE/hkhW2d7DhbKMIRA6QEzgTax0EQJ7Pb4QdAwxh5DOQHA14hX32F5JJJoqM8IYsI0vyghY5GtjYx3giMnGu9FB8/sU8p8Qazo3IHV31TJHYv5QCr0lXaRTmkUoSTTGyRwk8W9DeYBk6jd66jpyqBj3vbwc/GoNGiUcxqUCPjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cQ2a2Mhg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PA7mdBOu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQ2a2Mhg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PA7mdBOu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAvVIt1504139
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 11:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RwIutfYQVDI9/OP+nWxrrZ
	DrGPvBPRfBeRnPFtihytw=; b=cQ2a2MhgmdH5ncQZiSYFbErrb9kVIuIqmtVjkq
	QJnkrozzBvC9tffM2/IFxil4Bt4+22Zmk1qiKIOXXZlmI9qzqNBBtQX2325PEtiC
	b09gx4tskCjOLAuBqHNr6prW+K0kJIHjXdPFXQ5oqXMEo4+VS+uV5yk3m0P9PlOG
	StayPzY4vvZz2G/lq/WfANzPbYzWsawADe1QRD5TIZJnabnj5DeClrw3sQGazaGX
	+3YL2r/udzDChtmKBg+ElKhQtYXIk0M65OwEoaFOu6uAKU60iviyMS9NnscYPR90
	md3dQ4XkSlUP01RDxNibdfc1+O55Cwu7hjZNaZTYq/0OvYWA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbjmf82d0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 11:17:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2005ce21so59344285a.3
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 04:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792149435; x=1792754235; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RwIutfYQVDI9/OP+nWxrrZDrGPvBPRfBeRnPFtihytw=;
        b=PA7mdBOu4mXW/LxNs9F4XJI4K0WAoEx6scTtYfZyqq7r5yLUH7Km0y7+eu1322giSL
         C9RYe7fXL++kGXLLmzhRgg3My3b2F8z0qjI4wd+t7GGbEIAKa3KR90ed0rvk5fC2OeCg
         fOaoff4IzBGQuFUFCTkxKWBXFkf500+BMA8sdTEfokXmicadcsGJs+Lcg1c0ydj8ESqW
         g4xnawl+5XIzkeQ3DvE+GsW7FzVtFbgN2BOt+xC9MmjDvA49Xd7P44M+2QYVP6KRWCvg
         JeJ39tzeztiPUifa4fF/5O2sk+Uj8+azBzHZVGkGtc8PNg5tDg8vwmoDDAetFAjgv30g
         Wp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792149435; x=1792754235;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RwIutfYQVDI9/OP+nWxrrZDrGPvBPRfBeRnPFtihytw=;
        b=Ms+AavIwBGr9ibH+xPqM7V5RifPy7Xbvgyq0QeOoTodRFImNpjq6Hx4MGKoG+aZY0Q
         iDsjaDCNKgeWNTfJR/H+dIZlpLDDq4uziJuqid4R3nkbdLngHJJMMPjff10cSdcOKJCe
         KX8Pvlg+200e+ExYCDIZGqAF7ILDlhM46X9HzXQTTE+MyNHrwTKrAQ4evUJLKg2niw1D
         I3XoNEh9FC0cMOrqiOdcRIxVOLqBvEtdSyTTwgMDeK7aktS1ccOLGk0G7/P+nX4VPmnx
         PEmDJgkF9ZeYe5ZA9MDX+WATfyP0RTWEKbkjOJM1CB+9KZTQ+D51kfSNHvkMDZMtw5uJ
         GrcA==
X-Forwarded-Encrypted: i=1; AKwUvBwmx0EJA4DFLPwBKdvohRLb8cHvXi4yVXQE2i+im/Gg45LKodBxhDJK4xup0DlzQ0lRgpvc5r+xweic@vger.kernel.org
X-Gm-Message-State: AFq9FYLA2D8Ojm44ciXwoY/S7Ne03NsPaSHTX5tGZtV2LH5GhpLrOXaf
	RnmooWqX785KUx7vdNJELm+OqmiOAkxm1sdFTTINn3wxUVLJvDGMkpt6CrDY+RGdMkSgyRshwVU
	5JqsS3WkFDqRM2st5YamYMNmUeXLSbhK/1RTAnU6Rjo7iZjIpOlmuLIDenFlbq0xLO3x7e+V5
X-Gm-Gg: AYBFou3YTe6RJIoSqpmXpDf5FKdfO/6dqDoOmLFtarsou0K4oAizQw1w4u0sAkjm83+
	tW7FLiVrKaHunCVgk0vIQCpMh6o0+OilI9BOYvz3pp8/uguVwy4WN4epm6npnuodtg5yYRzqq3+
	HF68VBN0J/ockgdx1wPMvJMUTRZampt8QeckQN4KdsqZiVquwm79Ana1jhM18NodRLx8lwUlsPF
	tNgZj8auFdW4Q0dNonc6vndjqgSnb/1cQZMclY1a5kwOBZHm1a7DpkX4N1hNz21H4hnKqX+T21W
	3v5rdq+yLLihNYphxtflazawpDFcG/PMQLAw5XIFrEjvomQzZ4YyRwx3eM5jx/QSxsijX0CIcU3
	PByoCAD1Hsw==
X-Received: by 2002:a05:620a:46a9:b0:93c:17db:d91f with SMTP id af79cd13be357-93ebd227087mr3641258085a.39.1792149434921;
        Fri, 16 Oct 2026 04:17:14 -0700 (PDT)
X-Received: by 2002:a05:620a:46a9:b0:93c:17db:d91f with SMTP id af79cd13be357-93ebd227087mr3641252585a.39.1792149434287;
        Fri, 16 Oct 2026 04:17:14 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a9ea3bsm39854105e9.0.2026.10.16.04.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:17:13 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 14:17:10 +0300
Subject: [PATCH v3] arm64: dts: qcom: eliza: Add FastRPC support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-dts-qcom-eliza-add-fastrpc-v3-1-4e3fb632300b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALUH0moC/43OwQrCMAwG4FeRns1oq9bOk+8hHro21Yo613RDH
 Xt3OxW8iHgJ/OHnS3pGGAMSW016FrELFOpzDrPphNm9Oe8QgsuZSS4VX0oBLhE0tj4BHsPdgHE
 OvKEULxYs10obNLa0nmXgEtGH6xPfbF+Z2uqANo3iuxGxafPV9KntA6U63p4vdWLc/nW9EyDAV
 miUdhq5qNY1UdG05pj7pyIPNuqd/IilUD9FmcVygW7J595Lpb+IwzA8AI84FUJEAQAA
X-Change-ID: 20260721-dts-qcom-eliza-add-fastrpc-c0868aeac9cf
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5859;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=IbCgg4z28hRd7eRsRoCXtFCpbgA5PnjLQUnM4sY+tPU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq0ge3myR/XjGP9cEcd3OeeO1xMRhDzqaQ0WnQH
 u7XHNDiq+6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCatIHtwAKCRAbX0TJAJUV
 VhW7EACeloM9WUXfwOc4H5kWiCAUh/Mss1Z1wogHs/omX25HGIt5/rwFgmkfHtKn4+ee8r2LWCh
 UkJ0J7JiDW8UJjbWAeZdphA1UGXSKc7Y+HPpWHWySs2l0nX/18yXUV0syoWXp/cv6nQan88h4h9
 PrpwCqs17ur9e9wo02+pItpGjfHZXeECUTqxnAdiNpojLXD4Xz/ysGnRYRhg1slKT1UUGaQtGra
 H7abImSsjTxSPGpbwovc6HLLvUZ8WaWOA+/6x5nSDyg1yhjXh1igHzS9T+5c4qpVrHQA5uEnfE3
 9jCvK14x8H6Y41v4OLje6C3b4oRb9TFid/FcKZzhKy31sR3Q86N53cdNuai7LlvQhE1CT8FY2uZ
 Tai/jt1+AzklK0a2i1fTjhYLkiB02zTM+ubEZtKfVIYMpKcOIM3PyySxAaRO3BNULiMYKUj8ohD
 G4q3Fyi1gESZX9qO/omH8ToQTtBMdS4c8JBOTSQCPzJA2DWkm0QJsq3aGYF7XOVA3tBG8sRtf5E
 szjyrrD38uIDGBNa8/AWeXVejza0olGNdLmA9SGgiIddoOGO3yz0qQBYXMh0ZUPdWq5P/qpNisA
 ZDcqofMefg7D6TbY8TaRCMhtPW0J+PfyEM0WPUpfb10w/HVBrPGjFtRAH+KwyKvcGEXrxGW/Zfh
 0AVKi7uzQzHqbwg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: RMVAxuWpXNW9Yn_WE4BMZWvxkJWcKLRk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0NCBTYWx0ZWRfXwOub+3eot1ax
 SUxFT7rNBmrVK6adZK9xVj/bECADLqcXixflPq9gsfnfkGgCMLrW961DwCEKZeuEPrZR1JGdvXv
 A5A0cAVWY6FrNTMywlv57gyztNUJcUA=
X-Authority-Analysis: v=2.4 cv=SrAFe/O0 c=1 sm=1 tr=0 ts=6ad207bc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=iNmt55xwLDWB6Bi4V4cA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: RMVAxuWpXNW9Yn_WE4BMZWvxkJWcKLRk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0NCBTYWx0ZWRfX8TCAmaD4/cD2
 FOZ+Xh6m1KXCEXODm7Y4+hZMbagDvnF7Q0sJuP6uU3YhBQw2yXiD+lDrmbYoeA5I3a447u+kR6p
 MiejDuhwmpzEeTpX1GbpJlgIe2Kw60eNtBI98e0Hc7ivM/nA50IYFi//wsYyDVuE81HzjBGjj/T
 hEF1D8q3nl3sm1QQ2dxXs7/QKaecPeQgbER6WcKfpQ3OK9zC+QJcBjrpc5aCiWf535IiCKhy2cv
 VOmilfO/Q0Kj0ELLZUkuP+KqMdr3aPSVwrys06H3X1b+i2fl+EW0yIEsdk5syqd5X3cQyKk0Onh
 PXKoFY0ztY4nf1qTwCloPWfU/RTyxzLl0LoGXbwwXAnp3xKQ4/0OUKoAcpqWkVbd5KUWT/UyDaA
 Mtm8KAW0AurR8yei+MFC4e9Vqmp//xQEC3bWhwH/CviSpDys7GqqUMPpqIuQnpy5kBUSlp7P3kA
 3WJ28M0riOZDMAOj0ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160044

Describe the FastRPC nodes for both ADSP and CDSP remoteprocs, along with
the ADSP remote heap memory region needed by the Audio PD.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v3:
- Rebase onto next-20261015.
- Add the ADSP remote heap memory region (no-map) and VMIDs.
- Link to v2: https://patch.msgid.link/20260916-dts-qcom-eliza-add-fastrpc-v2-1-95ed704ff268@oss.qualcomm.com

Changes in v2:
- Rebase onto next-20260915.
- Drop the CDSP glink-edge description, as it was merged with the
  CDSP remoteproc support.
- Use the documented 0x1063-0x1066 secondary ADSP SID values.
- Drop the undocumented tertiary ADSP CB7 stream (0x1087).
- Link to v1: https://patch.msgid.link/20260721-dts-qcom-eliza-add-fastrpc-v1-1-cbea68d8e01b@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 160 ++++++++++++++++++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index a8042291bd07..2ad40cc3ce4f 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/clock/qcom,eliza-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,eliza-rpmh.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
@@ -615,6 +616,14 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
 			reg = <0x0 0xff800000 0x0 0x180000>;
 			no-map;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0xc00000>;
+			no-map;
+		};
 	};
 
 	smp2p-adsp {
@@ -2432,6 +2441,69 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 				label = "lpass";
 				qcom,remote-pid = <2>;
 
+				fastrpc {
+					compatible = "qcom,fastrpc";
+
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+
+					label = "adsp";
+
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
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
+							 <&apps_smmu 0x1063 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+
+						iommus = <&apps_smmu 0x1004 0x80>,
+							 <&apps_smmu 0x1064 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+
+						iommus = <&apps_smmu 0x1005 0x80>,
+							 <&apps_smmu 0x1065 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+
+						iommus = <&apps_smmu 0x1006 0x80>,
+							 <&apps_smmu 0x1066 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+
+						iommus = <&apps_smmu 0x1007 0x40>,
+							 <&apps_smmu 0x1067 0x0>;
+						dma-coherent;
+					};
+				};
+
 				gpr {
 					compatible = "qcom,gpr";
 					qcom,glink-channels = "adsp_apps";
@@ -4571,6 +4643,94 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 				label = "cdsp";
 				qcom,remote-pid = <5>;
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
 			};
 		};
 

---
base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
change-id: 20260721-dts-qcom-eliza-add-fastrpc-c0868aeac9cf

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

