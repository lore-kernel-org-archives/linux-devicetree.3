Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B3E3BA22C
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729637; cv=none; b=mHnFFDvG5C/9SphmA9vYyaC+UyyNR3zsELPvsUZEu6ofh2Lfzi87qlrbGjHUZHYDUrKk+EmDqnQO2qX+DoOEHUFgQ7zs0FnhAKWtQnAsThD0k35c9iIGVTHnKnF/IBtFdYxOg0DDDqJxw/1Xv7ztncnx8dcN4W6zJM6E0+RtCQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729637; c=relaxed/simple;
	bh=CHdDe+BUQ62guidxh4D5DQ0w+0rvA5ZaJvZOr/6hUqw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eQpAxriHgGfAupcUKJ9iZxUrXO25i9qfwtqJfUVncTIw61G7kScV1I5XqMlhg5E8ukf/24PissozQGg76Uonxl6OKnmCp8gbymSSKORrwwC0+iimRNyLsiVx4LvpR+eT+Prca06I46VRpG3xgDYzw1JQbP4uOX+ktldkdBzZtKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CDab6gCi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fXw3W99o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CDab6gCi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fXw3W99o"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT3Mw2646937
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fFV/fYYZ5actoreseKxiGB
	Q65zNAHd/sIZ8nm+2uXhM=; b=CDab6gCiodNwxNdi8o/ilUBGOekJjFcGDVQvFE
	Eu3FX5D/FJUwukfJb8z6vVqDZweMneMYimz7MB45NYypKXxM2xWonUHtlMAQtiE2
	3tu41zvfXSH3zNRX7CESap3k/IYfwTmtGicUNE6V4lrAFjuuJ76+p2ndRyfG86dj
	a7IbtIpW6upbzy96sDg19Etsq0uANxTGS8eZNCEZuO1H5fkZa31w1mFGB92bCLxc
	JIpMcxIdAOJ3TDtw+GDO2NrDkvtbZR8KMj9OateEH/yFMHSqgsf6CEvX8Y0aIzTS
	ijtlbVtL57Z70nqCudoqCjJpRwITLY88OeozpylqlUVAY+DQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4trunr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:40:35 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-137f3465368so3621365c88.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 03:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782729635; x=1783334435; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fFV/fYYZ5actoreseKxiGBQ65zNAHd/sIZ8nm+2uXhM=;
        b=fXw3W99oI8v7fUVtDXRMP1Q/YXG3NEqyj51Ee3Q86tXYWRGDSpl0QVPralSJVabRVn
         CLOYb55NXES4Y/VBZf5zcMd0PZ1WtwNpeEVR/pd4PSwW4eliF/TJ3xzjVtaPe1u7SO8z
         GeqK6WcjnNyVXPcMzr3+kx5M/nGEmXKDYRSDOQUVUEQe0qq4b0qa4Ma0YFFUiGu6LBuW
         GR9cckikdvT6mDurhWyViNnKrRC1R5o9TxStXi0QjgnC6LWqZrQWhsyREXJuoZzvtHJ9
         rMpVT9a/6ZIM29sg3ZxzNIG7Ye9WkQT59aFDUYY0mYgHmvxLn4PfuxTUpZtDRs+0lJKH
         FXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782729635; x=1783334435;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFV/fYYZ5actoreseKxiGBQ65zNAHd/sIZ8nm+2uXhM=;
        b=PDzTbiinn/5ObNeiIVcflN0IIaalCqdNfzoKmmEYHxcI6Cxos9JBaUycmpBlih2zVD
         shpeRdcHjpvW3vUCKD12tFebApNSK9ExFsiSd6p/SfOrnUV5F5zhWVHLShheTfX6p/Tu
         YyXjWanuLgmLukQuhIlR1+NcudYN1x3KrFibZt2DY2Iv+MZ7LyY2xoMCWaf1+0WD644U
         tiT3EXv5QgWDDvfizcfCp9Gb4fpADs7hRoWtvaTuKByh0uRLGW5mD6/IPTh21RkyIv7y
         c4cJBa3K7UIJOh8QaHuDKxdB9X4JodPL1Md371MYAkZtIMywDdUTsrtQZfEtJyg+ql6a
         S5Bw==
X-Forwarded-Encrypted: i=1; AFNElJ920mk7hO/R23GLG8BUyBIA8JYt5jttVYpVIIHeNfHvHBB+nirsbyt5thMl54KgsUfMt8xvN5QxgGEn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7HfjrnguKyTKkamV7JdDjGFw/JmM1jVwSFaaeXpT/9o+BZSRp
	cF/aR3zTz2d8ABABiOeH6EyXETmhoBESZtZVZpREdrHY7Vl43zunfzgWNaT/eVy5ZAdB2KTjr+m
	rEUQA9RWPfYnBnKFXJpvjuEEpz9zoesyrGF28kJyfyI07J1kGRvnqqHg84IxeM8zo
X-Gm-Gg: AfdE7cnyJx1Z+P4d7WJvG2xHeNZWNletfv1WmxRuWoxBvZTvm0l+4Pxoe+2/c7L39TW
	ww7DDDIYxARJS7znl/OgaTtMmE8dqGDJ52Xpadxu8XtjtePtNkC8oMXLK76/65fWZt2fhbIWbBM
	3bzanwdIlGsYi/rxYl6djU8g1ixRh4BWQWS29KEg+uy/apNpfHEuK4io30yHSwaTKc6EC2JJ9uN
	Hnui6w5KajLVjSF9HOuP28sot0lPpnwp9SGmiGFgvn62ZTZW10qiVdO4joWDGRFgUFcosVbssvV
	7MEdosfD7vbdcIrz6jrqZgXzi92izimLiwcAdc9nw6qfYh7IBVaHvq1M2ANGndUYVJA2DMoshRt
	/hUjw2HurL2QGxHlvKCdntck3vR3bvOom3vzBnKAiga2pP+ECTPkcluNOaVs8bqAKDB9UK9xAOC
	d7bE1suZR2AmO3aWKVBgkZXEc=
X-Received: by 2002:a05:7022:45:b0:138:3613:db8 with SMTP id a92af1059eb24-139dbb18492mr16019767c88.3.1782729634661;
        Mon, 29 Jun 2026 03:40:34 -0700 (PDT)
X-Received: by 2002:a05:7022:45:b0:138:3613:db8 with SMTP id a92af1059eb24-139dbb18492mr16019744c88.3.1782729634176;
        Mon, 29 Jun 2026 03:40:34 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139eac62642sm25413085c88.10.2026.06.29.03.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:40:33 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: Add EC support for Purwa IOT EVK
Date: Mon, 29 Jun 2026 16:10:16 +0530
Message-Id: <20260629-ec_support_for_purwa_evk-v1-0-e082b70138d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJBLQmoC/x3MQQqAIBBA0avErBPMhVlXiZCyqYYgZSwLorsnL
 d/i/wciMmGEtniAMVEkv2dUZQFuHfYFBU3ZoKTSUqtGoLPxDMHzYWfPNpx8DRbTJrSpayNHdLI
 xkPPAONP9r7v+fT/dHwePagAAAA==
X-Change-ID: 20260629-ec_support_for_purwa_evk-687780bec098
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782729630; l=777;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=CHdDe+BUQ62guidxh4D5DQ0w+0rvA5ZaJvZOr/6hUqw=;
 b=djmfSy+gQEzHqI3AgW76H/2zUNpH/2uf1mAQc25+994OQLTK2eCx56dfEZTtl5pC58KCBBZl9
 kFoP7CJ8kk3AJ1bY4h6evfExiDS8vs83ev5S08BB/a9Yq8LbJoAPXx9
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4NiBTYWx0ZWRfX+SnrBeBg41wN
 cKVI3F2N6j1+oRGnsTtSP2KfQ99MK7tlqQ/UH2teKhbqtS7q/Toys5sZhu91GedluNW6aK/NpDg
 QkzGvS6NTbulk7khvrd332mNe3nlRLnIVx1Wv75cZpgCPx/vRKWktUawqZy4bsjo1zmQcMHAhWH
 KHMqmNeaqTmYjyr+HkI2QEyM3d6rYxvnI4OVsPh7fMdi29/tN1iTTW4sanchdGvVObT5T9AjVBx
 Cc6Fp498PeCltMHMe5Sico1StpBahVuHpNdcZI9kQMCx/WeDxIdAAIrQ/z2/X8OGG1KO1yWMqCD
 O7JMkB0C5whPPT+oYE1L4ZvCEk6GZCIi2aV162rHAr3EVo6I3G5Ngay7QNElOjicTtxuwf1Ji2i
 ea0vdQW51d5rD0Ktz8kYNk/a6X+ESot1xdboVs4gvZz69rhCK4QmmVDGv8H/etcqFMzpdq3TzwO
 Dw+gdRxh+xuO2yXUVyA==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a424ba3 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=uL1NMb7WAb6n0rh1RjkA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4NiBTYWx0ZWRfX+zw5EHwVv32U
 IXA26hQoKpfrOC1iyiJW7HfRijmRpIVlZVhiT0JVCGT/CwP618A1b1e0DS44BzFI/qqc7k0MUxe
 oBlmIyhdB1hPh+/WcZoU9loaro+C2Wo=
X-Proofpoint-ORIG-GUID: 1yPyIGdhMYQffB-TtTi7TnoODE56kSC2
X-Proofpoint-GUID: 1yPyIGdhMYQffB-TtTi7TnoODE56kSC2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290086

Add the embedded controller node to the Purwa IOT EVK board and document
its compatible. The EC provides fan control, temperature sensors and EC
state change notifications.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
Anvesh Jain P (2):
      dt-bindings: embedded-controller: qcom,hamoa-crd-ec: Add Purwa IOT EVK
      arm64: dts: qcom: purwa-iot-evk: Add Embedded controller node

 .../bindings/embedded-controller/qcom,hamoa-crd-ec.yaml  |  1 +
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts               | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
---
base-commit: 948efecf22e49aa4bf55bb73ec79a0ddcfd38571
change-id: 20260629-ec_support_for_purwa_evk-687780bec098

Best regards,
-- 
Anvesh Jain P <anvesh.p@oss.qualcomm.com>

