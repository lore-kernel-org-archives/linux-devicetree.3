Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847B14252A8
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 23:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786577715; cv=none; b=kmOIspVm0WSR16KxHXFD0LefkedVms3j2Jdm2ahWu2n8z3jugbY30GSmBGKoccyH4QkmbRBUCDLP8PL+H2YNXf/nFd5riD1ReL5XE15KacNUOOJHXSEqG4j7K6b3nL39xYzjDlR+4B3sRWeMk9I2o+q0T16j91OPp1p9yAcelfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786577715; c=relaxed/simple;
	bh=pMTIzY1h407OmP6ZGR17M43SvczEQJjzPSrXyQZ3aK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FfBw34hEmtwZz+C6Tz3G68wwbSSQ09eyIGiDf0W1Tq8I8kCzbfIIdfyVp5k1Ru8ME5a4jQfi+sse+7il+rZL6dXPK9Pd/kz3Nju98IUjHQiEHvdE/sS4/affdpW9fecAtB6SktHva61FYyd55SMUUzMF0q2non4k4LR4fUhU2WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KEe3HAd2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EXRmrbnf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KEe3HAd2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EXRmrbnf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNLqq31022905
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 23:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R1LjGLBPhCkN6fNBzzMLJks+FhS/j60EJGyFCmImsGY=; b=KEe3HAd2iRmogojt
	qIG7t5EjJHoNXMfBlQfiN4Ma/G/JdIrIsfLB13rA1AGcwrxLwVIkUbovqK9CPFSR
	kO0K1rGAPRUKcfjZw8RiRN6PGXzFaXGWft0LD8VMXRNjp2g3gYtLIZENckhuegF8
	WHkxOeRMNDV9EjymqBjnBNRH7goLXoL6UJhbHEdcti1et5+clqUU9hrJaw44UrwT
	swX+wiPjdc1RdIrq1BRdUFDXvPjJqjonmjeMBivSFOsEshgbL1xbrK5IIyfbEuyd
	3T6EKxUS53QDFUim7o8Rtt79HhUHPMZlftVQaLZ53mwnB4a4S+6T+2Vjk6yOP7My
	Xb8sOA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0y04gtec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 23:35:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so4835925ad.1
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 16:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786577711; x=1787182511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R1LjGLBPhCkN6fNBzzMLJks+FhS/j60EJGyFCmImsGY=;
        b=EXRmrbnfwSJ3wK8nVFESWDj5MLqz5thVorVbEn5/pCVgw5iZio9nA8ZhxfNpASGPrX
         G0BIVIKfOJWMqTdmvMcV5qanBSDXgw4PoVJtm8H2grNp4J5Ovw4MGhSVVbUifIljCSAA
         RemX7WeMiHAKBgC6ylCOIyefdwikYQNK3VgG3eXutvBAU4XQki/liwBldoB9t8peLCCI
         J0K2/kmwZCeC0I7P9m1riUkYEK0ka3w4GDq423lkmm3N1V11dVZ9F4dAl1lMkG7MIiQD
         HQGCfjqGs4Gd1aaXYxQud+/SGjAYhiLQSRuCpwF/o/kVqsv3x5wSGO7kHyacZDnRYPr4
         c2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577711; x=1787182511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R1LjGLBPhCkN6fNBzzMLJks+FhS/j60EJGyFCmImsGY=;
        b=oUf6TZWGRQj58ijKJOLiaopnR69YjaIEXaVvjt2JOtF/Iw7H+4UNxpX0HDIp/r0Vx8
         xuQ7F00RmUaD0a2nL3gGiGkOZssljG4Td9D734LfiYxImblwWuJ6lR+BcT41bGJ93P/S
         mc+xOmcx8/nQlUuQI07f93DCKMGGzWXbalZCIk2PBACLnNAmklNAumYhXiOSbaRGBSAl
         dpA3XFmlumQlA8ahA3M2xeCM/b7PAFvRGfHoFyUa4lLIyCprL8yykHkxtvRKvh5GTETk
         IS4KByzafPYjcywmmv8AuMKSnW7vaLHv4ZxwpieLGz+FjIuGQKfqTXE2WzC5z01m4k6+
         7sDg==
X-Forwarded-Encrypted: i=1; AHgh+RrLaXPABM+yedN8mqxNhypuiBrYiD25IwmkhltjeJ2VnCNPCoGPHXxXkOGiW2dRB1SKSUASUBrtkdc8@vger.kernel.org
X-Gm-Message-State: AOJu0YxmAt03YeVCzwMPFzCq/U9j9/MP5OxdPe7mJFNE61ZeV5PB2ez9
	UAMi4aNlKCyEmIIoJ4M2h2ght5lcHTVFWAz23nfg/Q2Cppnijle7oKQBzzj/EkMX/OS27PcpGOH
	FKB3tG53eGCzsVIrvAU17Nzbau4KGRJjcNGaSGSiS77Uw4Pa/wAuY779WCOVtJbd9
X-Gm-Gg: AR+sD13HMEzeab8sbjQLgP9RIgFmwV+hdQfOLqkdJnTP5g/Ysj9D6GC+M1S/gtLFYey
	H44jF4fBn4Wz79FqKyvGrBzFnL7FX/Ai6KC1Lce8WC+sDliuii/VrDUdr1iS3iYbGp9sVsIO6jL
	BNH2SzvnUCxzgOJVj3rsIzkVuQ6nwWLRzwlnybYqbjUToJ6M99323yFHt+izA4nPUaVpNpbktLn
	pcl52Dajb4yP8b20X9WtUINV38kxLRld5a0qKWfjsAvHzMDnbFRVppaytCbzGPai/tyKI0EXWfX
	RQOhfedsOygjawQf5cSvTIfqf16wkAiF9vXs9gBUANtdWSPej37FZ2VKJkzm7Q==
X-Received: by 2002:a17:903:2385:b0:2d1:134:b86e with SMTP id d9443c01a7336-2d37d53f429mr18845285ad.2.1786577711575;
        Wed, 12 Aug 2026 16:35:11 -0700 (PDT)
X-Received: by 2002:a17:903:2385:b0:2d1:134:b86e with SMTP id d9443c01a7336-2d37d53f429mr18844905ad.2.1786577711165;
        Wed, 12 Aug 2026 16:35:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm2136805ad.37.2026.08.12.16.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:35:10 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 19:33:48 -0400
Subject: [PATCH v6 02/11] dt-bindings: riscv: Require block-size for
 Zicbom, Zicbop, and Zicboz
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rva23u64-hwprobe-v2-v6-2-c985af3256b8@oss.qualcomm.com>
References: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
In-Reply-To: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2047;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=pMTIzY1h407OmP6ZGR17M43SvczEQJjzPSrXyQZ3aK0=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqxaZpH1uwQlz9uxSeza7rMy9PFM3dxHFy4XvwgKXPBy2
 ZwJd+ojOkpZGMS4GGTFFFkOH23J3vrKJ9r3OecPmDmsTCBDGLg4BWAiirsZ/hdwLbU2Dz0960NX
 0rypGXdvxPuUKj4u+tpZHrO+jOOhRTHDP8PFEu7mwprWDAtOnj+1sm3V3QSnELbJDo25viGWegU
 tHAA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX8aAC2H3mSxrE
 4hwryi4MyGQQGIkFgi2q7TVN8gu7H2GJmokSEZ8hgAa5X2l2QJouzHk+Jm0+GkIbPcaK4QGVqtu
 m12Hm38BNOXN6JkCSQFSMq/X3+MLhKS4L1HEZxRoOuw5jh3IQRb790fh5KAtp1sghwftnIlLylY
 69LTdjt+YG6efbA6scWrCIBVwVVokp32SZ9TNYrip3V3RNGN5zfYNvMUrxakbMzBvl7ylWPil1Y
 j3hmWTWzuyahX0FhEVoopeUIajoDJJrEbSPr/3nRG3RjOpZ57vj9FsqjSPwsvvwdk9fg8AMcHkc
 d7Nvb3/elNRgTPTVZP6QrCi5d250UxMn/llsNFHnVO1UIGguIPOAqEpf2WFlqiIcgZXP4DHMLlC
 k6pvHIx/zaPpWhgFHQ2du29Ho2t9eqUqBuglY/wUC2M5PbJxjJQef4g75ORiwEdBvBp4ReVSRP8
 OL+NAXv0BHGzhy3LaOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX950P1BKo1XoJ
 yV9DPtRf4qz6gM70SFQBU7P0d7C4HORd9xASxkNi8HFG8HBvYNfxwdSLRWq+noSaZKychrk2HcD
 NTaVyUy8/1oLlGvpMVwTNlW/9T6Bmgw=
X-Proofpoint-ORIG-GUID: Jjy2ZggX2uECy7HrTyNhYyqe5nvcba2f
X-Authority-Analysis: v=2.4 cv=X5Vi7mTe c=1 sm=1 tr=0 ts=6a7d0330 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=7qHV-DMWNrx828xCWhIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: Jjy2ZggX2uECy7HrTyNhYyqe5nvcba2f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120190

Zicbom, Zicbop, and Zicboz have no default cache block size, so a
devicetree that declares one must also provide the matching
riscv,cbom/cbop/cboz-block-size property. Make it required so a
missing block-size property can be caught by dtbs_check.

Match only nodes that use riscv,isa-extensions, so nodes carrying just
the deprecated riscv,isa string are not affected.

Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v6: Only match nodes that have riscv,isa-extensions, fixing
    dt_binding_check errors on legacy riscv,isa-only nodes (fix
    suggested by Conor, breakage reported by Rob's bot).
v5: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 577d7ae5576b..d4cde2a7b8b2 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -1211,6 +1211,38 @@ allOf:
           not:
             contains:
               const: zilsd
+  # All three Zicbo* extensions require their block size property as there's no
+  # default.
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicbom
+      required:
+        - riscv,isa-extensions
+    then:
+      required:
+        - riscv,cbom-block-size
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicbop
+      required:
+        - riscv,isa-extensions
+    then:
+      required:
+        - riscv,cbop-block-size
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicboz
+      required:
+        - riscv,isa-extensions
+    then:
+      required:
+        - riscv,cboz-block-size
 
 additionalProperties: true
 ...

-- 
2.43.0

