Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA1C2367B5
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 05:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778218471; cv=none; b=hmxJNHZD1HLgjL7jHZSG7T3eDQri84baMJA3nH6fXStOBL2eKfCLIG9tuS7zeC7ysc+Mb5DnI/FlRfdYX4ISvylEM//k74VyqgEP5IU+WgviCp0HylmbxKzj86wkUQ3dp+MlKHWobtvKuEWCjTR9C8V4y2JX71x+psCEXeO5Erk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778218471; c=relaxed/simple;
	bh=EtK9N4+NFj6QWTPadZKysZybLT+fRdMIcJYSRMi39J8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fiVy72un6QFyO+Px7/CNxpqJ5V4vJ0GPVEi+CcGOF6zLs+1b9jGj7KmxGJ3D67JL4IZxSNCykOryqIVgtZWeGDi2UOeitY5xXkaPutcZR6hUbI1LsHKAkjBZRhMQS0Wn4kH/VBtG96FUnWSpG8SzbfRvbOnBtEtJCyZKqGDAxwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LY9qr41r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kBkSvXDt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LY9qr41r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kBkSvXDt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6484a21s1417593
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 05:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2i6vQY2zhkjKUePjVtxsVG
	kCMbPYzqKLTsKJLhPO/8Q=; b=LY9qr41r+CSRLTLBvL7Gkclx24MmzuYx4c8YP2
	/pUWtglS67Kovn7p2S/Q+BlaMo+Z48vrtwpWagTsfCBvtL9UXUqgJOGVEyKeS/u2
	C7WkdwcqpHoivEdvy7jPEAshG+by0P9ZS8RBnM1W++XNaFGWKraYUiAAh24ewmR8
	LB6wrtRMJwBDhtkIvrRVJJ5pAiFYNI6USVKulhVtLSXd9b4dr1Ibd1wAqQAXgwpr
	dTQ6QK7BPJUUBlvp3L38h0tyDewos7yZ7/dAsNEepMgiSHSbqRqdexz3wzeUDEaO
	xYR4BP7B8L14rMd7uuFokQ4oqCMsHeZNMHZS+4RkYxjEHFmg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0ywhj0dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 05:34:29 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso2124426eec.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 22:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778218469; x=1778823269; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2i6vQY2zhkjKUePjVtxsVGkCMbPYzqKLTsKJLhPO/8Q=;
        b=kBkSvXDtZ1vcFFOG0IDCNNxkjMGZEC2ixNdCFM5EJZ3/OA89wORWaQ/uB4AbxufOE0
         kRlwG5WAunAgf4Z3TuSQ84gilL7T7WhaTdxg5q4zyLGbBbGYPbSkN3hyNYQ/pQoSgh2u
         gmsacodFS+qitR+hC4snbPF8LhsYYfxXDNfLugllMRctjJ45tISuzNuAcy6S+Z9ykLGW
         5Ikuo5t2ApufC0Sgt9NT+QnL+cn3lPdNWn6lvJNvpFfjOeMxhNr1gV1BUmkNV8t0DVy+
         xZu2qNOVCMxrzfEBCns6Ej8yDbxWCz1jBQfwsglHhJnfO2BN+7K6jFySjcXWUfXN6+GS
         hMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778218469; x=1778823269;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2i6vQY2zhkjKUePjVtxsVGkCMbPYzqKLTsKJLhPO/8Q=;
        b=eP6IzkEdJF5VdYwZ7fyMIjyigNywWm8+BJb0DFqUS7mDwHlMzZhjc3mLPQbnUEMaA+
         lsR1Xm//xpTCmf1sOzZ8MBIVNemu3/Y7wY/gxe0s4FffE3sKmAtN2SEUh3v2AcGRrTLr
         1ctdveyjuGD7nz6E0X+nrZ/D54NU0FXuXG7JgkQedHcCCjwlvkBCRfyWQSV3udyp9Cpo
         7C1ENzqcFjGUw0+KEymWdb2QVZ3BB/igq880Lv65Z2zOrxdJRorJ1dv89mn1iLqDgShH
         fXMZTCiNnFZdDSINemL16/jSfUNfYIoPz+cQcSvDA3z+5z+mKFmWlI2AMHHVV+86itAX
         mH3g==
X-Forwarded-Encrypted: i=1; AFNElJ+k6ZM7ECDTwA/PPabf6/GI/c824Z5FwdU+I3VGwqxjFZlKHFzct3IwMPF6xBY6uLqFgwWJu0RW4c8W@vger.kernel.org
X-Gm-Message-State: AOJu0YyPxCwd0KHNJHjwUQuTtE09uy7DlCcLPJBRHN4h6TwBEmIG8hjV
	ReLaKbhoBqm16aQdFpeQZMXyLhxKxx2y9+Sw2z5b2djwq/hSGNcAlpScB3qST8kVxsYio0NhmxY
	nk0EWFj6g7IJLQatO4skWZF0cSj6Esrm1nCblrUnjaefsyQHcLkQ1RzxKejjYe6WCsCW3ynAG8d
	A=
X-Gm-Gg: Acq92OGMOLXBS8r7VC7yzkYP2h01u1EMAHny84+lKKFIaOeQFV5ymxIZE2tI+jkWzZs
	taFXT/yTJ5x2aHLfv1uswE93KthcWym/yQu3NSmJa+GXVRfyXa1UBeYQb7Kc5iPovDnjXi/Aug0
	NcVSod/ulgh3l9Bo8rs5UUsvp+9gbkBIgdqEE1wyjiUVtIkjX/NQiWEtP31xdn9mH2Z9jVG62j1
	x98abb4BjjR1l9MqyhyChe/8mNR4xOfCHDiEufMPtcRMAoVO+auQDrD+0VOf0sp6Kl+ujbahWsl
	snP/m1vTVTbnfIaUGxa2Q9uSdzbFANo6wCVWK2agR4i5tpa2eZeVobH+9+2c9bJmk9IAyxfkgd5
	TP9TV3yUpwaSGuxLKSJOhr6obrT1Kam1qzVsDcFAZBzJYe1LjPfuR1EsA9pXgL63iuKBort1zjQ
	==
X-Received: by 2002:a05:7300:a286:b0:2d9:3616:d897 with SMTP id 5a478bee46e88-2f54a77fa85mr6196577eec.22.1778218468703;
        Thu, 07 May 2026 22:34:28 -0700 (PDT)
X-Received: by 2002:a05:7300:a286:b0:2d9:3616:d897 with SMTP id 5a478bee46e88-2f54a77fa85mr6196556eec.22.1778218468092;
        Thu, 07 May 2026 22:34:28 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885be8esm847475eec.22.2026.05.07.22.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 22:34:27 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: [PATCH 0/3] pinctrl: qcom: spmi-gpio: Add pm8010 GPIO support
Date: Thu, 07 May 2026 22:34:06 -0700
Message-Id: <20260507-pm8010_gpio-v1-0-3bce9da8d2ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM51/WkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwNz3YJcCwNDg/j0gsx8Xctkc7PUpCRDEzOLVCWgjoKi1LTMCrBp0bE
 QfnFpUlZqcgnICKXaWgAwgdVUbwAAAA==
X-Change-ID: 20260507-pm8010_gpio-9c76ebb1468e
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        David Collins <david.collins@oss.qualcomm.com>,
        kamal.wadhwa@oss.qualcomm.com, kernel@oss.qualcomm.com,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778218467; l=896;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=EtK9N4+NFj6QWTPadZKysZybLT+fRdMIcJYSRMi39J8=;
 b=hTL+S8J/RoJ1e5ujpIjmo3jJulQpBAtLGIfbaKsOvZ38XxqGNZSbS4TlsS2hvLqu2lSr23JWC
 Dcdqfq5D4iMCWfCuhGC1SsQakYd6sujwtuL05rHNr6XHKr87Er09kCA
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Authority-Analysis: v=2.4 cv=bMAm5v+Z c=1 sm=1 tr=0 ts=69fd75e5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=78EXHlv9UA6XwD1DlFUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: OR-qmxrrtFyZ8D5JLlKTN4S9a7ZR8FyC
X-Proofpoint-ORIG-GUID: OR-qmxrrtFyZ8D5JLlKTN4S9a7ZR8FyC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA1MiBTYWx0ZWRfX7GCWZjsF59td
 ZdoQXVLJf4N8TTe1t7Y9lc4oD0c52pPiMbAw2axgNMqFkR0glGG0SFt/N5B02rYMBWp+Ji2DVDd
 daxSa9Rha6Ix1MFihNodd+RF5pPlXeStrFjA55e6i2u/Tn+J+ndVYY/iyrwQ/f3YvCqSDZXqCUB
 CPTsuss7RhszeDJ7OejAKuvfZr9XIDOTHYRRVpYowYjviuY+C6FsUznOUHK8EHcSUb9NpHftvTK
 m//h8F9wfBWWY0Yc8lwPg9k7kuthGr/8I0TK40JGTBpla577fLmpitBnRG8lc3YZRN0g9QdTkJB
 90NOiXym6qBR/yQj2LbrWNliNlXTO0d+Zz0+DvRmzn8K48XSUbuASapCjSu5jNb9Z4j/Xc+Qqz2
 XDRLxDnAfVjO6n2vOp+tuDAcOEaEuoqYhRIwN4iVYzso5OSrD0F4qLC+u/abCabyoVNHdHFf9e5
 DjMFgoNJBV3jsovISjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080052

Add compatible string for pm8010 GPIO in the binding and driver. Also
add GPIO device nodes in the existing pm8010*.dtsi files.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Fenglin Wu (3):
      dt-bindings: pinctrl: qcom,pmic-gpio: Document PM8010 GPIO support
      pinctrl: qcom: spmi-gpio: Add PM8010 GPIO support
      arm64: dts: qcom: Add gpio device node for pm8010

 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml  |  3 +++
 arch/arm64/boot/dts/qcom/pm8010-kaanapali.dtsi       | 20 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm8010.dtsi                 | 20 ++++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c             |  1 +
 4 files changed, 44 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260507-pm8010_gpio-9c76ebb1468e

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>

