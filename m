Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8013D3AE1A9
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 11:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777549993; cv=none; b=QTQB/9PluquyEpudsZ087gnvzndR9fTubqKYp3kOV1/0B5IvUgdjjZIytCrR4sVLMky+ePJIiZRLhDpc/ns2VSoSneQiLLKZnxYJJuWs+u9o9zyVu2jx5W5+Vsk0gnwWPxzxVUxGiNbQg+g2sixWWMnspz99C0L9qx4hqzq9U6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777549993; c=relaxed/simple;
	bh=Wy35dkk+x7J7hVzibp+tGhexsVcSnAJWVDQsf3OwioY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bbZwAAcIWymiPw9Mw8NkQurdTmGcpNtfUeFglkr2RrzF3pYEs1FuKSM6A/qLPxjSvwhCoXJ2iujNy2hl1XOOscwjpkhMjmrJRfpa3ReMwvvCYD8oG8r3XlSquaZyIovT4s7hNwcPyq6xMvTr145wiPEisOanz6aJf9xbIBgpLEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jp8h/2Dm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gg8D9+3Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jp8h/2Dm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gg8D9+3Z"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U7a2wx088765
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 11:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=S4gD0cycTGKSJtK98/zmKq
	rbMyKEPcJ5+g2Xd9XvCl8=; b=Jp8h/2DmmjhkcdXnovykDDmIcVBQ2HL6cZ8DPq
	git6edin9YkdGhUvPEdJu18DIl2HLHLnCRBxDOqu6QuIJs5tjg/au5DP1M21PCsA
	VtciYYdVMsMv9OrR4PThipusOBq5LuAI+D43FIoZsrQd+DOMWFaKUtt26LBzsgmh
	avHDZ+kA4hAYEpIxVtBohN/ILemJGG8h7oKc4ETs49ylvM98orE/gnvYbNGLdjph
	6n4vfdZTnP6EwlrtwspHhLqkxfW1RLwOCV5iY2suQGjw79nGebtX9T9x/tGcCxNe
	c1cwK42khYDr+fZye8WgGoWQI3fGW5nXFCztOZAMY+UusVcQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv2u415vd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 11:53:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b9a6d84522so7250195ad.2
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 04:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777549988; x=1778154788; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S4gD0cycTGKSJtK98/zmKqrbMyKEPcJ5+g2Xd9XvCl8=;
        b=gg8D9+3ZpNsJGcAKL11ElygMFOEepPRJy1EYtwR4gdSunq+lfoNAm8jufs9Rty+C4V
         puyaK2Pnb8xJGaGR0n5Y8S5X4Mnr7BPPqajsushvYV7FFbsNEoQxmEO2/CCEnSk5nqJe
         mKoY8gNECbegKIZQz4uA/SbzdcRwi/IaSJ7Q6fBr01FfBIbX6hvNcGqNZu3XG6tOJMfh
         YRpUuqc0Ti7lywuIlBsxG8SyMZeAF9Ll0W4TNzpiC9Pz1JHGVhIfFF8C2J3WTiFWirWt
         OWTtjKYVh8MakmP83NPgHXdKDgAc100LooG5EMBjpMeEf9dFXA4vXSisQyA8j7lFf5hO
         kO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549988; x=1778154788;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4gD0cycTGKSJtK98/zmKqrbMyKEPcJ5+g2Xd9XvCl8=;
        b=CaQP7U04vf/LEHkQHIeaEmb2WRa3dc/XLOAjY25av0Wkn4Sugzy9n9TLo5lZkel4yU
         +iBLfvspHNFwcUM9o4JWFe3p/V6M7ZBe57sXWeDam9sskvc35TEc4kitLE3CzMNnr7Np
         Y6AoocIph7RZA6g4ZQtJcHBl9N/C0TzfgyfL1Wsy2SI992IkKf2d8xPYv2fZMCRua8DN
         Q8epKUbAmETN/Hhkl5juG8yS7DHPja5nehb8MgKpUxI4e1eO+YCSSnJixBknl44EhqEZ
         GSc7efr7pVsuD4zbqPBxTn49mzvDwjUrEqLWszaOo4aFiKecxsLGwHdXRHlRrFgVsk9i
         JtGw==
X-Forwarded-Encrypted: i=1; AFNElJ+NOZ4O1EgQutxWRcaS6QGd0OfNXXVBNYEPnToU2Zx/gvJ00R/bd6E8Nsx6Gi/5Dz1Jn5vjSEKAAvaM@vger.kernel.org
X-Gm-Message-State: AOJu0YygL2wSEWuZnY/GnvuMMGpOI9gaXV0ULhuf/VBUatlEEA2ik41e
	T/3Vm/rFY2hSDR8IvYEqR65L2X57vCwEtF8kAoqG7//b3ATT1ThVgn3rIdW1l2CS1p8wn7vx3eC
	Ti7gbBZrp/zxmRLZTkIwF0V4UgfFjYOgwhSUGABiGQ8zodB3SvPuwHSClqHIFwJsn
X-Gm-Gg: AeBDievjS22IqwbXVknwfod9cH+6/JOSqNfpwgNcQGrCdcJye0QZxjoRUofWJn8G8e6
	4lE5pKbm6v1CPnFDTAOEeEyMuMImjIsu/QZyfp8rtSemaBj9aiiybS2r1Rgs+Sc2P0WFy28cQsp
	YNNI+efAiAx8j8WqFJdoWjJKJXKqo1pYHYOqtg3I6W5JupHsuOYhLfS/AMu70UxhQVRYSV7kKXF
	eMkS8BCnrqtJMah+D8FGZIifGO0wPq8IYNMGbaQ1yyCbf/iqSkcNJBvS0LGIL7MBcmJKH/DQUOR
	/MsveZwJz3UoyfmzbgC5nP7hPCxmKKx7mzpI8wWoS4OASu0b+DgcpT1er2sLaWwSYM7JeG5FVNz
	saskpLk1dQpIjipR/ob4Rq9I+yoWQ3Nbi4A2WRxb2w7Ww4oU=
X-Received: by 2002:a17:902:f20d:b0:2b2:81aa:f6c3 with SMTP id d9443c01a7336-2b9a24e293dmr22500105ad.29.1777549988502;
        Thu, 30 Apr 2026 04:53:08 -0700 (PDT)
X-Received: by 2002:a17:902:f20d:b0:2b2:81aa:f6c3 with SMTP id d9443c01a7336-2b9a24e293dmr22499885ad.29.1777549987989;
        Thu, 30 Apr 2026 04:53:07 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988971138sm53834955ad.70.2026.04.30.04.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:53:07 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH 0/5] Add USB driver and binding changes for Qualcomm Shikra
 SoC
Date: Thu, 30 Apr 2026 17:20:25 +0530
Message-Id: <20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAFC82kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE2MD3eKMzOyiRN3S4iRdw7RkgxTjNMtkQ0NzJaCGgqLUtMwKsGHRsbW
 1AJa0b9NcAAAA
X-Change-ID: 20260430-shikra-usb-1fc0d3f9c117
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777549983; l=1179;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Wy35dkk+x7J7hVzibp+tGhexsVcSnAJWVDQsf3OwioY=;
 b=EzKgLLmHkhOhpXWlxFsqT4An/gtiBGVcCoWJug4OSDZdbwaJtBRecdGA7cSDgH8odE6pmNwWV
 SOihEZOIutnDBqlGrB93QQ/0mg0nNUd08Ih2mip/nRe9m3yrjPYSe9f
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=Ev/iaycA c=1 sm=1 tr=0 ts=69f342a5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=UoB5GuWjjGMfoql652sA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: E12yhFuCa-H5meGmVy10zljZ5_IPUXCF
X-Proofpoint-GUID: E12yhFuCa-H5meGmVy10zljZ5_IPUXCF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEyMCBTYWx0ZWRfXx7KQXa5hkmxX
 GE/0LBLO0Z7mgUkpGq/qnxNsW4hz6hLHBnF+mzXr/SlmrZdYra4v3KUSrzV4/k/UWdsXy/wbqvv
 3dPNdg6xW37zRfStBljF/44Oknuc+pumgsah71ILcVD5GCIbLT6fZZXHEcABQz7zdSfVcWGOW0y
 xYQc8A6zwpGlhxualrDiu6l1MtlCEfqpISG1CvMWgkDYxSyKTk/J2GUCkKrJi18DJQQyYBenk/r
 ZzCERY5PfHjrfsuLDUftF3gV0A/1awla45uTatCgPU9CSiyAftlRu564A9hg/nz2CX+hvupDZCK
 Ku27krq5pO0xUCN45Cs8uTxvm6OgzZgsQfEjiXgfKT9s0qvEQCybYhMFPZzCAZ7tkkL7Qs4+z0L
 n6TdHLpXgrGx6JmJVfJ0k2RXQ2ojHUayg2wPL0F12MsKQyn7TVLo+YH0wMPhcfOks5GELl7cAo3
 dYF3UXzauV9PC1HdfsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300120

This series adds Driver and binding changes for USB controllers on
Shikra. There are two USB controllers - One of them is SS capable
and other is HS only capable. The ss Phy init sequence is same as
that of Talos.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Krishna Kurapati (5):
      dt-bindings: usb: qcom,snps-dwc3: Add Shikra compatible
      dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy for Shikra
      dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add support for Shikra
      phy: qcom-qusb2: Add support for Shikra
      phy: qcom: qmp-usbc: Add qmp configuration for Shikra

 .../bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml          |  2 ++
 .../devicetree/bindings/phy/qcom,qusb2-phy.yaml          |  1 +
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml          |  3 +++
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c                 |  3 +++
 drivers/phy/qualcomm/phy-qcom-qusb2.c                    | 16 ++++++++++++++++
 5 files changed, 25 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260430-shikra-usb-1fc0d3f9c117

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

