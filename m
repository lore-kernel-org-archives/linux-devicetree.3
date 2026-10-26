Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015092;
	b=2FVihd3fooS+mmbib1rEycZuLDfDGlKIeV2RX9tbFOFx7Fiu7NlXgrJ5rAW6GG3zBUoH
	 flWpph/HIJWbFvHvfZeawBIMip8XM6FOMJ4sggJrP7d/XbXHOaz02FVrtqGPs9uGIIww2
	 yce9iUReAoBegp4zjiBsRduh/vWjxCeoGP2YXW2GkoGPOoNeWSfbqRfDG2MVxbGVm6Kxw
	 P8zpk7FjuL50YMs9bnTk2OrQ9fbWVMhC8Vi6+BfsJSBimIGsMcPt9Ph0X0GCsWIe1EYu3
	 94SqpKE1W2JzmJzdGDBm49DXQ7i3/W5hZIxOxqFYspK9glrMqQZf6LboZH34hvRum3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015092;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9Kl1Kh8oli+G5hmcoDyt7e8HmNj391eaqiDZNoQBiUU=;
	b=LzJgK5iGtFlEBwPQ3CadFKjbuXj1WLC7eQ2rTFJ0nTDzEyq+0Rhio1msAbZu86Euo47d
	 hA0q28d92i1zjAX7X4zw5UiUZdCVgsWvIqvdqnRZg7slXp+I3VcK2LRlBL1weHCn5wtY7
	 TAk7Kbs0V1XnPmgjIWmEgaMR/HWMAhp4v4CXq8mDUCCsM3XdJalY/BfGBrxFYyx+PwvnG
	 js+kJuGEQMJbLIkbISGYkhzQZRsJbenNc4GdsvZ1/vFU7LjTFqx79PbAtc63dKwVS3lhc
	 6auKe9kRmS2sETc54hu3XGDl8tV9mLscZktNpfzW907nqPupSaHPbOeQPfcIDeoOOlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eTm0dwzk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hccjjQKK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8739606A322
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8739606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eTm0dwzk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hccjjQKK
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtMOX2541984
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9Kl1Kh8oli+G5hmcoDyt7e
	8HmNj391eaqiDZNoQBiUU=; b=eTm0dwzk6LSf0JPp9x4b0hcZHfccTU/jPfqzZD
	NtVBKgzM7+Q5xtJP54dKDfitMDbeEtsELcgx4XUQphVZwReweRB8wc3G3fuNbuxB
	/MhuiO4/eMqQyAMek5j4dWp1vMicmsKzUEsB7LWtRxyoPLQJw1o4MgtwdIUfPKJa
	37r6Y0qv+LtveOv/zYU3LBUtjHYmiwYtAkhmLNacJBOlIEp8MxWKo35Fb5vHRDQO
	h48pz+8hhaCPrKSAXBWnm6y2VC0zge79ZuqMcKK3lYp7ehaQmjhbC84sodGZsiMM
	K/QNOv8i6w1BuiqZWYdSXJjpd3g3b+H8GH5odNzqHSQHcscw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjda9au-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:44:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac8f449d1bso2719002a91.3
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 04:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793015090; x=1793619890; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9Kl1Kh8oli+G5hmcoDyt7e8HmNj391eaqiDZNoQBiUU=;
        b=hccjjQKKL1rZDZ/otGJSKBh/pG8tqj9MuIsqy4IrLto5QBEIyQd4dmKnrknZd4t9fq
         mV2GAgzxti7znqmTRs3HgY1R+peUMneIppByIFSW1/Dk5Cwv4OI1IKF3XZ/lw2dm0k1B
         +0lm0V7DdSN9oStm+rH5wziBmI/gIW6GQ/c/+btbjEo4XPGpb1EZB5vrXeJ3THxGchrj
         k5WVJzXuhIpqfyVC3rva3FwyuOzRJZHDVCM/z3qTXHyJrcZ4CclUnOYLUmCZ6feZDcar
         gIYqmcA4C0ilrHMBCKWoh7/dXDE26vmWOv2X/JUmv8V/u85vQR1LQjD6wqZZQvV78in5
         NSOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015090; x=1793619890;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9Kl1Kh8oli+G5hmcoDyt7e8HmNj391eaqiDZNoQBiUU=;
        b=DqKZqTsGlnVoDu2zLWDTz+qhyOfnOlfw+GXzWrHrgHmkbtyftAD7CIxzXEl3ch98DM
         L6OdyfbXSODXF9CcwsqrMoPoqFkY6Aywf+DaM2bc+2GwsFnZ1mZ6VxLWXOPnkwJ/36LS
         3qvLBIpwujQjaLg9dbvyWgIikJFk+vvSj3nlzJ2S8+doPSfvbFZqICxl6109Dj+FC4+5
         z5IC8vjK0rv19SP3DSXAV6c1EkxVhXFmMoxvBJ0Y3t/CPbk9MBHg5xmDiaAUHxEbctvH
         KMhDKqhjI02LXGc49AhD8LZC/dzg/y7H/ECByf+hqoUJmPqVqX+dgUZsvvX0eO2hZRO8
         RGgQ==
X-Forwarded-Encrypted: i=1; AKwUvByK9entnC2J7jVmns4VGvJorzNwmG8C3BjK1dhb99k1dbHxPqGMMeNL336cNni/A6Q03CAIoRk90oup@vger.kernel.org
X-Gm-Message-State: AFq9FYIPyG4I8lrtIDs4bdtr7D69P/E5/qvurSMdA0E8yl0TrZ9Co6mq
	IFN/zoTFbtdw4pZafLrZEf4+sSkry3VEcalcyYiIlqP4VO1u6rzJLx/yzZq/gBBGzijf5Rg78tN
	1kcpxBUMjOnPv8HDXjwfWiY6pX/Q5R3FtLjdXEixBkeMywvyaysWyyPMIdJa5pwY8
X-Gm-Gg: AYBFou18k2yPTLLJ52XHUwI6yDEM6aoF155u1XYB6hCNanMRjtIT5t55C4Ht0J8Z2Zw
	19g3Iqg94z8fOaMS7BzLIFEYvr5LeUbg0jk5k3v+S+ct68YJI0Qj+Nw59VJQGKq9DPmSScSS7Na
	KNqAdluWNfQy3tQI8Dc6vQ2Ergyk2sn0LT6BNUOU65EdDHGLR2wUv5EKtXgtwzvymxGAC5LGtQ9
	vyiS7bLVHqPtS4rZyoR73LrAMhnYMjMbFqKy8lVaSAuBlIt22Gr6rHqhe4CV1DdKIq158FZAo3d
	mWX/+GMXJ7SsKs3F531s8u7GLcqtZiRpRL1v4Za4MQPMdBx/7Ecg3jKGhyiEu+/DbX9yIxEPnfr
	BqvLWXJUJ2/n6d6yWWeo02h+Igl5M7vxjsNo=
X-Received: by 2002:a17:90b:4a84:b0:3ac:ad90:7090 with SMTP id 98e67ed59e1d1-3adeb15557amr5597880a91.67.1793015089933;
        Mon, 26 Oct 2026 04:44:49 -0700 (PDT)
X-Received: by 2002:a17:90b:4a84:b0:3ac:ad90:7090 with SMTP id 98e67ed59e1d1-3adeb15557amr5597868a91.67.1793015089435;
        Mon, 26 Oct 2026 04:44:49 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebbb1a13sm7909588a91.2.2026.10.26.04.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:44:49 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v4 0/7] arm64: dts: qcom: shikra: Enable audio on EVK
 boards
Date: Mon, 26 Oct 2026 17:14:28 +0530
Message-Id: <20261026-shikra_audio_dts-v4-v4-0-cfebe0809467@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB0932oC/22O3W7DIAxGX6XielQQCCG52ntMVWTAWdian+Ikm
 lT13UfaXE2TjKXPss/hzghTRGLN6c4SbpHiNOag307M9zB+Io8hZ1aIwsj8OPXxO0ELa4hTGxb
 im+bQKSyUQ2UdsHw5J+ziz5P6wTbNLq8Zre4L/bLjjq2EtzUrl2N1QCJ4KpuXT2Z2CO3hpHWep
 7S0W8lzCd65uhPGVGikep+IzrcVrn4ahnNuu+EPT9RSHP/nA/g+jsi3Yi/Ba9cZB6G0dbD/shw
 Q8n0Ql+ZUCFDKG2e8wwq1FWXocgjGWmlqVWmtAKS27PJ4/AIUUMKWYwEAAA==
X-Change-ID: 20261026-shikra_audio_dts-v4-af3e23be38ba
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793015085; l=4406;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=9dLtF56DiaHESPL1fAcaRBjVHsRuP7SV2uePpc6xZFU=;
 b=JtwT2LJ4fAj3kTaKA+Hifzmm/T3V4bHE6Mh60lkByu2TcyfYNjlbs8jk0lR8uPd1GVDcuuefw
 +WcCahKU6YhAh29PRv+IiV+kKn1P5ayBj16mDTVKPzXXEW/TjUqaaKH
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-ORIG-GUID: DpVTKN6_c-rwDDCLV-KcG1S9YJ97hOXu
X-Proofpoint-GUID: DpVTKN6_c-rwDDCLV-KcG1S9YJ97hOXu
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf3d32 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=ovq2u_4NKDcFgHnQCeAA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfX9vqy+NP0Cxoy
 OzDrbJXP7y3WpAWQ+B6uay4lcCBcolV4HKUKLJY7lPRzEpWRuJiM0eB/CHTCz6K9OiDwXcij/49
 EMU3KpNqz7WCIR3+SKmNH5sd1fnJkvU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfXwj/UfOoD7vdo
 IWpjMnxHJ2leRJG4u2nhc5+WZo84blY+UjFIgO+zmzetgdM5wMySqEDpQnIpox6JmEaeOAPEuBy
 LzbYj5pV6bw+KL9HMWz2dRs1szLT+fWZmprRh0Qp2n4jPbXv+6okKUYtdboaOfIZH1Zlm3Xb8xL
 cXzrv2rLLFhMR53BwRwNkagY4lEQIDi6JuKtGPrDpqd8qhCdPdRx0HHdLifegpnhOQ4eai7juSQ
 rcd6FMJy2LPMAgMhstNfdMQmAFglH3i4elhXwcJtkNJrAAdwOFPmmd8R5QltP6SzqHtyHEycjpK
 OfKYz/7e+UUeG65ePIQWpgWU3kc7JNPbvj1pE7NIpYOvtv1Oj/+PreaCu3OdfLh9ncGXiADjsNg
 szOkPAMfGx3O5TgKHzlvrDocSypiz8rLTW7h96L5n1/4NhsmnHq5uHbVnJfCm8DUU7c5ZhePSBJ
 kWx/4uuWE/EvFtKuP+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260046

This series enables the Shikra audio path on EVK targets by adding the QAIF
CPU endpoint, GPR/APM/PRM services, SoundWire and LPASS macro nodes, and
board-level sound card wiring for CQM, CQS and IQS variants.

Shikra EVK variants use different audio components and processing
architectures:
- CQM/CQS use an I2S-based path with WSA885x amplifiers and
  PM4125 + Rouleur codec components.
- CQS uses modem-DSP based audio processing.
- IQS uses a third-party MAX98091 codec with modem-DSP support.

The series depends on the following upstream patch sets:
- Machine driver compatible support for Shikra (v2) [binding patch got reviewed-by]
  https://lore.kernel.org/all/20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com/
- RX/VA Macro codec compatible support (v5) [binding patch got reviewed-by]
  https://lore.kernel.org/all/20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com/

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
Changes in v4:
- Rebased onto the latest tip, as the SoundWire changes and new QAIF DAI IDs have been merged.
- Added Reviewed-by tags from v2.
- Fixed need-pick issues reported by Konrad.
- Updated the commit description as suggested by Abel.
- Link to v3: https://lore.kernel.org/all/20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com/

Changes in v3:
- Rebased on top of AudioCoreCC/CSR dependency series (v5)
- Dropped v2 patch 2 and moved it to the driver series.
- Updated the defconfig patch description for better clarity.
- Link to v2: https://patch.msgid.link/20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com

Changes in v2:
- Added GPR node for audio IPC
- Added QAIF CPU node
- Link to v1: https://patch.msgid.link/20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Mohammad Rafi Shaik (7):
      arm64: dts: qcom: shikra: Add QAIF CPU node for audio
      arm64: dts: qcom: shikra: Add gpr node
      arm64: dts: qcom: shikra: Add soundwire and macro nodes
      arm64: dts: qcom: shikra-cqm-evk: Enable sound card support
      arm64: dts: qcom: shikra-cqs-evk: Enable sound card support
      arm64: dts: qcom: shikra-iqs-evk: Enable sound card support
      arm64: defconfig: Enable Qualcomm PM4125 and WSA885X drivers

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts  | 196 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi |   5 +
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts  | 224 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts  | 159 +++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi         | 256 ++++++++++++++++++++++++++-
 arch/arm64/configs/defconfig                 |   2 +
 6 files changed, 841 insertions(+), 1 deletion(-)
---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20261026-shikra_audio_dts-v4-af3e23be38ba
prerequisite-message-id:20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com
prerequisite-patch-id: 69a6b9ed1cce6ce328f833eba9c5f8b4fe6f66a1
prerequisite-patch-id: ac7bc5ad958bb392a57871dde1f79c2fc520d482
prerequisite-patch-id: 332b888996b9d6c58e8c90eada37dc14137755ea
prerequisite-patch-id: a2a20bdd51ea3f44449b116d7c9408e0cd90a7fd
prerequisite-patch-id: 47582404c535e0239542882bf07d6c8161cdd50f
prerequisite-patch-id: 2d76098fec23a279054b2f580e42cb90f82dc4d1
prerequisite-patch-id: 48c82d6e40f27205cd1f36b38bde19ba3186f6b4
prerequisite-patch-id: ef06195615929d1e6cd58cf84aeac18968d3f872
prerequisite-patch-id: 83ef9658644923ad9f4e6a095f8b262c6ebfe295
prerequisite-message-id:20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com
prerequisite-patch-id: 99245529321cadedd30d9e38845b53dba3725de8
prerequisite-patch-id: ec6621f8f392aa46f365eae91a3a0f66b1628d0b
prerequisite-patch-id: 3da6653022d716bb81b440cd472bd464082eae24
prerequisite-patch-id: eb9cd5e7ba7fc4ea86f758e127775c70dfda59c0
prerequisite-patch-id: 648c31f694cc711154d2cf2137259f39a398be74

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

