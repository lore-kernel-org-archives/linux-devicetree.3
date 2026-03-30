Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E608919C566
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774846274; cv=none; b=GUMu6DFe0TD6p+Fq4Umb9GmlQT5zk8AMZMKmZ0N6ZGwKdJvRhxLHth8Ka8M3fF+9uDkbMwBkJ7v2AO7fwIBR4C29xS0bT+WqKOW2ang5gP4Ggu2jxQw6pTI+Fn583GK13puW+FFSO2XZt3qGAz7YEF2ZgvgO9vHGnOCVFx/4nM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774846274; c=relaxed/simple;
	bh=IbMfSA/YZ81DtiE0UDc0yWJ9qnzluHNhmHfegFBS4zs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FuRWnQseEO8zK8I+r1hkTaOCWUuVK/Ac25r6JK1mioCQIs3g1I+DpTP4ebIKOEjcD5X47vgWaypSc4R3fE5ZPGwbx+OKuR/Lt+wA/tFfmKMktiGZuHFTLan56Npwf+xM/o/G4Jq2v/RlPKY3EiiTI2SH8V/COrAoIeszXzUm4e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O6s4M8Su; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gqf+FF7L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O6s4M8Su";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gqf+FF7L"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TNJKGb1427244
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vKmfxj9lYsf73NBF2dYNq9
	WOcQ5WGyYMLr/gxZDq6dY=; b=O6s4M8Sup13S8gIhCaoH/C2/1TYeLviSLa1jcA
	2E60BzrCfg4WYJ1Tn+Ayrg9R3EHbRbOr912o2Co8dFsJNaNqcs8Q+uz6E9KVPoS4
	Q3/JNEl3mmf1FjXnNumkX8Hbf/NZ41Rt3hjQHaTXJh3yVDc+3JZRndgs6WupMRiD
	OE8vyDR5VOJEOD9N//Vp8O54uDDQVs6wV0egEMpvVPLducUDvQwuaP3iOxBt6hdK
	PTCwsakGJsE7nfDqUlH7k6cwAXmWKaGURNV+i48QmxkBeUcc6i0unYTl+xZ1Vz6G
	QgYlbOncjewT8h59ZNltLGOSmDdf358FzEEzDIGIRyGqx2DA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67714e1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:51:11 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c38b85ca2so2781197b3a.3
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 21:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774846270; x=1775451070; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vKmfxj9lYsf73NBF2dYNq9WOcQ5WGyYMLr/gxZDq6dY=;
        b=Gqf+FF7LKf/s7TyEvolldCpHAzX+qltSfdqnRcp1dsAw+9EUFCtSZWPH6pdjLgFqF2
         1St156MBdVpSBJN3LukYOVx7KHaxPZhtLj7kXgi5rwxNxnpMr+JxwHxgrg1+EAkkJaV1
         BKn5iRsBTeDwBr81BdDXwq8Dkd+Dix01HihEogpLOba7xzFg3Y5B8w/hfONThchmd4h1
         V0p070Gk26mzmDc6/vn06ZkbsjLEWxxm4kmL/TKTYQoPS5z+qFI0LWeKrMEwT2prM3RE
         pUcq2+LJzSmsCwdnQqvpo/wQ7Hz5kK1dbD8mEzjmG7/5t0UGvi1oVCIVKvgC2n2+4bm5
         Lz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774846270; x=1775451070;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKmfxj9lYsf73NBF2dYNq9WOcQ5WGyYMLr/gxZDq6dY=;
        b=CNaw/malqSIKVcTisa5gE8953MjpyRwnU6xngk0bz9nPlKhzPJXDiNknIwlQwX1PUJ
         zuQhHZ9rn5arzwrAFtSy5pIRJ8pXFkZ23ap4yOqJ/9TYaEzyUksiQp0N7RHCHNRMPDsQ
         G85Ue8emsM5QHsYDQ9ua60GA1+zHgmc7TwIAofNdHZS0gZ8DMLHnDRw8KkIChwibCiI/
         0tN4eDStAbRs+VqZ+5TyybhVuvaMrmmMVG07sbpBu1qaE2m6baJ66hbsrK6t3zDjynyz
         pBgI/tLczLnVrYHk8Hpda7I3KbCudxuOVA1VQI6dksNJoh5c8ROALlf15MxaWOPJHzMG
         ltww==
X-Forwarded-Encrypted: i=1; AJvYcCWVWHY2hxkS8oIF5DfkwmDrJntF0eErx6uIcXUj/9WMrzf/sfrGpdwnMBNHRfxqfem+W661L6w/ROoV@vger.kernel.org
X-Gm-Message-State: AOJu0YycIEeQRNoiPE5SD66zK0PzSVyYq2PXwUvChn7gbYdpgOo/oXoY
	8XqRpIavhISKzT92BHimXTqGkjyO/x6+fUJwzC3H8Lfwkn+jcFeQ8no9cqi5zGjvMQg1ggcwHqZ
	F/dh8Y22tEpFyl/Mu4Op/4Pxok2xMe8zYjjYJm4HdjYiC4TXFgSjqCykCD1y8wGWo
X-Gm-Gg: ATEYQzzgWl6cA/SwYEBcYW3jqlTNt1/6RWomW36qqNA0MloDzk5Voy+zQoX2tWtF6Ib
	HsGp++G74J3yDtYtlRM7nnvKABpNJUHlanQuAG2SVqCU+H1Fgz3Hjq/9TZFwe1sDFcIgw1nftau
	YEpEvHykFdxAu3VzCHrpYrkZtQEqofUn1Zk4vfCyA8yaSIyrpd+nT6ZtxnNIvbo9bvXfK12r47p
	2iZRH98fVof4it8/W42tRO/LoZBsjpH8hxTbCQSBpFg2FvBJjVpFXVrc16aAeoFyEd4kjHmhTLq
	6QuewS/XaIu1FdJnPa5T8F3E0V82RozNnQ+8QaVQIctOhysAqhW9RZOy6ym8SzHxCJJ5ghLsqay
	PqmnMvbqWiq+WlZW25Z1/XXXyHpG2SAur+AuNyr+65qbaiXLHddwAqiifmsBI04KDkgpNfp5FLL
	uLffs7lOahV2uTah/XMVlrjI3Y6XRqXiazTGUh5EeXZ1gt0PnMF7smTHNv
X-Received: by 2002:a05:6a00:440d:b0:824:a22c:c6d7 with SMTP id d2e1a72fcca58-82c95d4fbddmr9946285b3a.18.1774846270487;
        Sun, 29 Mar 2026 21:51:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:440d:b0:824:a22c:c6d7 with SMTP id d2e1a72fcca58-82c95d4fbddmr9946259b3a.18.1774846269960;
        Sun, 29 Mar 2026 21:51:09 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843e1desm6776896b3a.4.2026.03.29.21.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 21:51:09 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Introduce TLMM driver for Qualcomm IPQ5210 SoC
Date: Mon, 30 Mar 2026 10:21:03 +0530
Message-Id: <20260330-ipq5210_tlmm-v4-0-b7c40c5429e5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADcBymkC/23M0QrCIBTG8VcJr3PoUbfVVe8REXO6Jsy56ZJi7
 N1zg6CimwP/A99vRkF7owM67mbkdTTBuD4F3+9Q3Vb9TWOjUiMgkBNGC2yGUQAl16mzFqsGgEp
 NiZACpcngdWMeG3e+pG5NmJx/bnqE9fuGym8oAiaYlqB4IZkSnJxcCNl4r7raWZulg1Yvsg8Dx
 I/BksEqLg9S5pI29R9jWZYXucp0DPMAAAA=
X-Change-ID: 20260317-ipq5210_tlmm-df221be105b5
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774846266; l=1865;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=IbMfSA/YZ81DtiE0UDc0yWJ9qnzluHNhmHfegFBS4zs=;
 b=2RUh6vn2ZqA4qRrimPbl2CIuEY8CQHZB/7Xvi1b1APO4Sy32LE4Q2ilNOIiEwNH2aioYkSdQ5
 ZF0DenxrzNgBkB2ZiTK6M+CSn1RXoe9bdKBPefH/o1/FEKbpgKEc1Vs
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: 021RWNrH7WbLa_3_YfAoK3RtAfGdCeaF
X-Authority-Analysis: v=2.4 cv=efYwvrEH c=1 sm=1 tr=0 ts=69ca013f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=4V7GHvCDef1FtlI4rEYA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 021RWNrH7WbLa_3_YfAoK3RtAfGdCeaF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAzNSBTYWx0ZWRfX/aw+3E/XafzH
 hQthi5epbvGd/CxB7wAESFuZwMMqqafc+O/q1xmfexVJbmIPty777PWsaPE/Riz/c5+y9SEANja
 WcIbhSnapdOfCYQd6zIkd91DwB1PWvVVXOPyKksfzYz2kWggdQRZjTDWHV1k/AAockMDM8D8Jag
 rDOBfYLivhCMT1tpwgOMwpimuqxWyZdTf9H0EqXJ+C2DT9Z1JQaJP/PooZjsQkK765ITxPa8JqB
 fliovLRzL/YiVUL7obmD44m8EgIiH6GOEv9aAzngBUED9LPb2kkURDKd2i118D+pWTst/AcC43k
 7HuBpdr0vWIhKIHGI51j4LAWVABpDEjgV+5Iq8Sdh5Nc+biU7feWW/Afz1k5js4+ORBw+mLtkf1
 x7gj4ihg3j3YApQqgSyaMf7P6n7DFGKz/lz9/ZJMjhYCgR50YPhY/DONQUv4Y7bpCr5Ct51UdQf
 69/F2/pv8D33E3BqUrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300035

The IPQ5210 is Qualcomm's SoC for Routers, Gateways and Access Points.
Add the pinctrl support for the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v4:
- Fixed the W=1 warning reported by kernel test robot
- Picked up the R-b tags
- Picked up the Krzysztof R-b tag which I dropped in V3 due to the
  changes in the function name, but it seems not necessary to drop it
  just for this update.
- Link to v3: https://patch.msgid.link/20260325-ipq5210_tlmm-v3-0-3a4b9bb6b1fc@oss.qualcomm.com

Changes in v3:
- Grouped the QUP SE pins instead of mentioning by function wise
- Splitted the PWM functions which I messed up in V2
- Audio primary and secondary mclk function names are expanded to avoid the
  confusion
- Dropped the R-b tags due to the above changes
- Link to v2: https://lore.kernel.org/r/20260318-ipq5210_tlmm-v2-0-182d47b3d540@oss.qualcomm.com

Changes in V2:
- Split the TLMM changes into separate series
- Picked up the R-b tags
- Grouped the led and pwm pins for better readability and usability
- Link to v1:
  https://lore.kernel.org/linux-arm-msm/20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com/

---
Kathiravan Thirumoorthy (2):
      dt-bindings: pinctrl: qcom: add IPQ5210 pinctrl
      pinctrl: qcom: Introduce IPQ5210 TLMM driver

 .../bindings/pinctrl/qcom,ipq5210-tlmm.yaml        | 123 +++
 drivers/pinctrl/qcom/Kconfig.msm                   |   8 +
 drivers/pinctrl/qcom/Makefile                      |   1 +
 drivers/pinctrl/qcom/pinctrl-ipq5210.c             | 898 +++++++++++++++++++++
 4 files changed, 1030 insertions(+)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260317-ipq5210_tlmm-df221be105b5

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

