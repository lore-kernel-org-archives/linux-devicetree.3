Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13942D738A
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 07:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776670027; cv=none; b=P3IDcVB+epMEWmPl6HCbR8vCW2Jdb2SvqJJdbj1/7re7D/wivXnDU9cgQWS0jVczfk0JYPECQ+5sGlDGsCrWCZKGtJjm5L9ypiTZi07QqYFBn5QyqH7LqtolCddbNVEivWGHqi7tD37itCanifOHUW/0VMpdIZWJf17TgrjSSvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776670027; c=relaxed/simple;
	bh=LE4dEHf9dwalaJLqpHPlUnIUnuDQOkACtj0LUMXgkBg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AECNleJr5S4P23tDKSlegB1BwRD72IyELGkNGISBPOLCK4V6p7g4EeWQrBtvW37Ebc3rFkRMV2X3n8cEvIG277IYEPDVmrWKjYX6+EKfq+1JkMM7wbZUm9iJ+Y1ekSIVaGSeAuREojP/1mwNm7uAz4yPdQho48Q3wp6CDidszFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OKm81FNm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eqWgJ2VJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OKm81FNm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eqWgJ2VJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K6idEn489719
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 07:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=R4BfAV42tyPI6yEMMtx4VRJAMNDAHJoa+Zc
	H7mz48Yo=; b=OKm81FNmDOLJerlGU+ufPEDiIUVZ3/c99Mq5tjrYOT6AWsHlQLL
	E2lddF5wrvxZc/J4L+x2HfFSzMsTQn6pc8RTRshoEkB3c86B3GV2sUMTkndm2h+/
	pDvzLoi9KK4ki6SzoygeIc5+ZBM9v41MpamN8PCHasOz9X9yhWRXWd2Cti1mKNlf
	cx95Q+lPEre/74pGXQzrSbIVU9xfPADqsBdHjjWwNMV14+YJ8pfNjGrNn5XsvOoZ
	RnVjgE3Msqtrs6P45y9FCewRQJe37DUy2EryaNt7IVsvbsVd7w8dROz5gzI4a8iZ
	T0jhPGy7S2huFNuYAkPfpFA0YyymxEiyCDw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm1hx4ns6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 07:27:04 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12c726f4019so2927478c88.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 00:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776670024; x=1777274824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R4BfAV42tyPI6yEMMtx4VRJAMNDAHJoa+ZcH7mz48Yo=;
        b=eqWgJ2VJBsE+vsIjzFk+8Bz3sW851idl4Hly4hmlPwtP9lM24XiLqyAVaul/fzJhaa
         giPi6Vgvr+Rsm38ZMHOBO5pcYLbj2HNWmrgHyIOstFAbjdfL00KzTV6o7c0Bzz90gJuA
         v7x57SB9pbR2TYaSQjvND2BlgxMDKNjSSK9yoerMqA9ZI5cIZCul/FDAf8pAobOsvR1J
         KvV5b1s0lwE7Nv0+Ecfh52XugmCEFm0DPkwi7nzBZshea1qDhR7amHbMfofekYRVINvA
         3n0RxJCR36/xc7FbyYH0PPWAzm+75mtHygMC/XKw3B2LsMu/cUuHfUpkPAB7HsfzoUep
         ht1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776670024; x=1777274824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4BfAV42tyPI6yEMMtx4VRJAMNDAHJoa+ZcH7mz48Yo=;
        b=pkMc9yUyTftY/qhGkx0kAa31IP4RXyLZ6CzZ9JHOGEtDAr/V4fOx7AwBW04oP12p77
         ORAe/W3AC7yeZaGkazXMCHCfnxFJRMDiA05dcqcqHQiJzPtBiBon+CLmB6IK1TAEilXe
         jn72T2zGK3JbzrinBe5ki8U93T18Tx3RlNOPi0k6UxpWyDS2S3i4GtySbnpGPgy2bJLj
         Z2gLQF0foZw5ry56dw4frZGsr9JI9QTRYlGgrstwKjITOQ4LFmkOWLx4AK+v6N/GRF+p
         6+YY4gq0M57whi3Of1znm3hpSn4J1i6tzZYmUDs7o26aQ1bxtPW6Y3FrMwr3nEi3Hdo1
         eX6A==
X-Forwarded-Encrypted: i=1; AFNElJ8pu3Mlk2dlDJzYwfxvgUq5ZK4UT/3P1IZzZyI+jmFGJ9LjQhENbU6HfnHw0UdqzhNutzqkDYjNALu2@vger.kernel.org
X-Gm-Message-State: AOJu0YyQoSDwW+6XQG/1ncIQdW24Maj4Mp7vgGEUpcl8BMaAIs7jObzE
	ioCqSVby1IImEL/9XzakQHW1k7G0RjkEqSssyjf/xJAAcvu92AyC3PScYShqMAhWnXlJ6onmti1
	abc5NTX1F9GuZ2RsmrWXmpGfVDDfQ9JpQUXZpIyyLtWgYFg41LqgSkQgevDxU8Zeu
X-Gm-Gg: AeBDieu7puuSORTvZiYR0g5TN7CuYT/e5Kt4yZqhSOlYK3XZQmR0EfJCYqWzmomFhDG
	w69eU/ur+6uuKcuwwW6EsbGDyPxVphO4go86rdbdCVwb4sA2raDxvS03s/DsvkxQak7DTlycRP0
	xD2/AcRaTe6WAye+sJySsXT2diOTLc+E0Jn5WK0stm45/z5efQ6XtDOyBx6BDAseTvNpdIjm8j/
	hhLUcVLVcx3wT9ME3xo8MdDWDBjZWEfgUkdhO190S3GLX0+gOa49t5o7reKwqLTM+50rcW+31zS
	mux/wr69sDYJooRbAwGd3v6uQJcxaZ1JeGJD0NkfqJx3V5kGs/XDNRZ57m4UtqENMOnIQWG2/Dr
	6AEnTbHzLkcgr6P9MGxO6skMb5HFOdMvJLZL5VI0vzoYOb/owOw1iWQQbAUQxW82HyyAGYYQE+N
	CAVq6cChU62vzRPhLt
X-Received: by 2002:a05:7022:2602:b0:128:d23d:81a2 with SMTP id a92af1059eb24-12c73f9ae5cmr5867768c88.29.1776670023668;
        Mon, 20 Apr 2026 00:27:03 -0700 (PDT)
X-Received: by 2002:a05:7022:2602:b0:128:d23d:81a2 with SMTP id a92af1059eb24-12c73f9ae5cmr5867734c88.29.1776670023037;
        Mon, 20 Apr 2026 00:27:03 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c919266f6sm529413c88.1.2026.04.20.00.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 00:27:02 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/2] Add PMAU0102 RPMH regulator support
Date: Mon, 20 Apr 2026 15:26:37 +0800
Message-ID: <20260420072639.1249984-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xP7gaOTVyCDjWLLnQ5-4QKChZJgMofjt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA3MiBTYWx0ZWRfX0W5nqOEkt3kB
 U/mYoVROTtuh5TAzQ9JB+Fd/d/ZAoaUMaSU8S/viZiuU44ffr7unL2yqQqGC71KqZMOADktGR+f
 W+Qi+YQxSYqfz3pMdkmz9GR5fuo2TjyZqXcwYsTVcr7Cj69EaJU8/LHdmURTjzhFI2l7sjY+3bt
 0W25OcjJu+HjEeRjP5znZSWHV9z7WbwrtsC7TJWYIUOGrc6mQlMc8fYcKRW/C3Jf46YqB2nHem+
 o237FLYB6fMO7rpTwxNFTE+TWUxK2KLdHsveWxVC4SCFMjhEOVaKzHprFHNAEd0Iv3twxEdRwFZ
 MD9NKzVIuZ9uVxq3mIOywc61i5BMbWA1lFSUwFcLRDCOZY0izr5wmfssKIW84dZaDRAB2jOyJ2m
 nPqERZkgTGg5qQ4w5PLwYyDLtbuw4dqKBIz7LFjrMoKVPXUXWkYHErJxPWh3qyV6g3c0Of5al7i
 H5QNT/YK/2sEvcWAEQw==
X-Proofpoint-GUID: xP7gaOTVyCDjWLLnQ5-4QKChZJgMofjt
X-Authority-Analysis: v=2.4 cv=RoX16imK c=1 sm=1 tr=0 ts=69e5d548 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=rmhsGHOi_XyW5o5IWqkA:9
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200072

This series adds RPMH regulator support for PMAU0102 PMIC found on
Qualcomm Nord SoC based devices.

Patch 1 adds the PMAU0102 compatible to the dt-bindings for
qcom,rpmh-regulator, documenting its 8 SMPSes and 3 LDOs.

Patch 2 adds the corresponding vreg data to the rpmh-regulator driver.

Kamal Wadhwa (1):
  regulator: rpmh-regulator: Add RPMH regulator support for Nord

Shawn Guo (1):
  regulator: dt-bindings: qcom,rpmh: Add PMAU0102 support

 .../regulator/qcom,rpmh-regulator.yaml        | 11 +++++++++++
 drivers/regulator/qcom-rpmh-regulator.c       | 19 +++++++++++++++++++
 2 files changed, 30 insertions(+)

-- 
2.43.0

