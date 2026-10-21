Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792549873;
	b=bUCzVlluhMQ2pBkuUUgpIv2n3uA2YtV7NFO4Up9zlf6EtVvkDrbW2fmo2j3wxq1Cp591
	 ySgKFLwrIbQN0qsjGodkOSyYKAIhewYhB0K3qo9XyK9s36xTtJiisbV6fiXxklGki+sPu
	 ivVjJualvO6n0l6Hp/gP8DwGvIHoRGmHY0S7qWrqN7GwZAPxNh5uxnOVsF4jAkrGcSWdx
	 5XXbQmWYdKZnsPwwUy3NcSgxvODKmgUIBBk6r351ox25Mn0XkEyX2QBdY987HXQQXl+1m
	 eokN1sHjM7iS5DkzQKtxquK/tYlz+AD54aeOJga2y4DFwboAyGywlAqbuN7AS8D92DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792549873;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HIYn5248m0VNRKQRQ9YHFmupNIJZTRVR2QxwfGlqBj4=;
	b=kIo4EusmAEPULekjvF2t7WhipO7uCVIi+Rb18MrQxHwxTyQ5bRhz+eghr+xhxYtmEB6i
	 /9Pl+rYBKnfey+OWoXGhqT7NWMqjn7u1x6De9haNDGQoxx2nxP5pgp52+rupp/QHEx+q4
	 WO9muBoJ5OQnnVzR6U8Hb3+TUw79/hVPpU6yTWUfgwaIhrhBBKeGta9EGKK5ln47U/rgs
	 VnN++y0YuNlVlfY89VWDSjAZOqEppjBgiBIqsMql3tURLwLYXiMamid78dMTnsKW3OLHi
	 dIoFG7JftsdntrhbrwuiYPDSu73JQDkG3p0rUqRSy1zhVaXF81NaQat8XypJY5ANd3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DxPIAMPC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ubz3XibC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25EB606A31E
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E25EB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DxPIAMPC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ubz3XibC
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2FX5V3989930
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HIYn5248m0VNRKQRQ9YHFmupNIJZTRVR2Qx
	wfGlqBj4=; b=DxPIAMPChMIrYrhXMLmGacWSynSyuxhj6XgEK89lPQv1PjxdWei
	mvjnoGFDicILbQd2bJUSNtE6fIMFlT0/gkYTqv/iu7Z9wLkHUKZCRYz6DfqPRXFD
	ok6rFWAJDCnkOLNLRuyqX1GRM3CWVlLlarrf/s0KSG6gX6Egn6/qIvLQ5jDxd60/
	xTf2zzI5xqtSGj7fjX+H6eOrdHq2LHb7qjT0mmg+hfP1ZZDVuEgnrX3fnNKDQ6b6
	AWclyhUMqQdCFucCfBykYOlJY29AyCkEtNhjNmySFzwroGQ9y0GPCgd9saI5nmMk
	ptY/ZHitiPXxsWTp291G4WKoMqrLq/awEkw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajhk0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:31:11 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-18ab3ee4935so184207c88.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 19:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792549871; x=1793154671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HIYn5248m0VNRKQRQ9YHFmupNIJZTRVR2QxwfGlqBj4=;
        b=Ubz3XibCc0xpaV0Me3NOVqiWrNnl+oqltfiOKiQnhtFf2aveEGir4Wzl3dukOx2/ja
         Ie/U8QRHhZGLqgpb6fCc/stRuPuOXbi+zhxjxJDm4Bx9Cz3BXs9Fr+g9dR7rhwf4nQea
         oRpmkA8sfrn2PQQe/FPMb9H0w8mPAhojOshyQTUi8xOco1hDVEh8g+8Brw4S/wFqzCrj
         yzQUYh9oNHWsd//bnJiJnt0nybU08/41RMD0d1CLV3bcmxlzKrl5f/B2sF2Mh7m87q/g
         0FDW1s94cmoEyeGvfQsEnV4F3naWnkvE2GwZbDy0bKhOeOUlaPbdxysMilO2sGG6mjMI
         2UqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792549871; x=1793154671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HIYn5248m0VNRKQRQ9YHFmupNIJZTRVR2QxwfGlqBj4=;
        b=AGDZ3LKOALJlXuhUnJbNmeglzxUYyjnIqsX3j2VaM9Ju9KSpAOE+XgKtYbsSLufx8E
         ApH5la6YUH02qTVws5v11HTHZ7NyDaaLxDcWpwE8Mv29oOdY7dBr+mfBr6WpmppDKZ2d
         uT4eTdgue9pPjy206+x8/+j0PxvR39guBkbr4SyZ5LtYiKSO48vAGdO/Wx/DmwsUGJmY
         SFLnu4w/FuMSRTHSv4OnGWh+HTc1qdK7vivhy2uKZrl6luOGuwhDsRXL+vpYr+5KWQ5K
         tGmq5yLeRUGYjpCwevrN3l86ZimU48PVL2hXxQ4Ak1ClsPqAIzT19ZUq9RmSdIsN+6km
         xZ6g==
X-Forwarded-Encrypted: i=1; AKwUvByvmk6MNfJi0Y7GJBZkJqj4Kv27pNblK28xQbADNoCLTuWiizTmDwjQePuo9Wr06pTDkItoTKVNS7r/@vger.kernel.org
X-Gm-Message-State: AFq9FYKh6DpI6zEUUh7qOt6lKU4RPA47M0bJ9bFu81ajQI2U1SEfzXqI
	x0wx1nKpu9S0/5Mv0ateA1+2egR85n1CqjzHX/vjMdekiMPbYXMTmtM0lNl8tb3rOisVp4gXdI3
	82q8O2/3qgiB45LRsg/vRMA/uDMOxkQEM6L1QMGdaO6bBnm56fxAznwbne0wtgENP
X-Gm-Gg: AYBFou3yiCGdbP5nakStyvMsbfQ73c5u4O9PL+dh9pfJ0c7OtZJ4/cXnF3IJR09+tjU
	Qf5M9O80aKoKcTNEZjfDRLhjJiDG5pN854Sak0DHdMaVbeaohAdDxAKir7B+QbfhAWlFy4L59Jr
	hyPCaNWdW22njH8hViRejM5zB2PjSLeHE/ab38xuu5evxTFBdQurK063rPr48aWpYcN8rdZqGiz
	LDAFAtizBeMTA8vw2b935Lb8VIsbnWedTzPa/Vu0e+ikY/DroqhUkOWfI2wFHgPuWBIKgDpEh0B
	bWPIyBJFTLB4Ez7FPcv1ffmyraJr24tm4YpBBNBOp7i25fTpqt1/Dxg4Zx2eFFBliMELVPho+d9
	tNzUaqsjw3nXlyV91SbEgVsDXtLpgAvKPahToed4cHi+i3LKbQsbi2scUCQY=
X-Received: by 2002:a05:701b:2096:10b0:15c:1679:1cc7 with SMTP id a92af1059eb24-190a6705ad9mr904183c88.37.1792549870483;
        Tue, 20 Oct 2026 19:31:10 -0700 (PDT)
X-Received: by 2002:a05:701b:2096:10b0:15c:1679:1cc7 with SMTP id a92af1059eb24-190a6705ad9mr904149c88.37.1792549869700;
        Tue, 20 Oct 2026 19:31:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm2395108c88.22.2026.10.20.19.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:31:09 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v3 0/5] arm64: dts: qcom: nord: Add PCIe and WLAN/BT support
Date: Wed, 21 Oct 2026 10:29:15 +0800
Message-ID: <20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAwOSBTYWx0ZWRfX33eGoxRhQpwx
 95+OWZU8UZvBTQs5fvs7+6ftGly+REL6z+36QyUPdCP+ugaoHp0rJybh17D4C2i1W02dr+tn81c
 piEzHsQiz8cEWA0RPL0McMv8PYVsuDd6wbVFja01S3wu7PVX7GVh4q3OUZFq8Cgz/JzrdPGEvsf
 Wj85W8S2fmPBArIWFsw3gHK11T7xKHrBAGkvH6AH1EPQY34D/mxo9pRr0Y0KZYdqrjFbTCRB8Fh
 kNYLMGutC9apXJuS1XksgVUyBQn4JpL/OKFGibP6cAuXJo2KnYTEZcESVrK4idYzCxeSWaV9unu
 gP11HdanhCbugTkvu2GCZeY1HFaWhicEQ6s4IQHZGEH8E0pUelfQUYqDF80EopUMWvPg9cqgw6Y
 YqV+ttlfKBux37/4zZNO3QBFZh5ZD01GBcLeNDaMhILTpVZgb9gfcJdla4PK1ZF6RdZXIQRhI0p
 TV9nrU2Fco1K5npAM7Q==
X-Proofpoint-GUID: jxAQlSOfMNgzw91mzQrZMIcxFxIfSvWJ
X-Proofpoint-ORIG-GUID: jxAQlSOfMNgzw91mzQrZMIcxFxIfSvWJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAwOSBTYWx0ZWRfX41FlNCqLX7dJ
 Lc89rIatNkIL0dqqbPeJ9ieUWyoLfMB6rzG0TcgcrqMXsgwRJV05Vuu3MItiE3LVnLq+s1Wfy7H
 iyN2FOLZILQkXHx89BWNkhwR5wWsnw8=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad823ef cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=STRuL8VrElODx3xkHkgA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210009

This series enables PCIe on the Qualcomm Nord SoC and brings up the
WLAN/BT modules on Ride board.

Nord has four PCIe controllers fed by a single quadfurcated Gen5 QMP
multi-PHY. The link topology (x16, x8+x8, x8+x4+x4 or x8+x4+x2+x2) is
selected by firmware through a TCSR register that the PHY driver reads at
probe time, so the DT only describes the PHY ports and hands the driver
the TCSR handle.

Dependencies:
- [PATCH v4 0/6] Add PCIe support for Qualcomm Nord platform
  https://lore.kernel.org/all/20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com/
- [PATCH v5 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support
  https://lore.kernel.org/all/20261014063953.549379-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- Tag the series with RFC due to the unresolved dependencies
- Add PMIC E GPIO7 for enabling WCN DIG rail that feeds the WCN7850
  VDD_DIG domain
- Drop RRD WiFi patch as RRD with WiFi module is not easily available
- New patch to add Bluetooth support for Ride board
- Link to v2: https://lore.kernel.org/all/20260915015632.283642-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Add missing leading zero for pcie_smmu reg property
- Link to v1: https://lore.kernel.org/all/20260914071944.164217-1-shengchao.guo@oss.qualcomm.com/

Krishna Chaitanya Chundru (3):
  arm64: dts: qcom: nord: Add PCIe PHY and controller nodes
  arm64: dts: qcom: nord-rrd: Enable PCIe controllers and PHY
  arm64: dts: qcom: nord-ride-embedded: Enable PCIe controllers and PHY

Shuai Zhang (1):
  arm64: dts: qcom: nord-ride-embedded: Add WCN7850 Bluetooth support

Yu Zhang(Yuriy) (1):
  arm64: dts: qcom: nord-ride-embedded: Add WCN7850 WLAN support

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 926 +++++++++++++++++-
 .../boot/dts/qcom/nord-ride-embedded.dts      | 179 ++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         |  49 +
 arch/arm64/boot/dts/qcom/nord.dtsi            | 297 ++++++
 4 files changed, 1447 insertions(+), 4 deletions(-)

-- 
2.43.0

