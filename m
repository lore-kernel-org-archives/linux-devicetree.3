Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D97A3E9C3A
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778670675; cv=none; b=f1A1LKuJDnl952JfjLguZgf8AYdkZj1uPkehVEubWV9ILkvLptSwmP8T4I40mN835dc8v0Kogp70igGHpMwk49cy8gyOYdv/BUif0re1SFjoCRGryW1El3Tu1BpmgjEZucEvYuKWLlxTeXNACAWBjwf67UlmgoxrKqTYM70ew0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778670675; c=relaxed/simple;
	bh=iN1HV5OPNHhdwyWix6T+IErfwH01Yr2FulFiA/kuBEU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l2h/UPsUNL5dbgHuSnj4HBPq+ddk1g681oQ7RrUZqrghJLeNxx30W7Ebef+6jEqdmkMe+G/ybw62gPEISGg8sHHz8C3OGI82SyMbEHHejsAKgx/FW+RPcTpd0JfCRtA09mLCl2ezMU80pa0tTvJtvw3u93waKGRbYmGDc1eBh0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ga1aa105; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ceTLzaZG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ga1aa105";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ceTLzaZG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVG7H3430122
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7uC/r7pFKSFGvPn32nt9OC
	YO5lcLXRl9AxNto3U4dQE=; b=Ga1aa105QNDZ++56iQx2ny1s7rgRxOJOX9kvKa
	RAMu+Gm2DE40LtCibdUM2Gb1ez8pdMvC6Qy/4NNgE3NHuqjDLr4n94Uax0Gd81m0
	mJTFsJRdwPo/p8RnLNAcYWNVJhpBjh2b8/Mg+tQaiXuR4+snZOdt5F69wa0eSO7B
	ssQRhdaQWnajLe/AufrGmji4Ewh8Ffp17/t6buSiETUrwaryuhJ3utzNkPQ7Ttdf
	PV1h4KeyXSxDuaATpElztUq9AahpqEVUzpm9ikXHFQM80uySnJ9nCVYhDv0gcqNY
	cW8rt7/tIDxVP1ulzMw8JZoNOc43W4TNYoREoKpdBxtjELjA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmcg4gq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:11:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e2592ea3bso38553951cf.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 04:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778670673; x=1779275473; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7uC/r7pFKSFGvPn32nt9OCYO5lcLXRl9AxNto3U4dQE=;
        b=ceTLzaZGi+sUUvCi65ZUXDywS1EUOxSvcF8CUcRNgWQct6Zz925a3XqW1fJEGVNKgl
         TqTdgewpu/0lhQicDoGVzrkOoCxr3MT35V3dwiEs/+680Q7yA2f5/s3koNlv9TOuzcCU
         TgcZ0DGF6NyDYFZn5/HO1qfnsJGtQcjzd3RQyQNwKXgtHt0WLTci2xJHaXH3YTcx3gLZ
         JHSTX6pOS51ZPZ7WB7AE/w5MZkqYGhC9Hnk6Y/eAa8Y+9Po5w8KiDenGzJH7abMBUhuf
         sTPsIOe4bIoEpzOlPRIfSYBDFwq7Tfd/Wk+bat1y5eYgKpnfMX2jDSDI9yTHu380Zgbs
         JoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778670673; x=1779275473;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uC/r7pFKSFGvPn32nt9OCYO5lcLXRl9AxNto3U4dQE=;
        b=l3IYLOrz5rGM502e7dVp/KlzDcSJFluX3Jg97rbX48tnk9ANNV10gWJ/Uxy4eJq/6v
         UX5yVYy44N0H2/Dg8N+OsqA+d5FplQoQo3jZahmGzuD98bmvGvdU2p1a4ARsolu9Px/p
         D0FO1o30Sdl/cdnLW+t2AQXz0/7FwIWVRpllNCPtvx84hOwmwcs5P2G4Kjx2uu3Yo2Pg
         APHk3SQIg2HhBNWKY0t9RfsonQ4XVSABiaS42Zrp9GdhXENXGrMZ/4D7R2r3KFu6nFRQ
         axW83mHQuy+YoAlGp6uwiVo6VVzhLXxsqxpGyaEZw91w/rPBajE1ZURY3w6+jxEz6L1X
         zAyw==
X-Forwarded-Encrypted: i=1; AFNElJ9+jmP/StSj3gkgo7FTxy4+vdPxui7+LljZR0F60REjkWD0RKd+hurhyli7J8AEqzldD8B2WOp7rN1o@vger.kernel.org
X-Gm-Message-State: AOJu0YxIsInQ+b9bVt24LsUA6ULaG7kRR77zBKhx/lZtMJoW/70O+aXk
	yAdLlXQHAfa6WKFwjCbbmlq+J7M10wWUWwo4mbzAujlOmPwjBDPcqjI3FpYkfC+AiyJOIAoJrt6
	3ZGbZ2AICFALU4S7jMWjYNORZRYYTiWa+Yej+Fx9glKWDSZE7sPMuHcIK+cXw3YLT
X-Gm-Gg: Acq92OHoDIkdG+YjzaFfT+zA7OFEo4LCH+udl+XSzCvV0cD6D4WadLjtWGu+mh90uNE
	yeAXlBQnEgwNJ0wflM8H4pYpBG4u1EJnkxM6UhMVEWvlGU+1kmLAIWsNNulZlmfUAp1RddW9Ki1
	cQSfZNSh5BN1OPEdBAb9DyNL/Yraqgg5IDsKtIkvCKt/j4nRHxWRCLMyYdhUy7MYar5OBjX54VF
	58SEY7OO3H/y9OITpxo4OdoxlAJg8iyZdbcjHFP6Wa2G5r9+rfiJXIrDRDIbYFpQFoYkZrSgQD+
	p/76QTwJgFwS80Cv5R4t9i0j72aVP+tqcru6qbDvXb6qVloBB+R3JoSBYgLhY66zzwW/7p+9FR4
	7CubQqVmxnidrrdhuUDHQ1Oa1xIVPqA==
X-Received: by 2002:a05:622a:109:b0:512:e813:7ceb with SMTP id d75a77b69052e-5162ffa9799mr35251631cf.46.1778670672465;
        Wed, 13 May 2026 04:11:12 -0700 (PDT)
X-Received: by 2002:a05:622a:109:b0:512:e813:7ceb with SMTP id d75a77b69052e-5162ffa9799mr35250971cf.46.1778670671873;
        Wed, 13 May 2026 04:11:11 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8cd49fesm72081355e9.0.2026.05.13.04.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:11:11 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/2] soc: qcom: llcc-qcom: Add support for Eliza and
 document bindings
Date: Wed, 13 May 2026 14:11:01 +0300
Message-Id: <20260513-eliza-llcc-v2-0-27381ae833d5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEVcBGoC/02NzQ6CMBCEX8Xs2ZJtRX48+R6GAyyL1BSqLRCV8
 O4WuHiZ5EtmvpnBs9Ps4XKYwfGkvbZ9AHU8ALVlf2eh68CgUCUYq0yw0d9SGEMkTlJVmDbckEQ
 Ig6fjRr832a3Y2Y/Vg2lYDWuj1X6w7rO9TXLt7eIzxv/iSQoUdYqYUJbnmVRX6330GktDtuuiE
 FAsy/ID/G1xnL0AAAA=
X-Change-ID: 20260428-eliza-llcc-312b07fefc10
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=iN1HV5OPNHhdwyWix6T+IErfwH01Yr2FulFiA/kuBEU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBFxHi9p5LNmp16JZccf945QOTZzX8O5ZCdXUK
 AljA2r1WGOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagRcRwAKCRAbX0TJAJUV
 VkhfD/462UrbLzP4Ht5LwmuD/Z6Pn7iubewrt6/ePH2u72Rnt1s6mYxXZqOF2XCS4/Rkb6Vty68
 0aEKCdJXIHDsZjIcsxBlnH80Nf0p1CqLw2fSule2FrKV5q5SJN85fFweq3vzX1Xd7EhqV1UjC/1
 /cK0bTNf4L8svkrVznzvMM1ROCtmL+Iuv8XsW3sZAks+V6YgllELk5sCc8jlzxS9DeJqul9LZ/O
 gPt0zuuMd1RRVF7p8Cct13Jtvu4mqqhsMU0BrAp2q3zYTrJpPjnkk6mUaBaitZaqLkoh0Vr1b/5
 khDYQ1wWtMSe9u/7L33pIF+hYGcs/o7wVNsiQASfNXVVX5h/E5gpLP9avSAIrJSjJbLBu2eBGF4
 BnCyF6RbuVrrhXn6FFzBnv6M2ryrLtUycyGXoUXbQYtveHx0E/rqEZfbXi4gNvFR9RmDq1B938b
 OWr6Ykhh8r/KTEoczpRfsMLeA9Qo9/s8lFNP3L6myraEXh9KAqGNIi+qGQHRyVTUTNMrYE7EUYK
 jBU71ijocXfMIkNI12g2yIltPl/bim2q9xD7iwmx2dyu0EW9qVa10Pvc8WEPxjf9l9JSkG3qfZU
 VJBU3VwnvjzgRr2IlQ/xLx78HYrnHvNxl5l+/90VgGpOfYx1uC/uICa/49C3AJnABvLPrwAG+Af
 srfsq2BMdDfmUHQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: eiioZfq95Usrn1WjynJJ8DizNjg1Qt4d
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a045c51 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=uu_H6PVXkXtSyUBkjJEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExNyBTYWx0ZWRfXzKX+pU9cLhlx
 XOcuBtsdpfqli+JhKqYcJyYJFrTV7OCsAKAZqJ7quAR4BkCkBX2JOJ9rMqOMPcXtxVtgyDr73Lo
 syD/BbDnNGmv9ZwyMPt2VcQgs+eCKYAAW9fDSNff8+jS2TNkbF6Sz1nTsva0s3Y7HaY/IdTIVBj
 +HhCH6Zefe8n14iu6u4Uq9sFBLeVSjvULdnWcn8GVM+VOGuu4hIdtbZds6O2YdIlbpMHNL+Am1H
 YbXCiekMD1P0lo6wk4qw9zRjtmo5ePQ+RqHkYnlKZhzt51q9H3vwd7aFmJjR+SoBTTzdivH8UOI
 MQLzV5PBIOzg4kjjw2Sz2HaHZlxdH0ZafARSAC7PLElEH6c6xagBCYbfyNEKxsfOC6olWA3XEaA
 PAjW2kgVQicVHzhBFaAomO/+FDmyZndycel8+41rc9WTfV2etRyjOa+cUHy0frJWLLerIyef7o0
 vACZGYfVPbA9NGsOGjA==
X-Proofpoint-ORIG-GUID: eiioZfq95Usrn1WjynJJ8DizNjg1Qt4d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130117

Add support for the Last Level Cache Controller found on the Qualcomm
Eliza SoC.

Eliza's LLCC uses a 4-region register layout, with two per-bank base
regions plus the broadcast OR and AND windows.

Describe that layout in the devicetree bindings and add the corresponding
slice configuration and driver data in llcc-qcom.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260508.
- Replaced the weird phrase in the last commit with something
  more sane.
- Picked up Konrad's R-b tag for the second patch.
- Link to v1: https://patch.msgid.link/20260504-eliza-llcc-v1-0-d7006c899812@oss.qualcomm.com

---
Abel Vesa (2):
      dt-bindings: cache: qcom,llcc: Document Eliza LLCC block
      soc: qcom: llcc-qcom: Add support for Eliza

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  22 +++
 drivers/soc/qcom/llcc-qcom.c                       | 180 +++++++++++++++++++++
 2 files changed, 202 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260428-eliza-llcc-312b07fefc10

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

