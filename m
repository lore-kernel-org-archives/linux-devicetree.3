Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AE627FD44
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 00:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774917636; cv=none; b=iDV3T8eNYRq+nCiX1QdELvUwm9NCae/NrWCcol9ESFVe9X8iqGXWiuhQ9Z2xmtgtYr/vPNziQ23kLHKN7XjHejoR6+ZoBH9DeFdgGn2Tv1Ob3kYJsaAFbW+4OTX4VPSS/VKWhEPfPMXl1ZfUE1z8E/7erplI5Kqu0dfI1CSn4cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774917636; c=relaxed/simple;
	bh=LfqcOZfZvhcwZNbwczyCORllU/SVkunTmXAiwRXBkjI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RllJUyx0i/BRO5eb6Ud38yiN95Lpw3yfl14eWzbZCgKY23vHV8Rz+A/PqgEAzL5phCui0I9aWp+Q6oqtFeAzAxLN5nYU6ByvzWzlNIjl9HcPq2VOiInYeXXzcD/N1OMx/4RzVS9k3YR/epFehPsAlxScqjPjYxVL5Ztie6troUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O1ahBajX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ItTDOnko; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O1ahBajX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ItTDOnko"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UL44431841960
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 00:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yGlqzkun2mmYZWtqvl1ev6
	vbHU8gWKSr0vNUZcrj+RE=; b=O1ahBajXtfwbeABd4Ha9DEiNuVlD0+t1N7oWRn
	KlsZrp3Ohka/u6sprFpQGUavLFUBeG+t23lYkYtE4j+2ndyI74SoqkwxrzrFSlpW
	hH6GoAhVnlDmFKpPIxx2oZIjJZVRSrIFHcsnfzUS2HEob4Yr8sGS8a53J8k1qgXf
	0P6vYt+fTqdRgip++O1v5vPNuzj4NHNyViA2drXU1iY1mMhfgG7m7Qqwd3gFbLfQ
	9AttlE3wnM0grN1FPAVHLJMDT2BwJXyctxXVx1HK4LQiXumTQN7bh1YDWPCwXcpY
	2WWH+y8pUgjTAksJdod3FAIhgZ4c5fKCJcMmrP9ypw4KIQJQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80rsgjkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 00:40:32 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c4cfe08c9dso4269565eec.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 17:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774917632; x=1775522432; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yGlqzkun2mmYZWtqvl1ev6vbHU8gWKSr0vNUZcrj+RE=;
        b=ItTDOnkoEXbTlLWxPaJpJLRDRRuw0AGSCcWCgu/CyziAzjNo9aX8vT0aa4N6ZmG2Cu
         L5ecyd0LwJUBXeDo0fwmp7LtHQs7CpiHXm11cy/MNMOzeNEI98gyJKZ8v3Aad0Tw84CF
         H1fcypQ4dGkIpvUnR5fr0JZTbe+4j4Nmoz/EiyehJKSGGUs8l82InOMCPur87BT2zZDR
         Cy/gG2la0F9m6Z3uunQ8uKAz2mP1qIPQJ8W/eq9F+Z91Bafu0vlpc/I23A0gRAd/gHY3
         d3WsBi9HrlQOUfTYVmnrCmnh0zuj+fD2pVWQkPEnOm8xhQVOPMtgZ3RzdGjMpZcLWiy0
         FLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774917632; x=1775522432;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGlqzkun2mmYZWtqvl1ev6vbHU8gWKSr0vNUZcrj+RE=;
        b=mC1QKl7HKrnpWiDFzdlbnjU6YsvKSGtaTkfwwzLsfN+g0H/pCFTXL+5YKsfUep9tk3
         wEBlkyUGgEt79Nq3ZvfqZi5n+NmTI7FVJcoTXy7/V5MxHRpWMvYqz9ah5YjqoE8SRSA4
         7gQ4h85H2EJhhCsnf0aLvr8vnN1AWUoxPgnT1cZJdw0xa80SJ55BrL8IWF+XvpqUR/RT
         PpjpJafF3KnHYTH+jKfb4QG9mkIPXp3R2ewxNhQQdAoEH4OuCMnQ9zJwu6bIA+L085xZ
         Zy4S+8sygt/4ou6a5j1mTy9o+e9IlNUD7VdYeJLcynnxM6NT28LbUo48ppec5dvJUBJ+
         Ab0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVOceM0quXf4/cQdijjO+EGKy2BWWfr2FSdcbRy6sTCIqcEnNz9wKj0mIT7G6ogGegqxkg7KL9gMppK@vger.kernel.org
X-Gm-Message-State: AOJu0YwH46Igi3CdNH207XRxeEi5oU2+7dH6WSiEDUyZV35xuysfJ5LK
	fErEBFLURgODDLH94BaH7akGVU94heNcG4opta3U9ph9e4EppFwfVx9viSiHj8e0C42i/8R991X
	656SyRp0CRIMBOpkK0T1rvndlwmBgrlzlUedfWhV8tTGNocQc2MalDSt6nZUeKpug
X-Gm-Gg: ATEYQzwYosxb7epwjDTr9bczQ5uKmluG/an5RDU7j3RZGzSkFo1c4CysEd4pEo4am4n
	EEzOtaBGCYevHbZcpl0gv6ubuBBn1dpfjym7owMDnQy4UFSxqnLRaahE/v4JmUQGOTxr2b9PoCC
	z7WU4PC1NGJUB9GK8Ialv6HHd7Ig6txNxRLTh24emEez9Sct0TlAxLxAZylC8GmrkaZlAr4qeJN
	b3nM2IS8ngNnHqjSjO58IuIMI9WnMgllBG5K+GVcy4F1QQQdqC8igSS/daAqic8dea57FMHxsTc
	rzAuCfZBbMbICLLJXC1oxAJCN8H40YHFgkq0+K9C/z65fjvwneSbr0RSfXcYNyQyWNjaxUjez1C
	y2zZRrMvuzYnKfXVN42sgl4MFkdYipipVzCfh9ptB47OEBGq29fSv4d1t72CdpiKdohZ/f2cSFs
	uR
X-Received: by 2002:a05:693c:3008:b0:2b8:5159:eca5 with SMTP id 5a478bee46e88-2c185d0165dmr8811675eec.14.1774917631785;
        Mon, 30 Mar 2026 17:40:31 -0700 (PDT)
X-Received: by 2002:a05:693c:3008:b0:2b8:5159:eca5 with SMTP id 5a478bee46e88-2c185d0165dmr8811667eec.14.1774917631217;
        Mon, 30 Mar 2026 17:40:31 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c10361e7sm8959988eec.0.2026.03.30.17.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 17:40:30 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Subject: [PATCH 0/2] interconnect: qcom: Add support for upcoming Hawi SoC
Date: Mon, 30 Mar 2026 17:39:59 -0700
Message-Id: <20260330-icc-hawi-v1-0-4b54a9e7d38c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN8Xy2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0ND3czkZN2MxPJM3RSzlGRDM9M0C0tjUyWg8oKi1LTMCrBR0bG1tQB
 VxmfeWgAAAA==
X-Change-ID: 20260311-icc-hawi-d6dc165f8935
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774917630; l=904;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=LfqcOZfZvhcwZNbwczyCORllU/SVkunTmXAiwRXBkjI=;
 b=MDpvj5aQAAeoHrotKVnzuHgYx7Ia2rbhJRMSzG9xSHXHql/O0gmqanoOu6XVPjU5Lp+2eQBVC
 4FHloYIuq0qB7LMlR+EFr1fJWJEiiESmmok2FiTJtemQdsIZP+IzEKj
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-GUID: A6iYdV3jS2_yUfo6DN23OfOaUPb_4TiG
X-Authority-Analysis: v=2.4 cv=VInQXtPX c=1 sm=1 tr=0 ts=69cb1800 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=QtE5Bt5ectBoWJzr9z0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: A6iYdV3jS2_yUfo6DN23OfOaUPb_4TiG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAwMyBTYWx0ZWRfX45H2BS9GzSyj
 w7+UvcyBonlgoLsOfPebWCjxSxJ9/HVK9OR8fEgxfcLCDQC6iKay3WJmq424+BWLCz9fR7BiTZH
 STW/O/tabRQKsdbm3A6fCHw8fNV+DXaeJCQk95op+8WDWVT5DpaSiXTm+UwJ9Y9qnBy3wsDX8xK
 Lv4h6qUMbFw6TFUGcku7HSgnlbfZOJeq8dvKr2T0j55SP9TDJrqifKiKT8RpVOOIv5RUqSYrGEn
 AZ7REg/49cstj5+IZ2Qb/CETbaMyK2drX7hEidgoEKNOLL1zS41e3Ko2ingMHVmU/FrnIE4bEa5
 W28dg/ouTvkzXmqi96KvDbrZl//cI26kzaMvmwBtBi7lK0hpVxlE/SIXuZVcM0IAyHPgyu9tqDj
 jdQ0HZMLIpj2yxar6UExyhR31fCeZCA4N12h3GAqUZzanxtV6tdwCFFXrpH/1aMDEx/yHtQMrYy
 jMMxXxajP2XnIS8CwFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310003

Add interconnect bindings and RPMh-based interconnect
driver support for the upcoming Qualcomm Hawi SoC.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
Vivek Aknurwar (2):
      dt-bindings: interconnect: document the RPMh Network-On-Chip interconnect in Hawi SoC
      interconnect: qcom: add Hawi interconnect provider driver

 .../bindings/interconnect/qcom,hawi-rpmh.yaml      |  126 ++
 drivers/interconnect/qcom/Kconfig                  |    9 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/hawi.c                   | 2021 ++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,hawi-rpmh.h  |  164 ++
 5 files changed, 2322 insertions(+)
---
base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
change-id: 20260311-icc-hawi-d6dc165f8935

Best regards,
-- 
Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>

