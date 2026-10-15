Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229A73DAABC
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031910; cv=none; b=WwkWT7Tjv4qhCFCrX/Yd8VHG4gRm2Wq23n7/wQPedn1GxYQ6SSZlVe9urVvWD71jDCEo9zsv69DXhukkytqSCyUsfCLdwq4JyWmx9/74Dls0D15Ups6dovjMXMKIamNpbuGM7mQPchK16Re9BsehFNrZawgmRC2FGyD+vKEakik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031910; c=relaxed/simple;
	bh=HHPIAlbg5SKE7ocM9rxmM6Nc1vEe/Zllp1Iqlj02bko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JvFgQDCODQKgQegzTrGsE7Todhl8km5dZo9lhXi8au1n6YAsfhDph7lKvZt1BS8vfE8O0a42fmXU4jNCxJkFbehJ5GAQTXUppY/OCB5m9FMTRG0EIiOhBzYLaLEYuPFCAGu3L8E9XvzAF7ebnLErCcSj7VodlmDE6dD2df+PF7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=igv5waIW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CeDfzKnD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="igv5waIW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CeDfzKnD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ENQ1RK584290
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rshGCVxoKqS
	MWDYYkngC+6rUP5x1+nGoCJ7kwc1Id3c=; b=igv5waIWSzr/dyQ5pCLveDd/vD7
	PRxC0g08gEPPTPmCLOAWQbZ8e3aXSN2Vnpw1tYeib1X54wyvzI0DRHlSVsVEQ8Qg
	kPYnDwu1eeJVcNV8btRavd8Yo1LVhjcONRG5TmLyc7ojrjcr0say6wDvu+Tc6BQT
	8PT00HsHj555rBa2BbWvqjHEm1i6u2g6+LhYUkwDYtOpHvAFKGPEeEa8vgSc3Wzc
	HQB0t57WIJL+vGs3lGOEJeAaUzlK1P8hdusMDrYIfIBZL5wJ+gvf+EB6Z/ycYjgf
	98kfoZ1q5MMYTzQRf2uFI3Ag/kVTs32RyM5OxZGjUYY1xJxUXIXd4Z+0Bdg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakderj53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:38:23 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c3c370b17so4979366eec.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 19:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792031903; x=1792636703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rshGCVxoKqSMWDYYkngC+6rUP5x1+nGoCJ7kwc1Id3c=;
        b=CeDfzKnDWyuOhJfHDIBfVi/P+B6pLvyzzw+bKcLwBIYRpP+0WQztxp0di0A0BCqqwb
         5FUo8hJslhfKWDImlIFQQdud/Rr70KppOlQP7UMkj3u9aar0smBz8kwc/f9MEaAmNM4X
         g972Cn9oPZt/tH7YdbfgZj7aj0Li2BVxoZu0PU0akttBiKGlwVvWTnLMmDop05omJHkH
         OEkw8lakzpgkUMB8hE5r8doqCBETFRG0wsEwznKWy130EmIc2j1zkQAJu6VMYE0ByURE
         aIRR9T3LIj7J02E2HZc8SjlSj1Z/eZKrQrME1X+0Ma177nr3FhaDRAIb+Y1gdwKVZLpx
         7esQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792031903; x=1792636703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rshGCVxoKqSMWDYYkngC+6rUP5x1+nGoCJ7kwc1Id3c=;
        b=RoKyuUCKns3lJ2PBR6mCXJ2ELD3SPhilhQ4GZTQUo12twhO0gquvwU5wJq8YvVdRlx
         7oby2uvX4vwzO7dINHOqNI1RIIHxDPRAJHL/xJQWSi8H5Oo/nd60QABMQhrwhvPj4Ufb
         8M5XmVuxnuBn2AxCFebvdpbci7kwJyYDXZUqH1eaSK0ceKZ85d9fTckSBIZp7bb0nPJb
         DbbFYEJFX2VtMESyiSODNFqYhedqy0XhAtvEygKkhfjPgOcWjS18F4UcXdAcghOfRy9u
         QwPI9ovYPIF5ZTHU8tkJvl2UW85ESTYrmSJICgy6Ki8uGdHMw7vEgrX8VQLlKI/eVNtS
         OHfg==
X-Forwarded-Encrypted: i=1; AKwUvBzTvDdI3/mVDWcPlXprW7MOslf27eQdf7J4IxfQr618Ov9b4HWK4Rg5WK6PlZhKMnwsAR+E6MS3OHyB@vger.kernel.org
X-Gm-Message-State: AFq9FYLwhHxalohOfzvxha9Jrs9KLKjTtM98AbTkYj8BgHU3z0D5nKQC
	evHtcSSWyqi2AOmoIRW+6oijTPd/BqIbijXF0H658yjc+GTR2PQ/8SaMRVZl8+HLuJiMGrgI0SL
	tXpkkV4biOnIRNX2CmadU0XaSqc3r2TUQ1ZjWoLadKs4HsZkHCRS5RSj+taRYtHGk
X-Gm-Gg: AYBFou35FLZpLQ8rKO7dr5etjZdqrUu2QbFDCutfpxxcexi2/1jmUeI6T1K0ec6MO3N
	ZzfQyIv9Tm9CDGCq6AHBYz+V4Ulp+2XBfGcoCLBNEJ6zX8lhDtDt/uIIJXUziMbthfu4F/ww42C
	erXELSQcsdyIreKyw/uJK7wmhw88I0j88Dc2uUijqKPNvrqs8fu9+M1ahd0FKdewk8eKzHDTjUH
	ghvw6dBdufeXlHFzftkeUKVzOC0vSCIC3ZCThAj1Z3DW5GvTklituv+S+nCqL9KGDXYSW1blkmb
	G7RTzqFU/qbqV/r/MGM7UiaLfaexZs/XV/4R7TDGUwoVfNOu75zSqF3NGsCO0QdjqLci3u9X556
	3+Soa+1z+RRnI/mDY114backObqGkoAT6/uN1OY34jCpeV11CjcTKoScNcpQ=
X-Received: by 2002:a05:701b:2806:b0:169:3706:d61b with SMTP id a92af1059eb24-16a5dbfddfdmr23595134c88.16.1792031902696;
        Wed, 14 Oct 2026 19:38:22 -0700 (PDT)
X-Received: by 2002:a05:701b:2806:b0:169:3706:d61b with SMTP id a92af1059eb24-16a5dbfddfdmr23595098c88.16.1792031902051;
        Wed, 14 Oct 2026 19:38:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a42407e7sm51217017c88.15.2026.10.14.19.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:38:21 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nikunj Kela <quic_nkela@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 6/7] dt-bindings: arm: qcom: add SA8255p Ride board
Date: Thu, 15 Oct 2026 10:37:10 +0800
Message-ID: <20261015023711.721837-7-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad03c9f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=uytbUiI1na4GE1GmpowA:9
 a=PxkB5W3o20Ba91AHUih5:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 1iXDh-H60_DWp6XLnZFUO79StdJcWCTB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxMCBTYWx0ZWRfX/Vh2PPg+UPZ2
 uIw4tjH7jkb7oCqgzckk97r/0ypS/SBos9It3CeCcDvBiZa+TNzq7fYDakDYxAsHFJ9lj+CqyLP
 dL3F+2MOrSnBVQbsE/5eZzmg6008WZ2OIui0GwaFJYp9Z0Ch2mBqhnPqEl9fkxvIE0naNqWlcVI
 mlVJXHs3Jw3M6o6h/FBogqwW7JV3ezdv/qPEHwco8oFqk6/2PWpNnD1fMpsb9/CmWw1sS2Agp4H
 5X0dABQzwMokZkGNQrn45t3oKLeZzXBoCHjPnXfoAYYsrVdCVeiVC942Bgkqv/F4RALLLDFq79k
 XPQoHW514yKMhDdeor/n3YlssBVBDyxfsRGhh1Vh1C+tPeCa4tx2GgC+2IG+F9E0DgD45FCrGPw
 EKW+ruLHg7bialEFkLeSkE81tOl10UwvwHt/aEyUeaFYsy2x8Bk2zvUU8H/INzDVSLM2ZiIUNwr
 TzqtryXiTVjckG/NwVw==
X-Proofpoint-GUID: 1iXDh-H60_DWp6XLnZFUO79StdJcWCTB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxMCBTYWx0ZWRfXyHsqkp9rFnbo
 MoR8AK2ApHcxMzWYTVohbP7xxKamkbzi16fkGLjq8XB5N0dci1QO4D74PmYiVA1wXycR3qIAFhO
 L2qo/BCNwyHkB7iHuydxWE47HgEYtwk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150010

From: Nikunj Kela <quic_nkela@quicinc.com>

Document the SA8255p SoC and its reference board: sa8255p-ride.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..415567b085db 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -490,6 +490,11 @@ properties:
               - qcom,sa8155p-adp
           - const: qcom,sa8155p
 
+      - items:
+          - enum:
+              - qcom,sa8255p-ride
+          - const: qcom,sa8255p
+
       - items:
           - enum:
               - qcom,sa8295p-adp
-- 
2.43.0

