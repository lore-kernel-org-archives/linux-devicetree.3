Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BE121B9DA
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774615620; cv=none; b=VQH/vqFXLJHaSiUgHQ3gUvrq/HT1keyCRt/9v5qZVTd/VxSXVVrHb17AXrWq6SC6JwEDaSCVroScvgd6GDoz2w+Trf1E42lFvLIwAF4dVkbliNsEIHguNTRqUhJs+8vmzVDa7bGI2zHnGw7OHtEdi/PSNKg83L/WkyNqQ25NJt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774615620; c=relaxed/simple;
	bh=zYUNGKdFvKSqUGrjtnsoHASKMJ3vhfHxxn/46lWcKqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qflSUklt2BSc1AtoLWwnwTr65LfRXqXnPMg2L2gcA7pZSTmwjM770yd0HAJDBqLPtlq0RK7y4Y+zxiJjyAMLn4hUgFa1xgVFzzDO5C46C3s7dH31LYOPYo8aw+v1sEzmljy0m/7Tz08tht/KKp2RnpYYY3HBoZlZbR/0rjfZfZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hW3CIgD/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HXhxA3cg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hW3CIgD/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HXhxA3cg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vi77731325
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=891+Otgnl2ibIheT+4VX1s
	uXS6wQSuCM5ExyL+E9/0k=; b=hW3CIgD/Bg66W2jSsyWTEvNLrxkUer2EtJEr0J
	91L1w8H7O4OP+bSZhYcxQEBk+kr8cGsv2+iF8Tm/8QJM5Is/nh580D31oMitDSGk
	QlT1a/qn3I7jshyB20LSrQoiraqkL/dAqo/duMivNhIPJMvTUJYoHHFjxk2S06gH
	q6KtV0c9b5e/F6N8tHk/fb+kZh16Lahnj6YK3E/awBOAm/DgmjQhUfirFu2Yzz5G
	CwsgLaWSqZn4IducDf/5dHvjJ7bJLcpDFtwkoGJ5+p0hrFkEUkzhrViFca4IwWeq
	csjCY9PFRpxvjGh8hjeUM/rfozZ3EwmdhoQ5jqHoWwkqCmKA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5a9q3chr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:46:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b878a8c07so25929161cf.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 05:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774615618; x=1775220418; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=891+Otgnl2ibIheT+4VX1suXS6wQSuCM5ExyL+E9/0k=;
        b=HXhxA3cgTDCpLRmRd87fBEJjE4aDIjjbJbk6Tl8fUqIo4A0RrkeOB9psyEvW/FzIcE
         ZZ+/Rurs4fpJ4yWgGB2hqkyyCyXNFw9N6hLN6cIf+k05Wcalxm21FpqGW7pxukxq6QIQ
         5bqjLse4LgErlg5nmrM8AlpHrxgYnpLGHDkbQU41MMfnP68UIF4CtrekS40KrhSY2V9t
         MPgA5psGt3sWkFYbwTwtVcQLrOs5UoA39NX+Bb0X536U/nrMcTbV3vCbOvjfiKibDHIQ
         lgSnd9mmDoc/O97OZPsnt65D0lEb1qO34kbIGdXn10PYZi6qHq1qSlOjwid1dewEUXPL
         Qatg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774615618; x=1775220418;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=891+Otgnl2ibIheT+4VX1suXS6wQSuCM5ExyL+E9/0k=;
        b=qXFwXUJr1m81Ifn4msEfTWlMhDO6M/2X3hoeyy0nSQOO83rcVrIyRBtGZM08IsxdIB
         r6onI0NGQa8qwawvdW15NwY4OxhZDIeRZkMp5wBlbgq2RsvnrxLyIipi6/c/xIqGQjod
         6QjHMqV7d4W0lfXNAKeyVaZk+bAvMaFxOwHUANxcOtWvTlYd0ds++ID/C4EWjsxjtvFN
         DRCVafBKVUiZmVHC5/rYpHMEK9JCPRdiRVQ2B84yKzWaL/sFLW2sTpj6ngEGv5lWmF63
         iiMvivsvwRMYq+HtWdZSWMUxJanmewEYlhNdR+LMlqjHnhMiJkxEEMEod2ISfSp8PqT2
         Buxw==
X-Forwarded-Encrypted: i=1; AJvYcCXLq5DWylMBpmq+hw9o9XW/e6oP1iUajVkawPuuU8g1iA9BQor1/bLh7zaQsQ/IanoTiMUbPv2OA3NU@vger.kernel.org
X-Gm-Message-State: AOJu0YzdJFhIueikywtkDyI4Aoj9EC8x2Xi6Y89JQjzhmapuKVvhpMRQ
	B1cDNVuAdt6PUBGMRLa7+wodyvPgNOQd6/zzBtKCU/prK5oljYPoxofixUb5TOWIrd0Jnk6cQPF
	wJ/xX8XOSKa8NttFFIv1eynLFOtHXo7Nnp868Qxi9/jju8+twUAGpRMt3nsh7giAB
X-Gm-Gg: ATEYQzwB+1BrO40zH3CIfFlmm4zgWQWC+Fcw7LQzVwln0e0TjozZ5MPhG97l+HTkSsk
	vv+0Vk3fCylbrkizW8jnB4H1crav4ebhgCMO2LFFYy2jLRYGCrTKZcBXoFvsootPdx0+HWNW8Do
	DVoBQ4yNgL3sw85EGzFoA/l+tQEEyT/j26tzQE+HaBxPIXwTBhekKP4iwtHxbKNV2xGW9L5I2wr
	Eh+5FUvi6+NUU9N7nWdyxuFdSjcRoNeusjPybSyDdGj/WOHq6N9aeiecAQ/9zUdLGg1dyANwzHd
	jCy9CF+yPbA475k3YM9NVAUAMMGYUtlYcTdsS8aJTiG0LoZzJEi2aK1OfTi8mae4XTRPtTrY1ap
	JemUD1Zd5oDjmxAcOciiciBpi4gc=
X-Received: by 2002:a05:622a:287:b0:4f1:b742:35c2 with SMTP id d75a77b69052e-50ba38507c3mr30108841cf.22.1774615618024;
        Fri, 27 Mar 2026 05:46:58 -0700 (PDT)
X-Received: by 2002:a05:622a:287:b0:4f1:b742:35c2 with SMTP id d75a77b69052e-50ba38507c3mr30108461cf.22.1774615617452;
        Fri, 27 Mar 2026 05:46:57 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48727c0cdf6sm45225825e9.2.2026.03.27.05.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 05:46:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 14:46:53 +0200
Subject: [PATCH] dt-bindings: soc: qcom,aoss-qmp: Document the Eliza
 Always-On Subsystem side channel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-eliza-bindings-aoss-v1-1-70df76adc69b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADx8xmkC/yXMSw6CQBBF0a2QGlsJNB+NWzEOquEBZUxjutAYC
 Hu3heEZ3LuSISqMrtlKER81nUJCccqoHSUMYO2SyeWuyUt3Zjx1EfYaOg2DsUxmfCmlFl/1QFF
 TKl8RvX736+1+2N7+gXb+r2jbfpJEu1R3AAAA
X-Change-ID: 20260327-eliza-bindings-aoss-83a5ab4fee15
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=zYUNGKdFvKSqUGrjtnsoHASKMJ3vhfHxxn/46lWcKqg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpxnw+xUh5fxocBcdrOhEtOGvxl96RfusD/GNq3
 5vSk7VAPe2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacZ8PgAKCRAbX0TJAJUV
 Voa7EACYnivfvQuXHGEtK3E6cG3npPPKCGAFB2N8dzlKNTsu8rtWNyVdP47TEQfi/hEWExV1R+K
 Ie1gTSJp2x9Ts5eK1r2ZrO8NPpRqagzs4pc4W6QPmLIVc3BB/GOSnE5ytWoNZxFNexZRIiIrrvV
 wNGtsycILUhXsH1qC1tJbJcsoj8BdZR8Xm161sNejyLLIf6B8skGtdHo55fmswjM4zcsCBuhNUE
 AzsgQX8cnoyJHE6FJuXAq6202VnEhDlC7F7xUIq+RzCMhbLQ23k4ZnrLZsHistYZ7R+s8JmZ8/R
 cnog3vZqa0EFw6oM4PUyRC1ekQ9C8Fb7IpkqPues0vVnVoIiKNT6mX4ieFrmCGct/wewFqBI3Dl
 RA8lS+AbHhrfRYuJlgkujRWSHq8ux/Q/myDeQBID8woaIA0LiAKu7bq99JdcqCSgbLKoryEB7Zl
 CPBAEUEzh/VEr8rrupXvruzXqv8T/8HNilnWCqS+zyGb7wdHEkb8ZhtPsphUre0lU7bV1GhegWf
 fATT3JU7UpqS46h1hS9d5kealPAzYcg3g3zahdoCsv7AJvDHoAIzJtXNNPr/kKiu6jVA3QPR/3t
 EV+1hbYlgOJPNnPHS0iN7GQHbpSXG1/ox7Ks+FnZHSoLGFQ7jUcKZRs6/Q1K19mlG11ArnjaJVF
 YBJXYXsdqYOQvzg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: GLvpRt8X3mxwK6ZGHKp4qE92WQnna1gu
X-Proofpoint-ORIG-GUID: GLvpRt8X3mxwK6ZGHKp4qE92WQnna1gu
X-Authority-Analysis: v=2.4 cv=J4GnLQnS c=1 sm=1 tr=0 ts=69c67c43 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=O67gKX8sZhZfn82j4YoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4NyBTYWx0ZWRfXyn1Q9su6VjRU
 efqaZYxhRSQgNVtzJZj6HSocB0vts/GJpBGkN6e5lK8J71eC8fRennjEbGYQUnyvTYZbkejRDZp
 Q5X+N/dycIUqKKZnayujJrA5ixuIkRfiMXP84hno2Ug6WBJygfV0LpZBI8WoVlmwXqhspTHWyky
 EOGbsjvr5aQURlLtAsFaQmXp2kvnDIBSfzwttHJcMOKUzYG6VsVm42w+Vy5P3JDHMXoCwxVCjhX
 wlt2IB7bzGx/wJVdakV4jVB5BK+Vj/gU7H1kCLr9r9JatJu5P8XJIMTHEBcpKIreP4H79FnCAQF
 SJDa4qNiKTkQtk5Nc+SyZOpBMuWQUEHy0gHZorIvVk6Pz43QSxkl81YBBOohTh8dgdoZ4zT25FH
 8OjKgGttFR4f/23CR14yUkfVvryrJ8wg2JprPCP/qwdEWgTcUvfxRTGP2KKP8bHtHWTPrq8wLd9
 JMByjUh8wF3kptH0BxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270087

Document the Always-On Subsystem (AOSS) side channel found on the Qualcomm
Eliza SoC. It is used for communication with other clients, like
remoteprocs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index c5c1bac2db01..8496d623c621 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -25,6 +25,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,eliza-aoss-qmp
           - qcom,glymur-aoss-qmp
           - qcom,kaanapali-aoss-qmp
           - qcom,milos-aoss-qmp

---
base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
change-id: 20260327-eliza-bindings-aoss-83a5ab4fee15

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

