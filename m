Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE9D3A2544
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 12:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789302758; cv=none; b=cbHmPx1Twf1JXEG7EDZbwwA3dxMKe3F+nBXb/aYtmEEr4TssdOyuN+53Sg44fbzbhSYEmhxvg+qpfYczIraeoQOHHQEJPGEVGtlZxwMQkoVqYOz0T3Ho3ULppjmdo1J1kBU/n8nhGhDsUeyRG6uvwZqnBeCl9WMv03cQFzji//o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789302758; c=relaxed/simple;
	bh=pFYD9xnmywcXUkGLbix3V2jspMeKMaccoDyDTjuRfBw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cnG7FpzfzsQnbc+4+hFuPcwJ4qvq+es76tNLawA8EWrsf5c94ueRFHVkLqoAqnwwQS7/0EOYC/fDMGiUXzW+P7FLvd9r9Otb4zUYPTXpca7HoUCycwbuKTYy6MmVmd7A3pw3jQdkn5YIT9+lmu12bMy5sjH3D9OJW6m52cuDjfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U6Smo9kF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dO8h17re; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U6Smo9kF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dO8h17re"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DAUNhD1368243
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 12:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Uo8fsGQfoYz9NWNn4lWItONBznUMytKDsfP
	Qn4Ziz5U=; b=U6Smo9kFJivHvkMds8U2IxKIiqYkWh1SgPCHvlOv3ToV6rfhIVx
	aiA7G1W061+QCitNeFESvaWnf7l5Sdx6GysnzFL7frFWJx4qVLd9gDhlH/M/cppB
	hguAc2gH/1hKHSNEnAvtTIUaqTeyW+5xCWooOItBKlVlcmA3v2j7+jQn+NMhmhm6
	BwESPjPzRpDR6BIEDIwhfXuEXFkznPV4vTDiHlL0nuQYhUEJAbNgDhUOY10U8nDi
	IHWOe0crgKe8YGX82cVwyCWbbKyMmlLW5VTNd5mDZJu12gZNnuWKzf+PAPrGt0Q4
	CTdRcpd8XtoXJXpnJJsJ1UXzLuf9WtCirlA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9db6ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 12:32:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9393ac4961fso276227885a.2
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 05:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789302754; x=1789907554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uo8fsGQfoYz9NWNn4lWItONBznUMytKDsfPQn4Ziz5U=;
        b=dO8h17reUOB4Yf/qaGZ7yq5J8gEI5ccFIb2bchazGnDT9c2clQyYm2OpF+sxF1lqok
         42XcrmjKNcmaT2ZAJJkKeYPnQIIfHqEXYT0ykoGuHsfMUtsjdjPd1rsuGkf/78Y3as1O
         Q7uW9w51KOLjPEzvw0UZfpVfBptcg1GKWvqH9U+LJ2SlbJOWhh48PY62CsJJXpflsWIn
         DvYXdHwN8YCXdHo0TXsi5QpxuqF0ywc8HpiX0HSpRf5G5DuGTtYtYENeywJizFtzCtC0
         BhBX/f6EbPlLnFvFysOAUiUcSoDwy6P7Ld8B5E9e1pzQ3QwhfATShNH9qpcDEYj4ey1U
         aBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789302754; x=1789907554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uo8fsGQfoYz9NWNn4lWItONBznUMytKDsfPQn4Ziz5U=;
        b=YdUkhFImStCCh9JxffgvKHZxNRvipSESIMyjH/8Rv87RfYi0PqAzjHcC0LZoYAJLDi
         p5MlnUeVB9+cD6rhTH5rua0Pw5NEHs31uZ/om91i72Mgdx1snSvqNJ4lqpR6OMC8xqog
         3Mboj+ZF9Jq8j+oUoq2HAMAXQ87M1Mb1+1qjgbd4KunPUrRFjt6hvQbYw57iJF+z7A83
         SKK1B+fdmKS/E4v1cQyuyJixzg1IGsS7ZQAMEOyjlQk0SK9Eae0knUdU1MtoYhzTJ230
         DRtzvqjBKUh4IO+8bUbSagD7jgddh7KLeP9YxO22uCTEsi14iyqanOo7IBIVb92Yj72L
         p1SQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXNPsNQgR/ot/ijPvaGPHz46ikkR2Sn8yyfRfN0bX6PKbt6nqTPfT7gyMQy85gOQNnhZGNEvdSsqKf@vger.kernel.org
X-Gm-Message-State: AFuF++n1iBYS7xqW3dB8aHuec1Rs60YXB+XMvdlbwb9IEcdwN6FOikJr
	5XvAsV8tnFpBujzdl7elHziRrQ161rnnVfnxVv4XucjyXPug2FDd4sdtKORTikfPOFjlM+fpb+n
	v0u+afkv1qddZVsP4k7pjNPFNKQHp29K2bVob+26lkmMdlzoyEtlqTssROcgMxSig
X-Gm-Gg: AYBFou1K+CR9IvMJAsJ8kFqya2zPBVOe5BYoatCPffYbHO85fGnSpWxYow+VT9tXDkz
	BkprdFb7E9JYqpIh7Ns3LEVAlAnq1xjs40vsOTMG/USWwPNKvyUe9OVCtSiL9hNlxKia94QUs0u
	P9ASWb8WwzLyJJbRjH5GrHyhpJgaORZt/nwQEogSetNMETYlwh08/5uzRkjTPcakwbwKKzxCtsU
	wDNXRTpZETMIH+0xnL37TwNq/WRRuoJeT4ImDXTYpSUms1NPNzrk0tBgpUNyTD+rGqDHhAnPc22
	XpPUmhWhDtTHTXr+b3tuyBuKLRvrxG3gOxQrz6nV48Hxo22b+KqvZ7hGAC5dfgQ68G26tzKdUSJ
	Zz5mclXLzZqOTkVQ=
X-Received: by 2002:a05:620a:a0ca:10b0:939:ec25:e58d with SMTP id af79cd13be357-939ec260367mr1128852885a.12.1789302754316;
        Sun, 13 Sep 2026 05:32:34 -0700 (PDT)
X-Received: by 2002:a05:620a:a0ca:10b0:939:ec25:e58d with SMTP id af79cd13be357-939ec260367mr1128819485a.12.1789302749044;
        Sun, 13 Sep 2026 05:32:29 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6499d57bsm329566615e9.3.2026.09.13.05.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:32:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP S32 Linux Team <s32@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michal Simek <michal.simek@amd.com>, Gary Yang <gary.yang@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Rahul Tanwar <rahul.tanwar@linux.intel.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krishna Potthuri <sai.krishna.potthuri@amd.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: pinctrl: Use consistent indentation in the example
Date: Sun, 13 Sep 2026 14:32:24 +0200
Message-ID: <20260913123223.99893-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11926; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=pFYD9xnmywcXUkGLbix3V2jspMeKMaccoDyDTjuRfBw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqppfXhbn/AsH2HCU28b+w1iRFMdoj44HN03Qm3
 9qsEYLGX6mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqaX1wAKCRDBN2bmhouD
 1zKAD/46HmSfdDukAVteVmwTPNNO1cL5boOFPkv4ZaaxjHIhnpTCrIW0WdWOE5fgJvjVwV+bPeB
 POxVwkDqBR8WdNMwhBksOAN2B9t6K/mT8VWgirLj4kJaweY68/N6GGVuwTqLJmHfJqFYDsFD9hW
 ez45yd6g1zgqrDDsd9oyrX3ERmzTtM4bqxvLFp0E2Qv9FgDpXXc4xGzsu2BD+0BwBfTaEFpepMo
 HjC2RXjiLCLufXzHIAA9i4agQ+x1I0M2+sAOk4sioEvDOeeBfDBDCVXQ+YPq+YqMnLMFUMmRzxd
 EeKQgkHRm7XMkDF/5QQxKdjDnf7dkG7MMQbgdooZGIGAAJG+WNIOpqQDfRpHHeXbeT3u6j1F4Tv
 sm90tdMOKMibTPwOr0oo5kSUS/jVKmg5Q2YzEFqlzDdRasM1ko5zYnSS7SsSmBYsxtE9Ewlau2r
 +3jATULQBaJ6vc3gJTdNu1ocY8OLKu3KDmdIUZ47C8ERQu1PBRlmQXC/DWMlwvG8KLRXGeD8Cfy
 vOZWuvUaw2+sU8pCu6gn/BqrmlhAdMDkwfBSVkFx3/Pse8y2L6RQ5stekSCSs6ru9avZLM0zNvb
 y9v20RgSOGflXFIFA69CaqMWm/hptbvXEVCzWUaTuzzPBysthZSsQMYhab3Jd84wdjQuZonyysF YnhKsJOyWxJxDXQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX66HwKaa0P9w4
 mZ1apXsroJfFJSKjDkZNFnPmGwYEvYtFATogAddz9lztC5U0uEkCRTA8xvmKfckJXH8gg65vRoB
 sENEzjZnIdiGnf+eRbgTNIJIiZPe3CrEblz2VVHEMBYhRmJwkIVgWRDmtQXaNoRSIfE/g58mYYQ
 GPIh8rbbBqYO2yRd7Ab2DBZmh1RDnC13ibDQp9J2oF+4DsC1XPEVULbni+oXJF9d8rLH08xeRMm
 JSApU6I+YnUcZWKnXOR2HHcEUitk27gIcLMThsnGu+Zac088TZSoJu9R/SR/odZ/Y8tjahwL+HE
 /QV7LWdokdsKtOHvkX3/UwMfV5SIcJcLwZnLC3Z2WQf98Vck2cty4utTpQE3hhNK3kNWDu+HaCt
 PGn5plpTzRlKI+SopINu3pS2JdcxeJwQTbAx+q5ROZFQILni9eI+0ugoHvy2L4rMzgBBwdRLAKq
 h5nM5VcVj43988xgbnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX4LmIKOSFAeWg
 H1TooZO2Tvxb3x5/58597KN9HwNc5G+lRKiIxIrUo0nvofFlm42umVLEdXxJZ+hL4i9qiWjZejI
 +aqtBIk4FtWyFzCoJQa2Q3YFg2KD0Y0=
X-Proofpoint-GUID: WadYlpLWlYH28dXrNcri1tT94CYcFu7L
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa697e3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=9YUYMJPlCa3gOHXfvi8A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: WadYlpLWlYH28dXrNcri1tT94CYcFu7L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130178

Correct indentation in the examples to consistent 2- or 4-spaces
indentation to fix dt-check-style warnings ("example 0
[indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
re-indenting entire example just for that is too much churn.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../pinctrl/awinic,aw9523-pinctrl.yaml        | 50 +++++++++----------
 .../bindings/pinctrl/cix,sky1-pinctrl.yaml    |  2 +-
 .../bindings/pinctrl/fsl,imx7d-pinctrl.yaml   |  8 +--
 .../bindings/pinctrl/intel,lgm-io.yaml        | 14 +++---
 .../pinctrl/mediatek,mt8183-pinctrl.yaml      |  4 +-
 .../pinctrl/mediatek,mt8195-pinctrl.yaml      |  2 +-
 .../bindings/pinctrl/qcom,hawi-tlmm.yaml      |  4 +-
 .../bindings/pinctrl/qcom,kaanapali-tlmm.yaml |  4 +-
 .../bindings/pinctrl/qcom,maili-tlmm.yaml     |  4 +-
 .../bindings/pinctrl/semtech,sx1501q.yaml     |  4 +-
 .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml | 46 ++++++++---------
 11 files changed, 71 insertions(+), 71 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
index 98c310a3c63c..1c09c0fd4930 100644
--- a/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
@@ -108,32 +108,32 @@ examples:
         #size-cells = <0>;
 
         aw9523: gpio-expander@58 {
-                compatible = "awinic,aw9523-pinctrl";
-                reg = <0x58>;
-                interrupt-parent = <&tlmm>;
-                interrupts = <50 IRQ_TYPE_EDGE_FALLING>;
-                gpio-controller;
-                #gpio-cells = <2>;
-                gpio-ranges = <&tlmm 0 0 16>;
-                interrupt-controller;
-                #interrupt-cells = <2>;
-                reset-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
+            compatible = "awinic,aw9523-pinctrl";
+            reg = <0x58>;
+            interrupt-parent = <&tlmm>;
+            interrupts = <50 IRQ_TYPE_EDGE_FALLING>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&tlmm 0 0 16>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            reset-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
 
-                keyboard-matrix-col-pins {
-                        pins = "gpio8", "gpio9", "gpio10", "gpio11",
-                               "gpio12", "gpio13", "gpio14", "gpio15";
-                        function = "gpio";
-                        input-disable;
-                        output-low;
-                };
+            keyboard-matrix-col-pins {
+                pins = "gpio8", "gpio9", "gpio10", "gpio11",
+                       "gpio12", "gpio13", "gpio14", "gpio15";
+                function = "gpio";
+                input-disable;
+                output-low;
+            };
 
-                keyboard-matrix-row-pins {
-                        pins = "gpio0", "gpio1", "gpio2", "gpio3",
-                               "gpio4", "gpio5", "gpio6", "gpio7";
-                        function = "gpio";
-                        bias-pull-up;
-                        drive-open-drain;
-                        input-enable;
-                };
+            keyboard-matrix-row-pins {
+                pins = "gpio0", "gpio1", "gpio2", "gpio3",
+                       "gpio4", "gpio5", "gpio6", "gpio7";
+                function = "gpio";
+                bias-pull-up;
+                drive-open-drain;
+                input-enable;
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
index 8ed53496c386..4ab1f00775cc 100644
--- a/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
@@ -86,6 +86,6 @@ examples:
                 pinmux = <CIX_PAD_GPIO012_FUNC_GPIO012>;
                 bias-pull-up;
                 drive-strength = <8>;
-           };
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml
index 948160cfbc5f..7275215918bb 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml
@@ -106,8 +106,8 @@ examples:
       fsl,input-sel = <&iomuxc>;
 
       pinctrl_gpio_lpsr: gpio1-grp {
-          fsl,pins =
-            <0x0008 0x0038 0x0000 0x0 0x0 0x59>,
-            <0x000C 0x003C 0x0000 0x0 0x0 0x59>;
-        };
+        fsl,pins =
+          <0x0008 0x0038 0x0000 0x0 0x0 0x59>,
+          <0x000C 0x003C 0x0000 0x0 0x0 0x59>;
+      };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml b/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml
index 1144ca2896e3..96c405711f65 100644
--- a/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml
@@ -64,13 +64,13 @@ examples:
         reg = <0xe2880000 0x100000>;
 
         uart0-pins {
-             pins = <64>, /* UART_RX0 */
-                    <65>; /* UART_TX0 */
-             function = "CONSOLE_UART0";
-             pinmux = <1>,
-                      <1>;
-             groups = "CONSOLE_UART0";
-          };
+            pins = <64>, /* UART_RX0 */
+                   <65>; /* UART_TX0 */
+            function = "CONSOLE_UART0";
+            pinmux = <1>,
+                     <1>;
+            groups = "CONSOLE_UART0";
+        };
     };
 
 ...
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
index 3db2438fadc7..4bcee7741fcd 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
@@ -221,8 +221,8 @@ examples:
 
             i2c0_pins_a: i2c0-pins {
                 pins1 {
-                  pinmux = <PINMUX_GPIO48__FUNC_SCL5>,
-                           <PINMUX_GPIO49__FUNC_SDA5>;
+                    pinmux = <PINMUX_GPIO48__FUNC_SCL5>,
+                             <PINMUX_GPIO49__FUNC_SDA5>;
                     mediatek,pull-up-adv = <3>;
                     drive-strength-microamp = <1000>;
                 };
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml
index 33cb71775db9..0bcafa78acb2 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml
@@ -234,7 +234,7 @@ examples:
   - |
     #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #
+
     pio: pinctrl@10005000 {
       compatible = "mediatek,mt8195-pinctrl";
       reg = <0x10005000 0x1000>,
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,hawi-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,hawi-tlmm.yaml
index 3b3961789860..2b1354e212e5 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,hawi-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,hawi-tlmm.yaml
@@ -113,8 +113,8 @@ examples:
         #interrupt-cells = <2>;
 
         qup-uart7-state {
-          pins = "gpio62", "gpio63";
-          function = "qup1_se7";
+            pins = "gpio62", "gpio63";
+            function = "qup1_se7";
         };
     };
 ...
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml
index 53534a07a1f0..ea7d4768483d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml
@@ -120,8 +120,8 @@ examples:
         #interrupt-cells = <2>;
 
         qup-uart7-state {
-          pins = "gpio62", "gpio63";
-          function = "qup1_se7";
+            pins = "gpio62", "gpio63";
+            function = "qup1_se7";
         };
     };
 ...
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml
index 64fe90b2391b..a0b56adb3388 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml
@@ -113,8 +113,8 @@ examples:
         #interrupt-cells = <2>;
 
         qup-uart7-state {
-          pins = "gpio62", "gpio63";
-          function = "qup1_se7";
+            pins = "gpio62", "gpio63";
+            function = "qup1_se7";
         };
     };
 ...
diff --git a/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml b/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
index 39d7dad3313b..f7a7551d7f50 100644
--- a/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
@@ -244,8 +244,8 @@ examples:
             interrupt-controller;
 
             gpio1-cfg {
-                  pins = "gpio1";
-                  bias-pull-up;
+                pins = "gpio1";
+                bias-pull-up;
             };
         };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
index ce66fd15ff9c..300d38f87f2d 100644
--- a/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
@@ -317,37 +317,37 @@ examples:
     #include <dt-bindings/pinctrl/pinctrl-zynqmp.h>
     zynqmp_firmware: zynqmp-firmware {
         pinctrl0: pinctrl {
-          compatible = "xlnx,zynqmp-pinctrl";
+            compatible = "xlnx,zynqmp-pinctrl";
 
-          pinctrl_uart1_default: uart1-default {
-             mux {
-                 groups = "uart0_4_grp", "uart0_5_grp";
-                 function = "uart0";
-             };
+            pinctrl_uart1_default: uart1-default {
+                mux {
+                    groups = "uart0_4_grp", "uart0_5_grp";
+                    function = "uart0";
+                };
 
-             conf {
-                groups = "uart0_4_grp";
-                slew-rate = <SLEW_RATE_SLOW>;
-                power-source = <IO_STANDARD_LVCMOS18>;
-             };
+                conf {
+                    groups = "uart0_4_grp";
+                    slew-rate = <SLEW_RATE_SLOW>;
+                    power-source = <IO_STANDARD_LVCMOS18>;
+                };
 
-             conf-rx {
-                pins = "MIO18";
-                bias-pull-up;
-             };
+                conf-rx {
+                    pins = "MIO18";
+                    bias-pull-up;
+                };
 
-             conf-tx {
-                pins = "MIO19";
-                bias-disable;
-                input-schmitt-disable;
-             };
-          };
+                conf-tx {
+                    pins = "MIO19";
+                    bias-disable;
+                    input-schmitt-disable;
+                };
+            };
         };
     };
 
     uart1 {
-         pinctrl-names = "default";
-         pinctrl-0 = <&pinctrl_uart1_default>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_uart1_default>;
     };
 
 ...
-- 
2.53.0

