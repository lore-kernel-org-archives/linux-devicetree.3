Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D66439185E
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 17:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784827955; cv=none; b=u39WZ92+58QleFj2AtXP22GVxc+dCa+yuQws1TTA3gMecL3gaXpWFfesApa+YKg5yCRc0BJoUQe35bgP6dV1Se7kIylD8L74fQOS9c8AdN5uC9Hlha29A5h2k3pPk9oLPK2YXzsJhF3kZIjEByBmJmcVeEDYBfyPWD4a0pqAbCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784827955; c=relaxed/simple;
	bh=7PjDYgzCGbqqLRFenpnkIZNEKNXhW0mgpo/OnGOnsmQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u7h9DIIOpAfPsfrBov5glqBrDJ3a3aO7TkA2/o6Y2kVFfHjy6j05ada4/TtQdGljMMGktMGpDZPaP7yk2vdlKI169PWhByQ5bFzbkuWzZoaaD3EFDf/i8NeQvceLQZ6zB/Z0evsgcmk/IFH+454NrnLSMh4YSW3eN5a8TWGDLfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=foRDqk4R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gx8/WRWz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="foRDqk4R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gx8/WRWz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NHW9Pi269683
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 17:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jeSDnodhkmS2IHhQ4xjSKE
	lKzfIFuPKovj25uA4Ziso=; b=foRDqk4R88mcGjhHnX3BS6OswENLCiivUMRUCq
	+1yh9mOGnSHaWpDCTU/AQ3sqr/HAtjqBDVmdZymr6ul2g1qZuA7rnroQfrHwiD2E
	7C6PnllDDIX2div8wUZjuggz4h4gNX774mn5u4EbHH7HUaAPMQoEGn5PcXCuNZje
	JPlV+cH8ZPggAgJg/rRaCvN/cK140tyX2/G/fFZ6QiOCrhpQRHgVHhV8AlIikWPB
	y6XacinrKOQJSR/g6k2ctdvTbxwxa1zY8xVDjQIDCd8OT/stdliFCPG4cVyLMERR
	DSUr6GGrs9IJS9jXyZztsMAVWsgKwfi0rDy9qwcQLc8aNm6w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqajr11r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 17:32:33 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so1671049a12.3
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784827953; x=1785432753; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jeSDnodhkmS2IHhQ4xjSKElKzfIFuPKovj25uA4Ziso=;
        b=Gx8/WRWz2ltdcN1GN/T2zKNlaU+dYx/CfG1edBCD6mUuRi1DqRg14nWsWBZGQsGgBl
         mg7+IsfMcuXIt2+Blk+ij5LQXUJVK4LsBwGr0LtgwAFBstifr4Q8qR45yZvuiMnR7Fas
         ToUos9QYjwGWqBXo30S2AYSAPgzf3vc9dtDjSzLuVmu40nFRvSft4U/vUtRjYc1q48ax
         35uPoCLGVfYMrWNKjtv+KZklE+da9upEGvWaueOm+VWQJfX43apgtVaLZackLrltoBRS
         y4CRyctLYBW7LlhUvooEOPDGAguse6KiDWe78f4ZAKWZXlJ/70HyPlMzNqwtFbHvGegp
         Dhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784827953; x=1785432753;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jeSDnodhkmS2IHhQ4xjSKElKzfIFuPKovj25uA4Ziso=;
        b=Ag58w1a2yAmohKtBQCJqoRYRM38m+TFCDiyhN8KMBsj6UaulrtUcfPpJ5SmOihBcAj
         ZnQzr8lxNQUKplq5zLAsmPT+4cJ1juj/jiR0YgJoiV4P0QNR9pq4aTMz/uLO/qyfYWNy
         m+ddr/exNkOGV/cQP3wESjnsNs1E8/ynxqiCvV9t37/Fp1lm3pAWxwouwMc3Wdg9BPCn
         TJoxY5RxCfgI0xhsnZKRsEEA/xeVuO5fdzkvfuOVhbWnF4eO+DuOM2BarebB2WLgPjkA
         nuq0qnmVwpJrFva9hh5a/ZSk9oPOjwDeqhZw8ytq9277qcrcyqgZ/0c63hsUe3KdwJS/
         bj8g==
X-Forwarded-Encrypted: i=1; AHgh+RrDiEDKs3AJI8gAAWxSAi/5K5jraOyh6lEeSquR83xNFovmoWbD2UolH4c/CK2k6EoBCBSVPNzr5fV4@vger.kernel.org
X-Gm-Message-State: AOJu0YxtqRHqrtVeWxdYMvs8gXx06bREWdjKQF1TbPPzVeaeXzfInYob
	DdsyPFaQPB37LX/rtFDQAyONEMmkkEKetG6gQz3NDmPQu2EdWPOKL8x7D7samlNgtmum+rInkM/
	/5W0m66MZgLTZobU4DisNLLzEOnLYgF9jHTE+5e+HFPWHLSkn4PQ+1LkWvQEDcamFv/FmzROf
X-Gm-Gg: AR+sD11s9vnQWIhfzUHoHZGKkxABFmvKOLmKa389IewWYG5WfM5xM/sFdVnH3kwaVzl
	V13HkvWBlEz9jn3ppEDO1UyV4k8X0UrnnOCuMty71Yui3koDyEGMb7F7AdtamuLB4cQLShuto6r
	NN7hUfzhY+/58XbYkslDpv7/DlhNDG4ALcLRqrwVZ3+JWPbJCc0fiwew9Mcl5G1gx9Os0zykh1T
	M1bj/sZk6U7kfpomJDh4IQOfc4WS66svBqTj0eeI16UJaHi3nz0hE7iUHhxJqiIeVW4Lk6STr/l
	qe9KIbmF3tCTeTDLKlnWCJYyp9IMe6/CnR0jRIf0GLcZySet63V7qottpwnPHMvmuevy/idOhQB
	tyl9QH073G5ddJp2d1z0Of7RSjIJJvx2seXJJZux3FHEzWLDFiEHWL9LKkFGRlelemoPmlA==
X-Received: by 2002:a05:6300:614e:b0:3c3:8651:b317 with SMTP id adf61e73a8af0-3c44afaac10mr4453001637.10.1784827953036;
        Thu, 23 Jul 2026 10:32:33 -0700 (PDT)
X-Received: by 2002:a05:6300:614e:b0:3c3:8651:b317 with SMTP id adf61e73a8af0-3c44afaac10mr4452962637.10.1784827952623;
        Thu, 23 Jul 2026 10:32:32 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm26466497eec.30.2026.07.23.10.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:32:31 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH 0/2] Fix usb controller properties on glymur
Date: Thu, 23 Jul 2026 23:02:24 +0530
Message-Id: <20260723-glymur-usb-fixes-v1-0-816357d5319c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAChQYmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyNj3fScytzSIt3S4iTdtMyK1GJd05REC6OUZEtjCyNzJaC2gqJUsAR
 QV3QshF9cmpSVmlwCMkepthYAKlVl5XQAAAA=
X-Change-ID: 20260723-glymur-usb-fixes-5da82dc93827
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784827948; l=780;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=7PjDYgzCGbqqLRFenpnkIZNEKNXhW0mgpo/OnGOnsmQ=;
 b=/pCxV1Alj6DJxLEoD0MtZH76ln5HkyhbPXnZOO/mV+tbmNYNCjYmdhuksRWiX8WCqMJGJ85N0
 BQ1unr4kEbJCYe7bpKtbzVetrtpdJkUMrGdNn3JVm8W97+g/X1RtOAI
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=6a625031 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=CMDM14fy31CpCENrng8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE3MCBTYWx0ZWRfX26KxWM07FMbv
 Z32eeCx9JhTXBLSb0NaV723OBe8QQeuKaXXAX0OxGce1LGKovq+dC/LGoCPuL9N2MKGhczbt0+9
 YJ1q0jwix6aLwpoPA6PwpyQcbfUl0bZ+HxgGCYDfk5StLclpXb8oZ+Mn16pUTCQKdz9RM+git1g
 3lVYyA4P34q20le6MGpoNOhtAXUp55VibDr/U8BF3j4qjwiOrgr0phGNI7W5+Li7PzcHfLP/UHY
 SIC2ap21z6AkFUn/6FRUqdXD0DnMOsJf9V+2pf4MZj1nPqAk6ygJqJCtVBAByFyKittI4MEUgh+
 mcLbrJt3ihO0+9w/fsjsrllo8cd+WI19NZ2KtnhKOUyXhhIJiNYf1vxYfmCG0U9TGe+VwNb3xyH
 DnrDJ4ePUL7Xi2vp0XbDdKtfMAYRHFaqmZfqPHf95D0xpBMMWYXDTNEHrIXKAoaJeukNHgi087D
 supu0D3omiQZWOw10BQ==
X-Proofpoint-GUID: isGn38vphCvtN-eggZSwYvW7mP2lO5sX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE3MCBTYWx0ZWRfX1XT5xa3Lo13s
 pUaZVtkewxJrGrhc0x/rcdKuy8oValcrrGeuu29EK2abS3rJNfVURIbGUXOqRrtP/tm/LdLXQzN
 ITgtZtI+uE8mV5mfNyfc9sGlp0BFbPE=
X-Proofpoint-ORIG-GUID: isGn38vphCvtN-eggZSwYvW7mP2lO5sX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230170

The Glymur usb-hs only controller is role-switch capable. Also all
controllers are wakeup capable. This series add these missing properties.

This series has only been compile tested.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Krishna Kurapati (2):
      arm64: dts: qcom: glymur: Fix properties of usb_hs node
      arm64: dts: qcom: glymur: Configure USB controllers are wakeup-capable

 arch/arm64/boot/dts/qcom/glymur-crd.dtsi |  2 ++
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 10 ++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)
---
base-commit: 9eebf259d5352b87080d67758f483583d9e763d7
change-id: 20260723-glymur-usb-fixes-5da82dc93827

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

