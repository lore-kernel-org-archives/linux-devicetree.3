Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C6C3F4DDD
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886635; cv=none; b=gbiLDUjj4/LCk6uXgzohISqq39FZz4tJvzFBWbI2+n7d5WAsLh6VnfqJqisLRmodsK5eNm/xi5tyv8LB9LNo08LPmPPCTywPHg0IH+oZAvoc4XHvNiQpBsVkIdEjoOkqmnbeeTryPqP7JKZUG1U/myuiEQqCUDN3p7tWskNOR1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886635; c=relaxed/simple;
	bh=HS/qHG1ys4GAFjcZw/lOrmC9aaejOkm0n6MjuWUf29o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WaZHLOapqb7IC3uiJCEfrUNHlpbOMi/R8kBeiLs0CZ3BK6UXRnB46iqvnwjbxoBeBhAea3q7zIsfs1UUv8HozgeIglCkA+NFZCdXFAWaJp+NCqRyUYsPSG4UElU12N54MmREhtaCnxDiBjyxvUrfyODMK7Hyfs1p/Lf/0G3BVKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QdNU+glv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jJrFzNZ8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QdNU+glv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jJrFzNZ8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D9ZL9V3476315
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y0VtVTcJUFOCOxMQYqvfCfN50bwMzVe/VZPBcATXvjo=; b=QdNU+glvOPWrDDKx
	+HBbn2L6k8rhNlLZ0fDLzBJm/fa7i442UXidbGoa4KU1NY0pge15mGAJREC/XpYD
	KcdeNPtVYdqtsNjx4ff5OenbITDLqSj9EJSy4EaQl9S3XO/iiKhXv/hT6CBr0SqI
	8FLM5asPh6dDewCE8Kv8SNDUrWTxWHy/AXljjyhl61rWklemn8SzfDFk0Q2q1JxR
	LiZbWr4COXaWu77dJl8oswCT1eRQJn7Mdfcum/iVspd19SbspP73G7Y2Ig06HYg6
	/ARVNozs5eLefKzV7yWC4wzZoxb6lW2Fp/GxfaVWpbLSuN6mX3L0YmDNm+W2by7P
	JM1Nyw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9d7j9g2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:17:12 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd3b9e70fa4so2619990a12.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 03:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791886632; x=1792491432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y0VtVTcJUFOCOxMQYqvfCfN50bwMzVe/VZPBcATXvjo=;
        b=jJrFzNZ8jcSmi1DQTV86X2Vof6CZGjMus2ga8fSAyojBqc1InOBEgtvaIAh6IrquIo
         kBMoFluvk4EhY9xX/IYLuIskn4RIiWNI/bS4dWFYpy27P7VFGvruFa0xUAll8Vy5HBsy
         1TpGEZg+zRbqiLXCibs6s6QT3hOnW1AmI8niPvNqKc/q6QVPLBKpQQiFR8KFpv/PMjf3
         Uy8LL/Kyn60wlqhzWliG5Ekh2YRJOGWBSjiEcK/xiIwwdan5C4vKIZydbb5FRE/mQfvO
         tLkgeszktPWWXKV3+f1KR7aLMfCETyx0sW1E5aflVPYCyWNC+UhcCxdUHtT19gabe6zN
         12bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886632; x=1792491432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y0VtVTcJUFOCOxMQYqvfCfN50bwMzVe/VZPBcATXvjo=;
        b=Q2XepvMMfSnbSZt/tJS6+0gYxtSld5nrnguS+Mvwg8/LHqtfi9sZP2I0LPlbelwJRc
         mPg7SHRWWf/doNKwTkN9iJ4nlJAQEsthdxqyvTkqx/iYWG2zIRuiMt2khIlevP31vMH2
         dFuTIxm45Hq0IFl2b6h7Ma5Dgqn+NPcD8Mcw4nzNdNWzlCjdh1LXb7o+483Ou1BnmJAW
         OYbMOmBFA75q3p1hfHBe1kR1g80aFnYgF7lvXPKv6NrEu/LZyVdo+ZNJrBTgs6Qy6NjJ
         ftdBxYVD8bzk1QCeSQgDckoenrARzCCW2zPOTIu8m2lkMA18alypj/ojQi6exy6bDTG5
         V+rg==
X-Forwarded-Encrypted: i=1; AKwUvBziJXNry1cVOv9wCAgi1QsyFcw8fY7J+Fn99eV7BshPGnPRPen00s7SABh97ChMSpDllJHHxI8w3C+9@vger.kernel.org
X-Gm-Message-State: AFq9FYK2lY0XZ+gQy9yRBDgssjba/47FnQIllD5FC7ySDsR99kX8SbvC
	f1UC8EHiT/1NChEUvlP+0028GOvG27Vx3/3n/1k5bxVAYS2lu9q9EjVXWkPO4tR+Ds2pxj3l4L2
	qCmh3l+BmDThiLtQYTC/tN60f/ML4lBkwSGIOytz/BnLDHGDrPQ6YdJUPgOd4/V6p
X-Gm-Gg: AYBFou05uwgaVAwHJgx3cXIAp2W0KLJVoxEQQXRQ7X7piDLKX6pAP1qvADpW4bczq57
	jXinI6Q+GQ1zLYMkSrWi0TMZ9lE+ZcqMSpbQvcVAR571nDnCKbg+VUhetGc4wIDI5pTrMPHYf08
	v53VnpN7iDxcMwl6pOjdhWbDQIwKHoaZHmI7JeDBhhbKGZ0fGssILRPTSV+Pt+Afu6C5H3qsaOd
	54MlgHFYbpS+Mu+fgtteRbnumvpZHblDS8vWqhYEyl6xk3yO8cbJZRjHLRsJisBqheJh83bNA3O
	5nmAV6un/sM/Ji4GMSkb5l6OscEU40BdHFc/HT1Wm4ka3DDkD7FJQ5AdV1ibpi/1KLIXGhhXFa0
	UrYOLJNi8c+2nVY8FvMWyq5UGbUTLhqCgzQo7Q/b1VZ9817M=
X-Received: by 2002:a05:6300:6bc8:10b0:3e1:9071:acb1 with SMTP id adf61e73a8af0-3e19071d79emr3697983637.89.1791886632324;
        Tue, 13 Oct 2026 03:17:12 -0700 (PDT)
X-Received: by 2002:a05:6300:6bc8:10b0:3e1:9071:acb1 with SMTP id adf61e73a8af0-3e19071d79emr3697953637.89.1791886631811;
        Tue, 13 Oct 2026 03:17:11 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd5dadd0986sm4186777a12.18.2026.10.13.03.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:17:11 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 03:16:45 -0700
Subject: [PATCH v3 1/3] dt-bindings: phy: sc8280xp-qmp-pcie: Add
 vdda-refgen supply for Glymur
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-phy_refgen_1012-v3-1-f28305289499@oss.qualcomm.com>
References: <20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com>
In-Reply-To: <20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791886628; l=1740;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=HS/qHG1ys4GAFjcZw/lOrmC9aaejOkm0n6MjuWUf29o=;
 b=cE/+x1bGz78TWOTImO0Py5TvqJyvE5p3icxE1EKEELmdUHGE26npzg5tBX7iGwXP3/k+o+0ub
 Y2in/SCUkknAQ/TurPuaKYyNcHWmMWRvFtaPaSPcnf0QYxrp9RXQStE
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: r45G5n9GRLNzXjeiFHsNSLpGNtfyvJlb
X-Proofpoint-ORIG-GUID: r45G5n9GRLNzXjeiFHsNSLpGNtfyvJlb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX8eng6oQL6ssl
 GEBB1GBS0d1Pc7iuJqjFhjGasvqiyFd+GnTJArk8gP2wWYJyCJxDdBOM6Kl23IGS0cdgLHwxobp
 lhq7I7xffJe2wm9y+vO6BGCY6aVv1KY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX9tR0N6Fuyb4d
 vSxnh764KGsIJ2D/32sNQOi1xCIMBsewc5AFAIeF0EjWkCwpYZ85ZWooe57Lr7eVR2qnPKrSQH+
 mCibeog5+WZ6/AwhjddfV0fI6LS2ncyIaU7nWvxjxlylE0KR7FxwzkQaILHirPryXfp0cDS6cs8
 D/7I+XGbGqbkP4w2Ys/dP+DBhHgfwQ6bC/fc7bfC3VoDqKg/nDx010nSxKm+2KrTz38CWFJKjLc
 RxdtBfBfClbEZd34uShkYmgZ0N02zJ5fCrJyNArv6VJbit+lRrrcQM3bz/Bd7MKO0cEg3yhz72l
 MQ2XAB4yJLdCXIGBgIw2fF2dNonod+0Pi4EYm9DbF6NXJsm566PDYUwLBBatfAkiq+7td5fYyXG
 68CrcbhwTlSNQNrDuMFihki2t4PG2Z4rsEwfI1xA8UbV/ZZvubSeN3FrUa1dVnZo479/G7tEukb
 9pnfflPiXWtrU/Qwz8g==
X-Authority-Analysis: v=2.4 cv=PMGaavqC c=1 sm=1 tr=0 ts=6ace0528 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=neprlRFrkYi1VxbfstQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130040

The PCIe QMP PHYs require a stable reference voltage provided by REFGEN,
which in turn requires two separate LDOs to operate. Without these
supplies, the PCIe PHY cannot work properly.

Add vdda-refgen0p9-supply and vdda-refgen1p2-supply properties. Mark them
as required for the Glymur PCIe QMP PHYs for now, even though it breaks
ABI; other platforms having the same requirement can be added later.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index c0a3e1f160ad..f827abaf22ef 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -104,6 +104,10 @@ properties:
 
   vdda-qref-supply: true
 
+  vdda-refgen0p9-supply: true
+
+  vdda-refgen1p2-supply: true
+
   qcom,4ln-config-sel:
     description: PCIe 4-lane configuration
     $ref: /schemas/types.yaml#/definitions/phandle-array
@@ -280,6 +284,18 @@ allOf:
         "#clock-cells":
           const: 0
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-qmp-gen4x2-pcie-phy
+              - qcom,glymur-qmp-gen5x4-pcie-phy
+    then:
+      required:
+        - vdda-refgen0p9-supply
+        - vdda-refgen1p2-supply
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>

-- 
2.34.1

