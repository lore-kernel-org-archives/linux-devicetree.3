Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1072BD11
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 13:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774101051; cv=none; b=syHXkphbEInvpzWXkuvss3avFCjUay8pbMiARkiiimejGoroz804oZdZoawQbJH27Srpa80W+hiMsvnZ8kvgCVtYAhQEil2y+Y1dojUBWJbVJ+eVqY0nPIa4QAid32JEcfiz0AEHioKpeDA8Qu2uSaHhgTDIp5eX21PzPNw3JP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774101051; c=relaxed/simple;
	bh=uXQk1v0Ji/oDdHW3LImY3hB6r2koEUo5lgQw9ZjZLWI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=trArcLDWJfdkRZNPWVVNr9kucncygJwelh4fdQRTMxJ1voqbxU9R5Egn5EoqQ77njNgxrkpUTksreGLyOigMDkOkMZ/2xQyHxg2UYAffHh3qw3fEpPiLvCgCjPWJH2/xsPwjvVmA9WTBWwKWjsQo+KuUzzOOLnDc5mr90VW8bx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IwjM7TCF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cjl2Msz5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IwjM7TCF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cjl2Msz5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62L8cYEB084079
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 13:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QAFmZUiivMO
	LtH63BICH0mfE5HC2uX+V+RTk+fQ9fv8=; b=IwjM7TCFlRPMjZOygjYv8mulyR3
	TYPjxhSE7QZeoX8lctFkVTTnq0/fcyXWNTXRe+I5UEYTbknLF2OMaKxO40U2pUtj
	uwZrqt+rrth8nIPaa1TBHM54Mhtc+tif37GeiSbfrHU2dwumHYw71AsWFwmfwTfx
	I+9mOC2ajv2v5NWUQJ9bAbJzXncnbEiFvp+V01pifDD1Bdo1ehowDO9u7/hQwIuQ
	Pees+UHni4V668i6T01kMJss5KDYkOYYUuXvr7Z97QLNrumRt/aDLf3Y1GY00PD+
	9LGDuub1ZCbRnLwtriBuRWunJHOMU3pW8uxTY4HJH0ADqTrB6PvM6Aw8TMA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kj1gr35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 13:50:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0560c1320so93013065ad.2
        for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 06:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774101049; x=1774705849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAFmZUiivMOLtH63BICH0mfE5HC2uX+V+RTk+fQ9fv8=;
        b=Cjl2Msz5Upv9dj6QjkJBd6cSKXgdiJU1MldMWAgXg1AsfG1kcYl/fC1WNu9ksV0F8S
         BXoq+WzUSOX9XOCgc4gZHrDIXZAoW3XjRW+WaxHtu14t4Uc9sKeYHlsWofMRwfEyeRx0
         LRb4dIEZ4ceoLWO0ZfLnBdiNykU+UbOEp6pLj61fLy7OIdGRMUo6HI4wbvBPsmJn6Fl6
         m8l57o9ENOx2vnwKvutp7p6cgyL/dR68Y492m/oWL/jDIinULQ07qZoStw6jOIikpOQ8
         V/dLWPZiZuGxnZ3AIGAsvnYDEm+CvRY058DRAWWHmHMPJbnggN1sr/2qmNlzc4gq1us0
         KidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774101049; x=1774705849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QAFmZUiivMOLtH63BICH0mfE5HC2uX+V+RTk+fQ9fv8=;
        b=rIetu/oGdH5Zvh/hmylp2gtYTC2NsAxUpJ5Uko93kYTiA2zxim9jw5oezsbgmJg+9e
         6rhTXnYr0TU4DOMYvMJCav7g5fQI+AAG7htkkuVQ0wWvBWOuCFEyW+7ddbINzEWrCDWl
         C1iU3ALh4UmGJO8LmnNX9KnPRokQKcL435kx3GMUfeEWfhuA7XspGmG3sO7/5b5d/H8m
         lirgFXfItkU8xArnguIaesWEkmiB2JdaWVUO9mdeX0SbgO8HkrDriW7YrSuX8K5l+3xf
         Djmtzdb+LXqbAXBEhFYpLKQIhUxow/61f1g3ujIeTD4MZu71RioB3wnvgCGHg9tjWeJm
         wxXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTCICGRoVs+UWsCP3At4yf3yCVgRZrZKTO1AwAMB98QIknm8/EDmGHS7iWhR+ZVwBy8v1Zs4ybj3qC@vger.kernel.org
X-Gm-Message-State: AOJu0YwaL5ASePjlQAA3ZAbFqGOolV+s/d/AowlRPe29xFivGa/2A4NW
	ge7tR0Zcm/UpitZ53E0XQWpR4Az9OKt1sWLN670bKiziTT72OoiDz2JsS81UopIr7/i8fwUYMQl
	lntA9IQrQwXZt6Kao3DOo/yl9pLCh0uS7LtCk7f+ckbBBNmFCi2J39Di2HeX8kts5
X-Gm-Gg: ATEYQzxs94muIlpp5PTWDLXaxe4YypQSMR8wXBI1sm9B+vzP09228pxFfPRlG50ZNBN
	LmwJdqIL3xxb1Fyk4XeJeHpsFo1pxjW5LR3ry7XLGwqvc3+YR7YDljMA25J8Fr3qe2O207uzAOL
	Igu8ur/mO5gDF5uidqaxto7jQfiJrjan6f/eXGxXIuILaB0OnImRF/AyqwZpd8xbv4tiiHN+LKJ
	5Th6ob3iZtNlLdp2LOso7ZTVFUtwuYM8R9mrWzUNWSdAc/P8YI1tts2QSe3excG60/K8wNyO5zU
	OJsyVRcM3kykQ+lFP34FE+fsfDfZPwORZBpElTO/gVNGS3QBpcW40mJdL7S5FyeN68GOaJgYgw9
	NYEwUEIuEiEQrGbabp6SeGUJAbVivsAE6TZzWFkjQDkHocDC1zWlOvQ7Apw==
X-Received: by 2002:a17:902:dac7:b0:2ae:ceb0:d5f7 with SMTP id d9443c01a7336-2b0827ee664mr59256365ad.52.1774101049043;
        Sat, 21 Mar 2026 06:50:49 -0700 (PDT)
X-Received: by 2002:a17:902:dac7:b0:2ae:ceb0:d5f7 with SMTP id d9443c01a7336-2b0827ee664mr59256135ad.52.1774101048589;
        Sat, 21 Mar 2026 06:50:48 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516cb9sm54897555ad.2.2026.03.21.06.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 06:50:48 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: mkl@pengutronix.de, mani@kernel.org, thomas.kopp@microchip.com,
        mailhol@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linusw@kernel.org, brgl@kernel.org, linux-can@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: can: mcp251xfd: add microchip,xstbyen property
Date: Sat, 21 Mar 2026 19:20:30 +0530
Message-Id: <20260321135031.3107408-2-viken.dadhaniya@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260321135031.3107408-1-viken.dadhaniya@oss.qualcomm.com>
References: <20260321135031.3107408-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: n6gxL9lFI-ews-4H1pVEVOMHAjYFzxbr
X-Proofpoint-ORIG-GUID: n6gxL9lFI-ews-4H1pVEVOMHAjYFzxbr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDExNSBTYWx0ZWRfX+1VcxFZlEuTw
 evqy2l2J2TqzIGpJlR8FITd5gH/OJOwsW6TJekncBcC0FZNcG3KzOx6CEjcd11eXoaMTkQljRnK
 bb8QKjqBCl1EuU/NAhxm22uNn2up3M/Jci+toKMSpfVAZAhkaIrCASrOvCdJAf+cABcCE0m0L57
 hqiY7Ao9RvFumnoWhhNmmHwpkw3jaqiMhl0ittWtsCiuAZxXdB34DkBpRr+ySEIHSfUlTrrTQQd
 gnLL18NbBNz9VFeg7hns8kVTmRy1uP614aM/WwB0CMFHWRHAee6JT2bReeX6XAwnfOCBgrpKc+x
 ekgJqwzksK/LsgzDOmEd2TSzcAaBaGDzyvCFlR08406nRdDo0vW78hmw89EV/O0acQHfe6UjCB6
 4SBRQfucI1+r03OqxebiT5rZuabbL2Wi4XJKYyxA+K2hpNED/dhQvaWh+IAs+Ete5yszbrPDmvq
 5UEpqaMEI2Y6TtX+6OQ==
X-Authority-Analysis: v=2.4 cv=dYiNHHXe c=1 sm=1 tr=0 ts=69bea239 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=MbkHCQl1Ze6FRj4IwLIA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603210115

Add the boolean property 'microchip,xstbyen' to enable the dedicated
transceiver standby control function on the INT0/GPIO0/XSTBY pin of
the MCP251xFD family.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
v2 -> v3:

- No change.

v2 Link: https://lore.kernel.org/all/20260316131950.859748-2-viken.dadhaniya@oss.qualcomm.com/

v1 -> v2:

- Drop the gpio-hog approach as suggested by Dmitry.
- Add the microchip,xstbyen property to enable transceiver standby control.

v1 Link: https://lore.kernel.org/all/20260108125200.2803112-2-viken.dadhaniya@oss.qualcomm.com/
---
 .../devicetree/bindings/net/can/microchip,mcp251xfd.yaml  | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/can/microchip,mcp251xfd.yaml b/Documentation/devicetree/bindings/net/can/microchip,mcp251xfd.yaml
index 2d13638ebc6a..28e494262cd9 100644
--- a/Documentation/devicetree/bindings/net/can/microchip,mcp251xfd.yaml
+++ b/Documentation/devicetree/bindings/net/can/microchip,mcp251xfd.yaml
@@ -44,6 +44,14 @@ properties:
       signals a pending RX interrupt.
     maxItems: 1
 
+  microchip,xstbyen:
+    type: boolean
+    description:
+      If present, configure the INT0/GPIO0/XSTBY pin as transceiver standby
+      control. The pin is driven low when the controller is active and high
+      when it enters Sleep mode, allowing automatic standby control of an
+      external CAN transceiver connected to this pin.
+
   spi-max-frequency:
     description:
       Must be half or less of "clocks" frequency.
-- 
2.34.1

