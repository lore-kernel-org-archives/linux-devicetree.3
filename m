Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221453624D9
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 17:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779470854; cv=none; b=ZlgJBfRdNLaeCIg4cgpXEtsC6zCneTxHLPkKJf+mH2zoDnxQJ/ptanFu61SpWom4p3Oq1OTxHD+Ckfg4wspuBu/DY+m+aV4f7qAh+uUpQTQ8KZrs4xZtraqxPg5m0k7DokX93olhyEe7HZ3Gr7y2Mh40LOeN5Y00RRpjzmvk2NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779470854; c=relaxed/simple;
	bh=5J92VyDWgLlUhHhTHy8tKjEQsCOLkA23R9MCmKQ/Gik=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RXPGHPX0dSi7NtqLyo5w9TZWGJ0a4biNjxB8y/bUxddhnhBqD1v1jlHQWkIpsojX/G06B+JlrYdshEEIXQqD1673Gyd+oRUeWZV2tWWDlhNc8JpPlZpH9iCCYnC77IyN4qFSEvJY994gV8s46IDraSlaWOjNWI8ldM25fju8mS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWPMRzJK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i3lOLQKv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWPMRzJK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i3lOLQKv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MFvIT41816067
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 17:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IwddrSzKn3iMA8482Qg57Y1aDHZnVmjtI5X
	veAcu0xk=; b=lWPMRzJKN7HeQN4GQ9Yz/4pz4w969E38tEFl1zP14zflezs9Msm
	4edV9ueXMugDSUCINXZR8HUG6W+E2its8baroXIznW1fJUwoyOvfnC9+/3btywx5
	MvUvzGBoXtkK39klviLdHLYC/DotuLcwXIzFcXLTIrDkKzbuLX8iBAZKCz5dJOg7
	K8EqTw3rf6QSltXkbh4GHu9dKtvb/szRpirAr+y7EAhoDztkf+0XQn/TG6xUalpi
	U6NZA0kWBRvFnLVJET4fpggXX5PjmiuUe59IteBcAQqsiEcuZOM4CuABRzekGhTU
	sfKLGC5fVvQirTMx6fh3Wy7gq6h6hWup1Ww==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrm34pc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 17:27:32 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-83536dc3be5so8646163b3a.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779470850; x=1780075650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IwddrSzKn3iMA8482Qg57Y1aDHZnVmjtI5XveAcu0xk=;
        b=i3lOLQKvJ+18q8afQH1lHLkECobsMdOujRXEH0lfvm/i3ger7r/H0S7FFvMGFU3YhM
         VwrGGhsiquAjy/ko24QdJv2OJDoH+Nh/lS04KkoVI679tAihJOlp2hLKhReJ8m1dkpls
         uY7QRHvwsoPm/D20Q9KeYuHSgsx4xF9rOr90IX89D+Xq5VXvBqT4BG8CvU8Dgk9xsolP
         xA4sEeqzkCTlmHp5XOfFRrwe8AQzFTcNi7IUAgn8NyyI06Y5Bf2MTqu56H/zag0IdUra
         BrraxgtIbZYHdiFkIKAShs+v2zVLDwhQFHz1RL0YX15DKbK6Z+D22m0cdkdyFBplpEjm
         iGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779470850; x=1780075650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwddrSzKn3iMA8482Qg57Y1aDHZnVmjtI5XveAcu0xk=;
        b=fbcC91CNbzveWQUo3xj0bgBAQ4UQLqyYjMOC6aPQfAKqNzzVsDaacarNgMW71ZTS89
         6Whqu5ZXVosjcpk0tkULSFuEcNwL3GeU0O/BbwVTkFiaEwsAJ9stpRX68YRwxNsRT6jT
         LTICwhJtpYDl/vf9T8C5Uqe50ZI5yv2Pnlejk+zA/4d5pN9VgQQskLHELmReIziUEh9V
         En/2sq2CIWIvLxSLkBEIGfmJ4ogu8Cp/6GAPyyXAtnXoMRaxdvQqFSX3yK4XD02gfCJJ
         0guPrwQdyPFZEtXGziZC3Oz3o6M1o4yV+WVBAZYIlJ6K2gIRswMQz39NE4h6or8Ifiem
         P6xQ==
X-Forwarded-Encrypted: i=1; AFNElJ/7PcNhfRnz+DVPlQ89uaqjwNUy9IUkYA2f1j/Z+H2Oh4XgEq2cB/hlZ8EtzQJIAWUKJVGMaNdXlPoH@vger.kernel.org
X-Gm-Message-State: AOJu0YzZzq0tE8Ka6lIVDiV3GjSJvJraW+puPXNcZZAOD2vOBlRUaELY
	RKHOHmvp5PMTEAoa5Tr6rP8Y3aJdYEJbJaPFDqXNObCslUGxBIFSne88uPblO3SDmnSB29jKBwa
	FUVWKvzY+mx0VpcPvd2HOkBkrNzM80VQQrmGMoskCP0cwG2xc6R2UF+OJ70xrvGOS
X-Gm-Gg: Acq92OEzyoBk1PVVIxZSyuUP77DbE4b8CKNV+1XYtGEliMiTc366bzLdM9Jbl63CS96
	5CUy6U+hQZ1Jyb1wmidYEtYByfdC0rf9SG79LKxVZHZKozCVMQ4w2fufMUgrqaB7MU1FOKEkjzv
	UhrAMNhSZcBk4RSbNSBT63NsQ40SdQ14Q2rlASesiyxmEVUW9QIFNpSbzXnX+XMi382P2maicnl
	lusyZpgzkR3rnojR7shM4NkFahxyDzllxPfnSCAJ/uqXPtLvuIT6yhfoMOMN07F+J7ZBgfGY8OI
	eWuxZwJ0ecsgXbixQ6DNzoHdmbN5j2Red3b8UUJx/x2u/0NpaH1+QPb4m2kkUjIsOrczF1eOwbm
	yysvJBOwuy3ZRaAMCIROmV1cddMvOla8MvqDTTzFkuLimVpQyPRVIuw==
X-Received: by 2002:a05:6a00:2a09:b0:83e:c8f8:cec7 with SMTP id d2e1a72fcca58-8415f352254mr4810271b3a.35.1779470850003;
        Fri, 22 May 2026 10:27:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:2a09:b0:83e:c8f8:cec7 with SMTP id d2e1a72fcca58-8415f352254mr4810241b3a.35.1779470849562;
        Fri, 22 May 2026 10:27:29 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ea09a9sm3045693b3a.31.2026.05.22.10.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 10:27:25 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        luca.weiss@fairphone.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH V2 0/3] Add Hawi UFS PHY and Controller support
Date: Fri, 22 May 2026 22:57:13 +0530
Message-Id: <20260522172716.820490-1-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0bsk0oJFlvi896qJLIowa-6Buk8o1oU3
X-Authority-Analysis: v=2.4 cv=Zekt8MVA c=1 sm=1 tr=0 ts=6a109204 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=wRtOOnJjwWicnHpPwtUA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE3NCBTYWx0ZWRfX9NX+qMWqffOc
 KOOgTTeC9FyBny1r5GY0I/ujPv4/lA7jW9UcBF3vfNrX79n41eq+ehOj8BhMDD2PQYygL/1x2nb
 ckoh6syKsfuL7SIiTJiAeF7igO6rMja+8F2ruXoDtSctEDULWTe7eC362AaW7td1/jgKMcMNJh5
 5oi6A+rdjMnAXLQX8BUR378oZhJDdynQ5zILgqzVAbvFt9XxMjeH4u0xPq/AN+nf8nNSLGCb0HO
 oArmuuSHjkmHVhqDllc+ZG/9IEskgQ8bvCmk7X3RsKNnCQz4IDjSK9yyeg8UcoodPfb+7QSHlNn
 fSjyKqWragAkWWfg8hSkPN2/rpztduhnoBNOwmHnE5doK9YQzuD5kAmXx16AK60V6awsrMR9fUC
 s2MrPAf2kxfIc33iCdWHEThDPR//6IawJ3Iy4Lzge0vl41+UW1xrnRQdPLnsCxRp5ma89kdfdEC
 R2IDM3nlkDyZCXTCTsQ==
X-Proofpoint-GUID: 0bsk0oJFlvi896qJLIowa-6Buk8o1oU3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220174

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

This series introduces devicetree binding documentation and PHY
initialization support required to enable UFS on this platform.

  1. Devicetree binding documentation for the QMP UFS PHY
     used on Qualcomm Hawi.
  2. Devicetree binding documentation for the UFS controller
     instance present on the Hawi platform.
  3. Initialization sequence tables and configuration required
     for the QMP UFS PHY on Hawi SoC.

---
changes from V1
1) Addressed Dmitry's comments to fix versioning for PCS and qserdes.
2) Addressed Mani's comments and fixed missed compatible string and
   binding name correction.

Palash Kambar (3):
  dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add Hawi UFS PHY
    compatible
  scsi: ufs: qcom :dt-bindings: Document the Hawi UFS controller
  phy: qcom-qmp-ufs: Add UFS PHY support on Hawi

 .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        |   2 +
 .../bindings/ufs/qcom,sm8650-ufshc.yaml       |   2 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h    |  24 +++
 .../phy-qcom-qmp-qserdes-txrx-ufs-v8.h        |  37 +++++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 140 ++++++++++++++++++
 5 files changed, 205 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h

-- 
2.34.1

