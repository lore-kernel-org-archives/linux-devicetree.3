Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F247236AB56
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781615040; cv=none; b=tpN0TJyOzdWmfAN3cHAQDU0viCC2VoVVSZJzSM4ZGqEH113zQr0JXHQzUZzEgO/BJMizuVcGLhLtKq++JWMloJ7x3YHN+JThHQ2K1xwfIsCiP1B5Clx8DMljC3IFZKBAHroIn6hqV257yffQM+NmGZuyjQSIQKdZvgW6oXrmwTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781615040; c=relaxed/simple;
	bh=pFCiTIOaCtErcZ/jxv1e0Dao47Mm9tD9RU3GiKb8xY8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iCzBlofqKqJNGU/pD5NxVwmiQPE9EUzmH3weYEe4UBCd5DYXQLtSlBBmWrRt2Wut/TeAC7bHMLX4Lvfgai/4nfLkjqBvDxpdIy3F61vlc+D+ywDq7ut93o8976Ap9E2pMoYL8fE72LPxumqi6DrUy/nCnkTD7gfMFRVLUUlNffo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eZRqdHJR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FoXHr+PU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eZRqdHJR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FoXHr+PU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GABoKm3384206
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qUyzgrOtBX2LiKRqpvqy7WvVynXsD0T3XMs
	8CgMXolE=; b=eZRqdHJRfDTrGM/X2Qw8KUYl+zAuKfuQx6xzZ0RC3+cJdOMUsxA
	wkoudYtVs4QDGkmLlvkvV3fXbchZ8EmMHOnB7VZ+Fcr1OgA71PXl9Y/Lj9l3D02y
	oPPjtc/CJbJcRd/HMraTknX4PL/D2EJucXusdax59i9SfDNHRB1Wti1z8D+bwkqa
	tcXRZjUEq6cNKRjOvEjF2mpHR6kMO/sR2yHpf3lOLxoQhc3TWG3u/5MhT+4k8QeB
	ByOLiLco/m3aoEM8Ynqp1jU4JrNb+IkScJsfQ37Tgr3JZU+XU8ciBag3MELQTTtD
	ioncMLQXSttujoRSRz/YPX0wN3Fc+r3JAIg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1ep9gu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:03:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf1845bddfso47185125ad.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 06:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781615037; x=1782219837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qUyzgrOtBX2LiKRqpvqy7WvVynXsD0T3XMs8CgMXolE=;
        b=FoXHr+PUG3jCSIKYdcLoJ6v1exsX3/tw/ZiJpEXPHTBiXCdmw5FwjgA3ppIo5DUGEA
         fDIQuIEQdaKhHvGN+WgLHL73+DDS0tZIReEsPcDXqmoowBLyWvli+7kovATqHwr6xMbU
         ym4q21w2xHzAYEGfXExMuIecmJGAX0wcRLGsioRDdTg/UABRwab11/QTYlopQ/dEwctZ
         00DwCz8gk+RrnQI81icp+inGZVdP9Zu8+zzHTpuJzp2o+eKa/olJXpEuVbWiNbzzu31Y
         jlMDeK5iyXJVeTt+XGs7aqPsUIe7TOiRIQWjDmphwyBTeLcX7sz4I12V+ttmmY+LNqk9
         kH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781615037; x=1782219837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUyzgrOtBX2LiKRqpvqy7WvVynXsD0T3XMs8CgMXolE=;
        b=Qhd8Z5nBkSuYbubpBc/idzW4mCG96sAuKZOoukvW1mGkqZTAqQhA2l06CEtxs0UBKn
         H+aVoTqrcYXNXUAQksgevwTGD0PRV+ITDr9Xmn/Y37OrXkL4T2kBLWUYu5B4EUf+bfzc
         IZsd5EI4X8yXTFghta+ObVYaevF63JHY02EzvWJiri9M12FX+eTEnx82REdd09IYhxY6
         MUfauOuVILOp0Bbg4LYctRJ0HRJ9V8ItmaRsPGAtgGP4tGMMcyRvHhaA2YEQ1xuHVgY6
         m842hu5Hr2TV8hg7fEnfVG6V5EIQplylV/kejVg5X7krObojzvuRFcVnx9D+ZksRzr09
         q7+A==
X-Forwarded-Encrypted: i=1; AFNElJ+8vlcDWD1G7VxMv94b4E//jk5vqkiYqFwqFCUw00ZAwQWqt1Vz16T+acJ5mTRMBj16Xnfi5VrRev86@vger.kernel.org
X-Gm-Message-State: AOJu0YwfELdUo1j93h0vxv3ROC75Solx8qMCcut54PikbUQmC92f5Gb6
	MTLNpfPc9qoIIpPzP7MY0dntLZiFSakocQ5xEzBxYzo6ppEXewbTkvRgghFtVMQJzMIdJx8MGbS
	Vqf4VxWnw5vyYSz1MpBJvDIH6Lr3aNbUSCSYL072lxxAX9DtL3jRQXK/nVAne4Xc9
X-Gm-Gg: Acq92OFTedevRwBXj88rTa6E2LgXCszCExu5JUoL7xRNsACw3dfjue8iNgQtw3+S1WE
	JKM0rybXDKCxDimLoRodkg6m/WBgSj5qsGbNzyjO2k2DY4ECXiE9nttNkaOazovRmUPNEea5LG+
	iJPA9nAD7BArMorsErC1oxmvnTIP9QIndU4NK7Wdd5/c+1s6iowmu0leqtkUw7/dxMkAA4AlQdL
	Hn1D6r6xKsSdAIijiKeKyq04Fam3D5QmGm79CIJy74DFQWzJvBWBQNA7ZBYF855zdqaY7SO431e
	DUcv6H6niMBEdxPT9Dt+Kw4RCbJ6o3oH/UUgUx//LCY/oyqh2d5u+p11Ntk0AWJdlkElOiy9qe+
	fKtDAsWMM/xCrIWk0QHI2GZ8venE5GVBwwMuPiw8YDsox3YM9YGa86Dy6
X-Received: by 2002:a17:903:1aad:b0:2c0:dd75:e834 with SMTP id d9443c01a7336-2c41050af58mr226079745ad.5.1781615036869;
        Tue, 16 Jun 2026 06:03:56 -0700 (PDT)
X-Received: by 2002:a17:903:1aad:b0:2c0:dd75:e834 with SMTP id d9443c01a7336-2c41050af58mr226079245ad.5.1781615036401;
        Tue, 16 Jun 2026 06:03:56 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c58c3sm134867235ad.23.2026.06.16.06.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 06:03:55 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH V2 0/3] arm64: dts: qcom: Monaco: Enable SDHCI storage support
Date: Tue, 16 Jun 2026 18:33:44 +0530
Message-Id: <20260616130347.3096034-1-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I/ZVgtgg c=1 sm=1 tr=0 ts=6a3149bd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=972t8ukbrjnbrM4mtFgA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEzMyBTYWx0ZWRfX6fvQycnifgVi
 eVHRDHOYaTnWpBHQVW2eld80vRdrwzLtREgZ6dM3c6vAr3eeXrO9TBv3+b11p+pbpA71/jlyYaG
 ucd55WKFElkocJVX4NncJr3Zk+it3yw=
X-Proofpoint-ORIG-GUID: bQp3QJBJi9W3LSrx_6OsCSQ1wIEh3Ido
X-Proofpoint-GUID: bQp3QJBJi9W3LSrx_6OsCSQ1wIEh3Ido
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEzMyBTYWx0ZWRfX1glPl7mSoEQU
 us7vMrvQ0wOCMmgkri0tC6ywcEYS2pcYr/diBc/pLiwRS+1TmbpOvyDpJkH1atzFMDMwnKPAd39
 vi0not5tqjZ7KZ0YDoL6y9QxQ6ryb1sdC2OM3RoXwTP4QqI+i7Wku3kuS5yZC+aWfc42MEJV+or
 bjfxVg2h6/wUWXNhgbio8HFTEIyQ7v1tKrkZEvFJBJvE/6zhkBcVvB5Zpmr9/qEub/JG8PKBcYe
 GCGS3uPtnyNTfS3oJz/xnprk/m3QZVyC3AZZtadP8FyYlgiHSx3UcwtR4EAGuYx0D6vzMlxvo+i
 q88EjPYwlhKwy5Z+hU+9f1zrGGvv61x2apz0l8/7Khx9A5jkz+rrmCbCehPg1PKoDHEorBMTPbU
 VEsL/7SrZNuKAZ1zQinyCdlyjtBnGvnUMyLbpX19jP6Hr8KhmgxlkUPBNyb4VKaupA2nof3+vmY
 PlgX7hVNpiR8R5e+G5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160133

Hello respected Maintainers,

This is v2 of the Monaco SDHCI storage support series.

V1 was sent here:
https://lore.kernel.org/all/20260227105055.2364348-1-monish.chunara@oss.qualcomm.com/

Compared to v1, this revision makes the storage split more explicit and keeps
the SoC description generic:
- Avoids using the reference to direct supplies as dummy
- Updates the eMMC overlay to remove the static UFS host disablement and
  vreg_l8a voltage override, allowing DT-fixup to manage the UFS-eMMC mutual
  exclusion dynamically for flexible UFS/eMMC configurations.

Validated on Qualcomm Monaco EVK with both SD card and eMMC modules.

Monish Chunara (3):
  arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
  arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
  arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay

 arch/arm64/boot/dts/qcom/Makefile             |  7 ++
 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso | 37 ++++++++++
 .../boot/dts/qcom/monaco-evk-sd-card.dtso     | 72 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi          |  1 -
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts     |  1 +
 5 files changed, 117 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso

-- 
2.34.1

