Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C081352015
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187818; cv=none; b=OrblmS+WN5OlsiMnPVTESL/TD6IjyLa4WE0x6/igPYpcPPhXSloiLQzxJI3B6GMRbxY+S7/CQ1RNPaexaK54+/ptsjBnqMk9V+5Wv6iDVOF+3tE8ogNjdGIdqNHrYNauUYepBOev2hqoHB2IW+8uCmMMxCu4+7rf08+id7Q18nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187818; c=relaxed/simple;
	bh=ykVX2JfEgwuvzc2/xbvDBqQmXvj/xqAycnxzoxu1sD0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JXi5JfM64tn3JdtllNu0lZzoapXEMyFUaoCFCocixOwrE2Mt6pKVYsLwt/lsMx8yHUVpULphQ8drKB3orcYZpmPDafb7Ga7KiN91PkLQXxmDRGINa2iovmwfWj7FdMZs+vUTI/1mNbFcPFIsA3z3vnjPrCK3FQQ1ERbQgx1CoNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQLB9pGa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ego2/9Hq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AQLB9pGa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ego2/9Hq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J8AB0N2975393
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yhVzbuKGUnJsoKjJBAWaOM
	jpe2Ss3XlvwQTt6r5Oxto=; b=AQLB9pGa4RkicqpyrqQZjSdzQkCGupC8DId2Ja
	sTIqxzLUJw0F52rtrWvcNpdq6hawA2hBl8OYDJjNVTuuGp+HzulJb1PhNzVB1nC1
	IFLAu14eBbBK1+w10YNQxfCqQjJcvjaeVdO5dHXZuCuo2RnnJZFP+QfvmqP7x16F
	a9YGhG5YJR5efU8TLxsYPsejYYjs2QmQB+VziqSMKeZ3lYy+lKYgvRyxRmUoCv1o
	4tSdT0x+jKJDRlac3B9gjpH12S2SUVi4KrSptCeJwVO0Qwm/25d1nPwC4dJo2YX1
	byz0oRaPNG1Dz+vJuazdqsNJekfJieztNptFTH4Q7MBDDxfA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e84v4c36d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:50:16 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f6a5b4f88so5677170b3a.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 03:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779187816; x=1779792616; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yhVzbuKGUnJsoKjJBAWaOMjpe2Ss3XlvwQTt6r5Oxto=;
        b=Ego2/9HqLcEjyPsuK9C4MTxAWZUaBWLoK2wnroEiI/KalO7REVhUmJRsP1bV7sUxHC
         Nx7CjY/NVhdsA7+/JCdzNeaog5ZfiOwlCZ0wmMJXdfG4BsXhPeYxW1PHe9yb+XrcnR9f
         jVdKEB3b+1dtEIlyORRQtnpfKbbCz1qHYUeDXofebC2IWh27lRraJhpCe4MP2mSPdgXX
         l6Efsm+npejeISb8tVHGA6t5Zv9/b+31EiE72EYIJhGMZi2PrUyQGCS5k//jsXNz3yzt
         9T9/d8/Oys2eC7hFu/qciiYHW+gdnIB4iz1LGPJkdDjxxV/65UDP38LEsxojTN/aSm8k
         m5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779187816; x=1779792616;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhVzbuKGUnJsoKjJBAWaOMjpe2Ss3XlvwQTt6r5Oxto=;
        b=dLggcNSi/KwRyccGbWbwEnAqOvcVXePWLKrQASygmnTaad/SRmxPAErKYLfvTefhTN
         6T5fLnSkflsIu4tCqgoMVjZOHbAZxwdzD3MgSA31ehkpsaILEJPcvpNS1BqL6Wjpc9t2
         qULRvHob5pygY/gQSHl0cK1l1NP+fZEmsArR92CJlIsGZTeEeJ6X6fcuvVHku5h7vLga
         J4sc1uveU3qoV87iN/IIHAIV+VGbDqnFzGgDaNSrZ3NLAYIasXB+7ePQ3SlmWWzxwUIn
         7gulIdf+hz3qNLP9W+CpZ4ADvuCsaDlCN5zg7DngxTCC7saaUiftd+LZi9tOhV8RIZpG
         0/Bg==
X-Forwarded-Encrypted: i=1; AFNElJ/WrlO7rJY1xqMMyft0+zMatMHBEIdjeWqyTt5MI2W0SVDpEdLH/0yT8IOJtbAEt60iRreldKZbGyn1@vger.kernel.org
X-Gm-Message-State: AOJu0YwUvJwO34HRCtngNMn072t05ZKF8rwJMar7bLL0yUzHhiSkUkoc
	/7A48NqvTIcyJ6FZPgIuFTUIqRV0X7WafP4Tp+hcPPgvdOm3tS/Atsv8shmZQjT+vpJIrd9spRy
	coJbz1hBWhLqYUhDFCw/hxFtZD2leYVONtgLubosa2uRrdn4sKjoaKBaPst6Z4mIv
X-Gm-Gg: Acq92OFqgLRwdDVHAe7xG2mUFUUHtErNo8fvC9bOLs2hGjDbs1kSzw+qffEVR6x/6lR
	44cCJZYTcKDVGa3QXIC7eIRcMMFInaJ6g2zt6+DFILRF2644BOm3NfWpM5QwV+z4k4OFu371Erm
	AcJVlvIiFOyeXlBgzTk5m+Rg2/OIebkuyUdk4518oQr/2JEjmKZLLtCbVKu5LjwucPZtrFFRbrm
	FdsfBgSX03VvdY7vPPnRBXJoHJ85QZFZfwtMe+r1W6EnsRoIZu3WCskm8+Kzb/WLBLP5RRPtyww
	YR3PRG49Ei5l/sd0786ZfuKswa5RU1cPcfpXqjVD3fuoNcJokXszR9DoVQj755xdnpAh9XMUu6C
	ljVfRX3q7zrM7lYmeSJPNghETI3l0vvZt51w0XjGtfbqWID5Y1yuGhqHI
X-Received: by 2002:a05:6a00:4c0e:b0:83e:d52c:e6bd with SMTP id d2e1a72fcca58-83f33c9bc80mr19699131b3a.38.1779187815815;
        Tue, 19 May 2026 03:50:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c0e:b0:83e:d52c:e6bd with SMTP id d2e1a72fcca58-83f33c9bc80mr19699096b3a.38.1779187815243;
        Tue, 19 May 2026 03:50:15 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19fa869esm20877879b3a.61.2026.05.19.03.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:50:14 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: [PATCH 0/3] Add Qualcomm SPEL powercap driver
Date: Tue, 19 May 2026 16:19:48 +0530
Message-Id: <20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE1ADGoC/x3MSwqEMBBF0a1IjQ0YQVG3IhIkebYFfmJVtwji3
 g09PIN7b1IIQ6nLbhKcrLxvCTbPyM/j9oHhkExlUdZFZVtz+H11GrG4IHxC3C/qVzCuxlpMofF
 NhRqU+iiY+Pq/++F5XlQC4SZrAAAA
X-Change-ID: 20260519-qcom_spel_driver_upstream-11efd8c85e6e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779187810; l=1732;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=ykVX2JfEgwuvzc2/xbvDBqQmXvj/xqAycnxzoxu1sD0=;
 b=BRsaVnei+AYKkPcFrJSq3/l6PPY/i5cQAO1Kr12LP/4gwE3wRutqRqZz6lXC+lae5qmcc7ywm
 wPGj+cxAqfIDi7cdUkSAP15kZDisMCwhZdvqUW4rzNYgeuNMXUuKyyu
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=VJPtWdPX c=1 sm=1 tr=0 ts=6a0c4068 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zL8LttSLqXSf2cHOEy0A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: Zq-6uQHMMHK35AjtOicVe2AcHhPzT2uL
X-Proofpoint-GUID: Zq-6uQHMMHK35AjtOicVe2AcHhPzT2uL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNiBTYWx0ZWRfXxvMLbjF9F6J9
 PuF7t64DAHSta8FszY6qDFSWqRs/Kw7pDWzFpn4cm5JDZ2Ri7eMpFfUBqiw2bmnS4JpUaBLIPo6
 qYJRoJUZGmq7o1k1l3xofbhZTfW6iiViYqQD4yUUkSSJqsB8l59dUk+6cPb11Fck+8wKHbpjbCp
 i5c40OBEQlAxARnTxul5tVxtjcxdYSvTR41JEhgkfn8h5RNLzQ39L9jzsuP/+11RNh0EL/z+nME
 HiuE+h+vNTPCEuXit3uhruKSjcMCTC28ZJbbDVewxfzWk945fZNjWgLED7WpDDWMUqCQ4ihm819
 p0RBe+L4q9RGXHVIgRJAEGbKx1cXEKj6FVGxCzM55of6KIfsKxLTnVFzjWuNkKj4YP9L112Cy+6
 lesOrBdoG3CKadAWUyzVx0HErBtg5MhJDApmUK35ME6/lQjuaWjgk5PpXOyK1vwQbgjgJbgs5lz
 mWZX3jafgoJmCadIbbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190106

This patch series introduces support for Qualcomm's SPEL (SoC Power
and Electrical Limits) hardware, which provides power monitoring and
limiting capabilities for various power domains in Qualcomm SoCs.

The SPEL hardware enables:
- Real-time energy consumption monitoring across multiple power domains
- Hardware-enforced power limits with configurable time windows
- Support for up to 4 power limits (PL1-PL4) per domain
- Hierarchical power domain organization (SYS -> SOC -> subsystems)

The driver integrates with the Linux powercap framework, exposing SPEL
capabilities through standard sysfs interfaces. This allows userspace
applications and thermal management daemons to monitor energy consumption
and configure power limits for optimal power/performance balance.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
Manaf Meethalavalappu Pallikunhi (3):
      dt-bindings: power: limits: Describe Qualcomm SPEL hardware
      powercap: qcom: Add SPEL powercap driver
      arm64: dts: qcom: glymur: Enable SPEL powercap driver

 .../bindings/power/limits/qcom,spel.yaml           |  47 ++
 MAINTAINERS                                        |   7 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  10 +
 drivers/powercap/Kconfig                           |  13 +
 drivers/powercap/Makefile                          |   1 +
 drivers/powercap/qcom_spel.c                       | 787 +++++++++++++++++++++
 6 files changed, 865 insertions(+)
---
base-commit: 80dd246accce631c328ea43294e53b2b2dd2aa32
change-id: 20260519-qcom_spel_driver_upstream-11efd8c85e6e

Best regards,
-- 
Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

