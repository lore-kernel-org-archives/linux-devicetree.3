Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D9D285CB4
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783521653; cv=none; b=aS8N63BrCfIfi4nqeXsahCOwpR/IqfXeQZznLD2MbTo9wucpLjw50AtP+gZ8b2lRUEeETw4gebg64gikOsAGlZXqKRMnUlfW0G/s6SRFTDAChEI5XhqsxvQbc35MCXyJ6vjBaB54Cka1DFvj4riiWzgS2jpVCwaKfVlZJWWxKBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783521653; c=relaxed/simple;
	bh=to07ccKbxbfSYuNUsL4D6tx8thnxos+ozf3j6vyYDHY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gYUlJhfQ9631+MK08vJWperihgC2jEG0vhyYmBjBr1xMoZertdAYgp27mChrpR3bnp5CD0fLDNxMwlnliPQP/7MhtMuERYIUh8HxL3tfDAnvOKcrl/TI7bBJo0U9IBCPXvSMQfVSy8IrIl2wIEHa8CgFzXsyXSylrtyhgqdaRn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OBLV0qMI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aNqeG9Ad; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OBLV0qMI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aNqeG9Ad"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3mJ32715660
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 14:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RJmqr3esJLE/pvOEeexRMz
	80tiZuqnsE9PsPQlk3PXU=; b=OBLV0qMIiFn2fHieF42kZgEfOmUJ2VD61nhe40
	Dh7svOUM/SiD9usjybO+DVip80M5mdm9hQM9rRBrxR5v4LHMwf6ICmTf2OOldt99
	Rfzn+DvUURqwIzGf0FEKp/V3aM5BEbFGt9gY0fjXCQsN/81U84nEFouukpuFC+bl
	Oov1I4W575hpOmw5ld0jW6qUPdtzwJDojPI5gj63qqsAOqrwaXKmcIqff1vac9IF
	XP/VNyx34s/4lpP117SgR+YrlrvBCgqv0DVwaHmf/rVRPmm9h+OovmQnckarZGJJ
	zvBoCzUIHPPOcIIvS/X1HkMHsxBq3Ytdu+6TvoZuDZpRCIFw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd4ye6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 14:40:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a236220so7959861cf.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783521650; x=1784126450; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RJmqr3esJLE/pvOEeexRMz80tiZuqnsE9PsPQlk3PXU=;
        b=aNqeG9AdWAQB88d8BHsW4LXGBuV7JlPZFcm4EeSV2XKyF4Vx/vza5azsKeu3jqtpPu
         BP0weN+7Croj8wRO5gOJmXIeFFCJVntwrA/K3+eadZ1jzFugR/LYOlp4ua+s9KT9yi4f
         vQkY7T02B9fTe+JEiIOAj2XQE5YUbBvgZh4M987iiBt2gfedjNsAgRbkjO5qfsCdV0Nf
         UlEYoFABw01uSGS5FsHprOI1zdzVTARWv+3hcLqPZ9zWNZltz2ptQaiCo/gTY2PXGuIU
         QHS1QzwnJyXgMF55eUh5eGkSToOdQwe0xnZKz/BJMkyyqwb/4K31Qy58VS2DAiyfZmLf
         9xcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783521650; x=1784126450;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RJmqr3esJLE/pvOEeexRMz80tiZuqnsE9PsPQlk3PXU=;
        b=SHI28zFlyVQs7Zm0O5A3FQifyIFPW7I7HOQqqdOpYXXDnxsBVJt58qm322tVKEFY1p
         GUbeYQOOxPevTkD5WzmLNf5elPeRFGhgW9FG3g0RZiecnkYPz/MWhaTPZyMePVoY19SM
         gm4heSCX/Wg1b1auAJ6irhxc3oA/LZHgImoqeHbGVJLCD/tFg4VY/X5p4uiPZs/LQbRU
         Imv58SwXNqeux62vK97tJA647+wQFb2N3gTQlLTgY1SNgOmAoBuObL36xRNfj7N2XKF2
         iqw8cLalpMxLyMcgREjkPIBJcYAJbIKp16cea5+c8xrbZ5X6CyZhdK/dfE9gNhiqmc+A
         XfMg==
X-Gm-Message-State: AOJu0YwipD4tYFhrQ/myDO5zdS6n0WgzVtCOflKry/dd81unpy4v/90m
	7aBlnLULTmqDqAdjeh7QNCJJ2AFUOtKzY9dwMhZh11EdyAHC+9HatueQclOMC24DUsUSGAYYhcs
	VMDwqLreeX8vBfZhQgidYH5GmF7HEz1fX/NKNdFwgXvJVkzxq5SIcT/L1C4Tv7Jd7
X-Gm-Gg: AfdE7clRNW5XgY8cAMRgwtLCSGgQ9/XtSZf4TENZ5wcQE4XtqXtjdRMUqwretwa75Xu
	o0hI/BEX3oy02UI80OhV+bvJHYcXgvKr3lIoq+g1KTEcILWmcxSrXMjtaieyHvdQ3pU3/FSHDoa
	R3XQzlaYjrWEJ98edJ2ohuCVcjO92vTCtuqyMeK1CCPMNSSXV01I3O6W6yuitkuO3jZdxZLIM2M
	Ux9gjsaPxFjQgEnELCfvVdvFT2rTnPIsIMeCMPs4O8ZXurNnmN9uLZP3FELeu5W0/PWA7cr8vA+
	rHWqTq5EAuslbLUBy0Tc41a7/lDnF22zeD6VS5TFvaO8vfummx5uCltvlikDNjmSzMpz/aRNCKy
	L0w3i2fTqWn6+uNyD2YgbxXHsTv2iLSF2ntI=
X-Received: by 2002:a05:622a:1810:b0:516:e152:7a59 with SMTP id d75a77b69052e-51c8b3c6834mr30191631cf.42.1783521650456;
        Wed, 08 Jul 2026 07:40:50 -0700 (PDT)
X-Received: by 2002:a05:622a:1810:b0:516:e152:7a59 with SMTP id d75a77b69052e-51c8b3c6834mr30191181cf.42.1783521649855;
        Wed, 08 Jul 2026 07:40:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15da821c58sm52543766b.48.2026.07.08.07.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:40:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 0/7] dtc: dt-check-style: Improvement after using on DTS
Date: Wed, 08 Jul 2026 16:40:30 +0200
Message-Id: <20260708-dts-style-checker-v4-0-c175e6401150@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32OwQ6CMBBEf4X0bEkpSNWT/2E41LKVKlDptkRC+
 HcLmnjzMsmbzM7sTBCcASSnZCYORoPG9hGKXUJUI/sbUFNHJpzxkglW0tojRT+1QFUD6gGOij2
 T2UHoIqsFiXdPB9q8ts5L9WEM1zsovxZ9Ew6GEMf8L9YY9NZN2ydjvrr/RsecMspyraXS+sh5e
 baI6RBkq2zXpVFItSzLG23UKCjgAAAA
X-Change-ID: 20260706-dts-style-checker-750a187f41d7
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Test User <test@example.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Golle <daniel@makrotopia.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3538;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=to07ccKbxbfSYuNUsL4D6tx8thnxos+ozf3j6vyYDHY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqTmFi6j2w43vSUWgrN5rNrtogq25PE5PUyW9Tj
 2kS9qHrX4GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCak5hYgAKCRDBN2bmhouD
 18KxEACIUA5pssLEoUqtBVra6ZatX/2/QA1cEsmoeUnEJgCBLghY9LCxLvXjJCXG4Rv/XW5YpSP
 pvXNZM48np3YEr6Eu/qxaUFxeCmnd8tLBz1jxbJaOCFVx9JH9ZeywoOmVGifNK8yWLCfwkiLVGJ
 fZfNfif5j9T3mvvDGG6r9c8fLs7f0gNSBN13PrX7kXMRY7MXmjw3Bc/EaTtKjPuGBPGayJemPhT
 9Ja5MWG1WIaVsyoj1pEfL3qtlQcXyoiz8PPogfbkYbiau+6Q/CkP6SMvtzLMmQFB0DHWlD52HbP
 kEboJVZ6B8GfJ+7QvmYhCx+unbutSCf+MSprdGMlYBD99Oh/IL2NabWBjbSw1JR5j6MyFpCjRX4
 /tzc1AMgxNRrZodO0wF6JAV43xwCoScPr575BIUt2MSdvpt3qpHA0OCfUiArFClzTRhg6zzLsjJ
 yvcVqAeTUh54mvxJTWWWx+yrqrwqfG+iRbrarNuyAgvIzmemvFqKFTOg78U5uzN67i6CV+WQ0nJ
 W9jLayywg+guyVm1IaKthBqdPWIcyCsX8/gpIPKHbxquf5blub+ZI7+xHWruGvnVH2hIxJCHxXP
 zjrU2ORfGcWTgo9s2fSs0ZG7O+uMvbQ//712PtkVV3ErXmFrM2jsCJjfy7EjpzfVeSrKq3M4bd8
 f7hsicJ3iuiq7kQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0NCBTYWx0ZWRfXy0+fqAFSWA2Y
 +np8o472d6VXfRpX9yuh4REOBGZew5GK5mE1eyMicnEe/aUPcESOV6SpU8FzdSUDcHEzqr55fEa
 YigP2hnBK2KLayyWzziNKTPzTEL50MViHoC5NuKbAD4P0yYiVNnndwej3cZFdgzZd8HgczjrqWj
 lsjj3Ibna7fPlWACSK/vucXdcD61lb9NX8qFaLYvw8PC17HLBQtUu6sH69Mz/hx08NihvisynQ1
 ooW2llOaUtupShyDu5W1xPPOOriF6VYmfHpMHvITJQZjD6t55tEGg3BvoxN4IEXdOMtn5xEcr2x
 Til4O9TEXYy8EPgr6IuwDpeHZ0E3Tl/neqiskb/4fSVzm/Fm1I/eF4uzb8jz9BR5/bm2qPZOBfh
 89e53KgNt0hQ1ZoVQVj4f+qMlCAvq+y3iaqk6GqLnITkVDMS533cJx/ELYTdKVQDz/fWN3S73oa
 41TTJXcCniT55DDZECQ==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4e6173 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=VC7GPV3_BDevQFnqUKoA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 4sSms9ATQ_lHqKLA2nctDt5piOBYcQyv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0NCBTYWx0ZWRfX5Ub8HJOgtR2w
 njflq005IB0WnYP/ckWXHNLnERDi/g1lYmQzvMxuGX3lEbaemUuZuVxYCel+HavpZTiqmEExiLv
 qcaram4EeFK/553YGOtfXpBN7ci1ioE=
X-Proofpoint-GUID: 4sSms9ATQ_lHqKLA2nctDt5piOBYcQyv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080144

Changes in v4:
1. Drop patch:
   "dtc: dt-check-style: Do not sort top-level nodes in DTS by unit address"
   This needs more work.
2. Patch #1: Rename rule tab-in-dts to tab-in-yaml
3. Drop "memory@a0000000" in examples, because it messes with top-level
   sorting.  Use a "cpus" node to test node and device_type property ordering.
4. Add more test-cases: within existing commits and a new patch at the
   end:
   "dtc: dt-check-style: Add more DTS test cases"
5. Handle #include and /include/ without trailing space

Link to v3: https://patch.msgid.link/20260706-dts-style-checker-v3-0-03ffacff9226@oss.qualcomm.com

Changes in v3:
1. Patch #2: Use re.search
2. Patch #2: Add dts-mixed-indent.dts test case
3. Several new patches 3-7.
v2: https://lore.kernel.org/r/20260706102421.343639-4-krzysztof.kozlowski@oss.qualcomm.com/

Changes in v2:
1. Patch #2: Rework idea.
2. Adjust function doc/comment.
v1: https://lore.kernel.org/r/20260706071446.87669-2-krzysztof.kozlowski@oss.qualcomm.com/

(I was not using b4 for v1 and v2, so b4 diff might fail)

Best regards,
Krzysztof

---
Krzysztof Kozlowski (7):
      dtc: dt-check-style: Narrow disallowing of tab in DTS only to YAML
      dtc: dt-check-style: Allow space-aligning indentation in DTS
      dtc: dt-check-style: Rework handling YAML/DTS in rules
      dtc: dt-check-style: Expect first device_type
      dtc: dt-check-style: Handle properly DTC-style includes
      dtc: dt-check-style: Print proper line number of indentation detection place
      dtc: dt-check-style: Add more DTS test cases

 .../devicetree/bindings/dts-coding-style.rst       |  15 +--
 scripts/dtc/dt-check-style                         | 104 ++++++++++++---------
 .../dt-style-selftest/bad/dts-child-name-order.dts |  30 ++++++
 .../bad/dts-extend-node-child-name-order.dts       |  23 +++++
 .../bad/dts-extend-node-digit-node-order.dts       |  31 ++++++
 .../dtc/dt-style-selftest/bad/dts-mixed-indent.dts |  20 ++++
 .../dt-style-selftest/bad/dts-property-order.dts   |  43 +++++++++
 .../bad/yaml-prop-order-device-type.yaml           |  31 ++++++
 .../expected/dts-child-name-order.dts.txt          |   2 +
 .../dts-extend-node-child-name-order.dts.txt       |   2 +
 .../dts-extend-node-digit-node-order.dts.txt       |   2 +
 .../expected/dts-mixed-indent.dts.txt              |   8 ++
 .../expected/dts-property-order.dts.txt            |   6 ++
 .../dt-style-selftest/expected/dts-spaces.dts.txt  |   2 +-
 .../expected/yaml-indent-strict.yaml.txt           |   2 +-
 .../expected/yaml-mixed-indent.yaml.txt            |   3 +-
 .../expected/yaml-prop-order-device-type.yaml.txt  |   2 +
 .../dt-style-selftest/expected/yaml-tab.yaml.txt   |   2 +-
 .../good/dts-child-name-order.dts                  |  30 ++++++
 .../good/dts-digit-node-order.dts                  |  41 ++++++++
 scripts/dtc/dt-style-selftest/good/dts-dtc.dts     |  21 +++++
 .../good/dts-extend-node-child-name-order.dts      |  23 +++++
 .../good/dts-extend-node-digit-node-order.dts      |  31 ++++++
 .../dt-style-selftest/good/dts-preprocessor.dts    |  21 +++++
 .../dt-style-selftest/good/dts-property-order.dts  |  41 ++++++++
 scripts/dtc/dt-style-selftest/good/soc.dtsi        |  47 ++++++++++
 26 files changed, 526 insertions(+), 57 deletions(-)
---
base-commit: 37de3f626a5094b9f3af93bf4c93a6130f8a8b6d
change-id: 20260706-dts-style-checker-750a187f41d7

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

