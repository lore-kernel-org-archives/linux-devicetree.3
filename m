Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4FE3ACF1F
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788146497; cv=none; b=WmtX8cnYw4BHR7e6Zel8gPO06TsWGrtM/cXCWhsqdx2bkxasuWHMiLI4K3ZG0C1Hxcag7jQFwcr1qbvnxvXTVv5yyCiM2tgqBd0fEiWM1Ns5oOCXmqEajKwtxfDxj9605FfzJCLdWciyh9kUzcDqtoN+Tmpvma/a6rvcDoLAumo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788146497; c=relaxed/simple;
	bh=+8FGxgaHMamhBs90vxaKPN7YkBzTW6Q4tm36P+LSuWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sf1RhHgTmqnmTYuVjUKoYNxhfw0EZfhnW4Pw4JQI3seQbGQHTH4YhMLZy/qsuiXcHBmIbqTDBTjYwlhOM6f7Zt6/9VwspO2ilMcMmdGTPmyP26X087L5of2iqAu6zHkRsE0nOzyPCe8GUrzozscCAgU+KN2jV1DwMYPsZZMIjs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ILnf4b9Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LtgAeD6v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ILnf4b9Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LtgAeD6v"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1bhl02083220
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JAjjQ2CFRE8
	wAZAkPN2FEBSl92C1DE0+0SYWmYdAPjQ=; b=ILnf4b9YEp8NWNBuf71/NXcIC74
	8YunCH2R8FC4qJooYCeeiO5lTDy1ekb423hOwGHc4aHzUrvAFAEoHy56MR/8wcgq
	LSc6ESNiL8L9wQfswXLwKfGaJkaPKgDT7Rwgc6by8HW7nrbYGuDJkiXs5oyQDtYY
	ih5S7YuGhHKLDMXHjcyswFeKY8+jw2tAh+qFHlwISosDun40+rD1uCnfMWaoF73l
	o6hcVWr5JOHB9VM68vJCHgNN7AQbBMIg9h0VAFVlNcZoMmZ+eZhKeYHip3/y8Tsx
	JLvVsqBGY7hDym+8eSjP9dSyKVoreiQCXpZRGXAaRi8kjQfHWK/Z4dHUDug==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv7w8n4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:21:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccb6823efcso31362515ad.0
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 20:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788146494; x=1788751294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JAjjQ2CFRE8wAZAkPN2FEBSl92C1DE0+0SYWmYdAPjQ=;
        b=LtgAeD6v12NZEP168RpDKrx8V3QYQUnt4nt/rGckYvY64yxfRBIMgJ2R1lrF30Tz6l
         q3gm+X7oSQ1bn4YIiRvEbaVlNouaZD+xIg7lJwhiTYsWVoz0ydQlxKcuqt5i6yDwIQ02
         HLyl/k8qHGI1ezlE7RZzsJQlM/wqZwpyyEjF2kobIq7OXOQzCHIvbYoveg1r7Q9GX40Z
         cjrjHWiFy4c+ulWPwn9nPzhZQBhWQG1L1vfBh+PqKt1CbtoA7vFnTL+E6p+0Sefi/j4r
         xMi+TpDxBdkAPYsjOgzX9DlsakTlHk8ELCZfOCDjxyt3H3TI7PHbxs4ZTw66CJ5DK4ib
         2uHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788146494; x=1788751294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JAjjQ2CFRE8wAZAkPN2FEBSl92C1DE0+0SYWmYdAPjQ=;
        b=JRkmPqQLiL52PJCbHiffQuSsegdDBC9o10/l2YmyVXQq1oU4wrdYA4yS5/1Zmh7Ron
         62JNLX+V2TR+xwCJddoTzCwdLFN3krnq174AwcehmGJi+AwMwseMO661t4G0Afru2TdT
         /8/WUtXKjUQYqtv0J8qa1AP03TjLrWWF0U5DtfHXSJOTUdVXavH599FjE02pugCO9doh
         +peBhia5kb0nqYOZ6xcZ90lL62ikc40Cs9043MQruOqnWgEsQmb9mN1QezmvcFXsz7H/
         PoG5aHdoGmubb7y3qO0ArW4z+jSrSV16AZwxOveNk/gVmqBCO6kUh6y+uG4vlsyyPok1
         V0Ew==
X-Forwarded-Encrypted: i=1; AKwUvBybjmDmtXmYpmmPJzkfIezYWkdXx6ISmqQtLHoD1LCNKsCjCl82ibXYFnl4JinFsXnZTzux00tCG5cx@vger.kernel.org
X-Gm-Message-State: AFuF++nw9y3g47XsX90DmM7U+cTh5RHru+GqCQEU5U54EjQWSFu4Bq0s
	OY7+Zr9FgutNbzi9qMBvhyIEo9wYDhyC4lAaDUKesKI6HdD1eu3yhPu/6beUa0j8+npuAsyPgsi
	tpzQZA7ESXNqPROzZxTIP77SFPgYizxigsI/rXM3ullwA1vKJdVvA/S+33PMKW8pH
X-Gm-Gg: AYBFou3uV5Sc1Y9J5jrcH/wIGWbeFHDHpkoh/TmNgUEQ1qoq6aRSrrKMduu6TXyERIm
	BLFasGpcodTibSyw/CScQai/HKRHfYaEm8ESyS5SNAwQ9K18pdk7z0z21l4TIPkUcnNqyKGi9ZO
	qQR2ByelD+Otu/FikMZ36VJupcs6jCYHEamDNK9ZmSnsnvXevadgjVTu9i4EzEuTbDYztWGIu23
	m9BFhavS1T+tLWgWQb95GZHx0YCPCGODjqc5adXTRrV8157r4oCNtPCiWzPHnbvFdiytqr1krKM
	NVmeu8+/i6zeNEmCgvUNH/lVUcbEIg8+cQpUPFVUavc/bhj41NT+OqrxqvO3Z95/F/rG9ne6MSl
	q2S+z8je4XioW//TzOgk+gqj9TDOXECrQQ8KLx+zHiniuw/UX+boPQ7w3TDaf
X-Received: by 2002:a17:90b:50c6:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-396d1017316mr38123037a91.13.1788146494153;
        Sun, 30 Aug 2026 20:21:34 -0700 (PDT)
X-Received: by 2002:a17:90b:50c6:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-396d1017316mr38122959a91.13.1788146493541;
        Sun, 30 Aug 2026 20:21:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a160sm25599208eec.18.2026.08.30.20.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 20:21:33 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 5/6] dt-bindings: arm: qcom: Document Nord Ride Embedded board
Date: Mon, 31 Aug 2026 11:21:02 +0800
Message-ID: <20260831032103.341633-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E9f9Y6dl c=1 sm=1 tr=0 ts=6a94f33f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=KHWqK9l8iW_yKk06KS0A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAyNiBTYWx0ZWRfX58WCN+shttqE
 /wT9zdOoaaE+A+ysX+f1V1tC1KoRVPb75bWGxCrjKLaBoQy5BM/cNPFEVg7U1f7cG8HExIP6dq1
 xxqbrrUHvs4jZq9TjYZWyIx9rW43Pyc=
X-Proofpoint-ORIG-GUID: WSfwM4VU0Miz5JAunxtOTBxXN2C4F2yh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAyNiBTYWx0ZWRfX+IjyuLwsa21T
 GJ+DYLA0sjFac4lSr3jOk6cmNDw8leTTEaNQPSHjPGF7/NHZa39fgeJloFn3oErSe2QsjrXZ2Z5
 t0jKVEP3KfZ/ztZAK4Uut2Sg00LME7Ei6f2U3PwSNIu5iL9DAFlq6jjxQzhoMUUoubwdCQSKuyx
 m51Djc1gVCuply91txAg0N8x+Zbb+uv70rR9ufyeD1YKADFyUv+cVs6ZqZJcKx2vdMNCrE2qPFB
 nIDZ4qY2DAxQcE8wljDcZyUGrAxcy/8UKrNl3YV8ePez/w/InVPsMMFU9j9aaouqojKzoLmM3L+
 t8vjy5REleZPvJnzCfCQQfU2U9mukj3+bHo7De8VFz3BRJJKCi2pAe/PFRDtG4L1IVQTGeOXcPt
 Wk8hOyb9xEZQQLfFqbuAFv1jvNLghblvcz5plRiHCjR36RmTmhPIRmgeenZUMsnvhQlL62Z1Esc
 9OmvwmfIzc2hgCHZDdQ==
X-Proofpoint-GUID: WSfwM4VU0Miz5JAunxtOTBxXN2C4F2yh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310026

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add qcom,sa8797p-ride-embedded to the list of compatibles for boards
based on the Nord SoC. This is the Embedded variant of the automotive
SA8797P Ride board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 198314ddaa84..d2f17bc36f8a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -406,6 +406,7 @@ properties:
           - enum:
               - qcom,iq10-rrd
               - qcom,sa8797p-ride
+              - qcom,sa8797p-ride-embedded
           - const: qcom,nord
 
       - description: Qualcomm Technologies, Inc. Robotics RB1
-- 
2.43.0

