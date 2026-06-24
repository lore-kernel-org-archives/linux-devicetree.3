Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1373372EF4
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328199; cv=none; b=nHtoprK3SUmZ1TJ79yHwVYqT+1clFiulx8r7Lh+bLrtId1t6Y3fJnnnIJmodyj1Iu55XaCaIozVYaWDuz/63Wi3dWzsZr3li58teHZudKyQsSu94Swd91IdIK4cobkvpLOBNIK53jhS+NG1NUOl38POTy/ZtRRNDNGFx2ETz/Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328199; c=relaxed/simple;
	bh=im+W8I9V2a77F8QGVhtrXzsFdyyTMNsffQVjVXuq4hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qQA38qUBSlTZo/2r3e46/TKKOKGt9c3ZzGNLK6NZcU52r0bF49HW+pxpM4Vi0bjKmVts6YXdgwGjDkopAKoU021A2FlmpajkQKnlgcvttgTtKlCdKVUs60kmL1b0v6pWqVIXB9v0IMtI8i9g9UOuZZD/aeRWY+NLvXFxHOJz0FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aO6pFh8L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DG+hfybN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aO6pFh8L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DG+hfybN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHj2j93860955
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YWUREud+R9W
	xLCc2tv6ebseV61AovZQSVYXjDvXU0JQ=; b=aO6pFh8LHvJlJMriWtoK1ZdYopc
	yvXic2kXpVJk+xRrTd1RpkbP6TX3XgNn5sYCELQxHSMCRAXry31EgBsNtnfksWAc
	+vD3X4l5KeUlmbsO0HfG3YYB1yqrKswxq8KCDdQC3LHxAiLA8C3REPR/VwTwH3Sa
	WKiuaPz/GYg+4B1tAQ34juSFxjSS2CuwVleV2c5i9psvKsvZUZwPYvmbUjb4WOsK
	D2DOazoDrJ3v4YK0eUFurkF1rpFpXkkowHgBUnH/7TElP7dM96Rpr9TqtJTsiED0
	+bnw0Wzw/L/0pcXWHp3jWVi93Dggb2bHg60adtKj9zQYJxXYry9SCB/N5Gg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0apq2sw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85a298cd62so983382a12.0
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328196; x=1782932996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWUREud+R9WxLCc2tv6ebseV61AovZQSVYXjDvXU0JQ=;
        b=DG+hfybNxcM7RhbudQbcYbC/6t8s6Gd73V04Z+f8ZeVeVZa3IFMKMyBBr06Zx0bXVW
         AD3aN6es5nA6BzjEEtSR7Cp8rorfwfT7nCyrV4acY9icLZaMHQ10hfUmuJXahkwWPOey
         +YRYS+ecwfRze92HLE/2u9RBBvZ4UT5ahjoWVqmqpq60xUXI3zTntc4POzzYI9GHFuWA
         xNdZztmljkfRF6p7EY8vMg5094yODqGUe4vnqX/ukaJn02wYD1B/DWgum28zFpomOrna
         VSzeV6ZLGutrN2z4V9nIH2LaPdGk0CoY1AgWVHryuutIYH309jGlARoAHLS/rfjEIXLo
         hkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328196; x=1782932996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YWUREud+R9WxLCc2tv6ebseV61AovZQSVYXjDvXU0JQ=;
        b=Ow4and8zHIjTNuiA6lsdZOA+pndq5Hu24srjuEFzFug4GlvSHShicOg+BJs5D64gii
         PKiUe/jdaVqWRiUbrMkL/dq5bm0m7ODEP0199ZsN446EuoZWZDJcDxGmRoBlLrT55cSO
         8GeMM4T/LhNxfVjhmXKY/6CEH3OqjrOdrc18a0Pj7lIchgN5/+w11gVOJohwOHQ2pzp7
         d7c0bR69GFkZwt7ezDMK/v/BIr3l/gjn2/mIcMmp9si+XE1qGrsA0RhPIQ3n1aHdo5lJ
         ZVqlyL6O4Uo4M1v4KdM0MUmPmxhmIY22vEekF0kaZxwVVhLDrOsF1nQgzx5d4IZV/ozV
         Wwaw==
X-Forwarded-Encrypted: i=1; AHgh+RonqGdFMr1xTOWPhWfIVdHEojyOc6NOKmX+0jn0V76Z0L3SZ0p1C8X/bU9GQaRgBVF8mXa/AgBvbMUE@vger.kernel.org
X-Gm-Message-State: AOJu0Yyla4bgsdvsvUU/5lFSifJukIiefnMEkQ18xfC90TelxgFH8Mar
	OUsF7Hsn4hrs3yH9hbDY79F9JfaiYcRgHWxBd3eYh6WQHHyaUPbXsvgURmr/kvJVRBFGFcXnEX3
	CJkyFDdSbjBAnaFjNEUOdB27UiL3dkV9mb89ryUJrku1tYyJa9TzgnI8JbcTWCfh5
X-Gm-Gg: AfdE7ckvl/YpWPlBtB4aXYlgago/M8JeLbbijFzH61zhL//W/1Fxucry09k8A0CXF4n
	/iDIjy6UuE3dGu4GEdK9aBXx4zyNkZBQCbSxtWzAZ568Ks76KbGM1ViQnz0Dc0y5+nyIihZqP/5
	yOE9JsQ5BIgwd5EWyTfQnRFDH+oy2Ovr+hqpwPB7rOLZd+WXy5VCTD+c7rBpXvZ37dgUeV8+QBR
	zpi9I7WNE5L6cQt5kzirMs0/w7rl1amtp0OitE11d96HIluV4U8Y6Zt5K1286i6mss3T606H6lv
	gPZY7llTingpKBCyBKIRP9dRs6nh7OxYAKTeS55N8doYYRhR+LuI+w8pbm2upVFYE983KjMJsa2
	zdxZyEioh48d6i7kZBm+AOmNqOGBQDSgVG+1b0g==
X-Received: by 2002:a05:6a00:3391:b0:842:6ec3:2359 with SMTP id d2e1a72fcca58-845a27d2535mr5777132b3a.45.1782328195848;
        Wed, 24 Jun 2026 12:09:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:3391:b0:842:6ec3:2359 with SMTP id d2e1a72fcca58-845a27d2535mr5777101b3a.45.1782328195285;
        Wed, 24 Jun 2026 12:09:55 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:09:54 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 18/19] arm64: dts: qcom: qcs615: Add minidump SRAM config to SCM node
Date: Thu, 25 Jun 2026 00:38:29 +0530
Message-ID: <20260624190830.3131112-19-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX2zMZPHZNN0pI
 tQMmnBn1MUFa2aKln4IfTiVz1iqlK8J4KQDntFLLo1zEmZvvuAQ9HSHiTJuNe6Jgy9G65hHTrmF
 WC0IZCLNDaAlHo+Eqmmko5xaO4R7SV0=
X-Proofpoint-GUID: 9Am4CEk2M5YvrjieW-Kp_65P6gSqlj7I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX3E3eLjiXF7tL
 8EoBESEu+fvNH0RqooEk08BHfTZ6lzLk3OffYr7FIPWcQIImg8GxXI/joUrMMQnfBpWxSoePuCT
 tDUDIN46ix/u7LWh6DoWtB389xoQdPTW2YIw+Sv0N8c0cPg2QPd+OGKj5zurHDectbtb5Abb9uq
 j2FfBP7qWNvKNELqvy890Cz1iMKgRi2qtNrNCWn6KMGL1K7sAIskZgvcXN0bok56QovX0DAwURe
 uw4fYOeJRKCBbTpQVR35jU2D59nXUaeoKoNoX8f//sTt8CTONldsbXRkrInkLV7Dds9v+/zivP/
 MPwI59E9ZlfMfZxn4z8s2CGXSqFtMXxiy6nZ59yvwY4M0dP3UX5WA9fw9gF8IcagDUWMrx6oLEX
 Yz0eYYseMzUQGm6o3jxXmhHxEVVoaA==
X-Authority-Analysis: v=2.4 cv=NpbhtcdJ c=1 sm=1 tr=0 ts=6a3c2b84 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ih2dppi7jw4BXePuyMoA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 9Am4CEk2M5YvrjieW-Kp_65P6gSqlj7I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240160

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index fb1bbc51bb8a..a358d5441fa9 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -473,6 +473,7 @@ firmware {
 		scm {
 			compatible = "qcom,scm-qcs615", "qcom,scm";
 			qcom,dload-mode = <&tcsr 0x13000>;
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -4654,6 +4655,10 @@ sram@14680000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			pil-reloc@2a94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x2a94c 0xc8>;
-- 
2.53.0

