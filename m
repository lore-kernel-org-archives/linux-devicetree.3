Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F38148122C
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 12:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203168; cv=none; b=GoUNToLjDGEhER6lcTrnnLVX0X0ISLjVDAcQr1e2s3Q/Cp7xgg7p0jOGJ77m78SQtbp3pUiAXje/AJ9VHrVLzbg9anAwkbMSIJg5Aap1YpU1LR2Q6D/1OyuZvRZ9N8zBYN81YizLJV1zahMMOjHoNbf0BBb9MPE1WDRzRAXPZpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203168; c=relaxed/simple;
	bh=vJQuhX/oBX172FGrYO7vTJtYeipTicxxvpxXEYh0ojs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EtlZlDBqEFR4S54aAPsAQkHuo7LOMgu+IfBD8bNaa1qeuVf8cPvq8f6EVpOiBT7G+0ASQUpvty4hFDLa2jb0sRnJJSDqSb0gyOSBDwJLNBaKoVl0TarwOIg9kxzRh1FmKIWyiNslhmL429WJfut0g62MuMfdKobsfXNxCjEuf9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RIrkrTfG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZERHzDq6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RIrkrTfG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZERHzDq6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFMHL2849283
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 12:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HVZcSjFH4FJeUfEsBwsOf+lXeSQFSzxGuq+r24Kf3NI=; b=RIrkrTfGelOYcksL
	6SSuD/FSnKgYiewUFba2LpasulhJ1iUH3GQZAGvZiq6iXoozINxLiHxR79Xnr7ga
	IMmhAuQnSK8qCTf31sYhPvJ8n7OhEK9YNUj1pWeI7rWbdy0Zky7S83Btlzwx8B/i
	g4MoH1bXMlRRxO1fT7SuulaTgAB7Li/JJ1mdaHtpOBOq4V1MYjkZXYXbsc6D4JUj
	TZgCrpmoIuEqhB7R7Hi4XHTT+VOj2sABmvymBfe3JfvAyWYxQR7Hr+G+3dRpKOB5
	W7MwCMHKFZXYki3dbt4BTaWWAzsCTZmDNMy6i3asToD7zih6+AFFrHhqQtQYiVzM
	xGtayA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49u40d9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 12:26:06 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-807383233b9so2090893a34.3
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 05:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203166; x=1791807966; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HVZcSjFH4FJeUfEsBwsOf+lXeSQFSzxGuq+r24Kf3NI=;
        b=ZERHzDq640eBjcXgM8LSskJheqCdUX/okLoVafCS8dbVF7UWPS7P7VwscNBp9w5w7p
         hr502sY6J0qR6H55IqgjFDYhrzBgrJIOQisLze4/OYh3ee+b1R9nR9QE+AKOvKtMqskv
         2Hj+jquBHlfIbs3CgGSkAM3bJ82XQV+WJWV8u/P4Mr7vEOpyttjnfj028EZxFcDwLrVa
         mwZIK8W2xQ1pPmvY9jyqwKOcAnxm0nHXn8jiNFzPzNKk+52vfIP+i2YaKEukmWV0akGp
         DZYFGCSfHwiT1NkT88T63fS+AKvIskPmZ1bMOXQRKNG/RKRdXM2xcxhjKvI4d6sjRGGf
         diPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203166; x=1791807966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HVZcSjFH4FJeUfEsBwsOf+lXeSQFSzxGuq+r24Kf3NI=;
        b=kANx1aoCX6c4XA4LAA64MJqTSNko+iLhpv4MgsasEgEeg8FWcx8x0wXhb0SI56eMez
         JqoV2lWAJx/M8POEAsQP+in/EM7oqnDxRdj2Zn5FTC4vbRvUnyjAtWHbmDzWqUGLIN0F
         zEwxuaSLRG60VWJz+/8paGHf2zvLE7Cng/bnM3suCR7UPYViNZipCYusNocRFt/Hg1i3
         AI6SvKl8X8VJt4Hfus7+GvEeJ80vpdDB86cMHVdndib4JQaOiVH92d/eZn7wH+pRUC4i
         ANWypfenllWFFIao9tYyj+YxXCrx1OAchT9zJRV2ukoJhcFFqaHL2LICpMXHzVorFvcN
         YwEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxagz7yaiLXmGBiCqGiqHLanmkMudQY7C2aMlhPB2bv6FlDQqnWGkcpWcV1XKRHFyTqyD8ZTH+p26T@vger.kernel.org
X-Gm-Message-State: AFuF++lk3UKzlwZGrdWujHI3fTDlysxMo49dJFe/f2L6Pt2f+PbPZc5C
	G5DnFr4K2+nyLnMiHC+5FmfxoIf0iobehT3w3UirCr5BWfGuCiyq8HypoBIJRJgBaH3f8Wjmyqh
	PEO+vb9kfzR36dDhtKpdzfNcDcj6cpYVgGi7QTxTo8/f+TGTGUGeLf9CGhDjF5P1G
X-Gm-Gg: AYBFou14kFy5cL83uyvrdpyN3zzllsfrt5NX4dmeNoF2yipKeVISuVPho6uSWcx59/i
	5xWCDrcJ4NldDEloMhI1jabN56czJPy/Xv7uj91wKZNhD2wNRiq3+7FQWWWQTHX6apAyoyBUivB
	YGnG+t5WBG+a9uTgQAvgDi+kFC6PWLwf00WIntVazS3uDJBUOpqEOIgbHiJTktjCYW5n/UrfPoA
	5PopTYhIWNVQfOeH1Veh8JHiV5h5T6xAJxrcyTRT1N+vHCS9sZ5rvvmvmDOvzbz7NVB5X75xb71
	6J2IS8zTjA8FPCcMars5yJtbKJR6lPIFOdMVNt7HJD+3/bkM9NiZjY3Wxr1eOK68GvRgyvcQtmz
	ZcEFicUH0HC2Ti4UF+kRjgifh7JagknDBww==
X-Received: by 2002:a05:6830:82aa:b0:7dc:c7aa:22c7 with SMTP id 46e09a7af769-8227eac1882mr11375637a34.0.1791203165915;
        Mon, 05 Oct 2026 05:26:05 -0700 (PDT)
X-Received: by 2002:a05:6830:82aa:b0:7dc:c7aa:22c7 with SMTP id 46e09a7af769-8227eac1882mr11375611a34.0.1791203165396;
        Mon, 05 Oct 2026 05:26:05 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:26:05 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:54:13 +0530
Subject: [PATCH v4 12/12] arm64: dts: qcom: smb2370: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qcom-bcl-hwmon-v4-12-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=1198;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=vJQuhX/oBX172FGrYO7vTJtYeipTicxxvpxXEYh0ojs=;
 b=fvscyC5ovPVUh2ckA6Ul2zePjK5XpmEJH0PrT6/u/G8f+7JQFD3KrBjqFi7Abo9fV65erPpYq
 n3zJF2DyoGmAPoUsrwO7Hl4syaepNSkZbaEH4IdASnDYNJ+rObeIVns
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: vnd2WBqD9W_4DawdtTJcsZqxj96VthBX
X-Proofpoint-GUID: vnd2WBqD9W_4DawdtTJcsZqxj96VthBX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX424GO2WzuFxP
 u6tamZBu/yl98AqNZjmsrzqA+yRL6Q2ytZT0KUyn8f9vx/WLhPyFfctsC6YffuE2OaOdj/exmOk
 VDi/6IW/TFAGmORJU/g4oz+k3ioIQqQ=
X-Authority-Analysis: v=2.4 cv=LuEHWXdc c=1 sm=1 tr=0 ts=6ac3975e cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Mdvtvp0LKpy3kcB40AAA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX/uOVjtd+UGK/
 VK8IohwY/1n8tZ0uH2qb66aaXyDfrra9pENdFwdTkYu5EKiFUjkCfLs6YPg+WrfOvejHq6/bpg4
 GYKQ3XykGMEqBOZdkAPXEav3yqqiXShtYMcpE0W4gTOm3bJY8aCdSTaSy3+cSApjevTvELXXrXl
 5BAEFeYlxYoFQzCSiSeVTiD5uwcBOeJfM2AJq/X81PgUtzWJdF3Vnm7d7a3q71F3DPOSt3Wg3pW
 Kl6wvseyOK2ccmvHYfdO76sDlIQ4L4pxzoZ+5oDFyTkmD+/6jH7/KBfgqS7OB+W5VVumWZt7mpr
 qwC9uTnxxIEZwB0Wezw1WC6tMxvokfVa0eug9vY7AfhTREeu+r+H4VxbDf+wSAULtj/mhyOftmz
 V9ZFJPdqe1tFni19bKRKu5mFPohuqpuNYqGAesZATedElZFemncsJ0oTZtdX1Ejw2M6Id19vAGr
 LKCzw/UL4GkCh7+8tGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

Add Battery Current Limiting (BCL) hardware monitor node for smb2370
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/smb2370.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/smb2370.dtsi b/arch/arm64/boot/dts/qcom/smb2370.dtsi
index 1e02578e4ee3..4809b3d8cfe2 100644
--- a/arch/arm64/boot/dts/qcom/smb2370.dtsi
+++ b/arch/arm64/boot/dts/qcom/smb2370.dtsi
@@ -10,6 +10,17 @@ smb2370_j_e2: pmic@9 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		sensor@4700 {
+			compatible = "qcom,smb2370-bcl";
+			reg = <0x4700>;
+			interrupts = <0x9 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x9 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x9 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		smb2370_j_e2_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,smb2370-eusb2-repeater";
 			reg = <0xfd00>;

-- 
2.43.0

