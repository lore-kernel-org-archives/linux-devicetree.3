Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934137;
	b=Qbk+k5uLduLVNHV21UJ81ZfHX+65CPFmmmZ3VhV0Z5Ga13ucM80OGBeZShKCv7O8hHuz
	 B5EbQvp/vXJpK7rDibCCtwNdLVGDjaTg/IQ6X5yEKo5BiZT+UQWS6ZK38grMWQoW4MW8X
	 w2OJUeQkbswmoBDZ//uHbu84Zm3PjhAa8HZ7uxIA/cjujPuCly9ZsZP5D4kKtJkrnB1wy
	 pE9mBSiyg+uxAZj0eE8uLZYl9NmYS167CXMT/y2NTEqz3urs0Gy28BXBbILm9R3yvUOZ7
	 UG/XHk3aWKUQdiCRgdiUpN7/aUB7SV2NGlAMY8Izalr/RyN2bJzgoBvkOG4WiGAU6IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934137;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8j3XvDGdW2LdaynxevrBPlpdLDG+c/bQ89+apeYiX/g=;
	b=mDsiGr0VCz0ktzy8pnzkT+l/TGWWu0x71vb39629d+gpOdV+N7SHSw8JeszVJES0ilw9
	 Z209uDRJa59GcJtF9qQVBeKx+3w5dQx7EbUhTQ4kpHBjzx9PFf1I5wdQN62VQn7kAp0iS
	 SO0Cc4JzR7WzuE322zztknDv7Cgv68r/bZzpEJZvmpnvTYbLeMQxerUkUrsCHSlS1jRFc
	 cZwqtEAoBBZ0oZSumzczlMIZ02c/ll4Z4W2i64A5/RwPb3yz1YCQTL9o2Q2A30e80hQGQ
	 W9vY6tRrTlikk3i4CoUheHBNIpWSjM2RtCdIQU4Tr63psn1bTDRz4kT5peFCI7H+XIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RHWtcteQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UZAcDcqX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA5B606A33B
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 03:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CA5B606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RHWtcteQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UZAcDcqX
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5NeOvt1707471
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 03:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8j3XvDGdW2LdaynxevrBPlpdLDG+c/bQ89+
	apeYiX/g=; b=RHWtcteQGaMRU64YkRnqkmV191vilO66tfkPxdKF+xU5483fDKF
	WZS9j5/FskroCvWXB1GiSvDywhNMVLx40cXNau6z3VpqIkfx4KroopaQ4Fdy9UOv
	+vMJBscOU74HXOxilluzEp4OoPluQi6pc6n/mdrmY6O7/tV3dTGMChHd2yZ0qt16
	7I1GCyA8+LSCBsoo13UoXipZeuIO+ADcWrAncMPpZ3XHdA3FB5T6VdJFqW36ZOYD
	S+AG2ARJNu7+NIS3jE5hkzLxT8h5jpAT+5cbzLwaHVI1MCALqeHRIS1DxtxFBjUM
	SoalYoUejOlhyOAZTZeoq5Y+FioN4sXf16w==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9gk6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 03:02:15 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1ab289bb41eso211626c88.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 19:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793934135; x=1794538935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8j3XvDGdW2LdaynxevrBPlpdLDG+c/bQ89+apeYiX/g=;
        b=UZAcDcqXVYesCM9ONw3xM6JzBcw438TjOAas4MGM/nsMj5SIhIbyCpYkfImxuTf5R1
         x1vZpLM2qM/KvyaoXPUYbMV3CBzqDFBSBfVELCnygeSYY0aRCJsJFkL/H8MDbVO8gM9P
         ztTRbQLOBsEo+wU1YwWUznQE6Y4QhbqkyDb/hAPI/YotAA2ttTQp/tyoKccZpCVc382p
         HZWjEAknNn/hC7Fnsub3RHQZIHDB4jvFjwC0v6TQJuUP/X7RW/f2jbhTc3XvExjanvUD
         FtRfbbe2rrz5YzyE1KMlq/sZ1RDXNX66KKJplvED51OZCKaQw7O2sI1sXbYEjIV9QuyD
         hlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934135; x=1794538935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8j3XvDGdW2LdaynxevrBPlpdLDG+c/bQ89+apeYiX/g=;
        b=fQJ+LlUZvPb+QZbzKehk+mYOtCPePnm7eCsKSpf+0tF5GqLzOmJjk+CGfeJ3qrYPLR
         ky/P6nFxpr/9yUUdQRsZ2MAPgEQqQU5uLRLZ3XH4waGzDHxdQnu6bOzwaifHa4CRK3ac
         6yA7Hu/pKSKXxPFOX0otT1DeBUhEMoGOE4+0aLVUIU4mOpyQ0gbjq0aIf7LOIhV3AeVB
         rpii3FKIIln/N7FokWwsR+dWxlllqg1O1veg84TwnPLtuZRQFDRAEOGsWjCsi3eN3Bpa
         Noxc4utSCA7vZ3+eUXFEY9w0+vLPmvKx+47qGh1crdEpVAFt0epP4IQ0865ySLY9tN3I
         xUkg==
X-Forwarded-Encrypted: i=1; AKwUvBzvYK3LfhcTmajUwHW3AMbT9KRXIQzM3fjyQ7ooY2ix2bR9KbSAHbZVevfBnRNMH/SPtt7QmN1bYTDE@vger.kernel.org
X-Gm-Message-State: APuU4Z/AKR8ngfF4lxs5mSWo2Uoq8k5D3VdGUNyGe7aJJTrlCeopJcTB
	ym/uIIXxWkxFoeB/eNmUu2FWJ9YzWPpu8KD98prmlpLXE7vvvtx+u4hHehQLiesKT5piqlou3o6
	wC33pnEYuQSTfaxkSqCHtEle8yAj1YxifAFijoWau9YKM2/aatv+7ar4auEPOtykU
X-Gm-Gg: AYBFou2T79UgdYlBNqggXUYKmsLH/gwB9Y6U+Z4Z7CzM85JQGB78GV0sWsyEqulOb8e
	Zkek7R37nBluMEWLmUSFPdaBM1xhS3zcPQRqnpxLH3oUMedocAveoDioeH96KnhIvmX8mpPDQoQ
	SdfFT1VZcuKAG5GRtKRpu1UIooy0+Kg4/WgGc1oO55oAmUpfpBU3ZCEHr5tcuCBKULdLYF5NKQc
	bKbeDLPyeDP/G3JYMyC6AqoYRrMGYuSwLTlSKNOlijFUpzzsx/a8xPMahXH0R0ld9D97Tg9Y6dE
	9HDNMUiEXlef6rE/pvH1Eb5kfsp5NUIgz+Cr6rFhoG329+reutKO9cokHA2lxRN1a9YXEqAEpp6
	ZD7OikzE1DFb5ty4H30bBz/viOziZyyLhZkgQyLTx+rS+92JKxyyoxle40YCD8je244AOFWEOmv
	eapUBERCl7rwMPSPOwNr95A/i+lSY=
X-Received: by 2002:a05:7022:1702:b0:184:40db:6bb9 with SMTP id a92af1059eb24-1b24f4aa5eemr6003002c88.8.1793934134742;
        Thu, 05 Nov 2026 19:02:14 -0800 (PST)
X-Received: by 2002:a05:7022:1702:b0:184:40db:6bb9 with SMTP id a92af1059eb24-1b24f4aa5eemr6002959c88.8.1793934134052;
        Thu, 05 Nov 2026 19:02:14 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm1484905eec.18.2026.11.05.19.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:02:13 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] arm64: dts: qcom: Add CSI2 PHY common-phy providers for SA8775P, QCS8300 and SC7280
Date: Thu,  5 Nov 2026 19:02:09 -0800
Message-Id: <20261106030212.2811027-1-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 55XqMRL_RxLPMbf6SEAZLk7T3Lb5fblz
X-Proofpoint-GUID: 55XqMRL_RxLPMbf6SEAZLk7T3Lb5fblz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAxMSBTYWx0ZWRfX/jRMWc9MRfhJ
 34chCKoBPdY0poEImSjpMt2tl4hJFCe9BTUZP9oRzmIV7QL2pexKIWxjbBCF0lvYlVzRp+8YdPY
 F/teK+Xh7LSkPCKA3bQ16qt3T7usLSY=
X-Authority-Analysis: v=2.4 cv=XvNvqlF9 c=1 sm=1 tr=0 ts=6aed4337 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TtAy84kTgrs9sRaG4nIA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAxMSBTYWx0ZWRfX+fizl3xfUJ+6
 pKU4bG7wi6OJ8LgU6H8W+dIg2KSc+x+Z6cY57e/GF6oru1/7BceBzmmiNX7jUnyMFGVSIOiXq6g
 YZXhxzPkVqWYAID94gGifauSOUDLpjEQ4YrWukNaWGQCICponMnDB9KUC/xsVxOQH0qjMa/cc5j
 2EfKTCSNhFycrEpQkmds/PtXtlPXOT9saiCaC4UO5Wv6WFVOEzS0wYgQIOi+/zuql6QFUyrwNnC
 sqvg6hRXrjRdiIUaZ/cU6nSCjjjPr8vBQI6ov9X/2QCm1z6vSEnlOhPLcsBUwPw/J6d/CX0adY2
 p+6KpczTUGM5U7eDLVr/k8iOIJaan/pAVYdc38u9SRhBlCIePUzEmvn46j8p26jjXJF0vYJwjvq
 7ZaMLWcJN00tCZ+ReSOkbeiTkTIQpxb8qgHKqKb962JVdJS+KLiKIO60JhaaTSao/THDV7JfnRH
 RX6UH8puYoZznwyLeXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060011

This series adds devicetree nodes for the generic Qualcomm MIPI CSI2
PHY driver on the three platforms whose compatibles/soc_cfg were added
by the companion "phy: qcom-mipi-csi2: Add D-PHY support for SA8775P,
QCS8300 and SC7280".

Each CSIPHY is exposed as a standalone generic-PHY provider node at
its existing register address, with its own OF graph (port@0
sensor-facing, port@1 CAMSS-facing), so that camss_detect_legacy_phy()
picks the non-legacy path once a board wires a sensor through one of
them. The camss node's own reg-names/clocks/interrupts for the
CSIPHYs are left unchanged, so boards that don't use a provider still
fall back to the legacy in-driver CSIPHY handling. All provider nodes
are added disabled by default; a board or camera overlay enables the
one(s) it actually uses.

The three patches are otherwise independent and split one-per-SoC
since each touches a different dtsi file:

 - Patch 1 adds the four SA8775P CSIPHYs (csiphy0-3) as
   qcom,sa8775p-csi2-phy nodes.

 - Patch 2 adds the three QCS8300 CSIPHYs (csiphy0-2) as
   qcom,qcs8300-csi2-phy nodes.

 - Patch 3 adds the five SC7280 CSIPHYs (csiphy0-4) as
   qcom,sc7280-csi2-phy nodes.

This series depends on the compatible strings and soc_cfg entries
introduced by the driver series referenced below and should be applied
on top of it.

Depends-on: https://lore.kernel.org/all/20261105235137.2635442-1-anusha.nandi@oss.qualcomm.com/
Depends-on: https://lore.kernel.org/all/20261102213936.1251316-1-anusha.nandi@oss.qualcomm.com/

Changes in v3:
- Patch 1 (lemans): moved csiphy_opp_table out of the soc@0 simple-bus
  to the root node (a simple-bus's direct children need reg/ranges,
  which an OPP table has neither of), dropped the opp-300000000 entry
  (SA8775P's camcc only defines a 400 MHz rate for this clock, so it
  was unreachable), and reordered csiphy0..3 after camss so soc@0's
  children stay sorted by ascending unit address.
- Patch 2 (monaco): same csiphy_opp_table root-node move, and dropped
  both the opp-300000000 entry and the extra "csiphy_rx" clock from
  csiphy0..2 (QCS8300 binds through the sa8775p soc_cfg, which only
  declares two clocks, "core"/"timer", for this PHY).
- Patch 3 (kodiak): same csiphy_opp_table root-node move; its
  opp-300000000 and opp-400000000 entries are both kept, since
  SC7280's camcc genuinely supports both rates for this clock.

Link: https://lore.kernel.org/all/20261103221026.3662383-1-anusha.nandi@oss.qualcomm.com/

Changes in v2:
- Patch 1 (lemans): dropped the extra "csiphy_rx" clock from
  csiphy0..3 (3 clocks -> 2: "core", "timer"), matching the driver's
  sa8775p soc_cfg, which only declares two clocks for this SoC family.
- The "undocumented compatible" and "camss_detect_legacy_phy() does
  not exist" comments on all three patches were resolved by the
  companion phy-driver/binding series and CAMSS work landing, not by
  a change to these dtsi patches themselves.
- Patches 2 (monaco) and 3 (kodiak) are otherwise unchanged from v1.

Link: https://lore.kernel.org/all/20261017001116.2318647-1-anusha.nandi@oss.qualcomm.com/

Anusha Arun Nandi (3):
  arm64: dts: qcom: lemans: add CSI2 D-PHY common-phy providers
  arm64: dts: qcom: monaco: add CSI2 PHY common-phy providers
  arm64: dts: qcom: kodiak: add CSI2 D-PHY common-phy providers

 arch/arm64/boot/dts/qcom/kodiak.dtsi | 172 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi | 136 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi | 104 ++++++++++++++++
 3 files changed, 412 insertions(+)

Best regards,
-- 
Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
-- 
2.34.1

