Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923523D45D0
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781513556; cv=none; b=Qp5VW39MDYodumoODV9d89HmjR4OXy56PTZLLPEsrlCdcLysgeDYE2pnrWrIrz0zI72tvwf1HJwqlyFP3OtfzLx3HSxrufg/ckC1wO5IdMzpPTd80X5sOPpRSx2iiNd/ioipk/DJSpZPKtzSZpxAb3KZ5yzdmHQ8Ui8auHrnjbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781513556; c=relaxed/simple;
	bh=STku0i5TtYmUEEpeQwXvpNR0khl4OJn9mGwqJJMHjDA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B4hABiiUpK6U1Mi7x7g+JWuRdwpALaTddr0betTotmzIM1LjXhcGmfBtEvUck6Qsp0U7LWcOz9OztlkzMMhH8oYOPcVL4Vl2gxkBUQpfdo97BaZYIU9PT2idVNeu0wU9ys+58wrJNkhKHw/k0kWUwu7ppIPdYonMaDxK/6B0iw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aP0eayDV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IDimv7S6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aP0eayDV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IDimv7S6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6IuZg3332556
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2JSXreH0Ef/
	woXc4rcsCrGvqXy3i53dhdVhB3MtcL/c=; b=aP0eayDVR9rBkE2kk1eHhW+MIFX
	3p+XgnEkHEMPHsoQqzXxM2DMBxJluFsXRbH/hqCkb38RoL3EBw104eyQd+z9Au2e
	N3r794Looeo7pqt3WS97sXITDUoCDOU8nQ86ck3XK/48cLSdrDiQmgeGT3SMi3qp
	sJM82BxMPTy8RIMdlAdzm1+3vxcmyV7VvIpCRbISlLQ+vF1gk07HTe9Mr2ez2TTw
	UaySHNHpmwgeuqVkyiDXcwwwD9F6PKX+8rq8hvYTYzkhBdS/gtXiEX2Dj1mt973S
	IH9Z8kiF2NaqErU7LmCYr2el7+r6eE2L2uwcPSDn3ljZasdvVv7Cd8IVeag==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4erye16k1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:52:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d8719bae6so2869369a91.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 01:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781513552; x=1782118352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2JSXreH0Ef/woXc4rcsCrGvqXy3i53dhdVhB3MtcL/c=;
        b=IDimv7S6TDrIBwxk8UW/+Bb0qywXIoxaSYyWKRIHc9ocKMw+eJwUaxSP/i37TkRVI5
         yrlcMpI1mtAkIX0B/81Ie4zDKDLej95Gww1k4GZjkZQ2RHodS77wj0IE9Dlm+NRwQbKs
         /KD/rTlyjNCVhwxXyyHOxSLp1hyENcD+nH6mfQoozALtEZtemHerxzHp9hkBX5E8Mb6/
         92xu2EgcqUyxIEUd3jr2awOelf+RZ1SPzZ7VZqBxYKKziDbyZrwE+EtCaL4E+BBC7s+Z
         d1jY4pHe3u4laSb51E3XwbglD644zTYmCfi4zePVfKV2XInYq3ia1uPVr3gDxT4NUsDq
         JZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781513552; x=1782118352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2JSXreH0Ef/woXc4rcsCrGvqXy3i53dhdVhB3MtcL/c=;
        b=nPR2w1W5ZjtNz17M3UG7zB2mwfs35bb0CYN2HHYdDk9XzrxkkJPmCcEQ3v7Pky++BS
         A8dWc3rzLHmYqPJp1bWw1n5D5fLZVYbQuZyrKQe7L8pnmrwDL0oNeojlkNkwgXHMRyYu
         4FrIkyhhOPP7AJzcJuWf/dyfWIfdagOFrq/s+kp2fUqkgAz1/eQI8gYknR+iPiNF3/kQ
         tc25TcPGO9YGXUStzxTAYpD1OPYVWPcpTsMLhwuRICyMZMJgC6Q6kLD+GC/x0sKl0aFc
         CEpY5DFYoA7IrwDYksLSQ63Yc8qHjUo+5h/vHtS145YIBjN26pweRXM3w+mcAgLGqy6j
         4OGw==
X-Forwarded-Encrypted: i=1; AFNElJ+E49djCqbGhng7/WvJY3irh1eX5UL5fWq+TxuRxyR4XmbixrVEcMGnovscL54SLxA1HEUMQHXGdxyZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzMdlAp+9WHC+aRCTQAGEBApXqPpO/RIoMjVN1ZjVkuBvKY0LxJ
	twrFsRtOvmEUPPS7GlWau+hiNEchHvFqrBB3Ge/4nYbzotqv7JqPaSqcnc7ACRMAyn2JSqiBlB7
	H76Orw9qi+f/jl2yoSXi63g611cvTNXnMJuLzUaU4qkPBQuuazxAeH6gpixJe/1tz
X-Gm-Gg: Acq92OGRAGiRw8xNWjkAPGG94M4NWMM27hO2IY2oacA4bDPs5igwntL2Ox+PWxB8lkI
	nKKMRhcNv3qGQ79JyFTEhtZrlmmJoNghQab3L7TAAIh41LUbrw6qCDYBR76tFfubNOFrItbEiX/
	BmIXRg0VhG7wXCXsa9o9FA8XtOR/7MMoCSsgHHcvHzBaqWPVE//kKIxx2ne3tOm32uUC3glM70Z
	RLrZ2NZPJ1tcK/L8hpyVyLdqVB72MZW5BXTmu3ukCNwWfRym7hrSpBpS0GQe86GpYi2d6RwLdkt
	3ZngyOovuZziiyFsQszcZRSkgUeJ37TGbvjxgLCzkFJ93DfY+jTLypiTTqUl/OFk7XIZLVRa1tM
	Yf9MUvvMx6Grffq6k3hSCGv54DuxkKATeetZtbnNQjaaWm6MxcBm9RJ9Una76vSKpjeMN2QIIa/
	tsc3C7a2cEyaUEz6tgvHW/99rMVJ1htRfR//nx41XwyMp7U5vF21A=
X-Received: by 2002:a17:90b:3f50:b0:36a:7c8f:1423 with SMTP id 98e67ed59e1d1-37c2bc73e4dmr9733601a91.9.1781513551936;
        Mon, 15 Jun 2026 01:52:31 -0700 (PDT)
X-Received: by 2002:a17:90b:3f50:b0:36a:7c8f:1423 with SMTP id 98e67ed59e1d1-37c2bc73e4dmr9733570a91.9.1781513551532;
        Mon, 15 Jun 2026 01:52:31 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a25ecd5e9sm9539723a91.10.2026.06.15.01.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:52:31 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v4 1/2] dt-bindings: thermal: tsens: add ipq5210 & ipq9650 compatible
Date: Mon, 15 Jun 2026 14:22:17 +0530
Message-Id: <20260615085218.1421347-2-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615085218.1421347-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260615085218.1421347-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4Y9iV2CE5UVku4Q9h_907_Y8Zp1q2q6a
X-Authority-Analysis: v=2.4 cv=MNlQXsZl c=1 sm=1 tr=0 ts=6a2fbd50 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Cj70nMFs6DzugLwqs6cA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA5MiBTYWx0ZWRfX4Y40Rs7LcZZQ
 o7tS1YIGo48p6bnz8OhlHzA8uom0KpU1B1dvOFCnPs/PLQbZ9VH7eQTyN1OLbVF6KoeI4e2fGEU
 GPrpmxgq8GAVOKdHDFQs6EwZu5G33M8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA5MiBTYWx0ZWRfXymlldZXiEFVT
 pCyi1wIP1X1gQ/LFXgzZOBkjqQmcq/KuJ749GujEXPQyMcPLQkU3dWcWULvFyYrJZ6qKUaNwC1o
 ozy27epq9rPWx+1ctEpHC6Xn3XRQ89TLGitkXMLbh7PPZP3ZcE3PjtX+tOZsL5CurBp8VpVO58T
 p3UYsQOOpKHVOtuU3P9/nkGOtVlTyQJ7VV0bx4aBBG8WHe0zXSWtUhW2Q6CC/EzRU5otisW9wgG
 AqgfAIi4z66dFuLKYDEtf/GlKVPKePEc5Nh1DMcH+JfBFHwpbZ9xVsBQ1CWaEmxv5Ij0efcxe1b
 3UyN+JHkSM6GMbTHXJPozdJqEtOziy3IPwWtNf6Z/olEST/KfhP74MPdjNlt14TVj0BW3C2aXQr
 AnHADjnj6ZQe2CEsZpX+eUTctVG8KP1BRjaApqOFpz0Imr0UKd2m/OxCrKdBQW9SLTfyX75MIKx
 d1NdDN+2KhLgdzCLP8g==
X-Proofpoint-ORIG-GUID: 4Y9iV2CE5UVku4Q9h_907_Y8Zp1q2q6a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150092

Add the compatible for the thermal sensors on the ipq5210 and ipq9650. The
ipq5210 uses ipq5332-tsens as a fallback, while ipq9650 is added as a
standalone v2 TSENS compatible with combined interrupt.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v4: Fix version number

v3: patch version no. mixup
    Include ipq9650 to all applicable constraints
    https://lore.kernel.org/linux-arm-msm/20260610081241.1468507-1-varadarajan.narayanan@oss.qualcomm.com/

v2: Fix fallback definition
    https://lore.kernel.org/linux-arm-msm/20260609065447.4024695-1-varadarajan.narayanan@oss.qualcomm.com/
---
 .../devicetree/bindings/thermal/qcom-tsens.yaml          | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index f0efaa8349ee..bcec314e0532 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -95,6 +95,13 @@ properties:
           - qcom,ipq5332-tsens
           - qcom,ipq5424-tsens
           - qcom,ipq8074-tsens
+          - qcom,ipq9650-tsens
+
+      - description: v2 of TSENS with combined interrupt
+        items:
+          - enum:
+              - qcom,ipq5210-tsens
+          - const: qcom,ipq5332-tsens
 
       - description: v2 of TSENS with combined interrupt
         items:
@@ -306,6 +313,7 @@ allOf:
               - qcom,ipq5332-tsens
               - qcom,ipq5424-tsens
               - qcom,ipq8074-tsens
+              - qcom,ipq9650-tsens
     then:
       properties:
         interrupts:
@@ -323,6 +331,7 @@ allOf:
               - qcom,ipq5332-tsens
               - qcom,ipq5424-tsens
               - qcom,ipq8074-tsens
+              - qcom,ipq9650-tsens
               - qcom,tsens-v0_1
               - qcom,tsens-v1
               - qcom,tsens-v2
-- 
2.34.1

