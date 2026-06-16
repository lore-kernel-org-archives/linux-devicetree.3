Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2233CCFBD
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 05:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781586292; cv=none; b=uOniqRNbR93+dMTXjjJNASdNbiupMUNK0BUiHc4s8brW6fg+1f5nQYa0BDuUwl+OoTTDToNCsQKErb4ueVgKOlriv3A3ATghLj1BMbn4qAaDNwsniJwdnYrtJ3CmKJikiG11b1HL0ksmCcMJnR2zNhobAVWKCm880m2SCt5Ii4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781586292; c=relaxed/simple;
	bh=y+k/+o9Uzwp6H9bizQRJ5xJiMyI1jizKoq6mW7USx4w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rbUsf8/GDHDGF661SiBsBce4U1T18laYu4+RwZSGFctGWbYhT9etmW3lAJVqS00zK0zjrxnLGENIg/HQIre2ZfBcHcskpDtC5g7xedUPxK+0YbS+dmt0Gi8/3OMLRQ7U4bTsD71CXMOsB+Eqd203YsFbnSaYUmSokDahggp6n/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D+L0GTBy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TgYhcPov; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D+L0GTBy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TgYhcPov"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G1xfhh1766953
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 05:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=19ZTO3F8MsnWqxrh4Ubj4M
	4mvN5UpQJnOBRUpNroWwo=; b=D+L0GTByGWU++UoJAbg1f2ANj4OEAn4Me1v3NA
	+9D7x/kAy0zKExWDDNG8JB3s6p0EwDHHRI5QZ0VWKUHkKKHCxUBNtSAUqBiMS/24
	0ba8SAiiKGF5jeBdsWKYw0FJTR4Hapna6WHMEixD2kh/9nAIPGgBorJtHq/JVlpQ
	hlSzUpxD2wUAOJzUNb7qU9+JfpnruwnegQTTKCQRQ03THkFLK3DEpfdaqLzdzZx0
	BP2UFOmECPwCcOGF5HqTtrcBmf7OzcDAK84tYdjDUlsvGrt03e58OdXMFp/cqOiP
	dJw2bwvu0yx/RL3tm8gk7d04zeNB51+ZDK+9L2r8cqJNRm5w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteydctp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 05:04:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c32faa62so63039245ad.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 22:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781586290; x=1782191090; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=19ZTO3F8MsnWqxrh4Ubj4M4mvN5UpQJnOBRUpNroWwo=;
        b=TgYhcPov+r8c8BNvD/fNqnmY59foRTeLLRPhMQ44hTu/wSyIXSyrduHmAiRAOtCkWv
         YaxsJoMUC6JPjf3vMlVZhhgx7W176q45sJr8jsO9cQjGedNSQlOyl0Vh/uOhiE/JJZ0M
         lXK13Gdeh0LxdUrcneBRaLYnO0ONMC4iTbY3LStXoQQHJAVdOv97KIMWbnzR5IaKwdZP
         P4jDssB4k9hyoKxjsxwH0hxiartaT1DYG0wkYXs/d7aYQqDTBhUcQyv3+oENtJ+SlEOY
         RYO2YVFz2tAQqmR67dBkwL6ArKXxY7lYOHpgkK8s8BxxrRn4Fh1B2Mtn+3FnHQQv5Prn
         ZK2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781586290; x=1782191090;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19ZTO3F8MsnWqxrh4Ubj4M4mvN5UpQJnOBRUpNroWwo=;
        b=UUNPn/36982Z2jEAXTgErS6n1GQFT6cSkQnEOI0bzWrv1BkTCGCcbzO4L/IBZMXU4r
         fy1U+fKM5020tz5EJneqaEQELNm7vMYtWbqE2EqT693Yq048r3NV77wmLPM1FPZTj5Su
         CDdrgA+Ktnf1RHNyp7YqT9GLpPIJ4ehCsC2+LbI62Fhzo1PgS0SRy4kRITXkhUpv/GT9
         17b5yYR7UZmbA/r0FAYdMxhzZxUzoR+LK5GCw8ijGv9mMc2yVUD0sPAh1Hg5KToBFSwx
         k3Yes8C4NiNpoh3ya3dcC3VKT3QlhzaH+HpSadEkgIbmDSUc0dlafX8WZXsgg9BHkXE/
         inyw==
X-Forwarded-Encrypted: i=1; AFNElJ/QxaVDLPFE3C+oM+EKBIY7pUytqHwFdMpFdqZxAuesWi5Ht3Q37XQmq3AbNPEVof7XGtiOa0X6+6ql@vger.kernel.org
X-Gm-Message-State: AOJu0YzBTwecogpyj1ZbCBE9I8MjG76mrEeJ/RZpU5APbMcwGWQhRqHh
	Dl5/QBV06vMBE7ZnecV88aZdm/+Mnjh3NGb7K5FNxZ4bcRW/Z4ze0bd7x6SzRZcmIThk/cz/VI1
	m2VfjbHHlCV1f4ml+bSy0CkGSTs3sri98ZOLTi/ZGSGEftwZHJNcuMPOTkcbdSCG5
X-Gm-Gg: Acq92OEOHs55XNIYkpNftU5fBkdfa0wS/F35HJw5PX3m3Mp6rHIH5k6oxmFY2C0Ss4X
	Oevky7Q2t5Hrg0IWgGmcUWGrGR8Xtr1Vy9BahEdFOz17lnAmPhOPOjPwadpRVza0DVaWvaVcdKt
	gz36H+/61BC+FxjKL4aRCUWibI4SkUN9EHQOBDnKUOLOGTzJJCbgPe0fcHF2cK6Bgzi3Hwfc6Ma
	UIv5as96NEnXmONTzhGsRfNi0IVto56R9wMl2X44YKc2y1rsOZYCpoiRIoQJm16Avj58sXKtutF
	/RYyiv0o0bNEN4GqXjgfHCMmKShc8LkpCUzmf0UwlCIyTkVSXo4do+b29gknPjHpCcuuM9xdhWc
	W5jstJItPvFNrbgkZmA8R5/vq7XCqd98cPpCy2/yxExJHPVOvvToU4YbdJ1XUdklRW1F/S3itkG
	+CVQJCYZfP7tyK/7zmONy8MBiDSFQpHHLweGuiRWKEzraw8/CPaPA=
X-Received: by 2002:a17:903:2285:b0:2c0:db23:4a4 with SMTP id d9443c01a7336-2c412d25493mr182944905ad.36.1781586289924;
        Mon, 15 Jun 2026 22:04:49 -0700 (PDT)
X-Received: by 2002:a17:903:2285:b0:2c0:db23:4a4 with SMTP id d9443c01a7336-2c412d25493mr182944525ad.36.1781586289481;
        Mon, 15 Jun 2026 22:04:49 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm128957335ad.14.2026.06.15.22.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 22:04:48 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Enable the QMP PCIe PHY present in Qualcomm ipq5210
 SoC
Date: Tue, 16 Jun 2026 10:34:40 +0530
Message-Id: <20260616-pcie-phy-v4-0-504677c3d727@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGjZMGoC/2WPy2rDMBBFf8VoXYXRw3p4lf8oWcjjUS1oYltyT
 EPwv1dxNoVuBs5wuY8nK5QTFdY1T5ZpSyVNtwr6o2E4htsX8TRUZhKkAQOez5iIz+ODex8xehF
 AxoFV+Zwppp/D6vPy5kzLvTqu7yfrQyGO0/Wa1q4JzlpltWoxBqF09DggGm/6oMCBbf0AGqOV7
 G+Trjl6tELzhMjTvLRSAIfQg4oqKHKq2wR7xY+prFN+HMM2eeT/37BJDtypHh2Q9TGY81TKabm
 H71fNUz3ssu/7LxU+PUwmAQAA
X-Change-ID: 20260609-pcie-phy-99fcf91a02fd
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: Ml9hn_0Cs5gJIfLP-GmODk076t9j-J0Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA0NyBTYWx0ZWRfX6Cd9b36Ts6ok
 M52TPLatewz0lA6WuQsTaABjZxJCmOOBqhMx1V4Zk5LKvSB2PQRJLRF0E8ZJjlBKx35We35AV33
 5EMBgB0/52uCMDIpzS+nGKKUFOk3C58=
X-Authority-Analysis: v=2.4 cv=QrJuG1yd c=1 sm=1 tr=0 ts=6a30d972 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FkrAw2C3M-aabWWYlxUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: Ml9hn_0Cs5gJIfLP-GmODk076t9j-J0Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA0NyBTYWx0ZWRfX4OZ+ukofd6d6
 kt/1cigx6XPMq5LmBzocjgWQee4WsZptaQHvrfduQJdiUMbqcR0kR82GJcsHBFlMKc7IRR3sKfM
 DcOh/ZGTiX914i+Y2t7KwxlTq5BWezZ/PZo1kIk0lflH4znaDQhDe5Zx+A9cDT5ia5WHbK3Mx1A
 O8iZDRFYrW+vEE35lOWTEUNkIhj4jWcKtDwgS+588oAnFy35lYkvwGd4Lxck4+vHaWS+kFyM1RQ
 YMOWLvGUqwC8YQ8aK71iWSkHz0mj4zfY8YrIMwCqEDM8RAKWxqFEZGTmdLiP5MS1OYWJ2TIajHi
 y6r7hXBsrn0D4YwberdxSjZ2buvkxd9gxtk5M9wlfskU+m8CWeYnw6PR1wb18Intx0yeFO3YjsJ
 u8O1FmL6R6jJDtxd/6Z7UleXC3FzUyY9kGuXs9TJ5UfBXib8bnwiC0OLZgQpMBUqs2lm+6+i72n
 Lk4tyPjGBFMDK5UdtiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160047

Document the bindings and update the driver to support
the PCIe phy present in Qualcomm ipq5210 SoC.

v4: Fix commit message for the bindings patch by removing redundant content
    and adding explanation for using specific compatible.

v3: https://lore.kernel.org/linux-arm-msm/20260610-pcie-phy-v3-0-334011b378d6@oss.qualcomm.com/
    Fix commit message for the bindings patch
    Remove unused tables from the phy driver (ipq5210_gen3x1_pcie_ep_tx_tbl
    and ipq5210_gen3x1_pcie_ep_pcs_tbl)

v2: https://lore.kernel.org/r/20260609-pcie-phy-v2-0-83bc80e79fa6@oss.qualcomm.com
    Had incorrectly made both the phys as fallback. The single
    lane phy is standalone and double lane uses ipq9574 as
    fallback.

v1: https://lore.kernel.org/linux-arm-msm/20260514-pci-phy-v1-0-482429192746@oss.qualcomm.com/

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Varadarajan Narayanan (2):
      dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document the ipq5210 QMP PCIe PHY
      phy: qcom-qmp-pcie: Add support for ipq5210 PCIe phys

 .../bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml    |   2 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 129 +++++++++++++++++++++
 2 files changed, 131 insertions(+)
---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-pcie-phy-99fcf91a02fd
prerequisite-change-id: 20260514-icc-ipq5210-0ab03f3a3e83:v1
prerequisite-patch-id: 0b6145b6635b18fe79fbbff5815041b43778c5ed
prerequisite-patch-id: 924c6ff7baf4283ac7991ee94c803a00fc5cece4
prerequisite-patch-id: c2fe1800fe769dccd37f94c19860a07f979e3c4c

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

