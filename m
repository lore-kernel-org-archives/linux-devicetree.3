Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C5B361DBE
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791785906; cv=none; b=amhjx32ui5crndpMz3l5gx5XPotgJZjQ/ApfNYcwelo6bqkQrlzD1a2LqKM/2EDWPraR1QnK/Oveh/I1n3hfesKJ47HcGFFqqmAhwGqb9wAKUwqW9h9DPyVaXEgItGhAJoOfRpFyr/c5b1Xk5IOTaU6VwW527muKITrFhaUjef8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791785906; c=relaxed/simple;
	bh=P5bKGgr66c2nj+TMeUqv+QCxD+y2ch9e/x2bFae53cU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Tfy5DkPDPwgdl2H2oxfIzf+kCcYMka3+N6orKqtVUG+mTyBOWnsGDId5Siq+7Te7n1wu6qjKDUOWiWkUyzIKGxkGL/VmH5OxxBDIUwpAtWTUVnEk0UEMrwmaQyxfU+WnwHnaxX0Wf1akErDLkSmHcCShW1LvAtNyL8wQAJymMew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nEZjLwpp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dNqCRWni; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nEZjLwpp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dNqCRWni"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55r3R1857505
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BkPjgx4DX4xwpBvdmy0MXr
	dQFriGtoWZz1uvdjQRcCQ=; b=nEZjLwppzryQWHkqmvuaAaKfjjMGCqhglMx//E
	bzUoOud3S55T1wmtaZZfGaaibI087hLoksOvVAljZs2lrfN9Di/+0rG+ZwZeIHk8
	5jw+2fmlVxUCoq57vx3m4CpymiQ6qVW63Dj8boVewUg7tXhlSZrwcFXuccUARLDj
	Er3ImjHq0+Eaox5K8Dx/Gk1C8StFIXW/gpzneYq/mLUUBtPbaUaf4jBg+b20fNEo
	9ZJEqlI8wzsyd1d9zaaLLuwNp6D5lN031BxjreKmaNCd008ABR/5Sd1p7zinfczy
	m4WCfewczY13DtrPhnPsdZTuaBWUx9e5q2TD7pY5IjXaHFlQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cxxn54y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:18:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc795ad1f5aso1391863a12.2
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 23:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791785903; x=1792390703; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BkPjgx4DX4xwpBvdmy0MXrdQFriGtoWZz1uvdjQRcCQ=;
        b=dNqCRWniiL0S1L8gtO5EPNidSmS6XIOGvX9BES4lqeRdi3027BoQSxbd6urm7DFzWX
         SxYKUXDa/xlCOqtS+COIyJiNfX2f32xc7VTyJblL32f4SGr09nuk2UUtru6mejnGpL5e
         TjkPKlEvG/jwfFaoy5sBrK7wF/LE8W7+cGGguc/9znCdXrkBw/S8bl2KS4EYMVZgcIMw
         VF19l7f+RHg3Rtc2MWKSpgtkJ6m1+JnftL7cysG9XgqqgtQvLE7MFb9tJnJ6BZsueyME
         ZpTUnOF92rLeEp+hqayw96V1Czni9pMU2cccgoRSzHd4tl1eG1ZHKnMgByO3qdoi7mS1
         kNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791785903; x=1792390703;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BkPjgx4DX4xwpBvdmy0MXrdQFriGtoWZz1uvdjQRcCQ=;
        b=x3GqednDIYQNn6GF7Xsyj7wAPX49o5iwVnfBg/roH1hGKwT5/BWLO+qrpKzkCTFeXW
         ChrWs3G0VCoH5gmrBoN+/2rYbiJlnZHwzqjv6qBcT0L2P1bUuXi1CHTUyJpZia1oMF5b
         1h7ZnRoeFXttxqsXKJd53DQpUhdIMjSCPG5fxpcaaN7htFFfJwDC2TkY+J2OFUWKywYl
         DFKVusFQn4nw3lNP6YYNOyjgPGxELmNadny+roNdMupqFuNbCNSFGgUiAY9OVy+8p1c1
         lE8ZZW8DswhYJpTRYONHJkK6372nfW2aDB9Rgei34FSKM1Vo3xXfHKvzu1CZEs0XcB2U
         KYvA==
X-Forwarded-Encrypted: i=1; AKwUvBxw9y+louMTvWMACZkX67Jwe4io1LHU/bTnTUJDtFaXs4e7d4cohjug4TaXPNX341szEE/rPPRpXW+x@vger.kernel.org
X-Gm-Message-State: AFq9FYLItMzQCRXh8rIHalbxt1AfLAxWvVC9mKhH+CFJbSJB9Wjmi5ym
	DPM7PUQ8sqMxelnzLKfw9dp52GqTHx+5YH6WzJAvbpcIDJ1hEdcVTrt5+YzB585XdTQzty9NRHL
	W+rlYSSQdjGs2x7BD1nBog1dqwYa6iRD9VFfVsaeljIfhITfuK80W/xYZdnUHSjgH
X-Gm-Gg: AYBFou0pNU3kCdv8llq6an9EZvfgdgGhcQMZi2grPjXk1da72URZT+hB7FUZrGnQh4F
	2FWSXwzbwfP0YLjd4RQAAHNTMW/s4HtnpxCuSZspwVm8SmRKvpiy6Y/JiCknhd8cCnl/zZ6dtuu
	C40ElkmeFjG2zuvUpEXcIRrDqR8N3tPtRJWNzh7+bzP/wjzs5s7e/sR35oul/nvC2gDwqH1AMn8
	KBTYUcss4E5N3Lqj6n9n4znRAZX4kUumb2qkJlhTt88idjsV9yY8Y2NbfTKb4pkn4j/wmodRYxV
	ed9rf3gwWvICxRbe6vrD4EqltI6lhP0q9Yb/MrfyPIGDc8r4tltd0K6mlET0ro7mp0YDBZIY+j4
	HSThI88QB4aXpHQ6J4aHR
X-Received: by 2002:a05:6a20:6a0e:b0:3e0:c2fd:511b with SMTP id adf61e73a8af0-3e16be0d320mr6975539637.32.1791785903030;
        Sun, 11 Oct 2026 23:18:23 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a0e:b0:3e0:c2fd:511b with SMTP id adf61e73a8af0-3e16be0d320mr6975516637.32.1791785902540;
        Sun, 11 Oct 2026 23:18:22 -0700 (PDT)
Received: from [10.213.104.249] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e07329sm3770481a12.5.2026.10.11.23.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:18:22 -0700 (PDT)
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Add support for Talos Lyra EVK board
Date: Mon, 12 Oct 2026 11:46:25 +0530
Message-Id: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADl7zGoC/y2NwQ6CMBBEf4Xs2U1qVUR/xXjYlkWqpJhuaSCEf
 7dVj28y82YF4eBY4FqtEDg5caPPoHcV2J78g9G1mUErXe+VOmOkYRQclkDI6YVJI2s+NQ0djl3
 dQt69A3du/jpv9x/LZJ5sYxGVhiFhNIG87UvkeY74P7jAtn0APwDR9JUAAAA=
X-Change-ID: 20261007-talos-lyra-evk-v2-e2e588a34f6d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Sayali Lokhande <sayalil@qti.qualcomm.com>,
        Akash Kumar <akakum@qti.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Vishnu Saini <vishsain@qti.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-ORIG-GUID: q-rNsfaoJLECyYDh3ExOV1pJTeXeNemI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNCBTYWx0ZWRfX2pFB1vC4oHq9
 ITKHgp3W1dkD995TdL8DzpoZE6q7nNeQLcbZ1xd4z9hHpOToHrsvPK93qJu7N1Q+zNOUThfQrkh
 Arwn4raRpi1WNPVK2tCVfclwPvQ2fds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNCBTYWx0ZWRfXz/U6DErZjQg+
 g9FeOs5MWtBAWxwtyko9O3CzFaj9Ir3uAtlT3h/FEt6tzmY872sA1eW52a6oBKcCvjS1BKF5vK6
 7bEYBHpG6r4qVFFq0m51SIqU131Z2QRALPb5+VbNqUJMo23C12fS0NYTX/XMIlFFPplP0EALoTz
 lSPLGt7MmhBpkEFHBqKNWS4AbvuY87nc0E2CYeFq4PGojO22gvTpXHLvb8ib1rdSvlbVS675Jri
 bzHzDodeqWdD87v0dU8hXfKqf0SE/yoFcbd3GTi9HaAGfkAETF18OAe2cV23SHPuBcxxw+Knv81
 Sx5Cnct5zV66eQZNmrG11wvT2uWKIVwLZlneoRiGjT3dcjaYkAnb8MXvvGJUzSft4NAt8Xw0IS+
 mYuEj3l/mWGMxNMogLx4dM4D4oDXzoDKzBqE2LA2bLSZJ3x3deJ9IjNDU5qhV2CzdqC7c3DSIxG
 MjiLLnCckRDI2kstVyg==
X-Authority-Analysis: v=2.4 cv=AsJ7T+9P c=1 sm=1 tr=0 ts=6acc7bb0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Akds4Oeo5k9by0OAE5IA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: q-rNsfaoJLECyYDh3ExOV1pJTeXeNemI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 priorityscore=1501 clxscore=1011 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120024

This series continues work originally posted by Avaneesh Kumar Dwivedi [1].
V2 incorporates review feedback, validation results, and subsequent
updates.

This series adds initial device tree support for the Talos Lyra EVK,
a QCS615-based System on Module (SoM) paired with a common carrier board.

The Talos Lyra SoM is a compact compute module integrating the QCS615 SoC,
PMICs, memory, and essential connectivity. It is designed to be paired with
multiple carrier boards to support different use cases.

Talos Lyra is a distinct SoM revision of the existing Talos EVK SoM. The
key differences are:
  - Adds Apache (Lite-on-Module) WLAN on SoC Card.
  - Removes SPI-attached CAN transceiver module.
  - SDC2 on the existing Talos SoM supported SDIO-based WLAN; it is now
    used for the SD card connector only.

Changes in v1:
  - dt-bindings for the Talos Lyra EVK board.
  - Talos Lyra SoM DTSI with PMIC, regulators, storage (UFS/SD),
    QUPv3 instances, ADSP/CDSP remoteprocs, and GPU definitions.
  - Talos Lyra EVK board DTS enabling DisplayPort, GPIO expanders,
    SPI-attached TPM (ST33), and USB on the carrier board.

Changes in v2:
  - Drop qcom,talos-lyra-evk-som compatible from the binding; group
    qcom,talos-lyra-evk under the existing talos-evk block instead
  - Remove unused regulators vreg_s3a (smps3), vreg_s5a (smps5) and
    vreg_s6a (smps6) from the SoM device tree
  - Update board compatible string to remove qcom,talos-lyra-evk-som
  - Add "talos:" subsystem prefix to patches 2 and 3 subjects
  - Set initial-mode to HPM for all LDOs (ldo3, ldo11, ldo13, ldo15, ldo16)
  - Add EL2 overlay for talos-lyra-evk as a separate patch (patch 4)

Note: The WLAN node is not included in this series and will be posted
as a follow-up.

[1] Link: https://lore.kernel.org/r/20260901-lyra_upstreaming-v1-0-e3a76dc9e21c@oss.qualcomm.com

Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
---
Avaneesh Kumar Dwivedi (3):
      dt-bindings: arm: qcom: Add Talos Lyra EVK board
      arm64: dts: qcom: talos: Add Talos Lyra EVK SoM platform
      arm64: dts: qcom: talos: Add Talos Lyra EVK board

Ruchira Revdekar (1):
      arm64: dts: qcom: talos: Add EL2 overlay for talos-lyra-evk

 Documentation/devicetree/bindings/arm/qcom.yaml  |   1 +
 arch/arm64/boot/dts/qcom/Makefile                |   5 +
 arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi | 251 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts      | 137 +++++++++++++
 4 files changed, 394 insertions(+)
---
base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
change-id: 20261007-talos-lyra-evk-v2-e2e588a34f6d

Best regards,
--  
Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>

