Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A383042980C
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781605644; cv=none; b=OZ0eubfKlUbgUcYDo5/G0WqICVEzY9pT90WkoR+G0O2/o0/elhQ9NuppdxHyu1qx396Ivh1ulq4ufY9v/dgqnWyF5U9A2fCBlVrCm8W2ZR0/fjHVNRs1rlggiV/3cZg67hpSs7zViNmH1L+7qGfgq4BCy/QVIUDcW4u83j3ODxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781605644; c=relaxed/simple;
	bh=0BiABsMcIqBI1ZBbxUAnKxiKhJyWImEILdShyFJoJv0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y9JYP/jmxxHPNARfr47jv+ezOy5rVbrAdJvImac8DUvt6ScNIeH9ompSJ1pClNfo4RJJ/2dfRdvK1ydj1auO/i774XSDh1RQo0NWpjjMkJgdj/NvRDVWRP2UZYTdMbR64lio7cc4PaElLnJEmwSTKqMlgnvdhS1SveMKydmIfZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i/4zMoXG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Abn1WvsZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i/4zMoXG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Abn1WvsZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9hHF2799344
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rULxEUyzUnsDaBJw9I9A03
	k3+81YkekQouBJsqKYP4Y=; b=i/4zMoXGKEx46L3yUpbyE325LWm3Yyz21j7BCE
	oj+tuYFoyjzGj2z7FVQvsFMWmGk5R2hDB1uyCakAKLHDIjpvnvcoC0JCfKseaRKa
	eqzQtvSuyCQqi/O0g2GPgMKHPmCE+fgDdqmyb1v8svTkdOp/fv/WtvcrTUh8hBx7
	sJL7emk+DudpopYIUuTF3opQSolhbPknUdXYxy4KR/A2Jnj5Bpjbg5f4CRb9WN+7
	HPDP6RBdYrVny3EwLbQozjVhb5diymTqU60zRT+dIJcuANRISUePHTtDNXnn1L37
	D9kflFBnMm2K52+m8KdkflklKo5aQuG43VI4K+PP138yIx5w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu0a7s95y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:27:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0532a6588so41949505ad.0
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 03:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781605641; x=1782210441; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rULxEUyzUnsDaBJw9I9A03k3+81YkekQouBJsqKYP4Y=;
        b=Abn1WvsZxwiWN01PKGAhbHDAzbtPgXLr0vHfR8rRK4nE1Ced614HYAQOhOla2J8R4h
         t/7TtDF8Ps37i5gP3z3eT2LA9iYE7MZgVC/VDZoao4yKSNGUNeDdJBPtFbLge7HN1klZ
         SOM0Ld0JlUXFqiuFC9OxpalZFPbYdmWFuMyfGD4BFVVK22UoYmKo9ARpENfDl+NdLOD5
         6g1z6GKfDNZGPe21cMHBztztmZixbTBqc6BmzscrUMSjeW6tn03PWzYcsehiZl26hJoJ
         Z/d0c/6TKeX5+pyB5Z0SWuD03k7oVCwi13vHF7yZ6xmm0GWhlGnsqnvtDdSpZptHOqYN
         gnaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781605641; x=1782210441;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rULxEUyzUnsDaBJw9I9A03k3+81YkekQouBJsqKYP4Y=;
        b=LCQGVkT15P+MPhx1cPpeIejS3d+wtE0gSvDQUtMOg+3Ah0unufQBuYdbidVKNaS9S8
         WLB0g3QYYMpe7Gfen5FCIai9/Jf6OEiLx/R8eMzHCBnELpgCAp8PZ7xUaODWePODWRbd
         LTlqIZAftLw06WyLozeWldk+rLsd624f4Tprd7QxN8aORWQ24lHvA7rWCzfr7cO9r/Oy
         QbjszOEMQolrgBJY5urNUY0DKGIgGnVHLJse5uFGv0WrmuTZjdL/ZyohLc5xhL0eXjN1
         WkAmFp4XPKD30FCtIYWFUnXjXn4cWN2nozIfabhWyRZXRbah2XtLqstkXl3Kw8bQuY2T
         e1hg==
X-Forwarded-Encrypted: i=1; AFNElJ/6hOo8PaDyr3cCblZUDY0X8xuEobGc9AAK6OrnyqEkWIXvYy3ltKVGmrZmVMEHNlnhs7QshzraZ2Vs@vger.kernel.org
X-Gm-Message-State: AOJu0Yx59n+QTpdelnidR4HMZnn0ZohPdWv+XpFchxkXvqyrogolZKen
	AT7zidPHln7ZcsOapV/tJ/7KKNs2Qc07j780LbHxQXIWycAwsR4hUmf6cqfJAx6E8v4YPNHtx8x
	LohNornHH4G2/8e1Is3TGnslrJPLKalabcF/DMfid6u2qOC11zlPkwOyNd1YOyIMBEhPspQki
X-Gm-Gg: Acq92OFQ46iux8fPxyuEk78wqiLrmmXKeHpW6fwLHXqr6QcivpAsfpc/WetXZz+WDxx
	FxZLnd0k5g/6WDEssqK61Je//K0Ynf6SG2p59SxLWurx0pDFrgTK4O1iHXaRA88sakhLKZdrsi1
	56pFY1cDKz6atpb4CLF4lZKB9u45KTKZms30odXtIwq3icQkXBo9k//74vEVIRUEd2IAFh6ajUt
	IBU2FgM/GJQ2+5a+bodt11rvMxvxtfzCvVxhz5U4oszqLmHe1zdLE96HtIjiW/8td1Yno+8y6ul
	S03gHi7ljeysqkS3JWZw4XsfzTgShtl01N5R9L6IyqNMZv3EeLIjlhY4DINTPB1AO565ryb8YZ9
	ML3X/PR5Kd5OlY8B9f4IEgTy432PYKDqQcJgR2dL9Ka8LVtR6xQ==
X-Received: by 2002:a17:903:1a2e:b0:2c6:a172:55a6 with SMTP id d9443c01a7336-2c6a172579cmr12723895ad.9.1781605641289;
        Tue, 16 Jun 2026 03:27:21 -0700 (PDT)
X-Received: by 2002:a17:903:1a2e:b0:2c6:a172:55a6 with SMTP id d9443c01a7336-2c6a172579cmr12723555ad.9.1781605640855;
        Tue, 16 Jun 2026 03:27:20 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac79fsm118343685ad.45.2026.06.16.03.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:27:20 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH v2 0/3] purwa: Drop the Hamoa PDC workaround from purwa
Date: Tue, 16 Jun 2026 15:57:12 +0530
Message-Id: <20260616-purwa-pdc-v2-0-8dda7ef25ce5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAlMWoC/z2N7WoCMRBFX2XJ70aySUyzSym+h4jMJGONuB9md
 lUQ371ZLYVh4F4u5zwEU07Eoq0eItM1cRr6EvRHJcIR+h+SKZYstNJOudrJcc43kGMMsm68cga
 t19iIsh8zHdL9xdru3plnPFGYFsDfItNlLpLpPRMdMcNL0lZf/44jdAPsi2N/NbKckjZ6qtfKE
 nyuNwPz6jLDOQxdtyrve2EjMMmlSVNb+egiIpJBcDqSAmeocZpIKQsH9NYHTwaC2D2fv0PDCMo
 DAQAA
X-Change-ID: 20260616-purwa-pdc-198063b482b9
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781605637; l=2511;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=0BiABsMcIqBI1ZBbxUAnKxiKhJyWImEILdShyFJoJv0=;
 b=L4yuECzfyMohqO1bwlQ/62OBzXZp4KJ/gdbtmEMzfO123Z0CjRsAVIO0ilTKixOF5n/Ytrida
 5ARPV11jxgTDirHQmGqBTWGt+sKh+YDOv/OE2uGRZvXzP2MweCCLB7i
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEwNSBTYWx0ZWRfX+k16TqCQdX/T
 EhIHeM6LmuSB9OprDr6v8TXUVjstAsN6MI5FKeAPUjs9qIj5hAVaDRhoQVwI/53AZfI2wNSG7Yh
 HDS26hXoBv9Xddv9fdKR9U5ml0pvrI8KRfMytAr+VVRPIMpunkLVdSSr5Y9zq5EWzLW0+QfUsyY
 1i/WzyjKvmwnJlzhl/H7AbUUP4r+hYZ3M/9zBBWDYuP2/psKP8kV68EqqaVxotdpBFe9KTsTj1o
 EQMvoeDyS1a30bdYceIlZNWpPi4ivSKN9W0rgUVNRHVxjrcuzC9hbMw2P+qYiTmL5w5negXlItW
 PpbxY9Rz2dPwX20zPiK3cLhXjkLKu2F3EAR9aLMNS8oATVKPWoJI7F9+kaYBORFbbTHduJhMC2t
 PQc8peLEGy/NwM+smhxA5zb5I3QKfeQLoBHzU3sHEZetYSJxG1OZ1JwfILKOxi/LGUNFt+5GJBp
 c+4O37fTMYIUeFtSZWQ==
X-Authority-Analysis: v=2.4 cv=JKALdcKb c=1 sm=1 tr=0 ts=6a312509 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=eSlY1-qh9a7HmRHcGJEA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: MFzakTrvO5hXU7waX5c7_wSzcDSRdKgY
X-Proofpoint-GUID: MFzakTrvO5hXU7waX5c7_wSzcDSRdKgY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEwNSBTYWx0ZWRfX5LYx2G1Bfl/q
 0PG7R/yIKWT8gUBrtJg+3HIcT+qZppKeIhAGAY9OfZVMJCI9p8b6JxqRLp+iD39CffjfJsa32Ln
 F4bdf07H1fd9tWSP+aMBGxduUsh4uww=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160105

Purwa shares the Hamoa PDC compatible. Hamoa had the software workaround
added due to hardware register bug mentioned in commit [1] which used
Hamoa/X1E80100 compatible to apply the workaround.

As the hardware bug mentioned in [1] is fixed on purwa silicon add purwa
compatible to avoid applying workaround meant for hamoa.

[1] https://lore.kernel.org/all/20250218-x1e80100-pdc-hw-wa-v2-1-29be4c98e355@linaro.org/

---
Changes in v2:
- Remove Fixes tag from bindings
- Rename $subject to use hamoa and purwa name
- Add comment above compatible in devicetree
- Rebase and mark dependency
- Add new change to invoke SMC call for purwa PDC mode setting
- Link to v1: https://lore.kernel.org/r/20251231-purwa_pdc-v1-0-2b4979dd88ad@oss.qualcomm.com
---

To: Thomas Gleixner <tglx@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

---
Maulik Shah (3):
      dt-bindings: interrupt-controller: qcom,pdc: Document Purwa PDC
      arm64: dts: qcom: purwa: Drop the Hamoa workaround for PDC
      irqchip/qcom-pdc: Add puwra compatible for PDC secondary mode

 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 arch/arm64/boot/dts/qcom/purwa.dtsi                                  | 5 +++++
 drivers/irqchip/qcom-pdc.c                                           | 3 +++
 3 files changed, 9 insertions(+)
---
base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
change-id: 20260616-purwa-pdc-198063b482b9
prerequisite-message-id: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
prerequisite-patch-id: 060eef1520c1c4dd8dac1be913d3a3807e2e4297
prerequisite-patch-id: 8f3baf0a17cf193edc0a3dd072a1e148970d1818
prerequisite-patch-id: 00e0419592d6b43eb8d17bbe2ef24ccf708f15c3
prerequisite-patch-id: e6711f15783ab50499e556618767b3450e2f1367
prerequisite-patch-id: 531aa20d79ee018e28c86567c11ea88f665cb2e5
prerequisite-patch-id: 085301f3a331a482e3f16cdd4b588139cf1f2ae5
prerequisite-patch-id: aa6592f80552d5be8f73cf2068d31f1bc214c923
prerequisite-patch-id: 501c83baa6ed0870e2f535e09b64d7510e261def

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>

