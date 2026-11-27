Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769394;
	b=OwdlJcjEEiaaZmdhu5ueM10FivKhNwseALt3uKZVPs0qzXxJ2dWuMgyDbA50b0JmTHe1
	 MERj0LsKRTldSehQFGTAlqsqgSxxzHSUmUiNR81JIHFJcQuxbHo/h1qWPqT88i4lf/jAl
	 xGI02uy22SMO4yfYz2oIdKV9tRX9L9X38bMruauEk0anS1Ur0N24sCj577t3xe2Qux6F6
	 5TCliCzJHCJiuhNChr9RN0Mp2XpdGEYrGsW1LsEM1g62AXUZFH75DN/OIwwBxSRUO1SN0
	 ObAEv1Pv//1uBRU5Lq7vwpleSOeO3PLta+isYjKlPzDW9a0s8AME3qmQY6XEDrYAb6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769394;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/RoPFzrgKsW3WulHCcvr633Y4VHom+la+B5kUszZsF4=;
	b=Bap7/djmQTAlBzneLOykJA6tOSQu+SHmmBw3z0mugL3f31iL48ZZV5fgIbGkLFSbTxL+
	 3yueg3xw01KZsfbI0+Bs9Df1d1+nCAc8wL3n+x0XsG68EJKFb5a/2SHKkfpQrFgmxYesa
	 mPQ4bWPrrkCQy/zWZzTMV/sMFZAR/8QiHrcYWV0apLEMlHSUEPC6TEg/00OHiFEqUba02
	 geTqGbLVcGtrpVGmqb83oC1FoSiSGKY65SSGRVTzUxnuVOZBcVH8qcxMMZBGO2bzalX4m
	 ZVe+jLqNnfDtzEG/PfvL8XA4r7Em34D7JRHnP9OVxWk1kSk/+mkQtfuT2dCKb6JEPEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E3KkDh8K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E2uVrMKB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789E0606A333
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 789E0606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E3KkDh8K;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E2uVrMKB
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GgTL1475387
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/RoPFzrgKsW3WulHCcvr633Y4VHom+la+B5kUszZsF4=; b=E3KkDh8Kv8+fEIH+
	UCG+LFrtxkEQWCdVW1J64XarWIJvApM+yo7SEzI/Bh7VE97IsIu9BZ59bu9t/xlg
	pnw/Tl0b1U/07AR175T1RkPCuPf/6Tx3Ob7lGb9yHQkXrE9/W7UIu5ZhwFJKVDbk
	0jwjdJyvPGz05/GtQnBYItYBHimZjhlnwvP1Z8ZVu2DL14Loef90v+aaeZKLr7Xj
	E6ztXA4KML253nuH3RgcyC0dGgTwWEsxrjaz3h04OoB1Oz536Te0LmTuYoTWJBA8
	l/dxONWQ+7bBXyGAlqNTvhDrRpQ+UUr0vYZ//PqDXEmpCYZKJh2iVHjCs9TvMWxl
	T+UmMQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4ht5bc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:49:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f01caa8ab9so9326055ad.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 00:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769393; x=1796374193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RoPFzrgKsW3WulHCcvr633Y4VHom+la+B5kUszZsF4=;
        b=E2uVrMKBQ6BMDr3jJyGWJdftIBpLANmbXbZvJU3hkRbUSjmQQfu+KOooral3oWIVfN
         sVNg2N0F9x4GLSnxqMAzkJXKC2tq+ALLv56OHo4a6xZ/RTCPtJE8KXIsJcTJ3yuSe3ft
         8iJPAMC9y2KRkPTpawS9Kqf67Fe5/vzUsJAsTM/OZtl5YKmt7CzLSNO6iZgyGzk/HDsf
         9GWe7ujd0Wk9QRXVCoKukolCVdMwc9ktHeKV2oPZjNIT4E+cF+3jl3yExEbRnajtdJGl
         AT4PySH6f5FLhPygD+dWoFrI/c+LDI+n6ERNF6KYfBqovFJJJRbSTlfQeIyH8b7RzAyQ
         yA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769393; x=1796374193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/RoPFzrgKsW3WulHCcvr633Y4VHom+la+B5kUszZsF4=;
        b=h63JOwialZdYxpGe2h/wpuVg7dt6m8cJNVzs4mteMcnSANnER+puGsNzTQCd/MUQrU
         rGQopEo6TswUYsb8fHf2jOXUXHkq1a7xe38V8+9oa2GEh2yXoN4bhxvxkzKg6r7oA7/4
         4YZDBqLjSCA61atX8X4HqowI/EX32SfqMY1wn/UxMEGEIflMCzlBHvr0O3vKXBzP0LyV
         fvzWMgHfeXvP+jQBGEoHQlgsI79QpjI3U0xnF87AMh1w7vyqq5vtiMOvxmsq9bML3bUY
         yU7x2CRKDza7C2nTR81Rl9dFzSlQ/tpUY9U+FpjaSyDo0iZXYhUCAcqKkLyOtrEsJO55
         tHrw==
X-Forwarded-Encrypted: i=1; AL+hErFaO+mUAAxzpAFTpOZ0SatgI7POXT9wVWXzvj+XK6y3QxdABwHdr48hNQVg5mdkZoqx8/bdAc5lz5bk@vger.kernel.org
X-Gm-Message-State: APuU4Z/yKNdHKs59MZ0Yx58KFwbRSat30LWeQUZYWzjY1qYPS8AiWAvx
	aM9jX1qg5MKJ7unIBmMxvmD8T4bpSOLUJ5ykjc9aITF/0LszRqjsKX+G1cp5STXFG+YdZRMrSF6
	xG4YAEDZb6zzdeexp7rOw/uHdcvQZdI6+rD2zY8vJIpJy/rlyVr5jKCyXvWhvdyX5
X-Gm-Gg: AZFdTZdmX7O1guXB8nbe+U2+olMoP0M/mmtXApc/Aae/MuxcgrUcmHFgwzTBSNaFxmr
	5eh/qmK3nSd+7LvXvKbDjo0orwzD3ma2WVRwdNrybg89zOdVZghCezMZh/wzMNSvcu7bu13rW/X
	HOaep1B/bspQWv2m2225sBiFpkyT8a7UJTvNspyvHH+1VZ09brGSNc6ZwAmT7hOlj8cmQ3cOjdk
	q1U1ufZucHMWpafFP+BpWn/lN+5iSNRKAP0W8PhaCQPU3Cqone8c4Jm+EijqaYFF2XoB0LZmSGv
	hz90Hd65CBatsoImScINdv3dSLoCFqGzAsRsvW7OZlYAwlmHBLD9FD+4O+IO79bbyKsuVhL4Q2f
	gjV4lWYddQVB3DBxdedFnNp2LG60ETUl3wSK9ASxkCV6vXg+343qfR6j6aGGPTOo3Ej5SFz/2Ko
	XH3CIFzwkudMOfjtKhAOjNPCBts+biPXYdds3uFoJ+ui/VV92mYFf39yy2+arvrhA1yxmDbeQ1E
	wrxmLHyxB+NrKGYoPeVowWCIxGPzA==
X-Received: by 2002:a17:902:e948:b0:2ef:eadc:5c98 with SMTP id d9443c01a7336-2f03ee6a938mr373538515ad.0.1795769393102;
        Fri, 27 Nov 2026 00:49:53 -0800 (PST)
X-Received: by 2002:a17:902:e948:b0:2ef:eadc:5c98 with SMTP id d9443c01a7336-2f03ee6a938mr373538175ad.0.1795769392692;
        Fri, 27 Nov 2026 00:49:52 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm114360555ad.9.2026.11.27.00.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:49:52 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:19:25 +0530
Subject: [PATCH 3/7] dt-bindings: leds: qcom-lpg: Add PM7550 PWM compatible
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
Message-Id: <20261127-eliza_disp_all-v1-3-a18be7f65fd4@oss.qualcomm.com>
References: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
In-Reply-To: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769367; l=968;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=td6QK7QkN9RdMGuNpRMBkvBsbxEVpka2RCJEN8QUWSE=;
 b=nqIn1yBnMRkPS85K1WKxZXXJYyHpSwtecI770QSW4rbu2xlg02bRk6lSpqsyDLejO1ZElnfZp
 PoRcejJxhjVBerkKVpJWrllXzJQlVNSK+T8iWspoPucUjkmijwcm4J7
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfXyUbDNt8MW3Gv
 1PCV2+QlzshVE+KoMYVNGISULg+izGyzINYA6fmKApeE55QBvMFcrR+QyieGy0pVLnUwxmpNlgi
 yELDR975WKKlHSqkWmls1aO9NGS93CY=
X-Proofpoint-GUID: eiyj1356eHwCo08MqiN_zjTHd8kf7TXe
X-Proofpoint-ORIG-GUID: eiyj1356eHwCo08MqiN_zjTHd8kf7TXe
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b094431 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=0GMz1rgL7QW-eojhWosA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX44xMsRBCdoRP
 oxNlC+k8+UaYH504LF2PDmqVN36Wi95CKmr3v0ishcnkReo0Ox+dZHDgcHPzKnCTHpRDrHkYVBe
 1RG938laswFkWnexr+TwsAZJ2jF+xPtq/LTepRJnYK+QYVA87Uiv6uWEqR0gjrvAsF1B5Qa6Ylb
 VdYb0DNSsSUP74I/gVARisESdUWc2zctsBuOhmX1HgCYn9g8zYNAJmsPmNNNmqAitdK6i8jNgbo
 H7FCSd7jTmasmIJwj89hd8YZcjrM2vGwM+dhwGa1EA1XgHc/t2BrVq+P+xUTaKZCpRp5lAZWJO0
 9tts0z1wfHGr0MMFs+kmSlhTTfq2T+Gq43i2OV2AxZI9y7qhDsUF0Yws09HdYJ/sOmU5skhvJMr
 Q4qKxvi809aIvvQWTmM/Bg2jNvLNkuIYPWiFr8MXRaMAqiWi7Dv7rTSwg2lZvdaGmwK2SIV4PJn
 1xaurywnAm1n0x5Esuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034

PM7550 provides an LPG block that can be used as a PWM controller for
display backlight control on Qualcomm Eliza EVK boards.

Add the PM7550 PWM compatible with the PM8350C PWM fallback so board DTs
can describe the controller.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
index 3da0fe532e74..cf2c78f7f6c5 100644
--- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
@@ -42,6 +42,7 @@ properties:
           - const: qcom,pm8150l-lpg
       - items:
           - enum:
+              - qcom,pm7550-pwm
               - qcom,pm8550-pwm
               - qcom,pmh0101-pwm
           - const: qcom,pm8350c-pwm

-- 
2.34.1

