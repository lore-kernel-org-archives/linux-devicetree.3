Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB2419644B
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 00:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777251174; cv=none; b=V36Pj+EmiMcSy2/TVoAFgnHVmAQV0OKLE6gPxXytie5lj0In1YuVD8Pjf9hE8mlEzK4vmG6FdD4oSPL2BuQnCOquGM7elB340LDbP9zRlb/tp2LV2tEbDYU35o9kcqMtHePu/oUJ0fKFpWMy2oVBYEKl5uWrp2LnxURVBDtazrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777251174; c=relaxed/simple;
	bh=wj1pHs2vG2knCv0mWwX1EbrjlpIcdpPxsvpAYDssIio=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XsAcxTukQvBJ7Zd5BIabmF29ZMAXhaaymJIms+R7rRQzlDsB7NxK5233xzMUoJpZ3rNaguU+zX1ra/tlrFLETGfKjmAZi132nHiIPmjhuC4oq2EymB6Bqbfu9B31Y8GnPABywfUfDpy8jA14V7n/cwXAWugzEPaG67brRyt81EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZhEhCdUR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SJe3TmG2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZhEhCdUR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SJe3TmG2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QAvXQ32387970
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 00:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TMb9t78mOkcCQYjlcqWYfJT/X7SxaLWkUuY
	4033SWnU=; b=ZhEhCdURSMLQtTS/SesmKMn/ae529coTpmlsjQRZ8vqFDV3g0lR
	ou71gPzLakXFBzEWeVc2u/jG1cGWMcmvoNIWPS20vEF1L1O+gaxKFRCZmU/Y+j+c
	yU/eTlaTRsuZUdGHPCPRvDk0gYpMkl9ye5DVPMGQWSA+d7+vBRycWpqt6yWdYBPj
	u41j32GQVT2KUM5oc2UEmXOrnCO7rfPB4y/dZPu1lww6uTa05e0l86he2Ict5xtf
	LyXwKGGV6l0whY44ypjVdF8nwyUh6PRLFQzJJBSKZ/KkALRtldF5Xykvh8ZGkltl
	RKdlhUdDhlqkvG3tPr+6DAEhwvT51Xmu7OA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnpw3ut8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 00:52:51 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12db218e265so18136969c88.0
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 17:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777251171; x=1777855971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TMb9t78mOkcCQYjlcqWYfJT/X7SxaLWkUuY4033SWnU=;
        b=SJe3TmG2ikHEKMcJGywCUk9F24fIMWxmXLsFyLZy2K3eMPCvTq9xybFMVh+Xb37yHl
         GxTGIRY/6X60iEVFLY3AOqsyfdDnszPhr84krg4NFSbu1/qSM8IS1Jabrz3o/NG2r/RF
         aq4beDwi77gt3aFbIuK/NXxBHfBszKj5XYi+f6cI0kenslcfc9htabWcNo4ocw5VGtrK
         09b+pPAGZ03iUeJCcwSQYhevKNO2ncwo5RWiprqM1HFENi2q+GXpBtiLRQeyY/nrKFhl
         4YDdqJAQhD/9k9xWpGw7Jqeh9z6Ta0eWfIuA+42agUY6EN05o1uINAkgaL+22b761OSt
         jVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777251171; x=1777855971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMb9t78mOkcCQYjlcqWYfJT/X7SxaLWkUuY4033SWnU=;
        b=b/GGIGuE4RMR9aMwgPSBc/Ea0Kh2a6MFGi43vbiHxPP+3ptyCcJib/yUv/ACfolu7D
         CfmkClp718s3byi+uEMHvYcQRCILeNusJQMos3ri0OUU3Q1E53P0P4ria01XGkTlN+h3
         iN4i6gPaXthHVVziSl8UjVCAwUUEpAGZBwafenGyKqN6Hu07mnlsznu0gcEAPrGCCHBe
         CqanKFZjvvW9OsSOl+spP5QpOua9To0GWpDQUx08e8UAixvM3aICyhEH1/p9+RH3vdR3
         sMzvDboqeWmMNruisGpg5tU9HUGBhZxrX4LPJo3TbQljrBmE9qPBiIuri+vNetV3PhuD
         364Q==
X-Forwarded-Encrypted: i=1; AFNElJ90bJNUz5wTFNCgljvQMdSHm9xTFtyuOyhGRj8pm3s0/LBW1bE5zMLXrSz4BIt5wueHAwnFx7e0BEvb@vger.kernel.org
X-Gm-Message-State: AOJu0YzyUfHrclMWUm0iCOopzpUdb5ZD58p13dHf0rEOGyBUU0XXpy+U
	P1Jcz7WtxEcfogWnoGHKngaZnMuGLn1l/SChxmt/Wn23YNHbIviBHAhLvaXnW7CvHdD+IyLbcMb
	J8kCP/WYdY785hiBMuAWo4KPH3eg9WitIViLVruoj+3oYqEVZU80av0+70Tk07LLb
X-Gm-Gg: AeBDietVmN8ZWtOlRbsxS9sSXuFWaF+tOpnWshzD3fXhT4fzufY98OPQgYlCoXnwSZH
	Zc1xc2wqFl4AOFndTAHl0G1/fTWUNQiLAaRlmEevVXATnxK9tQWlILCArxjrv19ZhN4t/Y38wOz
	wDYydWrl8gCAGuvDifRCzFOpDHUo9H9raUKOa4MClfem/5SjzgDfrM6TliR5vPqQ7kdhAMGYaZn
	BmEI/EHXVqUfmvgJAPkFceAwVieAQH8eTGqCLqm5zkiPYUdfN1bP0iIpv66GCfLEPcr0WiStS7M
	dMZPxQNhdrAWoGuQzTSy9JxIBtOwqBqnqX5+E9UZ4qh2PwcC64zpO+/I2guCUTw/qYmvP5v3/D0
	PRTE19Ngizdy3NjltrDpy9s27l8TdQ2JRVFYfJgwlkxEX0NQuYKGWqEbdAAp5ViVzHvwm+ue7vc
	ifp36BJfn0oVzXM7hz
X-Received: by 2002:a05:7022:30b:b0:12b:ed30:5b85 with SMTP id a92af1059eb24-12c73f67190mr21512047c88.2.1777251170955;
        Sun, 26 Apr 2026 17:52:50 -0700 (PDT)
X-Received: by 2002:a05:7022:30b:b0:12b:ed30:5b85 with SMTP id a92af1059eb24-12c73f67190mr21512027c88.2.1777251170394;
        Sun, 26 Apr 2026 17:52:50 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dca2c1c16sm11449051c88.5.2026.04.26.17.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 17:52:49 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add CPUCP mailbox support for Qualcomm Nord SoC
Date: Mon, 27 Apr 2026 08:52:34 +0800
Message-ID: <20260427005236.230106-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAwNiBTYWx0ZWRfX3c8AufrzjQIn
 bbQgfMwqn0uD+mD4C5q+TiYOlJAH0uu22AuyPBULybdxfaPcoWqt9c2ZasxGU3W+V0UwAV4hSLW
 1EoQ7JpLKPdDH8PYLTo/ui3qGN8b+XBtq7Qpnzq+jh7Q984DBkFEHeAKGLZZyKafUI+NjaCd8Qk
 QOijhB1BEnXSjNmtM5EgYzajUK+kDv68GGPtHFHou/16HDA0W50VjmRXYOfaMG3in0pjg1HJLx1
 /4F5fyLsoPUnm7rwZIayee8ypGySozKHPf8YqtQJZqP+DOk4QpEdfwb/oWZX+yRnhrvsgDPusxS
 VM+FrU+jw7YO4K1GmhhbhcJS6jHs9hwJzADVtgPJ88ZhgK0u2APYxhx0gSfIvA4kZyeb8DMB+fo
 i2qXhD2DTMlLklGt2/eyLeAw9UFfHGeC2hpFUMm1z1FQAeequQB30tLbT3c2TEwH6fT/VSJ8Vnf
 7kZarFOfXKM6MUsr1qA==
X-Proofpoint-ORIG-GUID: __x-I7qEc-Eh7V3wHzmW3WGiz6DblioU
X-Authority-Analysis: v=2.4 cv=RaGgzVtv c=1 sm=1 tr=0 ts=69eeb363 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wFnvaYuheMr2fJ8iLyYA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: __x-I7qEc-Eh7V3wHzmW3WGiz6DblioU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270006

This series adds CPUCP mailbox controller support for Qualcomm Nord SoC.

The Nord CPUCP mailbox is functionally identical to the existing x1e80100
implementation, except it exposes 16 IPC channels instead of 3. Patch 1
adds the Nord compatible string to the DT binding. Patch 2 refactors
the channel count from a hardcoded compile-time constant into
a per-hardware configuration struct populated via the device tree
match data

Changes in v2:
 - List Nord CPUCP as compatible with X1E80100 CPUCP in binding
 - Drop the unnecessary change on @chans comment from the driver patch
 - Link to v1: https://lore.kernel.org/all/20260420034932.1247344-1-shengchao.guo@oss.qualcomm.com/

Deepti Jaggi (2):
  dt-bindings: mailbox: qcom: Document Nord CPUCP mailbox controller
  mailbox: qcom-cpucp: Add support for Nord CPUCP mailbox controller

 .../bindings/mailbox/qcom,cpucp-mbox.yaml     |  1 +
 drivers/mailbox/qcom-cpucp-mbox.c             | 35 ++++++++++++++++---
 2 files changed, 31 insertions(+), 5 deletions(-)

-- 
2.43.0

