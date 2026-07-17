Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371D630100E
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 20:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784320957; cv=none; b=rkww+lj1PsFL8ujQLr/phNvoqf8ZRTkqS/ifTlTyJ95iPtvz4eozRjOWwu6eVQDTqAR9qgcedBF96CeSE4Aa1YvBcPbmKhPei28MIpbDA0rF8NkwLzXLAj092Lz/XeJ9gvu/w+88IyFKadfy8XgFS7RFr1uu27IOH/Lth66jb3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784320957; c=relaxed/simple;
	bh=9Brf+yWI1x+F65UFC9Bw1afbeyT16t4oVeyZuscMvkg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jm+x0qjV1IoGXIUGHatbBcQuuG8dGsNxvs5E9QdxgMlhoNiwAyBtQuUQttsQ0q3Nk9HOlsX3RabvfM7FtGFFcsMhhumC+hRWar13YPvb6pkpdZf9jrmWca6P47Kx8IqhTotvjtakI88H7hTJl1Q+zLBX3Iv9X5ZvBzdriWS5sck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S1+sFPv3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fGaKtUl4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S1+sFPv3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fGaKtUl4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtOuw2751689
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 20:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q61K7rQL8TzxQSbcJjMDH84anlusBLwuWl2h6jLOOmQ=; b=S1+sFPv3oD8ZA4D1
	6NQJIZ1xqUfwllz50zIRqPmGzoEcg5+y2zpdUY6J3qfkScQ8DgHhkxXU27swrtcj
	tbBLWU0DDrKFCJPEtMiqll4uU1IQjxCjdKgApxmZEWMfJR5bPsPzojfj3rnxRzEv
	BcE1+0Aw15aX8ItF7etjkVQnPpRMDGUcvFa0b0cwVzCjKjMn0fkUs/1T33ZEHk4Q
	E31ptetYOI7hUXTz4KSjywLE64xSC78GVEgwYW2bQxit3gP+5Zcu6bYbaM7T6ov0
	fG/kEgxpKy43MxYDn26ajGVwP+olmkvIGDlEBGzBOTTsnKt/JW9TsrVH3Ui4OK6P
	oTdVhQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffpug19xg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 20:42:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c7f385887bso192915405ad.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 13:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784320954; x=1784925754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q61K7rQL8TzxQSbcJjMDH84anlusBLwuWl2h6jLOOmQ=;
        b=fGaKtUl4kqnFg4m2Xfzx1rtIz2jt9Z0JmZcKH7jgXYBu3WP5E0gImYo1NlWpjYy8wu
         bGJ5kp9Cy9a5nG2iI4LkBtMa2aaNjGc/UdF8GNQ5XAwEyM1BJhbeRTokcrDIxKXYAnzm
         1RZAtHZ+L8oBUtQo7tyHtX11bh88zFKeaCLsn/xBZ+H3r3dF9ROMRZnOnQHRaMyGPvU9
         T4A4njqc7rGBGxZa/WrDuQyJzDasj2RkgkpvcI2yxtyl79yjzEjsy6XlDsk1yQDTR6Yv
         WePfVRdoY/KRuBZAHT+5eaC6UQZUXb1OVEY5W6sT7WDw3ALytnsd7kPa9Nz8lNqQ6vQJ
         z4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784320954; x=1784925754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q61K7rQL8TzxQSbcJjMDH84anlusBLwuWl2h6jLOOmQ=;
        b=dNAbn0aNlXHEISjRCUkUW9gyWfwSyBBmtc/QeE+xqnoVGzNgkUVfgHUFuSYIh47S21
         bKva7dzCx6VdBlJ2fFRK47NnbYGKfOYoyLvBCRsXQR1q6OMQIFmr9haFhct0NykpsDyT
         uIliny/Okt3pTMPC5MPt295s9vsXr0CYQtXUrAmsoWlZwfh+HeiBdr4IUkhyDJHwsFdG
         ZmKIXLMyvxztL/xZdbLbH5AMMuPwo5i5M2Iwr79X4ly/qB2JSKJsRKlA1m2zswLhU/o4
         c1v42MrI7jsvWou3VZkI0VUDXPySFdJc+FvJF0W29HEBziq/hLU3gNnFwH2KNqCSyBcy
         etKg==
X-Forwarded-Encrypted: i=1; AHgh+RrHynZl1ocufOzh48XvxiW6H/4sGqpHw5MTbs8gjWBUoB6DCN0NwmEssBZ8KhA9UQE1DlFu6VT0x0Dj@vger.kernel.org
X-Gm-Message-State: AOJu0YxOx2wuDyRgCfAIGZk1kBzznyKb0/Ac/KtUUKr4MU27VcNWAJ2K
	7smDoisy1NfSIQNwsXWs4+/8YtmHn2aRCid/GoyL1wuj2r30h8MxAS7HErujkMgpgI0E2eVeY9e
	/hnep9QbXSbXajr11L25E/v6UvG1Y4DeGeOKez4L9iquLKGJ/onpKMUQdfFA8fmHS
X-Gm-Gg: AfdE7cmbSVGyCtVyIyz7ApqQUS5tFgihBCWY5Hw9lssmhqH8U6qA3KOLmxd0l9D/D6K
	KXbkkpn6G9RMY67qQJV/GaX83uqmWAlkZcFY3+tAEhyilKdzhsxggeNMgdsnpZovrXCn58RXXJM
	tiZmpeEGUrIX27bpR02+xgWcpy2dkMQ5ILndZbQbXXhLDxVqnZmdDt+BQpMtUJsLQKUUK9zeWE5
	Em4Nl4YY3lT55Tv8dyYxX0D2UmUfx9NiV8FYq9tvTxYdaop6WJBFz0PXrn3ECC9FqvyHMR6T1rH
	VpFxn304qrce9Jia/LRqFu1JO5udJ+FAoESQXCdybELEzDR6z7rkBms3VxHRCPiBbrMEzmTUY4a
	wJDXmhmy2xgWszheMnBlAjz/F
X-Received: by 2002:a17:90b:3f85:b0:38e:3fdc:62e5 with SMTP id 98e67ed59e1d1-38e4b479ecfmr4276405a91.19.1784320953909;
        Fri, 17 Jul 2026 13:42:33 -0700 (PDT)
X-Received: by 2002:a17:90b:3f85:b0:38e:3fdc:62e5 with SMTP id 98e67ed59e1d1-38e4b479ecfmr4276375a91.19.1784320953504;
        Fri, 17 Jul 2026 13:42:33 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1e348bsm11322997eec.25.2026.07.17.13.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:42:33 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 02:11:30 +0530
Subject: [PATCH v2 5/9] dt-bindings: display/msm: Document Adreno 722 GPU
 and GMU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-eliza-gpu-v2-5-64379dbebd7a@oss.qualcomm.com>
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
In-Reply-To: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784320899; l=1977;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=H03u72Mj2+0Q/DcdLyrGjsdWiF04QoAQmREqPJ+DCmI=;
 b=SJZVRrqpECN/vKCAH/EzAokdNAPN9nODY536Kc/SKD/uVN/Wi+sIO/cXcpc14W8BcSLEm31gH
 3S8w7NqkDqRAHSQssaeMIUwci5dn3785frvA+sLtN95U3m9ljtJW6d2
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxMiBTYWx0ZWRfXy8F2CRtaQBM6
 WVr+/EF6GDLnV0TvWH15GHtkIfoll0HpJ7WDZhvW9FscVbCnmgQAYfaMAcDqBpvB4lIY2sKAnuG
 3NPuDxjsnMS7GFamJbZKlDx7AUZl9ypr5B/vAbQFiBnnvoFqzWggBYZGJkTiB2SHzztDxSBiPzy
 TC+KTqSI844SghOmA7UDRkALvK3N5xwqsrQWcUro+JC8WaHsHz12cADPRagy1fF8UGltFxpjotu
 73lVjjjwI+OfwP0eNGPfec66BkkdxT8qf6w5v2rF0h8oCPsJaOnNUEIMDCS5+xYjAYaw0vGL8AL
 hIWypEm8Ew5Fb3wRZ5efgQ2mv9KrDjKRRGTJnNZYQspptcw4lnSmgHN1dmmDogQWHFUIrkY0AZa
 AoswXSYPQRIyvmgFRBks3yDJhxxXCqKhucKUgxeCjZmhmQkVWLy5e+QuUS+b+/hFQu6CEqpM3mw
 jabXOi3PdJG5nUfj6OQ==
X-Proofpoint-GUID: fudcUnVog6xpNbB46CC6FLCXJZWYnE5A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxMiBTYWx0ZWRfX0zXcZChy1oyn
 iSwyJKVFF58hb6ONZU1NbUKsT2WBJ2fbkcLkkGPVXKly737G7wp7+ygYFZ5QPqJOlGLkT0JsacF
 KQ7i11BS3iGXgfis3uOXHHBycRC8/Uo=
X-Proofpoint-ORIG-GUID: fudcUnVog6xpNbB46CC6FLCXJZWYnE5A
X-Authority-Analysis: v=2.4 cv=Q63iJY2a c=1 sm=1 tr=0 ts=6a5a93ba cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=byR7QgRKzgUKQ7cIeKEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170212

From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Adreno 722 found in Eliza chipset belongs to the A7x Gen1 family. It is
derived from A730 and shares the same IP-level configurations: HWCG
registers, protected registers, GBIF CX registers and gmu_cgc_mode.
Major differences include lower cache/core counts, 1MB GMEM, no
Concurrent Binning & LPAC support. Some of the peripheral blocks like
RSCC are from A740 that resulted in updates to RSC layout.

Update the dt-binding docs to document this GPU and GMU.

Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 8578c2f8122e..9e459f12ce3f 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -262,6 +262,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,adreno-gmu-722.0
               - qcom,adreno-gmu-730.1
               - qcom,adreno-gmu-740.1
               - qcom,adreno-gmu-750.1
diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index dbbd8b814189..d096632694c9 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -443,6 +443,7 @@ allOf:
               - qcom,adreno-680.1
               - qcom,adreno-690.0
               - qcom,adreno-730.1
+              - qcom,adreno-43020100
               - qcom,adreno-43030c00
               - qcom,adreno-43050a01
               - qcom,adreno-43050c01

-- 
2.54.0

