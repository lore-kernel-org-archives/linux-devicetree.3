Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC3831E842
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 12:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780921384; cv=none; b=YBqXCIcfc3pY8tNa1XTZzjFF5iJbF5vcRHA10YRoAHSaWSa3RURHMxlIqDWX8oVpLGK4L88F478b0haCZybf0hGmi+FIRgOPkRUteSD7HZ6HoRdiraKDJvGJTHOBLCbQDbNB271IVN3+b8RX+bVQdIIOHAI2uLWKFPC42xAVQ2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780921384; c=relaxed/simple;
	bh=4F7gY46dZri99qm2y2Zpu2VG+g8+kLFHTgK5fDVba4o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WUq0TN9pPm5PGnaF7UWkRZe9CvQ2meb3UX6O76d1GdkzsqwbkZP0KtNG3CXE0FdT4RarU6mbF95Bwon6srsCqOa4geRjgvB/0u6nJuxkuU6Go2ZjyCyP7EW71Ng5G5n87ShoOwF3bSHQLdthH2MVXnRNtNsLytS2fcTqeX7b2fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ijMABQTa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CxI+Ko1u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ijMABQTa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CxI+Ko1u"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658B9TIC2993051
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 12:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=X69rCPirG+wBx93FbgpUBH
	+X44jjs27nxgLICDNALu8=; b=ijMABQTaxlkG5CoaiFIbilzWulZfKOFKJ3edg7
	T7fiEOcJ5FkuUNbA0EpTyExj130oK4sOtEHyNKGV5oy3kLffUs7VoE2VZXrWOnJ6
	Rs8PXmS48Th0JojL394nNYpUWQnhuEt4NLpbTAU+fLQgt6ozTxnkbkOHxqZLTb/u
	NAGID/003G1SmxJCkGYENBEqoRC2Zo9aHxmndf2x+mTdprItuIBsK2cUt8mNxwbY
	Sy67X2VyaWUIaZKB0VoPfzkz1QPGVAcLv7nNUSq+dUA7qIx8Ha9YPjyN4t4bL3yy
	LwnbYFzI4uvTrYbV/lhoSqYHmQ1gFs/GHSz5ftMtCLasnOUQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuna8jfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 12:23:02 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7ef69fe0050so22986817b3.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 05:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780921381; x=1781526181; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X69rCPirG+wBx93FbgpUBH+X44jjs27nxgLICDNALu8=;
        b=CxI+Ko1uBfG6kX1hjG4FNmvMUPX4DHgRepfQn/12rbI+xellNQ4cNfIaBvtuT8iSc+
         8cYchYTdiMaQ3/GlKL8P6ul4RBwzLyovoramP+B1GCeBHM+yTw4r6ZuI7dCn7VXHY3z0
         ao9rhiDFQ8pswlD5zpXtEa+7XCUIuy44yplf3F5/1FQCkrcm/GvjhNRBKOEaylJQnqv+
         BwA+CAGnBQQLXlX2pb03B4FGzKp57MTm7Id4dqhJNlwXCunkTh972AI9ChBs82Vgp4dE
         LXjhvP4s9SA+U3nWX6LjRQcEZvAS+gQBwFYHqwefmpLY1zTnOlHKCTatEA2v/7nBnDHX
         snkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780921381; x=1781526181;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X69rCPirG+wBx93FbgpUBH+X44jjs27nxgLICDNALu8=;
        b=npx55aXoZS4aBqjdcTsLBbHXEpR/DmSPq/7b9Z8eWK2E0RUI6bc//hOxPL0kdB4u9z
         t8zj8EFTX2DLEs8sW3bhjA07Aa99hhpXsdGYGh4bxtJ0Bzd4468zPO+MZtHkzoPwZh3P
         ZHxXCk4khO1ijPkwJRuXYy7rm3jF1UH+LOtEN8e/ETJj2ooS0S4nE//XHNogc5IgppZB
         SslQrpKP6mpItjUEh7QG3wQfkMHMCfa65SmmSuYXcb9PnE7i+5iKjY6+DpeHompQyUzp
         VjvyQTNoA+35lcdnVfohgP5MOAWflYDc6ho5VksHGG7AiX7o0s9IGvEg+MLIxpzlrLIb
         AXcQ==
X-Forwarded-Encrypted: i=1; AFNElJ9izeJ788xMd8YfarDYc8GbIjPQuioe2b4ZeJ9IzDX3W9e2XD5XeL7PySZxVRHeUH56+uj7fyCVP/jH@vger.kernel.org
X-Gm-Message-State: AOJu0YwlMEno1BDEEYHj2rn7RDrZ0PaB6RiLhfnWvbMhgMEf5rAcCTAj
	v08aE6RVz2m6uwpc9r37Y5P1f85RgQMcS2tdni4A60YH8nLpn+82HHAREO0u70M2tYRqm8HLoVY
	MjGizDwImX/mP8DOpFp6D/IMVit+LeY+OJ7F4rRRyyPfDcah3QGoM27ZTuyLMd49W
X-Gm-Gg: Acq92OGW436gkIRGDcQ9dicnUDj0OmMwK9m+UcM1QKFCisxj3Vv1ibKw+TvaRt9ZFx3
	Y6sKo75Gp46IjeuAcI0BudtyHOcJVJykMIZCE4NOOMaNZYWiDlp1iAizaiwHlTc/bNURjcDhRgh
	EC51D7QwjH8c1I/YjMaUYTrQX37W+vJtnh1w1EypyISkyqUjjyQDIq9RgdI2BgHSiYV86ttd8qH
	8Yg5/exl+sIZVuJtjeyFItOiBGm6iP7dpUSfS8zQyjKg5NSMOpj1ZyrMmdLCps8TL+wJmr7RLhV
	zHbmGc505v7A7TtDUyWaNQ05DwXCFsuWOVVJtLF2ExnyKPutgh0R1QRs9Eotwi8Mxy2bIyQvkIA
	4HasUha+Wj998gaK0TIoQ17AF/HEPR6gMOPiisptv07rVF3hQKRpl3DQmlCDYKH8=
X-Received: by 2002:a05:690c:b15:b0:7d1:cd93:c8f1 with SMTP id 00721157ae682-7ed0c22f784mr142915067b3.21.1780921381075;
        Mon, 08 Jun 2026 05:23:01 -0700 (PDT)
X-Received: by 2002:a05:690c:b15:b0:7d1:cd93:c8f1 with SMTP id 00721157ae682-7ed0c22f784mr142914587b3.21.1780921380568;
        Mon, 08 Jun 2026 05:23:00 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7ea20ea8186sm84076257b3.4.2026.06.08.05.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 05:23:00 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH v5 0/4] clk: qcom: Add RPMCC and GCC support for the
 Qualcomm Shikra SoC
Date: Mon, 08 Jun 2026 17:51:48 +0530
Message-Id: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN2zJmoC/4XNwa7CIBAF0F8xrMVMgSmtq/cfLy6AgiXaVuG9R
 mP6745udCFxc5M7yT1zY9mn6DPbrm4s+TnmOI1UcL1irjfj3vPYUWcCRA1KtDz38ZAM3zvH02m
 gdMdD5gJa5bsQgrTAaHtKPsTL0/3dUe9j/pvS9flmrh7Xb+JcceBOuk5rxMZq8zPlvDn/m6Obh
 mFDwR7wLF4YQlPCBGGNFLKxRiiooYDJF1ZDVcIkYbp2CjFgh7otYOodwxKmCDNgtA1WKSI/YMu
 y3AFGD3NjqAEAAA==
X-Change-ID: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDExNyBTYWx0ZWRfX1jVZL3ta6THW
 +2HqkYZv/pdusoFC9JYg8DcW48GZid5KSmTVtmhwg6s1RkL1CXWOjYZFuF3htdbHfmIHNzyOzFM
 xUi/VJcgoSRpTpE8amtPvv6djQYpn1u6TNA5yehbT4s+E9UB8AqBB9nsgUewzgyvFB+2i4L6GsZ
 b77o9U5ZpWYbqZyOlXY5adbWNkNAqJB9TSEei/TSJISiQ5BUA4uKfe9qq0A1bpZ5JOj6W4r/9Ix
 Tg6PxbiLnTrDPl3SR6+W1gC5d1ZvvgB8+bmoqkl3BVXZ/D34IGoJGJRd+dQtozaVi01RBd85Sv1
 ppqGX6USzfAhLt7t8qJkN1O8YhcP5EY9UJkXc6Dx4N/XBc88M+SmJ5tRV3VpWLeI8BhKDwpd9fR
 oPwbq+T8JH4vqYEaBKtEBc7CzlyewySg2A50JljWchvMHjb5mhNugOlDhqDO8+LfUrJlgTtQ+sq
 YWPScivFPi0o4W2UagQ==
X-Authority-Analysis: v=2.4 cv=RfugzVtv c=1 sm=1 tr=0 ts=6a26b426 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=byt2Oo71_RUV7fr4z6gA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: peyuK8jgRm2V_w4cVnpL8d546pwjSqSd
X-Proofpoint-GUID: peyuK8jgRm2V_w4cVnpL8d546pwjSqSd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080117

This series adds support for the Global Clock Controller (GCC) and
RPM-managed clocks on Qualcomm Shikra SoC.

Qualcomm Shikra SoC details:
 - https://lore.kernel.org/all/20260428-shikra-socid-v1-0-6ff16bad5ea2@oss.qualcomm.com/

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Changes in v5:
- Added missing RF_CLK1/RF_CLK2 clocks support for Agatti [Dmitry],
- Fixed RF_CLK2 rate to 38.4MHz, applicable for both Agatti and Shikra.
- Dropped Shikra RPMCC driver patch.
- Updated Shikra RPMCC bindings to use Agatti RPMCC fallback compatible,
  as Agatti and Shikra has same RPMCC clocks with above changes.
- Link to v4: https://lore.kernel.org/r/20260605-shikra-gcc-rpmcc-clks-v4-0-a0a7bfb44455@oss.qualcomm.com

Changes in v4:
- Updated GCC critical cbcrs list to add GCC LPASS clocks which are
  required for Audiocorecc register access.
- Link to v3: https://lore.kernel.org/r/20260601-shikra-gcc-rpmcc-clks-v3-0-76c455f5d579@oss.qualcomm.com

Changes in v3:
- Squashed GCC USB3 DP PHY reset support changes and picked the R-by tags
  from the following GCC USB reset series.
  - https://lore.kernel.org/all/20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com/
- Added R-By tag received on v2
- Link to v2: https://lore.kernel.org/r/20260508-shikra-gcc-rpmcc-clks-v2-0-83238ba24060@oss.qualcomm.com

Changes in v2:
- Dropped defconfig patch and enabled driver from Kconfig [Krzysztof]
- Updated GCC bindings and driver patches
- Added R-By tags received on v1
- Link to v1: https://lore.kernel.org/r/20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com

---
Imran Shaik (4):
      dt-bindings: clock: qcom,rpmcc: Add Qualcomm Shikra SoC RPMCC
      dt-bindings: clock: qcom: Add Qualcomm Shikra SoC Global Clock Controller
      clk: qcom: smd-rpm: Add missing RF_CLK1/RF_CLK2 clocks support on Agatti
      clk: qcom: Add Global clock controller support on Qualcomm Shikra SoC

 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |   65 +-
 .../devicetree/bindings/clock/qcom,shikra-gcc.yaml |   70 +
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-smd-rpm.c                     |    5 +
 drivers/clk/qcom/gcc-shikra.c                      | 4431 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,shikra-gcc.h        |  263 ++
 7 files changed, 4816 insertions(+), 29 deletions(-)
---
base-commit: b99ae45861eccff1e1d8c7b05a13650be805d437
change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

