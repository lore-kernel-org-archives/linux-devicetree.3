Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294993C81A9
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 09:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391427; cv=none; b=aALW+Hs9vxsUVu/pX4x1327rW6MciX4J5Sbgg6bX777D0drArxLafYWb4WS0AS04mH7B3SznCfIcHUBYGHMVV1ACLDvKWMgjQHu/VcmRsv90XEQjfvP8gXgS+RO8t/8fERwGCqmz5wshat6wq4EmWWxYoKadBzQCE3VD73Zjh4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391427; c=relaxed/simple;
	bh=CJcm3mLRtrsEwDNBubTWAbHHzv1ZNb/7wqlbzNrAMQw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KI5Tp+yId2sqgEW7pDXmcdnnLXgfpxhQUFm12H+QNs87XuSpaO8a0qZsNJGLdjhMJLiNPrI1YK8izatYiQ+bJ+Xa7jKSTOIsoXszu0/lFq2yU91GEeO+mMf6UC8B/IVq3fFXk4THkPfaChvTSDISX6DDx7YnZAm74x2ofKt3MtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvz2MR0G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NeMOy3V7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvz2MR0G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NeMOy3V7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6528KKPl3429870
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 09:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FQAFb4GmUnX9anlV/m24uh
	yxYJQgrndhwAGHk534GYI=; b=lvz2MR0G1GOxoq5WxeLsyC0w4xiezwmzkfJ3io
	Su6wBc7tsdpKooHqOwoYnV18Z4ISxArPyu0BUTW3YOitDAvtUg5MYbjZjaWgJ/tf
	6/NplR5QOa0pTNgFgIk2ii+RtQrJI/YUefGTFV2RT4BIlf4Bwvad8awRMpq5UEdj
	BbGyliTKGMtNgbTckuCDjLoM7CSsxbgHYxhXaKni+4L2g1h124gUmEfUox1pmSo9
	Sui1W7eyR5VIz9kRsKdZJNjUZDVXRR42kxxJ0n9ES3dtdwloQHF9i5wV76H/Vnpk
	aqSqltrm5lj0t3JiM8iy02m2ETK567nzxmQPXT0oUMcbWFoQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehn8mhpvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 09:10:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8599ebec31so2973868a12.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 02:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780391424; x=1780996224; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FQAFb4GmUnX9anlV/m24uhyxYJQgrndhwAGHk534GYI=;
        b=NeMOy3V7Mw1AAHSFI5rlZVwCnAxQw5xyM7STfSZmZuAepzyzgrHiu+s2XQLLczjJVE
         6xFlYSb8i2ZMXA262YtLSWMtfDMHhxX/VDGQ0Mcu5iFHIsrGSQ2/JgyVQx28/IIajm+K
         MdeIF8hOO97FRVY0zf43Rl/vhPuZaC8t+scVmBPhPxgQ8am8aACe7MG9WKVPRSxEyg40
         z5BSJMyyicmdOdSvY3noyJQuKpq40bhhFryGGvjQKouJ8qTu/oFY4clPtjFnZB8wYq7q
         bwuTXghCnErMdYGSsUiKc+jKx8bAep5r2CKwiwy/65HMaosZICRSB+SWl4xPNBtLfNiL
         Fh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780391424; x=1780996224;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQAFb4GmUnX9anlV/m24uhyxYJQgrndhwAGHk534GYI=;
        b=kv/XgGaoUh141diilLtVS3u8t0sqhfLSsJHuAwx3UBJ0Uk8EGmyh7dcoyVih/NJg5U
         UsAkfl2nvce5jZZcoRQYw171v7lwbvtB0ESj8rsmXD43fLR0jv7/vZMpR/OMys5J8FHY
         PEbb5JxlgeYwWml3g9gDAuuJfnjFsFaHSXYKZrY/EauzBgOmH3IhtM5uBgQgZnK5ZcEl
         BEk82N7GRjCvkG1dj9Les/gxxnWQotBOAtqG4a6d4TVixii9OxnqNsXUefPU46c8OV2w
         LtlVOHG6UfSs9MWtS5WJdj1nBuDLVt7nSsmDJgJnkde+S8JOio29qkhsc8/xGxrrSXKN
         NcJw==
X-Forwarded-Encrypted: i=1; AFNElJ8Zq4WW4BPFJPTHr4IJtmfBe2OjXDe0P758a9GmO/MCmdKDTMXWTPsHTuE4inM/jH+89zWg+zmUt5+5@vger.kernel.org
X-Gm-Message-State: AOJu0YxqkN59FV5FWSuTQv2/vkpUHGXjiE3CI2Y3f2hfLOKCuH/Q0M6L
	+5i4kvh0J6rfB/iS2iiIu6ahzqqw1UsqzBviSjeRP03HdzzDsvOwKiZq+Y2M/cMbC2UAzqE9oYN
	Oz5JMmymBN/lopuFpZG6iQyTkeIj8G8yWRFruAfXEeWRX+9HdXch8IUpCUDF4us/O
X-Gm-Gg: Acq92OHSSbOaSDrjIDQlNhKoFzOiqSPcn/xUVp8sqsKzYRJ9YC4ZhcicL7uWQkGiBXs
	UpGaqWLhRAgsiMbQzbdUr6NutrymEe5JMR/BZc20coMuVzJ5q/kJg2uY0cJIKwh8qIetI5ROsAG
	os67ChEi0WW8PoARP6ndGINS9boKie/Cvrpo/wKHGH0wRn5kEMcjjPW5w2OpsiBZ/2akBVbzLjF
	VEaG5lkSI+CTsdR9u0klzjlpwO7CxXjN1D81KbXpXDlW/XlIRpanYpjateZmFSUQ17/XBrr7SU/
	VTDIH8t967hNZLvH63gVgb6s3ASuJO7PsVhF7JjjkwufrXlLNqI/D0QSND5szqP4m6+K0OLyQoz
	CxuGtpNj2OgoYM7aXkv08zdBl76z/pP1/5UgYs8HBIDSAD1vY8UAckXGqJWfzVLMpst/JuPiN0E
	8OH0bpP6MzHNgz38NC9qutB1gIjnJ1hMM0V1PT+ItGzTwPoWE/+cYrQ+UiF1LKlb324ts=
X-Received: by 2002:a17:903:1905:b0:2ba:924b:3948 with SMTP id d9443c01a7336-2bf367e4391mr174961095ad.15.1780391423845;
        Tue, 02 Jun 2026 02:10:23 -0700 (PDT)
X-Received: by 2002:a17:903:1905:b0:2ba:924b:3948 with SMTP id d9443c01a7336-2bf367e4391mr174960725ad.15.1780391423415;
        Tue, 02 Jun 2026 02:10:23 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e6ff5sm173007765ad.7.2026.06.02.02.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:10:22 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/2] Add support for the QMP PCIe PHYs in Qualcomm IPQ9650
Date: Tue, 02 Jun 2026 14:40:16 +0530
Message-Id: <20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPidHmoC/yXMQQ6DIBBA0auYWUsCGND2KsYQC4OOC0uhNTaEu
 5e2y7f4P0PCSJjg2mSIeFCi+14h2gbsOu8LMnLVILnUXEnBKDwuWnETLKEJ65tp7nrnO6kGYaF
 mIaKn87ccp7/T67ahfX4/UMoH/Ple23QAAAA=
X-Change-ID: 20260521-ipq9650_pcie_phy-60d7df32581c
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4NSBTYWx0ZWRfX3RxG1s6HtdFw
 rh4zeBFV54ngn+DA1wKxVaqmvYhGaWpnwSaGD9okWd5am16iqW78LMpU2T3lw7VbA5vh9A/Xq4m
 Ix2/iMNX47epPiZg33HfhoXALHCimG/oXepzM6qXHtQqqkKfJeUu432DxHGAxF27fk1ofl5f4SI
 asiSFBnjGk/wzZxQ0HGXRQRP/O46wjk+UY6k3ZdHUPIo7VRKw9/S6AkmNIJUDs8KH3P9ID1yIK1
 9ZnoB5IubXf5fcpAVfn6IU6XdKxwZEfM+kXBWmW85bQJk3ykFuTpcM+iCZB37Isc9xCYLTftfn0
 dupT2v22PzEBlf82HUairG7KnunI+CC7IhsyzHLi73p3qtgBp7IVTQav17VsueZIvrr66tNb41n
 DZXAFp5gY7SYii4zR5k5wKVZAfxpRj+CUxXogJ4ptQRggrSBMEWthcsd+7f63xYtnsH8a7KQFf+
 qQQc88OdTMClfsVq6Jw==
X-Authority-Analysis: v=2.4 cv=d5nFDxjE c=1 sm=1 tr=0 ts=6a1e9e00 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=q3mB9QRo1V_sjKeEMVIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: -urrVMlCjF89kZsKtXE1aQMxtYaWFLPI
X-Proofpoint-GUID: -urrVMlCjF89kZsKtXE1aQMxtYaWFLPI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020085

Qualcomm's IPQ9650 SoC has 3 Gen3 dual lane and 2 Gen3 single lane
controllers with the QMP PHYs. Unlike the PHYs in the other IPQ SoC,
refgen supply is needed to bringup the PHYs. Both single and dual lane
shares the same HW init sequence. So reuse the tables.

Document the compatible along with refgen supply and add the phy driver
support for it.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (2):
      dt-bindings: phy: qcom,ipq8074-qmp-pcie: document IPQ9650 QMP PCIe PHYs
      phy: qcom: qmp-pcie: Add IPQ9650 PCIe PHY support

 .../bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml    |  19 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 220 +++++++++++++++++++++
 2 files changed, 239 insertions(+)
---
base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
change-id: 20260521-ipq9650_pcie_phy-60d7df32581c

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

