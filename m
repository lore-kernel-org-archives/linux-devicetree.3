Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA9B37F754
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 20:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778530054; cv=none; b=r3R3voA2r1XmnOqGQF4fb4Wvtve//M1OFiKxTX4W1k1z8zD7ie88N/Y7djIdGeamu65PT8SwHN2PO1ZwI9MRutITCtWMXnT9gZDw4ph6ZcezeBUAy6cepy/EE2k+EMLO1JD65Wf6/vGo0K5YImCZAyze7jjYGtnscrsw8ew/XwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778530054; c=relaxed/simple;
	bh=FpnL0ZPLEVfOL/cMC4YLbx3ytUnBQe7qykC1VIfe0qk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KHSgsYFV4JBJgqw+OEE1XYDQx3Hmh70PQ8yIS4Fz408QJ9fj8Nw2x9Z+eLTfn5eN9kJ60JPigU/UH3jBGkZPaTs8ekY2e4hmERcpi0Q9YGjiwXrL67bKn8OIjAEXfkZ15GsoCx+7BigNm9/yZqOKKKZglg+oSM+QjSTPqICEyLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CKyYQtGB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c4/52IBx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CKyYQtGB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c4/52IBx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6Y8P2186676
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 20:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JSlJpF3zqQ6EX6MthcusBte5cTy2JBqQ6FB62ENsUYA=; b=CKyYQtGBrNpBzHbB
	Pr1tDg3r8W+ukfZnUCifZXZwPodmwGIxQzCu9kFm7cLttT+DEb2ndHFmadt6oSXG
	2nqMCeAo6yHGIG4exNchmrUlUsfniH0YAVU8HJdjiD7Ac5HnvEJxzS895qme+NDM
	xrs0zWhNu2PsEHDa6m3kCfQcA1zmfZIZ+Qc953sq0iBylPXRXFhkMT0f7kC0Cskr
	QNo4iwcY/MXDqESYFr5ToC/wtoz/7nQMLqFoRHbOLqkbfgTmbKrqzQgdRyApVO9v
	Re2xGnehXeSl4pTP+nJOPOz8XsjWyQ3tiZSe64cf/738yhFREf3kndHcxx6hQ57T
	QH7l4g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0r047-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 20:07:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36641fe4aedso6774754a91.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 13:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778530052; x=1779134852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSlJpF3zqQ6EX6MthcusBte5cTy2JBqQ6FB62ENsUYA=;
        b=c4/52IBxDEq6FA4ZrdTP/B1blN3aA1fXhu26jjaBEmJNYkLhmQTB2Mpg4iNwANz5vA
         P6HG+JVUzEEgwVZEdUElJ0QtbX7DNMFt+h/YzJ/vygNU3naBp/rOc4lnWMqr7dUg6gwe
         5R4q32XHrKRt9QTuK9PfJ4miISG90cz1A5AFhCAKosA/dLBy0PY3O8JsrUq7YgB3cCRI
         QdF6ArWSaSDiqDoQbu+BZGp+KGgEsKHdZCHJl9FBPpbmWIezkbemVqi1dB0N1utQYH/u
         ukmNj7qxMrrLdzH89TVa0ao+ThyzG3Mvt2VoasdA2SYMbPUBX9TW5/jDWS1bbNbEN57/
         bj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778530052; x=1779134852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JSlJpF3zqQ6EX6MthcusBte5cTy2JBqQ6FB62ENsUYA=;
        b=HXyAGEeMR09XIaCo56bhZGbzWwbQKDlp6KFxtwBaegd903VIuh+viwiosJikh+wOCE
         /VJ5+GoMVvqwtQdlD5bUdYryLfuU6is/0CoIRTwiaoC8XRsuTIXY28bqCEKKYshuqawV
         txC45u02WdikyKVs1tlnqSTXb4qVoraF/ILGdeFqnm1WgIZtmgbVj2FOjGcBNpGp1AON
         rFMYnPjSQ/6K8o0V519P+JbzfxPbQaClmCAXb4fH8gcLdp9B17bmpafSdErteZD/8qwv
         T1wvp1JCv8qdzsD18BsijLhOtJXPKxbCFpeymf/sDpd6WKuIKaGwlGSwbLew8L7fXhjA
         J9LQ==
X-Forwarded-Encrypted: i=1; AFNElJ/bR+DTBtYOUpJdsvtwmvmaTjMrVFZWiTKoobCPPcRd253xdUgb+KbdmEbWVs19xoAJKKWtvzS/mXTi@vger.kernel.org
X-Gm-Message-State: AOJu0YwSmKGGtpGOHGZ0CiOhMWMNpphg1zrzkvuyAi+CXyPGbrHMqeAJ
	ZpnVHu0ZY7md6QKG53KnLjbhg2XlWV2kxcoMvRhQ1hC/k4Q4CVgCtfRgBk0SjeHgXgiHPTFV2k4
	/QfXLGmKxsLdDAL8r+5Z3P0Ky/90yvwIv6/hA+nJphpyz8AcvEx7b6avxZ3kvzycARY+DhUWT
X-Gm-Gg: Acq92OG3R5sFqWqLgoIpTfVVD+aK09M5mmfo4lBTCtNshPjCp+Aj4HzV7ald5DDByGw
	WcarKjvpqNv4dWfd1aW0DfnFsQlWh3U1VjRpOySDehG+liKbbfBa58QBX1Fyy5QBGt/LUyqAdEm
	Ev+c6XWaO6W7j/RFyl/g2M9OVZy1UvYqWENQI2vaLKFvE2x84joGKm2UWta3RXrPGhBrpSqOZYM
	wKs5z6APKCGUFrCzvY5pIc+IrPWuaIPvkG/JNN7nwm8wBu1u+ezPS/iOcpoHNKDR/HyAovNE92f
	gwd8Bp2Vj04N+S9HXvlGKJo/QVKdSyuoVLfOikv7QR++IBz3Avr7FVxl/3LNthHFaI44M4JaNS/
	OEJUYm1A4+HHBSwLdfgUt9lu6DZy6OXQbtI/UUlXoPnaIAg==
X-Received: by 2002:a17:90b:38d2:b0:35f:b987:4dac with SMTP id 98e67ed59e1d1-368b24e8313mr139595a91.12.1778530051589;
        Mon, 11 May 2026 13:07:31 -0700 (PDT)
X-Received: by 2002:a17:90b:38d2:b0:35f:b987:4dac with SMTP id 98e67ed59e1d1-368b24e8313mr139568a91.12.1778530051161;
        Mon, 11 May 2026 13:07:31 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368b01ef884sm64911a91.5.2026.05.11.13.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 13:07:30 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 12 May 2026 01:36:59 +0530
Subject: [PATCH v3 1/5] drm/msm/a8xx: Fix RSCC offset
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-glymur-gpu-dt-v3-1-84232dc21c03@oss.qualcomm.com>
References: <20260512-glymur-gpu-dt-v3-0-84232dc21c03@oss.qualcomm.com>
In-Reply-To: <20260512-glymur-gpu-dt-v3-0-84232dc21c03@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778530037; l=989;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=FpnL0ZPLEVfOL/cMC4YLbx3ytUnBQe7qykC1VIfe0qk=;
 b=QdSbnekUBS/LNdQNaOhTFAvnz8CUychpp7TsnPVbnU3E0tAx7xrKbjAw1q3LZguhQu2xQv+So
 jJ5MPnbbq6nAVhE15oQs+lqCPXeZGEKr/bgRN+W719SvQaNhxZiHVW9
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIxMyBTYWx0ZWRfX/6aS8sRQZOJb
 Jki1ue8grypd3v85cUSwSdfLmjBWuXxFYtTHOeMhDy3pAJw7mkTkzZReC8VJ2i/IiApVya1Q+Zu
 xT0JB9Nj8JtFcrUTKtqU1Boq+Z08IXLabbafaXmN2gp6NpY+k/omzd7t776Hfaiz+uwVqdaAmBY
 WsDanF/5PnxM1yFLxFCi9ML5GoV54hI5fO6xwe4OGesQkKGypcVbbxpmwNt+tJPFyiiV7VWQPWR
 Q1K3kd2VzZ5V/SSqCuZzplIl38pl7i5765Uco5XBnaI5h44UVsakweaA8msCHGLQbOzac+tiBJe
 z0IptIBW1oODIlUUfahC+Wog0kaL04zklggvxVYhM/1w7ZDFtVEX3s6MBDhqOo4xLwv+Xyguge2
 UUaZNhWYFbn/8BNPi87x9aE+EoMQWwDM40ozCCisM+eNNkIa3ic9A9/5E8hyh43ItwlJbWwi3mD
 MGV3F8fIHvQindkwbrw==
X-Authority-Analysis: v=2.4 cv=bpB8wkai c=1 sm=1 tr=0 ts=6a023704 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=MejHOrmRh8FCsYeZqM0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 0KqIodPSZqRfPzyaoCIV8kdpvC5XMQiS
X-Proofpoint-ORIG-GUID: 0KqIodPSZqRfPzyaoCIV8kdpvC5XMQiS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605110213

In A8xx, the RSCC block is part of GPU's register space. Update the
virtual base address of rscc to point to the correct address.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 1b44b9e21ad8..cab4c46c6cf2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -2357,7 +2357,12 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 			goto err_mmio;
 		}
 	} else if (adreno_is_a8xx(adreno_gpu)) {
-		gmu->rscc = gmu->mmio + 0x19000;
+		/*
+		 * On a8xx , RSCC lives at GPU base + 0x50000, which falls
+		 * inside the GPU's kgsl_3d0_reg_memory range rather than the
+		 * GMU's.
+		 */
+		gmu->rscc = gpu->mmio + 0x50000;
 	} else {
 		gmu->rscc = gmu->mmio + 0x23000;
 	}

-- 
2.51.0

