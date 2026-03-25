Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB8E3E3149
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 16:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774455727; cv=none; b=OBcZWLujPhYje9NGw7DK2JJXd61MAJg2Mq7hTZpWD8QF3ezA3fZKLVVvlqZU5ffSOGUv5MYTzn4d3NdqEO+Cs175CrpxK5fDYCtr6/UiUH3Kr8i7QafmvwyHzi3FUzpj74yd0MfCu8Wl7qfcky1iTq/Ibijl7gAhnUjIi5fIk24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774455727; c=relaxed/simple;
	bh=bvpqWj44ib5WF+12jOlUEH+Vppia8zwBwMPB9/lcfAY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=djcapRBDwGPfu86uV0yO0PEPl+plrThY9kTfGidBvuaHy0yuS3/vfjEKw0/tchVc/e5LuqDiTRdNqUKcPyPKwrmLjNwTGNNv2JbQcWAJxLaQzIghHpSo/a6L/7iSk3ft/91uVodzbxgBLkkOsCO0il/09+CfLBQU3HVgRJiLPts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fxskECfN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NBku7V3x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fxskECfN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NBku7V3x"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFHAAH2737654
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 16:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m4/t3OX801yud0AC/CSAAs
	KbXKedZzNSsC0z0THLOyg=; b=fxskECfN+tWDVO8WABqJ0mnfNVXwmb0inI0j99
	XLqu6fdGBEYUgZe3bc5JHfoQcCuzJ/AWljFNAqPRKtlE3Acxt1SfXBtBP1cPaZNH
	uUNPGyLq8mk9ksvBMpHa735p8vDLGO46F1wEmn1bjT0Ob83iUmiD9s0RpvQJIZey
	cBa0WHxOiXjMlzMPtOUDVLuWeqGQmEgNoYCLlMSnl8V839x4vY0XLL7Wq2sDcLbc
	j75ktW9lNrUyiEfGj4Q98q49otSUuVAy+jj5eRoD30+dRdJ++C/UKbq0nTtYVxM4
	SuHYtY0Q71SLS41g8SA06DnH/mzOHR5LQoE+W0EKC8aKh1Qg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4859anm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 16:22:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7381a95fffso116746a12.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774455724; x=1775060524; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m4/t3OX801yud0AC/CSAAsKbXKedZzNSsC0z0THLOyg=;
        b=NBku7V3x69gMi4FlwwV6Hh4i/p7KLgfWvHU1XEU2tRKrRk2R6JJfmHAwKpVUWTAycH
         n6osaETTqHB2CQ55DqMp9dtLgjQWUqf8Htz8TmLHBS2mDpKVoZ08ng0nV4A5ayRFOeUG
         QIqts29OlNttSMEW6lVJZioJQRvjlBbW5neVXE0+dzdErWn8PVecuVOHxN7j+L2SRWAu
         heG15/9pwisnHYUCVhbcbeD7K5y1Qm0//vJDyCBxI/P81q710IeQ5P0WfoD/1ssVAq2H
         M4FNh3EaenDuBY85D0FPSVvlLeCgf+3l6pdxZoYv0GOtV7rXcSvM8W/oEgQNUzs4J3GO
         8/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774455724; x=1775060524;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4/t3OX801yud0AC/CSAAsKbXKedZzNSsC0z0THLOyg=;
        b=KrrkC6fiGMV5wqFNC3KLimJjyfVBfW+FDdauwG+x7IQ2U8IWZTYuJpYJ4TeALvXePz
         u36Af7LlKfl14i94OIjxoTMqg135qkUMAPM5ZPheIohzMvy17+qWca9WJsgQOKP23TCP
         Qhe2Xw8Gkz3h2kWzjUSBT0ykwZ0TIkDqw4ytHTOcJ0E3c6Dc0zALtUDo1BTuyiyiRefx
         abxthwIPb7VfqwqvgcPjyHJILbFQeIyxVDa8jgew61kn6JR8q+B6csu19emXIXd1iLAt
         kIwHsrC8ciW3JlTQMJKb4acYv2et3H03KZ1n2RNsCFPrQld4u/nApOi+0HcXavt8fwUQ
         /WMg==
X-Forwarded-Encrypted: i=1; AJvYcCWNnTZ14mMxnrW2nPDyScmiwic1qGXcymbjJk921O+rs0cpMoTrgPMvjWmEF0Uq3q/BmX0E4V0Z7izH@vger.kernel.org
X-Gm-Message-State: AOJu0YzfxYuSoZyCvcwpfS4FdqaoEn12JyLe+7UiJII7VZNg5D8glmBs
	qhOGgnCXwKegQ4ya243V4pz+SGc740hvS3eNpTPBgspoprWCF/UqOQUl1smR56fDBokeGj6DnE/
	JdQcnKdwANZVV6E9AGW9T6xqFtxSdbLPv25xhtzw9fWaG9IxLLrbKZ7KbFlm/eVOS
X-Gm-Gg: ATEYQzzny2IiVn4NxS0aaujRV6s+ZeVdc2uavxEM5erMmIq9y//Oq2T4WbI5XUZC6JQ
	tVViqw2iqmVa1JJNh38EfWvzR4Wbg/2/mzEYMbDXo+uLzoVWLmt8z5BuPBNnuhq+sihnLPYP+1Y
	35WqVG15Ho+pzuxVpHK+ceSUTLUEt02thmH5OwMQcDdiCERuyaLBoGFV94ouEBEwouW3pGwQuMC
	7JntXtZcTaESVB7i2+6JkgXb3X9eUFfhXC93FPkfkbyBP7mQFfH/xqrUmfGpxMtnB8gO5prQbPl
	HU1sMN+3f/QVqRSPcmaBd7WOURmCBotqe2V6XI+V9WjPMzwa7a7zBgsrlmnf9cPt7uy7GWwu7gY
	j6Te8JT+IMLh6KJfVSwUZyHzEZBgCgI5RSgIygvQqRJAdcR7gCJXNy+vvP7DoqmnSQjXMda9IjA
	BVtTwls/jugq/jRQ+4WFQnYS6/Q+ZEmJ1UNfMrdmdlBpxWe/MD
X-Received: by 2002:a17:903:37cd:b0:2b0:6621:cedd with SMTP id d9443c01a7336-2b0b0b1db45mr42631355ad.49.1774455724221;
        Wed, 25 Mar 2026 09:22:04 -0700 (PDT)
X-Received: by 2002:a17:903:37cd:b0:2b0:6621:cedd with SMTP id d9443c01a7336-2b0b0b1db45mr42631045ad.49.1774455723724;
        Wed, 25 Mar 2026 09:22:03 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc8e958csm2945415ad.66.2026.03.25.09.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 09:22:03 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Subject: [PATCH 0/2] Misc BWMON fixes for glymur/mahua
Date: Wed, 25 Mar 2026 21:51:49 +0530
Message-Id: <20260325-bwmon_fixes-v1-0-9433f9d4c276@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ0LxGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyNT3aTy3Py8+LTMitRiXQtjSyMTcxND4xTzNCWgjoKiVLAEUEN0bG0
 tAJg0fhpdAAAA
X-Change-ID: 20260325-bwmon_fixes-839247413d7f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774455718; l=663;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=bvpqWj44ib5WF+12jOlUEH+Vppia8zwBwMPB9/lcfAY=;
 b=JjfKVvfGn05UX/FP7i81eUkGX5fP7Y2nF8x012aFnV9WPnjql2JnlCMAeYERTBsUmnFU/Eyfs
 1nMFKFVQomtC7WVMQFMw0V6jKs303gHd5kq1uQ+5AuT9aTMHhefL0Yx
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDExNiBTYWx0ZWRfX4Y4r6ny++xeE
 kJeNweHPZA/2w/YlyVqHkibrgirJEhwzS+gTwW7s78Bnlga0C4M/Axn9EbEc0t8K67Pog9HyvAf
 Ndn2S7GzQtmfC52e9FnjuH1m8TJaxCZzhtMDEgOXLVrcn1L6TaK/DwE69RyxH7Dae/AtjTt/02D
 uPlGuG47T2KmHIgFsXxQ6YTDRbDiK5jVDu83jRbamE3SkUEDijnnSv/7HoNiOA5dOQYwWCZd3Ug
 bl48KCMMMD/0BQYrTao8xQD1wsAKqrHjW5/wCRQXOpNDuLBvGqd33w/TFy/t5eZdGLFi8NxLHYt
 4FPX1EMrBDOhZU3ph9tDO77tJPauoJcKhcjDe9WLZqr2XaSs2IfVl7NB+iw3bICKPRPTWEGRM8c
 jN1SWBhLKX1yWHhSqePDmqKuvR6yK31WZKCUOmMjECGh50kaQWUorGLEaLarYJYDzB9Yzvny/vX
 lVhlNxAUQWRw3aHfGBg==
X-Authority-Analysis: v=2.4 cv=VODQXtPX c=1 sm=1 tr=0 ts=69c40bad cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=frtQ8PWTZBqyM4CBJ3kA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: ZhiOv23AlJXBJU9ptlHtA-E7RhP_-9sH
X-Proofpoint-ORIG-GUID: ZhiOv23AlJXBJU9ptlHtA-E7RhP_-9sH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250116

This series adds the missing opp entry for Glymur/Mahua SoCs and deletes
bwmon node that corresponds to non-existent cluster2 for Mahua SoCs.

Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
Pragnesh Papaniya (2):
      arm64: dts: qcom: glymur: Add missing opp entry
      arm64: dts: qcom: mahua: Fix mahua bwmon

 arch/arm64/boot/dts/qcom/glymur.dtsi | 4 ++++
 arch/arm64/boot/dts/qcom/mahua.dtsi  | 1 +
 2 files changed, 5 insertions(+)
---
base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
change-id: 20260325-bwmon_fixes-839247413d7f

Best regards,
-- 
Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>

