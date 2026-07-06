Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6633EFFCF
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 08:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783325743; cv=none; b=hobA8ujPXBXGGiP+7dkYNa6pGe6zB57h6UiuymHLm1JeOqL+UaWyTkqvj+IsEFvHEwFE/n3B8n/hcWsIM3kX5hYzqp5fFJiN3wms/0kszFZjT6blsBzLScKAbqOxC0qXKb/SPMpzGP9LqHwkLT37QIYilJkSxHWUiA45Xgi/MpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783325743; c=relaxed/simple;
	bh=RNJIaocZYsVAyi9K44GDvBfuC55YSi0vUGWPt8ppen0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=amJgkUdsbRdsx3eHYB5Gyw4YxjS1L0fXS8INcrcJvvbi5NNv/Rt9DZYYeQyIJGlvM1HDk5nOn0B5N/gBghBsehQl6MBEA3X4T3Q3egEQO8m9TzteEdaO34wUehyuiAG6G1teE3Y9gLaNB65KD0P84wQhV1MJMny9fqsW0hoh/tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ltw/ycGj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jvM4aziQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ltw/ycGj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jvM4aziQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6667CXsr3845755
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 08:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zNW0xFIonHoxP9CiO/pPyT
	lRjfRihWd8KfgBFkWrZRg=; b=ltw/ycGj6/CbJcfap2Pa9jgnEf8tKpeQszceMS
	8Yq7/66cRbtMtmoPCf0QVLA86NRLTWDwSkcqngPiyPTZvIpHdNp6ejdIiapX7QWq
	bkFEOg7bv1x+iKUwboXicsEOdFN8qrPvhhRu8m9hQBtk/tTcYn3VoEh1NBJpgn4f
	G6f5Egih+rokwp0pkPKORaxnJnB8OFqd9d4iD2RsfCgUlvg/Gl4oXIHlV/aOr904
	e2sr4WnoQ7MRW3d1GpFZF9Bq9gRJL2HveuDoWa6MhjpSvVjjzpDfJpPkzvzL5ORY
	W0iwFV6Hntk10fureFA0e5GXr2CIV00zK+leTSCRjT3mRKIw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxr83d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:15:18 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-847ac21582cso2930445b3a.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 01:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783325718; x=1783930518; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zNW0xFIonHoxP9CiO/pPyTlRjfRihWd8KfgBFkWrZRg=;
        b=jvM4aziQoR42U/sFcwc5o81hl7FdLdxebhnPd0yUizptC7a37VtuJQ6f702aZWjVon
         1v/qGX/3CoSFEMFCRvFU5bfBwFYjsSv9kXYFjCX5T3i8DxaruaXp7AAJtLhjCOeonJCp
         nM3+YMR45IXfF5GUp7St6/PYMActvOoEe3lOuo63OysHFmMpyhMa/rhpfIZRVu/YZGNA
         xc8MzVQsLjKUOa+Ud6HUOOMpMAOnb0WZ0j3avblWYe/4VSeWfS6bkH6CB26uc7znm6mR
         +3QRumVXHlwlyTJ9uAF7G4wJ4QCn/0jFvU5C44h1SqmUPxFaXhGTsDjhLfCOFrRMyKpb
         iKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783325718; x=1783930518;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNW0xFIonHoxP9CiO/pPyTlRjfRihWd8KfgBFkWrZRg=;
        b=rfHDRzpgHMeNFOpgSPDJ85xla7GCkVbf5YMTtDHnsTQqzB1TzFfRs2npiOjQfFiKmb
         oBZpT8cc6qOeH2TRAyn0AdTWk2t1PmavB+xXbOQrF5brCtLo6BI5tEIOf0dDGD0F6cvV
         myfh7/88lWSzOp6upPnIMOfwBMQJM9Wqr182rL2/jE3EujNkP0xAJdZe9kQ9tv2WT/MP
         Bqz6wD/YelHoipiCzYPFpl8cTRU3fKB5IoSYoaEOru8cmdmVdbtR2IuQZvp2Yt3DBo3W
         tNgQzRShs3X3w9qD3b8XKkjlgbaX7BVHFfTytQBOzk6lKdKKu6+7jl499fCX5H8a9tbF
         Gx4w==
X-Forwarded-Encrypted: i=1; AHgh+Rou68ILV/wizf8CYHVtuv+EBHGlvp6z1+Ckc0Jg7Gf/+6Bx7y0TsaY257ZShKkwGquis50FkHQ3equp@vger.kernel.org
X-Gm-Message-State: AOJu0YzFF5Y1i/DH1SqbdPNIrmizQGVj/yobSvzDAtEovmQGloBap0sw
	axC23mhttKa+qy1JsGGWKYVvcb5jOLlRBcM59vwJ8P14qJ4FeMJ8GIN/gzYXXQPq5EAW6iRkqhL
	ViRUaVsp2k3kqwWqg/Xizg7XqM9FOA4WuYQPE9S6mEjBSz2cUSmmHJODKjICCTWSt
X-Gm-Gg: AfdE7cmtR46N3hB3cm7eBo1gsU7g3mtoji/cEW3QbkRjQdbFhYoxiRcPMLGnd4VhE+C
	2DDDZF7H+JaZ+uzQkYUlnsxZ39YYkJnO8ZOAPao1KlCTckhBeb9WTyI53cvpZ+TZ65D7fFfmjTS
	MAHHvLlJuK6Abgt7MblcEO0UhQOXHBPioLSU2BLIGuyT49x2xmb+07LKIPqattwqn8msZMBXUqK
	V7USYXt0egbel1QFwjnwZzYEmodRgCFAWiXpskRZvBO6dIRnW5D4gC4NCILztsk7qJ9RRplmTOO
	x0oACOXCk2S3ZLuZLiUn9PUBvhRStVWBfHw4bwtZj5fWigU7tTy2E8VzeImzMZ1rQxZyTFiw5qQ
	t50wO/4h0MQwn4HKdTz5MIGb3g8rVyB7ko0so4rpjRgs=
X-Received: by 2002:a05:6a00:3686:b0:847:99a7:c751 with SMTP id d2e1a72fcca58-847f6dfde0bmr7953141b3a.25.1783325715375;
        Mon, 06 Jul 2026 01:15:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:3686:b0:847:99a7:c751 with SMTP id d2e1a72fcca58-847f6dfde0bmr7953100b3a.25.1783325714598;
        Mon, 06 Jul 2026 01:15:14 -0700 (PDT)
Received: from hu-sachgupt-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8f4cd4b1sm5584525a12.12.2026.07.06.01.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:15:13 -0700 (PDT)
From: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
Subject: [PATCH v2 0/2] thermal: qcom: Add Qualcomm SPMI MBG thermal
 monitor support
Date: Mon, 06 Jul 2026 13:44:34 +0530
Message-Id: <20260706-spmi-mbg-driver-v2-0-f883ff1d8719@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOtjS2oC/3WNQQ6CMBREr0K6tqRtbEVX3sOw+IUC31iL/dBoC
 He34NrNJC+ZebMwchEdsUuxsOgSEoZnBnUoWDPAs3cc28xMCWWEEZLT6JF72/M2YnKR60oBWA1
 gwLC8GqPr8L0bb/WPabZ310ybZmsMSFOIn/0yya33354kF9weq7OyWoM8dddAVL5meDTB+zIHq
 9d1/QKKGIYcxwAAAA==
X-Change-ID: 20260601-spmi-mbg-driver-582aab5aa6a6
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Sachin Gupta <sachin.gupta@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: j8Rnb04yRCTSQjgSiqjfGLWHgAXg0aJr
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4b6416 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=iUTBZumk_BVKSr9I0GoA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MiBTYWx0ZWRfX0ogLShH06MtJ
 eDpkg/ORkyKb/E85XrdlElY9v9ZN6CddlSGyJ7i9i88bmZui5n5yNzeFwysuX4DscX1gDekkKoQ
 sVEpWJa4sDOqr4C7sxsVTVrxwS6ZPBo=
X-Proofpoint-GUID: j8Rnb04yRCTSQjgSiqjfGLWHgAXg0aJr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MiBTYWx0ZWRfXzEmVcrkvtSGs
 7UvOPv5/yK7a2J0DRgtODyOabZHTIF7ZkXcmTXXmBUBKMQGxfzhyp/uYKNf8yFWtfjPjqrBZza4
 SiV8IJA/vvqJnarLUkMr/mdl3b4b7Nwpasih34OzMrZ7qM7DsteT9c0SXMq05s5uaxELYALQaKe
 kX61JUj2eztPBaQ7uBXooRLA/EMxLx8rizEqtfTL6SjyVWhY4HSFaDybYVGyTq59ZD64LG3N0sS
 mGQpSfdPgE/fvz/9YHUTsGYBiQW/C/2jLwyZM+2pcnw68lxWnT7sLQ1zO2AapWKOUHPPisH3Xpt
 x+rCoMP+q5VnB4HNFK62CmjsCNk++svDwFv3RKqXowEHUe/kAXAsy6Lp1I6Q42tEzCH+g4mGxLF
 3aCLhBCwKsi3aX7U0/qJSCZHToYNp0K91uUAjBmOCInsUknGy4ASCnJUbPrztiAOurFK2gO1s90
 JnIu9GIDtGGGCWCp5Dw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060082

This series adds support for Qualcomm MBG thermal monitoring.

Adding support for:
- DT bindings for the MBG thermal monitor peripheral on PM8775
- A new Qualcomm SPMI MBG thermal monitor driver under `drivers/thermal/qcom/`
 
The driver monitors die temperature alarms, handles the MBG interrupt on
upper-threshold violation, reads the fault status, and reports events to the
thermal framework.
 
RFC patch:
https://lore.kernel.org/all/qq3cggafexwpdrv46eqijxfmrdbqusl2vpbuswqmcvshqueaiw@r4mrmap4nwkt/
 

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
---
Changes in v2:
- Fix locking, -ERANGE, enum check, and flag race. [Sashiko AI]
- Rewrap commit text, rename binding file to match compatible. [Krzysztof] 
- Drop redundant comment, return -ERANGE, fix ISR locking. [Konrad]
- Link to v1: https://patch.msgid.link/20260601-spmi-mbg-driver-v1-0-b4892b55a17f@oss.qualcomm.com

---
Satya Priya Kakitapalli (2):
      dt-bindings: thermal: Add Qualcomm MBG thermal monitor support
      thermal: qcom: Add support for Qualcomm MBG thermal monitoring

 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |   4 +
 .../bindings/thermal/qcom,pm8775-mbg-tm.yaml       |  72 ++++++
 drivers/thermal/qcom/Kconfig                       |  11 +
 drivers/thermal/qcom/Makefile                      |   1 +
 drivers/thermal/qcom/qcom-spmi-mbg-tm.c            | 256 +++++++++++++++++++++
 5 files changed, 344 insertions(+)
---
base-commit: 2b763db0c2763d6bf73d7d3e69665222d1f377cf
change-id: 20260601-spmi-mbg-driver-582aab5aa6a6

Best regards,
--  
Sachin Gupta <sachin.gupta@oss.qualcomm.com>

