Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F3A4071F2
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 08:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587177; cv=none; b=cUR2mLSX9S4BZ+4qlc54tj/KAIMkFrpmrX0vkO1sp5J23gwaPg5E4M/9PgyT+RBo27S99EWsvhMNngqpK/azFWv2AGQ0JEw/8ZMVdbur2/KrJT3ceqe/72fABdmuiMmfA95ED6Se/UcoAUOkXrwY+59El0QaT2r2bV/f4s+HbxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587177; c=relaxed/simple;
	bh=XYBIxNqxFlq7OZ5a4J4tYbrJYzcu3v+1g3fbH6mCKdQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uidAbjXd0hJUBNy7m66zMD/ASMc8C/TiEH4Tcj57DTfP2nBe60305YM6kHeb7Lykwy3THb7egE9EAl5fvWMxNM7Qw3dEJgxkTy0/gZ48Mn8gNYPdkM1Y/OqSaTvCpiSSDjWr5Av4BbV9Euco6bk1FqOVWBXmETeljKKtXmAB/Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EfDw+euk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fGyMRwMd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EfDw+euk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fGyMRwMd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960Glk887930
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 08:52:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KA8OKDkI5NrQUgJQohCBN+
	QBBA4N92j/ePJqgTem5V0=; b=EfDw+eukyxyjSBy6yicqy8j1xLVJAkpSqVzXBI
	3oM23Pil3inMDkpYdLS9mOv6H1Aardrc9rrlbR0r425c2vvYRCpTRkFXXbzG+R4H
	RUta10frVzJEfS70ak07VTuEyj2eqGi80EMWDBZpnWQN9upe/wxGpQJQNh0YYD/4
	8lnHMHZYxnlxMR/CIM151j8aq4Rl/5AkpPap+zT+iCxzuMb6SY34CMpzZJNGqDn4
	bb4tzpPO2o79twuQllHPwsMf6Npxp3lln4ZvsbzRxJCD9s8LyaI/cvb8uefrfqZo
	7WjzreV9NyKXNTY6NNJhirY5kWmXu5Qj8AKvSeC48a/I+z6g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq33nhe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 08:52:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38001e788d6so3212372a91.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 01:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783587171; x=1784191971; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KA8OKDkI5NrQUgJQohCBN+QBBA4N92j/ePJqgTem5V0=;
        b=fGyMRwMddP0WEzVpJamHXwzF3tYSpVEa7P40ynJRBdIUW/zpol3EeAZX56+3DeOV/D
         mVfEny9KLSuvb/5+/bVNXnZWUF7G64S/YlRUBgfb0NJ4QEeVAckEFkruqPArrDwK8/ZT
         mOgEg+wMrvfOf3TzOw4rKD9PpHpxhC4BhvvW1VCYY/nVKrN8423nQD0i4I6Ral6hUpjl
         6mJl5Ff/Mn9GwGglc8OUytP4HUAbdcJ+A0ZEMgpACTOVHXjgXdoquvg2JhVpG1axNDJs
         L75lHxWKMBMfOTVSdhZiDrJEqGgu3awgw7xCEO8zpyitHOidi0/PIzh0Jwa08qUr7o3g
         EkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783587171; x=1784191971;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KA8OKDkI5NrQUgJQohCBN+QBBA4N92j/ePJqgTem5V0=;
        b=Y2cQbbnL+nSVh0f4OTARIkW2TEip2oy6V4K2otqhD5RH5AUz02YR0cdj0gukt16W99
         17cdBGoU71/gjEnssKYdbsHxCbgN616OCk2clpqdLjixt7voVt0P2WqBttnMvQOJEG88
         oEkII0oGSKKCB3LPwcqhroTB4bNAQX4bWauJ+8o4wrRPQ060QShFWa4GrbwmJ5awTiMG
         KTebVAVfPuUChI5lZwgb2dg+LNXEYEiuco0PzSpDDxEyjUtSGSKjgEecHIorTMUoSXel
         jphvp3+wtE5ZECPUrNg7gxJZ8ik8IuGXj2D/sXXA3pqyMawlah5ednr5dWgelVrl/tDN
         s/fQ==
X-Forwarded-Encrypted: i=1; AHgh+RpZb+LIzPuv/67Ro1pqvk5Pq7Vk/EqS8DfyRxQFh6q7+hLO29AE0IF3Zhob3NPd8ZXvWuGxXVDbcuk5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/94rY8+E3KojGwP7Ou4nAYPRQDyy8K2NF0lUscWh4a405QbR3
	ndUH+5sO/u62OPJekl1ZFzx7C49GUb7jKtRd0Vb4h6BKWmej0UkTdmRG+wSBvyyVp9v5cTLhZSr
	nhnGlrHhB8PEq51HGQuVaDFHsaKyifpA4U7aFxln889DGwg/yY26Qe+k15Sc4ma+/
X-Gm-Gg: AfdE7cnqho1HiH9oJdG6D4Gaw8VsEJUCTcrCmMiyoESgc7mK0Q0oh43Hftt+FzansPJ
	jCw5lMW1dcnKYGBeB+zP77l9oGH/hskMtzJ0qineJax16vewOUk33537zF344GuLQjYBVFqkPj8
	7ciIrgvICBK3vTHy1I0AXS4xJdnrp6khQVeq2ClE4SH2YYYYmfXeAs/HP+DymbU8P7DYPZNh/dF
	vViAOw6PN6QDflFxM71kIpv3AS6p9zc/1gpAbDPiGu5nNNx02YigS4IVbwbwv/xK26+VxVG8NJV
	L1CoHRQyt8gQv+uzRV0Ltk/OzUDIuUYZPVljg65VV9U4B0XTeiCAA62Vtnlb2VVxUNzYdtLFwlF
	VaBiDsPL+DM1gHmVpVeo+x/c0k1ABXIcpF9blT82NQZYUhJc90q311nSmK9dxdn5IMT1M67pWDb
	kTUhgK
X-Received: by 2002:a17:90b:39cd:b0:37e:2005:6509 with SMTP id 98e67ed59e1d1-3893fe5b9dbmr7084984a91.3.1783587170657;
        Thu, 09 Jul 2026 01:52:50 -0700 (PDT)
X-Received: by 2002:a17:90b:39cd:b0:37e:2005:6509 with SMTP id 98e67ed59e1d1-3893fe5b9dbmr7084947a91.3.1783587169972;
        Thu, 09 Jul 2026 01:52:49 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5574c36dsm822771a91.6.2026.07.09.01.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:52:49 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Modify interrupt handling for eUSB2 Phy targets
Date: Thu, 09 Jul 2026 14:22:35 +0530
Message-Id: <20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFNhT2oC/yXMQQrCMBBA0auUWTsQQqLWq4iLpJnWEYllJimF0
 rsb6/LB52+gJEwKt24DoYWVP7nBnToYniFPhJyawRp7NhfTI1WNFjkXEqlzwRalN+cJF48puD5
 En3y4OmiHWWjk9bjfH39rjS8aym8J+/4FG1EyzX8AAAA=
X-Change-ID: 20260709-eusb2-interrupt-handling-v5-da49ab5d5a84
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783587165; l=2145;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=XYBIxNqxFlq7OZ5a4J4tYbrJYzcu3v+1g3fbH6mCKdQ=;
 b=k0BLqybWUhl4RLc8NcIyvSa0hWFcpwp/Dm3Fpd/XbfLBDF1LTyxZO3VIRkMzernvGzGsmjAq9
 hIJw5M7Py7lB0qKQ/cyEQOpvjeqSqhXjJrnPFcxoQwfugo+bnxNBy4r
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: gz7fh6uCsnBE8kCgbTjBanS-XHnB-Pdn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX5ywXWQTSIsOH
 EmBrcLy7xn1V7/+g1F9piJoj8vM5+lYix64tP/zi6RE1TQg9s25XNgWmnnFTW+FS3NQACA+81Gf
 kyLIudFxhee3UzMkAce1QWtD0eQoDvVNOubZQXfSb9HFHq0iNTpxQgTSMZGRPJLBQUGufZZICQf
 jc7ggyyeoOMCJaFQTYuZLW+pSU3gbZSewVxyCJwPY/rotUfvYUCZhCukWD63m1H/jOwsJnO5OeF
 6+I0zAuT27fn1F5sakufDnUBbcnh4Xo6B1pG3rkGhBU2TW5XDjlBvm1GvmkbvYLr0Rrawuy2HIN
 WjTurxocbts6rhFh+3b8EwNsAp/O9QCGwCAmQ1LrLr9QE96lvdiO+/EPcrgLYoVQbeZfjieTCpe
 HCxVBf/LdYQh+mcs77vdb2vnFD+w8lJbCFqXy9T3TbRfM5i10od6W9bG9E1CRoCFV8eU7kPc0M4
 OfXxqwc5hlf9haMrVVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX5GPYXlA947FY
 KaDfKIAOmefJfCEAroHER+O56JMhkTTcKxaGySlIbVfTnju8gUmR2dVfQqhqXNLWJv658bpOYPu
 G73q9g6J82//l4418QGCvhfpYZGJGEw=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4f6163 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hOquEkmrNNFKbTobP-QA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: gz7fh6uCsnBE8kCgbTjBanS-XHnB-Pdn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090083

eUSB2 targets handle wakeup interrupts differently depending on device
speed when operating in host mode.

According to the eUSB2 specification, remote wakeup signaling in host
mode is detected via different data-line assertions based on the
connected device speed.

When a low-speed device is connected, the host repeater drives eD+ to
logic '1' upon detecting a K-state on the USB lines during remote wakeup
(eUSB2 specification, Section 5.5.14).

When a full-speed or high-speed device is connected, the host repeater
drives eD- to logic '1' upon detecting a K-state on the USB line during
remote wakeup (eUSB2 specification, Sections 5.5.15 and 5.5.18).

Since the eUSB2 PHY's "DP" and "DM" interrupt lines monitor the eD+ and
eD- line states, configure the wakeup interrupts accordingly

Add new property to dt-binding indicating that the USB controller on SoC
has eUSB2 Phys or not.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Changes in v4:
- Moved to using binding approach as suggested by Thinh

Link to v3:
https://lore.kernel.org/all/20260511094422.3561509-1-krishna.kurapati@oss.qualcomm.com/

Changes in v3:
- Removed multiple glymur-dwc3-mp pdata entries
- Replaced use of ternary operators with if-else

Link to v2:
https://lore.kernel.org/all/20260505194242.1947891-1-krishna.kurapati@oss.qualcomm.com/

Changes in v2:
- Updated commit message
- added supported eUSB2 targets

Link to v1:
https://lore.kernel.org/all/20260502095616.666938-1-krishna.kurapati@oss.qualcomm.com/

---
Krishna Kurapati (2):
      dt-bindings: qcom,snps-dwc3: Add property indicating presence of eUSB2 phy
      usb: dwc3: qcom: Modify interrupt handling for eUSB2 Phy targets

 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    |  7 ++++
 drivers/usb/dwc3/dwc3-qcom.c                       | 40 ++++++++++++++++------
 2 files changed, 37 insertions(+), 10 deletions(-)
---
base-commit: 62481c92444386d46b3c4a9c3dbcd4917f07d138
change-id: 20260709-eusb2-interrupt-handling-v5-da49ab5d5a84

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

