Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642CA4219EB
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 18:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779821063; cv=none; b=Bar7QhYf9zuFboDQVpDvt4RaNynzR9nZU8LKyIzrJPIoBc+iOjKudKWrp4GESCOS32sqIi72ZoS6XvHELoFSrzanCcXWWyhZn4pIHtCsrSS7m2M4lpgPc5AX6HoRi349UhGbxrFkdi50UZeTBYeZrJgBV4SYvLu7TmduanhbF/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779821063; c=relaxed/simple;
	bh=cDOUl024n5VeIBFXLvzkD69n9tvvm5Q2LndfE/RBpbM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rH1fTVdvjD1ap8HIyGy1GGfoA+Gq9eI709xNDi5WJYDbwwKo89lepG4py7ArTTDprnNilksR2I1iKqZlQTCaRzS/tFToAw+qhSJ1foU/c2qU7ltb3JJlqK3rcrYTkyAaWTJAOQ0v3RvGD6elPMnRUkQWTUGe0yCiret4n/nypAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CE/Aph9O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TJI4r0Om; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CE/Aph9O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TJI4r0Om"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH11aS2022534
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 18:44:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/HUkG1zS7sY
	fX9vzya4QfQZieHxpfZOiesSJzF31FrQ=; b=CE/Aph9OWMp3t8t7pSld6vr4s//
	1Jx6lA5RuKCv0zHByk1HAaJdD4E1FXy9C48R3KbGrmtWEEZKIJyEuM10mGaAUVYT
	gVvtbRypggdGK8Mc/aMcTJiFRVA33pZEaP3PaQn+m0RXTicnTNu2N2S0U8POOkaM
	oVeFj90gTiYTp1thvFw5LSUuL20GEWatmFRfFb8CUILhzWCaena2C2620HF0DJ6j
	Kq9OU9iaL1fVPvmaOBZN5W2+aSA+DinhQDnyP8SW0p8d6bFFO9gJQKfz4cu1UXhe
	rOo4Exr+hBEdNu0Ow2AcnRdjfEJh/HhIiO/D4LZliCaZE5Fzk47F5sggtVQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edefugump-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 18:44:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36993baab3eso2745609a91.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 11:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779821061; x=1780425861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HUkG1zS7sYfX9vzya4QfQZieHxpfZOiesSJzF31FrQ=;
        b=TJI4r0Om+eB/H9P9EI9vK3AxIObSj7/MUsISdaHr17j89LIcU5vpeyIzNPd4KMPoGk
         s3965ZLLI5H/vUFkng5Qq8eANKS17bC3EwEykCwHvIaN6QLKjhy+jwknfXqslUimmyuZ
         eDGOe+8+PGQleQMt6YXPec0TE3f5oh8ualn5WSzUb/WBJd4WY8Jc5LqTq04UJ27A9/FA
         9Uwc3llN7A167UifWbrDZBix/Orq0bChkgVEpBlxooYbKQPXD8wo9J4QjaG23yIGk0/c
         LNeWlTaVvbjXl//45MvouLAyhdHLTxol0uwqqcCPvzAaiCG9c3NW3SyVmLrskgg/O7nU
         gviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779821061; x=1780425861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/HUkG1zS7sYfX9vzya4QfQZieHxpfZOiesSJzF31FrQ=;
        b=e/PQCMW7+qRKNcZm5lzWAUVRV2FOqvRTU1bm1aihx4DxNCzSXlvyZd4DxaWc+iQKsY
         /Ud90JY+oFXrjVKZTTdmwsyrrxOBfwS3xAHuPd32VUqstKEqk5IsZu3J/EdF9WG/gf0G
         /UJSKmaNBmiI0l+a65QoA4KX2JMNBpcbiC1fe/nmRXhhwTL0HIQHsv//z2K/8I3ek13E
         UyKMrj/C6BZCRFbptelcPwviAQ91RUzMQZNWnpWqdkPUCQUUOx5EFRKEEWxFXSBR/kvV
         eZ/H+c+mX23J42wuNhgBdAznnIln/UP3CeOE/arMnIEU+cjZQNQfhekqmEm6AwZW4eP7
         8zEg==
X-Forwarded-Encrypted: i=1; AFNElJ8Uz62gbhBkNYuZoKiH+naLICXwFhEhBVQB4HAMeke5vFR+QemFVriSohypy0NaJnWLjou6JMh3rLah@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2DGy+4rXMWw0auhm+6PcPFNzy4BZc7TT23E8BIfCB+4bA6U9f
	JHNSKJHuNcx9xDnxwccYG8x3mOm8kCWn8zWNebya8kCu5Y6MZiMxQ11lNFC5LIqKhWzHLJBblJ3
	mDuDf2cgkIP4lxn21Cn7gPPDMIzu9WhaqbvI7H6ebHyGOB9GB4VGfDaclvuHEz5w=
X-Gm-Gg: Acq92OECaF1OLDWjj0iFrLxm+S89J2I65N/b6XTOxsk6c0v/t1XePtSMed7Nj3vYATk
	wZuwfKp5Q5YbudDAk0mQASNqdxjVDPeJDFFJD+SFqiy8wv5Hm975iKGZIBGuNOek7/nomeaqTBG
	AZ4EngTu09djA7qrlmX3qU7ORqmHNK2iuEFubc9Hph2NrVeV/vTCmrardYHFljBOXLmbBhBhRNd
	++XWPtNalozOn3Lu1v1kSLnrsMepuH4wJ7NjG6tKgd8tzJvV8VpMB4m2WTeqIIaN4mGj9sJvf6t
	NSjAY2QMl8qpbdlTuX+CDRyHmiQiTsVXmgasACSFoaJQ4UqvNh1bEtMsGXgpUQ1mEFZW5h0Cnmg
	IWL6uWzMGWmcre8fcIiHblZtGssVE3MDWu0H4D+P/GuIY7GS4cEKziw==
X-Received: by 2002:a17:90b:3a08:b0:36a:5d43:2448 with SMTP id 98e67ed59e1d1-36a6741f979mr10705386a91.2.1779821061143;
        Tue, 26 May 2026 11:44:21 -0700 (PDT)
X-Received: by 2002:a17:90b:3a08:b0:36a:5d43:2448 with SMTP id 98e67ed59e1d1-36a6741f979mr10705369a91.2.1779821060706;
        Tue, 26 May 2026 11:44:20 -0700 (PDT)
Received: from hu-ppratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a721c7baasm16866628a91.9.2026.05.26.11.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 11:44:20 -0700 (PDT)
From: Pratham Pratap <pratham.pratap@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>
Subject: [PATCH v3 1/4] dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy for Shikra
Date: Wed, 27 May 2026 00:13:58 +0530
Message-Id: <20260526184401.3959717-2-pratham.pratap@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260526184401.3959717-1-pratham.pratap@oss.qualcomm.com>
References: <20260526184401.3959717-1-pratham.pratap@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE2NCBTYWx0ZWRfX6l1UdWYiCgrP
 qM2G8HgMffM22eD8uB2gmO1qGGg9qhEemhYmW3el/VyLxBZnYBklz0x1E0kBfiPnygunxXTek0U
 R9VXzdYOgLbIJ5Nsqr7iVUh6n5QS6VoQF1e/lFl6xN5teB7rYhZMQMFcXb5LbnuUDL9dNfybk1c
 8P1v4uVs1+cVLxdC+wboB83qGtkWQ5QRklD5LMY26JO/3kzIaEeQDoaKwrD50AnvHwtzoUNAHV/
 QH99W32UZijgZRqzfB9vA93YCqyEgx/6ZFnfL86G99lDR83uUdANrWYO1SHQYq6VaW78KLOKKuC
 y9+d+Be1LWNLTD6g64EscrEqhwCHam2MmOkmQu00bk1rj3p/jUeB+dylC3kReRD4GAMTSMsxRvS
 0RrWR7DCaSBMKhBY62K8MjLXk/UouD8btfzib53Yf8cIyyXHXvI1x1OeWF1kHrq1XgpOP2CzZFS
 yxK494g2Ym+c6V9sXVg==
X-Proofpoint-GUID: vu2aO3Adv9402lF7DhMI5WODKHB32JX9
X-Proofpoint-ORIG-GUID: vu2aO3Adv9402lF7DhMI5WODKHB32JX9
X-Authority-Analysis: v=2.4 cv=cPnQdFeN c=1 sm=1 tr=0 ts=6a15ea05 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=H4VnsNtwn-kQcSS3XXwA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260164

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Update dt-bindings to add Shikra to QUSB2 Phy list. Shikra SoC
has two High Speed QUSB2 Phys.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Pratham Pratap <pratham.pratap@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 39851ba9de43..ddbddeec6fb1 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,qcm2290-qusb2-phy
               - qcom,qcs615-qusb2-phy
               - qcom,sdm660-qusb2-phy
+              - qcom,shikra-qusb2-phy
               - qcom,sm4250-qusb2-phy
               - qcom,sm6115-qusb2-phy
       - items:
-- 
2.34.1

