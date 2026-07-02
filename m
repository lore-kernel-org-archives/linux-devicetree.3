Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2467D361656
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 17:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783012999; cv=none; b=R7GAw2UD44ySWXCtJ0T5Rat9C0TeccJb7BVJYLmNBJVjr3TEk6ZsQNY2SW1cIJfbCnEtX2pzt4ApbRAuDtulznRESJfPNekuUWmn3pP6MARkWdfblL48lyvQ2iP9EX4sJ5LtKGTpkSDCE1xo0nQkgpWzl19kVmXyE2LZexGVW8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783012999; c=relaxed/simple;
	bh=xHihuKsqRb/rLYCJXcp8FeKK6FPmsUs9uqScFJUzeYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O2sjZ5RB2FsNpEix5K1ZDYGaq7m+26RrqmDchzVin82jnDT+Jeg2IiFQnIjgal28BDlW0e3ZstLewPoaaLLLikNTmLtGFIlg4Yujmt6UpyZj8/SO2nC7BPruaDgvoQdZI02BGihL8myB5VMJm45lSPUUDWGO1AyGsE44smjetxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HC80EKXR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iQNGBkwL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HC80EKXR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iQNGBkwL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3VRF666061
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 17:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QYRjVEiEnorh4qnSB7sPARd/kjNZvY/WSq80K2OYPkE=; b=HC80EKXRajJ2DXN8
	6NLG9yZ0Y5esRVSfzJDolcnwq1UVFJRMESi6NYOzC30zwstsRFFstahWlijanuJ5
	O//QM3PMuzA6u7iAm2ga1TMgQdMir4589MXYJZ8OD0XRsSWCLaAXX/CN1A+i4mqf
	ghkpPh4/fRRxeTT8NChgxZ1VQ2VaYH71NczWdkxUYW1EeVXr5em/SUOSTpgSSW/N
	jm0g7oSdmm5fdMqPRrEOwPp8hVz5HjidKz6/TCExyPcc+MpJ2uKhIoITguyaDWqr
	j6e0PC8nDh3fzjB+3LTKPdm1OHDTVQBQNYgh4zAonhyhtHoGVZZxkfAVHMfUIqG9
	aEWZ+A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5knc2faf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 17:23:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ca0481106cso24701255ad.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 10:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783012994; x=1783617794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QYRjVEiEnorh4qnSB7sPARd/kjNZvY/WSq80K2OYPkE=;
        b=iQNGBkwLwWL37GTsZAgKm78l5Vra+GGdD3QB7CKibujHiR4V3yEB3HLRs4nMzlp/32
         QcqlCjGUQ/+TBJmQRZWx8pBZyhSOcZE9AFBYuG4Dz0RWQoiE9eeJswR5u1rUC60F1Ut4
         Y+Btwr93xl+CNmZMb4HoNIGSdeUp64UgA7jVABRvFBZ+yuo9yZbyRgA858nYzIUpCaOD
         6lsaICXkmp0yDEbnP529otPPqVdNTGizLw0DbgvRPk8YItcnWMym23cpDCuUyWIrNULn
         SBT1saHHxJ39XmuxL9pAoE1t39+xLjEyousaLBZItPskBFzKShr4zNRWWX+Z2cv98wD4
         +boQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783012994; x=1783617794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QYRjVEiEnorh4qnSB7sPARd/kjNZvY/WSq80K2OYPkE=;
        b=plkrLZrXyf2dYPXO9BvaOSluxjHZBp3w1ErJLCvJkOAYTRP0Ev5P/mrUcjC+VWS/fe
         BWgjHrrDExzRtzqkhNNa5iX6OOgkOMnZpRKrPCWgtTTn+HZmlcj/Jh9PIYCx95batf2h
         VCZN6JYoX6wo31KeWnWr53Wq554X1qUcQ3XEdSbzwHwd1Xu7VZ4nflNraCgHHejVyrvn
         kbxgTBbyCujHpb+sFM7zEIPLQjfjdpQ09ksY8HcP0YRYIFLtioE4kBqAdIcPnEhMmNcg
         5HTeSI5n3nlXro2y5Zq4WPTG03invgpWV3POmBwb1LDrXvgndulQ+lue72X5/XDzFzGq
         mNUw==
X-Forwarded-Encrypted: i=1; AHgh+RqfO+HxvA3JhQtm12jTO7yz1K8LSuh4POuqvI2lcnXPaOH6AHxlb/xkjIGaUHFguQ1nhgyxgIPr4EWw@vger.kernel.org
X-Gm-Message-State: AOJu0YyvBdQtSMNZbOz3hPYUpSK2DaLqChFWV1yYztKRKKW1mfxG9n6Y
	+bGSt32Yn8QKNGptYrj0nMQKlSc30hRtuBu+bGmqQLstkn5Ohv+uQSxpEqry6m1KFqRSW3K2Pp2
	cffkPJfiOO/jZZEgpAHa+FitFj6++O81ehcspaz87A1+IOirur9iwi+Dsl7VS+WEp
X-Gm-Gg: AfdE7ckAvVH5ZKOz13E9IvplC+DS1YJJIHiaSeMdsVu3heqwXRBBHpdnFflsEJk6L7N
	FDH1C2MQwkBrcJUNTAs0Bw/cMls6+WZxyqL/KKZB+bMaaW89Zk82VoIZpWOBu5KB1Hg8rygXHcm
	OQQOYWu2K/Xg98r+8SNgRsuqRVB4ugKhfFCvjfd/LXU59awbKU79NdWQBY3j2GVfv7Qid9xdK42
	uEXYItNwX8nN51ANtcmGKgf1I8CJcIzb1Ghp8ZPlx6T+MzntY0a5aYxF9r4ZGWbN6zyz714HzbW
	4T5Sc44pU9OX+SMiM4DvJCYV+iUfoEtwMxxdaP8Tg6KAcKv7d3tOLj0RD6zVoysiy5bP4rQkmRE
	SBGOcckXWxU1hT4gr32I2BNc2rWYYfpSe41JPavIA9LtkGQ==
X-Received: by 2002:a17:903:2ec6:b0:2c9:e846:a57e with SMTP id d9443c01a7336-2ca90c2d830mr63166875ad.0.1783012993959;
        Thu, 02 Jul 2026 10:23:13 -0700 (PDT)
X-Received: by 2002:a17:903:2ec6:b0:2c9:e846:a57e with SMTP id d9443c01a7336-2ca90c2d830mr63166435ad.0.1783012993376;
        Thu, 02 Jul 2026 10:23:13 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3ececfe4sm10564289c88.8.2026.07.02.10.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:23:13 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 22:52:54 +0530
Subject: [PATCH v3 1/4] dt-bindings: power: Add common power limit
 controller schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-qcom_spel_driver_upstream-v3-1-434d50f0c5b0@oss.qualcomm.com>
References: <20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com>
In-Reply-To: <20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783012984; l=2349;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=xHihuKsqRb/rLYCJXcp8FeKK6FPmsUs9uqScFJUzeYE=;
 b=ABNeavTY+kT8ZxyIY77NcbRhiEzdntQDzxmePHBxRtM+2TkWJ1hgNyXGYvFB/BTzK4UBpNwIA
 8q1tCTAr19TCx0J8GI34RlsAFBejkrWmZr57v79AqQNjEdUaLB4Mvqp
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: A42doFzQUWVW0wbJd6ALUkQl64YX-oPd
X-Authority-Analysis: v=2.4 cv=a4kAM0SF c=1 sm=1 tr=0 ts=6a469e83 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=I3Hf97kVh4pfuGT_b_UA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE4MyBTYWx0ZWRfX2HWWtPcKR0ey
 I2rLjYd8eAM5d/cLKwzVnHf7L+DFbGAtGZx9R09I2bR1Hq69XUK9F/lpLKONIVKC8bd89O76tzq
 /lbpOJeF0yRmiG/meCZP2rUVz8rIV+yU+07/ETSxVdyte0Wb7N95/Xm6v+q6t1RruiSgjjCqqII
 GO2dia3yEwjd7HDBlfYprDkwHrrO7ipDBARpVW0zoiaQX8q/sWsdVFWQj4ToUf2gjjEZtpB5Kuj
 5GdlPojwCeRPLIF9/SeTHYNOrk1LJXgvz3TcxxXpiNR3SmmeXEVWpJlJNhxAnYJZeKBmFh8Zc8n
 Lt3WRgd16fxdTt1jtq8vQfEIp4nwxmwhgqE7xXqKoWgP6UrRkhU7vaosxCiOHDSfYsW9KByrOJM
 gWoTw/nME9sXnlSSkSgm5CL9PIX7baSaqRctM3ZXZRe6WG3objoGCyK69QKpoeJ3hQnFjA5Kkec
 YFhAPN97655aNFqsakQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE4MyBTYWx0ZWRfX1945XVzvHbL4
 c7M3nk+GANbvsOi405xVBb3VRm2eNKMaFzTylwFvlLmR0qCAr77Rs1V67Im5ierg5acEctkuFX5
 FEtTSc64oCutseKqvoqvZUCiGG3pbj8=
X-Proofpoint-GUID: A42doFzQUWVW0wbJd6ALUkQl64YX-oPd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020183

Add a common device tree binding schema for power limit controller
devices. This schema defines the base properties and node naming
pattern for hardware blocks that enforce power consumption limits
on SoC power domains.

Power limit controllers typically provide hardware-enforced power
capping, configurable power limits, time window controls, and
power or energy monitoring capabilities to prevent thermal overload
and maintain system stability.

Individual controller bindings should reference this schema and
add device-specific properties.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 .../power/limits/power-limit-controller.yaml       | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/limits/power-limit-controller.yaml b/Documentation/devicetree/bindings/power/limits/power-limit-controller.yaml
new file mode 100644
index 000000000000..a00548fdc79e
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/limits/power-limit-controller.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/limits/power-limit-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Power Limit Controller
+
+maintainers:
+  - Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
+
+description:
+  Power limit controllers are hardware blocks that enforce power consumption
+  limits on SoC power domains to prevent thermal overload, maintain system
+  stability, and comply with platform power budgets.
+
+  These controllers typically provide
+    - Hardware-enforced power capping for one or more power domains
+    - Configurable power limits (e.g., sustained, burst, peak)
+    - Time window controls for power averaging
+    - Energy or power monitoring and reporting capabilities
+    - Power balancing algorithms across domains
+
+  This binding describes the common properties for power limit controller
+  provider nodes. Individual controller bindings should reference this schema
+  and add device-specific properties.
+
+select: false
+
+properties:
+  $nodename:
+    pattern: "^power-limits(@.*)?$"
+
+additionalProperties: true

-- 
2.43.0

