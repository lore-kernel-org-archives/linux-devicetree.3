Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238D83EDE75
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875084; cv=none; b=FwoRtYL2tSLsHhY+dyXIL4lenF2zb+Adu2YSS6Z9wadnDh/wuUAGLPth+g8883Oy2P3IlvMPiC0Mkmo/mnxDIr/NCPaKximHrBcArub3TPNUpgQ7BLwau88LGdk6V+KklwkcTD7DPnAaxBmXlgV3o+2j00nR+cPo5vko7fGeVgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875084; c=relaxed/simple;
	bh=HvGcdrzs9sv1Za/3YZNiq7OWcG+JUczCiG/j1r159ME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ikSq6wzw1+RqY+6CrmYqeJgRiEyE1/givfFKSKlXdnnCzQa5LgvieeNfaTcEpkQzCEfwDutGUxSQiadwv1DFwfUiwdhnSdeuQgR7Mn2dWsgrrQv/xdTSIwVkcdIXtu4p5lsfHAZGt9Vl9O/VF/Pn1Yi5p+5MbAS3Cu23OkyLRfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UcnYuSxh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DiMLR0Fo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UcnYuSxh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DiMLR0Fo"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mYxV1350626
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xfajpo6nrlG
	EP54AarSeb21To7K0A8BSaIgEMLvvC/A=; b=UcnYuSxh+nGn7DWMXp1XO/2wx3K
	eeUfzkgYv3lr2r5Zev/W+RAzarK7z1M44TwcBAsys0YMngBbFZYGJzw0pTAXpfIT
	bLqIfd33nm5x0t13Sv6AluTZRbAoZXQMi+WKy3fEn2t50ElW5XZRffGjCQB/moP5
	iF4PGILCr7Ub67whDyo/8VBdPFGFUAj7ALO4oQxYDAM/MfG///OlTGR64A2Iw418
	No7wtu1+cIoL5uomm/2Et4JO+oQ7UvVP3EEzUdDe7zbQugRBY/XKjy0cCnBcO90z
	SEQ/oEB/5jTPMjERYEfT8AJLPk4mEW+CLG6R2Zj0c2CTD335rqqhuHy3E3Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edentkdu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2baf7748d0aso117830315ad.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875079; x=1780479879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfajpo6nrlGEP54AarSeb21To7K0A8BSaIgEMLvvC/A=;
        b=DiMLR0FoP7ewOam0PcyT2RAxMnGTvUwqXIe8gDDpXD1jM3HN12ynCl9J+lhyi1a4D+
         rEoRm7tqK4yUCxexLFqCUhj7UEa2Dmsh2sfh44o9/cHTQpvHMP3l4UImzx0/Oo1bb+uU
         c+ZS8xbKZHZknjIw7OgnDXDs1wQk0Hpj8oQbN3J+Kezf04NlsSIMsdqEuTNAQ+UMIveW
         2K5G1RiAPtUlotTxLvVmOzRJ8ihDcvxUH/1l/u6oB3r0Y70QPe+AeEP29uJPVODwIv5I
         E+YFnDszxCQAZ6SkJcBNwfiPrqYSjcf1fiYZMO3uxnDHQURec6OJ3AjPxJGQ98g8STZl
         qnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875079; x=1780479879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xfajpo6nrlGEP54AarSeb21To7K0A8BSaIgEMLvvC/A=;
        b=Td2x8JBaIMOw0kyAj8FO8MtfixW3xuppZvKHsHGUZUF3+fGD1iR0/lVbFevoUE7is1
         CXd+NejNehWnIQPuwtss4Fm5w8g4DUhuszBVOJVuGe6m/S4nyRM1bpE8wnmTYlWrLmdx
         o3xHVFb+Y1oB8Yz6cp5wMhlZ89TJX+/ZPgGY0EZDjb47f9ViXLgS+/U001njCgqy2wZi
         4KXkb77ZvTw+tm01YaJpHWyF0Tig6bT0h0GEHfr93OJ5bHE311wjRXDa4V7cBq+YpvlZ
         +7632Hw6HvoPelXz56bKxpphb0Shqlclt45TWTfPj09Vmtkz8qH+MvQTQg09B5Va9MZx
         /Ieg==
X-Forwarded-Encrypted: i=1; AFNElJ90Xp+h7LGY3Chb26B7QlAjHz/nvZ+82iXsLauLCg7bdmbgeupeBIVy7WwkvrrapcL5hKwiqXJbis49@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe2Kuw2dWwgUCMLlP+7zRXXrCBulZrpNnqa8y+bYFHLFy7orl9
	lYgF0sf6YEntQ+MmevIcDa4ZY9ZFLDk7OL5j6pSIxJlI5sZlxDqYWgRC2yzpDb5N+6DFxDXhDXM
	2eily2UdCFcxWXVARGQY9gulw6a1HhWoC7fitkgyHEe1YzfZ4xWTd8CjALtEVqD2F
X-Gm-Gg: Acq92OG2kVskBIF3WVbHcQmimGA3eDfdTJiT+I9pErBwCfplJI+F6+i9l5CfHpUYtVt
	3cfmURSYilhPqyY9cf3dmSg1yNwxy9qp7inl5ArmCK+y8tOU0+nc/gui6KDsV5bj7Fa1IrQsmUQ
	TT+zfTdOUaw3sbUiKz2lPtiozD8CEgN6CndZjVBc3nAtB3DVg1DmFBPxRzHCFybDf7vSfsmvlgV
	zhjbAnKw0e0D3Z1HgOGdlgH46f8H5Ah38I21Jrg15Z3GHkqa6+xyKVkClF4frIGYtHL5iiRGuAX
	/q3/Nr2ZetzJ1vwugpvPnbPhyFCnKd5pGjByHjvxvgvCjh+VXiyafarngM/QFt/i6A0Jrwf6btc
	reY7yEYAxzsJnn2mo1bPb4dWZKTofmaABKm+DpNfZp/sE1fS1LN7f5YvMoK4=
X-Received: by 2002:a17:903:11c6:b0:2bd:3bfd:7512 with SMTP id d9443c01a7336-2beb065b6edmr245162825ad.29.1779875078710;
        Wed, 27 May 2026 02:44:38 -0700 (PDT)
X-Received: by 2002:a17:903:11c6:b0:2bd:3bfd:7512 with SMTP id d9443c01a7336-2beb065b6edmr245162605ad.29.1779875078164;
        Wed, 27 May 2026 02:44:38 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:44:37 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 14/24] arm64: dts: qcom: sm4450: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:19 +0530
Message-ID: <20260527094333.2311731-15-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ja+Ma0KV c=1 sm=1 tr=0 ts=6a16bd07 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=0iWJZJwAwNium_avJeQA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: a1-U6XhFFyPfVAwqdg_hRo5btofuRcPl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX1VCDHPZI6yT4
 w5+87TVBDnyGhG2Oj9ynB8cJbiGk9Dt076nx17e328HWNL3af1hUR7CvUeFw9PTJVQEWXRP7P59
 zFPRnF5EB9gUYU5UthM4kaqEmQvbFHrehdxvcCQtwjrIQGva52IK82crC2avvE0p66S51i3G1K5
 nFaBBBTFtBwSIwyUFmlaobqu0b70SO2nX2gld2Pfgg6cjTPs8+sCiroh4zitQn+XhGPpivPLeuK
 /2jfSSPi4XNQ1v8y+Tum3LFvib9//ZKmNC073riVRPY3SmStqZXqx/Yc1fp/boGedOhGr1d6xNP
 3tOEot+6Vyr+MgKcQOFIKaHKYUjT4i/aGLCa8/8DGw94MOsfxw5wBg9WTCeuAFMv8+z1KS5lwUO
 30JYLrrlFT7m2CjIijtkUD3xkjqq1IxAuKch0PfrcldwAgxeoDAeUGRGWoTV9TUcZRthEFDneZv
 NsjSZ51UBWADuIzl1tg==
X-Proofpoint-GUID: a1-U6XhFFyPfVAwqdg_hRo5btofuRcPl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093

The OS PDC DRV register window on sm4450 spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm4450.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm4450.dtsi b/arch/arm64/boot/dts/qcom/sm4450.dtsi
index 696e2e0841ad..b7dc40f3778c 100644
--- a/arch/arm64/boot/dts/qcom/sm4450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm4450.dtsi
@@ -464,7 +464,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm4450-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
+			reg = <0 0x0b220000 0 0x10000>, <0 0x174000f0 0 0x64>;
 			qcom,pdc-ranges = <0 480 94>, <94 494 31>,
 					  <125 63 1>;
 			#interrupt-cells = <2>;
-- 
2.53.0

