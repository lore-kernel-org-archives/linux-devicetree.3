Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6098823ABB9
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 04:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782017450; cv=none; b=RnIMfXmt3iLWhrllXO+Zk8dqWL6ksWSk2p4og8JKATp92cXdMTBlDJV2zXwSkKfwUiFHeyphXccWTbWBOcIvDYHvxdhYMA2TJHbzh5CzDSjwoFgYA6cjoKL6qBmmAESkLuGzGqmta1+AOwmi4O/L8ecrYp1Kt67eJX2J7edl1Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782017450; c=relaxed/simple;
	bh=8PqTckff/2KhW/R7+QkKppL9C5bFkVcBlbCim+KEtu4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O5NvjNAr2G6AGhq9TCA3Y/r1JD1TGHMZYfYtnFY9b3DLv4dstrSxcBXtdnmZKOW5RKJJyem/RLh4LrRSadNXBPVc+YADltrt3dsnMIKRbAvMDA0tlRTrmMFhGl/x7QnqIa5QlkE8GPPuLqLXvf4TRTh38eH8blaEMA/SpYxc4H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ocu4pmkc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CLUkdMqm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ocu4pmkc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CLUkdMqm"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65L1lwH91129523
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 04:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YDrLLj2W4IrIxTKEPCyhj6
	9pADZA/AxiNEQg7MK4I68=; b=Ocu4pmkc/K96EKeYYeisJ84fQHIEfUpph4cOh7
	WE+KkXddqHyR5AyaTXe+WQDPZ3dj975jycWdnvrNaFYPAeP2o/eyTLaO2ATDqRMw
	X6cN21iq3+Yxcrz567TJ6Dy99MU05SgOMEgiv0ibXGr2UgG1BF4PecwBV1ol/jN8
	LgPTZTW59VNjf3nA0MMIiTzGKlSEJzFvB9K8eetZiJ+OBIeqd1VlRKGxwpJdRvaQ
	14On1WRRjKMPgRsE2zEtVXfPu4saVMxlv3JsF9Y+1CXU1bXS25S1wRgAc4w4dnyu
	qe/9MLC7aCr1n7AEx8lloXGJKV7mHhK66zKsMYf8EZVcCYaA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhv5jeu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 04:50:47 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7f5be115cf7so87611167b3.1
        for <devicetree@vger.kernel.org>; Sat, 20 Jun 2026 21:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782017447; x=1782622247; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YDrLLj2W4IrIxTKEPCyhj69pADZA/AxiNEQg7MK4I68=;
        b=CLUkdMqmBNBF/kt642r2qCEzY5Lk5haguaiP8/aMwzFH+vOeuHWtihxJXrheOWtSKH
         jkiahRkOey2F9PGxw43NOKuTAkv1cxQR6LIDrHDZPK966TdSvCfSTpF9jHBgAOXCBF3X
         wVHaWHq+Y/XjXXQuhT9kG2RsKkebkWftzrBBfNHA9wNOOTxnLTM2TgPH90Umh2KcDf/s
         J6n7XvTeCDyIu+uTw7Xb7xhoWfo+D3SjZ7y7WblLG42TMYz4mNf0wV/wI1ThOh+FFebl
         T/yXaFs2khlQYSEUcqgg/aZP2bSxvFS8APsJToFQTpwuCbF811UP4fp5eLFB+N+RDExp
         h4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782017447; x=1782622247;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YDrLLj2W4IrIxTKEPCyhj69pADZA/AxiNEQg7MK4I68=;
        b=LiUqEjS6hOxgKL3mgDRyQf+rPVwYc/iSzAAePrKJfEAQVWtzO+H3vWmdwBn1mpncFa
         5umbSTTWwSawBbXmJ4pbjZcx7H7PXT/4IDic+eS0BfT91MVDpSLQY/RC3qWBKr+53kRR
         pxpSjxpCS44ZOX7fPX7DMUYea7seFUJj15F1ZKx8tAR1AdP1f0zI1jwFBKFqG7XCZRkx
         0Bt/cRRJezRWtOkQ7RBJkj5NxaQRo5gGiycWp+MxBEX7zJyaXxRZkpmpmAsEJwBYoZru
         7eEdLIRMsZZdroqzoQotILIW5iL/pIsP4fjzMsvKLG/NhaiByJJLA+VNUX0MLsiWLW07
         2l8g==
X-Forwarded-Encrypted: i=1; AHgh+RqVsoPEgcJOwEub5AhhLRguxh7njV9nYU4hluMcI0/YQOzDDZb9d3xvU6P20dbkZtQbSpksjSfNqT27@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/7dWuIcAyfcHGoE5hB24nPpi/3ilgeXnKDeR+2D+hNMYkZ4hB
	1kH8TuDSN5NFs8Y2sKHcnA3BFkzTZ00R2CEvK5N9kQoNY1SOAOkYMOaItKCV1UlUz6eO4OYNf3c
	SV0LPcJJiv8KVvwmunix/UGT6WOhBHy29g153mgjkVtxOjQnUI8FLwdTYVyJp82ZR
X-Gm-Gg: AfdE7ck/MK8HMl2hiVCzqvIxtUOO0cQJxJdjghcEBOpTxhXJW/0i6R2WCVsZRdk+BTq
	eRUJdI34atcfAk3uszGH6CTc08m7qMym2fL+PML5KJPCG+fTgP52hQ/jaw5SAwBln/upfzKeVie
	eOP5eJJxXGc5CpzDPU0R07ZyjDtW3Bl9KO+H0SYgq6W3ZGqfa2mis6AVclhEyZUbG9zUDCH9w1o
	fZYC5ftMfQJqj5Qwd8mm908NvJzH8O06Zm92hoO6IhefhLV21otJEsvVQwO+tOLIDsjS2IPhJ2l
	W6w2VzlqmdsG6BUVK8PSRrXzvZklhuYXAmF2CknXmq8D19CYD4yWOmaTGvJqBkiXLu9umYPOrb9
	1RqjTZ4donmSM5g2O2GIGvPGTdYOEjeRfjxmN+Grj03vloi9n/Jz4hQb7IVyVQt+MiyQlrXAzk+
	QsQI93ZJ2UxCKz1+e4CCyqMXnfOe2QyQIuYWXbnNSKn6btsii8nZRUq14=
X-Received: by 2002:a05:690c:91:b0:7e4:3bf3:76d0 with SMTP id 00721157ae682-80122eb8254mr73532327b3.18.1782017446789;
        Sat, 20 Jun 2026 21:50:46 -0700 (PDT)
X-Received: by 2002:a05:690c:91:b0:7e4:3bf3:76d0 with SMTP id 00721157ae682-80122eb8254mr73532197b3.18.1782017446360;
        Sat, 20 Jun 2026 21:50:46 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:1700:b450:a0df:855e:5925:800e:2644])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8026089574fsm17226837b3.44.2026.06.20.21.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 21:50:45 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Subject: [PATCH 0/3] X2 Elite HP EliteBook X G2q support
Date: Sat, 20 Jun 2026 21:50:40 -0700
Message-Id: <20260620-glymur-send-v1-0-fc4a2cfd107c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKJtN2oC/42S3UoDMRCFX2XZa1Nm8jPJFhHfQ0QmyURX7bZut
 qKI727aakHwwpvACXO+OZzko68yj1L7dffRz/I61nE7NYEXXZ8eeLoXNeamew2agHBQ98/vm/2
 sqkxZIRrK2hpGDX1z7GYp49uRdnN70nUfHyUtB8T3xCwv+7ZmOY31O17SQ1uy7gwVG6P3Fkoml
 wOEwkTBxSQ2gvFDYGd9KUfO2QXOkkEIOlmXDUeD6IuzWCDbPEAkgszJm98uLhhYCmjfbBpNQoz
 WkLdU2GA0kSSKpXhwbaRWPhax7i6PPdhzD3d5p15RoeKMQJ6DNOz1ttbVy56f03azWbXj6m+M0
 waCc4gr7YwmGhqnjnFcVZ6eeP43pqV5mnaqblNqaUiBSsVlEBxsdOW/GAvm/Lgnkml5CkjIzpf
 WD/9NilxFHW7GZd1N8raon7/S335+fgEBVFfyYQIAAA==
X-Change-ID: 20260619-glymur-send-1136d243a120
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDA0NCBTYWx0ZWRfX1e/ZJCVwj12H
 O3m3bKXhYv92BBFsIQGgk1EFzEY1DV+9vmUfyBcraGTMbyAaOhYva8JJt29AnRjZPxCPBz6vXVU
 AyREsqJ5EIqv5kFtKdt4uOUXiOidRMxhrWHCNpFURFnQwJivHV3Cas0ocomksaV1Z08se3woJr0
 Pfmdizw7moRUsGgTH2nUJIEbG/gNbn8uvjb8lBhvrdF1rqSGnogNHzGYE7RY+NvRgujX2W7490G
 oHk/2OUP3/HZE4Y5+zsixL7ZeJiDTSyust5hFMBdSVrkE149K6R/HV6Sbu62GlModJTg6TPH7o5
 YkB0RS3dy0UvTtfMq5N1qo+iWNlxxpJSD8F1ZzP/X1tgwh7T5J73G5W+DedlOwgTuLXWiknoA/A
 6Tax3s0a6nQ8EmYNarF8XJ/9EvxZ6pjoYcXiB9dqE8QzW5MZDOgtoylGEter4QxX8yImbtXe1nr
 96Jg3n7TcjpQ3RF+5Mg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDA0NCBTYWx0ZWRfX/S99Nn/6vkSx
 8ZDZn329tbKI08VxWBGnwgr/uDD14vQV9YbYZUFJ5fdZm3rseeq7pe7QKBpTI2w/EzWZKms1K7M
 iO6KQgH+fVAVgd4uzUSMblOVGrrI5dA=
X-Proofpoint-ORIG-GUID: XINWxb--6y1ygNhmsu0rTaM1orK1STCO
X-Proofpoint-GUID: XINWxb--6y1ygNhmsu0rTaM1orK1STCO
X-Authority-Analysis: v=2.4 cv=UrZT8ewB c=1 sm=1 tr=0 ts=6a376da7 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rKAgd0ua8hRQMlgXrsgA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-20_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1011 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210044

This series adds initial device-tree support for the HP EliteBook X G2q
14" Next Gen AI PC (product SKU C4JG0AV, board 8E91), a Snapdragon X2
Elite (Glymur) laptop.

The board was brought up and validated on real hardware. The electrical
description (PMIC rails, PHY supplies, the HDMI bridge wiring) was
verified against the live unit rather than copied from a Glymur CRD.

Working on this laptop with this series applied:

  - Internal eDP panel (samsung,atna33xc20)
  - 2x USB Type-C with DisplayPort alt-mode and USB
  - Chassis HDMI output
  - Chassis USB-A host port
  - Fingerprint reader
  - NVMe SSD on PCIe5
  - Wi-Fi, Bluetooth
  - Keyboard, touchpad, touchscreen, lid switch
  - Adreno GPU and GMU (Freedreno GL on Mesa)
  - Audio playback and capture

This patch series builds upon the recent work of Qualcomm engineers to
enable another Glymur-based laptop.

Like its peer submissions, the camera support is missing today.

This has the same known dependencies as other boards on this
platform (audio, GPU, SoCCP series).

The GPU device-tree patches come from the partially merged Glymur GPU DT
v5 series at
https://lore.kernel.org/all/20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com/

SCMI on this configuration needs CONFIG_QCOM_CPUCP_MBOX built in (=y).

The bindings patch is independent and can be reviewed/applied on its own.
The board patch can be reviewed in parallel with the GPU, LPASS and SoCCP
SoC series. Until those land in the target tree, it will trip the expected
"Label or path ... not found" dtc error. As with the X2 Elite Lenovo Yoga
Slim 7x submission, this v1 is expected to trigger some dt-bindings warnings
that come from the in-flight dependency series, not from the board patch
itself.

Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
Jason Pettit (3):
      dt-bindings: arm: qcom: Add HP EliteBook X G2q 14 AI
      arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
      firmware: qcom: scm: Allow QSEECOM on HP EliteBook X G2q 14 AI

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts    | 977 +++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |   1 +
 4 files changed, 980 insertions(+)
---
base-commit: c52dce2340e79e98cf4aa05606edc8db1759e026
change-id: 20260619-glymur-send-1136d243a120
prerequisite-patch-id: 36f4bb7740fd65d808fa6685bce4b03798a547ff
prerequisite-patch-id: 054631082c45d3ab3117f541f0d4d90b660dac73
prerequisite-patch-id: af18aef027c45213c11b436746fa31b3b6ebe46b
prerequisite-message-id: <20260419-glymur_dp-v1-1-ad1067a8e8ae@oss.qualcomm.com>
prerequisite-patch-id: 7cb9a168c33491bf91ece900a2218aa7b4b68ddd
prerequisite-message-id: <20260523085511.2532669-1-sibi.sankar@oss.qualcomm.com>
prerequisite-patch-id: 43e96d8a5063f51e2b5ee75fc8c9e10682e5670c
prerequisite-patch-id: 2e71d345f84a821d89da2a6064954409fdb1277d
prerequisite-patch-id: 0b9f5995044bb3d3ffda227ac986b755fa118c63
prerequisite-message-id: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
prerequisite-patch-id: 8459bcae98ac156f6576657fe9233badcd385218
prerequisite-patch-id: 9ab2b37c0a11c3a9590be921fefc8709ebebf6a3
prerequisite-patch-id: 21440dddcc340d35558010fe88bad9265e43c6ac
prerequisite-patch-id: 162f8b373ead5344ae0f29c92432db57a0d75f39
prerequisite-patch-id: bf5532cd5c8b66127e20be0677adbbbb3bd9578f
prerequisite-patch-id: fa7954f6fd2d27a6f0e805c9643b70e7e201c503
prerequisite-message-id: <20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com>
prerequisite-patch-id: 48c26c428cbeaa674a615704d1abeb87e4e965c8

Best regards,
--  
Jason Pettit <jason.pettit@oss.qualcomm.com>

