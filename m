Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4FB400963
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 06:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762850; cv=none; b=li3t5GnrOsydL/uYBXlT9tTUG//L4sHkNw7Q042Kc53Lojav+C8GfbuOfSo6cPxFS5D2D1OledPLXS4zqKYHZ/kikRe/U22a9BnmayRVORsG4yM5Vs51eWbapxpkTby1vWu0hqHzfoVCgbwRqWjwygRcW2Yecl+5j4T1hOPWsXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762850; c=relaxed/simple;
	bh=FOQT6r7Vhnd/HfW9QjxbBHGrf3p0Xb6nsG/ugl0Wl2c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uU7UBI0nZzlw5a7ebaPr8Yb8h5LK3wvK0bkBznCpvxgE30fzzZiqQfSm/bzTlpXebPiWQEkUci1g3fp93NTud07gLJnfAaUs/C/bh6Qi0Uke2b6rcU70gt0zJMKucL36lLTKHNFdTTcCksE96zB/udVtroGzoC47V14WirEAlw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DGjdxOGu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SLyrGUNo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DGjdxOGu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SLyrGUNo"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873lOON3455053
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 06:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pTvHz9qoo7lj/uPQcyd9PK
	fnFrlOY5B4lOYc+cWrhM4=; b=DGjdxOGurNmE+bZopB47TB2PJonBJ+xOIJRcdu
	ELSsxV8DHkRNv82HBz99H67Ek+sKdyf18XjhO0D9hKBYJRA8LU1EDVVyK2xdHHyh
	uIeFaG/HVDCTtThOptqNqVBmc1NiOFsQjo7zSTVdo7vuH8JSiSa4oxTBC9xi9mHy
	Q5RwgtHwcUFEF0fJXwmMZvr4c0j8F/OzgYeSlOue8vqmQtNKuRjAC7cZ37NL8vTi
	JsgQ9zGRjEFU2qxtR3tArMOFltbHZ0jO0bgl1ZwTFnTvPYNd1NWiDCCDWcre1mCd
	bQgHmiFEsUtFQTN0lpD2w85/uJHcPDbY9Y4c/GsPAzfHm54Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggany5bnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:34:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb687f82eso38987505ad.3
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 23:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788762846; x=1789367646; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pTvHz9qoo7lj/uPQcyd9PKfnFrlOY5B4lOYc+cWrhM4=;
        b=SLyrGUNogNZz3g+4j56CFfa1w+DBO8KmIjMEe+hp9XjTDm89YGmnnqZOFId0wwA6U6
         W02ge4HdVkpHB06sUZ7fft1545+RaNek4ktBKerLHqYzuEyivZZ9Em+aOdwhjZsyELIQ
         ltVCpu0O3Rr6F2hRlxLYhk/IzVsQfiEqZNpP5bIwnjxHoD3xwWkjcWXjohp2EC7vaTF3
         1AJza3ZhSa5htkmX+WvSFHy5u1fYdCUzVtR/lp7yEiHRwJ71tYL7x/iODZxwJ8130huF
         3+eSYONauHJbEipWqQx4FUhg5LTHog1ot04vftyhDtX4DgAxnJzyyAfJaIaPMORo1E3A
         rVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762846; x=1789367646;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pTvHz9qoo7lj/uPQcyd9PKfnFrlOY5B4lOYc+cWrhM4=;
        b=Y2r9w+29HhvzcoDKCv07JHvyQZLRt1Dz9nmbpOwmVVtwV0ASlF+68QJW80NSeDKMuZ
         trSDtdYArxjKVX2g7PIriVZs0F/7WWmzW9ZT3MDHPcxBMyD9iHGht+0OfiUvsF3Gz6sL
         M0ya8LR4b/4VN47ueA4FqbHc1ELthCIdxFgiGrI0tq8YVYibPsztRbznyEbHG0/IMrOp
         PM7GfcmkGggdqkqlB/SXsjjquHSrtVZRUbvGbEb4qKXFNDPMH2gFB505MUPD29PGHGPy
         C33XGK0kx29Zl2rCilWCXqMHGu+fK0lX8WKLQTyIjMMsakP944k7taGvyKaFF0pQ2VgL
         px5A==
X-Forwarded-Encrypted: i=1; AKwUvBy+sw8J+zBh2eBFXvFfsKzQXFjkAgA4qfTUp/MS8NsZlwhaIGG34lPP0m3NLSlv/XKhq0Ola22XkJ2g@vger.kernel.org
X-Gm-Message-State: AFuF++mz7wyU8ciBqOIhEVoFHGRbCWd6TQV5GuU8joJp/6uXio1fESr0
	mSEwztS/hi+qIDWBETC5XWPU+m/WrCCqsIzZzGAb2FJNrEe48zTkAtsrxmRvbnwnngblQz46QYZ
	Y3s3nw9Uhi/MPiCCDiizbqJwuplGjdVUnbmggQ8bZhsVXMh56ftleKr1O2/EF1CZX
X-Gm-Gg: AYBFou2HEXefjiRBCNJZkcvClyw5TCZspgmk7xQef6NVAguAAKXd69P6J2yr+Atk2T7
	aGjaclMa1dtqtWx0xfAYJGI3YHvkg8iJjMROi4juZpDrS5ZcUkfZtpFKItWqQB4JOPjzOFEL1/n
	jE+654FF6J44mVGqNhnQjJySetEz2b3hhwCswEa/Tar8g07TvdsBAYr7qrlH6K8MfKAhpNOk4EM
	Vjjmj8NVjKr7IXndgqRovO+w/exVF0dNGEy/ijAJLiAvmAXY5oVXODhuWKl/KJD0bdHuxlch9kj
	pMUPMA1FR3/jmjglJHOnxUWA6Ebt2OZl0Yjbqid3ZiYgkZDJDeJ4ifK8dADhCVaBGntWR/uik0e
	fOq86D6w7bu/xohBQ06ahD2n9vVLP4CIhMQyE
X-Received: by 2002:a17:903:3d06:b0:2db:2427:97d5 with SMTP id d9443c01a7336-2db242798b4mr205997445ad.4.1788762846143;
        Sun, 06 Sep 2026 23:34:06 -0700 (PDT)
X-Received: by 2002:a17:903:3d06:b0:2db:2427:97d5 with SMTP id d9443c01a7336-2db242798b4mr205996705ad.4.1788762845710;
        Sun, 06 Sep 2026 23:34:05 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33808be8fb2sm2440549eec.14.2026.09.06.23.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:34:05 -0700 (PDT)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: Add RPi 7-inch DSI panel overlays
 for Monaco/Lemans EVK
Date: Mon, 07 Sep 2026 12:03:52 +0530
Message-Id: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANFanmoC/1WNQQrCMBBFr1KyNhKnbZIWEe8hImM60Yi1mmmLI
 t7dVN24GXjD/+8/BVMMxKLOniLSGDh0lwQwy4Q74uVAMjSJBSjQqlJGxmvYNT3vupHiGR+ytMp
 a7x2pwojUukby4f4xbrZf5mF/ItdPml8i0m1IU/03Jlpixs9UnS3/liId5AhSSeXKClGrJl/4d
 cc8vw14dl3bztNZTdo9MsnpE/o6owZ0YcocEKA0eUVWO+Mh1wiOLBhdkANjQGxfrzdHoQvmBAE
 AAA==
X-Change-ID: 20260907-rpi_dts_overlay-58088ffce047
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788762840; l=1868;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=FOQT6r7Vhnd/HfW9QjxbBHGrf3p0Xb6nsG/ugl0Wl2c=;
 b=9avyaWPPCw4SBnNo2p/iK0EDEjdBweCAtXOU/opfYBJHasAIAmRVD9+i6mgC8y1PDw/tAUviQ
 OYo+WLXjcfVD991FSX6jBhoPb5SSd98xVqa7D2Wl4OM4LpthdrmEn3X
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Authority-Analysis: v=2.4 cv=X45i7mTe c=1 sm=1 tr=0 ts=6a9e5adf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=Q-fNiiVtAAAA:8 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=aaDu5AvUN9vEm-sYl2MA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: vwHDM2ZZ0r7au8nGf92KrDRngYpy5NUJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA2OCBTYWx0ZWRfX92d9/ywybOgg
 lufMUy6tDlqIF3m0UJ6YfWvsWdZowri9JeH8V9cm/qWRHvo1uDLJAz72+emQanqx75RNtmsvvEE
 N+6hBATj5yCfbK7FZpxmn71h1GdQECKXFsdK+ZsHv1qqqyL2rvzML1ilEqQFvRxbUWLe7GfIVsB
 NzMfB8NC8zk3+efHqTbZ1U9Py/Iag8fGsEnmBcbS8NkFgQiaa9rTPvImQUJNJVhlQ/E91Kk333t
 ewFKIc9e8fnIp7T+RJD/oRQJeJf5WHVGalaWXi4EltNEiWajD0fogfH0ArJ6v14faoq0Hc4+p38
 wWyMWkxbYu0hmh+ZN8BTJQ67rJmIFx4ghD3U4EqZfpB7me5upemflgGv804huFMnq8H7I/O1rkd
 f04MQWk2ui1HR4akzxCfTA+suA7TJOJOxlZG5txw0bfos5bNVZirCB4K9oA/fjmPRqDXiULishb
 v++E9ZZAhS4Frn4y3sw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA2OCBTYWx0ZWRfX8YQhRgfEgvLn
 ySpVzpdXK+PahI2pxS4CXMWVEGCW/AdWaJFLbzcsaILkW+tV/V7CT9zPBf+eDrVQTSFBkjBrfDN
 l0pSNDTCMtceDC5GdYIUqEt7BbSAek4=
X-Proofpoint-GUID: vwHDM2ZZ0r7au8nGf92KrDRngYpy5NUJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070068

Add device tree overlays to enable support for the Raspberry Pi 7-inch
DSI touchscreen panel on Qualcomm Monaco and Lemans EVK platforms.

The overlays configure the panel on the primary DSI interface using
a 2-lane DSI connection and instantiate the panel MCU on the
corresponding touchscreen I2C bus for each platform. The changes
allow the Raspberry Pi 7-inch display to be used as an external
display option on both EVKs without affecting the default platform
configuration.

---
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org

---
Shashank Maurya (2):
      arm64: dts: qcom: monaco-evk: Add Raspberry Pi 7-inch DSI panel overlay
      arm64: dts: qcom: lemans-evk: Add Raspberry Pi 7-inch DSI panel overlay

 arch/arm64/boot/dts/qcom/Makefile                  |  4 ++
 .../dts/qcom/lemans-evk-raspberrypi-dsi-7inch.dtso | 83 ++++++++++++++++++++++
 .../dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso | 82 +++++++++++++++++++++
 3 files changed, 169 insertions(+)
---
base-commit: ed2647532a225739e86c7f236a2ce82764ec2772
change-id: 20260907-rpi_dts_overlay-58088ffce047
prerequisite-message-id: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
prerequisite-patch-id: 5212bf185b35c36ed8857a67f29e60386d59ac60
prerequisite-patch-id: 056a90b913170106a6f8c1feb2366ee83c4375b9

Best regards,
--  
Shashank Maurya <shashank.maurya@oss.qualcomm.com>

