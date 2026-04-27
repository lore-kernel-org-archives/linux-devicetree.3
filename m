Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6AE3B47E1
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284360; cv=none; b=Fkqe+8GID5nzEyW2yC96tABxTZTLF1Rc5P4YHTKxsH05c1NbmlFsfiV8VGlrlIPVfAH7fHfyXz4fLC73W8yCe5gTo0KNlNJ05FP6W74aqEL4kGoGIW1LdP8XEkUp0I2qb4G6RBk/wmapBTm8AsMtKBZicA0IsZLuw1o9ikFiAr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284360; c=relaxed/simple;
	bh=p8M74poezKvw740VE4mBcYJSH1dA6AFy8jlB9yXNq+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tjDUggt8hCZQU5Pb85H9rRE/AU7x4k4kj8AogRhn9wIefFtxGRVJvsnW59BZFYuOJ/Y0s2I/dTOxo5Zmo+NIKF1fvvt24QR/HIDT1VRKOiYMgffr2/K28RPyTW4uUuKe0gaPnacIX2xPjZImnQkAKH6G1GkxCEuWG4pRWmVp/7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PKRkAvsh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QFAI4wDf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PKRkAvsh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QFAI4wDf"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R9Oe0x3825258
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5OAC9CanJ/+2Zt8Fy1VZoGxcKLS/SkOBP6k3HJ1PIPg=; b=PKRkAvshUAiu6Ds3
	aTvEBHlxyA84HxwK/1h6/TGJeOPtWhk5Cbl5AS9dKvpN7m0JZQJFeEhdAug+mNXN
	L+g/fOlyO/Hz1K9ALJZnKRtqdmYxskHfKhNmrVk/zycXyINUgPKvX5T8X/n2KdaB
	IHtiDFc4uiYLabT8Jz0I9PYCM25xpjCsIaCHZbkHvNmeafq5uxvTN+rlZYrb4bo6
	ViRHr5TNUIaz6tqnGfOx7ZpHcrhq746w3fQsgQMPZJUt+c7YFB+v9k7LNR765AEj
	lVSZTp6y3XSMCS+J5huwR9cbu+DQ4DefbriJ1807qd8HjqNwjLVtLe03J28254au
	FzYJZg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5550707-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:05:58 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f9aa52c92so10352520b3a.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 03:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777284357; x=1777889157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5OAC9CanJ/+2Zt8Fy1VZoGxcKLS/SkOBP6k3HJ1PIPg=;
        b=QFAI4wDfKqAxNYha5ZZ5l+oUkv9AtA5wpGeF2TLj+x8kNSrD+JhN2b5Tf+2ZpZrqUp
         5OD9IGTzvOFizBWN+lOgI+TYbU7ew+RkOZBBVLtv78pRdqZOXl5cfFC40dCQt5Sfas+T
         bQtx5+mEOMpLwErXLV6XYVQt/rJJsxBzTd/XQHXp3So+jAORbNT0g1vdDdwzazQ1Kzml
         NKavLXp2c1hi0ic6cVKqQ4hpFEIYozBqanPUKI75GF3ChVm1X7MSWyv8+peWhMH4WHGA
         28mdvpy+DTtZZkEZFYPLO+FYcL6TtYpyog1rDSqGeUmGxRaepUfOZ1d1U4yKVCsVuSxb
         G7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284357; x=1777889157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5OAC9CanJ/+2Zt8Fy1VZoGxcKLS/SkOBP6k3HJ1PIPg=;
        b=NsFvvQcRRzBdX8nlg2B95JOuA58zaUwd46G8rUuZVL8Ihh27jh3s3wJCdVlc4QUQlY
         0FPxeVMCMUD6d+b55QSJgh85pFVGm54bP81lxg9KchGydDUR6JOg1S2VSs0SK4uSh5Lp
         3WTM+iUxB/xSos5t1a0YFE/m/I59vx7doXC5kulyZX1EibnPCi4lEUMfrnqbow0c5I5T
         fVKIGcESjI4TvCImsuEhsbpOcEOL/FsbhFlywUwctyu4dQJs67D+GikGGYCPSkGQLU+u
         h0paUKuLZakga+Aay5vwznmXdgDWHJwXeNQbbmATSKnmjcYo2ws80HIX0LPjCJ/cJA9O
         LaZg==
X-Forwarded-Encrypted: i=1; AFNElJ9Lxa/g9cK4gRkOj/HZwyREqlAquGDaF7VA6yvEpScGEKin9cRYq6njePEM8y0+dmhd1fKg664Utqvd@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1GjlFwwP7ql5pjgEijWW+uGeDWDXPvm/s1d+UYgYcWue1fVxF
	J0aYAyRQd/nF+nmhL/np3bXb7CGkpL0OQbB3RmGOZxtWhGWXZL/z8bzTMs5UX56f9rTDlb2+7D/
	TSma9In1LVOHiZGsJ5g5ObF4Zyis2zXFPEAoxKborWS8fmzsAFJ5J82lx2KRB6UrP
X-Gm-Gg: AeBDieuPW3au63GoE1UygWs5rZ39aks93xZe+7OcBzncZX7BQAhsFi7OFPwFEPxLYte
	tyABJ4JDj7AuY7vEtvyz4a3kQhhaoiGDZZLyjy7wZuV6Eu7FAh4M1x7FoLrv+ZmM6RRPwy6Aq8S
	KGAmjTh2vUhfEh1g5U1T28hs65jWmQd1kh0SySM7CH6aq2vtSczCVvksFSf9KjRjhPfdyaoomGm
	/wzL338VnKaKkCkvGT1Esp8V/CRGq03IObkDa18t1FCbzhF+rVmMdd4tWLD3YD9v4j0MGIi4LKC
	DzeYSgFjArb+LaSSKfSjf9py1NIbObkJw6E0VgZBJcvZSQHf5WHLC0nhtavbqwJ4ZTn1ygZn8Bu
	I6rXEa+3+oGDN1M59bnqly/s9gNFtVKIm4AWG3hcW34oAibkHaHd7/qMsa+qQuq3kwyY8vWImeF
	Vo8Njdv5Ic+9T9iwsj7/GCWJGOu909Jvf+pw/HudWzc0Jg
X-Received: by 2002:a05:6a00:800d:b0:82c:9223:cc95 with SMTP id d2e1a72fcca58-82f8c7db124mr43091186b3a.1.1777284357519;
        Mon, 27 Apr 2026 03:05:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:800d:b0:82c:9223:cc95 with SMTP id d2e1a72fcca58-82f8c7db124mr43091148b3a.1.1777284357113;
        Mon, 27 Apr 2026 03:05:57 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec24850sm33004008b3a.60.2026.04.27.03.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:05:56 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 15:34:57 +0530
Subject: [PATCH v8 6/6] arm64: defconfig: Enable Qualcomm reference device
 EC driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-add-driver-for-ec-v8-6-702f74e495f7@oss.qualcomm.com>
References: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
In-Reply-To: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777284317; l=724;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=p8M74poezKvw740VE4mBcYJSH1dA6AFy8jlB9yXNq+E=;
 b=oMYB96eaiECDwGVUkuL+RkA5FxwlIxcIEjxby1XZC7sAyRDeIMSdYgkAQQDFMeIqIrLa7diBj
 AnHEYtv3xdXBGdy66tkLqg8i76OtRYzo8tM/kn7RJ9SH2tEW983X+MT
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: 5FmJBuv8F0O5mtvl31ZcMf32di_1xnkl
X-Authority-Analysis: v=2.4 cv=CJEamxrD c=1 sm=1 tr=0 ts=69ef3506 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=p1egL3lCMx1E4hDV5aEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwNyBTYWx0ZWRfX95i0Uz6RTnNs
 HZEYxGYEtqwrd3ZW+xJ1c2PmgfhAQLcNoj8YoFDzfaNfv2I/VJTdIrT8yNI0k04qMWTyQ2H3HZ9
 B0AKbgHt7ZgA1gzJE7ZTfCrJPOqY4YUto5qCqcshI1S95FqCTLH5dkW/P4BzBdVZOTtQfJ++Dn3
 LvJppLrjbk6K+UKdqN/hMGexQ15IhO6XELkgnKrI/yxz9U97i/icYfLgzjuyJlQHDnpBbVcBdom
 OyA1lUbaGUMTOh/4lYRQQcXk97CzpzXyg9qv0uOp1lm7oaPc/kkFGh/AUItYnCYm8jlSrolXlAp
 ztqO4I2HVZRS/3z7uEbcu5Di2rHRZCeZSeBNX5bg5MkzPKHK9PV+6hMXAISRdH9nc6aeq5uAkv3
 4SpPK+o1lUpRALZI5VRk78DEnB9a6zUoq7USn4/DQNHdqt2xhQ37e2l+pL5SUgnYjHcIye3kRtP
 E2MZWcXbIN8aock5ysg==
X-Proofpoint-ORIG-GUID: 5FmJBuv8F0O5mtvl31ZcMf32di_1xnkl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270107

Enable EC_QCOM_HAMOA as a module to support the embedded controller
found on Qualcomm CRD reference devices such as Hamoa and Glymur.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29b..c48fce61d738 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1440,6 +1440,7 @@ CONFIG_EC_ACER_ASPIRE1=m
 CONFIG_EC_HUAWEI_GAOKUN=m
 CONFIG_EC_LENOVO_YOGA_C630=m
 CONFIG_EC_LENOVO_THINKPAD_T14S=m
+CONFIG_EC_QCOM_HAMOA=m
 CONFIG_COMMON_CLK_RK808=y
 CONFIG_COMMON_CLK_SCMI=y
 CONFIG_COMMON_CLK_SCPI=y

-- 
2.34.1

