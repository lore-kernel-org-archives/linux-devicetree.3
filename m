Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3897342A7BB
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 07:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827835; cv=none; b=L5dTH5ttXzlgH5BcAShicmpvNPE6apiqX4IKZohvYJgArxnJURrXBj/cujLxJ+LrC2a1AkBXCKSYVqUwomslMVobbvj+Q/iI5qpj/scX/N83EREkn1pFpvQuKs+5q2GZqolencuUu3Jv8e63AAdrdwqAdx7QRTAyDkly5x1qh0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827835; c=relaxed/simple;
	bh=NCCwN1szetFQ6aTYWDyorxmsLSJn745QpATW7kLPexk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kDSXP5wGGQ50l7FBJ6OyOUBX8n/2ZWfDCow4OVlqdZE08Y7UMrPVYA4U1hyBV5sDKrDoc25PqAMTw+3/mfp4rk+QG3NDqgVs/OIi5EqcSFsw0T5jh5sUuEIFgl32DffrIOuhUbZlzGZlkf+DSV8NDsproFGyJArWaU3x2c5nAsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VypR0j+M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XjnmY9kc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VypR0j+M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XjnmY9kc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674198t02578113
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 07:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZuMU3HRIoQauvAlgNljZqe/VSI9nMSTFSr9/NCqpk0o=; b=VypR0j+MjGJRAhGR
	rEZZb9um11lUSFhqBe1s3ZEVMvHATOuLoMrWUaNmwIrzzpOV+/RKGw+yowL3n8bi
	pyYRb1rvIP+iTD4+pUY+kd9XpsQe99gjObuNv39hVG2hg+PPmbRtQaOGVEbNl+cO
	Sj7QXJgtuqwgJp6Bh9noXUk/bn6gMGcTp4/nuRvp95NYmY0pY/T8J2+x0sP73iI4
	o4+mEVsO7ZIdAN0G9KO+2V1WS3zL7u98/lP+CSxJ3BjIEBgjsM7GNT5Limxr3B3V
	3OZ0w5SAmHbaBm9PxvOQEn+N6K9urqSL7R3Bjbim82ua/jAcH19X9xlPFt6sykM6
	vyQfrg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3sk2r8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 07:17:12 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f39a46efd9so5257126d6.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 00:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785827832; x=1786432632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuMU3HRIoQauvAlgNljZqe/VSI9nMSTFSr9/NCqpk0o=;
        b=XjnmY9kcOIw6s63Ps8qdru7c25hjhhrBEySn4KkeGp08bvpCj3q/kWyeIIbdQgNE0X
         BtXzBNsKq27/JTWTuNbsXcvRzSBc9ePZ0TZFxGKsBqDWZr/08JFdzvytVEFHjkyRI79v
         A7PyeW0a+PpG3vE/+4MA8bl5Vhlz3MBWqYCDdadMnkMJKAB2ur99xJPqlUcooYhMVVgH
         HpAUN2QdCJkkznW+1B4yiqE6IwYh7a84Tapt7c3pLTcb+r79f/08Na+3q4vEKu6jOlCx
         sXluXAL7Tg+L/diOvCaWbwpJjMu/EaId6DMm/GYK7qDq3ybh+slYAa/2m1kG3gxSIlo0
         VtOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785827832; x=1786432632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZuMU3HRIoQauvAlgNljZqe/VSI9nMSTFSr9/NCqpk0o=;
        b=FcoNxTTUCwdbmaIfqG3V7Kyh4h/G4zU9icilui4RZQVT4FRv9O4o4lAl1qHLlGiswa
         5WoN/dUIv/Ph9v681TYh7qcz7p4VF9T9l6JB59BzL8iErJZvz4QFvPxfMu+R5fcOqupX
         hqLBV4d7FtXhp3gMICKWH9YiUhTifj2Qye0grL0Kelz4uQ22a3NRiBR9X7AQne+mHK1R
         ARKX66n5Cvr7X/u5lbnuvQgqwM82nog1qupo8HJb9UDqQwm9qRDpZsb2cDfDpQUO4Cz3
         FX2yT7wPO3jprQ13C1JCjXTczA1/245fXxxTnPQE4FaUjkxIXO8Zb3Bf3d2lekPa8SB7
         mCGQ==
X-Forwarded-Encrypted: i=1; AHgh+RoUfoRpcqr9Ryw3nVFzz3N3ohlInpo1vdWtB4NZSG/jM/vMZFEQNAz+SVRmyxHnKvDNoAByyMqyrMeS@vger.kernel.org
X-Gm-Message-State: AOJu0YwHVOLhQMe3+wPYSDS67GwZzvKDCzBO3hqOIKpUjAllaba6DaXA
	FhPLySF5yAneNS05lyxuMBJQ4L2qm47oNXLZMJ4bDEWTU0oGSqfEkivkjESgvaYO25KDCBIFBiA
	mv4qwbV/dD3ET44OdK/g/JaU4L5GUKK78N1DoTG5/s7jBfZLgSwCpBe50QzY3ZaKi
X-Gm-Gg: AR+sD13kOl+zadw9qSZh8sNxi92VlhB0o254l3lbg1RubZvR6lQn96KNkG6MwNQ+r+M
	DhEUyyo3q6C0Vtb26yZhcXHkBkzCQHfg+RPSdiPPGcOjGmblgFdgnhNu4MofOIa1HwUx/6Jk2Ra
	u9vS6bmjtL/m7Xvvf5mIkILlba/cFyuPc3KeCsxxgCyRCnuFEVEwthfw2aZy4v4pDMAE/KJTb/Y
	yj/Zn0JY/uGE/2Ab69NnmDZ0VTSsRAFTmy+r1bCsY+HMt+0rYNL7LfQqr34t98PMTGLMIj3QAkZ
	nUbP7fPxDdS/9Cu7Dk3yjqgvNoSVCUFEm1vwij+R/WyrjGAPFpNCL7FR0wxUUg5TLYaIP7d3UeJ
	9jbNfP7tWdDcKwk8fYBUnGvbh
X-Received: by 2002:a05:622a:4d4a:b0:516:35fe:5524 with SMTP id d75a77b69052e-52cd3356ed3mr49122311cf.5.1785827832332;
        Tue, 04 Aug 2026 00:17:12 -0700 (PDT)
X-Received: by 2002:a05:622a:4d4a:b0:516:35fe:5524 with SMTP id d75a77b69052e-52cd3356ed3mr49122031cf.5.1785827831945;
        Tue, 04 Aug 2026 00:17:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm420265975e9.3.2026.08.04.00.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:17:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 09:16:58 +0200
Subject: [PATCH 2/5] spi: dt-bindings: marvell,armada-3700-spi: Drop
 redundant num-cs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-spi-num-cs-v1-2-4ccb13dcc7b0@oss.qualcomm.com>
References: <20260804-spi-num-cs-v1-0-4ccb13dcc7b0@oss.qualcomm.com>
In-Reply-To: <20260804-spi-num-cs-v1-0-4ccb13dcc7b0@oss.qualcomm.com>
To: CL Wang <cl634@andestech.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kousik Sanagavarapu <five231003@gmail.com>,
        Vladimir Moravcevic <vmoravcevic@axiado.com>,
        Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>,
        Prasad Bolisetty <pbolisetty@axiado.com>,
        Karthikeyan Mitran <kmitran@axiado.com>,
        Michal Simek <michal.simek@amd.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=977;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NCCwN1szetFQ6aTYWDyorxmsLSJn745QpATW7kLPexk=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGpxkeyiitHJEq4rXOCGBWHGfJ2hH1hlqt4FC4VbI26K+8ZKP
 4kCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJqcZHsAAoJEME3ZuaGi4PXrEcP/3RI
 FOJNWAVk9Gn1G3HJNpDwNSNFxz5Vvg00cI4fzYwqELVzjKrQPMd1RqbFkOlRTo7ugCGm/ziPjrH
 4xiCDceOmh7Y7lMTZKSsCupr0rpSoJSHm1EWRv7txe26AtQfdloWkZ1irga3Dup8hKFOHSZIj1Q
 bHfe4QWL79S4zcLTLOIfweTkYSZNYRtIjg6A3hzL6YgrNy79qvOnSagJPqkz0MJPu9egGIe8VKW
 zVUdlL0VOZ0IXUe4eng7OhnDC9P2kGPDmIYQICCDG68gZXNW8gIUFbTMt8ib0k1dixTp5i/zvM2
 eo+Jn1dwdftmXZ68NDJTHks6vIdCBNXVUX/bSKy95ZQoGhI5HevtNv7ADVV5TTeTkjruEAYKUen
 4vsKR+OEkVZTHq2+TDwZ+kQEZY7hDXkT6q5NEDMkQox4x5sHPP82u1HewddLCFmz3tfCYkJQu+U
 x2EXsn8RM9knYJoy9Fpy8P/0oPcdU5nGQTMWA38B+E+qsJFq+sl8Tl8fuHV4OBrAEFX6/XHTZ+C
 LBDQYTh8LrHJ3P3TkPTXYisijSbqFG0YbiciBFjZXAXTw7DIe+EZbhroejuaBKL+rqXO7ZzCjLh
 X4Ca9wiVp0uKir8UbGmRI12LJAUzzhjA5eL9WQhM6op98MAapK+VtCTPh3WcWnf1R7kwOvGtxam
 lTEap
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA1NiBTYWx0ZWRfXwiH3sfWKXDMx
 nRlr5mxDyby2HPz+7tOOdcJkb8AiyTygfaxZQeV6SkwYTdFiZpMM378UIzeat5DjMaF9BTvviD3
 vu/nA5uw2VMY59GMZ87Vw2OO2i4cdsI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA1NiBTYWx0ZWRfXza74DN7SVWad
 /zIKBTR4kc61FXV+m1ct/VSNPR7VAQrCr96Diz22NDcknbkyWkwXdz4gWKDCCm3iV/LiWqIE439
 Ko0SwB2iIhS7+GNg3W+Kz8URVnW06J6lda17aqrzIaGvUVQj186kC6u+YcVEHqMXmjOwHDntupV
 7aS7sqBX4xwKGZyb+6CehmQURksCLbbgL8kgK1W/uU1jnVON8pwFBWYCpJwdl4spz9AB/wgSzMC
 c3KoXaN482lAG3zo6SOpSW0tV5GMRoNRT779aQITfIHmRv3kV7hkX2yXj2vGO14B0WnxE8RXwKQ
 tA/ua+Hevntc1HaOYqYE/SUHeuiJtB6N8V4TAB+EXn49rAqEM/BNdRPRk+f34VW9SgEMvF3uTJu
 OIT3IAW1I20MrTOKKphLTZ/ACG7Bnf9+/CR4++DbKnLaZT04yozI8klEMYtqg+Lr22HZylzLdql
 CSPkXukOiU8O4iMoULQ==
X-Authority-Analysis: v=2.4 cv=Nu3htcdJ c=1 sm=1 tr=0 ts=6a7191f8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=h_P405bTkPm-sLWfBjsA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 0nAm8MsLa8H8oiIjNxyCY-yp-Z2TQuQ2
X-Proofpoint-GUID: 0nAm8MsLa8H8oiIjNxyCY-yp-Z2TQuQ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040056

'num-cs' property is a single integer, thus the binding should not set
maxItems.  This could be replaced with proper min/max constraints for
values, except that such constraints are not known.

spi-controller.yaml schema already defines this property, so its
presence here is redundant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spi/marvell,armada-3700-spi.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/marvell,armada-3700-spi.yaml b/Documentation/devicetree/bindings/spi/marvell,armada-3700-spi.yaml
index 61caa1d86188..75437c46e65a 100644
--- a/Documentation/devicetree/bindings/spi/marvell,armada-3700-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/marvell,armada-3700-spi.yaml
@@ -28,9 +28,6 @@ properties:
   clocks:
     maxItems: 1
 
-  num-cs:
-    maxItems: 1
-
 required:
   - compatible
   - reg

-- 
2.53.0

