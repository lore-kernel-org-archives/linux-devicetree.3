Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2536936D9EC
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 09:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367889; cv=none; b=ue9Yqw0qhe+TU0s9AVEADUS3GfeMiomTdYTJcrktkIpPmM1cJRr/gsT7jtxpeWen/KHweNx3+keamJBme5Cj3fPGcCF2bMw11xdngH6SFDcuvcrtl7SjjImiLkHWFE7HBRR7qPDo3Lf0wKCQIivuJ1/XxZwNRgPOjJ+U9JgW7Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367889; c=relaxed/simple;
	bh=0zmlQoCa7bIjbCwfu9zO8FG/nhxkc2X/El8W20NrRlk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KK6Dz1Pyl3FzXaLwoSBkEvkbo4BmJzJ6JeVDsAiA7zIRssv1atE5q/8Lk71MN9dqEbeX3kxW22Fysrzu1kqFTq8eQAW4flqYmOwS/3LT0n94I9HhLEycE4szbrLgJAcEvV4tDgmuNOoXEPeaDgC/eM05mfVqCrn5EJI2ier34aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QCMrERII; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LOmdOJcx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QCMrERII";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LOmdOJcx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S54CWV429172
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 09:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1kWTp5zkgbaZx4e4AZmjYa1jMdyIf9wa3QliWzgpJZA=; b=QCMrERIIhE5SmPtq
	HLXRru6JqCHuB0c+mFRC4/DhOqLkss1plF4qHxrZH9yhcoB4a8kN9iy8ScDRprpA
	ytnwYXSHQIwiMBLTK9xLeQghVxQqvvZ8jmXG9abuXPV+HHArQs4qJEPIbiWhGiQ1
	vm2X/DlXZPfk2fd+tag/FfEALLywWg27dr44ukd82BsqTOYVID6xH32kBk1+8q/d
	BIwyKxZo4o2YnRjDwcrCNVyifXATra0UpoJGq3vKbNLG54EMqAH2znEKqx7koNEp
	wYA+NdSKXokiQ8nOVe6glHdtA72R1UXEhQ+keaRXoQ4sHGEEyXK8X5ux2MzQZ76b
	putmow==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7x34axc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 09:18:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b258636d16so111858735ad.2
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 02:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777367886; x=1777972686; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1kWTp5zkgbaZx4e4AZmjYa1jMdyIf9wa3QliWzgpJZA=;
        b=LOmdOJcxyoQa6KfgzKpKQF6Aso3Q5eR0BYLhb6EYHrdyPCdhlZDSioO2C+vixi+/ZC
         8Jqt2mrsHzEa0EZYX0SF8i/MPrDN0QvPGgPcv6nMQBixzJBmlahkseuA2iNHc+dhBBHE
         6hYvSJIbYs7/ITt/+RS1l9aVvhSWQpuVBB5d3R0m9aQg2qPFIX3CdBGUyM6cJxk8K6Ry
         JBQYBt5BUZzj/BwW4/d/sMvhnk52ikewIVjsJiTTFHf2OFZotehNuNFsmmEYqwN1L3rk
         F8WoWd4AYduttmhbUaaZjYqXerLnDHfdWQCTVaTKrCN/toIyWwZvpf3qDaI8A2ahhJ9v
         QibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777367886; x=1777972686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1kWTp5zkgbaZx4e4AZmjYa1jMdyIf9wa3QliWzgpJZA=;
        b=mDbU1K30TAvDPkC+AnAKAyXDdVY3Q5VOvIEO6Pjomv0Q1OEPsQwd4oBKFrdvPQKg1j
         fZj1z1LpmzlACihf2WGc/zs4umt9Fx+iyswGgN+oRcPhcsXr0yAlLVisii+PIJMl/H+F
         BjyxMbtL/B/vu5DdcaOXiiEfGe+U/gbPXlCx/tcQb/yINEnipNeslj2fZBX0Xc/afJW7
         frrEwpBVud72gpHtbrCYAzJ54NuNl6jRA39a3GpbnM1Tn9Lms9AutPrsEo9j8hrHCGBk
         7a9hCcw7iexMp9yXGw0vMkKnJ+YZU6Epkl2FiDeN62N8egzd8XcqZiZ8BWRkzOILPpKz
         Rdeg==
X-Forwarded-Encrypted: i=1; AFNElJ+fjnXGjM4n2qBIe2IcEBpdE3Wu1efqFEPB9otHKK1zRqoLCeCBc5OT0QHzIG037jvPVvOsxNc04g3Y@vger.kernel.org
X-Gm-Message-State: AOJu0YwOZum4ClhGn4bAd8TMoCDVihZ2pECsDzYQa+47iT0Pkzl7pg3o
	weqzaJgLTWCfVJxb7ha2/6/pKz8Xm4/DWcNPunjQmPOZuIluB34DXfpyhmeHrliSFN3YN7tmZbk
	UcNEN0CwsBmj1+xtS1mWqLcVu3l6korOGg8uOCdPt7vkIUXACN52qWDTPZzGaQsX6
X-Gm-Gg: AeBDieva9XdjK42EQuXUan4IBz3glqers9lncaRyUDPGZuzKbNehGe77G8f5zS16Mch
	zcaZHVt7K80MxRgKes0K6XhICCQ2VYueg427TcpaL/LAXEHFAYkH006jL+HVVs1iW6+Xzntz6u+
	KsngkIzaXLJ/dBkWc5Zv6XuL4tjt5hprz8NHl76m1k5wbuz/Qztfk1gi1aX6gK9Lk6F694yu8U5
	DbIDrj/VBDStZHKaHVW0yOtojaH4/jEjDXwzV/VnQ4t9hJ9QR1FMBHOSC/GICKF3Ff4SCAH4+oX
	GOF4KE9sLY7BkyBbY1jImDZhOEX94N9k9on+2WIITzu0XfOoDb/esg9m/IaL7LihHA0oKi/1KWN
	LOS20GqgwGwQwj1gMcv0OBmml0EXje9fJuwG8oCrW7z8O9nA=
X-Received: by 2002:a17:902:f54a:b0:2ae:504c:ae8a with SMTP id d9443c01a7336-2b97c434cddmr24567385ad.16.1777367886066;
        Tue, 28 Apr 2026 02:18:06 -0700 (PDT)
X-Received: by 2002:a17:902:f54a:b0:2ae:504c:ae8a with SMTP id d9443c01a7336-2b97c434cddmr24567125ad.16.1777367885584;
        Tue, 28 Apr 2026 02:18:05 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97acaaa2asm23069505ad.84.2026.04.28.02.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:18:05 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 14:47:47 +0530
Subject: [PATCH 2/2] soc: qcom: socinfo: Add SoC ID for Shikra IoT variants
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-shikra-socid-v1-2-6ff16bad5ea2@oss.qualcomm.com>
References: <20260428-shikra-socid-v1-0-6ff16bad5ea2@oss.qualcomm.com>
In-Reply-To: <20260428-shikra-socid-v1-0-6ff16bad5ea2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777367875; l=739;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=0zmlQoCa7bIjbCwfu9zO8FG/nhxkc2X/El8W20NrRlk=;
 b=AiX9B2yXfvJ1ugOFBY63ITFK9TkkOvUz+sotJCNW2IOF2Pqoeq8Imlv5c86YUVz7ZlDrt72lH
 Zt9vVeLvHX2CwwayvrIKPIP5bPdlyozXjGeivt5EmatTKWztym6xAF/
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4MiBTYWx0ZWRfXwZH/ncqFbV6d
 VjQmy6/b+gB5s6GcRde1FdHukIK2KhbV8ZxxrhGChuRvhSQd8e9RqlgyUzGVZmfmrU2HI6C3hJK
 5JX/n98rfBaLUxwQDy3Mf/BVAmdu5MFAXMeVnF5ZF/kufJHH1BckB2zUj3yqOdISzEJKiEYL7sF
 tmyMbkVnnyV9WdONz8v33y9yh1DbZ1q+wKJ8rekVf9aBrguHIkp4IPzgm6+2CXoVoA17sA2HVlM
 nY2TFGXoM+HdyZKlsEX1+Rb+u7xGD6D2g58M/2B6RMqVzTEr9AIg0XwiKTSsKXYd9R+V88oyxuR
 ro0m55kE5HdySGwmeM8GVkcTGj4WECu2W//vhX7LyCflsrc3wzhC9t8kNRhwT25Bz8rdv40hYBA
 fcZ/+tJZoVLDaJXRa6gimCBX/l1e/FpH4Y3bXV2XOTGWdFdP1k+1BWuBKztnd5kIhfoTOUL+na6
 8W2gT/bz/86gNu5re4g==
X-Proofpoint-ORIG-GUID: y0afPp1cA0kjPA4nzrK_BCA1oQ8NkD1q
X-Authority-Analysis: v=2.4 cv=AJEsYPsu c=1 sm=1 tr=0 ts=69f07b4f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=NSp3ccVLS7Iw0aC1VAUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: y0afPp1cA0kjPA4nzrK_BCA1oQ8NkD1q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280082

Add SoC ID for Shikra IoT variants: CQ2390M, CQ2390S and IQ2390S.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 8ffd903ebddb..396a9c66b240 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -528,6 +528,9 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCS615) },
 	{ qcom_board_id(CQ7790M) },
 	{ qcom_board_id(CQ7790S) },
+	{ qcom_board_id(CQ2390M) },
+	{ qcom_board_id(CQ2390S) },
+	{ qcom_board_id(IQ2390S) },
 	{ qcom_board_id(IPQ5200) },
 	{ qcom_board_id(IPQ5210) },
 	{ qcom_board_id(QCF2200) },

-- 
2.34.1

