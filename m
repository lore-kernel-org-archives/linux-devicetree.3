Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372951;
	b=HwYKvrxRQBzYOvs35abVTdFGibofcy3DguembIRW51eOHkKFJDeTGufQ/+6I/s4zhr4w
	 yAtGLGLHyGh7R4WcYvTiPwadJrkTdMpg1Wc7NafQMeK7AelOlmYL68Ij7BELl3EMCw4Io
	 XC234CDNJ6YsiGAEajyFecUTJ/WW23KDfnfvzhrO1RemCCyk6Wwwbjk5u9s0r5tM2Ugv5
	 5eGlgs9LZIR9oG4RPDNkjhmKFJXbDhOF2Vv0rtownm8wIFvpPCCr0hpjxFljf2mGUvIiy
	 LQV2Soc72+C/mOg9cT6h4xaoFWXjQKsv4PBW2gFMmjfg+irjhKMy4c6kxgdhLj4nKcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372951;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ykSVHswchv2omQkjOeouyF/PE+0Z6GBM9cjMFah+F14=;
	b=4TpcRgKmdFdDGHGa0yH9tdgnV3B+6rPLPIrk6ov2g81gYQH2pOnya0KpVb3lEkNuzNIu
	 DCb+mZ8tghRBKwfNWVOVLYsAa0e2QUScDYcQdiMP5gw7cuROFcUqdhTVXk3L7Qq4stUO9
	 2Ien75Jbh+evWs4PchtiLLmF9p+nUig/8+42jI6CT65qMLo37E8FOU5i6euKm3UGJGaT6
	 Ri/SgwH3ZMIcQnHxV6m/GAPgRPwqOrbjlZhkpj1yBt3+B83r/fj9n3hmpOHnNG8b9oV02
	 1qCwZh5D9R/2tnwx+k1Ihpgt9eSGC5RNq3pMsFN64Yvdn9D0Lqq2m39H+r8FpggS2wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FzFFHRxg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MhVDS0Ep;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE076606A32A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 18:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE076606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FzFFHRxg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MhVDS0Ep
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGV6pC3986376
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 18:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ykSVHswchv2omQkjOeouyF/PE+0Z6GBM9cjMFah+F14=; b=FzFFHRxgFXmRaaZx
	Uj20ZBBvGoLXj5+5pI+fQHPGrb7A7Z0GxpFZR/Mmz2GlCBVprkghpBuSuwuyXrIU
	yrDPKzMhNTSFXD2kKfKTRTDRjQAyDTTJP19sZf7++rqRytqmzUMNlfQKxxdI1g4b
	RCb9dW8296CueyG72C9ripVmnPxtcQJ0yipVMhxD2OzFVc5r9WR6u16bUfu//PEv
	fvP2QYlGdZN3IkTrmPxie+r+faiAyfl3MV3uWE9D62GkB31mH4oPG/otVQWZ61xe
	HaGW3OTYfseYbBHU+pkVFTosxQAfo+Ed+fYFJfqPXhaqf4ow7rlAogZnWDDOvrre
	j6tmsg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33cu40w7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 18:42:29 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-383ec96a7deso3031618eec.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 10:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795372949; x=1795977749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ykSVHswchv2omQkjOeouyF/PE+0Z6GBM9cjMFah+F14=;
        b=MhVDS0EpXK0cypwLvjQtS3uoFzGziBebMrp/z1MktlZMqJwYiTDd1lHkI3Wy9SQbiZ
         YA6c4d6JCNOWuEHfd0ucHSh2oBJHHRW5PSsf0To4Mz4WgPVXlmANwTrXia6QMqHylNZw
         55WabS6w4KGHuMCyhc3jfRhVAWkapHLP7M1tDv1qTvOw0BBJikJSzs3KSC7uP4JtX/gW
         pbz+6pMqXtKgZsv4DRY4o3AgYn3V7CkEXgcurwMC4ZXNmz1CnHs2RWZ/U9qXOc+SPPHO
         1GyUKbyuocMe+0ZMqoGyu8h5tcZbbrs58nMyZV8bgS37xEHwcQ2ORYjDJCkueaW1t1Pl
         ruUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795372949; x=1795977749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykSVHswchv2omQkjOeouyF/PE+0Z6GBM9cjMFah+F14=;
        b=UUci3DB/RUrcLFyf5rrm7Tb46nnYXPsTnM2YmO+YsqsBhvAjE91DyonAW5Sg1aUzVC
         4q6Q2QAtYCZyApOUjWoi8XVaq515cr8VppWoZXHsnD3aMs+jUBbw0x0k40Qgp+sdKyso
         U9ttR28qRFLS5pbDLC4ajqf2GIece8UAoFvBtkszhA9s2x4PA6MJ1/OeC9V1tHT15bm8
         IGDw/evLc8LGbJqpJGZmp3YAk+4uX761dW5Rn04fNCKDnVQPELHG5GUdVGqQa2+JKF7x
         a7dWsWJpuwZRk8mPmfP7XhmmElnpRdgXonC7zSWxfw5TcgOh3MYpqTmx0J+Nd/2xn8Rf
         ID8w==
X-Forwarded-Encrypted: i=1; AL+hErFMTer7jZV3dfXk/es7msK/fSHtUO2HIPvs+851ycoRAnVmbPgf+ovUwMNe4VyMbGIGT2+767U9PCJi@vger.kernel.org
X-Gm-Message-State: APuU4Z954pEHVYx0Q4pihrwlWtM/kxg5NAh8pS9wux/TshVfHlAyMMTa
	HnZUuJADrisn63z1At88fn1QPNzGl+oW/s+h2RlXBS4FJw8RE8E9yHD1G4bKxrE1WBT6+zUlYcb
	FPxCdK+XdKCejy4VIO3f28Gsip+e63dUNs6doF4UIjYa+6lYXdVzJfin5NQCVjO26
X-Gm-Gg: AZFdTZdLe8QYU2hgJoOVz1YpACDj1QLLK7uvSwcm22kXTqATMuzZaiNAu6vo/jHjLrR
	r+d9chFnoNYT3Jdpcn1gDYRWL0I9PCbUB9HGn19G3tGbaj+E9xKLxlyWf6wkOcDKpWx9gd7MgKH
	RqoL1984ko64areN4UtcsTauwji3LDMPHXRnByRTwwkt2j42ni+fdgmXUkbkAed02Lr4vnH7fSI
	6Q2E3p7C8gIdI+umYLVd5FfM1yII3B1clxNbctXItJG9TMR+3oWpj8GiuVmeXxO10zEzJBmkCNp
	R6hy5cgn804tBTZGx2q8orbr2354m5oIA8H9fJBT8kxWFF33Tb5WTBuGTPT/PIfCKWKc/z9ocGx
	vBau8J753J6/wCiH12Nthf215bPa0uEBSE1ssD9lcHNx+bDD5Aw/P/grMR+3t7os3QhtL6uOkDq
	bckY30lxgSLw==
X-Received: by 2002:a05:7300:88:b0:386:959c:11ac with SMTP id 5a478bee46e88-386959c141bmr7900525eec.6.1795372949030;
        Sun, 22 Nov 2026 10:42:29 -0800 (PST)
X-Received: by 2002:a05:7300:88:b0:386:959c:11ac with SMTP id 5a478bee46e88-386959c141bmr7900490eec.6.1795372948546;
        Sun, 22 Nov 2026 10:42:28 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm48497465eec.3.2026.11.22.10.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:42:28 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 00:11:37 +0530
Subject: [PATCH v7 7/9] ASoC: dt-bindings: qcom: Add Maili LPASS macro
 codecs
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-add_shikra_support-v7-7-7bf3aa089fc6@oss.qualcomm.com>
References: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
In-Reply-To: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795372903; l=2957;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=J0adzQqe6G17aJtoR6GnWqVkH8sol0hICrj/oe1SqW0=;
 b=DP9UFfoKiEAr09p1fG6InA57e4/XK2otryMFFhvrtvHJHOpmotb07N+x99ZHhvotvM+VaMBu4
 AwLa6YSM3KrBZJrAEA918LnqRPxmKtGqDzEhYL5l7Eksg6XTZRbho+G
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: UhLIcigj-3Z9cyciIepguSdYXelDFyGV
X-Proofpoint-ORIG-GUID: UhLIcigj-3Z9cyciIepguSdYXelDFyGV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfX/UKJrRpfdumT
 SnhfndF/4/NOHTjNgMzC9XdwPCcmnQBtUFQctL6mcBaI+Evs1mDZd0K4wfysws9y9c4q1rIrhHP
 uKg+Kb/mul9m77PwJsaQgUUcK5Xh3Azimtq2q3hZBf5Yh5B/PWNdwd0z380kI+mF8nWEqFeAwSJ
 TeBXJ762PTt0Q5Eqqj1jy/XhZmRjUqnOv9kL4brS3ApFaK+0CWbE7bRT/7gdP69OKYigsMxZ0py
 /Tayrppg6ME6oOp/m/9Gyvy/dIaswMks9/l73+zkOHd1tPRPTfoaPvnZDmfNANYV2dT/tz6tJSp
 B0QQKX5xzV7Izg3y5oZxBdDRpiGaBkZnpV8M5JWiWp9Sd60k5hRAgiWb71g+E9ggXq2pZZeIIce
 xE85OnzLfxpvoLMn3u05rslDTSuTo2iJ+OWfGtt9seE1Oki/v6ASjxMmHVcfC8UALyMrwALdR+Z
 wnJ5oRdxESm5vuAblEw==
X-Authority-Analysis: v=2.4 cv=MM71C8Zl c=1 sm=1 tr=0 ts=6b033795 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=WGZyT7xzyh4_t1xe9HgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfX9Ulowkl+dG96
 b+JsmnKcmCzXbdkJxKtroT7T+912b8Bq8GSTTQUYX54xJcRh8Lmy1OjEmGvpS0ywh2M1lbPZITa
 K74H8P0Ja0BYarG6ONjK0jdAh44jWFk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220074

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Add compatibles for the RX, TX and VA macro codecs found in the Low
Power Audio SubSystem (LPASS) of the Qualcomm Maili SoC.

The Maili RX, TX and VA macros are identical to their Hawi counterparts,
so document them with the corresponding Hawi compatible as fallback.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml | 4 ++++
 Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml | 4 ++++
 Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 0ceff31a26a1..06dac35ad5a1 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -21,6 +21,10 @@ properties:
           - qcom,sm8450-lpass-rx-macro
           - qcom,sm8550-lpass-rx-macro
           - qcom,sc8280xp-lpass-rx-macro
+      - items:
+          - enum:
+              - qcom,maili-lpass-rx-macro
+          - const: qcom,hawi-lpass-rx-macro
       - items:
           - const: qcom,sm8350-lpass-rx-macro
           - const: qcom,sm8250-lpass-rx-macro
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index 77cde8a4c9a9..f3dde5d14bf0 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -20,6 +20,10 @@ properties:
           - qcom,sm8450-lpass-tx-macro
           - qcom,sm8550-lpass-tx-macro
           - qcom,sc8280xp-lpass-tx-macro
+      - items:
+          - enum:
+              - qcom,maili-lpass-tx-macro
+          - const: qcom,hawi-lpass-tx-macro
       - items:
           - const: qcom,sm8350-lpass-tx-macro
           - const: qcom,sm8450-lpass-tx-macro
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index c8392bf7c31f..e77221b5e229 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -21,6 +21,10 @@ properties:
           - qcom,sm8450-lpass-va-macro
           - qcom,sm8550-lpass-va-macro
           - qcom,sc8280xp-lpass-va-macro
+      - items:
+          - enum:
+              - qcom,maili-lpass-va-macro
+          - const: qcom,hawi-lpass-va-macro
       - items:
           - const: qcom,sm8350-lpass-va-macro
           - const: qcom,sc7280-lpass-va-macro

-- 
2.34.1

