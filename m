Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3BC3469E7
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 06:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788243188; cv=none; b=c6HWad/S9v/RxmFqXwyHMxi6XH90OKiizWo+Y5IpeJnl+eiWm8gOiqtDkcltqsiJXZVOcw6ZB9hWzRgebOHf+Fu12ijpLKpskQ0Zk1xJh9SmlzWcdzz4Ccas7cgdIdcY/XqP1SLz1XeP7pmnFEtZSBCUWJ/+bQ5+XFqphn8gwoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788243188; c=relaxed/simple;
	bh=tmBDYtXEn7QF+P/Gffrerjt1xFVzGjsaADtgY4akAV8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jddEg44NDFbp3sNVqjjG+GOOKFWEBcWCg3ZeO3ew0Ni1d6JNb87Kp1AlVoItoNejN2gABe8Mqi7l6Cj7PQ6TSgFbjlRCdrcFx8QDtXmNRuYWjmYZuBshfacV3CixS1PmwCvKHfJ2ELhRvpwuCmwh/4J2K8Ct81K17/BjP78rNCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PLBz4bve; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cibl+rhb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PLBz4bve";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cibl+rhb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6810o0TC499808
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 06:13:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=64Fc6Cp8W9q95DTXHpfoWRnw1VvjCOGDPFU
	7ee1+j78=; b=PLBz4bve4E/wLQ/FJSCQ/yjd1/O5FqZheAHLmLdrATn3MekZH+o
	dAiQRvEB8KT/ZhuahE4O3GWNOHqePSaXZfaIpwuwcH1uJutOZdQYx/QuQ/4mW6Yp
	ahYvl7/Nwi71kkZrlmuRDlftfCkAjzszZajNcHM7u/Omv76hc3oOETAlcYSFivRr
	T51qkz+TlbjqUHcD9y0xeXg1kNK4zzaS6GNQ3Qh8tWVUTa65jQs4kikdherwoaiV
	yZL3Ovz3+yg3n+6YKFq/FwCk/gPcw/Y+yI03zS+TDWGr/NVw6Vuyn0b7m1A8lrl8
	0t8gj2zn3Yx8noHBwmZWVAjJw7+Ylx2nrBQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdjtx1hh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 06:13:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e820609d9so868095885a.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788243185; x=1788847985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=64Fc6Cp8W9q95DTXHpfoWRnw1VvjCOGDPFU7ee1+j78=;
        b=Cibl+rhbj8hQgHcti+dpgqlHeKKgMe1SzjLTG/nTQSSMsn2KmWx6X+PPDDzwmi/GlE
         9tiJe4AvKqYMQykDUBC96sFS2o5P8gmXiEwlby1iEOQO/e3kL/fi0QDAMHOLkCxFuETy
         vAa7QcSW8lai+5CN+d1GZygXV3uIfbce4h605ySftk8lih6aLTnmGLLTJ8CZ1Ao10a5U
         Bz02SIo64aTaiKEQX4hSUjh45CY4WtY8KfHWgXoofUoDHoUXudWQFTvWZndmfPTdnpdf
         v81BQIw4rzq/gfgrozRnyNVApjDewCZFquekyWK1AiOw9zmP5V/jH+fYoQfI9AlIJtl9
         9plQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788243185; x=1788847985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=64Fc6Cp8W9q95DTXHpfoWRnw1VvjCOGDPFU7ee1+j78=;
        b=G7P3R+LBLtjCjlHhf30SJGaCzNWoDrKTFllHH11a8M7fnD2Dzy4P3+hA7VCHk3CCmm
         jQvvaWEyJ24yi6NiUJVksKzpG/P6eup3nBpnGd+Bwo9gy86P+v0m86Nby/plcLvoY2i+
         LdFaUidoFARpup+E2qgf3ihHwKgmPPhj+CnF6Py9anoqsvPIFFdAsIu8hFocFl44AMve
         9yAhuTmVrEXdsPjD6wGt7l0XMmUIls41J9g0dblM7bO+dlGbjqZzB91Wl6+u5m/skeTe
         uuGUoySE5o7Wb1a0MxgnFpb1H+9GZ4ecG9O40rrZzAGdRSfBmrD9mvVIwu79tYnm3lwI
         9bNQ==
X-Forwarded-Encrypted: i=1; AHgh+RpBVVX3C02f8DvrClf/W8H7Eiz2GWOahRuNgFeVYj/UpCY1BFSfSe1+KN77cDfmXpj/6/W8jAK6tcwO@vger.kernel.org
X-Gm-Message-State: AFuF++nqUuDAaThpsJIYXKRTkY2tZuyxsAPpYOi1+nfnWyfac60FgV2f
	XcqbIN+HWMaKJf7bdy0MqOVMGsiXyNOp2/J77tK+x7UMFjgmUcTAhmSxBoDBl1RpQXpgY6p0lop
	1L3g725/ScaU9459n9RNdDcoojhyY27IHdzp+9s6LWR1rWkPrjYHQLzxU+u8lutd1
X-Gm-Gg: AR+sD12WmcVRgTOh61G88HRiojizIF1NSy1msn/NBPXFHiPw15FxpHqusYWmnOBxeS0
	QySqdF+mIn3DDJP1Sqkf8tbYPs/saKDqELtIYHUTWhX3mSbZ8DiO1VOquFJv77K/FC+OiH334Z2
	3aR/rVKfE7qOgibU/PseLJ82VLiD6FElvjSj/uUN0ysYJMnLcW61QOzUdYNXPJzgGEEU5IdtlZ8
	sZuLdouTzNEuO5jgbvDkLgzvYA8GCk+8JWjPYdSmQqhMNx3Svti5B7wKT9ZFM+hbWOhbrmeEQt5
	wSXalZWXzvHrNnso8ng/6tjcf37h/POxqDurMDsdZzeGU4OC1MPLfO0hXo6pBHEw6927N6Fjm3E
	HyHEENenJ4c8dB4g=
X-Received: by 2002:a05:620a:bd6:b0:939:3626:558b with SMTP id af79cd13be357-93947f80627mr875352685a.5.1788243184757;
        Mon, 31 Aug 2026 23:13:04 -0700 (PDT)
X-Received: by 2002:a05:620a:bd6:b0:939:3626:558b with SMTP id af79cd13be357-93947f80627mr875342085a.5.1788243183663;
        Mon, 31 Aug 2026 23:13:03 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d6eafesm2397518f8f.24.2026.08.31.23.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:13:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Madalin Bucur <madalin.bucur@nxp.com>,
        Sean Anderson <sean.anderson@linux.dev>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH net-next] dt-bindings: net: fsl,fman-dtsec: Drop redundant pcs-handle-names dependency
Date: Tue,  1 Sep 2026 08:12:56 +0200
Message-ID: <20260901061255.25734-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=853; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=tmBDYtXEn7QF+P/Gffrerjt1xFVzGjsaADtgY4akAV8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqlmznaSgRk4CJ3ULRxmcX4rpugQNhVnRWTGSNa
 E8A3T3lLLuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapZs5wAKCRDBN2bmhouD
 16GeD/96j4VBBsiOCxTl0vY/rbA8roLRwGZ3c3rpd19Ayf3xympShEh+TzwmkP2v7y6MVbhwXjC
 NruCPEIKt9sgo7pAbzEisogKgDe4AjgGt71y7CWmC5nUu0TknI37yYJ+aErbJFGqySI/xbwiRzX
 qRvSIRDqTGqcuiu0JqL6+36SCxwag183wGVEZu0Tb6HI5D/+npcQw8poWp1Zg92Xe8jMUQnTAR1
 z/BgaW6l7EM4/LgfkK1nejeDUvTfQZxwaAlwfYL8IDAhwZn34Jzq0OzLXX31piyJEku62dkx4qH
 Wn7/gUQSbcjZMk7RJF4Vq2tf8U6HNajurrddJ2drO5EGjtjiTYKS16CzINWK7ZPCrgzyQfq16I8
 gxHhkNgi6FipFRqcf5t7HHhohmanrHGPGs1HFqnesrcADbPPUJr76Rp5KpawPBIi2z0D6NxpouJ
 K2TaeA45YOs4a8rhtxn6BazAi77oTSJX27pWEkiT7PIkWByALos77eUJFTUN7TnnPah8OeupuMK
 wQIEkfKL65t2F2IK/ETONLL8lAkK73QRWWlr42CxwbXokanzE0a4slD+4G+HiKcAvM3FvL8OVj4
 EPYmAThrrKKv8uR/Z747XnjPTvFsv8Fpqu033laDwRl0EchA8obE7kUgXLWfxYMx31Eg/nUb/V3 m0OvCQKjvWRg21w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K78S2SWI c=1 sm=1 tr=0 ts=6a966cf2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=kdWYA6eUZccx_msbsMkA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA1MyBTYWx0ZWRfX1+fPSmpPAX1m
 WZoRNjXFFi7pZn2pkUfH+qB2H3kbSOq4mZMuvPNSx4ivZj1O7ZJj5V9U8Ma9oRlWUCMPab4fkrN
 ujSqvCQ/GiHjiPEGaIUgXVWtazEf3uM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA1MyBTYWx0ZWRfXzblf5CW+cdtY
 2BUHcEHTIDpJYeURFso0WMiG0H7LSLCvAxyJwHfJS92Wh0ru2LvC8yy7ehZyVYtB9pyeomk1nN2
 5d+tAkzc+lzQxqqxnBOPsdpY1MIlPxyihAUfRTgMR9k848FJE6y2LlYYcc4XHVsPybrqzioAHe+
 jDkyVdSRtWAmyDSxNZ4JQ3SiwWhVws5y8g74VDZmQnpqFxNkxWtmSuSSmp4A5fk40TGt9wBxPbh
 8tDNilEIm1Pq7IsBL6kQJD3sfj6yUyoBVevDM6ltp9A4WmR990+CAXqb9+OlWA4GJZJi9D/trs2
 Rwr7m7bf8iTlkY3uA9XeqirDw0nsarfho/BEKz6TPWXFasdGFZI/4F3yVip01vaO8QnpEOU6y3v
 g7XL5iTCwGpIkQwLDa4NhbWiPF1pTxncWjbsrpLApuaDnSyW2pAVjTk99cRXnuezUb3Y7UK/nG0
 9XH/RcTQeO3q5hz0ncw==
X-Proofpoint-GUID: XrMI6vuumqDbZeXmfYfUynM-UGxAR79C
X-Proofpoint-ORIG-GUID: XrMI6vuumqDbZeXmfYfUynM-UGxAR79C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010053

The binding references ethernet-controller.yaml schema, which already
defines a dependency of pcs-handle-names on pcs-handle, thus duplicating
it here is redundant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/net/fsl,fman-dtsec.yaml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/fsl,fman-dtsec.yaml b/Documentation/devicetree/bindings/net/fsl,fman-dtsec.yaml
index ef1e30a48c91..5dcb49f2f3b1 100644
--- a/Documentation/devicetree/bindings/net/fsl,fman-dtsec.yaml
+++ b/Documentation/devicetree/bindings/net/fsl,fman-dtsec.yaml
@@ -125,10 +125,6 @@ required:
   - reg
   - fsl,fman-ports
 
-dependencies:
-  pcs-handle-names:
-    - pcs-handle
-
 allOf:
   - $ref: ethernet-controller.yaml#
   - if:
-- 
2.53.0

