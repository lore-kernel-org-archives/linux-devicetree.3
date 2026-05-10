Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E791DE2AD
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 02:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778378801; cv=none; b=XYWYfQp/+5GL0qoSqNhgFFRToM2ur9z68wUhxius1Giiyh++KMnrYGvqcTmfwPa+OAbNnezQJQvtz7Rbvl8ORRXcZQNXi91s/39B7v6Je8EIGrKCSmMrG3JFXgdyk8ibGmXJg3PSU7JoS6cgolg0SEdtVOZDGFXeXulRLjiZhOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778378801; c=relaxed/simple;
	bh=W+DCCrpFowryX11pvJt2K1EBF8G5AAjkOkkiR7AQKV4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gznTV6AjiKPRPXg9bHhi/rLGAidVbdQMevJizfL7h0jmpnYQkBtp9SSLwdKSN+EHLb8Hc+qtMPrYILJBjPyemFdAoiMf51zG6Va2RZmFtgZUKHkmsaJgCW4D/cZ9IzgJXOOWlgib5jjNUmz67MUxxfWsIbeNXXUMViJJgGhy4Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GsEenpeq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K4WzNLyn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GsEenpeq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K4WzNLyn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64A1C2Dr1305541
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 02:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Hc+dMOlXO4kmwhGVPeyOL2/tHkuEgcbSLt8
	7GgpCmL8=; b=GsEenpeqGi0LnK8U5YdTsMsdz4WGa4i8gCIxSSZUGnBK+rU+Xu7
	o3DeIahfJe38v2dL6XT0Kt47c1VRMtdn1G1lohHW3lQzCofJrVyygYgeXrsYJvN4
	CQJf6af2Y5AxzTO3am2Z1tEmVUH4WswzQ4/QNTYse75yksHuU6i+zfbg2NqpNe60
	+I4zBaqbQIpazCC17ev44u4j2Hfd310UZG61Ff8Vn/dtiCE+bCNWFE5WkOEEuA/R
	urgEDpuOQftR5V5cVqk/q4+V32CGXsnAQPiVRTskvvjIpXy4V8mhyiITapixawMH
	8ET0WidxVP9sk/YOcxLDXeUk7d/XTES/vEg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e240h18t1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 02:06:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so4280847eec.1
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 19:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778378797; x=1778983597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hc+dMOlXO4kmwhGVPeyOL2/tHkuEgcbSLt87GgpCmL8=;
        b=K4WzNLynl5mwFssbwycpdsAlj+u5KnWdvVp8Fm9+ctDG+xDf5iU1uWW4co/amLjCZx
         OF52hOElOtRnexrdr4q4niNKUCy+hYe2hPnhOvOF5SzdWljFzx2/FWt0rDbWs6kxqSyl
         jfoxqtT6Co9C+OP5OI+oz0GgUmAoUORMKNrYSxPeE2DB+Wxkv9t19rtMXKGy1rBheV3z
         npD1YEf7xc/2EvAjf2JMraPj2+wBC8A6ktQiBvlGKvHQa5RNd0KwL3z+ex/a7/XmULJk
         cqKpdCsWEqWNxfn8qSCnByEtdiVUIcjA9iF1bW+yN3eoHOHsCD8MG2502DRQEl9ohR7i
         ChHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778378797; x=1778983597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hc+dMOlXO4kmwhGVPeyOL2/tHkuEgcbSLt87GgpCmL8=;
        b=pEhc1Irga/eLrZOgzHLSx/dk/Gu11khf6kbJzLowFL+rm7XLr0FNlxJ1K57PTF76Ke
         ODt0VBqPuINsEyB649LUhcitqbUtCYAM7BnBSeIiWi8dGFDqqtIOl2t+bx+IU4WuFoGH
         qnUsmvSzKh06rGBrjGtdNgH18K6m73KHBsDzDNNR2xH4Wb/5vW4fRs//Sig6dUPartI/
         X0Kw0smeeMwvKf5eQdBqUqnYLJwtzAvgGinPTC4FR47F5LLgDyvoYS2xp09I8kK/8vKH
         klT49yk7CiIqOxNhsucBcxfnX9gTN2dpiCiG13woLoi9tWXuiXOrgU6H5AV9djj4oJun
         UFcQ==
X-Forwarded-Encrypted: i=1; AFNElJ84tTLb3ZqU4OYboZbsZxgXtrb1u5HbmzYtYH0YeR8K/arKm2oekRqsZ8cGDaNwB6lAxVUXOEUGG4Je@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg7IkfpLJFYHilCd7KXRDG36WECFtwNxNsrh1tHMAtjdeEvmXd
	ZjL+9N+jNCfDd0tggfYYzWJ23b2AvuZu7nsIiUIKvUVhXg3HR3fi5fz00xEAQ6mYQhV9Z+CRUh+
	FvnGwSHXUKDLZkR2AZWZgnEDgZGDeD1A/8tCcOqmraBNMI7U9lhyGFB8MMgFQ5I3RwS/CjZxy
X-Gm-Gg: Acq92OFB1zdj44H3T0FBZSRmj4wUFghujt6w7xVDxMp1OmKL2eh0coHIT1XiPpfIfsY
	7tQufiJVhj6PjPmH8oXXE4tHa0AhcnM/aE8cFUxC5KeSmLMWmAOwWeBtl5uVvf5e/btQcOI0Em5
	5lpanWQynreYQ/WAU80NydK1MkKh1EnGKmHt7TDqxY4T1CfJE5vaXwryDzp0yXYH3lkbOz9WVSz
	Osk+aWrmqB/iTtvcP5aaf2/enaT3U5dyUiIyJZZC6ASlVVYmph0YFjKw8nUUkHzVUNSXkyjb+Qm
	YYSVERctoijvz4jsHBUCPwo11yDGSvIyxvJkyGTTqho/6O9Sac9cm5byunCUTsxJJSz4/j15QkD
	aWl+GE3ckwsiNKP6PerJQ8idmREfnOvWVwBJzqow1GFAzGUaeU9iTFMkXA6Gv2FRyltNctCX6Of
	69q0Ay+w==
X-Received: by 2002:a05:7300:ac82:b0:2ee:f85:ec3c with SMTP id 5a478bee46e88-2f54b466443mr7716717eec.30.1778378796539;
        Sat, 09 May 2026 19:06:36 -0700 (PDT)
X-Received: by 2002:a05:7300:ac82:b0:2ee:f85:ec3c with SMTP id 5a478bee46e88-2f54b466443mr7716695eec.30.1778378795363;
        Sat, 09 May 2026 19:06:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d3047sm9645257eec.10.2026.05.09.19.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 19:06:35 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add interconnect support for Qualcomm Nord SoC
Date: Sun, 10 May 2026 10:06:05 +0800
Message-ID: <20260510020607.1129773-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEwMDAxOSBTYWx0ZWRfXyztQaNpjh8hx
 quizQanGjAU5xphIWXGahW9bodx0mzFrFzVHFmgQQuYzAaimmyGj4A22v2X1SO8JIYRBusBx1WC
 BJeYOqaG/Nd8u70UBDeAxfcu9dPGK7qqw8pBiIbcuTJaNZngPJPMYtkVWzuVlBUMqBtDY5e5XB/
 DTVcWujhqvs9zrUbwJiK9NO+7pZ4IhiPFdPQhjawOLo9Cb9G0EzkPRhIsFELmx5Qv/6hJVkLqp/
 WjWmpRdh9rai4tLNz1Zs+TNbUSCOYnY0DVRgzg5Pq1qbgMNX2iaXIn5o2CgOom5SccjqAh7iEjp
 Bme/uSDYvpbsTDSUjAdey+5WR0fDWCufb7l1hqi7N0ruO4ak5osZ/z4dVsc/r8961B4rNxjhl+h
 MvL2p/MT3e4OJJE7Lw/Halo3A1/O8NtjeYXXprrUov7oo5jJ09XguMiVwlRYLYixbCv6htRj0+7
 YM2asujcF+YbS5J8gUQ==
X-Proofpoint-GUID: a6fQNHwVXZ0jhplnCV0Nvsur5TY59xhL
X-Authority-Analysis: v=2.4 cv=X5Bi7mTe c=1 sm=1 tr=0 ts=69ffe82d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fJYZd5zOr1s3VisSgZEA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: a6fQNHwVXZ0jhplnCV0Nvsur5TY59xhL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-10_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605100019

This series adds RPMh-based interconnect support for the Qualcomm Nord SoC.

The Nord SoC features a rich Network-on-Chip topology comprising 19 NoCs
including aggregate NoCs, a high-speed configuration NoC (HSCNOC),
a multimedia NoC, four NSP data NoCs for AI/ML workloads, PCIe inbound and
outbound NoCs, a system NoC, and virtual clock/MC nodes. Bandwidth requests
are communicated to the RPMh hardware through Bus Clock Manager (BCM)
resources via the Resource State Coordinator (RSC).

Changes in v2:
 - Fix .max_register of nord_hscnoc_regmap_config (Thanks Georgi!)
 - Fix .port_offsets of alm_qtc, qnm_pcie, qnm_mnoc_hf, alm_sys_tcu1
   and qnm_mnoc_sf
 - Name QUP_3 nodes with '_qup3' rather than '_qup02'
 - Link to v1: https://lore.kernel.org/all/20260420021351.1239355-1-shengchao.guo@oss.qualcomm.com/

Odelu Kukatla (2):
  dt-bindings: interconnect: Document RPMh Network-On-Chip for Qualcomm
    Nord SoC
  interconnect: qcom: Add interconnect provider driver for Nord SoC

 .../bindings/interconnect/qcom,nord-rpmh.yaml |  131 +
 drivers/interconnect/qcom/Kconfig             |   11 +
 drivers/interconnect/qcom/Makefile            |    2 +
 drivers/interconnect/qcom/nord.c              | 2682 +++++++++++++++++
 .../dt-bindings/interconnect/qcom,nord-rpmh.h |  217 ++
 5 files changed, 3043 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,nord-rpmh.yaml
 create mode 100644 drivers/interconnect/qcom/nord.c
 create mode 100644 include/dt-bindings/interconnect/qcom,nord-rpmh.h

-- 
2.43.0

