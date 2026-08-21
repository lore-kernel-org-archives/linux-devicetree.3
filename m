Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25DE4C9568
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 16:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328677; cv=none; b=WxTDJvqWwBxc+YjIbOQ6NT1uLf9/AM8+Ly80Gw2sS5ahz3wQ+/I5M7/tTGoveDh+c4VBDNtcCJ9vR/X59WRUMJGwJ0xGsNwnaEonGhLN81SzS9kVsFxdk2/gWlPjOJj653Onp9yHrHh/9keMuCRNzYcn/M5mhjVC+7WC4J2SIw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328677; c=relaxed/simple;
	bh=9JHmO47xFcHiKwRcWRppqe+FIDEC/EmRY/1PhD8wx0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ThGGvFWEuqBXF1xIFS/cNSy0MaAn4GjhROF6b5f2TV4mo/OpVhbl1bio7dOP5hPyrhoRhDqXD4QShJFwNNkIOPzycoceSeaoHt116PnOs3gJzGBCf4b9Tlqisog3+xhBYDRPafLwJjzwJ4F7nzknt07RPo6eZeb4kioKUIE+OmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d9XAmLb2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cDZBAIUB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d9XAmLb2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cDZBAIUB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFm9Cs2832691
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 16:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=; b=d9XAmLb2d3tEemEY
	/SV0V+IgeXry0mDhpnxfXqW1JuUmV9keyxYmh2XiCUi7KJ1FHXQcEfrPWSo0cwv7
	3vu+37Q2Vzu5+aZnKCitDbG2XLn7Mu9tONdEPOv8C/NARtsoc6Sp5UclXYAKep+B
	Hhp/D+/Z5TpHpiBNJf58LQMV37uLM5NKNFx/PMKRAMETckK7W/JuYzELNhatVZsJ
	QSvk7ofCY16GqUI323X4Dlpeu0n34jtuj4ezj3RbQuj7L2XLxaDEy70Z1pMWB0x0
	C1kHPl7BWWggG9Fhf9PVozA/NZay7YJ/atuBya/jXZXKuwLQ+B7BlrrGvgovpYAB
	dvx+pA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6cdsk5sj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 16:11:15 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b28db3a47aso2156924b6e.2
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 09:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328674; x=1787933474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=;
        b=cDZBAIUBgqxl4HxOqUuLwg8GfBYw2hWub2BwpvMWVMr6jRJKQViVXctVUaF6+bXusE
         B+++cTuJqx+UQXRoaCA+QksMNtq89OePM+ilox8t5wcBUpxMMYE4czESAVW/owBoLU9u
         wVDPQc8csS0eGOqPsUEw/dGH+fHdgGOZUV/XYru+b6aPvUeolW8VPU0Y1zj1dV/EKfU2
         ZWYk2+xmSvjaTWPmfphV2B4xdYLw+zI9NK3R2A6ZY5aaU7H4VUDZJsSRLPYzliAQYzQj
         XaVTo0Sy/QzzOu7PcVaECvvZbsssas7sshpdhv0chOmbJyL0S+aQqjyb24sKFI/6lRpy
         yIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328674; x=1787933474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=;
        b=J9rPMGXa+PvMN36D7yT6pWw+li4RRERV6CKHBFuOQuUaaRVdQIMMdcEGcGXlvHEGdD
         FgzqdbxiYz0BfvN5grbcC0b9B3pTLa3qwZUdCecFZsq2pb5v96k7kUzVB7tDU1GO9Rwt
         sAUZWVIxVd9kAeKIhfnHDQZBzKiHGnE38MFjCVkPCTfvA/T8rBbk69ArFRRUU0/qc2oD
         hqAW3pHUM2cswceTGDPhi4+5VgY/hgBeT3xLFrnzHivVDyhw4pgKKwHDR3xPg1nwXH1h
         u6N0TCHxqXp/Q7p/QiLkytoUc3K7CvcyM5VMtta+kr6ophGMX1V59oRsAw1duQnrvz1p
         +WXQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZMfkCiH5OV0TCtelX+vQ3IeXfx0jKicUrdMGmq+XE4FMoFTI/Zozb3mzWWMXASDBOoSn/kXb4zJuA@vger.kernel.org
X-Gm-Message-State: AOJu0YyHY/lhT98fvYHFz2+vOZIgMBFblYt3D1Sx7JsDem7IpClwF+Rf
	u5QU2GLPMa/Eo2Ve+DL8YiRXdA6quWGHLWaFAsvk3pvukSARbIhz5/OUzhkZ+sHLMTjf2gbsg6B
	6JBBZpo3QmEbD7B/84T2KM9JjlvL7ez1VpslMpf0hJfI24ObikpZaSiJ5XQk2OYpG
X-Gm-Gg: AR+sD12PXQ7QmktJqiUGeahYSKSLJYv8Ux0Xl0K7d02Xge+qOTAD0pj9p5fWRm1KajF
	riKQGV5p9OrPCDZd+be7w+FSUNb3L69cyS5pKN6TpoJ/y440RwBEevDWshg6CYkghv+O2dijiZI
	bS9sxF/3ywdW01X10NoxB9CwKNLa4JktWOAVD5D4i24Pr1aPaC0rzF62Zcs37oam705Bl/shiCO
	liGFgbN68jdvsZFjv84KSht79PGuoZ8FoNKFaS5D2zBJHcI803l0vsDHT79V62MfN1EXoIQPHwD
	gW1r3JioRHVVvNx2Ljla26mTuV4sUVA9zZXEbyGRfptNvESzaNsvK/6kklPSxayTReoRFedrzJO
	1P9XTU95FM+j2uItgDXgVBfbtuD1HwN2yboNnKU6XWONWHzvy3Ng14EfMLS+9zwou+1CYfqSlVu
	B1rhd/XkP4I7VIfzAv0/9tOz4=
X-Received: by 2002:a05:6808:d46:b0:4a3:26e5:cc02 with SMTP id 5614622812f47-4b2ef33a94amr7457123b6e.10.1787328674356;
        Fri, 21 Aug 2026 09:11:14 -0700 (PDT)
X-Received: by 2002:a05:6808:d46:b0:4a3:26e5:cc02 with SMTP id 5614622812f47-4b2ef33a94amr7457022b6e.10.1787328673861;
        Fri, 21 Aug 2026 09:11:13 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:11:13 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:39:06 +0530
Subject: [PATCH v3 13/15] dt-bindings: firmware: qcom,scm: Document SCM on
 Kuno SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-13-196e2b306368@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
In-Reply-To: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=871;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=9JHmO47xFcHiKwRcWRppqe+FIDEC/EmRY/1PhD8wx0w=;
 b=Ag3di3btT/XFPjezWsEE6sVb9FnCj3hpe8zj0J0Q0SOouAab1EOy4dpmgGa+2+2q7vu1xOsD6
 WyI4wCSjoG1D/AfPoIgDEjP9SKXjtAhxL2dv3aPIUrCAfJUfwsb3ZKm
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-ORIG-GUID: cEHIkK5Cfncf4OUtXRCRBvAgEWdVrrur
X-Proofpoint-GUID: cEHIkK5Cfncf4OUtXRCRBvAgEWdVrrur
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX/4LT7OBzy2sh
 viKZMGsfWwlouafp9YKnXJhFZOC/alcLokX9FkyaeVuUZ3mR801z0IwxCZTmyWnQCe71cS0gOZW
 8XfCgxbKnz3vQ2fsXsPlnlQ7qnKJ4P8=
X-Authority-Analysis: v=2.4 cv=RN2D2Yi+ c=1 sm=1 tr=0 ts=6a8878a3 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=M4Tw70yJP9P6qS8g1QAA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX+VsaKgP5JWgE
 CESnu2Tt65phGox73TgD9f0PELlrBsGjdMq2esNbXeq7mmOgjIh9ephA3gXsXdAEGdzecs/+FW7
 o2gJZHzXpJ4fMmn4Dx6FOgP3I+FgvYnqkupnNLSzP4qdkmd7EjAS91uecIBRVxMx6ChwNvv8qF/
 O9lGi5rAKU9BS55u9bBz9515vrhKZkMEOeZo2/bGx9FpDWTh+MoC4kDs7doEo1D3M/3sVZxioEc
 tKOnhuYqNhIXVa88qIk0eiLZcJKxELXHIP7TSwosv4I0JyqJ70On6v75y9bOBzwKE/doMOv6ZPD
 oS9Foy4lpAXPqmz+L7yQNenY9/WXUH3mSFJHHznX4FINjHh0CwBf0pa2iB/kaOmz+IimHOCr4Tk
 EpWMl2cULZsfb70qOS9ZgP7jH2kbLQG32vojAUg+C1anE21PA3nEO+lQomImMccKm0lGSzHHchX
 BW8khzo1oBN0CaqHCpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210126

Document the SCM firmware interface found on the Qualcomm Kuno SoC.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 037d4ad8f718..ecee5aef65a7 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -37,6 +37,7 @@ properties:
           - qcom,scm-ipq9574
           - qcom,scm-ipq9650
           - qcom,scm-kaanapali
+          - qcom,scm-kuno
           - qcom,scm-maili
           - qcom,scm-mdm9607
           - qcom,scm-milos

-- 
2.43.0

