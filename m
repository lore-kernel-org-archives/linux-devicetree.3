Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A153E4C9D
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846566; cv=none; b=nRA6XxYTChZYw0BoS6N/3UcbHl6fbmCHjdL6R1bNCKgqgA04D0jhZcobdhG0yMHO2jGKiV93IIPZqnpV9ijg7+aITRRArQx4wiuEzDotut9LQsArKdOX6ILucg9YrtcG4rQWEetG9ykDfkWJ38CCHF1qubRsp6GnAGy4KSLabp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846566; c=relaxed/simple;
	bh=tJxPPq56oTttVHJaPtRM4c9Qzn1XTxWpx9pHXI17Wa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rowuGAla9Xc0kc6tqSxQA6/NH9RRdz381zEr5Cati5bdR4HkfjzwahNwgrq7gRgVoutOCpp5ejjgSLWhlcG0zbkVwajHUq7y8UixaNFcmNJhDA9u2jDhb1p9WZgL6i7XjQyNgjg8hatciZlPXYrREDd2Dv2/fZH3U7/r2ruY2AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cqbTP2CV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NwDImg+L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cqbTP2CV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NwDImg+L"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AGfIqc017527
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PpM4/bNxVdS
	N15mNrhrEkh3wOregdIC6n4jDSJV4w7s=; b=cqbTP2CVIctEFenQtFPis5Bptrl
	NRjJ4aKvmRX//2TYdiRxbZrWIzT08BLHfJfoMsJyzG4cWDmRMrfr5ZcPEHrzbNH5
	13adiZZtyMv3OlmMgRIugAqCw2FqRzo+Zq+l+6TSUt2xpZtZiK6AMjFwpBPj0ID7
	4bk2tLmkmHlbbCuvD0FqpW6s7NlEyiUajyMHgbO+dGsKxfml2T6ZoGA3INViRgkj
	KW1QftK2BnDmM4WR4cx7wkDbFwD2aYnvxpR+GOGmgQyWStB/XXPRZ7GVlMJx7/Ku
	lQwyS7VDOjuVWYjKYRX2AVfpTaCPsdkzJpSPvDmKwmeunTLHVhFuhXv8Vpg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dey5j1m52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35daf3d3030so2949306a91.1
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846563; x=1776451363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpM4/bNxVdSN15mNrhrEkh3wOregdIC6n4jDSJV4w7s=;
        b=NwDImg+LNqakqM215UTGgoCMoI4fgDyXqPoO0U4B8qypJrsCzgcLJIKyRA4hTk9k0q
         lNegm/AgXAFiHuyQUYBE9hDjnJl1NyXBfxfgWYGtsUeeywC/zYPzEDDmAAPGPXy1i3ew
         3ENv7tphllWoGJSaZHkWQZMNYP9+eGaV0TG0rT7Dvhl3022EUH2ourdhKLucSHqjNLMn
         gyvtYFULs6K07gXbhaw6fsuzRSKQxQVJhU7muqBCLi7o4GOmVg6paPVDBKs9kRevmxGe
         9m9WC84fbhTxPhus2PXqF1Td8ysVlygd1s/bpEB4+GuyHgEombJAml/M8OovfRefYmIS
         MXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846563; x=1776451363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PpM4/bNxVdSN15mNrhrEkh3wOregdIC6n4jDSJV4w7s=;
        b=dqI2WQCBWTAFVh9T7vhN08oENCoPNaHGIVf6CkJywjRssNjCMk7N2atY+9r0ahPwz9
         SjNfxSOyPUGPng8JcYsnTLUlqSxyCQ10GOJWrh36IRJE2ZB2QYjTcJh0Pb9hAPWhLdVp
         ZQj7wT8f3OGkJjiKi7D61tRG7KqAS4kJWV+54lzXv93JrXGos92DMAblEd7Iou0Z74XL
         bHdFiwszvAtjX69HQ4XavfAhhRePE680AOxujHNVU4I3oeU58EUoduQHpsXxwKtFOVkh
         1m6twqOay5A9/koksQU73FYBimTzhAeYlqyvKN5LHpXb9TN1axxPqFf+D2p/oDqiywb1
         X5rA==
X-Forwarded-Encrypted: i=1; AJvYcCWTlfZk+kORRgPl92Eciuzfjx6YQacaVZloK5IUcOu99UT5GnPTw/giY+OypcgcZM/Wm1SGxpvjN+1G@vger.kernel.org
X-Gm-Message-State: AOJu0YzOO3L/MW7be6DfIIcljEx5PkeP1aLnfzupRRJAovHXc7tIeOjy
	cTTruCZFrQv9HZqwh9JYXHIQ/OkoVZe0TC258uZ8HNWnux+xIjmJuYsPDEJZsvJmKDgO04j5er8
	vkeQZnoUby1w4LEyCexBGdKvpDG75NNdfGXCadMzxasjZfRiWkKBxeaF7uAhp2v8u
X-Gm-Gg: AeBDievF2J4UII/Z2DMaleVVwfRFF7v9nn8ZYSKoH0khSb4QsZZjzmaIJ+ZtrLCqa2b
	xwJ/xxQ4duNOIZVDr+hIV4VCuYbiAu1OlkO2a1+YRmq7IN9iA3bVNUSslhIxecMctiYfPZF6Kuz
	JFumOAPfbbXJY/48v7g6vuPjUV+Jna3LJiXSt/N9kBzwkUnegPZkai2D8WUguLAWMS5LJncuvQu
	PgL+p0rHITORK5mb7StCsr1b67s/wXCbMLt3LsHSlG4WBD1ey8W9THF5mw7kJ5oWEpwP1Gvt4DF
	pZhvdUcdKkGhT7DCrcZVTEzp5XzFxm2oBkiO0g4bay3RxlldRSzjZYaKcSCArFosROfP7gFLbBA
	MyU8ZtdnmPGWKr5uUET9EWdQhbzIhjUglY2USldQfhkJM3ARl
X-Received: by 2002:a05:6a20:7347:b0:399:12d:41f with SMTP id adf61e73a8af0-39fe3c92b30mr4885013637.7.1775846563355;
        Fri, 10 Apr 2026 11:42:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:7347:b0:399:12d:41f with SMTP id adf61e73a8af0-39fe3c92b30mr4884974637.7.1775846562709;
        Fri, 10 Apr 2026 11:42:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:42:42 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 10/35] arm64: dts: qcom: sc7280: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:47 +0530
Message-ID: <20260410184124.1068210-11-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NobbM_-J0JG5r8pHpverEXPEu7C9Ta8J
X-Authority-Analysis: v=2.4 cv=b9aCJNGx c=1 sm=1 tr=0 ts=69d944a4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=oy73fdSuVNde8ymsYewA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: NobbM_-J0JG5r8pHpverEXPEu7C9Ta8J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX0bN3f5be8XLE
 ts/uyVaTeNjKxX3rTEFAb0oTbhrgr9AQfQAqIGfvABkIoMEKg9zW9gmwnk0GDOo0WieF2CIm2ZX
 UcYAO7XASoo93aMU9oYh+PTBO2efGjPPSU/dAm+2TIugtm6HO7t2+hDLCdzBd7i7TpSiPSDRzCx
 RxLp+kg+CAg5sYW7P0qQ/KDA9LXYJKTI/lFyW3lkmpEBY6b2yUd5DIUSN3PNiSXkvHmptflmgLs
 /u29FFHm98YgiuCQww39xZBWGuO2XRKUgg2qu2czh6wqt9/+y/1FJbLrVbAo8Y1ztTT6IRF22CT
 L4l8EceaGhN7qa+JF6gFBobNjL2weVOjoWsPrjWa96f8g9WK38msTOJm8h/XAyIqSDicM7tFV5r
 YSJmrt0IU8yWPPM5HGhHKcail55Fz9ehjuh7VDu4cjC1u+CV9iZtOk0LdcRVJ9XKk6Z4M4tHxhI
 Ig2PYYhNbrjUU9cNkBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 6079e67ea829..e3c0c876368f 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5629,7 +5629,7 @@ opp-810000000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc7280-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>;
+			reg = <0 0x0b220000 0 0x10000>;
 			qcom,pdc-ranges = <0 480 40>, <40 140 14>, <54 263 1>,
 					  <55 306 4>, <59 312 3>, <62 374 2>,
 					  <64 434 2>, <66 438 3>, <69 86 1>,
-- 
2.53.0

