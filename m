Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442187;
	b=vFqVRNwnK/ODCw7UfluQ3ote6s/uNeZ5XMBiBkBj8JtXpcz92NH9Kv1/73vgJcCwGTDy
	 Ojca3MRjqykkt4JoV/1kVrV4yQKOLr0Ktz0GnVNnHeVBRPkH8pk/m6FF7h7s0MljtOwPO
	 9VHp7hPIMYdVXzDgT37/6caQEnx6UTxaH7v1PsAK27lXqzWwh6EXkD1Oimbp3Sji/ZBc2
	 Vj9kOptv1vmJ/8hTgODiwou/YuVojOmNatgEXqPvEKzHD7JavBhBWJ+HzmlZGuCmLd6Ky
	 BS9kZ0Yhj8SpJai6QRezobCowPfuGD5vyoO+VKQYDhUkvvNjga2kQCdNLA3Bfrb96ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442187;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fdPleMKS2IC93aynK6NEkJ3p446vokYhvbwvmK8b/Kk=;
	b=oVIBoYoUcX8ZPw7S2EhMNDw8HCkavvXa1TYTdbZupJBZcNARTUP8weQKWjYrQWL7mO/A
	 kv4abK1IDSvjLgs8v9/24oocLnx5ZWpugrhfzJpif461ZIxZPRZlbC4lnYVlqAl8abpgB
	 RK/fpBaGoKmWBo+daPCXaiT2wykCbBNawji1FYSAXrLmTiFNJU06TnBaglTXpDa/nrnUW
	 pw7I5DAkr9QNsTzJpTlS5x0DawhizJ0ABYqo7qKvUHRSp3+X2l/zr2RkFVSpTMho74vZO
	 Pkw0MMGf2Wij9/gOpr9kRwa5MusnHiDhmLaTdb0JUTW3pKmE6l5bLEnd+B3ickTpceA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=abTfYYKd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DmpkH3NC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63ED5606A6BD
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 13:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63ED5606A6BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=abTfYYKd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DmpkH3NC
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLboE446764
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 13:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fdPleMKS2IC93aynK6NEkJ3p446vokYhvbwvmK8b/Kk=; b=abTfYYKdVVxr89hG
	gG7xas1cvb2O9ZkTi3giz7uXwF+Wl/+Sa0ez4lSmOqUee6+Ouh+3ZhMPOYSoFL5H
	NnZTTBtSE15Gxh6LGjXJDDTw7TF5FNfsXC/Uy3ufbPn/PZ6bqQiXyoFqCeJDo44M
	4GJVH05GJvJS0KACNC4YSisoic9I2dpZKVEsxEiMztK3gNtCHXhELui7pQzOuLNI
	A4wnVzBtjZQnOMF4F18mDhRPKtbEMqS6rvmellhk6GMgL4qZmNz5HQphOUUd+IbY
	+S6cp1fIcIG9Gm8UembnMBIog2Kz+J4gLllY7nVXw6xBEtRxGLm3sAlfkS6OxGVN
	RMDvww==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g741n9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 13:56:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-949b0d3232fso490511985a.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 05:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795442186; x=1796046986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fdPleMKS2IC93aynK6NEkJ3p446vokYhvbwvmK8b/Kk=;
        b=DmpkH3NCBuuRUnlyNwToYClpWU8Fij3c4cxS9TEoMctX6+TJPycE368lwVpDZS++IL
         lTuPhzwR71zgAE+NMzHh9utJh265CjYOqTjCOVgahIuoQkltX7BZBZzCrGJK3RePKr1i
         f9/05QAV6CKVAcQjygXZr3rBqd5k9V4cFSHOys6G33G/nMiHrwfM6SZSQb0oPiH6PPxB
         El7PslY+/s95FZlEYR+cW/asEj8VqS38D69+UJbLluh6uiyQJwFJJmwmm27HZ4jZ7pGl
         1h3ykO3MQGBmaPszg2wavS0j3u6Dj7Nz6otnSW3GYfo+ntw1Or0Z8JeU8Huv1oEgET98
         vTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442186; x=1796046986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fdPleMKS2IC93aynK6NEkJ3p446vokYhvbwvmK8b/Kk=;
        b=XjdYdlOutnaHRBTk7mpxu+oPAWYPmN/Svv+cobKKQAAS0mzkfDNPjE3RSjIN2eEJNo
         Y4mvo6k7EkK7oNaMeLdCCHFWv8tX4pf0UtUJe8G8qw+X6gUvdYXDHCZvzVz6tU7YC+vp
         KPteyM++VkrvWh6Gl9pGy8f8v5sQ/AGZHZPHRC0CA400E7rOuMRJOtvPwgMmdYa84wiz
         qj7FKRtL7069BtqEALtreLipXc5Pk6xbkj31mk3xyTVMglN6QwidEvdMxzbq/l2/97JC
         9CS1em9m7nOebI0W4zIwpuEWDQx2qH4J3fZChK9/fCthgIXi19dCUL+aXWeDAp3CnWM4
         VXhw==
X-Forwarded-Encrypted: i=1; AL+hErHj071QRuYBGcKbHx15LpocB36+4t0lz2ilgloWNhLegjdKee6X2FycjuP3E5HrHI9zKUHnFot8B3Kr@vger.kernel.org
X-Gm-Message-State: APuU4Z+vyzR7tx2mS+wYF2PH4/3zCjwvabxta4BDxSTiDLn3k/wnrIZI
	KJZAKwc4N4Qdlyraq7csDKUG+gKPhnUrecs6/ioREkkI9Ylmgt17lGZCPZXJEjncoaF95EeXNwD
	RA9EfwZ0Ley8El0wimZ/4IVQElojki5wwJiMuyMlgR661vMwnkaD5AIQWqIDBsU02
X-Gm-Gg: AZFdTZehtnqM6A901I/K7WdteXvPHYLO20Q9nEXIVlCKUlb4CvY7butRGfRCSkAX62+
	3EeCCwjzRpRseOj4MQZZSnf7GfG6oYXkotOotu3Nd5YaXTR/d9Gfp+XvdrlArpIb7qvaqvKrOE1
	66wNufx/tGajfVPYEuxlXQpy+4NwKh4hWyzXXE2n5CRDJHqTb27Co3FtHHYsNV7ByBZj8WTexwU
	rKcfmRoIuJRBUUBQAzvLKYcwfqba5TL/Y3sxEo8FRfDE3ZhyuJQt9EFxjIRwnMfr63ptMjoP6q3
	K9SmMn4EonMcZTm2z1sRMhuj4bKZ0NputuR+LEVcxtMUF+XvXuuGQ/O/8z8uoBbhni4X2ikkc77
	iX79atp35h5Uvti7a8LpQZTQUYICXBThgtXyz584uyCOltW8mqO5gnE0H4WkxXLZbFKpw/Z7MV5
	G1JnBsInNuZiDSEoZFpJ55A23BLmHEnnwSuuqDtmTerN9r0yLR9wJ0nVjIOvCHBAhhPwLorlFEu
	X3lG2yLLnWWd37+17TQvMxIHWi8
X-Received: by 2002:a05:620a:4688:b0:949:b7e9:5d18 with SMTP id af79cd13be357-949ba9c4c88mr2022361685a.16.1795442185704;
        Mon, 23 Nov 2026 05:56:25 -0800 (PST)
X-Received: by 2002:a05:620a:4688:b0:949:b7e9:5d18 with SMTP id af79cd13be357-949ba9c4c88mr2022355285a.16.1795442185001;
        Mon, 23 Nov 2026 05:56:25 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm21724625f8f.56.2026.11.23.05.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:56:24 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 14:56:14 +0100
Subject: [PATCH v9 7/8] dt-bindings: connector: pcie-m2-e: Add vendor LGA
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
Message-Id: <20261123-monza-wireless-v9-7-450d7d764aea@oss.qualcomm.com>
References: <20261123-monza-wireless-v9-0-450d7d764aea@oss.qualcomm.com>
In-Reply-To: <20261123-monza-wireless-v9-0-450d7d764aea@oss.qualcomm.com>
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
X-Proofpoint-GUID: QZjyHgqiV77od2UeTbSHXJGeImPMYIXF
X-Proofpoint-ORIG-GUID: QZjyHgqiV77od2UeTbSHXJGeImPMYIXF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NSBTYWx0ZWRfX+4MOsbVw8VSI
 sWT40TU9lNoYvK9wH4hz1OXEXA5NGeHwcmFQtskFx5nCt1IIn59XejTVFBccB4VRJXtol4sYUFw
 6ahmJwWE4nPYLNnfeFxR4koaPaleJ9E=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b04460a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NSBTYWx0ZWRfXxo6Z4vAehsSl
 +GkKlgwjiAmv3ZKwrCtOTTqSLBETs1citlql6zLENo8GbqvyqxRHgsnHTfHM/AbpuR3OzCSbkaC
 4ZeDmYoaRxyWZA3JwTPzzy7U8s7c6tIBa36qgreARBojNQokb4wnzQ79NHjw5ewqduTuKz+NUWQ
 Rl4UtXDREu8ZBXvyfzw4FGJxffFmxo0vYGHTsECw8gTXRuQIjD5ftL2tCikUJKbUN+ovUQwzxlp
 2vPYTzO7RU4ZtK8sJAJ8Ar/wT9QTVSvjATzZNO40i7gNGFMFABTNEQJYVUV5pKQuECujICl9cY4
 5KJjb/n77lSxAsOTKh279CH/1K3VFbLSnbpp6Ei9qbcMhq8TCy8pghVi7BJNk7dlJnAyfR4T/CH
 TQlaGjUz8ixmvF36Mt05tl5BzpBSv3jcAKFRCt2mxUZo2R8Gbj409pYkEewv1Kq9ZahVZIUMsy4
 Y4xJDUPjhIssWA5PssA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230055

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

