Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3261A5B90
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 05:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781070216; cv=none; b=lhomsFZTGzHK4Uzz+zjWmDAYo5x4ajk7gVqRoFU2RqVIGnmWykqQbYHlJ4Or6/otrxF3PyObdas1q44e8hWhwtWuuWVfWsuItRbcU3NB9XHByFkkTU66q7XfOLaci3xY3sZ+GqhmgiDDdufGMddHgCMJtDtiq7xlvc/gjzqLFYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781070216; c=relaxed/simple;
	bh=cIJKHUE9rzKAjsGKA9B9ahAX3w1JOCBwy/twHqPbJGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Jz15oHROfCx9AgeKNlUv+tQGC3dVxFfQOgqOYx0asyhmag/Uaiu5xaFI/bkDE9gauFDY97zsrTuqUt77sJMvR6Lznfzfqd2y2wZG9UX28ZTFlsWFTNCkSz3ihyEi/ib9nf8PDvmMAmLqmiPNGUICDytlkzDeAGkPFafNpO1qWHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SAvjX++l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bd8eDtgw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SAvjX++l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bd8eDtgw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2efA04061452
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 05:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=g1S7auhmrVhVxzUSU6uZb1
	0uD+w9BPqSmI59wEYDAjk=; b=SAvjX++lfH9LTD+/e2MZxXGJhYaEH4q7IaHzC7
	vZP0IXbgFCcNIl7kMG4XMXeBfNv6jBQuoQbp1hf3gkwr11VrZGsrNrKJ6ohtPGqU
	24xLuWFOKUt6p4T9aQ/uiV7htlueOL7Z0aPj+LlVFUT8R04J7vmXUBubcj8+EjqE
	pTnhLN4lCwmYcj6aJ/DSRxR7c1AcDH4KgyOJMwfpQ+b0kpm0gQjUA+OrZdvtuy6e
	cf2wQnj2o4pLdIXaK+YFCK2QZTdkEYpJPz4DmsE40ovanjzGNUOAMRW0PpIMN0cH
	LqFU7cPry+5xlW7BHlxCJItzprrwLxVENxiI1joldIyf2GMw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2gv03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 05:43:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304f23c55b2so6678718eec.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 22:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781070214; x=1781675014; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g1S7auhmrVhVxzUSU6uZb10uD+w9BPqSmI59wEYDAjk=;
        b=bd8eDtgwJXcDHeQ1gI7zoMDFrIh9oTMWQ+jwG4r1elVIe/viCP6vOffdZ+4FiroE4I
         91Q8n7GT12NwrRwAu3oIBZzU6zQNLfi0/z1tO0OExby5TNC4SJSCBzP9G1pq79WSDFgb
         2MwS8hhFXuEdSeNvpq6+ZjVv4EXEHa34GPbPxy3nmw0Ktaoohq6Wuf4EsFPVQaU9Fk3j
         XJc0+v3CNlHm84dr7gzq92wtd9kN5khuWFPRPcX9YajGz3X97QLgrRnlT5vNXCJQud0h
         8orez/O9eEMXGnKOvstrbfj3mzhNHm4ba/AFNTtZDuNFRy6DWReV69IeMNezqIpqLKbp
         AHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781070214; x=1781675014;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1S7auhmrVhVxzUSU6uZb10uD+w9BPqSmI59wEYDAjk=;
        b=MAqqliassliot8MWAN1OTqmieTX+R/q5II2dDQCt0B2/Ox/Lj8tWdA4rJ3JbiDqt3U
         LTW4gI4wkh1EWg+yN/8CzSyWep8G9f7WseeozmDWu1QqaHmMUsbuPTZTi87aTFDR3NQS
         EVZs2po9cnUygyl45MYcd0DR35KSmooTANTa+QXC0t7uaFZDXoG+eM1tgXopTOFQTri1
         Lc6O9QiXZaCJy7qpHDc1eMqwrgykUcDEWJP3QYcKU9dOhlzvvPdmu0+W+9xjIdeK3xMi
         nPxescUNoLd9ETUnR6I0tcrNosN9GxQ1kEd2IXtEodYd8bgiHPRRcWvi9ZaHDcg87EHH
         cD2A==
X-Forwarded-Encrypted: i=1; AFNElJ9G9scXQk51Ofm3gfCFoVTH078fDN9GM5omOL9bGPyuC9g2Cbd6Kq9my9yBMETy7PQlvMCE/5prhqxC@vger.kernel.org
X-Gm-Message-State: AOJu0YwqhDJ44ozUzzDh/qNBaGb3BZj2I5w6MzCdya3KiDNA9okf7EcI
	nCkPOc+ooQc6oOQMf5InV3esAFmVJHvzL5j9OSr1x6PG/BYnEWH/BAzWKMR6IWGvCcrGEx7rq/u
	YDHtFijvzZJRItzKrSPkyJFaoRDQ4OKl3MKINy/NWe9nZsEYmftawbmxJL52RA2yN
X-Gm-Gg: Acq92OHlOAXgTxPRS9rr3H9nu+wbXh2ehvvKwNgSZmtU1DRjEayuFAstbT1SHALe5eb
	AxqLOUc4BeqXU89/B5huMAW5i1YEPYv0oseH5SJoIGAE6aK5me56R6Y4dvs4g/4V8JnzrlLb6P7
	SpoUd9qWVFgnILdnAMx2uadgvztqOVfo0ZbAOFrn3JdTmknfiGVcnJ8sSW0HCqbRlNLRaRI2PZw
	z6adOVY3J2X8sh4NfsP7GfA3jnx+zsXp6/ANgc0MhH2yI2m+eunjhbI8tLcdS3LzR+UQfzHdchk
	vsSiN9j/kOSYG0J0Zp3jc0rxdog0zOGMlYEj++MvumgV4ZzDOP8a0+TS51rJdXEc9Xco05yjln8
	k+NdJ9dLnLinBMuZERD3y+huHlJUvPDU0ULKkBfruw+uWnMAZUG3/fhMjcq+mHOND0ty7g/s1hl
	RQEJL++73+
X-Received: by 2002:a05:693c:2c01:b0:304:3c33:7ae7 with SMTP id 5a478bee46e88-3077b32a5aamr14613482eec.7.1781070214139;
        Tue, 09 Jun 2026 22:43:34 -0700 (PDT)
X-Received: by 2002:a05:693c:2c01:b0:304:3c33:7ae7 with SMTP id 5a478bee46e88-3077b32a5aamr14613457eec.7.1781070213554;
        Tue, 09 Jun 2026 22:43:33 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df75ff6sm25549178eec.26.2026.06.09.22.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 22:43:33 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 22:43:31 -0700
Subject: [PATCH] dt-bindings: power: qcom,rpmpd: document RPMh power domain
 for Maili
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-maili-rpmhpd-v1-1-c8f976377726@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIL5KGoC/yXMTQ5AMBBA4avIrDUZlRKuIhZVgxE/TYtIxN0Vy
 2/x3gWeHJOHMrrA0cGe1yUgiSMwg156EtwGg0SZYYZKzJonFs7Og22FxLzAVHVGJQ2ExDrq+Px
 2Vf3b781IZnsfcN8PQoyJEXAAAAA=
X-Change-ID: 20260605-maili-rpmhpd-2079035fc51b
To: linux-arm-msm@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781070212; l=1082;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=cIJKHUE9rzKAjsGKA9B9ahAX3w1JOCBwy/twHqPbJGs=;
 b=5ABKL5UCgk1pHYzu9Y0zk4aP8vxqqWvVRAGDmaji4st3pbWj8+IHfM17045skvX0V9RlGLcfA
 IIF+E2NNBVLAMBk3vPKFhpi/NWlOp2VRa+d1aRLDsutxrdKWr/hsmsQ
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a28f986 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Vvp70IE03rMNbhAYA1sA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1MSBTYWx0ZWRfX7/5pPuSEPSfp
 0RSSGAe72TMka6ecrRyDwI3UjMzejxsYt+7v1wgQ8ZRJezr+xnijipbnwMLYCNNKgZ2d3SMJWP5
 Iq5be+hdDr5JzxKH4JLgaH8zfQgABOZsL0UKvI0Jm2f3UJr8J/N3vwaFV67U9lkFEZ6uxi0Sc0K
 zPWVHyxdV8os9feUHrtDMNjT90DGFfjUgIcv9ysB2s8qNwCzlbZDgG2vSW6Z4j/Acaz6p8NdjUB
 YI5A21nXWS5Q7w3TIvcTnAqYm0vRW1LWJZ4aF8x9JybzJg0YMw5t/348PFsPwQrWcVO+lh0TySt
 zuKDg6L4Luc6grEjDS3GNXTn08kKLvprv+U1oDr9f/GmnZls5Klx6kYJEhT5ssZCphgeW6P07q1
 snQuM3Eq9U6EQlPZ+OqUlef6UprkjsZUkZ5M/+kb/ale151+A+bPGq5iDlHM9kLlxYTvl9aMEh5
 mDtgIzq82MGb3EYnRfA==
X-Proofpoint-ORIG-GUID: sYgC9k0To6jd3LlohdcdRF7ExAUQalaG
X-Proofpoint-GUID: sYgC9k0To6jd3LlohdcdRF7ExAUQalaG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100051

Qualcomm Maili SoC has exactly the same RPMh power domains as Qualcomm
Hawi SoC. Add "qcom,maili-rpmhpd" string as a compatible entry for
"qcom,hawi-rpmhpd".

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0bf1e13a9964..9f3c8cbe9d72 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -73,6 +73,10 @@ properties:
           - enum:
               - qcom,msm8937-rpmpd
           - const: qcom,msm8917-rpmpd
+      - items:
+          - enum:
+              - qcom,maili-rpmhpd
+          - const: qcom,hawi-rpmhpd
 
   '#power-domain-cells':
     const: 1

---
base-commit: 3b7a18a34e8d3b14c7c926f033488a0350de9759
change-id: 20260605-maili-rpmhpd-2079035fc51b

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>

