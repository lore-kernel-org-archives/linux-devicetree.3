Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C578F3537EE
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 03:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775098904; cv=none; b=Vs/mNkTw1QsMiflmwqtf0fvfo0vWcxjF6xvjFDh5hBud80ZnhtPAsOYZ6QPMXC42dvsZtMPZJlb3iFA+1kOEJOIkQbz7sFFQTNL1jPkfxMcsP2BokCRgbS8EHmn1m19KwK7bmc1Fk5AVhYMiWoQ8NMM8utS75nc+Wq4hXopYm/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775098904; c=relaxed/simple;
	bh=xvIhsQLnf6VaC5Osn71e2H8dj70AFPG1lZSuD4kkNsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o4dRcVgiJHbHXC0yBQmukjMjS/aze4xOIx0Gipb9VFA9j21N1Pe0DayxJc+ZavWsK88MHMeiXpakk/JHe6mBGNYxSUIzSSSIb/N3qy72EAQfVklGeYa1Vu9tf41Mw32AhAv+P7Z9E1uN/GQITAkcngYOgdUJdgIiFEgiWnVc8tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=atiKGzz2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a4lMxbdI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="atiKGzz2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a4lMxbdI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4OSW3044460
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 03:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AllDrQRxwAl7RCBJmeePH104tAT70KjLDbo84NciKdk=; b=atiKGzz2M0U6E1Hh
	FbdFOgHERWa1EoiVQq0p495S3zCEoToAk76wytbhO+p0iU54f9isRvFd/pcb8gzC
	4Xgir+644U6/f+s4Fyez1uwJIaVOj4hiU6e+rRoiJwwZUQDHb3En92mwPGCPfo21
	8G1hI/lbUw2Mj5QsLQczobOTr/Vutd0RfPacLUr/1eLrBf+TS8/GnLIpLMiMQ+jq
	9ZZF9JnHTbokhj1LQmjj4WRygTVfMA0ILQIZ+4/p91ilKBWsYA4s/pfoPYMsElI/
	5jS5pEBNDlVDc/gV67JmNQ28QziI6rAG9GA+Lyzn/qTlBm2ffnGnCq+wLDvnIeby
	5WXPaA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483tprt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 03:01:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c5b48baf75so3755457eec.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 20:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775098901; x=1775703701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AllDrQRxwAl7RCBJmeePH104tAT70KjLDbo84NciKdk=;
        b=a4lMxbdIOfXqNNutH0be7n/SdnlHHtv59i0YYOUSeRSYeYL+LVUIJ4HF/92DV+Y4PG
         bO5ykosA7p4LCOLxzdpuJ1BspZw/HH3IqPBuyzyp+uDvvvDD9/HtsyEpslRaQSNIP9uf
         lEpDCIsMS9JZRoH/bmmSBEfndHbNVFGeMe3bkfrsZ3L/7MbaWTmwM/ficu55UxTv63L/
         dxvXmI7sdyrpScoIEV7T0xVR34uGMlGE0Z/Jz2EhedU9vev5MNGm+/HER6m4Ul4SqjLo
         XijJzyCuWhzw/F5Gb2BiXZjZd9juxopqhZVaDNNqbgxSkDsvndyjvw3lu44fbdbgkmy8
         xQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775098901; x=1775703701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AllDrQRxwAl7RCBJmeePH104tAT70KjLDbo84NciKdk=;
        b=b0aN+VgBnvtGH8ZRZQ+IVqCOZLxOrLDy+SPlMPNaGGYWLmDJQTkXhuvUI8peF/NsBO
         x/JjBtJoidTSzZvx4oePCAQ9NlJn6d+zOleZQJFx79oTbeN7XhO4SDgQx/BScRmRXlwV
         wrDAN0OijURgD8I111sDlsj8zadyjtXKhhEzA4zo3fSjcVoGwIRfRKPexnttHRgIwjAN
         Y1Vd+5aXhU9Ty/Z7/EU7iHi+xcE+bRsQ6YO/JiIQvrNmHLDScpb0HjPVuHMtL2Dm5FbC
         ZPMAApPBmrWD0EdUlxVjDOEySpG01tJOPkYAZuQNQDvTGdhY/TSXeFUjyfCysN9ZmNoR
         0yTg==
X-Forwarded-Encrypted: i=1; AJvYcCUzf2NMoCF9HSMMdDAyw7SYuGsmCbUnNDWjRGhUwl/YcbnIXJpAdeZRnS4hbblAAf6shCap2CBJfxwk@vger.kernel.org
X-Gm-Message-State: AOJu0YyhNxHij0SmOooauz6/7S4MbP2w83Gy5r9BsgEbGkgfJYQrgFmY
	Cii/uO0OF8bIKLrWEV/AMiqzo8d0pATKFbp8t8Zkq2VB7g176x+D5bdlOWdIQTuFu+Px4CdTeoo
	V+cdj4PildGsIDIf7f3YlX9Fz6/TvSXag23qiNZbtKTRIEqf5bQE7z9xmRYa7Xo8=
X-Gm-Gg: ATEYQzyo4tVSqAW71hXiH+Me4+3jVMtdw7k1JE/VoY1GVaekblkrQmJrxixx8mboeXT
	63ys+KTcOojg8Wz/nUc507n99tbia1VjMAJkuekxYZuAPfdQFfXNVbgmeGrffqxdtis8YDKP5N1
	wYqsUqBkOfFVjI9G9ZJl01Csy1fjRTqZzzMhQ8n/XOf9SA6+tqoO6YptWRseWrBmVKnka1hFxOC
	6DS8//YGwXL/Wz6l6vj5JyqXbCPQnVnNttPQg/ilTNsZLoTCfMHikJa2c1zrwlF/QJ5zKQp0DNj
	l/PIbpW5muXlILXflSLbneqJXnaX+yW5MIsKfFhIhA3T3LHogPbncEZNXkYLP8MEwXD5+IQt0Zr
	1PZ3C11GW2Ko7Lqquy0KrZakxMxQwK5Igw+ZUl2CNNE5xfpo1NdcKXwV6dFtkpb5F9MjOFYVy8A
	==
X-Received: by 2002:a05:7022:458c:b0:128:d5f1:d594 with SMTP id a92af1059eb24-12bee639048mr1075719c88.10.1775098900986;
        Wed, 01 Apr 2026 20:01:40 -0700 (PDT)
X-Received: by 2002:a05:7022:458c:b0:128:d5f1:d594 with SMTP id a92af1059eb24-12bee639048mr1075700c88.10.1775098900112;
        Wed, 01 Apr 2026 20:01:40 -0700 (PDT)
Received: from hu-fruiz-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7cf010d7sm1287044eec.25.2026.04.01.20.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:01:39 -0700 (PDT)
From: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 20:01:34 -0700
Subject: [PATCH 1/3] dt-bindings: cache: qcom,llcc: Document Hawi and
 future SoCs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-external_llcc_changes2set-v1-1-97645ede9f6a@oss.qualcomm.com>
References: <20260401-external_llcc_changes2set-v1-0-97645ede9f6a@oss.qualcomm.com>
In-Reply-To: <20260401-external_llcc_changes2set-v1-0-97645ede9f6a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Rob Herring <robh@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775098898; l=2958;
 i=francisco.ruiz@oss.qualcomm.com; s=20260305; h=from:subject:message-id;
 bh=xvIhsQLnf6VaC5Osn71e2H8dj70AFPG1lZSuD4kkNsA=;
 b=UxYvpSs3KbM8aGkfbVs/PZ16ZOn9en7czLcEF7YcFwobXdVfJEh4SPICstvLteJNbvx+sIXV7
 2ShvmHAjM0hByZFthynH2n+7Ryn0Ycq2KboA01Y/dh9NFEoeo3gZ4Q5
X-Developer-Key: i=francisco.ruiz@oss.qualcomm.com; a=ed25519;
 pk=Gcv2CX7iHozjnQ4oK+9fINmBiQTmVC4SpaZzoM63CHE=
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69cddc15 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=TYsQ6n2DTjt8ZF7sQeIA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAyNCBTYWx0ZWRfXzoiMXytJ7mCd
 +bZJn4nZs0dxxzPQ949MSv8fcyLY51YX9rlP+F8DA9qncDtehpKGnGip0NBC9IwJfD2PVdvooAv
 4OE3cLffIxF2Ho0KagKu8zsNtQVeBYnQ3Es2zX76IQiqfBhsJ4Xp2dEHr6aOSVyrc6x0MGuw47L
 kDoW1FKQ3LnhCOdbuBTse7hQ2ScQaYD27uDfeEvHlG51x4IYctnKm/xIt9ph5JnwAKwllHExQIU
 lT4BMwLp7EHt1yk0JEf+Ppzg9j3RPiRBI3qMideK9c0cuNcGpqghFZNq6erPBE1v18buWrYNLyy
 vVCnjwPt6YUJxP2r9gvnW3p5pdAhruzn0tHb9rg/oSDtF+WovHtDn+SeW6zWiH003c9W7/O26r3
 7zUAfGmagipLDBGgsQ1rsGt79NwGVQDHqm4rgMIvRGPdJLHats8AM1eh6ml1Dld9h6v8aF1Gm+V
 SW8M8xdyenLvYYhjIfQ==
X-Proofpoint-ORIG-GUID: Keet_12yeAezcDJG1B6A6GkU1wttDiP1
X-Proofpoint-GUID: Keet_12yeAezcDJG1B6A6GkU1wttDiP1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1011 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020024

Add documentation for the Last Level Cache Controller (LLCC) bindings to
support Hawi and upcoming Qualcomm SoCs where the System Cache Table (SCT)
is programmed by firmware outside of Linux.

Introduce a property that specifies the base address of the shared memory
region from which the driver should read SCT descriptors provided by
firmware.

Signed-off-by: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../devicetree/bindings/cache/qcom,llcc.yaml       | 29 ++++++++++++++++++----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 995d57815781..ca1313de10ca 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -11,16 +11,17 @@ maintainers:
 
 description: |
   LLCC (Last Level Cache Controller) provides last level of cache memory in SoC,
-  that can be shared by multiple clients. Clients here are different cores in the
-  SoC, the idea is to minimize the local caches at the clients and migrate to
-  common pool of memory. Cache memory is divided into partitions called slices
-  which are assigned to clients. Clients can query the slice details, activate
-  and deactivate them.
+  that can be shared by multiple clients. Clients here are different cores in
+  the SoC. The idea is to minimize the local caches at the clients and migrate
+  to a common pool of memory. Cache memory is divided into partitions called
+  slices which are assigned to clients. Clients can query the slice details,
+  activate and deactivate them.
 
 properties:
   compatible:
     enum:
       - qcom,glymur-llcc
+      - qcom,hawi-llcc
       - qcom,ipq5424-llcc
       - qcom,kaanapali-llcc
       - qcom,qcs615-llcc
@@ -57,6 +58,11 @@ properties:
   interrupts:
     maxItems: 1
 
+  memory-region:
+    maxItems: 1
+    description: handle to a reserved-memory node used for firmware-populated
+      SLC/SCT shared memory.
+
   nvmem-cells:
     items:
       - description: Reference to an nvmem node for multi channel DDR
@@ -318,6 +324,7 @@ allOf:
           contains:
             enum:
               - qcom,kaanapali-llcc
+              - qcom,hawi-llcc
               - qcom,sm8450-llcc
               - qcom,sm8550-llcc
               - qcom,sm8650-llcc
@@ -340,6 +347,18 @@ allOf:
             - const: llcc3_base
             - const: llcc_broadcast_base
             - const: llcc_broadcast_and_base
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hawi-llcc
+    then:
+      required:
+        - memory-region
+    else:
+      properties:
+        memory-region: false
 
 additionalProperties: false
 

-- 
2.34.1

