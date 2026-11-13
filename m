Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595999;
	b=3YMj2anueSIUmmILWtl8vmg9M2oVu2iRhKW2uJ6tjcyREMcR0Ok1J8KAl1uoqnf2eSQA
	 jiQiLdbEjTXnFvYwcyqYzSTkhCSu4y7+RrHqTnsBmEC2sHWlI6pPDH0wTY540U4lkcpSa
	 3iksSoUhyX24y7y+2MKk1O3zY/+CdtBuKSnpWYe6NtOpS7oXCYGRFuewYoA6T+pmfu4oD
	 25ji49jb5TDXGASAjtfOJIh41GpbPSokUIMMIL3X+TNEKva4tznVdhtOd1soyi2RKS8Wo
	 lygAoSj9sEGdIMUiafkPXgsoPk4wLPPXodcUJj4ET/Cob5/qPrlhD560N3RLCXHA1bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595999;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cwxAI3XOBCEUSdqA7JlE7nLy5CSrUv3dWQsI3XESnAo=;
	b=QkMu9V4qn6Aq6wFgF3CM7wqu7ZmcY1fjCcq/64l3uorfm/wdYXJ2ns84TuHxBxN87h4g
	 KftCF5kX/vNpk7w9tTM6JPjZESHhsTWFWcBw02pVo1iEi9fG24gmfMI2J39csJ8oAKHY8
	 LV9XieErt/5x7uWcLHvlqhX1brUjFD1zmtkO72ZtQYCyU1SVUoaiBaQJHCbLcdauo/fJU
	 EmU9xvJ3f7crFfI79pFpyC1TDK5mb8J4c/2wlHZgJPkhXOpfBCn8/mk1ZQT60t7c59E5c
	 k/ggjD4rgjUfaIOisdkbTFpk5ycrbZcJxCHMrD0swJbwhLgo+CWjgJIso6tEP5D3+mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I9nM5+IS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=At1u3S08;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D13606A32D
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0D13606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I9nM5+IS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=At1u3S08
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR5wK737244
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cwxAI3XOBCEUSdqA7JlE7nLy5CSrUv3dWQs
	I3XESnAo=; b=I9nM5+ISNqJ+v7xR4xPn4lKqp+FdLYNKSvCrLgsn1d0OcenQ8mK
	VJG50aMPTY7Kqt2XsxQiv/pNXcCQS4Uomn5oOe4GB5KRwRBGQCsMXvl+csE1UFBm
	OsUr2g907A6KldtokdWkdKKrAhLdD5KPAj2YMvma4FszD9DRyoA3P5NMtwIpj7kO
	7rX1I257LOuBicMq/sXqunWqQ7oheOKb2VhpZgc1bbH1HpCYIhjQND0Y8R2jZgja
	yyEkO3BD0I+W33iDraik2L1AwSrCsum34vpxB5OAXmS24CewP4vc2Ite1UVZdTPB
	SzYsYz8toXsOK5iOpnnc3ccQDfj2bUkqQMA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37jvba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:53:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so371407385a.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794595997; x=1795200797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cwxAI3XOBCEUSdqA7JlE7nLy5CSrUv3dWQsI3XESnAo=;
        b=At1u3S08HXTeWM9fmBcP1HjX4YqFseKGv+776ezlvOt8S2dm2F1G3+Xamf5kpYoc4m
         Sf96RrYwxxuLIDc2F9gHhPZOsZ/l6PUGUDEDx3Bz28dIwF4WlKxzofGRcUSV4j3zHP8N
         s7CcriF7T71/3JM6oCGPZTG2k9u23m38v1GHi9QTgFDOqFJ0ebbgCc3dizX9OXmUL7ub
         xBlTTw3JiWE66nkBiFqH54jlbnfbGy4x/j6dNGsuFHmqG/MyafT5HGi1A5IKL8+aJt2h
         tl/OJsKln1u9WUf+uW+tpnJ9i6I0IF2wXq+ViIEhys5vmbUiGJ9eq8iuW1zjCbL3k9hc
         nsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595997; x=1795200797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwxAI3XOBCEUSdqA7JlE7nLy5CSrUv3dWQsI3XESnAo=;
        b=1kpfOn3v+jIoMkaCCymuXuzt0rokP0tMMXEjm5A2/S1mbnpgPunqgR4hBP6QBZ9y5j
         pY/qC9ARbXgj2gCw7WFvKzSquxLSw6TbzRgvZi86xLyW5SvjkKD4cvevf2WVFNkmdzdY
         GYqNNxFEE4hhd82WSPsi6/HR+HpVHxrk5tXOCsHWLRCxTquxvdGoyf2zH8ox7Wxf3c7c
         +lmcDdOcuIRWSGOa7Oa46DUFhIWyPl+k2OLoJl9il9JmzAXE3PBeW20BcGMBJAoHllNf
         My6qLpqZCNuAvLN2JgPlGFXwd9wfIXAaGrm2AI8iRhHjNBoUF5SQo3MhZKxI0PmHOQCV
         0dKw==
X-Forwarded-Encrypted: i=1; AL+hErEw0M1rWYIdEZD2glIwg+BOMzRJSBilSi6dGHHYF/Sc047NMPLLF1ry67RWHBrnEX9qa+pjO1tC1aRh@vger.kernel.org
X-Gm-Message-State: APuU4Z9dfAxHg8Lxn7ACDQ4Uj0l3d+DLBvLw8lY1r7Am1ygFftwnCIDz
	RuqoFPdRnuhxJzvfk/cyAJrG1d6ePBHHH6ElX0zHXkqYd3+gqyoxlEdu2Qm3UoFsHKlxpQue7D/
	Db7ac4zcxeaEWNEp7E1m4uJiyfj/7goBakvA3pwtZE/1dbU+GlvwFW6FuN5amQCy1
X-Gm-Gg: AYBFou1uG83m0H26IpUAd5TjdyqG7s0E/SMUebIQzRp1UtpYHeMGP2tEuUFYVIMx6gS
	QOrShpitjj29sNVJEb/2tS0MU4MRNgoOq0SmVWEA66MOUbuM5GSezPm5E4zngrB0B4CR9LpoSeD
	MJLrbeRbFIaLMr7vlCUHv8mbrZbfwLH6EJndblZwkMvId7AMSgAGVuwzbFzGeNqy8aLEx2VZ/FK
	SXekybzqJzjC//CSmc0Tr2Qqj+IsgscuzbHD5SR47oev8tuPqs5WbDqKOdYfXkljP/11x1Dtn/7
	zmXbcvVNleluQepS5unXRE0REsMiS+Il1hVpCP4sMSs+SCb1fYY326pKS6Ncejc7k5npAsRiER0
	0TgfnctfHg7AulpPvZZ3+WQov9iYif/dC6NC9XUaxSgL4LtVO7Ppi0ns+qrUYFg==
X-Received: by 2002:a05:620a:394b:b0:943:f31a:c0a8 with SMTP id af79cd13be357-9494bb76dc9mr579499385a.17.1794595996892;
        Fri, 13 Nov 2026 10:53:16 -0800 (PST)
X-Received: by 2002:a05:620a:394b:b0:943:f31a:c0a8 with SMTP id af79cd13be357-9494bb76dc9mr579494885a.17.1794595996364;
        Fri, 13 Nov 2026 10:53:16 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm7369881f8f.45.2026.11.13.10.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:53:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: rockchip: Correct double space in rk3576-anbernic-rg
Date: Fri, 13 Nov 2026 19:53:12 +0100
Message-ID: <20261113185311.183045-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=899; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=li5zaRLbjcgdl53eNiBCGywQR7ZOj81A+LBTsS7dipg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq91yXeHEGZqRT6/RVGrwwPfQidox76rH+LTSJp
 7nYEKNA3gmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavdclwAKCRDBN2bmhouD
 17r5D/0d40vumkoOXhkSDodf9sh1qigBkr/vyOW5jnYQZmdDU92dDDMuDxKoqEQnsdJmCHkTubI
 ixM4r0eunLEaDcfq2ke9GUdKE10iii0T0R/BWNkO2YCJKEvXo37YTD9xBkjnONSdzB18rowoSoq
 mlxP/N3Lp96xX9DMGcdLAl/C9HAnrYjGbXt4O4NxEZI1769sBMWT1k97/1zZy42FEedaIxsTxpJ
 puFFCtfhQ2mh1r1C6Fwy5u6BOvoaVO2het2gOqJHiGWuK15yhOAl+GThjLPdMgJPh+7ViFJg2Q0
 BTJtHm3b0al+LHPOUsCWaZBTpO+3XjFqClpl89rFyPVhN276sUF3Gh+yBjmGUHIxCsX+/wCCzrQ
 oMhICNCLxOuo2BUZvPNj3GeQTkhCftafV0s1ny/NLWfe5M8fLA2YNIbWDzbe6dq/gJV9IBxQxb2
 d+eDBV9fJtZ04ix+gcVq+X4V9NjF16M8sxIoDWHJIvLv9rFjWSjdDe2PUQKMKXuQwy9GDpl4RXI
 p4sMpjjN9Twyop3VdnwOn265Rlq3+aBrg+Z0OQc6wvZVVld3DVnBmuPQUgx3FKBuZGI+gmHvGA2
 rRE/R7qV4IYZ1aouUSHPCxoGMf0Pa5KykdMXRxvE3Q+P7wry6C95zFVa689zPV31WUKqLI/H2Sq TXH3KsVXke0FtVw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX3TVY7OcXb/Is
 OrW8LdN9fFH+Q97RhzPJtvlFXfkYYN8Co4SVUDxfdYGzRLj4HRpsRz1UlSPoQ5rjcZhWCwrj9xB
 OAqrDO2wBVL6N2f7c3nOLHS6erm9FnA=
X-Proofpoint-ORIG-GUID: YWWLW_fF3SIZnSLrd9vuHuj-SgFWQBlF
X-Proofpoint-GUID: YWWLW_fF3SIZnSLrd9vuHuj-SgFWQBlF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX/6NkzO1/HZZY
 /qoh98JLi4IkufR20gjER1XSI4iNVfl/cVuQl9ZiOEzoAHcjx9Ct6A8DfdS1kVIWSJIyWqfM9SR
 QZBuxPhc5GqMd3ME+xuVl+Z3+3MqUVMSOn+BIWxXpPMXxW/jJ716zvXfhEcNySggbDJgWreaKAD
 Hnjh/rH1tUm/u2qCfrKjwzW8C7D7c2E/Y4Dxa3fadhjcZXLU2OBHA1Js3+umLiEcYpLj23WKtDR
 k1PoFhs6wKwAWrGwCdba7LnEoIloqpgtv4sbb24A+lct63EJ1vEjvuF8HC/HqD3t+QVGgeD9zus
 fytDDi29SAz2Goomk4prue7bhMEsqPtR15cggt+LsQG0co3AAgE3o8nlMWGvCWvmP4LmBKMC/n7
 g+3wtLOVVY4K5WmQocRSQrsGbCEnodR5iLSNw2FiyU5kDf8bJ8Gxp4K9Aaqk1/nkbB3yWIqGtlU
 bbmtkrdRfPRRHaoayBg==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af75c9d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=JQ9b2t5kTtvAtS6z_5gA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130075

Correct minor style issue around white-space: double space before '='.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
index 62585397b01d..4ac849329ea1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
@@ -913,7 +913,7 @@ connector {
 			label = "USB-C";
 			op-sink-microwatt = <10000000>;
 			power-role = "dual";
-			try-power-role  = "sink";
+			try-power-role = "sink";
 
 			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
 				     PDO_FIXED(9000, 2000, PDO_FIXED_USB_COMM)>;
-- 
2.53.0

