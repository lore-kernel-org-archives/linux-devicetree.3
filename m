Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6E634B66F
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 08:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328257; cv=none; b=lsa9eM7k+KV47f9jQTLjWfNFbA50UWXDqwR6cHaqmMVhi/yAjIAMJLXI6ariw66sxTffsrrKqPZ03jJ1O1sCMNuyYmPHlzfmp+OXR/eK3ffNy5u2/9WW8Tv2/UHQp+aapgVZjgv94e+vJdvQBSKEJgZJKCYiR+nTxSqmKpu3cxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328257; c=relaxed/simple;
	bh=ertaPo2KfN6+JLmWIpS69H7gAWNTbsx8xyo0q5AQDO4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=paKsc9wQ0dsXE/D0TIwWVmP+2Oj+jELafU/kfiWOyrErD2zV5nQUz0AQvURsamflKia6hnYPplQQMJ1dfSA6zfGnLE3sqJoVo9864REhYlGN3UhfLBhHVLzCvbZUas5o7bcWpeNoJJKjqyhGOSO5nAGpcYYJTkOL7XVanPQwDHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dAwi0tDU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QXKD90ze; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dAwi0tDU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QXKD90ze"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6668tcNp3615008
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 08:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hr7s0DYUE79Y/NJ7lVZGxq
	+zF8JIOLk+qWxVTt/UsDs=; b=dAwi0tDUh4fMOkvGvPfEhPUHCGxzGUWFpUfHnT
	jpWZ72bvEc7el762ivyml8+7LTXD2fRbpDFx/uv4swPPR9RHO029Kq7+Z1BsCG6A
	Ji71WEJpDfzmYHo7asA6Eu+xSHAi+3BtyZjJ5UgMOC8Pl3PWVmEy0SGDURzbk97+
	u4ZXsPe3QjP2rNz4Vwia7RAt/sA0xmLnOtrP+Icl1DBl0sk+NJjUsdzevGWdSyBi
	23k8fWpX3Zzl5wUNgSCEedrzyxcNo4x6nxjvNFZCBuXDegKwkIeeTdH3r2bc6Ecx
	opu6JzgMlxCGsqdHwW/QrcfojqeNOYCfhMUcPblNZ+UzogPA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6srvnfme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:57:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c354050c34so30220485ad.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 01:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328243; x=1783933043; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hr7s0DYUE79Y/NJ7lVZGxq+zF8JIOLk+qWxVTt/UsDs=;
        b=QXKD90zeO0ESzrUuQ982g93S2OvsciREJceeKQeM0khfn4auJmTXMHB47aVKppoJrs
         geYZlBSdo34mWeqP/sDdaTEtkcm17gCkLN2GMCWqZ6QndKo+JUGJ1CBqb+7M4GvJwqJI
         e46GWIUotpdpgqvS1gwZ2EvxY8mpEIq0Scs+AxHQNGGNPhHqRt0RB3RknfycLBeeKnOT
         oyhTifE9YnR7yHGEBO1UVdb65tVhtfYZ3sfzX+eWkpietAW/Fm0PAW7jWsrg/LU1468m
         +frFEwFXumyX8C8pAlgpyGx3EGJE4AIWNec9txsIPKSkmo7D7GtIZ74PuWHx/ojOmaDM
         eAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328243; x=1783933043;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hr7s0DYUE79Y/NJ7lVZGxq+zF8JIOLk+qWxVTt/UsDs=;
        b=W6Ueq21LR1p5Bra+M3JxuJazdj75vCrjqbA0Gw1oTPxSRroSLna9OfI4v1PgxC61Lp
         6lr3XiktSx5+fkZv1aoJBry/ZVqJxe/G11ZmRm7RdU3nxTXO4UrsE0Z+Aen56Nn/8QFU
         FomXVsn+IgLnYHr6W8gPLZE17v1UzTfZIsQs97Dol78tYdwsVFD4x+tbkXhIvhQUJqbZ
         k2IZNLntwKAPLhupNMCT4UuejElsRpNHjIkBmP0TIpW/9ywoBpLstRFB9HrWkKVxbR/g
         SD9JECD5YzhmqAVVTrMgTCxJPGrWZoUh3QwIqEqhg3NKh77E8HiBPzvqGmpcWFU2xwsW
         4FBw==
X-Forwarded-Encrypted: i=1; AHgh+Rrs8aXDx9NYQ3vK3EvX+Pjze4SMQWbpzMBQIZEEjgukRRPbKmHYU2e/Wt1f83+H2LWKSsazlpDYVuBT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1xkV9QFw5jEeh8k7Paih8WF2sepTiBslRo4HYv+yTqCRFnSjR
	KdSzyYAH4ZvAQANl3EKgF1MZQ6zs0FAd2qSsui1sB4aCXQ2RheJHTdz+KyTTOgUBM0FM2eCtlaS
	AQgIBd6WRin88sjxTatMcJicupoSgfjrQt2Oo4rRoFgTRlptaI0zWwQp3qnodUnJN
X-Gm-Gg: AfdE7ckAw7j6U4kNjYITQnj0nRhEEeDW4NC+F/W4Qt2cTzByloX8nxwJCS80jVZffLj
	qhraoP5qF1uCPj4tw4K/7ufQQTspJalKyOHb98ysq6Fl/iGhr9EzOkg60wH+mLTjTpkFzxCb+hD
	EuY3W22cI6kpNp0u1VPtAsr/+bgMRBGzfnkjxfniY2UYXadL7aqKC/mGQvHbbA/6PBdBgB4/n3m
	SR6DHjLZKopDVrQiKbR70uOKwik2q7fL1kwp+VMMak9sgjE60M2lxdmHzPb/Dqecdfwe1RegO/p
	s8zYEpn7vcOga9w9vwXyAeKK2bWbLyWYjltt2gG6OV9t3Fvxsi/1umAPq5a3XIVN/A/ExG8AoF0
	BpiyaKGlFQk6lv17Iq6FZl5tNt8/SE4rG8u0=
X-Received: by 2002:a17:903:2344:b0:2c9:e86e:a9f3 with SMTP id d9443c01a7336-2cbb1e32c78mr86505145ad.10.1783328242991;
        Mon, 06 Jul 2026 01:57:22 -0700 (PDT)
X-Received: by 2002:a17:903:2344:b0:2c9:e86e:a9f3 with SMTP id d9443c01a7336-2cbb1e32c78mr86504885ad.10.1783328242550;
        Mon, 06 Jul 2026 01:57:22 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25f87sm46463665ad.3.2026.07.06.01.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:57:22 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/4] clk: qcom: Add video and camera clock controller
 support for Nord
Date: Mon, 06 Jul 2026 14:27:12 +0530
Message-Id: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOhtS2oC/x3MSwqAMAwA0atI1hZi1fq5iohoGjULW2lBBPHuF
 pdvMfNA5CAcoc8eCHxJFO8SijwD2me3sRKbDBq1wQaNcj7Y6RLLnmii+SBSbd0uRaXLDtFACs/
 Aq9z/dBjf9wOUpPVFZAAAAA==
X-Change-ID: 20260706-nord_videocc_camcc-858b14239006
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a4b6df3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=I6YkWGfIfrbP7rSzwlsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 21-s8fxPk2nTdh_iuFzCTv6oQ-pSmZ5z
X-Proofpoint-GUID: 21-s8fxPk2nTdh_iuFzCTv6oQ-pSmZ5z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfX2IcoL9BCmpXj
 xAwTit1VbSAQMduIT9k2Z7HfOdCF6zJZm+vpSBac5jkzrvlV+PDaqR37oCHrBipg54Gyydc87Bj
 Qoz8w5Rl9bXWF2i3dJuFpkBcVnOy7X7E5dQbVyciFamAOhx3PfwOnwraIktFz9pWCRIkPphGZdM
 pVtYfG6ls7WPmKDEpN6Bn7gZUTthwITHUMoGUzndLXoSg/1oPEOZ8BeIRmiNu7D+gwmcGmbyuwx
 UIVGag4NZR5Q7unh4+gvvvmPlZSmaz95BeiTg7snjg+30c21BSJqhs/BlVlXqrUmau3bRU0N63a
 L0LkLo7G+VNm/HOSixMPBQHAz4zcgvpnoOE53U37QvEi4r76Uk1xaNhx/+nMv4IItmbiEfzliXT
 cbAJ5JqcRdXqnS1nQW3KZxBCm6UTqXaR324GVlZchCK+kAaH0ymwGFxCX8ZS1TANMcUoWtb5R86
 ll8DNMML9kDAdl0q/0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfX3cUujcyDP4sT
 aVkbvvtNrY2Bu1qjJYIUuZ7U7XR/Y4TUmNmyYgQFztaS5/2Uh9oDpUSeVdBQE5kAN95gDCyaw8A
 GeodIdH6Dx//aVZS+OKcv1mKNhPAuB0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060089

Add the DT bindings and clock drivers for the Video Clock Controller
(VIDEOCC) and Camera Clock Controller (CAMCC) on the Qualcomm
Technologies, Inc. Nord SoC.

The VIDEOCC driver enables video clients to request clocks required
for video encode/decode, and the CAMCC driver enables camera clients
to request clocks required for image capture and camera processing
on Nord.

The series has the following:
  - dt-bindings: clock: qcom: Add video clock controller on Nord SoC
  - dt-bindings: clock: qcom: Add support for Camera Clock Controller
    for Nord
  - clk: qcom: videocc-nord: Add video clock controller driver for
    Nord
  - clk: qcom: camcc: Add support for camera clock controller for
    Nord

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (4):
      dt-bindings: clock: qcom: Add video clock controller on Nord SoC
      dt-bindings: clock: qcom: Add support for Camera Clock Controller for Nord
      clk: qcom: videocc-nord: Add video clock controller driver for Nord
      clk: qcom: camcc: Add support for camera clock controller for Nord

 .../bindings/clock/qcom,sm8450-camcc.yaml          |    2 +
 .../bindings/clock/qcom,sm8450-videocc.yaml        |    2 +
 drivers/clk/qcom/Kconfig                           |   22 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/camcc-nord.c                      | 2941 ++++++++++++++++++++
 drivers/clk/qcom/videocc-nord.c                    |  507 ++++
 include/dt-bindings/clock/qcom,nord-camcc.h        |  167 ++
 include/dt-bindings/clock/qcom,nord-videocc.h      |   40 +
 8 files changed, 3683 insertions(+)
---
base-commit: 2b763db0c2763d6bf73d7d3e69665222d1f377cf
change-id: 20260706-nord_videocc_camcc-858b14239006

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

