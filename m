Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A09042AFA5
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 07:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827838; cv=none; b=Avmi8VbdwrKJY3+rJ7pjQJM1pOXM4zGyOFchth2HRFq/h1+OVv40ocQE9l3cOEnTtBxLwrgfQ+sTzib9GstqUtIOdo5SdZJpIcDQ5bB6G5hjFHeLyWQIw6H5yDRlBgnBbbHP0B03/EH/icBspc2aqXiYpGNiqDWJtJdei9oqQ6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827838; c=relaxed/simple;
	bh=WInEgTRazKi1bnlKIV6gud1U41TmUr3uidmStQ8pne4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h6ia8MiTHEFzoHsldVPgmAtKYIHLC/bynpzs6uBmMGA9CQssxCCSCecszZcAgYXmFbvR8UKe+S+T7GePq7AkGfBlwZGndVzaWXxqXiovL/MYhpr/AZvFweyxxDPCDWWbx+2pbhpcG/+xQbgYZJgXEox9wXytHA6i3TZJ4ybECHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CXiPuX2s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SP0/KbbX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CXiPuX2s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SP0/KbbX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67417ppL1670518
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 07:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JeGckGAtU2mBLl8s4aGiYH7rSeNEpn0PkB09bYxAUWA=; b=CXiPuX2s/89AYhpy
	2QSuJq5nmOgj/EecpJq4bb7CzZ5YNO29lTKakdlQryXtbYs6WxOiMtB16ghW0i9Q
	PXDokzH9VN16EWq+efj3M8WK9Gb5cbzS8jwhGVak9ve4O0/p7RcPu5/buWrG3DaY
	8uDb2oddpp5st9lt+fPjXyrLvK6yd7G/AqNd++TlPGA09JsF/B7UOetA+tkjITIA
	vG3gOPAvzDCBiMbWcNjENkWQHn+VGw5U530obFJB95WGuY8/ANOgQHpdPOqnBkb1
	wo2CS7cgfP9iY7Wricm1hczUxKEC1ni6HBOzSpXVLmMGW6jAUzptsdDTmeZZFoG4
	U4Px0w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftx7m3cyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 07:17:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1e6f602cso66064711cf.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 00:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785827834; x=1786432634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JeGckGAtU2mBLl8s4aGiYH7rSeNEpn0PkB09bYxAUWA=;
        b=SP0/KbbXOsE4ybQCXloInLOPb/E414TdHjSOyYjVp/RNvU/2XJHnwOs6+xeGATRTmk
         CR73u+aOhVYKAYkKRFBCFMvOLqOYEKxOwiSX/TpIzMFUxQ3pcGJF7aIVlzHIR8xMv1Rw
         HLRiCP1YqwagB2GA2R4YuJ87Us4v1PLUq59FvNb77GKFaJy8AhUqmPENsQTwuQhvNTVi
         25URqQ3YZVEQnCJTypRedyTPrwYXHlMlx6Qrn82QwUEAjC/BT2OIFJBPsSHqcq83mThd
         oy99w0N89gcuEPZvMATgBxl6Bj+g+gle7qqumzVNJlZqutz5qlQZYmspvMiM0qAe+ix4
         AAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785827834; x=1786432634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JeGckGAtU2mBLl8s4aGiYH7rSeNEpn0PkB09bYxAUWA=;
        b=IyCTb/FlekQe1lQnnRoLAc4sC5n31peMHfvCl8EhVBpREdU3+pqjA33GSE8grb8bfZ
         /OE0r3A5PmlejXQwVFdOVlDHQRkIbqmp74L64dQs9ScF5ceBje26vMXtdwn5+Ahh30Bz
         fZSUmawqk2bhIZqvTEd8koDNAJGJ4/qEiKknqjI4yngMQzdi9wIMsW3iJ9YFE8ORVu6n
         EvkL3ngswQH0cqehsoxk0HIie9orCWBkpNWkwxMo8FXxHgsOtEg2dLpi85cnRWoypNbe
         v+b3P9nqHKxF+sp3qODSJ8ke1/zBvEOL0SLTmaN8Hvs2XU/UaW7TleXO9Qa8B+WilggW
         otGQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMalnvbTw+iNqx0FMVtSqH5cRh2s+xarclhnciwZPoIgvxZlvXQT3KeD/VNtuXtzzOd+svPhcDkS/A@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz84bt7jKkhAy6AWasnmnGMAM1MhSsbZCGGB/sq9y3OaALPVPg
	J615UfDvPnB6CrRq8ByoS9W/vLN66Ob06MFYckjtSStIh1bDDS6ySpBNYilHT5U92dJwxghx1hD
	Bwesu2XlgCGPbP/3ta8H4+h2f/fiMbQsbcEIvI+L3TKK5ll471e79otdJXgD8NSP4P8X3W79d
X-Gm-Gg: AR+sD12EjFSyJyJ/IlAMWoN3qY9rtjbcR7xuSBt3xnIZQ7ZQmU4NZzMs4ZraMrqxrqL
	zoRKOyH3pqzQnGAOq/LlTABnrsLG3XFBI6YID10ITvJsTTFqnG1KimPODgaAeL13cHW5esrlhU/
	EXeGZGxwLXf1rk1dI7rDJFOEPwiuqxcT8LAEjyM+JiAIfs2EdHYbo83IMweNObowK7izXFNYWaC
	bRIcK7G+iEmmNKYZS4z/d7+/pr3TK8WDhjP0P9svo68ijPCKxm1yc5Mz7cPF1NDa7mK3JPOiou7
	dvWLF1mThclDlfBq2XEEJeI6X4LHU2IaoNYbB4GLZ3qXsfqXm6AIwuMX2PZR7w0W20bxCtKwfE9
	oHPdt71uumMZkSOxcD9y8+4Ru
X-Received: by 2002:a05:622a:5595:b0:51b:fd82:22dd with SMTP id d75a77b69052e-52b566af237mr277720011cf.15.1785827834402;
        Tue, 04 Aug 2026 00:17:14 -0700 (PDT)
X-Received: by 2002:a05:622a:5595:b0:51b:fd82:22dd with SMTP id d75a77b69052e-52b566af237mr277719731cf.15.1785827833975;
        Tue, 04 Aug 2026 00:17:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm420265975e9.3.2026.08.04.00.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:17:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 09:16:59 +0200
Subject: [PATCH 3/5] spi: dt-bindings: axiado,ax3000-spi: Drop duplicated
 type/ref
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-spi-num-cs-v1-3-4ccb13dcc7b0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=822;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=WInEgTRazKi1bnlKIV6gud1U41TmUr3uidmStQ8pne4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqcZHt4dXqcY7dKQHz9rLoIIymozNceaLW8siy4
 E3lkXhNbwOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanGR7QAKCRDBN2bmhouD
 1zYpD/9OR2DVZGOVqQbA0kbXFA13Ja511qlxI0xkmyZKhih3Sdzcab9fYmwvHcKeTck5PYZiu4E
 UyEaeWzO0sKRhrq42QK+q+a/LluO8UAHaPKAPXiXF4Bsnd2pyKqGvvBnNCle0UdFONEyp7pAkfs
 lRvBsG7ZRpki7brUZxt6SRCdY5Y60CQujodnsVhemcBLvHn1VgpkyoJnXhZYc399ANWWGet7ZRO
 p/wt1A5Ph6utv7FDcCrL4QMtBOvEtZUUOJpc8aCQT53l6HTiRK1uS1tgYr5/GvbbPkjF5aVK/+5
 7XeGGu0DjHNuAI0Wfkuzusw48uLaKZ/eteo/9FLZ8eqmG6b2Luc7y/COUPGW3MtdoWEAIPVzz2o
 3Kars9T1bUt4X7MFcPsC+/JcgSgE/KhQcB22gzfpiGuyNFPQ3Kdao38LeHjZmGLNOOZwn30Ll9K
 VjauAHQb7SeC83Hi7Z1ZwqIH+/xIALFCd2tivfsYNtMBeRiyMjqxuMmYNyIt3A+d6DE7eQ1RNqz
 Q9ZmBuN0u7ndFc+oX4UV9Hjq3mFJ0E8JV2K5lHiGq1RJyEVVccvNxXNAVbdrt5WwghliuV7rEZy
 uSAW6dWo/Pel0Xt5okibP4D0aZ8iDA99CcvMsCskDdufmO6J0TOTVcWNLsxggwB4ZsXaNL8TRs4
 DPbUNrRMxd3BviQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA1NiBTYWx0ZWRfXyhup2+4oeXnr
 ce/oMzX9bCsFJs/qx9K5APPXYlzI3bxY3Ddp8lD30HloPM2M7YXxDh8muOU3ofIBNdO1uCuUK7E
 Rw7omoxQr0M+RCzXDL6+lIo92Uj9ftlLoobnmZD8/rqVq/U6e7NbHiChVpPxxPgZElPjbhGbJFy
 P/Sarn7H9sSlrbI1bkmSffiz+b0ehQYvHOcDj6SKO8StXItMdBes0OTw6Cu/IKGz3lECUeWaRbC
 sMn5X3AYBnzW9iM/adLb65aWcHWAcBxFKs1BYHAAGtVWYniK3VqSmdiiAbG1nu1Qi3WvMqEMg2/
 7CXW5p4N3GrlbOmyG+A4504mLzBwpx3FrJb+FYTdIUklpAsck0BiqrKsTZHnBD6wY4J4AyTxKGQ
 KDZ9xxRPIfLIpdKcsTJNMopkWb21hPZA47AImDv9I/yDGwP1q7Yl+uK0Z5WLpcspvh6TEkfWdyk
 /dRploDKWNZlW5344Mw==
X-Authority-Analysis: v=2.4 cv=TIt1jVla c=1 sm=1 tr=0 ts=6a7191fb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=tRHPAiqlqGnVGwjNgokA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: rRPZCIpRiWJsqahrTZ_ufJZAlRuxHuDo
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA1NiBTYWx0ZWRfX8ipTqRoYNfDp
 4hq9LUUqaSKEa+63A1e7FDq8ZYWE+HpL975ufPgtUaxw8neKhSMSjLuBDCsI9/sln97qGXzn9+P
 Q5t5yOlOIHZwKaG5zGQKa2QG647Kmd0=
X-Proofpoint-GUID: rRPZCIpRiWJsqahrTZ_ufJZAlRuxHuDo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040056

spi-controller.yaml schema already defines this $ref for this property,
so binding does not have to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml b/Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml
index cd2aac66fca2..be258c1f36b1 100644
--- a/Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml
@@ -37,7 +37,6 @@ properties:
   num-cs:
     description: |
       Number of chip selects used.
-    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 1
     maximum: 4
     default: 4

-- 
2.53.0

