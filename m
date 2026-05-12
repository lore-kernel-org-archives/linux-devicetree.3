Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9998E3E1720
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591147; cv=none; b=FijRYch1yLF7QAuTLHROFYCbRJ7fT401ZJx2wDTL1MZ1Xnc8ltsHI3W6i8H9JcL39AKPZqfZVoo58WFXTcMSXArKchAXmFA3+nnT+fyCgr5JoIH3k3lPQJu6r8HL03hWd/W59+b2R9kfX8uHYWkboh+avCTEy8hOjEWN9lsMOho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591147; c=relaxed/simple;
	bh=E6HTe7QhWugVTgCEx16GCBmY8B1fRy9ivVI2YY8eg8s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WOBZSqvZwF21Vp3SsK9JuvtP4deXW7MEqDpBRZL9m54/jpRxYrxu5SOPQ8Gi7QajQJb1DhPm4kV7tR8G6Rt28WBVIXc+S7WO8S4hEa0CSByBZL+qGzcMULoEkmoDDzdn4Te28aofNk2R/NlATfZuUTwcAvhwv7EXGze5QqnwkLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9JtV2wp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GyUc6BdK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P9JtV2wp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GyUc6BdK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CBchah075202
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5rK6KbR466mqH0pAQLxyFa
	oUgNlu3VncNyO+h/5FL40=; b=P9JtV2wpam6BStfEJjDS32ktWUaQauosANpT/I
	raA/tO3Av7QuNTS6Chn5WMCAX6I37OvzKvLO66r3Wi87DtFR6nxJfzZBq7efhG5L
	RX1g5TvvwEMY5bvNuiDnoC7/uDsaOdPXy6EI7WISYDZFQhOc61Cpf8LbmV+VuGJx
	VA/1i4IWYZdJKkZYLI+jldwwVZPFjmYWX4yPbKUhK+eLugRhJbajiqjGRNSpRAh5
	Yz72Fv/xRk/PLQ9PZG4cWLwgSQi17DPjle5xt9OQD9JYdjah9FyEx5FAFgvlwcE4
	hVhAkNPnAA9gREdKbOMRApPT7llvgo+ANNU9bjRnKOA5r8CA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43gygchg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:05:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b461b36990so59617545ad.3
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 06:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591144; x=1779195944; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5rK6KbR466mqH0pAQLxyFaoUgNlu3VncNyO+h/5FL40=;
        b=GyUc6BdK6iO0FPe3wvDz+q22BJ5JRTS0aoDCd2lqOPw1HoS3TbovwEUcc8SM2IupzA
         9ddpaWMiTZL6VNBve4miMyHGabLmV90/6fP2o7KvyFBHUSuIUuA33HXfbNMUJzuMAgfd
         qOhMduqJDm4FrtkYGwCBtQuOhYfJD/b1VTpK6czgihvUPbKzb2Sdgcyd1+Ie1lUd148V
         U5K3bFi5otdSIZ8Wkcj/LZEUzSQrbIQiZqj8CyM0Ux3lmt8qhhlEHOVx+9mFEQgUV0Wc
         msgFK7ZWtoE4pKQ7fj+F6SWIvZhSYCmJr6ym3AMvzhBz+FdW0xEUhArjWAhFQoiuzN91
         vSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591144; x=1779195944;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5rK6KbR466mqH0pAQLxyFaoUgNlu3VncNyO+h/5FL40=;
        b=Cq9of/rfb13kjN5IRkBakYgfxQKvEQGoiBWOY1jKyY1jn8zrQEiRyko2yx92HTOiFE
         cQGQE3I1Tm7ueKGj9hB1lyhNFss3inaCRESvP+XCm+SHvo0C5B7wYdpk3rHzsDHN+b13
         pc+QkBTmaND9nw0yaK+9x6nwyqddfDaxrTAiNi2VZYvaA+DcTgOOY6IATOxI4gR+dIQ6
         wzY/coQH9Ah2LojtQ9x/pIV2JspBBWTb9B34YdJ/kbWPstDZk90V4WPFZS/BIx2F32Zq
         EKXQyZ9vjqugdVOc4jONx4es7rQLuroD3KCfoHgnCMxi2DAHf5ZGsWYaIv9g+QuwIHcb
         bXxg==
X-Forwarded-Encrypted: i=1; AFNElJ9c2nLBfdjyV+mz+cNQ+i2AWtjmyQo9hmQ3MyuiGA9nMDWBwaj3LiON865fxErgnCpH6jykMBa1Dzpr@vger.kernel.org
X-Gm-Message-State: AOJu0YzKHt3xAVHZiC9lf3NqQwKoPZ8DkZzcZTHHjoRI3z5RnDYvJSsC
	5sKkrJA6l4J9rOsnyW9YXf64J+NgDxQ2z161oKrNT9y5VZGiFgINJc2p3IeZAaW3xxF+tf2eggJ
	RG90eqCFqLpOr14wpR3kaWt3C0WSlQfpNtEfIX5XCsICKcnEC+SBgF27fsjhvhVJZ
X-Gm-Gg: Acq92OG1U54k0OooPrAOzo4h5uwrB8ctthHlZe8BziG5ZxBwl5BN6hR+P6FVDuVkWDL
	MJuG2F5dlEsSCN688+4ld9zx9tniHzPaUOd1le1E9vSjIut4n+coQGZdEPc5I79CBryvMc85tED
	yMkGBaAk2hSSu1hIgqiPRk1u4Zw4zGQyiQ9wnGCe/a6eByIdawhS3ohSjUA2qi5i5T9BBWGBDVF
	LrXpXrq8De7RCk14aW2s+teBPekxUEjHnr6Rwhtu9jbmrgP8oITfS+B9tMzzm9WVvqJBwccrpxZ
	OAvSMNkRMAuMPC03fIOVJ2rXOVkpVcnBPE+FgvyIZuF2PuOkt+jZuleNqDbyr+l+/u7yfYCa8Z7
	+mJjCajOAXTfQVpF/GOnCIgOkhgh1wfkFMySEA+Ovozd70BAeT46a
X-Received: by 2002:a17:903:3b45:b0:2bc:e299:4c9e with SMTP id d9443c01a7336-2bce299510fmr52779945ad.18.1778591143579;
        Tue, 12 May 2026 06:05:43 -0700 (PDT)
X-Received: by 2002:a17:903:3b45:b0:2bc:e299:4c9e with SMTP id d9443c01a7336-2bce299510fmr52779605ad.18.1778591143065;
        Tue, 12 May 2026 06:05:43 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e36c65sm137630785ad.40.2026.05.12.06.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:05:42 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add camera clock controller support on Glymur
 platform
Date: Tue, 12 May 2026 18:35:25 +0530
Message-Id: <20260512-glymur_camcc-v3-0-a7196fee2779@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJUlA2oC/23M3wqCMBTH8VeRXTfZjn+mXfUeETG3qQPnasuRi
 O/eFIKKbg58D/w+C/LKaeXRMVmQU0F7bccY2SFBoudjp7CWsREQKElOKO6G2UzuKrgRAksFlOW
 FbIqqQXFyc6rVz507X2L32j+sm3c90O37huAbChQTrCrJScGBSs5O1vv0PvFBWGPSeNDmBfgwo
 P4xIBpEZK2kNWNVWf8x1nV9AYHNHPTzAAAA
X-Change-ID: 20260401-glymur_camcc-de21745db58b
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=fMAJG5ae c=1 sm=1 tr=0 ts=6a0325a8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=z_Sb7eu1-GLCsw485GQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: rGgCBQuLen3fKKe8KZu4PJSF139TRS9u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzNiBTYWx0ZWRfX4lsF7XDOFLiy
 +8+xR1n0fuDcypCmcIKdkz8gMWAN2E3yuIE5K5N1UlJJpw26dAScbEFwDTn0TnpwQ3TdVcTXqm/
 CByJYuiBRSO9rxWc2UreLjPlyDbQMuHC/ZHYignlIanHGvYWG2s4e8D0rnTV2SqG3aS3254xs7B
 Lppu5qUybki2Xvw9Fy3vDTbcjj7Q9i8QTPsNZdYQba3O6CZi+ux41CKESE8i14QMJb3xL4jNQda
 O4emcD3EkgdiyneDCscmrYt7Am9gb0rcc3fPJRkpeL7niQGO0ZCpnwp0tHpDh1n0zPcYKjzwO/U
 1pjDfjFsfGHBxFtNyB3ERpEhzH8yiJwWuvtdgncXZjRSHb5JWbF/XmrIjDcfVZLIRpgVj/Jf7bk
 FnnIgykoxbN5g3O/Oos/3EWMziUK0hzSubhtfNTFgUI+aXI/DKV22Nj+GGp5nLjabiPnwhlJ0FY
 o4Q2Y52YXQndRMJIUWw==
X-Proofpoint-GUID: rGgCBQuLen3fKKe8KZu4PJSF139TRS9u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120136

Add support for camera clock controller on Glymur platform
for camera clients to be able to request for camcc clocks.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v3:
- Dropped separate defconfig change[PATCH4] and included it in Kconfig
  itself [Krzysztof]
- Included glymur camcc header file in the DT patch
- Added R-By tags received on v2
- Link to v2: https://lore.kernel.org/r/20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com

Changes in v2:
- Updated DT node reg property to use hex for 0 also [Krzysztof]
- Added R-By tags received on v1
- Link to v1: https://lore.kernel.org/r/20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com

---
Jagadeesh Kona (3):
      dt-bindings: clock: qcom: Add Glymur camera clock controller
      clk: qcom: camcc-glymur: Add camera clock controller driver
      arm64: dts: qcom: glymur: Add camera clock controller support

 .../bindings/clock/qcom,x1e80100-camcc.yaml        |    3 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               |   17 +
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/camcc-glymur.c                    | 2280 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,glymur-camcc.h      |  122 ++
 6 files changed, 2434 insertions(+)
---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260401-glymur_camcc-de21745db58b

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

