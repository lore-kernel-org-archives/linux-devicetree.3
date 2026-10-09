Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086653DB33D
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 10:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791542188; cv=none; b=sid+QWd1KJm6ihILsNibFh/oOKKDazxwU5nYl4uC+ovSbXNc386ReLiu8junA3hEQLypRjGJl8VGM0+NKMh7f33VaHoQ328py4EVAc8CUcOKLTyTUft85ACNYUNPfwz0TEoPEQCNIAXiR/ibMZeNjdzEl3DPKh+p8VFyV96S0oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791542188; c=relaxed/simple;
	bh=Yxi5c5piVGL5nj66cVK7xhnjJD3w3vB2CZvWuYrAivU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XIclGuTPHHV4VrROfbU6+agaaH+th0tbQUfYymkwNtRFyrbxl3TJC44dvtK37SjKab0aS1R3ibNc5qd2s/lBjUgVKGY0Ye+sSo/X5kookTF+YEOuxN5p5owLcFB7EK9C/m3ZbBU1U1SOcN4y5mmG66H0VuncLpLR8dsQv1E7eb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dlWos0kS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bUfG7PYa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dlWos0kS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bUfG7PYa"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KKX82369587
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 10:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JcqK3nQJsAx1QPTt7FvQEHKJzg6BbWDfOeS2ApKWAz0=; b=dlWos0kS/vAqciuz
	1fk2cKsi4pukeSW3VkhkJpz572AO7zgMljQN3TUplhtNiYdqJLyq6uHrisEv17rK
	wfV0qJ0nQG9wbSUutLnpYAz18M+k4H2plwUf50l4hA1S95MBhK51krwquahp4lyh
	NS4spaJcZJ9t3XyU0ZhpOXCA2d6RDLhc6j3wTLapQ6/9TPXK9dmHQLK093YtLJ45
	8zxeyd8sjcWZeXpJGYqS3fiRrWaOVh65R0uVXbMfYTdacZ9ugd37UJdX++jBTe2K
	3s8ZGJ9LOgjQi6O/p4eeeBX9fAneyos2fQs906qhrBLccKzG683eZGZiVAJlY+zY
	UauSQQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxwb5f6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 10:36:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so9023503a91.2
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 03:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791542186; x=1792146986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JcqK3nQJsAx1QPTt7FvQEHKJzg6BbWDfOeS2ApKWAz0=;
        b=bUfG7PYa8NiIdahf1y4nv3z+5xSi5A1Yfi+p6aO0gcuduXVuyyRk5TmYIuCvdFCrnp
         cf3y/2dcVwvbKEDRlHTFrxi/z6LF8NdshZEHZ387WiW4H5yqH0VJVXh90bWC78tKAZmk
         k8B21/6vczLRDJopLhWZgEY9ZfuxjYy82XwpsRszdzPh0dXdtXly4PjbQqhivSZdgkSs
         IO8vy67QzhY4cIQbBcAINVF1r9OrYjsUnQO2cNy2zbZqEEYbhtBJKHSZafhLpWU4YodG
         9QSQfDlzP329qqH/a0SM7avsx2AgUXvmOJe30X0+H7Y1k0+QCplHU3+3piz79EdyNoMY
         d2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791542186; x=1792146986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JcqK3nQJsAx1QPTt7FvQEHKJzg6BbWDfOeS2ApKWAz0=;
        b=mZY7pNR4R6uYlVPBdJrjp/UFX+Rohkn02bQQMOElGFqxnk3+WET2vwC8lFWTAYO/Si
         E24kZUMhJ0C87ILkiLnxY3s86G25PqmQeoX50clwWA1vSeFnOyK4+zaYOlcah2KJRrpg
         5LmVRxrYTfZufhlkYdga0X4iaOiPImsNCkK+5ZdMnmTKgByn8SHF06nsZy+UyuLXlOf0
         SBN/Nz95nuzP9+xSmNePqipKfjBHfiz8CD186v8+rUCjUMn8ffW9Rij7ysFoORQ7K/rR
         a/EwjAr1wWwhmdjVpAZPv54/GxZ5HJOT3Eh81nRcqlKkmfLO86oyIZEpw0Acnwp13dGF
         3Xmw==
X-Forwarded-Encrypted: i=1; AKwUvBwXQZ69+8ywERIrGEDqR2xyqyipiLUjmjF6pjMDTFVXuCPDr3IvPuTZScT4NwHdOr20faDw5PdaBtjy@vger.kernel.org
X-Gm-Message-State: AFq9FYJPpVylUl3dwHhwRXWfBDQ+NRhaHcK/KopQPvyuUQBXCHirmHG8
	oiSwTrXgwwk6p33hAJCAVJu3EBgtj+r2QyVjYy4PubAZg7MIqgbl4OXW35JwwjnZtJY8MQQ0uNC
	qDrn7dVzisVUWWhaxcE8I6u+IIv/Cs+6LrulbiBJRwCrOq91Qq0vx2OMgMYRWJoGQGYTM7db3xS
	A=
X-Gm-Gg: AYBFou2g0ehO1T0au3xLnEn4eJw+XV0KCH93pthStCB16pHINoiegGed3i3JsWwOdrh
	nMQcP/3OThp47IunT9R9npmFOTG8WKuy2bcoVkU9akdmVmiKDCs7FdSVPDVee8ZLR+EmUKDwygP
	GkQHEzIR6ESosAyNrccqMK8GeWn/XS6HE9LpADM/tszkcm7dv3noctsawEkRO8AdywROi7fgnx2
	tR3L61BdIPB54HvqTBksztKZha+nRZQWeZ46wVNljCATN+kn0WwOnXf9k1cRyjJCjypf+Jzxhva
	ZK5ZpiEZU5Ro+krPCObscVBRkJbzlhhiwYM5f7YTNsGx8I6eSe8qYB59lAP0a+J6Cx3bXQ6jgGl
	5Lay07ZmJwRm79JOLYheFUPNN
X-Received: by 2002:a17:90b:48d2:b0:3ab:413:49b1 with SMTP id 98e67ed59e1d1-3ab3a916118mr1239651a91.48.1791542185536;
        Fri, 09 Oct 2026 03:36:25 -0700 (PDT)
X-Received: by 2002:a17:90b:48d2:b0:3ab:413:49b1 with SMTP id 98e67ed59e1d1-3ab3a916118mr1239615a91.48.1791542185037;
        Fri, 09 Oct 2026 03:36:25 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab371c32cesm2827285a91.16.2026.10.09.03.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:36:24 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 16:05:53 +0530
Subject: [PATCH v4 1/5] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy:
 Document Glymur QMP UFS PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-glymur_ufs_qcb_enablement-v4-1-9a6ce83195b7@oss.qualcomm.com>
References: <20261009-glymur_ufs_qcb_enablement-v4-0-9a6ce83195b7@oss.qualcomm.com>
In-Reply-To: <20261009-glymur_ufs_qcb_enablement-v4-0-9a6ce83195b7@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791542167; l=1502;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=Yxi5c5piVGL5nj66cVK7xhnjJD3w3vB2CZvWuYrAivU=;
 b=j0jhMmEtJA+YqLldyS+bwxsUDp4NFZ743dNBsYchfU2n68dvRL+nxxDGysPoGUMV5R81MeaAB
 0+dBam3vK1vCLLNQesMKmuRJw1vgkgyq5SSJ77rx2lq1qfF5+wXGSWV
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0MiBTYWx0ZWRfX/Z52ODB1ni6+
 Rfi1OCBTKe6IYfO28Ijy+0jXTCPemgSqkZW3YVJb5n3+QGYY5Zogg6ZTOlH0cu9UP1Ehu9Jx5Hn
 jxGoKn7vQIoS59m5uJ75l67XL0YZNjPLujjsmM4FpWe4csIq9FmAJvTkBPe6JNOasrxi52/P63D
 TOVW1Q0gRgMJ2F5dLgmAbMBM1nhE37kKE1sH3eWgmdIwefP3iUBZnjQu0rQUGioWS7+z1mp3qhr
 +iACJm4Q1Pz1MZQT/NQ8wxd7lcO9C/93IgcC/LiCASWWl8WfOY4M10CdRNYgeozRvLiDaJ/sjC9
 a7a0+ZYTCPkmG+q9e3BICzBPOKRdQyyy9BwQpFwIKHj1g+T9ignCTnnuM/wzvO3bLwXqx1haOFZ
 Bdg96VEwUvtYeXY24lInGOLGS9s4F0g3kRf99r1S/+iu1XficetOiho7jZq6nuzuEtttnS2morj
 UeXpgOy7Qaw5ZK3goRQ==
X-Proofpoint-GUID: cduc_RN9dpwHThmKkNWK5EgWWSwep0l-
X-Authority-Analysis: v=2.4 cv=cMB1IVeN c=1 sm=1 tr=0 ts=6ac8c3aa cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=M7MUb3q_Ox69Zn6kGXoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0MiBTYWx0ZWRfX+OxIQZDKnVc8
 VebaAP9RPBkNdwntzNKZ8i+soGH2gA27Biig5kal1qWZr+f9edUxCQ3g3kvnPN0UeJerZOWK7zp
 UXD3EgS7iL1f0Jq2hZ2/frXgucEDhAY=
X-Proofpoint-ORIG-GUID: cduc_RN9dpwHThmKkNWK5EgWWSwep0l-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090042

Document the QMP UFS PHY on Glymur SoC. Glymur does not have UFS PHY
gdsc power domain. So, document this in the binding.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index eb289c09906a..10435a0b5230 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -42,6 +42,7 @@ properties:
               - qcom,kaanapali-qmp-ufs-phy
           - const: qcom,sm8750-qmp-ufs-phy
       - enum:
+          - qcom,glymur-qmp-ufs-phy
           - qcom,hawi-qmp-ufs-phy
           - qcom,milos-qmp-ufs-phy
           - qcom,msm8996-qmp-ufs-phy
@@ -113,6 +114,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-qmp-ufs-phy
               - qcom,hawi-qmp-ufs-phy
               - qcom,milos-qmp-ufs-phy
               - qcom,msm8998-qmp-ufs-phy
@@ -166,6 +168,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-qmp-ufs-phy
               - qcom,msm8996-qmp-ufs-phy
               - qcom,msm8998-qmp-ufs-phy
     then:

-- 
2.34.1

