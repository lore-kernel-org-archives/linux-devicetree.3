Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783509;
	b=lEZqL3ClEn/DHeCR/XTfm4TGeqr/D6E8jcx4E2GyzOWTjeU5YS59hT2cWjK3zN82895e
	 GkWehYVtLLwdTFFGkb6VUrm/iu5hSeXk0b2QEyRy1fIQ8gzFxA2s5Lq8Tu5RnuD4h6/y7
	 aoDn2DvWlLIeyD3sdqmZq9b56cpbzkrfd/bB+DCkcIlXiEtuRT80v6QGDR3MhfVNivbAP
	 SvJuFQQvx1UQyp55PdWsDIoDUlOc0N9fIRhkl292zzrC4J++YPCOl038Vyc4D0HUs2YrH
	 qHzlF9UcZLYRGHfaDe2cu2SrawWHuXgo9RUY0DifgGQY62b7c9YQRiOH3dyDGvLRl5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783509;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=H2B5SGJlFgy21hJZry/CquPSo2DWZ1AoJ09UdiQ0LRo=;
	b=WAJ/ByLSimgMFIacssa832xeze/a1CEt7IxLkBtNvZacZxzynVBEJbpCe2gJ6UcJjzLg
	 OyAKnTSwILS9fE6YmzwGlFwXvLkp8h1r2cNwgElrPU4+HvSq4vb8rHfjkmxchjc0oX72t
	 Uv1+nIiPNL3eiAeBtLDvM/OeK50dF0JNDZcBChOJ0lN/Z/cLWk/4fjpkx5DIGMasXSE2Z
	 RG/RYdMt8CLIssTR8ExQ4A1cdBnbHj3bto/Dbwiu4++FW2eVBlbpjqrVeKeZl7hzh1Amy
	 oQ6INKMjm6+6+DwWnChKLyIlr9IPRpSmIY0I1eJj6tPJg2dpITDcNATOaR3+X4yVNTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hys0TX5T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aQJoNn6J;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E398F606A326
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 09:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E398F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hys0TX5T;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aQJoNn6J
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48L0IJ1274969
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 09:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=H2B5SGJlFgy21hJZry/Cqu
	PSo2DWZ1AoJ09UdiQ0LRo=; b=hys0TX5TBZYlzyDg42eQBNIgnHgwauEItfK7UG
	396IvuvL/C3oXqDXI9oQknLGifomiwibAuomRz92eqGThtWw2+zYdu7fIHS6TWA9
	2wFy4DBL5AkcQRiQqpqNjIgs8xIA/UA75Lrcua8uBUcIEmnNBX34ePCJgDMtZTR4
	cwhPuE31+CGXuIM4dsw7Kj0pMgz3c8kEbr6jczg5wsNpvbYuFmK20CmE+DVaDMc8
	SqysNxZEPj/riPjKukVCnhEvQHPvUdeFcQ5yWF399R9UPMOqrWGyCIn3ZDsFW+6R
	WrGYlTIHr4aY82EAORpaVKii9aXdxXe9uJYA3NYgodQgCNcw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhypm6xr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 09:11:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae72da2f57so887676a91.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 01:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793783507; x=1794388307; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H2B5SGJlFgy21hJZry/CquPSo2DWZ1AoJ09UdiQ0LRo=;
        b=aQJoNn6JKjkq8xh3CBcxw8grJRnv3Wtj7KpoeIcgqezEqzrspLZRxYtMysLw2cnhv3
         Qd4V5QCrxi4pKDxARxUsjCiQkql0GcJTpIHH91aBaKHG3F4AClARi5eX/K0KfC67Xixj
         F6vvY2K9+xxrkloaIri0hE9AGavRGIzMo4luwIMNrH+fl11CF6la5dheflhZV14s0YUy
         r2+eSYHHU1E4yYOrONrCLcEiuEEXrv0zJJYTlfEkkqHURWlD4dVmXJi2K7F9F+lE0aP+
         rS/tfSHW75JOxSkArCc6GrigXGbxp7lgkjmJqvt0724YvTmnRMU5mEm+uRppsMMVpvUy
         nUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783507; x=1794388307;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H2B5SGJlFgy21hJZry/CquPSo2DWZ1AoJ09UdiQ0LRo=;
        b=aaG2hT7XcbiUtzSyRK3oSnT55MVhVOVlk2DZGWAMRJ4kPBDwzz/LMTlwFx6ZkxG2lr
         AsIRZBOsskdfndXV5UlYtR4UD3kSxsFidIaofyDGLVCwz6887JdQiNkNcaXQVE1wrrYa
         0SraWW0Mxk1T9CAZmnHs3ZQEYNn1ogHkJX7uCpdBFqrcDzXtKzPpuCQlIPwqnPsArn5w
         GpXuwCZwD074b7yhvm2Nz6RFPb3OzsMQLYXFVU02NU3eoO/rfoJz0i8yti8eLBnZydIe
         zhacIaIBeK0ruwb0Wke97wU0vV4NXlr/l3CXvgKoxSLtibKuVYIF0OSFKriMh+Z0anZP
         IhHw==
X-Forwarded-Encrypted: i=1; AKwUvBzCFbHIpsJQ8+US4o7/Kqnp/kV+7Dujf8EqLHx4l6n/fd+wNfiJ0Z98h4xHyWmbwMegAcuuPACy2TVQ@vger.kernel.org
X-Gm-Message-State: APuU4Z9s11djq88Kp+i4tVQPq5SG20t64WzLkdUMQKazL6Z119TThX3q
	dPCJ22EjhlJ678b9ypGvQlOMpAmmb6GOvVFnpynoDmDfB95hKemOxVywev6prgDunPmHPsVhX5o
	qpkxOi0Pppq2rh7SMAmNDjPyLvwR+KgFIqBvj/wEc+04K6uO6s34VbdhJA7mBP+J2
X-Gm-Gg: AYBFou1JzIiuygAdw092KbNgGVD8pgV6ye0BJMQIdi82V5oYQ5sNdp+jGbEq0/feZlM
	uNHCNPZkeA+nLTCM7gCFP9XmZSQ2tBbhfY3u3TO2RruBvt8Y9fo0HMPiVn4QmW7m+x3hnO2E9KC
	aiADKIxaZw0GHXrlCF953fiMDpUzRj2IMMaduRgl4dzGgOPXZkzd4oL0y2BTWW1dTFhoa8YGNey
	srzWg1PDb2DOcGCpFVbegj1Dek/0rnZG4xlPhng+28qZ3qO/FwmlORbH4jypOxkEEWmSYOPC6Ko
	WhOzaQEUrNf06/U1RNxnJtx1UBwQtzYpya39p4kb+KNcjlR9AFcD8PGvPxbndIi/rwWSRm2dUsR
	n57b6o74gu27Wun5xzUmILyWbpu0XPztSy5YQXXg4jrrb71aPOE7UVbU+umd5PXdFch3YZFJ2Il
	+2rRZeHy9I
X-Received: by 2002:a17:90b:2882:b0:3ac:8897:7b9d with SMTP id 98e67ed59e1d1-3ae89574cd6mr13912257a91.1.1793783506826;
        Wed, 04 Nov 2026 01:11:46 -0800 (PST)
X-Received: by 2002:a17:90b:2882:b0:3ac:8897:7b9d with SMTP id 98e67ed59e1d1-3ae89574cd6mr13912209a91.1.1793783506302;
        Wed, 04 Nov 2026 01:11:46 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c896cc6sm8253877a91.9.2026.11.04.01.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:11:45 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Subject: [PATCH 0/2] drm/panel: Add support for Novatek NT37802
Date: Wed, 04 Nov 2026 14:41:35 +0530
Message-Id: <20261104-jshekhar-nt37802-v1-0-58e5e7fb2556@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMf26moC/yXMQQqDMBBA0avIrA0k0VbrVcRFOo7NKETJqAji3
 ZvW5Vv8f4JQZBJoshMi7Sw8hwSTZ4DehQ8p7pPBavs0RpdqFE+Td1GFtahqbZV7OF29sMQeCVK
 2RBr4+C/b7rZs75Fw/X3gur7pRRu/dAAAAA==
X-Change-ID: 20261104-jshekhar-nt37802-a5a079c4cdce
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jayant Shekhar <jshekhar@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793783500; l=1143;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=z3uvju1pN5NHrCsshehfOyEGWd/5HX3WCZMbJ6sj91w=;
 b=X9Tx0Q3lQhYYdNB1elLXJJf+WfAbrOm018IM2ixlNdww4xKtt8J45R3/2Wo53DObcQkC2bOU2
 WxpOiETXiEpAAEu/cnsw6fE8WuOgmCXUvjK5hfOcDi9qj16FdFI/EDa
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfX1G3Wv7AmEGiX
 gxhf7M9BhroWA9tu/y6dy0kYDnG1eSb8GNCaayfbpJEJxTES34/UTxNXj3jmCSOVVcsAXE6B0XJ
 tl7Ww6N+fVR7X7bA7ocZMMixYZRJ3CU=
X-Proofpoint-ORIG-GUID: ndaopn_mUNaEOUgI7oSOD4_-zvWCkxw-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfX9uyk6W1Wd/Bh
 dMS5qup9qhgcA1xnsdzcOGpRnqH+WE2Gw5qxy2jrhFZtAtjhVCQUxnKGC0yzGFK5GnH0lE6uljE
 yJBL8aeQyk/dmXofrFVoLQ1Ib22hBKWqacAAne4sUbckMq4eIupvihqYNb3lsi70F3G5osauyB0
 o5B+Quk/yTENuYA2luh7QzBYOUcGdDA9li5P4rRyG0OwibcKVv81NAcdbdWKsTD/LiKm2H/cDvB
 5UhmVqSCU9/4fETxHnrGHIAeM5Xl1QfRue61mYZOZuP1GpRhrh12/ngU9VC0jiiCJQNfLQA2CjK
 F01AyX0Srn3wZsbksE9iemTrBNeMPZQiS6Z1UBdDZUCgdKoL5CZyKrABApoIuONCC5Po2+sBTnX
 2jlwmbcdD2QAiObF9DPIcCBgMKEG11EViVmH64Gmp7ojMXp014FXnJGbSgviHXSc9Kmxfa7j25a
 aazficQXP3pIYVToJ7A==
X-Proofpoint-GUID: ndaopn_mUNaEOUgI7oSOD4_-zvWCkxw-
X-Authority-Analysis: v=2.4 cv=T94Z3PKQ c=1 sm=1 tr=0 ts=6aeaf6d3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=QthHNoVtvuTdp5M_hsQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040036

Add support for the Novatek NT37802 AMOLED DSI command-mode panel used
with the Maili/Pebble platform.

This series first documents the panel's Devicetree binding, then adds a
DRM panel driver and enables it in arm64 defconfig. The driver provides
the 1440x3200@120Hz mode with DSC 1.2 over four DSI lanes, sequences
the panel supplies and reset GPIO, and exposes DCS brightness control.

Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
Jayant Shekhar (2):
      dt-bindings: display: panel: Add Novatek NT37802
      drm/panel: Add driver for Novatek NT37802

 .../bindings/display/panel/novatek,nt37802.yaml    |  69 +++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/gpu/drm/panel/Kconfig                      |  16 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt37802.c      | 544 +++++++++++++++++++++
 5 files changed, 631 insertions(+)
---
base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
change-id: 20261104-jshekhar-nt37802-a5a079c4cdce

Best regards,
--  
Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>

