Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C633E3542D4
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353234; cv=none; b=BMuCs0whsrcV3MrA0lAvUjS3Ue2uodzN5R/ahDzDcmg8QS1KiZNhgf033hsgi8xw76fVATmNclZR4zMEGLd/UsnpHB0v9SW3XA488MDObZWH+gwuOZSE+xJRrOn3gexiv3XTUQjdb9/GUsM9SKXWTqkEhNjPURkpnPo09ftLwMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353234; c=relaxed/simple;
	bh=7TggwEsxktStfDDAc17D3v6A3vYnoqhWhVUpysiHoQs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Nn/zqlJiRJennwT8mNIW9l9W7bMIJSpQdGuowO7CI1m/mSowM/y0JhpyLCYo4AUvk2LvVF53oSA93IIxdEoQK1GhcFt+kR1gWmA0KHyYVaqCFF+iQsLiRoJL77DB8Pne6jA5XTS8JRzgbn5MwjypsMSHFkqfiwkQXr5I+0CMpWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lSd46X6P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NV+XzQGX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lSd46X6P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NV+XzQGX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFHDl972549
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 15:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0LFJ/WWKTV32WaDCBr3/80
	YhYODwSM5Lis902NHNY/Y=; b=lSd46X6P4lsA0fFqh4GHrwK5yJP422oW70DMOM
	A+q/yAMbqzOsAixv62Zley4gTP6Dtqab9Sglpsx7N+zOkQTh8qdXN0ZnG+fWv8HK
	gtzkDdxdOxTQY30uKc61blxcOG8byCPtPU7rANpeHqHEkBvFxfmR9AzTEF88Xb8F
	pxcx41XOFxIK4XrrV8L7ja1AVrXIKKoSO9Z5CH/SCVYPjg9HVyUlOr8c6OjXszv3
	iqMUHdHHJYjOl4J6rWN6vobQU7cnTEwEULRWsyPcJa1E2XmwQnrJFfVkzbVKMZ+s
	DQRycAnntLdYeDRnYe/mTaMKPsyXYbAU32r/FGVJwKuhfYPA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r1jn0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 15:53:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e6a2f5995so530063985a.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783353231; x=1783958031; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0LFJ/WWKTV32WaDCBr3/80YhYODwSM5Lis902NHNY/Y=;
        b=NV+XzQGX1245NU/9Kwp57th7lzsJZPWuBCPTrD+XOwkiDKqqTMil/H6hiyCjA7LuUa
         TkWPh0+d4BkIzm+Wf3LzH1v6pP/2Ovp0Rmk2DR03yYc4vCDSLOF/EAAIDC6nrd61MhHa
         Hrbl6OPOTXGLdVzIJ+gZveb1SYv4VBSqkKVXW8dFqb2IacjwoLLE1tcNHJMGHIyhzwW6
         WIeb7fYJsxLrM3kXIEqbgeEXnzsAB+v+/qG9ZOdQ5TOaud4F5tbQ2g3BmgsiF9EK+jZp
         KoPLNadKaEwsayMOPRB2pXlGmuSuQi5PLNHT7onv+CtVV7NkLNkTivE+n/MTy2GDcEcb
         t5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353231; x=1783958031;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LFJ/WWKTV32WaDCBr3/80YhYODwSM5Lis902NHNY/Y=;
        b=PKUnySHeREQZVOeujhjyvwnlse0p6wKwKlEBbjn3Rl1p+R6QFuCQiU384lPPydCOS8
         GSyFlUT1THgOubFe3wnk9xSE08j3VgRbCgX5H6pqGdubn4MD+Up5GXjZ7zkA0R3MlZyu
         5zz52w2BwLoNRZNeHjcNvelhV+2vlYZPaDyrCESRFIZS1oaHub6N76cZbPivpvWIR8Zt
         uF29BjgHZ0l9+XsxJNJlhA6dIYNkbZXE+pdmmCqMwsZhkxa6mWFfXEd01tY40Um4k/yj
         ljaxXwtW9pcB56nW8BNmKQRGFvlVu4Sn2AFilRYQ2vFbjzXY21rr4XwunfxRS92JxepB
         7+Cg==
X-Gm-Message-State: AOJu0YxmXidWkbsITHzXAPu2dZm2B3rk0WSNcnwBY3wsOKFDCQ5w5ehm
	AvzpgPhRUDWJ1UaVEOh5Rve9ZmJTgTMZoFzGDwv/I9pW8XO8pVIP32tj5z3nxI10cJF5/dE3ZfC
	0Dmbe68VGTFIDgBnKw8M1X+v3s5yX9IWCGusA4asli/nuljqwpNX6pSZZ1LztAMrT
X-Gm-Gg: AfdE7cn3RWPgCdenvaR5xNL4CWfBaaBuXQVUefpuUPnmr95YHSrOBVXGbd2EooCFT2Z
	t2P/5A5HiW6tryidyfNANTr2QbHoP5qaA32hxVlaluKtG4SgBIyFXuqOsvBOyDoibYXJReQtyhA
	/ms99eIjcQcCU2is6xH/rIRIXWzE6gpH4XF/gCzc5SrCInSn0iqufzYeG++AYbz/vq1YhlLSC+m
	QJ+WrTCRIiLOV5aNiRx9aU/CnvJu8xYspAOAKkbU1OL6eK85ebP0sgRbsdZrG3rHjj7iJJDIqce
	fYYwdlodh/9t9w+ycWFNxQjYvZk8wc5XQ/j3Tq78kWpzA7enCq+qiRHcbL+KDrcdBPpZB0u0oD9
	KfupudwOc0rHKdfnvXEet13QuiwU0Rs+IXYM=
X-Received: by 2002:a05:620a:470a:b0:914:cb07:447e with SMTP id af79cd13be357-92ebb4b43b5mr168523585a.5.1783353231002;
        Mon, 06 Jul 2026 08:53:51 -0700 (PDT)
X-Received: by 2002:a05:620a:470a:b0:914:cb07:447e with SMTP id af79cd13be357-92ebb4b43b5mr168517885a.5.1783353230386;
        Mon, 06 Jul 2026 08:53:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm23174169f8f.31.2026.07.06.08.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:53:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 0/6] dtc: dt-check-style: Improvement after using on DTS
Date: Mon, 06 Jul 2026 17:53:39 +0200
Message-Id: <20260706-dts-style-checker-v3-0-03ffacff9226@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ6CQBAEv0Lm7CQLKmv8ivGAu42MGpSZxWgIf
 3dVjpVUV09kUIHRvphI8RSTe59hvSoodE1/BkvMTJWrauddzTEZW3rfwKFDuELZb11T7ny7KaO
 nvHsoWnn9mofjn208XRDSN7QYimHMZ2nR5vkDtEwNlIoAAAA=
X-Change-ID: 20260706-dts-style-checker-750a187f41d7
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Test User <test@example.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Golle <daniel@makrotopia.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2076;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7TggwEsxktStfDDAc17D3v6A3vYnoqhWhVUpysiHoQs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS8+GWO4nET/ZEia8M7jFM3AYpF9wN+X+eDrfq
 jaAMloBi52JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakvPhgAKCRDBN2bmhouD
 1//3EACW4YLkSl5zV13hC5be4+eeOM1F96b4vGPwUPYx5L0Bcs0KrM4eHhRYN+iQeCg2VqkZoy4
 8jHst/4LWAzJ/aHo+j6wGpkaTisJNLnNDc3Wipeoab7oxLCVh7DwuDDTWyCq+l6yEYI/IT/Atqw
 WWVJFWzUkoJZyol+zHsHjPoe5hwTFovZe/ClpaEtNernn4LAWelhwgZBSgOmOOPriJ9n4GcnnwO
 28yCLom6j1z8uM6HRAZ3iy5Rvll+LTw1w8znTmPyhMt8HOe49HaSypBJZKxyQ99IUM83Ecr15nM
 Cog7vDYV98k1bDXcpSyzaC/+Sngq2UnDO1g85PKQhHORHITnDLANnhc4Jq//vZn7CcoHZPOWntu
 NsGyZGaDie+XvoNJjy0GuQwK2w9273d5/dS4DeZX4Aurruf/CUjNQKTmDKagXosOiwONMlFRppb
 x/ATzW7ls7wMgVraPQjzsemzA0QVPJ/3syAUkM1ORIZq0k4KByRzcEkMKiAPPYsYH2B0+AQVISd
 G/mufpPhYpNO1c97cg3lCaly3Pmn1WMEciXs0tjn+fTJnYEFQgQfK9EGdgSqw04WYpf43rfAwIe
 EgbMFT2YuGHq5Gwl2mCw+e6TWlfmyYGu2jjYCb/Pa5wyTht1WcxesHDffdbOEvDCgvsEoE2F4Qp
 04p+DFUjRbZUFjA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfX9YZqU1KjvC8U
 6yLcqPVn7/POkcMCWruOVL4zZuqfsiRcnopDzzFs9CqY3Wylt5xN+DH+7uxDjTARBf9zzAOZ5x7
 2FpRKoV2V/r65IARgapbt4AVLzOcN9tQJJlePOXKfBQe9m0F2jEpRI2jPAz4/pPjBm3+aqSuPAx
 gSXxFPEqRG5UgflqZ0QBQyPV+2GOswUKoWfa0foMsaDIMZKaETlp29EOIj2ocb6DUFb4YwN28yR
 JJ4qXU5hyZxuA4Uui+FgKqndC0cecYNm2/n/F2sK5C36IpeNq/Pnbdl1Pj+2Cci0zYCN+r+P8IK
 IAtvU7ul8e+6qH+ZjxDppdBJxtLKAWMPjHRvlDn4hRj4LuNa3frKMNNo4QRlWbcNXYu6qyzbAxY
 86twWiFHmkFlkh45XqIBlFU6VCqsIhqgvs65XAXETZfHb1sksSBqugI7UU7fPjJ9/JDL57DZUzD
 6qZ0yC9SaSGL5knRNQA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfX8lITylj6+Rdn
 44aw1odDnfNiokuuvwUtLSl0RWrX+AC2lthjm9xuq7UogQUZSIy88eCPZ/jSWEiGa33c0mSjAvZ
 ZGVZiqDl8eIPH0oNElH+6aETrfFDgdM=
X-Proofpoint-GUID: ll94ecUAbblkpsnvKXLJNddrFWF3DNMK
X-Proofpoint-ORIG-GUID: ll94ecUAbblkpsnvKXLJNddrFWF3DNMK
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4bcf8f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9bHp3USohIU2017ynLYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060161

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
Krzysztof Kozlowski (6):
      dtc: dt-check-style: Narrow disallowing of tab in DTS only to YAML
      dtc: dt-check-style: Allow space-aligning indentation in DTS
      dtc: dt-check-style: Rework handling YAML/DTS in rules
      dtc: dt-check-style: Expect first device_type
      dtc: dt-check-style: Do not sort top-level nodes in DTS by unit address
      dtc: dt-check-style: Handle properly DTC-style includes

 .../devicetree/bindings/dts-coding-style.rst       | 15 ++--
 scripts/dtc/dt-check-style                         | 84 +++++++++++++---------
 .../dt-style-selftest/bad/dts-digit-node-order.dts | 40 +++++++++++
 .../dtc/dt-style-selftest/bad/dts-mixed-indent.dts | 20 ++++++
 .../dt-style-selftest/bad/dts-property-order.dts   | 36 ++++++++++
 .../bad/yaml-prop-order-device-type.yaml           | 31 ++++++++
 .../expected/dts-digit-node-order.dts.txt          |  2 +
 .../expected/dts-mixed-indent.dts.txt              |  8 +++
 .../expected/dts-property-order.dts.txt            |  5 ++
 .../expected/yaml-mixed-indent.yaml.txt            |  1 -
 .../expected/yaml-prop-order-device-type.yaml.txt  |  2 +
 scripts/dtc/dt-style-selftest/good/dts-dtc.dts     | 20 ++++++
 .../dt-style-selftest/good/dts-preprocessor.dts    | 20 ++++++
 scripts/dtc/dt-style-selftest/good/soc.dtsi        | 40 +++++++++++
 14 files changed, 284 insertions(+), 40 deletions(-)
---
base-commit: 3190fb5798e880161c46f2a623a354b23892dc36
change-id: 20260706-dts-style-checker-750a187f41d7

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

