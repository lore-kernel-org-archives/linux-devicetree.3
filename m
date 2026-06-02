Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557A53D092E
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 09:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780392989; cv=none; b=sKcxK6iVrGrAle3rT5s/xYYD7ZJBZ357rJdFXFK8ED+jHE59rF+lsdU0B+ilSRzIqvVLYTIzW6JdJSUREeO9f99qKeSc3tRRdqeysdDSpe6O3v1APb4xB17My3u6ih4ZqIzjTcfJrxtAAYlHFKehebtd192mF/fvGIp/d9hXx50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780392989; c=relaxed/simple;
	bh=nz6hPl3LT8ptNw/NZmZMzPEW8KpUvz7yNcIiWSAfvQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=a6KxvMudLSd1CwMIX8HC9w+NqRRcRw4xLZKnRxgf9LOH0wUPK5VsPQNUsMzFhSoxiSD7hDixDSQpjbBMhkJGfr8aU/YbcC4JoqqmipPkdaUuRumOnvRSG3Q2CO0m8rUPF1TeM3QVQRPHmHe95Z1MoJBKL1mpQ8PyXtkFSBvjT4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G2/Juq1l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NX1moGKN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G2/Juq1l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NX1moGKN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6526Mr0x2767867
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 09:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=r7oSzQIF/40QBt9Cym+JUS
	BWjLP9Fom/phGPGm1A1tk=; b=G2/Juq1leseNr55Kb5hlln92rWxZ+QqaCEJfK1
	EPNMe4s4lxRhky2aTLMo308qeMJH/XKEJxCC8jtULFZH8YCtPbFV2rPKVnhqqlB/
	tJO+mzKuKKVJD2qKtw6xZyNbnfjOaPzTv+6oE16zqiSYcF7c2HXbjJmGPWzQWlof
	BUZo3K68xHAv3gbFAz8fJLpNsdRI9xlXvA614e+sbVpHtkOg8Tc0aIeO8KUwalR2
	CJjwD8I+1/JWG8UpaxTJzOZklwH/ySleeLx0lGa3Y3k38eIbOhHr4JRZ08uzUAy8
	54PkT6gnjGfMKwWlUE9TB/x7xbrk/S1dqWzLNv+1l+c+FKbA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsus0sve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 09:36:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c32faa62so43625145ad.2
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 02:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780392986; x=1780997786; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r7oSzQIF/40QBt9Cym+JUSBWjLP9Fom/phGPGm1A1tk=;
        b=NX1moGKNShCFTNvzTocsXlceRQFuNesnfGFBioCi7j9Xlw8a7rIYhYRt3h2GSoZAxm
         8SsywofhkzqQ3ProFGt6jk3Vy/74xgHLXwAvjWkEDEFqGtpkqOk0+NGxdlPvJ1bJClEu
         tdfX5ZN0fwGf6zbFTWiJKzcveX37mgTeM1aMFtMVJlNSnbWFhnRkAaxzyK191AkzLYvb
         r3CZTG45bjgDpPVGyAmOH2vSN51kIWfIKSgvxSa95sc/QPfzRbaIiwOFf1cxjnDLcrwh
         jDcNLs9w+NH+Zz6i6ckvHxW8oQ2KQbYUjWmQqr082EARmvPLL5zYc/h9NbNmWuuKsSVd
         yIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780392986; x=1780997786;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7oSzQIF/40QBt9Cym+JUSBWjLP9Fom/phGPGm1A1tk=;
        b=HZ5RtHA1XznMjxUTNopMScYBQtMqb5rKRVn3vmRjYlBJtzC6/dFDt8SxAbXrLyovnj
         5m6fM8IVYKZbzTirhJeQKVDwBaqepMfbKOrn3w+NmjQU7FTN84qkqsIIHhk5VzoulzaQ
         kXZy4ZqJmcf5G5kTHwdLWjhCmLM0BZEbqwsVpZKPgEiRjmshij4axsdTvmWxb7WmW0Pk
         S9meP9YCwfZj8bvW6xvpfe9vhY83PolVEQUy141QXSF5a6VxtRQSkmgWspb14dc01i6y
         94nt6QKBxe8zKbtQ1BarMrKsjPcAJ9nJCX8PZT+pHjljyKsvUz70nByrLSU9YwP/peDp
         RN7w==
X-Forwarded-Encrypted: i=1; AFNElJ+T7JAPahZVFHi8bk6cMFWWkmVsDN1UAXY/1HvEM1JW2tdO1gr2bEmofouCKddJB2W0BbI/UPO3t7NN@vger.kernel.org
X-Gm-Message-State: AOJu0YzvOeewa6YyQOoPV42GSUEPk6yWXnhGWfCnQswHlZCFLJJSnv2/
	c4SD3OrqwJQGvgAaP3E9E4pdWeEnJCQQ1MVB/QtGWYn+ERQHlLygtvtRHfOwiuYMRWlxRgV5Qxn
	HhlWEuoDu4eaNMOuhTPfrFo7yBWMIpIsJfpp05gHrfFYO2CI/WSPQz26sdlqL9lxkfIt/BGsw
X-Gm-Gg: Acq92OEz+2Zbdv2a2e92Hgnv82d/jA6gzcpEz8kYvV8sLJdKsapPwoC1jjYrZfn9nN5
	vKC3HyIY3wCAOtXpjmBNZ5D4+mMiPHnBe/FhRnIMjTGUeLJt+3O6jjnyEpwz1dUsjqScaWbqiW6
	7oKBPF7GJ3dzFAhfpXmjFmChs0qQtplbvJU9BHR+sTqObIqZImZE5CNU6kPXtVlMAvnGwcA+fZv
	JeDOmVY9hn8mcHv5PT4+auc6Gspe57a/T2di+OC4pr6ACqlnRpp71iVNIV/XVXUcGWlcsywl5hL
	iCwwr7oTMKsV15Dxn5+O1HNOs1a+hYxQ16C8VeiZfJklrUifw0+vGOiMys+3EFWEZIf0HcdHqGv
	mJlVoULcmAaCmekqACbIFKW6Dv1/PpeMlEz36jbQG3z9QFh3Ih2UIKH6jY2ailetIXSNU74TT1y
	BOXf/xqVlzCQZSxjC5pd/pR03N2TprYANOv54No9z+/tRKgoOkN9FmmmZ+zcXQG9RGt7E=
X-Received: by 2002:a17:902:e543:b0:2bd:8395:fed8 with SMTP id d9443c01a7336-2bf36851283mr157586395ad.27.1780392985844;
        Tue, 02 Jun 2026 02:36:25 -0700 (PDT)
X-Received: by 2002:a17:902:e543:b0:2bd:8395:fed8 with SMTP id d9443c01a7336-2bf36851283mr157586035ad.27.1780392985356;
        Tue, 02 Jun 2026 02:36:25 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c4fef9sm128353485ad.79.2026.06.02.02.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:36:24 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 15:06:18 +0530
Subject: [PATCH] dt-bindings: PCI: qcom,pcie-ipq9574: Add IPQ9650
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-ipq9650_pcie_binding-v1-1-486a535da8c5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABGkHmoC/yXMQQ6DIBRF0a2YPy4JkIKhW2kao/DV54BSaE0T4
 97FdngG925UOIML3ZqNMq8oeMYKdWnIz32cWCBUk5baSqOVQHo5a2SXPLgbEAPiJJRvrXTGmWt
 wVNOUecT3t70//i6fYWH/Pl+07wc5Qc80eAAAAA==
X-Change-ID: 20260521-ipq9650_pcie_binding-1c76095954d9
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: sW5DydI6is2axxRzLY1WsKLs6A6V7J_k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA5MCBTYWx0ZWRfX5ij1gJgQU/rg
 ku9LXUHyUbRkOmP0vSFLo70HjXaXj0Q7OfvqLZkkZx95qou2Ou4NV2skFTQUHpMWOvR69kzh+UK
 ZnkRKhvWL582iglEJwhYhaBV5XJnV99jv68i3CIvKpQQ1uZs/4lKupkcXO0j8c/9fdcc029jtTu
 We65Ap2ycqHORp5EvFovAVV7B8/Zf3pK1lL/yBiVRAq9C4TWonXK41HWbrjJ81KgRaJIdR35Fo/
 rB8n/JW/NzNgwlSjXSWxYJ3XBrlFTd6gx8P4LA/lIiNtdlS4WkaHCSISn14X1MSMxWo5yDmGCQe
 rnD57W554qlwQW/g04Wdw+jzWun8nts/Cy6OUJssXi5El4yQ54gKYRkP3wtM3ng/28Ml39MwPPo
 GoGzCuaRdBIyjtY0QzlygUUNSH8KFHzrVezVxMrTg3gWguhGO2PrZ4+FoxgGmGitf6I6GcQvTrP
 /1eNYhu5+jFcKprQTGg==
X-Authority-Analysis: v=2.4 cv=ZYAt8MVA c=1 sm=1 tr=0 ts=6a1ea41a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=svUzretivSU0ezUIxK0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: sW5DydI6is2axxRzLY1WsKLs6A6V7J_k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020090

Add the IPQ9650 PCIe compatible to the IPQ9574 binding, as the IPQ9650
controller is compatible with IPQ9574 and uses it as the fallback.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml
index 4be342cc04e1..7fc629bda5b6 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml
@@ -19,6 +19,7 @@ properties:
           - enum:
               - qcom,pcie-ipq5332
               - qcom,pcie-ipq5424
+              - qcom,pcie-ipq9650
           - const: qcom,pcie-ipq9574
 
   reg:

---
base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
change-id: 20260521-ipq9650_pcie_binding-1c76095954d9

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

