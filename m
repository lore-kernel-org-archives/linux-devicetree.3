Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6B4386571
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781075153; cv=none; b=IoNMjLT5ubIszs44+o15+zcaGDCrHrCd3DbLVh65njkxeXgsqLt7+lqKRzlxjXGZKZxqb6Z30tIu1vPoda55kbYylFd7cv4P0Uqx3x9EHjLLeJ3RR+kRYtobuJbHO/zf+gEnvmrYl05V89NknBahO5KRS6H+f9PZh32KXOWjr38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781075153; c=relaxed/simple;
	bh=1k1Y5oMLDiqacInqtAp0TedkE+LbwYxgKQfdjngeRkw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B30d0Z/zMa6FZXCBAwcnE1ZR7JB5T105jhUcMcLc1BfphYs3T32GxDYbLPsSP3snGoMvQ7M4f6mjZEeU6jEIJllJzzNr9iIXg+asVtpuuaT7YgEccFLkiVX8sTnMGMsl+0vTzA5uy8/BQ+3+XiYo/J8tCENBFPv7O27S0Ki1FCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EzlvVYKz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=caT0dEE8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EzlvVYKz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="caT0dEE8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2elrs4061148
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bs3X/qgIm1gb+4pkuHTTTP
	KhSMR0SloJaTwaykgIQ+I=; b=EzlvVYKzbm3ZvnPoVswNW4GuqxBbiDCKbhRWGz
	f1esSS2WqjDpWl/O93gaYWPeZgJXVe2OnNr1v/NfldkSjVDzdr7BKtMrOQ5ilwEm
	atMKyZiLfpbSx1skUzweEOiGq1wH8klQnJLgapGKUL0YZqqiK3sP4NVUdxU+V1cp
	gxa9KEtSBqRS5crrV6Zv3fSPsqAowvZqKR5jwRtb6UoWLKtNrcEzo0lg3omEXxGo
	qI5izk3hbJg096Pvqfhapx4nmCcbTILMSOvcIdBh+xPGU4tqH93qGN7nJjtgd7KD
	TG0U8NoQRblA467p0Az5eCeZ9/qki5Rp6Js6szVcmdDETqCA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh17df-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:05:50 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304ec73b015so1087929eec.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 00:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781075149; x=1781679949; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bs3X/qgIm1gb+4pkuHTTTPKhSMR0SloJaTwaykgIQ+I=;
        b=caT0dEE87MAYTtWUnFhspZIuna7HWTLgLhW5J/ugi4ay+pm/s6Y30PJFkF3XBK9Z5Z
         79X716vcMfIox6EHO2lT1pPDZ53TKxMPqwGNwQj6yTmRUcexvN63H9/V3bkiYAUR8e6x
         Fx38AI4ZnT5nSXaV0iNUXTg1D97Ciwd0z2/O7o8ZnSlAHYgtH7HEsdujziBXzpFJm9NV
         NfZOTSeGh0mJKBVoGnBshNNhWhCFeb7AIKlzgiwbTITT858CqvtMnfGMG1feozHdDuT/
         LsaSGSAASc6IGW1M007pbV3zoDNUulD7tf2z+7oxFgvtJPYPJ0rLXLBnvFEBaHlJPQRj
         p1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781075149; x=1781679949;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bs3X/qgIm1gb+4pkuHTTTPKhSMR0SloJaTwaykgIQ+I=;
        b=ZiRZIV1/MVYw34mGe9jor5PpOp16zJ65IPIC5/vzfSITePbKhpfdtZdbO8gid6OXqm
         HA5zsTnuweGSLx9mKfnSw6yd2r/SWE/atM48EyLjZ8rwkbQRozBqpzZc1JAohxQHURdu
         Ca7gaZzimnJt5rcx+kVrmDq/F7eHekfuaS2kf7gikNSfGCt36l70CEHaLGRJub9ZkfRo
         QwL3Itd9kuBVAsGlwxaGrySRuEvQvf7k1nOz2ocPD5YfEXX7aw9tWo2U8vIX2qh8eqQk
         xDe6ZyHNVwf7hVR33NwyGqWtXEQzNEtkIkFSMleaQU5f0UOy9zNnOyPg9dbiaioB5uso
         g7jg==
X-Forwarded-Encrypted: i=1; AFNElJ+ulY4aRT3KJsPUDR0IOft8oHBXwLI+RIEZ4K0/AoL059K373IGaemcehDdVD8nuY7b8s6MK7yXSaWW@vger.kernel.org
X-Gm-Message-State: AOJu0YwPXuWQSFFvqOrMgP7i0Vn26UqCh7dhmwtIG7Hx0XaXvlhnPRQO
	XPqBXQPuvk4W/Ag+AvFgw2GKY80TWVgzPzmlUzaYrmduDO3Masm/BCdNl0C1W631D9AKJc0Bbtm
	jvhFNxOBO2m3xvONiR695Ce7VPEH1bu6TyaFlGhY76s5810gSjFu+aBBsjxGIEiQy
X-Gm-Gg: Acq92OGjC77lY1tc9ncJlowUubxpuuX+3MMB1KBCnAE9URjpeHG6tdylOXq+Nf2D9mi
	sgiYrd1tlLniNIsATtf/DlknTvPoAQeY9Iuo6Jv2sSyTsjY8LilFCLblUkjfdM2L5HgKPuULL9u
	Bol8GM4b93VSV+7bKGAPOr0Yn/0AjCzg4QyaH/OlzZUFUrLTjJe8J6cQLlvMnN9xCgNYrRK0Qf3
	yu3Ez60f+MhExYfnyFIa+vdKpDUDmpashtWFdpfuA4of/RXrTZh0T/q1a9X8uvPTHf5QPrT7+HJ
	wdLJhFYIk5a43L+5c5+8N495Qh0am1ctxV+sl81UBKnGfR361lO07G9KJhxhnrRYPr+GuoaijmX
	I5ObImjLL8+ovV8yUtAqTMr87yy7o1FyG2TuuWZN3WfZ9VhH5KYaDtGTTe0iye+nOceVkqKdryc
	kPuP5YaSlO
X-Received: by 2002:a05:7301:4186:b0:2ef:9961:27fa with SMTP id 5a478bee46e88-307d62ddc77mr4916504eec.18.1781075149298;
        Wed, 10 Jun 2026 00:05:49 -0700 (PDT)
X-Received: by 2002:a05:7301:4186:b0:2ef:9961:27fa with SMTP id 5a478bee46e88-307d62ddc77mr4916478eec.18.1781075148760;
        Wed, 10 Jun 2026 00:05:48 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df9bbd4sm22435926eec.30.2026.06.10.00.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 00:05:48 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: [PATCH 0/2] EDITME: cover title for pmg1110-gpio
Date: Wed, 10 Jun 2026 00:05:45 -0700
Message-Id: <20260610-pmg1110-gpio-v1-0-a9c50cd8b5d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMkMKWoC/x3MQQqAIBBA0avIrBMcIcGuEi0kR5tFKgoRiHdPW
 r7F/x0aVaYGm+hQ6eHGOU3gIuC8XIok2U+DVtooo6wsd0REJWPhLIMzq7OnRSQPMymVAr//bj/
 G+ABpQsBpXgAAAA==
X-Change-ID: 20260609-pmg1110-gpio-fa65a9c911ed
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781075147; l=563;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=1k1Y5oMLDiqacInqtAp0TedkE+LbwYxgKQfdjngeRkw=;
 b=Pp1GIQxyRwkRVj711E3WZLraDbdIJoN2IZBYnJQO8oyUciVwyCzczQcTpj7M5xYvuqot/+mbr
 bL+OAXA9tu4Cv4/mS4acMhvzdYi0NiKZwaJ5oAj5ghJhPx+W2/eS9Rt
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA2NSBTYWx0ZWRfX7w2RrurhGo2y
 IPquD0oqK+7ptJMkeUaZLewMgvS+WN11PS7tUJijXlZL6D6ujXXvx8j9qhDGLXR4tqeWgaFOyvp
 5irJnUKIulvgVU4NlH+ibcZ788U7xHUMa0mZXcM5ErQyWZbCFKiAaZ6kXTsdj8mJhC+ud7dbM3Y
 DyT4eh9oFj2G/8nIMGKNd1zKm8INi+zJlw+jpF1yRVGTCPIeFPivwuHPxRNdjYJSs5aba8ymiJm
 CtWfrH+P4w55lsqS4TRH8p4BGgpyFUuzZnZ4EPFXgbLTqTD6aZgELxFmmE6N9h9H9oOOudAfxeM
 x/28uZj2stuYKQN2BR9JC/Bmz1P6o/0OOmzy8mwo7ho6hd9S88QBu1gAM+HlljI3XGxMpEUD19N
 uoaPbd1USGsdid//EoRoElSI9U+SaiUpsd9Qb6wGLEDUdUUccMr0tfyTzZB3mpGeN2cJZWkyBhq
 BE85alHDG7yPdsUkF+g==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a290cce cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=uVLeI_Ghca3BpNyjC_oA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: HC_895YmOXlqiSkyfAuXkVKvQ0W4NRJX
X-Proofpoint-GUID: HC_895YmOXlqiSkyfAuXkVKvQ0W4NRJX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100065

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Fenglin Wu (2):
      dt-bindings: pinctrl: qcom,pmic-gpio: Document PMG1110 GPIO support
      pinctrl: qcom: spmi-gpio: Add PMG1110 GPIO support

 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 3 +++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c                      | 1 +
 2 files changed, 4 insertions(+)
---
base-commit: ef76a3a28c79b628890431aa344af633e892035b
change-id: 20260609-pmg1110-gpio-fa65a9c911ed

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>

