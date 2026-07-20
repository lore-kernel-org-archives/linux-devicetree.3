Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF6C3D5235
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544634; cv=none; b=o0ddsPlwgckqIopXln23fmUt7iIVfCUYyeRNsyW7E4oGDwwvyiWAlaX7wsMrQcxartNhvDaA/M/Yqsc5xPgYxZsQr5alr5FAROaOa1waWNh6rJqtnqqfLqQq+OZayGw0TEJP9IkaJ5xq5uz+POB80l5XxxmH0fTKqGtsMjwQ6NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544634; c=relaxed/simple;
	bh=ndGbwRrcy4NquZS34c1u/G7anx0+KiVyIxtxL55NCJ8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=q6hcalIwFyDKJrtCQvfXRvCwbYRKCC6evuIWIkZTH4JU3UNpIV0sEmjm9RQ5AKZIudfJSiY8NlQ+7zVtsPO5BkyixjweKE0nI7yei4N6Un4dcm6TV5v+nzh8cL3T2sQuuQ1lZprnUYnO17aOHTyvO3yBpBuOgeiIU9CEpfEHulQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fn7F9Sxw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WCZOqGqZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fn7F9Sxw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WCZOqGqZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K9vZEp2023654
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kvPKWvJHNSLhHMncthnA23
	3T9yEk43en5WxFeOAvwMI=; b=fn7F9Sxw1Crzl3/T3/Jooj9uvQiR8FNhxCs+pU
	w2GUxZyR1sSzcryU05DDju25qobf2a9gWcRZz9qitsxUZdTNsmliky2FcvQPW1Dp
	Uq7xxqnCRSVwNPOUV+fhRsVeoirSl7Dshk2zMrEUtN9ukCVPs8wwqq1IcV4orFpt
	An36qb8iRoA89KmsJYlzTZYNYlQeCa13yuSwkZDDy7oBy4Zs8aHXevIMUqRLGxBl
	7Jp9IRlLronlVsS8R4nHda7IYOTwEEhodBGFQlx1zF4n76cml7FWrJr2kcJv0nJ5
	seXa0ZCHbBwlitxP5MPB/5YeA5OfP2yhlscep0BYcNBytMkQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgs00cwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:50:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c856470fe9fso5502583a12.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784544621; x=1785149421; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kvPKWvJHNSLhHMncthnA233T9yEk43en5WxFeOAvwMI=;
        b=WCZOqGqZfE2Zf6zBd634pVrFdPw8kUE51HpOcOamo+R6az2CpxH53w5dZ6QT4g41UN
         MOnXpc40H4fCcllfNqwSTeBkB587mPkdGs/dUKWDQg+XynPxMV4gkigxdjXBJYIgCk8d
         SZYJvR1x5fUhy0cla/ywYEamZOCU2Q+xKZnjAELVkaICKXxJo5r9z+7J8Z/OI0ot4jK4
         Oo0OBRFk66nQPxgvL2v3JcxqgzrIhuICGSUU1pziA+bScG3mMlRDmqkspoq3fJtYwIMx
         jxR1KtBvf77WEkWxka8QsodXrwV//5XTqdXrwOc8TzxieHcmrCfeI/cbNCKogIA8FLe3
         EbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544621; x=1785149421;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kvPKWvJHNSLhHMncthnA233T9yEk43en5WxFeOAvwMI=;
        b=H1zCjUgRYSIY/srPiJpv6GkcF4Qp3bQQ7UMaZlg0w20tGRaTBqt5U2lYRBt2zV567j
         YvgggkRenS5G6AAPlXTgRwvTDhO9JCUoBtkcspxrJJU3Rb3BCk8IMVaWeZUQaCFoI4l+
         zpADmFXgOQvY9WSyLlSDWTO2n0KKTEodN9Ls8QmnWVIY2p+BVa5Qr4l4B8Zo/YuvO4a9
         qGk4s8eA6b9Sx/Ile2PSjxposrlXUAdUdTbiF3qwTEH907T7ciaxBszoQClFMUCe973b
         ZBuO+R/vMUbcZzQCHR2kFM7XyHw431Xe0bOkUDWglsAvrzcL2kwfCqx32Mx2IG4uOH/R
         koZg==
X-Forwarded-Encrypted: i=1; AHgh+Rp81S+PZtTVPj75ljkE+QpP8PGC1822RioWG+Mj/ku3lN2as4hmz90U/PX7GPf14spKkjZersOSkBzz@vger.kernel.org
X-Gm-Message-State: AOJu0YyFoRmVXyn1dY65BweFbmYsB8atYl1M4Oi5L/Jgqta3wj83Cwum
	6CxTkuXUrAYph5C5LVmkBh5lScrVJSwUmLMahT5Lqgwx8L/DVWz0WaHfvfkv/YpeneHzXHkceWS
	4R01e0dX6NFVhFDNVYHp4J62bi1Hxm7H/PgBM2OKlSgzenLQpOQ12QniKz2kGbinm
X-Gm-Gg: AfdE7ckzAStYiGtDA+ipcKeVk/mfqeRMR+U4UusqYju6PdTc/utouc96YxgjbPEbPK1
	l7wgc6VdO6oxy4ztlqhRCenEg8TnAo+3sLl6pivJKNrJyAPkidPeuHuKHuDyK3IXZ6KrFKhEVFD
	BvtgTkqew4BJdoHqWc85g2wFzY8AydH0cpV1t/hgzbIwPjsoTiMDqEPyPNCQnbZWdMNLyuYAn18
	+3Nlv+KnUHU8SfWrS0Hf9NFaEeTtIPh8TOXEDNunbfDrK3G94Ep3LFBNlfcMi1XQoeCTQyeZHO4
	a+JFlgD7Zzd2+XDLl9KHXMqTId7HKzgJEq+5gs2Sz7dDg1EtBI1oXOwkVkqujSHIq1oAIXVNnHz
	D0GOoy5aykJqt7zE=
X-Received: by 2002:a05:6a21:4a97:b0:3bf:7e2a:e874 with SMTP id adf61e73a8af0-3c3ad6682f3mr14674071637.1.1784544615884;
        Mon, 20 Jul 2026 03:50:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:4a97:b0:3bf:7e2a:e874 with SMTP id adf61e73a8af0-3c3ad6682f3mr14674030637.1.1784544615282;
        Mon, 20 Jul 2026 03:50:15 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb5159b11a5sm4343368a12.0.2026.07.20.03.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:50:14 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v7 00/10] arm64: dts: qcom: Extend Shikra device tree with
 peripheral and subsystem support
Date: Mon, 20 Jul 2026 16:19:16 +0530
Message-Id: <20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACz9XWoC/3XQy2rDMBAF0F8JWldBGj0sddX/KF3oMa5F67iRH
 NMS/O+V04WNqTcD98KcgbmTgjlhIc+nO8k4pZKGSw3N04mEzl3ekaZYMwEGmilQtHTpIzsaR9p
 zygxEDMIANi2pK18Z2/T94F7f/nLG662q41p2qYxD/nmcnPjSHuhTPUBbxZ01wkTv3MtQyvl6c
 59h6PtzHWTxJtgYgu0MqIb2XhnOhIpcHBhiNTTjO0NUg7UoWhMtBmkODLk1zM6Q1QDOpWBMWen
 0gaFWo2GwM9TyD8u5CxYaYOHA0BuDy52hq+ERQasopLX+H2Oe519YrBVLGAIAAA==
X-Change-ID: 20260525-shikra-dt-m1-082dec382e7f
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784544606; l=4780;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ndGbwRrcy4NquZS34c1u/G7anx0+KiVyIxtxL55NCJ8=;
 b=SF3zeHdHt3PU46lTsfMnePbCe/suTpCbKczUiyB+pDNEs6oKpmhxR6YCGu4Nnczh/2kekAmI4
 w15wzKVCs1sBmesxu+fdLsUg0CZQBYpDjmALJ/GaJpOwuhW/VZQ1Hog
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyMCBTYWx0ZWRfX4MEzAvyMeqcj
 2AVTyU7GYWIne/81hsZrT0Jc+8vTDA5Iwz65McfPfE47hpnfjDD4Qs53kS0/1At5RnzAp/kCqtn
 Lhpf/JzNZao1QBzLNacvjBrl4ONlD2U=
X-Proofpoint-ORIG-GUID: XAksrcOBLcicm5DDVGkWlk77JTwvq-ZT
X-Authority-Analysis: v=2.4 cv=DMS/JSNb c=1 sm=1 tr=0 ts=6a5dfd6d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=esFleGvXc86k4vwuY34A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: XAksrcOBLcicm5DDVGkWlk77JTwvq-ZT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyMCBTYWx0ZWRfX2JpqhZHojbUJ
 uZ5am8sZDw/AJlEZG0tWlB5ob2LgAY9yY4mhCcbFmaACJ8TWjNfw1WVKkyH4laC1cdXPuSP2TTI
 Ouz04QGz3fwWyY+WclP9U2rzRZDwgpKGz2wY/+nf2dLC7uXgpjCrMj1vdKLs7T6sRwGp5DjwWgK
 aCUIS4GdVrRZbawVU3WgTG9br//aLz25eWZ4RgENHxaCfPOWOPKqVu8nLjUP/ngJ1ZI5NWibpUC
 wcceShkQ9IrhSfloh56OY6XEhuRRPsSnFksRVeW0dMgEzYoZY4RMDYiEy7kvQZSDpPHdFTF/Lq8
 xnJbVuEileHUpfA8r2N/F7l1mIYDhIv+R0LX8PAbDeNE4eY4cOuo3cAVhXHoYALYw5EhCd8iTa3
 WnUbM0TbBMeXDbt9SDRiQqozqzIzq6BDirLsnl41t5aG8oMebCtIS32UNJBTrFuNgJIUPkjaU+z
 1OR9ZbY9Gnfmap6MwmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200120

Extend Shikra DT with peripheral and subsystem support across all SoM
variants (CQ2390M, CQ2390S, IQ2390S) and their EVK boards.

The series adds:

- QUPv3 serial engine configuration
- cpufreq-hw node for hardware-assisted CPU frequency scaling
- DDR bandwidth monitor (BWMONv5) nodes with OPP tables for dynamic
  DDR frequency scaling
- EPSS L3 interconnect provider node for L3 cache frequency scaling
- CPU OPP tables to drive DDR and L3 scaling per frequency domain
- SMP2P nodes for CDSP, modem and LMCU inter-processor signalling
- Remoteproc PAS nodes for CDSP, LPAICP and MPSS subsystems
- TSENS instance with 14 thermal sensors and thermal zone definitions
- Bluetooth (WCN3988) node with board-specific regulator supplies on
  all three EVK variants
- WiFi node in the SoC DTSI with board-specific power supply and
  calibration variant selection on all three EVK variants
- Gpio-reserved-ranges to tlmm to mark GPIOs used by the SoC
  internally and not available for general use

This series depends on:
- https://lore.kernel.org/all/20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com/
- https://lore.kernel.org/all/20260524-shikra_epss_l3-v1-0-b1528a436134@oss.qualcomm.com/
- https://lore.kernel.org/linux-clk/20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com/

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Changes in v7:
- Dropped cpu-bwmon DT binding accepted upstream    
- Collected Reviewed-by tags from Konrad
- Minor nit picks from Konrad
- Link to v6: https://lore.kernel.org/r/20260714-s

Changes in v6:
- Collected Reviewed-by tags from Konrad
- Reworked WiFi/BT enablement into SoM dtsi files, including WCN3988
  PMU/regulator supplies, Bluetooth and WiFi enablement
- Updated gpio-reserved-ranges to document reserved GPIO functions and
  drop GPIO115/GPIO116 from the EVK reserved list
- Link to v5: https://lore.kernel.org/r/20260702-s

Changes in v5:
- Split the WiFi hardware description into a separate shikra.dtsi patch (Konrad)
- Moved common WCN3988 PMU, Bluetooth and WiFi properties into
  shikra-evk.dtsi, leaving board files with board-specific supplies and
  status updates (Konrad)
- Added missing CPU OPP entries for 768 MHz and 2208 MHz
- Added gpio-reserved-ranges for TLMM on CQM, CQS and IQS EVK boards
- Collected tags fron Dmitry and Konrad
- Link to v4: https://lore.kernel.org/r/20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com

Changes in v4:
- Updated commit message for first commit of the series (Krzysztof)
- Collected tags from Dmitry and Krzysztof
- Updated wifi fimmware name (Dmitry)
- Link to v3: https://lore.kernel.org/r/20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com

Changes in v3:
- Add missing interrupt affinity cell (0) to GPI DMA interrupts
- Link to v2: https://lore.kernel.org/r/20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com

Changes in v2:
- Collected Reviewed-By tags from Dmitry and Konrad
- Squashed cpufreq_hw, EPSS and OPP tables into single commit (Dmitry)
- Removed labels from CPU OPP table entries (Dmitry)
- Squashed CQM, CQS and IQS remoteproc-enable patches into one commit (Dmitry)
- Added WCN3988 PMU support (Dmitry)
- Squashed Bluetooth and Wifi changes into one commit (Dmitry)
- Link to v1: https://lore.kernel.org/r/20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com

---
Bibek Kumar Patro (2):
      arm64: dts: qcom: shikra: Add CDSP, LPAICP, MPSS remoteproc PAS nodes
      arm64: dts: qcom: shikra: Enable CDSP, LPAICP and MPSS on EVK boards

Gaurav Kohli (1):
      arm64: dts: qcom: shikra: Enable TSENS and thermal zones

Komal Bajaj (4):
      arm64: dts: qcom: shikra: Add cpufreq-hw, EPSS L3 interconnect and OPP tables
      arm64: dts: qcom: shikra: add WiFi node support
      arm64: dts: qcom: shikra: Enable WiFi/BT on SoMs
      arm64: dts: qcom: shikra: Add gpio-reserved-ranges to tlmm

Sayantan Chakraborty (1):
      arm64: dts: qcom: shikra: Add DDR BWMON support

Vishnu Santhosh (1):
      arm64: dts: qcom: shikra: Add SMP2P nodes

Xueyao An (1):
      arm64: dts: qcom: Add QUPv3 configuration for Shikra

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts  |   19 +
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi |   80 ++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts  |   19 +
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts  |   19 +
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi |   88 ++
 arch/arm64/boot/dts/qcom/shikra.dtsi         | 1682 +++++++++++++++++++++++++-
 6 files changed, 1893 insertions(+), 14 deletions(-)
---
base-commit: 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
change-id: 20260525-shikra-dt-m1-082dec382e7f

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

