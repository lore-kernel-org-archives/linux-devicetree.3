Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD1E3E4C87
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 14:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778767557; cv=none; b=R93mJxH8fbCe9hJwT/YIy7VByOCZEAhSp0OEnb0JlfPx0ak93nMsUNEFH17PLuQgMN7djYp0Y0M+OAWhuO3f8k13Rp772GoN55bgtA1BKJpErVmGxOJD6TU/IiaIereKWaaIx88vBBBttSyAZ7pzXPXm5gO0JbmEDD1UF53XENE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778767557; c=relaxed/simple;
	bh=X+JZGdmHTa+yImR9lFGIGG0JCJFj1fpBHVnJUsdElNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dWVb07+HAfC7Rf/x478sFHsubg/UoGv4Tff4CTlpormmNFNGL/GeLYHyB1bUGZfzmEnh6kuRXDZMDDjltfhYSsTDeSKTYRis3Z9YPYxgTEQzDvFFEEQaqkHL/mkFFPqUdPQK9a436Lp8pUjCGUGSBLs+pRJnh+xkvYzLT9nAp2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hmvhyae7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RDoEy0I9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hmvhyae7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RDoEy0I9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeeoX3062147
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 14:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/UiZEin/CWLczHVZ/BWfU1j5gZYKxKRp02pNX4UGT9g=; b=Hmvhyae7gOInviTr
	u14Omp53WCI2Cuh6GKq0s36OCSb+3So98ytyqw9hHUVhNUMal8t6CWhn74vf2u4R
	9sevqb/AuDfcgLbEZzLMNnOg7k5p8+fVht7Dr2SlseJoXXUh4iPrSCZbW+Gr1h42
	MPKxxG5DYM7bEhA9rZ7Ooll/jV6iXDm5FVD5UB25L2asBkYT0UvVc6bapiXtNnf7
	Ds/RxEPD7Bp+Jx+XoCnTV8XWNHppsXVTjPxMV15bVVIaezNTSiv4GBUem3A9wuUT
	z3tdVElH2zHu+Lqit/cSYU14ezsb0zHNPNtGTXPZEvX85dKEMrjglh57/uJn1LJp
	fXBmzQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e554aa9uj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 14:05:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365ff2ab7beso9134119a91.1
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 07:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778767554; x=1779372354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/UiZEin/CWLczHVZ/BWfU1j5gZYKxKRp02pNX4UGT9g=;
        b=RDoEy0I9c+9CS+JTsEvgoLYJcndl/Xskh/QM7TLbeY0b7Jjku4nftfXspEwxqEHzmp
         zPo8HUlMrmar85vCjPHD18KTFGsQmKnNBySt5hd1rcywjQpURor7eg5ogl5yVJih8G+a
         g/CRyeJSLlGs+V8Gpjvz3oavQHT4R49+BonKluGJ2QqK0OPX+xeLTDsMW0eLWTlQTrmh
         hQUPavRDqpAQrvWNXic8RJqA5ec+Y5+FDzoPL7YklYdfkZ73Sq/EbXffz1t+ck7HKv6m
         Wm1rO15f+5jQ7lZZvW9r5qHTPixBf7UZYynL8SV67bYQNORtPB+JnhZjmHP1GMceQftc
         PJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778767554; x=1779372354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/UiZEin/CWLczHVZ/BWfU1j5gZYKxKRp02pNX4UGT9g=;
        b=m2husnBy5b6RlTSeA00oSjym8qXsdIqVxtozCLoJeoseOXfPBkBRi5/z5s8cDVBmCS
         iNLovy8gIfP74ShTUghvk8ioJemudUUM6sG7mrotloEHoMPBTPQERLfqEm2LwkMEF2Au
         qgw0xhtxm1sRCA5VvOZIbXl01Y6uNh8OwvmM4TzbqWvZwJ0pZEgcapuUt8BQkS6cs8lz
         BaGx4TLp+leDcVCZpGp/5nUhTT78ePA5leOfQtSUVhibOMSvYChkV61FItqI2aaOAKjY
         XMmGkZoxOpQ3rmfuSzYZTLypsbL3T+G/WoSrb3TaKngbMvkw+KMOqyuJPzRN691ivaVd
         7vnA==
X-Forwarded-Encrypted: i=1; AFNElJ/ML+teKFme+75daYAUiqmPHf4JW/A5pAGtVLymbKkRmKRhxMnTcHIkUcntzXgYFEf7TsDmd2QDetiJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyBe9fRMopkkDd2dz3VQNh9ytlOx79IuQ+aXY08xMHmEGc5ivYp
	6kUUX2GCvUAQDVJ6jMlUlJdEHM7zfHFpuMjO3jeTme/8k/jt6IL0vcZ+kg9PRHLDE5YFUke2G2B
	JEA2scY4w1sYjm1tRO3XkfW9BNVktvMvSKEXDEyTGKajqSGiCYfwmtFG1gr0ggW8=
X-Gm-Gg: Acq92OFWLZ7ebVm4k4Fu3VgfIBtJZeTHt81TGGMEVww4O0l5FKhoMpBYyPIS9iapBAM
	Y3kQq3dZmU8DGKmEy44phgQuBF+G+94GbI/wBv/U2mgFJ6gN/dAXB8u5iMx2mT3VpBP8WPFPILq
	EGk7OqnmXqOAQRZyjvKQNBkzOCt50gbwtQQIc3u8s2y8vTZdGUPWHw95VIr4XkUOVP7EjKMovGp
	uQBQmrdDQVBOu23PJ7QOrQA929ZNgqRIw4Fb77QzsXNPQabJsi8BZnDGJG/jB0qMR6kON81Sj4F
	GORvvkaHQYNBnmD/g6VFQntGfIePQudzdJ0ILdJBKkS852i8VyU8FLjK9giisJJieDmhNjwj4+m
	CD85hocJ6Cj+zV9kjq8zA3w/RWGbZNEhLG8BZoduMoNdsl3K4w9A=
X-Received: by 2002:a17:90b:4a42:b0:368:3830:a8bd with SMTP id 98e67ed59e1d1-3692345e3eamr4061889a91.7.1778767553912;
        Thu, 14 May 2026 07:05:53 -0700 (PDT)
X-Received: by 2002:a17:90b:4a42:b0:368:3830:a8bd with SMTP id 98e67ed59e1d1-3692345e3eamr4061856a91.7.1778767553407;
        Thu, 14 May 2026 07:05:53 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36928a8c1fbsm1502813a91.4.2026.05.14.07.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:05:52 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:35:29 +0530
Subject: [PATCH v2 1/2] dt-bindings: power: qcom,rpmpd: document the Shikra
 RPM Power Domains
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-add_rpmpd_shikra-v2-1-20bbd37592b0@oss.qualcomm.com>
References: <20260514-add_rpmpd_shikra-v2-0-20bbd37592b0@oss.qualcomm.com>
In-Reply-To: <20260514-add_rpmpd_shikra-v2-0-20bbd37592b0@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778767543; l=969;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=X+JZGdmHTa+yImR9lFGIGG0JCJFj1fpBHVnJUsdElNQ=;
 b=KipiXPGoYtvXA1TlrHwmk2qWj7MfBtpBdSNtWn79hI5oMFPG1WGwcfCjBA3TmLlDm48PV2Td4
 Nm9sS3CWwVGCM0pw18wY3j9n3umq0ekHPzG50sy3avvaZj+tESJlGgr
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-GUID: xNAwZF3KvEm-Dw7E_z_DD8jYBMkwbCqj
X-Authority-Analysis: v=2.4 cv=Wag8rUhX c=1 sm=1 tr=0 ts=6a05d6c2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=jkam1OttE9FODJyLpI0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: xNAwZF3KvEm-Dw7E_z_DD8jYBMkwbCqj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0MiBTYWx0ZWRfX3guggsMgvDFp
 odgzJ2aAx/pCALltMUCOffpKILmNOtQzCutMJ+lauSiQFRqTgNdDZwYK7x+/D1RM5MBKBZeUC0p
 p0bcI+PMal7ENz53Bvp+dyoRsv+nm41JlR+6S2rkNOTVukMcv9OYIVwIrA9THZIygRAntsdAput
 RPb/g7jF6v2/r+vKD63MQh+F7cvh60wt0f4P7lbwchctM/v1mpV1fobrCyzRL7px4a6eZjhObFF
 gXJE+UjSB6ckKDRj5GwGMlxFv5uQaF9Ka6fdR9otpvJQ2xnsHItXC0Y4ptILJQYt1CB1v+MrsZ6
 UDWTMKQL7mFG9x2dLUxgm/n/uVhs7DuFejd5c80atsiSgOIRxaRv4YB3aSI4J4UREEjZFWq1mMR
 jKGW4Qjmk4o/Cs5Zr/wS4UQLu0fB1GqOlr2ByOm8dLQtAlrI/EokkjDpmIZYWSUhh4VG3UNBgkh
 yrwKJDO9lj8e8DCnumg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140142

Document the RPM Power Domains on the Shikra Platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Changes in v2:
 - Collected Reviewed-by tags.
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0bf1e13a99646c0325b03fc5b3297ebada21cdb6..1abb4b733fe79dfa267e953f48219093ad759330 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -55,6 +55,7 @@ properties:
           - qcom,sdx55-rpmhpd
           - qcom,sdx65-rpmhpd
           - qcom,sdx75-rpmhpd
+          - qcom,shikra-rpmpd
           - qcom,sm4450-rpmhpd
           - qcom,sm6115-rpmpd
           - qcom,sm6125-rpmpd

-- 
2.34.1

