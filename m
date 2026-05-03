Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AD5296BCC
	for <devicetree@vger.kernel.org>; Sun,  3 May 2026 16:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777825025; cv=none; b=rwtPVjUo2AqqgzNTFUOMkPDFd1OP7LvPTFV5Tu1aPBj07YDeTc2pmfWUygdUI+DhfDu0SQtCQeJa4nouSAZFQsnJ88EnrQHkL318qtKqa3fOmr0Hggcx/IaplMvAK6Eul8jqKpn8jkgPex5UL7PLJBB9AZuj9w+WkUuSS1xCItg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777825025; c=relaxed/simple;
	bh=/ef+sgoQOWXOXPdyN92wCIRpnQq2A3OBMfT5ya6PtLY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Clh28YpWoemf4JTYXMrhTj8daSz2eO63h3zSV8KoO+GPwWlldiJaNC/kXv+bkhb9z1IGGqC+jWtpmCMJBGHvv/lCFmKERHdjMhzPMGTxgehxlzDhqDOXA2suuQwqHfPhBEg4pJM9vvGS07zlGCduXsRAUYbQMcon66s3yEjrEAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CklEnEMY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ahl7QrDz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CklEnEMY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ahl7QrDz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6433ssVa1151598
	for <devicetree@vger.kernel.org>; Sun, 3 May 2026 16:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0bmyaD3uAgX/uuXOEzZXuj6TTSN7pzuzEPK
	/fky3AfU=; b=CklEnEMY9FCKNyBAKrQkMNBQPdYq/1wb0TcjXgSPvJlA8NzqlmX
	/FUW6OUtz0R7d/7fwlONyza2WSZeMW/0IqBxdS4VHApvCcZQS7Wf5VH6qORmMSgl
	x6SuDIkI6AxK2MQqE0nAhRvLCzGlYa+8nl+jxy6fZKg+vOYoIQbyGy0n+Tf/nZWX
	pLfyS92tZaZRZwby9n9lDyaNRKYbyEKVq7KfiQYYK/k0HDrHc0RTKlmyA0392+TQ
	hultzBocuXHQeAzp5ZqLbhC4QIFvXJTaCmwTeMnGCrlrr1w4vmrKOZnCA9dVTfkl
	l7y7psYTOqpUaO3hP66PlwOypH3ZAXNSkJg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw8uxk89y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 03 May 2026 16:17:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8e8c47a3so96794271cf.0
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 09:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777825023; x=1778429823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0bmyaD3uAgX/uuXOEzZXuj6TTSN7pzuzEPK/fky3AfU=;
        b=ahl7QrDzBzlpJiOfThObwiX47e4yNjdXlmLJMIQKPKlx27JSxcFVzBkuSH+EEQq0Is
         2nvVHBCwK6bNzxRbESQKcK+kj71mQvMF4Q0srnA3mmtS4pGs1jegFKnCP787Qgf1XNA8
         P9pQEZczqHEHLSq/DtAHeuVx7xoBhDSqVaU3v8t1YuHMPU+G96OEE+ewX/msJ8MVznZN
         fBRtSlViwCcOjUSMqRfCBoylHbPeFMimizDRvzBGnDeMYYpIqJgS4oIdae1x4eW9WWuQ
         1KpEzyIwyNwA/iWJ/rkBY9LC+w/SlEt9g7IqMe2N9pBTPgjzZXYL9xwkUMDeyb0nAW6Y
         LiXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777825023; x=1778429823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bmyaD3uAgX/uuXOEzZXuj6TTSN7pzuzEPK/fky3AfU=;
        b=fXxZZ7botMFjKzDZXqfJdQJTt2xwyV/5k2D83Nd6yoa1UWBmflZyZwiZSsaG9lQz+3
         LJPs/Vwm4HkKqaPo88hCWaMMHm0BKQo5Ous8cv/q6y4fSz4b+BNJlYTRDqXLJhY21TJb
         4PLnlrXVdGF/9AMLUKUY220Etpe1Kn6HFKz95Hih97Gdak+3opreIqiScxHOnQDoHZZr
         raCTmyv/rms4CDnNj4heW0QJDiqgZYwW+hoyhzirZZJXZPPlbn1LIOakMGWRlPnlBq+G
         k19/SKc4bAIvW0UmKZnmQiyDGoT1y+9WsGZcXQ2Rp8H4xQlSfDUlfi6G7kKexTXBbGKK
         UIrA==
X-Forwarded-Encrypted: i=1; AFNElJ+dEOcePt0lCJhUoKeGbUwr/6CDnCv5h2HkFH0sR7m98DggGlI2z7y4bEWmiQY69/qce39m4ogEcaT0@vger.kernel.org
X-Gm-Message-State: AOJu0YwFOlORkcq9cytXdEsGXyDxbb1YTyFfPHMdHbDs2LbjQMg0lyY1
	AEG/qAHwifxWvNDNGBv07QtcdmNQQsB/emHBc3uZLRFGCCHWGbE1yKm/JLsE8Mw8H+RuWeCueVv
	VWx3f2UPE4mlXwCScIuGEPUm1fN/PLcRjbi7nNthte/NlXqTLK3uU+SmyJUhAuBJw
X-Gm-Gg: AeBDievUUyaH4i/TwSGJMxvsK0sO8BtsFrl2Vggk3cnTjk+YaBwcIPzCaMbdBB6uc5D
	lUq22cKM2w6kQsWgTdb2slceEgsQaxlEuMngzymxiC5l7bko3tbEqIwS0QXRjMA2xEBSgEo+7AS
	T3LwghnLzqy6VMgR/PZJkW7SNvhqFxIy6z2yIlSNd/J6qVpwcfP5fch0duAxvSAZfn+HyvWe1u5
	+8Y87p2Nk1aVo9hQ3Wy5tAf360GIS94xqk+W/F1kK8RQEmIpbrC0PMpiydngpLwGwVZxkfWnLJO
	RPb/MIHk0PDJrifwTzHLvr8mUbvJNhjHE+GhChJMC9ym2F/3EOq8edc9JbQizj9ahiBJeaHmIV8
	4s3yMA6HU3HMZ5G1anxbWHyGIBIJclPF1EQCvv794g6Om0uc=
X-Received: by 2002:ac8:5e0b:0:b0:50f:c65f:a4fb with SMTP id d75a77b69052e-5104bdf14e7mr104171231cf.11.1777825022688;
        Sun, 03 May 2026 09:17:02 -0700 (PDT)
X-Received: by 2002:ac8:5e0b:0:b0:50f:c65f:a4fb with SMTP id d75a77b69052e-5104bdf14e7mr104170811cf.11.1777825022199;
        Sun, 03 May 2026 09:17:02 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb69800sm198912675e9.2.2026.05.03.09.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 09:17:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/3] dt-bindings: interconnect: qcom,sdm660: Disallow clocks when appropriate
Date: Sun,  3 May 2026 18:16:54 +0200
Message-ID: <20260503161653.60785-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1169; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=/ef+sgoQOWXOXPdyN92wCIRpnQq2A3OBMfT5ya6PtLY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp93T1/mgkJXIyF8nH7/99Fz0TrMFkYF/MKQIrO
 PlQG9aKiyOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafd09QAKCRDBN2bmhouD
 1xzKD/0fZtDTbF3NbziunBoudBqh6LR9RT2tf4w+iykeU2jYhIUC1LOdA95VFObAJqJ9gaieMDx
 +0kf9vzWlMgQavROoik+uqrkGMkCNZW0u3gVUTrAMzKpDV5o+t0DTYiZr1Z0RSmLDXcO92ONmtY
 zydDfcLxVX12MP6QKEWNhgfSDktrOVkBT55d4tvmS6uzpDHgX4kWchPJg33jWtoJCVdYlhB+Im/
 +E6zO00qqPV91VvykxlgnK4jUQ/iQv6LeR+pIoMglBneY6qEZqVvo6jJdDrQQOvEnEiFs+X8sHb
 X4GAlC6RXMtBus26iCOsdMyKfTRvVnYTP3Xrk9kSMM7KPUVZJjo8xE6LEOPMn+uebb7b1U7ee4v
 6ORuQ2g+yhPKKy2h+mKLKVe73s5555Cv9dCUgxR3enF/bum581HXtpbslnJOTJyKo6FdhvQvQuT
 zBjrKl7tK9YGX0x5hEexzdqJzk83a455aqsGB8oGmXN5QKjxRPkdAYE3/HzbC8J6uBY14GeKmMk
 4TGqRlVwyzW+XneoLoKI1KNB8bAvTI3pn9ITsbUsMs0Nfp3YcE0kpxY4ANzHRBuQHnNS54MosZ3
 KEDRIete5PkhRW8zzRH3hPVnJJ2ZDCG5umYAfQUduSkyMlvWQdtHtDMmzMg/PJl66YdNbVYiozN mpnxMxEu4Omr3aQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6W0H_5UwH7HxsRFcWFNUYzRTMmyFVBKz
X-Authority-Analysis: v=2.4 cv=QqxuG1yd c=1 sm=1 tr=0 ts=69f774ff cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=PRagh5j591ZQoFbOC3AA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 6W0H_5UwH7HxsRFcWFNUYzRTMmyFVBKz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAzMDE4MyBTYWx0ZWRfXykwYL2MzXtMB
 fnMxmQJ/AMca/pBd7WonTirP4KbacnUS5soj/f6kibg7xRxtFrzVDXHOGumzMNOW6xhEBgZgJxu
 Pxu3ydP6QgaQ1WRcvHjN1LL+hOMdKL6KwcwTKpK4A4/5c+ascxgYy6FrqOYdlQKtV/AqL7vY7Ru
 0KO58jBHS4lkwRnOJAwAHuInubRbsygYHo0Dbu4FbEGm2SY+zKaZwFSZ5meyiW6qgu1+15IpyBS
 +KrYUp/gqoUbQ0HTlts7SzQ5Au/I8m4bYR84SSA+T4NNfD5ng3azvULV+4BL2uBk3iHQ3sy2qXz
 DnhU2ZdcNlmphDy1MTxHj+3JsA1j9roxWmiICcFAlSnX33o1GzQOt5PZ88oQvgo1cK5j7XDrEgR
 XjoeRWUFZor6eegnK0YsA2KugUgka+rh8PnSwu4gHvmbtYJSJfKvl1pX7rDGntgAuJFAPexnHyV
 NLbPzNljLuG/+YSjnTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-03_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605030183

Only qcom,sdm660-mnoc and qcom,sdm660-a2noc devices from what is covered
by this binding have clocks.  Others do not, so restrict the schema to
be more accurate.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/interconnect/qcom,sdm660.yaml          | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sdm660.yaml b/Documentation/devicetree/bindings/interconnect/qcom,sdm660.yaml
index 8f6bc6399626..51428a2b0ce0 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,sdm660.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,sdm660.yaml
@@ -79,6 +79,19 @@ allOf:
             - const: aggre2_usb3_axi
             - const: cfg_noc_usb2_axi
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sdm660-bimc
+            - qcom,sdm660-cnoc
+            - qcom,sdm660-gnoc
+            - qcom,sdm660-snoc
+    then:
+      properties:
+        clocks: false
+        clock-names: false
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-sdm660.h>
-- 
2.51.0

