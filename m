Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64FF43FD2B
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 08:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769585; cv=none; b=SnZaDBRfSXF2dEgF+DqiGWSM583HoiymnA5xvb6nRRDCI6D+PN8EqWPkkusKd9jyIHmhEZqwZ1Zhvjuk0btoqNL1vXas1SEEsBsP4GsEbNa1IoTlJfx5TKs48TXuRCbFFdHNHnfPyxodLxreTSwhTeM6BVZPCuU0HbfwCjCW8tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769585; c=relaxed/simple;
	bh=WRsRiucV2U720V3z0WbxA1CeS1n7DYpjh9vQrUnbRJc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hie7fkOJZxJnuSicOngyqc0DKI51rhJeI9M0U47lSpDpnO93UnKekcJPWIX0n0GHmNNc3ly9/7tweTukm5kgjTmcUfYMVJ50WSo2HsL0woFBpyPamSYgXOzf7+gP+OoaLax9amkmNCaTevG6RTzUAPsg4ph87DDllMy/kl0M4cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=am1B1pGK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MPcaf5o3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="am1B1pGK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MPcaf5o3"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68787YC23411570
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 08:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ibxb+Q3FfqwugpDb3vLbkt
	1RoFpIRGq+fnKvNs5nEBE=; b=am1B1pGKdXwVUKUXROqOLPUUjKk/HOjxYG/WVs
	goVRRTEmsffg/L/+IaLpV8rnCcnIUvkZPLpP70hUHxuEHD3bc/GlPOsV91rT5+Jq
	OQ8MzhKmRW6o9iiawFRyES7xk1ycE7Uii2i8uknSgOXg7k6IUg0eWgtL+eNC4DV3
	1uP71l3K/UkDmBkwy2oriErFKYFb5PkTOJgkrgiqK2za0qf1JwL88CwA7n/zwwTL
	AUyKl2E/0lK4dk7udEnMPQlhz8RyJ+vV/a6n1+blETauPtOfBftlqVKqfFLDcSWy
	3Epp/6i6w55cwrPBmnKYE7THSZHoCXCtPvR9NFAm5DreeaZg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfyg2bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 08:26:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb48f41343aso3887065a12.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 01:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788769581; x=1789374381; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ibxb+Q3FfqwugpDb3vLbkt1RoFpIRGq+fnKvNs5nEBE=;
        b=MPcaf5o3JY7cz5H4rzIyQm5Qzcr1iC2VW+95OhaP6Cpuj7v+wVlxO++tzFK4H2/0uy
         jHB57M72OHFUYwzSSB5R/RRgF0/wSFRX7OJrYLPlCUl7nwsrc9g3AFcBLbjhulsLssCM
         Aw0GyP6LJgk0i4geqtTZpqJYJKab098SexKtJXgJHZkOGxlJnHBlDOsJj4+hpOOnRTHt
         8f2KyNFBDw1B6wDeKRfsluEwR8Ppswa+Nixji6fX26Ba4ao1uu5/ZqFiiQ6eAg3XFNCx
         ZgJPDZlRMm1p77REOsNxb0c6HbljLqP8Ph2N3MxTFUfvIPzgQclLT+cthcmbs7QV1BUg
         t8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788769581; x=1789374381;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ibxb+Q3FfqwugpDb3vLbkt1RoFpIRGq+fnKvNs5nEBE=;
        b=pNmTDHRXPQQh1jUFNc/f0jLvrrfUvp4qqn1Oaz7oCZ4bCXW8Xh0FsYUE8K2oohWkbH
         iGrPeltGKD0nNLtuYNS6rcMc5VrUyXGMuilQVmnH1gNg5VHjWQzLtmrL+T9e6h8Mr0qY
         +u8wumYaRvAyyc1G2/QEdWMQc+OCk8XVIrjRjQjNW8VYyMl3wZ6w3S4P8CO5jAZTJIu5
         cJAHY9WhnZa9N0eYzdbCQHcbOVIgTem5uJM4Y/DajzvPxU84LuZdLF/RHn5bccF1vemq
         e6vhpVzI7iY6MmIUYxCWOf8vDNsiB2Vvwk4CAyILsM49nnXPChvVI/F1IBPbIlqgDQn1
         LOgw==
X-Forwarded-Encrypted: i=1; AKwUvBxn46qUlNoqMYfdByRfZMOIZCMGBCd/7vzXzJJ9bBHekDnCVneI+8gcq4jkAWzSoMFM0p2ku+VQvyJO@vger.kernel.org
X-Gm-Message-State: AFuF++lq1XqyeCVbm1zTXJLlRqgRboVvkabpuPyeWsUH62IXeK0hcxAV
	YxpCRjeR0cXapOy9gfs7ZECCHrDdyHd85LVosMHAosASGFh8DRxWxaonnqHb0YKVr+5R5HfdOwc
	YfR8XiwG6l7VHErYiQviVeWyHs3gL3Ucljy3leZKxHSg9+F8B1OmyYeKPRIus/Alf
X-Gm-Gg: AYBFou396yf/4L+kaHWWdZ43b1GBY09x8u63BG7ZmRj/uJeHKL5hjccTj+4hGTMoxpE
	EndBriPyVPg/QTrwVdMGs0nbgTkIoPP2yp4jFZ50s3Ex1pB8Y2Z/lrMbv8+Sp57hrLA1N/bPLrg
	FWF7YcMO9J7QSdwLVK3JDgTWKzMB3yOl627H9CzfkYL63x5LnovYCLjhQMrWt9zOlSjpKU2nOpe
	Pi+CSbv2VguSxe1FV4tgCvcTRNzOmN5ISOwe99usvQyqQO64b/9hAMuMrIf8DYTTGSUWnpGqdtJ
	Wv8PVipQy6J+hAuqPa+z9FGGpEcUQNSi0fzo1yB+lQLUZMC63xYAx3ut4VQzwyDhAisBrPU9dYO
	F5ElA+c5i5u36f9WBzWhE553G
X-Received: by 2002:a05:6a20:cf83:b0:3d2:ee7a:eba9 with SMTP id adf61e73a8af0-3da213cae76mr31098443637.4.1788769580620;
        Mon, 07 Sep 2026 01:26:20 -0700 (PDT)
X-Received: by 2002:a05:6a20:cf83:b0:3d2:ee7a:eba9 with SMTP id adf61e73a8af0-3da213cae76mr31098420637.4.1788769580163;
        Mon, 07 Sep 2026 01:26:20 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33808be8fb2sm3423284eec.14.2026.09.07.01.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:26:19 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/3] clk: qcom: Add Nord DPRX clock controller support
Date: Mon, 07 Sep 2026 13:56:12 +0530
Message-Id: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACR1nmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwNj3bz8opTi+JSCogpdEyA/xTwxOdnCxFAJqKGgKDUtswJsWHRsbS0
 A1/qXEVwAAAA=
X-Change-ID: 20260903-nords_dprx-4903d7acc841
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: foCm9ggtaMbqmakWoTf1o97lfsiG2BSt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MCBTYWx0ZWRfX42pwZaskRBNy
 hHikI+icRRAVq0ebMBG3uozBXp+26fR3kD8SizK4hEmPUWYE5WKcDxVMKUHzJvQtU7PFWfRgtM6
 wZMWO6ybz7DmOr6e7trA8qsxc7WnyD1ZNjLcuzG5d1x+eVIcckhg8PXzFtMFGTbRtzN51I8Ekux
 0PQDceHT3DrZnasgKvrbaUG4/foQB/J1G6ZtuLrLxQU2qlCwIpQKe9BSSRg38YUMuIZv0HpWGSj
 zY7dY6X0VAYEhttwLnqVHLQhlb+BEdahvAXYj/1NGuDlCxe1tJ8WL0PhGhHA5AY5jLaZhJWgiLZ
 K2OEV7QgHReH+ZUWHZk3IcMlvqfatKJWyfybSp5TurcsGdVE/bIelNHXrd26VyJtv8m4jDxz94B
 ZJODv0U4mYKivDfw1SRnruzk5UgUJ7U32H3wWxiprj42zXpdwSST1oyJINPOAMVqgNMDTeR6n+8
 2baX9HkbpnTYUProq9A==
X-Proofpoint-GUID: foCm9ggtaMbqmakWoTf1o97lfsiG2BSt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MCBTYWx0ZWRfX0rZ0byZ+r7AY
 ekzk6z/btUYFWPsZLpCjwL/xukPvVzGu7muGuegxrUriadw2Y+7ySU5jiBZ7G4FSsfHYV/gpjlf
 lZR0cVX+XNdE8nSd/AlF8EJaDrKuy4Q=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9e752d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=lgvwsS_33UyABBN7wXAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070090

Add support for the DisplayPort Receiver (DPRX) clock controllers found
on Qualcomm Nord devices. There are two identical DPRX clock controller
instances (DPRX0 and DPRX1), each providing clocks for the DPRX core,
audio, AHB and video memory paths, along with their core PLLs.

The DPRX PLLs are ZONDA_OLE instances whose PLL_ALPHA_VAL register has
been widened to 28 bits to carry the fractional word at a finer
resolution. The existing alpha-PLL core derives the ALPHA_VAL width
solely from the register-map layout and can only express 16 or 40 bits,
so the first patch adds an optional per-PLL alpha_width override that,
when set, feeds the recalc_rate/round_rate scaling and the Zonda
set_rate L-adjust MSB check. This is a prerequisite for the DPRX PLLs to
lock to and report the correct rate.

The series is organised as follows:

  - Patch 1 - alpha-PLL 28-bit ALPHA_VAL width.
  - Patch 2 - documents the Nord DPRX clock controller device tree
    bindings.
  - Patch 3 - adds the two DPRX clock controller drivers.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (3):
      clk: qcom: clk-alpha-pll: support a 28-bit ALPHA_VAL width
      dt-bindings: clock: qcom: document the Nord DPRX Clock Controller
      clk: qcom: dprxcc: Add Nord DPRX clock controller support

 .../bindings/clock/qcom,nord-dprxcc.yaml           |  68 ++++
 drivers/clk/qcom/Kconfig                           |  11 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-alpha-pll.c                   |   7 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |   3 +
 drivers/clk/qcom/dprxcc0-nord.c                    | 436 +++++++++++++++++++++
 drivers/clk/qcom/dprxcc1-nord.c                    | 436 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,nord-dprxcc.h       |  27 ++
 8 files changed, 986 insertions(+), 3 deletions(-)
---
base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
change-id: 20260903-nords_dprx-4903d7acc841

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

