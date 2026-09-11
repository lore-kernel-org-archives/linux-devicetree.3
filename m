Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C662EDD40
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 14:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136463; cv=none; b=cR249fNiz0bQVWfoBVfPe0K7AsG+nTbJmKnm3D6tumiDplEIsBbFaPOo4GL/hcuL6aVV6RRld10ruyYQ3pZ84jncqc5TaHTiVzaoS4LHPkOg6difobwt7pVYuIqhw0bP5WTr15npvKHFwwR3LJAo+os/eQLQudmihWwpN49Akm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136463; c=relaxed/simple;
	bh=QNrkjFX3yERMTROIB7HsnedLismbWzqTQ2RbTUepThQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qr5//2R0Euaz4NIZ+xh4uz2SfRd2Mk6TGJbkSyOqOo+oPF24j3XWeMoSSI8AvrHvDLlhltXCT1NSNinm7obYos3cvS0uGzGG6kZsnN8xBovbGaGitN/1I+BB9Y8F3FbJwKjd4WyCGsbYaTb28DqJuHc4POEoGuc28v2Npyxwn/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UspwQPOb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YHlMhcW9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UspwQPOb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YHlMhcW9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCjjKN1098861
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 14:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eRTfc/v+vMHZ9YHcG+aZ4XlSJgsNN7LQIHM
	+Gie7bJw=; b=UspwQPObDz9N2Ad15O8bphBKSbn8AAZPHLIDAieR/aE8BBQG78m
	lRMV3ulaJ55z3AWF6B/7ExpJYT1Lx8xnj16ZYCokpeSFFj6BQMfYxsJE693jXwPt
	BACD31eUUE7aSOEDMSDlJbBaZdElQbRhKCGgczwGEZnmcCbA14DvoFF/cqtxwWv1
	nV8TAonn5aBUOQv7mdw1qY2RsQ5Ncs8X6BAsqjiYcWNlNiX9gMk6BBFc6ZA+23Cr
	woT9vhATn0fYRKQCnOkhAMf7+/NIPLKB9414elgldDFjbNAfR03kAiQSttP6Ni0w
	8VUWlj/tctacyPiHKAXzXoNvn7Bq3mOLgUA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbf8j4sj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 14:21:01 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-86c3a053d9bso10931177b3.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789136461; x=1789741261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eRTfc/v+vMHZ9YHcG+aZ4XlSJgsNN7LQIHM+Gie7bJw=;
        b=YHlMhcW9uj7HhRFeL83n7SUKKbcWzG5b6f8hrioXC8CMnh0BzS6yo61oXuElPToVKb
         jXMkCU6RzvYvCqj6R/rsXIOvCJGvEJJTlMNORi/DmyXF3CBFBfakAuob0uMaJh7PhDtO
         mQG2PABRlXqxj131oQ4Yhc4JWES+U8CvBngsXlJqcqEpg1AfCFhYTOM3LZUbNHTa089f
         RAvFr3ABVBod0C3LicZO3m01vrwNCgFS2zCZOEM2FfnYOjjczP28k01bXaT+hhyaAYvi
         E5QzHnsPJeBACZZylsjq5cUQfCZLvgTBUhSm0/1Eh974MgkjR7d+G0SpFAy/5g1Dy2YX
         okdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136461; x=1789741261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eRTfc/v+vMHZ9YHcG+aZ4XlSJgsNN7LQIHM+Gie7bJw=;
        b=c72RT2zzpPMuiYSH6dmKtbH6eHfPNrCGaA/NQHbZEZlgnHI2ueUbSB2UJN1wuBg5A0
         b32zezwttRvBxLHyKwDhXHwx+fmBpCVFHm2gcsq2L2ESxi+GMzvDsO6j6YC4WOOtjLjc
         NH5AHNfFPKkqeLzRrpB6cV048bWecHtYkslxQm9qu17xcXh8sdAVBn+D52Q/6otbctkp
         8GtXOoIn11W/qx/KCtcbaKrngal2Efpt6ULJRddCTN5ZC+KN99qhDGj+GGoLaFSYBE9a
         sOmgH34PCs+n+M11ZfQ9jiMYsYACLN1K9e9sy1fXE/299StNVRxZ6PE0xVpHKKsfV8VU
         rDew==
X-Forwarded-Encrypted: i=1; AKwUvBz1xmM42rwsf29IGxpjtamssq8evf2brVicxBcLCmgssrr6hQbUWz2ubKTuRRe8ilSqwJoWMy6B737G@vger.kernel.org
X-Gm-Message-State: AFuF++lgbgjGyX9y7NxsjGq7DC8sRug2Jp21GtLpW+CQq0zMMaDa0l1X
	nIO46KauCcbjpP+aRZRusQHxardMSPhXbibW7rePcE3Wi1OPoqLEQqNVB9vOcp5n1kelV4alrtT
	02JG9t0jn9n+uVdJKcn3TuiYtk6ZApEqrYmG20tFVNvoOkSNnwrAS6ly5L7mQ6esJ
X-Gm-Gg: AYBFou0Wa+1N3fzOapxS4tAXoQy8LGa7LGk0TVlLm/tAl4pKVN9WGxZHtcuQBrFhIUb
	wRMqWCGCQ+ycXDqXA4fqhkyby6Ss4K+JJR65EHMPv4gJtM2GvHkNWuWxxeB9DFxEanIrgc4W99E
	mQ/6NJoZOPTFtSxjR0oCx+dReYWsIJljbGC5QX+CM0BWWQOH1sJLQH/Dbd3LCmWVcIiHoIdc/38
	D+Aro6AYj6abHbM5IP8sgzchQMbi3Q5vyDZOdKAdr5tGSyNm53Px+qk/sU2b9uGxv0TfaOZGqqs
	kkSIuHKvT0a/QcpyhHN6EwtIoq7RZV6Vm/gmKSx6mEnZAA/3iVgpey5VEdn6GkzYPFLkzn/WLk/
	ruaZbjJfNrdF2iUZS9xcLHTbE5losyoHXrTdj+GlyEkj/O0vrMiq4x7rFWbSA
X-Received: by 2002:a05:690c:c684:b0:81f:4247:de16 with SMTP id 00721157ae682-884b3297d7dmr13372687b3.24.1789136460943;
        Fri, 11 Sep 2026 07:21:00 -0700 (PDT)
X-Received: by 2002:a05:690c:c684:b0:81f:4247:de16 with SMTP id 00721157ae682-884b3297d7dmr13372497b3.24.1789136460444;
        Fri, 11 Sep 2026 07:21:00 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-884895001fasm10483237b3.45.2026.09.11.07.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:21:00 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/5] arm64: dts: qcom: nord: Add USB support
Date: Fri, 11 Sep 2026 22:20:35 +0800
Message-ID: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pr9jxc3LhrNoqKrd0BogQx-H0BsaiXoX
X-Proofpoint-ORIG-GUID: pr9jxc3LhrNoqKrd0BogQx-H0BsaiXoX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIwMCBTYWx0ZWRfX0zQkCTBnON+K
 i7pzCjfIgm+wb5QDp6T+p5mcBF9/rtnd47EzjgXsaFQ9eS6Lq7MPYP34XpPqGbI1DHZqSJfsmEx
 +5G5iKGfE/BY7/h9yE7UpKqrxHuj+ANIrCxCwi7UEC7vS90MWNXKKLgzymGJmTPPGPU1hnVxGxP
 qaAexngoQlpwDTnWx95xv6pjdSMi7O3W1W1p9wvysnPVt0YrNfgQoHtEd27/I7UlUhg8Qsvjlv+
 DI+B3pbMYdjzfQk9/akgYOVtaZUdjwRuoRcFFciT/rr8TpiRjqdMLR10FgxSUBivok2GOw98sHj
 BNbNSjCdenKesniv4uztIzbMWHKf/qQy1O8ZN1E4CQkaJk6GgYh6vZ0UE1+JZhRU2rkfkdM/t4s
 SCCYlh5yLT2kw8j9GnOhHKEvUB7XI+MsVgviMRlwA8ej4ENwS5KKzmVuhulviP7ad/x6zrtjOYg
 cro8SZVoclm6Hx+pLZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIwMCBTYWx0ZWRfX5t3lnXWFcQCk
 eeURbc6e03pB2GQozMdzgTHDxtk6ORlGfFqQ28528+RUoOUOkYrby1NrlmkjPI+IoPQd+78HxCG
 5M1AK6uf6/fdNX0Hm2HN/xDurEsJwKE=
X-Authority-Analysis: v=2.4 cv=UJFIjyfy c=1 sm=1 tr=0 ts=6aa40e4d cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=623Z79SG-Rjo2hKprIoA:9 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110200

This series enables USB on the Qualcomm Nord platform which has three
USB controllers:

  usb_0 (0xa600000)  eUSB2 + USB3/DP combo PHY
  usb_1 (0xa400000)  eUSB2 + USB3/DP combo PHY
  usb_2 (0xa200000)  eUSB2 only, high-speed

The first patch is a fix for the i2c9/i2c10 pin functions, which is a
prerequisite because the eUSB2 repeaters and the Type-C controller all
sit on i2c9.

Patch 2 adds the three DWC3 controller nodes to nord.dtsi.  They are
kept as far as possible free of anything variant specific, so the
clocks, resets, power domains, interconnects and PHY references are
added separately in patch 3 for the "embedded" variant, alongside the
five PHY nodes (three eUSB2, two QMP combo).  Adding the QMP PHYs also
lets the two pipe clock placeholders in negcc be filled in.

Patches 4 and 5 wire the ports up per board.

Nord RRD:

  usb_0  OTG, USB-C, FUSB15201 Type-C/PD controller
  usb_1  host, Genesys GL3590 HS/SS onboard hub pair
  usb_2  left disabled, not routed on this board

Nord Ride Embedded:

  usb_0  OTG, USB-C port 0 of a dual-port FUSB15201
  usb_1  OTG, USB-C port 1 of the same FUSB15201
  usb_2  host, USB Type-A, VBUS from a PMIC GPIO controlled
         fixed regulator

Both boards use NXP PTN3222 eUSB2 repeaters, one per enabled port.

Dependencies:
- PMIC DTS: https://lore.kernel.org/all/20260904081619.593602-1-shengchao.guo@oss.qualcomm.com/
- QUSB2 PHY reset: https://lore.kernel.org/all/20260901035322.654-1-shengchao.guo@oss.qualcomm.com/
- USB PHY: https://lore.kernel.org/all/20260901095055.42229-1-shengchao.guo@oss.qualcomm.com/
- DWC3: https://lore.kernel.org/all/20260901103300.60803-1-shengchao.guo@oss.qualcomm.com/
- FUSB15201: https://lore.kernel.org/all/20260911073414.16711-1-shengchao.guo@oss.qualcomm.com/

Bartosz Golaszewski (2):
  arm64: dts: qcom: nord: Add the USB controller nodes
  arm64: dts: qcom: nord-embedded: Add USB resources and PHYs

Shawn Guo (3):
  arm64: dts: qcom: nord-embedded: Fix i2c9/i2c10 pin functions
  arm64: dts: qcom: nord-rrd: Enable USB ports
  arm64: dts: qcom: nord-ride-embedded: Enable USB ports

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 315 +++++++++++++++++-
 .../boot/dts/qcom/nord-ride-embedded.dts      | 211 ++++++++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         | 169 ++++++++++
 arch/arm64/boot/dts/qcom/nord.dtsi            |  83 +++++
 4 files changed, 772 insertions(+), 6 deletions(-)

-- 
2.43.0

