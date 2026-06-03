Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256D041C308
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 11:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780485981; cv=none; b=JgKWlhFLJArh7fGL/a/f8dFukuVqJW03seZzycQZIvQQpLtiTrWIgp41tBactt6eFUOPufPRVIfQNwAGZeLj1XKE0wzK3MOf+1GAsFKNUgcp/2EdzEeVCiVolZNgViuBCA1dxVeM7ya5eKXF4SZmRHNVpG4kaF09As9c+C4ml5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780485981; c=relaxed/simple;
	bh=P0gP3G/IWPqITK42jVKRXDA25rwoPd2omiKXW4QQQFM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mUK/O/XSy8fHqGBtJbPWnq4nSdsRcTj+oN1j9v9MfhDYQaBfvp3LAtFoiwfvTWeXW48v2yqVSs6DWY2v8PADbAhHdFbs7xlR0Iox9stAZOrFenN88La2nMgqqGt5PZP4o57X86j+sRXDv3pdyLHaxVPR0T9ff5JK6EpTe0VWPQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QfkMf92Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AdVDilt0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QfkMf92Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AdVDilt0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536v6uh1755365
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 11:26:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=i6ZuTkqLJTr+Zb68NOePOg
	D5Ckp3vOH2IUNNiD17b6A=; b=QfkMf92Z8LYzDOd/Fhtm34KDgwb4OzrKTpqATN
	rSp27mdf+vNni+iERepy+Byle9smftsnMz4ED+BpKlO8Jbcev6WCv55QMwJ1v91S
	//GoVQcpKWlAnU75+4+z65M2G0JEjYCk3ng7Ctt0oqcoBlMCUrkZXzydcaEC42Ed
	zqdv+Wx//5BDVJca5782DI+/sZShXHu6zlCyBo0v6HoyjqZKIjAAogcfmSsYvfuE
	4mRV/ksWVtmd6bjRW8KmPcnHXCrEOhRWVFXV0ywNommbySLB3ZUO4fNIoy1ToTbS
	7UJI7ks/PP1tT9/Wcbz9K3eu5RQfV/LSntfRJBQOOMRSlzVQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejff0147r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 11:26:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0a99db8dfso43426805ad.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 04:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780485978; x=1781090778; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i6ZuTkqLJTr+Zb68NOePOgD5Ckp3vOH2IUNNiD17b6A=;
        b=AdVDilt0/5158MAcsCQ7xG8XdrBfYqJTJSsuH8RWyJBT08VYLoi3cjTV4fgDK9yxvX
         8orYC4IofGy/rYh90ZnHpINlk8njXLA2EzuPQje0iOm/c2g/PX7VOdGpMNHqrJ57+inZ
         VS8NyO0l6RwZzaE4S/F8NRBXg/hWr1zmjy7xtTaj5IQZWVk16L29SsdSNxSvpqy1lZ09
         feC/34GnZkEIelY9zS4PfGuss/UUArZF9OLWdYUTpXUY77tbEqa4mZ5WsxMCH6IknKt6
         gO+ADHlzVV4yFVc5bogbEAjJ7ySRRWSF18sAYgseMWsaVSDXyC5AyiMhtYdMFqyuxYmv
         1utA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780485978; x=1781090778;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6ZuTkqLJTr+Zb68NOePOgD5Ckp3vOH2IUNNiD17b6A=;
        b=WZHih6W3jSMJzPcaFC+siBgx69D2ezmktW91p58ZPXF07xGniIyhzK2nbhSrSzl3Vy
         bovPkAJKkU7BClx6AO3qveZMNgXU9bymAWeZSYeuNfLxoBedcYNMJ43xkJlwquSk6jmu
         S4zfx2/gcNgK6VCtSLtYFJ3ZLFDW4Bik8sUlnCmOxzQEsd1HlxGUzdUiu7/FQ26TEKjv
         pOhX6eXdXsiv7W2EdUo0txDsDzBB8Wn9cTTuVX8NyMl69YzF8/8rcKtwmwRsRYpIbm/X
         6ifF0E4Eul+vDuO7ZGYs3XGti8OCLxJsbPp6/JnEDJvPoBR28c1yeHtfRHJnEettdIhi
         8lkg==
X-Forwarded-Encrypted: i=1; AFNElJ/gArB6XnfIc++3gAk2i6HiRwQq0GcEvPq+798mU7IKnmXbIK7VCD/iuAam5ug2va74fVO3VU+TJaEe@vger.kernel.org
X-Gm-Message-State: AOJu0YytYWnh6D4p57cUCyJUEj5P/CTD/nWydgx2RHSNhV+Q1gg3FS9u
	cZt1glo4rE7JOQ3PL7wtJg+7cSrY2z/dxaIkHRKU3KunJ5UvNfhqAtXqxveJy59K9VPqCxR2NE2
	UVAOJ3ZKL9ZY1vHcmqp/rN2E+zmuf0Q4rhBogyWLlrsOIv+LpTg8AkySBDaKd3+QJ
X-Gm-Gg: Acq92OHmsgTncRE8WsMDzAXI4otSizt6TBNgNyYNyEHPrzp2V36s/gOlToqpZgzj/rE
	k2oeG8Jrdh1MHMAPj1x7JSHitYx51M6zPilE6D1vqm/o49EwnYtbIajRNG2M+fDVv9aABVUt2hI
	/BAYbue1R9H8wB47jqLHmOGodP/Ga72O6JKSP5DyWNImnVW4eI00u9+iep7b+FH5MNRmZQXEE4/
	ZEvpjx/DaGMuYEzSQ1bjRCMIoRZ5UxG5I+27fx9eFj6hyj1JUm5b7mjKUpcHGQgch5NdkY/SrNN
	iEAu17fVwbnQqccXQHULGxzcz8hLx2RESYqPjIFcW5j5ZtVI31r9CxonE9/M7cHM4zDazqVSY5n
	makXAQqZZsJelXiwDqEmd7qEOo46lA5JSGkQXXvjous5zzvihtg4phcY=
X-Received: by 2002:a17:902:e5c6:b0:2c0:cb90:1e07 with SMTP id d9443c01a7336-2c163a12aedmr32539445ad.11.1780485978153;
        Wed, 03 Jun 2026 04:26:18 -0700 (PDT)
X-Received: by 2002:a17:902:e5c6:b0:2c0:cb90:1e07 with SMTP id d9443c01a7336-2c163a12aedmr32539055ad.11.1780485977695;
        Wed, 03 Jun 2026 04:26:17 -0700 (PDT)
Received: from [169.254.0.2] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e0ecsm22704275ad.45.2026.06.03.04.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:26:17 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Add EPSS L3 provider support on Qualcomm Shikra SoC
Date: Wed, 03 Jun 2026 11:26:11 +0000
Message-Id: <20260603-shikra_epss_l3-v3-0-3c2e0b796e78@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFMPIGoC/3WNyw6CMBREf4V0bQl9EeLK/zCEFLyVq0CxF4iG8
 O8WXLuZ5CQzZ1ZGEBCInZOVBViQ0A8R1ClhTWuHO3C8RWYyk3lmpObU4jPYCkaiqlPcSGkdaFc
 XzrA4GgM4fB/Ca/ljmusHNNNu2Rst0uTD53hcxN77K18Ez3gtjCysVrlQ+uKJ0tdsu8b3fRqDl
 du2fQE9BzMMxQAAAA==
X-Change-ID: 20260524-shikra_epss_l3-522afe4fb8f5
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: 4fREzbnMbHcA7u_Ym1YZzgzKmONB2H4Q
X-Proofpoint-ORIG-GUID: 4fREzbnMbHcA7u_Ym1YZzgzKmONB2H4Q
X-Authority-Analysis: v=2.4 cv=LYwMLDfi c=1 sm=1 tr=0 ts=6a200f5b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=DWCbI4xYja3NA8O2gMYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEwOSBTYWx0ZWRfX4ML44IOD2CEx
 3Igk11HPyApr8WtUvn1QaAKg/DRaaca57onjy5wJsJZaO8bGxvKYzQPb2HSeG338OHOQ2MKD/9E
 PxiK6JCa6UGbxwhN0RhMHH7UeIgeOYDDMnw2eioaRO+cOkIYltDfzbImzubb1DwpB5mrSZ7Mbjs
 U22uIEyXDl69+MDhTiaWTsFd3F4SQb+n7JROs1rdAuglbBXBthwKR70M0SPmO1mauSbElpWlAM3
 k14Ukchr4ttjtwz7lEHEs61WaVkWusfizas2noJ7FxGx6yc0JlpBASGbDW5KdGFB6wYr59Z4jEF
 xss8Pt9QH16gyaMUXzKu7rzl8PnQNhLBgOjs4Yc6BbzZ+mi0PX2eRJedDKxYU7HwLQRemHDUSC6
 PKXZzUlD++G9IZwiZWxnKUlDuQGB9NeGkvDSVt+NR+An2WtZTI79L4KMkrpILj/9nj9M+oo6VQr
 yAfR4zSzmcorgQ/pDZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030109

Add Epoch Subsystem (EPSS) L3 scaling support on Qualcomm Shikra SoC.
EPSS hardware on Shikra is similar to other SoCs but supports only twelve
L3 frequency entries (LUT). Reading the LUT beyond supported frequencies
can expose incorrect frequencies.
Introduce new compatible to represent this constrained variant of EPSS.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
Changes in v3:
- Update the commit text to reflect the correct binding yaml.
- Link to v2: https://patch.msgid.link/20260603-shikra_epss_l3-v2-1-480cdb5abc85@oss.qualcomm.com

Changes in v2:
- Use the existing qcom,osm-l3 bindings to describe the Qualcomm Shikra
  EPSS L3 hardware, as it is similar to other Qualcomm EPSS/OSM L3
  hardware. [Krzysztof]
- Link to v1: https://patch.msgid.link/20260524-shikra_epss_l3-v1-0-b1528a436134@oss.qualcomm.com

---
Raviteja Laggyshetty (2):
      dt-bindings: interconnect: qcom,osm-l3: Add EPSS L3 DT binding for Qualcomm Shikra SoC
      interconnect: qcom: Add EPSS L3 scaling support for Shikra SoC

 .../devicetree/bindings/interconnect/qcom,osm-l3.yaml    |  2 ++
 drivers/interconnect/qcom/osm-l3.c                       | 16 +++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260524-shikra_epss_l3-522afe4fb8f5

Best regards,
--  
Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>

