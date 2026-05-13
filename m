Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CFF2BE7B6
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778679655; cv=none; b=ZoAT1b1lvSYsLNQDCAdiXa8psM4BT5k4s5NMN0oEK92P4DzQ4qyPcr6jx9nOnusLUcpHCBKXgZ8gwX5nx+qjF4I0Uha6BADgYJDrZIeD3fcJjZneMDNjNbKhjnQ+MsMvsQYYHziOk73WtC6LjVrlLWTGSMcPPh2x1ahaJlm2mu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778679655; c=relaxed/simple;
	bh=oTkQmi/Uxg/MsPd7MCP2dQ4kUv6dyf90u6MlcCrioms=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IguwzWQPe+Z8/QOKZjxrZB0poPXczL8TNhpRWa8zHljHrRE2ZWy56gwxg6DWxkaBzRjOVRtIJGlz5095nVOYoks5XKmUxV4QA3xXTZHaFTJjN5r3Qp0eJZbXo63mG25FaNRX8to9t4SRVM482mZa0LVJ022R0jwQsi2gexoE44Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AnnNTWRH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MRDGZPgr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AnnNTWRH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MRDGZPgr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8mEd43474767
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZAgafHElfkN4za1YfuXxY3
	7xpnsh7yTHu2eNk+K1HqI=; b=AnnNTWRH3xJcWjMK89gbg1/AXsWZvT8f0RekuU
	R9EyhF6PyI/IMuyoEOCvKZ+jxU68ya1Hxr6AntL49XwZum16IeBr7A16DGtYTtQy
	OBJ/bv5xIggzcWcz6u69zEXrWPAzT9jqO33GmDEDoXEItW1Bx+y7zhC/+TIwFNzX
	v1FyOSX1dLwsOzK2gIz1lOfLjqwmwW2fqghiaPwO4Rrtnpy6ZrvTIUj8eztJCXNq
	31vNagttutv3/Cmc+nEaS2DlN5FCyOQ7A+62IjY4HfocUjpC+JB7f4aRSdnWMJq0
	BiCsWbvvVICxfvnfhGX/zWNgjJvomGyXb7OAZAfA+x3saiFQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p419283-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 13:40:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36642d2f4deso9912895a91.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 06:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778679652; x=1779284452; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZAgafHElfkN4za1YfuXxY37xpnsh7yTHu2eNk+K1HqI=;
        b=MRDGZPgrPw6eilZgVTU9etkI/NUWajeZOaNfOFLxylVaFZQbLbe9FxyO2HfJw6Bl46
         95WpHJ3/4kl+v337DO+cC1P7DytlSFIbSxSQv+kk4WS41HFu5uHAQnOvMBOL2RN/XlwA
         4GFzLoyOfuHq1v3DllCq0nlDkQyIpXYEZNpW2+E/uuanGLW6JzG9Sc33kf4sobTff07+
         SNXSNQenRpbhRk1ooNusNoCsLaxw7fK3+JUpgrOPPPkR2+9SXvnbsaUEOwMfP2aJDLJL
         pSvIFIbX1ns3S2rhvhgwu+iibwm3a4Fon21xdABEdK/AuMdbXXxLEJ6WgbE3wk+uO6wi
         /+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778679652; x=1779284452;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZAgafHElfkN4za1YfuXxY37xpnsh7yTHu2eNk+K1HqI=;
        b=eGy1SbbBs8Y887KZARhUOBt8zfpd+1tTF0w3trJvEtxTdDU66pgfz4aneukhSkSum0
         sPfHwUsG25kT0r1SVlNxKMiSawe8+BnElC1C0qyBYaPfncOrOafZp+u3KsEbnploxkhX
         tvGycX7t/jnGh4hIPc2Pp9kDiGNT/c3uhSmQ5clfDidsX+5MlxNA7E8AJisYdJqQ9Bij
         tLcMtYCwQP9GmzELkTIc6YvOnwtU05xOsxDwrxNDhY06z8LuPPH6m6r7TujaDnPbJZwq
         napXzHMFiIF/DuVZCbpeGXkkWhovDrcRA3U9tJdA6UxN0L2rP+bPV7US/gyhaTfDopUj
         JZGA==
X-Forwarded-Encrypted: i=1; AFNElJ8QYmC6E7H0hbgXm0/kWxKIN0g/2d2MTjCBG7JmJzkhVLJtUJqoNWwGw73QJG/79qzF6whplLSSmeV0@vger.kernel.org
X-Gm-Message-State: AOJu0YxYzU+Pzme2WStlpdX/LvaShJQFOBI3C3YyhE4+vB40R8hiB50y
	jCxfHZxDalTqJqPP6MGlxjYC6UBTZvavTs2Zo1FXK9sOibILCcaNjU7ifKspQdRmRhLkJD/QO8T
	80c9aBKP9RmDdllIHNo8zL1SRU/zNfIcnMZZEXidqyPFoctTKamesGYJf8w0SCKwvZKqNkwM4
X-Gm-Gg: Acq92OH61rk8Q7BeqYhKKYLJOtatFWK7KXAOJqRolb5hL091L0eLq9YkYTYVT4imbN+
	76p9kh5ysBCTwxvZXfgwi+3o0zzjB30nZkT3zs8wNS/E3GrpWzItLcVfE6K4GiVxUT4xNEkbJTd
	km0RvAlYWORcTkwIdevHPdO3mJvDx7NTNroHgYFhh1YVZ6xIl/MbSA74yAhaqCt/7tVwOdFd6CM
	glvX9GOG/52+YGHjDGgIe15EzltHi3SEtR8iojV7m5oHBnMBEeoFh3v1xCJUbfriX4qHKp6apsM
	aNO+GbwixwtNg6aXQhZDHn/vkqV+b99ziI9luOW0TnYwBUnXbK4D0zGVxiJhGiLHTmNHBFk8BkN
	Yznbm48pBHSWK/ABfwL+i+zJVMYOqvRUkIy4uE2/bfD+y29+/NbYT
X-Received: by 2002:a17:90b:3a46:b0:366:4782:1379 with SMTP id 98e67ed59e1d1-368f3e4758emr3971476a91.24.1778679651692;
        Wed, 13 May 2026 06:40:51 -0700 (PDT)
X-Received: by 2002:a17:90b:3a46:b0:366:4782:1379 with SMTP id 98e67ed59e1d1-368f3e4758emr3971434a91.24.1778679651211;
        Wed, 13 May 2026 06:40:51 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368b00d2131sm4317403a91.1.2026.05.13.06.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:40:50 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH 0/4] clk: qcom: Add DISPCC and GPUCC support for the
 Qualcomm Shikra SoC
Date: Wed, 13 May 2026 19:10:35 +0530
Message-Id: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFN/BGoC/0XMTQqDMBCG4atI1g2M+ZN4leIiGRMNVmsTlYJ49
 6ZK6eaDd2CenSQXg0ukLnYS3RZSeE45yltBsDdT52hocxMGTIEsOU19GKKhbUgzIu3mNa/yUiP
 jwMBLkj/n6Hx4n+q9uTq615rx5Tr+7bo4ZcH0T+4yGOcxLz6GRBlo4VrvPbdQb+zLW5Mcxec4h
 qUutK6EVhpLAbw0oKtWWSEt2sqAslYYI5lEAaQ5jg9pqujC7gAAAA==
X-Change-ID: 20260513-shikra-dispcc-gpucc-6f59c23020f5
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a047f64 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Nlnp6rM-Y-S_hK6644EA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0MSBTYWx0ZWRfXzMulAn5Pq0oR
 mi+eCW9J5dz5H10tkVABFgG/GcQbKAw49ZTMXUR4b5n5pmpmHBwonIw+2gt8HMqGw9LG8ENzVe8
 kspRdOjjSnwlk0lpRwPNQkHl0I+08DCB6OM/j3bIpKB+hLPsp10qtfnXtk81ncivPtLxawp+rnm
 4nH5uQASqmz41Fk8Tvu/O2d+gIYsOZrG4pWTl7V+TOoEnHDzcnj1ngb0qgQ2iRV+rwjL5xpUW4C
 owO7LJ6dVQhZzUYkgL9540/VY6gitP8zUCBYBdLSNtoPqdEOPIcbA8ftumhlwUUbpQGOHJLnIoF
 7Zb6QPHQYl63xPFOLWf2OwS5cN0KKgGKtysNooYA1dMdT9qYoYAA93w8ChS0RtvitFv0V6rPYOX
 3GtN3x+k38JMicq1totS99EPOsaSxenoZygFVR855s3K5ApgmTeqE/9xreUYHtEJNNeGJ0BqL0X
 F372UvZDB9IM+ON8onQ==
X-Proofpoint-GUID: _sVMt-CFZaentj3bNS-06xseTS7WaSyM
X-Proofpoint-ORIG-GUID: _sVMt-CFZaentj3bNS-06xseTS7WaSyM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130141

This series adds support for the Display clock controller (DISPCC) and
GPU Clock Controller (GPUCC) on Qualcomm Shikra SoC.

Shikra GCC series link:
- https://lore.kernel.org/linux-clk/20260508-shikra-gcc-rpmcc-clks-v2-0-83238ba24060@oss.qualcomm.com/

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Imran Shaik (4):
      dt-bindings: clock: qcom: Add Shikra Display clock controller
      dt-bindings: clock: qcom: Add Shikra GPU clock controller
      clk: qcom: Add support for Display Clock Controller on Shikra
      clk: qcom: Add support for GPU Clock Controller on Shikra

 .../bindings/clock/qcom,shikra-dispcc.yaml         |  62 +++
 .../bindings/clock/qcom,sm6115-gpucc.yaml          |   6 +-
 drivers/clk/qcom/Kconfig                           |  20 +
 drivers/clk/qcom/Makefile                          |   2 +
 drivers/clk/qcom/dispcc-shikra.c                   | 565 +++++++++++++++++++++
 drivers/clk/qcom/gpucc-shikra.c                    | 406 +++++++++++++++
 include/dt-bindings/clock/qcom,shikra-dispcc.h     |  39 ++
 include/dt-bindings/clock/qcom,shikra-gpucc.h      |  37 ++
 8 files changed, 1136 insertions(+), 1 deletion(-)
---
base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
change-id: 20260513-shikra-dispcc-gpucc-6f59c23020f5
prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v2
prerequisite-patch-id: 5a0fbdd458785da2d0e850c851a05046672ecadf
prerequisite-patch-id: 1f98e515a52bbeb25e2a960a804afe16c6a472a1
prerequisite-patch-id: a64476b2ba6e0f2a55928baf72ec32672ee0123c
prerequisite-patch-id: d0c8651205232862b40f942929e1efdaa3084eb3

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

