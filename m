Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BEE3C7692
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444055; cv=none; b=o3KC0wzYfoknKa0p/rzQ2L86kLt3KGS7ER5Iob6KBgEYhYCOs6dUkMXvDGkbWVuYdlQKjxnydbyH7zjp+kC92f5HRu8e+BysJDzC7dn0N0vyTFOrofTZRy53tg8l/9Nz/QNHT4cPPkE0YEsk5j2vkRwtqwcD6NX+CbZAAf8xIK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444055; c=relaxed/simple;
	bh=if6n5oE2BTLkyreTvAm2mppyjqBgYiGjGm/kFnU6zlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AzOcui7eIDqi4JvFImFGWt20F0mBcscP3oS5HUlKRzLKCDD3ogi2FlCEoXHveUbrLESwlkF6eVDZz9RO0ZTn3Ydm4FR9wHMlnR6gDDOKYXnnQ81NBYdxE7UkFNGxq8FWi+x3DuHXXKim89Hpyr/9PDf/5FzHhVWKAM6ZUayQ/RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6JhHwsW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aXZPNRmn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6JhHwsW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aXZPNRmn"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M6FiqS776936
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UJDQEQ0DbWmEeeDSdqubLvNF3hjzuAaZeqd
	EeDGLhuU=; b=E6JhHwsWrqoSGHQWtyWPZfys20ZoKzFja+3SiiiucciU8eCfbqU
	+shgBJXlG7MnO4kT0R1DmAFYSPrvrsejegaTrMcZQxVb7VqOzbav1Cq/rvt4UZJe
	9AGqdhI8i0qFbvV66gMcuMXYtNbp+gpXhv97CROUxX5NAhvft1h2G2pPHjSso5rs
	Y/2biWFzO3/UpoQ88ufocTCx0Ss695icuCgOrzAQitb+R+I6f0Y4P2iFwfcqulYN
	yenXgOjS4af92YN1RESp0HzbsnEsT2W1Hzpkw80Q9ZEdh6xkf0Ptdek3Uv1Hbjxj
	coxqwmLIeJthZ6rdatifq3Gfi7NkZNTgGIg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea94h2xed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:00:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516d13328dcso23853781cf.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 03:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444052; x=1780048852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UJDQEQ0DbWmEeeDSdqubLvNF3hjzuAaZeqdEeDGLhuU=;
        b=aXZPNRmne+O4KrphKJ2HB0m83PTqeOb80EtdqtRCMDIFvXY7YMT1pSbvuySWO5TGT1
         Gch+ygrD5AJOVp95il1UiQdd85uhdETmdYM9pgc2hK4dYAx99UUv6pp8DB/6EePI2CvG
         oZUugujk9arCN8Rczu4KaHXVFJatVxzLjuTCcv4YGAVA4TrnMZzulBvZBONKwj/1pYh2
         kQJ7DBjhKF8jCN7flv91xok7LxqrnqtqnFO2TAS9aj28C6s2m+rwD7+t8DB8bDMDVKyi
         sTaiqBOx8neGzq5aZ9Z6s2bvmTxWIfFIKwnEwnPQAvwjd11gU8Lz/EDq3rymD9okoFmF
         iObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444052; x=1780048852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJDQEQ0DbWmEeeDSdqubLvNF3hjzuAaZeqdEeDGLhuU=;
        b=Qg0Vixb9zfs04T+Vh9cDoscRPXtQ3gB02zbZGZNZ0CqiCMX/F4gObATeFMtp26RB5z
         bX8NRu2pKTnyreXY0/BOJu4PYJX3oLfqFixMT/9S+r+UHCTHu/6nT891a/RzXgZ0ZErN
         9sUXh9/Ub/GWU7BHJkU4W7EMLRKYTDBeMSshYFkxhGPQu/wJjRLWU6SphCWMwSFLouEk
         KnwNg9BKTaBfkWp74SgLOAM3f8BO7DcggQNQff9a2cE8S+ysRpa5H1rJgNN5xUJtIU5M
         hV3anXKMtGJUgBLqGA3X6GaQPPJK0DaAPGLG7HoM6+WH+fdECID6l1fhnozQFcJpDwwT
         3Z3Q==
X-Forwarded-Encrypted: i=1; AFNElJ+0/tbmqbaGviEATIm/FZa7pJv4PI7B2EZwYbAp0wKPxYYdChe7VYcGwq0XGbvMYjJGgLIiG4qV3GoQ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt3aobKa1sERhTEAvxQyHrLA0iy7xII7amNuZwz49NfT/48Dn0
	Q+AAwjNMQFFZBO7BJfkY2PhnZC2o/mVWNsEHR8FMQz1QTnjnAn7Gc9XVHZvbZVc5xh+bSUN2M0e
	1Rw/HIdULKpxfBjeosjczw6g4XfuaX2Q5Sm+PFIYz0GSgHYueImqsABmLmPm/P80n
X-Gm-Gg: Acq92OHLw0yLCO9scRI4Qmu57mj0SEU5wH1YJpKc0Al21k/4e1otnOF8ROGTt5/pIeR
	vcU3rE7rFqPouVOb/Pe6yrAZLi6PE0WxRLWmWJwYkdTfZARa25DscggmriqMe4m8DfkthzOLZ9b
	WuihdV/U84ed6JN2tGnLEkROsFYrRmAT2JMXDfEajvi3OECWgA+pzLevowDfJyxpmpcUjwvKdNU
	hbtDKirm2MnEDeUBz6iwhXz60KnImvgIAJ8Cto2QJkgKnahDucBHqx7y8aex0Ljbi3yIZSjIlyB
	GNl/ak4PhEiVi1oWu1c99VYSxlBEWNkMRaKwRPvwUnVcvKd9BbKO+zwF+UWDfg84aEykhWV8PNR
	PVVzOubc6qFyFYaG2qVR6DoOLZTbxoxXMC/kuHyWLBrfWWmzyaZzlH9g=
X-Received: by 2002:a05:622a:1246:b0:50f:783f:31a9 with SMTP id d75a77b69052e-516d45f9c68mr35882701cf.34.1779444040106;
        Fri, 22 May 2026 03:00:40 -0700 (PDT)
X-Received: by 2002:a05:622a:1246:b0:50f:783f:31a9 with SMTP id d75a77b69052e-516d45f9c68mr35875541cf.34.1779444034381;
        Fri, 22 May 2026 03:00:34 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d4850dsm2745709f8f.17.2026.05.22.03.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:00:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: Add Display Port audio on Arduino Monza
Date: Fri, 22 May 2026 10:00:26 +0000
Message-ID: <20260522100026.94760-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GonY8zVeq9Cjt3FaHRCwt3y5ma3nT9_a
X-Authority-Analysis: v=2.4 cv=QblWeMbv c=1 sm=1 tr=0 ts=6a102954 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=24aN7cj3spbpdN-4_Z0A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: GonY8zVeq9Cjt3FaHRCwt3y5ma3nT9_a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5OSBTYWx0ZWRfX+fDKKX8EgJh0
 2+VxidqpRGqAsAi7ZhPRaJZfoyuKb5jtcftwwTMNdKHpCJglecv1kUg2bMODN9Mt5F1UcUKm9nJ
 yevqXeFIctTxFaPWsuoFrMhE1CjG278ey+tEGZcRHeldAeAjIO7sF9WKxFQRz3M1fO3qOTRQ2rl
 EK8jwGoym05QBfxWeV3EnPNGr7g2kdEn/5ZEjFm5VefdyP40dN59GUOBlfCVVFjtLOKX9KlxSsT
 FNh4Hg/40qjW3I9ofDz6eoFHpwVA9MoaAYfbCw9+ZTYUANXWnP2p7VxDfUBKs1uE/Z1jKzaoGpE
 dnamkRD/zbmSXuNwGDd3to2lgBO6elxaubR000E6jMxhrPMvQL9xaM5eeNytPE3DR2ncBgELPCf
 5cM8jWcfGVCFg6eJ96LwhPSVG9U8kIedMkE8lLlMeGKaYI40vOUf8E6rDXPJKi8ncNd3wB0LiQO
 yofzmvAD4Uor/N8R3tA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220099

Add support for Display port Audio on Arduino VENTUNO-Q board.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
CC: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
alsa tplg changes are:
	https://github.com/linux-msm/audioreach-topology/pull/63
Ucm changes are:
	https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/ventuno-q


 .../arm64/boot/dts/qcom/monaco-arduino-monza.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index ca14f0ea4dae..01acc8363cbb 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -117,6 +117,22 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
+		displayport-0-dai-link {
+			link-name = "DisplayPort0 Playback";
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
 	};
 
 	vdc_3v3: regulator-3v3 {
-- 
2.47.3

