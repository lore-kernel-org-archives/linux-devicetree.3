Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100680;
	b=plvd34u3kZFvZbL5gN2pEmZ/NK3GzdyhLwxyaYl+tbEpKSPZEgOZZjCS5LEfuG7/i6E0
	 LoobsGXV9Zb2xESvawvaYtFbkkEhn8KsfylsLUoBPkyz+MU2mhTJs+lRCR3YdTm6yD0NL
	 H/MRApQdtE/l0M8+G4HA6DSlJV9jKa0LTRZycrfznYkgzFk56KxqpIMrQoZLdeMQk73O/
	 yJtLmuwHbbVUu84C34XftlkU2cwzDkaVLevTxcgKi8/nd6S/VYsJYPG1spfjCSsqO98Qn
	 Zd5xdS19Sn7JBrzQ/qwBWwHQS5k4k7pXiipUI+XAReNBubidJZfDcVBAqNDMz3lOitw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100680;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9dDFOypbGSRXFMjpmv7vaHRjmeUkie/hrxavVTVI9H8=;
	b=2i8nEpV27QSRt/j5h/r/XPGhGx0nF4rQ7HKRbB3Jy58xz4y9SGpoXcmKsY2YzC5//b7z
	 K/UqLjv1VBO57b/gqg2ERG8lsPHJ+v1ub+tAOUXLxGWOGu/6Ok2owhOG6FIMJgvwdjR+7
	 J6n9oPFNJRweQapDnq1JjaR3WtfHxm0M263vw9JJa6qf6SvFQTkZ8scbsrbyVbPN+egrg
	 zSpN0Ue537+aykdGN+ccDzEKSXBYJV6cRBkzOm1F3IV7AhdFHQ1nfbRhYOXabn+eeRQ7L
	 H5bvfh6PzHSWGvRU+vh7JC10DpLSHc8s/UNkM9E/PqBfGA2qxp05/Sjw2+9VfL1Pb4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kq0ZjYZF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LjLoFOEc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBEC606A326
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBBEC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kq0ZjYZF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LjLoFOEc
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBjvQM3583614
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9dDFOypbGSRXFMjpmv7vaHRjmeUkie/hrxavVTVI9H8=; b=kq0ZjYZF8IEclIc8
	XnkCK/LXhmlXpTCHO9Mql2pWopVYvo6t+Iq1esu7ql/uYOHPULalAzGsXBUkHb0V
	GZ2WhMfUUQQm4hRZBXjMWuWwM/AO7hxEEU92I0LVyjhKJ34qvKqHTjkeYUdbTf7t
	9xJFv2vM12RiJOffYbk5teRA+fhVSMloIAaoDdblqJTCkxpwI7r9kEN0DJfz1Et3
	oApL2ohz4iQY5xbH4RUB241h/7ozrFLHP8ELgAVp11HLrKKwx/N7Ctf19TD+M5OZ
	xlXPZz1LBqZsC5sBVwBzP64s+wA36NWoDcoNWjE6xXeQTuA22Br6jQv92gJ+CJ6N
	M9toGA==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xymh53p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:04:38 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6790b1d37e7so3578923d50.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 07:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795100677; x=1795705477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9dDFOypbGSRXFMjpmv7vaHRjmeUkie/hrxavVTVI9H8=;
        b=LjLoFOEcwr8iZEuyDyGDAPMAlfD5lUbmBAFy7nLjSq1pYcmplT85oY30t1gQif4KO6
         TAwQIcKAcpJ/1TutnFm8v99UNn7zOHtXZ08unfKPIHKBY+tTGAV+vAXJ/7o5ak2ULxep
         OXqroP1WpFYd0Ptasgm/z/UwEN/vBflnhE8YvIwGJLq1JXBljB14MTxduJxnm5dJLWsK
         o3+DpKUeuDXu2IGhFYwQ7UH7DUtnGwwAUGPPL8ixYm0aLuK57N+QsiDnJ0v5p+sMzMmV
         5avCCX07ek7svnCV7L4dgveXcXIcUj79xISZxFoB+N2VlSv5NgFAv57iuM8vk0JG8u02
         MJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100677; x=1795705477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9dDFOypbGSRXFMjpmv7vaHRjmeUkie/hrxavVTVI9H8=;
        b=OsjjG0FHL0HuB9Z/SRl1egdcWeuibnY/1jDwMLcFbXyTx7H7pl3OyAgbWtUCuT1Aw+
         3tmbMVHNYCWNLwImGvPvar/CiGMkgVD2smfP4CueF4oNaa8ldWWRGpGmeSS7Ft5+8HPd
         33+XmXYvMoGa+/kN/uE4vcHqHedRGInVc26OgTKrPQhU31mKlY1s5kwCwuYnZvF4f+mp
         79bsQUCk37AKD77vONtUWCzWzxRM1lGhpImKjrBjD2nqwiWnLHssv3LlzT/uxE+uQn9C
         vNqEHc0jYhT8uGmO8iCerJHeBsWh/Kyt1i3BZc+h7JBFPWqMmGWW4zk1aaT38zHIFvyw
         mpcA==
X-Forwarded-Encrypted: i=1; AL+hErGAtYcR9lxIDobAV+o9GJZU26RSjdS3tr793Hi8jFosatDOKEswmgsoaQRtU9rlb1pHx1Cip9jPfN78@vger.kernel.org
X-Gm-Message-State: APuU4Z+K6NS8VDgz0X5VT6CDnjHDosgj3hPzpHHGSXyr73gEzkoPvZfk
	PWXr5RNRmjtKkb0dFYoLrJ4Rfr7rHDj/Zq9efxPVp5nwb0NLe4SfL2e85ANem6UBKE1MMD3Nute
	4BUvb2588POGtucln+XW+IVF/+QcwmnccLG+NG01rhJCXgqjzG6NUtA+abm7SAhh7
X-Gm-Gg: AZFdTZdoJgUpJaMQW03C2FqBgH33SYQv4yO3RCjFUF7w3LvaGpAigJewVEhVb0I0XIA
	yfh0yzxOyc+ZDp04QKLD9pzORSOc6El6klUo3kyDFPMSbIGftFyE+fGA0830s/64sV3wXXxB14U
	GGZTyHdriYZXV6wxaomn50p6XPRbTMPJlODDqvLzlq2Fm7ymekB3hde+99TYhZn4sjJsV4D+Bhl
	+dUle2KfrmEMgfaXiAKF2D3ONMmlZOgnx5WWH3kUxiyMCZQzig0rmy3ha8m/1cFj9Qt71CKYoRP
	uZ70CIvC1d7jSQQPqFh98p7nLUBfvjBayIB8kn0JC/hQ8EGahoY2CC5fRhgOuqRkA5l0oG55hrj
	x0hi2ueV44tBhigA0PPFLVROXPR1jqXu/+2odpeosCk1Jyay8eQ5LIYEmVeO5VM2AymsFIp/NqO
	yvEQkt
X-Received: by 2002:a05:690e:168a:b0:67c:2421:f2b2 with SMTP id 956f58d0204a3-67dd3cf9f12mr2735267d50.6.1795100677531;
        Thu, 19 Nov 2026 07:04:37 -0800 (PST)
X-Received: by 2002:a05:690e:168a:b0:67c:2421:f2b2 with SMTP id 956f58d0204a3-67dd3cf9f12mr2735212d50.6.1795100676977;
        Thu, 19 Nov 2026 07:04:36 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33d64a0sm79790d50.22.2026.11.19.07.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:04:36 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 20:34:22 +0530
Subject: [PATCH v3 1/2] dt-bindings: media: qcom,glymur-camss: Use linear
 CSI ports
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
Message-Id: <20261119-glymur_camss-v3-1-71ab966c41c9@oss.qualcomm.com>
References: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com>
In-Reply-To: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795100665; l=1615;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=3SVM2RsbonCgsgSoLY2zONHaCQGkDqvlTsplAN4cbGY=;
 b=rjokAHLP7v4iGEBnNQxOz+He8NglBkMudWEz8bESTeFaAWase/oibnkG8M8RJCfPg2ezzAVLQ
 QgbGp54zepaCb5SoeH64O12mh/ybNdtHTBQDwujcLkCUXRi2H94ZQtI
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1OSBTYWx0ZWRfX/1AWG9w8YTLm
 sJrDM6eiUCBmMY2F6l4ziR6ZgyUE3CN1gQ96upX+65Mc1qyDnEoSxGmz/Aerp0LKcZ0ZmPCFaZu
 1TkHL1WcNKa75FoCCdwhBeotyclTQxU=
X-Proofpoint-GUID: i7bjhNyaC3uYLHMnMjDA_Z6OthT6gd3D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1OSBTYWx0ZWRfX0uFk9bgsNTPH
 +zgsf/9u+JCHJcFbqNHXafy2PZ2MeMIKt1whlZkP2HPPpyyUzQU666ehQEInLUXYSNmHVNHLprA
 JET3z0Ohe0RfjkhqfokZNZkYNmqVfeD1rs3SyR8NoOJuduejsQrBQiLfdhLc22i5SVwpuFRyYa5
 kWhP3iGTu9pDdXO10h806wNVRklpj7YCqB0PuBtAYTqpHe9rxEMcWYf5bwF4UlZU8w1b/4+fvS/
 XKzqDJdzJTbTyVKkRDNmWRTcEkm0OiEOBLgEMIjZ69Bacs+xOjLpRdseHl2lcW/6LBiid1NC6xo
 Cr1EzbA1LJELhCZO9GAYotyHYjBVKPPm4ddAsAI1UpZuMG+hEjepk8LyHkKU7Kr6r0uu98mmwWd
 NZ+lA3NYheiZXkBRzNubxI3KDjpVfN+vcAMQV1o0xO/TQcs75dN7/R3topHzkSBXk5WN4sbAc6C
 mlBm3faG3OVe7dJksZg==
X-Proofpoint-ORIG-GUID: i7bjhNyaC3uYLHMnMjDA_Z6OthT6gd3D
X-Authority-Analysis: v=2.4 cv=WKPqzXsR c=1 sm=1 tr=0 ts=6aff1006 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=bf6BjHq6SqOzxvFPJRcA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190059

Glymur has three CSI2 PHY connections: CSIPHY0, CSIPHY1 and CSIPHY4.
The existing ABI used port@3 for CSIPHY4 because the driver reused the
X1E80100 CSIPHY table, where entry 3 maps to hardware PHY id 4.

Use linear graph ports 0-2 by replacing port@3 with port@2 for the third
CSI2 PHY connection. The matching Glymur driver data maps port@2 to
hardware PHY id 4, and there are no in-tree users of the old port@3 ABI
yet.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
index a0b77edc212319fad69113f3d55ca24f184d4b23..18a38fc4f9025f6b927780f55ed4fab194091c02 100644
--- a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
@@ -109,7 +109,7 @@ properties:
       CSI input ports.
 
     patternProperties:
-      "^port@[0-3]$":
+      "^port@[0-2]$":
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
 
@@ -288,8 +288,8 @@ examples:
                     };
                 };
 
-                port@3 {
-                    reg = <3>;
+                port@2 {
+                    reg = <2>;
                     camss_csiphy4_ep: endpoint {
                         data-lanes = <1 2 3 4>;
                         remote-endpoint = <&csiphy4_out>;

-- 
2.34.1

