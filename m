Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ABE3E316F
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 07:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783321891; cv=none; b=fenzp0aQOmA37SMQrYrIhXDNrr8W7EFLBuAHUyQ+MIC/RXKxpk+Pmt4S2GGrCeuDU0F+JGQ4kMb+esvUnH0Y9Fxbf6ohRflvY3qc0aCAiNBWSrgiciLx/a8yPOTTptwrQCMDuGhgsTcQLYplHwr07oY0bvmOPNpsVD89EbsRVno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783321891; c=relaxed/simple;
	bh=KKXZeb1RE0r005VvQQ7JENvpHu510rqjXgwKJAo5iQU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Caqqg+tAIBGQQoVFcHrCPvoqxNaVs4dJL/al7Uh9O33AXHWJtvB8m70qtU6dGWybE/oT8jzzzUe1I/YIi1gJLTDMUR+PV1bph0dRjrjgSViLFPUpVDiMTWGULtoWw7RVNKoUjyGLd5F9s29mSvc2THEbdkw8hoVKUEjBI11iZME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UMnyBI+f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OgAc+Uxk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UMnyBI+f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OgAc+Uxk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641REb3585267
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 07:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KjE3aY0Hltr
	ecpTkRxum+Wgatm3vTg9XNPg/fbiZ22s=; b=UMnyBI+fLa7buZofz48salBJNU2
	JqbWnckE4T1F7ExiGYmWiIwpTAp/Pb8YMZFscaxNenoQIcZ3tRT+OTA5Yl+K2YQW
	6NUUEkGJ6yYlLS8Nq86P4qxeQLoxFABvXZE2yqXcdOGaftxrCu05axg81W/VU2vF
	U2IkbXiDnpROHMTuHVjKhFA3dYERcYXT4a5vhR5jzMXOb2VUK6P8dStr45xo7Ixh
	LjKUASyWcPAKQKgv1C2okskM+91Y6BwkAcaHwz9EP7PXEmeKXWk3Bw9kIYoczlj0
	aeKX91pmbQ4sROA+m+xtFtf01fKrkGbaTM9ySViOqA5pbAwqwWOO0Q7mHzw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6t8un0fr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:11:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ec45d9628aso65473966d6.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 00:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783321881; x=1783926681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KjE3aY0HltrecpTkRxum+Wgatm3vTg9XNPg/fbiZ22s=;
        b=OgAc+UxkmaoobJ10e5CWqEALgyUwmr5TUOC40BI5+owf3lw59C2+dWx/EtCjvfbdXS
         SZZwG3qI+DM9Yc4Yu0Rziwcew7wwdRyGVafUB1cCusoUnBvEIgX1MctlE3gRnM2wm2CZ
         yz50xb6JGFGXr9q7klf/juk3qv2GY8ITQ/qNQMCLFNDiaagqhaoRRlM7aYtQtwvhThPQ
         eok3fpsKzrxtDL5gGc0nA+TJZE0hAQlJLPRofL5uNfjpqmVj48iLzlfxa5CqjMqmS7u0
         Gc+yuOFXxI7YR69s5V9DS3xPWqB7VgtvMbpBlAByb59mCvVRZ14AP8wBGSbQwp0ewLgk
         p/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783321881; x=1783926681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KjE3aY0HltrecpTkRxum+Wgatm3vTg9XNPg/fbiZ22s=;
        b=sQb6HeBfo6YeasA9fYM7SztLzmlpVQQ8P+nQs8MG22mEuCrRq0pdvv0hsChVhp1aMj
         Sz+P/jfRPBPH5H0VFThbGpTxZuySP7pwjjNsY0pzOlgsBqK9f0xlj6aoNOOYpzF2TCPL
         ExtR0wKSsWcl9Vg7WThV0m1OzFX+Pv74MnfnM1d/CZuYliHLw2vuEvmaNbB5h2KfxUY0
         f/EEqozFbroyW33wl6Km1iZ5yr3f+0UQyzSJcUc3k4Slizu0M5mKn5mz1IGWA5MkEsF4
         22qqoAiY66AL0IIoh+uXRA6Iur2qIalnV15/0GFwsTb5b92mrHM5Che88+mQ/UwGYLWy
         ZT/g==
X-Forwarded-Encrypted: i=1; AHgh+Rp3Qj4o5Xgityh8OnFsI7xpjBSOfQPCU8IWwPEcH+CQBIEwMBMZlGfEpkvx9I8eErGxsU25UVL/bQjp@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgpdk1dancsI7Pv3w6S+wtvdVmsYKwwwZ52vBkdR6s4J5lPrs4
	rEB6P4YGeWFxDTwAeb1nKK/D7JnByRNkEIYKpDr4ggivckLeHTt8vJfF1W4YHY4yk9AI4HS/mte
	CWWBWHw0aIK1obA/lQevgZk1AOZWk4hFTfyGZvdqr9l7NnJ7i1MpbtcDP80RJYotT
X-Gm-Gg: AfdE7clmIS6+8qWTxOv6R9ABZZkL/jhacZBkxma2Gt/oe2vTaMc0k27OR04aoi6mOyD
	MjNa5GY1cJ7ZLml0J0renUfr54wDRedVYQP0fQ+0ZXV7fmRWiWWUDu75heIRMWQx+73XDaxg+3d
	1mN+QJafSQ0VlOfkeUkGtfqEk0hdM69C+LjU7BBMLlO0avsBryYBa/HTzhfoVZ7gr4uSNolx1PB
	wjnxcQdX/t5d9/oDT4OnDxUz5ZcyCgq8XRg5xlPeQhLaVdcPV+ztpKm2BoSr998RN/Phpl24j/n
	C/08EaTLh2aS1aGOZ9Zm9D4dnInlh05vzmW9icVmuzcmWX4rn8Llj+dlWtJJ8xL3kLVLHet79N8
	xxs+0GoUJMMXKE40igVAparTSriGZB6bD9cs=
X-Received: by 2002:a05:620a:4624:b0:92e:68be:1c5 with SMTP id af79cd13be357-92e9a34e907mr1295276685a.21.1783321880851;
        Mon, 06 Jul 2026 00:11:20 -0700 (PDT)
X-Received: by 2002:a05:620a:4624:b0:92e:68be:1c5 with SMTP id af79cd13be357-92e9a34e907mr1295274885a.21.1783321880427;
        Mon, 06 Jul 2026 00:11:20 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f3b40sm674673866b.56.2026.07.06.00.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 00:11:19 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH v4 2/5] dt-bindings: media: qcom,sm8250-camss: allow JPEG encoder child node
Date: Mon,  6 Jul 2026 10:11:10 +0300
Message-Id: <20260706071113.383215-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oJzrEfdrPF2KC878ikuBqtbo6a1Jdi5I
X-Proofpoint-GUID: oJzrEfdrPF2KC878ikuBqtbo6a1Jdi5I
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA3MCBTYWx0ZWRfXwZeUI/HrVXwv
 nc2eYgjn/sE0HEQ3N+uyGaANyH3xskinVMuCIobqaYk3n6fScyi3+WV5IvJ67Am30RJ6lY3sML/
 HvvnYpBAjLbBmun2OqavkuPyLHwiDoM=
X-Authority-Analysis: v=2.4 cv=MZxcfZ/f c=1 sm=1 tr=0 ts=6a4b5519 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=60vvH-AHyAWEQOE588EA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA3MCBTYWx0ZWRfX8AtDfvohRTvM
 pqi5WcXoVbTQ2Kyj8nSKmKy642zUB3f+4D4nM5pQtFJLfydd0iVryg0GIH1sjqFB2xD7YdqmI9/
 3nyEUlWdBX01zC/GaVtrnsIGLs3zstn11L1rhTm/UQKdjHabYrTtQCL1TeoY9DZsKkkN9na4eh5
 otWi5OW2Zo81RLoHDNOtfXQHXeeGkNdFdiM28w3ech3HIbZ/F6fc5j5pOeOtmLq5xvYStN7vzsw
 uIlqxVsn45UarRoJdjm+qJDTtpvJmdg+f4B9Y1qQlXCpBMQuiPtC+aIhxkrg87EalP5m1GXdexo
 wPKdSpT2D6I5ku3SHmn2jbGSA8MlbisFxNzJhzk7w0XpcnqavSPicKI1Oz6x393m06nv0t/pQBF
 Vc9lqobZPGnW8tkD2NTIN+zKP31YqTbNTtAgz2GU/WwkaZr0MzMq5S6/gvgORlX/db21Je5Jt34
 MV3jhTRFUhc9/lmWStQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060070

The CAMSS node uses #address-cells = <2>, #size-cells = <2> and ranges
to act as a bus for child IP blocks such as the JPEG encoder. Add these
properties to the binding so that dtbs_check does not reject them.

Use unevaluatedProperties: false instead of additionalProperties: false
so that child nodes are validated against their own schema (matched by
compatible) without requiring the parent binding to enumerate each child
type explicitly. This is the correct approach for a bus-like container
node and avoids updating the camss binding for every new child device
added in the future.

No functional change.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sm8250-camss.yaml   | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
index a509d4bbcb4a..6008938ee369 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
@@ -102,6 +102,14 @@ properties:
       - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
       - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.
 
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -317,7 +325,7 @@ required:
   - vdda-phy-supply
   - vdda-pll-supply
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1

