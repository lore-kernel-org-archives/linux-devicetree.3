Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4131139E171
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779690595; cv=none; b=OAqXfOYvd9fDv/kq6EwSjWyPrwppGxPZ5fDaj24UXHiSgQk8zkz+Ny8VZKm6H1VmcKT+ovrY1L/V8Fr0i0+sSO1ZT19B8TsIovQNpt4KevWOo3Zsv2XwJFPVleNxtEkHwyCaip6v+KH2+6lYymeDct9F19bN/i6K71IGXmmRaKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779690595; c=relaxed/simple;
	bh=Tva/THzHBTqT2ONF1mJDs2pzgPcet8fzDuKUep33HZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=snR8FBQTQZCEPcdIrNc0KMD3bckZ0f84ixBxiC7fsnSCz+oiWLWbOqxJnpmm9/G6uSJAGPdWZ25Xn12SI9WLenSux8/W/MV6GphvMeotB567NJGkOK7ll79wQk5BAb9qMepslLMQQmpATHzEn9bbfdtIOLMlNFbzzJlBb/bBQzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GeNOIOoZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SHnGrwkT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GeNOIOoZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SHnGrwkT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P2olO13688247
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J+gMWLEMj8dIYBFuFbm1S4Zeb9oR0rkjHmKZnsKAxvI=; b=GeNOIOoZ1kqSyQAQ
	nB+fh9IUanxMAbH9F+mYq2D57kDsjSCOiAq/jSbQt2ddOEUAdqlC742pIf6R4uUu
	k9koFq5djjchQjavIpiGKx9Vxvxa14UxYjB3oS1raLRqbI3T/cTSNnC7DbTb9vwZ
	U5TbFU2+qadZkyxJjT8IULMml8mCl9OMn3ltLTNXYeIfwdrYFYmcIsX+5MNPR9+3
	AlI3KTfF+Q40/epzStXbH76OG1Z3ismg1nRs8qGoQ5/0e5KFxyGPXSEEfvNuw4kJ
	J43HDOnryTQNI3UCDTa0OYwl/14CXdzqyyr/3hNFp66048mWDlgWY3ahd65CteHD
	AJuyxQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb3jgwcdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:29:53 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2fe1cf409a1so14784680eec.1
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 23:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779690592; x=1780295392; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J+gMWLEMj8dIYBFuFbm1S4Zeb9oR0rkjHmKZnsKAxvI=;
        b=SHnGrwkT0q72iVgLPL6FxmFIDkyb7GMFzITRty92PV19Zh5CAauiWLAvppgdKR0Cre
         rX+fr/XbhgaaBRB17Jj9O/nsOqjdJ5WX75GWESwqXqR0fWnKyS7Dj7acpF8iVqeEWS9A
         a8et875ox+mUMAK0RaWv/hg4sfEnya1Cy5O8VJUd2g7SMA1DJlSi5sY4WA/bydGM7IkZ
         ef6vIntEXvNRaFBQOkT8aPnWCZ7Do1vWg+uwu0wYXLD2+WOE7tbVArnlUd7eX9gRewa2
         uBArQnkwISXdFk8wC29F24ztF+uhMosL/W0E7lTZQJkD5moNmxtDhzCFR0r3WkXsBHO8
         p5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779690592; x=1780295392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J+gMWLEMj8dIYBFuFbm1S4Zeb9oR0rkjHmKZnsKAxvI=;
        b=rLAHLivK+phZGGRYAMKuqubdrq5l+Lx50mPHJzD5fNIh9D9fB1nLKr8nPAslH0yhFs
         VJkrmecSX5NyMTtoqDNcnphaQq8KGZ5FbR75IoRnAhIehAwufu2DtkAP8OQ2j1P177HP
         RKM5xli1kFeRnVUXEGjjm9NHHTrRGl8F3DMQZP4oE7YjoJ9LykX5D3RhSGymhSv5AOX4
         WFKbmzyiASuA2jmD90Co1K2TUR0zNxP5cXG136yYSEyPsBmBMjLhw3p45I1WIDyNe6uH
         ZXH0WVgqkIvzBd8FYS5yLxkih87WXB2VcFPzbw2El8CoAzwJBqLUcI3zNc0XsgzXEi9P
         qrtA==
X-Forwarded-Encrypted: i=1; AFNElJ+hTmrPpRXNdS9eie8IK2ijsPPvk2bSqRX2FeKPVH3I/3FgXI1i0hmlUCDsuXA+WmkNsqq/F/8dG6FQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyiPhqgocYuY5hxZ7AXIv7i+mHGyOUpIJms9rLom8u3Jv7JG9Er
	ewtjvpbAe3KIFNSmOWUu/t2Kg3fdXoJEY1gQDvfOmf6QJ+jD8d4uyZHs4ha/ClLkXCj1w5Iqpl7
	BfTPFsGbC9J3U3mt2FUg0jOXvEFdzXefdkIMK8zBWPHwRd6iEd4EBu5gTMyzACFTl
X-Gm-Gg: Acq92OHo72NpBcuWUjWNyV6OeM6jfnsHcg9i4B7+baSnV+aaRweSEH5FNX7TLFk71G7
	NYFsWadVit/yf6kFE6LSeXnxYx5GQzyzzmiWnUyAMKAaZKj3fKpG4+F3qTeHBDXb5v4bTEIB8s7
	jWDMHoCFP3j0rhcQ3PsDKI1YQ0UKmUWv+CR4FfQZjPCT1obWJAasxlEo9L9+yrHAbrQOjhBpCE/
	qaeM8UKnKJ+caWe/f36spfx1RZsUk2r7T1kwo7OZFPXsDb9osXkmUEEg9fL2tSLHre3/jEAjDWt
	yiQ8AEczYT/ivSNz5CWsaBMnftgVf7nUoyEKA7htxF1GUUJmg6lB+f6KzxKVUYLpIv1zSDREwTY
	R1R3gD01fScRvpdn4hqOdGBRXUMBUOyVPqGujm2zxn1pu+WTThc9wAIeKzZc2POToaKOiWWGPfz
	WMsKfW8KU=
X-Received: by 2002:a05:7300:e781:b0:2d9:5cd9:b8ff with SMTP id 5a478bee46e88-3044904e131mr5748001eec.6.1779690592302;
        Sun, 24 May 2026 23:29:52 -0700 (PDT)
X-Received: by 2002:a05:7300:e781:b0:2d9:5cd9:b8ff with SMTP id 5a478bee46e88-3044904e131mr5747986eec.6.1779690591799;
        Sun, 24 May 2026 23:29:51 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045223103bsm6918036eec.16.2026.05.24.23.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 23:29:50 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Sun, 24 May 2026 23:29:44 -0700
Subject: [PATCH 1/3] dt-bindings: firmware: qcom,scm: Document SCM on Maili
 SOC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-maili-soc-binding-v1-1-fdf9f9ff1b23@oss.qualcomm.com>
References: <20260524-maili-soc-binding-v1-0-fdf9f9ff1b23@oss.qualcomm.com>
In-Reply-To: <20260524-maili-soc-binding-v1-0-fdf9f9ff1b23@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779690588; l=1059;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Tva/THzHBTqT2ONF1mJDs2pzgPcet8fzDuKUep33HZE=;
 b=3vNwXJJKk1nnEHXT0Xla8nq2YOM4sL+OikLSLNip6PWNne6oDCAivAGEjH2EY7ExwoX0byuMm
 2hCRR2GwuSdD5I1W+W+bPn7cmI/Ensng3bk0f1aRbzr1kcEd4qKQRKj
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: hnYaU1Mwyu8JjZRx1DRgB3xC61Py7z7J
X-Proofpoint-ORIG-GUID: hnYaU1Mwyu8JjZRx1DRgB3xC61Py7z7J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA2MiBTYWx0ZWRfX3ukvk9aDKtUZ
 BNJNOdCZEaoI8jbHDFyM+qHOPFLG8UGKKifBzO2KFDvAGY00V71dvwEEJoMdfOopgBZC0umj6AH
 LdfcI/QgH6v/LOyMfWDerfptRBkTFVlA2KDmazydJZoajxPdn6jYiovTYk/dryOkX3VUs5Z+zz4
 PD+vZ3qSIttL9odQvbzXqf4yU+Pah/BQRQBCjvXgQ7Eewtxr8HN29FjxVkSO539k40DDaa625Bx
 vgkPAirpy37UMhZEWAgGMCt9A1TmYmKqKMNjaB+j+LYk9WsTrWx1rRfHbl6MpBGlNaCC5+3Rz1Q
 UwU3dRZGWOozKM/j5Pep7/x8xgHCgHDRgrTrNCdYoKoW5mRKCjrtBF17dJILo23E1A43/7sYffI
 0Sbq3svg0dN+N90eBQZ1X8UCcDfoulrAy+ql+8HN5j5SVma6r2amhOZlvzSKP2OIFvQRyylp2cM
 1g/fHDMbp2OzIEWZ3Lw==
X-Authority-Analysis: v=2.4 cv=Do9mPm/+ c=1 sm=1 tr=0 ts=6a13ec61 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ffYJIid-Q94gFHaen9MA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250062

Document SCM compatible for the Qualcomm Maili SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 25f62bacbc91..f344d1390b1b 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -37,6 +37,7 @@ properties:
           - qcom,scm-ipq9574
           - qcom,scm-ipq9650
           - qcom,scm-kaanapali
+          - qcom,scm-maili
           - qcom,scm-mdm9607
           - qcom,scm-milos
           - qcom,scm-msm8226
@@ -212,6 +213,7 @@ allOf:
                 - qcom,scm-eliza
                 - qcom,scm-hawi
                 - qcom,scm-kaanapali
+                - qcom,scm-maili
                 - qcom,scm-milos
                 - qcom,scm-sm8450
                 - qcom,scm-sm8550

-- 
2.34.1

