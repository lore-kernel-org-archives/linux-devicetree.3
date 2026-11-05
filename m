Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877101;
	b=imOF3YrA+DfOx7IANcCbzRnuRvdUbHSdjZQaZraDhuRQH1aTDaeoPG5+ynLzc/sovRYK
	 RytKDLSZRQCt8QjmVSQQlYJvN/cXAWZQAkkjQXJZ1e6cLzg73HzetiuyY4+qP9yS48Bym
	 9l1pFdp+qUudNoGHv7nsA0Pvsqnbn0QDWnbDMYsUzfpHq3TqZqxy1SpB6cFnt3D0AI6mH
	 Ya/gkYB+jmHiNUdoayDKtr0yHuQ/BfihIe3FEslKLGCVM/I3irs3xfpDBgocA9LUcwYww
	 LJpZ8WYeA954wjLitteeTHh6FyuEPUkagBSTtJqp+Pv604ZT2PETiL/4J5h+PseKLLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877101;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ykQcj0AQYTsQP8WoNJ3puslG+JpNUOX6RrBb4qGTMJQ=;
	b=QomrRtG4fuSSl+r6ixO0Nj+DuCGev6V4i08J7id7sQ6jRJpytmFjDyYEUiUHdWk387hb
	 W2ojFfYr68wM5T91+dJPOIKyFYsAvujRr9mEqxzeIvjfzIw1oo65ixjOdBElEnBERfNxU
	 BexVyx0TCdW540VsvATrnNfD93uhUwiIYzc2AdohygwX/v1Hw14uCWDA9D7ZYOTQl3LQD
	 DL6207KCGia4MbygqWnI5qMMjbVtt1K5D8wAa6nnMqz0jwMfDo/RoLLrLwKVCHzv39Eq5
	 yPAz5PV85Tyhq2D9p0FvausyUChq05tTD6Q+bONnyGdyy76yEIOktq6AoT348dU1Xww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c4HjtbJv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cSrCZKuf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9857F606A33F
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 11:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9857F606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c4HjtbJv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cSrCZKuf
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tDM83684470
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 11:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ykQcj0AQYTsQP8WoNJ3puslG+JpNUOX6RrBb4qGTMJQ=; b=c4HjtbJvOEEajdTx
	j2WA4SDowGWC0tmbw/I97/O7NmwNUj14QTcUFv/LZBssN1do5KwauiuQbjbdjBzs
	tt0N6NVuDFTSHm6hgbSLA/uWRIAw35D8fWU67fRZ18ln3tVfYJExboI6uSBYL+VK
	nBJ/WYkuNOFtVtkUJFF7KUkgaaIX2SYVNuR5R110kEi052bBewkLQVGWa6j5hvlJ
	pL/f5ZOWZMuSNhZzxk/hKR6aPqwlLZZI6IZ9gNX70svbVFtwQnuMo9CAow3HY8bQ
	R4XHrT5VuMg5kMBFOcC6Nl4D+rj6pWPhlI4McBMbyWPn9B018Nz4CYL259B2DUlD
	Nt+weA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrj43hqa3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 11:11:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f62934ef6so414762585a.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 03:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793877099; x=1794481899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ykQcj0AQYTsQP8WoNJ3puslG+JpNUOX6RrBb4qGTMJQ=;
        b=cSrCZKufS6xLFpzSjaaGkUvHpnQA3DR6Agnpt/rEPqsPAAH8BP4bYPl0oKyh59Jo4x
         vBJxM9rZGUNK/7NZZqRxnkEA1+ggUIXqlwEkOHuUw0KAH2Bc+tL6HHuKYoOp/Q0TPura
         CMj6tKPBF+veK/ieYnaAVGqMpp16b0Vq6KBVUoBia7295VuOxpcKIOf3WybeG5MtebMR
         xE7Bjls+jT3a/DNGOAGkR5k+zVnII7iRSwLj0PfG0x6TScmEllfWxTVSZG6CJEksHnle
         qYq6cX1mOr5ICtlKSn7iwdGwckOMZoceZO+o8G6CFnDMg5ahe+Z5JHFh44ACrh0uWp1/
         qSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877099; x=1794481899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykQcj0AQYTsQP8WoNJ3puslG+JpNUOX6RrBb4qGTMJQ=;
        b=eRPEeJbA1Jx+QjVvasoTeksaioSvxni5UDGhBCX3rcM06Z5QcxPiwP1T1Ubco+23HS
         D/e685KP8ogjhNbmrLc1p447s+NiTa7rTMYMB/iNexTnwXeICIOjOsW6f+EVxW/LqbNw
         8ztz6MB8GYWw3as2GRgO272TyXu7Mct8Hg+600HqLoBEjxHr5u2VzjIy454sScVSKmSG
         1HcmMWnezRaH56P/YDq8+e/t8iep45CthawS9OVdmoOvwVvKgEVD8T/1IZEuy71orZS+
         IOhUPHdJ94Z6dnCflb42yYtTiND5HKWNaWQf0Xi3rw5VbUxKz6D638W+yg+k2yBrFDeF
         hsRg==
X-Forwarded-Encrypted: i=1; AKwUvBwyLU9RtCU/vk0SGKE8e+y4g3ys5RbUxCP+izeLnhY+FPbKFFUsojFn6BMwyuSAhVUfzsro68sNO7rs@vger.kernel.org
X-Gm-Message-State: APuU4Z/mwXMOszVn3ns/Fth+wPOHy9QbMEV9fV7FQC8/u39XEohtJ8LS
	eJGBTSkEKe3zjn5j7Ij49/NIBHQLNMHfxFGGcU/tDzuXglFKG8Jx2Gg43lgdL5bY1jjrX/DkF0g
	jsGA40TG1StAv40OVyhtwSfyiwIibTQKoY2DSFt7q2y73TVaDWq+nNLeX/oyOR+DR
X-Gm-Gg: AYBFou0iV0Sx/BTFXUc5ya/ZlDuL8B5yf6sn63mOBSi5DlEwGDhs2J3QpuhenCPpISx
	isPTsruNErKsL/OjHECL2LUiFl3rtam43tjGzkyRSbSnECuv0lX33IJo60IVlnZo662ibkP5J3n
	vnxqje4j2yZYYQpcNHzmzxoOQmrIZtzj2IEy+DUymDf/DOEl5icrNYlZeYTfktS5fh3En6GCNT9
	sFxoq7PlvwYjGFQ3SKdqf+nIDry7xbN2ChQ4u0g2NFsJ8+zJptUMJs2LT6zzDvD542zEPl/FX5R
	LXqQnSWEw/GRf6WPT34cCHjw+P7FbjT8ZSxYUZlcAs+P45MkZfq57DnD33iT4Oy4c/xKy5B2Cmv
	3EfvTrBJhBOQKSqy7fKkQpoZ25rbh8lgkniK/m8LT4OyYE+WC6IxmtLTe3QN2uzYEOP5ovv5ZRo
	Uc8WyKg6rxosxCo2cc0eeOm8ytDkvNPyeDgZUYSuYD
X-Received: by 2002:a05:620a:26a0:b0:93f:52c5:a31 with SMTP id af79cd13be357-94421802977mr2976181585a.73.1793877098882;
        Thu, 05 Nov 2026 03:11:38 -0800 (PST)
X-Received: by 2002:a05:620a:26a0:b0:93f:52c5:a31 with SMTP id af79cd13be357-94421802977mr2976178185a.73.1793877098432;
        Thu, 05 Nov 2026 03:11:38 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d488f183sm438320685a.39.2026.11.05.03.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:11:36 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 19:11:00 +0800
Subject: [PATCH RFC 2/3] dt-bindings: i2c: qcom-cci: Document Nord
 compatible
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-ccu-v1-2-3accc4b901de@oss.qualcomm.com>
References: <20261105-ccu-v1-0-3accc4b901de@oss.qualcomm.com>
In-Reply-To: <20261105-ccu-v1-0-3accc4b901de@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, vikram.sharma@oss.qualcomm.com,
        nihal.gupta@oss.qualcomm.com, vtumati@quicinc.com,
        bryan.odonoghue@linaro.org, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793877074; l=3045;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=53/2ZtfsHA+VIBh3y1Kn8crIdUlYDr0140lytwfQVqw=;
 b=0INrlV/BUDtGc6MZEvf3Y6H6D08QeqmW9s8YpX4zWjftwYH8/6aUejLX4mik+ApWDQN+1qeCG
 8eEHyRqGfCdDF+EInZXIuiu3D//4jO4D0QF5ioDwyBtK8BoITnltOfa
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: lBoHCktGgmTTsM_ABNi9FgFe-4yhWRA7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX9tMhQxaK3DYk
 /BImqwFek9ZgjnLZyMg8djm2koOKyjyz8sQm4LrOwwbe4J/DIj0FXbeIij9fhsOLUPbh1VCopi5
 MzGbP9XAGiImgqhKoUUTKZcOae6BDv1T/Je729Y/kgFKtbdNmmPdeV9FtTvt5+4k1OjGwR5PyRj
 Ms1B2eKOrQG/tsM4h42E28LIXZigV8mnii1N4mujSwubtIBZT9KyFyIeOdF4I3pKTetyDHBSuEn
 zvIn1F1kXoKQ/SuO9IXpUbzxl+sT+UsEPZY2cxYh9DnqM4T73kop1NugD1DIShEArHiY/BCdE2m
 2vHQZPUQuDqEuIn/ZG1zjV4cuNCcjvJDhBZWXMcHhDncsyHQ0Isnxya47nioM3J8HNhBjOdyYcr
 JI4L8bILQ7ji2R/S9Wi2x/G8i5IEtfYaLvb3ScHhKOFz0GazzyBwWuaaI8qRCoxDcyDu/uqUnTC
 OHsOjh8ioPvYWFpTPDQ==
X-Proofpoint-GUID: lBoHCktGgmTTsM_ABNi9FgFe-4yhWRA7
X-Authority-Analysis: v=2.4 cv=SZdi5fRu c=1 sm=1 tr=0 ts=6aec646b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nHM2AM3XuFFpsIOFzc0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX8VSbS2+wOmfV
 ytq4l8sSM44ynmsqW7fRVdyTJsOQROq7oHwtjjtD0MbA7Cx3ScgmSPnlheF4WX+nqBunmrVW3bS
 DfSIl0aEi4t8ZGmtMC3faN9U5H0Fapw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050044

Add the Nord CCI compatible. The CCI is based on the CCI v2 core, but
is wrapped by a CCU. After reset, the I2C ports are routed to the CCU
and the CCU output mux must select the CCI before any transfer can
take place.

Add the qcom,ccu-mux-sel property to describe the syscon register and
bits controlling the CCU output mux.

In addition to its core clock, the CCI requires the CCU AHB clock and
the camera subsystem top AHB and fast AHB clocks. The top AHB clock is
required to access the CCI registers and the CCU output mux.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 1e8def25ec0ec1ef6b34859709d10a2a36fe36f5..5a25ebe0e61f686b86306a1dc94911e302d9b440 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,glymur-cci
               - qcom,kaanapali-cci
               - qcom,milos-cci
+              - qcom,nord-cci
               - qcom,qcm2290-cci
               - qcom,qcs8300-cci
               - qcom,sa8775p-cci
@@ -70,6 +71,20 @@ properties:
   reg:
     maxItems: 1
 
+  qcom,ccu-mux-sel:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      On SoCs where the CCI sits in a CCU wrapper, the CCI I2C ports are
+      routed to the CCU after reset and the CCU output mux has to select the
+      CCI before any transfer.
+    items:
+      - items:
+          - description: phandle to the Titan CAM_TOP syscon
+          - description: byte offset of the CCU output mux register in the
+              syscon
+          - description: mask of the mux bits of this CCI, set to 1 to route
+              the I2C ports to this CCI
+
 patternProperties:
   "^i2c-bus@[01]$":
     $ref: /schemas/i2c/i2c-controller.yaml#
@@ -131,6 +146,32 @@ allOf:
             - const: cci_ahb
             - const: cci
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,nord-cci
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Camera subsystem top AHB clock, needed by the CCI
+                register interface and to access the CCU output mux
+            - description: CCI core clock
+            - description: AHB clock of the CCU wrapper the CCI sits in
+            - description: Camera subsystem top fast AHB clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: cci
+            - const: ccu_ahb
+            - const: fast_ahb
+      required:
+        - qcom,ccu-mux-sel
+    else:
+      properties:
+        qcom,ccu-mux-sel: false
+
   - if:
       properties:
         compatible:

-- 
2.34.1

