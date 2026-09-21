Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CF849159A
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 10:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988314; cv=none; b=lwhfVCQ2gMPLEb+q6UqpYqk7W9lA2Xfyw/wrPJsCgUeXsOg8fxrdBYK09dl+56+H5k17FsipNpuxSYts5iOsHTinsuWIH5+aPxdvw7PArPzlar/996twGr5qLvaRi60YamHNSgHk4y3CZR7CQCimLCAFwwCKgkQZtddMWHTETNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988314; c=relaxed/simple;
	bh=peVqRNezccL7XCLjXAEvt4zPOCLA8KyAaMpzFXvC9Bk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ptDGfPxtmbH3pWVU/GBHYnRQTdAe4YIb2lnaDMy3AHrg/ZCSZ8c6K86CAiZP+BBlVizMsUkDxZ98Dl4UOqY1QMYTNIY9pJEEjGI+0b7vXPiFVuvZHPskR8a8cDXS8UYGNgGMunZNsqOeBnb9kyllfvh5/TP70KdjZRRoaqMZpZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UjUuvhP+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QEWImqsW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjUuvhP+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QEWImqsW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdw0Y287340
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 10:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JPpwA4CKVsWowfWLA8IiUg
	S5i1q1YmC4GCe/GawbpzM=; b=UjUuvhP+afkcbhGiOqqkSP2ufcdIX/K7rSlX6Z
	RHMaHbTHjT0t1BOYcar9AL8gHNzAyckAHe9TihdEK6MIp+qQPHVuc6hvtiRDSoJF
	NmCp4ddDC1XqWAkBD8KFuoiPvl5xhYcXo9rfxd0vn0YOh/IWxVem16HkxzCCLYj9
	flJ8+XBjuShXkIbskmJqANZPld5p4ZK2x4zIi5JgWI3zWZLm3Y9XRMTAuuRGzs//
	I7M5SM4CreAj7OB4N+BXc2pMs6of3Gzvxc1qKUKiEzS95xO+oPsn6fb8nCdsxR9+
	FDw4SqhEo1/AxMlBpz0T7b/bWyhK6P8tws8rmqVsmX3PtfMw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj0q36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 10:58:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so1913491a12.3
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 03:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789988311; x=1790593111; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JPpwA4CKVsWowfWLA8IiUgS5i1q1YmC4GCe/GawbpzM=;
        b=QEWImqsWsK884t99sEE0mBYuGptIxIZmNuseb1dJWKOGNT5mYD3pAr9Vym+WdQUaqV
         6pawCC28FtVaitN9qcjFGIw3SUrwV3yURnVhplumZD7Q6vn0TRSvjBHcb2Ux/e7VQ8zl
         +Qn7Yefelb04Mss2DcIoSJL+5i/g0iKUt/aj+TqsIViP+pQPYpBDV5fxbH5w8BzBmAoV
         bhfmg7UQ4fK/gbFgBSOHEdB+667y4GH6SIlrdoUgKYyJ18c3VWYSxDg9ne838cwJoma8
         pvKniZsVdOMraDEwvMQBNEBeJRxFF8fuIyPDxv/S8RiWacvaVAGoP+RB5V6Iixvpb3qX
         wiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988311; x=1790593111;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JPpwA4CKVsWowfWLA8IiUgS5i1q1YmC4GCe/GawbpzM=;
        b=PjK6qngxVStFmUkZV0p4StU7tA8pPfoXazYwcORRFbB82/uT6TOHUPo9pPgL3z2hqw
         R20sqyoMok5yvGzdcCj9QhxqwJdXmiRIkKEd1Q5YIhQErzWXRtG0emEoDbRmSf2dzmCA
         +sTORFph6GuoH8vsT8rtLjsyW/9W3+PLA4WumK3kezZ/ZtLmNGFyC7B1EiQiEScXM0w8
         ORN9oo3e/SE8fr4/iMLTLVdG5gqckOaF0S3ekjly8qB4mivuHRRqShN5MKrlJHuwUwKl
         +31h9hDw6ushWSkPnR65yfxVkvn+vfEPetggwxCVnYCS8LBjRqhhGWXuLvLNVp8zDGNS
         eBrA==
X-Forwarded-Encrypted: i=1; AKwUvBzW/D7n6I5cDFXzaFpsz+Z0VV+cN1i29eFAaTAtWQ00zrAJLR7YkKDkmgQPP+ICU3+cT23QOsk1CmEo@vger.kernel.org
X-Gm-Message-State: AFuF++mKQPmt0v5dnvhHOLJsKUtkouWgafMB0od9buDZHJclgHRT+7cL
	/O++mpTme3dgxOrC8qNkhvZIKiy9Y0p9G8jTxOGFjFWmZX83kl3NarBk83EjqJwyE2CPLqw/WoR
	fU0KP9Kk0BGnVDZDUjSxP169Sm8Ws50FRhMFOhp7SBIxuHJk8sMKBH5Vez4bwyVig
X-Gm-Gg: AYBFou0B0a6u034JMt6sODfL2nakZZ9QW4Kqwb+6lPudVqCKDuiE4ui6gLT1jsxxsIk
	ns8ksVtECJ6rS2fHgWbwCssrD5WAkDtaVFe4F1vU1OvZna0ymzzeq49welQtU3a4L3Ow8eSwoYF
	3Z8wOwehNpt0PxRpf680OD8T927+4y37yd2+D8f9CbyOifVqYftB6gaQwcHzi66iFDrpE5kdA5u
	5iZZmOHbFSe5wf+aYZ1cOMDeB8f9wkRHwot/5sPEPQVt94wo2MT7hzr0sGmtApqoxiLf2ZVnDcr
	CvWRqRHrNC7IituMuvZshHf0d5AeiSf8SeOqfAlWayCsuz9INM0hHW9EGkBPhN9uVAwn4pzeleP
	ZQ7Pw7hju67JzaRulzmcQ/aCroEEbazWBEQ==
X-Received: by 2002:a05:6a21:e8b:b0:3d3:ae40:51e3 with SMTP id adf61e73a8af0-3dd8c53b507mr14688669637.23.1789988310691;
        Mon, 21 Sep 2026 03:58:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:e8b:b0:3d3:ae40:51e3 with SMTP id adf61e73a8af0-3dd8c53b507mr14688644637.23.1789988310229;
        Mon, 21 Sep 2026 03:58:30 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d55cfsm23544128eec.30.2026.09.21.03.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:58:29 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH 0/6] PCI: qcom-ep: Add PCIe Endpoint support for Monaco
Date: Mon, 21 Sep 2026 16:28:11 +0530
Message-Id: <20260921-monaco_ep-v1-0-63c5282fb0db@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMMNsWoC/yXM0QpAMBSA4VfRubbaJOFVJM1xxlE2bUjJuxsuv
 /r7LwjkmQLUyQWeDg7sbIRKE8BJ25EED9GQyayQlSrF4qxG19EqTK9yo80gCRFiv3oyfH6vpv0
 d9n4m3N4B3PcDBnaa920AAAA=
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789988304; l=2427;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=peVqRNezccL7XCLjXAEvt4zPOCLA8KyAaMpzFXvC9Bk=;
 b=2j+QB7Yy6u1A0kRk0gX0z2/49ykQ8g6PYURbir7tJ/F3c9vl0NRtyLJuDHkaNoZAjuUV7kxfh
 fdg+mSGQVK8A5uVGyHf48EsrBVwPdUfECFD6Tcn9Giqwxde1MM3LjN+
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE1NyBTYWx0ZWRfX2MOUq+zPupwI
 CgtYpQg6W4+DVKvNovRu0CgJPkdfM+WRzXA+sasdGqYoXjb4yEjv2ONFtEl4vwi/ZV1uEEQrJzz
 qIqLXtyzedynhRJ21ExVxAoZxAxeU9s=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab10dd7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Fm6EAR0vVewXWd2bb8wA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: qYPbtSF8jRXhsXopK_qcCtWlQ2OUTXuG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE1NyBTYWx0ZWRfX/AsUnrkqwgmV
 PFQWFVHdmJoeY6XiHmCefXopzfmvLqIEl/P3MUIIvJBAwiRVLTshuT7dSoQEWxPjOuzL+Frxf24
 7rQW4t1QZdFMnuUfiim5MkQd5hS4KzffrhKYT7Bj1Om0xIsb8nnmVUGUSJsK7GzucvZT+IUk7QX
 36NLEqyP0Ozkvx/oFQ2pT/KPIkJZ5b+GDKMUVDgd0TPwVUgTchyxAHy7VWuOlVUlSmk3OzAd1Jh
 1aDR9UMEilkzThh2laSbuOJARjVr6cex2ovVAGWgx8zzzO+bScDyeyAValtNUIk+rf6VpClr5p6
 zEnWECshuVcxPaoJJvQbOsnXG+Yr7rUh9sShceEapugmtdhvXdv1cvI8rK+eSEw7wSUxcyIzUhk
 Pg1xjhwJ/SMWKEYkNLzeljTJPCDDSus+bXjNjt2n6E2WsZV4BLPeTjxjMkoqxNCQOMD8L6v0I3S
 fnk4V2G1MGuRoNd6EGQ==
X-Proofpoint-ORIG-GUID: qYPbtSF8jRXhsXopK_qcCtWlQ2OUTXuG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210157

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
Krishna Chaitanya Chundru (6):
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add qcs8300 16 GT/s PHY
      dt-bindings: PCI: qcom-ep: Add QCS8300 compatible
      phy: qcom: qmp-pcie: Add endpoint PHY configuration for QCS8300
      PCI: qcom-ep: Set initial interconnect bandwidth before enabling clocks
      arm64: qcom: monaco: Fix pcie1_phy compatible to list qcs8300 first
      arm64: qcom: monaco: Add PCIe Endpoint nodes

 .../devicetree/bindings/pci/qcom,pcie-ep.yaml      |   5 +
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |  87 ++++++------
 arch/arm64/boot/dts/qcom/monaco.dtsi               | 147 ++++++++++++++++++++-
 drivers/pci/controller/dwc/pcie-qcom-ep.c          |  34 ++---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 105 +++++++++++++++
 5 files changed, 319 insertions(+), 59 deletions(-)
---
base-commit: feaece109e78a40818d20528ffaa95d2f22227a9
change-id: 20260918-monaco_ep-fb14fafd0ecc

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

