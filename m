Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23E42472AE
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691390; cv=none; b=fZptgws1uxjMgrgn1P2NqUeYPYIPcNEIYA/zF7sMwg1JbCGYOUkHznI43DLuDUtU0PrNrUqNynTHrQANnd++UMJZMrrFE7FBs5hVPgMgZdfWnuuknzS2gO+UluGaZvTeLD8btoO0DTXrQgtH2+HN6PH5QBbO8NctYgEmDRGkj24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691390; c=relaxed/simple;
	bh=d09lYffK7NKQtWks133wtN3qnkJ/qWtJQRxHm1karAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O+h05nMaee6N9wORchukGsOGRyfui19YXFZJDDqWwucS2IvxVfn1WzVCjpxIA3tbdByssrBnHV8/cjxUESCuqRLNRXrUjdtpfEbVPpD5unJRUSx8DjjTJWauKP/uArYQ/8jk1e2u5Gl8ZF/JtbDSBaEesMpc3ZFjnth7RcC99WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oD2z+ZjE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fPGMD3az; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oD2z+ZjE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fPGMD3az"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6cbc823427
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GQ2mUQRBJOhBt3jiMHO33GZLC4ik6IchEt7Uxsn85FA=; b=oD2z+ZjE+c/m/MoI
	MjqxMNUP0+Eoif9yAsCdqYqFUVOkyJXw0zrDKJyWDdaTBK/h+exCq4zptZo1KMdR
	D9ux4oY/YJwLn4hUTCpWsFeM7bUjVGpa4oyLT/2+MLrYukTrUtyjL7ftzoSqlw0m
	rRUcNMkSxiHCGIrR51guUxVPN0TgaoFN9jLTOQpi+SitNmvMXRfFFd5E09Q1GIAz
	WsWJWVzoaiGirPs03VLdxHRX0BISn9hpN2dA+HNLAcJr9mBJI2LJbdCY+RjigEd9
	K0Si5D8x8oTajWCASY9zT4qC0CSo3xm4dDHRexMAHO4x22yT16TK110qGqgCj19i
	RDY39g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fadvjcxkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:49:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a87ef9713so21829891cf.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691387; x=1784296187; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GQ2mUQRBJOhBt3jiMHO33GZLC4ik6IchEt7Uxsn85FA=;
        b=fPGMD3azt9D0FK7eIh6f82O5k4p9JFa3qwZjU0wvIRnxmMksoHRd1vzOFFvz+APip6
         6gkvFHRDEybfpvjaSFmZSksUBE4ldLVzx864rjlri3DASXLvpBbJumNSf2TLULzBn+Ss
         Zk+FzPS7YCnrMAAbIS3wNP7vK14WosGArB7VnCH9QEARCcWWyKH05vYV36ULRsufbUBw
         AKsUmNCvt0JhpW3PZ4IDrZYxTH2d9EH08Pp8ZaslX8Wwzq2ZFdTlfyt2f7Q03ddaELTU
         HyWaLZnED5K0VQh1caLvzrBh/tGToTw4AKDUxCRRvnGYdU5GHJQxxt+b1ZpYMKRD/kTx
         ddOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691387; x=1784296187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQ2mUQRBJOhBt3jiMHO33GZLC4ik6IchEt7Uxsn85FA=;
        b=kEpHNQ4hCKL+GlHm3aHvoXebwavYB4otm0CJHDyMKTEAYULprLRqF134bWDeLjDcUq
         uSH1sO0tSZ5p/SjIJEjvKOiTGJPBai/0kK4rg4MLax58vRAY+9h918nkjlUrHYSDySId
         8+pBmVsGAEdExpXDmUNLZVSsbKrDcQBwuKvcmLdMe3giOpOOdnRL9QYFyFd5CPNxObux
         HTAXjlJvGJV5J6NouhiGgmN/mUWLO/N0P8DM0/+Zg/v5VsdtqLvML7Do38H7bg/G+Fve
         W7MBw5hJ7x17WNAjJ79oTrS3HT579pIk7cGkcy0StejRWJmAu4xV7PQ6XYMsykF1UL6F
         VpQA==
X-Forwarded-Encrypted: i=1; AHgh+RrG8Lu7bfxsunT0Jdj6Mp7doV9uSLbBFjhtR22GQmHmprlaF2iY2Qgai+yp1GIBngA/a3rEdRhyxn84@vger.kernel.org
X-Gm-Message-State: AOJu0YyQWC2YQbVMtTOF8yyf62EyrGF721SdHVhhnMMS+oK1X5lM/rcb
	Z2K3uHN41qGqbApAqJHS5kC0OZg0G5ZrUCqrZRXZLRbS+AIsAU7R+w+4t92ZGVvEFO/bba1j5wV
	1kpSsuu3+u9K/0mo8/elM8qw/0lCHXLxdXTHMDYDLCgkwUpjO9wGCC+BgyEVkKJcq
X-Gm-Gg: AfdE7cma7A5ds4pcFzgbw8HBEraPriPEeyMcnsRc1a3bvGcPBiI1qW3RrAkdeazNkRs
	sNrHE4gQqrhmA8X6BGmPTgzJCWfzJ3BLSDP7WoG465ifHrmrQDR2ssTJE1BhcpZAnPfeUK464JC
	zJ1NboHpXxI01gntf201pZoxXA6I9GgOmKf3LRrDrfb/D/BkLOcB5g55muQUqw6rgQFwIInmOHh
	mrt1hDNQJJATtDb53wOgLO83X57cyZ4yEbBl+zXcYZX4RcWb9NVcfQfH/XrHddMtcoc3bw81xa2
	GxtPioZPSqPAvK8rUWWBj5wZYnpwWIskodKUHhLtlJWlK/9mBlwGHjeizcadOgr5M/bQA+e3mMz
	yPTKJMT7VyXc/rbQze0hG1GhYyyGj2YVzMoNgoZeREV7FPrNZw7JStRG14U/MeLrsZCMkRX5lP8
	2xBw5OTDJFb0JaINA2Fq2BKHvstdj9K0HIsNrbmjyqGcEHh9Iz+mEDQf9khuNgJuUfHau+AvuJw
	/m3mJpGrI5f9O4abIQc
X-Received: by 2002:ac8:7f92:0:b0:51b:feb2:3827 with SMTP id d75a77b69052e-51caa1702a5mr36452651cf.32.1783691387137;
        Fri, 10 Jul 2026 06:49:47 -0700 (PDT)
X-Received: by 2002:ac8:7f92:0:b0:51b:feb2:3827 with SMTP id d75a77b69052e-51caa1702a5mr36452251cf.32.1783691386647;
        Fri, 10 Jul 2026 06:49:46 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bb94c782sm538164866b.40.2026.07.10.06.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 06:49:45 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:49:41 +0200
Subject: [PATCH v5 1/4] dt-bindings: leds: nxp,pca963x: fix reg maximum for
 pca9635
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-monza-leds-v5-1-a8972d28c28f@oss.qualcomm.com>
References: <20260710-monza-leds-v5-0-a8972d28c28f@oss.qualcomm.com>
In-Reply-To: <20260710-monza-leds-v5-0-a8972d28c28f@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX1E8xHtTrsYMc
 QpZqCHxcfbFtz9o0/GV2Sjeb1ymOSa7lG0PNe0xvZAmblta7PhIum6ZclUd1t+BOO7nDnGHUfdF
 7hIBFmiHXBbj7DPERkbWzncDXhiwWJBlB0Z6WXLi1BfvGHLV+h81yR5llgBPwTyzBhKFhTVq2gH
 uW6KtUTjFApo/6TXoKKAdmA9uqSHqFQa+1JQ4Qc3nlvjUSSC2hLkOLsQ6OQTrSH/dw/FpJWd03X
 Oj+smnWLhaq2VLXOzzuXkzW2LRqvQyICgkDy3Dh0uiJT8jTVr1qbnc/HRQ/G4TA1PPIH5OQg+ml
 oLnfXcIINLsqV3bjoGOW720WxSpv+wmac77fnPRZ0rYaUMt62H60nWeAb1jZIpCvADUugJIs9J/
 rf0eaPIwXcvayVpDNsY+xH8FsisNjPMHBD7hRHYoFZ3KgWruFfqjWqwDcxnTrq6mRgOZtD7dKPe
 I4VP8MREYwCq4JfPQsQ==
X-Authority-Analysis: v=2.4 cv=WpIb99fv c=1 sm=1 tr=0 ts=6a50f87b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=XYAwZIGsAAAA:8 a=EUspDBNiAAAA:8 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: E6SOAW6wSrcRTaxEqHa_cuY3gDHf7mTH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX2nwiNhv83XWi
 WvQhVTW6j/ELPyJkfU33G1VmA8yYeVfjfx1jLH1ETIhIZZgzUZTCQe2Jd2QElKuoB8DCTV3xvjo
 L2MOPpdUj1YFlFM/jNkTKNTgrao34/U=
X-Proofpoint-ORIG-GUID: E6SOAW6wSrcRTaxEqHa_cuY3gDHf7mTH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100137

The pca9635 supports 16 LED channels, unlike the pca9634 which only
supports 8. The allOf conditional grouped both chips under a single
else branch capping reg at a maximum of 7.

Give pca9634 its own if/then block and set maximum: 15 unconditionally
in the top-level led@ node, making it the default for pca9635 and any
future compatible. Also tighten the node name regex from [0-9a-f]+ to
[0-9a-f] to match the single-digit hardware limit.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/leds/nxp,pca963x.yaml | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
index 938d0e48fe51bce82779c4457c8e99cb6d80fe70..4fda602912f7a9443b8a77e46bc015e244f82e08 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
@@ -62,14 +62,14 @@ properties:
       open-drain, newer chips to totem pole).
 
 patternProperties:
-  "^led@[0-9a-f]+$":
+  "^led@[0-9a-f]$":
     type: object
     $ref: common.yaml#
     unevaluatedProperties: false
 
     properties:
       reg:
-        minimum: 0
+        maximum: 15
 
     required:
       - reg
@@ -88,7 +88,13 @@ allOf:
           properties:
             reg:
               maximum: 3
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nxp,pca9634
+    then:
       patternProperties:
         "^led@[0-9a-f]+$":
           properties:

-- 
2.34.1

