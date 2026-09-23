Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A294E486E70
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159280; cv=none; b=MFGcPdJpBIat1PfhxVQOzpRjHjmIkkmt8IgThsjI7WOSSF82+ZaDikJyL/Nee3EtJ23hYNhl6c7+neTbt2dwwG4m/8QNdw1Dkcn4OB6ynyYinFUW+dxEPMtoeGlsb5NLHm3slZyGfMGEOyfV/VrJB6x0S1pqFZtQEX/8jHcH3N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159280; c=relaxed/simple;
	bh=3yrd9iaxk6WVgzH/+KegTwiSgLsdXLNTrYaYCjHpfy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jR4E7HxyL2aVmeZRegpeOEM0vHKOT/GzprmkH9lbU/7uD3kqZef81hCbuB4a8NTPJrhPTecpUBXVhKWUO+iubpRnnVRb/0C3BdroT69tCk6ritzRWdSzRJSc5fjIn4rnLNZco+jHUkDnFr0yhB12s2uT6x7bUCWSeTCdPkM2oHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZReutKyw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WAC3g4Oi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZReutKyw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WAC3g4Oi"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA3Jvf3566251
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RfrblhWfxf8VQ4VzE4Aa8JWdUn1BoSPKxiuXBWBY+60=; b=ZReutKyw0lRObdNO
	Mze2c9GJtqxQzOBe2R/l4aA/EYI4Kyqv6oTBQ5eRHwX9ibTeDbQGIZM+T13NiqBO
	hN44wtkFLdByky2siUYWSjFGMrFWGdzh1kFThelFe6Xp2SpRiIA7K1PQVpq2tek5
	5wLmBDib2htNu5u8WzkHQMJlZlCqcf84dmUuistLTW2cbpPJ8C7asYxAzcY8GMZ7
	FGjhVdHAUQcH2Km3Cut3sJhKy72/ozetajp1gIHNpH3OmXLNWNMJD7CNkUUnguMw
	Sh+93MHhTipFnscy+Act6UAfgXZHt0DORG7erx/kT0yPTmd3+BGKR/sEidhGAasV
	EU3Ogw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xuvq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:27:48 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1416f32fe11so1627953c88.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159268; x=1790764068; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RfrblhWfxf8VQ4VzE4Aa8JWdUn1BoSPKxiuXBWBY+60=;
        b=WAC3g4OizamdjY9ur3FpHX4+DWUmKZTXDg6fP/fSfLknCesE0xT24Q8MWw2bZ8llBB
         ve/thFMldzN1tq/oVRx+uoFbaaNLuMFiPJ7IXjlWFoTfgDrumdohkwUI2g3NAW9xtvBC
         lXlhj9a+aYAFFoCMsxYTInD7sEfN/8H5/V696BPyqpoZBhGC4DJ5kTQgqd9JIe3pRXE1
         rwYkJ4JnTW6/2D9mXZ87rcy3Gy1urAo0PHIty/bteTf52FNwn//dkr9Q/ioo+P611LvE
         KoOFZ9DAylI+OX6nIAwc8at3vskEmY1qJ7hJbfLPSIMvFNUui2sizGrOiqWvtxKySog8
         SKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159268; x=1790764068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RfrblhWfxf8VQ4VzE4Aa8JWdUn1BoSPKxiuXBWBY+60=;
        b=v5WDP7v7mfHUOPI3+4A6x8qdX10j3XpWzqXq62SRU4cRZTOvAu77ogU6I4LhBW8R/8
         NtZ/YDccmtq8syWJupgtYFvX0bbP+HHjRTbQdeZp4mn7XSIlzfESXpHvzQltdq6s6wyg
         LZvBtUr9C69O4NqyiX+urtFaMjUoklB9FDxKaTsZNKSHlJZJvw5QltnAHXXn172Av6Yy
         2zFu3yYgnQjIcb0K6QayzmlQrA6LlwmhXtV2PbpqsJBLM3DLDBvsatGs4PB1ZL2JjYnn
         kyETcco2K5QVywGNwCwMNdaMfMAbdmVhwXV1f9u6hiY5D3MZ/uJUKpf0A16eE3n9QQPz
         oU0A==
X-Forwarded-Encrypted: i=1; AKwUvBwr0fx0+qADr2j6DQSouFbIPKc5x510pAlkP/B/4bN07roS8HC52Bo+4Vr1BbOKvXabqpzTgVUlq6Kc@vger.kernel.org
X-Gm-Message-State: AFuF++kORm+OwMVcv+YKG1i0uJHxMl6I5ey3WpU6psLQjcfEhFL0ex/8
	LTnzv/h+jQG2xLfka3Y/BWA4fJleEjq5D+Bk4jLZCedVgMqWNqQF4uP/Q3UbBQ69UjKoGAT5rmv
	nNEfDIcSAXUMW6XH2oTkRwnbzDiyf6rMsaNfBN9dkrJgR47enALUuv7N0WcofdD5+
X-Gm-Gg: AYBFou1bzN4ucU+mddjZJOt+gllyN99bagZcM0y2SmhJO4Qh0CshXDT4p8T5+KtLFtx
	z/KFvnAChZ1Y8bLYCfALq0CUFHWb52LG2BPK7zYf8PSl9eDhdigXSKY5ZAXpVxqLQ5cAJmMsa+Q
	NhMP/VgrRTds68jA+TZrgYjv4MxuZ2uZmoTC2S+dLMwLEcwt/foH0HZvEAhb/Re7KZKWJFZ+YW8
	oJSxtKnIVyagCcJlfrAm0bWUHmOQ965kVTrJ8+O1uPz+RTctP1WD/MuktDhiR3XX0YrveDDOd6+
	vfpvEzDzY8A4fLyuOdj8ruC/FTkOaz+HSY9VKj8J7ywjftCElSEZs7ksoJ4ev944qhv4gQYUPxj
	b3kyQdk/i0O/246PucaWRW4w=
X-Received: by 2002:a05:7022:294:20b0:143:74ca:e825 with SMTP id a92af1059eb24-144f917e79cmr2282761c88.41.1790159267682;
        Wed, 23 Sep 2026 03:27:47 -0700 (PDT)
X-Received: by 2002:a05:7022:294:20b0:143:74ca:e825 with SMTP id a92af1059eb24-144f917e79cmr2282721c88.41.1790159267103;
        Wed, 23 Sep 2026 03:27:47 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm8766646c88.13.2026.09.23.03.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:27:46 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:55:53 +0530
Subject: [PATCH 13/15] arm64: dts: qcom: hawi-mtp: Enable GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-gpu-v1-13-0c3c79a1a470@oss.qualcomm.com>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159163; l=743;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=3yrd9iaxk6WVgzH/+KegTwiSgLsdXLNTrYaYCjHpfy0=;
 b=z4IzWM19ZUzLaZsn01beUUV5IsAfP11dYgwYL6oOn1vBBwSz35w4MLJQ/iB/mjHrPSK/jyyCJ
 G2prA8e0ZtkBodOLVAY7mww720d3ehtoNhURELlFqkd/C7FKsGeqVNq
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: yQgPJ9bi_ARyLtD217GPAabtEisPWSGJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX34EH1SDAtx2X
 Anl64sN8hSbJJiFvJUNbiKUKckvPDZeABACYNPfjcPvpoFh/5gnQ1hbRE5piC97NTYL+GgFDdn0
 wLKPR8lKpHjyEy3tjIhK1wSXyrIax6DV4RtacVXiVslbTVKy+DX7WM+FQx94hUbMlokePynG06S
 W8evsshXKCoJodKDDvSFbC+nqqBZGrfm7zPBq6qixFWaGue7LLcV2u0+GL11bf3Z3oV+IMGUwzW
 iFBmNziDNhrFsaopR4TP0uoTkR00WWwiy8csWKZ9x/C25rZ3gz8hgaYN2nvaKqHqEmQzz6tWVRX
 /gSThp8qOii3fv9nWeB98aVHXyvHL/uGSCNSAn3Nu7F8g3Ge5Q+McYi2N+HrARSNPt7ylGCdHhB
 qwo1MOnlbuuP6oZWLzG80dNU6vvc4fSLUtJNidwkxm+uuK30h7Quzy0KnO27pI4Czb+M7E5yM0K
 zQc8mfI0/Hj/ryl0OzQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfXxtA0BgsUz4ST
 eEVOa3e9gPZTbqUg+b6YEIUKPVfU6pLKqiQbCHUrsLPItOlFD9oEJebhUUQa0ehbae8kG40t6RN
 F4B1PD3aDCfEx21Ls57MkfI2h4NbCEU=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab3a9a4 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=fF9zt-HNKniO5dK11HgA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: yQgPJ9bi_ARyLtD217GPAabtEisPWSGJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230041

Add the secure firmware name property and enable GPU support on
Hawi MTP device.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi-mtp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
index 7709582491f9..ee4b36f2bbad 100644
--- a/arch/arm64/boot/dts/qcom/hawi-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
@@ -781,6 +781,14 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/hawi/gen81100_zap.mbn";
+};
+
 &pcie0 {
 	status = "okay";
 };

-- 
2.55.0

