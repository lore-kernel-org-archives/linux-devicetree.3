Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3B0398910
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 09:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996153; cv=none; b=BisogQFA3MnjEUbmsZrZtL19icszAOZRvsWcH9OGoDXMEt4z84tdI7d+yTFIAIsik4SjF09JBWzEHeiMVpfEPbh/rJD+4iC+lATd/hNSnsuU7UfDGEL5VYGt8lDUPdb0s9X5/zP4+rDv45dvqODATybzMqoMphcDSJ7onVf32uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996153; c=relaxed/simple;
	bh=eKA0uRMeiYBzZ8FrqLiIcawxeUNdHDbGqu3nsVelPBk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GPMjqnKd4fwyxqyNineHpKHUYxBGks7HR1uZasJjLBvath/2KvcUMRcrCXTcqUbnyWKk55GkvVLXpnvBw0qC+4qlkgnMnLPgcTV80bpAScuHK09a7Ji2KlsEWV0kU4TuKVq7sbitN4EWdv0WAY9GGUY71MCScqh1ipbmS/QwTMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P8+HoqDA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I1djfGp4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P8+HoqDA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I1djfGp4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65985YOo007036
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 09:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9kqHTn3HwlauTP/Mvnc9qY
	JtQpvMhNbtivLTo6vwNmo=; b=P8+HoqDALbmM6lrJAsBlwLuD7PzyBkSN3a7MxH
	4Rb4pUOUEIOJHmlvRsaKlIHz0ZOAX/F4ZV4Ozd5gKQTFAV2q2YI+9MXfZ9DNppD0
	dLpJSH0tvLcP9f5ClT6EPsmMmxyKmRMaXGzgzXkEM036KRX/OvfjhXLn6OPUt7fl
	4CxvK2uvqWirzjDQZ+r/xpepABzRjjX7iS/rEp3ATDXWkcSp49jTF/dbcmgGBPqa
	6YPBNVVk0eymPX2am8dvkxeiuODa7XBPvwcrdXOsdTgv6C1WnC5Uu5fvrPKRs/Lg
	o720RvkGdw4bdeniErqxeFaAJZUrfsFjF9CgdOZvE/NLeggQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0sr8kh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:09:12 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304f23c55b2so5303680eec.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 02:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996151; x=1781600951; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9kqHTn3HwlauTP/Mvnc9qYJtQpvMhNbtivLTo6vwNmo=;
        b=I1djfGp4tY94fnWaDK4EgJ1w6kVfXqFdjPnzvN9oz8P1uA5vGDwISOpbf3wmE2AwM9
         5iM3MvXojYgAsdvASugA5jbqiCc0gFqUeGYxUmAL//Z4goOakCy8z+wp+S/9IUxwmYrw
         qhcNrFJXbSDajuZQKEV9W53qGZlmtn9gCPxOkosj8Hy2bxzrEwWEiHx647LagyNxe7a2
         az4q5IFk8RtObdtrEuAJM69rxi7JPyvoX+/GZe3uwQUBWdXi0hldsz5gamaeTiYWL2L+
         2nPl1VwNGt4DJan5nWDmKBaMysRszTBuliaj8NXQM1m4nCrg2/Tvimie4otpXnyrxDIJ
         nzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996151; x=1781600951;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kqHTn3HwlauTP/Mvnc9qYJtQpvMhNbtivLTo6vwNmo=;
        b=AR+dUVdl5AINVfKm//fr8L+mkB+28grilrnIA42yJItWQiLmSedJ6rYl/bnvy+o07G
         h0OTGAvzFNUe3J5LA4gy46DAJycSnBJH5pvONoJWY3HYfGrm9tfIQw/JppdwMXdgVDtQ
         Ue1bPG/BCdQtoA+6As+HPTiCEugTN0IZFL1qbojcZ8N7AhAXCW7euZCwFnnc/yEDqOlN
         f8VOuKLJFGExvM28YmtVgjPm7/6M1b9VTCFwcNHgHdRR1a4WKrZWsr+iLb680RBdJtMW
         ifa1Jp8YV1IvCxwHczTkNmUVws2wGTR29SYX27HgmuouY7NgkEpnIhGbcSMdHml7OGsP
         q9Ng==
X-Forwarded-Encrypted: i=1; AFNElJ9epButqltKQoPt9pnG+3VVOdmQOA2Nm4UZ+I9va05lV7XbYqG8H4T4pIl9Osca7EhrAOEF78iQIhIC@vger.kernel.org
X-Gm-Message-State: AOJu0YwxS3s225t8/a7YUCXFPNMuS6n2Xcbw0BAMLHWhwBi9gAon3glo
	FS/Jw3FA9s8IgKKlC6Xxghh+4y5n70wUW0XFzm80nyausuqbEd0yYiDGXpcr92pUkW/YhB53RHr
	8ZGJKHWT3L7Z6+eJfsYYsMNy6Y++vIAO7xZ2AgwCWUvY8AXzzjdLYAhWYuw4ws4Al
X-Gm-Gg: Acq92OH2dxtiAKsP8KQy/dSzgsi0l9bkGYSwOwci423DyHXc3NBmMYhxT05W+HLCkaN
	ZkZiylULh7IhqvQ7jsjZhf/+jEXAK9vNbOrccJDAefE2k21AABZCOP1BZxPOT0isBrihoKmyz/2
	kjWnkoBdDJg2Dz/JLXQkQIpblKGeoW4Q/lNMB1GHV4W5oJ19/OfSWZRRtpuPTktF1vcerHx/qfi
	c3orYdThPdeDf+hSqJ4tOlvfzcogRTgzvPWFDhBs4Jk3klN+Fsp85fRanJgtHtLr+KarfJ+Z7EU
	Zz9i9gaySMj5QgGKTWgMy3Q/TgTXiKmpJmaOmD+buB5qLIoTwFzNPRo1h81rxcnS5oXoVZFkzWW
	Xiry24A5Gc+W4K2PD2WXFkxT2JaUhqZELV/rAK21dF/tZ4BYW2LBO0AP5DMl8g54X97Ph8+0WZT
	3+L7pf4tc=
X-Received: by 2002:a05:7301:1010:b0:2ef:83d4:647f with SMTP id 5a478bee46e88-3077b78cf1bmr10329034eec.25.1780996151374;
        Tue, 09 Jun 2026 02:09:11 -0700 (PDT)
X-Received: by 2002:a05:7301:1010:b0:2ef:83d4:647f with SMTP id 5a478bee46e88-3077b78cf1bmr10329009eec.25.1780996150851;
        Tue, 09 Jun 2026 02:09:10 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df102a1sm19356606eec.20.2026.06.09.02.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:09:10 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/2] dt-bindings: crypto: Add Qualcomm Maili crypto support
Date: Tue, 09 Jun 2026 02:08:55 -0700
Message-Id: <20260609-maili-crypto-v1-0-0f577df56a61@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACfYJ2oC/x3MwQqDMAyA4VeRnA3Uwsr0VcYOsaYzMKukIg7x3
 Y07fof/P6CwChfoqgOUNykyZ0NTVxBHyh9GGczgnQ8uuBYnkq9g1N+yzvgYQuNT8C3FBJYsykn
 2/+71NvdUGHulHMd7YoMnnOcF4lTVqXUAAAA=
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780996150; l=666;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=eKA0uRMeiYBzZ8FrqLiIcawxeUNdHDbGqu3nsVelPBk=;
 b=2HviacF2Bp945mv5ccBbzVgys2yKYLPu7Kcig1USbJ05mOHa+uNnyxs9bfNAw6tCxj6fy11gf
 3x4CM02VNsFA+WbCAGzdtMjtbxCIzCknCmkwuijFsRPEIHJrJuC06yv
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NCBTYWx0ZWRfX5J6zdhz7KXxC
 Svu1LJEYVM4jf+BhuSU/EaM3KiqptLsg9PD/ZWvzGxCzdhn3NjvJhRS8yXez9oMRsMMBVLokK2i
 wNgkOlKwBm6EU5ZEN1NPWNik32N/um1QTxKyxZKUNIXPbutylNU8pAFYIKPvHTVABOFT4j4NHdn
 FJBq8W8SETLAL+j+gHu5Fxlcx6vZDPXgfwTh5Z04tbob1QVmLTi4piPPeyXb+eKJW17eBd0pe2k
 6V4Pm2xohJlmKzwWP4y4rvKvdn1UpTGHeuuJLYA0a2j9NvDpxH2sO0rU75a4RvZgNSmIAARMDNW
 nA83wpRwsc3vyI+llgVhNEvk0RrndluN+Vt8W6oUI1NsgzUjvx4Ox0u1lDtsuSqLpqMwHLwDm0n
 MdkrAXYoXqpC6Y17OzICfIanUSpkYOr7Gf6+blTkLaoGNQ15Tvts3BBMpZ6p2qxAkQoGE70HldL
 HccK4WhkvODsWmU6h5Q==
X-Proofpoint-ORIG-GUID: hbsRLGthjDn4KH5R1ak0DaVZXbRu9WuP
X-Proofpoint-GUID: hbsRLGthjDn4KH5R1ak0DaVZXbRu9WuP
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a27d838 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=R6wdMziQwWSI7NrRmIEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090084

Add crypto(ICE and TRNG) dt-binding support for Qualcomm upcoming Maili
SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Jingyi Wang (2):
      dt-bindings: crypto: qcom,prng: Document Maili TRNG
      dt-bindings: crypto: qcom,inline-crypto-engine: Document Maili ICE

 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml                 | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-maili-crypto-5d612f629acf

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

