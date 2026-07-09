Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E2B296BCC
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603291; cv=none; b=nhp4p0KP4zexe/qXHc/kiz+406NhllH58Gg9NebzMOZ2uzs/xBl/5DrsbMJnGBls0uUpLk55kDJZfbO1NIYy9s8yj4R95zchn/p+NRTHH4+5AKlYkyl7mcrrz626pCFsgmgh2XyK7+aNdr4D4Gepjp4c5j30sYS9WuYWf+nqfaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603291; c=relaxed/simple;
	bh=iw4jjypV807T2+O0iXHkb4zhYfmqDqtmQaJO5VIoqXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=drgJ1Hq12avnbpaFu7W/mpyixKJ2hI2bKJsJtsPoATJlNEznlDu9CzjQDbumDWDxitaaR9Wi2YnuBv5Qyenx6WcMjq3lVecoA9CJ2sbII9Q+OlBesL9HDfrcH1xWUk5hX7Wgldo98hJXCj6KC/JVzBJdHTwXNAuIU5p+u0JM31E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c4Em7PYk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rgn90CP+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c4Em7PYk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rgn90CP+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNC6h1575382
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 13:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SkRKCItPG6p
	H7Nu6ompVZXjE+N3XFi/uKmpyY3y+45s=; b=c4Em7PYkhQpAuMaHL831E4QLX2v
	B3KxB9AIzYug9T7ih9gERGfKNaG7a1kJlipNDM9W9qovDwiwHOBM6JsiT+wHiI2L
	LVgoxFS53k89e2V9oFBK7vfE70vZP8jT+PQU9bO0xcD3sUaN7Kg1bzVIlB9ZNQW8
	54cvuwRmx+0DfinztKkIxSMLHHCP+EZX5DRGaxvH5a0D0DW1K9yGM8JCGGDll3Fa
	+O/z7PmeQ4+Vu6GG4dB88+gzoqZT8+Sin0/BaYeyrvZcTH45/b68Uis3TRSAG5OX
	ChPIOQHltlWW79RdTR6pcJZnjOwGkx3Uu5Z+Cnrd4IPFCpbcPWPz6KyORmQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwccwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 13:21:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e663c29f2so128222185a.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783603288; x=1784208088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SkRKCItPG6pH7Nu6ompVZXjE+N3XFi/uKmpyY3y+45s=;
        b=Rgn90CP+fNr9HHRzIi+kkglSseV9TtrWFuKCtfAZRkzEhfMUbA0Xw40AUpLrKAateF
         rxyBg5sS+7PFZIPJspULvAR1ky5VUTT2B0TVnilQK1Aus9vBklJSUFJS7Nenbg2cZA2b
         AvQkYONPh5jpGTtaTGVdQQYKHfi+1MzcDy4qsW98QFQVAs24fLYMyDiaZaAsjkJYji7o
         WyKFJxpoRNBSPFEc5N56YyvvXGcdCjHCGGzD0H9ku40ZkFCVXrZ3EVBkWkZZswuxmmRE
         LTdU1aZYs1E+QzV0LAXZDv/GKnaP9HJZCrxUbsg76YkKizXa7TYrf1FFIU9siTfkQdCB
         U4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783603288; x=1784208088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SkRKCItPG6pH7Nu6ompVZXjE+N3XFi/uKmpyY3y+45s=;
        b=THblotSIqzS4ZtituMtb11/Awx3CzWJB8eSMsHCix5sBrLAICDJFKA19VqFm899hz2
         94dOZM0GbSeemcPGMapNLup8I/bP5qTtb5OEELWAzSgj92+ThSNA2eRlbPsYY8jpY7rL
         hkjzN09T9S/XbUJ8Vnh3RC7eW3h/USIrug+qkUYzSvR698VWaW4ZrURh12wJlwO4kEvM
         zaLI/CkOXqE/BZKC4T29L/H6Axt9ZAjzfKxHWN9n7Se5EDPHa1ImOP+XqsIi9x9K5BgQ
         FRWo2sImTRlQtmQZCqnXlhCP2hSoyOYkPM+loBP3ReoB27nLZU6Vy9KsXJ618/gdZWjW
         XuaQ==
X-Forwarded-Encrypted: i=1; AHgh+RpwqJN/ttwDKr05gi7sPFs1ed3yeU1BE+mZOp5dWq3NDmP1FWB3W+N8g22K6/E6VsFRuo4f2slLw6KC@vger.kernel.org
X-Gm-Message-State: AOJu0YzGJUhka040qB5vUbDsdMv+pAZYlXg/NQM97lPQQoGGvk0KFqyM
	DgBUTKFE5/wdxj0t9cWtiiZsQtcRkAN6zbaxEhCTZyEQqbp346Fs8zau6k6rzAAujP1NwHp5wXe
	HcUJ6HJfmAfZAmOvhJFC0MVjcXwoI1hIStexCJCNvJHUb4IVaRHwSXiWc1BPK4uZK
X-Gm-Gg: AfdE7clPN22k4pejXRHaFUL64Dxaq97VooGRkKOSLnXz/p3CnlsVwrUocysaSO72MEX
	rdPEtB85GEbOAT0RtwX5RQdOW92PTXAz0DHCCEgGfU4X/f+geVpt6/13/7vbQqK9cHI5CBrAa20
	hdIwOKRI7D2koHAgdZX9kMBX2aVPX4v6VK2mF6hO6IfThyCXS6HUhbxeWTL6dvt86BA2VT0aC3O
	VqWXlRbJOL6t56Ho0M2l2vIzGtk+Zp/m5gx0u0EY5gDQFpTJveXJBwNzJncV8OOAMl0mVkrbYBh
	qvWhpdyCuEd7cDoIpQE9M0xbFGn/fvMGeY6pZKxWadM5EDx3w6dvm5KF8n77/Il6ZrDk8BEBxiC
	uoh+fREzcP93RTYHBwkhVWCtHYsZO/2mMmI2wfzarTnTTgUroFH4VDm7cqkb6ztcOm6p/MeE=
X-Received: by 2002:a05:620a:4043:b0:925:dce9:4773 with SMTP id af79cd13be357-92edac553e4mr322541485a.35.1783603288123;
        Thu, 09 Jul 2026 06:21:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4043:b0:925:dce9:4773 with SMTP id af79cd13be357-92edac553e4mr322536685a.35.1783603287682;
        Thu, 09 Jul 2026 06:21:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90ce5126sm1654976385a.41.2026.07.09.06.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:21:27 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 6/7] dt-bindings: arm: qcom: Document Nord IQ10 RRD board
Date: Thu,  9 Jul 2026 21:20:12 +0800
Message-ID: <20260709132013.4096850-7-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
References: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzMCBTYWx0ZWRfXwMN5wRkFf4bv
 7sVNW6EEoPbMrkh1wn1aA7W2FzuMBPaqmjn3H5OSjc52AjnYeKdERaxC6lpt6+ON5fPQUwdTDRh
 K1w2m1O+KJgj3TVBWSDTtJdP2zApr6lNKo6yQPqUBSxqzvLdaNzh0qrcB82/szImH/9loAEmOsw
 4v8FO8xIGCTCC7TI4OQBtC6LM7OxKhU1bL+QCh9VsWUVCM+wjiiA03/S76hN7zEOJZmW1OtLUYI
 G0AXc+eKk7ROORVi19UBLRpZJ+A7EAm6KgXi/kc0XHhwWRIdGA4nD/jhsjsWgW/XprH9AASZNDf
 gMymtEvgFc7ZC7PBUlmN5s9ElEx5xwXrCKNNSq1lTiZ67CC7194pTnte9M+fKrDWTbpDAUFXP5D
 pH4b7CCY4DbENWra+aGxalsXugTmQYuJWZjW8lsHCKRATyaIbipRePVMFWOoANrQeTllS6lPa5p
 I04cCfhmLm8Y20Y7p1A==
X-Proofpoint-GUID: U2aQSVMjvZH8VUCMuzEtI1TWBEu6N9U8
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4fa058 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=iL1qmE2IHoXjD_DZLx0A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: U2aQSVMjvZH8VUCMuzEtI1TWBEu6N9U8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzMCBTYWx0ZWRfX9W/tkECP3hqn
 mRl8EoA59nwmArRIF9OZb/WO5MLeSrfLM1mC9gKIDIDQrSYi83xk2/WhDbe7Xp9NVyQSTUHScnA
 2B7n6JyRXlgoknYMFXv6qxuQkwQyC4M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090130

Qualcomm Dragonwing IQ10 Robotics Reference Design (RRD) board is built
on Nord Embedded variant. Document the board.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index a7e8dc994b35..3dada073a992 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -391,6 +391,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,iq10-rrd
               - qcom,sa8797p-ride
           - const: qcom,nord
 
-- 
2.43.0

