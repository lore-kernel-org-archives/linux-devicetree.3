Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44C141D4EE
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 13:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431384; cv=none; b=QwDGA7zotJXKwOEj/2C5KcEXQTihJXU7PH2WiiLEt01YCmj986kckfYgTNwJGhe9PeKHYfdaOKv90a+hkKCD45XWCZ8CzQYPjz3owtPjLm9S9ACIugWjQOhkXiGEZ6xBm1UvR/Nmd/Xxn1cm0C7VKacAyGPoaTdbDl4AUMIJjs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431384; c=relaxed/simple;
	bh=LBYnKLNV6DLfCXsjJVNhlhUDruSjToXTcPI2Df9FIBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qsk/rg1Od5RxFv4M59PSmDqwQvZasBRNR3+UXFv/w1ICmoHHdOMCorqd73qXevEwYt6RTqVG2Vw0xwEA8YmnmjzwHVs0nWxouO0a/fgTX+8LnMfoW+E6AKug++XXyAIy2JQnNr2b42TBdo8+K0qhfxDBFH47xkaZK7W3EV/ucYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YW+u6zyh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PO4VHMMZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YW+u6zyh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PO4VHMMZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C9LtZ3740877
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 13:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EfPCKJCX9Psi/X+8S1LP/ndB3e89+jWH97ope0ZUE88=; b=YW+u6zyhTz0zSFHy
	t+CYxd4mXuvLPukcZHfJMqNH6hDZUSRtgdeJlinwamW0oPtSJOrvV8i8poaJC5gz
	PulKv2yRvSNMvlewhozbp4Zaa9OvZixVWwx0k8hZab95KIyU6PRkKjK894ePanKg
	itfa7CKVfh++bWXlW/P67M4pTsG2LnSgkgGy8FIrfXEbYXAF7Z5mpzatNf3HymhX
	xhzhXMquRUHi4W3vCC3fuahoPUaPXx8YWvEYp7FIoMl86F2rHCFbaeYsM4ACxMDk
	dAvROyvfukZdzV3aHmXqb5aH+Mn8dSgMhdr6XaT42zmglwV+dcoo+Mm4/NNLaCya
	3ntK3Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9a9pm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 13:36:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21c01cf3so90908041cf.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 06:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783431380; x=1784036180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EfPCKJCX9Psi/X+8S1LP/ndB3e89+jWH97ope0ZUE88=;
        b=PO4VHMMZ2DZSZJ0SYhASmU0l9LMlcGCQd0nruAxPmgPTF9CNamtkgH0hWRGy8serus
         TB46Mtn+uZxtkRuQRZqgzs6xpjVN5VRWeqMRyGoiycC6L3ElADTE7iJe0/wupEZcWaGj
         Aq4rwJIQD2u/KDdD0jHA3SU/pCQKjz6mear7/sXvGBcoLQiWsEiwsaLlD3pQUkXQjdmB
         2hXHIiMPT8B+gyxco8AiCsgJDiwxpYzpvxaHYMaI9PuExsrVxnRobRlpfYnrh7L5l0WI
         +D7m6HaFhl2mARVGFYlmXE206EwZG3yD+h9Alu/1Jb+pGrFjykjt0HKh6PB+5d9dgbEk
         9SFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431380; x=1784036180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EfPCKJCX9Psi/X+8S1LP/ndB3e89+jWH97ope0ZUE88=;
        b=pTjYFKA7qB4YGdnHHoviYrZkvt04/SyptQtRChE39yvvKC24GKHc5DUVYbLJWfzEWp
         wNtqs4N5NFuBadUqOqZTW1+Pn6SsYTuITcyr7J8LBEwY+TAQEZREV8K06mNKNG+A+rMw
         f6nzsVYsgDvybVpXMsJFZZ3ublPW7aeTRCPCeUYEu+rgqayDQpsWttjYqj4tKAjZi72K
         /fZN/0eOSRTDvmJiMUdFzQ1Amxl1XtztMa9AxCmuxOI0pxjDw/FDxAkDLdxK18x7ol5q
         LMEMS7HYcFuUjpvLqAsX1TvidkAjFWHHVb14paca/15kjQ2QkJmVgBk/Kj8TaDIbP6F+
         shWw==
X-Forwarded-Encrypted: i=1; AHgh+Rq354tenmTXXYhh+2T2SFpPoDr8L5kvhV76cZkwrlNtM4fy9GXNawWsiY8yrZFsYHMyMgvg0zogIvqi@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd+bFN06YVbHuhx71uLBfMgfbXodXuv6GBRsBzwYbhfqrjcF/C
	T/jKEdRcCPVXX4S+rgXBPWKrUOKihsMSa4fN3ZjqMb6PYvBeIZAklSDTstL9GX7iutg5BPl+aBB
	LNerDf+/IUvN0S5mAUotvf3rvEo34EVVmLxUu4jrLi2zISJ8GJXMOe7xuD7cxipzw
X-Gm-Gg: AfdE7cmVLFApKv3BkLU7RLT5+WVwY/N5Q3WV4p5qLajdy7Lzscjms7r3WXFbbt4LtT3
	ntcK3cZv4VkpbYwR+e6+3X5WU7aIWoOfgo9ROKFRWY0b71LGeBDw0IrV0zXg1jl1+uc49MJw5Ol
	+omnkXnYLe+yOVdgyFPcs5jHw5kc8TsiYSdfax0643fDkxADKWkeeZBtZpaBjHGIFfjLP1A7P3g
	ajOaWqvJfo95DdRiYuPaZtvFzgA4Pqr2/N/VNflAmx/JhUJ+hz8ror6i000vb65gK1QEZF9Dv17
	CImDxgHrfX41fZRwzdM08sehXDeK2wF7QIcmTr7dB2bKWSi7X31mDbWO9KrnWhNyBd1vM02k4y8
	3uLl3Vq2HQiEmYZ9+FM3w3b+rFXhWwr8kCzc=
X-Received: by 2002:ac8:5e46:0:b0:51c:147d:9bec with SMTP id d75a77b69052e-51c747be073mr54621611cf.6.1783431379689;
        Tue, 07 Jul 2026 06:36:19 -0700 (PDT)
X-Received: by 2002:ac8:5e46:0:b0:51c:147d:9bec with SMTP id d75a77b69052e-51c747be073mr54621331cf.6.1783431379194;
        Tue, 07 Jul 2026 06:36:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b0cesm34258187f8f.22.2026.07.07.06.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 06:36:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 15:36:00 +0200
Subject: [PATCH v2 2/4] dt-bindings: arm: qcom-soc: Document more of
 existing legacy style compatibles
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-dt-bindings-qcom-soc-naming-v2-2-1b7d695be2e1@oss.qualcomm.com>
References: <20260707-dt-bindings-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com>
In-Reply-To: <20260707-dt-bindings-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3190;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LBYnKLNV6DLfCXsjJVNhlhUDruSjToXTcPI2Df9FIBg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqTQDJhsSScj7W+3/2MZECzUJYRXNZCl6MFzC3K
 ayYFHdRZ9GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCak0AyQAKCRDBN2bmhouD
 11JwD/4xhS1F45tuEfqYnXN/zwejXXePnPIdnwnDpSPlz4rRqFJ/ALIwjX/cxhJUquGTJm6RrDc
 vSfgr9qohFVpwqVmMUgE3OTInC3SLByHs12ZGTq17QXqyjwl02VkhhK2KVP9Ps0OqzZoIJvUOb2
 aTb1QOI0h6kqqbk2diqvDVZf4SkwBb+6t7XopnPdgG8dM5qz2nwkQ9B48PzP3ys+06zItTrF9bK
 qlYHve2dqb7mQHyqy2VB/zgimcawBxGbbVThvo/bOKTrjkQDz7Unj47/Bn+hUxQ/vHbpmO7MCgI
 Ld10jid7pKQVw1jwlJwUA1wt1vQcMhjuvBo7bgv7xIqwpD6Vzyk81POrp0I6ilmGyABVBxpfADx
 +682HnwtBnvRlID2lBWzQTEXsqN/zazX9WCdtlmYBKTBPcRH7Lac6pIDu8ytkjqocI7pPYRpSpI
 Q0plpeTg4dSv1+gVvPWhAJ74H4dNkgK2AVaWudHMOKRnIshm5/hl7SeQd6rIsxFN9pxYZ2dl9M4
 gBAjrWRmW/1A2Cx5VOFIVm6CoUjkGunlBGrbJbxxh+W46aYm9cdEpjOsYS5LMrIu8DpCjzJ+dfd
 f+BDXCDvaqBNvW77V9IAQBIQef9m7h8+g14wfyD7q7PtUmy4WzDuHM5WlkxQM5XYtPg7sol/jsy
 zdyQAtLbwIYA6WA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: rgi5ZOqBfAVozkIMmJu_U_9rQes5UXDx
X-Proofpoint-ORIG-GUID: rgi5ZOqBfAVozkIMmJu_U_9rQes5UXDx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX02i8+oKbR+3H
 d1+eUzP9ZN/vi6bQnVc/jYqMcz4GUz5mHj/jpJiATcXOvvs4L6C4Pfx4Si1qyKOTQSdJ9PbIdHp
 z8MJbDkaIzP1xcswbU+W9jHttZZTDyw=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4d00d4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=zJ_s7DmfhzOieU7mWMIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfXzqeQPGrsHhcG
 fjS9ovuEDDLFPDjKiAxM+G6OrfGObVpPfkmz3Bd79VUi+LUPJrKxaHwbHnOf+NtoL0BJGYESHgZ
 Pow20FJHjZFwIhAMTjOgnQwYMnlYx08m8yHQPfk/tI59smlhOYe5rlctiUNvWbvzIHXC08Urwu5
 pdwIIsqIBlOqNxg7bkYnQ4hirJr0BY1ns33/59/nnqXtM94ZV8i7NobyVbiK+Vrt/wWUMGGFZ4C
 Mpsa1gwI1VQXCXpYLGiunenV/Xnm92cXN1BHzOWb4HkzflnJRXICGMrR0T+2zGyZAJparR3w5fU
 UU1v7Q2kxgfsrOMaAP0GGspTndVPfld5Q+0gT58xBUXqMpmHuiNJ/blpdS37AIFZG4xPnTcGa2e
 lYK37Gb4wshOrb9WPqqv8Q8SuNTYFmD1dSRcJZ+OpTlin+eO+iyrjXV+iIptEl5mlG3oANCig9y
 zNqKJ5ot0VMt/KkkkoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070132

The schema misses several old style compatibles with SoC component
trailing in the compatible (qcom,IP-SoC):
 - qcom,apss-wdt-x1e80100
 - qcom,apss-wdt-xxx and qcom,scm-xxx for SoC with code names
 - qcom,kpss-gcc-xxx
 - qcom,rpmcc-xxx
 - qcom,tcsr-xxx
 - qcom,usb-hs-phy-xxx

It also missed qcom,ipq806x-ahci.

None of these were flagged by schema, because they were used with
fallbacks and the schema checks only for single compatibles.
Nevertheless document them for complete picture and for future change,
which will apply the schema to fallbacks as well.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 1f9e52d9968d..d934afd59df1 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -40,12 +40,20 @@ properties:
 
       # Legacy namings - variations of existing patterns/compatibles are OK,
       # but do not add completely new entries to these:
-      - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+      - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+        # qcom,apss-wdt with codenames
+      - pattern: "^qcom,apss-wdt-[a-z]+$"
+      - pattern: "^qcom,kpss-gcc-(apq|ipq|mdm|msm)[0-9]+.*$"
       - pattern: "^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
       - pattern: "^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
       - pattern: "^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
       - pattern: "^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
-      - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+      - pattern: "^qcom,rpmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+      - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sar?|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+        # qcom,scm with codenames
+      - pattern: "^qcom,scm-[a-z]+$"
+      - pattern: "^qcom,tcsr-(apq|ipq|mdm|msm)[0-9]+.*$"
+      - pattern: "^qcom,usb-hs-phy-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
       - enum:
           - qcom,dsi-ctrl-6g-qcm2290
           - qcom,gpucc-sdm630
@@ -55,12 +63,15 @@ properties:
           - qcom,lcc-mdm9615
           - qcom,lcc-msm8960
           - qcom,lpass-cpu-apq8016
-          - qcom,usb-ss-ipq4019-phy
           - qcom,usb-hs-ipq4019-phy
+          - qcom,usb-hsic-phy-mdm9615
+          - qcom,usb-hsic-phy-msm8974
+          - qcom,usb-ss-ipq4019-phy
           - qcom,vqmmc-ipq4019-regulator
 
       # Legacy compatibles with wild-cards - list cannot grow with new bindings:
       - enum:
+          - qcom,ipq806x-ahci
           - qcom,ipq806x-gmac
           - qcom,ipq806x-nand
           - qcom,ipq806x-sata-phy

-- 
2.53.0

