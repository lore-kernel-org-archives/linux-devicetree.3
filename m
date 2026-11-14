Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794618800;
	b=l6kByXwEo/mpJbBuZrf99gJXjzfugITQOQlaYbfqUPWJ0WDFGRGIPYsjYuEvhdS1cXBh
	 B4QHaaMNTnJmeDnws8huEX/UxKZhet2PEAW7nXtMCcSMVsLAQkFckoI7I0Y3zU2Qph6zz
	 rIJqYRhslAs3+GAxcUkaK5qZLIbgEvSYmd0ot68w8iGFT4Dk7z/P9SFuc2h0mtPARjCnZ
	 Yz7Oko2BoZJuL54dKhHdSxVPzPrx0Ztsvkhu6GCGGwOrArcAj9sAkzIiibPKfySoOi2ti
	 SpJAib6Qm0EtQ4MsZidWEi6qCbm25n2T1LjfjaypDl3LkCIhB21ofDrxrVtCG8nsFgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794618800;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kTe3eKjY4XOv4bMTLL6hPdxF10qrrinmEmdieEW7Zow=;
	b=G0O2l/lRACTBVXt1cXzS9crL1iHo6ZOAh5J+sr4W5CddsaLeoSAcWftdIe2vR9cGo8mb
	 HFCozQcnw0bIQa1G4ORw1g8KeF/RMzfSjiA85hWbr47j4SYtl0qpLlAcJYwfJj0QltqKr
	 Hu/XKFmvZFtP8D+vokGLimSXt3B9AGUFNJV3SXw8I6y5OZULQzdVcOJei0EOZnjysEfu3
	 5l70kcth9xFYr4xEZj40lJroXUMp0CI8rdEN8wxwmPBZsGqtXcpwV6SIArvvpeu4aJdCK
	 UrN71Xelz74KLx7xiPCrRtcbh5TFHQWP3pppRloEKx0TKO0lfdovzrfeAR2n7x1D6wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cXgLXeS1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C4ogScC6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1823F606A330
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 01:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1823F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cXgLXeS1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C4ogScC6
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADMbBQ82193258
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 01:13:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kTe3eKjY4XOv4bMTLL6hPd
	xF10qrrinmEmdieEW7Zow=; b=cXgLXeS1+LMy2W/ICjBzD2Owh7SmPZrPOiTmrZ
	B8ISCHkmxI+EHjqrlu0L4FYVm6IbQQFvc/YYD1VnteEoM9YMpiWfjmg+n5dAITOK
	RkbSXlzNtnv2u26QaX81b/om8KaCW7A9mF/rNFHpyROLiaNSNXbt2bgScETOQodx
	TsNlXI5ugGQTnXCH69BoszIMtRszMsKuxMKd0M+nXHv0bBqQksYE3bdVohjcXTYS
	hJdEIacllZMKrgLso3qgdAROKbYFlFrvOYICs39XRYfFn7VAmNR2PGySXcMeyckv
	1RBsRHjYR/2ZGJKiY3UASETai/1PTfs8qQqG9cAZg3MeybrQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx87ds757-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 01:13:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375f0fd31f4so1980198eec.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 17:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794618797; x=1795223597; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kTe3eKjY4XOv4bMTLL6hPdxF10qrrinmEmdieEW7Zow=;
        b=C4ogScC6ungvsTMT5xWhvlgkRLSO7JhU2kzSgmx2mk+Hzmygsxsclf0XFAl1QpYiQb
         RZsKSwLdEvTYngGR5cHDCLFe4UuL8L3dx2uERhcC1HzGVCTqCrUUs2ivcB0/OM2NG2Vp
         BiZYgMhs1B4zu1h0/nCEl8ukzjB3GT5IZESOEn/jQR5kYnVCwGtDA0+qkIuP0gZGZxvv
         tOvRnLkEaQnpPgIsAcRlK5lEIXgm7S728oW4IGT6XsuyhtQW6f44OhkizUeQVgfi3WTy
         YlODfGvtNT6yuB2YPGzYVxC4Ne6tOaEeeybV6RTBcezlKgUNePeDLUkk0wk0VP/uDe5y
         7BcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794618797; x=1795223597;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kTe3eKjY4XOv4bMTLL6hPdxF10qrrinmEmdieEW7Zow=;
        b=v4HxZnp0wunPw0+F30mVtSaR2WkG3Q15lHcj2R7S3XLyf0aPn5XZ6/iwqheICb0KhV
         1YlChFE3qmqYCXkirwrUNdIN2jjKq8nb+l6hXeWUbatW8BoWwmWG6lqYUTkouS3M6ZBI
         1YFGdj2wya45HacR2a+1TdKekRIBqdHQYvF6A9qwnrm+X9FHEnhIaDhlFJyKvXUKRmVy
         hUDYnIyn6uxxDa8NTXe6Y4lW3tPUMkUmZIaV2ByyLNRvbT/O11XvZrHMCZlvGjh7Rc/0
         7+oFV57a8ZBdJmzgSKITlVmuvokHEkF7FVJNcbUdW4+8shl/1ps02x4AErXD5lLkMYN6
         ezig==
X-Forwarded-Encrypted: i=1; AL+hErGFB62cMpsESH4pWSQscPosOvlvS/7dZ26spnKF1QMZ6YuGehg0jQ/1g3FrQ4F5BUODlZpp6ArHNttc@vger.kernel.org
X-Gm-Message-State: APuU4Z/v6vc0NG+WOY+yAU3PcPBHrJJRdEacS/RwtPdZNGM5OcPCzAT8
	LrOe0XUsd/f7icLmKaCQvAk4YzgVsDQIgsbIvAFbPWZZgCwDopr4+az15jU9Gd/fLyJ5ADyTWzs
	SurvbGIQacYISsSOh+LsJcbUTBPsKA04of8zXIS3PHeyWKEGjAsz7QwYZa8oB/nXH
X-Gm-Gg: AYBFou3dj7BcZMpp/v7CpSzpV73wZoZkan8R0ZQFg0mZuZovfQRWHTdjF698YY2Wdp4
	osqMEjMUF9ln2miVkaJQs5nQji+9wVFQ0VwAcYVSZmjFGrRqOu+qzd/ineHLlQYSK35lt7GBc0R
	CRYEmdsHrNVKHvM6EMwlAcaP/6MQu7Ld/R4jtaWonumM60ATheTr8uBzQ/+rATwgEzhKG6Dj6C4
	b+h/wIAJnqaaKXjfILC/oi652JAyhAqohVBlBwzTJIVOLTOg5+v0l1iwfnOolipdrRt+1I/LO5y
	zuC72paEOHkhmTEuFEeAdv4azrVERx7T3WEmHv3oEBcibA77DFYZM7bXtjuvMjt4tgSUHJOLJFG
	FMkvMf/2fwT1Y6UKV27lWZ9MvaqEnKfb01FmE+3htSviEuizXH9xEnVaLiGkErOf5rZBzuTQbEG
	WbPvxzSeTf
X-Received: by 2002:a05:701b:2912:b0:1b2:490b:6fdd with SMTP id a92af1059eb24-1b5030ad368mr3877925c88.24.1794618796873;
        Fri, 13 Nov 2026 17:13:16 -0800 (PST)
X-Received: by 2002:a05:701b:2912:b0:1b2:490b:6fdd with SMTP id a92af1059eb24-1b5030ad368mr3877886c88.24.1794618796106;
        Fri, 13 Nov 2026 17:13:16 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm10952813eec.3.2026.11.13.17.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 17:13:15 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v3 0/6] PCI: qcom-ep: Add PCIe Endpoint support for Monaco
Date: Sat, 14 Nov 2026 06:43:02 +0530
Message-Id: <20261114-monaco_ep-v3-0-7fe227cdfac0@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAJ6192oC/23N3wqCMBTH8VeRXTfZjinaVe8REfubi3S26SjEd
 2+zCC+6OfCFH58zI6+cUR4dshk5FYw3to9R7DIkWtZfFTYyNgICFWlojTvbM2EvasCa071mWhI
 lBIr7wSltnqt1On/aT/ymxJiAtGiNH617rc8CTbuvC3TjBooJrgpRQg2aE8mP1vv8MbG7sF2Xx
 4MSH+AHUEKbLQARqEsQvNGlJBT+AMuyvAHFbJ3+/AAAAA==
X-Change-ID: 20260918-monaco_ep-fb14fafd0ecc
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794618790; l=3448;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=HSSXpCPII9klFGjnKVFNox+HX1Zi7tvJ1q/JdjPsr/A=;
 b=mzC5SLAz+I4A1GceeUdQy980TaqpgvTcpEzshGVr47GyxQxRt/riLjQ5q6gzXqJQIEpja6etU
 c851xf0oY1cAa10RU8VyTcPADrmUVLdDu1HgHqJFvxQ0jA0L24WQs3e
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAwNCBTYWx0ZWRfXw5WtZ0utBU9a
 /3qBfwcqMo8/eV1UdGl8njuJWB9h0cdzTmfccDdiZ9l3n2zRkVo3XTssl9ujAXUUJpv/4neZDYs
 x/0GvULFWl+85EEyzGDm2ntcIjwZInJ/5ojb17nFMVHTnerso7CwuaeUs33myfmX6rBynMMJgmS
 DCoQhAcU/xMgFTY051eof0tRGto7qTqHrzt+jk+9tHB/UP7uIRYFnAhaQ6qVa2emj2XWtx+PYf5
 4CQbMasnG9055x3tTeD1tJJnL4PIUueDQvIl7p+x3pAIoZK0JwHmy3KQ6rwThWJboMMwyGu26Yf
 YoVGJvM8Yhxq1b0cpII79g/SRBdn70zNjdIyK9R1+HzQpdKXN2AXg9d99yUA0k8Q7kBvqNHwopF
 rZJi/P6CLTbb8FzLUOMdQuaX4BhYcv6NTPwqEKqr+Dh/XEVrB7dC/il4O6VA4wip1MfWgZdaXvy
 rJdFACzvNIu9aN0+kog==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAwNCBTYWx0ZWRfX0jqGQYycTnz0
 cV6xvjY8oKoWDipsOer/RpyhsnpIG0y9gtpGlq+PQ6N73gzP0WrSp72bZualalEDV/0NVq+NWSc
 kGyPQtsO4Yx9uXLKNBpOg7Iyc6v3mJs=
X-Proofpoint-GUID: 3LsjRsRews2ycZo06aaq-hLk7UzAntXA
X-Authority-Analysis: v=2.4 cv=BusIUoX5 c=1 sm=1 tr=0 ts=6af7b5ad cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=ABVqSM4OJHPb3BREvlQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 3LsjRsRews2ycZo06aaq-hLk7UzAntXA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_07,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140004

This series adds PCIe Endpoint mode support for the Monaco (QCS8300)
SoC, which has two PCIe controllers capable of operating as Endpoints.

- Patch 1 documents the dedicated 16 GT/s x4 QMP PCIe PHY compatible
  for QCS8300, correcting an earlier gap where this PHY variant had no
  QCS8300-specific compatible of its own.
- Patch 2 documents the QCS8300 compatible for the PCIe Endpoint
  controller binding, with SA8775P as its fallback.
- Patch 3 adds the corresponding Endpoint PHY register configuration
  to the QMP PCIe PHY driver, reusing the existing SA8775P programming
  for the 16 GT/s x2 PHY and adding a new configuration for the 16
  GT/s x4 PHY.
- Patch 4 fixes clock-enable ordering in the qcom-ep controller driver:
  some platforms require the interconnect bandwidth vote to be set
  before enabling clocks, otherwise certain clocks can get stuck off.
- Patch 5 fixes the existing pcie1_phy node's compatible string to
  list the new QCS8300-specific compatible first, ahead of the
  SA8775P fallback, matching the order used elsewhere in this series.
- Patch 6 adds the Endpoint device tree nodes for both Monaco PCIe
  controllers, covering register regions, clocks, interrupts,
  interconnects, IOMMU mappings, resets, power domains, and PHY
  connections.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v3:
- Rebased to tip.
- Link to v2: https://patch.msgid.link/20261019-monaco_ep-v2-0-852cb9f5d012@oss.qualcomm.com

Changes in v2:
  -  dt-bindings: PCI: qcom-ep: Drop qcs8300 compatible from the standalone
    enum list(Krzysztof)
  - PCI: qcom-ep: Fix qcom_pcie_disable_resources() to tear down resources
    in strict LIFO order (phy -> clocks -> interconnect bandwidth),
    matching the enable path's error-unwind sequence. (Sashiko AI review)
  - arm64: qcom: monaco: Add reset-gpios and wake-gpios to the pcie0_ep and
    pcie1_ep nodes so the EP driver owns and correctly manages the PERST#
    and WAKE# lines; drop the output-low override from the wake-pins
    pinctrl state that was permanently asserting WAKE#. (Sashiko AI review)
  - phy: qcom: qmp-pcie: Reword commit message to clarify the new RX
    tuning sequence for the 16 GT/s x4 PHY is common to RC and EP modes,
    not EP-only.
- Link to v1: https://patch.msgid.link/20260921-monaco_ep-v1-0-63c5282fb0db@oss.qualcomm.com

---
Krishna Chaitanya Chundru (6):
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add qcs8300 16 GT/s PHY
      dt-bindings: PCI: qcom-ep: Add QCS8300 compatible
      phy: qcom: qmp-pcie: Add endpoint PHY configuration for QCS8300
      PCI: qcom-ep: Set initial interconnect bandwidth before enabling clocks
      arm64: qcom: monaco: Fix pcie1_phy compatible to list qcs8300 first
      arm64: qcom: monaco: Add PCIe Endpoint nodes

 .../devicetree/bindings/pci/qcom,pcie-ep.yaml      |   4 +
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   4 +
 arch/arm64/boot/dts/qcom/monaco.dtsi               | 150 ++++++++++++++++++++-
 drivers/pci/controller/dwc/pcie-qcom-ep.c          |  36 ++---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 105 +++++++++++++++
 5 files changed, 280 insertions(+), 19 deletions(-)
---
base-commit: d0cf0853ff6b71724a399a87ca028fc57be9ccca
change-id: 20260918-monaco_ep-fb14fafd0ecc

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

