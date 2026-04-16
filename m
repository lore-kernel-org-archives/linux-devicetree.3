Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBB237C924
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 12:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776342390; cv=none; b=ENidVe3BR9mKeqADaoop2HVUXwNPPk+OAvmg+6IOJAqYexL0tK2awo4aNqTYii+fxFpDjPJhst4OqH2W8qreyuVdyU05XJBfNSWomwUN1tgXhOvISUGzC7uEy3HErtO3rplfybP9ndMXNH4S3QczL2ZDzgguKCsUzCQ8G3W9lm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776342390; c=relaxed/simple;
	bh=kXFqwZQtEIRJmlBlrnV4mxUyArN/uKPldKW5VZ93Esk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JRXsKuKKu7VzmYOouuGbUG/Tz9bJ7YoXBLmoCq1E7WT7JjFqMf6ccwr3GHevvtfauO3fjYO50GRu/4SkYlhM7fLggTnAVwh+SjPzL7pTdMpwFNbIXBga/LgqTVLmHU9mrtrzXWA2+AgepD/24xK67eyxLggAbPYl6gX84XLypcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NSxahPMD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S/5LhsV9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NSxahPMD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S/5LhsV9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8TnUr862148
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 12:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ul1VRLD/DNiXvYa4hJ/eLS2ybGSZazpmzCJWjrzt3Gk=; b=NSxahPMDcCgB2zAM
	q9XFaKjURLnc3ZlBflV2VYhuh4+fY5Urhue0jvIMgcDvA0fFag6K2fae8yAB6iaV
	QOe8fxyqZW+HrxUy91vwr0MMI1Wn7SZiVZydGfMWmtBVsDGulLipR+Q5U3hdx5Yw
	9nLuTa9JzEh910DkZF97MDN+tZrVoJH33D18IyBxSkBvu7KG5vPeICev/T5CdoV9
	8J2QAIEGryrZyXixBfzamPckEDoNUh+CnWxeLA0kFPU29woU45XPw2IySAu/nbij
	CSNEIRKy86GqpdLn90jIxarLbuLvHLHKyZQpX2DmQrqfww0ed02j8Av5TjcNMnk9
	BpoY4A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djd0ebu96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 12:26:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f07078ff0so4931295b3a.1
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 05:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776342387; x=1776947187; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ul1VRLD/DNiXvYa4hJ/eLS2ybGSZazpmzCJWjrzt3Gk=;
        b=S/5LhsV9L/wBHhiCecyf94Ml45buS2u20L2FNv/AIATnalIXUoku9xzukmUiG0Mz3i
         olkEG1yhrflqO4NeXrzEUH1NuESbKMC32ha0V9/uClvJev1mCxkQ6LzUahrVHj7JbyMQ
         d+fr+yaBrZHqO6BxWJliMMoebfFlC5QmuPDPlkfQ64pKKIhDbjF8QCctKMf/iDzTouoV
         luYl10/rQosbnyJP9JYNVThsh/d2Lw9LAdmyaoAu3FSFo3+1c3IyzbZ542TXROpVFeg9
         4iRA0xmY6QhwSY4hX4o1kP45CevndJgj84LHImksB+D2o9fzen+AEeKKs2eA5lpA9/TH
         900Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776342387; x=1776947187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ul1VRLD/DNiXvYa4hJ/eLS2ybGSZazpmzCJWjrzt3Gk=;
        b=nP0BZ7JojdL28wGvhTXbwb4eemTPBEANVuY4r59+haeqC2iKJpQNbhh7j8gT0VomfW
         aNjXNNvNF+/5ofmMs1ecD19pDooSg303h4cavYpaP9zIFPZy+q48EY1opKqVohogh4au
         KqFa6Ddzr7tT0y2h4QPFX0eEHG9VtrMVlg0X8jAWjLa9x5JS/zZsDQrv/JKZbPG5N2RG
         l8Y9htN1RtE7cqNfq6UGbrzbC2kvasu2iDh1rtsyGz8Bqsgfgerqqtr3tbAarMT670OV
         xFIgsgKbUYlGTzCgINQ/LYWm1zmV2ULBLVCZk8nv6IOnjMqWVKj8av1mc2d0RF5la0fc
         Yu9A==
X-Forwarded-Encrypted: i=1; AFNElJ/vxOs4fhPGSm63HkcV9CFXt7RVeGEvk2BcHFjzTLc7p67hqXIGbCq6tshgJzpfhbRQDZdHoqxHWajc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Ll5JUxehIBH+//Jrpm1LyucFqnZyZVgMe2zdJFbpctheOrul
	P06qqsQU7Xs/5jprPOmWMmkSdPh7/z54KfbfK5RNujpzlD5OP1tlF+QS8+tFY4qJlItXZc2WwfS
	ep5JvvU8U6y1xnSqIB7gfumUnkxUEAMSCSWke3gcGbTmPhjC6nW6SSjv8xiJro6cw
X-Gm-Gg: AeBDievec4A7XPX1hv/s+nhwtFt548AhkV9TG4GcE5hkuAiHvNlDkqZp36DUp+oHRLK
	3PkAbfndc4bW7EHc5prwDroiY6um/6mFx6jB+UtOFumagI8H/GPjdzFyc56zDmbgdUKLniTZFID
	AOtDCuBuETHpOKAytr0IfQzPHUk35PQG9my4n13c/QB3YVWPd0ryoFB12lf5b6Er8FB+VMlHxTw
	VrGlZZ9L4WiKE27aInRk4zSCnQw6eNtgKd8KaSfRq39CRF3xC8dTCvkIdBJoSAonZPkI1REPmQz
	odajVu8VEYwWZlmOekhHWb4vVhyFHsODPtG7DqTlEbONl3Cbo0DOVPvhJVSKoIgF8VAKCWLBfNX
	M0Zx2TC9Z/t4nY8T+Fs0zydruWsNimNeU6ePCvO5Kmf1Uic1OY9gGDgVkhQ==
X-Received: by 2002:a05:6a00:39aa:b0:801:eee2:45b6 with SMTP id d2e1a72fcca58-82f0c2c8dfamr27229279b3a.24.1776342386922;
        Thu, 16 Apr 2026 05:26:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:39aa:b0:801:eee2:45b6 with SMTP id d2e1a72fcca58-82f0c2c8dfamr27229233b3a.24.1776342386433;
        Thu, 16 Apr 2026 05:26:26 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f673e0b56sm6227542b3a.37.2026.04.16.05.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:26:25 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:56:11 +0530
Subject: [PATCH 1/2] dt-bindings: crypto: qcom,prng: Document Glymur TRNG
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-glymur_trng_enablement-v1-1-60abcfd45403@oss.qualcomm.com>
References: <20260416-glymur_trng_enablement-v1-0-60abcfd45403@oss.qualcomm.com>
In-Reply-To: <20260416-glymur_trng_enablement-v1-0-60abcfd45403@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776342376; l=806;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=kXFqwZQtEIRJmlBlrnV4mxUyArN/uKPldKW5VZ93Esk=;
 b=5AcQ8d5Zr0FNLG+vEMQpM/OZxpCwHHiD/f02ICOb49IpGeKtQ7jXFapuCISNZ4l6Bd/sv0158
 cauLKZ8CgFjDk4tSTWMmFUn+MzNok1TzEzI2mBMjOKPeeyvmyxXd8nY
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: rvOO8GSnyRk0FaI8YoCaBT0gzXffnQV5
X-Proofpoint-ORIG-GUID: rvOO8GSnyRk0FaI8YoCaBT0gzXffnQV5
X-Authority-Analysis: v=2.4 cv=GP441ONK c=1 sm=1 tr=0 ts=69e0d574 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Tyd50f1jF2ROF_aEsCUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExOSBTYWx0ZWRfX8IT53X1S31ck
 tltI87slncLbpe79lJ2HNOS49HqSBboHuFP4OVzhq6MQ1uVruMcSL8EZaqOfg93ovbH7jw30p42
 F5LhT1Fwunb6OAxb2ikcCMnTRakjaVtoAIN/UDARXwOoOe/NPrYDVeJdY36K8GWDmQI/s43E0J3
 oVDYj/pV1zuciP4R5hRaBIyQiiSBlI7gGSJlh/5CEFXX2ucFx0v363UDmVavSDnSBPXBSkopR0S
 ya1y9yQhfE3zag0blOiWZ45Nzfk6Y17ARpA2KYr3iw4TJeP5lLC+AKp/Os/RC5TzVuxOYGiaOhz
 Di50825Y+Pd6bkVxAKfV8bPke18xrbULF6tndUpvKgPbyLNpe2h7M+QD+FCQuRRHn04fkuRSGe5
 SU13kse7aZFe0U4htsDEtSeFBAHLDeBPuqHXheE+YFmzjO6hIK+6T2YL8gS1Xivh5YX9KhbgltR
 pkzC3Low9NFHW03fS2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160119

Document glymur compatible for the True Random Number Generator.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index 41402599e9ab..498d6914135e 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -17,6 +17,7 @@ properties:
           - qcom,prng-ee  # 8996 and later using EE
       - items:
           - enum:
+              - qcom,glymur-trng
               - qcom,ipq5332-trng
               - qcom,ipq5424-trng
               - qcom,ipq9574-trng

-- 
2.34.1

