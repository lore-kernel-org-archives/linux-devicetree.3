Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92623D0929
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212054; cv=none; b=t0+Ap1h/1R+5VJlzetUZvzX4TlmQlvvqovo6Szd+nYCPY3b2CRkiT3phjEnjOzafJuR/lBLBIFRfS+BQzZq33JXZngZD1tVor3HNlI8XovndWwGqUcsDDnVyaa8vXsL9L+UFiZtZas1QahLFgUq+U1rvg1xitsSUGAnX3t7wII4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212054; c=relaxed/simple;
	bh=CGKHmceFpiofqKPx4rDZhXK5Ys4QkIj93QxQBgPZLag=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=N2n89I14V2xdK2eJ8lqSaDz9SExmGuXYW01XSqArxktz470gc+D5OXIXseb9Bt3zui2kdGj90W7h64bUkfNToZ3pT82A9vHIh/Pok24H4av/OEAuNZRpOVfZI0gIqftJ1sD1ahDaWVVQxkhcVOH7NdfVbWe0RjPTnwJgBd8qIXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T9RYiuvp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EOQDcAA7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T9RYiuvp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EOQDcAA7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N7l1QS3229045
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:54:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/g+/cyyg8C+7YG3dVUIEES
	Jep77mWvEbhJS/dThQ1Js=; b=T9RYiuvpR3VoDX8YbH5ssVMj2bxEh9FSDiEDk9
	7j1gwGlSrnEoTQbEMncxpNKhFLx0+M78gksHdXUEk69Fci61bliFxqu8Q25tp+v1
	e+fq7GDyOmbhRvc7FSNJfhJGa1fm4VzwPCpZGyK0AJtKe8lfqxXWrCmlCzpR5kYR
	c/DX+z6k8Yl/sed9hpRwTcZt8PuN5tkj2WhDW2uVlxR6bYepnkdKZX+PAkXshKEE
	B7u6zj6b/xxkMNDS4bryhrFMFzVuY7G8I0lNFQCIyIhVPC8IoxFM+kabhkpI+hHU
	FCbxRbEmwqch6WztJfKqonxMDtRD+riDBupdyJz0eGn/X/kA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp29gs1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:54:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37d4f23eb37so4505224a91.0
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 03:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782212052; x=1782816852; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/g+/cyyg8C+7YG3dVUIEESJep77mWvEbhJS/dThQ1Js=;
        b=EOQDcAA7+fCYseBU4H2bASkKo7WNzYDLJioaKBU3/sCbqU6ZY6kHZmWRx7TEboGCc5
         0EM3CDuijAreWkPbTeSQiCETVxydkAxH3NxC0BMu9C3pK42dH3vC6RkBl7SvEf2YwAWx
         AVyZtqVTtEbgMziSbTOsMjEZJdKYaB5clt/z5lvFqDntSqTXNr7KAOjL8CZZObWYijRP
         m1Dnc8TUR1E0MpYvU39tgt4jxPgS44+VhdJDs91T9/z4TX+udoZVHrKryE+Pk6kk+hr/
         n06hWLhbl+JILarTXhMltaUP2Gy6nnLKDWP595UPqGnagZ9FvvGvt+RmcogngkJX6pbE
         zzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782212052; x=1782816852;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/g+/cyyg8C+7YG3dVUIEESJep77mWvEbhJS/dThQ1Js=;
        b=YQ+f6iYlpZQvr3+NQ3iDSDFaq5j35ictoUgQdK1iy9BHBCO15MbnM2KFAnKFvplByL
         xU3doCQ0fdwW6+txQfCPciMglXPXgkO4shvzbHdMi9t4kdZpFMmT3UcprRBIQXqEaHgs
         61ynCmAIhe85H1zDiCJyFl5gqEqOsi5W299UZZ0NGS6+heDH7Unfi7K6Yay5/cEKLOM8
         uWYLxulf/eQPz6rGR+JG5eOD9nlGHKJ8Wmb/6KJwvw0Mej0t+iUfmhYTfUd4+y0y28MN
         jhJj4tbzFUyKc4Qa4hSDuyaaIVysuzPFWgABJtytUl3JYVEprhufTXBFD82FeBy8VdRN
         zMlQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp1nbZC9gVQfwYiAws3Hl4wHHgISL489Wtm7elQi7Hcwo9/CdnAXP+sV4NTsPI23jMGUEuJtVQD/vh1@vger.kernel.org
X-Gm-Message-State: AOJu0YzwGY9ur2q88XtVMs1wCwI3I9SA6GfI9MsP/3zVAj1tos+mrQIV
	aB02F1Ey+JaaI/rSpBLnEiMhvyZwqPImJt1VavhAOC/azxhhqivwoN9jmcRJFaA0XzC9pzp4xD2
	I79KoaN8vABcBA9Q8alBiQUAkhPWysEsCBeoO56Fuv3cY2o2snsch65sZvY8degfb
X-Gm-Gg: AfdE7cnIPM9LkXiCj2fDGpUY61ahbbS0aSKsgXgxsy01pilYPlYXcWTNd0xEffr9oC/
	IBv0mf4KMKjRCUB7d1rYUdRXH/alNrrubCaUVEl7wr93a98kIPu6CPsexIbNVQJjpi29UVaywWf
	V6Ck6CFr+B9KuWnoePf0mtfY3SWsMDrFfhnizkvu2US5RiK/h25Njx6SMXIYPy1OmJwU/Y5gsYO
	OQWYhJ/M/U9pesN/WA0GAAA7N3jKqMUT2Zp2lHxDfZkDvLhkUf1SAlJqZVDHRdDUKUxmJvn0Auh
	dEiiPBXDtdc9cv8a0q0KbOZ6kXFrkTs87jUFKLr8VK/JmjsuzKOw46ZTMvI2K80n+tkW0w0dNi/
	4ZZiqQQ5eLu7j+CPbJTYCo7VZHoetEuKfniU=
X-Received: by 2002:a17:90b:278b:b0:37c:6975:2e3d with SMTP id 98e67ed59e1d1-37dd0d3de38mr2393204a91.8.1782212052122;
        Tue, 23 Jun 2026 03:54:12 -0700 (PDT)
X-Received: by 2002:a17:90b:278b:b0:37c:6975:2e3d with SMTP id 98e67ed59e1d1-37dd0d3de38mr2393147a91.8.1782212051621;
        Tue, 23 Jun 2026 03:54:11 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7437002aesm105788365ad.37.2026.06.23.03.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:54:11 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/6] clk: qcom: Add Nord multimedia clock controller
 support
Date: Tue, 23 Jun 2026 16:24:03 +0530
Message-Id: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMtlOmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyMD3bz8opTi+Nzc+DJDXcsk85QUkzRLoxSzFCWgjoKi1LTMCrBp0bG
 1tQBi414zXQAAAA==
X-Change-ID: 20260620-nords_mm_v1-9b7dd4f92d6d
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=LdAMLDfi c=1 sm=1 tr=0 ts=6a3a65d5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_t-zcm_tZIxzBNxMqFMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: wcvKUx4MdV8-Ufk7xOY2E_t3kDfIu4GR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4OCBTYWx0ZWRfX3XxxjOXPG5TV
 h2jVfRzqGpLSkEICtKKDEjC4qkdsaFqgNbFaia8u/YJvekgHAHgChku6L6y5W4Y+T1YSJRWCg1t
 7kxkN/6lqhNEDNr2d/cFK98FvL8UTDI=
X-Proofpoint-ORIG-GUID: wcvKUx4MdV8-Ufk7xOY2E_t3kDfIu4GR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4OCBTYWx0ZWRfX7mXLYsGzJuJB
 AU6aCl/E7gi7QNuQM8t8aFU2XL4BcMc6+eS/6urngCtpS6/OcbRdZfsA4kM1Rn9WyYrZ+XkBAvQ
 u2cVKS7oqryEN8FyyHSVjqVvgblpgtIIiQvo1gI+1OAsLUGojmpQ1obgl8TzzeSioSs6ja7QY/x
 TwgFoj/V7Wz5f0wkCKMsiyjXcx0yflPiAL7ZF0Y6BYXtDGgKBEnr57llcMOGfU/MePp1r4mErYH
 nc4APzj/nCxsyVj9DKohdUG5XebMPqBYFwGebYErq4aheuH5cUTvjGcR/tdZ5+WjQrcOHLSx0HM
 Vw9SH+FkQNY4L5iAx2Vu/5vhL+1kbw3Gy9cEwgwmbQqpG7EMCOgk+fWOBzuZuUKLvnjkG8wahVU
 mW9UNO9DREBmvkeGG/MktS0IGZCXmJkXqqfwNhIGfMT4t9bPNmypgErCoErnkIPxxipLVo7cs4w
 cYg2MVA15MKvo3Q7MJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230088

This series adds clock controller support for the multimedia subsystems
on the Qualcomm Nord SoC platform, along with two fixes for always-on
clocks that were incorrectly exposed as controllable branches.

The Nord platform is a multi-cluster SoC that includes dedicated clock
controllers for the display and graphics subsystems. This series adds:

  - DT bindings and driver support for the two display clock controller
    instances (DISPCC_0 and DISPCC_1).
  - DT bindings and driver support for the two GPU clock controller
    instances (GPUCC and GPU2CC).
  - A fix for the GCC-Nord driver to mark PCIe link AHB and XO clocks
    as critical CBCRs instead of gatable clk_branch instances.
  - A fix for the NEGCC-Nord driver to mark the GPU2 CFG clock as a
    critical CBCR instead of a controllable clk_branch.

The two fix patches carry Fixes: tags pointing to the original Nord GCC
commit and are candidates for stable backport.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (6):
      clk: qcom: gcc-nord: mark PCIe link clocks as critical
      clk: qcom: negcc-nord: keep GPU2 CFG clock enabled via critical CBCR
      dt-bindings: clock: qcom: Document Nord display clock controller
      clk: qcom: Add Nord display clock controller support
      dt-bindings: clock: qcom: Document Nord GPU clock controllers
      clk: qcom: gpucc: Add Nord graphics clock controller support

 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |    3 +
 drivers/clk/qcom/Kconfig                           |   22 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/dispcc0-nord.c                    | 2006 ++++++++++++++++++++
 drivers/clk/qcom/dispcc1-nord.c                    | 2006 ++++++++++++++++++++
 drivers/clk/qcom/gcc-nord.c                        |   37 +-
 drivers/clk/qcom/gpu2cc-nord.c                     |  546 ++++++
 drivers/clk/qcom/gpucc-nord.c                      |  593 ++++++
 drivers/clk/qcom/negcc-nord.c                      |   22 +-
 include/dt-bindings/clock/qcom,nord-dispcc.h       |  115 ++
 include/dt-bindings/clock/qcom,nord-gpucc.h        |   51 +
 12 files changed, 5360 insertions(+), 46 deletions(-)
---
base-commit: 3ce97bd3c4f18608335e709c24d6a40e7036cab8
change-id: 20260620-nords_mm_v1-9b7dd4f92d6d

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

