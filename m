Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795363764;
	b=JtHuaFJQlrN4/WpcvkrLOBt0u7RNlWVwGnts47L2qVke6hgKAX1/yti4K9V8ej7MoFCI
	 mt/bB+wHdSSvHo9OhbySmbZLj9h14OAIKAuCbAdmEttMQppnS7obiDnLQBnsWocAE61IQ
	 hHvfue48BsSQVZXeik3tQe+Kfzn4U9Lgomey/zSi0uH8xp8ZRTCv/9R1iNZZzcUOlxpoq
	 T5pnn4KgaqoxD1EG0oUk/glNz8NTvOGqdox6oa080bri1UUdkO589sb5tqD6BKsBxkAH2
	 +QR+nPcTqIY0mu65elDkPt6iTkTY7n+wSc4FMZONfXfGaERxZBe2BnqVvcmx7zG2CdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795363764;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=H/uIhGC5ktRol+7sx9IjBt3hbLidfUuEYOqITaBP6p4=;
	b=WDPhVOnBXbIaxYxmcWWa9lX39R1lOEsfwBQS7kSErpAPrW4iu2wvaE2qV4r2QrOnw1eo
	 Iy97qGkCW5TdD5o9fQbrPDE9zxC9OOKMSEu7Y8FDxm4I5s50K+idVlrvVzBPyrpGrlhKg
	 rS0I8NTO0UaU8qrrpw/eseEchJijOldKea7kH2AfeqheUZuh3eRVc3Bq0dSPq9kpWZGqJ
	 BDeeFYFHJaDphLe1bXzMJuTBtKwTdCjUdBeNyvXNHhKxlam5HHylZdZw2nr8pbHkW57oV
	 K9CjqLUlPsmY2z0Ewwl3dPahO/n0FGWvXKNozd3WVnPk7Yzloitt3cBmPljqU/9VqcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mtAQdl0/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NeZptIc5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CF1606A32C
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5CF1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mtAQdl0/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NeZptIc5
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFRLpr555877
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=H/uIhGC5ktRol+7sx9IjBt3hbLidfUuEYOq
	ITaBP6p4=; b=mtAQdl0/VUmsTmBfCdsUiZlwtJktWhyrddSFvdoDARKMDsTNwg7
	1SmyLGMBNciWmtKHIeGNOeeL7ir2VLfswcIzeWnq2AUHdJY+pnkpSY/94BrU5QcB
	8z/Vy+qoCcJbX3P7yOc8cDdFZ5tgs6oyLFYEOtuooRiluGFbgzkNt5M76iLUw/FG
	8htUFfqpEWBHq0vSD/9fOQarjyjsezvEOVOk2Pc+CTZB0fGXKWbDOlhrsnUbXXI3
	cYNDz+ow+YeikSSxDtz/vgB2GJCBMXk8RZyQtVIaoZqC9wTGvLNjYWgh0YknlPbZ
	T6rUSEfzij8r6geVPJxujPz1eegQUn8YNHQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j310fc0xu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:09:22 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99077a0be0bso775927241.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795363762; x=1795968562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H/uIhGC5ktRol+7sx9IjBt3hbLidfUuEYOqITaBP6p4=;
        b=NeZptIc5x3Gdl7R1YrsUNR7gaLrT2n3hQn4XYyKfcx13nD0bdjM7nMhhEsa4CcNSOD
         HttxArABNmKyc5sP6/TrYrV5WjE5bYyqRVkyYvPb8FVDcqDUrFIdAOGeRkdsfIJbj6AO
         WSMCwrfNQYdLjbSWHtSVg1SVlLRR1m66yoTq2vKRcykj+TC8itUCRtu/lf2kdJur2Pi3
         EQtVh9YDmICA8F8DFg6cwsT+QmG17N6OwrU1kDcsP97GFszUeTWw6g0l38AsYbdmCJ9L
         WWLQcNATbUR7dG9B4lirQh4sf+ASZ4TzXXaAyCLfLGr80seWnEOS7Q5RnUJfcJNWoMUD
         V98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795363762; x=1795968562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H/uIhGC5ktRol+7sx9IjBt3hbLidfUuEYOqITaBP6p4=;
        b=notDPGoSQx7TlDX7l9ZpYvpfDTR871l7fL3QvMRZaoECKa5AxCFqidLVwFPKsZJ0bb
         pvDRdk6++nOGMA1mhQzG5DxWIThW6Fwofym6ouBa20HhK9r34CvA4doJnqJnIn499+6+
         NvvEAYYUOws+YIoSkfKhvU7o5/93HFPCTm9sdG6M0kWerjvB8eo3scAOrzwyRnq4I5Z1
         CpZcyKWWTFckXNChmHT7WAW6nK0TQ1xjVIEFSmcOCC+aXy9nw6W+ci16TUppFsPQ4n2A
         8xRm6kmcy6B1/sdST7CALN973G3WLL+8rxL5IRqabthpFRHe4ra1vzkIG2wdUs/ndorg
         Y0vA==
X-Forwarded-Encrypted: i=1; AL+hErFoX1hBsdCQHQsIGsz9syDwhn5cYs6h3VKL+yylo9fPmlaYd/hft6wQ7wbPFb72xgkB9dNaxrBtkzVm@vger.kernel.org
X-Gm-Message-State: APuU4Z9SHQY3OA/UJxXm8I0b6aUpPiRJxmRq3UMPtC7W52E9cb4yl6mp
	Ewp+EjyfHw1pkt03CGeKyIDpC2d7gUaLZ1CfO9aHX3aWJChxq2RUM6/wghlBALuJZesE0l/NFUL
	USbSHdIGgk8GSRr6clWbBe9sq7bAlc1PCyYYP7Ap2TAEnhSYi2UDZIRd/BxvSvRZbCfN8/JC2
X-Gm-Gg: AZFdTZcKF80QahRXo52P0vbBpfCTc+h6fN5w2ij4EQJONapySawMiGqSuMKK0qx+vZx
	PgdC/7YAJo3d8XstKiLb5Hd/3n/AWD4X9uxeZpCJpKhiNkLwsduoyQUGz53BfCVw9FkOuDdZtOt
	eqReDGhuazb6wGzfR48JBNE0Ra36O70HQJZ9U9q/j3YWkp4hQed4d+q+uCMuu15rovZEhz+hpNR
	X1sGbG/c1thNpvRxkgQFT4/6rga/sgtFRsKBDer5qjJWMTrKV8HbPKqdL7zobsw5wQ2XxH6rlbZ
	7EfyLMFh7He5xYwWa+iWOH60K/AnRo7ODk3BZmw7fX9hnrOSgrBFzVq2rXCHDNqngtcuPEIcNRW
	ssaMjhRh1YS8BpVDXiCPme1gmvfjwPl+I7ht4uK0398+LJOo7eJ+wNB1WsVCZHw==
X-Received: by 2002:a05:6122:d96:b0:5c8:46e3:ec57 with SMTP id 71dfb90a1353d-5ee8adf69a3mr4700272e0c.1.1795363761861;
        Sun, 22 Nov 2026 08:09:21 -0800 (PST)
X-Received: by 2002:a05:6122:d96:b0:5c8:46e3:ec57 with SMTP id 71dfb90a1353d-5ee8adf69a3mr4700265e0c.1.1795363761433;
        Sun, 22 Nov 2026 08:09:21 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm320526755e9.6.2026.11.22.08.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:09:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Hauke Mehrtens <hauke@hauke-m.de>, Andrew Lunn <andrew@lunn.ch>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
        =?UTF-8?q?Jens=20Emil=20Schulz=20=C3=98stergaard?= <jensemil.schulzostergaard@microchip.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
        Landen Chao <Landen.Chao@mediatek.com>,
        DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
        Daniel Golle <daniel@makrotopia.org>, Marek Vasut <marex@denx.de>,
        John Crispin <john@phrozen.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH net-next 1/2] dt-bindings: net: dsa: nxp,sja1105: Properly apply ports up to 11th port
Date: Sun, 22 Nov 2026 17:09:08 +0100
Message-ID: <20261122160907.200727-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1186; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=k0dJnwwVOMUlPc+I5R+F03eCmWOTtijHmMPA/BB2GhY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrAxOju/4Z86N0mMZw+6sMiO3a7sqHSvn4onpHC
 tSJ0snI4fGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawMTowAKCRDBN2bmhouD
 12p5D/4xaQ/IqdB5b/zXL7JJOMdwpoOJvhCY5xO3BhYDj2VfkgaUsxoy2xYJmK30cmwXITVYD4r
 kvQ2E8lPZVSNbkquqmYyv1bWwufE0xZj+5gPZr1phRuJyyactBViEXTcJDcagSilgixm/PTF+u7
 z5y1S6qnTXywKiLuIQliVhMXJuBnHjNxqLe4mLuljad0siZklmDDulm8ia9LjSm+zmKXfJd36RV
 dutmfs5njSG1lRa/cSDh3xk2Rz9U1SNO045QHN70NfTgRT7qpXKTDYns+QvbrZmkF3qg2llRcw/
 wE/p/M24NbKFYpFCqVEDtz9JgoId3ADhL/pR1JRovVXsb0JQAtpwS4E0cnkKbKC3xCVOTJnzjlP
 qq8lb0t6g9QAkFLlbNjd1gU4o/f0gtTYuAgGO8LmT3oxxldhJwO7WeryuFoHONCFAMf6X+j2ooQ
 IUAYKNRsI3DHDl7un82Eo13QGV7OSjGroEWz04mzkajrj0Jhqt50VnGuVynmaLPlNs7lM2AbZvR
 b7i9+JQSwFl2bDlHFZ8LNYXGgKjm3hkUYhhpEv2uEq8wCfoD1RS1Z2vNl7dIaY8dyhnJLWyH265
 WS5FNaYYHg8yyxtirYCjADcL0ofnaweqCxmiu3Tr1P43bVhROoiAxR76amWY7rPkK5g5roH2N4s j6WjETiSGU4vMzw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXzDtuzEuJ8bNy
 wCzpluDIOqFHONW1X5cNYDC5nEoxSN9q5pkZwrS9YypIaw5k4u4TPl1IXzK3RqeK2SI5TNNSQq8
 hyTyga5PnXYuXcwphI+H3aH6Fzc9f1YjTE6G9YjgFej+P4TWFyQZr9BpDRy29HI0KIDyDZ17v7G
 MGAihANrL1rDWFTcmanVQSo2TfPruHYHN6LHOHgxXo4yOd2lWO17ojxRXowKQhl5f2KBzzsKCnZ
 J8Sfk1iKCjZMPhMeddUlLLNRZUx5XPOh1Ypehi5RdsiIBOdKBeRZTEr9Vkr5foFR0AVI+hMOltB
 XTE8lrj4b0v//TEzZSuyX5P1E7p4C5s504E3Bihz6IR6N5Ter08VGB3wsZrHO8gD+duLlgsYP+8
 NrVEK4SRazfmHwbEfqP5McseUYVCtziXMavabXeHPttQ4sCWoDXuNRxxUA5bQFGN5wrxNG3ZwdB
 uPuNFwzCY+uQCnKzePQ==
X-Proofpoint-ORIG-GUID: DKTOM5FEmjniJYaRrgFzlNhAFisZZS9Y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX6gGjTlekBKIW
 LdYQJsA5XX3ybUxvhfoKV2GFmFbLWQWODMyxP+7i1GF6T/62WUVeMSnz04AIceJVPWwybgWzK+v
 wonfKfokeoI7HU86a2DeTf7DsjVLv8w=
X-Proofpoint-GUID: DKTOM5FEmjniJYaRrgFzlNhAFisZZS9Y
X-Authority-Analysis: v=2.4 cv=UN1Ijyfy c=1 sm=1 tr=0 ts=6b0313b2 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=1gOBQcDwdZx5nJ0sStIA:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

nxp,sja1110 devices have up to 11 ports in DTS (highest port@a), so the
pattern was missing applying schema to the last one.  Fix this by
dropping the unit address from the pattern completely and adding proper
constrain on the 'reg' property, so child nodes beyond port@a will be
properly flagged as incorrect.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml b/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
index 0486489114cd..e9b53820cc36 100644
--- a/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
@@ -89,7 +89,12 @@ patternProperties:
   "^(ethernet-)?ports$":
     additionalProperties: true
     patternProperties:
-      "^(ethernet-)?port@[0-9]$":
+      "^(ethernet-)?port@":
+        type: object
+        properties:
+          reg:
+            maximum: 10
+
         allOf:
           - if:
               properties:
-- 
2.53.0

