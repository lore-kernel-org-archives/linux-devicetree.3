Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07489351C2F
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785292837; cv=none; b=sB0YaKMcvl2JWB/4ChoixKgXoQk/e9daOG0BBBQsvefJXhhLk/ySguj5Ce9K9w2LZju4uv92l0eneeQsA+WxbYAd8RCiqY6az/cl2ju3NZkxdOmfaD+Wn1rui9Rp62Km0Xtn/dFGxohAzstBJa+mvv+egUu/21IeOkCJBmupDAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785292837; c=relaxed/simple;
	bh=tCkTJGnorrZu6FQ77OJqvD4oMCa0G08DpCutA09eEP8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DIjseEuynKIgUS6d2C0lpqz+p1bVwMAxPtJ0IdXTRv7OrEFuzA/S1D5dWsqqsKd7tE3TENNnzZv8M7Nzfyp+HWXWWkY+FTF4z+TDVL8rC0HYl3EbCfz7vWaBr5ccXnu/5n6WV3ciZnJWStQOYRfMd3nr/ElMvgm5FuP+LFZ3zcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uc1j0aRy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kYEsRAX5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uc1j0aRy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kYEsRAX5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T1GpQp088919
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Fi87F6NT5fS/ibJVU31YLj
	hdFsFZpCK7qAyusMqess8=; b=Uc1j0aRyyV66EtHbogTzPMdJvpLRThLVlO/c/G
	fMGLfr5H4euiVHBEPOqZ9gTrkYhgTRyfGUXUbjEpNM+w6gw7cRNGi2H/UsXJhXJ1
	jEz2BS92Ds8L1Oh4RyaPl5IjHqQlyul/iC3fu2UxVgXbxtecPSXG1vylQlU8mTr0
	FtMtQlz0BapHH21QqGmYDzvr9bAfJrP/+wZT3bgqwBmsLvCE6jAPdUoo7fdvr6iq
	UDH8SaA2Y1RCw8h+IKbzF6Aps1m2G2AJNlFWgNrWSEUn0SdUSLRF47JqwfNePjrv
	se/0d1Y36FOYvdvmN5+Ez+ZKXmnkvLGBrW8kDAnt1s020+ZA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpvd3kjv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:40:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfd13d6d50so600815ad.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 19:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785292834; x=1785897634; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Fi87F6NT5fS/ibJVU31YLjhdFsFZpCK7qAyusMqess8=;
        b=kYEsRAX5QH3RNUcNkfpqaHjvPJLhldiMufCthQkviJfkjRSfKyYaNqwFjZ/cCTjadN
         +Wem3Wq0dGPSgZXI2uCYhmAsGzGnpKrWIZ8dakTtUF4EQ0ziUaLtXzIVNsr0vAvAjrZl
         t91a0ugoI020A/G/VX9osJZ2/5TLU9zGsU1+p4vof9epdUJaxXMxo9MCfVbNYGq0rCDu
         tXLQyPu/j3pKQ/mZRRNBr63aTZ1+78P6z8zcPsMX5fF865Ksd0ND2s5bXcKyifLLFm6T
         W5dtjxFGa4CCg55Q2vOhbCaWRpDeq0xFj4gwOTugTXxSk0Oze4/fGFeVELA287tz5MwT
         WHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785292834; x=1785897634;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Fi87F6NT5fS/ibJVU31YLjhdFsFZpCK7qAyusMqess8=;
        b=sUlrvmO2+O+Tz73n1d5vULIsk3KyF/D0dl1+xq4YYycb1GIFLVsBzQ4tLx7AJBVcWQ
         2gYtWrb8pLu+nwrBa/TmpFjPCls/pOZW2iVqzPf7tWG8fNW2iXnyq+1e+cg8zGe21rqi
         0kaUqeW8TTI797kKgaalT5K//I33G2FZbNNly3HG9m3VYuedG77ZtrGmt2Ley2Tqp8/F
         Sxua+EcRmiRdz7pioLxwDURdAPB19gqV0z0Fy/GXYk8t0GFS/z0lhJYQOTO4EyBo10LQ
         oAFi8XvKVhWrRrhXeh6zWTEsru7HDiyG9pxEEP5Rkw9cSL6k46kwJ36RpbS1wwOgyU6V
         reFw==
X-Forwarded-Encrypted: i=1; AHgh+RrXSMqWFzZsgdYhBe2/A5SgFBFgnDGunpkI6uc2HMqZZU9DCYY3HfM30Rf8vnlU3xC8T0yxKN1udmCs@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/frKJRqNQi2ILe+YNh+xSdq4VFBLnSmlZtWFY6zJKT4xUwA7j
	n3squJg7vMInh+7QeGonF2brgfIGGQ14Fa5RqNQhTdiJIozqcxAxYoJzAjc/K4XrMzDK6MQa94+
	3wx107ZA2e2jMKBrh8BuWD8uEHqp6eac2G/mezyzx+6bu3SuvBRFJ5jVOrYmUvDL0
X-Gm-Gg: AR+sD114gzVmBt6kF2R3cYE1q+pzYcg6ewmJ5Tgz3iJ97416ozcHhI6SLdljVdg/uyv
	M+07UbvekikuDGPnLEYENVT1rGn3forNxfYyYKSge7dX3ANwjJOVbtIpn3NojAz4PEOcQ7bNNsH
	YXdgBVMdoGAnS01p7ll2Uy4s721un+GbIchNiA9d1PJDZnOYHM0t9bOpaP4rKzxcyOMCZaRHsTh
	32Q9j0hJGmth9o78IOST9TiE9nVqo/sO0z9N3gQ5Fhptvr+W6aoCPkxXTSA9oBRy+ftCfqJygGP
	p6ZcN1aeW5k/AG/GFFQuDVGAMR9reQC7EWnOn1muqwiGp4mMCf1Kt0upt3ISnaURyHYxPbBumc0
	tEfXb9KWuDWfcAqaTJrZgK4B8SAsOM4RmNeT9AAoibGN1feIE+dA=
X-Received: by 2002:a17:903:2290:b0:2c9:99be:f011 with SMTP id d9443c01a7336-2d015c75207mr42582515ad.6.1785292834373;
        Tue, 28 Jul 2026 19:40:34 -0700 (PDT)
X-Received: by 2002:a17:903:2290:b0:2c9:99be:f011 with SMTP id d9443c01a7336-2d015c75207mr42582145ad.6.1785292833951;
        Tue, 28 Jul 2026 19:40:33 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc64c2sm4052694eec.19.2026.07.28.19.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:40:33 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: Describe the PCIe M.2 Key E
 connector for Monaco EVK
Date: Wed, 29 Jul 2026 08:10:28 +0530
Message-Id: <20260729-b4-monaco-evk-m2-v1-v2-0-0548e1dab760@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABxoaWoC/32NUQ6CMBBEr0L22yVQgVK/vIfho5RVGm1XW200h
 LtbOYDJZJI3ycwsEClYinAoFgiUbLTsM4hdAWbW/kJop8wgKtFVUkgcG3TstWGkdEUnMNU4TW1
 Ho1JyL3vIzXugs31vq6ch82zjk8NnO0n1L/2/l1Vh2whlDHV9q9SRYywfL30z7FyZDYZ1Xb/Sr
 BfzvQAAAA==
X-Change-ID: 20260727-b4-monaco-evk-m2-v1-dd56eb997378
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAxOSBTYWx0ZWRfX64keLPHzBbOZ
 gGMFCpGWrt54j3ZmGL5+r6EZ9JtaG0wNSR5DkIe+Kz3n+5rjALZ9F+unK5lIcY1Q3cLOYtN+wNQ
 UaLty6zprm/xkcWJUGHj7v+VMFaSmlg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAxOSBTYWx0ZWRfX7YkQY7xdH3YJ
 nR6hlbqEcvdPx3cAx//BBCeuB/2mxwr3endzXfJCyuE2oaCrwVh28BWmpP8dwdG8MHsKjREFgnB
 l44moGqB/8zkz6/+lJ3VeofLHGmvUP8m8LYw+sZNmtH+NS3AgVr2dYI3FAlmv/Fo1wFe46KcF4I
 c4m9rWfMzhRQaUqCroj+HcV7K1sLW8EomxVqWQ37j+2l4RNj6AnLOiRcyNegoeWoJPEXmHF1MQX
 hLAx9jOui9SkVZS5sN67bJrTfo+5ge3LnwYOpZF76f46kn0mrLc0s+0JPtgIcU700CdIyIwvnFg
 brMHOR/MeRQXh5y6hx2vQ4YpNe6MTj/0NMRK361B/T1sxwBtcF14S/CNBMsL1LuALEhyaYwUcY7
 QNHNYcYPYMF2fVL7TxIyvPCWgJDoc93qKuonPmh3nMZbBVF+WYdqpoctpPwLfvWOuyQnkmT5H90
 a0qe9ZUy33AUGfpIOoQ==
X-Authority-Analysis: v=2.4 cv=SqegLvO0 c=1 sm=1 tr=0 ts=6a696823 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OsSWhblMiiJ_15gNRDoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Bkh2EJ3B5Mhdi5YzHiOhUPbA5qU8sx_W
X-Proofpoint-GUID: Bkh2EJ3B5Mhdi5YzHiOhUPbA5qU8sx_W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_01,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290019

Add DT support for the PCIe M.2 Mechanical Key E connector on the
Monaco EVK, following the same pattern as the lemans-evk series
(already in linux-next, commits 67f06acf/a6d4bb0a).

Patch 1/3 adds 'compatible = "pciclass,0604"' to the pcieport0 node in
monaco.dtsi, required for downstream DT nodes to be matched to PCI
devices.

Patch 2/3 adds empty labeled endpoints (pcieport0_ep, uart2_ep) to
pcieport0 and uart2 in monaco.dtsi as graph anchors.

Patch 3/3 describes the connector-3 node in monaco-evk.dts, wires the
endpoints via remote-endpoint overrides, adds the vreg_wcn_3p3/
vreg_dcin_12v regulators, and adds the serial1 = &uart2 alias for BT
serdev enumeration.

This series is based on next-20260726.

Changes in v2:
- Move PCIe Root Port and UART2 graph port/endpoint declarations from
  monaco-evk.dts into monaco.dtsi, per Konrad's suggestion. The SoC
  DTSI now defines empty labeled endpoints (pcieport0_ep, uart2_ep) as
  graph anchors, and monaco-evk.dts wires them via remote-endpoint
  overrides. Splits the old patch 2/2 into two patches (new patch 2/3
  for the anchors, patch 3/3 for the EVK board wiring).
- Patch 1/3 unchanged, carries Konrad's Reviewed-by from v1.
- Dropped Dmitry's Reviewed-by on the EVK patch since the port/endpoint
  structure changed; open to re-review.
- Link to v1: https://lore.kernel.org/all/20260727-b4-monaco-evk-m2-v1-v1-0-5429cce68599@oss.qualcomm.com/

---
Wei Deng (3):
      arm64: dts: qcom: monaco: Add compatible to the PCIe Root Port
      arm64: dts: qcom: monaco: Add graph port/endpoint anchors to pcieport0 and uart2
      arm64: dts: qcom: monaco-evk: Describe the PCIe M.2 Key E connector

 arch/arm64/boot/dts/qcom/monaco-evk.dts | 69 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi    |  9 +++++
 2 files changed, 78 insertions(+)
---
base-commit: c5e32e86ca02b003f86e095d379b38148999293d
change-id: 20260727-b4-monaco-evk-m2-v1-dd56eb997378

Best regards,
-- 
Wei Deng <wei.deng@oss.qualcomm.com>

