Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31ACD2FD681
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 06:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775025338; cv=none; b=JsUTl2nJYKFSRaMF1eULSUkpASzXqrmd3pLg++Hf8M1FyrZfV36fkWX6jOmD2kyKkSjmNI9OOdjZNwMKhPKwVawi86KscD1LiWegcvMPkQ5441C8gtK0MIcC7HeZkA9YSFrob+8w6VL0W6baRN+7TVyC6ImfQzwfFXj+wctCB2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775025338; c=relaxed/simple;
	bh=pZgJfIlthTCYN9wLzuXbK0NjilNyt3lBCh93LAZc1mU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q0azWiEM49w0ULmsaZOeaR3RH6IxARkyhSfU5EG94BTlHPaw6o2K3u/y1sCDws/pWWRQQ4Tf0oRWvK/jgx5TmPIBzRyKKKVv4m61C1Lx6RtHtfhHoaD1/3s8+npmsuQgbgRdGEI5NqVMW0X5+X5B/0tc6itJoxCS+N4tJBsLSEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KPbHFyjt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EbcunRjf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KPbHFyjt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EbcunRjf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6312IrsY1004266
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 06:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Z/Xwg6NdWjuQ2U74auSCsp
	9k1g83Vjj3epMh9+/ls5g=; b=KPbHFyjt4rpCpD516jII9Yr9s2UkqTCBIWbdwU
	qOs08qv4e3WuO9ns/wKKo6Asyt9oGf0TEgl1UAJUSVc/xGNO9D0dkbpqgkRfVidW
	ghsrl3jltmfaQ7QGNuBPlYU9Wac3rf6XvlLOymuh79j+xxB6fDrsbr3g5x9OOJav
	XwUn3dTWrpnRL+g4QTEkB/8YQY7ZT+H++ugVI/CQGro385N3i4Se4ncI3K1raCHn
	GfUUVL6pHW+PTWcBvFfBhX0J6NElmcETKE14p9SqOY8XzlYIh+wiyTmYc5BTvUQr
	v4/pRJ9IrmZIlWJg4NLBO+OKuTA411JGNtiuTyfNPxDo8AhQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8tfjgvrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 06:35:35 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-127337c8e52so11604002c88.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 23:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775025335; x=1775630135; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/Xwg6NdWjuQ2U74auSCsp9k1g83Vjj3epMh9+/ls5g=;
        b=EbcunRjfg54flc1c2L5a96boowEmgsgSm/sBEcmbjS5+AoICTtqlMwrLJrqmc/+ezM
         X6OPtf7rQYvHa+qOO2JkzYsXPDxJaNJf+PrpWT11B2EqpfMjrvnFwU89u7Ic5D5QWmFo
         ZNZ9cwLDbtmCpfsPnKCAEORRycE04MnYS3xUEmn1GsaNKs8CPTBgG/pIN/92DxVThSTB
         Ki0fzVHU9WltmlMQvqJ3Ddt1eWJ9sixdE9fGcFnVROf+KsdHqksVA58tEBWQGsEXTb0w
         0TYbyFyebjPyi57UQN4u3nHvcf7o5vv2KOVNaF2aIQlMyfO1pTNCWKTt0/vfyaio2te0
         THlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775025335; x=1775630135;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/Xwg6NdWjuQ2U74auSCsp9k1g83Vjj3epMh9+/ls5g=;
        b=l+22wNPcSLqbHfzjB90qV9RwhI9/3TqU6z4WIZrcg5PYoi8pNwADnvvnZHyFJo4z/V
         bDwY9G+duLK94pcqBGCrU3Fs5o18H/9nd5O0pAVXacvbmqa8q+m83k6mkLTWC+3fNgrz
         0kKcfPtfkM14k68Ylgh8tCBLTIOsBjL8DzAXNGxT2wrUx/zZFsRycTMqq+tgGa3lRC35
         ai3glW+uyteDX5+S9cKGWvzi7UbCzylnP+M8XlbakzqK0CuxcHIXAef8x9jEPlzEucDl
         rfmeDsSSRyW4jy9o2SDBuIyByQZo2j6kKVPp+s7VlW3uoRJycrYBJxjFuOJBqZDWzNN3
         oh+w==
X-Forwarded-Encrypted: i=1; AJvYcCV/Cxml2bv/X1FEmcBRD/CyUoRgc3LxXXMp+FdtjrZ3sgBl5plYTS8CsHFMD0Ma+ZKEXv4cn0jtAD73@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6+Ul1o+42hk+NANEkaeha9AV9u8uKFItHlZH/lJT7wJGi/7h3
	EACGBIYAce/+tnIo+3G0xWDJW/Mh3+cQQMJ/W2od/tWzGfAz6uyfEeKrR66oCxx1lYpOoIrnJwY
	sNk60A26xltrKtKezGOPmTzjO0cRX+jCS1GTP5hEoH2tvcujNb7uDuhUU9p3F57WS
X-Gm-Gg: ATEYQzw6yXZbGKSSeNVxO0R77Inn4cRxGTlO+FmHyyU+X/kU6s6mErit546kCmc7USN
	d3peOE76EEb/gHDt8hdauaSRvUJ473lXYF1USVrPCq8KBVVC9gGeWeFlLgcvu6OpgHXj6pB+wPD
	EBELzCIYBZRy+UZND/rXpp5EX744DT4LEIlmGsBMywibNh1vmmjA5TaHrV3fuMMsslDIVxVfTkn
	V8i139I5bqqOvl/ZQoaQ5ZYwPaOXjAtWb0MTwmr/YYOh3k9GDvpDXwoqUobgkqoOSkW8cTT7Oiz
	sHubHboaysr29i3aHQT1zsngfXX1TUNhr7n1F4SENzcHoyH8Q3HaIZl/mz1v1myzgS+f6/E6YOM
	kXol+RaFWZ7zqhHwYCqhidPoP2tV45cFXfVxjqJBHHpLOL47WLHGAcz7M77RZbleG6cva
X-Received: by 2002:a05:7022:618a:b0:11b:7970:ea3f with SMTP id a92af1059eb24-12be6578552mr1536512c88.25.1775025334507;
        Tue, 31 Mar 2026 23:35:34 -0700 (PDT)
X-Received: by 2002:a05:7022:618a:b0:11b:7970:ea3f with SMTP id a92af1059eb24-12be6578552mr1536483c88.25.1775025333824;
        Tue, 31 Mar 2026 23:35:33 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97f6994sm12027550c88.8.2026.03.31.23.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 23:35:33 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH RFC 0/4] clk: qcom: Add common clkref support and migrate
 Glymur
Date: Tue, 31 Mar 2026 23:35:25 -0700
Message-Id: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK28zGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY2ND3cKi1LT4svySVF3jNGOLJBOzFFMLE3MloPoCoExmBdisaKUgN2e
 l2NpaADYT16dgAAAA
X-Change-ID: 20260331-qref_vote-3f38b46d5847
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, johan@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775025332; l=2248;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=pZgJfIlthTCYN9wLzuXbK0NjilNyt3lBCh93LAZc1mU=;
 b=eK8hXo8iF5pBml20zvFA/MQ11chaCiG20yvmVZ0FOCsH2NDyKH08/z8TSXPXmxtA//TuxYMyq
 YcA4Rc1c0doCWSeDwd6IFvoEDW1HptLP8FhLcVUWBUPNZNX8KkFBAbM
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: x-n9ajiAtLaP11LcqSZcRW0JMTj6y5km
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA1NiBTYWx0ZWRfX1dpDfdYsS/kb
 6RdsD3BjqA5NnyXiJW2DGhhd/xLipnlPN214ghVF3EyB5YfKEkATT1Or1hyEk3I00taK6FbSNx4
 aVNJrDFtxQ6O6FiYyGa9nQS+89M/sw4v8fxQ/hX7f0JfkJ0qo6IvCpsUEgildcqCd1GrU3e3qVE
 nNgF3ksC6Pr6I7GWSK0gLX8ZqOlKUYhGYVTLCrDd1dGNA6XAWg1zqoDNJp9jAg5VjaxzLrq8bpr
 Y9ty7nycgM16Zf3UqEPvxljP/cTCoCqG21RFQ+CvwnngBhd/HmH4vM32MJlP0IEzJik9/ilwEtS
 Yo3i7BaXqUxz2BYo2x3x93gj+8lnbaVKiThYBQs3wdZc6Vq/x/o7v3ULEU+zHlgwoVb0Y3Tt7V4
 Xo9Ty7mtua0NSf6DKuy+gtcFyM6BnWTuueXkbc4rpOS8uLJHNE2Ak9HJ5bnR6F8a1K7wcypGjpe
 ZefnNZyD8niGUcdw40g==
X-Authority-Analysis: v=2.4 cv=fJc0HJae c=1 sm=1 tr=0 ts=69ccbcb7 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8 a=gTLHQjeEnPAAWBE9dSMA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-ORIG-GUID: x-n9ajiAtLaP11LcqSZcRW0JMTj6y5km
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010056

This series adds a common clkref_en implementation and converts glymur to
use it, along with the related binding and DTS updates.

The PCIe clkref clocks on Glymur gate the QREF block which provides
reference clocks to the PCIe PHYs. QREF requires LDO supplies and a
reference voltage from the refgen block to operate. The refgen block
itself requires vdda-refgen_0p9 and vdda-refgen_1p2 LDOs to function.

Previously, these QREF votes were done in PHY drivers. In earlier
discussion [1], the feedback was that this is the wrong ownership point:
those supplies are for the QREF controlled by clkref registers, not for
PHY directly. Based on that feedback, this series keeps the regulator
handling with the clkref control path.

Another reason for this series is reuse. clkref_en registers may live in
different blocks across platforms (for example TCSR on Glymur, TLMM on
SM8750 [2]), while the behavior is the same. The common helper lets each
driver provide simple descriptors (name, offset, optional supplies) and
reuse shared registration and runtime logic.

[1] https://lore.kernel.org/lkml/aEBfV2M-ZqDF7aRz@hovoldconsulting.com/
[2] https://lore.kernel.org/linux-arm-msm/20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com/

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Qiang Yu (4):
      dt-bindings: clock: qcom,sm8550-tcsr: Add QREF regulator supplies for glymur
      clk: qcom: Add generic clkref_en support
      clk: qcom: tcsrcc-glymur: Migrate tcsr_pcie_N_clkref_en to clk_ref common helper
      arm64: dts: qcom: glymur: Add QREF regulator supplies to TCSR

 .../bindings/clock/qcom,sm8550-tcsr.yaml           |  26 +-
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |  19 ++
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-ref.c                         | 202 ++++++++++++
 drivers/clk/qcom/tcsrcc-glymur.c                   | 340 ++++++---------------
 include/linux/clk/qcom.h                           |  69 +++++
 6 files changed, 409 insertions(+), 248 deletions(-)
---
base-commit: 36ece9697e89016181e5ae87510e40fb31d86f2b
change-id: 20260331-qref_vote-3f38b46d5847

Best regards,
-- 
Qiang Yu <qiang.yu@oss.qualcomm.com>

