Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6979A471246
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 13:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785936103; cv=none; b=SBpEgQb0t3Q95b074MF8lQbRtnGHPJg6tNGB/spDfyerXElt3PU/yyYeCWDBL6RMofzF3Ak5pFjKZaClirLZwtM4Ekf/T0zperdlL/irsxlQdY3cHlhmvexcJn3FEuBIklkdg4qMxXd0w4x1m//iq2+tkH9WAvnGdBCJbTBvL+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785936103; c=relaxed/simple;
	bh=Ii734INmYDucUqNJZet8EYTKxL9hlhTP9jhb3RVOPgw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hFhh80/yeSCPEQwHWose6AHGyIB/Wo8K8pA6RvT0Te++l+buJU+gAfNzejQe2yGhVV+wcJav6HSRXqYhT8npzxrfBaVMxgAYNR66ybfzLtoaCVyt+qveCFuojpAeCYDNK1LwvyFw0YGfYDJbOfCsO3diA09aMUTwHtpU95uHZzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fD2REO7W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SfT4KDrT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fD2REO7W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SfT4KDrT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675BvDx52165097
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 13:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ENOTWASodcXENm68rA1IHh5HNGPg76dI5c3
	VUjw2OqU=; b=fD2REO7WYLvbsL4rlFcS/kDs/6Il1Dr2tlFCB1HK+gQU+STOG0z
	HyGh0qfQLURM94d15dTe4cHnlT7tf5vYdMmWWKMH1x4IFvWSXZeyj34lckT1Wddb
	lf058kPo89/p5JXhmagktqXMvvkM81o+CxhJeXwaaQAS0QAoj0D+lKOsmOsxNDCs
	TK+kDf+sZE/uk2DSY5ElxDGv0XH0Uh4iyLVp0oNlOT3/qGrFvCfo76CKWmPBvtFv
	Bf5C7m+c5CR99kF4rNVSEBD69gkiDhHKbiEpknZN4K7PeFwfusAShfmuFO0AAMjw
	BCTTtjdj4UKdf9bgFEmF/1qyfQUYzXYTCgQ==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuwbqt9xr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 13:21:41 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4412c255fd4so477151fac.3
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 06:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785936100; x=1786540900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ENOTWASodcXENm68rA1IHh5HNGPg76dI5c3VUjw2OqU=;
        b=SfT4KDrT3bXHrTmYGKWKN3/b251qiYUMMCBTVyvIwOJRwWGnHgKnrJdnT4CauWOT0f
         Wg1JXOp43cnCjttbF2AxIv6A+jelv/h8iUsFAzilQdbsw6vcDyKlZJ2gQ2WPMV3JBQzr
         ioa3Z1dMJItfPmqNYvrvaBD3lgkQA3wtIW/76P3oDvwwzBSFCTS3HdPNqjNYiPifU3w8
         TURdNdtGubrFHfcztnqQZS1fTzTBdFZTGAH6cxp4fi/tezfRhklVB+ipJ5ybHLHha0hr
         3mhR7m/p9PSPC9BALugc8Q9/DhYj52AE73yqptLjxlsMOhkmnxuMprZChtjA0UKhlrAg
         ibVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785936100; x=1786540900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ENOTWASodcXENm68rA1IHh5HNGPg76dI5c3VUjw2OqU=;
        b=hoGi8WGqWF/5WqUQ8qv1Juf7MyRFlhGODYUv3lY8/Iyy0zygZJIOTFaH7jRPT4khZo
         uzzLUr5q8OuLWvXrogclVswuH4ciHSnQc1h9jsCFwwD4ho+uDqfBz/h9QLzjGGiPc1ty
         7u6wBJcChYgFqyO3IakqulqngkGsqN1WOeFz8iekGtqXZehVtywTLw/GlHv9+QVolhxI
         yNfcNSu1Db92ApEKLDGKR7jz+TGYXKzg0UY7JM6LBKLxshiOfUre2VBj7xrXzZ1xjHvt
         F9/Km9QRXJT3uK5pOJDnAU7QglR9zlcJmq9GXJg6GKNyl05At+aSR7z+JNPKyHZujKW7
         BqJA==
X-Forwarded-Encrypted: i=1; AHgh+RpRMlIVl/ENAJO7P2KJRilUrYvyg/egzHk8YhLHUdB6JC/Hxgwmzadbc3AD6FylSNIdQXdy7U9gfxSJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwWRqxR66c02yN9ZoctKk18ru+rqqL8Neaq5KMjZZ50S60cN5HH
	A0fFFCdktTjLjhw7PiE+Q6J/WoYNMwBS4kW299pqQYkfol/pxTBCzj/ChtpgkChe8uZVMZKAruF
	/2vQ2webbKB3+awpGcmivC5DoDHsQMmFWv7f5OhSnz6t4JybHtCIoi6JGkfmZiW6K
X-Gm-Gg: AR+sD11U9kl0UpTCNIEXDO6zC8jIGUdLcBkaKCiJ35DzYASK2niKYv29enutXs442oi
	Vi0OF9XHeTCBdINZiWb0picvydtIR6r8xc8mlS24SZdPwHa0/QSJzIkSuRyaRaNvGU49EpXhwhZ
	lu+GtS9nPDwq+YHOONNQFWhRATXPJchg5DsrzniSH5hxJSWTsM+CehxDJ1uNv3wAkO0x0ihm3fM
	fZTelYt7RL3awrnNY3sA5DKTktjMtwyCq9WzsTSIOGquD91/gGxQqcp9sMvH2U5sohkPVyIrSNb
	v+i5/c7Eck1qdivlzQDzK441CxkPd1k5/xMdlsOMW51SA8zuuwpBunmD8EdIKxqV4S4+zXhZybb
	6a+DUf2F8tswYw6nmPKzGShQ1EA8=
X-Received: by 2002:a05:6870:84c6:b0:456:bebb:a894 with SMTP id 586e51a60fabf-4599ecdf934mr3339910fac.8.1785936100214;
        Wed, 05 Aug 2026 06:21:40 -0700 (PDT)
X-Received: by 2002:a05:6870:84c6:b0:456:bebb:a894 with SMTP id 586e51a60fabf-4599ecdf934mr3339882fac.8.1785936099574;
        Wed, 05 Aug 2026 06:21:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4599e63d64asm2412596fac.13.2026.08.05.06.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:21:39 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 0/3] dt-bindings/dts: qcom: Consolidate SDX75/Hawi/Maili MPSS onto SM8650 fallback
Date: Wed,  5 Aug 2026 18:51:26 +0530
Message-ID: <20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _7OYGzqTfU6YJvfjlrqKdJgTbR_bS9Su
X-Authority-Analysis: v=2.4 cv=B+uJFutM c=1 sm=1 tr=0 ts=6a7338e5 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VrFMkTrUw34MRuZEs2sA:9 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-GUID: _7OYGzqTfU6YJvfjlrqKdJgTbR_bS9Su
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEwOCBTYWx0ZWRfX67dsuiI3FUSD
 crVbjf331lZTIyjK3Wgj/G1MglcOUgcY5SZrtxgQlL8gKycZPmngjNwiraQfDY6yIAVZu+JxPj+
 VspJkQ/7EuIqrIpdZIiWn3PXVCgHOZM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEwOCBTYWx0ZWRfXzzyHTeenei74
 EL4wsYrnrHMcSYnWxWwyk9wqbsGpCBzoe9Fnz+mGw40PugAr9t+xt2jp3bUEYsLg6Vzs/U/J4Zg
 j6sqC59NVBW3vC3TrP9aW6q79tqUZf7J4JuvYeVxc2S8jHYfake1qsj5vqnuCgu8ZnqZ3Ipx2aJ
 hksG6b96sHzjuIS+HBuqs/BTVT4p/EqJtOHUpJ9JMEsJHW6QCIPusUIpGeSVHzuzs0KfbA9xLrc
 52XieuIQaMJaf/KiIffVmM0Z4/ELuOcowXnbRXTl12rDDGycuUB1ry+7n2yHWfzjMdqfU/WSQ8R
 DfZOE1pCFIgjp3hnbDQKQsd/P2052xvQgQ7NruJLnOsAoObDTJmU6++XVPdPWfn5XCtxDuFdhYr
 YWfbilNmtzHLeXLNXe8RzhTd7GIT8/u92ysz7S83bNdG7HvPiMC0yRxGNW6S8toPh4eDBCMfIhI
 HTlGN2m0NWcStg0zKjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050108

The MPSS remoteproc block on the SDX75, Hawi, and Maili SoCs is compatible
with the SM8650 MPSS - identical interrupts, memory-region layout, and
power-domain topology. Today SDX75 and SM8650 MPSS each carry their own
standalone compatible and are repeated in every "mpss" allOf conditional.
The duplication hides the hardware relationship and grows every time a new
SoC reuses the block.

Move the three SM8650-compatible MPSS variants into a fallback items
block and drop them from the mpss memory-region and power-domain enums,
letting 'contains:' on the fallback compatible qcom,sm8650-mpss-pas
keep the constraints firing for the array form. The binding change is
split into two patches so the SoCs with no in-tree DTS yet (Hawi,
Maili) can be introduced independently of the SDX75 move, and a third
patch switches the in-tree sdx75.dtsi to the fallback array form to
match the tightened binding.

Bisect note - patches 2 and 3 are intentionally split
======================================================

Patch 2 removes qcom,sdx75-mpss-pas from the standalone MPSS enum, and
patch 3 updates sdx75.dtsi to use the fallback array form. The tree
state after patch 2 alone therefore fails dtbs_check on sdx75-idp.dtb:

  sdx75-idp.dtb: remoteproc@4080000 (qcom,sdx75-mpss-pas):
    compatible: 'oneOf' conditional failed [...]
      ['qcom,sdx75-mpss-pas'] is too short

The split is deliberate so the dt-bindings change and the arm64/dts
change can flow through their respective maintainer trees without
cross-tree dependencies. Patch 2's commit log documents the temporary
breakage in-line, and patch 3 resolves it.

The driver keeps its standalone qcom,sdx75-mpss-pas of_match entry so
already-deployed DTBs continue to probe. The binding is intentionally
stricter than the driver; pruning the driver match is a separate
cleanup once the DTB rollout is complete.

Changes in v2:
  - Intergrated two series as one
    [1] https://lore.kernel.org/lkml/20260713093237.691117-1-mukesh.ojha@oss.qualcomm.com/
    [2] https://lore.kernel.org/lkml/20260803180021.20368-1-mukesh.ojha@oss.qualcomm.com/

   - [1] was incorrect and should be fixed with this version with
     fallback.
   - Converted into 3 patches.

Link to v1: 
    [1] https://lore.kernel.org/lkml/20260713093237.691117-1-mukesh.ojha@oss.qualcomm.com/
    [2] https://lore.kernel.org/lkml/20260803180021.20368-1-mukesh.ojha@oss.qualcomm.com/

---

Mukesh Ojha (3):
  dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi and Maili MPSS as
    SM8650 fallback
  dt-bindings: remoteproc: qcom,sm8550-pas: Make SDX75 MPSS fallback to
    SM8650
  arm64: dts: qcom: sdx75: Use SM8650 MPSS as fallback compatible

 .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 23 +++++++++++--------
 arch/arm64/boot/dts/qcom/sdx75.dtsi           |  3 ++-
 2 files changed, 16 insertions(+), 10 deletions(-)


base-commit: b3c71fad96372775fa36507a4dc0ed5fcb6e92fc
-- 
2.53.0

