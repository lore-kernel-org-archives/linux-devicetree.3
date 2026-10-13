Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89C248034C
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 07:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875406; cv=none; b=fzLjjjaV5/NiK9vGWWVbzRWUf0kwl3mCIY/cttdVd12/Z1gdbcDiAk61eL7184zvRhmv1UtVLbUtupAWGS0KVrlHosE8Y3RD8vJ0Nqo/tV6iU7EmNl3zdjmVG5TpsHLl+UrhBMomREi6ekTTneTeSZHfe3p8NYXST+SVZIeUYp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875406; c=relaxed/simple;
	bh=nmI30fUqVCpCFxi02t5avDZqwUXNluqW5vIrqB2mefM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KRVVw5UlZ9BAXH1KpxlotnUu9lK5HyJeU5GMtpgfPjeTGDlGuEWk3ffNIX9htdAnCYEHM8SvRuSqqtxTPXejnStzDFJwnrHIm6zAbn7Te/gDtrmdeAOMzFsjewtIYoarB9Nx3S7Jk8XwGaxPz54sc9avxJvJEeJ6jwyn5QtaYWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YalTV4DJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HAf/TM/2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YalTV4DJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HAf/TM/2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D21DJ93054911
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 07:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jTJ7ttvv6RXcjrHzxgguvw
	Xv0PAtR9MrUXhp1lcfF9k=; b=YalTV4DJXKLnh8iH0sMkv0jEn03HirkUNp0ooX
	jpUckRKxuwYvowpKeFQHhT69h0IPk47fm90fDghwUD4O03fMVNTExikcFOUBulLT
	V+B4K2iJngc4IAypjmfSU6bq5iMFW91+eb44+Yb8WbFDmVc3YJ9tk5VbyQxCuJRO
	Qz1+/u1oIqiZcZ4omsPS8CIFmEYk5xaojgby5SfYEZ/A6A6ixvN72e3uGkyYJSW9
	HEutH/3RodjzSYCnTBtOavKwanpkaj0i6XiEtq09ywSzAWEbt0h7FyNteLDHyjtQ
	mt5WBYLXGuyeJWpZIVcwe8hoRI27xj/lMaf1Y3vHST/3o2Dw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aetxts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 07:09:57 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c01f3ae4eso2811671eec.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 00:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791875396; x=1792480196; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jTJ7ttvv6RXcjrHzxgguvwXv0PAtR9MrUXhp1lcfF9k=;
        b=HAf/TM/2CkHrJnjsvFcnmv05Y/LUXYLVlcaGOgeXV1gCBNeHZOisKrcU9JBh2ZHfm/
         kmMDMuWpTewyJzWffZG7U0+eVfAj4AvLHSNPFoKHOYFybpdGZsqbXj5BsfLKafXF9h7g
         JUIAi+KNDwVTESZ92PhvyhX5U50IA7lGfMMj0HbFD0UlKr6hlj2kWCzzBezEkAZTUi/E
         +6rw6JzLkuUChjrM8DoT7xUx1XC+YeFyn20b9ajPxHBHEP5OFCn3LZt8hGIAZzZPiM8m
         M410gqOYhKUoeraJUXP5HHJtTqhLHISElMlyuuImuzPwCpWLuapeW3UelqiYX6eWFZT1
         T2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791875396; x=1792480196;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jTJ7ttvv6RXcjrHzxgguvwXv0PAtR9MrUXhp1lcfF9k=;
        b=F07Xd5/HSVEgDgEuOe7fDPokiP1RO6m2pCq2lFZOxbAPKmAlWCt6OR4SCNdLiLR+fF
         4R7fVw5xcn/kX5lJj9+bcHUURMABv1Tgldk4FJ3qMexcGd1EzyLOH6w6c3kWppBD6kXT
         wHMf0oC4GWSa4KJqgoDUNCz4mgrMbTs8y13SSR7ncZ4SmRH9QNiPAnkIWlCJojoCTTIY
         s3+06IDPRLoZnZicIuRMIMxzOJFbJRDe6u9xYnFAwistrPcm+XTEkzSZ4sPjXSB5V5NE
         JN7Z71rbr0ao5qVJ2fxJI6k/PGjzow0bmx6yVq/216Ldj1iYrpFNRnqlu68CaQb/xlik
         GXxA==
X-Forwarded-Encrypted: i=1; AKwUvBwU6BcuazV/rX3dqDhGQqZNT6+HMbHdKVWUymqq9MTrLjgA4bsnYcHxUsSWSfOJsIPdRQ7FYcpz9Wa3@vger.kernel.org
X-Gm-Message-State: AFq9FYIadyldpjK3apmyXB10W57sm7p2iw+3X5rwAcHN6+OfaZB7MmMP
	W0wRrA8g9BpoIx68Uvf1s5bkRaOIPo04rOEHWoE6Py4BMzGOGDMGOh6JgropyT73UrZPmaSlHnT
	oHobPwaFkDOCFRHhjbgo5COcE8gg6nmcvQnQWN/+TgLeJ58vqVQveiSy2GHzNy+CK
X-Gm-Gg: AYBFou1E/gXt0koEkHnRZPqh5olEJui9Z4gCnngxDDAJzdN1PpJawVl/a1cd5/UEUdf
	RuOA9ik/20awlT0s2FWEiNFe6qVNDCW6fbJOr+KFBAQoNyLUigUV6p3t2HmLd5QooXJYiT4dvwG
	99kvTJzUQO9WBMcrrtAtD1oKuSUWjCSiO+COJ319NCtiI0l2ov6PylJDvQfKez81TpMnMdfa+OC
	krQ9XzM8GYnRnALhGNre9d5Awu5t4Gp2be05dD0OpW4eM8C9eEt2GA/mF+BDB8QlJ1GR3EZbkjq
	tQvT5g6KYx48mYBLXqED3gxlNbjSJN4W8Wzay5XD7XVqt4SMyIUmZBxMixF/HmWD192q8teHla9
	uisy/lx8wUq7sSdcPuiISgeV7PYspGlQN57nEz9peyOT7uJ8AR0+1tlS3STnkb0hhFhf9QIk6Ej
	N/sIOpHBKUpHNv1ooBOgmqj9o4G29jrA==
X-Received: by 2002:a05:7301:77cc:b0:357:e9:dcea with SMTP id 5a478bee46e88-35700e9df2fmr13673123eec.15.1791875396373;
        Tue, 13 Oct 2026 00:09:56 -0700 (PDT)
X-Received: by 2002:a05:7301:77cc:b0:357:e9:dcea with SMTP id 5a478bee46e88-35700e9df2fmr13673046eec.15.1791875394852;
        Tue, 13 Oct 2026 00:09:54 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm46081248eec.17.2026.10.13.00.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:09:54 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Enable icc-clk support for Qualcomm ipq5210
Date: Tue, 13 Oct 2026 12:39:42 +0530
Message-Id: <20261013-icc-v2-0-196b219e25c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADbZzWoC/y2OSw6DIBCGr2JYFwNUqHXVezQuBMc6SSsKaGyMd
 y9iN5N8k/+1EQ8OwZMq24iDBT3aIYK4ZMT0zfACim1kIphQnPErRWNoIfm906VSqmxJVI4OOlx
 TyrOO3KMP1n1T6MKPb/IzyYvkx3GSgjO6cMqoluzG2k5DodjDep9Pc/M29vPJ4yH1fuY7mOY4L
 pwlRDce6CHCUGUDrIH+B4ro2H9O7Tor1gAAAA==
X-Change-ID: 20261013-icc-4519fb86668d
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: KwpAagd8EkMUgEVoP_ygfJ-eNHqfZyiL
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6acdd945 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wl81dVeC2YmWyYG1D1AA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyOCBTYWx0ZWRfX7xiyDDy0g/h8
 s6HX92C6YR6zvIaJNz4ZD4z/eouCRqqJOby7eOYVL13iAT5F5nBjH4IGXzARLupm2jsvm/GBEMr
 vNRTRLOJSCvtk5uiRL5ez5KIIdcPAlU=
X-Proofpoint-ORIG-GUID: KwpAagd8EkMUgEVoP_ygfJ-eNHqfZyiL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyOCBTYWx0ZWRfX35z4aoh4KphP
 mQ60RNBF4P2rlmrp0I4TYOFpaXOrIfoccqmeZO/N5BXjm1eA4/jeAQqjZAwjTOnmclnm4D0mIVb
 hLa6o/RLPrfkwv27AChYoNyI5kyhZCPfPcVy074Dln1Ld7WCQeR9Yb4DHt0OplJi7yPB5Jjzh8X
 W2K3a+H0gCoQSdZYjh3lbafkrwhrUDgn9kLKESshZJjFTaNKpHXW+mwxEuYCSTssL5T7b9oQWpg
 Y+uT4tjBlKXoqDRyFUS9UnDi6YeKsxQQ9OkKkr/MCkXpQH19EGkt2VUIHWhGI+v5WLouC0iv55G
 7GOEiW8qG2arvbUEwRSg3icVhXBXwJ+XGVVQ9aZHNeKheWxv6n2BENCq1qq+pOfG//+5eN421W6
 9hJ8aLsqdRP5cuE8zXPnU2gKPG27KCiUXmGuoV6L9xz2UE7NeM8D9XGWOlg5oaAIyS1hCL4774L
 Jh6Z8RPn8FRz6KB+Msw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130028

Add relevant master/slave ids and update the gcc-ipq5210 driver to enable
icc-clk support.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v2:
- No code changes
- Rebased to top of tree
- Pick Reviewed-by & Acked-by
- Link to v1: https://lore.kernel.org/r/20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com

---
Varadarajan Narayanan (3):
      dt-bindings: interconnect: Add Qualcomm ipq5210 support
      clk: qcom: ipq5210: Use icc-clk for enabling NoC related clocks
      arm64: dts: qcom: ipq5210: Enable interconnect capability to clock controller

 arch/arm64/boot/dts/qcom/ipq5210.dtsi           |  1 +
 drivers/clk/qcom/gcc-ipq5210.c                  | 16 ++++++++++++++++
 include/dt-bindings/interconnect/qcom,ipq5210.h | 16 ++++++++++++++++
 3 files changed, 33 insertions(+)
---
base-commit: 5ed59b3a5cb64e0ba357275df4862258e3872c8a
change-id: 20261013-icc-4519fb86668d

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

