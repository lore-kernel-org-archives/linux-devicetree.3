Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48ED2F8EBC
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 03:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787629249; cv=none; b=iq++9fy7lsLDWzP7B61gVk7CejwMALOS2ChgXpA+aPIADZ1YpsUqCwQeNhla/+ElzD6DbmXwhlrDPLxLeV60xuuoZ7UPmLp8YIOjWbZUygdWCXRUoZ6yx+cLn8TCKh/i2qez4NEsdLykwJw+krGLrQyIFJEH490QAVjRm8kEQrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787629249; c=relaxed/simple;
	bh=YgWcPqpc0Tw7AwiZ7DA7bpWlNDJxbNEfk70+YLHN3IM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SPK3/DJDBUHpBBjKSkJHui2pGMsZkvSOH2Om3s32uH63hPtfRUN6pb5gRQcEs5lXbbUgxJEgExdeDyoqUgzRvFZ/BbpO1KzhK+/TKobS1I+kqyziOMrGbJh+YRUZFgVykmIWSz3NiAXBhe3ADilct9CiVDSb7eFVhoj2HbuaPNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LvIDGD7o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jqEoOK9T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LvIDGD7o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jqEoOK9T"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2l3HC1220262
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 03:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UKkMnWvHtEU3AJjdFVpOEvwgEQWljpY1f7+4AWt13UQ=; b=LvIDGD7oXM6BuZ+f
	QN+FzLo47JYwr//wpWzAWeh36y4cR+eRp/3KKp9r0U1mx5+dtrsBWflKQl3nDes1
	uFwtV+nPdzPFqFuj7nmap4HgoUrrJT2qJNEMiDycpwv8LK957sbZbpYuqK4IYAvF
	XPIOrqRHEtUAT0e+hGvrVziqEwTH2mET2aKV3Ii6v6QzBjEdbpo7OZ5K5r1vJ5Vf
	vM9KW3ZPr0YJYp5zSgtPRzCzvqC93Mw6ggInH6qjlrr2/kiCxv9Eo4WYKUpHAP9i
	gGTUdeMXnp9Igj56b1P9i1Ia00hZxnuruoI5OWAR7PHWek4RUtFIw+eNQdH7xEzn
	btEGHw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g92jqr4rs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 03:40:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce8a76df2dso76263295ad.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 20:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787629246; x=1788234046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UKkMnWvHtEU3AJjdFVpOEvwgEQWljpY1f7+4AWt13UQ=;
        b=jqEoOK9Te1V7rjXkMPDtNy7TMmXtykh0mKbyiKRDiM07A2xl0srtv1GyAi9pb/xpoz
         /6icF3iLRpwESupjLecoP1UNHIdO5DMSXUGC3PUJdWMuNdCoA9nehpM3sc46h4LkcVLP
         Rf2bzQTPI4Gh+Ekg+Hvc6gF/JecZkPlTuV6yQ7jYPSGNghq+Ddk1t7+w7uirqwBNJ7Ay
         COPSC6y9DEHcbk970eF/5kY6w4O5jSha7y9Tkr+GUE9zqxePZZEu+OwD2KNpAIxPiahI
         Ag0U0oMj0CkRXUBmEZdb4sc3YaTmTgEX/zJS20kKkkQDLsJM58H6OiUzbQZDEg9ruV4g
         PRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787629246; x=1788234046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKkMnWvHtEU3AJjdFVpOEvwgEQWljpY1f7+4AWt13UQ=;
        b=HbGQYPPmpT98ouYkNoP33rGqef/+S1cux42m2IMgp54Z2Ti0sMAqSTNwwQWXWF5hzR
         Vti3Aie/3qaiR5lIwBslJd31eITE5yixBBcXMFIUfFhNMW9aL2OrrJHhKW+BsaX8McWg
         9Bb9VC9UckyteztDgVAzScEzbhQqPx6Z4s1DtdOuw4TvKdizaHU9bXJxqiGuJOxTiDcj
         GLvN/zdTrsRCi8n+LqA74ws3GimOJT9vWlmqCqCPZzVM5ZMX6qugVA9npgB5hi/gSrcM
         3e86unfeGPzu+2mbM+GEvkGY3BHAvwtD9c2j3mPClSBTYBp6l/wR0xIj6abvbZUGeP5/
         Xzew==
X-Forwarded-Encrypted: i=1; AHgh+RqMWGbiv0pmUVGLrY0AhFjXgynG4z1UfBp66MrCDPzjJLEtzV2wPqhQEBSyBYWzTQVXTGM3IFBAArG2@vger.kernel.org
X-Gm-Message-State: AFuF++k5rwp64T4Lr0ZL+MI6LpHGeIZ6gy6C+k93BooBNso7SEkCjcwV
	F+RR8nxPWLDbZ6dioInI+jQ9KnP/uxP9CV5wS12FgoYdgGy8eafu93wuNipP4z2+qgCe9lyWvg3
	anLR5YUa+7ZLaboUa1ANt+I8ErZek10vyy/tJy/zx3jqdrMpITCB3mbWSKJiG+Bk9
X-Gm-Gg: AR+sD11wy5vNjlVEE+BUocjVQvtqJ4axtKuY7lwQENPpIQ5hshTVC6PgkNrvV0LOPX5
	mQ/Au7fO3YHmhbfnyrU1a3r8EQg5QmuZ5yfj/jZ4TCiQCwllcYdfSm9DDaBQQNg0s4uCkzL95QJ
	VbDhDHF53xpMbdxUG6AUSYQtLVG2fBi4QEGC70hHn/1ZD40vheR5+iCgjMFoa/3mQo3ZNKnOOwC
	OYqk7hX+8jTgyCxeE9e6AvnDSoJWz1q3C5tN7IAlXKiSy4bPkUsVr+p/X9pBZ94L/0WF2uEuSsd
	KqeNOLmtbwOOE32m49vc42n6ZgB3uHU67Du16TY5M5q2N8baLJF3X8vKSCqhOlnmt+VHjl96+Wd
	57mvWdEAGzu/JljowLhf1mmBo7LaMySgKGXw=
X-Received: by 2002:a17:902:e552:b0:2d1:1f73:3667 with SMTP id d9443c01a7336-2d64ae3b141mr463741015ad.1.1787629246471;
        Mon, 24 Aug 2026 20:40:46 -0700 (PDT)
X-Received: by 2002:a17:902:e552:b0:2d1:1f73:3667 with SMTP id d9443c01a7336-2d64ae3b141mr463740505ad.1.1787629246082;
        Mon, 24 Aug 2026 20:40:46 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d36f9sm46440083eec.16.2026.08.24.20.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 20:40:45 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 09:10:23 +0530
Subject: [PATCH 2/4] dt-bindings: pci: qcom: add Nord PCIe controller
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-nord-v1-2-7c02f2b8765a@oss.qualcomm.com>
References: <20260825-nord-v1-0-7c02f2b8765a@oss.qualcomm.com>
In-Reply-To: <20260825-nord-v1-0-7c02f2b8765a@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787629229; l=947;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=YgWcPqpc0Tw7AwiZ7DA7bpWlNDJxbNEfk70+YLHN3IM=;
 b=FgWOWKoZqFMIeDM9s3u2DQ1/HwQCn4fnPEBelR3iZCOLdX5yJicTe3SRleJLsI5RGWTaneI8p
 vd/fr2IeVxYDi0IwjPe0J4/+FLJ/omLcj9r2e4rNZuUidLXjPqGjkz8
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 9tp3d6Yop2eqplkxbLBtuoXUrHGsu3M0
X-Proofpoint-ORIG-GUID: 9tp3d6Yop2eqplkxbLBtuoXUrHGsu3M0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAyOCBTYWx0ZWRfX7qelNB+0xjwp
 dKjxh+XyShGU1hBja31f4vxbD2oWCLBWr5LE/RHMoA+dVgo6DyP1jVCaOJybIj4BToQ0TEKEpzx
 g4os0GYRD+nkgGbbVAysrQp0RD5nUe8ZuhOZSn70PGqC25ygRH5fjU8IN32e0PMykXz5m0kTN7/
 fUhCTcyY5pe7gw3GCHRBdroP5e8qFdrQ8ONMEMaDVgXVr6/spKJ+rYtcsT6RIDTHxrX4ECsHpFm
 vA0A1kBUQN6w7cY+QgDh/xaTlDW1ZMGkUaiUMZQ6iz4mKLIhzNblrSWjFfgAM1YSHOcVLocyhIW
 TOPIOe1I3zRGNwRiNH2GI2IQcOQ5YHiDMSj9KqTnNSoDKLZSMjL6G7v2HLTZpdvOXYOXa8CMAOL
 Mgg/A/nSTqpNCpSKY9mW/XahPWr+1wXvhGbYfQfV+tnjJJuUPsvuNso0vqPUtYvo55H2B45Ym3f
 ZZZEflbeN+m31aSVykQ==
X-Authority-Analysis: v=2.4 cv=JJULdcKb c=1 sm=1 tr=0 ts=6a8d0ebf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ly1VyIkaSgMpB_u5KqwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAyOCBTYWx0ZWRfX3WSYHfvb5clI
 sMiRhp9jOa10GQQAcxEU614nRRZajZIVSRpFPgb5JtRyZ9E2DUVz6By23JtZ43g4VY4l2k3io9D
 o3liDHk8GAqcqwa89/kR6AoaUYPIC4Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250028

Add the qcom,nord-pcie compatible string to the Qualcomm PCIe
controller binding.

The Nord PCIe controller is compatible with the SA8775P PCIe
controller implementation and reuses the same binding definition.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
index 63630a814f28..b8ba2c4449b7 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
@@ -20,6 +20,7 @@ properties:
       - const: qcom,pcie-sa8775p
       - items:
           - enum:
+              - qcom,nord-pcie
               - qcom,pcie-qcs8300
           - const: qcom,pcie-sa8775p
 

-- 
2.34.1

