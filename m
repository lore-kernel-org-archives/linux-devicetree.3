Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580376;
	b=FbxmIcugFy1WcGsklsFnPW4mOlkcgCvj5POHDj5Ekgda4q3RTQVi5PIdcZUxgl/VCROD
	 eQSas4sd/6Eg9gvyJGl8CPe5RAqTnYTVAY/JB2e7Gs/oINQ8a9ReopYp6Avv4w0Rhjd0T
	 efSq9e4sl26PdE3wB898jpH8/dDHeW3O+SNnt0j3jX7KV23AzhoL8P/r2wo/aeBNlqWHD
	 wRYWi54Df+at0csFyp1+QF7fQyGiHoIMK2295H4qihbtjtczlqNqU4aQBgbem244XotRv
	 Ch3JRts6umEDYysht3rdR1VtzFD0I2ulZz6JtguuKeiBWagtMI1P7ilBEGtmE6PJSrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580376;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2QVeo5lJOkGdek0bBf8H4J2bimgDzpm4CgJ/jKHEj+c=;
	b=fD1dKsc57pDKHWvZUdWdovtoNtbVLV2Bxl+78mn0pQQ5nnvBzu/mGZ+5YvIfvgZTmiLS
	 uRO1DfUAd5gRWxzMPj1A5rs2evLPfJbEQ5Ny+pnfV6vjDcBNIS3NQrqN3SJPrg/CRmB4r
	 dgzNkRfR1BiZhGkx0HvubxN2Cddx19NRGiR5QrMQ8ibenoOt+5p00i3U1vkZs3TKkE0TE
	 PLvvsfMyi0dLuG7RnkY4JIEim5XHiUbzcPhKFmTkPNGN5dskGC+61s3vJs/13JU0bGY6L
	 VOvS7O6MHl+6Z8qnU7L+zI4nKv7IbEz9eUDoMJy8qS1KS7ZofRESOu+oGJgVqm3R43g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JSCjFhaC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3Li7M7i;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113F0606A887
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 14:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 113F0606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JSCjFhaC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3Li7M7i
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCKPWt3126251
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 14:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2QVeo5lJOkGdek0bBf8H4J2bimgDzpm4CgJ/jKHEj+c=; b=JSCjFhaC4ibUOLCb
	lqKAQhI+kL3ed9Vd+lhJbSMUbAzchjGLXlauk6Ez71a7Udmjx0ajT2vb/vFffxRc
	6KQUmdncpobX0S10TmRb0Pp/Ov7pSwDBfvaMXgKevUe5KP0QxgDYJ5ialqvcur13
	BTI/V44mgefD6Uipdn9eyb4AW+TCGoJ5OJZOvfK/ijqVxsGB9YxTeTlI2LLt+gND
	0QfXXB3TKKHd37GOWh8mTDpkGWU4d4ziMgRWMLD3TjJdHnFODw1qjYRpEtw2HJEX
	BSgebtyokpRVKhSiATCQkHSVepqpkzvy8KHTtEhnd21Rf0Cr6npthfCNLkwof6Ia
	cKzPiA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1bcedx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 14:32:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f13c143c8so194537685a.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794580374; x=1795185174; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2QVeo5lJOkGdek0bBf8H4J2bimgDzpm4CgJ/jKHEj+c=;
        b=D3Li7M7i2pz8mb0tdoPgdA5hftj/rwrWx0OmZH27bozUKM6Qu33dAdbLJ0u1IByhIp
         dwfvlKjKjmFDKqINMYYLlJxNbxoqYLa3UtQkRtPFI0erZUigfzTZJfM1ZegYOS0WlZ7X
         eqOBc7pHLaYV3X494iqdFRd/zPfBWRwe45vsJDgvR0sEIQIlEJd/i77ia9th6ykz9rCN
         WSqiQALFi3up5SWS8swYtR8quoVXJ0XWYgjT9fcc0ForDN5EijXJqWCfCR3HP6gKz0wn
         WjR/0pS9eFWdtNzWyB/QX4YIQqknjAWAl1gxzxBa4zuiXz46N5kGuelRytvvjXNQ0VVK
         OloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580374; x=1795185174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2QVeo5lJOkGdek0bBf8H4J2bimgDzpm4CgJ/jKHEj+c=;
        b=AgdXLjiMbf9G8oI/ZKnQw/8Og//88qm1+zKrO1z6P279c3K77r3mWaVupAbbPpD7t9
         B+N7nSEo3ie7/ZCmWvTADINwkhezxZaj3Bxp4vgghnh7xU4BfvwxEke7phM7CsGHSsn2
         fgOTizQsMEKuSKRvY4uSYhlmItA7StaQ3qjEWeSUY3kdwvulpqmVJZ2ee5ftiuoMxJYf
         JoSaIpCMkrcCnemKD76z+crUg1KL0M4HvbvlD3d/hG4ovW0aLqrfPG9cgoC4VqrJKCzN
         GyQsDB5w0lJn/A3wSqpcdnvaLsiU8JNErKxrJ5E3r/0vgdceT60j4xhPd1eusg/gkPfL
         VUrQ==
X-Forwarded-Encrypted: i=1; AL+hErHb7cMbzFcuC05cyvtbSgwpIlj8hWjrJzQ32V6cUtG2x/L3ORWl2mt5pbpZNDD4BAqUvEaYmydyGo2W@vger.kernel.org
X-Gm-Message-State: APuU4Z/kbzxWjq0BpvW2kgv7xe4NXNl7vWF93oK6ry6Nk+3Icu2rcbWk
	EjAY1nAGuoau3bnOeYi/bTgux9wdQrtgTOGJYTebzTJSTC2B6ib56/OBZwfxZDWvRk+n9ewpSZf
	OKCRt2SoB0jrs0vPyF4SvUzfTAhuwDjXscVG1dRUDYeEUGJ42DPvFSjzKuLlO2gzB
X-Gm-Gg: AYBFou0oBRCsEJx3jqdXo523ZfpPHxP3AgiIPPC7FwUwf6HRLJ+ubVDSE0+WrDBpBVt
	B+FPrHk9x4ghQta3UcK2lAq9SnnIMBSv751qSKVbX/KsJsdQNr3Ck7Mc/X4WniO368qXzsE4ziW
	IfnjtISbJLX0inopjFAcQ3t0c9YOyc3rHN+AIhoCiDQQ0mYTdDmPXUchgQiMFmaBKbxT0P3NFi7
	r8dRICo8QNFh+ySbuTRflbnlup7LKpbiU55t2OhlCEmi/Z24rs2kfczbFP59yHcsfeZLxUWz9le
	Jzp3iZXtVf19OcAq6d+Gk3GfIRLu5+QRaz+TNpLP4AiQe5zk0RbSIa1qKx2rnYZcyuuisg1gmMq
	MFF/hfYnApHjooDcQNpkXPGHyxkQrV/ki7SC9XlggZDzON+HicDgITQGn36MAxdU=
X-Received: by 2002:a05:620a:684a:b0:945:f6b0:db0 with SMTP id af79cd13be357-9494bb3103bmr412284085a.30.1794580374089;
        Fri, 13 Nov 2026 06:32:54 -0800 (PST)
X-Received: by 2002:a05:620a:684a:b0:945:f6b0:db0 with SMTP id af79cd13be357-9494bb3103bmr412275485a.30.1794580373281;
        Fri, 13 Nov 2026 06:32:53 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9495a5ef5c4sm71948685a.6.2026.11.13.06.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:32:52 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 20:02:20 +0530
Subject: [PATCH v5 1/3] dt-bindings: remoteproc: Move iommus constraint to
 SoC-specific bindings
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
Message-Id: <20261113-shikra-el2-v5-1-8aca743de97f@oss.qualcomm.com>
References: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
In-Reply-To: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794580360; l=4275;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ix1p+s4/5FlmtMKNK3IrENkc79CTbj3oJEUhEGUvIiQ=;
 b=puyWhF/W3owc44RYAXXdymbp85R+5+n49L0XBd3Me95/ff/5yOnGTpjkg5ks4LNlLkbBV6q9F
 dT9vc0FbZ7nDvoWfteB8iX+gevNczmLiapdMWivy+t5G4kkUfo88b5/
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af71f97 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=K1dVU9MMS2i6ScopwDcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: yXqvYAzewXt_ltbgtNEmTfzoSp_RYcmY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1NyBTYWx0ZWRfX96CEhIHZb3VK
 t691gmnMNjOEpxlKETQZ+RnEAMWRwSM1NAhBoAOPJf0y/UwYuQhwElWP/Rho760C3I98ZYwFHFZ
 Argh1q9ea1jKv1JwXBycWTmU0DvWFbgAf54uqQYX256mTDspGjmNgxC4vBMPl9SF3GcKZzBL5JF
 gJ2QSMUpw89m68sT6Rza8dFKBIcIWUaP3zQJGXd0u3CsjvNBLogBTDflyg8jKwuYiIb51qD6KXS
 SVdfW51pRlMz7T7RtqOHprbQG6ZUtxzfiAbg2lsATHZ+TXNSj2YWL9bQYvJJZ182Ni6AOBOOP7b
 OkNcgrJpvj2HqDNzbJroo7VmfSo5Mu7bIRnh7tfgIIrNuljMpZqwbtVZI0qPXjevxdy0Lb2vsqZ
 0Q3emcTAfKzhwzgRpVrxG2ypQFfJ29RHnOjeEJ9y7b6krPgVVRBsobkptZJYQDCFFIE14/u6/YA
 1a2eZI8UEtgkyvpWaqQ==
X-Proofpoint-ORIG-GUID: yXqvYAzewXt_ltbgtNEmTfzoSp_RYcmY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1NyBTYWx0ZWRfX6nQJnLW4BNx0
 7KX37Gg59veqUVmN9zTDtMyF0MJLDPsINSOYmwwTbu8a8+9mgyxCVZpFHOtKLM8HG52GwreIY57
 SpEGsKUdlpTXsK1tzY1XuS3yg4bXFdM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130057

qcom,pas-common.yaml limits iommus to a single entry for every PAS
remoteproc, which is too restrictive for SoCs whose firmware uses
multiple IOMMU streams.

Drop iommus from common binding and let each SoC-specific binding declare
it with its own limits. These bindings set unevaluatedProperties: false,
so a compatible that does not declare iommus rejects it. Declare it for
every compatible whose nodes use it.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,pas-common.yaml   |  3 ---
 .../devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml  |  4 ++++
 .../devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml   | 12 ++++++++++++
 .../devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml   | 13 +++++++++++++
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml   | 15 +++++++++++++++
 5 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index f75cab6b4ed9..4662fe4cff62 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -32,9 +32,6 @@ properties:
     minItems: 5
     maxItems: 6
 
-  iommus:
-    maxItems: 1
-
   power-domains:
     minItems: 1
     maxItems: 3
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
index dda2d144b720..3c35da52204d 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
@@ -38,6 +38,10 @@ properties:
   reg:
     maxItems: 1
 
+  iommus:
+    maxItems: 1
+    description: Firmware Stream
+
   clocks:
     items:
       - description: XO clock
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
index b20780e5e26b..8aebc785f212 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
@@ -169,6 +169,18 @@ allOf:
             - const: cx
             - const: mx
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sc7280-adsp-pas
+            - qcom,sc7280-cdsp-pas
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+          description: Firmware Stream
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
index 5a7c5f8c92d1..5c41c8936960 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
@@ -178,6 +178,19 @@ allOf:
             - const: lcx
             - const: lmx
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcs615-adsp-pas
+              - qcom,qcs615-cdsp-pas
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+          description: Firmware Stream
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 99e9aeeb4f62..f838b98c43f4 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -317,6 +317,21 @@ allOf:
             - const: mx
             - const: nsp
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-adsp-pas
+              - qcom,glymur-cdsp-pas
+              - qcom,x1e80100-adsp-pas
+              - qcom,x1e80100-cdsp-pas
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+          description: Firmware Stream
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

