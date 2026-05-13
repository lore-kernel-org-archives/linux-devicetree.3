Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE8A38F928
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682205; cv=none; b=PDnSdmDwxJgAnakPMpsF2/YSgIepeYa1wQ9T+cZQ3c778G/EQsmhyNUVOxsjOZX9KcOMbdyBAcbSpvGIn7Y9LFsZLqxrOk+ra151qvO7MLj2Fv1R0h10q0tS+LYOZaEy2KLX48qECbMgCG4Eq8GlpJMVesXB3cJWx06mVQydQjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682205; c=relaxed/simple;
	bh=4R/f9nuj5oke3QAWiV7q4TaukZ9lHkDNMVXoAcgz4O0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rznAgzN3nSqd0Jfi86LAMQUTfWarkH/a2RDYR1OdjwET5L73mJtv/Yu6UFlw/b4njkgu1oKyhGt+yiSUARDMIC1ETRJPAaI9dtqYdtY1EZeC1CYxLcc+uw+2xcSH3nwib8cv0koJ/RaMEL8JopAB4sA3BOpKjIIelP7hyPWvNxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XDZU+OE+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d6C1gVrw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XDZU+OE+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d6C1gVrw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAPBwr2321422
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aXgSSn27XG5QktxMkuF7jA
	mn6KmQ3QqMT73PjLfre2s=; b=XDZU+OE+cRby7iIoaJQu3bRDUpjLRAuDfY4cSJ
	D6CMEdRvkpq65Rq1yZnQB+o0EcafSTCAyJMg88i0neUAs3xw12rqSF6QIF8vF79/
	w6w39tkVwWdg0aBI8O27c+5eqA7BAyUgj85H8g3QL4uihOw/+5qoPfXcV4NRCCBG
	ozlXcVGtn3R77wYhXGyEgDMx+v99TyLQgqhQJ851hfCWPmYrIOvAGGM993zsjv1c
	uG4OLmrmYJIzq1cYGLhzl7oJyuCubXF7S224rHPzVEqKMtH2hGip3wlLMlGdDx8t
	I7AV9rXm8U+O/HZ/cEMwt2Hqycz4porw0mlxvwuPH1zo/dvg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hguacvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:23:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba6ca20ceeso75708445ad.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778682202; x=1779287002; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aXgSSn27XG5QktxMkuF7jAmn6KmQ3QqMT73PjLfre2s=;
        b=d6C1gVrw5sJKyfXfN7LRI0gwx2p5QoXD62UtWgnsm9HmHugB4Xb2h/kdkjfa+OflSE
         7h1U1ejUjFpXfSCi2Cgci8hUVNsHERiVNgiJ3pJ6u9EbpMtIRfE6TLXt1HKdek9XFHzf
         1Vh19dqgwD1+d2PPlPTe8zA0Qnq46A+xE/iQupJFajiRHxihdSY7ROIWCOGU9//3Vg0l
         HGsjmgZQuCqqoePbQT/VJvrP43lDYvXC+ZDwQx9PDz0wr7eDh2DNu45mK2LIOBBGy31B
         NbGQC2upq8lir0Qyjj2cRaIk1j3Wlhv04/vjJnvSzHWpwg3mPzXs5ep63I7d0LPenbjv
         RQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682202; x=1779287002;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXgSSn27XG5QktxMkuF7jAmn6KmQ3QqMT73PjLfre2s=;
        b=TusTRYR+9AP+uRwdhENmrEzsu/p9dbYz2Jdg2TqWBuZQ54EoQoBHAxKDyUc4wPLFyO
         9rEWbCVObLXY4zfF+avM2tk/NXj5U0TqgtfbRViB14tMqKtKnuX9ASD1Q7d24Djkv8j6
         Yxnued+rD9NxkafTjkoksdTCJmlG1kKGy9rBS+AUV9x0DOyz6Oe2lJZuGGSP7GaSBIdX
         lfP7v1O2KalkLQFmGbdWfJIw1NZeIvsXb/w53VKvFXz75QYLh83f428uYZhS+gi6mNH4
         6lBJJ7qvVikLOnZPY6Pakhwe504phSl9DLyl2VSYnS0wE533QNMr272OW1+Lq3c4nJ5Z
         N0/Q==
X-Forwarded-Encrypted: i=1; AFNElJ8ZHdtnmjnk5n/duA51gKFU4QD0jAUKM3oapoHpjNtMbDK1we/yK109o06tMejH5yGci/HSdRcorPuF@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2tG2URylr9pgrsnOcCUwMyjwdQdwgzTwXOI2LQNNON+vgpzyl
	X3vpuZR+5EOQU2FkN5OzRy5KHrHZAJPU6akQAojYvuTbfiQuiy3g5G51ER8+tiMh0ii+m9hLf2V
	AmUv/AgJlFKqVrpF+J6IJw4D8loOCCi6MSJQrXLJWWKVaenYt2GxKQy44BRjRSsW8
X-Gm-Gg: Acq92OGSy2sipgMOOps48cfWt8g1gQaH92Mz6J7AHfR/uiVJ6Seh1vD/d7RY39USDqD
	tbWcOt93F+41n8dbgSC+xd9/wdYfg7OoMMmGteGt9jJrt4eF0sC51xoZA61LD9O4uHeq6PTNulj
	830pMzfJY668HIQR0EAI5Jg92j+lQigIgtJVQUMa7KKRSxS03kmy/m3c69cWWk4jX/ptV+O4kK6
	l40kmSzDqySKtcnIKV3GVCf8jqUyh9zSfU5g7WKD4V0tQG1Go3D71ZKUvAmnHpuvfII0/BlmXD2
	bu47R+myXPFzdPSY3ToHm8cguUx+XJk1yBTiUd0Uj80JMKN03VpkhA92GNu31gU+LK1plBsPyWP
	+qS9mGnBHoASdm27d3gvEkSugYewU8F+2Q1aVvg4ECi67EQ==
X-Received: by 2002:a17:902:c212:b0:2ba:359a:9b8e with SMTP id d9443c01a7336-2bd27158ce7mr31344875ad.10.1778682202362;
        Wed, 13 May 2026 07:23:22 -0700 (PDT)
X-Received: by 2002:a17:902:c212:b0:2ba:359a:9b8e with SMTP id d9443c01a7336-2bd27158ce7mr31344525ad.10.1778682201746;
        Wed, 13 May 2026 07:23:21 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d40427sm179296105ad.24.2026.05.13.07.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:23:21 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v3 0/7] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Date: Wed, 13 May 2026 19:53:05 +0530
Message-Id: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEqJBGoC/3WMwQrCMBBEf6Xs2ZSY1gY9+R9SSrNZ7ULT1ESLW
 vLvxt6FYeANzFshUmCKcCpWCLRwZD9lqHYF4NBPNxJsM4OSqpG1PAoa+dN3znWI3aKElnusamu
 NrgnyaQ505dcmvLSZB44PH96bf1G/9a8qRwqDEhtrtTZ4OPsYy/uzH9E7V+aCNqX0BSEHayezA
 AAA
X-Change-ID: 20260409-eliza_mm_cc_v2-701c34ddb74e
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a04895b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8r5jHq557GnqU3WSqWgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: kMeaeaIgFK3EYJjcrWlmoPKX2dqPsn19
X-Proofpoint-ORIG-GUID: kMeaeaIgFK3EYJjcrWlmoPKX2dqPsn19
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NyBTYWx0ZWRfX0tSxAHz94U/U
 ziTOkZGOT03FKloyWhFF+Am+XGeIcEdnWa3HKsbI6tmoyGF878seEjkFTQM/ne+WQYTTVe860x7
 v8RMmWuywhra4ikA1aVpc0Q4KlapUGqFks9GCN1KyUHS8ZgebFWAzXClbnjywN+eSK+4CpgzLZa
 LCpaPyJbHUYQqSMHLsGYvWXv8yKmnA9LzrArKkN4/8xoOwd1McuvndGY5RHbrG5yksI75vc+OzP
 +d4EvW9k3AAKEtuo5qX8fw0Hz0pk2vVMKnlbuCZH4H+s5ZyNXuXGu3eNFBO0YOxirXTNT87j1bt
 tGGbWsEZHjM++FlQmn4V0cOjbrDjWQ8eIlY6Biek25wX5DVbqRC6uU7psSp5o23nlqRwr6WwWxz
 /CgQ803HmdtQ35YM/izFTARWhKuDpnnTvTdmjJSNh+FcFHrlvTkPJbkGCbebc1bpJfdaO/LQSPi
 G4lZdFw41yYNTGWTghA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130147

Add driver for Eliza SoC camera, graphics and Video clock controllers.
The camera clock controller supports the cambist clock controller and
the regular camera clock controller.

Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
and MXC rails dependency. Since CX and MX rails are already ON when APPS
is active, explicit power-domain voting is not required similar to Milos.
Hence extended the Milos camcc & videocc documentation bindings for Eliza.

The patches have been tested on Qualcomm Eliza MTP board.

Changes in v3:
- Dropped new documentation bindings & extended Milos documentation bindings for Eliza videocc & camcc.
- Dropped the defconfig patch and included the drivers as m from Kconfig itself.
- Update the header inclusion in the milos.dtsi.
- Link to v2: https://lore.kernel.org/r/20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com

Changes in v2:
 - rebased the patches on the latest linux-next.
 - Add new bindings for Video and Camcc.
 - Remove commented code in GPUCC (limiter code).
 - Add device nodes for the corresponding clock controllers.
 - Add RB-by tags for VideoCC and CamCC/Cambistmclk from v1.
 - Link to v1: https://lore.kernel.org/r/20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (7):
      dt-bindings: clock: qcom: Add video clock controller on Qualcomm Eliza SoC
      dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
      dt-bindings: clock: qcom: Add support for CAMCC for Eliza
      clk: qcom: videocc: Add video clock controller driver for Eliza
      clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
      clk: qcom: camcc: Add support for camera clock controller for Eliza
      arm64: dts: qcom: eliza: Add support for MM clock controllers

 .../bindings/clock/qcom,milos-camcc.yaml           |   11 +-
 .../bindings/clock/qcom,milos-videocc.yaml         |    9 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |   59 +
 drivers/clk/qcom/Kconfig                           |   31 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  465 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  621 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  404 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   52 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 14 files changed, 4677 insertions(+), 4 deletions(-)
---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260409-eliza_mm_cc_v2-701c34ddb74e

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

