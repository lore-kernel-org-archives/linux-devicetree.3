Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3573C585B
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 12:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783774681; cv=none; b=pN1/Sf9qfr/NmHb2V5bBfc6Hk8ZjpPNm/eFqsVUfuykja+zBkx+Dys/XR251OW0gHD0GCETSpa/bHPGUkgi9h8GmROGrfNJkNwzanADa/mhfFOLKQK1DIvp+Fy6VaVqrYmyU4EgJDsVPyP3FvKgh2IleKuGtowGb28tCEjxeakQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783774681; c=relaxed/simple;
	bh=vBUE09K2ZJ0I6D7b7YeWJW4uNjwNJtT1FGpBYywnV+w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eutQPEOrg4CDgn0x1nThpRPJ5YOY+bHBiMY/4uf6i/Kj6gURSdD0WyjA2lP9XI3RQGBQxU7Wd+JO4BYn4jp3wOD1n+4e8RGlwoSB9ZiTzxCQ4wta9ivTK5LdlIvCzNPTyuqtEMgQUobcHKnVS4mYLYq7AWVrbVxuaHaPEYpcjME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jeJRKAlk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ebNdNC+F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jeJRKAlk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ebNdNC+F"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BAnh5O3570699
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 12:57:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cp4uLzOCic1
	RRkGa7AiSR4wCQkdmgpEFJlMlPSR0hCk=; b=jeJRKAlk0IxnliHRBh6InvnuKnR
	IxlQmeA3YyRHgQuO76itsH6zBTB4ktp9S2sjtXVk+byihi/uya9p3YXAHSvh5r5R
	yzSZtvCcMP/49SaLTaY2DDNjpMRluJxEfhOLPge4UOr4cNH/PGkrN2UickXfHxmk
	gOg3iYAxxUCU3IS6Tg8izQvTz+rLcfiPBNE149zA9cc/S+Co5rlVnK9xiBvhBTgI
	2GWgVdjaRZH//eQW1FcqmSQBgwArZwoyBHWKKfaxBX2ZlfirBINZT+FWXS0rDc71
	FRY6T0LpW3sDIv+uKeKeB69jkzq3KI920jz/uwcVnBtFMX/JcSbFX/4Homg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe910ttv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 12:57:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381abcccbf4so1678179a91.3
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 05:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783774678; x=1784379478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cp4uLzOCic1RRkGa7AiSR4wCQkdmgpEFJlMlPSR0hCk=;
        b=ebNdNC+Fer8I9rxfxKnlh/ccCQbBaoPv5OELS6YD1wzRN6789lMLGbBkGABet6dhpx
         3p2M4bV6JUk+avUDcERhtkhldnzD2srcb/wYXeXyunUlJsGxAMrEn4f4qtm8iWZ/CutH
         Xy/PAcZf/U1kGMhZa+NCJK8hHCfn5GcBJUn+nYER9CVj7JdK7fAAeE50+5OK+p1N6Ibc
         ovMncfmelWXGLmUn5M3E5NFdW0DOgq4ct2K3lgh2cJYuUdL/VUl72tx7kqXcwpQ+wj4q
         O/CveBNNg1dI0UmNpk35Xjtda4rz/hbD2+QCx+EX5WvsYK9qBGP6VbaplHXerVjKKIh7
         Q6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783774678; x=1784379478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cp4uLzOCic1RRkGa7AiSR4wCQkdmgpEFJlMlPSR0hCk=;
        b=PjQv2BNPyBjhquR7SdUjuxrI22A3Sx8btQLozi8sLLu3GEDI5j22KEZyKwzMk/1jVm
         1PmWy9F4ZtTS1BxNrcVJFXzWdsOc4v0YxL/mHSrXjCg5edGmMMyVItDr81BrsVs6tWhx
         JmdXa/W1roP5nb+ZgqQlFlLdOBd1MSBgjTe6CzK+pC9jkDq+5DoQMkWs8ICXqhhPWqIW
         Wg6LusIB+YOnB2SWiBJtoqyE/DxOq2wUYsw0fTIXaAfUHvQv5/IJ7lr4q9a0SBtcLl5m
         uhz4VrsPEEiOLlxRrDILPyfw7gTQZjwD25B5JrQ6rZLTu3euNXx2wzhXmzRT6EZ5BbYW
         rT4Q==
X-Forwarded-Encrypted: i=1; AHgh+RqqzisnWKPIN0T4uxacn5lsb4VbDMk5l11KCWhkcjXO5AOS/jI3hfSCgHxYCLJ+qfKaHTjxecoQ0eyE@vger.kernel.org
X-Gm-Message-State: AOJu0YyvCgQMKMptXs+as3LMYuBlWDFkoNh2ow6SusDLq7NjqlWtLVdb
	DVGzZ2gQrSqHIr3WUEBLsifKjUpJRfA67V8I+KvkjXQ56CDOHjByCrH2gPep0BDAfqxIurdHeNV
	4sf+TRNLyIKh5q4hx49m30kGH5OWvxuKOGtrFZsYuIyMw75WHe5kPL3RkovLD4g0T
X-Gm-Gg: AfdE7ckW2mOPbA86KFyd+jzWOqd7VeKeYcuBF+1iby8WopDrlYdIDfk4AA1SaKcrAdb
	NBAqbWnE8QSVGPtdXdLhPTDac58nugxNQ0d4/cjRcrhgUwDbqKxZ4n1xz/m3101DG6Nxs9EkJXr
	8kiJl8kxPfxEm8Jkcmgd1vLFGI4rEccBKz6bmtdRZebZjacMHUlt0pa1RMXInoiVh8Qxjse55yu
	PFr9zYK6G6OHBiz4s2IzsnE15ty8dw5Yn/NPM84x2eX0D7X/vOhXc1BHKtLGogCt2eu33NITjIb
	f/6FROyiwer0p91vzO6IeVYTv5L6/2vb8xaeFyYfBmndiRCRHgtdEzQvTd4LLoarvjCRfU1DAEH
	HtDXqdKV3Pl8QkkT6ggjMWIU5bjsA9Vrmb3pmGLZtorm+0Bs=
X-Received: by 2002:a17:90b:3d89:b0:381:2811:e8ad with SMTP id 98e67ed59e1d1-38dc7777abcmr2924090a91.23.1783774677946;
        Sat, 11 Jul 2026 05:57:57 -0700 (PDT)
X-Received: by 2002:a17:90b:3d89:b0:381:2811:e8ad with SMTP id 98e67ed59e1d1-38dc7777abcmr2924073a91.23.1783774677496;
        Sat, 11 Jul 2026 05:57:57 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm11185634eec.23.2026.07.11.05.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 05:57:57 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
Date: Sat, 11 Jul 2026 18:27:38 +0530
Message-Id: <20260711125740.3083236-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TbymcxQh c=1 sm=1 tr=0 ts=6a523dd7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=NrbrONOL4QpDeGKfLFoA:9 a=rl5im9kqc5Lf4LNbBjHf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDEyOCBTYWx0ZWRfX94UmTaX2nTlp
 rRWBLB0mbxFcWDgYEgMgH3MiyOZhc8N/iZXLgXj5Scw29rHpE7huFkUg+luh9XWxjt6mc84dLC5
 usxHRr6wP38c9CamMucuWtJKVbfuS8s=
X-Proofpoint-GUID: rxe4s8oobRkmFw0U3qjT8ywoFKNxN2ys
X-Proofpoint-ORIG-GUID: rxe4s8oobRkmFw0U3qjT8ywoFKNxN2ys
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDEyOCBTYWx0ZWRfXz5CBPFrZOTbs
 0rOxHeQ/uz6XQ7Gz/jk7wBK+HT0urk8043rZj7wyUBumh3mHL8cF+4l2GqE2n/3JoEUMeVeMlyB
 goF2Qetuha+kO5al/jswEoTMngRfBQGyJ1SyPPviLGiMRJNBtfi37jH4UDyGbnvFXLaLKtiJaa5
 JGUfCPeQsc2do1qhhC1/LpLotGxm67tYRytdcb5Gm1t/4E11qzBBqksDxJLo41aT7kDsM6DPJDN
 t19N7NDdcwT4vxtpZJ20XIhuuDSC52yq/xeFpDd5PU/iOr4Pv3m/jqZjxT5+k2H292DG6dor/rP
 pVxbLuGcjX1KLEV3cTCR1hhzktypdHA0Xb35oSCRik5qX+3QBmx3rdcXDcSZVxvTc3FTRycJ1Hy
 72UiFn3E+TAOQrEs+ZMY84EklrbvBkPZDj5Du1qmDTBemxhVhQDpeT+6KEENYmM92JF36rRH0kC
 faGLU8xweZ0CVP8czQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110128

Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
describe Digital Audio Interface (DAI) child nodes.

Add #address-cells and #size-cells to allow representation of multiple
DAI instances as child nodes, and define a dai@<id> pattern to document
per-DAI properties such as the interface ID and associated clocks.

On platforms such as Monaco and Lemans, third-party codecs are hardware
wired to the SoC and do not always have an in-tree codec driver to manage
their clocks. For these designs, clock line enablement must be driven
from the platform side, and this series provides the necessary support
for that.

On QAIF-based platforms such as Shikra and Hawi, responsibility for voting
I2S MCLK and BCLK has moved from the DSP to the kernel. This series
introduces the required device tree binding support to represent and
vote for these clocks from the kernel.

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
index 2fb95544db8b..f3a8b12d7fc8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
@@ -21,6 +21,49 @@ properties:
   '#sound-dai-cells':
     const: 1
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+# Digital Audio Interfaces
+patternProperties:
+  '^dai@[0-9a-f]+$':
+    type: object
+    description:
+      Q6DSP Digital Audio Interfaces.
+
+    properties:
+      reg:
+        maxItems: 1
+        description:
+          Digital Audio Interface ID
+
+      clocks:
+        minItems: 1
+        items:
+          - description: MI2S master clock
+          - description: MI2S bit clock
+          - description: MI2S external bit clock
+
+      clock-names:
+        minItems: 1
+        maxItems: 3
+        items:
+          enum:
+            - mclk
+            - bclk
+            - eclk
+
+    dependencies:
+      clocks: [clock-names]
+
+    required:
+      - reg
+
+    additionalProperties: false
+
 required:
   - compatible
   - '#sound-dai-cells'
@@ -29,7 +72,22 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/sound/qcom,q6afe.h>
+
     dais {
         compatible = "qcom,q6apm-lpass-dais";
         #sound-dai-cells = <1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dai@10 {
+           reg = <PRIMARY_MI2S_RX>;
+           clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                    <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                    <&q6prmcc LPASS_CLK_ID_PRI_MI2S_EBIT
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+           clock-names = "mclk", "bclk", "eclk";
+        };
     };
-- 
2.34.1

