Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20E33D0900
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 17:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491842; cv=none; b=Kzl5mZzVCCEy0S2afbBmc3EMlgguiL5nMvVKEcCfjqjgIPjB50lHi4aHNaEKJT1SarRVvQaD7obzTPY4Bkim1CRIm2DcyIaGo2oJ+AG90E4CLDxqpvFj4A6xfHTIopTF8o0fzjG9YAYk0NmIfBNbXGsdig3R4/NJwdz8TE6pCnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491842; c=relaxed/simple;
	bh=ZsTLVmYcJfwJ+LUNxUB6e0SUE7Q4keZTOI6dN7BJC5A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WNfUOi3masUIdiq5Kl/bIsqHAhtY0DIafK+3/LewC/ztt884ZDR4wMhXdXuo48zbwPj4iV707DxFXcwgjlxWGURX9mLfyo284c7CZqZPe+OtdG+96TfxSWgbtnhbbzjlj8fCQpAEr8SpooILugFfn2OECqyu6jgJnQTV7e3C8UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OQasOg43; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JMnmOKOD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OQasOg43";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JMnmOKOD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAT18290995
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 17:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=X5jxlx/AHYFdWLiHbInnDS
	JvTQk44NPWUfwCjyn65sQ=; b=OQasOg43werB31lcwuYqcSocWb36zRqC9b1OEI
	kzCp838v3KG6dmZCMmG1FnONkFJkWxx91Gx/BRG5jWxg/GwL5J7UNLhvs1LiAaz9
	xmD/uzJEv6oxhQGKyZ7m268VeETVoalX9F2PP3fdwsWUTQWkZ7kGHx5/8QgrY004
	i8EOL29q+PIlpeLmtCeneGLZofSN6+d1GGHEooGWDhm5zge62F2sSBFknP958YyJ
	X2SepOjAa27YrWVipSZ6ukJbii0usxeUmfo+GnaeSuHiuxLD40pCUlepfPCFBy35
	dLjDGU0MmTdb93KWzJH7nd5Rbz0BAW2mtXv1+iqYpFsBqH9Q==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyux33f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 17:03:59 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97c3796d17dso771468241.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789491838; x=1790096638; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X5jxlx/AHYFdWLiHbInnDSJvTQk44NPWUfwCjyn65sQ=;
        b=JMnmOKODmZUuGVfjEYmDEluVXRCdZaqBvU2k3kwLeaQ7J9KILVBJ7eOoHVLeCzwMul
         iAsRRaXcF9TvmcI8lEwr/Nq07j9DyEMulkSbSeQQ/O3c0oWYpzl1nSAZ1H8kxWL2nMaP
         G/eq01Y1/lqAJBunbnED2j2OdVjSk4zRD85r2wEq21yWIlEElwnplN0zibPxS/vBga7I
         f/SbCaMOkspM8ASBujxJKgvntmF5cPDU0oNSJKpFkKICpYtv5IvFud9fzgh+bcumM/92
         KWGeVmQFmucmYIOr4mVb34WAoMnGW2sr5o8Yne41EqaMNWnA+oAnk/guR4XWkj27daGP
         RXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491838; x=1790096638;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X5jxlx/AHYFdWLiHbInnDSJvTQk44NPWUfwCjyn65sQ=;
        b=koNxDvtTIyZREuYbE6H/OxV1Y6tM14UYEGom/2OgljBdxUc88A+Tt+bmF3gC9RX1fV
         FzFSX+PbqLp/9MPdZqxvFFEx1y2jkk3ETPpc4H5UEVGv0cm74PNpeJk89TFjR9zgi+WW
         JZkhnjCE6+rxe2c7nqPREhVHyGxQiKHJ889XFsUs3TVTfgtmIKtSzAEA6R/nzDIeDYQY
         if9vwZfoiqufOGWsW1tbmrImAysMHe1ZCmyXbNpkuu5MaD2dK26LQa55aZvaZ7Qq686v
         hqum0uadxBJxhJrzQ+Noxq7W7OpFNAzefuenEzhm3e3feFR1fB1CvpEcMtEJVTB2Povm
         lf0Q==
X-Gm-Message-State: AFuF++nroSfN6wiJkzNYVG23jZYexl5XoCXQHbeU3B7rgI+A5kcfsd/V
	tCicw7WYiEFbMkOFzskRNyrgoQouqx764vyoPGNrezlrcowo9iPvS+jb3JF8LvTQMBIogieTwy+
	Z+YsJqVXEkCKWgsXKCFGLk8osQ2bQ/54TxehKt/Kj1kODU8aJBojiGUosTEfWDfxX0gHWbUqD
X-Gm-Gg: AYBFou0ST5vFqdo6e6fdttMv025v4hB0QnKEBkcjrl6hDI8J78Wt2OcpJBCeqHtZnJx
	nwr9ge2Zi6V8HShnQfzpqx4j5fFgcMzapbYiOJgFGxWYxX26Vz+MB5gBIuzsaSGdwSp3/KarGq0
	SCFZNFoovq++d5rVrQKqp3rp+FA5DNwkHTieovnfsgfkPHvtXsmWW6EUdOkrNpDmlaPpXdXBfjD
	8t0RI0lm2xL3g1pheeWjCR1eDc8WM2qv7jn89SMxWrKRWHXtRP0AofuiuIlborAfcjpwjjGlrF+
	kzV6r0c8WAc5dCPKyPmOppeOHBUFfMCpxKzQU3J2XUhUWtNO9rcrIm9dttOewr978/C+BFSnB+y
	B3EmejegukXlZF5LTTKjOG6A=
X-Received: by 2002:a05:6122:50d:b0:5bd:aba5:3830 with SMTP id 71dfb90a1353d-5c981884dedmr11769312e0c.0.1789491838485;
        Tue, 15 Sep 2026 10:03:58 -0700 (PDT)
X-Received: by 2002:a05:6122:50d:b0:5bd:aba5:3830 with SMTP id 71dfb90a1353d-5c981884dedmr11769220e0c.0.1789491837987;
        Tue, 15 Sep 2026 10:03:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27df9sm391286f8f.19.2026.09.15.10.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:03:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 0/7] dtc: dt-check-style: Improvements for handling
 continued lines
Date: Tue, 15 Sep 2026 19:03:44 +0200
Message-Id: <20260915-b4-dts-style-checker-continued-lines-v4-0-5b8e09b11ef2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/52OQW7DIBBFr2Kx7kQIYxqy6j2qLmA8qWkdaBhsJ
 Yp892Any27azUhf+vPevwmmHIjFobmJTHPgkGIN+qUROLj4SRD6moWSykgrLXgNfWHgch0JcCD
 8pgyYYglxoh7GEIkBzd523qHfGykq6ifTMVw2zfvHI/PkvwjLyn42Mp2n6i+PmvCOqyCdTqEcm
 kiXAs8NWqyIIXBJ+boNn9X28beNswIJ2KHXaHvrjXlLzLvz5MZVuqtn88ztf9htZetX7X2rtKO
 u/YW9LMsd5a3GvX4BAAA=
X-Change-ID: 20260909-b4-dts-style-checker-continued-lines-c6895bacb860
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3215;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZsTLVmYcJfwJ+LUNxUB6e0SUE7Q4keZTOI6dN7BJC5A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqXpzuQNGu1e0K5nAZIlQQxKwOlQEJWQk9RWVY
 7U+dqtIhxOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaql6cwAKCRDBN2bmhouD
 17rRD/9ayDk9/qzPMrCY07LnxJUzTybPb+QnfTUMPi+KmbSx54e6c1D11xzkXRq82rsOrr8ZGsu
 eIN1S2sjZmg5/5L9URivUDcLSx3GaEecBPGZ3IPrQnShmi1kGqJ0JRj/DEoBmMevGJuDBlA/S+5
 F7gro65ARQpIC4q9AieOzIDdNn7LGqBm03ZIHk4TDBbb7SzB9oRR+j0FR6CnDZ+Mrh/JZ6WK18Q
 TwaUDSHxgRfb0LmCT6GDM2kyt64zP4kM7MFbXb5p4QByoKzrpKGBObAafXMHm93cmZJp+h+301+
 COqKxabISd93mWbxqfaSG2QdnINvKI940t7E28aNIixkd2iPh8gM0MoaJcLA2nDHhdmT6KSRShg
 9Ofhn4VvOiJUSs0EWIMdmaK/6dSL1ZvzVJSbtcn5aIbwUEJC+WYZBHnVEj3DrGXMj73GijiwJIi
 6Prg8P2ybyoMRpYwjW+QiC2J+pnmkQPEdh+oLccAEhi2GlIc2XcuROa8zDyzz25eRys2nwr3ZBE
 DLVtraktjxB2oCtkYYZYnG97JWSvzffbEhtl5t6e5y9dELWG4jhijtHXxGNAZHY7S6hUSqrn3y7
 W2xMU+JM1sY08cotN6urrajJtJbwahGkztfsb3b5BQ/zP1wLJfdLHPPLPguIHPhft+/sJdd5uK7
 9AJUqMYANb6LvCw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0OCBTYWx0ZWRfX8XJAWhPDoYD6
 22we87DdiN2PGlimjIPD5x+tErQOiasov3SFVGWtL1Md2inYFPACuHg0e+WMa+Nuc7fgOXThBOf
 4NBy38KG6S4zPFVcAZXjjkEUGLbsnL0Z4PsywwiM5ISLFFsiDI8YogusNnIftNhuCgiWFrCUF1l
 YYH1Ykc9Zpeh/2kDgUXeW6lMkbkoebI4+R5DdchH/78HVjmyRevqYNwMs9lWMkCXvlzv1KSDy85
 QsD3Y+wFKfucU/rZk7HWzTHW7FGEwtUmetEkXskTE+rtQcqVVm/mg289QcpUwPlOvLRMY6XgfH6
 f56kWwgPXOh/T8SnWtsB3rPSpIZ407geE+8/bvLTOZmd0XzqpcU2rtqPUpum3vXKG2J8lxAnuPP
 9dIxMVa4UE2jLXqGoXRqTU45SJl/2ivDqeA8aC+/tzm5faeQxjQHhQESS0VpHVcNI9Ndcu8WRQM
 SuYc5z5idccfQF21Njw==
X-Proofpoint-ORIG-GUID: m3Hw80cVe63dnddMhmeqk5pLja2hGhG7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0OCBTYWx0ZWRfX89HL3AYwQSZ/
 myD2swYotj1dKNHsXdi217GxbG1ZVhRGqe8FqPdSyBqvFiXjRuNG5r0S9tqaypHNw60sb9y809q
 2rpRJNPOFafYn1NA69Jd0vr8TbvvGQc=
X-Proofpoint-GUID: m3Hw80cVe63dnddMhmeqk5pLja2hGhG7
X-Authority-Analysis: v=2.4 cv=QYLzLcbv c=1 sm=1 tr=0 ts=6aa97a7f cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=A1gXvU92uO_6QKaMkjcA:9
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150248

Changes in v4:
- Rebase - drop WIP patch used as a base by mistake.
- Link to v3: https://patch.msgid.link/20260909-b4-dts-style-checker-continued-lines-v3-0-474bb324ae53@oss.qualcomm.com

Changes in v3:
- New commit:
  "dtc: dt-check-style: Relax property ordering rules (drop alphabetical)"
- Improve commit msg of "Unduplicate checks in
  check_mixed_indent_chars()" patch.
- Link to v2: https://patch.msgid.link/20260909-b4-dts-style-checker-continued-lines-v2-0-c5cb4c9d9b66@oss.qualcomm.com

Changes in v2:
1. Four new commits 1-4
2. Drop last commit
v1: https://lore.kernel.org/all/20260906180437.166760-6-krzysztof.kozlowski@oss.qualcomm.com/

Best regards,
Krzysztof

---
Krzysztof Kozlowski (7):
      dtc: dt-check-style: Handle continued lines in check_hex_case()
      dtc: dt-check-style: Handle continued lines in check_line_length()
      dtc: dt-check-style: Handle continued lines in check_trailing_whitespace()
      dtc: dt-check-style: Unduplicate checks in check_mixed_indent_chars()
      dtc: dt-check-style: Right strip whitespaces, leftovers before comments
      dtc: dt-check-style: Properly detect comments in multi-line properties
      dtc: dt-check-style: Relax property ordering rules (drop alphabetical)

 .../devicetree/bindings/dts-coding-style.rst       |   5 +-
 scripts/dtc/dt-check-style                         | 240 ++++++++++-----------
 .../dtc/dt-style-selftest/bad/dts-cont-align.dts   |   1 +
 .../dtc/dt-style-selftest/bad/dts-line-length.dts  |   3 +-
 .../dt-style-selftest/bad/dts-property-order.dts   |   3 +
 .../dt-style-selftest/bad/dts-property-order.dtso  |   3 +
 .../dtc/dt-style-selftest/bad/dts-trailing-ws.dts  |   8 +
 .../dtc/dt-style-selftest/bad/yaml-cont-align.yaml |   1 +
 .../dtc/dt-style-selftest/bad/yaml-hex-case.yaml   |   5 +-
 .../dt-style-selftest/bad/yaml-line-length.yaml    |   3 +-
 .../dtc/dt-style-selftest/bad/yaml-prop-order.yaml |   5 +
 .../dt-style-selftest/bad/yaml-trailing-ws.yaml    |   5 +-
 .../expected/dts-cont-align.dts.txt                |  11 +-
 .../expected/dts-line-length.dts.txt               |   1 +
 .../expected/dts-property-order.dts.txt            |   7 +-
 .../expected/dts-property-order.dtso.txt           |   7 +-
 .../expected/dts-trailing-ws.dts.txt               |   1 +
 .../expected/yaml-cont-align.yaml.txt              |   3 +-
 .../expected/yaml-hex-case.yaml.txt                |   2 +
 .../expected/yaml-line-length.yaml.txt             |   1 +
 .../expected/yaml-prop-order.yaml.txt              |   1 +
 .../expected/yaml-prop-pairing.yaml.txt            |   4 +-
 .../expected/yaml-trailing-ws.yaml.txt             |   2 +
 .../dtc/dt-style-selftest/good/dts-cont-align.dts  |   1 +
 .../dt-style-selftest/good/dts-property-order.dts  |   3 +
 .../dt-style-selftest/good/dts-property-order.dtso |   3 +
 .../dt-style-selftest/good/yaml-cont-align.yaml    |   1 +
 27 files changed, 188 insertions(+), 142 deletions(-)
---
base-commit: 2b74cbd61ba866a42f7274bbaca27d59998bdd2b
change-id: 20260909-b4-dts-style-checker-continued-lines-c6895bacb860

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

