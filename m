Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793452251;
	b=C9DQ1sM2ne7No0lYjg4tt7RABgNZU73SRTqDcyMmOSaCxYPlx84eaUmi5hphROmlhaYX
	 al0BfBwWiV3808PHCVshveHp4os3wgmkW2qs+qK3hooaVvTwruFkjgU4xRuAEdrMEP+99
	 k45j5/EsNXgK8FNk3MLrzeaFmRhGnV90QquSrCFX7xkJ9E1ijaauwMyRG6yNvP7g4kUd0
	 H0eEfAEhUrTWOrRFLF21u3CLQcVfrJ/6uU0YNoEsnYoh+iUcamHfNg+Qw9Db81G0ggszm
	 Xbalwacq6XOZT/M0MmhFFUXl5zfNyHG5ilB8ueY8UZpXraezqtL50rZB3jJsQE970lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793452251;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=duVsG64Sl0l3TykskMHzQEgoMi89wQI8nBGjFfjz854=;
	b=vlgaEG6LckfPeIdLO2rCbqZsZr46iQGqw1GyqVh/34JEWLSo06pVZuTZ8XwEWxcw67YG
	 /9x8jSolosrY3xGWZM60yvWxXpdMbZJEvJEtWDhpKYdOTla2dETrCQGFgN8igJ+JWFL32
	 wrxwSQ9EaRnZNe8iuP2j++t4swiK4O5pzdrmk6KLXfNnVEpH+WBCnPlMGjzi48uN49Zr5
	 8+s80ksHgMVzs8sOuWaUUek4N7sO/ak22BeGRBEsr2O3B8/ouFowkeXJ/3MAMElluBr0s
	 DKj9VqwnI1rGgZ9CbjtMMMa9r+wBKPzAyQv17VmUp7CEW6X7TZOLhKyQ5ykRjaUT8Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XewZK1f0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jyovGDIn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792D4606A323
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 792D4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XewZK1f0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jyovGDIn
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0L6e3208922
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=duVsG64Sl0l3TykskMHzQEgoMi89wQI8nBG
	jFfjz854=; b=XewZK1f03Y09b3WxwuvrLwzAXwW8z1ZKEn8qZJkkjL5lcKGlf0c
	CEgNXVXug0B+qB8VKhVfOuzQbVWOJ0NhL+ImEx2IeWLfKbb8YLL0pJC02WRBR4mO
	9xHhrH7dSztg+6fl3ghIUlhyN1uwqXbzzB6tpIOrtx021HYrNd7or2I8gZTPLc/f
	uJ8zlf5NcI6D1wUUpESwmWnAjuoIAM1rMfDc6EgddUdXyZvK/lx69mRgJY2DJI5W
	U8cul8D9xbwZepVcEc+yGj0RpMGq2aJCcIkalAEDfd/8+yvmPQ7pY++dAkH8LCGe
	74N1fAG8E/t+MQoTVdTKkbJSr+vN0V/zMVQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rs9xy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:10:49 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1aa0fb7f157so2485598c88.0
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 06:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793452249; x=1794057049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=duVsG64Sl0l3TykskMHzQEgoMi89wQI8nBGjFfjz854=;
        b=jyovGDInC80ZC2XJpvG/J7eLev5aYPDBg96cKm2HH2ZSY7jm1rtQg7ab6h+DA1QRX1
         F06OrWyg0NgpioRsR7BJVURh6tamuRVWEzTQGpCs98qe/qPmi7GedQ6rCmWOomTeb0AY
         Bx6EhwHTz7GiUJUtV8yhU3/er+QNUFudGfZDQVdBwyab3IRm9glYIgZruzqhYAUZu2bO
         RuCE5VkWeqB8lqbgF4Gvoil8T35OPp3CplMu2WVTVq6lVwOtiOkG9Uvapulj6ctariae
         DwkVcv9BjGSGXgAFErG0nO7bmj1m9DRsbFbDqm89VkRHF21YYKBT2+ow6b57SjlxyN7J
         OB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793452249; x=1794057049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=duVsG64Sl0l3TykskMHzQEgoMi89wQI8nBGjFfjz854=;
        b=cyEfN51reeLzxapo6u3rfZTWPCGt4FVITsPf592rEztnmBZpvYJ2wVtZEKX2bPYHiT
         HC/DtGNdg5I8sXF8zRYGD1hRLJas9J5DXtbDK/Fx4pKnoGC/hxXwyGlCA1HY1657KZJD
         qTFSlUOvRnrcd2xBzsxNjxkAfG75W9DLPuv6j+ut0vSm52/EOxTPwSdi7AfFiEYaSof+
         AMChWwaPo5gGJj+8WhbtlJHA4PJRQW6rxopJsW0BYrAI3KqHhXk3pPFowJqlBRSgJMxq
         cMjuzJn7JwMWICPlc8vpOQLAitL4OX1/xHqjiEnUHRycDlzyOzYkvrrqi+/VjtSWT7cn
         qNsg==
X-Forwarded-Encrypted: i=1; AKwUvBzXeW2vFVY77j70RQ7MZ9lQmRd0H8Og3MW2sIH2Z+oQgcT+v+KbaO+kwLo9WBmnp/YjM+aCFeGHdH4Y@vger.kernel.org
X-Gm-Message-State: AFq9FYKHIJZkRfS6BJ4AaMP/z/48aWX9zsI4X9fhozUALA02nWMOLy/+
	uQUmziKUnt+EeVdpNrD3sEJvX69LWPT1Fz9sIDUXX5qyj1BxfA3Ff5hGHBpZzsf92CNIEA0ZJzX
	nxWL2hqJw25tR8/f4HJBAOW+ZLSSerJpcKOF4yp0DUn8vi2IrhbUfzrgqBsl/gZhR
X-Gm-Gg: AYBFou0YSJEBGW0qidRaH0ZAj8Jt7T0rJ1Uhbth0Xx0jg/AU3WThRRNqaLmLf5DPHVt
	k0kON3EN+iCOnfsRtn9g33rUmcKG4eUE0mABRSqVOuujjUwgciZjeWDExoEdv+vDvdastgnq2h+
	aR43kfwNZvOHo7u9bXhBrHJIL6pl07R0iJWBqGE3Phy8VQldAmsnSWHSihO39qvHyQAvvhmhqW/
	ZDhulmbVOBIVJSOX/xjh50opZzofKMNJY8LXAdtD86C28V+ng5paIKKzIqd+xG2UWjCCKv2ho9n
	N8SsksRqBkHxwwKatvCDvRtt/fKNRWxZ7cXx8/8REZo4Hwm5+/wgVwRvv15N/vYJULxE9ybehoY
	Vm8AXwa+u251Rr8msFTUvBy8r7p0+cL2FvtI+plDSNZWGn3aDPY1ivpE0uF6nNPfU2+pxu81zvD
	f7avjBdLFcYaegDsIcMtCpwYDHi05H5Bpb
X-Received: by 2002:a05:7022:285:20b0:1ab:f77:2977 with SMTP id a92af1059eb24-1ac5b027fa5mr6919205c88.14.1793452248705;
        Sat, 31 Oct 2026 06:10:48 -0700 (PDT)
X-Received: by 2002:a05:7022:285:20b0:1ab:f77:2977 with SMTP id a92af1059eb24-1ac5b027fa5mr6919174c88.14.1793452248139;
        Sat, 31 Oct 2026 06:10:48 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm15717872c88.5.2026.10.31.06.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:10:47 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] arm64: dts: qcom: Introduce SA8255P as Lemans family SoC
Date: Sat, 31 Oct 2026 21:10:36 +0800
Message-ID: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JJXlCqeAEP3-du6wgzJhEtl-MsA1s3z1
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae5e8d9 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=QWYla_iuZz5IAfy8WBgA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1MiBTYWx0ZWRfXzg5aQpPVbgHo
 EOv3Y9wv4K5ktxnK7UL/W/aDSGc3u8BZkWtVNbD/7AYcVx/PJXDvrD7AO5cVFeOf9AjrxjPvzqe
 ESlG5LDeffpOGG/FwWWOYd3+bmmL46o=
X-Proofpoint-GUID: JJXlCqeAEP3-du6wgzJhEtl-MsA1s3z1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1MiBTYWx0ZWRfX7gOpOzlco/sI
 /2OI/t/N/FRRVJZLbqs7R9yjCMJfC9+X7+d/ox9mB1XA1EciEKPoUlLdJJ6xYsm31WXDzxj8sQ3
 oU+8eLBr6N1IztDyvgG2+8n7TiEDah893X0Qu9kgwjK2gwPMvCy/9yxxSiTH7R0w+T+DvJKUf9D
 mNB4cGGXV3oSAc40YXx3uOmCcT0WowUxcsUag4d+AL3maRXCV3AmIb3Stk/OhUZvfJwI9TOXLfn
 psha+OXHQWQIQVI2WeMzq1g2a8/Pyx01B50cXLnscB81YP16FBWqMNhYP7DjOEwLIYAuz5JcwPm
 SYTfxe2a4EQZ9M7IGfkFYUeaJld8RmpLJJqqSfd/4dSoCeHOOTiHfVXjGibWTMBjjawcvZpUcF4
 EU9TFjbZjaxWo3NntuUahGHpcHr8mGgMsnl5LWlc1P67OiIhF0Wg2guioFsq7NBvygWr0JEXU1e
 NSwQVKKyETuO3csTSyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310052

While the patchset [1] supports SA8255P as a standalone SoC, this series
offers an alternative by introducing SA8255P as a Lemans family SoC.

Lemans family has two variants: Embedded variant (IQ9/SA8775P) where
platform resources like clocks, regulators, interconnects etc. are
managed by HLOS, and GearVM variant (SA8255P) where they are managed by
a VM acting as SCMI server.  All Lemans family SoCs actually share the
same hardware configurations like memory maps, interrupts, DMAs, etc.

This patchset moves those platform resources out of lemans.dtsi and gets
them accommodated in lemans-embedded.dtsi, so that lemans.dtsi can cover
GearVM variant as well, i.e. lemans-gearvm.dtsi includes lemans.dtsi and
overrides/adds properties as needed.

Changes for v3:
- Rebase on next-20261030
- Squash patch "arm64: dts: qcom: lemans: Add label for firmware and
  reserved-memory" into the GearVM patch (Abel, Konrad)
- Add label for scm node, so that lemans-gearvm.dtsi overrides it by
  label (Konrad)
- Override QUP I2C/SPI/UART nodes by label instead of nesting them
  under qupv3_id_N, in both lemans-embedded.dtsi and lemans-gearvm.dtsi
  (Konrad)
- Use SCMI channel 9 for QUP I2C and channel 10 for QUP SPI power/perf
  domains (Shazad)
- Add a comment that the SCMI doorbell interrupts are updated by
  bootloader (Deepti)
- Drop unnecessary linux,cma node from lemans-gearvm.dtsi (Konrad)
- Clarify in the GearVM commit log that TLMM GPIOs controlled directly
  by kernel, e.g. PCIe EP PERST#/WAKE#, are not abstracted by firmware
  (Konrad)
- Sort top-level &label overrides alphabetically in lemans-embedded.dtsi,
  lemans-gearvm.dtsi and lemans-sa8255p-ride.dts
- Link to v2: https://lore.kernel.org/all/20261015023711.721837-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Rebase on next-20261009
- Drop patch "arm64: dts: qcom: lemans: Move PCIe devices into soc node"
  which has been applied
- Drop patch "arm64: dts: qcom: Rename lemans-auto.dtsi to
  lemans-sa8775p.dtsi", as lemans-auto.dtsi has been removed along with
  sa8775p-ride boards
- Follow Nord naming to rename lemans-iq9.dtsi to lemans-embedded.dtsi,
  lemans-sa8255p.dtsi to lemans-gearvm.dtsi and sa8255p-ride.dts to
  lemans-sa8255p-ride.dts
- Move linux,pci-domain of PCIe RC/EP into lemans-embedded.dtsi, so that
  lemans-gearvm.dtsi no longer needs /delete-property/
- New patch "arm64: dts: qcom: lemans: Add label for firmware and
  reserved-memory", so that lemans-gearvm.dtsi can override them by
  label instead of duplicating the node hierarchy
- Add SCMI power/perf domains for QUP I2C and SPI controllers in
  lemans-gearvm.dtsi
- Link to v1: https://lore.kernel.org/all/20260409091100.474358-1-shengchao.guo@oss.qualcomm.com/

[1] https://lore.kernel.org/all/20260304-b4-scmi-upstream-v5-0-f8fc763d8da0@oss.qualcomm.com/

Nikunj Kela (2):
  dt-bindings: arm: qcom: add SA8255p Ride board
  arm64: dts: qcom: lemans: Enable lemans-sa8255p-ride board support

Shawn Guo (4):
  arm64: dts: qcom: Introduce lemans-embedded.dtsi as a placeholder
  arm64: dts: qcom: lemans: Move pinctrl states into
    lemans-embedded.dtsi
  arm64: dts: qcom: lemans: Move platform resources into
    lemans-embedded.dtsi
  arm64: dts: qcom: Add device tree for Lemans GearVM variant

 .../devicetree/bindings/arm/qcom.yaml         |    5 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi | 3685 +++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-evk.dts       |    2 +-
 arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi   | 3224 ++++++++++++++
 .../boot/dts/qcom/lemans-sa8255p-ride.dts     |  222 +
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 3371 +--------------
 arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts  |    2 +-
 arch/arm64/boot/dts/qcom/qcs9100-ride.dts     |    2 +-
 9 files changed, 7147 insertions(+), 3367 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts

-- 
2.43.0

