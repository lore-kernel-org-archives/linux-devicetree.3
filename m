Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D03281357
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 08:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776241314; cv=none; b=TLmn0UxKvaM6etJey+b/2Bq7g6piOBKTO5Mb4F2nNSpV0+PFBLwXHKTuzS8bBa0NoFkJ0GpvRXd6pYphpycZ5kxH0bWDvBY3Qvh+Uj2zHPjMwWKk7B8I7bL7rT/qghpkq53ehSB9+fcT54If8U1Wjhkivnfb6FSulGc3lxcx0vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776241314; c=relaxed/simple;
	bh=QRV4MLHxKSpNcqM4BDf+UW00MmNeU+zesBUiRCyk4VM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pwq/nFsI39B3WQ5/hD31uvbLZLiBxT4H4RemxLXNfkDy+Wh+SpXgadQBP6OacsT2uPQskSyCasPMvbJaxLy0TMiARV9K3DIYBlzz1BUqa7j/X+x8L+00PP5r6ZvQaUqjuoroIhIntYpTYnzj0cfwEVvOciTUsGHr3loXIZZK940=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oj/6ZZKk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LGrKIk/I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oj/6ZZKk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LGrKIk/I"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F4CqGd3759299
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 08:21:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=I0eqagUMBzZb/Qop6f7WgKx7bP7+THfDsWO
	e5fhJtE0=; b=Oj/6ZZKk7FvsHVVWJGiDc1oUwdFN9G6s5bNN+57X1IJIIRISSdZ
	v4ht5yl+6/aSuoTyhuSXNKpJm3EvXrkLbE6sBA+x0nbLVC/rNG4p5iTOc0sHKBhy
	sAY7l+4u5GchpFKQkaZv9e7wo42W2lRXWfanWbvgEj0AMSYbsXIA1hduBQKqrJ9f
	9Sc/30l6njFK+VhHfm67zf/vkdzG5zWLukOA5omc03uf77f8CzBa1EpXcF6BjlTO
	6Xowi2UuMpttqjxJ8FP+wYpA732GDeueACVZjkYwcC+uLNi+AFgePSzV5Mp+Syr5
	1f9FsOV2uZyWmfqQd1RK7PucETA7Cg2/xGw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhtg0abfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 08:21:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d5d1c2289so109863471cf.2
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 01:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776241311; x=1776846111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I0eqagUMBzZb/Qop6f7WgKx7bP7+THfDsWOe5fhJtE0=;
        b=LGrKIk/ICmJS0P5/UI88b5r/ZGy3UQ2nYQAFPTYwBPASvGNxFEhrSrecvICwoVTXz7
         8X4QVl0qMxkYJcgFmMntKu234EVMbdtM5vemuUyBNFxW4Fd5jarjCo5l78GZolSB5/4f
         GqMVPnE2MxXkENahQVZnnFLjEMxn74d0DEMHXbh5fhrcUll1AF1rcroB1ths7fX8DE5m
         xND7USKuld5o2TRC+HUeE+LK2DJLR/RwOeq5kZ/cqEK8BGQA9GS5+hMpdUgvvLxKVOE1
         GvRqFttOoIek5b9DFybjdQ6HC6tOl8/GYG6vd4MRaMgfh7dZh/oWJKR3XoFkOKZE57Jk
         DQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776241311; x=1776846111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0eqagUMBzZb/Qop6f7WgKx7bP7+THfDsWOe5fhJtE0=;
        b=JLgScoXFHzT3xAuMvfmdrR09s7qcO1o1szvK08h9Y7erGkjPu/+fWBNLUY8FQHMeaU
         KXUgwhf93B5gIuNE0Or2BA1de+HwLDD/VplapJBnSO2DlxksVyzV8um31pAy8WeIXIEN
         kjMMhCrNuLAB2k9lOWtw6DfG1o+79LWDXt3SKpGvLB4DVPwo/98COOqbb3FG2lL5yyzh
         UbhXjPpgigO7onS8nS0bVl4NcFlGuMmctEBxa/dDIOHLxeAUBLk5EEpeNwBl2cIg0337
         1GtlFpm8FQwcBMwfJ2vBscx6YwWFBWzSc9Yyaq6gpkvVclcWuj/5O6ed04523HGv1vau
         FpKA==
X-Forwarded-Encrypted: i=1; AFNElJ+jePb8mNfD+rsVRYIYnjhYY8qVUbfIemckBoMaIbfpX0JjDlcB5ySSB8g39VUANZ3P/eDuSwllEvYy@vger.kernel.org
X-Gm-Message-State: AOJu0YzL6ZRQEktPd6/TUr/V2NTC13Q2x8X4P8M2z+LPjjMW04kBRkMq
	sb6uU3LTceFh3CcHSJYz+j8A9qz0cyAM8P+Wk5g/o1L7c5dbE5sFqkBbkHDePIqhz8nwf0Cv+8H
	rJC71D/vXokDSc1miSO6rFWAPdGVMb5AzWYf8h9S6fHvEzslssxPclt0gzOWiODCM
X-Gm-Gg: AeBDievxL8AHgMrwy2USPUlzG512uKGMWyeTdi+DSgpdFAM3qWLTgR4Z70OL0d37NZK
	qqiCTO0WhteejjT+Nr+QzNpsUpH8QygN/kkKMHS/V1qaNF0enjeV3qnhlSv3GecVIMwx8vHB1UD
	giw61i1n2OZNCfPT7OMc7hZ2dSdtldxCIjotYNzxIzJI7NK6NGrR2gGai5ZRrRmHLqhs/YI6WsI
	9+I4iaF7M8WE31NEqhs+BKsx/6o4KJz3cqhwJGp8mkP1sgMJwLv480R9ZGMIw2i77wyFpfYUY8d
	VgEiWlOG5dZzNdNxDYXUPznK0OqKGztrA9VCrj9VQ8JRHBwptBaY8Twwaj40cxvJ9+xVDmPGrB1
	qFSAA/Ct33cCpZMfNJLHTeWVbg3xP0VXIbkV7
X-Received: by 2002:a05:622a:24c:b0:509:2677:68f7 with SMTP id d75a77b69052e-50dd5aab64emr303838701cf.5.1776241311554;
        Wed, 15 Apr 2026 01:21:51 -0700 (PDT)
X-Received: by 2002:a05:622a:24c:b0:509:2677:68f7 with SMTP id d75a77b69052e-50dd5aab64emr303838431cf.5.1776241311100;
        Wed, 15 Apr 2026 01:21:51 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f0ebd0e1sm14333445e9.28.2026.04.15.01.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 01:21:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] docs: dt: writing-bindings: Extend compatible fallbacks guideline
Date: Wed, 15 Apr 2026 10:21:14 +0200
Message-ID: <20260415082113.22775-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1654; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=QRV4MLHxKSpNcqM4BDf+UW00MmNeU+zesBUiRCyk4VM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp30p5mBuRVBsm75haPO57WuvBG3SRGoHHe/bYh
 hZdlMqGMsiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCad9KeQAKCRDBN2bmhouD
 16WcD/9KdRDL5BEuBDX6uUevh6nOyhWdilO4PVAczQp1ENTFj+9EyLHVux7xHudi1uVkBOTf5xo
 BxK1MmvqosCBX2xSFVxeXEssP6ERQ0n9n+FX1mbotP2wNhdcIv1OS7279Kx5tDSlzSLakRyO5Zb
 71LHGQq3ARKsBUZS/zHo7byjoZ0BwwKByMsE2mR5STvdTOlPnsEcM/LdZe8584WqLdQ/t3oOj1q
 bpiQYBuGXBnjgz2V9CwvSATNUR3higzGICIzLUanafLr8fuDIJtn0f4Efq5Zg1Z7kQMWZDTZIz5
 km7x91NAt7NsJ7B8JFTB81mhiOyXrHL9AHD/iCiKTWvPcpH0T5utrZoO9T0OhUUHu9ESBGZsBaA
 qPr2d20hQ+dcWYc3abTy1YIBGfUWHEVZ1amlPbqElEHPIXoLYT08xtNb73IqujXNXYG3uqKb/G4
 sn7xKE6n20CV+fdlUp4MUftM+KC2OBAP3KJLwbHzbLl1Iuxbw1bGjRPpPFXA8e5kOACgfYsiVhH
 h1RhBXZJM5sohYwyNOw2Ofky2TdMH9RY9OGVRjOVvG+dQSan1bD+H46rXeXsUIU++DTO0nCE+0O
 lxYAqctWTitkNgOwZrH45b+38Ys9mMGuCTD499hlU8MWu17njU6pAzIBQkh5vQ776xb6KEbwNxW qv28Yqp6O/GHkKg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AszeGu9P c=1 sm=1 tr=0 ts=69df4aa0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=YRjzyCTZZ4-ze7UGkugA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: BK_2aERgRrrLH1E_dFI843U7izJNsk9n
X-Proofpoint-ORIG-GUID: BK_2aERgRrrLH1E_dFI843U7izJNsk9n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA3NSBTYWx0ZWRfXzCDmOawkJzxx
 bNAPtEL4CPyjSVGXilMX89R7Fe/dkpg33RFPyaJd7eVupGPySlikSWgmCRNc3Of5JQRgBSRbPUP
 SUGt2yLglqz+wQZ82Og3wsrkWSanfwceT1nIX7znEw1BOQeZwgzc4qinnTklIAaKKAHzJLf0enL
 iANlyZCCpGQKv6U/kF/7f9EXwLvYSMjGJIwdgefpy1NFs4Pp+/QhySCN+oS7eQejMX4lVbREvkM
 QPzpUw0BSuqOIeNr5NuSZWZuxaXWaRwc2AYZPl9nGSYEPL+Y11m87KBHnUyJqKJgQOd9cKE0wgl
 VkfKvnlRbKwWW2QwpyCsrhi/N8M/4I6f5pquD7dypMcGxAlSLPJJKAtJmPhUyENpFuDsArTDn0Y
 +gnzEZYko9FCVnMn2WqQJv6rGtw+EEdLvnne9xphzWyXnWS8eCkaK5fU1uHLaNmpCTZyEZuZnEE
 DEVhgTacOFofyYjdDwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150075

Extend the guidelines when to use fallback compatibles to cover to
common review responses.  Devices are most likely compatible and should
use fallbacks when having:

1. Compatible programming interface, meaning one is a subset, and Linux
   device drivers can use the subset to correctly match/bind and still
   operate with the subset features.

2. Device variant discovery through some means, like registers.

Devices are incompatible and fallback is not suitable when that
fallback cannot be used by the drivers to match/bind.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/writing-bindings.rst | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/writing-bindings.rst b/Documentation/devicetree/bindings/writing-bindings.rst
index 667816dd7d50..03e29e2d50af 100644
--- a/Documentation/devicetree/bindings/writing-bindings.rst
+++ b/Documentation/devicetree/bindings/writing-bindings.rst
@@ -53,7 +53,12 @@ Properties
    - DON'T use wildcards or device-family names in compatible strings.
 
    - DO use fallback compatibles when devices are the same as or a superset of
-     prior implementations.
+     prior implementations.  Fallback compatibles are applicable especially
+     when sharing a programming interface or when able to discover the
+     variants.
+
+   - DON'T add fake fallback compatibles when software cannot use such to match
+     and bind to a device, and still operate correctly.
 
    - DO add new compatibles in case there are new features or bugs.
 
-- 
2.51.0

