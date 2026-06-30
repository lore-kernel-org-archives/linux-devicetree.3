Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F8C3955C1
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782803442; cv=none; b=HR7LB5PGwOwPPfpI3JxaXgA/2pVCSjcRqZ7FK+5HD8gNIgIkewZ4WtLzFjblocxC6or2b02aILRoOmUyMWwG/yDZ26OBOhxoPz4+wd7VWoLzG7D7dsi9qMoyhnBdBtRjvVC/ECKrmc1O96MDCRt8meamT4hfVWlFWhN+Q+r7TZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782803442; c=relaxed/simple;
	bh=y/yDjjLkDUh8iGsWzfnxYn81hfEg3x1PqIo//TUmAhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qY2cFZeFaHkDwvZwiZODOUnmIOXvitqu+dAJWOgPqGQtPWgIShfTp2ZzmerBaJcCQOsS/7FXpF0dLd5uWvlEaZU5CDAOdFK3cnPygNZikqJStTdOp5aqj+DCjaui96fXSFWbEbvTkCk+hxrw1hHp5t5JU62Q+I+VZ0vWmy5Dkvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fX8m94t3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IPBrM5Xx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fX8m94t3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IPBrM5Xx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CdQq1074123
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=laNitI81tOcv3NnixGTD6j
	dGRDX4c/NTa7r69SA/O8g=; b=fX8m94t3Eb94xyNO4k362lRctMyG9is9Bl7XQA
	pkSVUKnxZYQYPOkcRxzHFtCmNu6NRyc1y2Cjorwk+fBLZh9/O90mMIyczRDt6VOL
	bRfDXnF2hkwNZNCpQkaeLLCOU8Ey09oB6ELilvi5o2GNIr4hB3GA6pNlsr6I/v3M
	1+BdWNnuG8X0HGbEznRhw5K13VUS+u8XI+JR5W1aT/HSkvUZ0LWxG7f8xcFQtQA4
	0wOEA1hWrVDVQWgBKyVti5YBG0epdoKqwWu5rX8+pS+S3Gjk7mnENW5uppjf6eWk
	nmCOLPLNcKO693Gb+yvv3j3SeA1KRWISBsez0uRm+ieP53mg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9k226x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:10:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f0caedba59so8646996d6.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 00:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782803439; x=1783408239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=laNitI81tOcv3NnixGTD6jdGRDX4c/NTa7r69SA/O8g=;
        b=IPBrM5XxU8mCUTkHSuhfv/VTYmjSnH5sBXzg4FkzIP0/DUhIKv/7OK24aIdRvU7vn7
         B1XcPbbjyDnW9jeBL464Os1lOzFpnjdc/8LNFABgBWX0b6kGIC5vkTOBXNueyGXRSXIG
         zdtBDM+Uu/FXUb5XLZboHGSNVcpoP9KR/YOGZBXMiOSpYPmOXqV28FM1OhAa9mR8FNkC
         maorwLjzlInVXw6x2JpmZMzDgLUCu6YXVaY0QADFE3x15xvvDL3KhjxOtu9VLkj2KlyM
         h6b83kzIa7oiHDCL6b44/vWJFtJOey7KxGtznBfBvgRvcnBazmSXPdCH4K39VhHObWJE
         i6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782803439; x=1783408239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=laNitI81tOcv3NnixGTD6jdGRDX4c/NTa7r69SA/O8g=;
        b=tBpWkglZaW7UD7ReE9BPoJyaIciePYFK6xRcgdYNIv2TQ6RPBh7aXG59bFAyV249c4
         501MPZcSMgAfMWKFKtF5ZrPScFzyObL5gBxJSjDZfY844NeAxrol7dSGkiGUkO/ncy/M
         g//dPAAKUYbd8m+G0u6LAHEfIFhD8zJoZ5PLXA3Zc5lZ2ezEZhtd1MwrT/04bJCA2zxt
         RQWwLKBjWxlZK7LEUPXfg1CVChezDGyny9hOxL7j8xqTDd9k69E3FvsjbpsTxfBjo4j2
         OD4uyWrcNtV0MSAtDJvC7NCcqaOYvEFekGJkXB40oitC5dh9ogBTpcPz7GNxNjwK8fIx
         0Yng==
X-Forwarded-Encrypted: i=1; AHgh+Rqkw5zlZK1Nqj2Zh5iVJ9ufJMEZwXdiGue1LNhLsLaqpVf2gAxUKH+5Kyt6b7mmthypNoXDgad3xcEW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5wBnVbB33aPhAopuj4k8Yldu3OGYDE+mMJZVqEi9m2u56Bcll
	9xDH7lIqUnAsfrwy6iW4AN/3h1/jrHBdWFR1T8vRueb7ESQlpSeSiZSolHKRfsZ1iQqxWvEY/Lk
	X965lDMDH6AuLq/CvN1qEfAZIF3w5UcK3s54LtQjJcDNYr616TmC9PbHxkwy4sI98
X-Gm-Gg: AfdE7clN+0MBnJtPB7gpBhRzbC3p+H02MJ5nN8awxiTXRrGfVPC9mHcOqjkkM5Eu2kf
	027yzAxBBNWu87cvbL69Cw8VSDOZ1LAHCRVzwlYDYft6GXqCzZNgJmrsDwz6GPQewtyMXvowUx8
	Est7jL6cuyyEkRPwdEGVZFiKr3G8RobR8X/nAzpT8LGz6RRd3o5IH2KDyLW5yodI0NWzGCMYXNy
	b5tZlyq2WV6ovk7eREn3+cB6y3S3jv9x2Ywd0bkJeHzkX0iHSKKyEyoVFEifm1jaS2pffmLXYe9
	BBrUlRk9bqpPKXJCuL91tDE7/SItjtD8Fy0+tShG2eOqBjkhcwC74KRhcAiPNMrMl/EZ9lZmzXn
	0RFhnRBUQWFmsFNwUvn8i3Twp6YET8NC7CgRhaJ3FrLyKsTq5NpwK2fWJTKNd15DIpF8Tig==
X-Received: by 2002:a05:6214:2aac:b0:8f1:77b7:9bdc with SMTP id 6a1803df08f44-8f25202dd9cmr6553846d6.1.1782803438935;
        Tue, 30 Jun 2026 00:10:38 -0700 (PDT)
X-Received: by 2002:a05:6214:2aac:b0:8f1:77b7:9bdc with SMTP id 6a1803df08f44-8f25202dd9cmr6553516d6.1.1782803438337;
        Tue, 30 Jun 2026 00:10:38 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f19f770c41sm17471956d6.0.2026.06.30.00.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:10:37 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com
Subject: [PATCH 0/2] Initial support for Qualcomm Hamoa IOT COME board
Date: Tue, 30 Jun 2026 15:10:10 +0800
Message-ID: <20260630071022.3256-1-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2MCBTYWx0ZWRfXypClJfHs7YKz
 dfkqWut2SJC1Y5R/xqrna+bC7csb0ZqWr+RrfJxklxZ+KeU52z96K7r1G0vFf7B+m2orc5695n+
 Kruwbf0ketLObZXOuh+LdXumGPDwo7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2MCBTYWx0ZWRfX3R/JkhTHV5zd
 EWk5domvhv2UkHaRE4t1Xu2E+nNWIsJqWFq7VLgneuQop53BTV3xmHeWONhj2CmroemaWZqr9Ce
 nvLcl/yTjJ1oEK3HrXUapKiOx5ws0Qt0Fc5Rx1SqKIdcppjaPnIuhwKEiOAxcUBZUCA4hNflPd/
 YUx05jImQyd1CMGQHcf4CgemkABsRZlmVfxtbQgg13WfKJJNhy6lls93eMHA7Ta0FkeYmcjq11c
 Vzb+XSI9+WlPpQHSmwevauPsuQezZPzWJxncvraFsLcSQ79tv31KTKIG0D6/1nPUEtcL4S3cxe2
 pzIsCLR2o4b2GD4J8thPrS8GN32L4+N89k9mDDuE5I6RtsbvhXs3EbVTbcvNtSGHXGBYZ4oYbEw
 vml2bEzT6RzDEsJAnPmZKno5OQluUdWXuLzmpc1xzFS+/EddEkiefojy2r2fM02qCcS3+vfZF1M
 Sg487V71bz3qLumkBSg==
X-Proofpoint-ORIG-GUID: wwyX5gCPKcoRwR9T0ENYgXKFH88FPKJH
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a436bef cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=juaxyESPAC5OR6l5tJAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: wwyX5gCPKcoRwR9T0ENYgXKFH88FPKJH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300060

Introduce the device tree, DT bindings for HAMOA-IOT-COME board.

The system consists of a SoM mounted on a carrier board. The HAMOA-IOT-COME
SoM integrates the core system, including a SiP that contains the SoC and
related components.

The SiP on the HAMOA-IOT-COME SoM is equivalent to the HAMOA-IOT-EVK SoM.

┌───────────────────────────────┐
│          SoM (Module)         │
│   System on Module (small     │
│   pluggable board)            │
│                               │
│   ┌───────────────────────┐   │
│   │        SiP            │   │
│   │   System in Package   │   │
│   │        (chip)         │   │
│   │                       │   │
│   │   ┌───────────────┐   │   │
│   │   │     SoC       │   │   │
│   │   │               │   │   │
│   │   └───────────────┘   │   │
│   │                       │   │
│   │                       │   │
│   └───────────────────────┘   │
│                               │
└──────────────┬────────────────┘
               │ Plugs into
┌──────────────▼────────────────┐
│   Carrier Board (COME)        │
│                               │
└───────────────────────────────┘


Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---

Yuanjie Yang (2):
  dt-bindings: arm: qcom: Document HAMOA-IOT-COME board
  arm64: dts: qcom: Add base HAMOA-IOT-COME board

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/hamoa-iot-come-sip.dtsi     |   9 ++
 .../boot/dts/qcom/hamoa-iot-come-som.dtsi     |  38 ++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-come.dts   | 108 ++++++++++++++++++
 5 files changed, 157 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come-sip.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come.dts


base-commit: 7de6ae9e12207ec146f2f3f1e58d1a99317e88bc
-- 
2.43.0

