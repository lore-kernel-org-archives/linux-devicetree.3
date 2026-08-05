Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0C742B731
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 11:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785929255; cv=none; b=LdIUMxBaJpMFRZdXdnSwB+u4G+1vEinhAGR2tKEsTkfbmFamA3jbZM+/uNGBWNWPmGA7K3K/UYkMekcfpdmpbM7xPw3YB+tqSF9AUtZym3j8rD/FXGaOcYNnqwLVxKkt9RTaJ4boHcD/RTom9oNlAHJFth7JH7zXIEiwtQmm1MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785929255; c=relaxed/simple;
	bh=T+99mWPksof2VSF3gzUyZ6wZ7TeXqjB/x+jzl1QEcYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZL3hK3QIuMgh7TcNQF2klSkfkiRcZpFebOEuUCX9KpRTdz+RMYyd4MbxNqxpKTlaK/5F0t8gBSWTHv52dxrCCQi5S1BU6QBm8nD5SxPVSE7C+evdBMoFSVrLBLZl5GRpuN2d4LDsgg5DyO4v24LBX/Qrnxw193L5rNUF0KnKzI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YuBszU+Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DyefGaAy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YuBszU+Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DyefGaAy"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758dDZW2128941
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 11:27:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UF1gKpY5yyAe5I/iG7Uzh3
	Si/u9kz5pXI2mpXVTlwrI=; b=YuBszU+Q2GGkLleuuVYsLWqt7uiRs0nh1indmW
	6HN6WUKF0+d4vHJiaSHKUJzz430kAfHQprsztRrqbGZlOIKjNRmBQbp/0C3wUa9x
	bSPQWzL7WrodC8G00U6MOTr5vgPLmX6jYJzB2Wjb6QfCGq6y88qSRieIQwMyQv0F
	R40PRo+oeSMcMO3AtCLORMudrXa+z+5ITRQ9OHJ6ds8DUC24kWOS574Hrws5eO9P
	l8tNPSBVLTisQz8flLyVyW7h5Ti9uuJsJmfoTfMz4XZ+YgzCg+CN2A4+J6oUHGmM
	2lddPzSbDPbPfzxi8/9nluflKVvG8yJY1VTO72Fi0WMtseYQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv1qg8qfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 11:27:32 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84eee2147ffso1192181b3a.0
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 04:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785929252; x=1786534052; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UF1gKpY5yyAe5I/iG7Uzh3Si/u9kz5pXI2mpXVTlwrI=;
        b=DyefGaAyVAKDM4So7AXCSiX+mJPfDdCAB+pEh7X86ykKKmL+fwzFWBZAd0NchfjfaY
         R/0eZUMdmce0fKcASXeV4M2e59nC2QGwmGtrJE+7mRtOYl5GQUnsVl0BopIk/l3+Qn+N
         1miJ63rijWfuuLYdI/0dhoFlh5+DHAW/S6qUZOABC5RKZb2r7zVV+LBsas9I+sF0YX91
         iSnWE4L4ayecv/GVESvnoByX+Zvknarf4T2d2ZdqPmYf+lJ7L+8hznLPuOXK0ECkXwf0
         Gpr4YBszKx2gzSJw/0/xpK7boTWpkB6+7uj1MyEc8obdC+QbFECCrWTCV3KoK7ZcQLI3
         AQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785929252; x=1786534052;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UF1gKpY5yyAe5I/iG7Uzh3Si/u9kz5pXI2mpXVTlwrI=;
        b=Tic1iMnq6OxDGTcwpEfDWtUy+FZUNhYYIVBERginrcsd5QD1CXuHjPdvlT10FzesQ/
         fJm8pXlYajdUntYKkRhO8lkG976lZoXhHzQplp/d0yXpbkcmSpe2t8v4SuD+lBzFap0H
         HiRmKo1tFL4eZU4MmGTdxPNUCgxci7sPjlncBycoVuwvDfzpSB21xS54Mkjpqq0kJIGx
         YTHN1NT4fEJEM03XcEsgrSTKYXbPe8SiGC0bx8PPyScjSJVuEk5JzxVRGEHlK0ubCnWq
         Hns+7GiBS/BS8IM+a5fahG4Tn5AgFMv/hqvOGBFkYTdbmEU0vXygF24nEU5gzhYWrtiH
         fWnw==
X-Forwarded-Encrypted: i=1; AHgh+RpOA+v/yRoMZvMAVJiayo+zH6grBwOfHqMIxJ7HCAzLeMHleZJm+/8ze831ibgXgSlCbOiNMagfZ/SO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw24NdjpuYKPW4lAir33NMwcDovfKJSgfsbRCJq9Qim4RPboL2j
	tq8jbuEWlEF6KvGVCOaVphSjwrLUDA+XUlINvNVS/ix6gOPGl1TYHKW6ru2x7p7v4ouQlyrZlsi
	wmGKYxEMX+1o3/y8jE8lvTpeUcR8aDe6jFzwBylrAPBld13wqTOoctQsGkJNzIXoIbSjJuhwN
X-Gm-Gg: AR+sD10C+GOFq+8tQ5X+xUZmxmJovNf+YMxZBpkTqRCXi/pxGa9FBWr5ZXr9HCHBNtG
	VrLpJmXdeAtlsOq1NFzkc6xU3wcwPSY3VB3wF4f8b0qxSPOOb3d9T729/ah+0g3xzjOKotKDAnd
	c0d7uEI/2NtKVrOdWnmzZ/0f1Ll2Rzhqqndrnxr+XG4XZg5QFd+I7btI7vgdzTqdZLyVgZQdUHI
	QgE1JGo7W+gJZq07WlGWvhSttOvaCmp6Kp5Nf+ftYJjYdjWGIeSbEwbXvAyIIh6i59Lg7nBlw3Z
	QGjVEEHXkqadC6DjB0k1HuB0/OuFLDdvxWYr5bFA/+neY9qQR7a9u0U2GDS8IFu0bnP0f4/9464
	/rGUUiZyVO+nJQ6d0q2oyZYIJGadNwcvBDwg6
X-Received: by 2002:a05:6a00:a226:b0:848:2a55:7110 with SMTP id d2e1a72fcca58-84f2e13b00emr6267227b3a.36.1785929252141;
        Wed, 05 Aug 2026 04:27:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:a226:b0:848:2a55:7110 with SMTP id d2e1a72fcca58-84f2e13b00emr6267185b3a.36.1785929251659;
        Wed, 05 Aug 2026 04:27:31 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f2e2c5eeasm710197b3a.7.2026.08.05.04.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 04:27:30 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 16:57:23 +0530
Subject: [PATCH] arm64: dts: qcom: talos-evk-som: Add firmware-name to
 QUPv3 nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-talos-evk-qupv3-firmware-name-v1-1-3ebd5e5578bd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABoec2oC/yXMwQ6CMAwA0F8hPdtkDDTqrxgPZXRalQErTBLCv
 zv1+C5vBeUorHAuVoicRKUPGeWuAHencGOUNhussQdzNHuc6NUrcnriOA+pQi+xe1NkDNQx2qr
 2htypaV0J+Rgie1l+/+X6t87Ng930TWHbPj8RpJ+BAAAA
X-Change-ID: 20260805-talos-evk-qupv3-firmware-name-234f0ac9bdc1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785929248; l=1389;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=T+99mWPksof2VSF3gzUyZ6wZ7TeXqjB/x+jzl1QEcYA=;
 b=g6xav5QRNJzsJZJciMYZOeFDNm+ALlbwVW0fHyiVv26tR5lN934qZUmHm02RUjA9dtj5JmthP
 qVs1I4q5LmcDTj7ImQZcc3ejvZmIutK4I+EDf2t231koxBteazAo6tv
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=I+hVgtgg c=1 sm=1 tr=0 ts=6a731e24 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=8rlZebuS5uYMG-XfLoEA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: y7sytGtUHd9oG47VdUZegMFN7Y-rhavG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA5MSBTYWx0ZWRfX2z8DJh9sCyYl
 4VgMT4k8mkd3oV+6H/hn33hifCRiF/3OVsXA5yhjVftScwT7ydmeDBwq4rMWPEGRlgdfQzTp0Gg
 RD7SK45qGwEGmlT6dMOAbrnsb45fS3aWQqhwdvAQ5GweiTxW3w5mUYSwH/TtgA12cgLGKekW+9W
 IcrLrsFYJj52+Ln3vPoykb1Ah6Pi2FQbZEiG3wr03Aifb1at4YVwEjQ1L0bPvq4ZIeEsD1AHWek
 0JfSN2oqbGWNJjy//UFngoMHyJo9KZMiJYD0hKQbeMtKEWqXZRo4v3T08XPxolUv1anK0nq/E3o
 Kjl0cjgqY9CF+19K2jsvTG1yPH6KYkC5eLSRkY3u8njOCumqlHNIfGJxsKELOU7AcouU/rQNxwR
 Ajdv79KFsMhwNh0ZXY0y8hIz0O6PZpMH7pycef7qwqGPIrSenHXMrkDcTXGuopneLG0eOhBlPIl
 4YoNhZF2s1BFPvxKiog==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA5MSBTYWx0ZWRfX0UxhfZXMBQu0
 3LEI87/R51igRk0aT4nAQyEw3kPFEPZ8ebvigaj21AUK/YefTvYzXxldo1JA51VRjK0wjoxlFR5
 SuDDEn+57JF9ggT+XYCD15wxbnRo1eE=
X-Proofpoint-GUID: y7sytGtUHd9oG47VdUZegMFN7Y-rhavG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050091

Traditionally, firmware loading for Serial Engines (SE) in the QUP hardware
of Qualcomm SoCs has been managed by TrustZone (TZ). While this approach
ensures secure SE assignment and access control, it limits flexibility for
developers who need to enable various protocols on different SEs.

Add the firmware-name property to QUPv3 nodes in the device tree to enable
firmware loading from the Linux environment. Handle SE assignments and
access control permissions directly within Linux, removing the dependency
on TrustZone.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
index a057a7271480..8bed53a8bd76 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -411,10 +411,14 @@ usb2_en: usb2-en-state {
 };
 
 &qupv3_id_0 {
+	firmware-name = "qcom/qcs615/qupv3fw.elf";
+
 	status = "okay";
 };
 
 &qupv3_id_1 {
+	firmware-name = "qcom/qcs615/qupv3fw.elf";
+
 	status = "okay";
 };
 

---
base-commit: 9a4cdc958dd79fc6c3b20b51a10debec6ca09fec
change-id: 20260805-talos-evk-qupv3-firmware-name-234f0ac9bdc1

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

