Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC565384233
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 08:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992044; cv=none; b=V+dHbjihfzuLCH0CEpZhIgKvWm9X2Tei5M5nkED/RkSH6PdXq9Wu+GSytfTLxdV4DQFRv3QqSSTWoD9RdnW8YrpU7VtQXFZhfsCJxNWYrpM4Kyw4j495ZcRYhQ/WSsxgNYDbT2hgaU5l5fxhrZ7V/lVhjL6ynboaKe6mQ9Bc2rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992044; c=relaxed/simple;
	bh=kbRwuQ9nZ2E+SCI71TauiFrCt/9q8ASgqi1sojHFVAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sg+N2F/PZQWY5da55lxPQ+v8cWo/BMG1+L9u/wdwbHWa8wJe6O/MmB207de6eDKkTiNrD7dH5lsEmvxCDd0mY53qZCKL00cfVhOJA2DoI13zWWG2umGZL1ZUTGTE4BjQY0MsOB8M+gXi0XZrd0PKLDKVcyvA1SbIZmpQL2ld2aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VbxeN0sF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bmXYqtt0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VbxeN0sF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bmXYqtt0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rtPA1587565
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 08:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JPjkYIgd6uBVjiXZO+qeuxFAyB9wTKc5Tj3EFD8yRO8=; b=VbxeN0sFMOtHB1kL
	64AnNv3LRu1Rw+29V/UB6grT9xkhjeyqAnGkY5jd182sNKvcUis2yFjt/a/cDD6W
	ShcLNryovNwsjIo+FAs5oSP9ClJLW+6gymN4D2iAD6N/M1xYtc4fRJRbxdKq28h0
	aAUds510ROaMg+YSxQXR4xUBanUEFI6VUfKmA3rEosjg3fgXTFQ0EIa9sg9vTk+z
	g8NUnpx9jEtEGULP1UYS89Leh0aCoxi2ikmqwLfMIhvzmR96vARlhmvMPWqZ2K80
	e87QA55Qkm0g3PqdcdIK0vcAyK5Wg0CePGZH/UOgE7fPUo1bAQn89N9tq/PLf+qY
	JwhQJA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enw5m4rcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 08:00:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5177b8def69so111758701cf.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 01:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780992042; x=1781596842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPjkYIgd6uBVjiXZO+qeuxFAyB9wTKc5Tj3EFD8yRO8=;
        b=bmXYqtt09LbShT/T/PdTNwhEAdikR6z28k8ckuKzMTEtNa5cbTnuxmv+BTxld8gds0
         0DA+xBgpzjPLFUbrw6bv35sIbRTPvBhbOsNkLvWYIr+fBu7MavLvqF5cdYHIIWGttFxo
         0U+pf1Hzxlk4qFD0dJ0NUnB5WOplMmG8kViKX4xGa/GeopBwpZQDPe0FPBah3VxtWeMs
         9+QWNdzIOzJGp0oLXdicGib4ay30jYsHBDSivyl6+5cnyAdjSp3Up6lVroNfMEEd59aj
         du0AOJuKbpPgWzKsApXdAvZtMNTiojvRoac0eBVrt7tCqGrtUmaGUN/2K5WH2k2ZSgcN
         iS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780992042; x=1781596842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JPjkYIgd6uBVjiXZO+qeuxFAyB9wTKc5Tj3EFD8yRO8=;
        b=ntZgmAhRixYEy3P7wGTnVOXVNBa0SHW9pK0H226cf35S07C2WAz05XFvX+ozB+LhTT
         VzdnejDmor99TvFR2owoJKA0bHxztZfZzv89WrdjI8dyyaAUpB1jFDRLpoa+Kv9lcuS+
         haoe1w3rrYCNHmJ9wzvlYg4MBz5/DmzAHP0ROlKpDwai2FQ5sglmqWLW0Tp0z0W2J+nu
         NCtITpiQa+WPpq3xh1v6xwVRoRmpLKqBQQJT/mTPzU/cdoXQKC2mxDTIcnnrXLaJraRe
         JyQ65xj7sBvPrYnZu3ZMms24Oxl0aSIiLYVZObCa7s5f/xQa3ejLWLns2pBbTl78zBju
         uQGQ==
X-Forwarded-Encrypted: i=1; AFNElJ9FsVX1t10IFw7VPHzqU7g0FGxEKfJNDz29mKEhDGXxZATZCz1Yl9tvHAsQHlD0PzZWfds4EWTf47xt@vger.kernel.org
X-Gm-Message-State: AOJu0YwB3oL9e41imJUTil8c8z21NVGjJ/n3YdOOPfpLcuultDRyv5uU
	P0dN5uMN6cWba3jiKKykmGEJSARsR76nxVuMs0ezK1kCNrNZDA/XEsj2tRvmZeDokVMM/jpgayk
	Mt/YQ0qHocnBJB7cREakaMKtUxTrqTXUxOja8hNYrS5UizpnRGdy4z1soCbOMin4K
X-Gm-Gg: Acq92OF5tKOgrNZMX/0dYFjoZLaXS/pDbm9v+JjlPFwEUZMggLtLsy5r1RRDPLqezBm
	GwNmyhdOs8/GCBwrs1iViyACla7y/eeBMbG0d1GDtHhbQOi3T6vBoNLB3PJr/yaQnT+9kT4Dhdp
	q63Z8N7Zjs/qO6Ka0dNtEcE8cJX+noGSPSPYe0CTJ8MkT2Za1MU5vHINJc3QyzUzv0iWZVSaMIm
	ORGvu0jer4Q+Pl8n2b6H3K55N8h3Vb+sft8G51PXpYTEdnJDaq/be/OKE97Pxf+J5A/2KvwQTFq
	RQb4mUWltagpCLYYR31UGKWZyodKdGjVo1OjAGk0JhzUSoklvzcxvlKI/2Gt9U9Mp+jWNlILoLj
	RiC3nzKIPW9ZXi27TGXl38OEerZAcn1QpHlLo
X-Received: by 2002:a05:622a:4087:b0:517:8f2e:5d84 with SMTP id d75a77b69052e-51795a82bc1mr278415481cf.3.1780992041950;
        Tue, 09 Jun 2026 01:00:41 -0700 (PDT)
X-Received: by 2002:a05:622a:4087:b0:517:8f2e:5d84 with SMTP id d75a77b69052e-51795a82bc1mr278414211cf.3.1780992041273;
        Tue, 09 Jun 2026 01:00:41 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35fb24sm63605930f8f.34.2026.06.09.01.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:00:40 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 11:00:17 +0300
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: Document Eliza CQS SoM and
 its EVK board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-eliza-dts-qcs-evk-v3-1-b4e9b033a6dc@oss.qualcomm.com>
References: <20260609-eliza-dts-qcs-evk-v3-0-b4e9b033a6dc@oss.qualcomm.com>
In-Reply-To: <20260609-eliza-dts-qcs-evk-v3-0-b4e9b033a6dc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1104;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=kbRwuQ9nZ2E+SCI71TauiFrCt/9q8ASgqi1sojHFVAA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqJ8gh3TRIa3bX2f/KI6d+UqzM/18d9yHsx8rb+
 //D+k0V/U6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaifIIQAKCRAbX0TJAJUV
 VgXWD/sFKc2yMInHC8MyDVv8FuDeQ9OYPKQ/pMJnBXmeN8rnsK51koqNsGedPTjT8Gxej46UgBV
 OpOLvMZcP2vBDbC+xlLoWlnE1HvrhRwXWbLEwmxk3gP0bjurcfuLUVqxnAz8uuV+iL/buH+3th2
 fl4uXEO2tT9TWLnKTk7PyQ+b/Fp6PHCjDunujk+lI6SKu6S1/SeO6Cf8AQGOCZRC6GsMk8wo3T7
 FjU+6gTdRiJx0xZqgyPRFqQIHyI7N25PWBwZpB7ryysX0WSPmReaAA/sTg81jyQHSaR0zb9pByV
 kcQpxwpxtcWeNM+vjjXvOhxP1S/n5kLiAUBgKn++x5M6hcbj8DGC14eJPzpQW8MjQMLHy/qgMAG
 rl/7s8Ts7HgRN4yO2xvjmwQMFHQoeH2Rju5gbS/4nQuFmP0Bvqst6El9vsTo357eZR3fHIEv02R
 YI64s/Swt2IyLu9BENOm8fZT0VTvLklQHQJZ1YXm8sG+9vTX74YxcnDypIjr05Yo03s0vlebh0B
 WuWmER3yVgryIrwPL2TD/BUyf8tBCTovQptTo3/dEEMzv8AM5kOFKovX0lK78qQEpo280EQHVGJ
 nBdGWdbFxu5y/JHlZO54Cj9rtjgTcW4p4uNPQkl7yweuEglt7S69XiC0YhkrlbwQCF3UzBOXWQR
 ZkECsRbBJB7Vc8A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3NSBTYWx0ZWRfX2uhV+VVNvkuE
 u2bA/pcYQ5sGfWUjKglHjJ5ixyD00CL0483APG2oqi6QHQCR0Z9VDN1PhTSsbHHFQzmKLphJLPr
 2MB84DATsVrglLKMD1XS5h6orD0fBnnUBAokxErm7XH1SsVKm4k/Ba4H/4BQ84Vp8+2x+2cmGri
 H70q6enFMIOyav8Hr8bshnUj8Xe4uV80GEIZ3yt3ngDawSuklIN8z11CpGzooRq2Lvp7e9XBAkZ
 pFXPOuO2zxHPl+EXUjX3/5I4Z+R/mwfMAb6cf0R9T/gtj5FSn4R42vvRxi2ESLxHNnPItB9Zw9l
 vzOqW/Q6bjQ0wyZaeLQpiXcL5xlIXLwoqslfSuIM0foYQ/EfMFLTY6wLIeYsjxxpKt7a3715u7P
 ahhiWvUic/06lULe4q3h55TLuwpq71cH8l58VpgEgVDHKHi5Mxw7iNCjX5aZ8DRCgmOgOhmH7hH
 zgA0uJvddQROI63HE0A==
X-Proofpoint-ORIG-GUID: zdRFgG14PVw0xo2OPBBdbmYZexezvR4a
X-Authority-Analysis: v=2.4 cv=UptT8ewB c=1 sm=1 tr=0 ts=6a27c82b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=BSZ3G9h0/EKbgBlQZBbU/w==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=oLJjFz4unEmQByRrzroA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: zdRFgG14PVw0xo2OPBBdbmYZexezvR4a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090075

Document the compatible strings for the Qualcomm Eliza CQS
System-on-Module (SoM) and its EVK board.

The SoM is populated with a CQ7790S Eliza variant, PMICs, LPDDR and
eMMC. The SoM is then connected to the EVK base board, which provides
a multitude of connectors for peripherals.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..bf7df33c1da8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -61,6 +61,11 @@ properties:
               - qcom,apq8084-sbc
           - const: qcom,apq8084
 
+      - items:
+          - const: qcom,eliza-cqs-evk
+          - const: qcom,eliza-cqs-som
+          - const: qcom,eliza
+
       - items:
           - enum:
               - qcom,eliza-mtp

-- 
2.54.0

