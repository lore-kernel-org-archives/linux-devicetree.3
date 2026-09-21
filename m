Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60367493652
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789991256; cv=none; b=dw9GGLXgDrwsY3oJjXo/VEUh4PJSUduB8fnQlEBLYUiX0xwnPslviZODzPssWW9CrofMLXckd+SwfEsFKEgb05SZgb2YQ8XNMREv7oxwOL4ISquHL4GXX2wHw52KZaybJAUuEeh+42S8j794qZyIgeDyJyOOeS6ka3UIRNObsHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789991256; c=relaxed/simple;
	bh=FKZnkT/6LB2Th70+qjrZbrmVKT9dWj/baCWJe9p7wEA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=US/bRNO/21jrnhecjoFldexWPJQO1Pyj1AwJKj11ewOlSTzssnQduClNyvOaca2bHS0IbQv1XfHC91dSQGzZ2u9QQowYbz0BFZ8roy8X2mGW4WzQ6C79HP6suylk3+BZ5hsFr7T5Djup5ucNtHUKRiHmUVDDg7uMjt/uKeP6bGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZDYvNnu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NDtakAFO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZDYvNnu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NDtakAFO"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAeC4G419389
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9G/xNH0WBdHhRjQpYd5zg0
	umwgL5UcUr18cx40REZ6M=; b=FZDYvNnu5Web1Cktr1mbFo+Y5Nbfoe+dqX3+Br
	IqsoTWH8x66fJYJZwK64piFCDxox8Orve9t7Qh/LKf0HbA5X26Nj81NTri96C/hQ
	yGqg9JziS2z5LHJLZaS1XGWAPJjGPdS7QAOoXKRVhG96LoYfx9baiTKDJtHArcBE
	a9NO2T2sQ6cMOOoXtmqGW0WsgKoVqdesLc2qv7y5AdFVCNXaprBp67tXA+UYh8y4
	IlOGwjjfx6zi5C33yVMUWygPSlsIDhP2WG58ZPi8Euw716QYKWUKuWGBMN8SMrlj
	1kAvcCs+cdGrCYBp0zxipWaHX76DRhJ1/mR6hDZjDNQH3K7Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtyxq92v0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:47:32 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7a8a773db4eso176473137.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 04:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789991248; x=1790596048; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9G/xNH0WBdHhRjQpYd5zg0umwgL5UcUr18cx40REZ6M=;
        b=NDtakAFOPVBc5kRpTh9AMbXbWjGanrz2LQBR9bAK24lq5TjCi9y3Fd4MDYeoZ9dj1E
         DtBrdoH4BoIjVuLXmEQvkx5Qz9kIAGHUZ4tmrcIqPOMEP7/lFCDTrir8WmFTZRDUl9Nx
         srTSTL12CB2kpRKDj9FAPZrXVwGqxSKyyC3r1ARBg/MyPNdfgpjWhP22MngOTplDITur
         Jnn1gNDP+ywDbiLX0JamevUMf4HQ9BuMW1aHeCMrScqmrJhMgK1lZECiHbzgqF3GEwB9
         jm2ZQf5OM0uOF+W/VJr2yuhOtK4yCWvcL/lpK6mtUZw2rQZUsOhDspYFaPkG1yT5eQex
         aDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789991248; x=1790596048;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9G/xNH0WBdHhRjQpYd5zg0umwgL5UcUr18cx40REZ6M=;
        b=UOEkKAuxMKd2b3eJMFoLHzF8ThlX9qffq7vZwJnCh+jz/wsBu1lE/fkXVWj/aclciu
         3HR1P1HSqRNmJR6HQd+7vojuPoUhBXqnVVp4gOEb01LfuLbCIIYI2pYO7qSwX0nB6CNq
         BVsWY6Ef9baHgYfgkzL96xcnFcPKZFF7TGzrs9p47+k1CI/uZ4jDR1tycRWbtrx8Tu2t
         tCzcroA15e1ICeOkAsIfEgiy6K06FOia68TYDEJeYqDTLow+eiuu5xxioa4HDxw9cowu
         AlKUOiooT+fbRXJJho2HKFgBoZ6qmQJTD4ZK3781wfvaL6jj/fQWemFsdaJ7Lp5KK+i+
         mE0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzLOHeBo0hw2yhxvVe2P3/QY+8y0sz73ru4WI9me7Ftb+HBUd1pC5tin5l1EjCGc92ZNqe47nNPQ2Ta@vger.kernel.org
X-Gm-Message-State: AFuF++mDbb6i/4bezdfOE0Ts9AUcwTiG2pNRPLmeoT6ps4ABMHdmZx1e
	iglm+JJFMpM5tkVFsdWT+8Bham01UbBFCrn6E3YvK4ugclGvn3cxS/ouNWozgR1ks2kdiX1oteu
	+c+8bDFv4SvvB1oQPhkjI9JAM65lUyXyVdOJdgA5tU/ZLCF4JzIJQkW/kXvxhzmlG
X-Gm-Gg: AYBFou2BsS1PWzL4p0l+jiyZ8fcPSz3sR9xu50us+EGOVw9DLJGPcKOFV1r47mU4wa0
	Yq9vt7glOl25SuqWaMeG4YS0oVAvdw6trF6YMHCKaR6HZaieE6TxtgS1kefz2M/d/z6/EjCxURh
	YhWn1UHimy3zpwSRRdjLjqdEOCwMedcOHw9/QHg9MUbuxHmv7hwvqAduRLQ+yJce0t+NR5/Jcdd
	GagDxhN159+fnsM58cn3PXxDBKjXzjnE644IB337/zDXPYViWXxoHaluJ2siBy9glo/QhVwWQ4j
	baOKki63nRgG3OvWEe3EuLUlv7g59UG3ONqtrn85PwJNk0K9SrPnT4QL283eN00nCK8MeubjERi
	wrjMQTtQwkIMX9iEx/gr/U5Qt6CU=
X-Received: by 2002:a05:6102:c94:b0:7a8:1817:278e with SMTP id ada2fe7eead31-7a818172947mr1089132137.20.1789991248455;
        Mon, 21 Sep 2026 04:47:28 -0700 (PDT)
X-Received: by 2002:a05:6102:c94:b0:7a8:1817:278e with SMTP id ada2fe7eead31-7a818172947mr1089124137.20.1789991248054;
        Mon, 21 Sep 2026 04:47:28 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd10273fsm227980625e9.7.2026.09.21.04.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:47:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 0/3] phy: qcom: Add USB PHY support for Nord SoC
Date: Mon, 21 Sep 2026 13:47:04 +0200
Message-Id: <20260921-nord-usb-phy-v3-0-68aa02b12b96@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADgZsWoC/1XMTQ6CMBCG4auQWTuktDj+rLyHYUFptU2EYkcaC
 eHuVhIXbiZ5J/meBdhGbxnOxQLRJs8+DDnUroDOtcPdoje5QQpJ4lTVOIRocGKNo5vRkDHqQJr
 0XkGejNHe/Hvjrk1u5/kV4rzpSX6/P4j+oSRRoOyONVVaK2HpEpjL59Q+utD3ZT7QrOv6AY9kl
 hWvAAAA
X-Change-ID: 20260914-nord-usb-phy-d6dd376b6b53
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1575;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=FKZnkT/6LB2Th70+qjrZbrmVKT9dWj/baCWJe9p7wEA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsRlDWhUGHRAqhG1meqNqd9RQPuJsD6U8l5ILD
 ZJV8krCG/2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarEZQwAKCRAFnS7L/zaE
 wyTQD/9wCbP5gEXybQD4QS4sHv0hhg5JzwkGAHogkWQViDex5NL1iYkLqsaVopozz4xi6vxzBW9
 D6GY+CnlLtoEhc6hnDqUnDLoshzJxJEAmNFSwJ22IsH7SdWyc3AAJarVQetRZhe8YoZa7IDHKMQ
 /x75q00E1Nhsmjz6yhpmSXgkT2FNncuuCDZ5f7ChflnlEBllHB/OYEQ21okAdUG5RrCjcANYf5k
 TIxRzZo0y6QhGtzX6iAycYDFSL/UtEoa96ZKsA7PAR2IuhUDwBzoqDshoFYezKz5XYnnUUD6u2+
 pINLFK7khleAxYGt4O+MBRKpRGZEVRqDZwd4qYvA3bENfg/0lNDUnGbgXHnkH3YsnYGR1m2ReX4
 07sgYMecvBYhbdh429AGVm4sLLX0O8D043Clr67ZzvWgArZ+Camd5gJgRJWXoTro3c0kne5atRK
 zlRChHV2yZ2WTMXNyEQJAbnU9OFpirvq3sqJ7gY18uERlJT2EbLv16PzjbgsaP856tEEVAnMd9w
 PA6HiVgeEnQ+OKkxrxHxZcpJZM5qvqBlJdSxFPBX+yF7lE8RWhcZl6pXqjuHRdL0q32xDVX67bs
 tIoD1EdnjowLk9AJJSqbKPRJTxmLee0uFP1dmhWIVsU/d/4nvu5s0nLHWLiXTkGiApK86jLncad
 MutyxCn3CPjanVA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 9ZYntkqbmnHlm22CPPIIS7p4AEQPM6Jh
X-Proofpoint-ORIG-GUID: 9ZYntkqbmnHlm22CPPIIS7p4AEQPM6Jh
X-Authority-Analysis: v=2.4 cv=OtraWC/t c=1 sm=1 tr=0 ts=6ab11954 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=fYuUhxZzbo174WpB_3cA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3MCBTYWx0ZWRfX4rWkU5pNxuoA
 eEcqU40IM368oPLbiikwxHvLdSdhnkg0iMt6kSHkpw+WlDDz8brUEGYB1f/g5S5FQ6A/Qt+uJg9
 ziOAk/ron5Wd57acQHtqzAVtQUpzfSX92WbDXVvB/Bc4u/NrmVJ/UT2pes07KcmCQjEphkCOj41
 Kv57rgJqGoiCh72LSwyOc9LBaCy0ZBpHYVxaOATwPao8g7gf01A38aaLu37bXQx9C/EARJgYFqL
 2Ru9b3U1u1l9aH2Ipq1MApB8pft+xKvcjL7eO1aoxyVbp/nIUUJVwdsl8n4Rtjk2KaqfTaL1ScT
 Z0eKD6dH2Tx4NivFcAWcmmkUNgB/3RLhaQvD6MQG4469fWuu3yfGT+/XIDFeQrNhgdpvOS7B/Ej
 862gyZtdN2cves3ZwBEtbkxnBzLZ9/s+2ceIByGZMSQMrZtBegRovijfUVbInhEYapNfDw3VlcS
 lS5pglqtxz8ZLt4O4/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3MCBTYWx0ZWRfX2ULW1UIPG+Kd
 zLixwgxkLeoNC4OqCCzctPrZ0jhEsiIL9pL9R+ft66iMLiL5CRagvN67ChrnlVZD8+R0j8qP7NT
 srHoGVo4+XrM6dzz4f0/QIaZY8PsB9w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210170

The series documents Nord in qcom,snps-eusb2-phy and
qcom,sc8280xp-qmp-usb43dp-phy bindings, updates qmp-combo PHY driver for
Nord SoC support.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- Limit the optionality of the resets property to nord alone
- Link to v2: https://patch.msgid.link/20260916-nord-usb-phy-v2-0-2c8461bb30e6@oss.qualcomm.com

Changes in v2:
- Rephrase the commit message in patch 1/4: drop any mentions of the
  driver implementation as it has no impact on the bindings. Clarify
  that usb20 PHY really does not have an external reset.
- Squash patches 1 and 2 for the optional reset change to make sense in
  the context of adding the nord compatible.
- Fix tx_tbl register values for Nord.
- Link to v1: https://lore.kernel.org/all/20260901095055.42229-1-shengchao.guo@oss.qualcomm.com/

---
Bartosz Golaszewski (3):
      dt-bindings: phy: qcom,snps-eusb2-phy: Document the Nord eUSB2 PHY
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Document the Nord QMP PHY
      phy: qcom: qmp-combo: Add USB3+DP PHY support for Nord

 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |  2 +
 .../bindings/phy/qcom,snps-eusb2-phy.yaml          | 13 +++-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 80 ++++++++++++++++++++++
 3 files changed, 94 insertions(+), 1 deletion(-)
---
base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
change-id: 20260914-nord-usb-phy-d6dd376b6b53

Best regards,
--  
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

