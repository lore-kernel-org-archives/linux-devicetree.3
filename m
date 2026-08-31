Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F99292B2E
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788146478; cv=none; b=uHfSJdjjd4sOkFNE9Yt8ycQ1MvzQCawXqcJZy8v8g85rhPdlhusP5hCweSMTzp0gxSusvOxKqH7EpAV5mICFrrXOTdNm5zgFIJ947ZbowKTH8dr8zyMfWyqEgsa4L5sdLYv5tyyb/sZ+bK0QPSQYLUf78uiBueDBzFM91TSiQ/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788146478; c=relaxed/simple;
	bh=XhAM0hdu35IW+//Ub6Dx1ZV1XdI+/BBgfFUj2g9sWlk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VIHmXlQZuAd2RngTf0tgEOW2YN8TvVU0p9CSHZtTp9NYqMYxzIhCAoKH4zHTlqibFTgKwhVpXzHPHUVg/TjQibpohYtxMagRwOSDisMzx4ffftdlHyrjHfbEuPQxxm6koOgi0KLkiavR4HbWbmD9tnlwFTt7h9h/ejeyQlyWQFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nyDKUfCM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ayp/ddYF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nyDKUfCM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ayp/ddYF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1bfQE1984795
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rqgRXW9fq0Vk9XP3ULfEudkKUo2XfXG9j6m
	IbHSFx9E=; b=nyDKUfCMJDC2D2qwxU1QiqAqj547iwKY2mZCmDof5HAgO3fFRqT
	sxf54t5+UARLRu8x+32IMUmZmj/87hTekPdWUUnZq1iCKVKWs1qsevFnFXwHO3hd
	4KFnUwhgQ5kkoulEArz7/6fQwFmtygmtfNU6JNy6J/gOYZCRTlBzrPY+HMxMv4/A
	o/BE+DI07hq3J3zBVjKz5oF2TaFlJRG1HFxgLmqOFhtRoxkPnX3uMJAIYugoiwRO
	7GCF+C9NaGLkP7sefCScBlzynOs+6xD42DIyD2bvIJVJUchCOA+BYfn4/1+ZoOC3
	9C4bqTcX6rRU3ot+6HXS2CbN2zvXKfxeKVQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqe2ccms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:21:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39512608fb1so1225710a91.1
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 20:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788146474; x=1788751274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rqgRXW9fq0Vk9XP3ULfEudkKUo2XfXG9j6mIbHSFx9E=;
        b=ayp/ddYF6CVc9UzNFMLI8FCKTGCD44cmv6kiPHL+ns+LyPdgqAVs9N31BSIjwF1U2U
         Q6gD5f/pADDVsE0l0dX9pW5kEEozAUjklu5i9itidzpFBBHbMGGHd3t+QiaA+xNuQay/
         Fu+b/FyuAxJP1eYW1apJZDS1Wn/QlOO7BIa1vcmOP15CZBnCOn48DSOHAr2Wf757YbNC
         dm//0OYIVz7tRzHeyYZZOeq/1RTSG7WTI6GQyWDfhmjy49QJkFulPVonU1lK5My9XZvf
         kP9YMzZMpGBzAawqFJTYI48WRUbFUI4pOeTRXmjT8HifHUy7SshufLXRi3sImLxaTnbY
         NtEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788146474; x=1788751274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rqgRXW9fq0Vk9XP3ULfEudkKUo2XfXG9j6mIbHSFx9E=;
        b=nNf82VmodD64xo8NfnlY4Dq3OClri0+ISwoivwS2LtO3XKaaxCbNEKpNKn4HdgaLgW
         RKTsR/k/wpPMpF6m4dBKEsJD1uc7vVkcPgPrhmzw6bRSFCixLASxVx3g4evrC/6/w6rY
         BhnxEULLvid7q+0nONcnd3YNS1sjzrt1kw0O7WytJeEzaZFAcWvIYu3uLQwzrRqSDpKs
         lAaLPfMxkLSP/USEbIk6Okn/KPqWODe4lqZ9Q37dRcxsPwW4tVD6EZdXIiT0i1DmSm7w
         cX5Lkxp1FRgfJn4cnImN9qw38qDIpeFNC+sYjTtR135qrhIji4I/v72D3ewRjw3l1RSj
         IWkw==
X-Forwarded-Encrypted: i=1; AKwUvBx0DLw50iUh8YFEII+WovpDo4PbCOPAoQzC39myy8i093fSrDNYL9wQStFz5lt8CTmsFve2TPka/1Yw@vger.kernel.org
X-Gm-Message-State: AFuF++lfdXfmDk3M8FRNEQQrK2boPrdq1KKCa0CNLOuvB+wwALyEhjT2
	M1sp9Rbwqe16590nXVqKKm0AP/uJS0DwsVLylnC78c7HqSlYe9o0uY751pa370g4cykLzxQ7bEo
	HOgst3Nxns2IgxFSdWTuSPjNYhBZk8+e3945F7o1E1yg1I3W+SoNLKRz9Qng8vyfq
X-Gm-Gg: AYBFou2IrsFHkbpVNzSUIRAF3xVFxf+sTVimzzx+LfncKCJTYm9QPmI+dus9ibWDAw9
	R59tkTduAc8qLB9ipD4marqjOUElgGnzwj9ywDst3GUhyjl84fZhju/8ePoxVnfvDKJM/plSlcf
	AaFhC4lbFbsRm46oKdY6Ufx4GmBS8fgg1GheD45ZQLR2W+iBdVrgfeMPn4XXqshUywsJv29rVM7
	VIIpB0x7IUIGJpJ/lIiAz/dQ+5vP7yBkZ8KSQhGB+/yRegGf7wL9wPabhiEcsbi759AtZjdsa4D
	BkMNx9WGR9jr+79+xKfXlVZDyLocUqB/cQj6rE4mIhs8Sr+47gKAplWRKLrcpw4ivI/F87W+cFw
	7gFKivpOsUr4KRSF0ELqBY1UmfJV28lFTa0K6XG3Wlh+2m+k4Yw0PUx8iPP8O
X-Received: by 2002:a17:90b:54c6:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-396d0e24bdamr39154169a91.1.1788146473843;
        Sun, 30 Aug 2026 20:21:13 -0700 (PDT)
X-Received: by 2002:a17:90b:54c6:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-396d0e24bdamr39154122a91.1.1788146473416;
        Sun, 30 Aug 2026 20:21:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a160sm25599208eec.18.2026.08.30.20.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 20:21:12 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/6] arm64: dts: qcom: nord: Add remoteproc and PMIC support
Date: Mon, 31 Aug 2026 11:20:57 +0800
Message-ID: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Iskutr/g c=1 sm=1 tr=0 ts=6a94f32a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=16TN1hMwoZCMAKkeDF4A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: cWciz7dM13okBv9muML7yVahm9y8UOb-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAyNiBTYWx0ZWRfXxzI3XFPwyCcF
 KvM53supA9l037sH+VejTP4pdG7c7yLj8pA/voSsXlkW5VMz1lz7t50SqXZ0vru+WfmZ1GZ87HV
 pa0pB36aCw/Vv9teKcHe8MULPg4MUAtohzJc08FfJrgvVOp1WwkKHzGVVb2KsmP7y5wqjPQA7LB
 pvCmeOfacgVZvknu1r/EJNzV3GOa+UOg2XASNUGvE6errP6aEMhQLOY9vQOxqQzpoSoSc7x3sGJ
 VWJBVhzNg1cX0K2aBwxA7klqQRgHkNUJZhZTkYFFo9WScpKu8VyB2afxub5WbY+RqF3TRfHH3Wt
 +XTn7JGdfcKZOiXJIW6JCn4hqBlqv2vXz5e6GyhORADJg31mGE/0CXPE5b+Z550E0hDq5kDr0q8
 STTxuHOx58zPu9Mu980ptz3Oc2ABZRlyjOw7z8UFtg8wgWv/jRLOZ/8uszJbpaU+HfOsNw9Wmzi
 bj3jPjFmLm4Ap99Oq9w==
X-Proofpoint-ORIG-GUID: cWciz7dM13okBv9muML7yVahm9y8UOb-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAyNiBTYWx0ZWRfX3le/xNfCf39B
 w2vbySrUq7/DnEID9zH89p5swqe6MYHT8ah0bLA9oNL7BL9eg3XfHQ4q4VuC5Srv4pVGfx6UoXY
 JL/QnNLeL76LOsnPtjwaGnBMmtSXESU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310026

This series adds ADSP and CDSP remoteproc support, the SPMI PMIC arbiter
and the PMIC descriptions for the Qualcomm Nord platform, and adds the
initial device tree for the Nord Ride Embedded board.

Dependencies:
- Base DTS: https://lore.kernel.org/all/20260828034958.3165-1-shengchao.guo@oss.qualcomm.com/
- NMXC power domain: https://lore.kernel.org/all/20260826135454.658615-1-shengchao.guo@oss.qualcomm.com/
- PMAU0102 MFD: https://lore.kernel.org/all/20260830034719.140213-1-shengchao.guo@oss.qualcomm.com/
- PMAU0102 GPIO: https://lore.kernel.org/all/20260830042939.144376-1-shengchao.guo@oss.qualcomm.com/
- PMAU0102 thermal: https://lore.kernel.org/all/20260830101025.191697-1-shengchao.guo@oss.qualcomm.com/

Bartosz Golaszewski (3):
  arm64: dts: qcom: nord: Add the SPMI PMIC arbiter
  dt-bindings: arm: qcom: Document Nord Ride Embedded board
  arm64: dts: qcom: Add initial support for Nord Ride Embedded board

Dhruvin Rajpura (1):
  arm64: dts: qcom: nord: Add PMAU0102 and PMM8650AU PMIC support

Shawn Guo (2):
  arm64: dts: qcom: nord: Add support for ADSP and CDSPs
  arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   |  63 ++
 arch/arm64/boot/dts/qcom/nord-ipcc.h          | 144 +++
 .../boot/dts/qcom/nord-ride-embedded.dts      | 590 ++++++++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         |  37 +
 arch/arm64/boot/dts/qcom/nord.dtsi            | 906 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi   | 543 +++++++++++
 arch/arm64/boot/dts/qcom/pmm8650au-nord.dtsi  |  54 ++
 9 files changed, 2339 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ipcc.h
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
 create mode 100644 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmm8650au-nord.dtsi

-- 
2.43.0

