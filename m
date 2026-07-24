Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E732A41E6A3
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887850; cv=none; b=i57Ww/xcItqlKi/56/cmvxT41p5MAbABL2zTj5+8A5yFDEB3OwSLalsV6gyH85uBIg1NIl92e3JFfBuxGc+xDpN2KIHGi0SjxdzuTcc/TXwdyJ4HeyQib88ea5oRCw8FYA9/5dsFdYiFW9j7nKPDVchXgcoWGdKJs1oLFxTXCcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887850; c=relaxed/simple;
	bh=fvzDiZ67AMugJfYnW8hKFy6ptEIPS5tGSZjlOp7y0GU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QL5AxnOrs6KmaPEjias+bznPxNt6tEq4vwkHI2CQAoySaO9oX4qthyaDpkXrb1p1SJpp5cfaNbBmF8Lac6tL0iu0PojkXB4o3ePQqzGoIrPeBSIIxDzf1VFLpum1PQjxy7XI1tcUL0y0iLWVc9VIq2j+3rYygkJrVrlmhK1RBbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W8LWvKK0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=feBsA63h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W8LWvKK0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="feBsA63h"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O9MQt02755247
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qmzQ69Ie4mcQOk1JreV97QpBgdyvfWbFuRHTnab1d4E=; b=W8LWvKK0GKLFeJHY
	5KIpik7G53TDgRM52e203OR01qr3TYzjswRCc+VrgAP2hl0vUfrvncAKJ2v4nT87
	j6FIOqS1oF/tgG7z00BU9tev33Te5viSYF6Nhqrf61s1ehYaM5P9PfXRVFzLytHv
	B1ER+NiHCC0XTXb7VjBe0pUGoP94VyezHvf7hU5XIwwthvH5a0XEdnaZvCU0gNuk
	Cq7GN2ZB/tiPztOEiMLToYon24YwI/kx6KMzg4zgIBlhHWwwgcmpaC6U/xrGFfVZ
	eFgtOL3/M2+0vhDLK8kF7S433jxwdGqubBdEjJlVgMDzJ+FhHurNLy6MEP+P7Bw1
	tmks5Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5byr5vm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:10:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cee1ec30f2so3887425ad.3
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 03:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784887845; x=1785492645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qmzQ69Ie4mcQOk1JreV97QpBgdyvfWbFuRHTnab1d4E=;
        b=feBsA63h7M1p5Q1ZJok/66VxC8t+IYiY+mxjYC3JT+ZM7BVcbKiG4/EaoggTScUDRF
         wAqSu8wrs+NeTDhQCcPnvwvH9DA61dJ+mZHuKdT9roIFCrrSfHBIdbetyziZDFXkc6rk
         lJQQvPEU4E4WLpns97XzLeyAvSnRl2uXUxDP1vwUNXtL7CLe3m2oSY6+RX4QvqT1DA+r
         g+uQVpzNeBiDEQWMWhnzTKiyTE6NIunTah/2rRvj7c/TygDdpu0gAuIOHeXgsW44o6vO
         IgCzwdNp/zUz7ECYPq35yL+puFrkBZQo04Il1BWAjuhZfCsMjqZ+YIVG80G1RGLSYd+E
         u9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784887845; x=1785492645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qmzQ69Ie4mcQOk1JreV97QpBgdyvfWbFuRHTnab1d4E=;
        b=RLcgwd++E4ff8qi3ZQOqleALimFCK4+u8dSo4d6cGF9dYh8XsIvq7nKFp4bbYWSwv4
         q6Fm03q06uU45tWNQuiiQG9J/xT2HH2huV4aDDM1KovOiogfSnsFsreJP62xsJgy04KQ
         MbbdQwEHzTqajg+T0VlALffF5UhoQ5V9GKJ5k7ewi5ixmOh2MONVvrad7diVSykZVA8a
         PHxTVmlqVUL2kujkhjGtUDRi96TYdhnCLa03DqxY1LYr17V+YnF+648PTdggzAjvbQiR
         3Tr9NCVsXSwvG5s89Y4RkdnDFQNdIrD2ZJEvs4H87Z6emEFE5ngEUHBe9lvcZ3BVwPya
         rB9w==
X-Forwarded-Encrypted: i=1; AHgh+Ro7JJA8lwmJxGhA6ZmbuhwxKq4nd8yjMimWU0Pdctg+mGWM16r3cSf0hFCa9+VZQVQeGb76EwbYzIxy@vger.kernel.org
X-Gm-Message-State: AOJu0YwPzBaFzJLCbFjU82wv/uzkBUzY1SbMLaUC8YL3nwz4zT7GItED
	aD4lbN7F2FvUHzUl1lGC7miKPrnCJOP/sZ3CXwHGRhcd5eC7ugggHLac0CxBdWBauVJD/aD4L86
	yF8virF1++4Xdj1+CK6MrhRAALfFMADupXx4wIsr3VXCQm5079EGegKpcIbtkWn2s
X-Gm-Gg: AR+sD13PWkkAAK1FXonh0Wv2CCU0plGHbiDVD9hgyAPBjRrT0CAVv8TNM+MzGa6Fcow
	jSQpLd91pLAeArWhc3tJCdhfhe0jJGk8dI7kuW7XB0bygysTCwiLLCx0M9rKtRvuXoJdukLufaZ
	GSHjSpkryCMuVMtbFThOLnidvQgM9DYcaRnvOdKQUj6lpn9L8JeSfsOYS7rvmM0o+Cl5V+orUsz
	1wMtVd+GfYC3klqAKBYVV+bNjNBdQnNulgAT1zH7gPUdSxzwFJFM7p0YaJTghT9gai4+u/1ASvy
	dpmH9puax568l69suUw1d5YO6uGq0fe7/PJSlKBwbulSe4EJ+0DIapktBA7SPTX8KiM9K0us29/
	utYCrv9i6EMTm/12enacYE4LQ
X-Received: by 2002:a17:903:1b07:b0:2cf:4505:6bcf with SMTP id d9443c01a7336-2cfa6c54aefmr80414035ad.29.1784887845429;
        Fri, 24 Jul 2026 03:10:45 -0700 (PDT)
X-Received: by 2002:a17:903:1b07:b0:2cf:4505:6bcf with SMTP id d9443c01a7336-2cfa6c54aefmr80413725ad.29.1784887844998;
        Fri, 24 Jul 2026 03:10:44 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f390dd2sm47863705ad.79.2026.07.24.03.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:10:44 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 15:40:13 +0530
Subject: [PATCH v3 5/5] dt-bindings: mailbox: qcom: Document Maili CPUCP
 mailbox controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-maili_initial_clock-v3-5-45b577241c91@oss.qualcomm.com>
References: <20260724-maili_initial_clock-v3-0-45b577241c91@oss.qualcomm.com>
In-Reply-To: <20260724-maili_initial_clock-v3-0-45b577241c91@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: uMI2O-LGLf4XIBUuStU03Tlj7W5vC316
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfXyNOxBCaYy8dp
 h5ctzDglMw9DaaNgUrtCwviJc8Xgfoo8Tw5GmGNA19O601WNssd99Z3iNHoP+MAWgJn2PwkW17N
 NUReoqcKntUUxMdo6aPpwC2vd7nfucI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfX/NH0J2DZbk8E
 ATWrOniijjBKMeCm6YdRfhyblgbDrnQtoEgoSRRO7RLFfxKUBNusEn5tQz3s389HLDwsiv//P6q
 3y36pNnG/UgB8Mp5QWM2N50nuv3D8CMy40O5gSGpiS6eL1twg6Ah4lOz3NMX1q/SHDiVa6QOzQ8
 cT+JrZcaE2PGcPSt2FXzCfG9foPJryfzH0PZrJ3racqPwo+V8s42ewWTMaMd3SobejrwVIlT0R8
 IRbarSJYbx1eDz+1lUAzROYgo/2TRKn1QhIYuC6qfAVP228YGf25u9CqvmObpKgN1ttnOvL4Xc6
 rz8q27sNCDkC4YnsxzUYAFoxwEhA8TJCixn6IMsHGC3rchiTPoDl1cxvnnshl+7jcKxpatzGgFK
 YYvgSLUEUfUe6oyrdHBFfMLfA7jWibN/KIeO5nzJzu2XanOICcDk4Nop/Nkznnxu/J1Dbcxu74o
 FH44TLFw+cou5w8f5bQ==
X-Proofpoint-GUID: uMI2O-LGLf4XIBUuStU03Tlj7W5vC316
X-Authority-Analysis: v=2.4 cv=GMA41ONK c=1 sm=1 tr=0 ts=6a633a26 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=5FXc3QUEpXE_4WiDhFYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240092

Document the CPU Control Processor (CPUCP) mailbox controller for the
Qualcomm Maili SoC. It is software compatible with the X1E80100 CPUCP
mailbox controller and uses it as a fallback compatible string.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
index 03359479d926a623c467f1b8ba857d787366d411..2185920e1b5d2154a23b67905106f35e0b71eee9 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
@@ -21,6 +21,7 @@ properties:
               - qcom,glymur-cpucp-mbox
               - qcom,hawi-cpucp-mbox
               - qcom,kaanapali-cpucp-mbox
+              - qcom,maili-cpucp-mbox
               - qcom,nord-cpucp-mbox
               - qcom,sm8750-cpucp-mbox
           - const: qcom,x1e80100-cpucp-mbox

-- 
2.34.1

