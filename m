Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D483769E7
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 06:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788848626; cv=none; b=XObB/3wa9+iWpZMG/GAusfcIhl8aROHD9E7DQBpDuVqF6o3AY7ADkMZjkYa7nSTGmmvIFvUus/dtbVvTyRrEUqsv+GxSGnGiWMJWXKtkekPOjkLL/vCw7PozQPQkEhsstq6Mf0H1sefRBDFGT8OTFcwiaX0Sr6EacHEU/QAsZJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788848626; c=relaxed/simple;
	bh=9gpvYZiiK++7fxFQKJTx+k6/ozmAgJ952XedouNhT/o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LFIT/UXrob0JS84BXnt3H5O3gCxbWBwVqz2LPamCARkD/uSQl7gderxsZ5lXNgnUNPVm7XfRvoPRB0a9xW73fwosw9Ovw6mPKqD00Ev9vbdA35f2IYOZLWB0k8qw3ZQaesq+3NBKAeB1epWhGrlbKwtHoUM+Q3WyndIhx++RTWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0HMIsTW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JVOeiEcD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o0HMIsTW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JVOeiEcD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886Lm3o2502331
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 06:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5LkBz/6+6EbGMarTpjWjMr
	IiSvDbCV1mNMUZslHPIt0=; b=o0HMIsTWgg/AOpgaCl4VuHQB/5sa833g4xyNVa
	prCMDlvSRJi6jgZ+9peM1zoFVbhv2W8NSjh6DGYQQjkNvyrB08fCzGbM5WUXrD9y
	HiREqBAC6d83XM4u4Oq3QFTd9JOq8O83uBW2XAuni/Qb5EewsEsFhkLfn55L5dMA
	ZzOOQVgHG0IfBMccPLa2PC5gwG72S8R3Tg2q7Kgmmh33cYw+AYqmhpq/k7K5HR4r
	XY2cO1KKstv4baq+CtLhFqDpZvOpYy/xuhv2NSsG4oYYMRQahxfyQoFMft+MfjA/
	b7UfiNJtj6SwYHhTUJwTbhJ2GkFAVGFT3wAoTX0uzLapsY+Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcv7g1u3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 06:23:43 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1a439db36so4228029a12.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 23:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788848623; x=1789453423; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5LkBz/6+6EbGMarTpjWjMrIiSvDbCV1mNMUZslHPIt0=;
        b=JVOeiEcD3/zSNbNl7uYA9gyz5J35B/MR6HpFiPU79hEZonwpdkVZaVJmp51zlpqfY+
         867PhQ2l/NxdK+dKa93ssa8YklCKIrhxzp/DoQfJf4F8Cj9sirPP/iT4kBi1bTBOlRBf
         DCT+QTeR8YLAuvEvCFY3qDnGMQ8aomBIT3VcU/4Tx+54MOOJ8yZpEqGQOxJpFnUpdspC
         509cg7Rvz+WZJgRUmc+CB9IInZUkTscKRbiYKK6z2ikbM2CQW71pTEAILPeCIDp9AKvD
         +wVKah9ALzgrsbZgpAex6m5yFk43arxbu9xndEop8VxpqKYCAYxFR9RPqKgRHfSEeOHp
         cgvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788848623; x=1789453423;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5LkBz/6+6EbGMarTpjWjMrIiSvDbCV1mNMUZslHPIt0=;
        b=GKtT/EzQXV61uaBrJrmHZIQ4S8VWSYwm9kQ2AVgud/+tF+O4HYT2Iw/J8ffhLQpLxL
         +Oa9RqiZn/A8Nfh2Dzo1zJceuhLE6LFfe+AuwBw8TUL1cgBL5RPrkVJZXQM7BDMWQG6s
         RGRYtbEiQ6AU54oHJ6RtW3eRrmW/PdsdivL96vnm4nlC7jOV6APUpTOBWciyNi1brw2m
         R0dawoDRNYc/bSVZ6pyYjigAjF7b9D2wJURMWg9ewXCHLbPjiOGYdpmPzj34q0CHzUy9
         R65dK9IiLcRnpwhdSbdAnxRoHZtIq9i3sEjKuYoUc9jeyltU0EmaQyWmYoetkrv9K3bH
         t1iw==
X-Forwarded-Encrypted: i=1; AKwUvByF3GklOV8V3xfx/tdRHMPsGg0C2F10tnAsagAYv0ZSkaiX6EY+2p6+5gMdq7qzHiZyagtJsWUaX77x@vger.kernel.org
X-Gm-Message-State: AFuF++mk73XifIOwI3gN/4XrCZtIgnYL6xPgXU0Jvq84dbK/BSI/2/d6
	BEfl5fYhp6WTFiLZjpiiJ9XPrkt+T/gLgxLSqZcY3RZhSJgTERiedE1NYbzpADCVG726jC2L5vt
	xzHkCzsUg4f70pfVGUOHzq8fjx+9j1/1f02pxR1Q3ug6kARc7mXkmMgk+5m7tKexE
X-Gm-Gg: AYBFou0+swHtK8jZdfbeQlc5hU1l870n63f1gqLsIcbNEVYhs2c6nCkFLoStJzENZhb
	Yu5J/PY+tJZDWRaaKsYkFp2I23kZ58E87tOb0dWTD7JOKzS1tL/B1kIteCP0YHkmTGdI+oQLbLd
	P/ocV9p43X1zP2DyEa8pVILL0ItGa4in0ypTKCtj8t7EU3JkoD5r7aPd39ArR7sAWlbBnim8tC6
	7r92W/DSoBZ5a+8bpkmSOXCvv8185BEDiVhQvnfFqQHn3oJnWkiGaGyAe6xQ0OrKBHnPCka0wKj
	U4LIbs45FS2fdUbWezBtR4bx0L1LqF9iPcSJ+Zk4je1ls3hRX8Je3XvBs3LXOkQM95gEqbXqXkC
	LtEaBmTcpZv1NitfKHAiGR875ptdY9w==
X-Received: by 2002:a05:6a20:e607:b0:3d3:ae51:181e with SMTP id adf61e73a8af0-3da3a16ab56mr42582292637.26.1788848622872;
        Mon, 07 Sep 2026 23:23:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:e607:b0:3d3:ae51:181e with SMTP id adf61e73a8af0-3da3a16ab56mr42582205637.26.1788848622316;
        Mon, 07 Sep 2026 23:23:42 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm26266297c88.8.2026.09.07.23.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 23:23:41 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Subject: [PATCH PRELIMINARY 0/5] arm64: dts: qcom: shikra: add Ethernet
 support
Date: Tue, 08 Sep 2026 11:53:29 +0530
Message-Id: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOGpn2oC/13NzWrDMBAE4Fcxe65gLTmW5FsPOQTaUnIrIQRJn
 saixGklNRRC3j3ODzn0OMzsfkfKSBGZuupICYeY436cQv1UURjcuIWI/ZRJsmzZshF5iF/JbVA
 GpBFl05csmLWGaXRvLdN0+Z3wGf+uX1f0vpy/LF4Xb8/LD1rfyoSf30kq98UD6qo7o/4zwkF7Y
 AbDDbqDvCjeZYiw3+1i6SrNjQwm1FZh1reqqa3xOui29V45roOBAhiS1qfTGfdTAav1AAAA
X-Change-ID: 20260908-shikra_ethernet_dts-0077e847d990
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788848616; l=2801;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=9gpvYZiiK++7fxFQKJTx+k6/ozmAgJ952XedouNhT/o=;
 b=BWNdle9xwzgMQXU+Fng3OrQQKVZCffhPMemmrtLubzjbmjkz1Qo9DHZLLqp+1B7NDbw1dJ/c6
 Feg3lLCRwFQAYAmzRzDFnUFWV/RhMGTbsx0iWkLz4EqTDUTslssilHA
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6a9fa9ef cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EtmUyxdyGpvgt5L2qVsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA2OCBTYWx0ZWRfXwn7/ybyET7dd
 JfOllHgi79ghJqMdJ8+hCuJC95lSA3scosPnb2gn1nMYdMGW4cxSbAmWQOXkLyTy+9Hi6XOLaX5
 xh+7PjMpVJESliD6yNS0utWL7oRU9bA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA2OCBTYWx0ZWRfX4OtAvQDSOmby
 8HsGhbjRQuu19HYW+52LSY4B/yfdm9cU1PGxpLkyhzGKKUjC5R2eTG5yz3rw0FqSvO0m7jp/W1t
 HEwt1dIwGHMRphE4Rw7w2iKpQEXYoa+nboQwdKvI/dqadnhDejOMtSsKbmtiI42r3zrbc8riAJd
 Q8NP0DHl1reCPT8D9gRFA7jM5x6sTk30XvPxRz0dOr8ktYbeGtjblTb/xwob6Qo0p2jmvPPAMqe
 pKkeI0plJbiZ01EZcnZkA/s8LXXk1YCC6ge+rscC67TqYRG25oCOAr8F/2wv2NWBJPANrHn9bEp
 fasvTKYTyWnkelZcWZxgLdVvIEWCGjmGtRNL4pQQg+MFUQ0Hc9A3t0PkUaihZ5yULRpuJL4kVFE
 ltggsgIHxX+xNNsbs1AMMOO0Q/gewVbGPVmzMmT4B69k4BWO3hPQPvDB9C0NrQV77pCYHqV4FY8
 YaLhTRZMcEaIUSfh2zQ==
X-Proofpoint-ORIG-GUID: hgTrcxEYOc3Lmrh7yMvrH-VnVNLQocpm
X-Proofpoint-GUID: hgTrcxEYOc3Lmrh7yMvrH-VnVNLQocpm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080068

Hi,

This preliminary series adds the DTS changes required to enable
Ethernet on the Qualcomm Shikra CQM, CQS, and IQS EVKs.

It adds the two Shikra EMAC controller nodes, enables the first
Ethernet port on the CQM and CQS EVKs, enables both ports on the IQS
EVK, describes the DP83867 PHYs and their GPIO-controlled 2.5 V
supplies, and fixes an incorrect GPIO reservation on the IQS SoM.

This series is functionally dependent on the driver and binding changes
posted here:

https://lore.kernel.org/netdev/20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com/

I am hoping that a preliminary DTS series makes the review of the
driver, dt-bindings, and board-description changes easier.

Changes since RFC:
  - Model the PHY supplies as fixed regulators controlled by the PHY
    driver -- Konrad, Andrew.
  - Add the IQS GPIO reservation fix as the first patch -- Krzysztof.
  - Move the Ethernet pinctrl default states to shikra.dtsi -- Konrad.
  - Resolve property-ordering issues and add missing final newlines --
    Konrad.
  - Link to RFC: https://lore.kernel.org/netdev/20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com/

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
Mohd Ayaan Anwar (5):
      arm64: dts: qcom: shikra-iqs-som: fix GPIO138 reservation
      arm64: dts: qcom: shikra: add ethernet nodes
      arm64: dts: qcom: shikra-cqm-evk: enable the first Ethernet port
      arm64: dts: qcom: shikra-cqs-evk: enable the first Ethernet port
      arm64: dts: qcom: shikra-iqs-evk: enable both Ethernet ports

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts  |  46 +++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts  |  46 +++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts  |  90 +++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi |   2 +-
 arch/arm64/boot/dts/qcom/shikra.dtsi         | 266 +++++++++++++++++++++++++++
 5 files changed, 449 insertions(+), 1 deletion(-)
---
base-commit: 7042c8c193e5d634198b7c766bb3a01c8e3ee0e2
change-id: 20260908-shikra_ethernet_dts-0077e847d990
prerequisite-change-id: 20260903-shikra_ethernet-ae7bee5e804e:v2
prerequisite-patch-id: 218773849d643c66166408f849566323f3d466c2
prerequisite-patch-id: 8973e6e7fa7b09e09705913a37035c1bff8ad385
prerequisite-patch-id: 6686a8aef5f4f729892d0b3ce2e75816fe874f82
prerequisite-patch-id: 2ba77f9b01c8bf2f22589361e005805c28353f6e
prerequisite-patch-id: bf25cc81677cccb0740f26a4fb3ed8fdd2e240d8
prerequisite-patch-id: 5333cc3ebc07361084298168344d230b234e8795
prerequisite-patch-id: c1ef6e429b44f3227554e8c50cc2dc9baaa54cb7
prerequisite-patch-id: 0b2817da8c502234bf2867f9985f488389c519fa
prerequisite-patch-id: f5716827eca798a78fea6a40b3097e52c14c1e81

Best regards,
-- 
Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

