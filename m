Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1151E76026
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777252337; cv=none; b=GzMo/es2zl2N7j7nG+TmTx1OJBvNkXKnYpWfZ1I1fd521AoI2d3s+X3+HKLuovb/Tb9mUyHfrBWAqiCiYq+FLeT63eEIm9tEAsKwrI3WPZW7US57e8RRwl4ZteI1QjkUttRu9RI9igAd9CXhOAabf5YACjR48+9I0+8N8GO5D1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777252337; c=relaxed/simple;
	bh=nRTPo5/6/DWHCheyPlQyFlW4w/Ucl66Mx+6d8gX8VqI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kefJBbvqcds1NZ1dCi4MJ4ZR/NbxQ+nXalyio8h/fgyWHOZaSwar7YAxyEK8PM+lGZ/Xoq66CmcjJUvtg24eQIEj0c5BcHrupoqo9O9ul7a5G9dyXbPNjlk3gP3b3N7cED4RhPZVi0Gd2C6AGjo1++omWomwF9bDbqFYrclNcqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBMe+jj6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IXaVXUvm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBMe+jj6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IXaVXUvm"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QNDPh9568190
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DBI3O9Pvk034EE/Z5P/cp4iyvbQy/3iqo+c
	qSmkWFeo=; b=RBMe+jj6ytKsScusIh9s6T87dD6Ytw+i/qgCM7gLcqSb2+Rgrjz
	p3qhOXO1QHtZc5ME136zaJkuJO9ajA+mHW8H5xNZbe9eNKyCdBod+LpMakQFD4Aj
	4dKQea0For6K5ct063NbEwz4SYELliT6MyfqlMVpXSHDxEp17x8owehC72I+w+5B
	0ebzhnUG+WQ4nJyeb7ZNvIEjTXWFbldAk3BGp0AzT4Bk8oWYLT3cIQcu792wr/ru
	CSfQ1Si5nSJQ/MXZI83RPkfeEF2XJU0g+ATHhOSZXGwQfIiaxI97+IjpGpDSyJPU
	KOBEZ8JZiUSYWYyQ8mNNIJGj0yWSshAtU4g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpw9brbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:12:15 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so11376478eec.0
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 18:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777252335; x=1777857135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DBI3O9Pvk034EE/Z5P/cp4iyvbQy/3iqo+cqSmkWFeo=;
        b=IXaVXUvmzAjtllPCaS9FpvULjcSC3jBK8Xg0YftZI8rdClyaqFke5NJp4i7sMrqVI6
         2sgwg6dJaYZsbjPaNCE6hxfZEs3ZRTnhuyX/OS3Xl1hHw9WUX9xvxzQRJnfVd+L9jlah
         iZuCtyKAULI5D92us4YXQ7nWfCEylEwZo5a3lyvHBHqlYFEvOa0JUYaczA5h3vIv8EO/
         YnY/ven7iod/hb0xBZMGaziv08tV03jbS96ynKgvF5LqGkqWWrqucOt7Otwne1FK2b3o
         C67ZGNb8CkiYRFEMzA1bCp51KQvLLoSpgCIdeK3o16Jm/w2z7UyQado0dfvax10vzrBW
         Ia2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777252335; x=1777857135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DBI3O9Pvk034EE/Z5P/cp4iyvbQy/3iqo+cqSmkWFeo=;
        b=Pp3BtRfKo0qw75f29VBBr9CGGRKwNoMcGX7VCN9rZ7GDME4Bgwi0kOqQGQe3HnGhSs
         q/GcCZ7gib6LDWrPCBgWbfpsyWadosyHYmMZlLLjC3fszbDIZKRHL0NyRO++UXpQR69t
         nHfJEqlcZFHUGNl4/owks5hkQwBPFcB07iQ1aY+fV2KpTv8np4/JOEc0R2FlJMWTERZZ
         avQZ662ueZd2WJLfgsBAeaERnvl4fXwTtkWHPAZePxlOr/rZOdNEY4Lb0FOgYpY4H1kO
         hBLxFloPd5Uqd70iLIVABkg/Lg0EGIyMOLTpmbAYSKnFac0q+cTgysUNtsYLNEiAiynQ
         sTzw==
X-Forwarded-Encrypted: i=1; AFNElJ9Q5uMGjjwkYiMfXCfuF87zfGBVeKe9gS9gT8d5FnlOqGBnio+vITdHFAAsZPMeQle91AMA7udCK1Ui@vger.kernel.org
X-Gm-Message-State: AOJu0YwhBO0lNmEjs3IO9V2OxqyjpwIf18+H8kKkx7Azup6bhoND0299
	e6tE87RcMJ//E4XnsJJuQplihZbyoyPopX3edG5LQ+/T3y+AdiTO8m9FjR4i4cC2H7TrQUdgGap
	/4Unxw+sSrKrXxukGixcQjueAGgaB2s2lb09HREwl93Hm+TeMYKgsJimzpPqe1TGk
X-Gm-Gg: AeBDieshjUky0Ce4t8qqsCtJHmX1nok5m4MFxeh1TjgvJ3BY21hETSXKCGSbeMWQZ56
	dstis4Y6S8hJUL4E7+t4Dmh8L+v0L19GUzCUW6VC4PhULRwvrKdYUjtf/PeaS4PMkihBFMXsKPy
	NQ//d1FAJL2cKQwHNIPMo8Hyl67kYqS0cvqO5bbUwKqxZLacwtjPC4thrDarZPvcQgBxQU/G0me
	XjZzmYy4BrNSixCxWkJyDSPprQQS5EOd4TtDhy8FrA14B2LFc6QTfVAWFqzxqVLdfDwN+5vUWOA
	7IvX28ald9pVVJaxB1yaGOLj+KH9WvJVpRyYmU+lD8R/jY9/3epsE86tXdumqKQn7PO8iqqtRV6
	L01QUxjHudtoiP+Kg7gA6P0NScCFBsuhv+BxghBKF9PRc4UvkSz3hFXKwnelpMPeV5uP+1ChTMw
	qPmzX6EqRngC+M5/ip
X-Received: by 2002:a05:7022:6728:b0:12a:72af:83d2 with SMTP id a92af1059eb24-12c73f7676fmr21766505c88.14.1777252334732;
        Sun, 26 Apr 2026 18:12:14 -0700 (PDT)
X-Received: by 2002:a05:7022:6728:b0:12a:72af:83d2 with SMTP id a92af1059eb24-12c73f7676fmr21766487c88.14.1777252334192;
        Sun, 26 Apr 2026 18:12:14 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dbe78e12fsm21720098c88.15.2026.04.26.18.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:12:13 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Add PMAU0102 RPMH regulator support
Date: Mon, 27 Apr 2026 09:11:57 +0800
Message-ID: <20260427011159.230698-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Fe98Slxz3kk8Ory-AJnXrn5RCNaJpHEA
X-Authority-Analysis: v=2.4 cv=H67rBeYi c=1 sm=1 tr=0 ts=69eeb7ef cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rmhsGHOi_XyW5o5IWqkA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAxMCBTYWx0ZWRfXyUeSuJ4iQa+G
 qQaP7SLmmJRShTrCtXmlQlWEuFclIzvn6NFtJ2mm5//F5kDvDsm6gjHWy897oVev6jrnTq0jNUx
 LYz3yOn6D+TWbAKMAIIeuTnjt5BqLI3HDn10NnCVVt40BYOJDk1W6aUgLlARCW+k7JgK+jS1Biw
 Mk8TmyX2LSogeVwpBkqaIre3q3Pz8UhX/Nnvg258nzp+0PmR+JWXyCXXnt/0OzAa5nUZQn4wO/H
 ilUl8hLwZsfs6XWiNO35QxCwf59jKMy+96sLffCMY/tkuUFHqU5Pa7/YHMeqgE4ZW2/Ws/3jrJe
 VQDr9rd0gYdCfrdQ7oACzztjGd8GhAd3NkH63pt2B8F5kgIcbTN3Xr9b40xXRtNAs+rZcDwI8wK
 g9TtImwvTYhQaA8s9WT0gEqkNkl4+nUMtiPoMnIt+T32IQ0mnhIpNHAPbMhQVoxdph0+TVYHvLE
 saUezGOfEDufUu/O7Cg==
X-Proofpoint-ORIG-GUID: Fe98Slxz3kk8Ory-AJnXrn5RCNaJpHEA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270010

This series adds RPMH regulator support for PMAU0102 PMIC found on
Qualcomm Nord SoC based devices.

Patch 1 adds the PMAU0102 compatible to the dt-bindings for
qcom,rpmh-regulator, documenting its 8 SMPSes and 3 LDOs.

Patch 2 adds the corresponding vreg data to the rpmh-regulator driver.

Changes in v2:
 - Add supply name for LDOs instead of using NULL (Thanks Konrad!)
 - Link to v1: https://lore.kernel.org/all/20260420072639.1249984-1-shengchao.guo@oss.qualcomm.com/

Kamal Wadhwa (1):
  regulator: rpmh-regulator: Add RPMH regulator support for Nord

Shawn Guo (1):
  regulator: dt-bindings: qcom,rpmh: Add PMAU0102 support

 .../regulator/qcom,rpmh-regulator.yaml        |  3 +++
 drivers/regulator/qcom-rpmh-regulator.c       | 19 +++++++++++++++++++
 2 files changed, 22 insertions(+)

-- 
2.43.0

