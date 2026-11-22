Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376478;
	b=mKm3VNeZu/qRClCScSbYgdJRED+qik7nqFFj0EamZrNmTSQu85MSxmBEGviob8JTfhF+
	 WodlHlSPiWEhinUgh5soseI6+Abs21i0TvAvW3CWHiwbHIpMtAHYJwcSwqqpUCoOpxlHm
	 EOGomVgv0xjAQAhSvepDgzWJhouA57/zEW+bdHNjqN2KPo0lbcN8dK6KkQ5KV3Oyz4JbU
	 T7pMNzgYmGD+KEZCYa/4ID4N6LP3XxFJMCbXLZKMhZR+OT9McKOAP6LmguJC6gsOqOEyP
	 HLrgsP7V7N74RwsuFQk9Qx4i863mRbVDTBaR7+5YJCLn8XiKRpyDGBYcW/j183fEVHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376478;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2NMfiLBWHBraD6d5t03iOIotkczUU94EzQsw9iHhouU=;
	b=Ni4tCWMfnnl2ze/ePD8SXuBdGaI5syRTcP1aWkO0RYD4A0y9/MjrGrJyHZyflcLg1q4J
	 UfgICBcd3AHbGoRPmHFW6T7jWeUQ5UC64DP1WP/TjvfgVNxzHSRpRqjtOVaXtGQebbnFo
	 D3/aO7U7knFl6D70L+iZ8DxAALN8Q/JnHAVj7BNcmTHwwwQNfDJBX87hY9DdputEsmeyl
	 8r9vhOR+Wwv1pMQg0Aszlz3nG2MPC1k6ZRycK1tPRLsoGqmQovXcNoAzUY1eqvqkO3KRZ
	 HjfePf6CI23ZzLMoR9Em1ilNEv27M6TnzsL+DbLAoMPlgjsVGqYz4tID62HDj1DR9TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lhofdDvJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jx7tbmtf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544B6606A334
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 19:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 544B6606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lhofdDvJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jx7tbmtf
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGUrCO3514847
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 19:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2NMfiLBWHBraD6d5t03iOIotkczUU94EzQsw9iHhouU=; b=lhofdDvJJsGoeE/J
	TNoqL0yLff60i3ImR2vC6qn+Vk0CXbSbp87MWwBCTjXwN3fM//v22JsqkRXn39u9
	sDhOOF9gryeqnuz3txpcRi65p0EU/shiJk6gyeS+yM4AxftcjdqeBVZZJ3JfBgBt
	UDwaukIufNFNAxtD5VfTZDKKMZOGUV7TJReDEmCRdd/HvsS8s1rb4CkzUPdm4vhf
	eiN1ZzX6jUfrYmoH/87khKhOAfPvgXUngzbiZfR1+L4s1vNszq4gEOOjSeJrwETJ
	PAy+nbigdhOwLAgm+9/Lugyk1KMcww7S3qfcNfrergap3vAVuncYNiA9uv8E1bR6
	RSDWTg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33p7v29u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 19:41:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so3048795eec.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 11:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795376476; x=1795981276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2NMfiLBWHBraD6d5t03iOIotkczUU94EzQsw9iHhouU=;
        b=jx7tbmtfUL/t6r++4iVR3GBQeYdNEME2xZnMrbpqIR77GSzoDaE73Sh6xnCph4M2So
         rMl2L1EjbvvSd01WikD3jjPA4bT85Ma8bBEWUyx9Mw1GmzlyQXfJ5P6v8ZLALynsICfk
         Hs2nGoF4xAZrVLlbOJ3Ky/V06DJh4W6wi4/kW1YyewmYItmRw1QXt40KIhY/WaJNcXbw
         IBKqsahUtviemY3K5/okX9zE4ctuew6zfo0m8UYNEJ6m06yhS7Ng6inM2kyXUQL1EdEh
         2SZsVXjyVYQEuSbSLxypUWBQVLxZvXoJJwkZNcrV8rQ5TLZ+4kGiClGchpdYNgOWBU/G
         p83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795376476; x=1795981276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2NMfiLBWHBraD6d5t03iOIotkczUU94EzQsw9iHhouU=;
        b=vf/0bFHx3V+rFf/vsMaKFzpspUxCXzupcEkkg9fWQvgP7n4A8AZ3qlC5r3TSt6AVUf
         4d+8qBN30rfPX5ARBW9RL0t3jALrhKktoDwDix43WLrcZXuU6Y5e7/n2pkKTeWJOhbb7
         sECP3s42HbQaBvI1VJrjpHlB3HLZBx+1yTy2S7asObP2aVQQirRzSfjK5MPvNkTNoQhk
         yEevhuTD6XYbVgc+IJ/1QfAJLjv0IwpGklmoR89qwmx5A6v5ZsQ9Zo+/xY4tDVR3K8cj
         BhlmJsdHDoW4cCwo4VFaPs2NcVZzZsy4jo1mY+hGBeWBT/qldcR5jdURWlwhs1I6yZeM
         X8gg==
X-Forwarded-Encrypted: i=1; AL+hErGW+MNsTtoACYiw5JecYoNNDRLiIQYMyOGZ5gD3pVZ2E8Kdip2GO9gIuqRoLJ5qzwW3dkIQSrROSTU6@vger.kernel.org
X-Gm-Message-State: APuU4Z+1ns5JSq1Bf5hGqPKVgzFXkBDiboVXCXJXOLOtfFjood3qeiFY
	dZWO9POXVSBhy90f523zj3LIVwv6bcE8sOgLDS/u+ejYOQiUs4DOWe+F1VIzeiuH45mIjdXZ8oY
	ekOz+ASol5QbbfV/dIPWaVAcCEHr+KaqNyHbHLKxRAKTZ41q7zvVesijuLcUeuH0o
X-Gm-Gg: AZFdTZcjkNnxOmJz9KAeqd16Nl9uwojkFFPUaxPPCTmgHMnqXchsJluk8DP2ae3fHwB
	r1sKNJUIxT0zvnGVhv5TIdgAk8YnWUTQK7PlEDlZhPDU5SSPkEnGtAdTMmn3yf254ekJU9RwSjY
	rZa9ZlNe48B4CHg0aEMZG3I06VWl4p5rWliv4RlN3LwFUn2wgqEXwemtyqv4g//52M4RXrrw+aF
	QzJqtjB8OKnUDCdCnKUg3Cy/iqHbX+DaUwxCpUfx7KVSOE50Oqt11X3VmNfpcYtyKQlxQElhYKV
	zGQHMLCq0yQc6omXFjCcQJ/U25z5BwBTHj1DY17dCRV6kaZJYsDX3V3I38OnOopX7g/fXoB2Kv3
	wWOvJTFJ0hV7Fw9Y2rCYYvbF4bjPCDIPFzg0frHyT9TEBiYt/UKqLXdXpWqOzQ7QkDHAzy8+jra
	5KRsni8j6uVQ==
X-Received: by 2002:a05:7301:b8c:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-384b3986ef2mr12134314eec.6.1795376476067;
        Sun, 22 Nov 2026 11:41:16 -0800 (PST)
X-Received: by 2002:a05:7301:b8c:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-384b3986ef2mr12134288eec.6.1795376475563;
        Sun, 22 Nov 2026 11:41:15 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm28348711eec.15.2026.11.22.11.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:41:15 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 01:10:46 +0530
Subject: [PATCH v3 1/5] ASoC: dt-bindings: qcom,sm8250: add Shikra sound
 card compatibles
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
Message-Id: <20261123-shikra-machine-v3-1-e5d074264428@oss.qualcomm.com>
References: <20261123-shikra-machine-v3-0-e5d074264428@oss.qualcomm.com>
In-Reply-To: <20261123-shikra-machine-v3-0-e5d074264428@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795376465; l=1514;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=KSrSXEahZQMd224943c8LnPie0khXp4nfj+R+BunIW0=;
 b=JZsIIoriXs60xtNNmWjttyoCFZAbwH7sBoOZDULZNYIdA6MaeevJPPUL5B4qrpXwlJRPDL/Ug
 DTJMVUA/DcYBDbGxTfLsSQYAKkWCKiXSlld/4wjVV+qzPElohfBNQS7
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=OrHaWC/t c=1 sm=1 tr=0 ts=6b03455d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=IO9S6bmGf6N6HOI-BKEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfX1c+Oct2A6pK8
 5NNf5jbBAr/XZSXjgpVf/Fwx5kxwBHrEyHuzSa32n5uHKOkN3EJowdMepqkFWYzbwch7/Xuljrj
 WodZEVFPr1EdXd4fFKk2/LTqYFoVYdw=
X-Proofpoint-GUID: uoJ8AJZzG-3aplLzxJrct2ek6oPsQ9bp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfXyQmBtm/QJKYb
 2QxwrzJpxn7Sm8f58xSGtNwg79vo6wK2c5/DJm/xXel6Uurfl4sTEmnUHFv/Vggw63h+wLaMSNe
 9FxMvr+xxuuAsqjQwioh7mD7X8qCl3qRin8kLZ/z3JqkIRd30B6Qf/ZL5+z3f+KqzuRh7lSH39n
 pgXa5xbA2Hug6b8OTBFjTHKCE1wgOLZGUtNmSrQLN33h7LlVqivcCoPeNZUqAfIQux61zA6ftYt
 8jfeZ3yYn1d4IE/bEb+xku16jGrWs94y8KTV1Uph6Awq6VLX3gMIJV+Wx1DS8g9Nv52xTEiYoq4
 sLemk2pAmqYgZQdLt868CjA5v55YmCL1G84SRQRQY1mjKyhl/b/5TjpGg0JXnGX9VLTQEbS9+p0
 ODzD6+fJCBo0IA/YkyDauFrs6BctOov8wCVgrocb6zSR+KO+vcn8jsqFdq3/u0TbOktmNnGBeG3
 bwIX/j4qQ6tJF35hsTQ==
X-Proofpoint-ORIG-GUID: uoJ8AJZzG-3aplLzxJrct2ek6oPsQ9bp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220078

From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

Add Shikra sound-card compatible strings to the Qualcomm sound card
binding so DT can describe board-specific audio topologies:

- qcom,shikra-cqm-sndcard
- qcom,shikra-cqs-sndcard
- qcom,shikra-iqs-sndcard

Shikra EVK variants use different codec/interface combinations and DSP
processing paths. Describing these variants explicitly in DT allows the
machine driver to select the correct DAPM routes, controls, and clocking
behavior for each board.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index a890fa288a76..1dc164e2c73c 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -57,6 +57,9 @@ properties:
           - qcom,sc8280xp-sndcard
           - qcom,sdm660-sndcard
           - qcom,sdm845-sndcard
+          - qcom,shikra-cqm-sndcard
+          - qcom,shikra-cqs-sndcard
+          - qcom,shikra-iqs-sndcard
           - qcom,sm8250-sndcard
           - qcom,sm8450-sndcard
           - qcom,x1e80100-sndcard

-- 
2.34.1

