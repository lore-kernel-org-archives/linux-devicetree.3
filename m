Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D705338F92D
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 18:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774982701; cv=none; b=DAGqtg+aIcaR7/eojgiisjV+hxuEAinDNZ3pkhYaEehGQzhTjETFbti3HVmZW7R43xZBiTHsmXe0ywG0RI6E1DSioBJZPdson1gjdjS82W3fSOgubKG4ZAb6JYaBwMdRkLR0Y1yJ3fPUrS1X78bZg7RF8DxRvEBAEaeUGh0wktA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774982701; c=relaxed/simple;
	bh=auldL/PZcJtISAB4iXpRTm7KDneLIlTOQCtFwhlPCbA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CkY2W6kOHmYKH78vFTHyWaviARUFgJdXuj93WuKGfhIquJu1nvVF4iY92qi6fjfYeO9EUPJ5G/HNL6KEnUlXH6HFLXi2QcwAxbrVA+vAm1UnRUsdQHnYsLdsJd6eDzk5FISK4l1eINNIIUWHNATdguhoJ5XQUen17QWJ9wIWhBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=loDEkO9i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WR5hvfoN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="loDEkO9i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WR5hvfoN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdIM01831888
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 18:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=V73Qkgo5+m2ZEBv2WumRcr
	lVesbrRNCRgCoAU9LhXvY=; b=loDEkO9iRmM4AzBjZ2Lgb+Ff4wQlczpU0CjYCr
	jkVofG9HqjGHxtHeDPdHEB1lUY6UdwG2iCFGW3aPu8+Sy7I9f6ncVUUgTUzxl83l
	SIdIIfxX2qiUVn/ppHHnwxrZN1NmUNBwvRfq8FktXzR2WwWpiIcsRfNSz+rmS/N0
	c40DpGzARJoAenOvFLJy5nEcu7BTNtRvbtug4o1RC8R6WDTLrQBajPUKgUoZUslO
	Vr+OaUaUAsdsehFVSTUSYFyXZe6WotMVAD0e0t3r5vmvw/i0YlrdgPkbHLqY5mUp
	a04QDIX7U6/DLr8K2vUA/S5Lb+fM6UKB4U28xT8+iAn718FA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8equ9tq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 18:44:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ab017c21e9so17395525ad.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 11:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774982698; x=1775587498; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V73Qkgo5+m2ZEBv2WumRcrlVesbrRNCRgCoAU9LhXvY=;
        b=WR5hvfoN4APsERMOcRx4a2Hvj9FgjtXqAFphOUfjwi3Sy5WvfOSv4f4KtDxGVkH4MM
         DroCmGfSADIdtupdsyGepI98WGp4qmZcDJABqMj7zkTX3UG7nS6anRW7xla+mkC1BtgO
         B04wVg4psJd1PeMSnwPrdEgJ/FQXUIxCCZfH7G+IenBJeXfXdiicKsD0gJf5+GYZdkjo
         KHc+FVsDBoj4m4yGmccmvhwafdX/m9aUxjlEZkh/PvNcEOZ3kOeMUpcEHQ6WN6H/te6c
         /Izt1UlpjJ1wVHzuwX7a18Scw1AKJ4Zgr0M9jxewJqXDj9YyNFKLfQ5R9B3d9NbttAAT
         2vPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774982698; x=1775587498;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V73Qkgo5+m2ZEBv2WumRcrlVesbrRNCRgCoAU9LhXvY=;
        b=TI28tfXk+aeGf6eiiF2RuhIP3SYeHQVpho780O6dbu2gvWyD8+ckUry4t4U4zNuSl5
         +OMAoDBC8quwWYOUQLgVAfjT8wbYH4IpA4svJH7psrfIvzE+fbdnihx+l5GOsJB9Yx8Y
         WHcu01I9Qdofpytspw3uc3jN1k4yC413PgZTcSSvuiboD56norS6YDa0xIS8tIOALujw
         TYWNd3cuVOppxiYNepcBnOqe46lDqDG5Oo0AtvJgsuOuBeDC6ibYjrGg6ttClnIukevF
         cJEi3zQB6JC7GxU8n7kpUm3zPNIut1TSlFDarVoOLe759n39VLCBkV3D6rW02iqny2ax
         THhg==
X-Forwarded-Encrypted: i=1; AJvYcCWJo7Fgl/x2h6c1zKxOxMgLp9uJY7++SmTamTNsO17zKyXOk+fqHyxIXM5aSQpzlsHPjlhSsGnI9kzT@vger.kernel.org
X-Gm-Message-State: AOJu0YwfxE/Dep/04PcgbMhmdoMWoeDnvGT2u0ZkFLSoLwBZc8kT382S
	yvjE5QJlve1ajUNV37TkGh1GG2ctppPrdP87oE4VU+VwLsURuzsgXJzp/w4v2RFOUutIfsggg/L
	0k46Ruy/SwUMEGeHw+9+0/7I4lHqmALb6AEKehJTDPnie6zWqdnxtzxMUFznsAFSdGjcO44i5
X-Gm-Gg: ATEYQzwKzYed/DBzaBr5qjnd8d2Za0v9KiVHnHCgAPepzE4d8a6MwYjvp9SSMzO8sFs
	Cbgo0Xxtvtm+d9GCQYYoae5R3w30Ef7hbI0+pdXwqMYzQLhOVARfLAEw2myzxkNPH41/Boyl9yi
	INVYFMCrszXrfA8CnMK+gJ0YKZ3Pa6Av7TsP7FcSH7vt/FapHC0c9+Whzou48sr6oaLPUxGjsdB
	v1TdnPU6ifjrWK0Z2B3jp7N8DnTbZqYiBAi7k7LDWI/wkQAUuwQk3AKGEvBcf93qWFvPw3Kg4fy
	pSpluAlcPFyAF0UliT3FsRcMuaqPuzLw0L5HEQ6U9ISH+HAXoN+hfZboI4s4tVP/3Sd0/FmzJWQ
	73amwmRviDpsbfWdjPiRglmMtabO3HCk1Y/44PUI0uoHDQDrlrVd/
X-Received: by 2002:a17:902:db0c:b0:2b2:46dd:c3b6 with SMTP id d9443c01a7336-2b26998e8b9mr2206055ad.0.1774982698365;
        Tue, 31 Mar 2026 11:44:58 -0700 (PDT)
X-Received: by 2002:a17:902:db0c:b0:2b2:46dd:c3b6 with SMTP id d9443c01a7336-2b26998e8b9mr2205815ad.0.1774982697932;
        Tue, 31 Mar 2026 11:44:57 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427af930sm153284635ad.70.2026.03.31.11.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:44:57 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: Introduce support for
 Monaco-ac-sku Evaluation Kit
Date: Wed, 01 Apr 2026 00:14:41 +0530
Message-Id: <20260401-monaco-evk-ac-sku-v2-0-27b5f702cfba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABkWzGkC/32NQQ6CMBREr0K69hNa0iKuvIdhUctHKtJqPzQaw
 t0tuHczyUtm3iyMMFgkdsoWFjBast4lEIeMmV67G4JtEzNRCFWU4gijd9p4wDiANkDDDKpVqqu
 VLEtpWNo9A3b2vTsvzY9pvt7RTJtoa/SWJh8++2nkW++fP3IooKpbnm60lBU/e6L8NeuH8eOYp
 2DNuq5feD08sMsAAAA=
X-Change-ID: 20260328-monaco-evk-ac-sku-6d66f965335c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Umang Chheda <umang.chheda@oss.qualcomm.com>, netdev@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774982693; l=1361;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=auldL/PZcJtISAB4iXpRTm7KDneLIlTOQCtFwhlPCbA=;
 b=rogm1kseHgtplfJ+xCyPjtSwQWfv3XCXx/qFoXKXvzLxW1LG7L8JkjkCwt6hQMPK5gshrHepp
 lNTciq4qgw7DX0YNv5v+NydHVRhpWTWEghMcAJ63m3exhGgvMPrkVQy
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE3OSBTYWx0ZWRfX4Vik3Dyn8Vrc
 3/cmq+3nybCYHwUqu57xFW/LLnl37fh/VQgqgRr2sVVwCmuxn6Nhc8Qnq9Z39lInA5AfduFJcAP
 4HuU4eGx6ihmMh3dyW0WtudANceWk9cXLRuFtA+jy8nlUr5WUImwNxmXEBDG9FErzb4RoghqkLe
 V+kVHnXP66dvE6DUlqrZoT8ds+xegihypUbgN/dSOo4gXnXGdYUcCrAWa5buHwOzaCS1KdNADWA
 B+Uwkn56a4viUkckj1p0QxeIaLdTka6C1rWKttyTVJkq6dNz6xJtM6fBh5juqbRtZc71wYZA5IR
 T99QRzcyQImzpnjk66Sag8qC76rd5/pF+duBWUe5KltR1kl1hW1OCYlDgo2rpLsIqCCwcwBM5GP
 rF9x3OZiWRAatva7fH6V6T+6U/6LC91XJwM5B2ah8Baa1bcLilB4LJtZhMyupWldD2n9YerL5oQ
 42qlvR4+g5LAmNqR3fw==
X-Proofpoint-GUID: 315NzYXfGZLJSxe_FpCenEahwFSyoKUq
X-Proofpoint-ORIG-GUID: 315NzYXfGZLJSxe_FpCenEahwFSyoKUq
X-Authority-Analysis: v=2.4 cv=YMOSCBGx c=1 sm=1 tr=0 ts=69cc162b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=4V7GHvCDef1FtlI4rEYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310179

Add support for Qualcomm's Monaco-ac-sku Evaluation Kit (EVK) without
safety monitoring feature of Safety Island(SAIL) subsystem.
This board is based on Qualcomm's QCS8300-AC variant SoC.

Monaco-ac-sku EVK board is a single board computer (SBC) that supports various
industrial applications, including factory automation, industrial
robots, drones, edge AI boxes, machine vision, autonomous mobile
robots (AMRs), and industrial gateways.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
Changes in v2:
- Drop keyword "sku" from the compatible string of board bindings 
  - Krzysztof.
- Wrap commit text of dt-bindings change based on upstream guidelines
  - Krzysztof.
- Link to v1: https://patch.msgid.link/20260328-monaco-evk-ac-sku-v1-0-79d166fa5571@oss.qualcomm.com

---
Umang Chheda (2):
      dt-bindings: arm: qcom: Add monaco-evk-ac support
      arm64: dts: qcom: monaco: Add monaco-ac EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml |   1 +
 arch/arm64/boot/dts/qcom/Makefile               |   1 +
 arch/arm64/boot/dts/qcom/monaco-evk-ac-sku.dts  | 730 ++++++++++++++++++++++++
 3 files changed, 732 insertions(+)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260328-monaco-evk-ac-sku-6d66f965335c

Best regards,
--  
Umang Chheda <umang.chheda@oss.qualcomm.com>

