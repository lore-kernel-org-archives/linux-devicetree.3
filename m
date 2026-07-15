Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A1B377AAB
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784099539; cv=none; b=YmzJjYZFhHTWpOnozm6fVruyoVBkCQ3usAvqgjxLQ4SfXH/rkV6WOtMP1umw++C+vpjAXZDKCcJOJ8qmarU25wlah+BvQpFBT+waVk4ZdJu0N74yN3VaK0ov8Y5+XHXZ1rxtybRBRO1wTSPdnAyYUwqPA+go5XoNIvtS59DnalA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784099539; c=relaxed/simple;
	bh=iFBztG9jMWns9PUsQYnRaPSz/7W06Rey7Szgiz47mfc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tNp+0Y2/LIa2mhJca5JcOtC1gnFSUyXhy0mN8lMRy7aNQvNdR6udZmP3q0LQXc/dG48iozfs25qz9TDp5aELYVLFn6PzHt1EiGX1SxYFkE+m+cTA9UIqy+tKNXD4dlbE8ULvEm/3fb9Rjfsb3vOqwQyF+OyNUgTw9sbEnQcKRB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E8s1wrRr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SPc7proO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E8s1wrRr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SPc7proO"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lGrK2406127
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:12:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hHyvm5yjf+mJwEy/Pz9umA
	/wu8W0G+A7NroJGafo1HA=; b=E8s1wrRrFSxVYxlk+Y/tCfh8c62Ee/yQsQ/JUK
	gNspZ+TP+BdldMCkjrhfM5I5GI76EJdOZJNcoDKXvMfC6ZMrID9Lj2iI4q748E7I
	NUjPun0PB2iI9+hfcyrC69gtxHAJSqga9UYbeDNa+eJ6cAEEL5hwtkMTp95tQfEL
	92zOKGjYc9gjrR41j8i0fZwd0dK2IYyN6pfKMdhF8t9HI70p+cvimsUSZMNX7qqX
	3nRdec9qhha76ENjksf069mGRY34LZc9o3RD4TvxMcXwbE756KFwcrmAkerilP7J
	5O7KPxSJiIPA1oyYuDhRW3PkcDwalkntMLIR2R2y3VKW/CtA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9g2es2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:12:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38869800848so8096381a91.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 00:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784099535; x=1784704335; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hHyvm5yjf+mJwEy/Pz9umA/wu8W0G+A7NroJGafo1HA=;
        b=SPc7proO9fyY0wNWpQbRJa7Kf+Q/HP3EuyAG9Q1B7nbLOtYHPro/RDy8dcRjzXoUd2
         6oGYDARDFJQBiXuPxDKGxrJJNcCK49ZAhOVpceKRAHPlMwalrIXsBIO+4mOcJk8W1etD
         /R0KOKLOC8GQ9WbeCalb24c7xmRDvKobYQdgnZ0yU5LyWBJ1onkxsFEaX0uuEp+0TZye
         P833r24J0sIVPQEx864vb+qtpQuvdDkvF1ALEK2ZguTeWvmeRZqHDOHohAWi/YF2RP9n
         7C8J19xGL4n3BMO5kf7P4tMggAYxpPGua6+OhPADFI9u8l2EFQ5Gyup0pxyau/NVK9sU
         g3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784099535; x=1784704335;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hHyvm5yjf+mJwEy/Pz9umA/wu8W0G+A7NroJGafo1HA=;
        b=kFLtUE5r8sFbglh1F1hzqh5j/5Ehvct0Qv2z0dBjNpd8ZwhmlydFwSoHdT+dtRGnun
         HuQI2Nn7FeIptkQujxjtKBT62PGF8wGiduVwZioSuk0LrHLEqfLJptxMa86BcWojMvmZ
         OEkTtcYN02N4dg2KqIaqSCGkkidBPkJibrAesRm4xCEANUbsFfcerJ6vU8COb6rSX4s5
         82LRehMaS+xgMem5VDdy3He/VQ/bqTYORwYDVmrkIkXsdqzrfP1Aov81mBBewXvDXUdy
         s3sfsTSVVrjzFurSDyeFQjpvzwjKN32tgeA94ukCmnK9KzX7zMXQj9V6LIqxQSTCzh3n
         9O7Q==
X-Forwarded-Encrypted: i=1; AHgh+Roita5sK4dChobstwrw2DsgrUHwJ/YfwyZFOA8QIsd/OXGY+aGaAkEvvGSe6afcSe2YoaVFNrwyzJc5@vger.kernel.org
X-Gm-Message-State: AOJu0YweGQaCT3ll4CfMuLX0544WUXlTi6egwiPPw6DCh6sFmf/Xel3l
	N2JmnuZr8aeyP/3PIW01uZK4bjsZUFaK34E774dmQtHPErbuNQOACstkQbV6AtBqmj0qE8ZSW2V
	bI5HAC9rPzcPjKiRShhRi+kjbR8Vf69QF2y/vnsBTSOET/sh1Hj61O5i7s34EXeBl
X-Gm-Gg: AfdE7cniZhJJwfqtJfFXXixYcPeOir5HldgkWg6DTyXWabTPnxvh6kV0gn7KclhEV7U
	Y5CGD6UT2HphE0YFWpQsOA29WP3eekzbKaVImvEdV3UW+Xtt5sZpwUt/r5TamtuccFxciFKKLVZ
	6ShmCK/CkRsppmFGbpm/67fVwjROJ6U/WO+ZHz7NnLuxxAOK58QLH+Ya6iMT2eSmozxXeEpIYVw
	Y7q/2Ng9RFfw548Bwb8CWRF8lSTPYt+/y1DVdUN6lb1WqjBjdcfHe1LbFT4vOmfVHnSO5k1CvuR
	HfM0o4x2iOJ7ufp5rVqRdxKe4UOwjzUNB7VlVn1zxq+BqZzeq7eXaJgBtWiRo/CPzIV2OwReSMJ
	SOuL+dFj388HvEFm7YaQZHwbnJjI1lSVzQzD7U0+Hn3W0CnOp22frQK3ybcqOH8DkZbwsxZ5ZW2
	LbueHHSIWEzArgiwAet5USfIX3k063H1vWADoB/rDZ
X-Received: by 2002:a17:90b:1c0d:b0:387:e0bb:57f9 with SMTP id 98e67ed59e1d1-38e1af82809mr5580094a91.42.1784099535091;
        Wed, 15 Jul 2026 00:12:15 -0700 (PDT)
X-Received: by 2002:a17:90b:1c0d:b0:387:e0bb:57f9 with SMTP id 98e67ed59e1d1-38e1af82809mr5580050a91.42.1784099534419;
        Wed, 15 Jul 2026 00:12:14 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31189cd8234sm80216146eec.9.2026.07.15.00.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 00:12:14 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Enable mutliple peripherals in IPQ5210
Date: Wed, 15 Jul 2026 12:41:38 +0530
Message-Id: <20260715-08-dts-v2-0-b060b68e0256@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKwyV2oC/6XSS27DIBAG4KtEXncs3uCoqnqPKgsMQ0MbP3GsR
 FHuXuykq3aRqgtjDTYfg/gvRcIxYiq2m0sx4hxT7NpcsKdN4fa2fUeIPtcFI0wRTRQQA35KgIa
 TumbaaVYX+ed+xBBPK/S2u9UjDsfsTbfJorYJwXVNE6ftpsXTBHeTL+sbTMmuu203z+sHSQVE5
 yD2g2SUwEyBQC3zAh9qFIq8dimVw9EeFrTMw8vvkCKCVEQyU2ouGVdAYbaj9fn5sG3Z5vfZtrZ
 92KOSmNySKalglAv9f1BB7yJCvz/DLPIxJRFKa8e9ZvpRZbmcIfRj18DMcktB+gptoMxL+bhBo
 bHxUHenGyJRYe2MFijwcYSD7VMCd/iEmefjCG0kmspWTpq/tOL6Y8gpul19ZZRU1jMSAv8FWUK
 3j2nqxvMa5pmuqbtb+ju3KxUcGoZUOE/9D6rYXa/XL25dWBAYAwAA
X-Change-ID: 20260706-08-dts-e830bb27c72b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA2NyBTYWx0ZWRfX9gtfYNpb23dA
 SbeAUnNnkGRZisElTACFGdVyzE0LyxQL+8i2OgIZF9pWwtq7cBsUA1ryq6+C2o+QAkNPLjXuVx7
 x3q+CpgYOiSSKISDy4Sd1TIMUTspqXs=
X-Proofpoint-ORIG-GUID: sMVeSlUMes0Cam-bQxAyS0o9yvsqq_lI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA2NyBTYWx0ZWRfX6P7nFM1NtVST
 48/vtW1vqL1l+JZl1rlA+1VTD5zbOVqJaGsjkYL5qYm9Q3Nrp/pWpe2AVCmFSh2EX1fkBnf+q4X
 Ds81dK8Zb9//rLQcMvjZdjMkyEUu/dS6XGJjQkYCThINL6xLIF9iss3cinu/VESRej2VrIiFXmi
 uYU8hQLpkTYjcC4hXUQympGQ2mKjt4D/HOQbyGklcxDuMoMWteKoAt5wXUbLl1pq/tY28En1Afq
 dqPt701BId47uO0mLvl9GUV/eGic7dsqBQHi1p1oB0Il8ioUYDs9S6nVG07o6dqV9A3coxEtute
 0i+F2H9nxdT6VmF1fbKZcyZGTEBWl8M3G+m2daockhtw/Qv7Yw7Frg9XDl1D9fZPGRXUw5+f9AM
 mTPp+zGMDFunGQqYBdXELv7IG4Rs3optesMKO6X8OpCrLU85aZ9BONkx8sxCHFGEuQB9SMchjyy
 t12rk3Khf/lzSejdlrA==
X-Proofpoint-GUID: sMVeSlUMes0Cam-bQxAyS0o9yvsqq_lI
X-Authority-Analysis: v=2.4 cv=VoATxe2n c=1 sm=1 tr=0 ts=6a5732d0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=v1hZQnKUEnapy_KJ6JEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150067

This couple of patches enable mutliple peripherals like USB, PCIe etc.
Additionally, it enables CPUfreq and thermal tripping points.

Please refer to [1] for initial review comments on the PCIe related DT
changes.

1 - https://lore.kernel.org/linux-arm-msm/20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com/

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v2:
- Change usb3@8a00000 -> usb@8a00000
- Ignore other comments as they are covered in the following prerequisite
  prerequisite-message-id: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
- Link to v1: https://lore.kernel.org/r/20260707-08-dts-v1-0-fce82e14cd1d@oss.qualcomm.com

---
Varadarajan Narayanan (2):
      arm64: dts: qcom: ipq5210: Add nodes for multiple peripherals
      arm64: dts: qcom: ipq5210: Enable USB and PCIe on RDP504

 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts | 131 ++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 616 +++++++++++++++++++++++++++-
 2 files changed, 741 insertions(+), 6 deletions(-)
---
base-commit: b96de4afaea292f70aec05d40def1d993c04d71c
change-id: 20260706-08-dts-e830bb27c72b
prerequisite-message-id: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
prerequisite-patch-id: 0b6145b6635b18fe79fbbff5815041b43778c5ed
prerequisite-patch-id: 924c6ff7baf4283ac7991ee94c803a00fc5cece4
prerequisite-patch-id: c2fe1800fe769dccd37f94c19860a07f979e3c4c
prerequisite-message-id: <20260604090528.735236-1-varadarajan.narayanan@oss.qualcomm.com>
prerequisite-patch-id: 5aca3ddeccbd470bbfd0c6a54358338fb8cb8336
prerequisite-message-id: <20260615085218.1421347-1-varadarajan.narayanan@oss.qualcomm.com>
prerequisite-patch-id: 66aa95814074faffb61393faa30396c42af41126
prerequisite-patch-id: 0a03dc1c91a2f0c03af823aa43f59a9005eb8607
prerequisite-message-id: <20260616-pcie-phy-v4-0-504677c3d727@oss.qualcomm.com>
prerequisite-patch-id: 7c93e925f6b3932bb699a66180b49336225dd999
prerequisite-patch-id: 5d3ab24adced9ec6e5a0d302b021e9d36d353975
prerequisite-message-id: <20260706-qfprom-v2-1-f5d9eaf12d55@oss.qualcomm.com>
prerequisite-patch-id: 9159005897e044423b7b72b695c3e31907f8d381
prerequisite-message-id: <20260701-mailbox-v2-1-5e6ebc874e4e@oss.qualcomm.com>
prerequisite-patch-id: 956b405a71f384354b5c35a44b97a0a2dcf65eb3
prerequisite-message-id: <20260703-apss-clk-v3-0-4785e89a9c58@oss.qualcomm.com>
prerequisite-patch-id: d9efdd8a09b028b1343243c5f0e78cf3e8b1e253
prerequisite-patch-id: 36cf721e00f3f5bbc3ccdc0d39503c5899771085
prerequisite-message-id: <20260701-cpufreq-v1-0-98656ad20ff3@oss.qualcomm.com>
prerequisite-patch-id: 35e083bb85434a34d86467e53b9eae14f78da125
prerequisite-patch-id: eb94fa7598d7d17822e0acf534c3a960f30c14c9

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

