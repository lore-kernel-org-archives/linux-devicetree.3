Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9E53016F7
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779652168; cv=none; b=D5OHPo8US4iKhtDpIgS1NL+e57WkrFgfhsomEutBI1wAwesNFPyjBpEsp+hjANO3gXZm80nkl6UQNiDI3/oI7N/wKbdNHr9m3F0p/U6cXCaBP10tgAQD3zecJj4O1+F7zBjWTfN+bSImZCt82yKzBR/kwPatmRd5XdhJlh8CM/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779652168; c=relaxed/simple;
	bh=UZm98260Y91sD/0xzBGeVhOmEPZZGD7lKsH080IX2tI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UeeVbQB8G/82q/66WMAjc00r0hI8u423eesqgYgi8uHaNv3fgnsWmgCaUQ7t0hPgi/5rkIwkC0brGd+dKOmrI+16gjGR/b3nuY7VzLN+G/3ycm8QpmgBQqF8PBSmWPZNLIfP5kxdi747VVgjBDWG1YkXxDim3Mf5IfyHraRTzgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z4Xhlcb6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OFVj2uIG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z4Xhlcb6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OFVj2uIG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OJKKrM2602665
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=45+iCpvc5VWFUTB062UN7b
	k3k/bR33KPxgqVzcCpnmI=; b=Z4Xhlcb6z7gTxJHTFwMYrcorAWchk/lylHhZTp
	VCLpQgcLgpOHN1M2neZHZ+LciduECg/GF4Wk+G56CFtTO8dlgNOJ09z/zb8P+uFv
	TwI/U/fgDVsn+EEz4FZk1dJ1SY8tVRGqt57m0CsgS2NnKrFVViyK1E8iQDEDejiB
	/Z1QOL8lxxnTFLn6GA9W4P56JSrnG08oiCHYujB5fR0DcrmrblY0TIm7ISC7E9pJ
	a51ccp+lbFHSoz0NoWpThAo/1ByuyrEJWiPAYJ7T7PXbjKmhJ+TG6T/X2mFT4sDQ
	h7uKRdUeFIRLMWSPavqsHXLaM/ippV6KA8GJ4c6bB8To6sxQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb36t41rn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:49:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365faf6006dso8766444a91.1
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 12:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779652166; x=1780256966; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=45+iCpvc5VWFUTB062UN7bk3k/bR33KPxgqVzcCpnmI=;
        b=OFVj2uIGRJQKgjPr1Ums2d1Hqh16GSKAoLTSPJsq4RIw5ZJIrIQDb8XwxQGVhNJDpZ
         usvTTdveerZsmkHlqQp8zbAwh/u/iUeWivQTSOMvKa9wQiJhdg4KtrcG2bCeqJyIzIRV
         NzDu0UPQcGTRvqzyJRP5AOvzh73vuY8sfkxaDgsd8fv2CKu9VYorNd5tNfdp4E82r2Mn
         J7sLgR3EY+uTvHyLEfb6j/HLBr1QGGfpob1GKtOMV4mLNtSA08DMg2hIewtgRgq3VgAn
         HMdiBfJrzUOghXEoTN0/h1ku/PVjF5pLugdnVwZv7L7xRVLNkExmoKk5qO+ot2ZlFO45
         WcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779652166; x=1780256966;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45+iCpvc5VWFUTB062UN7bk3k/bR33KPxgqVzcCpnmI=;
        b=CU3wlEvXYHEjeygoYVvEBbN1hTFuW922tGbHTYjDGo2rw4Kj7B0RyWiCK1wwL8Nl15
         A+MZcpsb49ZUj0fsH8JxkbD8GX9GBrsrsXzTUfoTzbRa3xddCCRIEwcA9Dy2mlcCUXUW
         vxZw8QYWmmeXNL/1nUl4Zh4IFnjpSKeE/EfKFUUDaF7EximvvwdQLP+WIXSyo6t/4uns
         7vaAQKC0uJDUYYIchA2T5N9fmihY72pYQYjoqRKEgC8W3nxQLTwxDpxnph0bpUcJKneq
         gz2ngfGd8nGPNFa9u+R549voBNvBqhYyVEeyYKnYkkJb5m4Ib3j8Mc6xMPM2Q7U2mW67
         oGyA==
X-Forwarded-Encrypted: i=1; AFNElJ8KZbCfhHBmeG4W62mZCCpbvAkKzTKi2fSOhpxOir/1DqopolrnhTf7Uma3eKbpGIExrxymTKlQAW4q@vger.kernel.org
X-Gm-Message-State: AOJu0YySVHeLuTZYuEWXNt7fnOvw8UYlCUZ4vh6caBIVqEyDAqC4UwbU
	HFMZC2VgY2yVWDnS/Nvhwq+wWVPYnL5+6HnTqAoweVv0//eYIsQEeI/0b2nm4yu0l+0dTOzNBn/
	jfy5QIGc1C2pwsZ6G7w8kDsykQVYYMv0JTaWqf0NqxHjmhDPI4l5DY86EsDHR3Dja
X-Gm-Gg: Acq92OFn3r3ztzEJXKeiJzVBZBVPL5ZIxlftoVZv1yYc/kxvclCwzB5wnzitRT/BLn8
	GD/YrM0vdXjWjN6hTDbFXrgiuNXB0Ee3+IAjmvrCyvqfCLObH5B08lecOSzeFmNCCznW/MpVzlR
	LTKW7llqD3gQLFzpKg3lXwg2CGCG7KTpr2/L0W7VbKnxLtKT0464YNuWHth5OP3RaQFOIHKTYjx
	Zi5dmvJLe1YFhMmw00FFgbdMRJ9hB7/fVtIcGeIZ8gQi66rrb+eToGK+vcDzJoy8uczKkvBpGGO
	duJFcVg75MvAUfA4xRXXK3yDv0GlyN/zWzP+sDen1KG5Woskms1cnTfk8NStDgbr3bP6n9JzUDb
	C4EMFSO5zM3D0kXTK1/5tEassKoxJTd+0r/AY
X-Received: by 2002:a17:90b:5385:b0:366:346a:6891 with SMTP id 98e67ed59e1d1-36a67836e6fmr11627649a91.16.1779652165616;
        Sun, 24 May 2026 12:49:25 -0700 (PDT)
X-Received: by 2002:a17:90b:5385:b0:366:346a:6891 with SMTP id 98e67ed59e1d1-36a67836e6fmr11627621a91.16.1779652165020;
        Sun, 24 May 2026 12:49:25 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6c21d4a2sm4725849a91.1.2026.05.24.12.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:49:24 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH 00/16] arm64: dts: qcom: Extend Shikra device tree with
 peripheral and subsystem support
Date: Mon, 25 May 2026 01:19:04 +0530
Message-Id: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADFWE2oC/3WO3UrEMBBGX6Xk2kAyyaRNX0WWkp/JbtD+mNQiL
 PvuFrvqXujlGTjnmyurVDJV1jdXVmjLNc/TDvKpYeHipjPxHHdmIMAIBOT1kl+K43Hlo+Sig0h
 BdUBtYruyFEr54yv3fDq40Nv7Xl2P42+0b46klA/J2GK0rUZttOk3xR6/+BHUt1CWMgcuolOIA
 U0w9l8H+FppqoPPU8zTmVuXhEDSXgH1m/xTAn0fGmipdXhVHAFcIp18l/BueVeJh3kc89o3QVL
 woGxySqNBsE4BICq0KbSdN5a8jZ1u2el2+wR0chzCegEAAA==
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
        Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Yepuri Siddu <ysiddu@qti.qualcomm.com>,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779652157; l=4127;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=UZm98260Y91sD/0xzBGeVhOmEPZZGD7lKsH080IX2tI=;
 b=djc7KEpkzBuKIiYDY3FJdJT7raiwQCvqgI0jCHnIKyp8j2e1af42aiqq192kSWKkKp4PZrffa
 dVndidU8Kt/DdHN5Kt9TKArpKDfjvx32qioknpxqKCim42k8JZwuIi0
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: 74Uo-noHIzclDPjsStLDTGZn6aap8aYN
X-Authority-Analysis: v=2.4 cv=Fto1OWrq c=1 sm=1 tr=0 ts=6a135646 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F_wByC5qsg8vutzaSOUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 74Uo-noHIzclDPjsStLDTGZn6aap8aYN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE5OCBTYWx0ZWRfXwFqLYDi/4Aei
 S0ypeykhvqs9KEmxQZRAceR8E+NhDjPDpgZhwVO/Nn0eNZSFtqxl06wEN44ojx64oy1XeGngQ18
 BT+V/oC4XqSS0VtiUqsfcBehxorajxZ2SNVUwTkhwyjz6QDX90Wk9IvVVx0U9675fTuTypKwD6R
 8MrUjrdhOek8k+uMkq8PVDBTVKy0+FnQjZkSqsBmFSPfjXyhOF6w3ouLeexiMfVNV2/FIoMK2sr
 1HZ9DWN7UdYt/D3nQ+r6aQa0OweBa+4gLc2Cr5258H6LUh/rEgcIrAPFoX7sZJ6KnljoM5O5DhR
 v00Dl0Zu1E5HBXyfpV4ZTBIUKy97D1+g8nEz858iYgnzNpc0RNTJDtysIx8BbqorP0J5tteE7UL
 ImoMOkB4ECIJgxsW1MGQgwWieCVyPhEzojO7BmmBAWx4AwWv0WYv6aZ21bfrtgDMv619jUrVFwI
 J1KQ8hm5C6thA5jx8kw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240198

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

This series depends on:
- https://lore.kernel.org/all/20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com/
- https://lore.kernel.org/all/20260521-shikra-rproc-v3-0-2fca0bbe1ad7@oss.qualcomm.com/
- https://lore.kernel.org/linux-devicetree/20260513-tsens_binding-v1-1-1780c6a6caf2@oss.qualcomm.com/
- https://lore.kernel.org/all/20260524-shikra_epss_l3-v1-0-b1528a436134@oss.qualcomm.com/

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Bibek Kumar Patro (4):
      arm64: dts: qcom: shikra: Add CDSP, LPAICP, MPSS remoteproc PAS nodes
      arm64: dts: qcom: shikra-cqm: Enable CDSP, LPAICP and MPSS
      arm64: dts: qcom: shikra-cqs: Enable CDSP, LPAICP and MPSS
      arm64: dts: qcom: shikra-iqs: Enable CDSP, LPAICP and MPSS

Gaurav Kohli (1):
      arm64: dts: qcom: shikra: Enable TSENS and thermal zones

Imran Shaik (1):
      arm64: dts: qcom: shikra: Add cpufreq scaling node

Miaoqing Pan (2):
      arm64: dts: qcom: shikra: add WiFi node support
      arm64: dts: qcom: shikra: enable WiFi on EVK boards

Raviteja Laggyshetty (1):
      arm64: dts: qcom: shikra: Add EPSS L3 interconnect provider node

Sayantan Chakraborty (3):
      dt-bindings: interconnect: qcom-bwmon: Add Shikra cpu-bwmon compatible
      arm64: dts: qcom: shikra: Add DDR BWMON support
      arm64: dts: qcom: shikra: Add CPU OPP tables to scale DDR/L3

Vishnu Santhosh (1):
      arm64: dts: qcom: shikra: Add SMP2P nodes

Xueyao An (2):
      dt-bindings: dma: qcom,gpi: Document GPI DMA engine for Shikra SoC
      arm64: dts: qcom: Add QUPv3 configuration for Shikra

Yepuri Siddu (1):
      arm64: dts: qcom: shikra: Enable BT support on EVK boards

 .../devicetree/bindings/dma/qcom,gpi.yaml          |    1 +
 .../bindings/interconnect/qcom,msm8998-bwmon.yaml  |    1 +
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |   42 +
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        |   42 +
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        |   58 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 1687 +++++++++++++++++++-
 6 files changed, 1810 insertions(+), 21 deletions(-)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260525-shikra-dt-m1-082dec382e7f
prerequisite-change-id: 20260511-shikra-dt-d75d97454646:v3
prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
prerequisite-patch-id: 2acc300a68ed8c5364fb5f2f7d28fc0d56ab07bf
prerequisite-patch-id: 391f9dffceaac9f44df7c2daffafb66fa379ca35
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 7e351b93b3a238145ca642143bd0824bb90e98ce
prerequisite-change-id: 20260513-shikra-rproc-0da355c56c69:v3
prerequisite-patch-id: 39475cddaf673b2cbbae703165a782916f199885
prerequisite-patch-id: 6f7f265abfbdffdc0a1fdc5a7e08929e4eec5b7a
prerequisite-change-id: 20260512-tsens_binding-9af005e4b32e:v1
prerequisite-patch-id: 35141047f44b4845f9d94618bcf26ec58ab4a0b2
prerequisite-change-id: 20260524-shikra_epss_l3-522afe4fb8f5:v1
prerequisite-patch-id: 9e0a3b4d7b2033b39287b4382ba3c0c856a62e77
prerequisite-patch-id: 3ce52e07ae57139c2e2b71a29ed7d7250f6fcc87

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

