Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9D242981B
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778838029; cv=none; b=qAaDWHBVn9Hq8gJ0lWfMrMz9Cz3XMYcN4wnkffjKOoWGjKh2elndePJXc8CrSYXUvQDL0EXRWOfId1aPiuO/Y3+mAF6wnEoxYNaVFlKsUTsftZGSnBfRJruVGNKWV3mHUuhtJ0BurnM+gWwJd52pCVlhdKd0MYRXzcx75+wBpZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778838029; c=relaxed/simple;
	bh=HAWDvyrm5udfihsD68H57lsz6emuSAfI5NRycP7TtuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KgXKGzwvpnYs/Ee4LV0ECEh0B3UnzmiQzHkUC9lUZPU+1R5/ZlAaMB8f5XlRH8nb3981qk/OxKk8RP/b9kD15PQfMVclg+7PrHqx2vdDlcieX3WK3N/KRHon5TTuxlptUn899FsK/lyG1IDBvqDfqFUP3SLDGEVZKqYZaqKMdLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bqKeo9bf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R76fslI9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bqKeo9bf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R76fslI9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5Hqnh4020904
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jK+M5Q/wDupeusbZePUMdJ
	tPb5hvZH41yoSAbH7ILag=; b=bqKeo9bf/aTbKAW3qOYUso0jBvS9KRU72hNLzn
	OAL15hUlk9uNu0wR/sprb4WNfHKgT0W0IMble/tVTGdHtXEn27VKzAbxuN+RfmEl
	quKo7nAhPr58klkO8xJzwYfNeZCRzC219AAeCReMI9NbyxYKIHFapoBXLaS8krR+
	PNhYDigKyRtS35rTOrpqvzDx5hLfpF2VVuSkDECvQy4rKv4ik9cfgoCCHd+OuEut
	qd+ylal+PZRc6D7HpxzW0cbkGxUsddKSni7/1FpTHwwcNe9OIHF5FKCx13v00nmS
	+HSJml8I5x18Q3zD8UY447t3XwM85EFFqcTn/IgLPIIGcG2g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1rtp14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:40:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bc763c7256so138121055ad.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 02:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778838027; x=1779442827; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jK+M5Q/wDupeusbZePUMdJtPb5hvZH41yoSAbH7ILag=;
        b=R76fslI92xA8aaFNBMlV/w+3hx3EPGi8YBGKKiTZAexio+e71z2fIo29DWS4c6vxg6
         rNfFWBLK1WHy1i7psoNUjJY1ToSPojI8RuyCcOz412hBgXImyacoHkCzAyeJQ63xlvEp
         7DtSLyPDz+0j0CKF4+C27nA/8gWM7L2gQw1RUkjtDMfZXqeTFDnK+I8TUY8m/TYVWtwm
         h55lMQpAYSFXLVeXyRtkCp1Oxf+IWedPx7m0ozfH9GeNvgU7P3avih+gB8hSo1Ey/Ug4
         S0o52atfrnr0U6u3R0BhRrVJTbDXjz1xv8yRRNS+L+BPPeXROQbp4qAh7UJuJBuZ7F3k
         jeQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778838027; x=1779442827;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jK+M5Q/wDupeusbZePUMdJtPb5hvZH41yoSAbH7ILag=;
        b=kS1vrZxVtzHXzrwwJ5BtQ4Qt6pMAMKL9RHigQ/nEfjIBfbjVlOA0Ari8gZ1r3jGVwT
         xwRlot3V4NkjhQ3NapgIHp1s1F7vmRhCGl0fNUHFtGU6AYS+KQg3B9BjznktIo/V3MNu
         0Z+XLydzIaLbUPo/oFB+stfUTHdGA3ubWhyhQzLGBIr935ae6OOf4WlncDE/zDQ8o7G+
         ubLRWWlj1i6+e3fYwAwl/6X4J5i+H7HEaP5xIIOylE+y7ZHZgchMDY3y4BRBXHPG+zi9
         0UtIZKwUyGDHfVdjFlXHImX9QhJNlF7LwehaipTRGsFX5AagFguAPloVPnA3vOSeDAUu
         dKwQ==
X-Forwarded-Encrypted: i=1; AFNElJ9WW1ICcDjdz//n3FeKQOopgBn66i7seejUUGuAY4GXA7mUegpZP/AaCY6gdAwkvmyEF1AzOrYdCmdP@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm/b8ow9MbIwb/6CxJsZZ6sd9OU3SQ4S6BDVwQtqkIq9PS9BPO
	BpiAlx9obd6j/e/RiLOiqauv1tADNQNQAt9WBjbK4wE3S/jLfaaVAFCMUJe8rnPoMbKkv1ra/oB
	cDITTDp5XqcGaEyK+Xysh1+l0KgoKLX2Rn0fJ8ZjlTQjIxhCW+S8OQbZklVoEPugJ
X-Gm-Gg: Acq92OHzPzM4mN80lrlby4yym/2Rrv8ZrGsuO41WdiNyP5EF4LgvjxzEzfB8fYyOKrV
	c1smt4Cb1Drjs/HVy0EX5G/I6d6md/uYhrqJt26cxAMEd2g/Th1ZxRFX4rYNkL4h/C+6yfvnbMQ
	HxLmHgS+yf+YO2AvS8nFpPZ13EAbDEV6XiHJGQjhpLQIk812jk0PIKLJAvnW/LP8lDCNdddVY61
	JPfsJ6xSkrDFuPoKM/db7xnGzVYdSU5kylQCx5owPc7XyfkgMicgc6vpgoEpmbVP4zsuq4r8GhH
	cnEu+xzIrGLkikAshNHOaS4xV+wiEW6Zx1WTiXnXnHWyZbJjuQghB+KVjBs6goTb7snCXa4byyF
	1/vd3FPzlQHPodSjkiQzL6KwqHQdyFkAGESYgVsusFFurgD2aAWhqqlMwHf8A6BN8PKefESpqzS
	FDGfepRoeizErA5GdLQ6qRs0qDjDK2wBA6DVmIsDiF27ejdlO4wnU=
X-Received: by 2002:a17:902:9042:b0:2b2:9d60:5eaf with SMTP id d9443c01a7336-2bd7e77b6b6mr29798385ad.6.1778838027207;
        Fri, 15 May 2026 02:40:27 -0700 (PDT)
X-Received: by 2002:a17:902:9042:b0:2b2:9d60:5eaf with SMTP id d9443c01a7336-2bd7e77b6b6mr29798175ad.6.1778838026755;
        Fri, 15 May 2026 02:40:26 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd60275sm50068725ad.7.2026.05.15.02.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:40:26 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 15 May 2026 15:10:20 +0530
Subject: [PATCH] dt-bindings: thermal: tsens: add ipq5210 & ipq9650
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-tsens-yaml-v1-1-8039c62cc249@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAPqBmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0NT3ZLi1Lxi3crE3Bxd0zRTQ/NkSxOLJAtLJaCGgqLUtMwKsGHRsbW
 1AB1R6aJcAAAA
X-Change-ID: 20260515-tsens-yaml-5f517c948b89
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: y1FfBQDOuJVLR7oHn2XfLFWp5Tqs9QQQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA5NSBTYWx0ZWRfX25yGOfTYY2+/
 aYUTgFL6e49jJ8Cdag2hHmBR0F/4eqYWhzU2XFAe6B02VuYpapLNi5NYz76Vnp6K5rzQViRVYOf
 hWTJxiMNS/aRnLJCELWFqUM3UcoFVKPUSR6WNrCTekLn8w1f+92EPGf+UB7jfuYOUb5jbzE1C3q
 o8vOwjSggYuC8UK1CJhLLjTl3F/2O59ydWnML1WOkBvaZsaA/VMRqXEZUARzROabu35IcrTUnIt
 /2nVyc2e586kr8jONHo5t0Ez2Jy3eqZLu7BVdMExbzFLWGq1l69LYXeyYi7Bi1Ibv1neS2RPZAk
 ub0XPgNvmiBMkeHqH/oxrdKeow0GQhhq5Msn/W7q/CthYm4qSqgpUYR7IQCGo9ZMGqG4tVbDoc5
 uE8ZdpGgv2pdtNYF9WFwwFkctQWS3VIz/ds+w6OB9D2iXUDjf5aCHXaXQWz4NwK9Gglcpr1ZCvk
 fayOLpYUOMmRjNlA4ug==
X-Proofpoint-ORIG-GUID: y1FfBQDOuJVLR7oHn2XfLFWp5Tqs9QQQ
X-Authority-Analysis: v=2.4 cv=JPELdcKb c=1 sm=1 tr=0 ts=6a06ea0b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=W2gPVXlb2yFIYVFQQSMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150095

Add the compatible for the thermal sensors on the ipq5210 & ipq9650.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 7d34ba00e684..fd8031f7f6ad 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -89,9 +89,11 @@ properties:
 
       - description: v2 of TSENS with combined interrupt
         enum:
+          - qcom,ipq5210-tsens
           - qcom,ipq5332-tsens
           - qcom,ipq5424-tsens
           - qcom,ipq8074-tsens
+          - qcom,ipq9650-tsens
 
       - description: v2 of TSENS with combined interrupt
         items:

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260515-tsens-yaml-5f517c948b89

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

