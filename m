Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702531;
	b=VcoXktd4/gy52cWb5OOSBXf4g4geuZ81JdR/dH4ipgF9TRB7D/nBlOa+ZmMxprLUm5BV
	 jexxTbt3Co7z1l1nnikvRau1wqdUWnmkRxV9DUpud+xfb/p0SOhuNaR4N/+mwK6lepH/+
	 srni/+2BPW1LlbojlZVUvQb7gSJ9KvIq8wNiJXjGGrhj6iXNHxJ0BMVLrD8/8PCRJHb1C
	 XCEJQLxnTgE0AF5JCmk8FR9ST1qclKMzXOrnCC3qftTGX6o+Yc8NBzVr7tZ4P/lKBGjhC
	 vZiqY6bB34cbd+/3tPQTBxx5m3w2HO0807wAR287OYNkEIN28wpPqoG0KJYRil8or7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702531;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=x/CuCdz51DtCsa+8aM9q+5VicLisxnVBRFM4WxNQsyE=;
	b=v/cQm2439A6L+7YTA8SN4O+fVOSTVfgbIhNTBXe4dItjQZ9qeafA0UFhHP68aRf/UkjV
	 RVTYswzTCrpzacZNlono75a9gkTXKrfRD9u6lzNop0Z/Ww6sDP9nMSzeULf+vXemfZJlV
	 3WYPSczOwDGckyXXde1asf+1GF9jq/fgnUkVWTuv/6Xi/wTfrYveN2zkTQY1lbrWdiuf5
	 QoizHcXbU/2HSa0CFYegbvtHv57YXNDdS9x61DDm7EwgnBVYBjluc8ucOJzCA5XB8pDWZ
	 sAJHRaLOtPFwgUvRtHyhBearBdG4BXiN5m40QfGjjzgQUeHZ4dxsP+Tn81CZ5f7VQmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="AV6/dlEO";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NxNTld0u;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FF3606BFB9
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 10:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36FF3606BFB9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AV6/dlEO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NxNTld0u
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAFoX1476126
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 10:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=x/CuCdz51DtCsa+8aM9q+5
	VicLisxnVBRFM4WxNQsyE=; b=AV6/dlEO9GCg9ImgE9J0nx3rV0DM69hvJsVVN6
	I7+U2t77v2+8Yvqfq+TEQ+Xdcp3eJA41Ge8aGG22E+K8Cl7CBuX2xbfmYHcgs0mc
	AbCGwIbbLM02VU8EeeW7/lS+C2AixkKvsDddRNk37Iynb/SnOVI8az2aaf2eC3Ks
	ivy2ZtBrElUem097jV+TgM+08iZmb8G2hm6CKW/Hdco9jBs2Xix83JB1VTECzNAI
	rXkpGnjMI6+gOvfThAhsOJT0VjCEkk9oMcH1Vg4fkzoxbaNTOcsLwi/abzmkRoj+
	eq/PzPzGvGhNTt4yBo8DbBTrGsafbrMx4dUa8IplrnzbBxfA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5hcd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 10:42:10 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eabedcf97fso688712e0c.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 02:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793702529; x=1794307329; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x/CuCdz51DtCsa+8aM9q+5VicLisxnVBRFM4WxNQsyE=;
        b=NxNTld0uLRrcw2jVpOcy5UYOlaewhUHEf/DBHP7zaTqBa6PqdZ64Bxo0cH0nDiiUb/
         u65hw2elC5+hc3ezstxgz+savTUNQri3qjI81vy4gMvGwGFqKog6k0iryXeqe20MYvKh
         YqeMP7xHnzvpXoLGsqOXedLLvGQd4NDVY3kCuCGZr2t5e7AlIQfRbmXtuGbdZFuibOCM
         dY1DqTq5zVvyzvtxG1P0xLLPMA643ueignkL0MrAfYtrNUAb0Muzw0do74hFnPIyMtDr
         /7AMvvlP7eWU+TC4ss3Bu4EVEP6uP+/EIXVpt0vr0jpxpDOfx/HaP1ikMR6+WHvBEP0o
         I2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702529; x=1794307329;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x/CuCdz51DtCsa+8aM9q+5VicLisxnVBRFM4WxNQsyE=;
        b=bcpyYdHS2mXnlWIgjLTKStvnpSPURv0OuK+2rUW0dMvqbxAW0Jnb5LwJNsKeIS3Xub
         NDEU+vdzhQlK6vzSgqxdSH1waslDpf7oIcFpJMPkIpObqS86etKTpL8BjnZ1hoxrSRgu
         PIryb3BklXioGLKU64x45x7iW2XC5mp656IeZW8rkYFHWFqrK/IzBGTYMX+fDOdWxr0A
         AIXEG52glPvVaj5b4rjdW4ZhZb3anY0UEs8LVC/9M5bIF6LpGSct4Ia6CHAPuIKIDVPy
         c6JDs3FX/mjdiUTTpKPqkMMmkv4Ybkg+JXTP0zAIbj8Fth6UD9aQLmzdsJJt7dfmTdaF
         MDkg==
X-Forwarded-Encrypted: i=1; AKwUvBwZG+jjQae1pRG84UTBGbKloyQ1stvVL+8t5RzXJMPmQXLMltHZxPLXXN2NtlHbGefq1j5Dxn2ZNrKD@vger.kernel.org
X-Gm-Message-State: APuU4Z8je8IGg0a+lL8Abhg7cuqrIWf7jVdKKdsB4eV2hVg8eB8vmQvJ
	P2Edo0BDxRIqTTVK9iGkFHsMCviWJtz/eCDkEI1dBKzQKp5hjgi+MX9a1q8Kb7cHA/NzbSrEqVN
	t8CZ8AkCLTXctWarijRnFyZ/ZI4GoMzm+ZtsarPsWZyZuZJ44uXxj4eIcsH2DU6sR
X-Gm-Gg: AYBFou00wc8sVmjdpT1XlDpp5Z3LP3YFC9/YygqlAtksYePaa3tzvKclEb+bmbUpYzt
	BcSMeJsDTLnURsgSF1ZzfFC6SmW5MG93c9skJ12endc3wZJ022iUJ3bnXMzwdeYrtcvYEHnxkv3
	g//Vj4FSUgUvvxEWUPGIRUYCebtTqYg4vEAZ1Gws22hB75K2xPFhFB13WkqoM36BMds/kOCsbqA
	SzLQ3n0qG5EeF0ODtM3hLIXZOnq0kELOXGhhddZOt03R199Z9IUNVCZxLVWm16sXz2UhNNkGfdp
	wZ0F650l1BNtqfZ8BB7dWe4bgVZa7S4q98Y+A9BOsTP/37Pyo+Xj7UCxlkZO00ha8mtbv97kKEB
	f457CfBDMhZuoCBZhlGMtct9tMn6Ljt7ixXzll5BJwQ4Y0XI4Lh9J9Sn0MStjAZLj4g9elXiq/I
	WY4g==
X-Received: by 2002:a05:6102:e0d:b0:7bd:b263:14c8 with SMTP id ada2fe7eead31-7d072784174mr3993096137.30.1793702526425;
        Tue, 03 Nov 2026 02:42:06 -0800 (PST)
X-Received: by 2002:a05:6102:e0d:b0:7bd:b263:14c8 with SMTP id ada2fe7eead31-7d072784174mr3993087137.30.1793702525834;
        Tue, 03 Nov 2026 02:42:05 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bae0f4sm21625057f8f.58.2026.11.03.02.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:42:04 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: sa8255p: add ethernet nodes
Date: Tue, 03 Nov 2026 11:41:58 +0100
Message-Id: <20261103-sa8255p-emac-dts-v2-0-05f9355df966@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAHa66WoC/22QzW6DMBCEXwX53EXexfwURVXfo8rBGCdYKph4A
 TWKePcaqNRDcllpVtpvZuch2AZnWdTJQwS7OHZ+iILeEmE6PVwtuDZqQZIKlETAuqI8H8H22kA
 7MbSNyQkVIZWFiGdjsBf3syO/zocO9jZH8nQsRaPZgvF976Y6WcpUQTC4nfaWWe+WdXI6HDPED
 KWiFEnKqiBA4M4O1xjOp9fZf3rm9Dbr742XxvHxGhRJ/9GnDsbuDgtWIKGR0hi6aKmkekHbXug
 cTz7c95IW3H/46yN77mPBCNWZasuyMvZdmyeoOK/r+gsUARkmegEAAA==
X-Change-ID: 20261022-sa8255p-emac-dts-dbc521421276
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2531;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZdaIaY+sd4qGxuq/WbkAkOLGBf/J2rZz+EkKC9nhEX4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6bp72I5JmVXxrE6f17TOQS8JP6VP3lTL1crqE
 GsxJ490vJGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaum6ewAKCRAFnS7L/zaE
 w1c9D/96XsH7XNBW7BcW1ZsIrpVb149F/gKcDNJQeoDxEWDym+A9MNZTuI54kLyu+fFSUiV88t9
 KYrLwFqk5PBLr9T56f2ZILS5v2bzJcP6iMf2mUfl/ZHBRqtTBw1ap6wtTGs13hSvQMzAEFR9ugS
 PzzVn3hz3bznQh68MQEM48lyZIC9zmS1HaiRBYhBM36CdMUQxbTT2jNYNuMgiq0e08KcETh7DWm
 5rmqn5tDobDHIdu35D+RTeFu/AQgmQR0hhqIb/HK7ts3+QX/4VL0ktphZGcsVFjbRsfrQnz0u/v
 +eUckZzMV/ro2iEp3Oz58X6VF4ID7xr29rryzQdtAMttyE4gOgPcrpKmY1901iAm8mIFIgI7Jjw
 ORcUmHi3L+NtvLAArpS9z9DieYzL45SbilKprATXjPV3L1Njlcm8iamFhOObno9XiKibjtC4Wzt
 3kD7VfsIQuGwCAAmC3RfB52981sQWfIuLBj77BgWHkD0eZaGxMDCLijbhZ2g6ZEUk0qVkrGUvha
 xdxyMRpNSv/+RMUfNu63ELkf9vMhEb4qGD7sQ1ZkFK7rFEZB8GnCIiiCXhKY7jUwLgZH2TZ4MDj
 3rKp7uk72nX6noX8P21Db4SPq4hBN6M0q3q/4Ys2w+JLiN+KcU6Lzc3/GIdVnzohb84lOraY0+4
 gW30q2TK/CofXsA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: _RqybxWoAuJ4eyi62zQkb-z9znSgk3sk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0MiBTYWx0ZWRfX6LOi4JPienf5
 ZZiJoGSvvIWk26uZ2mKNZg0lEp8LvL5ifGS/0JZscbdxGaIv8cOHrtDJYUWEN1rF+DVG6c/bgrS
 ndTy5x1VkPiSoi1ZQqZo0zaRtcPLcjo=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6ae9ba82 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=fPA-ziiZiZqd26ch_5EA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: _RqybxWoAuJ4eyi62zQkb-z9znSgk3sk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0MiBTYWx0ZWRfXzk07PQhSbdYw
 XmgaVmANbplJQSnGIASGjzsYA8Vh7VfMaMFRftxMYYMwvNEziR6FeOWwkAKdZL/+kflRsFHLKsZ
 3TaWNsUPEaPqyh3PthkisuAgFwPkhiR2He4AfBsP1RAtd3KtJ40WrFBaHPJApgN/U0xWoyxwnJj
 gw5k+hzw+pqGh2UzevKdS5eTTv9Rw+bjXWvFUIJ4ZTlXNH++UAh2UGpwQeJAXwK8ZNAUzc1yhZZ
 mKuAsMU42+LmGa7JSRVIx8wHiHklyQPh3+AIObAzE4t2CL7zKXfeb4fip0XfUl3N3Q0TMDC0c32
 Z7NDSQheitTAMOR5j/k3Dc6gsSNwv4DTu/HlYdeW/DWbJ8Q9wX+hdtecYQMgwL0+ro5/NkpKx4O
 USi+RKM7i/5PzCG3OpsZJNQO34dLegx3EB3VbBWntiLsp8C0Og2ve2R7GeX7QL6J3iLn7diN5ON
 U4+lKIO2D7CWULu2udQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030042

This series adds the ethernet nodes for the gearvm variant of lemans and
enables them on the ride development board.

The first patch is a fix to the iommu SID mask - it was wrong all along
but only triggered a crash with recent firmware. This should be queued
for v7.4 and backported to stable branches.

The second adds the ethernet nodes for the sa8255p SoC and enables them
for the Ride platform.

This series is rebased on top of v7.4-rc1 with the necessary EMAC
changes already upstream. It depends on the series adding base support
for sa8255p and the SGMII PHY series that's pending on the list but has
been positively reviewed. Links are in the b4 tracking part.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Fix node extension ordering
- Move hard-wired serdes phy references to the gearvm .dtsi
- Rebase on top of v7.4-rc1 and v3 of Shawn's series reworking the dts
  layout for lemans
- Adjust dt nodes for dropped power-domain-names property
- Drop patch 2/3 in favor of overwriting the compatible property for
  the sa8255p variant
- Link to v1: https://patch.msgid.link/20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com

---
Bartosz Golaszewski (2):
      arm64: dts: qcom: lemans: fix iommus SID mask for ethernet nodes
      arm64: dts: qcom: lemans-sa8255p: add ethernet nodes

 arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi      |  30 ++++
 arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts | 207 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             |   4 +-
 3 files changed, 239 insertions(+), 2 deletions(-)
---
base-commit: bc71431221f5ba8bb33918399552636e059c2c45
change-id: 20261022-sa8255p-emac-dts-dbc521421276
prerequisite-message-id: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
prerequisite-patch-id: dc952656b431f0bf8e2411ee14f50e7884cabfa1
prerequisite-patch-id: 27868f2a4c4ab6fcc455b250f3cda1cf1c7801c9
prerequisite-patch-id: cbdb11686213f2fd1c6542194976468ca9fe3ae6
prerequisite-patch-id: a7c4d89544f217b2cf75c5350b838d55a066fa1b
prerequisite-patch-id: 7391f02c4b57ae6afb088fae3150ea215bfa594c
prerequisite-patch-id: e6683111e3daed49ad3edd4ed960fb1c47959056
prerequisite-message-id: <20261103-sa8255p-eth-phy-v18-0-b00cc2fa0404@oss.qualcomm.com>
prerequisite-patch-id: 9d06b06a2f6c91c7d71b965b8c7fcb33d5e2bcdc
prerequisite-patch-id: 0a76ec6a2e4431d679f4918b3d469c9644dd660f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

