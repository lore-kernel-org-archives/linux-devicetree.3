Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DD83DA7D3
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 04:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791521419; cv=none; b=RFBoHmilm9npj7W7u6Yf8u/5X23R7YhAu6EJvCq2ptKv5kLmcc0BidjXpoCudF8TGnojyOmhDH7yqFow3xjwdI9DT79TrzwJL4SeDdhlPzouW+Dw49LRCfzxVrwzOMDRzd78M+pYJ5yWNCFQjMKml/oT8MO7y+pzOkId2JbyZv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791521419; c=relaxed/simple;
	bh=r93Jb+RRci5KjslpMwSwutEV/c/USqhXg7qpdeh+1sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NbdFE4g7nWa6ZVfYC6cc+HvP+2zBCGkxab3AF0oNAX7qZclmzdPXDNFZP2anVJerR4yKCO6yih9q/sRck0SZ2NWX6qKlKVjc462Rbe06jTPofiMByQQWhalX4CVCZPOkKu5b7H6cvEMx8l1+mwyESGVQ1qzzN7acYmQNp7gGtfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H8b5JH3k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aa0yaW2L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H8b5JH3k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aa0yaW2L"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HAUn593943
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 04:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jrWr4WEEoDxY2QpPfvYR+d27cAyfCi80wCzqnJN1qlI=; b=H8b5JH3kdUFu3rX3
	J1/WlCwX3W7DcbIX7TRwNpgbs61zSdd+Ee6/pxzXeJ/BJt26+rYQy17RzETjGJOi
	adp258z45EwZ/Fe4vTZ8Ve6jTKAGvZ62a4LGgurdeqP61kGchELtZ40GoNAnx77P
	XFiAk5yekJlOCyIdxQVFYdPo/JFrjAStkpVRcIH6qxMqw/i4F7LlnojPkgpo5Mo1
	EriKd2AFdmb/WaCvl7XPTJAXAFcGDe4xMU1Z1fDcz7bZ4MiV8fO+UcjnzXCChe+Y
	aXVee2jt7OXQtvmvmZtx0whMw75jK8gPZo25h3agEWZiUYBTbGE8Kvet33veqgnZ
	JkxzaQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6baj34x7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 04:50:17 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35158d674e1so2740672eec.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 21:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791521417; x=1792126217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrWr4WEEoDxY2QpPfvYR+d27cAyfCi80wCzqnJN1qlI=;
        b=Aa0yaW2La18UR2/r+X0a0JOrdJScbmIX8/7D9Wpgqj8peouv4xv+SsYxxyMY3+CgWd
         U5wDvW2pMg9f1TT8W+BOJih1lOirc0CfCoa9YUnLbEM73rdkPaSsI8WsGgrAPrnZbu33
         EJ8oqeUhsSljYcADUC3+87PyFOh99rUR9rXh0kLTrg/P6KS+o6BNCtLwLsUirac77xMf
         AFPJhqjfdZvERrUAZ9PdJZOiguALffHjkMj6mEPETSX9oTorZ8VlOcoO6Q8cHC5jWPI3
         GE07lNjKz0Z0iZxjMDz3M5SGcC4xqGC0wZaglFufTyNDC4IdLMYwoxupY2I3vOjqSUig
         bAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791521417; x=1792126217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrWr4WEEoDxY2QpPfvYR+d27cAyfCi80wCzqnJN1qlI=;
        b=QzEngiVn+g4F/AEtqZ+aKg8+7M0/vUiUSMn7GfqBE2zmWPJxxlDCa5DhL9n0Yd0Q18
         3TX7fsvbFyFRx72NPbIk7j6i4AnWsE0MTkxc/mcKZxY0wKxwhjE7QuJXX8En1Rkegj4o
         wuqi/O0twOIg7ncHfz2YUXGdwZAg4cGBKFg4D8LL8Hx2nbsZH8yuVfgG2oaFY/EndNUo
         KNYRWeeQDLhE+qeabEpPRLjvlJaW6ugdVXOIv0WRM6nkdk/Ie3xf9OPMZ8TqJWJ7L7+j
         2rOa+/rpHqsThvDClJGHU/yNHkNi8QSY2Pj85NRXgKZtRUa/DbOTqhOXODrC/Bs5EFpg
         qmLA==
X-Forwarded-Encrypted: i=1; AKwUvBxANbiG46qMRR4XZuOj4YfEblwtdkqSNqTyjOhjokPbm07NPk9EkNGXbtO5M/u8FOV07/ZSnfQ4gHX+@vger.kernel.org
X-Gm-Message-State: AFuF++kkNqy+oqWuYHvXHK7MGNbMx0uZ/GVzaaH1fhn6bV6Qf0DXiQ3f
	DCBfLjfKXjEvXck5XtWoGFjkvzyhLxvZnxkCOoOZanh4Jm7LHCIC1gwMWvfHNCDKhm3SlMz26Vp
	pUefQrHRXQhZTqQm8eOVgQZnyrm7hmEjafoOCD3i2Bh1YUoKw56muZC8TDnqYsRQ1
X-Gm-Gg: AYBFou3cB2TjhyrkAxcJ73IUm48W3wqkNfrM9k8nBW/UB6WW9E6HVi3gwI/iI5P6ImU
	SCDsnZwvWItB8VO49VGmECTP7RhY10Su8BFIT2diIHvPV2flGv66xXAnQGj1eENXJHJO0OrYVgz
	NJ59XFgR29bxraeBuq6/2oPz0tC8IAX1N1fA2hVo3W9t7YadRFwby/zjuwrZt/bqYD9ZR4qwshx
	Em5Xswfd3YxZ9OvsCfPR4YV3NY1ugYSZfdoh36MDbwV3Wp+1XOWN89XRaeRUtuaeBGOlnNtXiWi
	jMoR3bawaK6d4yFnPzm8ILZBzATi6OM9q7dd0EEdoUajPSGT2WTcJGj4s0dLBXo5BmYppCjAYDW
	M4uN6Z89jVamtMHLRw3wZwd7P7/KmQxDUguVpTMV3lGrWAZRgzKd5KNeVWz7qo5wroT/OlXP2eG
	AsBa19BOw2cro+zeJW0s7OeX9gR6SKaA==
X-Received: by 2002:a05:701b:4314:b0:166:862b:9bcc with SMTP id a92af1059eb24-16a5f01dfb5mr1176291c88.18.1791521417282;
        Thu, 08 Oct 2026 21:50:17 -0700 (PDT)
X-Received: by 2002:a05:701b:4314:b0:166:862b:9bcc with SMTP id a92af1059eb24-16a5f01dfb5mr1176261c88.18.1791521416787;
        Thu, 08 Oct 2026 21:50:16 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442956asm4151609c88.16.2026.10.08.21.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 21:50:16 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 10:19:56 +0530
Subject: [PATCH v6 2/6] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 IPQ9650 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-phy-v6-2-50408e45bcc1@oss.qualcomm.com>
References: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
In-Reply-To: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxOSBTYWx0ZWRfX4k90avHjiBsm
 x5TThMAGdwbgV7JLV6GVYlJof8jeo4He2F68aF7Io22rd3k/g/GU5+0U4gWSWbm/xbr5dGV1GXN
 i+bjx719DOifgt7unBF1mhMwj23t7aGW+yCjxhq+IbXs5b6Typ7Xaf+Hn40kJpvA/pOBoTcIV8p
 YJAC+MwA7b+IArSpslVmLnae1Uf4U3T2P3tZ27dfZzWHIeWABjG/zqFfscOW4kNp9LUDkTOVllg
 lpiORoymmIWJOEvsR60V8q4DGnDqFdZx8he3CSYpPR1lSzdQ76h5Kp1IdpTIjMhVgZHnYijLXpm
 yb/KLkPYnwYiZno+9zZQOlTB5lyhVN73M53LMR3hhGbjhaBMWbPMornKrytFI+v8tns8M4mz+oj
 cAH1c1OerTFfU9s70KKpRHKmI/6dvTHeqXA8+M+qClTJWC9Irmvfwrel/ks3Bc0w9zfhJLdPdIY
 RiMG3hTnWzs2IdwddLA==
X-Proofpoint-GUID: mIR2MHGcoXc192v8g7d_95WnJjdU2sxh
X-Authority-Analysis: v=2.4 cv=H/dOUOYi c=1 sm=1 tr=0 ts=6ac87289 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=JwZr8aepJa0OdLIFGX0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: mIR2MHGcoXc192v8g7d_95WnJjdU2sxh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxOSBTYWx0ZWRfX8zE3r74BX7qY
 plj1NMIDREGJjiER+oG7gADslpkCl2PyDjEsMZf/iFuZoR+98Rz6Pe3sJDj3/WWevqcGisWbrwW
 aLI5RxLdLeY7E+0o4BAguO5MtDYPWk4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090019

Add qcom,ipq9650-usb-hs-phy to the list of supported compatibles.
Unlike the existing SoCs, IPQ9650 does not share a generic
"qcom,usb-snps-hs-*nm-phy" fallback, since it requires its own
tuning/override sequence, so list it as a standalone entry.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
index 661759b25064..db00f5a99d80 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -15,6 +15,8 @@ description: |
 properties:
   compatible:
     oneOf:
+      - enum:
+          - qcom,ipq9650-usb-hs-phy
       - items:
           - enum:
               - qcom,sa8775p-usb-hs-phy

-- 
2.34.1

