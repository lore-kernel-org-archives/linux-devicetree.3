Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663293E1D1B
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 10:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777459927; cv=none; b=iGSweR3YzIzgpGqX3VNMdx/qyZutw4XjH9zV6uryVK6PVy+tDGIkSgh6JY1w+hHNKhdEcapt9QF1fkopYhLhrZURso3svx3TEcXckYMX9W70LW00Wr5W6ucPaaxg9Y3ncNqw+nnl9TED/Q4iQM4rkzWpSAbDS8nStMms6IioWQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777459927; c=relaxed/simple;
	bh=EWjSijfh5YbT4XwQ+bM9xdGSiunXFV+lVP+JIiSqvGI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TD0k5PB2/321iq32vou1RuniPbjbSwGc2+eV/6eGKH7rBWHDocdrU3SUWvhz+vE6o8VkeGI/H/tNab6jB/XfDaPwsMNB0Gf1pnpytW/4PMaMCRWUiZzmDjSV66EG7R1JqvN00Y+I4WxIU1iVq5KcArW5nCyHOC8+iN5oKNyuXRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oewXyfUI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YmFKwi6/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oewXyfUI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YmFKwi6/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pv2N4001889
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 10:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SfuPAxswSKgB66zXlIJSMB
	HWjJ2M2YWduAKhLIqYG50=; b=oewXyfUIs1o0GxKCgjXo5uLU3FMisq/CAtQWg4
	qk5P7k9RCm8R8q5/xJO/hV+lA1UzE5T5aJ5a3dRvoe3EBvJIxYERKPGLDO8U9Fzp
	LDr5QMI0bBGFbfsx+GJvzdk1xgkAp834Y8mFFEEU4q1DtEPX9dWr8mqt3ydYVEa5
	qfM1Vs2ibWcoSVd0usbrl/TgFQ3PIuEIkr2gYCfHgF/3UumD+QWjyTRSxRcRcrbx
	YAF0SPCGbQU+gzrnySepEeur+QKAegJDPhOwXp5IPtRhZvN7P40RKuRoyBTLZjnC
	9knYdf1EeJpMqCVMSZTqqip6PhLhExl/D3kyVw1R2772cQDA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du9em1u2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 10:52:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b454cac322so117654065ad.2
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 03:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777459925; x=1778064725; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SfuPAxswSKgB66zXlIJSMBHWjJ2M2YWduAKhLIqYG50=;
        b=YmFKwi6/BDLAQ/Hab8Uei3YEI2qdy1syuzpcGthFE3fId3BsdM4tY/+qB/Xmr9Y4jf
         rTu7XdphJE6g2wV0JE7pWZ9rOMBE1d42N1rc48ZBjXSvCUrWtVVmQdme6ztwSk38i1BG
         rWa9jfS3T9W1Ki2MDxr1Hy3Dbsc5+IxXTeZsRedeILt75gfFNPTrVkqMUS8P+cDPsbPy
         8cMU4txCNm6ggxmZpgpCwkpitWarCOKqhWljvfkcOyJ0Gu/B1dDIEzSeUn+neaGkI8mb
         dSuxAtRNYoYnUlaeEuBM+bkj0ZwqaG0o9Jw9hvCOmQyM6cbBMxm4XclvL9ekX6ZVrQYI
         iyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777459925; x=1778064725;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfuPAxswSKgB66zXlIJSMBHWjJ2M2YWduAKhLIqYG50=;
        b=riexduN6Von0VSHDNscsa8+twx7OkMjmb+bwiVGKZYcRrfD0ATD6bVxIjft8f3FizU
         shG/DoWaPp/t4HjthyihGlFctNVcKGMB1hW3S+nR7M8KvFutIDesMb23G0Od8RAbMLq4
         o339rwmcBz/Nh0A+pvRAnBhJ+Gor4ONmfKOPeFUZqG/lV7oj9TxBDAZYCajqyVmWZ8Ax
         JyWyn+VqAibhTMLCmZw6WTAS82bUTBOc4xPfnVKrwCPl0+UH9795btsfhGD3lxMXSdCd
         p9sN19uxbqAK+vMoEm1z5UUJC0Cw/o0o+aBuZybyZYgON2t0a/LwrcUeOL9ZeOlj05lx
         SZAg==
X-Forwarded-Encrypted: i=1; AFNElJ+3237F+9En6edMrIdqk0vaSAZHg1vZP7Kusb4Lcsi0S7xOkqjClgc9jm8Ui6gnB4U/POgetkFi39UK@vger.kernel.org
X-Gm-Message-State: AOJu0YwakiX9UQS6AaDIkBzezEaQm4pzKY5asQkvZobpQO18TW2lt7mY
	AKzt7b6bOFIDg4yKUJGWpjOQx0NVZF+scEL93rAlBIzNQmNqImB1ur6lM6G72/waKNI7qMyQeG9
	Lp75PtFwUFMHbwQ46bd9KFihueGzXztp5zcx8eJAEFgYgq1NahReQRC+MjN6dnmlI
X-Gm-Gg: AeBDiesizrnLSLacEyvc2yGjFBGzk7IQAk++AhD1uervXrwvvNdS9bLJGYovXzHmP4o
	9B7o8HKz4BTjbwPVKEOxRbt1AMF1gJnW4blpp1Z5FrZQ+VoYdQ0Hu3ylhNUb3N7iCHbBo1f7d9T
	tRe3tFIMnUYhcUQhVNrxA2TBUsd3PqrP/JiKV64YHpENrhbzA5r2dPy+tmD6ZekxdR75kuGf7WY
	z9LE9KH2oNbW+GJz3jQIUj4iowJ5t5Bmg339GG6ek1CfLQDFgMwvfSziJE4nEUw6BzNwVB8XTtX
	d1DOinKOpzAunWINI8ZbmnhC4/lIUtiG5UFJHHOPB2up29jwoIUQ/7eIpQLG9h160tARk1C3RJl
	6mnsQjuHenSZmg40kTKtenIgkfafzpTWEaKn2TZL+vGPILzR0tfyNf4kKE0txpUA=
X-Received: by 2002:a17:902:ca15:b0:2b4:5b1a:d09c with SMTP id d9443c01a7336-2b97c400babmr48210815ad.15.1777459925082;
        Wed, 29 Apr 2026 03:52:05 -0700 (PDT)
X-Received: by 2002:a17:902:ca15:b0:2b4:5b1a:d09c with SMTP id d9443c01a7336-2b97c400babmr48210525ad.15.1777459924591;
        Wed, 29 Apr 2026 03:52:04 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988772e9csm18316715ad.9.2026.04.29.03.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 03:52:04 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH 0/5] clk: qcom: Add RPMCC and GCC support for the Qualcomm
 Shikra SoC
Date: Wed, 29 Apr 2026 16:21:48 +0530
Message-Id: <20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMTi8WkC/x2MSQqAMAwAvyI5G6i1CPoV8aA1rcGVBEQo/t3iZ
 WAOMwmUhEmhKxII3ax8HlmqsgC/jEck5Dk7WGMb42yLuvAqI0bvUa4902+rojWtozmEUE8Gcns
 JBX7+bz+87wdNVaWDZwAAAA==
X-Change-ID: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=bvd8wkai c=1 sm=1 tr=0 ts=69f1e2d5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7Nf7qm-7OTtRn44RyKYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: G78m_eOJRPUhRDsNuWO2-GpFh9MVH4CE
X-Proofpoint-GUID: G78m_eOJRPUhRDsNuWO2-GpFh9MVH4CE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEwOSBTYWx0ZWRfX2aJ6ExI+Tioq
 3ozikmfZQj7MnAMvrDCTBPoLMixkcPWbnLpER3T7Pzp0a4xq4CgJkXuxUV7xx03MibMDNCUp9yB
 ZgdVIeNUGnnibPZ0xbo+EAv8B7LA3csAymhP5ML/ON/ccMNkGGxaUNrTvws+SshD07W6XhILNa+
 H4+6YLVOfgzS4ocRPTZhPsf7tZtO3+7A3urRMSoc+Rsh6huCUCwjO6q2I421Y4BHQDiekFkq+Cz
 nBGQRDcH1c46Mfyzuzn6vPJnOfeNFBrmJ3RzGQJBsIPAKPoh62I3sXjHRnVNLwr8lX6tOI2M6SA
 0qxCxqTJqEvVlg4CCOtPWzkgXXqxHRdfopq6pOHcNVhk6k1CE1S+zFUox6eNuP5JXCXVibqTHve
 m7K8JIGTEvCKBlzaH38iaE4Ba9tzGbjv5sETKtbDhI76IjhZUdzukR2TUYbLw4ljt3TMnOnr+WC
 teKpBSmQ42I6kXnPjjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290109

This series adds support for the Global Clock Controller (GCC) and
RPM-managed clocks on Qualcomm Shikra SoC.

Qualcomm Shikra SoC details:
 - https://lore.kernel.org/all/20260428-shikra-socid-v1-0-6ff16bad5ea2@oss.qualcomm.com/

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Imran Shaik (5):
      dt-bindings: clock: qcom,rpmcc: Add Qualcomm Shikra SoC RPMCC
      dt-bindings: clock: qcom: Add Qualcomm Shikra SoC Global Clock Controller
      clk: qcom: smd-rpm: Add support for RPM clocks on Qualcomm Shikra SoC
      clk: qcom: Add Global clock controller support on Qualcomm Shikra SoC
      arm64: defconfig: Enable Qualcomm Shikra SoC Global clock controller

 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |    2 +
 .../devicetree/bindings/clock/qcom,shikra-gcc.yaml |   63 +
 arch/arm64/configs/defconfig                       |    1 +
 drivers/clk/qcom/Kconfig                           |    9 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-smd-rpm.c                     |   39 +
 drivers/clk/qcom/gcc-shikra.c                      | 4428 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,shikra-gcc.h        |  259 ++
 8 files changed, 4802 insertions(+)
---
base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

