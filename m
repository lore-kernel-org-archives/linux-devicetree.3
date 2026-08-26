Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C25380FC5
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787727991; cv=none; b=QFYHusvv2sObI4D6r4wJi/O99ud6LRQEq4S0Zy4Z7wrpdAT5dVGKWd2e7s002++wUiI8jnskjl55ghXC3nux8q8/f1o/PPju652WfnNiXfvUZlzz85xRgHYeERGQkl3aYAl4x8Z+uoTEGRs6RUOs0tGki2oi5+ihD6dN0FEYzmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787727991; c=relaxed/simple;
	bh=WraPvDvGy9Jufn+SaJj9rOm1t1/Kyu0YxlWrUpE8/SU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OQw0bLyoMHJD5b/O6VzCt/aGSXr9jtqRBGhNNTYhKWcG069v+sHKZXfweMtGqRBdRjEwcHjBLt6CskI7b66vJ/VgZWlfE2bMSq0kqSXPfvSBkzKp3DdWkkJpFr9LqAVEb5FzXS0sOUSE9SbjqLbVCMA59WncffuPiW8KP0JmN0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Taysm9hD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+avweMR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Taysm9hD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f+avweMR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6Ruj5122868
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tMLzRjPVGu4PMTor9KIPBTRmzx8WfZ7yvrm4g26Ni+I=; b=Taysm9hDgfZkcwdg
	bvMG/eEPFlMewlfkQEeaJNWUxVBjru+qR7RtDrbNGzz2ZPuEKepCcv88VWdBE9TX
	u93al02drXQuvSOs/KzdhvJvQHixx2Jy1g3TvNWELGfnw4xoCpxqrfazBlNKpQ03
	GgWETcV332Z3fTUar4SeeuVT03FnDY/AX6FKrhn68KMs5h5wY9Z6wjUa4sqUG7SV
	MSvI31nE6Jj8d1vmxX6jLmVHiQXYyTYPYHTD/jUXphBuiArVfmaIoMMalK/opMxs
	TYD5VmDt8stTT1jfqavGfQdFoxUahzghe1QmSLMB9zF+2wausi7/IYPQiutL7oBc
	mEEFDw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9g4mtckg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52dd69b00cfso7357101cf.3
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 00:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787727986; x=1788332786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tMLzRjPVGu4PMTor9KIPBTRmzx8WfZ7yvrm4g26Ni+I=;
        b=f+avweMRchb8mxUCk7d8+RJY8A2liTp89gUkQPKvDhqdVqopHPaWalmHfIYPFGPOBc
         oz7l2Ux3kdIXdzOSUxm60hc8hh2iUoSDvdlaftPBlfHLNBqDqbIdOjsXijAQ1U4dWagl
         XUU2hMbjLVeBPBE9PmAfyQF2vpnWuCjjO5XcJJCHp4v2q1ldlHhkgw2CuPHHvcNA6F4Q
         JqQPQ/9b81or3uSoFk2nzh5WEhjfm4uscG89NV1jCtHvKRmbkHuNqQ+4W0U41KG0K93q
         vSiNR+sgzjy0xLGXAoXqHrFhkMJQOLQ0ooFp6A5eRDcELaHXPu5Ouyasmpw34sIqgFEw
         cbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787727986; x=1788332786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tMLzRjPVGu4PMTor9KIPBTRmzx8WfZ7yvrm4g26Ni+I=;
        b=LJjB4s44SElRCt7R3vtHLWVI2UNvC1K9aBqw4eMCdQbSYSGEpzUE5g8B6UtzumEqUR
         LoI7cs4R10Cj7V1IghKld5ZpFAxbUyU/g/PaqpGx6WahC0jS0/pUms/ZhNaRwqWWk8Te
         jzf5edHrVjl8qR+47ITtKivRw2MijcyqR09PuUjrxoub1e24HzDlXTfuZj1FU6epzEoT
         HxNgfmko9luYLfcBzZgJc5d6qnm3qF3KrgHdU8Jj3/FUngRSlycsipi3ot8QhZSolgtG
         804Cn1yUcsylLvHeeoFIt6KuTa5YYamR8BhUVd71wVi31ngF/X78vJDdY0vHgZsFzLdQ
         D/RA==
X-Gm-Message-State: AFuF++nPsZhG1y9KQhEysxQjUnx90JGBrX9JWDCe8yx6o1utszeKryST
	XakAcE1uQ86fiGeyEo3JaXc4auA/QlAhEGNfCo3M/kgahJb18D0LP055fLohO8BalJelv9SUc3J
	bSQORsZenW9jwkETeaibdADXKMJD6Yqd7OESFY19KuP32905MneUgy4o7pDjvYhXU
X-Gm-Gg: AR+sD10OjCWux1V4mS8iu67AaVCTYAZ1knPsZMd81/vOaoXUhFDPwGB5RrEb1HmbfXg
	TuS2hilVaCktkpp+9CYmJLBWoJyvmOaYD/V7FWGu8anqU9xh7eoMKS2C2psfqdv3BaVGArwcoXR
	hvQtP5EW+TMA+8z0A9wxc2HH0VSu/6WKBdb7ox0wiDowkLZNGZwv0RF7DSW3U3ARfZAso8H1kgt
	Q1E6krnTpw3lHTaBYeNVBAlxtP6l3Hu1FSskbonE4qLzeF83ljIYufwtQCEWfI8P7h2RcvtQhKs
	2vpTM7fiyd3uRluWV4+KNNHY/ExpRzhR7PLXRl8vxezsv8JtB8akmqg3KJHEVlmmRiA+tH56vwv
	ZAj4ExXiFu8bEpyduZ4M1VPE=
X-Received: by 2002:a05:622a:30c:b0:52d:a4e5:6b3c with SMTP id d75a77b69052e-52e42290632mr45389091cf.15.1787727986307;
        Wed, 26 Aug 2026 00:06:26 -0700 (PDT)
X-Received: by 2002:a05:622a:30c:b0:52d:a4e5:6b3c with SMTP id d75a77b69052e-52e42290632mr45388831cf.15.1787727985773;
        Wed, 26 Aug 2026 00:06:25 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ab82sm366812966b.31.2026.08.26.00.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 00:06:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 09:05:59 +0200
Subject: [PATCH v4 06/10] dtc: dt-check-style: Replace Test User email with
 Rob Herring
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-n-dts-style-checker-continued-v4-6-022e60091965@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v4-0-022e60091965@oss.qualcomm.com>
In-Reply-To: <20260826-n-dts-style-checker-continued-v4-0-022e60091965@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=17204;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=WraPvDvGy9Jufn+SaJj9rOm1t1/Kyu0YxlWrUpE8/SU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjpBeYVcLSsQ/DHVo2OomV7xt6AhLoT9tfN6bc
 5kPb/aFO96JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao6QXgAKCRDBN2bmhouD
 1wk0EACatyZEOK+ra3Gq21YMlw7x935mcm8viXWRLNK/YWV6+6TPnMB059yeWZhtMhvViYMOrmQ
 0PmHoezmBlZmN7d6ntXJy3I9/2rHf+TTVgL3gE1gsgBfrZJHz1EKMOMzJgkN8V+50CCnv4JDXfG
 gT5xUcAf2Xwuo50i7lQxu+xUMk5gKJP0/vippj2Fy3n8j3ELfPnSiDC6RizSKn+9ymzYCdrQ4wu
 7BztgGFbCL1o4xQI0c8WaCWxzskF65JXTyTBmEJKMiH9e0acCJdoK7fMiWD5dqVC1uL9mx3w20Z
 iZnKV4tteRQLx5WydmJeYHyBNDJRbh9leMkgIyUsU3TDlxvKwmBQqZqOeoycX+/pUBxblFRB8lP
 sbC/CCbglE0PcHaJM3TyYqaS/m1CIsodCpKWPkye7FEGX1noDV35UEnukoA6bGtbsEkSH+Hoqxk
 kguQhWHOiHkEE9eIeJTT16AcjXTFDc5DPrBRdvds947aNmV67udNxlA5MUMqq6ZNTg0izNOP58a
 D4zlSKC2SMUf4f22O3Qi3NQgxA8/2V/WjCqDuR2NTBjqvGgiS2vxHugQqJ1XpJOMTsINoxRkNCN
 z9XPSI/xeFSxumFhC6HKuHccH+8XQkwT+ZZit/1YprK9d5Y/0Vz2n8O2EakS+Cycw2ROzkjkzmK
 jZUWBcGZ8RLfstg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA1OCBTYWx0ZWRfX93XzX38z2OIM
 Ci9RsMyJXFzdv7ef9SixLvyXIHB87D3AAvJ5YjiOpdDmHy436PlhPZz4Jbdv+L7Op8rwAqiSBgO
 p3IRuQZI8qRStKak62W90fcq4ylAfPw=
X-Proofpoint-ORIG-GUID: 3_tYo-MNDyNFSHFrXKCr262th0bgnO-G
X-Authority-Analysis: v=2.4 cv=eYgNubEH c=1 sm=1 tr=0 ts=6a8e9073 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=A1X0JdhQAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=Lkbq6ki4aylNsx_sLmcA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA1OCBTYWx0ZWRfXxX9IogrdNqCR
 AyguxvnSYICZFT0iArTRz7hivNkhb39nviSf0eCiaEGCD5F4Uzh+7FxJw/47pgDtcq0HImWhOQl
 N1FgEXce543se/jD/j3imLAZEDCpRnagORtQGJh8CnIlBgthIfeEv0fAL/0tKfmI+rP+BksFOSZ
 e2XeHHm0O0iDBKaJllPv1P4oneWHskmLESKofPffCG406qVmrDuEWyTCeazQJdEiUj72bChu0fd
 nvENcGAvxeUt0mZh/UgbOW49/jbpiueyggwIvlxl2s9XCpPjzfaQeB5NmKEuCeHt2Kn+1LxXxxN
 v+wATxonXbPxZi1K5CTA36ddwtYhXM32D8EE9ZQocXgzaESw/HT1OJUFYpzvzNKx6Y2Nt3ONevl
 CWHd1RYbVXknXpZrsBsuZ/w6yFTR/1HHxhvwUuoifVl+sEkTXqAR5A0+Y9ItPsJEJFWLX4EXt/m
 r0Ut5HlB+SlczNQ+DsQ==
X-Proofpoint-GUID: 3_tYo-MNDyNFSHFrXKCr262th0bgnO-G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260058

scripts/get_maintainer.pl reports email from the example binding
fixtures, so let's spare someone at @example.com from receiving bunch
of odd emails.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-style-selftest/bad/yaml-child-addr-order.yaml       | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-child-name-order.yaml       | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml             | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-digit-node-order.yaml       | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml               | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-indent-strict.yaml          | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-label-in-string.yaml        | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml            | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-mixed-indent.yaml           | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-multi-close.yaml            | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-node-close.yaml             | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-prop-order-device-type.yaml | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-prop-order.yaml             | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-prop-pairing.yaml           | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-required-blank.yaml         | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-tab.yaml                    | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-trailing-comment.yaml       | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml            | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-unclosed-comment.yaml       | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-unit-addr-prefix.yaml       | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-unit-addr.yaml              | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-unused-label.yaml           | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-value-ws-multiline.yaml     | 2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-value-ws.yaml               | 2 +-
 scripts/dtc/dt-style-selftest/good/yaml-4space.yaml                | 2 +-
 scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml            | 2 +-
 scripts/dtc/dt-style-selftest/good/yaml-tricky-parsing.yaml        | 2 +-
 27 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-child-addr-order.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-child-addr-order.yaml
index 3df56e69a1ff..7c3b731e059a 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-child-addr-order.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-child-addr-order.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with addressed children out of order
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-child-name-order.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-child-name-order.yaml
index 35d85e5573c2..f3483033859a 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-child-name-order.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-child-name-order.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with unaddressed children out of name order
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
index d4662acc7b8f..ebb35deabbd5 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with mis-aligned multi-line property
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-digit-node-order.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-digit-node-order.yaml
index 44a9d25e5ba0..068542a98576 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-digit-node-order.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-digit-node-order.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with digit-leading nodes out of address order
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml
index b26d1bf58de9..c55359a4ca68 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-hex-case.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with uppercase hex literals
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-indent-strict.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-indent-strict.yaml
index bee4cf118d73..155060a79887 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-indent-strict.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-indent-strict.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture using 2-space indent (rejected by strict mode)
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-label-in-string.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-label-in-string.yaml
index ba512869b702..4a69b503af4b 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-label-in-string.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-label-in-string.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture where a label is only "referenced" inside a string
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml
index 64427bf1c385..6e4140e500b5 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-line-length.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture exceeding 80 columns
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-mixed-indent.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-mixed-indent.yaml
index 5401d1a423a1..c25a0d1a999e 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-mixed-indent.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-mixed-indent.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture mixing tabs and spaces in indent
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-multi-close.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-multi-close.yaml
index 4d9fa27b50a2..afc202a698eb 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-multi-close.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-multi-close.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with two closing braces on one line
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-node-close.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-node-close.yaml
index e107659fd9e8..9e714f7e7d47 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-node-close.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-node-close.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with closing brace not on its own line
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-prop-order-device-type.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-prop-order-device-type.yaml
index e2c69e9ff452..c71fb2c0a3e5 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-prop-order-device-type.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-prop-order-device-type.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with device_type
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-prop-order.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-prop-order.yaml
index 75582a3d2f6e..bf1480e97209 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-prop-order.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-prop-order.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with reg before compatible
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-prop-pairing.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-prop-pairing.yaml
index 767ab21c39f3..51abc540af11 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-prop-pairing.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-prop-pairing.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture exercising <x>-names and pinctrl-names pairing
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-required-blank.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-required-blank.yaml
index 8bb53240cffa..0036d5e0c4ea 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-required-blank.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-required-blank.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture missing required blank lines
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-tab.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-tab.yaml
index 487d07ff8cb6..937ecdd923b0 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-tab.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-tab.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with a tab in a DTS line
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-trailing-comment.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-trailing-comment.yaml
index 2368ada8106f..695d046e8454 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-trailing-comment.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-trailing-comment.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with properties out of order behind trailing comments
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml
index 5c4b4bd833c5..f338c14174e6 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-trailing-ws.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with trailing whitespace
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-unclosed-comment.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-unclosed-comment.yaml
index 63c1c08712a5..191ed775384b 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-unclosed-comment.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-unclosed-comment.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with an unclosed /* block comment
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-unit-addr-prefix.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-unit-addr-prefix.yaml
index 9b3fe508c5fd..62590948d2de 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-unit-addr-prefix.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-unit-addr-prefix.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with 0x-prefixed unit address
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-unit-addr.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-unit-addr.yaml
index 93705cd45410..5bb19fba5c19 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-unit-addr.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-unit-addr.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with malformed unit address
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-unused-label.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-unused-label.yaml
index 28d7176cbf08..7f862ae5a175 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-unused-label.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-unused-label.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with an unused label
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-value-ws-multiline.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-value-ws-multiline.yaml
index 504bf0931c27..1d7bc8142fd7 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-value-ws-multiline.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-value-ws-multiline.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with extra whitespace in a multi-line cell array
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-value-ws.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-value-ws.yaml
index 342ab9f399f1..a5082a158155 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-value-ws.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-value-ws.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with extra whitespace inside <...>
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/good/yaml-4space.yaml b/scripts/dtc/dt-style-selftest/good/yaml-4space.yaml
index 1502f803c24c..b91b8a8a9512 100644
--- a/scripts/dtc/dt-style-selftest/good/yaml-4space.yaml
+++ b/scripts/dtc/dt-style-selftest/good/yaml-4space.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture for dt-check-style
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml b/scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml
index 2e7b8582bb7c..8463075f9f4c 100644
--- a/scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml
+++ b/scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Test fixture with aligned multi-line property
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:
diff --git a/scripts/dtc/dt-style-selftest/good/yaml-tricky-parsing.yaml b/scripts/dtc/dt-style-selftest/good/yaml-tricky-parsing.yaml
index a836d5f36b93..a95d07f883ef 100644
--- a/scripts/dtc/dt-style-selftest/good/yaml-tricky-parsing.yaml
+++ b/scripts/dtc/dt-style-selftest/good/yaml-tricky-parsing.yaml
@@ -17,7 +17,7 @@ description: |
       not leave the parser in block-comment state.
 
 maintainers:
-  - Test User <test@example.com>
+  - Rob Herring <robh@kernel.org>
 
 properties:
   compatible:

-- 
2.53.0

