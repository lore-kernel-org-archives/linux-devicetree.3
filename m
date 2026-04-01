Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148D33D9DD9
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 09:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775036509; cv=none; b=par0gvhIWcyhlgIBoKU8eFI+1UI+1e68I5geZwjrNgrqesJ5hlwQrIXGeIJ5lLEeB8mxLI5LFC0Do+q72ennKbZWipnbdFetof/dXyuUOFcwqbGOgzgprAZyFz9DLAhtinHrcjZYICciR/6f/VEnnsn+E5PMQNRKnUhqVmBy+xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775036509; c=relaxed/simple;
	bh=FGLJTuxQpvKxCu6rHEzZ0bQiQmbetGuGjY0whQEiSXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fW56A5XGx8Z6m37x9qf3SWxyvr2HOpl0uuhdc4aQ88Xk8LRFE0AS2osDWUdFSSGdjp9/LzXUGSGAcdvSv8zbfMLZVx2MQU+ivQLOqFsiXdGPyF3cJ9ixVfE4I3RdnPkmlSHB7wHLKEHon4gTx5FrSCgYR4i0hXHvnbz+gjVW2sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YfKTMToi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RZTLf7tI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YfKTMToi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RZTLf7tI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6313o4nu1580391
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 09:41:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u78N2F1YA9yJQ55Air5ug41Inqx6WLIV5npOpHjoKqA=; b=YfKTMToizpqAeZZH
	fQc1FtI922cbZlqx7VzH5fVkRVbDSriiGOhqRxiEUuCY8pTw9L5TIaenbWrM8qCi
	SazGpVGSB65muKQJZcCHBN5Eue9f+zFQF7cUEoOOUuhCMxe4gesps0Z/uABPr8YI
	8raWsfhpP731GI4An9NUniT/RcOfx38LQ0MGygjoDDSrOHAckWeCghDl0aqNf1Oh
	ExltbZ2m6q9iI6JirwvnZ9AMNy2x406yidWLJiuY5SZLRjvootKL+nlISp3XlAb0
	55da96UwMqN9P6CLkT2oJdBWxBfEg91KsLS1a9DFS6ykXO1rEUDlZgFcQPdpX5/7
	2H6hwQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8mr2tuye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 09:41:46 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12734af2ca4so624107c88.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 02:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775036505; x=1775641305; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u78N2F1YA9yJQ55Air5ug41Inqx6WLIV5npOpHjoKqA=;
        b=RZTLf7tINuVxzYcoaIuVIE+tAslm0+6EVXW8BN+W9enKAsC/XiR/EZsXFbKvirKa9s
         C1P/TLOar0wFbhn/s2RBKXtdJLcv9GTPhE6DvbepF2C549VnDW0Bg6vzIAYlyyIJJ0Mx
         /5hZPprS388sHjZC1PpHenSogGT5t6ltGqYmtK6PP+hABnrRqM0+hzVk2UVQme4qfg85
         //XaKt0+Dnz6YVRwuXDFBXb8hHZDv5Yg597oR03SuNxgt6n7VIO01hwn1vCpUtAFY2r9
         ahhKL6klbNcGW6PCM0mBjd0jmeJrILC3VPMV2YVtmt4/M2HJPzrYwLWtv9suuN+3OyJT
         1x4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775036505; x=1775641305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u78N2F1YA9yJQ55Air5ug41Inqx6WLIV5npOpHjoKqA=;
        b=gvKQ+25xtb7X9ZZ1YlwtQBg7/52RqtMCaJOPo9w6/WrJhUv2JaKF5/NPO3LnnyuCBw
         1klf8XYbpQ9k4NTtwDUbr4kXV4berQux/iYcyovzOPdDPao0r9nHFo+9OeXeFLqK1Jkn
         H1OkBQjatb4amzH2G4p7GIts1I85x6kcW/sAlCo+NxtYpTjNcfe7n+aAIFjgSx8Ul5cN
         iolIYgvj2+ZJjB4uSN0jL4DHLZHbpjdeCRa5JqJHHpUUB3BpdLKLmxoP5dhWS3l8gaHL
         0Fi9DlixVKpKcp9qZo/DpCVh9ppF9OnmsYXvimcPFl3Q04yMezcQwBaGKzZym8xmIcfO
         FY+Q==
X-Forwarded-Encrypted: i=1; AJvYcCW17hfvDKwtBmFxidz7OFtKtCZgmoi1BY+2poooy97mOcKx4GUs2A0z0epqYMqv0qLH0y6C3LS3jKGp@vger.kernel.org
X-Gm-Message-State: AOJu0YxJNc8zivz6r0cmGRqo1nAB/kVIihMbA3cj2iynd/7npP4tzQf3
	B4a4khq/E1imBngjbwKJPanHFVloofyaYCzb4hZVWL5Ta6xRZONlIOd95FWr+IN/4AMFZXgIzgR
	MkBSlvFzFlwbIXve48kGoJ+cpRSbyVD9uWk+3NehdPF370nogR9FbJ+AcGWjk39GsolZzwhqorC
	U=
X-Gm-Gg: ATEYQzwaLmK0s2NEzF1xFa05tuC/bMUE3wHJcBwUf3g4iEQEJEgviiJ+NSHCfmq7I6U
	rMGDz3LAv2oR2Baz/w0qMtx0ZqsPUJZecKD7B5KZFd/tp66WTFPMcUKmmUmbGLwuz+AgOJ7MVZy
	D3QV3j6eaZgMJgjpaWiWx0jXMSwHp8e2ffZN4bYE/Ra4aPQIstXBMatlpo7z2vvD3iDOoyHw2NX
	sCBtbe1zjihZZz+cFeoUNZpMuoakVLmbNYjJS83IorpEjBi0x/5VzmZu+nc4B37TGz1Lppd5HJh
	D/2eKxVHPaBakDnrHIpGoNQenzcLxbjfsZYjblY+zLCbIRG2zWP8l0Dj4XML8yPe+YgxwrjAncg
	pfzKR0VpXCaNQjVX8sGZ9EVUoGPHIIOCJIdPcFjRfmzmLEwRml2wY/toer63WDKJypBw6VZmF8Q
	==
X-Received: by 2002:a05:7022:6b8b:b0:127:5c3e:3ed6 with SMTP id a92af1059eb24-12be6822784mr1331523c88.12.1775036504949;
        Wed, 01 Apr 2026 02:41:44 -0700 (PDT)
X-Received: by 2002:a05:7022:6b8b:b0:127:5c3e:3ed6 with SMTP id a92af1059eb24-12be6822784mr1331506c88.12.1775036504362;
        Wed, 01 Apr 2026 02:41:44 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab983f9f3sm18982647c88.10.2026.04.01.02.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 02:41:43 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 02:41:23 -0700
Subject: [PATCH 1/2] dt-bindings: spmi: glymur-spmi-pmic-arb: Add
 compatible for Hawi
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-hawi-spmi-v1-1-c40963041078@oss.qualcomm.com>
References: <20260401-hawi-spmi-v1-0-c40963041078@oss.qualcomm.com>
In-Reply-To: <20260401-hawi-spmi-v1-0-c40963041078@oss.qualcomm.com>
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775036501; l=857;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=FGLJTuxQpvKxCu6rHEzZ0bQiQmbetGuGjY0whQEiSXU=;
 b=64ePanpjXAb4B4p2W6rNaV55CrwfAIuVUX0ZgZDT0jTYRzPySLW7TPxmAA4XKdg9MBwZR+Azp
 6Q+Lsg63nQtDQjKTt6LUR8WRJHqerHznqI2ZvdmKxo11hM83SEfVsTc
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Authority-Analysis: v=2.4 cv=B+O0EetM c=1 sm=1 tr=0 ts=69cce85a cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=-XePK0cKrgyqo5WlPnMA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: A9jRMy5NyhwTKUlUnCoNVYQXbJlmRiqf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4NyBTYWx0ZWRfX2FImksrICfE7
 P8cYQesE22z09I2l+EGRJiGzu786+5Zl2CxiUoJ4abq8MvH66OljWDeVPDBHps5/zk9j7gKcsE4
 BgpjCWcW1SCS0EzBrq8gU8Ve0yJZc6hISucgmC4Tfw/v6fkTQ0TLvwBljZd306EUZKFy1oqMPZa
 uqKjoVLa5XZSlt2CKDtaGfUwZajxrV6qwsXbONPmHZIJmKKzViWj0f8GvKDXWkTn9R3WSZzW0VW
 TOvCrvVxjkHsdwTg+YvL0uRFJ4juWt4C12iizSnL6S7tIoKDBP3ilgjCJ9evYTJaSYuD7TS/o7E
 DiuJH5b1QjJQYnQfhqaJeOy4VtrQ2idJ3AA09kRxt0RwQ+BZINOL3U2GGiB8kJKsdssHgUcUQdW
 2O28Xt3FF95kCMUPYJn46UC8WkLk++Y5u1HhQv9ty5JvEXE3r0Sj1kMPFBwevoW6/4toWYL3taY
 eIqfhQBGaeJIFavowgg==
X-Proofpoint-GUID: A9jRMy5NyhwTKUlUnCoNVYQXbJlmRiqf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010087

Add a string for hawi-spmi-pmic-arb which is a compat of
glymur-spmi-pmic-arb.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
index 3b5005b96c6d..1593a1183a36 100644
--- a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
+++ b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
@@ -25,6 +25,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,hawi-spmi-pmic-arb
               - qcom,kaanapali-spmi-pmic-arb
           - const: qcom,glymur-spmi-pmic-arb
       - enum:

-- 
2.43.0

