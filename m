Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491A9348860
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 16:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777306072; cv=none; b=SIRU8XjU6bo8fmasIinr/Rc05o0Nk9ti+WZaUljPrIQjeQQ6prrJnO7qvzbh46hwjyVqYYC4eZHxdbOY/MKb5Eg2Re8z3sKJ2ekpVevy2SNT2tIypWzu55yC5j3sSJl2VGL/RyVomZlvtdrO2YJXBTwWH5yyP+IKOya6rs4GtDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777306072; c=relaxed/simple;
	bh=wr/VtuWxhK4DsVf3CEvr+e86IY21z4xEkSMuf1ONNE8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FVmYwPubuQPt2wSfhupOsz9oIOSlwl1KJpttVQkNjvqlxPkFDxKq5BWweSRDW5TnOP2MXjOMabS+4YEFuWZnq3gpQHDWFljbOqzegS0NhkJLEuHuTEydnL/NdZuqDoiojp9nJksRah3bxWkGF3j3URxh+V1A0mbGQk3d76a5YuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UxtVmkvZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jy01PaEv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UxtVmkvZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jy01PaEv"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RB72PD1237201
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 16:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7Hz7IYQtinFPkmW5i5FImoTkQux+hpNARXu
	/idUd4PU=; b=UxtVmkvZAhLPUIMq8EFE1POBmhLy+xEcZ4u9oeDaDt6u5nYRCGX
	XBWuNHAaL+Ptyk9QrrqrKUp9oqr8XuXQZvZns3NxAVz+detqmQHnXJtvVKbUXKe4
	PTRsQT6RhX7hWr1tfpTRKsxZx/7j/RN4dNpDDyi4xQujDUmd8zr+YSuN2rbj/m1K
	wNbBBR4c9Wk7qjF50YNT7xei7w1xSvFmj4p/xTD5AMzI1+MLGyrGE+9gQt0v42YP
	xgHsaje3U69gO8vofjaKkZX0Jwfhf8Gng8KR21pMnnGKH9Jeyq8wVpU88mvCFd4R
	cYzqtBBdikzS3p9FNJFIUfhQWAN3bYNAZSQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt6n4h3gd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 16:07:50 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56ee7e6ce4bso12634170e0c.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 09:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777306069; x=1777910869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Hz7IYQtinFPkmW5i5FImoTkQux+hpNARXu/idUd4PU=;
        b=Jy01PaEvsuSFap97m6sV7+QlRwwOVDRJWqMNCwIzhicNFplzgfUYFUh6cjk7nlLX6f
         +GGxeRAlASi1HC9lmwE/HTIfUusR8mLv+0/Z/8yvHBZDl3+Pms5fYEe2yQ3S427IMMFz
         uLZ3RlLrBmAIHCFUNDp7clTE+g3fcx+rUJOzl1GHoroL3IGTNrSsJvGkUGCbSD2KBODa
         x6nUmBnyvqmF9z6qDNOD5i2pMuJ3WfEbdkwABlU9C3UiHXXYgwn2fMKG71K55D6IpGPS
         HFKcjgbmZSZ2qBXYLk40Tdzr/ZY6SsVB6ilNYhyPIBKHR0VK1X3Qm5Hqle6oAOdmYbEN
         x5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777306069; x=1777910869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Hz7IYQtinFPkmW5i5FImoTkQux+hpNARXu/idUd4PU=;
        b=o07fCRz+Tmwu3Z/GhVq8a+jq4+i4yAgOp3FyivMayeV2mzh3GshlrHZ11xhZN1d8y1
         wZrf35E4PPfTZYcWB641qXrc17gfPC1I+n/DJcaGPq5bbv9lKdRyXrZ2Co9/bxPgoEFe
         pAJdLHVqqlHObaiND4jQsmDo3UQW4IVh3zbe2g4JRIORLmqrom4n1X5y+8ZtogLe8md5
         oR5OB7Es+FsvY66JWbs9CPGglEZaSnxtIsn0baVYOWGB2Uy2FwtkSv0H8OOGDeSyCtBN
         0k81O15nOOwmORXtwrHaJLgpnpflfv3b7xMe8FKGLCdG80GGeyeytM5iGI+/rE74TphX
         1VXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+tXYvUeYDcK1a8oFK9lHlFja/7Agq2k7fRfFyqBeTGV7VVp3vnO/9ObXDlAz7cpl2BZ/cs2NjgjK+8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8c4R5Cd4bopX+3MyzRCCUwgFcKr55QQEhqskfGjHop8EU4NeI
	rnj+QmZ3xRky2/ApNfcKH5cJSxWtdvaL+INjr/BO7FKkbdIpV8J68R2VIIWkj0HCw/IS6ww/yoh
	fnpmtH4Bpbz1zh9SalGA7HQsXMSeX+7ZAMP/vM3nTijEFYQqL/MNCeT2hGzb4uCjV
X-Gm-Gg: AeBDiesl3xRDJMB5pg2KutpiUvJZEI7M7/WFFPcrXjCNon+l64YjxdunNYmRSeBgOuY
	ao/zj+GcMtU8cjp84lwaEteJu8/JtEVWdteIK6GMuuFc38+bHycZwQWyevx1Eipcpt0kICIx5e5
	AA467WYaf8FmZoujZ/8V5cOqX0QOPRevP/tJrWjTEuVLkO4ZY5njM+BUPCvvJNo9DvqQytOhiaw
	iLfFMN+st4vMUZ/Dgqejk9zcNBCbaFN+cjo40R1vqdQKVa6Pa655yNKTMv/cwxoCDeAKlOtUS0p
	04QiORqxFt26yi/4FtXd/hMBaNXryEVoWAAJM3flzmbQFR0HD0J8dwdRG7cAY3wNFEcnnZdQYRt
	GpqE1HRTzhg3qmvszEqGJXfINKkrYNFt9385U6fhNJToMOGQ=
X-Received: by 2002:ac5:cdc8:0:b0:56e:ded3:b400 with SMTP id 71dfb90a1353d-56fa64fe04bmr11370182e0c.2.1777306069450;
        Mon, 27 Apr 2026 09:07:49 -0700 (PDT)
X-Received: by 2002:ac5:cdc8:0:b0:56e:ded3:b400 with SMTP id 71dfb90a1353d-56fa64fe04bmr11370164e0c.2.1777306069003;
        Mon, 27 Apr 2026 09:07:49 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5aa3ae83sm830570995e9.12.2026.04.27.09.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 09:07:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2] docs: dt: writing-bindings: Extend compatible fallbacks guideline
Date: Mon, 27 Apr 2026 18:07:40 +0200
Message-ID: <20260427160739.175451-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2289; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=wr/VtuWxhK4DsVf3CEvr+e86IY21z4xEkSMuf1ONNE8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp74nLpx4Zvg/f6Z0Kwiv+2euvGdYSNPt3dOpQc
 CTpFJ4OkBaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCae+JywAKCRDBN2bmhouD
 16wKEACJdUFMYtMJ9mtr+g+n7WEzJHA5nsts0qyJj5Dv7z70qhs+mxu3oMV86EFVMUKnQsYK2uH
 ZvuV6taO39fhKM9qXvtzMY7GrVe09AfqFlFQAMYUp4JmTXM2Rx8rrCQv6mLRbKHSw0wgX3jRws8
 UtYsN6U/thP8l1Dbb2+cwRyYSTbkcXo8jMT39HGqB+IyQTiTY53xNz6xR5dTe+PYOojV3dl3JZF
 VLDdZdvfHqIRx4eB0Oxs4xyZgfwoidOHAvUIt1qW7lt+aI+DXEC9db/JDwMNiQPNs91pywEgVZX
 7e9iUkTFtoogX1UBlZVhAoT8Zvkt3gHbqI96tRBUQZ1REHGGevYgbk+JjH9PcgOUc9sS1OBwgC0
 48A+g24s6mLamPccWLj/HzoGhJKKh8YTszxMzqRu2A3nbIvIX7Ut/p8Xfk/Rv1D+RexManlIZaO
 bmurp7MkUfYU3hf/TRepoeMHWaOtPIqWB8GHQgvtotqxJ+Ui16gX3ZPsVVMxSM0KPISOWtP36nV
 7QqvaI+lDJoJHqYKEoFLlL2QErCBHkv+o9rW2PTmWwyeBoT+4JAxwaW39paUlyVmKkeokyXVOax
 720XDsLFv+k8h5HEjJuRxNiTHiBibtdAEE1Wca+k+j2+634stv8H8tlgY/oUqJtyCxgQdeffPd5 pXwh+5d/YfU2yWA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ycmYALZF8gKLPodWbhAdMy-H9eOqVU9M
X-Authority-Analysis: v=2.4 cv=Xba5Co55 c=1 sm=1 tr=0 ts=69ef89d6 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=69mf-4LnXNYACU2yKf8A:9 a=hhpmQAJR8DioWGSBphRh:22
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: ycmYALZF8gKLPodWbhAdMy-H9eOqVU9M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE3MiBTYWx0ZWRfX9UCvrU+zqLnw
 lmIb+sD3YODPAHRL/Po4exh9kd7pwKVd8/nAfiGf9+/QFAAQOD/bCss1V9zADbQL/+NgjBRAwGJ
 CPqQh8uiTSXDfQ/2W3k49OcUAZ8FMWoKIDl3WroT7IoDBOoAiwvOPb7Rm0h749pRjCY7MmUZZCh
 mkqGQtnKRlzuqPtSeDXIkSap3e4fnhm7E+iNA82gUt3NZWqHgQZy5rBr0Kv9/QKfdn58LGzPyv+
 6EzKSPRqL7hU8oF1Yg7t2itY40RvRM8B+UGXrv0okRdjgVL4idr4VzytmNli5RqrvEXHPMjwnEC
 iuaujO/5MDjdEGWexv2fO6oWWBQZa2zAkLYLHvs2ZnqybF0dV0p6O24yEqkd8Gb2SAgQwHAgTez
 CpGgm4wJPPXKgkAtwCr0jqU1OBvwYaQlh9+dDEC0UySZ63n9dq/rpSBT+DeydjGDZVNwI9ZAqq+
 ajBKb9VbSZChuZskkPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270172

Extend the guidelines when to use fallback compatibles to cover to
common review responses.  Devices are most likely compatible and should
use fallbacks when having:

1. Compatible programming interface, meaning one is a subset, and Linux
   device drivers can use the subset to correctly match/bind and still
   operate with the subset features.

2. Device variant discovery through some means, like registers.

Devices are incompatible and fallback is not suitable when that
fallback cannot be used by the drivers to match/bind.  In the same time
commit message should clearly explain when the code suggests devices
are compatible, but the binding does not define them as such.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Include Conor's suggestion about commit msg, a bit rephrased.
2. Add tag
3. Drop double-space, because file does not use that format (old habit).
---
 .../devicetree/bindings/writing-bindings.rst         | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/writing-bindings.rst b/Documentation/devicetree/bindings/writing-bindings.rst
index 667816dd7d50..1a51764833a1 100644
--- a/Documentation/devicetree/bindings/writing-bindings.rst
+++ b/Documentation/devicetree/bindings/writing-bindings.rst
@@ -53,7 +53,17 @@ Properties
    - DON'T use wildcards or device-family names in compatible strings.
 
    - DO use fallback compatibles when devices are the same as or a superset of
-     prior implementations.
+     prior implementations. Fallback compatibles are applicable especially
+     when sharing a programming interface or when able to discover the
+     variants.
+
+   - DON'T add fake fallback compatibles when software cannot use such to match
+     and bind to a device, and still operate correctly.
+
+   - DO use the commit message to explain why devices that may appear
+     compatible in a diff (e.g. no differences in property use, same handling
+     by the software) but are not made compatible in the binding, are not
+     compatible.
 
    - DO add new compatibles in case there are new features or bugs.
 
-- 
2.51.0

