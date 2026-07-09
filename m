Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922404195A8
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 17:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783618896; cv=none; b=pGng7rmUmSDQ4Q44ip9/zAZ/dih/yu44R32Oh4qOk4tOI5+oZlmlBv9kEr+d79X9q0xDMwi+RUg6xF/3Eljv6TMF7t5OERDtupvH7xjjnH6mg3dmOId1TNrWLeQxLI066/GJdOJiDMDa6yjFJTH6LEWMamKieBgkSV8B35qi434=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783618896; c=relaxed/simple;
	bh=fxLScoOrIbdNrMXSMmr/1tfF2TTBxWKuffaW93YxnMQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=h9TxqPwgOVMnVqt90mIBUvmpgd1xROrCv9xvoXSj4BGN0dwxJHRj4zVqCI0sgM/BP+jKOaz01EqOoLZUFpVfFnh6T84pLPqkM5y4OBczdILH+uxeggcayj2lnP7TwhHWqtlAolCx7KXCrZUR9Z26BOtXymtFzQZi0TYy51G5pW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nG26HqM5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j5z9Yk+i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nG26HqM5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j5z9Yk+i"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXP8j2298365
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 17:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=K8ZIqcAevVB9avGLB9RIfK
	4e/rbszsTcXeDCjoxQ54I=; b=nG26HqM58dZqCtsbCF6l9AJam97kmbuqyR7WB/
	lBWeDAKwebT74YAXl1tJvaVAx4HqXONh67C8looENykmbBhnYBx3JSPBdzMcoYKq
	vuKqtzjqQ7ht8IsMtnIvybpyuYSUtoH3R8k2NH8uASwLS0yeO1XCxU/cSTMW+evk
	QOYWQ2NhmsR0pDZ7aLFM9sZmwnhqBQ4/caRw3tTq2ch8eWrQmot9B9/l/KpfGHmc
	a9d0Trr81Hnz83ax4s12KAAIbTw41X21LfazVVNTKQYygpFzt+nO3CT49MxmZGSi
	Y0DBknvG3A2XQPe6L6jFhaOEM/pBSrA65xgIaUmrXhU5oXVg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vkf6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 17:41:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c083f1818so547231cf.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 10:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783618894; x=1784223694; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K8ZIqcAevVB9avGLB9RIfK4e/rbszsTcXeDCjoxQ54I=;
        b=j5z9Yk+iyr+yB/8Sw2oD1GSTAwPVgtkPMonbeyaUOEIXKBKQYSBlfBDtNdJtmZKv3u
         cmZ9JQTBuAmenpUen0+TYQeQDj6pOsP/GAx92lzxphQYI++AmYszCbaXUq8AoBoITX3m
         3XW5RGwOzSpzzr+kLik1NfP8krT1BSrQV+WzZCa8M7WRdboqv5XQhgJpotKQfG6CUTuv
         dH+ws7bqJBXfz0zXURLxh2ueUATLblT8hURfp+WZxeSnkw3knXPn5/d8qjXND8GhqrZ8
         dXXAXe6s1lylyG24KHDi41GYdaDraqdtQN2MikT4oeFA+2T/iDq6chyn+VcakMW43UKd
         HKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783618894; x=1784223694;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K8ZIqcAevVB9avGLB9RIfK4e/rbszsTcXeDCjoxQ54I=;
        b=ixzBRfp9gfQ6gv0vmPTYE/z1UTdUc7iUQId+nkYTHbdUvnZCI29HaY6mR9NymGq7tC
         Pf5u+5ajQezRNF04j7WN0YFWGKeV9WPpjnVaK1kjjZbHSZ5lrFPJjwCmoB0AY/hGDuhl
         fjN3t2YrvCah+FLETyWwL/l/K9H19updzErjXus2F+kvrQ0n0/PY/XnpyQehS4HWqIL1
         10Pf0Dlm241mgZa9vpC9mA70pg+sFe2M8C9spGZ8NGSF6JuUxytRQ0skce5/gFYUc1Tq
         OKTD22Edz4EvkgsREj01DyTn3kWqn4cJX1uGn82gbYxGMb56ElZAHOUdGe+SjSuE1jVR
         mtyg==
X-Gm-Message-State: AOJu0YwmhqwNhwVIiJfm5pACzaE2er1/N2lcLPCq+Lw6BOqjYaf+SfCz
	ZUyQJ8aKFqIKC8Revi0HNz2LQtdPxqpqI705BDpEApd1wIKlZ/AE6nfkhesdqzelZMiNbFWIXlr
	+yFwutB+mdpkgmZ+sVsjqbSHpkV9Tjm06a6K2oJ4g0kGWnsajGYjff4wfrKj0Dmc9
X-Gm-Gg: AfdE7cmmim/QN1uEzzAaI915G7AySHLzriSbESd5m4AnU3+rG1q8KcIiE395JeRqobD
	uyIOvqDKupUX6iH4PvyILSF8cUybJx4Wjj4CcOhieHApXCJXFigts/Leqzc/9vAtaGdzk5rHlvY
	ibDb4TzBl50Uy1T9aupob7xfbsA8wU0x1Dz0j5mZt081nRFpabPz5AY7uYcjPLifZQHjF7GIeYZ
	zcTv/pYjQSs4mvEBIsGtoFEeOXQrSKQ48zvvdkEO1xatNMwaa3cGVDM8SYqzEnLh45++sLa5Sz6
	R2QorKnN4HXOS/tpkGXJIvqdE3liJNlUC2lYGj6/pAtsJiESZghiZr5+WLrEw72WJd8OuV8B0LH
	Ld75X4moBvFonX5KIou3ZqxiTl5L+Xh5M
X-Received: by 2002:a05:622a:1249:b0:51c:7b12:5ff2 with SMTP id d75a77b69052e-51c8b43cc8cmr83218721cf.78.1783618893817;
        Thu, 09 Jul 2026 10:41:33 -0700 (PDT)
X-Received: by 2002:a05:622a:1249:b0:51c:7b12:5ff2 with SMTP id d75a77b69052e-51c8b43cc8cmr83218421cf.78.1783618893285;
        Thu, 09 Jul 2026 10:41:33 -0700 (PDT)
Received: from [127.0.1.1] ([213.55.184.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039bcdasm55174048f8f.21.2026.07.09.10.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:41:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 0/7] dtc: dt-check-style: Improvement after using on DTS
Date: Thu, 09 Jul 2026 19:41:28 +0200
Message-Id: <20260709-dts-style-checker-v5-0-fcc147cb697d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Oyw6CMBBFf4V0bUnLq+jK/zAusEylClQ6hUgI/
 25BE10QN5OcyZ1zZyIIVgOSQzARC4NGbVoP6S4gsiraK1BdeiYRizImWEZLhxTdWAOVFcg7WCp
 SVvBcqISXgvi7hwWln6vzdH4z9pcbSLeIPgkLXe/L3DdWaXTGjusnQ7xs/5UOMWWUxUoVUql9F
 GVHgxh2fVFL0zShH2SRDsmvKN8SJV4kuUghSxjnKdsQzfP8Ag55jzopAQAA
X-Change-ID: 20260706-dts-style-checker-750a187f41d7
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Test User <test@example.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Golle <daniel@makrotopia.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE3NCBTYWx0ZWRfXwg6VHXiB4qrh
 WlC/i7kDfbW+Yhr6A+JYnmzRBVexrgCs5Zv8gLeRA1o2g43p0T0y8K0sUVqMqpSY/YN4Cn9twyd
 5jobKManICHL0SdXEShkeFlPInn3MibdQegluBSm16tdG0X5+kj5BdvTcz5L9gjIqzaqfp+x0J+
 I3ZrncmBeVYiMbn/1Na8ovi/y/C2G7qI5QZCFNcb/lApvAMed6Pn/4hbXZpT+5OIHJ9bSmQMK/u
 Bz+bymcbFFBHep3MREsywBScnKhqk2quWQENPLT3AAwzm9yC5xQoWAKg7da7RNKw9fPDGM29zo8
 qjN7OBxGV9b40zoeKaxG45Pec/TJIIVjdrkZd7TFYoAqgJhvFUVtnS01Lvz53NrhXBGVaghJwZG
 0jzjh+MkpB6ZhD2pbxhCOqZMSuwtQ4UrLz/VxPo5NXVzJLcKtBKCHnpBhvfFytxNGLPVSkOkdZL
 +AkZzhjwQBPefArxi0A==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4fdd4e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=nvVmADDuAioZMzk/ZEnfEw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=VC7GPV3_BDevQFnqUKoA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE3NCBTYWx0ZWRfX5sZ9t7OTkmeH
 5d72CJt2Q+U2dpctesLSg484xiWNncTIjL4RFLWxuhiyxqTC5PCopfD72YBQpE1y9I7Bq5K1Bj/
 +dNsOSKcUr9BTjZICKqA3rUhRqwrhhg=
X-Proofpoint-ORIG-GUID: BZXhaTCK3np1Uj9wPFG-Qargi16zTUBt
X-Proofpoint-GUID: BZXhaTCK3np1Uj9wPFG-Qargi16zTUBt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090174

Changes in v5:
1. Patch #2, dtc: dt-check-style: Allow space-aligning indentation in
   DTS:
   Handle also line continuations for properties.
2. Update docs, other minor style/docs comments from Sashiko
- Link to v4: https://patch.msgid.link/20260708-dts-style-checker-v4-0-c175e6401150@oss.qualcomm.com

Changes in v4:
1. Drop patch:
   "dtc: dt-check-style: Do not sort top-level nodes in DTS by unit address"
   This needs more work.
2. Patch #1: Rename rule tab-in-dts to tab-in-yaml
3. Drop "memory@a0000000" in examples, because it messes with top-level
   sorting.  Use a "cpus" node to test node and device_type property ordering.
4. Add more test-cases: within existing commits and a new patch at the
   end:
   "dtc: dt-check-style: Add more DTS test cases"
5. Handle #include and /include/ without trailing space

Link to v3: https://patch.msgid.link/20260706-dts-style-checker-v3-0-03ffacff9226@oss.qualcomm.com

Changes in v3:
1. Patch #2: Use re.search
2. Patch #2: Add dts-mixed-indent.dts test case
3. Several new patches 3-7.
v2: https://lore.kernel.org/r/20260706102421.343639-4-krzysztof.kozlowski@oss.qualcomm.com/

Changes in v2:
1. Patch #2: Rework idea.
2. Adjust function doc/comment.
v1: https://lore.kernel.org/r/20260706071446.87669-2-krzysztof.kozlowski@oss.qualcomm.com/

(I was not using b4 for v1 and v2, so b4 diff might fail)

Best regards,
Krzysztof

---
Krzysztof Kozlowski (7):
      dtc: dt-check-style: Narrow disallowing of tab in DTS only to YAML
      dtc: dt-check-style: Allow space-aligning indentation in DTS
      dtc: dt-check-style: Rework handling YAML/DTS in rules
      dtc: dt-check-style: Expect first device_type
      dtc: dt-check-style: Handle properly DTC-style includes
      dtc: dt-check-style: Print proper line number of indentation detection place
      dtc: dt-check-style: Add more DTS test cases

 .../devicetree/bindings/dts-coding-style.rst       |  15 +--
 scripts/dtc/dt-check-style                         | 120 ++++++++++++---------
 .../dt-style-selftest/bad/dts-child-name-order.dts |  30 ++++++
 .../bad/dts-extend-node-child-name-order.dts       |  23 ++++
 .../bad/dts-extend-node-digit-node-order.dts       |  31 ++++++
 .../dtc/dt-style-selftest/bad/dts-mixed-indent.dts |  21 ++++
 .../dt-style-selftest/bad/dts-property-order.dts   |  43 ++++++++
 .../bad/yaml-prop-order-device-type.yaml           |  31 ++++++
 .../expected/dts-child-name-order.dts.txt          |   2 +
 .../dts-extend-node-child-name-order.dts.txt       |   2 +
 .../dts-extend-node-digit-node-order.dts.txt       |   2 +
 .../expected/dts-mixed-indent.dts.txt              |   9 ++
 .../expected/dts-property-order.dts.txt            |   6 ++
 .../dt-style-selftest/expected/dts-spaces.dts.txt  |   2 +-
 .../expected/yaml-indent-strict.yaml.txt           |   2 +-
 .../expected/yaml-mixed-indent.yaml.txt            |   3 +-
 .../expected/yaml-prop-order-device-type.yaml.txt  |   2 +
 .../dt-style-selftest/expected/yaml-tab.yaml.txt   |   2 +-
 .../good/dts-child-name-order.dts                  |  30 ++++++
 .../good/dts-digit-node-order.dts                  |  41 +++++++
 scripts/dtc/dt-style-selftest/good/dts-dtc.dts     |  21 ++++
 .../good/dts-extend-node-child-name-order.dts      |  23 ++++
 .../good/dts-extend-node-digit-node-order.dts      |  31 ++++++
 .../dt-style-selftest/good/dts-preprocessor.dts    |  21 ++++
 .../dt-style-selftest/good/dts-property-order.dts  |  41 +++++++
 scripts/dtc/dt-style-selftest/good/soc.dtsi        |  47 ++++++++
 26 files changed, 540 insertions(+), 61 deletions(-)
---
base-commit: 37de3f626a5094b9f3af93bf4c93a6130f8a8b6d
change-id: 20260706-dts-style-checker-750a187f41d7

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

