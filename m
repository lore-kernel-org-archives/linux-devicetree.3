Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9613FD132
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 21:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784842786; cv=none; b=hN9snSA6UUoqDlgsBhHnzOFE8r4IOvqv7vxdeog3DIjFtZHc4shXLYShiCIh/6sqmZ7ZxSaoHrjDHPRi4AKmjVvGwvXSDcSkkpeCt7uHXTWNL7tY4gnAwH6AqTe2jQ8McuRldp5F4GeoQa7AfmRqNgbnxoPfPHAUViiChIUwV9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784842786; c=relaxed/simple;
	bh=ip8Uyl2oFgcRZWwtJXR0j8TqrNAuq0h7S8y9j+lDnVk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M5qDpg+pROqXyUYkctqxzFnX9pJkWtqBxLLtR327IKAkgH5CuJwWSPblS1mxUqLEEgq+6kdBv5qKgdYewsDWh3Db1EqO58T/Vv2+DdB9U59161FWJmj7ROn54m8XtNy/UtSl2dzViHWHBE3qbYlMWrnSIqkRff55PTjmRSb1x0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BIuXAtUM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c0WOJLny; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BIuXAtUM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c0WOJLny"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NIm4FO828121
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 21:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=j92jrThRL6soH6MtbhOTvj
	gHsBqSRNODwQ6Agj7cVE8=; b=BIuXAtUMwRGDSHATEgxofilwvNiX/jsYhQvMUa
	NXhLYxjkV4a+Tut9D9bTo/H5hXVqW5igqvBppSZ+z/aQbhV29LYwP5kFM0dSuZ3e
	MkQOH94ZstQrBs/5xDHCJOKXvC6U/5e1S+OmEaeG8WmEN+T2o7/qIRETY/1SIKvv
	dBQ50eKXEoSksxtI2/2D7lKp6Zlz2I5M5kpE4m7nnOzcQWeWawp1ahCdF2ifgClR
	0Cy3O4fRH4QIvCNIG8Vpx88glGzKpHTXAhU6GJOFySpdwPulek9vEeVRplMk/Q78
	FcvvBw/gs+Ku5HLOaUpUA1SHriQKR3wCQHIcPdr1wr/MNjcw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqamrwn0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 21:39:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so1003785a12.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 14:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784842779; x=1785447579; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j92jrThRL6soH6MtbhOTvjgHsBqSRNODwQ6Agj7cVE8=;
        b=c0WOJLny4Md63LjywhPxcHYKe/0ezpzo3p2lMwDyYIVOir5q3mzM4Crs+r3U8HnTIK
         n9AAg3vk0UYwAX1tjZLSdSM7s5QfWlr62kVtKjMyv2z7lFvHuMJFNxtxMZvszilpNmI1
         XVA0JqfaQ3/aWoAhimXFNvXt4VTanwuf0+R7xgkxWbDfYySxafWnzF5/s3ZlCEIK+iXi
         s8sPCSkerJJusmkBaCqtQfXhhHrIEhdzbn8KUwiAAcl+WlVRcCvlwQEJKABnsPFFasrv
         KWI3ecnn7GGHpZulCzJ1tbe8z7Jb2Zd+upDv2Fgze3dY77dpqRv+XO2H66a4w+iELJLt
         HvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784842779; x=1785447579;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j92jrThRL6soH6MtbhOTvjgHsBqSRNODwQ6Agj7cVE8=;
        b=CvY9uGDsZ7KqARX1x+KeLN+/9ads+QrhyH4HyeAdjUnEtz5/tgC/QSiKfHWTIuLg/9
         Mv5Rar2bT2FnGL/iWWAwxkjv2YPg+yjIyqjq3SYfW+9hGg/Vm7Iud3+fnqw0MfeAjPVI
         UKbxeyUo+1dUaVSDUH9aV6JqqV0e3blz+luQyM7VB92CmVws2n1IXDtA5K5x7uJTORZR
         ymxCXcTn5LijH5Z5l2q0/ZOgJwYU5DjxX14Nf0Vi9ZECG/ftL6ujwyrq4qGvR090qSuV
         jHKKflsjF8KsM4gq8IBhOUohfS1ZEM2zvbFPdSFQIyyWDRkFq0AXlTlzF8MvKod6rXhO
         le4A==
X-Forwarded-Encrypted: i=1; AHgh+RppUK05T9nzKSUWZBvOjEdSuwcoq3+jkf6VMb5D+PYR871cwHo8FI1pQ+07/3Se5MmfJP2aIpWu2/zo@vger.kernel.org
X-Gm-Message-State: AOJu0YxKAhiTPnGmt+JZ5recNYN808IgNVH2oSYawszAHO4c0oP5sLww
	yXS+WJD3BfRWh+HbllQjSFnYLUJNg6y4QrX/G2MvR7ssQR+hfaCMGicWzLxVqbugqgqaRnEqGIl
	K2FM1qEmtsOnoNKzUThOVLHGsjCbOyNkJK5ad7Oy9/3/AQci88PYKVk6AnBBisQT7
X-Gm-Gg: AR+sD10oOVsOs9sTt+fPRZTpdZA1L/kgA9ORnLEzB0PgB5BsHc7nOnuGCcAZ8FZNh45
	G9N+5kxQeYHBgZ1SHI6nAJ+oWnIqbeXjFImF5NJOoDZ5m8p5thJMfDwlxYF3Vo3omD10q3vvn6x
	ITkAC4jvMKV9zZoczDeN8kjLk5uNciY+1SswwyiN19wn7Fxtd2WqVLj6mCvGZS6iDEGAdmglx0O
	MZOBPF5IQ87fC/gSAbo9fZs3fwbY4PQeA9dbNuHenpitJszAzsQmNQ9lJ7PZ8S5s/WGiDAHXf8X
	FMh4Ih7Tzc5jhG9ecw6Sw9n7ZcqYn/wjV2Gp90QivtHT9BvWo/dn5uWunEH+9DfIwQKd16YZOWP
	4irofby0vwq8kskUtGW8bX6ckuPjgtu1Lt0lOP/r87Qx6gfa6jItnPh4=
X-Received: by 2002:a05:6a21:a8b:b0:3bf:63af:859 with SMTP id adf61e73a8af0-3c44b1a56famr5502952637.45.1784842779414;
        Thu, 23 Jul 2026 14:39:39 -0700 (PDT)
X-Received: by 2002:a05:6a21:a8b:b0:3bf:63af:859 with SMTP id adf61e73a8af0-3c44b1a56famr5502924637.45.1784842778887;
        Thu, 23 Jul 2026 14:39:38 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e070538sm22904174eec.20.2026.07.23.14.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 14:39:38 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: add camera clock controller support for
 Hawi SoC
Date: Thu, 23 Jul 2026 14:38:56 -0700
Message-Id: <20260723-camcc-hawi-v1-0-7057658c5c47@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPCJYmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwML3eTE3ORk3YzE8kxdk6RUCwvzVOOk1CRTJaCGgqLUtMwKsGHRsbW
 1APcnnZpcAAAA
X-Change-ID: 20260508-camcc-hawi-4be887e3beb5
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784842777; l=883;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=ip8Uyl2oFgcRZWwtJXR0j8TqrNAuq0h7S8y9j+lDnVk=;
 b=3pRIkh3PunAdsIQqNXpbDxGRI1UtriHcG1yEQCmDtbgnGcKeMpdzJX7TYPOjPz6mOEYiAXZOA
 LvSm/I/1xnzD5iLelbD7AEWB785e2phslqOm/R7BDTDzEcYc1TqHbMc
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDIwOSBTYWx0ZWRfXy/rPY3qbB3Gq
 bgJwJYdwTlfuRJnkdaR/Jt5SDZB9JreoXj/mvrVrAEm68QfyZspgnRlzp8k4Xo+hJexIQ+8uuEl
 HCIloftmOCmhwXYWNlYJKH/ZdUCSaIYj2DpVDYxK9OeysNYxOCOvS+wLHsCc1BiIh1FGN+7vwd5
 Hkr0zM1pjqWi7cUNavOHSldo3L4tm5gO5Kcm0/2q+Qq+2/gGsZ/S02NzUzgTRdwBaPV4th/2+Fk
 vvPBnmgawoHwMHOHd8V38DXMYqsQ0iC2BMzbToa9IAfOIsTiioaIb0S0x71FgOjGRTeeAwtLoBv
 DJRdVvBYlK1M+nnMv5FirtWENi6J4Mtf9cMnvi5/jDIXRrLZy+vCYOuogZKCSRcuX2x4AQdz/Wh
 4N7KKHPlqVNQ10RCUyKHI+vOjnzuy8APdyEpKnG9QEy5J9pQihiYDWd7rvbFEsWBkthK5ZAg1Vu
 4LsGoqxKvbWFODl0srw==
X-Proofpoint-GUID: s3j_fBOdh-g3KLkfAe_j3h1uG74z63TC
X-Authority-Analysis: v=2.4 cv=DfAnbPtW c=1 sm=1 tr=0 ts=6a628a1c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=3-IOAT0Sqvn_RtttD7cA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDIwOSBTYWx0ZWRfX7gLi2qkbn2Bh
 FJuDyb59cfq0EpUnw9EYueghuQJm0BTA6o1hldmwvxXnWtakx9gYz/WsvtRPiHO5aPJzxWGkNGj
 3u/gwitCnmf131Iklh3sceRPApzw8OQ=
X-Proofpoint-ORIG-GUID: s3j_fBOdh-g3KLkfAe_j3h1uG74z63TC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230209

Add support for the camera clock controllers on the upcoming
Qualcomm Hawi SoC.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
Vivek Aknurwar (2):
      dt-bindings: clock: qcom: Add Hawi camera clock controller
      clk: qcom: Add support for the camera clock controller (CAMCC) on Hawi

 .../bindings/clock/qcom,sm8450-camcc.yaml          |   36 +-
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/camcc-hawi.c                      | 2984 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,hawi-camcc.h        |  165 ++
 5 files changed, 3188 insertions(+), 9 deletions(-)
---
base-commit: 9eebf259d5352b87080d67758f483583d9e763d7
change-id: 20260508-camcc-hawi-4be887e3beb5

Best regards,
-- 
Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>

