Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A8D385D86
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 20:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781640896; cv=none; b=QHAqNlyEIqThsVVrXoMoVfRfJhhyeOUnhIVJD9R5MICFkOWrTvD6QGwX5lvMZyoUJqdNtKVxKY+X3f7mTcaWvmmZFBZvIIwbCpAHcZFBd541mDmEwvBqv2zcGyxVeVXowL7T2UNWyNjq2duR2xU8nRqzv5I3WeS2bG8xaWH6ZDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781640896; c=relaxed/simple;
	bh=AB0A7wWMtyFMDgrbKuPIcQTTW9qV8HUFhEw5Y4NCP1k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gjrWSAipqgASH8Ify6X7aKLYAAGpzNiAe5CA4S+40AXhdjXVvaciLU/wnbM6sDMUcQpgOQFPJjfNbzOQlF1dJeBnbviaGZ2mIjlKA3L98a9CKMuETFLK5LckfPpyI/dh/wUmTxP6EcO8peOeJOzN5y9i5lblHTYxCtzLzGaSGFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PHz/vI3A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XUz6zj4y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PHz/vI3A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XUz6zj4y"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIOK3x4037047
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 20:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yOEstz8lb3k
	BSWr0k6Ei7wUb8Svlbcj7uj884ATXKog=; b=PHz/vI3AE8TtfhRA9sErjzfEwZC
	JUuShrJkvHaCEBb3dl4PXBv47d5X9AFBRWf22TgRSlKu2VjwmHCzjaE79Z3bfhPi
	sf4G1I0FGckurdUdK6Y5jvtST6zOw0GW89EKuI68dX8AB0vQ0FPeXYULIs45Je/K
	XKoKojvmu9Y9beNGFf31ii6BEF8SDFOln/XM4CgjWusqIw3XImujXN2bvjbSOUUs
	4JEimuKgqWRZqZDlPGYpvxpQwzkIuhr2vjIJYQc8UBj0W59pQwdecslVUdnHa6HA
	PQmbcjSrVYosRF8k52HvrkqA4+cOpTkdHOETXu8InREskT6ntjI7rLjpejA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1763r2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 20:14:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf1dece2ecso50000695ad.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781640893; x=1782245693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yOEstz8lb3kBSWr0k6Ei7wUb8Svlbcj7uj884ATXKog=;
        b=XUz6zj4ympZ8ONszWmgMkUvTGf8/aHguzZ5RkvQv6V+QvS4/vm6vIamXIJf1cZIWxy
         e9RakavTGaKy/yoSksNQkBMT3ssw9LR73ffz7+Xljiuo+xH+AqTMNDcgSwYY+98tSeyr
         8LQO2qYFTqxwDbgKFQ7PABpuyrsv0v5v45AF99YLkcbojBqAagi61lr2iiD7L2K79UTP
         3Sou6bWYoC8BVZUYBMqwVOBRmXp/Ag1Ya0pmiKyLasIPxia8l9fazdNS5nzPDhu/HIV2
         tI5sca1nkftObTnokTNv23IDKVaZdR/Y3J5a9/bxjqWqUwUskr6nbJaGizzLo91IFBZH
         At5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781640893; x=1782245693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yOEstz8lb3kBSWr0k6Ei7wUb8Svlbcj7uj884ATXKog=;
        b=j6g9kv2yUQ6SaVQJbyyvTeHAwFnJqym8CMzfsB1kgzTRV9SlHKNfScuEHPk9fOAa1Q
         6uHfsmAsljfLl+cNaLGcKSp9LsSqtTHVaOvUkC8W3F9PytJZuC02N64A9Ii1Ay1uOjm5
         c478DPA+ZdMsBtvFqK0W0WCwqYab9b9oEUkLCc+qfaEHuNMcvGri8g1s47noXRLLyCK5
         TNQb4m5Iijb90PomZXOAWSu+q98m/D8mHpwIRfjO/5gG1OrFY4rbw9oqV/wwq+nrA1Oc
         ZzqmdJH4t/4Unq5C2mHuXSxMilfxPJjMJ8UiFkdrGdxKddCSnwGV4/rcUHxEGFlyJ8GT
         sr2A==
X-Forwarded-Encrypted: i=1; AFNElJ/LMxOpuPuz2vC1PatDR9Ge41kgEa0BY7WfFpd1iPw9cxl5sl6T1Gbc+8TNpS0l0xw6dmv8v1RjjIMF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6F0g500L2O/40nYU7vyRNqaL+oCz+5SarG51vBCzO6DW3swuf
	bIBU2DCRrbY+T63CZf8i7JtIeTYu/lkhNrF8MsxIjt5aznDeGtDVa0/95rz88GEgCJvy4abGpiO
	O3Z0QCXCJxmNGlvXVaqc3RCiOtEHxg5WU1NGeBfywnFHKupDteF9KlmxzothGlKe6
X-Gm-Gg: Acq92OGz4tr0sFQm0M/WSHjtoko8SW5xQqdhG8WZ0npStswPIdMw6GN+psoRwzxfYAA
	7pFoFHaoWKI4s0R2IRVd117Ph1Q5gZT9CL091CEvvpDyR/xy9as50ihVyfy7FtFF7XQ1hbnGoDh
	PXwYhN9GQ8alBW78i+uck5Gl8wjjJugc4A15iWXBMfANmmwcrAY6aiSMdXuxRxGID0x5+TlwXFE
	q6tucjVSFYqbr/B6AiEd2huZb7ufyu+lX97Uo9jrJrIjyfCZ0I9Xi35NSrfywlGm7GrpgD7G1AW
	slzJPP/0zw0+a+gl5ousFs396j4GoDjGwqVoxyobPGi6qlVtUmayQiawcI6et9yNKypraFNrM63
	/tcG623Pgtfh2zfwKOHkLQiFgFM1PyecCQpXRXdBWq6Qo6/0oCj3w5htk1Q==
X-Received: by 2002:a17:902:fc8d:b0:2c1:150d:6db5 with SMTP id d9443c01a7336-2c6bbf6ef6dmr5691535ad.6.1781640893148;
        Tue, 16 Jun 2026 13:14:53 -0700 (PDT)
X-Received: by 2002:a17:902:fc8d:b0:2c1:150d:6db5 with SMTP id d9443c01a7336-2c6bbf6ef6dmr5691285ad.6.1781640892717;
        Tue, 16 Jun 2026 13:14:52 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328abe7bsm136385985ad.49.2026.06.16.13.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:14:52 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/8] ASoC: dt-bindings: qcom,apr: Add modem_apps GLINK channel for shikra
Date: Wed, 17 Jun 2026 01:43:08 +0530
Message-Id: <20260616201315.2565115-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XQRjsRNXE2oaS54fOaUS4KPU8gDMKGOD
X-Proofpoint-ORIG-GUID: XQRjsRNXE2oaS54fOaUS4KPU8gDMKGOD
X-Authority-Analysis: v=2.4 cv=I4RVgtgg c=1 sm=1 tr=0 ts=6a31aebd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=HnBwLnbP2RCvDO8bWWEA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX8URj+CUTa9P/
 5rhgzorWJFEftGlfHXjbI/Z48RX90Rv2/1S0+oqeKUDofr1XgFjhXXZKvyUrJhTGgPAsoYugYUU
 tItov6gxGjZmz5jfyqL/EXFClHerZ2s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX9P3HgZ2A4aNs
 Mkzv44MHsjr+CaGglR4lf03tdK7dHpaObXUStRs7ik7c/irsPVqm/op19+IPuFp+CkTWYdxyydC
 gORQhDU/kpT/rhinCNJUsLqDFb93vsy5kSWPiVTmZ5NQlwe147jQoIlhsCHmlFhBkPz0xr7wXdj
 SWAU8wpNnV/6Pv+2Ix13turgI99iR54mBu7ePNv4By3OaiboB54Vy3Q6b/Aag4J0v/5dToTPsDg
 WiWr5xtW11gUzNnXLRNWVFpwgb5h4HH56XagC4juNroAhRI4ssJvLG7hqPl4EzMC0EEV8Zc7pjy
 7wXu10IuUhIQfdByDIChX8wRj+/3qalWcGKJgSyJewCeoJTuXD3ziE/J+KRtL3btNmzcSoOK0Tu
 YcDySXzb5D4qDbbDE1KU0qpEAVk70Im4PuuNqmRE19OLWr0c9xvxofYlQhHfh8F2LiQm4PZvYWu
 Aq9ZJDdXKVgkQZs7RIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160205

Add support for the modem_apps GLINK channel on Shikra, as audio
processing is handled through the modem DSP.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
index e51acdcaafaf..01250b556985 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
@@ -120,7 +120,9 @@ allOf:
       properties:
         qcom,glink-channels:
           items:
-            - const: adsp_apps
+            - enum:
+                - adsp_apps
+                - modem_apps
         power-domains: false
     else:
       properties:
-- 
2.34.1

