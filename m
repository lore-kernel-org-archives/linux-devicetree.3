Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829E549A3C0
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102703; cv=none; b=h1jpZ0tgtGCEz4TfOCBmkc8pWE/m49KzGVvtmer/717kUDAONnycCmZrKVmwvqaOnBByBmqLtpJudM1cwdlYNvKvtaBN3ArinYRSZFffkH2LyzrtCoF9cIxiu5UCqak4f+mkMWmsdgCdyHKfOlOtmjTNcr2oVrMqKVqNyFQUX5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102703; c=relaxed/simple;
	bh=beVjqaoP8TPHrm0UUdxAvZVYIgV0Hkxe0FspTEoaFKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HibgXo8LXpN5nhwWgjQvwV6mX56Dh4DnIXkZDjGVk8ZhBotyRKqq7hXlpYrUvblQVWFosyRaJOM6G8v9SgnfozBmxB5zkVM/ishNH5YYX3YY3ZLZq+i2mTSUK6sd+t8Rm6Jh1Mo4TI6d2HxqbOHQLDFz4txMIex6S/PkUGSAeOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W/BEmNio; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QU+quLgE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W/BEmNio";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QU+quLgE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI6tXc2033218
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eVx2zn+6kCGTxEz1Q73Ti57VUd99JFhfmBV
	MS6c68iI=; b=W/BEmNioLHvZD0El63xaW8bKTT7nz1nHm28dGP0TayMiwkXymTJ
	Pw6aGzv+SVRid7WqkHVDaybMcvdvVlOnxRS6uljFiTywPoTfhbRK2/Z2ExnrRe2Z
	c33OT5ikZWne9HX8ia0rn/XoQqUWZfCBx9H8qzMPhJaL7mSkJE/ouOXbFUD8g/Sp
	SidmD8B65tfm5jnTa9eIxQhHOwu5ZYYfV+G1OttG8Z6KtVExaPnSukVSNZKifxH2
	LB9pPqRSJFFr2nqbuLlOvAFDVFIxgti55nySnzp44ZIyLYIPl5eKffQ97GZDGW8n
	Fxrul8zSze2TPfRA45nh7+Ev9FBebFnLj/A==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c0be5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:44:58 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c847f0fe78so227306e0c.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 11:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790102698; x=1790707498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eVx2zn+6kCGTxEz1Q73Ti57VUd99JFhfmBVMS6c68iI=;
        b=QU+quLgEDteR/t84YOP7YXf84RwFdQRM7T0bVx7ElLLatx9ZP8gY0duuZzczUrWCTI
         KWfljEehk5W0rCFOU+uqnWiiSwp92pE9t+C3pjsyAGd+5XxxzAZWbFEqpqn2YDtuFdI5
         Qj5OF41CgNbS8GuJOhFq5Sp86vQjLaHBygRg69FfARQ9gAsB33rd+TOOa92vY/ihRdzb
         1j9oVEg38g+tg44bmTCAZJ8Zn1D8EJI3D9zTq0ROH0by0iZwEQq+YOyolJLC5R8oJTCB
         Vmr07X31ijFQ7b1uLKA1QJoG8NdH0K+JncJJLcnIQJky6at9wq8p2DWrtxO9WXolcUna
         wMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790102698; x=1790707498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eVx2zn+6kCGTxEz1Q73Ti57VUd99JFhfmBVMS6c68iI=;
        b=HEf+HGAqHm4TjHvL7vsM6ngc83/KFZ6bBJh9DQnOR/pY2vEN76SpJHdhGQPuRbJllT
         1ILQMpdqxcH4egAVJwjQ6/FPDPfzSe7vsyx/UAhPqNLaJN81+jpkLqaQmTI0VphM4kcp
         lxAfiK+fpLIobHrG8ZnohKwHNdEmKF9zQqGwfTWucZGkGY3H7DMBX5uH1uM+iBEe+CXA
         SrPQoqBRGnCSyd9LYxdmrkUEmupWXjWsoxQwEP5DbIy3b+WtdKGUc2TFaoBsickZ+4AK
         MqP9Y4wINFxwrL6XZ+t418gBWGUQNf+InBd+jENkJT6Ssl4n7pQ+F/pxcBUEvuk/3NyW
         oH1w==
X-Forwarded-Encrypted: i=1; AKwUvBwJ2Cu7/LXDeTGgGSrEpkmwh4+yqiIOFC1PwTUW6W+HYbx0KVZDC51yAIJTcbRxgmgNJxN2s7nkvli3@vger.kernel.org
X-Gm-Message-State: AFuF++kBxWfyGM8CUHCtmShKQuktA5MXAM6Ntwh6X9zoGeNSpzxQLwUL
	W1LXvF33e0u3LDsntxr9wrE3WIh6IaZGI5dh0FF7BIJQ+yzqbR/3ioTyeCGMA4OLiBCn37Vq/0E
	bS5t/RGvTQW9qUywbtUTc0TqYOS1A77wOhnoeiwwDf14a18Nf+GT216TjyKy7yXQH
X-Gm-Gg: AYBFou3LPVZEorcOJWRZOT0PuYEaB600AqLUPWjKeB6Oz5HdS4yc2JMH8ErtP2U3SPd
	rTE1C/zmx0FBQAluPPL3LiFrSdkYnlhL76aQdyfL1dIxw/1n3jqhti7dDF4HC0OV4ztQbXmfj9M
	L5xytNWarV0kofi4RXIHK5lqDUdWVFMJXuo0wgzQYDJGBGATU9ykakxU35Q2KByT4Q3loh7TNc/
	6yb7JwE7h7KLV4VMXM6wzpHY7MzgqYJHN20mgTa0GNDR1IKZDdi4n1RtqcTeUrAMsF7eaIXkZq3
	inPEEKxqjmaA98DgD7Vv5ogEf/PZt9ayrzKV5o5BPsoqW/pAfpdLx7JRky6IHjHCro8XbL2azuY
	WHIdjvtV4DRjp4d45jUlkGfHRUgVGUcmBHniqQEo2kgaG5xotBA7LZfZUvUDS6mjbY35IpnbEFG
	c=
X-Received: by 2002:a05:6123:5c5:10b0:5c9:a5b6:27b3 with SMTP id 71dfb90a1353d-5c9e3655d2fmr3477506e0c.16.1790102697638;
        Tue, 22 Sep 2026 11:44:57 -0700 (PDT)
X-Received: by 2002:a05:6123:5c5:10b0:5c9:a5b6:27b3 with SMTP id 71dfb90a1353d-5c9e3655d2fmr3477475e0c.16.1790102697195;
        Tue, 22 Sep 2026 11:44:57 -0700 (PDT)
Received: from debian (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c500sm374681f8f.19.2026.09.22.11.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:44:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/4] clk: qcom: Add LPASS clock/reset controllers for Glymur
Date: Tue, 22 Sep 2026 19:44:21 +0100
Message-ID: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfX35uL4J10JWnG
 KCfwgB2gSTETJPn+dT7/s6VLPVEn7uNqxq7u0VgVD7OULRRDz1YmaVwoaILvjCKxXt8UV6OZsr+
 wEEXXd7dJpWDgVe8tykni429DdPCxSCk2oyTWf5lxjQukFMVf6NAQ8hkKjRVvH2Z+xBTIAz58iB
 qKzGgBo3RNB17ygLy9dqVgJuri+YwgEUfLuWrgyP1vDwX3Pg6j+cBV+MQhRBn1cIZD+ytXiz/pI
 wxC0BGfV8NClq6cADgyCmGw0aLIM7xnjRkov6p22mUSBi+P5I+OBxdKYrHcTznZ8//BaHw9W0E4
 4GeFsv9qSclvqJxjSJiuvcirQg60HAsVwENemAMGupEj4OUWS43LeIS0AvP7MClT0aHpgy3hG94
 btR83BThXlZ5pUiAiQi5EzGz9mtAWHu2vBq5GI3uZ4veAt4kk/rqJlyHbJHKlHiUwOS0knwuJpc
 MsGI51O25QfKWeEISlA==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab2ccaa cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=68KCznAa1mAgJHz0fDQA:9
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: Y_ay8nbEenP7dCkdS0lZukdDFV5BcZvc
X-Proofpoint-GUID: Y_ay8nbEenP7dCkdS0lZukdDFV5BcZvc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfXwbljqPgSSu7u
 5NChlnxB1YNVdy00zxqIS17Vve7v40xsxmxFGU6IbW4K5EfZAOBXBA9vfrG0eVS5GY9A6rY/ZJt
 aTMwQYcYPBUnOHHiA16l6j/jerzxxgk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220275

Add DT bindings and clock-controller drivers for the two LPASS reset
providers on the Glymur SoC:

  - qcom,glymur-lpassaudiocc  (LPASS Audio CC CSR): RX + WSA1..WSA4
    SoundWire CGCR resets
  - qcom,glymur-lpasscc       (LPASS CC CSR):       TX SoundWire CGCR
    reset

Only resets are exposed for now; the Q6DSP owns LPASS clocks via the
Q6PRM service on the GPR rpmsg channel, matching the existing SC8280XP
pattern (commits a5c9c3ba243a, c2ef1ec97c1f).

The reset providers are required by the LPASS audio macros and the
SoundWire controller to come out of reset on Glymur.

Srinivas Kandagatla (4):
  dt-bindings: clock: Add LPASS AUDIOCC and reset controller for Glymur
  dt-bindings: clock: Add LPASSCC and reset controller for Glymur
  clk: qcom: Add lpass audio clock controller driver for Glymur
  clk: qcom: Add lpass clock controller driver for Glymur

 .../bindings/clock/qcom,glymur-lpasscc.yaml   | 60 ++++++++++++
 drivers/clk/qcom/Kconfig                      | 11 +++
 drivers/clk/qcom/Makefile                     |  1 +
 drivers/clk/qcom/lpasscc-glymur.c             | 91 +++++++++++++++++++
 .../dt-bindings/clock/qcom,glymur-lpasscc.h   | 19 ++++
 5 files changed, 182 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
 create mode 100644 drivers/clk/qcom/lpasscc-glymur.c
 create mode 100644 include/dt-bindings/clock/qcom,glymur-lpasscc.h

-- 
2.53.0

