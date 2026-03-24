Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0C92ECD3A
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774358029; cv=none; b=uvDE1YppbeHyjro6YOMdqVuKy9xyALvzRe8TeLgjCJhZojeVp/MRG0ZxaLxtPI0b5EeosphxyQabIi/inpXQ2YTNGOrr256nb6TtoBCBwbTw5V1IhphRN8w9jmh6ukuXdI06GrqSVjUi7xS1KpWifex+jAtoJsWqH+10klbshW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774358029; c=relaxed/simple;
	bh=fdUmE6bdo/6oBTv1gQYA8yAcgD4vDO23bl41zp+i76c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uHmh/ME8+8Xnk+8rT+EqZeuSSX7KG6to3dD4T0VVlrdLueyrJVWa2Vup0H6xosnp7RRQQ6r8VOwRMXI3xy+uxu44lCpL6XGIqxaNUpVQz3haPybiok1MXS6XH5BL6eWev1TjnQ3DauYBhlz3nWGGu2IidtiAnxAth9yyjlpVAxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OAIkb8Bz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PXGswm0W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OAIkb8Bz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PXGswm0W"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O8xkLw2322954
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:13:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4x+lKU9enbGajNh0xt13Vj
	7uSgZgTYYZnpiKoXs9f08=; b=OAIkb8Bzgdyb0BJRa+v/Pg2mlhVh7cwOpEUcbz
	apcbjXEKyac0nqGjfEHb/8L9mJsHT3L8EF395kggtLj4EvB2otjHo2wbeqkcHPF2
	AO7h9anPiQOKL3YI0jNj1NAAeo9ihUHwSIdEChJPcmXdmDbO+/I5FSpDgZAv56Kt
	BthNc0AEWUqhgLehSQnsosNYiR+nJXKQlrbl6Ar2M7L+UpX67M5hFyqUJaFEjQEG
	KSJaYddvy+uIuclSHnbvIB9sF7m9YzFKRltytetmb7W3ZBNQSSm70sidovoq2zFH
	Jt9aN3/hKhG4bl/yDeONm1QLtKkwShNB/udorfi+rfciT4xA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3qkes0ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:13:46 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82a1436347eso777396b3a.2
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 06:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774358026; x=1774962826; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4x+lKU9enbGajNh0xt13Vj7uSgZgTYYZnpiKoXs9f08=;
        b=PXGswm0WtAGoww2ecfutaV5/ZmOhk2k091rcJl78SEVqEqDjQWnRvUP+pNyfUbZhG1
         RK06oVO2EN3gc+q3Ol1dtXngztzBhZTWFw53jg+e7WaUu8NFWZbudJVmJ4oj+09hWofB
         PNsWqWJIrKy4IgSlIGBGNZOA22UCkIMhW7RzrrgepcCsdYysQxcGR5vsW7vSAm10iqK5
         pRf1FMlrYY+iM6PbuYTMTxcy5YEwCu5I1KlwmuiMzUUzgq+kLZnYN1UMobxCM35J+Zhs
         WTu/UQ9CtKPIDBlT5XYw1rOvVIXsSn+QVH9Vm/FYSnlaEFK1ryCGrNzZxC+uuqlfB58k
         uHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774358026; x=1774962826;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4x+lKU9enbGajNh0xt13Vj7uSgZgTYYZnpiKoXs9f08=;
        b=sLBT7TEO+hLS7fynw41sKGTh38FcHDN6b+ruvdzlKvIjft4xXVgrb/3QxFD898wKkh
         +bj332hmjuIqUuc+L3k1DGsX1DjsuHYDkWF7ZcyWRTA3goqf2uiid2vc8E3ottBi9/e7
         2BUi7XvvuHYDZOB/xYw4T1G7WfwO8gynrgLZqX4vXUg2QuAx+nGwu6MQO5y1IuoCGCEB
         bJ8JG2DeJpxYhJ6FtcbRseNESTp8Al1vDBc02o27nQZ5GvyiQrdH7EGF9yLSrkxaa5qI
         rPPc0Z58VSrQ+gXvZHHS+8T5dxPWAMJAmCOgPixAavkdg7n8Ic9rd4qRjyIsSjMVCIPC
         4t8w==
X-Forwarded-Encrypted: i=1; AJvYcCWWEPEQm0LP7iGWAssfzOwkLfyS54HM2TmacC4Q13z0Oz50D+457/FENjizRucyW275JDGawDFgWvbO@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjpoac/swwJbIwygapm5huBUQsfua0EvbNhE9lYKMg72FRNZGq
	Z3ygc5W6GrXUj8rGrADMO8SB3iPWoADirS8RcvqGC+S3LggEi80RytSvBwceuygysKXGYw1xe9L
	JiND/Y9QYjqxituYGaL6C9Iy/DOgOU/OuhDwZWg3wh8Al6XTU/SnIUm0wehu/OBu+
X-Gm-Gg: ATEYQzy8n0ifiJqLv+kl9kdX1DJB+mL1HXITQ/k6dVwo/q0DmXyIKjTQrzgxqrEyRVN
	+1+KG/ljf66Oq7wV3p34HidFdEe6e6ElwjAw7GcPucsiyG9VpTtyfoyvDWhcbI6gPq6aJWVB5tf
	syyDOuLCR3O69Lw+qRb0PME8i1F2/dQ+4Ttk9NFV2vGXa3rg3YrrXqE6wRoEUzygC0dMQjvLas+
	Wzaz0aLu/eN8dQ1cL8zMKknEwjMIgdGJOm6aLiq5RtURzHQceezHiponqB3iiRPltERzNkSlf3a
	PYywXFZzRYj4Ts1CA6Jan6UHbdFbyvGDIEdbLYp0fovXqduK4NtKnBtnMZFG50H2qyjQcCgiI8n
	445gU55zVBkbXGviEJv6z0j9QPaGvy/tBEwUXMjOX5vJ2njl0LSfBoV+8gQ==
X-Received: by 2002:a05:6a00:1da5:b0:829:803e:6798 with SMTP id d2e1a72fcca58-82a8c3c0c8amr12021265b3a.56.1774358025800;
        Tue, 24 Mar 2026 06:13:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:1da5:b0:829:803e:6798 with SMTP id d2e1a72fcca58-82a8c3c0c8amr12021227b3a.56.1774358025125;
        Tue, 24 Mar 2026 06:13:45 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03be3396sm13517528b3a.27.2026.03.24.06.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:13:44 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH 0/6] Add QSPI support for QCS615 and improve interconnect
 handling
Date: Tue, 24 Mar 2026 18:43:17 +0530
Message-Id: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO2NwmkC/yWMwQqDMBAFf0Xe2cAaq6C/Ih5sstX1ECVbQ0H8d
 9P2OMMwJ5SjsKIvTkROorKFDFVZwC1TmNmIzwxLtqXaPozuYsIWDXWu9R2TZ2qQ6z3ySz6/04B
 UYfw7PZ4ru/d3geu6ARdHHexvAAAA
X-Change-ID: 20260324-spi-nor-09c6d9e0de05
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774358020; l=2643;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=fdUmE6bdo/6oBTv1gQYA8yAcgD4vDO23bl41zp+i76c=;
 b=R1f/ekuseTAc7pli1TlKnZ9asu9tnbRSrSI5w0Ut6bL69Rv+VbvW5BZCG+ThPaoPQ9PpmCsB/
 Tfcrmx7cRlkATCyDWDT4qQWJei2MRURkophAWGdBlGm626nvZv9vQMt
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-GUID: r6m98Pw7DQwCSROy2F6Jn7yoMt_5Gsmq
X-Proofpoint-ORIG-GUID: r6m98Pw7DQwCSROy2F6Jn7yoMt_5Gsmq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwNCBTYWx0ZWRfX5eNvcTXj5eTT
 QSCd9h2icMlBdBX3rdWgV6k0QfBV71Mnz2c29Noj/LImYToCsxgpuyx1db6pbcVEcjXFr4NbhFj
 DTUeJisTPE9QdINnU20qzw1RQmX6CthrBpF6DmdZ8j4LcpmRNq4UYBe7E/LzQcivPU3+M4p+9Kc
 Su4SxBq+5jS6/0saHxEpgVQxZ0o9T1nzKcRbqB27tmrjIOlYZ7Bl76EgFbJfCIqszrvTCgML7u1
 OUhpE/L9OceAhdMa777OSmNk8kp+kkaKrYfcBfJbGpMbtbMUAmwtug4J99GE8x28H/yKQgl0Uv3
 oS08F+ADTLjxOK7Vyq2S4fnDtvGOvfOcHjbm6ddsYNwD9GVLF+YgSN33GzAQAXIP8DTcdfKVMau
 9V2OqviI9zfZRhC9mgTYidoItXjR50N9gg55g1NSfhkPcOJyKQJlGgqyh8S10dqhvH1Zt2T1i3R
 wBznE2HekEWKgowVt2A==
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=69c28e0a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=SJd9AKo0rAINbb2rthEA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240104

Add QSPI controller support for the QCS615 (Talos) platform and improve
interconnect bandwidth management for QSPI controllers across multiple
Qualcomm SoCs.

The series consists of:

1. Add QCS615 compatible string to device tree bindings.
2. Add qspi-memory interconnect path support to the driver for proper DMA
   bandwidth allocation.
3. Add QSPI support to QCS615 platform including OPP table, pinmux, and
   controller node.
4. Enable QSPI controller and SPI-NOR flash on QCS615-RIDE board.
5. Add QSPI memory interconnect paths to existing SC7180 and Kodiak
   platforms.

The key improvement in this series is adding the qspi-memory interconnect
path. Previously, the QSPI driver only managed the CPU-to-QSPI
configuration path. Add support for the QSPI-to-memory path, which is
essential for proper bandwidth allocation during DMA operations when the
QSPI controller transfers data to/from system memory.

Set the memory path bandwidth equal to the transfer speed, matching the
existing pattern used for the CPU path. Enable and disable both paths
properly during runtime PM transitions to ensure efficient power
management.

Apply this change to existing platforms (SC7180/Kodiak) as well as the
newly added QCS615 platform to ensure consistent interconnect handling
across all QSPI-enabled SoCs.

Testing:
- Verified QSPI functionality on QCS615-RIDE with SPI-NOR flash
- Confirmed proper interconnect bandwidth voting during transfers
- Validated runtime PM transitions with both interconnect paths 

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
Viken Dadhaniya (6):
      spi: dt-bindings: qcom-qspi: Add QCS615 compatible
      spi: spi-qcom-qspi: Add interconnect support for memory path
      arm64: dts: qcom: talos: Add QSPI support
      arm64: dts: qcom: qcs615-ride: enable QSPI and NOR flash
      arm64: dts: qcom: kodiak: Add QSPI memory interconnect path
      arm64: dts: qcom: sc7180: Add QSPI memory interconnect path

 .../bindings/spi/qcom,spi-qcom-qspi.yaml           |  1 +
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  7 +-
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           | 12 ++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  7 +-
 arch/arm64/boot/dts/qcom/talos.dtsi                | 80 ++++++++++++++++++++++
 drivers/spi/spi-qcom-qspi.c                        | 36 +++++++++-
 6 files changed, 134 insertions(+), 9 deletions(-)
---
base-commit: c369299895a591d96745d6492d4888259b004a9e
change-id: 20260324-spi-nor-09c6d9e0de05

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

