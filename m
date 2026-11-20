Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180905;
	b=3BR3Bqee73YsFVIF724umnRvseSb4z/d1MPQ5iC8GxW5BIusF6IilFiuSbwcQN8kgRGH
	 41Qbd76f8foqurX2icF7YwKxEWJJ7u/h630KAYbVamh0rl3vzQVvfWDfn6OMXsT1qs/nH
	 HTI3j5ZKmiot34xc8VlmNR2mNgvmppDVH8G1TWUDxvS6xHS/9yUP4iFzPyCff3odf/Zkm
	 vXBYVmeDe1ZUn07sbtGOUg1334du0E20TaPV7d/CwbGc8ASAZZXJSQtBZ12ZhXW2aJG35
	 JUArJSxXNuqiE7oSWji3yXefiPb59SIJdWgvDq6TKUYmE8OqdgKxJlpm9YaTiCuSpZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180905;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M8xRW69kBNQ8Kj0Rskt6puJpENL7w9NsJ+tqebELTsE=;
	b=nC1ih7U0Ix4dRQ9ZyhL/OTQAfft61KK++oDHEaEzkiK2wuxcgPf99k+KpLSyzmYGgpGy
	 zS4+SWFHYZQLNZxlAmzv9lxg6rdkSSIrpHP2Qjg0f5PBOg4X3rMmLHJ2gIeOkeXDeCcsl
	 lkoinQO4n7vDLqzdlRaAzfQMAgjlK4Wp1M2KJxFK2VrG0lrQKt4nD6GJ306R85JYlho57
	 3gqEGrWMPvek7NSBQpmLGJLABn6jte/kAAuLc6gn9VrdjT4u3m0tXrIUV4jcDfi9PyzXG
	 lO5RvaQ+YIArwySxc48by9R+uKoNo5EKE3pa8eIDvQQWkYGvooXAUEsp5SUoFqEXTmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S9piEYLS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OPhF4ZuM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF22606A331
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAF22606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S9piEYLS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OPhF4ZuM
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjxqZ556450
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M8xRW69kBNQ8Kj0Rskt6puJpENL7w9NsJ+tqebELTsE=; b=S9piEYLSAT38ewH4
	57vPxHKJCxdycQEkiZOIRy43U5wFR2BL6/SjmkAa7LSR1H9jMCoS/QYAxHmGhEBC
	loMgkbWXVLgoMN0xpLaxzvOEUkmQbKxY1PPZWZf1mJG2C5uOQyKVakckY7i0SQy7
	0znbckLf9e7kK51Hvc9Kaqqd9sFsOPS1BoSQnZXfXVbjYjSmSwwTxuX3YZwT+6tS
	WehIEIChJm/kBzDSygblpTjhSwD7LYo7fdkT2QB6cgjLoSEdT1X+utHqKYbtM4WL
	XzAveiIcOhr/V4gk9bRUb7ltBKlconXI7rb/GC0Lvi4BXJfK9F0nToFFv6FiJg/Y
	fYArrQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbhxt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:21:44 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3425098ae4bso2061570eec.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795180903; x=1795785703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M8xRW69kBNQ8Kj0Rskt6puJpENL7w9NsJ+tqebELTsE=;
        b=OPhF4ZuMviIW8i5Bqmb2ouIE0RbfD4EJTlxAbbory9P5BRF2DpbOvvxhiQ8nIvPJ5D
         8hdBibkmD4V3EhKNATi1FmFf2w+SRHWS0I8XyFi+Fh2Y05NfTenj0d0bFBo3pl70L7BI
         pJrJmr1dG6LAhpE0xDmFRPPNFqVU0kJWEPEimh6hkI5bATL52/hkW4w2Iwzup3p+cb2c
         gG3gnYf78UVnuWI35shBj2c3GytMKXYZJZaidXButhAe1QtC8btirCmuaP6EEIT//t5g
         SSdrYc0ERdKZeClVebyraJWldcGQm3+YVcJ12AEqEqlktKG0Y3NWPu/YZ5gNeL5wwKtC
         knyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180903; x=1795785703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M8xRW69kBNQ8Kj0Rskt6puJpENL7w9NsJ+tqebELTsE=;
        b=O+HC9gWvwKQJkW8iHzC/enItyzHr1PQth3uMgCcPE4VpijY/l8vo9wguMjJ2Dd8IT1
         AG57h5NaA7N29WaD+vlMyusws4myPQDonMWr9Uk02rfsog12ia1Njukary92NS0VzEFy
         UcaXhR//1dNnMYhoo9djIV6V7WEsFtBNsbmS1PZby3iIvsT3Xig+7wHvi11wRFe3d4za
         kZHXH0urpxPNLgGVSD9Xgxz3s/zi0F7iDkcRowlYDkIrV9TOoTWCcIChaemE1YyBNxQf
         5o6KhImohM+2cW7NBxMuaARvtI5mM9wz8r2bAfktEc4WuEYGPX7FW/9e7IIHsJDPzG2C
         evFQ==
X-Forwarded-Encrypted: i=1; AL+hErHUx1ix7H8cG02rAOHdGJdMkRVnoh+lfdnRNtf2oDt5zaiHQ3X//3TA9RyRJF0Q+XFWfu3akSSikl60@vger.kernel.org
X-Gm-Message-State: APuU4Z9DIBhNi+q70mr3cDf15619BFs3M153l0OjJD2KW+aFrIsdAIky
	r2rXy3G7/+rR9gza+EwkQZufutBkvIp+oAEaDZ6ih+T2TZvUGeA4UhAuiG7V08Z0+4+0OYhNs3E
	7LE2bp+QGU7bRjIfwZTVAoJCQxHwL2XVrP4vxGoqtuZ7hiCJ4kmhq6Xhtf+wNVhOz
X-Gm-Gg: AYBFou0kisJlMiez+HyglpZWyNRYjmlfpdF4+HFI4GwD0Sh2dZrgW8FY2reOtv3P4Pf
	sTwXIsfs/OXW9BxO46A7yRM2m6So/pHncdRrQssr8EaTgC3+ZLm0bvrwnsoup63sG7rF8RGs87b
	jSNEMjOLuoQNpnVIlXOX6rIYM+OFtZoR+WTiFR3kJfsth7nAhAQcFey7MWhaNSzgnVebneXeyDh
	iBWaNKL7PtKCN7b7aUZ7p4Mt1vSV+2RRXpCKmBqqGnnJKMeAL7KlfwYWXEg21QIuy7xYiIUqZJi
	d40gHvAfeyC/i9w1jF8aRPRaIexMubbeoTXN6/b3iuTeHg2brwbCYHkzNBbTXeYaZaAKeS/97c0
	ZPDRPbNMqUgnVEXDJrP9sVynqAAqa4dn+ZWKdxy6MimTc2IQJdPpCFZbO54QOBJmX
X-Received: by 2002:a05:701a:ccc9:10b0:1b3:b3d5:566f with SMTP id a92af1059eb24-1b5568e006emr2782888c88.11.1795180903269;
        Fri, 20 Nov 2026 05:21:43 -0800 (PST)
X-Received: by 2002:a05:701a:ccc9:10b0:1b3:b3d5:566f with SMTP id a92af1059eb24-1b5568e006emr2782861c88.11.1795180902539;
        Fri, 20 Nov 2026 05:21:42 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm6929628c88.10.2026.11.20.05.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:21:42 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 18:50:51 +0530
Subject: [PATCH v7 3/5] dt-bindings: remoteproc: qcom,sm8550-pas: Allow 6
 iommus for SM8750 ADSP
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
Message-Id: <20261120-shikra-el2-v7-3-9d9000eb50d4@oss.qualcomm.com>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
In-Reply-To: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795180879; l=1816;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=DfSqnikNSHzMY2hBFUqjQHSQRxokU/djZVzyyL26sSI=;
 b=HN1G3El+AirbAIHwGVq7UBAPuTnOV+lQSOajBaUhzrM1R3QOyXalQCjnzefm3B/aTxHHsR6Iz
 E293IXpejcoAgpKWmnpBXiT3MRDJgvb/Rh2hN/aliVr9q3mFVZM5AHq
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfXye27PWjYKtmh
 ZMNvixof4WqN76xqU4Sra/F7pVjce97tlIaccb62oAVjQ9jrC5HyhQA1iikN+X6Cj1BIM4SqBE5
 dDo8bNLFyUo5w2EEddRgVcHT1ycErIIdmDy8rnGzm97/IHNUb3IedMQo3XCreXLWT443IcOV+n6
 ige3aDGDRUKkfUTyniKvNT92xyVewopXBeZuPXTX6/WXFcCjdNCW0wHVQuG04R/DuqITu53Vfna
 8ndkaB7CE3jZgrVzrjAgE4omwhCnOFkMIbpEudlAdw7U60j3Jke62w4OJkVIR+EsiGg0RcXV6qt
 aikEn6qdgmLu8hrNlINXtEFktZ77oA1xlV4XBvKN6qCsuatAIwzgxh/iWTZXl/bQrSV4mVE/2v+
 PBReyprHsA11WZBtLJKnu59Wkzw0xf9qQ0BS52wPWUQjfnbI55I3RSQBWP/Lz0ATCk3SZ4d14qr
 j5yErUy/cdDJVdH0Gfw==
X-Proofpoint-GUID: Osriu8oeZp_woaMNy5GPnpwEMEObywcS
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b004968 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=heRerMffL7N6zYf9F1AA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: Osriu8oeZp_woaMNy5GPnpwEMEObywcS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX5sl/TcfmF4eu
 sgHuhK4h6XlUy8Wcq2K+auFK9WHg6OzCh3agbFSB4Ig5J+y9SaB/Db0Q8bBZT6Gb6Hc9NXSzp91
 GE6VBwxKhLvhpXegNcIRzosoAc8QPAs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200053

Remote processors behind an IOMMU may use multiple firmware streams. On
SM8750, ADSP uses six IOMMU streams, which exceeds the single entry
currently allowed by the binding. CDSP uses a single stream, while MPSS
does not require any.

Allow up to six iommus entries in the binding. Require six entries for
qcom,sm8750-adsp-pas, disallow the property for qcom,sm8750-mpss-pas,
and retain the single-entry limit for the other compatibles.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 26 +++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index a3131e6417f5..45cc50d9c1b7 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -119,7 +119,8 @@ properties:
     description:
       IOMMU specifiers of the streams used by the remote processor
       firmware for its memory accesses.
-    maxItems: 1
+    minItems: 1
+    maxItems: 6
 
 required:
   - compatible
@@ -323,6 +324,29 @@ allOf:
             - const: mx
             - const: nsp
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8750-adsp-pas
+    then:
+      properties:
+        iommus:
+          minItems: 6
+    else:
+      properties:
+        iommus:
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8750-mpss-pas
+    then:
+      properties:
+        iommus: false
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

