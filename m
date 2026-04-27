Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1ED63EF0A8
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 19:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777316966; cv=none; b=VRYvYJMIYTXXS46OuZ/sgwxixqtveMAsn9mA+BVlWcJoBI4Wz73wKgFl3iHxzL7TwkiPyK6GiEW+DWxAWEsCJ95iAVQEikphM4RMaou53LiUdh0OJXdwvGFsHbJI+HJ17kW9ylH/brBVa5BFuGeHJzrVorRUzX/xjMuMqzpGFD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777316966; c=relaxed/simple;
	bh=xwUA3LOinRz99aXFkNoUESWamcaKaH4TPR2HucSnVJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Diq/MiTw83LJcj8YIhKmDPL9HBbsNy6K0RaMO4noQWY7dKrVXhvhN9bKtfh/+p/kbZJjz+14npF6ZKxg7Rqwp76YqMhiUJzSMoVMRUVvOJvZsCWvKglCSJdEkdtySGi0PKDhyLATOCcovKvhl/JfMj34yBnjQnt1JItr6phhNbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lNcNrHwP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZqdgWBhI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lNcNrHwP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZqdgWBhI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RJ3buc2112680
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 19:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VN5/vWSpUfq9bwbzgEQDNDzFZoAHnVwNNTG
	Tid3qqrU=; b=lNcNrHwPgkYTE0JzH8D6ZgdLbLGqDJcXiBBbQzzczaX367p7Ock
	6lHWXieQlV0UD6yDfiFUyFsAyNX7JKVqCT5EFmooGCIT6aN23s2SY/Ad77E3RC1C
	25Y4OpxHbv5jc6oBStM1ja314LA+V5TepKxT4wL0s9Hj6xohxuaDDXVGRADr7age
	NgiR45Z6gF32Go07coLsoRkXGSXGK2eBhuNSm0drsY2VC4AcukKhg7vauw68MUMc
	Nu9xk/cbFSy/aXNyvuarOMIeyRpWfFPnDe3HlNei2k90/WiKQoH8XKK+jPBTwuN9
	muq9fVFWRjDw3f3jW0RR6DzeXMe0e8bmbnA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtdmbg0q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 19:09:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b242062308so196949165ad.2
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777316962; x=1777921762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VN5/vWSpUfq9bwbzgEQDNDzFZoAHnVwNNTGTid3qqrU=;
        b=ZqdgWBhIa65LVR+XTbjkc30xh70CWuOIzQUFfdE36h+m1qHtmDsyoHZVeyXoo2iS3e
         Q5ZyjBT/iz0JldJqMAzBSZdjXySRVplT5Aze4cG8tqzRYgU8s2Z2/YGxQ5uig9kytUE6
         ZWsRXPKGZGSp0AYgjf13ay6G9u8eg+7IeFakfTH2r26b9C9AO7RLrvxPZDM0N/dJJIXC
         RdQWeYorlxCuPAShBOYsekoDNKQEXwiBiN8aYBUkEbbKWtD7i+yfRg9um5ziFsIpo43w
         zaTq13maf3Ea80IAptXMILmCcIwB+nwGZ/er3FYeTqyJ2pW3fhJdnPNmntZbVRPOWnbd
         F+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777316962; x=1777921762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VN5/vWSpUfq9bwbzgEQDNDzFZoAHnVwNNTGTid3qqrU=;
        b=cmficWL3OJbwlc8pkWnayJmytk75zCKHQ1Gons9ri1b/grTIajj+8HsqwtTV+24tQy
         pvO2Jjczo8Cp2AIIAEXZAjcKrHMhqtcEz4+dOuzCEeJEFTcWtDjUBhEmukuUZ2psvd29
         HqYI6GBFxB7HCocChdvM9ce8/JPTs5mO1z0/fxqLICu8WdS2a9F+CcOrfBCk5Ov4dLQn
         zG1/nRmu82LxpBCkrA0Laq67I8WP2ylZ2HY0JZ0kjl+geQO8/V1gFUCbRwl6Wuy8+xWs
         KCwj5Uojgf6tK1EPnLI1RVZUtOnpTX6LnGrxYdJnPkymTYc3GJnuuXsqxbwEkJhkPWdG
         u1ig==
X-Forwarded-Encrypted: i=1; AFNElJ/k6h8iINd/GVICHIfb09ukFAn6mTIaPU6Ad5QbtoG3PXnMeUUvuRwRbwyC1wJ3kjb89/OUW4FNGUiV@vger.kernel.org
X-Gm-Message-State: AOJu0YyQKfBgUqdx6kbrr5DYY/GFyBkjwpXJX+v3wS8xHMefTAt9F/yg
	Xztvyf3DAQuNgOuicgXDG3tAc5ZultOC+Zd59lYGrljQZTbgoKHYMYsoPncial6D3xlt6M6NIMJ
	lJp4ldUHStkJ73kbXx48NVApqK3s02ja2DBRpFavtEL/k5kz5anzcJR+YEfYxGB0R
X-Gm-Gg: AeBDievE8tlTgP5b1THqT/OwqkTyG/sqXVF0czSm5qeeKx6LSJJiKT3EK+cWtmDZrpu
	3ZAc/kKNmorS/GxRVzUlmcBbXWz6mhMWUT6NINMlqhb1/84WrVVa3yTGGU4y0viaNiVZURE3nIW
	1o1Ta7LvaG8qBWUNJU5HH0u6i1IruH+Q7pCJaEEKpCfzRml5+33PRf9kCSVFoD8NsFtY2NIx6yk
	NWV1nwCAY3mjYMBxgOmeZ6rqpbb5kuvH+HwMYgnQlrMzXJ+EB0zQMDJoP9d0+uZ9bN7rl/DT8As
	+htMM09FRs2rrtKuTA1scGb1vJ0s4MGCCKubeDjL7/y1/a7ya9bCXXesnynN+SxBsrzra62pfQ6
	R/HAhAGtVwLBKOnC5bzF9781wI2eBq+8OBzxJ3fXwlIEvreN5BrzeoHmok+g=
X-Received: by 2002:a17:903:22c2:b0:2b2:489a:f46a with SMTP id d9443c01a7336-2b97a97298dmr4981715ad.36.1777316962269;
        Mon, 27 Apr 2026 12:09:22 -0700 (PDT)
X-Received: by 2002:a17:903:22c2:b0:2b2:489a:f46a with SMTP id d9443c01a7336-2b97a97298dmr4981065ad.36.1777316961476;
        Mon, 27 Apr 2026 12:09:21 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aa95a7fsm2232335ad.24.2026.04.27.12.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 12:09:20 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: misc: qcom,fastrpc: Add compatible for Hawi SoC
Date: Tue, 28 Apr 2026 00:39:13 +0530
Message-ID: <20260427190913.3680717-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: h1sYwgDBGsAImLmwCf-GTMp48rjqtLpu
X-Authority-Analysis: v=2.4 cv=PcrPQChd c=1 sm=1 tr=0 ts=69efb463 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=vdJOUiAGeZ4XVXUCxO0A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: h1sYwgDBGsAImLmwCf-GTMp48rjqtLpu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIwNCBTYWx0ZWRfX/N5A1K5xBxM5
 DaqPTz+Szw+mDudvD4dHYpENGcPB5WUj/yF5p0b4Dq8M8TueIqgGxKkEyGYVfBAV+0Sm9XK2QrH
 Rvkz7bOaWYzZQA9CFzdVLs3SFa8mL2RyvpZqYr4uBwRa/MQaoEDzUv/cAG4GcZ1HRzy084xizAh
 o0KkcaAeeY1cUHLjRE1o6AmWOjZLRlpQzPjPj5nQJ0+AymO9gebn1cLM7hzd3vfkVgh468mSNfT
 qZgv+KqcMe/ZWQFQu0dFeIBRQfKvhB2D8bCnmMa9pHmjsx1Fth9Fjr0qgJG4nUgW0sfj96QMmH0
 rqObLfkyiwTgVPRj4OhOTBd2qc7u7pBrBfBanOQ0hpW9qH/iIYBE+qFMETJltUsQmhyiK0DVBRh
 /E0x8OPNseOVGSqj5hC9xjTdGMbtcgb28npzmOzIYikYUTr+PVVMqLrrSzo0YNqERD10JgZwBAk
 M3ZW6E/EI7hFpv4Frgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270204

Document compatible for Qualcomm Hawi fastrpc which is fully
compatible with Qualcomm Kaanapali fastrpc.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index ca830dd06de2..2876fdd7c6e6 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -25,6 +25,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-fastrpc
+              - qcom,hawi-fastrpc
           - const: qcom,kaanapali-fastrpc
 
   label:
-- 
2.53.0

