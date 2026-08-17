Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C883F210C
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 16:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786983428; cv=none; b=Gc5mF1duzMns31JZOkeLq8XjkATA48km4MFwujfMrkdWtwVf0e0jPvpqkk/7S48rKmwj9Kouu5onxW4OmbCyysleFzKNTqGxz1Klv7NA5j3oG6YehHkKdZ9DOnDkI3UbFfDcTG48PR/eA1RiUsj+CxYSk6dMSHOGejEKegp09hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786983428; c=relaxed/simple;
	bh=tH0LszceWi9hMzNHxL3XC5ESSX2iXWTn3F1Uz2is49M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lCCAyHQ2ZmLMLGllImFGqUco/6KBm29vvArSv1QfMcb/o/fNEa8msdi0K5fRfZyR00U3hsfp8ySA8x9ROcgcAKtNon0GwJj91zhdNLamLENfAc8UY/tTsdzwgLtQD1cZXj1K6QuGKGrpm/9J4tAfJAr6sfqkrL/+MzeAFmtfVjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ngg4kLEy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RZV2gOly; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ngg4kLEy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RZV2gOly"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HFYcKV3271891
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 16:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vrvtpwd0+fS25kuaO6nZC3
	9jYjBhMlx87DyTXC6yY7o=; b=Ngg4kLEyL8Kefc594PbwmUSpAiOD49FFbxTheN
	jD6VIPy/8nM+mXNZMEUsw39DzHUjw8eqdRyGDYnCORwrVxwnlqgORyTDLJvLEKid
	V4PqG+sG8XqmuKAz2L7j6DcLdL45lPZDpYMJNsm8rMJADM20dOBj1Q1DqL+1kV/7
	M8MlwygIojWKIqW0N9kMRTQNGU82bX3RW+83IrvyHTD8T9fnVQdDaQhs43rdgWas
	c2yu8o1wfUdeM3P+v24YiKFOHE/nHnYhUfvICvglM1rtPSJpy+0RJ2338QhvaC2a
	1Z6Pm4UDFGyp0eQcKeF4gFdwvQFbZ6Y9HpssuEqS7EFvHnLA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wm7t5h1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 16:17:04 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8487ed7f7beso3562193b3a.0
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 09:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786983424; x=1787588224; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vrvtpwd0+fS25kuaO6nZC39jYjBhMlx87DyTXC6yY7o=;
        b=RZV2gOlyUC89fBjVCxYwbZpCSx+OovitqdltMSlA9YZn7UBhOBu9DLwkO4JLON+/UB
         q9TraCxTT/jBQNLNhczqnEeYo6TIzdelaO+eYs4CuQcrGEfymz0mJBPYEOZxIxXYrazK
         HPbVIN8SGmQnMrz6dIwZ7bhbKy4dOJE5a3IjriitxsCbQvkisurW1xGHxmFxHjnkU8Td
         8v4a2F6NcyxHq/mFRuRrU/gCbs829m4Ivxxq0SZKKP7XUlbfEFNsW03kYQwEwX8SBITA
         PYsPVdDscnzaX8b3Ne2Yut861NiBnd1lBqzw6mU6oeTlCmxwLyy1wyV02iuYwKGSo1CW
         NvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786983424; x=1787588224;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vrvtpwd0+fS25kuaO6nZC39jYjBhMlx87DyTXC6yY7o=;
        b=CQDOzu2hZJMmDzXofur3AumhEsSUk5gRN9IAja/LJn90U3ezDp/zAc3jStgS1C+rfG
         WZubQx9yL8P4cVhKuNaGr4nEFTkweIHJLlSAJJ3hcAAWQZ6TYbHVu5qWNOkfRKzRwH3N
         KoV74JzS4ywzukasew8afSrVrmKpmPP0P9ZXUA8ulhhMNsXHrkQECD9+8mqKWpSW4CF5
         QatytjgVdjvoz/SQoiYmUqPbbKMnJRwUxAFh9X0sJb9d+qPZySjKUXyXXk7CCINt2xbu
         L62WCgOY48dR0n3dLfj7M5F/SXnetvCpAWBHfwE2HdsujofeUOjgGQmFsO+jIulgl5Tt
         /lOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq8KjQj3tLIdp4RXTw4AeB+1bNgmEj8djw1K8TyDsr6BB9D/+hLFNJ68tiIjIzEbkV/EOs9/W2nMcbr@vger.kernel.org
X-Gm-Message-State: AOJu0YyzbCNjKo4UOVgK6EhaFNYo5JY37eQ6O2BogEsoWRfHWpy4zgJA
	t66cjS2QCqfySk1EYBnsP2nbGIZLYdBTUrhp42Qg3VR647jXBm6PkvRUdK/4Rc+OaWwPgcUfL2r
	sK1hPFHet/1NJBBou1RDs3GWKLih71oYvKbHVqAWPbssivQrD+ZdlybAYgjiHO6iu
X-Gm-Gg: AR+sD127fqNwcvCHE5mffwKV9p0PpzkNK38xfsYFZcfltOhrOQ2mysksc7udujlsorj
	pMAsaxTCEB6YL+9W9bQSSZHKczjQ+tPhPt/6bhnWfcMRt2EtZum2hHtlOLTiohlam4szKi8XYqA
	uxapaDF43lO1MjcZN6idx8KvQZuI/cLAE1YrtqNezKtaugP0m1Jix+BJAbnTpEDs3SQsklvVG4V
	MKNhbY1CeA4U8HCBEMwYCslERIQDZGAJZngt9RhxFyIi4aBttYN7gwXRye5faO9LHGxg+RQr7oc
	ztbbPkY/XE/cggRT2RmXA6oVr0OJmio90pK1PuSwI7U/a/bv1sYTCodUWIIgyCTd/SjikAO7OJ4
	5B/gfpTL2seOkkKMZsAQSixt2MMk4VTcS+w==
X-Received: by 2002:a05:6a00:1489:b0:847:9aa8:d3ce with SMTP id d2e1a72fcca58-84fde14ff2emr24848023b3a.2.1786983423739;
        Mon, 17 Aug 2026 09:17:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:1489:b0:847:9aa8:d3ce with SMTP id d2e1a72fcca58-84fde14ff2emr24847989b3a.2.1786983423020;
        Mon, 17 Aug 2026 09:17:03 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851b6fc0fd9sm563035b3a.45.2026.08.17.09.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 09:17:02 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v2 0/2] spi: qcom-geni: Use GPIO to notify master of SPI
 target activity
Date: Mon, 17 Aug 2026 21:46:51 +0530
Message-Id: <20260817-use_gpio_to_notify_master_of_spi_target_activity-v2-0-94d1eff3175f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPMzg2oC/5WOUQ6CMBBEr2L6bQ0UKeKX9zCmqXWLa4RidyESw
 90tcgJ/JnnJZN58BEFEIHHcfESEEQlDl0BtN8LdbdeAxFtioTKls0rVciAwTY/BcDBdYPSTaS0
 xRBO8oR4N29gAG+sYR+RJll4rW0O+P1SlSLN9BI/vn/J8WZmG6wMcL56lcUfiEKffpzFfeqv+k
 On/9WMuM+kKXdj6Wt68rk+BaPca7NOFtt2lEJd5nr++nqcvCQEAAA==
X-Change-ID: 20260729-use_gpio_to_notify_master_of_spi_target_activity-5f62a9e14875
To: konrad.dybcio@oss.qualcomm.com, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786983418; l=1858;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=tH0LszceWi9hMzNHxL3XC5ESSX2iXWTn3F1Uz2is49M=;
 b=2a/jh4YIJff3PSn9kMbxH0upCUnnEQDj5BXGk+J191JBIQye1hvg7N6RFblkQi/usSmcymul6
 JJanRzmZ76SCFchS1L4CcqTFKN0vDR8ZaTbNKz40tIs7hEW2ja6D4im
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: -caWyWotyIucvBAqwfIVg23uN38fFsrU
X-Proofpoint-ORIG-GUID: -caWyWotyIucvBAqwfIVg23uN38fFsrU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEyNSBTYWx0ZWRfX8OL0v9XRs8KQ
 6+epKakLMZWS3BfP78irEsYNo6VMIPD3X2wI07bMwy0rphQq6FawEphoWenjL0Xtj+gItxGHxdI
 tRKxti6ae88zBGROn8h1pVMX9fuxfVHBCvNsjEq8Vo0KtyCsT2oG8uLfR3fKPvk6zwZArG84Rwc
 nKj6WrqW3+CCtuu7RVXthO9OffBG1xzdolVcGx8T6F51GmAaEb8/VAgZySYBIo4vSleq1B/ULAC
 giY1a8mnKfjZVcr9LM4f75YZE5RHiKsrMsfQ59r/y+XnNdgd0taitURFTKsD4avA1O6xl4P6M/H
 k63bFVSkRYNVWqdJjmmdhHIot2HuO0PW9aN4LHlwaDNWFR024P/S6AA3iIONjm9x9hEnYPFdyJG
 lESJ83FTMYVm8XXnfDN/CYsPmkK2DYFl/BpZiVtOsflpBNxBmyLouRCW6Xe/RpDnhc2n3vL/iKa
 ytH13HFllIcl10aH1Ag==
X-Authority-Analysis: v=2.4 cv=YqM/gYYX c=1 sm=1 tr=0 ts=6a833400 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=DF-2czj9NRJiL_b3NI8A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEyNSBTYWx0ZWRfX2S5eiNUuuKr4
 Hxtud5moDFhR4iuFiL+BR+4wWzMVpssc+5TeAIQnJHd+CRAgZkLKlHRb1kyQ9LCSHxZvhYFl3rZ
 ktFiCjAU+y7zh84fKNngPi0lD+gKbyI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1011
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170125

When operating in SPI target mode, the GENI controller relies on an
external GPIO to notify the SPI master about the target's active state.

Add support for an optional device GPIO that is asserted when a target
transfer begins and deasserted when the transfer completes, is aborted,
or hits a timeout. This allows the target to explicitly signal its
availability to the master and ensures the GPIO is released in all error
and completion paths, preventing the master from observing a stale or
incorrect target ready indication.

The ready GPIO is intentionally made optional and is requested only
when target mode is enabled. This preserves existing behaviour for
systems that do not require the signal and avoids regressions on
deployed platforms where the GPIO is already controlled from userspace.
Targets without a ready GPIO continue to operate unchanged by using
devm_gpiod_get_index_optional().

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Changes in v2:
- Used ready-gpio instead of target-gpio.
- Updated commit text.
- Link to v1: https://patch.msgid.link/20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-0-c363a9b5df69@oss.qualcomm.com

---
Praveen Talari (2):
      dt-bindings: spi: qcom-geni: Document ready-gpios property
      spi: qcom-geni: Use GPIO to notify master of SPI target activity

 .../bindings/spi/qcom,sa8255p-geni-spi.yaml        |  9 ++++++++
 .../bindings/spi/qcom,spi-geni-qcom.yaml           |  9 ++++++++
 drivers/spi/spi-geni-qcom.c                        | 25 ++++++++++++++++++++--
 3 files changed, 41 insertions(+), 2 deletions(-)
---
base-commit: 78bc8af4affb9a732504eb22eeac7d1e50883853
change-id: 20260729-use_gpio_to_notify_master_of_spi_target_activity-5f62a9e14875

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>

