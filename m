Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD17A33F590
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328127; cv=none; b=HIlB28WugWGL6AgPpAV9Sy3+XplqXOVZQWyCSaOqjBfAl7yiLNSAMHTHFrp6bNzxBxjfD0l8IrIZQ6Rw5b9IqwBuTqs/FyenKdSj8mX/NSyhY8iBFoaT8Qs/maqwn4A7MJFw+CpzOkSDjx70UzLkKm8/MOt6W+UFbTpzuRl26CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328127; c=relaxed/simple;
	bh=uDyDiM58JjijY2HKPnD+fbcwUCQLH2/YD09zBcqaO38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n1G5aVstV+dzA+uJl9qmmawd5Q8LVVi/jbwW3EG0626VTMTXCwVdOtdJNc7aS4qw5T+ndylHrBUyLBjF2OaB+RqwbezXWXe17+j9idilXzkGHk6KL09Iv6bm51xqLE4dhk+jWq4k9evrKNYDxdrsJPIOrupeCg4XvMiaNn0Am1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jv4FSojX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B2pudJYs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jv4FSojX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B2pudJYs"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OITL093666425
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JRvoDrIlXka
	8ORynuHZb0j5k1Yv44H6hdSFgcEbeu/I=; b=jv4FSojXY5Tg5dRVKyF/YX/JGin
	2KoHxt7YnwXChaXjroCTJxKUwvBPUEz8yodfup/yiJXns/EsWLqD+SsUgDLzjp9u
	/NGl5axTrAbG3M9lpjRaHcUHm82F0U26+sq6T8WroC4zZ/DsprwbICPgX3x/oJNJ
	9gkP9eIWnI1ZPRfd+sDZd3cscoergQccnSww0pirHW3TP1thRunfkdhYyOb6S91D
	Oc5jPXJIBDi2TqaCpAql9sKT7K3NEZ5wHMSfApBR0gPD9sesXfEKIJUfPDKOYpZA
	wROLfOHUmMRPbLk4DklUXsxE5YHWB7o9mw+ENAl2R2NTbqzCYmQ+ks5LOvg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0mjbr50y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:08:44 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-845319bb97bso1119020b3a.0
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328123; x=1782932923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRvoDrIlXka8ORynuHZb0j5k1Yv44H6hdSFgcEbeu/I=;
        b=B2pudJYsZ+8uMBTOqui8yLdBXeKl5HpYEsHjLZ+wu9jHAtOBzHyqXkCPorMWsm1YVS
         rKKH/xRR9mxUjx9SDb4ZRTfIT0jkA5rElVCvf1gegkHZ5Q+NyphEqb3A7abIqyPgvA3E
         chTjRnsa6fVvm901MDrIhmc7+7SPA8zyq+YLGCrQJDMWWRaJvvJXtkwvGKOdYoiyxUmC
         q+SeUvLNZBSIAaTHGbopbV98K7EAJf9ZuInzCn36OgSlgLovfCW9B7187dJ4OTOZ6RBb
         HNMp8m2qUOa/MNMp+0bs7kn7SezXWUvfSSp1CbVM2NNgzHVuhBxZoZTk+iti7qoBmgZ7
         cOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328123; x=1782932923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JRvoDrIlXka8ORynuHZb0j5k1Yv44H6hdSFgcEbeu/I=;
        b=nCPOUeghJsp9vvD4lm79zEXSsdsfghJShItCu+eGBK8+46JNzMsGHQOP9T8s4Rv2YL
         SKKCelelHx205H9ZtdrkiLnXvJALyWrO+oG3JCBRzsa8LQGZPXADyukNebr3JDHfgT2D
         YuI8h3dJ6GZIcT8dVvH5yznGE2XaOYWKlRoOlYNCrciWtLgPNnJ/yy+ilJNOz6trQL5F
         JQXJUbq/mc5UjCWx2bh0MIdwXHcpBSv0lQScpkKd/eWLjKRNg8SdQH4qTYPLifA9+l1+
         p86fZ+fkpRDY7FagfWF0Am3VciW5umzfav/p5gx5lHtgB5XhbKIgUYkMQSbqjj19pRsM
         3Qjg==
X-Forwarded-Encrypted: i=1; AFNElJ94EMozcS1VjRRqpU7HzR6ze27KK7AwkQYwD1lSAH9hk9ut1Sko/umWBqk+w0FaY8NvjRpJ5KlP6uAn@vger.kernel.org
X-Gm-Message-State: AOJu0YxcERhrKiDk3JwR2arDubuzwgH9aSFCGwDv6Jxk3qzsKMJeZlYo
	ybIVP/B+aPwIJagydYzetxFd3xPaweaJznvHKFO8gY06XNKnIEX8QE87xhud+dMaimoTu01ldqi
	JaSyp3L1Fm9paJwWt/SffYs0vfM8oM7rB+IEi6iWFHogPf1bw8xYGaI9mrvp740I7
X-Gm-Gg: AfdE7ckDsULUQCANeHvlEUJ9BMLHQi6/CmKGUKv2Wmp0vOLOpBhBe6RqteBnZ0zkoQc
	u21lSOblBPqktDCCdyrZDYKUZqmf9DAyfdR+tVCriaaH2gJRnuB6aBUDJ2DKsM4IQcbWF9VakjI
	/lakKKfGbka9pLV31QLmdjK5Yx/I1UFOeEUWMmciD7qbOCZzqd8nDuVLl82Qdesjkh97tpFs21z
	FDob02TNghHIdMJLIaqAMglHYBOt8/WeM4sX3VijXgVn1HrR8pH1QxdZoqcjOS2vbWto6iwzL4Z
	J8r1tkwnl8bFUiUhEPdVE48EMny75k2wBMOHB9FgE1JVuOxaoB0kdtrnx4c8e0NmvR28cIgtoXE
	6nY1crzV/EPikr5vlRnwQ5EPzBaEPnjnOyvk+ww==
X-Received: by 2002:a05:6a00:4210:b0:845:44c7:2fdd with SMTP id d2e1a72fcca58-845a2c7d835mr4824698b3a.34.1782328123326;
        Wed, 24 Jun 2026 12:08:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:4210:b0:845:44c7:2fdd with SMTP id d2e1a72fcca58-845a2c7d835mr4824660b3a.34.1782328122793;
        Wed, 24 Jun 2026 12:08:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:08:42 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v4 01/19] dt-bindings: firmware: qcom,scm: Add minidump SRAM property
Date: Thu, 25 Jun 2026 00:38:12 +0530
Message-ID: <20260624190830.3131112-2-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfXwZWF20XzPG4G
 b8gOdJTR4ffw43M3Zc7qSbwNX7xAt1Gvir7iXbvXjernTmJy+8+/tBKnwfr9QQQHIq5Mgt2QJ1f
 XAScU3jCydEyVIlxlFWBVHqBuLKbDlo=
X-Proofpoint-ORIG-GUID: IlgnHQOHrWfGdMFwy4y2ZHhh4UbG9Lev
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX2weM4bYb6n2E
 CEaYZpd+e21omcskucKTTNIBhaL3FMTT4beT4sStuA7q/DuqKXqzhMOIKDEYcbyhu443OLsJBXz
 9OpuQ26GDVOvyToBFYEe/IwVYmpaZ79KIaTlV6bbnQGcqind8QpD+C6AUi54qk6Z8qJ9Qk/de8M
 89e/YLVsiKLZJCgOrTHpvDcP433umJqr2ZbcNpcLHd1c1GFzFJujsefyH3bQnLin20aYSZpfUoK
 naThZnIdto2Wro//AXHvpob+IZTO8TVbT2F2BXFnCVbldPxEw3VHZj7K/yZ7koKCc9XU6zwCudb
 vjXBSCzmF5nf19JbLt6quea85YnRpyTM2obH+SO/+mOWtjAGRkGLzLGmQejyADNsf+gOxdNPUu/
 +O5Du19/tc2+u6Hx0046en4gcD0nn/uluvX6NsOOMQSYKaRyz0gZcf1tu3Jvk+rxQQViltsfXZA
 00NHnkfSOSFBIka2L7Q==
X-Proofpoint-GUID: IlgnHQOHrWfGdMFwy4y2ZHhh4UbG9Lev
X-Authority-Analysis: v=2.4 cv=TcSmcxQh c=1 sm=1 tr=0 ts=6a3c2b3c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=QTM5EVxPqlECRIyyHGYA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240160

On Qualcomm SoCs that support minidump, a word in always-on SRAM
is shared between the Operating System(HLOS) and boot firmware.
OS is expected to select the minidump download destination
either USB upload to a host PC or save to on-device storage.
Boot firmware will reads this word before DDR is initialized
on the warm reset following a crash to decide where to deliver
the minidump.

Add a 'sram' property to the SCM binding to allow the OS to
identify this SRAM region via a phandle.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 25f62bacbc91..2d68b4065341 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -129,6 +129,13 @@ properties:
           - description: offset of the download mode control register
     description: TCSR hardware block
 
+  sram:
+    description:
+      Phandle to a region in always-on SRAM used to store the download
+      mode value for boot firmware to read before DDR is initialised on
+      the next warm reset.
+    maxItems: 1
+
 allOf:
   # Clocks
   - if:
-- 
2.53.0

