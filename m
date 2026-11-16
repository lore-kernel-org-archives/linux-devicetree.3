Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829757;
	b=SHey2o19dyyJuEw+ui0eeL7wNC/r+vE+610YJkh9dGUSXt5bWkIP/HSF51rj5HlYfd0p
	 NYIHOi0iKWgJie79BWTFXlePN9Y17PFasBkaZmPUeoJdrwUP6e0j9Tig9c+mC9WtUc5If
	 Z4J3ZYa7IQeZ/Hb/dZQ9xums+Dwi4fuFwPmaX7yOJ3+e3cyjxto/qbu6fWhOr/QBLPCcZ
	 MN8nQ500RM6KdTbi8PqKE5cJDDcuG4VEsfPJBKqXUiMCVQwZVkde0N1qrlNia3VRhEfKe
	 KGG6JtplzYocE+jUwrAm48QGvzjpR4yBAiuM1LMFcIbcUTmV13lhAjl2Ai8mOakmcbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829757;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RG+7cd6JHjc2k5Y10bxDXl+BlMloyHleQY66xikX6Hs=;
	b=pBos2PoozhQlr7ZuhWrqoejw2eo+48FYU+TjRVN47paO9zYdNWO7hg3/szrLrWAvBp2O
	 +bhRg04Ad4d4mC4TDJf98q6n2b7VRYXDJ3x2b9Grdf+aBOrbAlaW5klbeR2+xzBTPE2Qo
	 pTH6OFfehmU9920Vs0FZVAROjo5wV+7iEqjjb1BZEacBFQ+3LAIv+ZeJh16YWvuCWlz2v
	 xur1QkiYGoH4LzdbfqV4p1aHu7bdKsWvhxlA9lP2WLNP7vn+Y4Rq4cUP/ZhDh0KcAlnug
	 mcSMEL12ipw5eyHm8tgiAAtkohZJUeXTpz0ZHdx8uqtH6gbjS69jxicFBdp2IRSmZEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YIstbYq1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DGzQ70hW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE18606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 11:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DE18606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YIstbYq1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DGzQ70hW
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGBLa6T1016236
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 11:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RG+7cd6JHjc2k5Y10bxDXl+BlMloyHleQY6
	6xikX6Hs=; b=YIstbYq1HSw9wRh/Tz0Yl2FqvHIkjNxVkMX07nq4NXy/tevLxKH
	eT1oBnw5ZoIUaLQxkW79sCo0gDLkP64Zscr0WiramjSk1Ed810LXWRajuiLbomr0
	50ehpcm3tWX48FoP5ixSy0Vr8lWhXfOkEDJDmmM+FtBrdOt3h38Ufw1NWw3ELdJj
	lQXjw4/61yqHJ+p12M6/+og7JkV7ss3QXD/Wtwimmiew6rsFLCQ6AJK4fapkyPuB
	WhgrATi4fuCJoVOcB1m3IUyaWOSWe9lvOQ8qIGpzpH7ZJjGrOr08vdgq3KpOw2Bx
	2AoN/tACnCps03nR11tjjM4/TH01HJ17f7w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0003g9us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 11:49:16 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so4353646eec.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 03:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794829755; x=1795434555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RG+7cd6JHjc2k5Y10bxDXl+BlMloyHleQY66xikX6Hs=;
        b=DGzQ70hWDOkEcq4Jviv+NHlR7D4V/vObjJcKzwj9YMX//biZ/EKQuElI3nk3O+DSD3
         zu7xP5NMAU+sopbjUiz0VknR4dRBVLp86YRDyUivMobe3zfySlL1LNDIPf1bfkNCzQKR
         tB9IAqg4JBsPZtUuyMHk6qeYivPzRO5gw/Lc/NMWfOgjwIa6CgjGzHJxbSyQzuVWvddO
         LV7ED7hX0Q4dlgPQPU6+087NUYQ+IFEkCbIVbNWgSKZ3WS6zcLlfSSnnISFSNGXnxD09
         MGz3r1mjQrkvWW3U/KbsaXhW01W/bj6h2KG9Sk4fgai9zyO7lEoABVpuanQmPWqlgbV0
         546A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794829755; x=1795434555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RG+7cd6JHjc2k5Y10bxDXl+BlMloyHleQY66xikX6Hs=;
        b=GoUM1zMdryWc2vi5Q4agsUGY9VRoAjAlUFAJh9Euig6AH2rjxagm8Ri39GYKpNmkpm
         6rBQctmHCJvHNmbZiGjeLLPHp8YFgSgSvnEuroewjV+3NOF/eCCv52NeVLFAw2C1vZ6V
         UiPGfRqzTG6bm3M/czj1J1aXzJSm1OWXpqr8E6JUk67n4QJWnz3wBul6BTOcrcD1vq9Q
         3veSL5yZYcSCtGey3xIV20OdyRY69qxC5h1C/uE+fRMX+92KcnfVFSna4rsY7fzIfSuA
         KZjOwZfK1ny9XFyfndNx5wpi3PkqTkc4wgcuxofGKhY6fqpaSI8aHnvqYiWjA6WFSBMw
         Ku5w==
X-Forwarded-Encrypted: i=1; AL+hErHy1XiKENbIXNDy97m3IUdgXYJupAz2im+Y3gf7OFV9x9qG5OVqJnWhta8QOmXcIX5WeGVhjE7vhRkp@vger.kernel.org
X-Gm-Message-State: APuU4Z/4LfN+Jao1umXrRHkl+PBTqHsPPh6gBGkMvWgNBAEPBYMPyw4t
	RxQrxn5TmoPKwaaSEG/gyvxKONsh0L0ZvLBw7rfVgTIJW2ZOKkW0Bouo/lL2twGSCcng3tM4X9n
	i9nYjszKFxF8GdxLyusaJi6RI1tIk/mZgeY1BLoQuiQzCU38H7jRpCzuKG5eiRjIF
X-Gm-Gg: AZFdTZd04i2SAgrhSsFJx1rdDOJkDPO4r8ziKejOnY4evGAVxIikAetOxjDCcvrwv8Q
	0f83RxX38ukd0P9tEJIy324vbH+lLJBXSmxpgZufcr2FWRXljEC8Sx8QHe8eZUMI7AFxFDYg+g1
	/CbZBSrSVGUvK/Vi5Che5+5kaKxfegIJAeOLAaDrGiwRd8AJBTzfLa51EoaarEIHZEnUikK7aMd
	3Yv3QQV6lJHZwW/tpOTT3hPhf1fW2Ah6ROT0mIY+Iz0cLLGv9rNJ7a+YkcbTqVPsUxmT4YFPC4V
	FOb3hV/OltXDSVTFR3RaHxipl9HnQMns1S4jTAfXKPHjWjh1DTKw2ABLS2Lg6NieQ0d9AtrQ/rp
	ZPZHq6T5zNAndiMhGiTuB9vUF4P45q2ox9ywpO1ALdrLwwytiqHgATdGqSj5Y77hp+c3N39T9/E
	B0
X-Received: by 2002:a05:7300:de01:b0:369:daea:812a with SMTP id 5a478bee46e88-379682c2053mr8694949eec.30.1794829755113;
        Mon, 16 Nov 2026 03:49:15 -0800 (PST)
X-Received: by 2002:a05:7300:de01:b0:369:daea:812a with SMTP id 5a478bee46e88-379682c2053mr8694933eec.30.1794829754617;
        Mon, 16 Nov 2026 03:49:14 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm33802844eec.10.2026.11.16.03.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:49:14 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: dts: qcom: talos-lyra-evk: Wire up CYPD6129 USB Type-C ports
Date: Mon, 16 Nov 2026 17:16:39 +0530
Message-ID: <20261116114908.1701258-1-akash.kumar@oss.qualcomm.com>
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
X-Proofpoint-GUID: w9iGLLARyh1CD-l10zrhnmyi4hs5iFMD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NiBTYWx0ZWRfX4u28AuWDIYOB
 y2LxE87BSolwd4155lINeymmWQk0b5hKYTutMijn+c/3aBJ8Dx6bVA4iKw7ewG2hGRJPX0NsDzO
 3IJyn87YfaKhIO64FfuXFyuySyZ6pLk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NiBTYWx0ZWRfXxE6EScjjO9Ns
 KbWxDkHDPC4q/N4kSnsufZf0p+klpg3y2O5txBiryNj6WV4mmGiCDdtW8PFyb0C1wEDpBM6JC4j
 E4jdikZjjlE44kU9+hfenstJp/MstGmlI5EOyvYwPt6/FSBxX4mJooEgxNh/Z7b+jpmAT3ATRL5
 C1B5WBuszBj+t71B8cOEgVjzjJlECDOGNfXbkTRumZi3X8BkXVcbWw5v9JM7OXKkISkUmlM3tS9
 8PM9xSX4acuWFcWNdsFKWbInKOktC2syoLRzgyXN16gEJa4v+ilpZAzu5lj8i9pIbjbr0GEZv6Y
 Cc+Y4hyteUPs41jCT6ZP2Hrl6EzzZrdfXhMRP0cBylb5dXyvFh8CoxxYVC4OTq6s1X5YzX8MaEj
 JATvcrdxizK1Vaj6FYXEsrdAsKV8VF92Dqzc1+vaxf/ZJ12imbZqP7CmTFLUqqhf8UqLp82Ihwt
 TRBsmUjJbWMtEVrZjOw==
X-Authority-Analysis: v=2.4 cv=Z4N5j3RA c=1 sm=1 tr=0 ts=6afaedbc cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oVCAav2c3y0N_-OfdZYA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: w9iGLLARyh1CD-l10zrhnmyi4hs5iFMD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160046

This change wires up the CYPD6129 UCSI PD controller on the Talos
Lyra EVK carrier board, enabling USB Type-C role switching and
SuperSpeed/HS muxing on both USB-C connectors.

v1 was posted as a single patch [1]. This v2 splits the change in
two and addresses review from Dmitry Baryshkov:
 - Drop the VBUS-boost regulator's resistor-divider math from the
   commit message; describe it as a plain fixed regulator instead.
 - Replace the verbose HS-routing explanation with a short
   "/* HS only */" comment above &usb_2_dwc3_hs.
 - Drop the redundant dr_mode = "otg" on usb_1/usb_2 (it is already
   the dwc3 driver's default).
 - Move usb-role-switch out of the board file and into the shared
   talos.dtsi, as its own patch (patch 1) alongside the graph port
   placeholders it depends on.

[1] Link: https://lore.kernel.org/r/20261012131518.858396-1-akash.kumar@oss.qualcomm.com

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---

Akash Kumar (2):
  arm64: dts: qcom: talos: Add graph port placeholders for USB Type-C
    muxing
  arm64: dts: qcom: talos-lyra-evk: Wire up CYPD6129 USB Type-C ports

 .../boot/dts/qcom/talos-lyra-evk-som.dtsi     | 121 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts   |  42 ++++--
 arch/arm64/boot/dts/qcom/talos.dtsi           |  35 +++++
 3 files changed, 187 insertions(+), 11 deletions(-)
---
base-commit: 87d33c3916a82e38eedec53f4afcf2c620add47c
change-id: 20261116-talos-lyra-cypd6129-v2

Best regards,
--
Akash Kumar <akakum@qti.qualcomm.com>
-- 
2.43.0

