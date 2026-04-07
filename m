Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD133368BD
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 05:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775539599; cv=none; b=pM4msZjQJAPKZxJjRUXlCcIOS71fmV8r2g93W+tpfXp/AVdLxw/8NDEECy7crE3oBvHtCEpWHlO38Pc19lfrWIDZfXfdaFrCtpJfuS8t7BTkLWzz/qfNbB2QVeA8NKYRhqrUBf5kZcsToi6HuWAnsbI4N9rLQV47RVZWp5skgbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775539599; c=relaxed/simple;
	bh=UGI17w4oVeqScNVO0ib5O1wZufPYmmmMh2QN9gvEDxc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lIQsuvrPwW6fnSzW34k8HQu35JNXrcMO6lvmwVX36B2XWm4CE0Zv+Gugv4Br60/rtHRwJYDw4xkD32KExNoPBvY559spSbuYMT4sv+8fdxXF422PYiLecgAZqFGcDjvhFyycnfb4R/NQz30pqOuVl2KcqKoSR65Fej+mSL9lBN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eq0E3dbY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NyaIJwRL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eq0E3dbY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NyaIJwRL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQfOJ4008692
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 05:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=esLugqp0oA5GjPWw3xFHpZ
	etDg4cY8K0pJ/wq0+XVWo=; b=eq0E3dbY8hqt/QPi0q4G35Rqgx4SqRebqpmWOF
	unH+6k6AkTY9qD5vWzIZP0Jcqo7afk7Un/4OUMChPQLG3KGOGuwilj1k6Fgi9TBQ
	8FwKS3pctbSVG7Wc7lOkKvJKrLcPqbAf8eaWnHGX9MFQ+lslvZEjsCnJi3VunCaf
	bx2kRDvhr7JUqHFBXdFtjta8cWrrooT/+vb09Uf6eswIjNrc0lYvPa6FLRjJnY2t
	WrXZS9xHFAnqLX1+3nFLjkF2XrwXMG5UbF8j1kaGDihPojEtd//Y+tut4Fbtc4s8
	gLLuYzeeObXGZBWF+WuKh7vThA8GL9Aez8oJUrkTg7Zx3aVA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrks55m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 05:26:36 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c76ad3b732eso7169249a12.1
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 22:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775539596; x=1776144396; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=esLugqp0oA5GjPWw3xFHpZetDg4cY8K0pJ/wq0+XVWo=;
        b=NyaIJwRL/n+1CDp7Itmc9gZ2BtbVTzPeCwMjeXijIzA11weRQW8Rnal+AHFBL0wMHA
         6YRY1sxPVADBvU5CvUZ85ROWrWoUjXvjCvbeZs4DM4Mq0lRL+X/mugh1F1KrUSEDcZLT
         rxqM32DIwcj9dUXfl4h4+d37T38ntLgukMeCdiY7ZlvG6IPt2SDFrzfk7RqNF/TRS94a
         bAHyFGTka+m7MQRTgdm74YOoPtsozJnzoANqkoiUuOVOtu4NCPZWtphNHPf0Tl5A2BwD
         Ajbd45+v9kKQvp6UHC4+iwKBo+oEsR2FzHxHI2UAhpKHK3q3+pzYGpvbETLtt3wCqxEv
         sxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775539596; x=1776144396;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esLugqp0oA5GjPWw3xFHpZetDg4cY8K0pJ/wq0+XVWo=;
        b=C0xnI7kce2ob8aC7uVsvbyZGcxfzO6LXo671eXG2f7rZ+GK6XRGWJeGPr6ETJOFhli
         aFefq+T6kWYzw761MMnqTIPKggRgXbNKnlEgCdFutO66fxb60Cogav9x6+cySnVYASwc
         UktJUbCMIP3D7kbxZQw6/Zo2SG57tKxKuRGwgCQQ/rcF+S0gvcAg26h69MIt6RjmCX0T
         3FoBgjHpCb16/y+sin6nMktM3ltCbmft+kbCdb7F/0B48OuJK7GiX7+5LPYtspI3C2Ju
         8g87nTHTv5/dcp3PqJCxwfZz05yC5Z56EZFNljiCpA5LmntHfHgywDcZklY3ea7DUH/e
         bnXg==
X-Forwarded-Encrypted: i=1; AJvYcCW6ERr2wlqw/VTQZ//dXQw4WFbXpDxhLwoWa0u14iJ6OFfhVvO6T0/u0pyRn9sKMwKaFhZ0JAKFffIA@vger.kernel.org
X-Gm-Message-State: AOJu0YzmBtRxE0lAalLkVi18Im/LTerZOoj0SJ5j8TUymuQNF8hPFvyF
	bZFf+fmndRzZyArY0zY6mR9aVSAEhC0RaEk6DRI6cNwbHVgbD1Tgw5W+hnUC6g3JRf2y3eeSYBb
	pTFbp95CdIv0F2yn435U3rS2nracvayHcomyPmHveZbbMvws2baI/pMF7Ur2gvSPy
X-Gm-Gg: AeBDieuWhwy/IYWLHKXFnR7fSqE7nGt6HyjvXExNIeMcqjLf4bZY8TrbNnMkuQnGpC3
	y0/R85viOWEGlbaJcI9KzMkaBjWh+JWVaLTfAcky4Ea6hLcHdpOs+SDmaaLU17rTtFl1D4rS9Lp
	JkKkfE5TS3lFCdEumuSHdRyqgd33FM5YigQO8NXdnEIC1SVWgehviVCb1BqRjDsbKGcgrPtXUvu
	FWoARj5WJM8n14i1b6a3yJXEMPW+oRk6VdZiTnCFsLw5MvHnU1kAUqCxPoJmpupq+I5iuEO61Ua
	Px1B0kIuFsMsG8i1meDET0bD77uHvGlSufVVguxrOYF/+4xbocs/LrKUKmpO4BpnvTwfCELAbZ5
	qiE3Szp8vMkzdw/QA9nbfGPHCZqrIwUUdi+oBXJ/V34aVv1uanT0Le3PEf/9rFzSYW+HoBbDk79
	aTeG/ua4IphIWS6WISSVaZla7PHQjYhLKHakjP60w=
X-Received: by 2002:a05:6a00:301f:b0:81f:3fa0:8c38 with SMTP id d2e1a72fcca58-82d0da90c83mr15364880b3a.20.1775539595603;
        Mon, 06 Apr 2026 22:26:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:301f:b0:81f:3fa0:8c38 with SMTP id d2e1a72fcca58-82d0da90c83mr15364841b3a.20.1775539595098;
        Mon, 06 Apr 2026 22:26:35 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c68273sm19897219b3a.41.2026.04.06.22.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 22:26:34 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Subject: [PATCH ath-next v5 0/6] wifi: ath12k: Enable IPQ5424 AHB WiFi
 device
Date: Tue, 07 Apr 2026 10:56:27 +0530
Message-Id: <20260407-ath12k-ipq5424-v5-0-8e96aa660ec4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIOV1GkC/3WNyw6CMBBFf8V0bUlfVHDlfxgXpR2kKhQoEAzh3
 y114ULdTHIz956zIA+9BY+OuwX1MFlvXRNCut8hXanmCtiakBEjTBLOKVZDRdkd27ZLBRNYG1N
 IroRU+QGFUdtDaecIPKPQxQ3MA7q8P34sbqCHjbd1K+sH1z+je+Jx8U8zcUwwFWla5FoBy/XJe
 Z90o3poV9dJONExiQ9FEPZFEYGiDQVSEiV1lv2grOv6Ahj87LgVAQAA
X-Change-ID: 20260331-ath12k-ipq5424-cddb63a46a97
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Rrz16imK c=1 sm=1 tr=0 ts=69d4958c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=COk6AnOGAAAA:8
 a=hfZH_8odhG_REILTePMA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 5_Od3nKpC9Nxo4NIpCSKcV3MYHnPy_Nt
X-Proofpoint-GUID: 5_Od3nKpC9Nxo4NIpCSKcV3MYHnPy_Nt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA0OSBTYWx0ZWRfX53QQOuhaBXPE
 Mk/uBLRtaLYmY5RMOvow26baQ2p6NT0XJJGgwv71B5KFnfZUfXKBYlYRTnfDNdvf+w33DhiGAR5
 79OaN2OZfI4zkF6yAax+sIYQBr5j+CpXBijMzd+5mFm6qpfihzq5CzApaNx3RD5nyk+nJfCNNfD
 /oihsLswIELMc3xx1katJs2gULD/H+8Pfh/HtdNut5mR66DAtB9QCqTW+kqW3SuYIBejn+F7eiY
 kiiEJnjMBBZSyBZC+Rkjl2Ux0pVsFCjTiwnVx6c4+PGgZrEnALbx+vxf3CUCxpyqPfc0LOQojdg
 Bw23alz/rdsNRRpN147SDl0WOyV/VWTFvovRv9M/uGKmJ6vM+dmmQbfbqsnqIW3iZ9yflygqL+k
 qUt1DdU0UqOit+UAYJmu6czK+yiGDma7D/n1bLQGDlmsBy91PnYZR5frOqYFfgnZFnIl8uiy8dd
 kqyfQPcgDvF29ov8liA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070049

Add support for the new ath12k AHB device IPQ5424, as currently, Ath12k
AHB only supports IPQ5332 WiFi devices.

The IPQ5424 is an IEEE 802.11be 2 GHz WiFi device, supporting 4x4
configurations. To enable the IPQ5424 device:
- Add the necessary hardware parameters for IPQ5424.
- Modify the boot-up sequence for ath12k AHB to accommodate the
  requirements of the IPQ5424 device.

---
Changes in v5:
- The mhi_config and current_cc_support hardware parameters are explicitly
  initialized to default values.
- Link to v4: https://lore.kernel.org/r/20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com

Changes in v4:
- DT binding: dropped copyright update as per discussion in v3.
- DT binding: Used DT binding from v2 and retained Acked-by tag.
- Link to v3: https://patch.msgid.link/20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com

Changes in v3:
- DT binding: updated copyright.
- DT binding: Dropped Acked-by tag as copyright is updated.
- Rebased on latest ToT.
- Dropped ath12k_ahb_ops because qcom_mdt_load() and
  qcom_mdt_load_no_init() now have different number of arguments.
- Link to v2: https://lore.kernel.org/all/20250518-ath12k-ipq5424-v2-0-ef81b833dc97@quicinc.com/

Changes in v2:
- DT binding: Removed the redundant example for IPQ5424, as it is similar
  to IPQ5332.
- Added driver probe data structure to eliminate the redundant switch-case
  logic in the ath12k_ahb_probe() function.
- Validation completed, hence changed from RFC to PATCH.
- Link to v1: https://lore.kernel.org/all/20250130051838.1924079-1-quic_rajkbhag@quicinc.com/

Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>

---
Raj Kumar Bhagat (2):
      dt-bindings: net: wireless: add ath12k wifi device IPQ5424
      wifi: ath12k: add ath12k_hw_version_map entry for IPQ5424

Saravanakumar Duraisamy (3):
      wifi: ath12k: Add ath12k_hw_params for IPQ5424
      wifi: ath12k: add ath12k_hw_regs for IPQ5424
      wifi: ath12k: Add CE remap hardware parameters for IPQ5424

Sowmiya Sree Elavalagan (1):
      wifi: ath12k: Enable IPQ5424 WiFi device support

 .../bindings/net/wireless/qcom,ipq5332-wifi.yaml   |  1 +
 drivers/net/wireless/ath/ath12k/ahb.c              | 36 ++++----
 drivers/net/wireless/ath/ath12k/ahb.h              |  1 +
 drivers/net/wireless/ath/ath12k/ce.h               | 13 ++-
 drivers/net/wireless/ath/ath12k/core.h             |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |  8 ++
 drivers/net/wireless/ath/ath12k/wifi7/hal.c        |  7 ++
 drivers/net/wireless/ath/ath12k/wifi7/hal.h        |  3 +
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    | 88 ++++++++++++++++++++
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         | 97 +++++++++++++++++++++-
 11 files changed, 235 insertions(+), 21 deletions(-)
---
base-commit: 15551ababf6d4e857f2101366a0c3eaa86dd822c
change-id: 20260331-ath12k-ipq5424-cddb63a46a97

