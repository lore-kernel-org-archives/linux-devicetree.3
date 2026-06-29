Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E723337107
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 04:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782707932; cv=none; b=tCUbZrCYfaQcvF3nBNtnfC5cEyH/1ZsXt4q8bRZkG1Gv6rk+NQON4ModAWZKwXcn3GYgH2UKEzKiIOIb3a8CwZJhyLg3GDEVQM6ZwcwKyfG5K68xrMm3422IfcUaRhWiFIt/GObkaV2+yBE0436aFy2bjCxGQBV2/FI6uXJVSWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782707932; c=relaxed/simple;
	bh=eqber2QnjpJ0qBf2/slRNi8fbnfRYGUkPKJcAmezZJY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J/DM6IAZUeMVwK2SP4Hd2/Y18E3p1AKbvfyiJBn2AnwttjsbOGdayMNuY8HXhW4CAvLpfYOGehpH9fmeZTg7DNW6KMKsv2Nk9dQgN+Xchf6XWvwQHSb1DOFL8pgJPL18XFsnIE9CAiGhJhuuLkKKNy3EQqSkMq8qJ06dUZK0yeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JUUkqA1/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N8IAeGpI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JUUkqA1/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N8IAeGpI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NHZO1737483
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 04:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+H7upl4ky4N/1wHh422Qj7
	n0iMjwso8LVlWtWJ/2DEs=; b=JUUkqA1/m0D3VUPCK8q8nnCIaMkHucNJ3AnBvp
	vxUg02RYo7LpeqvUZRwVS8gHEiJNvWWxECC2zRiTAa4x8/ujxIXHi7VdP+epWQ0V
	8VOpzw4hkphoRg94f7Ss8uu6SBIZ+ONMGsoss0rFMZuy+CowHyzT5cTkSMhr9BV6
	jPKXlSEsCdhfp7+J++qaNON5USZL6OSVWXf+6Uyh7oJjT2P9smMwC9IPWxkMuHB8
	ZhCWswSqfYs+wgcrxcJKpvjDV6PslrBF1Vq8N1pn0s7EFVCqdfR9O0MlJ7Eq4Gty
	zwn1lZSWR1E+S17+VEHcWu4y4kJFJJEW+F56OE7lzJng93uQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f279cmc8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 04:38:50 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b70ca7e5so5957286c88.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 21:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782707930; x=1783312730; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+H7upl4ky4N/1wHh422Qj7n0iMjwso8LVlWtWJ/2DEs=;
        b=N8IAeGpIbbrGZSfyYcUHRz1mOI55/9yOZatFewHPyurz+y+G45bfnDeaPJPUzPtec5
         78cKWcqaWm6yDxk+u7bCOb3w19jZ513SSr/4GzJIxTYpmCww0wuHS0wTWnY02fr2oXUf
         mXbP5oHJ4CRoTwwLyA+E3Cxb3h3xXGdIFYWsCC7pz4FW9sC3qaQ5IKALwbSER64bnv+H
         JdGbyyQtZoHJd/5+U/GzN22iXo8cR4N0D42uzawlwd36KUGu+HmfQGePSKJ9NmngzSXH
         RdI7jV0i2XtoYZlQABYUHR8MsFAl763QeX5wJHLelDhPJTwIbiZ3AmKULwnm9lbzMc31
         KmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782707930; x=1783312730;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+H7upl4ky4N/1wHh422Qj7n0iMjwso8LVlWtWJ/2DEs=;
        b=W80W383z0SYkydoZAwwJRxn9Iox8LB9sWAqROJkZX8i7MygaG1Cl8ubgJ+6haRlr3p
         p6XT+G1hvMvgKU1UhU4kAW9Z4cVrUzfmCPM7c7RKZa7zEP4kwe72lvvtTnuG6Acmm9FO
         gBkYr852jWMOuseTLEUyfiphNfjSjR+kWVhkBpwCqVu4xCGTzmavhouGKEFtpJrg3Zuv
         uHYWMBPM4hfsRMqoMKJa2wOG58kcyqs0qwWRNA9Po5eFDhSe49XPBbFw82KK6texTkUt
         FkulX0XowLrDKPm57lK+Z77TdtG2xOyQnC0qjqw/alpGFG5luWB/ASebVRR+THhuLppx
         4kvg==
X-Forwarded-Encrypted: i=1; AFNElJ9GgQeckiGp4LnB1Af5Dtd/hnLc83TpasIC2VAFCBKFAbLVVGQMPYYLYH8V0ycdVM+T2xV+clDuBn3Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5M+fsJQKc9KCJ4vibUewfcoDY43Lpsu9713gf2FEIAcLux8S3
	ZwCghkdnFUIxbilcCtB7b2BWCRLqpT96wPXvCt0LdcrQJUPkmTVoWuFG3iy0JeLS1aVK6zpiKpj
	8nr94YWbqROdKNZR2KrT2cbFcN6uu6tWj0rnGugNd5eYmwY3YU1ZJnUpnOnXKBKgQ
X-Gm-Gg: AfdE7ck/ohd/jFmVQGHcfVwhnE2gPOc9TxR/uMDWgC933mRejkTVrP+N6+U+7O7IqoU
	Q0QWkNZ3hV/KewJtOknozZ7nuzdWz9UdpRRsq++AkkJU0IfgD2NjpbohCvSYlf2KDnHeTVZN1fk
	icuWRlkph45g4hCdCIFUd02adCLoQBcmhst1Sy2gyWbh7PRbuSvTA518YH8Dz+NTHvhrYnJ2t7s
	ipANHvE5R4THymhp2Ai2AkrPjyAq3qN97QSoiHq4I16Fb9/euIYB8kbsJh/zSIrqgvauU5TJXf4
	wlE4mSOlNMBow4S7KSkMFiFsLZx3wMOgSLwnOFhA7nmv2bJrtR7ngQKdVhrYIr6n1VSYFM1QHFJ
	1Ub3iAwdS8TJxsQJHTWbFqDlLoTkRZfTXOzZxHnDKlmMZFhjDZpZKKtAofXYrAdxWIsYip3uz5c
	wL0upYmGiHF5Js55b9GX7SDSPsW7PSXzsVrHZUpVOi
X-Received: by 2002:a05:7022:ea21:b0:139:8172:76b2 with SMTP id a92af1059eb24-139dbaa7203mr12099941c88.21.1782707930051;
        Sun, 28 Jun 2026 21:38:50 -0700 (PDT)
X-Received: by 2002:a05:7022:ea21:b0:139:8172:76b2 with SMTP id a92af1059eb24-139dbaa7203mr12099931c88.21.1782707929553;
        Sun, 28 Jun 2026 21:38:49 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139fcf63021sm7791247c88.0.2026.06.28.21.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 21:38:49 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH 0/2] Add APSS clock driver support for IPQ5210
Date: Mon, 29 Jun 2026 10:08:41 +0530
Message-Id: <20260629-apss-clk-v1-0-8c92fe118ce4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANH2QWoC/02NQQ6CMBBFr9LM2klKgYq9imFRy6CNUrBTCQnh7
 jbgwuV7+Xl/BaboicGIFSLNnv0YMhQnAe5hw53Qd5lBSaWlVjXaiRnd64nUlRdXSeoq3UCeT5F
 6v+ypa3twpPcnF9Mh4WaZ0I3D4JMRgZaEv2oJ/3dG7LouakxMgbGRiqg/W+V6beYC2m37AoLso
 +O4AAAA
X-Change-ID: 20260625-apss-clk-ed39c40ed468
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=evzvCIpX c=1 sm=1 tr=0 ts=6a41f6da cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=jsnA85DQvCWt_8XIyIcA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAzNyBTYWx0ZWRfX/NGCzXICapZa
 +5C+4WPvdlugdyujtg/J5V9fiIsk7iu2JibCfSgUqx7+56j+r9ae78Z665luaxUCYjcsGF79LIU
 OFSvUliQzlREXBoaWKfH0goX9Mo6H6I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAzNyBTYWx0ZWRfXyd3OsYFfKm1p
 MUQYD0MWiI+L+TRD9gwUcAivaGKa6RWLKWnlksmusfsHPB+6ylCZcNf7QtfRi0GiSP32h4bQbLR
 vzPfPlQqen3O4epyLqQm+0ER0QZUbcPXWrmyFlXL2Ga3gQwirLzQRtnH1XUDAnMZDnIlAEiyit6
 2/NLmjfW2RwuU6iODoE998vkCYdT+eupu1pAQmRBjB33Z4RRFruXGSfpYh+UG+PoidsY6zyUA9z
 53HvzJOksGt1u8X4sPulJYfCuKBvNn2q/Qkdxb//AdcyPv9GJRnVjPtGgikZSy2DEJZJg8E8Bjh
 tp9IhNzffB4gnxLghCITpmXFvQ4wrzwu6b8etDd6cnZOUYt15/gTEz9NjYpE8MTZ8JBjmEPyveb
 wVc4slI3Bu8lMqX3LFRY2gRSYgqzYJI1LIkP5BkP2J4b5UFf7OETkKJZi9LcXmTUacq1vXMWn01
 JVm/05POlRWlZLZEvWA==
X-Proofpoint-GUID: 8G8Ur_Dvb1om9iIuoiG7cBOtKbI6-ekp
X-Proofpoint-ORIG-GUID: 8G8Ur_Dvb1om9iIuoiG7cBOtKbI6-ekp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290037

IPQ5210 uses the HUAYRA pll for the APSS clock. This series adds support
for the APSS clock to change the CPU frequency to one of the supported
frequencies.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Varadarajan Narayanan (2):
      dt-bindings: clock: qcom,a53pll: Add IPQ5210 compatible
      clk: qcom: apss-ipq-pll: Add IPQ5210 support

 .../devicetree/bindings/clock/qcom,a53pll.yaml        |  1 +
 drivers/clk/qcom/apss-ipq-pll.c                       | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
---
base-commit: 533704f3c28c3f5f9e2542aa3a6a326c32e6f5c0
change-id: 20260625-apss-clk-ed39c40ed468
prerequisite-change-id: 20260515-tsens-802eef7a2cf6:v1
prerequisite-patch-id: 55c7e7f58ff80ecfed956707a9a893bbf59ef74b

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

