Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D03E3B7741
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 08:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787733368; cv=none; b=pHHZttWyvz0jeGMenwUPPKY41h1fe/m8zr7XJtJq0LOnZG0gEusgvt06rMg7u3QNOuluHJ/eIaJBj1PnQie5vrRneFx4vocNdiNLpBtD2PayTuh8rZuA/HgqypDl1ti9lJ0mNyRBr2KTOENmtwR7xDSELsfrIjyvLgUPXJKbdjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787733368; c=relaxed/simple;
	bh=7g3Dvd7qk+tijKFffQKIIVlqQ47HbzV8Z5+cTp2uYQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tDHhthFhzUg3rSCGJE/sTpP1JvMO8/xRUul8h5kZkc/J6SfAOfE++bWnOG91NF88nPnBR9YDZLIAWNIJsFmuESu4gAEV/DAB/2K0qJAin5MBRPbpXXIkMl8aNZK9ZaK6WsWkaixIZ6f9IzVZFVQhvPN3xK5ivclrGgiwc+PLauU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pNb8KyoX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dudlBmPk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pNb8KyoX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dudlBmPk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6RucW451454
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 08:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZYyqcIYds8BcLkqY2VI1W0
	ZbXH39qOA7gUCVWcwc9Bo=; b=pNb8KyoX/dAqwF5enJkstetDdeVWiFWyvwzkF5
	bGyFiS0qntfRfNX0sJ4q/sceyYH7NzWg4K2SYIWucH6yUkIPetlC+9xTUpXNO+FK
	61UG+xyOLNTr0bzHWNlHhw4L8OMDw2VkYTWF7FzpSSy1rJuA9kS9uQWwhEnVmpgx
	V/zFZEObelm8pOsmgpl4Guu2kTasdaD+COUpcMPhKgzeHeqoDkkqBdVc13mPTxsD
	eeSgjH1eGJHoYm+gTkijs7N8w9o4C2hYWSq0Ya6dbFOlo3dFQ+YCO6bYN5hOoKC5
	gluVAFprgUc+6UN6NVcTPWPVcDIBu8exTEMYX9MiVpThFReQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r1gh6fq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 08:36:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ea75996387so14978776d6.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 01:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787733365; x=1788338165; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZYyqcIYds8BcLkqY2VI1W0ZbXH39qOA7gUCVWcwc9Bo=;
        b=dudlBmPk5PkOCQYTfQTot4xOpJG2e2dc0xITluAFIeVBYGGoGHczjj/pBebHfI5Dzx
         vAwRTOFMakOJ5rk9MfE6I5hiysDOrLRcwdy8DOkBVNiDLQbHG5NErcpZ79PPj/YHaPTx
         TO6vc41g4qg8/80YYUY30sTd3Hq3EewYmC1m4Io3hkAGf4iK138CRYDM/0M799ybR7qk
         pNyqBeqHASH9cWeKKC+aZp7eNwKVPzp57ZP+673Fho4X9QeHBDW8vNDWWsWdLemcp4jo
         xMdjcbwp+kozfkfixoUfTiv1MBOV+iUSyHEBYERYkV/ij2UvXMpdl/6+6DuvJajAtYHp
         ZsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787733365; x=1788338165;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZYyqcIYds8BcLkqY2VI1W0ZbXH39qOA7gUCVWcwc9Bo=;
        b=cXiApLwf00DYfFnlg4sANShOL0RGz5ygaeNPrWX2mVWiCQzIB/5IP0jZmRmgfk20C3
         BNewy4XrVatIDMF+tQyCaqX6d5ODbSnRY8zZQh2YJB1OVup1QMzDXScOauqaLuQPashx
         +0wTacy1KXq31kQhF7dKZoH1ZlQG6aiUQV60Lr2ZIpnaAKqSNa1Evz+WHcOwsgEaiwdU
         qHpOIz1/OStmfCzqf8CnYd/B5DVfvlxr5szlofEFkYC2qleHEfYd7jnjjacqlagK0MSf
         Fxx4OdKG4N85XBKrvznTxGmQMOmmQxSR5uxISbZ8rXpGoyoZnlLr6WvpgbOK9AjwLpC6
         AWdg==
X-Forwarded-Encrypted: i=1; AHgh+Roj2WAGmjEIZm9NNsQeVfvPpTV9GbujITbkDHkWboKeJqKmwsZCQHHbZHrCfdnm4kiEHSOcj8xCFEXz@vger.kernel.org
X-Gm-Message-State: AFuF++k4Hn8twgfA0q0ad8jtciV8rrI+t6o71R3b0Ag0y2BPb3hjDG+e
	iTJZq54tCX1+prvULBo8pV8vYxywqWXXZe6mcqtCedcA95Y3/o9PuHt2QUqoYUFZ/o/r0KZzulb
	VjP/wqK/1O0ITPD8DBvYNVku9/nMZRfozWf1cXtf1dAcrx0bVWsTsZ7NpiE14A39B
X-Gm-Gg: AR+sD10aHZ7SO3/1pPyTcHOmTl7XhSOlnqHD9+nZtm4TAnjpzNJNndcVf33sD1KgLYK
	6IhyVCbWDt5Uq2J9sQF+9kCvohci0sMb2gQajERP2QxxP8vA2D8ykGSM8xSOyg/zFHuVCadPRuM
	y2OUFxWqies/jKSYF3C2OUNNfkLPos99LPlEhv2PzdPSkjvxVTYhcOA0JHQ59WJ9nRvUlO+jBM1
	GFMFm/iGiO90EjyP+xCyySLknHX5nfN1cKvjVnFrp9FKHTC8xqCSiR5Y+G+GzqwqJFu2lJydyKr
	1pG50Qi7G/eCOhSo3/D/WVbSezM+dgYGztH4RxXsNj7TrQ9jWAPCfoW/KmAkJCwd3ooYwWH+eL/
	8Kdm4les=
X-Received: by 2002:a05:622a:17cb:b0:51c:404:af7a with SMTP id d75a77b69052e-52e423648edmr55543881cf.31.1787733365009;
        Wed, 26 Aug 2026 01:36:05 -0700 (PDT)
X-Received: by 2002:a05:622a:17cb:b0:51c:404:af7a with SMTP id d75a77b69052e-52e423648edmr55543411cf.31.1787733364479;
        Wed, 26 Aug 2026 01:36:04 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88af72sm447146666b.36.2026.08.26.01.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 01:36:03 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 11:35:56 +0300
Subject: [PATCH v2] arm64: dts: qcom: eliza: Connect USB3 PHY pipe clock to
 GCC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-dts-qcom-eliza-add-missing-usb-dp-phy-clk-to-gcc-v2-1-bf6746a849ba@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGuljmoC/6WOQQ6CMBREr0K69hMoEagr72FYlLbAV6DQD0Qk3
 N2CR3AzyUsm82ZjZBwaYrdgY84sSGh7D/wSMNXIvjaA2jPjEU+jnF9BTwSjsh2YFj8SpNbQIRH
 2NcxUgh5gaFZQ7QsmC7VSINKIy0zoMhEp87ODMxW+T+Wj+DHN5dOo6fAcjQZpsm49Py3x0ftDv
 8QQQxXpJItFlYlc3S1ROM6y9Std6IMV+75/AR6QMTkJAQAA
X-Change-ID: 20260825-dts-qcom-eliza-add-missing-usb-dp-phy-clk-to-gcc-9602a79db396
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2074;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=7g3Dvd7qk+tijKFffQKIIVlqQ47HbzV8Z5+cTp2uYQs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjqVtufc4pG4nCrR1pbTEwI6KJ4qFWy1K561Y7
 cfCkHvGqaqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCao6lbQAKCRAbX0TJAJUV
 VkrQD/9tPwAoum+IVkpRhkKRk1rz0y3Ssq5t6+vTT3GL7tZ/5zSmf2sI3Sn/zyQ8sF9cmr9e5CP
 ejM+4CQ9t+7qN4JUZALrPoS+i7sq+eCU4R+gy4sf8ns3y10AruFVEP6QVUf7YGHBwuQIs+wHLs5
 L+hC8Kk3wboHTlgNxT6WnvUV9Q9iqQ1M0bvvzp30oqFhDfRqu5O1P168kLPOe5z8BpgthCTmVkr
 ySawH1vSgIBtOJyqXJijnCxhAufx+19adffAond0D/PdTDWmD6X9O5pQj5Gp0qBqd6YD2dl6FWe
 U+rMDDkScFhvUwspJrOA9wHklO+J/rJZXOadDfug4gFcEzqR4lsTIuL+E0lRa68zdNnvKQ96wT6
 QsSGz0mXWpOrwEeep77EOVD+Z54KmTjnZIVku0691XEwPVFxwUhzR4M2Kjkb31ni8OOKy9EiXmr
 HXbtp0lqnAyIIFXxoOgiQwr7Vb876Tq0nVWyxdAVLZidj24HWt+GrAj3YBUpFkyEUNA4ti2aHob
 LPAa4C7xZBUKqOmtD8h0vNXdQ//mtA7uIILNnhA/L5BhCWCOJ25+Nddq7LM91alCIEeg+3H+lNt
 MH/9TKzAVo6jXKsDjyP00H4xyrwy7RczpgQi3efpn6zLKuKvEZ+Vw3JdHl2z5ng40kpJfpuE1NO
 hizqq158hcfuvfg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: 1aLV0h-yZjCHFe5g0JWBaeAf3MDjXQj8
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=6a8ea575 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=rd9FvqLlLlobQhMCTiEA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3MCBTYWx0ZWRfX0WOshnI1tG6H
 UP35mAHbn260MwMC3gZsKLKW3CxFo391B4OaXdDtary1Dk3m03/2x/pgRfWGdA1toS2hTilAflg
 nKF1OjwuaKqgC10alYQUxCivbkytUHM=
X-Proofpoint-ORIG-GUID: 1aLV0h-yZjCHFe5g0JWBaeAf3MDjXQj8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3MCBTYWx0ZWRfX06cpqtpvjsr7
 Ib4O8CNIbMMXhiw2hKCeYfufLsZ2oh2bazCX5UBEpAS3BoxF2MB1BP9lZ1mlGkzINrsIqas7duy
 eXDUgvgLZ9J5dYCZGKdHOrGfVGSHwj9Wyz5YMvs3HceuLMEUz/x7vSfKQruO+Q3cUZSpGw7rTtH
 HOGP4xxOF6brL85Z5HnL1QJ1ViF47Ty5oE05fftlg4FNRQTAwmlCVO/EHnmKPliGDfEIq1j2GLo
 XyqqTKj6Ga7wBMwGWYGl3i44aPLPpGxve/K/9LhkqusJeHZqHKO5A9pNOAhrdXoE4ULLjRULP9I
 7HrOOhX6vzVkoamxYmnCrnrJDjxNCOd7PkCVQB8peu0NVCjS8n7hTTHVRu1RfG9DQ+Wrm4fzDHo
 KaWaBIDvtjdVN1CfvZJWPyjcJmrpHAsDkEmXTsWYEWwwFFuSY4eB1ku46Bkfsa4QWNTNbMmtxRn
 WNBpTSmoPbir+R5CvBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260070

The GCC USB3 primary PHY pipe clock is sourced by the USB3 pipe output of
the USB/DP QMP PHY. The corresponding GCC clock input was left as an
empty clock specifier when the USB nodes were added.

Connect the QMP PHY USB3 output to GCC so the USB3 PHY pipe clock can
propagate to the USB controller.

Fixes: 88ddafb01ec0 ("arm64: dts: qcom: eliza: Describe the ADSP and USB related nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Fixed the usage of wrong index. Was using the phy index instead of
  clock one.
- Picked up Konrad's R-b tag.
- Link to v1: https://patch.msgid.link/20260825-dts-qcom-eliza-add-missing-usb-dp-phy-clk-to-gcc-v1-1-f0d3719f798c@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 66ea4aaafd73..45853c11a03c 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -655,7 +655,7 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 0>,
 				 <&ufs_mem_phy 1>,
 				 <&ufs_mem_phy 2>,
-				 <0>;
+				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 
 			power-domains = <&rpmhpd RPMHPD_CX>;
 

---
base-commit: 4b18edbd8e70f7e6860d56370f13244896d0f95c
change-id: 20260825-dts-qcom-eliza-add-missing-usb-dp-phy-clk-to-gcc-9602a79db396

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

