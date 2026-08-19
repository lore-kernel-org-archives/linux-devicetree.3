Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36ED233941
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787143995; cv=none; b=VmM20q/5gWzJtGEIdk8r33kFk+aGiI/8MJ13pbj64HFTQyiytNmJv0q/LxFKhbS8110SNWtkVNJYMs0/0eFQcx7d6wJQwxoeFeDV1LpJDxAWcc1fG6zAsbFIDRbWqGihROqwpbfmmrcJ8ChfWdUZoGECvQSBNjVd8qqNEZ4FV2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787143995; c=relaxed/simple;
	bh=aocfws8Kf4eH/Sw8YBlJiavOC8ubRD9ZJHDiRz8wOdQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ngpJ9GIo+m0YTVzaia5mhAIrYsPgAXJFjfsAor4LVY+YkGsUnng8njzrTaX2L1xcKudL8exuk/yQI8/r1w/1sOhuR/BKQnRyBs/hLwoPcs5F4fkmwEGP73sNe5FYsxQ274H2WrGs9GumEl/zVXsgSapAkTgYqG+4p9hbuVZ1ZNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mtr60RZz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JMyZZ9L1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mtr60RZz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JMyZZ9L1"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JClH2B341777
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=W4Xj50xooKVvZ41LfzpQRG
	7HYPYstHlBe1B3U8mLEO0=; b=Mtr60RZzKx7Vi4+bEoyhNS7qjhyaYU3eEfVlkr
	F1nFZyzU5c64qBW631XDKV3er+PjEgu5mwiU4puMCDklqwhwCn1/4boHHGmMWoWf
	eWSZqRvga+lF+PxtW3VrQkUDRhdkF/AZ9yC2RAP5/Xxppa6B30v3SLG9HBEb2Wfz
	TTKt1yn4+Wv0QAsTmYrr9kj5RfZiOFMSx1TkXwB3+LImsJ2Bd6noe1hwaEN+ezgx
	asYaBbsF7GIHC7qMdhnVHrEBm9yfvTMnIlJhNErUXLBSkREBzUlyWf5XZaAcyt5+
	IdAnfn0Az5KsMGHkHSaSk8M3txs3jqeuE6NlmBbuLHJ64K/g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkb8qu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:53:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9309af14fd7so114157185a.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 05:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787143992; x=1787748792; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W4Xj50xooKVvZ41LfzpQRG7HYPYstHlBe1B3U8mLEO0=;
        b=JMyZZ9L1+n5k6ipqJNOfD6qU/m2owJZ2fiiYhdpC4UgpUxIvxywhNWUq5CzuKNl3/o
         y8SghfhJ4/8AQNcFEj0bb8kzJ3YIoKCnlbjNRSYAuqagyynrS4M0UE4JH4A/kSxrC9OB
         nDOjWmXNV/Eg9qxTa6H0wpwivTxQRyRVEYD6RwsefVwA388bw686JVe+gkVr2LeeF0kq
         nJzaGmD9/nn5Fyvy5SapMl1vyGqAETTd0WQ0sxH/HWESc30jJ3YQKqnaZY71+qR/mwlD
         wwmV/mJuzLAdSDlUvPxfYyfEBjMyTETYBTC5A5PYjgCvZnYsN4/S3+jGhOEKnugAU+8X
         +E2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787143992; x=1787748792;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W4Xj50xooKVvZ41LfzpQRG7HYPYstHlBe1B3U8mLEO0=;
        b=DP0dyiFb7xdnYVaUGtwKcVeGGLc1LUoieC6JpVV1x/KnIo4kv8fmnl5GqiPJ8LOrv9
         xIn6FX5iFLd5+R/4ARcwEVNdo/a9jS9kKimsmbrSTY+BMrAIZHykNUhod/AE5GRLbJ+I
         m5faPlUVZawnqK5i1ft4Vac4zlkiVz1h/lL1FzzTVoAHTNTyCwpC7w9o1r4YIgPu9Id6
         dFFRjn7JYaDmyjHR50W4lq75KDjQGzo8YH4VHvKDlelhGuxnWnDCYLGUps+cTXCPIEns
         9S87BDrn2z7oKEHejKyaXJynZ+4z/jroDW2g9dBAPX2tvCKv0HALRUvbNqnu3+VC0BDp
         e+tw==
X-Forwarded-Encrypted: i=1; AHgh+RpZY4Kcgjgx1QiXVxKqqoPth1HdOzdQjNXLSJQnjbA0MvRMRcTdi5DkZzUkM+kRyGN4kPpDmduG4WrK@vger.kernel.org
X-Gm-Message-State: AOJu0YwLW644f0Q4LfpHgzeUkqkfU7o4h9MaBDg0kmVeyhr0bjyyJRXS
	is/Ya5cdysa/QmFqOMDgF5Up/7bJknFfegwQdS1qNzyEQ7iA752zGvl4UNKiAdVH3k3qzA5qPMg
	CIy/LCZmVGmY0K8EUgkDImCoPOcJAn0ZOJV+uhX2ayPydavbT/eZD4kIuAhLGwAne
X-Gm-Gg: AR+sD104bd8rh58Cfip+BFEsWjEML7fPkvmVu60I/6vEfSSjBPFvtNd1xGpYqj4j5S5
	3AtKH9YWVu5hjEVTNqdw+1dJbVvsz1MQsI73PPxfYUvz3x9aykLCjDtLMhnjrLeMrtJ26UfacTx
	n74WUze7ZkYUbvOn72kwSmSrhOhqD6rrFYYYAimN0yPFwj+gxJDzhuNjpQ0/156QTvO20JgbHZ7
	o6P1l7MgwabzJLKtOpa04dprFvJfyOie8oz+DRZ9wSnqasCeTuTFGALKyYQEqhZMCWd3pruvjXV
	OFnX0xHEwQCH5m9ns3RGoPON0NaGTn6MwgVxEu4vKAShrmpT3CLHDlxNrfO2gReNKz0LMBjWU5L
	QIL5JA5Z+
X-Received: by 2002:a05:620a:3712:b0:936:e3c3:8cb8 with SMTP id af79cd13be357-9371e6b89d4mr353289685a.45.1787143991957;
        Wed, 19 Aug 2026 05:53:11 -0700 (PDT)
X-Received: by 2002:a05:620a:3712:b0:936:e3c3:8cb8 with SMTP id af79cd13be357-9371e6b89d4mr353286085a.45.1787143991242;
        Wed, 19 Aug 2026 05:53:11 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm77954795e9.11.2026.08.19.05.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:53:10 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 00/16] clk: qcom: Tie CX power domains to GCCs
Date: Wed, 19 Aug 2026 15:51:45 +0300
Message-Id: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOGmhWoC/yXMTQqDQAxA4atI1g34g7HjVYoLjdGmoKMzowji3
 Tuty2/x3glenIqHOjnBya5e7RyRPRLgdzuPgtpHQ57mlD4zgyvbCYMK8oHB4siMVAmRqagwXQk
 xXJwMevynr+a237qPcPid4Lq+X4pV9XYAAAA=
X-Change-ID: 20260819-qcom-tie-cx-to-gcc-67e6697639b5
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2501;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=aocfws8Kf4eH/Sw8YBlJiavOC8ubRD9ZJHDiRz8wOdQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhabmcGAQo+AgyO+pdhoONhZ96Vq0a3hnMoZKN
 g7CUF4C/LuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoWm5gAKCRAbX0TJAJUV
 VhhOEACw96knL/mvjuEArdHD8XF9el94DR2ie/OGimOQCGjS4UnVDeHFms65M9aJiugfzzu7UIi
 6f9VHM7oe5NwcnMbLIlTkj6aJ5eOWZy9pcZX6iH9V+STHEoiIHYnvdsneoJk8maac1P+j45J4ms
 cbaAtFakeFa6CYlsLfa1vdPVZc5haeh2ZsMVi5TetvkRulyzik1P63SxOWt4wV1NMjTjxoQw7Cd
 9ykT7hPuYQCbl7CPpXLqQI7sYajeiB2T/Jtjc7VgMknYlByHXT4+zHVBPtDuBP7feuqlLXLQp5Z
 mWTvx4x3Q/3DCLZoh3ucBvysGko7n/DFPFzh6YTXCT4RGwloFB7MMoJMxXOX7wJvKcTvIu7iTYs
 TMx4dTjr+iP0GLrGZgQvocLPv0JtXzBfp5lkpjvyxz1UEE/R66aJdFIgl8CmImoRz2TyhZob1qc
 F6ov9pSq4tNKyLRNaqU2ZmMvau/LZSqKZJgFIxU6veI4FzIaRqK5Qhv7GnTbbZNaS7uyV8hRoat
 87sgdhazgKwf6UdbK4Rt7vCVm7KAb5xkfafHRgTzeNC40RF5n5dgchmfmQqoT5/7st/dCQ71/vD
 y+ny/gacIeziz4PYm9TqspKqbFiMxjI+PuZOXZvoaWY0l7PuLlRavzFMzjJ2f+2/R5U1yBzsktj
 r+rO2buiRCodKcg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: Fq7Jf36tt_DC3MHCfkU-5y-Z2EoynECs
X-Proofpoint-ORIG-GUID: Fq7Jf36tt_DC3MHCfkU-5y-Z2EoynECs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfXyNB8SISeEoqk
 cVLMuBoLiSrnYVQO0UiAXYZUHzOj34XGwQE8sp740yLNOiJWirPq32lx2FpnUhJrR4N4o0gVAHg
 jFPvOwJHap2Y81ESmFtFVTOyj6Xytngf8Ba7ng718GMCo/ZAM4O4sgXzh4GBEmhU4ZcV+AT/i+m
 xQ+Ql60VX334TQEDV3fQ0IFNY0wCtmFJN6s6q2Ix+b1E85VS8imon/re05cs8YCBX7dJRAeVIbS
 Rm1fro2BUqxQwhWNIzq0hdTqqaRZEXBf5Ks16zDh6aXm82UG8udNofZscpgyQjSfiPxcO9ZdtOQ
 EF+MBLt6aZJq7NqKkgQmnbiYEg/ethQafjPvwCPxTRmdE67eJI9wN8fYxmvr6OgtHqbJOaOBfLp
 LCSx44yXmKuvXEgaXzbXgNfW6SJWcuvzNCLSPVDu7f8pwdpsmqm67mOOZ+7KcASfgtssEEghK/v
 B4Zd+241RSOMz7x6ZZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX1NPPz6KdBi8J
 JFzragkbY/Xy+2vqW79av/vqt+cj66n+LF6vpcjKOTgsNZezzO0fbVOtbBs7ihK59jC03ADmWEA
 mDy7hcgXYiXX2nW0xPtWceR46hsJZP8=
X-Authority-Analysis: v=2.4 cv=fvfsol4f c=1 sm=1 tr=0 ts=6a85a738 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=iXTosI6WrnVeENpZgjcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190100

Tie the CX power domain to GCC clock controller for SM8250, SM8350,
SM8450, SM8550, SM8650, SM8750, Kaanapali, and QCS615.

Also enable the runtime PM in each of the GCC provider drivers.

The existing common GCC schema accepts the standard power-domains property,
so the bindings require no update.

Only Kaanapali requires a Fixes tag, as runtime PM support was not
available when the other platforms were upstreamed.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (16):
      clk: qcom: gcc-sm8250: Tie the CX power domain to controller
      clk: qcom: gcc-sm8350: Tie the CX power domain to controller
      clk: qcom: gcc-sm8450: Tie the CX power domain to controller
      clk: qcom: gcc-sm8550: Tie the CX power domain to controller
      clk: qcom: gcc-sm8650: Tie the CX power domain to controller
      clk: qcom: gcc-sm8750: Tie the CX power domain to controller
      clk: qcom: gcc-kaanapali: Tie the CX power domain to controller
      clk: qcom: gcc-qcs615: Tie the CX power domain to controller
      arm64: dts: qcom: sm8250: Add GCC CX power domain
      arm64: dts: qcom: sm8350: Add GCC CX power domain
      arm64: dts: qcom: sm8450: Add GCC CX power domain
      arm64: dts: qcom: sm8550: Add GCC CX power domain
      arm64: dts: qcom: sm8650: Add GCC CX power domain
      arm64: dts: qcom: sm8750: Add GCC CX power domain
      arm64: dts: qcom: kaanapali: Add GCC CX power domain
      arm64: dts: qcom: talos: Add GCC CX power domain

 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/sm8250.dtsi    | 1 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi    | 1 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 1 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 1 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 2 ++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 2 ++
 arch/arm64/boot/dts/qcom/talos.dtsi     | 2 ++
 drivers/clk/qcom/gcc-kaanapali.c        | 1 +
 drivers/clk/qcom/gcc-qcs615.c           | 1 +
 drivers/clk/qcom/gcc-sm8250.c           | 1 +
 drivers/clk/qcom/gcc-sm8350.c           | 1 +
 drivers/clk/qcom/gcc-sm8450.c           | 1 +
 drivers/clk/qcom/gcc-sm8550.c           | 1 +
 drivers/clk/qcom/gcc-sm8650.c           | 1 +
 drivers/clk/qcom/gcc-sm8750.c           | 1 +
 16 files changed, 20 insertions(+)
---
base-commit: 5453bc3279e9f8578ac3e534d476240e40c879e1
change-id: 20260819-qcom-tie-cx-to-gcc-67e6697639b5

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

