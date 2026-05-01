Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55FD3F23B7
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 18:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777659094; cv=none; b=HBRCRFt5/E9FWH5V6DlCdX9d47mMXWmJmwRyeUfCL+w18i0vfI+J+shZ4uv9G5YxD0UnUFkNv0UEJlPGIZu9bwBfXZ9pdOkAmoNIggEMYE1VVGPoY/byDPet/hf/MKNwQfw41nPahBib+jpiwB5rFI9A0AfolujhFTjanUMfPsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777659094; c=relaxed/simple;
	bh=o5HwJQ+v+rkM1SV24Mfx3kK/RwDPwTE0Z6SE2STHhWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=frfSrOwoWAF5/A+bBISbon75ZUgKOl/0xSIdzYMdlpUu6z2phDZQ3yAz8nffOuxQ4p+ZvNwp0XOWsHDD4eEeX+2Gw8Hf8t45rhul/y8xcwKHWP7fvJcxMN6KBRmk7ZZujNXkdbfKf3tYT+tHWNgJmaNmfwxQ+V6Tz6gSS4Ns9n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pXK5T2y1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZTKPuzVL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pXK5T2y1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZTKPuzVL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLceG1000618
	for <devicetree@vger.kernel.org>; Fri, 1 May 2026 18:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=h3O18HsDM0HeDtBSVlIrq9
	w2rDZKIMC53Nv7pta0xBA=; b=pXK5T2y1phDOH2JNjRzCsgGcwOvk0DMfKMk897
	2/hC16G1pfI14gnlgwG1g6iif0unqTVCpHgqlNAznNshafdH25BfcpN+CMlPlk9K
	pPrJfwAZAbmTr4yTVBkUFW4HMj7AVh3rUngpPvGtUm7B348zxByIMPAoemoGxiwf
	jETngaEoQ0I/Ht0Udn5Tyu/1uCdcVuZUnyAEELnJOWCPSsw+CDtqBObDbt9QIijO
	k5BwHRSU9BXJp/aQWLsXkK+t/M3m19Euw4y7Gj17ViVRhuHKTmrFPsAZIi7+I1s0
	apTwgI/+Ik1PTaIxdmUodsUBoSaLd04mptrvyVKqKSONWHyA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvag4v7s9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 01 May 2026 18:11:25 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f9f49e4beso1417853b3a.0
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 11:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777659084; x=1778263884; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h3O18HsDM0HeDtBSVlIrq9w2rDZKIMC53Nv7pta0xBA=;
        b=ZTKPuzVLJf13wkBP7VBBD+UQS1R0w14c4jUEiSazBNlDEaoiS1U76HtsZHTxEfOrtv
         czB4Sq9bhLxBfQDIUT3QIkm21ltg6St10QIrQ0tgyKwjxtNGu2QRrLx6nxrYv4uP7tes
         L7xPzm0yu4LtRdlTYglIDDU8qMSnFK3cqOGzW+woKc3MgBSNBRWXnJ2yplTkmtyzT/g2
         kPboX/3uzqEcOm+HCfYfs9Ffpm8XzW9NZRnNGDBEPZbRfa5SQk8pNeAQN5YaE8bY+mgF
         vU/PBDvuD750tusgBP+os9Bf4mZeliaGiO71FysfL7Fw4OSsZVpkJm+6tvJh0PEl4cUv
         RZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777659084; x=1778263884;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h3O18HsDM0HeDtBSVlIrq9w2rDZKIMC53Nv7pta0xBA=;
        b=d4JpAFVXIwqUFd+EoBt9uZsGlbVViolWIN5Yntecc5of8D98Igo7qA/3SvZwGQWZR2
         wzsNWnLeQbnUAZYRqjMs5N9CaS1xhEsf81cAzbbCqyQKS6owbxpA6pL9w6N+hNwX8NuA
         sdwZLlqoi0wdTHY3u+lLFWmlTgNezWH9z+EGXiK4U5twAXHLI00Rany6D31PI7C21uBL
         LFuqnF5rJShGeFCpP1s56agL19f/tdAv74IWaUL5xV7lPxjrG2EcZWSe4tkdL5G1p/Oh
         LJfWTEVgC76Dz4rIJlcorzkJsUJBv2Ry/6sk+iNvJjzU5v2kt2wikXPNuC8CUTTacdhu
         9OoA==
X-Forwarded-Encrypted: i=1; AFNElJ/PF/VPZz49Q+a1y+MFyQYvi1WeMBiwi+v0J32031LGOAn6ibSQPcApAZ0+6o//Gg8X+rSWxmoko6UM@vger.kernel.org
X-Gm-Message-State: AOJu0YxHAdziyELPiiy8lzcWadRHLrPOi+ropIC6VJVogRlNnz5Tc31Z
	5Wa9hdS9ASujzSVvKWa3OFlVb38deuU+JslHOtplEnfQWoZgCWz5PuW3nYlWtKvFAS+NxVF+pFi
	dXjS0oer3rDcvWnmo6UvApPXDOyykoPLKs4EQeqGiRZkP6NC9Pn0cvqd87yU0rR6W
X-Gm-Gg: AeBDiesQ95406omObD7RFkGgl37r17wRSNdkn8Fiw/REtR2U8Bat6WX+9c9bs0vcBPY
	tBmIFCizMlKVZUnED8bkphQfzV1Av3/Q22oXEQcgmn8DlyyxTZUCIpXCIRJRUv4ek4t5mHc/cWx
	INGBb8S4OznbsHco30+AaOr9wj1MtobXxDjOckchjYFZBLyOg8Ix/sWgyq0D0biv5MfMJdJJWVr
	RmEIEkLObfP6jSe2dg7Kt3oHk4OJuWjUswH99rdkbaGnZJ0Sc347CaMNtGr+0+cpdj7dDZK13HL
	Do/3xuBW9rXwnEtqYa0PkvzSo5sh1C9ClpbM/hd+Kk2CPWkNF7GWctg2VKQaBuKdJoI2GOxN95x
	e6LcV0RjADC8x6MqyDplVAtxqJ3Fe2oR/LrefJ/K5zEu7czc=
X-Received: by 2002:a05:6a00:4f82:b0:82f:6b3a:8281 with SMTP id d2e1a72fcca58-8352d16ab0bmr265211b3a.7.1777659084392;
        Fri, 01 May 2026 11:11:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:4f82:b0:82f:6b3a:8281 with SMTP id d2e1a72fcca58-8352d16ab0bmr265189b3a.7.1777659083877;
        Fri, 01 May 2026 11:11:23 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8351589a910sm3170709b3a.18.2026.05.01.11.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 11:11:23 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 01 May 2026 23:40:59 +0530
Subject: [PATCH] dt-bindings: nvmem: qfprom: Add Shikra compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-shikra-qfprom-binding-v1-1-17e63148c2c8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALLs9GkC/x3MQQqAIBBA0avErBtQKaGuEi2sxhwirREiiO6et
 HyL/x/IJEwZ+uoBoYszp1ig6wrm4OJKyEsxGGWsapXGHHgTh6c/JO04cVw4rjgba7zTnW2Ug9I
 eQp7v/zuM7/sB0+yMaGcAAAA=
X-Change-ID: 20260501-shikra-qfprom-binding-c262fa19640a
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777659080; l=974;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=o5HwJQ+v+rkM1SV24Mfx3kK/RwDPwTE0Z6SE2STHhWo=;
 b=XjjmZ8cI8ZCJfSQjxwRpCfoGoqgcfSlp/h5Wltgiejui9pkgCgBUUTQafIbjss0JXG92KE6j6
 8x2KSsoXi+1C8sI3yABuRfRLDkyilVFcro/Oi7li91MaK820LvZoGBC
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: 7IOFYTW3VrzglveJuS3WZS0vq_lFhg1y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE3OSBTYWx0ZWRfX7iKZ+inhLPnw
 0FLqrvwxLB767ED38kN3DTVkQ5kdCvALis3rpWk9Hn/agBeJt7T49S1DVN5dcNYdQ6mXZ662x0d
 fkvc+uys9JUV7b+YMpE17bVtJMLh4YRTUcXmS6sPOfflVecVAFu92jlWNsZ4FsZc5cDK1PvMmvA
 sIxUxpb0xIp7t9x+6M276QM/K4tr6qHM2lhgaxmQ/tmTPPAkKO/NJOAoH4Z9qfgFoYkbZfDQE2K
 18rdtQV45WAwDios4BgPc31PBABBdl7MJVEJ/oHMsg6IHeDXwuYplYK0bQwM3/tTeW/WCDsZIog
 v55YYcLAnc9IowD1CNXRRI10e8wQ7JI+sfozVLRSFNYZBGrOc2y/Vkll9Lb+yfqs0j4FvyJ2APd
 yWKVR0/v1AWK3ZnGn93eM5XeEvfpVzEgmk6iz3jvr4eNZ5xFIEnCrnSQoZQvBZBg3NwcoX9VGdd
 87CvuYYmrDK2cYxU+Eg==
X-Authority-Analysis: v=2.4 cv=UcxhjqSN c=1 sm=1 tr=0 ts=69f4eccd cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=YaEUw0lDPXG6J-eZ-HYA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 7IOFYTW3VrzglveJuS3WZS0vq_lFhg1y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010179

Document compatible string for the QFPROM on Shikra platform.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 2ab047f2bb69..52b86133ee00 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -48,6 +48,7 @@ properties:
           - qcom,sdm630-qfprom
           - qcom,sdm670-qfprom
           - qcom,sdm845-qfprom
+          - qcom,shikra-qfprom
           - qcom,sm6115-qfprom
           - qcom,sm6350-qfprom
           - qcom,sm6375-qfprom

---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260501-shikra-qfprom-binding-c262fa19640a

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

