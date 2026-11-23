Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429550;
	b=KjeFLs3dERC+XHRSrI4OwwkWbv1KfcRiSAFGHivBbqarx9JhwNaRsDjKTLWJN8YMOJCT
	 VKlXPyYUS6aq2bhdIy3SzijJxg15cGXGrAQ5vJQHc3ZOsylu475ZnXkd35YsFUKy/t0Nb
	 slrFtpiyH83AYwNoQd+aPrFx4U926FkZHzp7JCs9V18TeMMQnniB8Bnbbejqf/AknuON1
	 ua/oni6QxFYTLcjxYVsTKeF2GKmsQ/Gj/1oCp+5HyZMu9/P5Q/+kiBjHBFskheV9sQbXG
	 avUYeFi783OWWQFSk4/kjKeb3dkh6i9JZOKlGwkwpwyHxHnIsNTUuPTq8WkzmB+/+SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429550;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fdPleMKS2IC93aynK6NEkJ3p446vokYhvbwvmK8b/Kk=;
	b=UOdrvQ4XW4PctrBZnIRQoIWnP41eKEHYmC9N8gigftjp+bek0lx0Oft4ow/R5woOxhmv
	 Y7pZ905x0mjBIgfWeCR5qUd3afPQYsQ8cqyLoAW5Kz8H+wMBpVFHwC+qgz627BdS/oMNy
	 K5xjygCm4n8uhWskLCX9vUt0CGYNrOZR50n+rA+VE7RZetXzjJuyKQwZJbjmoYnXUae2X
	 mpEpc304Q5UJFcqF5WNsRS8APbb4nRhrAuooWBsh6TtGY64NDwwGmjxBISYk/SI1vbXNa
	 jFV5VWFZHDXf570/M9/NCy07V5O+ZC/mXdNUchCHzpWRNdmJV8AEVm29ssJfxT+6Hqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PG0catFr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TMZSX80K;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0E4606A6AB
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F0E4606A6AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PG0catFr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TMZSX80K
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9IZNn3490960
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fdPleMKS2IC93aynK6NEkJ3p446vokYhvbwvmK8b/Kk=; b=PG0catFroHWUpcO8
	1ZieIvVdt7o3wG3I/57gd22yhfoX/Ns9c9eA2XY+mRgEM4uuU2CJFtIdL3huZGG5
	8pbfBDO8D3MnOM78UNW3OwemZ0B0O0YuSoayd5B9CDH9QVRUjx6O5/ayV2SW0XIz
	I2KBPeMBIRKY6cl2KtsMl151L2oo0tR0awxHTubgim+fmAay2mwOrjgBuxKFIlDg
	5GSUbLUG3sJZBX2OM23hyVbMeTF7FUbZQmZcjMh6swqJ51RqE7p4ZPbCEe31G95G
	6vGfadHesgz7OcG58VZakx/85fHdgtyp4pkl6En1lS+cDIBfoH1hV7KSCfE/NZ2w
	C/UX9Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evsh531-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:25:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f26dd2165so807205985a.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 02:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795429548; x=1796034348; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fdPleMKS2IC93aynK6NEkJ3p446vokYhvbwvmK8b/Kk=;
        b=TMZSX80K4huuAHvPAe9qssG5wgmUmh7eeC6RQHLN6v4sPudTMA2U06e5s3hrnKQjEf
         pi8fwpNbGc7EE15d0RaQhwABZeHGK2V95sK7v19r3y7m5niLZZuDaQ6Ztuj+qd4B+/UL
         GvWwc7cmE5v262rI4bUpuF/Kl+40lrAGPSWcTDOwkAxHrC0BrHdPO09Ep/gIL6an5fd8
         B/zABLOSQlX3WAp5irnERObJyx+WwVbLO8xluL0CT63LPkKUtrWEcJpworoH+hMcc9WZ
         +NF4f2Zw3QIDTI6MAJcl32qQh3USQ5yKKvX+MwWNccfjGE911AeggC+v2aDVCMY+iknh
         LPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429548; x=1796034348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fdPleMKS2IC93aynK6NEkJ3p446vokYhvbwvmK8b/Kk=;
        b=IPkMNFTEwvU5SE40xt5Ny3o9kT6atgm4Kd0z3uGbukymdG5GWr6KFh98GWwew+vGMZ
         5k+OW4Jta4KaqR/U22KU/vPylkjtNRRxYXil1WYM+OUY/c6wd7CUnB65arA6v5d7748o
         o2QvCzXStACERGnDg05B4++JIMqrJ3xkMuJwngk4Z4OdEYFr1CgfVXP4e3CuixP3n1r7
         Qz4KxbK9DOZtR/kdDV3GkvMMc/AFqBNLe9qMhm20gZYMw8xKnrN2O9gvT88xrITXzy6q
         CIBj5+VHnftTDBOJG+xQbAsan3TO+8Ftr1SY7tq6R9VHWlFbtgCWrP0e6ncjqICu3O5o
         GY8A==
X-Forwarded-Encrypted: i=1; AL+hErFTN8/SkDOTLU+P9IA1GLQ9XZqIBRXEK8mcDSBreDPK24SZTOX47bVLMn3uXoMpO2bGBv/OKdCv1QTZ@vger.kernel.org
X-Gm-Message-State: APuU4Z+cfrQ3AnI5DluFIy4QQxkNrCGyUA0NGPjBX4iHRi3xeiP462VT
	zvzw9oD/R92DJPpw3MgKKJosuxu/ISoJs2xEgvc5gMjUXgZ3fkn2di/SE5I96vSla3r5B37fd4l
	HQTotqJJUcIIad01oK3e00kXFk7pV4G6z4oaVURk5D8YaBrZtel5aITDaxSMiAZihXYbsUE2Ysi
	U=
X-Gm-Gg: AZFdTZdwp5bv0rzvwDR/NuOS1VNp9uvCPxcQWFvlLqcMLBKMlt9eKxOI6R1QyaOlIqT
	wDTIp64NUfUEEgawdL19RWr/M5C11p55ka/2HNr41Vi+I9ZUQG/UpSLskNd4f+kfsmUkSv/m4WK
	drfiJvpjdPfYvRZ1kDvmbcgvPmYO1NoPDToEjqltidl4wZdGaSXqK/2C+wntTSvRs0/LLPfCYCb
	oS7WedOwXouTkNUZ+09hGyIQVlZfvV1mCZwZtvNEQGOm9u/khbBAp0RfHbc6zqZMQTd8Uo2TBcl
	qqhukb6pQhlsjZQrAdWRaD5G/hegiQiqT5L62VZnJG532awoxcB58yVsmdk/1JdX9C8l178qes2
	gDosKj0vPeAzv5arCZBKDE3S6pHB8Esc3dC9wy2+eNNM3jMJjjvS6dX3wb2hWoUbzcxdZjIY1eW
	Vu3mStt9yWjOO+AiQOtpixBpAVyD/0flO+KJuMN/ETrF46uiHgCRiJND6YmTLzGWcbmcuhDOAiq
	5DNc0u3W9k6JB4EN4ws2ysu9dup
X-Received: by 2002:a05:620a:2b45:b0:949:a7d0:9fbd with SMTP id af79cd13be357-949ba9e2668mr1901700085a.41.1795429547604;
        Mon, 23 Nov 2026 02:25:47 -0800 (PST)
X-Received: by 2002:a05:620a:2b45:b0:949:a7d0:9fbd with SMTP id af79cd13be357-949ba9e2668mr1901697885a.41.1795429547152;
        Mon, 23 Nov 2026 02:25:47 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:58b4:dc38:81d5:3c3e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm634166845e9.4.2026.11.23.02.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:25:46 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:25:38 +0100
Subject: [PATCH v8 7/8] dt-bindings: connector: pcie-m2-e: Add vendor LGA
 connector compatible
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
Message-Id: <20261123-monza-wireless-v8-7-a8b38604be6c@oss.qualcomm.com>
References: <20261123-monza-wireless-v8-0-a8b38604be6c@oss.qualcomm.com>
In-Reply-To: <20261123-monza-wireless-v8-0-a8b38604be6c@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b0414ac cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Jt4TVnujBLc3pMRzp12QAgc1re2w8zU9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MSBTYWx0ZWRfXx1uO2KnEjb05
 Jz4oQ5iGVdogRcDVqQRzu+k/wIzcHMqOMJDKx5We409YdBgwk1Z3xO5xWHx9fvpq+fhdPM14v6T
 Ck4mRB3pChO4dNgR5YUxNUAw+PJGS6IOJoednmyhVTj2M41AcxP9Sm1qIzELaqUmUNyZgwdi19v
 5RWIUWS8B0pR9aXYHz6c3b9ZvToD0N3ORXPLCT7oIoS9JKn7zmqn/CFt0iFdHdnjmI/ewEeTGic
 PLSllWrpvq54kcq0aGzhdMl/f2VoUsTf8sNEARsWCGENmxDWqFieYt83AkiA1t98jyhbWkYkGJR
 /5Xrebe2tBz7TiRjMgrtJ0/epFg6678BRiXCeDw3moUJXl/8+UVlwoND6GlsEiaNhDMktfPA86C
 5PeebWO1XnCuxhoOABqE/E0/ejHdJXVNlVQJiEk3aPaT0gQmoDt2nnlbg6BhLX1RiWZ1MkIcysV
 iDAtq+7Qile5qJlDOVg==
X-Proofpoint-GUID: Jt4TVnujBLc3pMRzp12QAgc1re2w8zU9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MSBTYWx0ZWRfX7NamF7bzuqsl
 weJom+GML9gwyeS+hlt6WfMXgzgNDRPUJqj9hcSLRQbliI1yc0+1iWfC7VBgCvUKeFU5iLkY0nx
 VBoItECabyMeF3B/J/WLl8KCO8LIWHQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230041

Some modules (e.g. the Qualcomm QCA2066/QCNFA765) expose the same M.2
Key E interface signals but are physically soldered as an LGA package
rather than plugged into a real M.2 Key E connector socket. Such designs
are not actual M.2 Key E connectors, so describe them with a dedicated
vendor-specific compatible while keeping "pcie-m2-e-connector" as a
fallback for the shared signal semantics.

Add "qcom,pcie-m2-1418-lga-connector" for the M.2 LGA 1418 found on
Arduino Ventuno Q (Monaco Monza).

Add "qcom,pcie-m2-1620-lga-connector" for the M.2 LGA 1620 found on
The Lenovo Thinkpad T14s.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/connector/pcie-m2-e-connector.yaml        | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
index f7859aa9b63469cb43919c0b5719c18694c5364d..ce6173a0ec41cfe8ab4a5780940999c18674ab7e 100644
--- a/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
@@ -17,7 +17,13 @@ description:
 
 properties:
   compatible:
-    const: pcie-m2-e-connector
+    oneOf:
+      - const: pcie-m2-e-connector
+      - items:
+          - enum:
+              - qcom,pcie-m2-1418-lga-connector
+              - qcom,pcie-m2-1620-lga-connector
+          - const: pcie-m2-e-connector
 
   vpcie3v3-supply:
     description: A phandle to the regulator for 3.3v supply.

-- 
2.34.1

