Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418310;
	b=4Sszx0X9mJBV+wOpEF1p5/giprbPuw0TYEIC+/qg16jwTX6gSNQp+bSAtgdMM7PPyQb0
	 Ekte98FXuiY9AH9FW2sHj2bDS7AnwISSyRzM6kJZOt/bvhoEzApBz+N/nGSX5Z7+denpE
	 rsMNn966iUSikb7/t4R8ichfNyL5ta96xBIPEq5khI/L7fitnoxYswp7z6/KS2rb8i1Q9
	 8S70BL2RCm3vP9JimnKqo83AW73l5aUVXCk2uWwU86Z1PMPhr0zavpDjRpMXI0dFHtB2u
	 P4m7lfUZ7NBSB85T2Drw6lYqT46LsR67RqPUpwUDwF41v7V2Zi8MWqNpaSc9HsDbVqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418310;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7zEfWD0gKNdLLpb4i4FbPNLheaURh0EVvm8kyMPPW3I=;
	b=k4wO/0BpA207rwJSej6T3tEV6EGEls1RLlMA9Fr+GO4FZHL4Z9x8M1JHwk3O1xUJwNmq
	 UcWtlYI5Wlx0SyYLTCAJeeRouF6aDmyaDUCo+l/x+NJlfUmWY5LGbLPhlyDVS37h26+qm
	 9cgk6WJQND0xLoLMJpTZnm6US4nePdStY5xOxOT/Jo2Mp86JZ2115BmdyGUmfPhoEfWaj
	 wDR7JS/nwQ7EIjUWGxZGEFCINeWNOmFBPO1xu8BI/lYzOCTvluuN2Deb9mGC/Ga/SD5tv
	 u81RIE726+IrjU1wZn6YXch866y9s9MGissxTrXqA2AZNYFtVV57vX+fIpUCZgN91OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GMpyGTuW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QwMPo4LU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB43606A897
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 17:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DB43606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GMpyGTuW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QwMPo4LU
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABFOxA2013057
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 17:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7zEfWD0gKNdLLpb4i4FbPNLheaURh0EVvm8kyMPPW3I=; b=GMpyGTuWfKCtD3FC
	JEHPmo0do8hTcM/kvQ4VrfQCxNC8/Evbu5HPHqpPp/nJOvRz/mNyNkhP0n++8e+o
	rqJPVMKqmENLTDAjyQeXUu+cfT4vGtZzvSk7SkJ3c9GTayUM7wGJXojLzv+yX6L+
	aZRNYSiEtLQcNgG1B4NV7gwyltqxkIKE+iSKXtYvBxOcg/UHx7RMWcmTwmzy8XdL
	ucFwb4k6ktd6g97twK+DrDQoJ7eFxHJzbO/mn9KEPRa8NViHldvt+8Z8wnR3Okjy
	o+RmpbvurHjyUENAPAtU/ZvCicwB2E2KQvkL1dX4glMP/YaKT9QAmc1OwCiSY8Ms
	OSRWQA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvtymrhq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 17:31:48 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdd48746a49so1942443a12.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 09:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794418307; x=1795023107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7zEfWD0gKNdLLpb4i4FbPNLheaURh0EVvm8kyMPPW3I=;
        b=QwMPo4LUwp6zNAaQGRIkZXrXl/eQLDj3QwXT54rDzoPc/UuHK1LibT92hwGSXkJH9Z
         3kFoCIos64uSJblZjlEv68mY7EIa0aHOE+wV2i9ROHSAxMGYtbOzBXu/b9grjcO+689M
         R6Y/8/mWfeBle6mUtq4ajl3tXpmV3XHAdk/D3Vz7sleg/+RwZ83DJIGYbYSKsXDHMlgs
         bc5b4V8tZzcQo3sA8EcD5GGN48+frUVtjqq55SFarg//TpY7unzLquSzknBDCdtFSiOJ
         HWFhRAQjWI6b3CYeMXwdRN011JxVsWwdS/DPYo4S1feQPwMFE2/Rg63K2V08B+p/BmZH
         WFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418307; x=1795023107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7zEfWD0gKNdLLpb4i4FbPNLheaURh0EVvm8kyMPPW3I=;
        b=kqkyH/kdCWhZ4cR8Don1OIVU+YmomUDHVOLLdSyQ8QvP+6rx8Q3KNUYWh2We+/PKZ7
         ay6lPHJEQZ1sID9sApJruOZj5pdgOTb7jND5qTqZNxVA4G754G+7JdlFV6xt5LiPQ0xY
         liJiTgg8z5Rh/mDuroApksAX9Pfkh98blA3qsAaAZ134evMZOIapjdAfH4DCY00UXztB
         /WrDRxcqy4s7rmlErhFrPv7fNL8W0qOHjrA5emYeGKi2qcVdbewRn01MEXpPAPvt4rfq
         ZG+i6RoTIwpsLbcrbzJxxbFD04gZOP7mURs64WR3/zJLpkmlRTatOA+d6Rk/9MYT5+Rd
         0zog==
X-Forwarded-Encrypted: i=1; AL+hErEUoNRl6WH/q/FBRtDvSX2h5hV0kqjPgU7P4xUdZei7/dF1xblA9xTAHoEM0wwmjnvEmH5YEbMsvlKN@vger.kernel.org
X-Gm-Message-State: APuU4Z/KfjnRav5TQJU1IsVX18IPVkXohBT1wmqh8vpNARGYlV7609yh
	CNpZQCWYhDCLJ1JqDy4VJ3nR4n5jxCnAy0fcRhpb8GYZj0T+flG+sLv1c76Nm9mXNco3XDBu0uU
	FyQAf7xZbWxfiqubKp+aJpp2BZ9EFJK1zbsm5jvmG1XOHkL5tZI1Yy+mdsXF8Frzj
X-Gm-Gg: AYBFou2Zwo/IEloNfU0xy99Xbv/3UmhLJ0wXExyqC0vp4nPiJZHKOyux5TlCxzNU9BZ
	EySbAMHWio3mdK6RJzlYG1O4D67zfRFUpq6+O02JtY9IJEt1ibM9sihPW94V81oqG7T+6XpwP/r
	DJW+fny7lEehMJ5fvoEQGUZVLeuez08Kn3hXVqUkXKoGfH6NBzmALyYZu8H1gTQp4Z9OmizpakD
	OrP4OMpwTpJCVwVsPu7FlLT0CAZAxSuAH3AI04ssmE0P+2uqFMB9NZeWOI2inWcZA1DGu/Kxhf/
	HaWG85x0J33SF/1O7TO4fpA+yBu/RqJ+5/RWDNsBfybr9g6kR4qRNjx+VMmeNLAQimyjn55K8cm
	cBQYtt+fsH6MXfA4SyUJsXItiUvu2Ccimz439BhruuvnxGQmW7n37mLypQPmytQ1k+0ti1M6MPW
	oEWf72t3r+l+T6wDvovNUd2rkz0iV78COsJ28t6h34Jw==
X-Received: by 2002:a17:90b:3c44:b0:3b0:a3eb:759d with SMTP id 98e67ed59e1d1-3b182efad9cmr2756597a91.10.1794418306979;
        Wed, 11 Nov 2026 09:31:46 -0800 (PST)
X-Received: by 2002:a17:90b:3c44:b0:3b0:a3eb:759d with SMTP id 98e67ed59e1d1-3b182efad9cmr2756575a91.10.1794418306531;
        Wed, 11 Nov 2026 09:31:46 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c42c11sm237305a91.2.2026.11.11.09.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:31:46 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 23:01:26 +0530
Subject: [PATCH 1/2] dt-bindings: phy: qcom,qusb2: Add support for remote
 endpoints
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
Message-Id: <20261111-shikra-qusb2-charger-det-v1-1-5a9d919c66b5@oss.qualcomm.com>
References: <20261111-shikra-qusb2-charger-det-v1-0-5a9d919c66b5@oss.qualcomm.com>
In-Reply-To: <20261111-shikra-qusb2-charger-det-v1-0-5a9d919c66b5@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794418296; l=2916;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=owFjultANOxmQtS34XQvZEam8JgpNAnt9Xs6zAWLZVM=;
 b=c3V0jWnq4UiJGGT2KZZQBL4VS3BaOfk2D7xD1gxg2+qfMsMVHw0jUUqQdD15HC+Z7Bno1LeCE
 J42X6d6Rf6pCafyo9wKvwqHm5nWiaXZFfmrh3ZQ51lGw/Ee+F9iyshV
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-GUID: OPOIJQWaddFhnnSuIDpZZtJug679Y98I
X-Proofpoint-ORIG-GUID: OPOIJQWaddFhnnSuIDpZZtJug679Y98I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2OSBTYWx0ZWRfX54BivrexhsVw
 OeM1Mii/HEvG+Zp+pwNWsc5Jq/kA0PlZr1a0KzuZLuoQ4FklTEZalPo9ucvn44XslCyJQYR6q6U
 8YQ5XqOHXiiYgHrzRNHoUsgAsdFc1qbGKZCE6bxoczztUzeLILpdxmUT/68UTW3Bb0RJXcJEOVB
 1jzJxwBReOgs173ZVLS23dR4IWXOmKcgC4iMG+3iEA2+wyW4mrWTtwEvtCha/QLbolJ7dYGimOz
 6tgHZ0Y/vkEFlh6k6IE9eR5hgwq+9or1QAdxzde75Y9fodlcVStpLigaryVL4AKkIejxh2uyvtd
 YWA4/e5ebw1zJ5eBodmtmC7pM9VOtLlxreU+A/PCLiVy6jzDW0SbqKWUSoqvOxgAlCKaGvWagPz
 /P7UGyvyNCCHJKkrlv/g48C+VJIrgjtSGM6w//keatMTaxmukQpm7HrH/KnceFfdbB8HZhlZtfx
 9pPR1M6WnoyBUeRH3Sw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2OSBTYWx0ZWRfX0WO8Gbi8TnSi
 L0ioa+a9QO8NHvEb4T3hh+mbewaQOIVw0bG+5oq3cn8KXB6xHec1sEGZdfV5bRn1US9jV5uq1IE
 grLw1X6wvO6Y5+RlOk7PhtJUj6yjQjA=
X-Authority-Analysis: v=2.4 cv=Q4BHcI2a c=1 sm=1 tr=0 ts=6af4a684 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VqWNwAWn-JPd5HJ3FDIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110069

QUSB2 Phy HW is capable of doing BC.1.2 charger detection. On most of the
platforms, the charger detection is done by PMIC. But on Shikra CQM/CQS
platforms, the PM4125 doesn't have ability to do charger detection and
that responsibility is delegated to QUSB2 Phy which acts on the DP/DM
lines in its control to get the job done.

During process of charger detection, if the controller is supposed to
enter device mode, the charger is detected as SDP/CDP/DCP. The controller
must enter device mode only if the detected charger is SDP/CDP. In case of
DCP, the phy can be turned off after detection. If the controller must
enter host mode, charger detection can be skipped and hence the phy must
know the role before the controller so that appropriate decision can be
taken whether the controller must enter device/host mode or not.

Intention of adding remote endpoints and usb-role-switch property binding
support is as follows:

a) The DP/DM lines do go through the phy to the controller i.e., the phy
exists between connector and controller. Hence adding remote endpoints
depicting the same.

b) Although the usb2 phy is not the entity doing role switching, it still
does need to decide which mode the controller must move into and hence
adding usb-role-switch property to allow role notifications from charger
to go to controller via phy.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 001fd0ccc985..0b6b2933dd98 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -159,6 +159,29 @@ properties:
     maximum: 3
     default: 0
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Those ports can be used with any connector/pmic node that is able to
+      provide role switch notifications for charger detection purposes.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Connector Data bus
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Controller data bus.
+
+  usb-role-switch:
+    description:
+      In the context of usb-phy, it denotes the capability to perform charger
+      detection. Although phy is not the one responsible for switching mode, it
+      is the one responsible to take a call on whether controller must switch
+      mode or not. In case of SDP/CDT, the phy would inform the controller to
+      switch to device and in case of DCP, role switch doesn't need to happen.
+
 required:
   - compatible
   - reg

-- 
2.34.1

