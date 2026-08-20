Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC66E3B6370
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 06:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787208423; cv=none; b=SW897aNxffZAA5ihJZX1GMh2LvTluFRXo/bzKuOMtElvwQ59nr09SoxPMRJCKUIJhGxIPe24Sf38MWCyAXCXsOHAHLHAzM7e41oVldJSzPnWszW5ehb58OtqvmYocSrLbqW/kIpF24YhjyCpRwFTXr6z80+yekYtda5l7ImLZQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787208423; c=relaxed/simple;
	bh=21Zdr3ey0ni1aMrXYVi1GY8V8j9l7j36TPy803kRm0U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VJgGkmGNaq82s/9N5zgWD7+s8L2AMGBBMknW6wS//lrujdnohPyYndQhIyStUVMm3ONEStkjEIeADzofQhTIrH9kSVf72T3JIbQIRts/Wli0Y/VAOk5MkEG94DQMXPyfhYq3O/a2WYrZoe5qflF/Xzzs0T6QnKCRuG73tmOhZZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IafvorLJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eeTr2kyn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IafvorLJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eeTr2kyn"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K5hOQj1988279
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 06:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=b5cpR7ghOmkQ7YacXWsEj25Qj1iilgjQX29
	ujYvxlGU=; b=IafvorLJtNPF1DrvsUpH+1+hdkoLTaOeo3nJ6U3s0V5nQ0tQTWJ
	9rZ2Ju6eJpk6itmczCWWd8jDM6mqq6oCVmD8rx14r7b8aQ/nvUN/+RRDH8qWaMN6
	WMTEfV+NN+dxj/+Xalg68NQ8jQpAom9H/dJI+LmGz9AiKvdW5OcAZ5i/Q5tZ9YIr
	yP+A/eviaMdy/Iuo5UUI28t9v2bZUpaue6uEaETnH68xwZJkbyJ48YHYverpMYJ1
	nztK6JAYt4vUdwb/o/yE2ARtK88nLS4lBd/3hH0t/z+nEGhVOKl2pJcJ3XX+qsW8
	LEVxGrVQCtUvPLOpVfolmcEc2/owMSS+JDQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5esj3h1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 06:47:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930edb4362dso197439685a.3
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 23:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787208419; x=1787813219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b5cpR7ghOmkQ7YacXWsEj25Qj1iilgjQX29ujYvxlGU=;
        b=eeTr2kynM+4aJ0V3FyExiCYkIskmS2z6Q/GdHaqa00zK69RpHMqeHlAiGrCE+Gjjsg
         Wcx+4DNEFcX1z27t87Uo7ATnx5bXrAGbMea02fXBS6Jozdi8djuS8T1Mbr3R12yWumdS
         uUP2Xh6Jx8xNqCSiCk6RtFdq6TRNEaDYpuWoIqUAw74oq0tgXh1PXH3P4ByX5Bd/KLoo
         2qzl8c1nw6BVIkmEPKV8eDH7iCQGYZht+raXfhc8cWmXuApQFuLSjiR5+273Iu4lapr3
         RHukiAXtf2th81laEMMogeOwvwn4mgIfJAbq5HXnatgWng4VhDQriGegW0+bwchuaQMr
         pwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787208419; x=1787813219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b5cpR7ghOmkQ7YacXWsEj25Qj1iilgjQX29ujYvxlGU=;
        b=PanPzeKQQNdtnr2h43UGyMIUWmzBPfFvVQXFPlJgwWsxiOC9bdo5ZzaooZi9/op2g6
         q+F7Uu95HDjBaMVYUHE5WBjdcBbTt8r3V8XccaiXYUT7rMGdHfTcE/Y8sgB5/lxoIA67
         12j/NDNVGv6yu4vCmlyhoycMp0ylOIDmFrCtHQS0xWtFn8+m9KJinMgAZDCtkSs+he3d
         mDxXs1O7VzmKb0sIlyvWXZLEWjGFz9/xl6etAFSTD4093ocXIUc1xdBxZDN7yxkOz/wi
         j5Yvn51xzB5f4V/xI7PEgYYhBPIoH7VtwbjV0QlNWXCuhn1+ncwE/aEOOijdy0p4DsKb
         +mdw==
X-Forwarded-Encrypted: i=1; AHgh+RpYLx3VtZbW/55Go2ZDPiqtZOZMfz5WTR4atsaAUfVMMmeuTKvFHZAcS4RQ2zrpWV4j/RaPiWcu15hK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw80mP7y0jzmvQ9aHd4OgI27vVlPFk3vj04ElSXQTEfYNUIYR/m
	n8t1OCcvq0lETXV2kktwipZ76/ox/Sqhju6qHZjAsh26dJuicyOE4ZnT223b4LqpmgjoSKuxYKO
	39aho5Uibfqlo3PyNM05i0HSPhiJjOh0p5Jks6Eh7TKjtQ5TTDRuFYiZReMtPUPu8
X-Gm-Gg: AR+sD11hMj3I049lhPB41Aq//4VNqyT4Wx6gCWNLLQ+Ub4PqLhZDaq+AwjDYCdF+OiZ
	ZJ8WxD2dKXUC6qxtGVKKM9fzgG8maCsUk+16Qj5KvRWOjFrYxigUcdBp9yURkv3ZgMT5fHRBNcW
	SkZQZRH7MB+V85Ph/yVh1D8Oms15qwP+xR6PbaGrIhrTeyDmDxPr+Z0/ydx+diL+OIo4NyTWQva
	uZhZMJS00Z1zS4Ad1Nf9BNNHvICzAzk/J2vuSHdjNd+Ufw4Vgj3B2iMiwRBVuIcYYBBDWfh8QeP
	yBB1xMdyhEkvEJmO7z+FMmsocXxxt9fPv5NZn9L+mz2HcKQVgTyeeOGxm7/p2HajSriR6CrJsHa
	fzp4g6YKYAHPjiDU=
X-Received: by 2002:a05:620a:44d1:b0:930:e53b:d76b with SMTP id af79cd13be357-9371e1e23a9mr880765385a.6.1787208419616;
        Wed, 19 Aug 2026 23:46:59 -0700 (PDT)
X-Received: by 2002:a05:620a:44d1:b0:930:e53b:d76b with SMTP id af79cd13be357-9371e1e23a9mr880763985a.6.1787208419229;
        Wed, 19 Aug 2026 23:46:59 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9e0eee0sm89575905e9.4.2026.08.19.23.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 23:46:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: usb: ci-hdrc-usb2: Disallow ULPI subnode for non-Qcom variants
Date: Thu, 20 Aug 2026 08:46:52 +0200
Message-ID: <20260820064651.69739-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=848; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=21Zdr3ey0ni1aMrXYVi1GY8V8j9l7j36TPy803kRm0U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqhqLbRdUcdg00CBrG7HdKGCoDsG+IyTJJwwCEI
 CPk4sb+S2GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaoai2wAKCRDBN2bmhouD
 1/MPD/9PVqnTcZtXHqibsdHZvVpJgFd9py1ZmFqjrj4mVwstUaVhVbQ8xTA2pslo36RgX9s2kMQ
 MS1mlSBg7CRHQLeXimq2nxhMZbKoPjVod4Bobrmn/G7dhQ6zJAUmWXghl1g7qlVmiiMCKM4ptCV
 eLUBKDrFEpLl8kkusw5SZEgucKhu1w4m/JFBWGhw9FDnq4d54/REMpzrDtKFJyZEZy4sD81LzY0
 BHuIcHGRH8Fcr5Rn4rQc/K7YtieN+QAt2rwTtZH/4FoDpjFmJdnCSLEc1mO5zC7uEZtAagrrfY/
 2N2Q3aRbNKfISi4Ev8azpU/M92ZPiyeqwkhy1z/1J/kvfLCh1CHWBRdXtYKCYwurkyDGyy9QjXq
 upnY2bqXaz/PF+WIelIqlGQsCzjVoIDEeQaLqOShq31phPzIugth7lhXiD0RW7TrE8WiDWrSX8S
 wYU6bJz5ZEIiLn6ZXv8OvZwRn+svBfQB5gizDyYvrVV+Zfbd+eyP2wqotOBFJLMqshkLjvyNgq0
 vdWtQg180fuR4cauMvwNPz8swRqb/tBj8F82VsrZmQcuX2qWGX7C0Y/lZdS+9TwTxzP/OyPOROC
 7M7GYrTkyVC/8Fa3kGp309oVQJDjN0QU0Taj/7cKnxUCTxnHXoK/woG+mXVVQmiGdRpQPgY2Nm/ 1o0PaUEl9gBQEhA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: S0A_mC8wSRyFCHFnV6wIyX2GstwEFp1O
X-Authority-Analysis: v=2.4 cv=EaL4hvmC c=1 sm=1 tr=0 ts=6a86a2e4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=8Kik4jn0w_l_giBzOlEA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA0OCBTYWx0ZWRfX5sTnmJFQX3EY
 QZ6ngMWZy0C9RvqMJ61mckjoM/a7i06P1URXo6t1+OKFfkYt/X/U1T1I9E2zYimQ2OMhhvbkQbD
 C/D2ZtPHJT1ZHh34LLkgTC2rg3mBlA+1rbqu3NZ8qUpmGlRgbqOC+FDodLu19AYPVirw7flV0UD
 csfgbBlHgzPOjlXivlJMV/U1nxPoYgnlc2qlardXaKg9G4bijhrWqVZMjdoLwzydZtmR0F6zgxW
 O6PqOtZ5XQhoZBCBWDgzAffN17u6kB6PR13UW+VO5bmSIsam3k0WlluOS+Ue5NbQfLYGnZBY2EJ
 efd/crJApRm5nVXK7bnBXHE2zWGsWYRszkXU1VkWNRKQwHlAhLZZevRfvvof89T9dy2HTPxagMY
 n9Kq0kHGwDDcPDQEDRvIm+kOWBij7nRIC9IQz7q8jv2vjXZKc66Frz5OBGdUghGiA8tuqKy4bbU
 52wOUT1+tg8QaOL2rkg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA0OCBTYWx0ZWRfX1dawR73ypTOr
 ze5+5mnynZ/PKhEXKWkpamAwuynb9XCEsx/lC42fu+iZLwneK59lbQ3lHAgbYc3/gVGtGzWISYL
 qtByelGIcpsGXC8VgWtwxMsdAsfmSBs=
X-Proofpoint-ORIG-GUID: S0A_mC8wSRyFCHFnV6wIyX2GstwEFp1O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200048

Only Qualcomm variants can have "ulpi" subnode, because a specific
qcom,usb-hs-phy.yaml schema is required for these, so disallow it for
everyone else to make the binding stricter and more precise.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 620b564914d4..18f828e4d6df 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -113,6 +113,7 @@ allOf:
           maxItems: 2
         clock-names:
           maxItems: 2
+        ulpi: false
 
 unevaluatedProperties: false
 
-- 
2.53.0

