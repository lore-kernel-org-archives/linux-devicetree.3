Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099053DB629
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 06:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785910742; cv=none; b=iA6K9VA3U2lG6nMVdI7fVztvdRp8W84LxgvHCaQ9v/hhA6vv6iLHlSrNWZbX5RrNpUAPWtysdshP6vm1uSjDeCWCRKeGsQw1WXC7muA7H98yzRQxCaYSZrLe3UN1mkyeeOMoaQ+FPRIJMcqwVW6oxFmEH/AOeJnDG5kzsTev24s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785910742; c=relaxed/simple;
	bh=Ys197YC3XOD9CnVoetaGWg4eqH96ao9lELwA5QMf5CA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bhHW6ItYEiPKha9G8VtpH2TC+nL5tS0CLFaCGyjhDaY/md+QmMeAs1lJdg6Yws+3oDYbA0RT1I3XC5qfdJDz8iW4Ow0Re5/wmeEP4MDz+P5G6e6ARD1XwFi2gI53Jv1IDxo33kh+O0urrqKy1sdau+Cu6HvApk5HkxAlEQ0YKDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b7d3W7OU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JR2UKgQO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b7d3W7OU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JR2UKgQO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6755koJd1680391
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 06:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jPg7wDJPn0dLENWw36JR9/8Qv11GyQ72iD0SDfmmmZ0=; b=b7d3W7OUV4ompCrq
	5sR9oaRiUhTLcTVVqoDPuhfSFv/g4NFA0LiLstecmzAeet7J2TVkTiqc2zmVwtz4
	3QCTPx4nZ7rhoRnLFRCiqktfaVh6l5/cH3LYn7ujPEEAIvrZvVhBMW892iKwgfkT
	YjCwTdq2lQHGL+LOm7qer1E5/VFwJSxvfOvYUKMgsU6Hi0zFkJZkeJZPmsRDKXt7
	3rCsCOKinaIs6rC8EKciAOjgkAmKsAH7rc0fZq9pV7M1gqgbx1pldgNtkCvAfXaD
	FybiQRAT64TchYwYwdoSQpNUI1kdFh6h63pj+L2fNbKh68dWMoH8Mc+/sgXQRoQ3
	OO/yzA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuk9u38je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 06:18:58 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e0234967aso599354b3a.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 23:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785910738; x=1786515538; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jPg7wDJPn0dLENWw36JR9/8Qv11GyQ72iD0SDfmmmZ0=;
        b=JR2UKgQOmy11uz2LBBbZmIKZJgYDKdpiLyBG7XDvKjKjIU1jzZ3DvJ0Y6ZraxfDRGk
         e0Ai0BZqOb6bvGjprGHCx6k4Io4D7SE5xBY+1ii/+Wfr3YqRhYwrMYe6SihIFMnxuOwl
         apAxhqtzmKLzH0giHxCtoV7Umgu0/KtdA88gmj+m/7e9YLA4WP432yOte9hQXucf61hr
         msOdZoXbbAsg+ipUeheTRBfsEtkyW9aNGS5HRomxyds00Agh8hUwVWhZwamZ5dbCUOrw
         E2h799C+kb1cYI3zjTSbrizThuOj3/vPpWWdWTtNSG5D6FIYcof/3TAfeUFOfHZ9G+E0
         DiHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785910738; x=1786515538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jPg7wDJPn0dLENWw36JR9/8Qv11GyQ72iD0SDfmmmZ0=;
        b=qs85danKZYKBLUNF5w0fU1u/SrdbL+Ri8dWUof7B3fQbJhpRoq0h+BwTo64RkO/8m1
         tqitXWhwc82OxmCU60CfL3Kq5bjaMYn88VoR0EKVNUPFYan5dOEFTepMDaveAUO/xMVe
         e6aJEB8MhOg5nN6Pzbarb4UOi7F/EjlVqGQgiTb+AdxPYDkeP68ffR91tgXAv9DttWcq
         WwMS7DCiP7Kf3eLDqWtp0IA9NtvhnFlXX0aXrx/8nInfsZgrJ8n1M92+W1nj9j5ouVFI
         n9Pkts+oNpsJsOIX8S9ffQhtrfKH44zz4TMfwv3yng4ykcx6brZ6jZ3T2BDKR27PgVfD
         qRSw==
X-Forwarded-Encrypted: i=1; AHgh+Rp6naUr6UBVx5nHIPa34gfF4l1i2yztdweFIzQ620yEweHmQy1RxGqSdI4R9e8Qi7w27Drpl3na9vdO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz251euT7jG5gxnVcvIWkqxQkQAk8QUttxUq9YoZPF0/+/5ybDq
	yY9msgxo6Rojs4fFaw9c0MfyK50cwCOct4MKzc00yzUMNb8PfobDipUR77XoxnxyO5z/6UHLlb9
	nn/dHpjmmlNkvHQ6MouXUmzOLGbBtbDuonrKmcmfXaKSSDBsHwC8x8GenqA6t97+X
X-Gm-Gg: AR+sD10kysowAAfkknSQ90KPyWAQvQxHHpc2IiadY7TKVEEHMtAW10jhl4C+G+B1Q9M
	15OBCAROX2AyjGNL6eZNHS15/MBdAoCZnCN218N0MnNlXs7ZxhSTVZtNGZCdpFbjgTfyk4Vg58S
	hUoHvPDtr3G8c7UQoEBoUc8/WtDJp6xgd7iiiv+wq62PTBeB66If+2MOp+yRrjShtHjsTypnorC
	TN7uvI+cZ9Nowzl6qT/mVZ5CCYdNfW2NQXUX+beDSH07bcYrW/Bbwrcro+XqizfKUaa8/BFuIbN
	9PEyCFvUPAxQjClX5Ksd0iW4kRgQaWAaZP4bwjGbX8oTPu1Hndai1+bRenlpSW0CxPaaXXkRxYj
	0cOBM9QCUdpuLUdfa/jmtgoL0IdwWaMtiGpacFq9xHY3Fu2/elai+
X-Received: by 2002:a05:6a00:2441:b0:848:7731:d95a with SMTP id d2e1a72fcca58-84f2e1520admr4585427b3a.37.1785910738164;
        Tue, 04 Aug 2026 23:18:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:2441:b0:848:7731:d95a with SMTP id d2e1a72fcca58-84f2e1520admr4585378b3a.37.1785910737679;
        Tue, 04 Aug 2026 23:18:57 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f2e30d660sm487801b3a.25.2026.08.04.23.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 23:18:57 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 23:18:13 -0700
Subject: [PATCH v5 2/3] dt-bindings: mfd: qcom,spmi-pmic: Document haptics
 device
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-qcom-spmi-haptics-v5-2-77128ebbdd2d@oss.qualcomm.com>
References: <20260804-qcom-spmi-haptics-v5-0-77128ebbdd2d@oss.qualcomm.com>
In-Reply-To: <20260804-qcom-spmi-haptics-v5-0-77128ebbdd2d@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785910733; l=964;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=Ys197YC3XOD9CnVoetaGWg4eqH96ao9lELwA5QMf5CA=;
 b=EqMl65gmDin3jRxjwtQtQpNWpvzIZdDXMVSX9oPXLZwE5wnymj/uoa6NQIuYb9Ch5d/ESag+F
 ewSRCkSdgCHDPi2dv/9LTnPMzvRch4mvXD1h9GmCPKpXl6J/+BcUe+J
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Authority-Analysis: v=2.4 cv=NInlPU6g c=1 sm=1 tr=0 ts=6a72d5d2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=GfP_bOASi7LDpkAm3wIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: gXYv14VE05EVgJgxEUEiEXdtCFSIWWHN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA0NyBTYWx0ZWRfX/302t3IWZhRC
 6R6QiiV3S+8Ix8t5z28R9ztSXk0LKMjM5XQajp2JNTxgxnvGcNC+qp3oV4t4G/5Cqi89HLf+kDh
 NfYqIICuJ7vfERSBUywl6CR31NAZdus=
X-Proofpoint-ORIG-GUID: gXYv14VE05EVgJgxEUEiEXdtCFSIWWHN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA0NyBTYWx0ZWRfXxB/uQuak3ljV
 GlmrW3IOTqkRehUwoOgSAx2kOIWFEC3mLZicg3FHQ+OE6mYvEO/Ej2olmspU0Jrf3XsibMf4BHA
 7F9beS60YHeufYa18Tdny7AotyZLvHsX+AnTgNvr03hmolL9f48xui9q8tsb1rdJpeG7BRzS7nQ
 KVSurQk34o/WbWiSU0OtO1q6Mx01YVssym2jP+mqq+H1me7Q2vsSOOOvHKtBkD6AjC4fSNyYxnI
 eKe7oet9uVkRRXqboq2VbB0JN97ZnFA6KAerOocqQMq9LA25GPDqCXvrzwg4Y7E3CMivmsoBaIm
 8mBQLnjfdeeiLCuobyz1G11ifFL6Wz8TzUeO3i1n7iPllereT+r4G7Zt272FCWFeWk/X6GZ3ly0
 louWX9WZTOl8A9Qg9Kd+DHTh5KckK2L/br6oPFqsc8Nwmp46hrjqKRjPuiQUt5qom9xSboo/5/e
 paxqTPWJRJ5C+N4py7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_02,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050047

Some of the Qualcomm SPMI PMIC has haptics device in it, add it in the
device list.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 644c42b5e2e5..773f4cba5935 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -165,6 +165,10 @@ patternProperties:
     type: object
     $ref: /schemas/pinctrl/qcom,pmic-gpio.yaml#
 
+  "^haptics@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/input/qcom,spmi-haptics.yaml#
+
   "^led-controller@[0-9a-f]+$":
     type: object
     $ref: /schemas/leds/qcom,spmi-flash-led.yaml#

-- 
2.43.0

