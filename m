Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771E221ABB1
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553473; cv=none; b=bX20LELOJFL79PRF7Kt3MQTcKzMxiLzcoVpu/foliJTvQ1d+DS0BuLGzRemFc1xxgHwnUVBunJ8wE/bnPuEEYbOy2dL0DMLsvnw4hAxUCK+v/3Omz49KSivuFMNE+LZdnXpKFSmUtOklP0HcaZz5hxTyHSv01LMzs1Mylb0uUDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553473; c=relaxed/simple;
	bh=8+i+ccLxh6LDcZP5Gh1DQIKzpVOUj9D5y2r+79BWzJE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iLFkA7PJhIgxddwI6rAvF7JwftuH3eZu/qO/OiJX0Y9Jfyq56O2n/rnen2GsQJCs7qBoM4exAgSrt/D4vP1YrerNJwXh0Iae/K1l5+xrI9OuLSysVBo9rNSYC8cd1LsdSInPE5AJOXxJVdgUvhPQzG6fqkdSyZX7vm/MC2TXwK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DjOUXjQa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IYiEMRsx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DjOUXjQa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IYiEMRsx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O6ScR91982465
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8pOWX7mEcUUo3NdzZeNrT7
	XWoFlnxo1OqZkoMF9fLwU=; b=DjOUXjQauRh5y0Vc1QS0XsKqj6DR7Tw7EwbaKM
	Cpftoxd5/E5c8e5N1gooaogw5sZI7kcvXAUZvNUPWo46CMNFzEa0eOc1Cg9iv1r2
	VEuTehUxqj2SGTTrJFcE/VyIHEjg4iZsw6ACRk41emcWG6fnsMRyi+uZea4VOOF2
	JZbf8yueW/f/eYAFZgFm9QBMCJxhOKs9LvDv5ss01uO8YJ1BGFHg5VM1ZEDDhQdv
	F/4cppqQPQi6UmvF280Xf1gB7NDZnRKUvzasZhI9izF31jInhayS/frxMLzLm13v
	s0tDuoAU6xmOX31tOCP9hpptJzAyq9lVgV460YpschuL2Vcw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gqn8187-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:37:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cf1c86963bso39111325ad.0
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 23:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787553470; x=1788158270; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8pOWX7mEcUUo3NdzZeNrT7XWoFlnxo1OqZkoMF9fLwU=;
        b=IYiEMRsxhWiE7XRCpAYJhbaPSp0qlb09nc3qKy4GIOK2cg2u/A2OARjT4+IFsXI9Ry
         33rpajNCcrjniAdM9KenllNHZhfn4sJbv/b5MnHhYluN5IhHh8coE6/RX9gNjQWjUh+A
         Dk+iJzTtEFtHv3s9PAw44AjZaMckkOYkCiYZTHo1C/GhdF99kA6ymZZvyYWfBbW9z+4l
         Q74DDA2KR6VqZC8AgFCqt/H/4HuXGQEIJZ8yOHb37Yry685WBTkhoOgdxJSaegdaWt7s
         EM/dDGg7bVDIH6GLVDGBQ4LyCPTGD3AZWXmrZGGgn5j08P9gzlit9SVkqejdVDdNPHJ/
         sNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787553470; x=1788158270;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8pOWX7mEcUUo3NdzZeNrT7XWoFlnxo1OqZkoMF9fLwU=;
        b=PQfgGUfRUvQ0MIO4H8kT76fOP0k9nAWk4P+ROxo8eBinj9zjx8uuZf7ssL1ma5ACu+
         gC+dknApZNFx3iMDByvFeQxFEm3LOEJ7LZpYmbkpEU4o7eTUs/FEZ6gAmtEXpVL/ejW7
         rCbAgeHsAYBZV1dWnIZNS9cCmIcX8W+QyN1+EQFnA8tfQfKXwEMD6oF+QVKRdwH9mBwm
         McQ+Au7IhToQSrcjf0DXL5Eh0PAfm1EVbQBLqrKdHMDijKy+jusC8Pz9FgK0NNnmjEiq
         6t/N5TralMkcT7l9n5ZHQC7Awt1AYRqP9OhQoO1NChGphB/VoDg2Q/7TAEATVQQqPUy8
         6v6w==
X-Forwarded-Encrypted: i=1; AHgh+Rp71CjkzIM36m7QN7B/WSXtQAoNWKTWg9AviZ26ChfDH+Yr3wtGemNA67tYFroMcnb4zzlCban9nGM2@vger.kernel.org
X-Gm-Message-State: AFuF++mdmj0xDmfgsfLKLVJiBfVce3RlG8QmWfw0l5UW9T+X8ACwHqkq
	cCH3kl4KkC2+K0UfwQVdgHbckDHDXNrna+J8BceLpy1RWzbdoQvzFq1EhKLrMU+tLUWxwYbjydS
	UUrx/Qn4GB9nU/3fF6UrQSmfsY7Z+4CnMB+e6Q7lufLbNT3cp+WDovvY0r7APHcD8kntylgQe
X-Gm-Gg: AR+sD12u+MXe9R7//BHsWrgLtX+RDNs/E0kwiJEIkUw0zZLc/5MJhDMaiUPJBBafByK
	88xxawmv9d6Rfpf05octhMDFS0lNCmxTYgKgteQW4a2yw57DFAPHzl8pX6kNUXehqStxUDF9Aj1
	9k4qJPuKPetfEhmkbjD19xDG5/FdweVAfEeEZK3f2GMdlb4cugF+3WU8jUUae/Tl8asWq3aPbin
	63KAWawVcp+8oXjuGK8aCp8yJ8PJv04vSOZ1XS3QaEg6eNTwOEoZbP7UrxGwkMZ5dkNiT1+UziZ
	HywhLNA7z88JFUB0ftbmI6Dvx3llQukNi4hW6Qn4FTASJSCAuyV7PUEmAJHX18kGjC+RuZMFN2z
	OZXXqQFvCsb4AFFb95o6HYRY94o492syoxJmFWzQBG9A9HeFQ9EEuJJ91GZAHPa+QyuiQMtQnRq
	qCfs+l9DudBJ+ujwvT2hBa49vAuTSjzw==
X-Received: by 2002:a17:90b:2d0b:b0:38e:9784:dd47 with SMTP id 98e67ed59e1d1-395a044f2c1mr37328302a91.1.1787553470435;
        Sun, 23 Aug 2026 23:37:50 -0700 (PDT)
X-Received: by 2002:a17:90b:2d0b:b0:38e:9784:dd47 with SMTP id 98e67ed59e1d1-395a044f2c1mr37328255a91.1.1787553469952;
        Sun, 23 Aug 2026 23:37:49 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141861732f8sm21667830c88.10.2026.08.23.23.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 23:37:49 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH 0/5] Add support for USB phys in IPQ9650
Date: Mon, 24 Aug 2026 12:07:40 +0530
Message-Id: <20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALTmi2oC/y3MwQ6CMBCE4Vdp9uwmZaON8iqGA5ZB9kDBthoM4
 d1thOM/mXwrJURFotqsFPHRpFMoUZ0M+aENT7B2pUmsOHsVy/PwZefO6C7wVm5C5TlH9Lr8lXu
 zd8TrXbC8j/RoE9hP46i5NgFL5gOsqNm2HwooH0GGAAAA
X-Change-ID: 20260820-phy-664ed5ec0292
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfX5xgvcP8fCN2O
 ScDfzCdWrCoxqxnO/ThFO5yJ26hlk8xFxlKH1Vzg51FcKuMmVYYq55OgBDkCaYxKW2x0jNqgHV2
 1rOvdwFx2jP4HWS1Twjus/yNaN9xAMk=
X-Proofpoint-GUID: zywqkWVcLR9dSb8-Hbmmq3_o-inwDFmI
X-Authority-Analysis: v=2.4 cv=fqXsol4f c=1 sm=1 tr=0 ts=6a8be6bf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=QVgSJ0PFQKcnxtkCEG0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfX1YzQfrNnPV00
 WqYliw1fp9eki5FGxkJhphU6zlvc7be46IHxNgaldDrdVYfKxBSvYioAWR+V/yIbBJKErMVWSFp
 sAxEpAzMsoRERH7g6KOgRV8XfrWp4NHXsxOGuGIW3fUWFW2UW+62X/uqfM5B92juUaW6O86mOVd
 bcV3sN/dXOVgU1TfSxrsUC3SjFVAHdWkz8zTy6CDe2QGnxt8WiZBULlLhlrlanYnjHG37EdvUvI
 24CYQXZuzVD68JbaGkCvpBRqi2UiuDtNTzhek8P/KeQnnAqPEfGoDHH31HLpBQv0cWPLtfOugRi
 Dg0fOuz0ON/G+AcHeKReUYZlkEFivk5YFz/wGSlP6/egs13NLvkhVCW/UAAtGIkMALbjh+N2+yv
 883OMP883HC7DsJfRq13S4h9dNfbQzdu9OBG/3VE14tfs94tUKjkzOeBVPC3q7Ip0sqTW1vJB33
 eDEmlByFVZel5QkyG1g==
X-Proofpoint-ORIG-GUID: zywqkWVcLR9dSb8-Hbmmq3_o-inwDFmI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240057

This series
 - Adds dt-bindings and driver changes for the high speed and super speed
   phys in IPQ9650.
 - IPQ9650 specific init tables to QMP super speed phy driver.
 - The Femto high speed phy driver is refactored to accomodate differences
   in the init sequences between SoCs first and then support for IPQ9650 is
   included.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Varadarajan Narayanan (5):
      dt-bindings: phy: qcom,qmp-usb: Add IPQ9650 USB3 PHY
      dt-bindings: phy: qcom,usb-snps-femto-v2: Add IPQ9650 compatible
      phy: qcom: qmp-usb: Add IPQ9650 USB3 PHY configuration
      phy: qcom: snps-femto-v2: Move PHY init registers to config tables
      phy: qcom: snps-femto-v2: Add IPQ9650 support

 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        |   2 +
 .../bindings/phy/qcom,usb-snps-femto-v2.yaml       |   4 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            | 118 +++++++++++++
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c      | 182 +++++++++++++++------
 4 files changed, 260 insertions(+), 46 deletions(-)
---
base-commit: 862ff50ac20d5e0899a5907ebc5ceee73ed4b099
change-id: 20260820-phy-664ed5ec0292

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

