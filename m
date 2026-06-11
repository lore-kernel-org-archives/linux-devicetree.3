Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2B43A2559
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168998; cv=none; b=mg4rMN4J7XLohJIWfiDdN62vXaL4DKIaaUVru3qNOic49S2ZEkpbCZ0nM9jaE9zvS8ceXvh3Dg672YX8dFxO7Rz0M3ruKFHUe+tdIxgIXMz3kGxqiWuHSHXrJkGcMamil4Y02W+iqYMkaj0yfiTD4WqpX1qfKwH/N+Uyhstfm5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168998; c=relaxed/simple;
	bh=bqcfhdzuxUamPm1pdsfQKtg0uUtvUiezwZzqRCMONrg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JiJ4HAtT/xOVdDk8sX5a+0Plru49xGhdbIjjDsatxlYLSTxeBvy6d3fE/vwE0qt6wqYYXhlG1z7c6wSZqgAtuczCktSdnf871MItkKlAkUbdUHlaJNB/L0kL9MEH3+Vo2wRzrawyTEjlQTyfGEnRFiT4VePj2Vb4NFtyKitj2/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZhJUN3E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X3XJTxi/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZhJUN3E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X3XJTxi/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GTUl3846316
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CQ+rhfBfk5gE6kN0WbbcckxwBkvmsmlYXsU
	RkvaMapw=; b=IZhJUN3EwGI32whFV3/hLybAvgDH+TZ2ThXKM0cVuaqaM4d3w84
	M5eIB51ljgniWQnUhsv6In1lYWWb0EOAJvw8RuEQXgubQ3r/4njw51pvdnVoXrNC
	uFriUNdU+HQBOkQRxLZ7vqg53VqZ/NRbmcpEuYpES29fdHk6nzEOapCdLTZBgCqj
	KPxP2JS248vFWXXOg0p23yi5oPAvWNVemh8K+gn7PwBpJDnaY4VnqukdVAc3G0lK
	LfAnhcAJDx5Mne15hYqHdPPowuNibkQn7katIrDWmNA1V+9TqXBi2WC6mmVSPD5N
	fc2iY/bockxNEKd2iaOuDB4uiNwwgNbxieg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u2md8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:09:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf004bf8beso89232085ad.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 02:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781168993; x=1781773793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CQ+rhfBfk5gE6kN0WbbcckxwBkvmsmlYXsURkvaMapw=;
        b=X3XJTxi/3hZwTCF42KEzleuxR6VEeM9f9CsthLKeIws+g0zBC4xHpqf77mNZkaz20Y
         RR+l3mBrsWO/zZXdv2ioyJtIHQW6fS8P71FuyALpDW5538UCSD7DNEPCnqv/JGMLEeDc
         ecPATB/OOtKdO4JWhUyM7vr+Yd5DcmLk42kFDeJsGhSHiJDoZEpgSE9/oTxHjS1gubQp
         Nygc7olE7Itb3TAMYi+wkwrGx+dXls5zbJ3WPRcVE9fCV7uoqFm6wI5nuqbw0AlytjJO
         fzzVCY3Nqa+aIRwCzxVNVpwTxhdve6KTnIKuViu8byUquGMn+wM9QiLAsg5DOfl3338G
         KO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168993; x=1781773793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQ+rhfBfk5gE6kN0WbbcckxwBkvmsmlYXsURkvaMapw=;
        b=mbr50pbxhPBONhY0oCjzTMPfUN7SH02O2oa4GiVZKPXt4VqiMm52ryUG/u5wgXxvu1
         Ts6m0HFIi1zZ2o1HPQhsWZkkaILzqlKnfAwzty+TexSyI5XUbWfZT9CQD+gjhT7izq5E
         YANWEhSQAewxNTkwnid25TsTQ8Wm9yT722E1fn6t51ameHedSB1XJICnMsh5HWZPy6C/
         whSttOIiSYRLmIYOMBeq0P/6Yv0lQnFFFZMPiyTFbNMxrLT7BnKbHaKkOZ0vFiqs9DpL
         pjYJTw37P9kaSySE2Yytz8tqr1ZsJ+9330mQ9+cDLVkpU3LVcS8jdiuU+wKpYE4F5V/n
         PqvA==
X-Forwarded-Encrypted: i=1; AFNElJ/Nsi1lyuBfdCH2zMY8RrjhmpHbW6TQOjqcNNjxBaBgHhap+h5NUwHTSrLggBYJN6BZ/9acGQIofPrL@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsv1FVpUGIbCbAkysWq4tL3ZiDTFlrweL4t2fWh0Y+Iv53L1I1
	7sB9AbCC0/eZQ51xa9IBf9eCyfr6a5fnRyFQDVIZvBCZx9OJNnsuo2LitrPUJjRS/3oTvrxYiJw
	mcorEEHW2LjomRHUg5ApeT1IF5CY6MPBo3Juc+Q/oe76+SVhkqh72XiCFcd0vrb2n
X-Gm-Gg: Acq92OF6EL1AD/0RiuR7R20u2t3X1j3oVwC53hNt3TeYNUUmkzyXPFDLkCz++Ctb5AN
	/zQGtb/n7mbMP7rf6I0oOXbIevoMPWJRfaKUya43UWjkkfMas2izmwD/lSacPNzNxHC55sc+33M
	39cD8sCDM9HXnGp/HCAkYiiNnDIy+9xDcKC6HvZKfBY3KTb1gKEkh/YtPoAngIzXjKit0FyKrQd
	8QvJN2iIz8JXeUpr2FktotDjgNzScCmZi1S8CZK0uSJjS5az7/UjXst/1KoczMi7zKirg7FakVA
	ZRc1Lv+qRMhRNIttFfaU+eyzxIqewM9qR1BluyEA56sz1bWfBfODarCSx3SO+51yIcLtp1SAXFC
	mZDjqKEJQ8ZXx/12p0EemFSQYGMMjAfNzHJ6BwF//n2cFRbAMYxLG8VIh/aym
X-Received: by 2002:a05:6a20:9c8e:b0:39f:3efb:e888 with SMTP id adf61e73a8af0-3b5e326c692mr2283441637.25.1781168993521;
        Thu, 11 Jun 2026 02:09:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:9c8e:b0:39f:3efb:e888 with SMTP id adf61e73a8af0-3b5e326c692mr2283404637.25.1781168993063;
        Thu, 11 Jun 2026 02:09:53 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8658610cbbsm1083490a12.17.2026.06.11.02.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:09:52 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: defconfig: Enable USB_UAS in arm64 configuration
Date: Thu, 11 Jun 2026 14:39:39 +0530
Message-ID: <20260611090946.2790631-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a2a7b62 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=V7zewc8DsbaxPfsbzs8A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: CWFslqQJXjV4ym3aESaOfXQPdjvSzUIL
X-Proofpoint-GUID: CWFslqQJXjV4ym3aESaOfXQPdjvSzUIL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA5MCBTYWx0ZWRfXwZ5pWYQSW4RW
 D0sVYzCEe4kMZ61+d/e8hWPoCyWK3DxMMe+lY9bQuSH2hVU1yKXWmQZ1Oy3gdwaeY740fHkuXJF
 7RBSo2xiNC3nnkpMk/lKwRDe3wC4Z7EEXFwYs+jHPLDRhWoZOM5dqbz/S5Xd0OLP5w03vNOsVeE
 UtSD49XF8QAkpk6mRhJRvT0x9NyTTfrHu8poCkyuJSTeowWMMsWKIISmyXCyCA70M4eDPapjhK0
 v9ogWpsmU1/ARFTHhP5wLhbppiYbyG9GQSSG3+wvcweRLJH4E047GK+GPohgmVhrs9AIsYhZV9N
 jVqj89mcJVrdUX5AZuV9z4XzU7wmEcKjQKy+0N9QjHGD1dC0fqyg0hpcWKUGn0BfG6cYYMsMyRP
 OrchI5nOh4G84mzDkuNwD1v2BUU4JpwgOSv+Dui4OKOT14bldJ8VA8b453/Q7LG5EMmG4MqNsq6
 ZohR0gvt00lMJn8UWPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA5MCBTYWx0ZWRfX8heTolyGgTKY
 Dw0aFl+d4R+ZFsu5PrGI4jiiV9gRENbnox+MmKFxr1uC2PFuj21dsOuP9VdH8OZIVoQVzddio0+
 Zy7Gxnzw/B3T2vVwxALWfp9dCM/2uaA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110090

The USB Attached SCSI (UAS) protocol is supported by many modern USB
storage devices. It provides significantly higher performance than the
legacy Mass Storage Class (MSC) by supporting multiple outstanding
commands and command queuing.

Enable CONFIG_USB_UAS=y in the default arm64 configuration to provide
better out-of-the-box performance for USB storage devices on arm64
platforms.

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d905a0777f93..f82e9df77941 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1216,6 +1216,7 @@ CONFIG_USB_RENESAS_USBHS_HCD=m
 CONFIG_USB_RENESAS_USBHS=m
 CONFIG_USB_ACM=m
 CONFIG_USB_STORAGE=y
+CONFIG_USB_UAS=y
 CONFIG_USB_CDNS_SUPPORT=m
 CONFIG_USB_CDNS3=m
 CONFIG_USB_CDNS3_GADGET=y
-- 
2.43.0

