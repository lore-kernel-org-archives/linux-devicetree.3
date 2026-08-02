Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48CE366816
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 08:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785660350; cv=none; b=fXeN0XcqTrlYptnl1RNWt0itLTgNrSva8Ptx6uWO4JMb1f6i1TR5v6kq2JEfFMBR5UWwZPh8IAVhDB9DHar5gj/QdLafCVr3jDpXOvNg4QntgOjsPvsipQpjymj6BkL3UHybWdZghDrqwMOLS38A9vPFGSrRh9oquT651M2KBgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785660350; c=relaxed/simple;
	bh=6bWVGIKrjhPKgs93NmDceDYySn5pv2NXcoztkSyxjtw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nYT9CWYqRP5/otyXPV2t/GSRGqEGj+bsrY95DyasJl4Dc++xMRiACopiUIqbUXs/39TEaXnN6oyhHQiyzqhxbildO+J8RCYQyEBKx3UMxSRBlhpLBrE90RVkAIpZ874TP3WRj5lNDzppP/X85mhipmymULoNRu9HGaOaCN3QZSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OtZUpGoh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U3wZZr5I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OtZUpGoh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U3wZZr5I"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6727lbNj1601995
	for <devicetree@vger.kernel.org>; Sun, 2 Aug 2026 08:45:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bKOdmWHeZSjP/jdKHvKrTH
	XbY7O2crl78U4vjJWF9r0=; b=OtZUpGohoWHWTyALNjhtWGObD8W5eyIDUIChMZ
	oWgNgcdelVTlIhKj1U8ePClU/ttWBfwLeJYqh7IAV8p2UMEGgn/wMpalLehTlyFt
	z9t4vFzP5CmpQk8lWypCmLwuLg1Xv4o+dBz0W0jOYvgmq1UwqsTeUZrDJGppNexQ
	FTkn/TSyeO1zmBG1OFjrh5D0dWwVKx7B+UhVkebY8RLYzacm80G8Cfk8I0gZzbjo
	F+UZ9nQBzdnd7H8Xz4A4JXQ6H6zAud6HD1nGIErJbtWoHIkoppW9TZxf0l6ZvcA2
	t7nKUkJ6mncrOkRROY3OElGJN0LNYqH8/b2Q1pTHPKlKMQOA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8qptget-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 08:45:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bff5c7035so49636841cf.2
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 01:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785660347; x=1786265147; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bKOdmWHeZSjP/jdKHvKrTHXbY7O2crl78U4vjJWF9r0=;
        b=U3wZZr5Iqufc4gVhzgeGEEPfU3s4P/BapXTYf9ZuDP9wrAlTQ0qkQXrGi2YgO9ZZj3
         a2yG1S3mk2IwMLUz+b5FEyek60m/It89QB7PDloXRZJDs5qMIwOksy58dG12idUs4Jbw
         PLJto1Ut3qfIyc4L8g2yVqim+f96Fbk1Js/HJANvCafPRysxbfJXVuvlCN6VLTIUKWeS
         xGUE+ukAzh/LlK/RIamtb03tlLXSP23R7zn4r8IVPpqNVKZnRD8z6qWdyJeMBLOOl4eJ
         U9TijodGDauV281iiXAzodq/XCeqy5OX8rz2MZX615pXCxydc7Bou/KEKmbzMXFjdTdS
         Rs8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785660347; x=1786265147;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bKOdmWHeZSjP/jdKHvKrTHXbY7O2crl78U4vjJWF9r0=;
        b=CH85j57byk2GHBR6xGexVoFrOBe/Aq6+Ra4t33ney42nKkj/JSzA2mkCgWSy5mo4NQ
         7Z5mu9F3m6NHNPZh8xevoq+AevP4eyO+XF59tiKXgLodzUxTMXa/0F3d4zZAmuboisnu
         QHadl18GDZEyEbtfKemMsFCEO89dMBeOIWhXhSIpl8rbZJtMcOJ+r3eHXVdk2UNu28uO
         zbKSxayBGgIug6hjK31Nv3/XjGVLECwZSYdP/1ECFOTuFukJwAgETY+jd0/aeLJsTNRH
         8woy+nrrfdNyFAIWUAImeX9O+HNpLjMrffDmDjnRbTA0UExKK58f9EGQFBCc/JwMNg9Z
         dETg==
X-Gm-Message-State: AOJu0YwBzCAhlGLDpk8wIRi0yEixVJ6dt/c7KxvCYNR67pkQwuSYBsjM
	o2U3OJOzjeeGq04CcZcwk3xFQOe+IlXmz4OTEPu+02co5xxRI5lR9lpBMC+vClI85A1ub4/2i+M
	gKt0KRihwmV0Z/GiZcs6HUrC3ZSmJA+SXOIo5ueMJtS0c3ABzBQA4ySiEVuK85nMgIytBdhP2
X-Gm-Gg: AR+sD10mV2bIC6Qmy/icgUy70EFHIPWcGSKUYjFFa7aGro71d72HIk6B2/qs0lfCEvC
	wQ/dm2W/f2ZzXpNUEJzqtDW1L9lMSiG5fn5eBy8OQoR1WvaD3AKSlAg5rl1dNJfIjLcMtEZxCZe
	FkEPl5mmHS9ufeOSfalWpRlTnt1bp+ufxTOp5vll+lZSkoKwJeWPSTVsH/X21oP7FEaw+hCtoRW
	KjEAH1c91GkiQVum1XBU1S5jdoJLJt7khLvUpnaAOrm2VRdOHW3hi6WT32/a6mfLMTKdzRSbrru
	vgEhvnwFU7r4Wep73nRnr9qKecLQqF/OJNpSLyb+glYBdpbiBrJKJbOjPyS6WnNlztM49dj1YYB
	CNirk4adqEFNUMZ9Wb+BmCc9D
X-Received: by 2002:a05:622a:98f:b0:51c:a2ea:64d3 with SMTP id d75a77b69052e-52b567b70c4mr130270611cf.35.1785660346993;
        Sun, 02 Aug 2026 01:45:46 -0700 (PDT)
X-Received: by 2002:a05:622a:98f:b0:51c:a2ea:64d3 with SMTP id d75a77b69052e-52b567b70c4mr130268911cf.35.1785660342772;
        Sun, 02 Aug 2026 01:45:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808191ef9sm139198195e9.1.2026.08.02.01.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 01:45:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 00/11] dtc: dt-check-style: Improvements for false
 positives
Date: Sun, 02 Aug 2026 10:45:22 +0200
Message-Id: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OQQ6CMBREr0K69pPSBFpceQ/DgpaPVLHV/kIkh
 Ltb8AJuJnnJ5M2sjDBYJHbOVhZwtmS9SyBOGTND624ItkvMBBcVl6ICB10koLiMCGZA88AAxrt
 o3YQd6KrlJQqpVF2w5HgF7O3n8F+bH9Ok72jiLt0bg6Xow3IcmIu99+/WXAAHzUutelXLSvKLJ
 8rfUzsa/3zmKVizbdsXYzHTvuMAAAA=
X-Change-ID: 20260726-n-dts-style-checker-continued-b6a05e278891
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4713;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6bWVGIKrjhPKgs93NmDceDYySn5pv2NXcoztkSyxjtw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbwOn+78BGuO85kxjrzQ9w7a7CzTlpDpKWqJ4j
 XxlL1iUQ3KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam8DpwAKCRDBN2bmhouD
 1/JHD/9151q4EmfF1YB7kdAxgRGYABdPQqC5a652C3vZQo5Fpp0xdEmC5nAeWLLnBNfq3nvHiBz
 dfDrMnPs9Q2bArn5AUvZ08WbVGu+Fd1BHdQbt1VKIGsS4Q2oGLDM1NY9kRPQHN01kxpy3jl7x85
 OKBlKj8gyUL7y1guRexckpWEQLeN1hy/ktQsxdx3kYSdAiDpfAiAFSeWKcvU7M2ZvhbUrnj+c0C
 sPCdisdXQFR7XQ9Fb8d/zejYrFnbXU578I0H8Exx6PJqGk9FS8vu4lMfBci+Hs36t6dJ3Nnl5Va
 MSVKYIafXBvfAoj7AZb6bRjjyFuQ3az8H/3olOmNfWajvKsRR5pKQzPJU0j1U4yIj8OETSV65xX
 SuaJSI0BuuFwUF1Dt+putnbQxBWKzmieZEpFnRoq9mOuDyeYLTYMM0fZL8oskxgcaSgoWwGLQUS
 tdingwQ3GQv5q7E7M0xlldEOKXtz07jcrWhrzK7u+YHTdmkFGRGm9uNiFJV8Xi9/rD5n4/hUOmq
 CewZam0vmkTEmYyWxyqFYzWuf79UbQCmILR/+xFDMMYfBJNLjHUNuggm5VKJ0W7gsySgo0hGXqc
 V/VUrCnY4KPKLNUG2FImfykTrpjEUKTEhMd4TGUf2Q2nEss9ZoWPjDAI7uatJFdA4EdGWb4tS/G
 Xy+nLPCA2FIBmLg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDA3MiBTYWx0ZWRfX8E8Bu2RrwIpF
 KqS/JEQo+cOlhcOIZN/uKr4caXmmgLAEcvJgNs6b2KFL7h/r1dK8mNqIF5IEgeZ3JPbKpmAY3AG
 HhtNS/CeYpjFZ/OLGGz/uuyTJzKIrAX3drokUDXWS6f84We9BNS6zCK3eab+3TKdmWMW5f9dpBD
 XBqJhAmsNTZUqSmlu2mm71B1RmKbz1mCpzWRLtS3GRAChK6y8bbS9AOgy2EencdKpnStsCCQTQJ
 UKvZjsxKE3+JKQ8/i+QSfdkG+Y92/aWFvpjmt/f/f9q29UvJDQoKK3hZ1gv5Cry3ZG2qfoeoKOM
 7GEoqtioVYG+OIeoksl5Nht+n8OiICacjGVND0GUtCId6q1CINs2jJYtPt2rmvoSfZ67dHoLX7/
 akuPebW/aoKlZ5/AECtHmapKNtcvYUix75MUrfWfq7CMwyUhEXxaH21FnWsgQZTBBMOce8TbQyS
 /W1NjAEJY+8idy/XByQ==
X-Proofpoint-GUID: GPn_WDudvIwsih_is8BM7QHux7wAPPaV
X-Authority-Analysis: v=2.4 cv=MpViLWae c=1 sm=1 tr=0 ts=6a6f03bb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=uDG-wypHxCCRME12IRQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: GPn_WDudvIwsih_is8BM7QHux7wAPPaV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDA3MiBTYWx0ZWRfXxIgSGjRV0Fb+
 ZNotZBqiCOV40dCK2STgc5ur4FPAIIfPoDTNXeFSd9UsITzIDWFXnXerJPdziYHNZpyPfCyiNG/
 QAItPnm0s85HLoM83WWEi7aHRFwnVQg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608020072

Changes in v2:
- Trailing slash to maintainers path
- New patches:
   - Patch #9: dtc: dt-check-style: Add test for trailing white-space in DTS
   - Patch #10: dtc: dt-check-style: Add warning for redundant white-spaces
- Several fixes based on Sashiko's report (I responded to these on the
  lists)
   - _walk_bodies(): Fix setting up proper parent to each node after
     exiting node parsing. This wasn't working correctly.
   - check_child_name_order(): Properly sort top-level nodes by names,
     even if it comes with unit address like memory@1000
   - Add rest of property_bucket sorting for top-level properties,
     even though no properties are expected there, except few vendor
     ones
   - check_continuation_alignment(): Improve error msg for
     continuned-lines alignment warnings

- Link to v1: https://patch.msgid.link/20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com

Few improvements and proper handling of top-level node (name, not unit
address sorting) and property (model before compatible) sorting.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (11):
      dtc: dt-check-style: Add missing /dts-v1/ to few test cases
      dtc: dt-check-style: Simplify setting depth of DtsLine
      dtc: dt-check-style: Handle root node in overlays
      dtc: dt-check-style: Handle sorting of top-level nodes and properties
      dtc: dt-check-style: Drop stray backslash before quote for continuation-alignment
      dtc: dt-check-style: Fix alignment of values in continued property lines
      dtc: dt-check-style: Consistently call 'kind' as 'file_type'
      dtc: dt-check-style: Introduce 'stricter' mode
      dtc: dt-check-style: Add test for trailing white-space in DTS
      dtc: dt-check-style: Add warning for redundant white-spaces
      MAINTAINERS: dt-bindings: Include dt-check-style in DT binding entry

 MAINTAINERS                                        |   2 +
 scripts/dtc/dt-check-style                         | 204 +++++++++++++++------
 .../dt-style-selftest/bad/dts-child-name-order.dts |   2 +
 .../dtc/dt-style-selftest/bad/dts-cont-align.dts   |  23 +++
 .../{good => bad}/dts-digit-node-order.dts         |  15 +-
 .../bad/dts-extend-node-child-name-order.dts       |   2 +
 .../bad/dts-extend-node-digit-node-order.dts       |   2 +
 .../dtc/dt-style-selftest/bad/dts-line-length.dts  |  21 +++
 .../dt-style-selftest/bad/dts-property-order.dts   |   5 +
 ...-property-order.dts => dts-property-order.dtso} |   8 +-
 .../bad/dts-redundant-ws-strict.dts                |  27 +++
 ...e-digit-node-order.dts => dts-redundant-ws.dts} |  30 ++-
 .../dtc/dt-style-selftest/bad/dts-trailing-ws.dts  |   8 +
 .../dtc/dt-style-selftest/bad/dts-unused-label.dts |  21 +++
 .../dtc/dt-style-selftest/bad/yaml-cont-align.yaml |   4 +-
 .../bad/yaml-redundant-ws-strict.yaml              |  29 +++
 .../dt-style-selftest/bad/yaml-redundant-ws.yaml   |  29 +++
 .../expected/dts-child-name-order.dts.txt          |   3 +-
 .../expected/dts-cont-align.dts.txt                |   8 +
 .../expected/dts-digit-node-order.dts.txt          |   2 +
 .../dts-extend-node-child-name-order.dts.txt       |   2 +-
 .../dts-extend-node-digit-node-order.dts.txt       |   2 +-
 .../expected/dts-line-length.dts.txt               |   2 +
 .../expected/dts-property-order.dts.txt            |  12 +-
 .../expected/dts-property-order.dtso.txt           |   8 +
 .../expected/dts-redundant-ws-strict.dts.txt       |  13 ++
 .../expected/dts-redundant-ws.dts.txt              |   9 +
 .../expected/dts-trailing-ws.dts.txt               |   2 +
 .../expected/dts-unused-label.dts.txt              |   2 +
 .../expected/yaml-cont-align.yaml.txt              |   3 +-
 .../expected/yaml-redundant-ws-strict.yaml.txt     |   5 +
 .../expected/yaml-redundant-ws.yaml.txt            |   3 +
 .../expected/yaml-value-ws-multiline.yaml.txt      |   1 +
 .../good/dts-child-name-order.dts                  |   2 +
 .../dtc/dt-style-selftest/good/dts-cont-align.dts  |  11 +-
 .../good/dts-digit-node-order.dts                  |   5 +-
 .../good/dts-extend-node-child-name-order.dts      |   2 +
 .../good/dts-extend-node-digit-node-order.dts      |   2 +
 .../dt-style-selftest/good/dts-property-order.dts  |   5 +
 scripts/dtc/dt-style-selftest/good/soc.dtsi        |   2 +
 .../{bad => good}/yaml-cont-align.yaml             |   8 +-
 41 files changed, 446 insertions(+), 100 deletions(-)
---
base-commit: 22fcd274139006af52af08b30822a9b01446fb66
change-id: 20260726-n-dts-style-checker-continued-b6a05e278891

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

