Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7441C3E022A
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180439; cv=none; b=Itlu7nYsOMSq+g2cHG/CULPsqZHz/FHKe4LzzvtBddJVGZYQup7rNQODNoUsONcUEilyRzuOB6XhMqxBTqXAw/pMz1Wt3qJrT/QiDpGBuSB4eNIIozDJiV8q8obVbaRbaHILgceII1jvfp7tdxOP8McAGK+YLeZEh7OiYG3BpRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180439; c=relaxed/simple;
	bh=QIwfsEFy/PkegK5poQuZTixC+HSGKgN5Fy/Unu/RWDA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Xew3eOTDaDk+z5LjDdp/dfmO6jDkxRZfnrTg7+qnV5anRMda79Az7v8WtSn/fx43gqAv9uCUWwd7afdTOGdNyoXSSzRbC0PU6V17mGIsbgNdvnuZ7Ph/8y0zAfjikOHY4havElAvvUmFwwJWsmtx8LO03VSJnnmZmoItyp3nwPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NCl54PNd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IGhg7dht; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NCl54PNd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IGhg7dht"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J85Yrn1146700
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YTzof/GAHtd/VEBd5A2iXv
	0++GjULzEE4n+pqgtZOto=; b=NCl54PNdhqQv2q7JAxq+j3hrZigRCXa7iMsPVS
	cRAmHIajB4PzSruM6psz0v7gBiJj2thwkq7Ztk77MImHmrnUFHrBjDCU5SBOh1y3
	topEx1oAIxLLTL8k/yyV20m+gd8HZ5nnrcZVwpzycB1MMgLZsUO6lmFSi8lF2WHO
	2SFQzoKWqGTOibuVX165uDcV0D2pMiPfG9GFDzKDgVgZ6j8TFZrLk8JzjKJyfpl2
	FoTIUna0GITFh9Z1aiyXKLGP6bxLl6VHo+L8xOFHuGQ1tKou7OqwBG4e9aAR3zpG
	rmWtQdZs0DpFnqVviHART/o7z+Q0M1gAoTVH29/74enH9F3A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8e7ehjga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:47:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fa6c3a77cso1885079b3a.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 01:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779180437; x=1779785237; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YTzof/GAHtd/VEBd5A2iXv0++GjULzEE4n+pqgtZOto=;
        b=IGhg7dht+2Ikc0jFOiubfXYn2+DXhs35fpfkHjJ2A1hf1TVO9ZZT7JHWUxRQotGgTD
         Pb/ovQH+0kr86k7htMSDpiasx03AQjyQPL+xt5NBVO66Y4TLXInQchTlb70U41jpSCtu
         vuPx2Dif4MREUscU+1fo6A7NltGzv7mK2LVMaGXSdpWAKc6/NgQfFtjV6KJqKVOAgMI/
         yMbsvmSplGv4GzjRpv/TbaVMZq0u5/+NoZp0U1tFpzK85OjqmKsUGkc04TbwzBkdXLPU
         QDOtCrFuP8Vd28azvntdDbJrHNJJeAXOi0EMOEaRFtkKCGEXiUEFkm2xBKx18vFZSpiO
         N0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180437; x=1779785237;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTzof/GAHtd/VEBd5A2iXv0++GjULzEE4n+pqgtZOto=;
        b=WLcgtOrifIXj9CXKYDPyC9RoBhx20rE68g5UjyHFkU7WXDh5k273uCBbP+jPwjEWFO
         jwLkq1052GerWzJa4cr7tkLUsDCPUnsA4uTgeknDtXHXm/0Wn1YWciEDuAb7BoJjXYx6
         npOVujSDeXNdJx5RlyW1T7L2+wz3jG/KQ7+iJQQXwkpt2+RXIoPJHAnkLBieWSw0mEtc
         MRQMy9ZJFbpSoFxFZeez+s4Sswq8ebKvv7e2C3IZRxhfwDagLEnjs5F2ugrMvMhkLr6O
         dT+1kc3UiH1/7BYld73JmvN+3ME7iIMoaFSxmV2oky87LhFHThFKZ5pht+nSbdC+kpqC
         FlhQ==
X-Forwarded-Encrypted: i=1; AFNElJ9xQ6nMsZbe6qWN1nhzwBR76j4N1Vga2ZTIdRXBp2yk/C7gaIRWJyZ+I2l2NMFxGh5hOpAn59bnveDS@vger.kernel.org
X-Gm-Message-State: AOJu0YyDvCPjSKorsrjpw2vhb6sdPs0W2cZJZ5CxR232fxMWctjDNzJp
	JCuGMpbX+E2C4nCOj1wZMg1JSd42RgGWxIZecc2Ifu0/2LchhNUFPBN0p1mcZxsZk0ElIPqm9iz
	BqfMSY8kokoycTQN9ObCFUEIrjUg4yzNSkXc6r+hQO0ALDTujz4Nl6o7F9c5x5/pD
X-Gm-Gg: Acq92OGBKUZq6xd6Ug88i0BOsBfdTqSZAJ7sVscrCHpLmm5aY04Jb0F4BXkFZv4HFgh
	Lk9mboEjaH3RsGbd3tp40hz7OI+XOv7WKx5BdnbCGzotL2qLzEx18OIFUEFeADW8hczfOaD1HPm
	rYdLmETbUmGI1FkoxYkUC3JiTUvjjkn9+LUFhQjBBFJshcz6f5md8nqsTswdvtlAqVo7RWV7pjh
	aQkWTm3nnPrgmBI3xf2iLIPVd0TkZqX1X6lPiOxbitWIncP2ioK5zLzhI5nKzZWPVkpUCX6/8vN
	p8l1UxBoPpbelnLaENs2vraOaZVii0fevc0sANUhhyPXK1iz9t7hDY2LAJZitPwonxGWWOEQ5wB
	MoH+X0Pun6HBZ3GuMeRPG1e/Hb8QgwpficPV06o6DVE+pujqwRalUVslavP2nLrR/3eF5AMGHAK
	ZaN4yQckw3/LHCtqoEnnPh5N4hZ1SqVQgHSiwp/629js7Wy+DNojrTOPLGZdevoAA0v00=
X-Received: by 2002:a05:6a00:1808:b0:838:af72:fb37 with SMTP id d2e1a72fcca58-83f33ba71b2mr18162200b3a.7.1779180437049;
        Tue, 19 May 2026 01:47:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:1808:b0:838:af72:fb37 with SMTP id d2e1a72fcca58-83f33ba71b2mr18162177b3a.7.1779180436563;
        Tue, 19 May 2026 01:47:16 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5b1f5sm17434104b3a.31.2026.05.19.01.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:47:16 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/3] Enable icc-clk support for Qualcomm IPQ9650
Date: Tue, 19 May 2026 14:17:04 +0530
Message-Id: <20260519-ipq9650_icc-v1-0-4d3554c94257@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIkjDGoC/yXMTQ5AMBBA4avIrDUZTYm6iohUDcbCT4tIxN0Vy
 2/x3gWeHJOHIrrA0cGe5ykgiSOwg5l6EtwGg0SZYZpowcuqsxRrtlZorWSOCpVpOwjF4qjj87u
 V1W+/NyPZ7V3AfT/0WdkGbwAAAA==
X-Change-ID: 20260519-ipq9650_icc-994280404adf
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779180431; l=914;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=QIwfsEFy/PkegK5poQuZTixC+HSGKgN5Fy/Unu/RWDA=;
 b=R2EEDUaXovgm3VTGTrroPHraEl9Kvny7YPrOQvtoj3JTq4MWXcgpQaljwAbgW86YJUec8JgpA
 h/3k491oWX6AFc7cBfJMj9pxBLrJm8G+E/Pj9BKJSsDuWpQXmuq5yyY
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=Rt316imK c=1 sm=1 tr=0 ts=6a0c2395 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=AmmTUv6NKEHWZ0q6wX4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: h6QNR4VZ8cQRjI-3tShn5b0F562k1Z6H
X-Proofpoint-GUID: h6QNR4VZ8cQRjI-3tShn5b0F562k1Z6H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA4NiBTYWx0ZWRfX8xpBJtxvCcdT
 f/2UeVS46yaVFmjpcnqy5u/m0q1bBdq04TPU4TZfZ0RQ+/rVJ7Z+HfaOTa5KbO8U+LK+K4dLimF
 HeXhkQ8zrwpfBDtVJKruCUc+IMUUqwh1Ammfz9gzRkvEDSQLCE4jdfb1kUqhNVGYS/ZnQuXGkaX
 O6GTnXDiAXSIqVzXGD3dwxKL2lRo3efFwGQ3cHux4e3byR5w/Meubf5awTC98qZU2jYiXnDCXww
 vFJAZRwlYKIWTMwjqR+U4QGH5vpSwYgqrpJfi/a1C1Uj4qgB2oRWbtJYihi6C4UG/O6pCasaXy2
 uskxfJsbtg67Od2Df8Xr1uKNsgQhRGtXvdEp/ckHfD3W1k5ttssrQD9FJvBec7SuKvaGzSLmEUM
 sdZMAC/AUDhyr5XEuXoOAInav+ygwDLJ9tH5M8tyanbG15imvvY8MvOXu5TdlMul7r/c1KsWsn/
 hzVgLNCVYLM7NTYPi/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190086

Add the master and slave interconnect IDs for the PCIe and USB
peripherals and enable them in the GCC driver for the peripheral
enablement.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (3):
      dt-bindings: interconnect: Add Qualcomm IPQ9650 support
      clk: qcom: ipq9650: Use icc-clk for enabling NoC related clocks
      arm64: dts: qcom: ipq9650: add interconnect-cells to GCC node

 arch/arm64/boot/dts/qcom/ipq9650.dtsi           |  1 +
 drivers/clk/qcom/gcc-ipq9650.c                  | 22 +++++++++++++++++++
 include/dt-bindings/interconnect/qcom,ipq9650.h | 28 +++++++++++++++++++++++++
 3 files changed, 51 insertions(+)
---
base-commit: 80dd246accce631c328ea43294e53b2b2dd2aa32
change-id: 20260519-ipq9650_icc-994280404adf

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

