Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4143E5A2C
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686547; cv=none; b=GzUwm4o2D2/xRg5Q8k/+IdyWKiqNaKjMopV3+VRf2Si9ybGyLLrZqiwrPE/uhpJCBxPz8CadL5Z1Wlod0rP5/j9Xk+T2QQpUQHfnHqZvDsogdhz+H1VDVP76DmQn9C1rakj5+ey0JwrYSewOI+THj0A3emE7xwcm/zt1VmNEWvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686547; c=relaxed/simple;
	bh=kMNSk39bNo30KB6WJu2vTf44IOSSIKHLbKFhKuRsR+M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I+wfHwwfj/6Z4LwTK1gSd4BpzaWz4k6OuikflgG/KVB6T7bPKp8fd1v99cDatiV1TldzNHPcVDQ87Gg6ELUuxJ0uCjsbPNxrosev2GhKn8T9J3ZUD9XP0yGccoTSlbr8vS92pJa9kroVhJ/kLDjs/erFJ5Ct6aC/v6sH4LunEJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f44m0/V4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B75nJDNS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f44m0/V4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B75nJDNS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D9jgvf3007378
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:35:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6AX50bGOYpZuXgoP20+PQy
	NY7VRPx6PEWPIE0dzplYw=; b=f44m0/V4a6Ms4JiVcPBEHQeUCOzZk1hCW4E3f2
	Zwpq4WEYPfVTUYpi4LHoxmfJHFq+WEbfwQy4h9iwTqq+z5GZNpMZFCr/kTmRlfcH
	DpiuUCa1eNyFs5DhVhQ4PJDNmKRWSquMCFNqhQFIf2vPqiKVRPPMFIa59SR1IwO/
	Ajp/Pz1wOPpoda7TfzKv4Z+AS+pwRkHODMB8XSpUELeK9aqxs/+Tc1eqRnMNNfWl
	SsXyzdAVvmmMyspCW85u1qcKyGKwVnYe8L9UILltizwW7U4LQiNtJ3L6V3dsZ2pE
	o2jR4an0KpRK/1cCuLKzc3f9h9clWBxptbB+EuADDLRfh95A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0hate-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:35:43 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6333021c63fso4651884137.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 08:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778686543; x=1779291343; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6AX50bGOYpZuXgoP20+PQyNY7VRPx6PEWPIE0dzplYw=;
        b=B75nJDNSuCUvaNoAvhG98XJQWNz4Ie+fjnsc+h+ZySk/kVwTEDVXkvme1mBk1+XVMV
         w2mUyv3hofbTJ7IYjD4Iqys+9+7oCjjhGHUyxmITEB3lOxjpYvVZJToyIXrFz2TUL/++
         auy4VOlo3aDoyCIVXaDiUMlyg8B9h/utgdVrJ/1/URJV7nB4Lh8nL2bhzzbTG3fosRDx
         ppRw5nHHV7fQgnl31nrN4L+pEQsOuQt4Y30kPZRE1foz4zI/1YxwHPxjRTtePdMJdVr5
         S+KrrmESJLR6rGP1J6ScOpo+KTxWuA+qqxu8fQ7aRYNNA0hgpv4geIztiHV2xiYki7R9
         P4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686543; x=1779291343;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6AX50bGOYpZuXgoP20+PQyNY7VRPx6PEWPIE0dzplYw=;
        b=Udi4ZOTdJWJZ7oeFc8XQ4JYirImhJJyjWiNJPbrGCX0SSVTEg42eFMfT6F6VlrSLMp
         eUaAI4hn1U4H/2uF2ueivog4zIzhNoj2ljQr0I9meZWJUsgTnoCN03G3T44EN/UQ4ZsC
         whfGJGSCODHV0YmY91k63R0dpxw4Zgdn8pq3eYrunCN1YkwSL34P/HZXalAm+3s1QW3h
         HQwg1uh7szeTtCdHktgB+xYvkx4bn1DX/NW7dz8BOwTLvnXR0TfqNe+emsKUOU+WuhN9
         0JMmifIPpIpOnToytlHY5/P0ehX7JB9OfNlY/GBHia1LCqbOlddKPn2mn7CcNBQmlWJ9
         33Iw==
X-Forwarded-Encrypted: i=1; AFNElJ+YgqbNTcIBAwapjBX2MrSZAa6gYaB+S6O/NvLco1CN1nOB7Yg18twGnSG9qbKR2APf6363v0/bGh6G@vger.kernel.org
X-Gm-Message-State: AOJu0YxGhfYuo1YsKhvPUrrDEhOTcMUyZJu2rYEYSQHhb3mzfUKBKZDP
	vaf6LBkfoYy75ifcz3a+ph33g1R/CsHw/HcykaVC01qTtunHL9Pt+9OGlPQWvmHC7EqDXcbnRYV
	bHgdHqaWH87hev2jciIvQAmiDMvxcsptpUlcF5ijnoTok8dXV17oTR79pPtAaai14
X-Gm-Gg: Acq92OHNMQFL8kfHRERhdqKveuehNkA92bYNwJ9WVm8kPpIYPLNj82m6oNePdcb/NTQ
	jxpl67o40aQzQAf7tR4O7zfhnQ2ZuallDvlB0D5Paz6gGv5bz/ol+8w/US8VJ5NNEmVLqGUK/I4
	hlB057I6Ufmb/MYDGS+wTLzAOtvmMDarTv0cmP8xWDhBGR0uKMwr+iG8dREjjoD/d/lUUM9MlEo
	ZSbsJKIG3UqPUWb3LomGLupXyz2wis9q8pL+j8Hxa/m5vkIhL61bA6XNIcjOuT3kKX5qNRK2yj3
	BVfYrDjs3use1tFvznu20umfxGdJEXDP2D/ae+rCqm9JOFY8a+gt5LNBJ1/vow9qzi268AFFznZ
	z5QgW6cqGLr46pgG44Jg+cagMZrkmMS+CofxM6vXntBVaUwECOQ==
X-Received: by 2002:a05:6102:84c6:20b0:638:944a:49a3 with SMTP id ada2fe7eead31-638944a4b17mr455715137.11.1778686543429;
        Wed, 13 May 2026 08:35:43 -0700 (PDT)
X-Received: by 2002:a05:6102:84c6:20b0:638:944a:49a3 with SMTP id ada2fe7eead31-638944a4b17mr455529137.11.1778686540123;
        Wed, 13 May 2026 08:35:40 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:63ec:4acc:c4f6:423])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f446ec6sm43165835e9.32.2026.05.13.08.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:35:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: nord: add missing define for the USB2 PHY
 reset
Date: Wed, 13 May 2026 17:35:28 +0200
Message-Id: <20260513-nord-clk-usb2-phy-v1-0-8eafcb2d5129@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAECaBGoC/x3MTQqAIBBA4avErBvwh1x0lWhROuZQaChFEd09a
 fkt3nugUGYq0DcPZDq5cIoVsm3AhikuhOyqQQllRCc1xpQd2m3Fo8wK93CjJiP8LKyWTkLt9ky
 er/85jO/7AVqBoYtjAAAA
X-Change-ID: 20260513-nord-clk-usb2-phy-3e60fb0c31d1
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: brgl@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=681;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=kMNSk39bNo30KB6WJu2vTf44IOSSIKHLbKFhKuRsR+M=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqBJpDbEKrugiY1HaXa3Mgrvl6oSYX0qZDcaT8x
 YsUb7Oq0qOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagSaQwAKCRAFnS7L/zaE
 w02VD/4jkfnBKF/itcTSEYinM861teAxQqad2iojoN092cfUl7K4tpOkwItU6oHq8ZbEoZRdCEY
 T8oFjikG/NTthRYMEKdBZZF68rMdvJdkhLA6xhPKDnLqfEyqyZckEmMTEEj4U3DGbhUvsxz2C1M
 Wu7LL+Wag22zYDMGjcpBUmM4cQR+pVNFMn3v1FU4PLarEMkVau07ELFkW7XziAK489wxDE1f+N+
 4QHsj1jtjboYhjgX2wb69qbBfkiJQnnuemYNKPPkb/ivNablcUuYAgwlPojY/qvU0sbflQH+UlV
 H0G69e7XbemRgpORdTE9PSFrloykr/OrAYPQ5DinbP7XnVuO/RKlfwLS4fbogxPOFeogKCw4PSa
 57OE0eeAGRW8aa0LcCZzn56Hu+IVBYlXClTSza7itAMlNMpY5SzjiqWanEpcgOH5oZKnWh69Mpi
 230VtmlMcrnKfwXkxI28ajHmImw3dxwYGDyOHUJaEPSla2JR+q5Yf3S6pJVX1BXILAG+iFqS111
 g/Vrjs8fmy4rKCU/Rk7P40JCbJpjUR/NYyjWF0Jxm2oqqjjOXCwRSJWSGAP8i5I28ALp1dK1sqy
 8GYDIC45ecUiPgp3oHDfdyQw0/WNL2NqpVcqilt9rE8IJ4nBSCYhLZ1fsy96rCCPfta48/xt2/K
 BvJo8uTI2TUTH1g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1OSBTYWx0ZWRfXyLB+mvdDu21s
 rawKtlt5EsRrwY8uKIvtQjCAfAbeChZ4JEw02AySgGKuW3DB/2RVb3auGOfltWvk+XQbNGmFZ7N
 VYAdQprpiENIRzgDcGiv0eBEonssk1lDytRn80DcB7paVp0uOUQ6tw0NqMkrx7haVyuj5eWq9SD
 7mLh7tOCzS+MVreJlSzsjhJNOBb662IJUEMZs96M/24SAjupVQ93wwhlIzFNuKY5TqSPNP5YlYm
 24YwkJr/56cEIo8EonZPSalL3CL9L2o9eFVb+cScD4OSAyCFhvq1uGBlxk7sXenWSvhtze6LAXg
 MVqZEGl4EM+HNhb+ixZMCUqKGkvTNiCVztJdebfKlvjKCEPg6UgDI269nfU1tt8rQ8+Y9LytI3R
 tidTG5+Cnb4wFfv4NPIxbYSxoRd1XO+daeiKTCrOf2fK2AE1H4tpVxlBCacXqyWeTqPljnuT1QG
 jK7WYwJH264ZjEsEOaw==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a049a4f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=BGJgbtQK9DYxViS1Zj0A:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: 9rATlP_eQcuVvE4h_h-2zsAfNPZ7V4WG
X-Proofpoint-GUID: 9rATlP_eQcuVvE4h_h-2zsAfNPZ7V4WG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130159

Update the bindings and driver code with the definition for the USB2 PHY
reset.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (2):
      dt-bindings: clock: qcom: add missing definition for the USB2 PHY reset
      clk: qcom: nord: negcc: add missing definition for the USB2 PHY reset

 drivers/clk/qcom/negcc-nord.c               | 1 +
 include/dt-bindings/clock/qcom,nord-negcc.h | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260513-nord-clk-usb2-phy-3e60fb0c31d1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

