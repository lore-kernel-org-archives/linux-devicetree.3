Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431222;
	b=dW2+zApxBvZXlgn6573Msa6iiNGhxkvbmQGJmOhpHrqEIQlaaVNQrDWQuUdPS+Od3vJc
	 fimovW1WN1gXgZ6o7Db2zRGRor/XjLA+E1QTpBiSkOsbjQiLeAJc/1XmgxNqYEc3XggyB
	 B1ulGkUiEMcT4WDGUJobAPfslj971i9UbNdF6uxjyDwXTu63N1yX96Dj53OpQ9c/LcJz9
	 WgNHijffyFOtvNpUTHPfY5QpCs2m5kWtDHbfR6L2rl4GbK/qXwC+MDh6+kZ32urTrnbG1
	 xXw6CyZzp3OMQm4Dkt8a1Iu8YWH3+ZijcbszZROcAAOOCXVHeMlqAChhKb53cGz0kCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431222;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xWWYM5hufS1mOg/9f/oIBWOsERbRGwhQB+M3hkQU4XE=;
	b=ZHd576YwHUFxQLVlTUiBNt4oroiqABJPB/1s846bS3YeelH7h2NrKAMsqQGhjyUxuwTA
	 YqCAAGcbjyJXxwenojMgnYpSMVqE4MSm6uEFpnBe7Dir9fCg3WzWSnGnl1GYyDNrdn4tc
	 7Eme0GLzhw8byIrNKuIuYzUsaVWh4pxmttSbo+abbRvU6p+QpycoVlQLNsY5YjX05MBqH
	 7Y1zRVLw8973YFMKCxoxYc8PvE/lGGTgD3U49ChzeDDWYO++4GDaPVLga1YPYWI3PuGEz
	 +YpQ0uiCT/2mkprT3f80VEyb9wVbEGaTzY2hx8Ts8/PzXBiLNz/ZH+ZN4eW5jwERCGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GLDhGM+G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dhx35+DQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B139606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B139606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GLDhGM+G;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dhx35+DQ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9FtGF2785551
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xWWYM5hufS1mOg/9f/oIBWOsERbRGwhQB+M3hkQU4XE=; b=GLDhGM+Gu8YdqAbv
	F0fXr/OprH0QQJSCflx/jY8SjE7/50uEBfu4VFmw9zY0Cewt5Hbp9eBFkB7eo+3F
	Og9m296OUHR+6NdIirtq0A7+kXhpxO+Wk2b91fw6xswhLDw0Pyt2cwcwY4dpDGD2
	58GwXVz3U63oJYPAaH/OIRJbCO2rSoLdk0YCww1cMpzy9+97jnjiODC99j7CMEdX
	76Pmys9aN8rhJ27vMaL51gaqwGtF5Bfr8siR6gUa77yhpivfEO+Aaou/Fqyt8gbP
	+b00gdOjIjGyh7ba9xN8i/+8/7G9lA/6qYuAuAOVA1/oa4Ln7yCCyBsSuqdNrrPW
	HWSCXw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd11pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:53:41 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so2716098b3a.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 02:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795431221; x=1796036021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xWWYM5hufS1mOg/9f/oIBWOsERbRGwhQB+M3hkQU4XE=;
        b=Dhx35+DQ84T/CUoxcxt2wmpc6/hYmG9scTK3XoXR0GG0riyGELZ4mAHqEKoeel/Y4V
         B5PmfTk3YvAIk5mtlROEMOKdwY7Hxz0Q0iNGJxj21bEVkCmbsc6n/g5NxQ7HHdkhkFSU
         aBZMq0f/MnOnrxTiNEIRYSwhuvSL3bZ8soiNoPSjwvKqiIbYt95Wq2qkdxCtSucHCtUl
         O5rUNmTiUY4y5hlgxTxrMXG+gTPJgz+gHsHKfasGsvjKGISpi02y36P+1qHZE71eXuiY
         mk1fC1b3pu4yplE2d9E/MQnCwwzdDtHmvX2qZGST/DbxzY2+FfJFn7+b0yYKAdx1+A/M
         dANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431221; x=1796036021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xWWYM5hufS1mOg/9f/oIBWOsERbRGwhQB+M3hkQU4XE=;
        b=rJZe/3R0kdLDpYO3/+zV6KKYXIReDKDpMLWzOUrPylTvG6t5xPRiJOJM5R83DBIkXK
         v2AEx8WlVSejwRd2yGXbeQcqabiUfhcjgFJL54Yz1LAMT50CUKJ2HuiUTIasMNIQ+Dmf
         LTbnBOLDiFzxwXVOE/SkvWUR1WDN5i6UUw5ds7Sk+ovOjxluEF3G7g9DuUsAZyUjy6i7
         0gqsnqpQwE1O8dwFiWr3iGxI0fxp88/HtIEmgWkOgnzAHVSHaC58BBWC/26TxnIRw4aQ
         8acfzdH3rYUCww02mO7lD2jGXFsprbvQE9V2+T/Ds21Ye8+sEglaWKckMlFx4RecGKFu
         wQgg==
X-Forwarded-Encrypted: i=1; AL+hErFHgXFqtSykNuuYAKR+H8BLpnEfXKHsZQhJfaPMdZ9H5DWdA0y2b68G9ycfAm/+NdgtQZDk0nwuS4iL@vger.kernel.org
X-Gm-Message-State: APuU4Z82qCKks+cgm+puC0vAr88LaD5vRDgqnq/su1OmndLP5kXNAY88
	gtwLiEbjJcMUMwtNILe16OxqsFwI4LFnk5Q0aybG66P5g8RktRFKViBp6JnYpxak2DrvZ//q9YU
	witJJa3cCtBbyKn/MkWV4HtqTz6mPa81KvSLBI867DnPUKMM6tTFQ4AtL79nyxZtW
X-Gm-Gg: AZFdTZc+oJYu1y/1o5SHROaBl2LjfvJbUPruyVGnrH9/u6c6NKmdeaIzEox4C02iNes
	DoPehnleQhmAcYIsgLhlnnPOs59smc3j6sgXmBsOxKh3txxd8bEO7o6Z1zZ1Su1RBTJugJ6D0hy
	qPDpucdF1VUXrrCJwOPQdneYdIyAR+JMiTerhyn5UQlgaV7YCROWJ3MR8yF4lR+TDUuSBdpzGXk
	6KnPZ3emf1wSd0gin3invrCSUIb8L8KOvCkwE1QomTpC1FWe2y/Vs5w6UkAvFIV72tevUyJTgOM
	hNGdTcG0pg1kPUKpeLKlrt52LhW2YLgFST9LQ4G85jG3CqwIKjVSz066V4e2IrSkOMfXcwbJEkO
	BLGX3V4MClW2SWQnn5BwdsH188cPt/SKbkHjdJNrTI5Q6BYt0vJP0fJNDZ6qqcVGMvXbIrAEI25
	QyRcOMs4+gGnE=
X-Received: by 2002:a05:6a00:2c94:b0:8a9:b07c:7715 with SMTP id d2e1a72fcca58-8c8792a497dmr9325318b3a.1.1795431220682;
        Mon, 23 Nov 2026 02:53:40 -0800 (PST)
X-Received: by 2002:a05:6a00:2c94:b0:8a9:b07c:7715 with SMTP id d2e1a72fcca58-8c8792a497dmr9325301b3a.1.1795431220221;
        Mon, 23 Nov 2026 02:53:40 -0800 (PST)
Received: from hu-gthawre-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e456a7sm5330863b3a.29.2026.11.23.02.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:53:39 -0800 (PST)
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:23:10 +0530
Subject: [PATCH v4 1/3] dt-bindings: arm: qcom: Add LeMans Draco EVK board
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
Message-Id: <20261123-lemans-draco-final-changes-bringup-v4-1-dbfc15cd0883@oss.qualcomm.com>
References: <20261123-lemans-draco-final-changes-bringup-v4-0-dbfc15cd0883@oss.qualcomm.com>
In-Reply-To: <20261123-lemans-draco-final-changes-bringup-v4-0-dbfc15cd0883@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795431208; l=1219;
 i=gopikishan.thawre@oss.qualcomm.com; s=20261019; h=from:subject:message-id;
 bh=J11m6SiF1xvvFn7gQOySTxQ2FArKpUmIzJhDjDucqOA=;
 b=v/JQPrZtMh9CPiRHeJ/1lQdAnsmbifrQ9YeQZwNf+toWfXHTY4kwDntqTOT1G6r7bgPxk7NcD
 d3fPqeQU97PBujMJEWvc36ZJ9U0LivjEAd6xOda/g4UFOD/p9YM+yeW
X-Developer-Key: i=gopikishan.thawre@oss.qualcomm.com; a=ed25519;
 pk=l7diN2ZWn/39T24vZixhPPrGDEUF6RKc19MsWZubM6s=
X-Proofpoint-ORIG-GUID: hD5xc3Rx4nKqK_c2e4vi_ht09UPjnzfT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MyBTYWx0ZWRfX3D5exWsxKygW
 yeJBSQq9zNvVC3Yd94zutAEM35tsYnWL1vchnl79uBtjvQWCwRGefj9MoNtNZHxuf69Cz/qGlue
 gCjHCewr22FO4ZcxwMgkXOjsHXMZNfeRfasUmQViykJObos8/lahdkX+xiba8gJSHdr3gaYeUzI
 H+xmhcztMxt3rUWLYa8m85FYSZ//zF6TgeBlTTXZ+a4XMXGbe/EO6cauZa0SKm3uXYyYrpeiqZO
 obmeip310YZukmwqAvRU2rI24xEgpjbLUj/GWcUw5XigHPwcyE6W1d0n0m0T92fmLQDHTNUa38g
 V4IdGO6wN1FbYf4AH/vARz1e9AM2ZQwQtlBkpSE1DAW3/pMfdQukktnBCHWO0HyYzm/lvu23WMn
 KCLYz8F9pIMyx/EHqa8L+iL1D9MQsmg/jbFkkjrdsWbKRkAqXtGhnnC3NNs3/bZjcgEczV2dAUf
 1wwif6S7g/UyFVIJ4sg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MyBTYWx0ZWRfX9+KlTYh04cUz
 Lb5s5BscRWi2P/b7fio7lWFDgIh5laoZIayDginDNGSk4P4q7e2z9Ly7bHq+8yPMEDfBNGGPPJL
 7EgVV+LMEuDBRsO+gEnDMpmghX1oeRo=
X-Proofpoint-GUID: hD5xc3Rx4nKqK_c2e4vi_ht09UPjnzfT
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b041b35 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=jgbjWhLY81TnJwHp3GQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230043

Add compatible strings for the LeMans Draco EVK, an evaluation board
based on the SA8775P/QCS9100 SoC family.

The platform uses a two-board design: the LeMans Draco SoM carrying
the SA8775P/QCS9100 SoC and core connectivity, paired with the Draco
carrier board providing application-specific peripherals.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7ffa4f69987f..3d63e797cf60 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -545,6 +545,13 @@ properties:
           - const: qcom,qcs9100
           - const: qcom,sa8775p
 
+      - items:
+          - enum:
+              - qcom,lemans-draco-evk
+          - const: qcom,lemans-draco-som
+          - const: qcom,qcs9100
+          - const: qcom,sa8775p
+
       - description: Qualcomm AR2 Gen1 platform
         items:
           - enum:

-- 
2.43.0

