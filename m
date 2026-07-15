Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35FE37106E
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 02:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784083249; cv=none; b=QeCMvVUla5Nt9u7OhVzck1AhWaxjwJTDopV7VFRvDYVH/my1bN1euWTt4ElNhHdMjnGNoMRACvJUpH3O47/UV1nzv8pnn4Vhj5IF4MHHKx7juWydq8VxcR6XSRXrwGeHUZv0KlRA765CpIqiyIQdcFj/L7c85p1PWCa7JeeP9q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784083249; c=relaxed/simple;
	bh=mXE25MOD7qAGKf04cw4pAOdDRL3qCpO0EcAqP4avX7Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=awd4JUB+BAsoi3ozWUXziVeP1/9RR7vYCTqr8g/bFCqpEPPARQcfb4kAyuQ6HjQG1ejmhZ2arE1KjY8UlxEq273ErYQFmArTeYw0KLKDpilRgi3AfRNC+6FCkaW/xQDxm9u7UtBKWnFJLjo/p864o97mKoF+EYNMhDy8XE/VUNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZiI1gAuc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jXdHB8j1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZiI1gAuc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jXdHB8j1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0IB0V1952080
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 02:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/UHdTXmOh8ctZASNscRZZu
	MjOo0xTkaamL8hxFHQpWM=; b=ZiI1gAucpIsdWYk0WtbO7j9sRZ0j+wp5i77/ns
	TVR1WX4ndljoEWGmRQMMSLogaqrnd1ggzSd6UYAv/njUdFy/q4XjLLEt8OwIyA5h
	RgWAZhizs70FCK0WwiWbDg5Dmmo4z+Et4+QYw/FnqvFzzMz2eW50c3wXKb6zH9K3
	SK5I23bSTfXvSSiFcJQH0DDpr0KWkCYebk+LzFIwJ4P2hHPoik4ZyXRkxfYlrGgs
	GpP3qlr+BfjH3T5beyC5Dcq2U1RpJXPMjg0nVTDPaE5v5i5PokmwuAvOqgWye3s8
	EdQ9+XKPauU64zVHTqR+DCkGTGTY9BXzCTAxIeIQZsYuhuFQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9g1m47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 02:40:45 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8895156101so4738494a12.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 19:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784083245; x=1784688045; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/UHdTXmOh8ctZASNscRZZuMjOo0xTkaamL8hxFHQpWM=;
        b=jXdHB8j1TJpLbi5acEOvZ5ygR77y4NCGaYOuUJ2NboFYpjrZa67+mpQa7t7cRs4goa
         r6gymYCfmouzgu2oMZotnrhxpkm4mbVDfBasZt6dzDRrpH5PxHCzdmI1f0YkSa0CERy/
         u+HYoHZyZvKdkQ3YvjaAaCvu7dpDyGxc/VPau3gQGWK0k3QYbNrk9tOvsm1XQoqYoXxO
         EPVxQyxs7D53gQ3YJccx7pgzV78TsmbqU6Ep8ien0pxUn7o7rc+kkW3hRTKygmdMFm3y
         BfBQuGO362NBydGrwAM2xNT4Cizlh/z7lk2Ek1tujfjcUdQ7wOb1hb8Y5+p0SRxOZIix
         +jjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784083245; x=1784688045;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/UHdTXmOh8ctZASNscRZZuMjOo0xTkaamL8hxFHQpWM=;
        b=suX0+XUmXfxWk57IgjSKUc4eXg/V0C6H3poQm97x31vhP9lSQg8a+atySgu0S4rW8a
         wSB+z3iXb5MmK5iLsvQ/Ld+7JO98HV3lZkm+fbL1hfmeCrJMP+l+fx37lw9CHM/YIBVT
         DEV5LSGL8BYRmr1rtkr2A5QqRxpLQRdQDrI9DIafAf8Ty4WEeydxZx37RlkmKeA5jMVA
         RQCp8+TB3g8dJHw6+p56UBJGAmregz3wrq65CoEy6/G6OlzhBrydtMPGfKkEo+rUQ42a
         T3goZTnaVD8bylQ/kReC3B7QZB6PEl9oXWBhkyNiI7VXRkLQLeuyfkodOtBTuJPDPtfx
         n+8Q==
X-Forwarded-Encrypted: i=1; AHgh+RrNeMM3nMPN7f4tiTezFAtu7FcM8B8jKWKJnVJHNUqhZnfCtqVMAHT2iyR/RAkTCJ6pq6CbC8ahEXPp@vger.kernel.org
X-Gm-Message-State: AOJu0YzdZA4WeBl4HMeMUhWAC40RTJmOMXY7+45iz72jRcRcT7ghzOES
	L9ryPn1BRCEbnpmm6gzLjiOT6sb73O67AkCw5RC8mOTtiH4/TBJe8CfdWsxvnax7GxgbeQkjeOT
	cApB5E83LXrl4vqqa2q/so1nxnLMPhkKutS7CKVqluBWFl1VcRWWMkyJ08xiAbRRv
X-Gm-Gg: AfdE7cnhgzfitnozkuc8voGk97Tt+X6KPqlm1PhOYHwU+CqibxvUkH8ZSTIvoFaPG6n
	l6XtMUJe3FZreAJGgyFtNYcfmsdVPcGyNgbdGR/4GVD5sDQmC7xLR14I5+t0xXyUN/u5qUxajkz
	Q365dBKDsOoayel0xTHuGeRZesvnQiYeDmlDJdN3RKlXOtuUuL8YmVltZFnZ8h9Mxkv+63ZWob/
	1Y6HXnbPKtj9Ux2CwQDYK2yo9e0AFzqyxLO1Jp7mKxxNsZ3sFVs5tizJxVyhhsxHu1WpmJbyrgP
	gD0emUSbtR3bSGBuwgNSkrTOLQ9wZWitO66ZA1W94y1QItwtMlIkeYOqZtbKz6/6/n3fZqnT9mf
	LXkqbk7Uf8xzVEd+zq8ORM5HtPvDo/AjKnWOaTG+BNBl9gtExN9CPjLWn6A==
X-Received: by 2002:a05:6a20:e68b:b0:3c3:33df:4d9a with SMTP id adf61e73a8af0-3c36c0f6cfcmr1127051637.1.1784083244660;
        Tue, 14 Jul 2026 19:40:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:e68b:b0:3c3:33df:4d9a with SMTP id adf61e73a8af0-3c36c0f6cfcmr1127026637.1.1784083244200;
        Tue, 14 Jul 2026 19:40:44 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm155285746c88.14.2026.07.14.19.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 19:40:43 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH 0/3] clk: qcom: Migrate x1e80100 TCSR to clk_ref helper
Date: Tue, 14 Jul 2026 19:40:40 -0700
Message-Id: <20260714-hamoa_tcsr_qref_0714_2-v1-0-13047922a376@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACjzVmoC/yWMSwqEMBAFryK9nkCMoqNXGSTEpNUe8JdWEcS7G
 3VZ71F1AKMnZCijAzxuxDQOAeJPBLYzQ4uCXGBQUmUyj1PRmX40erHs9eyx0feolXBpXrtCZon
 FLwR5Ch/tT/hXvcxr/Ue73DU4zwu5YSf0egAAAA==
X-Change-ID: 20260714-hamoa_tcsr_qref_0714_2-d47bd9063ce8
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784083243; l=3088;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=mXE25MOD7qAGKf04cw4pAOdDRL3qCpO0EcAqP4avX7Y=;
 b=KBZvOTsOAl7n2Yky6iNI19CyhIxGgxT5jm09Scn9kt0NHmLd1vrhEq/KCgLEdsXcDFip3kinx
 PB6wylERg0vCRY3ONLh6oCHEtEmZ0xJQvBPKMvoC0zV0yh19L0nc9Au
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAyMyBTYWx0ZWRfX9NoQoVao8XHw
 lVisZ1PBpy9ykO7M9PmWqHW9tHfxZ299Bw/mizTesR53+BWfU9LeRcKVp6RvqCt1sCsuNUyFN+i
 sVrKcLJ69WHqfXogxFEL27+wFYvqaok=
X-Proofpoint-ORIG-GUID: NpYWDfWt1AqqwegTE8vHQAk_XY0T-6b8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAyMyBTYWx0ZWRfX5lHwChHNfhDg
 NlGql/TDezGY4g1rWiNeoYiZaRATBMHFbI1D/PozPKTzWHb2zcKIxTAbzjLokaK3GKo27t8H2fM
 NgQQMeb0p+aE7jcLgsZJEujmxkWyBG86ke9OlrIrWzFW5VdSyIFXuiR4AKC+3sMUgy9zHM7nALL
 7q0LhBogTQoUQrf/3Fda7Nt4/8EQNwFs1WwIS1GLT+8+M6BFEgw9iQjbDLtIVAx23LUIGuOVBzW
 AtPo3fpOhle1OwPUTyWWIPK7Aaq6T6hNKLRzTFN8G2DoYqLf3dgY4tJnsD7zu8YRQdsAUzD2nNY
 iq6DsPaB3RHgkQWn9O/lARlUFbHWNfRjPy9ZT2Py6cDNiyG1dfyTbu86qvRFQ6Xg4LuTBnSdjZL
 y9oUC5RtMsktiAL25mZH2KW2h09VSzAJCFB/Hm7XHQy8ZGtqXDMrnUpJC+u+Wm9zEuXkbtK8ZPk
 M8wlO5gua1CmQpBmmqg==
X-Proofpoint-GUID: NpYWDfWt1AqqwegTE8vHQAk_XY0T-6b8
X-Authority-Analysis: v=2.4 cv=VoATxe2n c=1 sm=1 tr=0 ts=6a56f32d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eDrWBMRqIGSfgiUSBJUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150023

The QREF block on X1E80100 supplies reference clocks to PCIe/USB/UFS
PHYs and requires dedicated LDO supplies to operate. The digital
control interface for QREF (clkref_en registers) resides in TCSR on
X1E80100. This series migrates the x1e80100 TCSR driver to the common
clkref_en helper introduced for Glymur/Mahua, and wires up the
required regulator supplies.

Patch 1 splits qcom,x1e80100-tcsr out of the shared qcom,sm8550-tcsr.yaml
into its own binding file and documents the QREF/refgen supply
properties, mirroring the qcom,glymur-tcsr.yaml split.

Patch 2 converts tcsrcc-x1e80100.c from local clk_branch definitions to
descriptor-based registration via qcom_clk_ref_probe(), reusing the
common regulator handling and enable/disable sequencing.

Patch 3 wires up the QREF/refgen LDO supplies on the boards Qualcomm
maintains directly: the CRD, QCP, Snapdragon Devkit, and the hamoa and
purwa IoT SoMs (purwa shares hamoa's QREF topology, so it reuses the
same qcom,x1e80100-tcsr compatible and supply set rather than needing a
dedicated one).

This patch series depends on:
https://lore.kernel.org/all/20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com/

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Qiang Yu (3):
      dt-bindings: clock: qcom: Move x1e80100 TCSR to own binding
      clk: qcom: tcsrcc-x1e80100: Migrate to clk_ref helper
      arm64: dts: qcom: hamoa/purwa: Add QREF regulator supplies

 .../bindings/clock/qcom,sm8550-tcsr.yaml           |   1 -
 .../bindings/clock/qcom,x1e80100-tcsr.yaml         | 118 ++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi        |  21 ++
 .../qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts  |  21 ++
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi        |  21 ++
 arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi |  21 ++
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi  |  21 ++
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               |  21 ++
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        |  21 ++
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   |  21 ++
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi  |  21 ++
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts       |  21 ++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |  21 ++
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     |  21 ++
 .../dts/qcom/x1e80100-honor-magicbook-art-14.dts   |  21 ++
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  21 ++
 .../dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts    |  21 ++
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  |  21 ++
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |  21 ++
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts |  21 ++
 .../boot/dts/qcom/x1p42100-microsoft-sp12in.dts    |  21 ++
 drivers/clk/qcom/tcsrcc-x1e80100.c                 | 335 +++++++--------------
 22 files changed, 630 insertions(+), 223 deletions(-)
---
base-commit: c69a5c0ea17c77d1e10aabf4827fb65776804972
change-id: 20260714-hamoa_tcsr_qref_0714_2-d47bd9063ce8

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>

