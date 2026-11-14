Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670766;
	b=2e2TNE6lbFDEQNQTQtPUnYV8T/1jNodIGOec+M38CSs4A//5JMoZJmdZQF1jqOK4S93p
	 AO2D0pwaukN13+qDTqG9m3rCLTSXGigTKgN+jF1d6gPX20Ijqj8a/+TO1cSeag95ekMg4
	 Pm49YlATT16NLV3SfkfazqGIDZIS6ptm3+aU32bhjvzc+wY3EaOmW8C5F4X01sdO0lkU3
	 RNNiq8/eh2fN3n/suYRoGzKaIPwaunMAl5nb7rMhZCBIpraIpUGZz1QHQsOHORB5Yn07/
	 XACbvsfMQeh5HQ4U6kEoeUhAeAUHf0c0AgFjGa12jreJIk4B5jX2gTh1emL0cZR/Y9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670766;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=W/mPHONDiBlbVDbKIfcBd4APZhECiA8xyKQZk8yM/d4=;
	b=WAGQiJh2omYSAEB6ZrgxJR/dUxOHmmHRGIxY/vKhTBUe3QtxJcwHlVhWi9gA/7USGAq6
	 iCYkESE1tvJF+nDYJnNC5FQT5KAmEy+brBkEZXeZfWMOrYq82Q8lzbziZ1PcAnMswQarR
	 71aJ67Jt1gvTNkfACYlv4s5e1A07dd4xeB8WgpRAsXRmcj1B8t410fBlWGblws0vi1N1L
	 qz1TnJD1QH3e7snRWHIGgDS655EohOufhKjisksCYpUeB170nhFgW8f1NKtw/a2l0hKAp
	 ypud1nQRy1J0zK85VOkTYNiLStPa4EHNndigl0jif/P3q0wqxkgU9IhrsoMvbC3iaIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NuW2YZq0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=igE00FZR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F81606A882
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 15:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53F81606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NuW2YZq0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=igE00FZR
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDl2ls2215625
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 15:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W/mPHONDiBlbVDbKIfcBd4APZhECiA8xyKQZk8yM/d4=; b=NuW2YZq0Y41HQpkr
	fnC8EY82DmUdPIgA7mZsD1h9N263pSYE763MDan0BExrWxog84vFzN9yvWjUsc8k
	Neji8rVB1KxtF9iUH+WKDJAa+Ze4pV0fuShj2MNCiVemBhTHc5dsxO67snggvMNj
	hZB1lA83CYMfR/qhnXjhf8wSGEiE3LpZ6DTzoj76naB0z/qeZZy4cRGFJtq0LO51
	EAPivJ4y+rYbujXM8TirtH/WfdC3vgUJCGfWc1cNXE6DBl7JN2rcbqEo3JKxVBec
	VYJ/6rC97gjUlgQeMmnbf4PsmLJQn8tLQCMbi7t3a+L/JE7TiIIfUWaxCxNS5Oll
	mV7uTw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj4146j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 15:39:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94970ad532bso23750585a.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 07:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794670764; x=1795275564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/mPHONDiBlbVDbKIfcBd4APZhECiA8xyKQZk8yM/d4=;
        b=igE00FZR5jgQO+U4ihtj1yJKqqcpVhs8pkpQd2X+yedPvNTGfi+BkfIoabjks2QuXc
         xYlApRqC7/V2fWUN+aXS87PfoYcTZn/vVbfmQiICc/kpZiiDcZos5YvnT7Li2HErIqSK
         UgdZAhcxbP31+g+WrAyn0zjDFAGQrYz7WJk1FysZJhPuaJil3dD+lsYcQIq/dvbFaNSH
         OKqASf9XZzlPObPRhm92u7h0GMQz3Z7I3RGcrjZUZPrLP4TDdkFkUsnyuJ4fpAbj+s6e
         Lac5G0rWR2XTx8DxcrAdy4ZyUIIcIdnC3vSZfL5wFzJPG8enMwFEl9gc3aNa53Aak7vc
         jOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794670764; x=1795275564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W/mPHONDiBlbVDbKIfcBd4APZhECiA8xyKQZk8yM/d4=;
        b=AY7rTZ4SIi6ooHihsUUfhV4TtOSWKtDpjbuG/N3cccBvGt7Zngmf9834OTaimL6tvh
         bvs11Akh6kHnU1q/ea2cnRqLmJcXYYghqEOr1YjtndpciZOZriTtT4tZxOc4tGMoJC90
         B5OZK69Qn4yJ0HYwJSqutaHB6vlDYygonjD+nfG5uUJ5Hgg1nqak7QCed0SyXOgE2cZd
         f/II7hv5vU+ROWzNRB1w0Zdt4hqVMuFtWlAEpWmRUic5TIA5feUooKX+SMyMyCrl39xd
         SB/OaurfY7l41hn4vR9q6KadUc1gJtEwtOS97V9sSAAkcVlNAWP67JGySCHQVJvGpESk
         m/4Q==
X-Forwarded-Encrypted: i=1; AL+hErH1GkiDegzXZM4aMdJ2HkIyrfAM4hLPSjdjq2ZQKcx/BD4RhG5yKcQNlD2Q79CWcboc/z6IjxGaq76O@vger.kernel.org
X-Gm-Message-State: APuU4Z9+FfjG/F4WDKxuGraj5AWjwKqb+Ay++aKozabAas/Q5VZ2WS4f
	QXRSPeIcXMUZKljBUha0Rb7QUQ3ghjBK3ub3VRT5ZnQSNQKsg72sbkQO9msfR0cCHHWPTdNx5sI
	BPeJKDT1AsdNv0KnljM202nAdzbTfFC9bp72Q5QTcrB9G/SDXB23ueBjhQqlK6TlT
X-Gm-Gg: AYBFou38yTYJNMEBZ6VAcuzgzcfagcdzjeiAdJu6yudJEfc435Ty2+X2DAJK6Jw/kfF
	pKgoh7Z5MohOhfG4nbkWHMj6/PLxoDLURdiviqKA/td16jGjGzvF2p6iNEnNsfPvimLDBRmUrmI
	ggiGzz/deaSiuTTDM5u6QWhEIowHuXdbJYDgexMBdPcDa/woUOPrsHkO09Xhlg9HjVtoYWF+WQd
	C8VFAp8CiUcV088QODviqXeGibtuyrDkszO+8JuN9Po6fVsoUrePi+IfUT3R83A/FMuPGLNeaos
	OWwD5X7xNU80Th4NNoRCHtixa78ZL9N8hOKzKXApQZcveS3laOzrNkx5vfJYZPoZKO9eOfoJNrP
	EZc12xsns3IEn4r3BoKXB+oOwhj+TZoJRf/Xv1jfeWuWE3D5zR5OUHiVDcGGg9awH02WegeSzSz
	HqfLqvPa3zAxZn
X-Received: by 2002:a05:620a:28d6:b0:93b:d7a2:83cc with SMTP id af79cd13be357-9494bca6f3bmr1030873985a.59.1794670764553;
        Sat, 14 Nov 2026 07:39:24 -0800 (PST)
X-Received: by 2002:a05:620a:28d6:b0:93b:d7a2:83cc with SMTP id af79cd13be357-9494bca6f3bmr1030869885a.59.1794670763980;
        Sat, 14 Nov 2026 07:39:23 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50a6c826bcsm167268366b.11.2026.11.14.07.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 07:39:23 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 16:39:04 +0100
Subject: [PATCH 1/4] dt-bindings: soc: qcom: eud: add the QCM2290 EUD
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
Message-Id: <20261114-qcm2290-eud-v1-1-b6157b817377@oss.qualcomm.com>
References: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
In-Reply-To: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfX2jRIJaxOJrbP
 Ul/vmhH3UYnBRRwle5V4ukp6B/ERMs8gYYEsGEcGHa04+GixRJpt0XMyoKCi3ErlVJUEAdZqtOo
 /W1qVrbMwKnd06Gi5JbemxZTolopMQLxf4xnu1HNIxS5UStdwIl+Rp9Vr4/fP7gotfHXKECGrtC
 HuvsevAvuKwByAJhSvy2rGUAtgEMWnmAyRCHzJYKpOQfbeDGVAX2gy7Btwu++1hLOjdBNZKjdcq
 9SVcPFoj60JxSuEjRVafAQwgUoGUXf1ShaN/rGLJk6XPx8ODAoVtkXtbgz63SPJFmGq+Gqas4+D
 +zx87h3oG//Uzcm0UwLLhCLFMxL9T0fdkgj92SAtl4H0UQeaJXYGx91qE2ylJj12MSIiRbE7mtC
 9H5Anl5FzoeU6eXfzaRdKm4USS90MxNZyuVGiV7IctJgp8fQsYhAlt0bXuB7PoKR13T6CMdCTMY
 jZcsIkPFEzLBUHdsmlQ==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6af880ad cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=A5wwQmU0M-B_W0dhetIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: JMzxeW_Zooy0dUGstsNUOPouUv7kYX-g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfXyeJ9xC3k5jNW
 Vt6xL3J4PJ3BzRADSs4zmkqq24lJUGIdDfOJFY8HVPzPeDb48Cma+drZY4Ab2wQ4pxeMWb4W9oo
 66mRIbjYFew44Aw3eNHnvyjs+Am1RxU=
X-Proofpoint-ORIG-GUID: JMzxeW_Zooy0dUGstsNUOPouUv7kYX-g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140062

The QCM2290 has the same Embedded USB Debugger as the SC7280: the EUD
CSRs and the mode manager register that the secure world writes on
behalf of the driver. On QCM2290 the mode manager additionally ignores
the enable unless the TCSR register TCSR_APSS_SPARE_REG1 is set first;
the boot firmware does the same before enabling the EUD, and the
register is written through the same secure IO service.

Add the compatible and describe that register as a third reg entry,
required on QCM2290 and not allowed on the other EUDs.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 .../devicetree/bindings/soc/qcom/qcom,eud.yaml        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index 84218636c0d8..14503527cdf2 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -17,13 +17,17 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,qcm2290-eud
           - qcom,sc7280-eud
       - const: qcom,eud
 
   reg:
+    minItems: 2
     items:
       - description: EUD Base Register Region
       - description: EUD Mode Manager Register
+      - description: TCSR register that has to be set before the mode
+          manager accepts the enable
 
   interrupts:
     description: EUD interrupt
@@ -50,6 +54,21 @@ required:
   - reg
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,qcm2290-eud
+    then:
+      properties:
+        reg:
+          minItems: 3
+    else:
+      properties:
+        reg:
+          maxItems: 2
+
 additionalProperties: false
 
 examples:

-- 
2.53.0

