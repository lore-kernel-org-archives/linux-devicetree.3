Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9032673AA
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 06:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787033779; cv=none; b=rZ4pPqofCJU32brNJHCWqXHN3gHaSJApWp/uTysNjEuf5CKRPVANjXKAKnucuFEH49IppzyeJlr5qhkS6VpvI3rr/k486Gk9JwxjEuAPWTvhPfxXeRdKQ5TO58mQZpuHwXC1A+b3WBOO5VqsHdcmAXVZSghwi26osGZ6bvo0yoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787033779; c=relaxed/simple;
	bh=/is5SgytrkIHdFXe06oiFMuIPo8NyNLeFkAO6WO9tVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D0smcDDmh87iP34gLldENCSqvJ9ZG//nmiwAEpFtYBfC1PF43ma4sQlwtD8f5GCpkEgodRffF4/wLBE7Nx+BxLaYG2tfWbkW1ED3YUBMrOrhPmdWHKmnItCs4g9KDqDAJ4f/EhVMLm27odnPJTBhvBm5IudlCiIQ6w6m5xgBwFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SXbccHd8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EbNfaAai; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SXbccHd8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EbNfaAai"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I3r1SB477828
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 06:16:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wnwKj/cpjqzP2EkjJrznRodw4/AjM4xdBiQY4QDGF+8=; b=SXbccHd8ACFqUp1q
	wvv4hg+5bzjHMwsUcAcW/fXQo4WBWFiRRbkK71EO24hiGWXTOJV5RMlQw3iNd6wp
	r5Nt0UxhjnA9zSlOtlliphWID/4J8vEuLDmSrX5RGDtS8e0YCPB2TutPGlvtY5ki
	7O4CUwujK52Q2ib4QV3FBCEnI5e9LuM5qCiP7eC8Vn3M4lyMard2EUfbenlTovZd
	QiaM76w9k/sIjKSPJOWrWuCu4lFKrA3BnG2163WY+cH+bwckyqKXTmrTDIWFTdXx
	OaqPWOVY7a+erf7Le92GtKSk2rKBL3yKgXXU8xIpMZxmIB6xxq3+gACgA4Dea1ly
	orda2g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fvp0j6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 06:16:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc73f47bdcso54176415ad.3
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 23:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787033776; x=1787638576; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wnwKj/cpjqzP2EkjJrznRodw4/AjM4xdBiQY4QDGF+8=;
        b=EbNfaAai2eU+XHcmfh12HBSdQEQefXxyMrV9Ftif1+wvUvQDo5q9LymlPqFfaY5IC1
         37MBRC7FFLvwkGycSi58URfgX93Adbx31O/QTdp1Nwm7rAe+X9km+xbbejou6g2O8G9i
         Bt08oTwnU7C3zrALxtjyLUqZOkaV6m9L5TXYboPPbUdreRLI/9aCYSKWr5/ZLkh916mW
         UbP8GPbyizWgBpeIs2/tPmnsGaLdG7rXt4JsyL+XRWTNkZL+vdGJXzkwM9gsTqAtQbVw
         OLbQu5bdVBNSz3PG8CulBaCak+cvfqe1o3UyxhPSjbKKC9sqyhdtCjRpaGjp2yP3gWJ0
         ksdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787033776; x=1787638576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wnwKj/cpjqzP2EkjJrznRodw4/AjM4xdBiQY4QDGF+8=;
        b=hgyUeZEv1HPor0Eg3zGB7/4+UfWIaAk8o1VbEBUWPxC9SPVMGJD4PoSbZVavWNiQz/
         9tGPKBqq0Lkbhdt3NQ40/gfJvtFryZEpm5QFV27IvNVLbqp17o9pvQobAYUvgWzPjEY+
         03Z8fgOvB8RtVFr22DrYpB2p1/h3l6IauLDyOrRtwmiL+utj74Fp/K574FT9o4Ak6VfQ
         xhKPqa2GUbPfTnmuqaNINqqonqc0rvnVpVaKCiIV3u9s3T5GveWcAnFcTx7cK0BvPMvn
         2k+jFa61kLfTqk7WIexCi4bGLwg6jUjgs8ynTzi5x9g2B6zBoHMOpF59f2MHVjcS1Oq4
         Cv8g==
X-Forwarded-Encrypted: i=1; AHgh+RpL76cUBCFMR9nlCs8CZtRhzi7RWD+psip7q81IkiBDDZr4fvKRHPR5R106hb0wHzfPke1vgqZtk4ej@vger.kernel.org
X-Gm-Message-State: AOJu0YxL9c+8G3DYQw4awYFpJImLTdQayNd0HTWIeXCQA0bU2uzLSqSk
	d1jCkl0JGUO9/H2sdCKB2HUSnmIOX0zv/MltyHFeq92ghl5G9KCkgbw3Ou6L7JJx2Kg/+SpbtzX
	TmaeV1klZOjWkwmNsYV/dWdcX7Z3+Na1OdpRreezHAV6If+I3sHPi5wCIN5W8z/Fq
X-Gm-Gg: AR+sD12t4SwTNztx7mrpSPsgVEoSYfvBQm8X3FZ0NWetuqqSZdqReyLUU+Jn93RCAXX
	lgUm9fr40Dtz3gUPBnUGW8b63HXCVL6R6nXwzqnyvGZvbO0u1CcElUX9L4F6h6aHGbWQcznfnlq
	42QjrIYAauNQc+CJPFA6irGCLaue8pML61xqgV9C++sWX71lPHaQdox07oRPBOLHMBKo7sVysbR
	nnvYVfD4mNRrkkJBjUnq+nWbcGWkIuHXii7W+PT6PrfBZhwj4MV4FfESqsCLqMURU5VFYjIklul
	tvJ9HARkPFdFrObayfsMkvymRcMIZWh3JfsiDXWH7/UrGT9D0XFOk0IY4KodoA+yjYVoZowcVfX
	o54mYWQ1q6ByXnCsfkKTSIAMKU+qg6sYVoFqAGM+WLINxJahIako=
X-Received: by 2002:a17:903:19eb:b0:2c8:1f58:55dd with SMTP id d9443c01a7336-2d5c4f3d45cmr77390185ad.9.1787033775567;
        Mon, 17 Aug 2026 23:16:15 -0700 (PDT)
X-Received: by 2002:a17:903:19eb:b0:2c8:1f58:55dd with SMTP id d9443c01a7336-2d5c4f3d45cmr77389475ad.9.1787033775127;
        Mon, 17 Aug 2026 23:16:15 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb499d7bsm13719685ad.3.2026.08.17.23.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 23:16:14 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 23:16:06 -0700
Subject: [PATCH v2 2/2] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Add Maili QMP Phy
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-maili-usb-v2-2-97d7317f64b3@oss.qualcomm.com>
References: <20260817-maili-usb-v2-0-97d7317f64b3@oss.qualcomm.com>
In-Reply-To: <20260817-maili-usb-v2-0-97d7317f64b3@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787033771; l=1065;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=KztRx0ikqSziac1/mJYrT1Hz98BWoCR2B3clcv6ptyU=;
 b=vLCyx49Zwam5PzdPiUf7rV9nET3lcI6r9nE3Rzm9e4pHmlUHfSyRJP9cpOhGf15E9V/ZSwYZe
 Hg4gHt+6t3LDjNPMqwgN3bGerEusqohcv4OPMWmTL/6u5juI+iTsLJB
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: qYGi9P3xKiKf3GffIQ28JU9SahETGKNM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA0NSBTYWx0ZWRfX3S2XOR9wdHO/
 XMRf6XRdcQtzvxaMDEovBwKBlpE7hUr8kkmdphWAhiMuC9CIZPpyIHtwA9WZyGTnNfH90CWrucr
 QZ/zYsKXVEbbIJM13Ab5ZWtsZpkEtE6fO5bkRJgEnvxDIKLjAOeAH8xHEfsCeeziNqvZtQCbi18
 wNxcBldXEaCF5VoP//AzZRaqcmRBf0iRwZVSROFtQ9k7t7A8nemZYDgdIlZSap2LPu/XI0mpKwR
 bRhxTm53LZFAVr86Kx4/oNooAhmWN2drAzhTqKBmRnW6HHn5OWGH79RmC8ZMKKBkG4cqr9c56y3
 SkSEtbI4urzkAo5yhr3jxVxsiLGqmeVTXkTGgx9B6AZj4mn2o44G9v036tEbK/PLWUyXOeUdfYF
 IGZB452hwjJ7kXSQqT6MHhyJZNMg2+MEL1H2VQ474aArcyZew3I+ttss4GKWY/ZDY1Ojt9Cyhsu
 ihrVMv/PCQCD6gwpsHg==
X-Authority-Analysis: v=2.4 cv=K/IS2SWI c=1 sm=1 tr=0 ts=6a83f8b0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=c48FE4Zzs7BoiMeBshYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA0NSBTYWx0ZWRfX9LTyliJvNODb
 g/1r3iTuMU4j8MpMZ6peNpPmfKsfCbsCUZ6Y5696TkfRQ82omYpFIAPysHw0nXHkwTx68yl4hdg
 wqNB13R8q8fLVPw0pb2lz/PD71QaU9U=
X-Proofpoint-GUID: qYGi9P3xKiKf3GffIQ28JU9SahETGKNM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180045

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Document the QMP PHY for Maili which handles the USB3 path. Use fallback
to indicate the compatibility of the QMP PHY on Maili with that on Hawi.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 8adfc78108fe..1c6e8e9b9a7e 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -16,6 +16,10 @@ description:
 properties:
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - qcom,maili-qmp-usb3-dp-phy
+          - const: qcom,hawi-qmp-usb3-dp-phy
       - items:
           - enum:
               - qcom,eliza-qmp-usb3-dp-phy

-- 
2.34.1

