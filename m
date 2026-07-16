Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D0E32B112
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 04:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784174892; cv=none; b=CeodMi9hn6P9Zghpkhq4f1MZ0ApqnynF2zKuqv6UTHZtL0TOcegO3gGLonkhUWvw1uGA2PFmQkRA0ZlWdV+jP9zAMz2lmfo/M5pbttrzdVv09qfIXBiQm/I5nn4PN/FApy52kox7JvLgvVpwRmmwFQxCEhmPjXOxLRNrQFd5uFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784174892; c=relaxed/simple;
	bh=qF4D0ehqJD4Hk8KtIARlnaR0gTLZFdEcrxPwtkwtsgA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ab8h+LScwaFOT0xg1UITElL+2cAlBEfCRO3d1ZmvUCSxv7v1odTZYaLVn+rBz7o1CS77SridkYo/v5quaQIKQE9jxwsnxQPqlihQMdfEbSJY3AIyzMGu/w/+8pwtTEYFrlFYD1yxDVVf7sGBjVWQsh7Kj0iBQH0A0pW2ZqpQOyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AcBbn/RU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a+JxGwHW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AcBbn/RU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a+JxGwHW"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3wAuX2686276
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 04:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=scPxfUsXjJHWYm0pTnIWTb
	7W4QeFQK6ovy2iE3Yp0EI=; b=AcBbn/RUirc6zmUCPsGyPVZdQCUeOvUCADwkT/
	GxJDdUqk42x5x+Wh0GscYCmJXi2AuMV+bhGN8zwbCPFRuNzvlbItIyH3tKI1bvj3
	tpPTBJvYCMrJgfDWIHRZOoOZ3bLNXsr9CEQqZ9cO2aGXCs0AXYalwrAltMoMK0Go
	RVburkAH1h+7nv+v21C9gGKWBU3jbHMgJlJb80hWlMQyqZsb1tPKHfLsJV/+hAlA
	joDVBRKvPOQ/lFB0YDnYHLoBSW2lutryPZz3J0jESmBtyMSX35lLAdxU7zNnJoee
	cSoHoiwHtoiMPjrAq99DBWq8em+TT+cKEwC6ykktG5ntCGHg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feq3pg5m9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 04:08:09 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e2237bc43so3704925a91.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 21:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784174888; x=1784779688; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=scPxfUsXjJHWYm0pTnIWTb7W4QeFQK6ovy2iE3Yp0EI=;
        b=a+JxGwHW3b4stPFwK4XnC3VbNuDZPZuxzwDLKrw+kP3KWY098do4qccoNrHjlS/aZA
         oHHAXB7KefEZ9JXqLQOe6aPMsR+07U7ZEjPu3od46cgXFzMuIl/WvqDKhAZmSUEjNURD
         nxtnD5cGCV6xX623TRdzKiAFwhuNDKy6YLgOpyuXFAkVgDkMB/MUDavRz4/sccCP5BC3
         ZK9ueehQVN4LtFZwoiktuoGwQqR70qnoS23NmHGpU9cH0ocSqvkt+5N6eAbl/N0QbIYW
         wxVAHqhX10HAZzsaQeyJkdt5NFYAUhoBm0xXAY9AOyAFufyZ9CfqFissa5Et8oCVdUMR
         yjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784174888; x=1784779688;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=scPxfUsXjJHWYm0pTnIWTb7W4QeFQK6ovy2iE3Yp0EI=;
        b=lSfWcL1CfgDagW/YdskHWpC7O2EYsGbkdkRAkjYuGZDsnuPLQT75uF0hvSAozsYFC5
         pWxtn4DBL5O+Ih7GDhD7CRjzhGNAalz+k7Fm9LMRhSW+XQeXAKWfqscIL8k9dBoGam9p
         ohU9gznXriddYxxE29/+19+1Hmjeqe+Oqz5Nd9fMyYCPGJSpz/uDS5XFQU24t1h01wKK
         JAitVka017KQf99DzzT03Wx03QoE9aipmbRKh9CIRystYdD2wfhfLn81cojh+Yuk2o7P
         1yACLN72ejUqr1Oh1vPI+vtrprO9R2qX1Tq+4jXJsSarVX9LDoc8+NO6usMAtxcOruo4
         2aoQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpz3CxC6ig0P1wZ6A21293vvYU2I58/zA0cKjrtwG/rYg83kkG6X4+uDGa3BoXPK6QYyAXwdz46tlNv@vger.kernel.org
X-Gm-Message-State: AOJu0YxM9RvFwuwoV7lbRA36ji7jkdQdXuJiJxcDnT9fB/ti20mv6JB0
	6Fr2I4W1mS6aT3+GkUIFMyEouB/2qhaKA13ANmfgIH/AX18z0dVNecZRmu4HJrVwLxgD+9cUypU
	eNfFyhdjPejO/uomTom3QbgSZpPYKn0DlS8FGvQlNXuiT1sH4hMI1FYwAl7UrYg+8
X-Gm-Gg: AfdE7clpg2SjIDvHRQk2vpgLGIwrRE8EzNSJGaakZ5RAvEnU/CjRmPuoUWpfaUrHI13
	+KTyaS++xCG7X42xxo/53wJ8rKAN7ETA2/pp1qXtoLJjrXgUFdfKr/PAciqil0oyQHyUm04vgXR
	FhI/ZXCWPsgIcYsDvXiCNg77CL2e0AXzHYMyqm/94AEY8rRygynOboLMoSbxHn+aTinjD240784
	JhZrVSwlKxMWfdD2JkLR2QXa1QXBG2tdN8GVDq4UnEQIpyvHU++9uG4qUPEbtSb3o/Xtv9fMM8b
	ejzIp0xsl7rPAFbvRnG48DiINXb0fZ34GVXIkKeg5dMdRS6JFv5kss6m0KPrqwkhah5/T6mxNwM
	9/Z7ZEmK+Scho9t9w/tPPIcj5/hCwPug=
X-Received: by 2002:a17:90b:58c5:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-38e17e44165mr9686998a91.21.1784174888436;
        Wed, 15 Jul 2026 21:08:08 -0700 (PDT)
X-Received: by 2002:a17:90b:58c5:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-38e17e44165mr9686964a91.21.1784174887989;
        Wed, 15 Jul 2026 21:08:07 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6a4779sm7623907eec.17.2026.07.15.21.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 21:08:07 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v2 0/2] clk: qcom: Add video clock controller support for
 Qualcomm Maili SoC
Date: Thu, 16 Jul 2026 09:37:58 +0530
Message-Id: <20260716-maili_videocc-v2-0-7ed5ab140770@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB5ZWGoC/3WPzWrDMBCEX8XoXIWVIsuWT32PEoJ+1s1S22osR
 zQEv3tkh9JTLwuzMN/MPFjCmTCxrnqwGTMlilMR8q1i/mKnT+QUimYSpIYGGj5aGuicKWD0ngc
 HQSMa5V3Diud7xp5+dt7H6aVnvN4Kdnk9/6glZGNq8cukiRayw9kP0X9x36B0qj5CaKHLcoM7m
 5D7OI60dJVrWzBGGxShsbURCL0yISitbB1AuaPvQVon2FbjQmmJ831fmcXe459BWXDg2EMrWw+
 u1/geUzpcb3bYgg/lsNO6rk/36SyEOAEAAA==
X-Change-ID: 20260707-maili_videocc-db0d6ee94cb7
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: Cb7jy7_BDEPjd5zie5ay6Qbfw85fAr3m
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDAzOCBTYWx0ZWRfX08s/Z9LMsgdz
 f5l46hXdflttOeKdBfUENdYy2KwEkmdW/gFY6vfgS/NtrfFcIUKS5sk0JLx1wjWCyfB4p+m9nhX
 RT2g9z23FXilGDmy0j+kn6b6E06J7iM=
X-Proofpoint-GUID: Cb7jy7_BDEPjd5zie5ay6Qbfw85fAr3m
X-Authority-Analysis: v=2.4 cv=PN8/P/qC c=1 sm=1 tr=0 ts=6a585929 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zXpIYuPf6sbHbxCr7fwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDAzOCBTYWx0ZWRfXwPRqlZp+K61X
 XJYVb+GeSV3F25dE2aj+vDDcOyKBlVC3d1oS7YfPlMGRQ0esfXIlwajYZ/ONOX6xOevbXCwyZeN
 Dr2FhRXDvV3IxRV9T7vLy62Ij4bXM2nG8CBn8EJLykHRgXpHydeF9fFjfaacyehCpL8NFsdg2qd
 BQBZ+CNYyKF5NoMHIxKu/tRvE/yO7PcLGNxeBgaDGqw2W96/j5seuAkBYdZ9OOMMe5cE3znCi49
 4vDlo7C6vDfnF1aAV4RSzLyFu5d8kuCq6GimQybCm8PXO646LEPV6P7jBwaCMnkBrY8gOWH0zcZ
 6FFl7k5Z3jKDTYtSArMAGkADObX2a8vofRUaa2nEGwRvd9IbPMOcGcJmYfO1aI0u3Aq+lh8KvYC
 x4FdA4xXcn48IGbu+9Ut5zYecJsoaJZQCofEW5pGakWGWCxQU+hXjBYNrXbsOEVQcY31V9sdOEE
 rlVl7AgczObNlD5I29g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160038

This series adds support for the video clock controller (videocc)
required by the upcoming Qualcomm Maili SoC.

This series is dependent on Maili GCC clock series:
https://lore.kernel.org/all/20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com/

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v2:
- Rebased on latest linux-next
- Dropped the explicit compatible check for required-opps in bindings,
  as it is already handled by default in the latest linux-next. [Krzysztof]
- Added R-By tag received on v1
- Link to v1: https://lore.kernel.org/r/20260707-maili_videocc-v1-0-ef0828c0bf6e@oss.qualcomm.com

---
Jagadeesh Kona (2):
      dt-bindings: clock: qcom: Add Qualcomm Maili video clock controller
      clk: qcom: Add support for videocc driver on Qualcomm Maili SoC

 .../bindings/clock/qcom,sm8450-videocc.yaml        |   2 +
 drivers/clk/qcom/Kconfig                           |  10 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/videocc-maili.c                   | 660 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,maili-videocc.h     |  49 ++
 5 files changed, 722 insertions(+)
---
base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
change-id: 20260707-maili_videocc-db0d6ee94cb7
prerequisite-change-id: 20260617-maili_initial_clock-c7e2b4530d80:v2
prerequisite-patch-id: cb2499a822715bf6d411ea000e525e5feab52e7f
prerequisite-patch-id: 4280283ee9f782a5ba46e4419ab0b7186add0211
prerequisite-patch-id: 3e9a75794efb1633818ffe387d1f4e5048c361a4
prerequisite-patch-id: 9a218f161a75924b8cc3fbae44007d0da7739d60
prerequisite-patch-id: 7e5ac7db1fba3258b45b689b11d0ca93d65aa38a

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

