Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4877355820E
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091141; cv=none; b=Up6BMraLrtbonbUk561kAu7Dk63vdn1ynRfSb2YmWKzQ8NCWrlaQUCPfcmrUgXbc9UGKipoedxrDr7jUyRq2UJw3wDHR5y/QW+OYLJTkKxNbESA+GQLBkF87frASOpgMesNdjvNA/fiVoiwvBOiaNzhmmsRsNGhK9AKR7cBWRuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091141; c=relaxed/simple;
	bh=qQ+8A7jlgueIaNxtKQ5naiv06CQe+YVVt6R6F/kOjgk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tUuogFmRxOllMkDRekUfhVhXwqnUE7+krg4e6E4F+8K/HWJB89LvPFyjumA9RKzea+hrsw6ugX16joER8XeWSYPdBoADauxIQnUV5qN9Vyd9qcWGCuNmZ22NwCiD1rFrskG4cBSMwxfcMwJchgXkIWmnql2wbsyK2wd7PZYjn6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fic20CR8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvxQW8cC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fic20CR8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KvxQW8cC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjHHl449463
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/p0lRupYwuhASYZA8idRjF
	cEvQiwEq1WLL963CYERkQ=; b=fic20CR8/WdMqlYLe0WAzOmYBwgwwWhgyyI/5F
	Arsz7977b4kCmhCvJV4jylF/aNMhZlviAMGBbSJwaD0ILFBR37BMEHFGGQJjmTyz
	wf71KkoIrim0sxt1MrUE0ClOAvu+JL48ZIccKUfbFskRU8P4XstQ1ExTQJ1ePHOK
	Yq+NJsqCh5zRIns50r+F9jwMCxGxHEnMX40nH20bFHwXbhGVKvzTHoqi9OtJ+H2e
	Tkq29mPT+vv+6rur0y+LFTXNdYSMNc//KUHORdizDrUn2ErMO/2F4JaaVfHmZPyv
	HdhQR13FFk27pacqIIwrS9lQZW5EZ5MB/ozU7u8LHvSZz+tQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gunjyt3a4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:32:19 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4922b7c31so56244a12.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790091138; x=1790695938; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/p0lRupYwuhASYZA8idRjFcEvQiwEq1WLL963CYERkQ=;
        b=KvxQW8cCWkD7AWDv1eiWCmZCYlufeKdeJjPknpl+sJe4ovjbK9MQPfizqJivswhicj
         YbsylkHWzW9TD1qa3WnIeShkjZyzbFGk2oe0t6MZGcB9WPbAl5ogLctmR13BwA7r0q2P
         RvLujPK2oqbzf2RLhKKJWxI+7txS7Y3URVcDrIpHrv+/Y8JxfmgiyeHi/LxUvmapHTSJ
         dYcl7oglEZ9swEPaAsXlg+Uu4QVhkA3NwOSrXCoPZjz+ejRxkwnwv6p0F79vdzs4RQlO
         /G0bMyNBFLPVJ35fYnI/oE6+ufb0nEIqt4BSOAsOcgaytRRxDUOkV6Q5drRPD/CVwFlK
         QXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790091138; x=1790695938;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/p0lRupYwuhASYZA8idRjFcEvQiwEq1WLL963CYERkQ=;
        b=xxObu6IqZPyczm5DOUW7DZezs68Lx/nOfegCmhSKNhsEtFMyEcXV/5dAjo+fvU98vg
         ruU+JUqz0eSxQf4j+WGL/zrwXzYlm5RWylvuDaf1fs8UOhTWT6RyzYVGhyAZBZ2LN9M0
         JWKpAUmJR0/PwhRNxh0GEV3pd5bBHKCtPPNAZLes1C/wg+kNNdLUyiGU1KwACYgAqFhQ
         jsgXvo1hc8fZV6DZsPexNn1Yc3xXvItMzqiDdlVTFSH25qxg9RnkdVFzpy+NVB1Jw1pD
         l3s5ilAbaITrkrEx8RfEIwNml7/f3VhfvwwAks3awAL/31OqeVHY+D0eY5pzcb+UEBn7
         GxRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzS6d8fNtGf0nH+GrVEWTgQ2aAazUmJwjEn1m+31qofXiukvrIkJw7wIb4rNG4DNEN+schKqdwKUBAi@vger.kernel.org
X-Gm-Message-State: AFuF++nokoD8fnqsalSMVl7BLIjGXQ6p/b44CMPKPvGa1VNtQ0UP3i6S
	JomXUb4GpUCGhwHqILOtKp6GKUgbCdRj4/xjzU3tOhqk5AJus4w0V0xu0vcBxhqL5KLthhL4IPx
	0bcpFEFSuBGL+d1cQG1Dm3EAm5LP5fHo+2XnbFkEvB380O1FQrbEEKl22BidA2mXz9QbIM8WQ
X-Gm-Gg: AYBFou1el7o6huckZ3P53M/Bfvkdrb+Nxz1dvnkXytfUb2w2oilgltNXCn6wVABHzne
	rbLGWPQan/XYBb+Hh9bx0Tm6ZMT+jJ8NcP3akfd8zM5TTDMDAWnoUYTmz7V8VAZDqtIN58pucC5
	Tk9IuYdtx1HVRbft6NjlxZjQaRN+9wjsncmbJlPjX98pWQd92pUfoxhxU3HSQBMc55a9PxNkr+n
	ZPZ2z+/hSdnTagLokUDCCHGFaLRWR6MN1Hj6shJDSKwFGGB7Xh5s9cTnTRyXAlfHYcQlZ8zQyv0
	Up6615ngiN/BQ3hADIfY/wyQeub7ePUWK+GGrBl+BnWEgPiKMBYCT0r1UyZ1aRd/XYtELvhxUpc
	S3g0lTwwahhbh4QCx/8iggXwgCWXLJGOJpSY=
X-Received: by 2002:a17:902:ec81:b0:2dd:c0ff:e723 with SMTP id d9443c01a7336-2df60b66f9fmr19445375ad.53.1790091138107;
        Tue, 22 Sep 2026 08:32:18 -0700 (PDT)
X-Received: by 2002:a17:902:ec81:b0:2dd:c0ff:e723 with SMTP id d9443c01a7336-2df60b66f9fmr19444995ad.53.1790091137602;
        Tue, 22 Sep 2026 08:32:17 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d047c40sm12334945ad.50.2026.09.22.08.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:32:17 -0700 (PDT)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Subject: [PATCH v3 0/2] regulator: rpi-panel-v2: Add vcc-supply
Date: Tue, 22 Sep 2026 21:01:58 +0530
Message-Id: <20260922-rpi_reg-v3-0-9214321c4070@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG6fsmoC/2WNwQqDMBBEf0X23EgaidWe/I8iJcZVt1Rjsyot4
 r832mMvAw/ezKzA6AkZrtEKHhdickOA5BSB7czQoqA6MCipUpnLi/Aj3T22IrNplukq0agrCPb
 osaH3sXQrf8xz9UA77fXd6Ign5z/H1aJ27391UUIKaXVuTCrr5NwUjjl+zeZpXd/HIaDctu0LZ
 Y50NbcAAAA=
X-Change-ID: 20260907-rpi_reg-8c6885b35e5b
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790091133; l=2083;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=qQ+8A7jlgueIaNxtKQ5naiv06CQe+YVVt6R6F/kOjgk=;
 b=AKVJ7umpg7/EVOsRH0kwdxgazwLWrXZYnm4QisJMsRwzeAOhxWVnXp9zpE1YFsdDdYj0Amty7
 JU4mjs3eA+CBxVeSMUZtPJzRS7LXuX8nDFu47bqDjArxL2D/WmPidYA
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Proofpoint-GUID: wU9uJxTzeuqS4oIS6oMKyXtDIVliG6c4
X-Authority-Analysis: v=2.4 cv=KqHYSmWN c=1 sm=1 tr=0 ts=6ab29f83 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=Q-fNiiVtAAAA:8 a=b3CbU_ItAAAA:8 a=JfrnYn6hAAAA:8 a=hLbFB0PV-noiyqnaVYIA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=Rv2g8BkzVjQTVhhssdqe:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIyNiBTYWx0ZWRfXxUeGUHo+ZRKt
 CK8y2W0R7lLQqZKI57vju8g6N0LISkXb+5y3PBY906TJQxN/nLXB2c4Hk9+0i4+wKpRrl4bjZ5c
 fYo+fYnW6inSIyXqCR87Eol5npZ9dip3t98IQ+dzqf0TVXE5616msh0cP5DwpSfmQ3K1YzmR+X0
 21lPPmo8qCG0GGaHGivuuvMJbTFsSZVGtOZ9OSF5URiXfSR1e5XU9FU/bfI+s2l922ZC/TCphE2
 ZiZd3Klf6G/VoIUr9mvMJ4H3fCmRYq+r1aaddk199vrQ2GEWwhPHkZCsYGPFKoUywxvJvNd8nDO
 zSTNLQv6HFizqb5cVXfpXY6MqofxNo9tjNmA/by1lxI9FbDTvO/sGk1FdsAZYFVXW8nt2wkdFyo
 jrYsN5dl3nxPe11lN7pt9IA9EkvtcGGu6yU3G8/o4X89FsvRh0Q9MwbC/HdZxmQYzYmusAO92+l
 jI9wqIWSXwgjiVVLIdw==
X-Proofpoint-ORIG-GUID: wU9uJxTzeuqS4oIS6oMKyXtDIVliG6c4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIyNiBTYWx0ZWRfX0Rvy7axlCmcr
 ivCBce3PbhAmPHPcZSzQ2XPPb8WNRmj2lUYgyUYQ14csX5JVQsEinu3zmvAPFT8HLlbeVFip13E
 M1wGaQVeVVtvcZJvtvArH7RwAtXSMn4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220226

This series adds a vcc-supply property to both the dt-binding and the
driver:

- Patch 1/2: dt-bindings - documents the vcc-supply property as an
    optional property.
  - Patch 2/2: driver - uses devm_regulator_get() to obtain and enable
    the vcc supply at the start of probe, before any I2C access.

---
Changes in v3:
- dt-bindings: make vcc-supply optional instead of required, to preserve
  compatibility with existing device trees that do not describe the
  supply.
- Driver is unchanged from v2: devm_regulator_get() returns a dummy
  regulator when the supply is absent, so an optional binding needs no
  driver change.
- Link to v2: https://patch.msgid.link/20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com

Changes in v2:
  - Made vcc-supply required instead of optional (devm_regulator_get()
    instead of devm_regulator_get_optional()).
  - Added vcc-supply to the required list in the dt-binding schema.

Changes in v1:
  - Initial submission with optional vcc-supply support.

To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org

---
Shashank Maurya (2):
      dt-bindings: regulator: rpi-panel-v2: Add vcc-supply property
      regulator: rpi-panel-v2: Add vcc-supply support

 .../raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml    |  4 ++++
 drivers/regulator/rpi-panel-v2-regulator.c                   | 12 ++++++++++++
 2 files changed, 16 insertions(+)
---
base-commit: bd2a0c2d8c49ffb7acfcb0c1177af355ea417caf
change-id: 20260907-rpi_reg-8c6885b35e5b

Best regards,
--  
Shashank Maurya <shashank.maurya@oss.qualcomm.com>

