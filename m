Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396B948EBDF
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848829; cv=none; b=hBLBrp7fiXm/MoKprgkWqQTg+tu6Qvz8HxOJUDar2MkyQG5b4IsAvYNElnbkjTDl5ILIsgJWUplvvIOPrinDDstHSw36OLxI0ZIaC6PWxHXnN00+7V6bHOtOrR1Bm8OXGEHn0fJc3AxX/exPPSu1AzMGwvvzwVmupwM0o0D2uGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848829; c=relaxed/simple;
	bh=ItYoLNnh/itsBdfqIb42AjjkJMdlnXNAkIHidF5zyeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dJk5cFhwkgXGF6iCZ9T0jAw7EGhXRPLjubpRzQIuNlTVUniO/1Z2+jypLDzkCgDg3IGoYvNvJri7wUc0ymY8c7o3o34hugcNkS5+w2kwljfxav69wVRsAVagHv5M9xFoNaTJuO5D4Q8z7WD4Fih+AREiXqv2ePivbAswOdZAWEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UqZLxvK2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IF8qNu5R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UqZLxvK2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IF8qNu5R"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFboUU3921237
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C6e0CuKO+gMRclt1VJTiG7s7VdbGf2b3bc5vZVAaf7s=; b=UqZLxvK2vO91YEUi
	pJZnqFrtif/Sbdlr6t6TuICOpwkSgbdXgQ+/OLP7JsZwqsX3aL5SzqHIEeALUdlJ
	AG5hY8cl7fg2lpLy373f2qCApuqXqgTSLOYAnszoNadgMgKliyrvkUaQzKui+NVQ
	iw3cgKnn5is+D70fa1MM5InWm9/Yh8ZmqJMhXRF7dCwNeMrcKS4RpzdxIN5JNoO+
	/iQodhKyFHYTul/D5tehAjUKxrDsHDzuTo4d+YiPVvq/MTvMQJI2flei/dQS0R0B
	xOC3cIuB7K/9wJ79jwwQNPmywFSK33dgwGltmE6WT1a0NNL1RMsPTldsIxoXMBXE
	sIbhbA==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gaphw0nv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:40:27 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-44aeefa1c36so124615fac.3
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 09:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848826; x=1788453626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C6e0CuKO+gMRclt1VJTiG7s7VdbGf2b3bc5vZVAaf7s=;
        b=IF8qNu5RODMtGQkNV2H9KrY87DxoUY3t9KB7wBwMkAnABzcHV43gCofrOCUZDw/w9R
         yZFmK4lpQ7mkDqRF+kvyeVa4m/fWVvM8O/Ags1pc9xNqp1/pDaLKWGSDH9zjMczUSSbb
         PAApnnYUzv4eqpBWOMS+sZnIJen6Zc5dohOIPzI8WfxyWEPc95SRwx+NYvPKyPyPdAWB
         05X0F8NgALivfnbRt2cvl5B6L1pnaeXUZOF+g0qI6sqzHPEpT/XMG16fKp3bSh420lkN
         VZoxmuEJ61nkpiIh3Fm1HZV/X8l/VUKcbos8oWkAAxWsKOAohA1RHgtmrpQiBBjaLlDZ
         gu9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848826; x=1788453626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C6e0CuKO+gMRclt1VJTiG7s7VdbGf2b3bc5vZVAaf7s=;
        b=ai6RzXQRLMsXOVaYaZqW420DaCOghIz7gENKNLMhYAsd2gOILliX5sfrOAxdXkMQ1u
         x6QQY98WqaACE9yeP9kwNBFYuPmMuNdlcWuc1Zm7mUDbY/wS+xc5YXXNFfgxpyK/Nkry
         VQ5FqRDJ+43zCpSkmCWUKijs9nM0brSVdR4UJum8/2TRLan2kH2NSQebw0X81FWT1AUL
         jtcTcTew59YJamPijKKjskTdi3ZbfTE4xQ4P8qgWzu9uy++tA0tAXmhsO9wyb7IveqsN
         SUhls0xRJmo/OQ7QlIwkU3f28SENx26SfGmfrdPkK1mECSDGxK+xT1CdUbsgDWfj3nLd
         eeCQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr3UD8dIzIqJs9bXLaeAisR4jqtq6yVATpIlnlctnnPR8TFOcVuflzGTIXnAFy4LWVFE3cSeFQvtebv@vger.kernel.org
X-Gm-Message-State: AFuF++lv5ImAYMwfVmOpNwkIIovmPM5gTtYc/xI6ElHI3WNvkG7C4/rz
	Ye6jajBWQhS249Zw/YhImF7+eWR95DW5y+f9tsSAGs4YmrXcrIBVd7lmiNoH0E67CLtPC0gElrX
	y6IhOoOgNIE6buEovxw5HQf5SDRl4knckyJjc8REfdZhZ3nvZr4T561k+/8Niq3Vw
X-Gm-Gg: AR+sD12A9s+0Uk3bDjsQjggRM32Ln1jX/4Ds0fPPUI5Ob3ofXQ8jryl9gTpQw/LZE+4
	Y8khM03keqABNVffdn/bPwAJUN/x+nQL+Wfz/KyD3XSSc+QpZcXQ/BtETQvSRhPdDWhwnnz/N0Q
	enc5ptAT9lnMHvOOW6a3m5gqTL5GH8Xuk7p341sPmSHANOvzczs0uRsnOdvog5lemK/KvFUMlAv
	4nMix0lc8NTZ4OVYptZzEGbkd30elLPRkv6qsIoSAzIet8o9NP5BOkKeiMU5V9Cto3sDo67teI7
	SoTD1W7q7yuGIvHlCWXVvCnlYTqWjW0YbPTR6P1qGu8zrnT6a7fuzTPacddbZ/QC13JWOX6aIHN
	I0d0hEUaWTVjdTYG+mQ6dNR70Qx9iD9wcLK/yMO0r0Xmc6Y1Cztsr8baVSh8n7unxvRkGlKIk9f
	8vdDrTCOen/W9G8b5rZ0pAD1E=
X-Received: by 2002:a05:6820:708d:10b0:6b1:56cd:3aba with SMTP id 006d021491bc7-6b1a049949amr12074805eaf.18.1787848826580;
        Thu, 27 Aug 2026 09:40:26 -0700 (PDT)
X-Received: by 2002:a05:6820:708d:10b0:6b1:56cd:3aba with SMTP id 006d021491bc7-6b1a049949amr12074748eaf.18.1787848826104;
        Thu, 27 Aug 2026 09:40:26 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:40:25 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:08:15 +0530
Subject: [PATCH v4 14/15] dt-bindings: arm: qcom: Document Kuno IDP board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v4-14-dd34f235fc1a@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=2321;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=ItYoLNnh/itsBdfqIb42AjjkJMdlnXNAkIHidF5zyeE=;
 b=87A7RM1KwSY1nYcjjTADj26yrttlOs8VbML+sC4mpHS4sR2pDHR62sHHEgj/sbMN8OGieqOo4
 BGSVUijMSaLD/SZXRClKti/MQbD+R2FJWPXbUf62hOHrYAp4gB3IEMc
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: RF3HMO943R1v82Hzf8QdT4zlWlM4e36f
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfXxsq1dbGCBi/1
 84DkzYq/5usbKCqrERoR88nxSDdVB1b1I5wSFGEpBE6hqbFg3uISsQhagrtcB5ZLrdXmeUoz1EY
 kFjmCXYql3J9SuYqjWcUoDKp2T4xaAM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX/S5eT7ZpXYZ/
 H06YwVcOTSBmSysyxGtMprdNhtGcSNT3EmBaq/pQ/eFDBOA1OAZymOzujUU6lWi38By1X5JyjyT
 dM1Ql1f0MkQygIGktwTVquOF0kdFY5OZJ6azHAKUBe7y2axP2EiA2d9ywgc454bJ533XBUnB4rF
 c4f5ZzpfKM6KpBWEfHV68o+a9QGJsIWiJbwMD9SSsEdQUC1BT++VkDy+o+mBba4yiOqvRzR8JC+
 9enkD3jtQQmn2K3i2LjPEeF9ae4cgqN8GA0CCqmERmqXvdv9pAtGMFnMeg8JYtJ+byXqXGRBDj8
 BYDQBd3g4JgZ4DEdCKCILeecvfsP1sPzNKNvxUX+efHNBTPUheJlosLsT1FMPIO1y2oLvRw9KcX
 T/P5M7aivDOHn0Al37/63NwJRD23MvySXAq2F/E2ldEnRsUzan2Y/yL4jrg0P2posuhE45lG29P
 j4hmJuirQZAmThgbzgg==
X-Proofpoint-ORIG-GUID: RF3HMO943R1v82Hzf8QdT4zlWlM4e36f
X-Authority-Analysis: v=2.4 cv=E8b9Y6dl c=1 sm=1 tr=0 ts=6a90687b cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=vXfy1ps2I0IJequeNBIA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140

Document the Qualcomm Kuno IDP board and register the "kuno"
codename in the SoC naming convention schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
 Documentation/devicetree/bindings/arm/qcom.yaml     | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index e7160b63d814..179aadc86a9f 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -30,7 +30,7 @@ select:
       contains:
         oneOf:
           - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-          - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
+          - pattern: "^qcom,.*(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
   required:
     - compatible
 
@@ -42,7 +42,7 @@ properties:
         - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
         - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
         - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
-        - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra)-.+$"
+        - pattern: "^qcom,(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|nord|shikra)-.+$"
 
         # Legacy namings - variations of existing patterns/compatibles are OK,
         # but do not add completely new entries to these:
diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..ca02a2f0396f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -175,6 +175,11 @@ properties:
               - qcom,kaanapali-qrd
           - const: qcom,kaanapali
 
+      - items:
+          - enum:
+              - qcom,kuno-idp
+          - const: qcom,kuno
+
       - items:
           - enum:
               - qcom,mahua-crd

-- 
2.43.0

