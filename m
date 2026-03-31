Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC2D3F65F9
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 13:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774965281; cv=none; b=YowX6Hr+8GZ/djkw3ZQweWih9K9mu8vwYQlMr33UKVBYBQ6N61LxxOCd58tpLXarVXFlTz8DgycUD1u0HDBGWsmNUqdevJOYUUmOVvhkRt23cMaybAZqF5rxrloIv1aQS1FIffeoaSscqsZiRkaj0AXpub+zMatetVZNaq9Kv1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774965281; c=relaxed/simple;
	bh=8QcsFttIAmH0U2+jjqOm0hxfq4I9TVAlj59w8AMZfSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LJ46zo1uDSzDGwVtU4+xdr51wxS6eQMzlTnJ//52UKfsAcJDp0SDFHNjS3FSYVj220gFgzPET3aNZPj9L3U5YlW4sYGCvXCnpw/VH0MFR4V3NMh4UL2INS42ZgVaSk735OQa6JiOjPFBNgI5C4qEfIq05MNCitwO6zPjE5W2b08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AwPzFJcx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fkLk8ybC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AwPzFJcx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fkLk8ybC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VCvKYS1305644
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 13:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fGVwXnII8r4GYq3YMLLcnIXHAW1BotIg1657HyxyihA=; b=AwPzFJcxIfHv+VOf
	mehltL0o8laCOvNICzkhvTKgHAN7xuA8TNt/qAUIHmB+XFolHlw8aVM60F5+a+dp
	T47OL95UzVshFWcmtMOnYm9+JY9E+EhdGN7gpS/0lO2JhRGxQvYmMz6QXeXdreUJ
	VldP3vBleVTHwkAjeJ6aCfPOo66pLHahXxfvoVKD/5JInwIj69RHfMoJ9mqOfND3
	2MAfQN9ULVZYzjDOP0xhv6ukU/DwovwdJVYURBFXqZcmy79zxd+4P1VuPwz8wIFz
	vPAwJYV6QfBhCaG3xpY4Uaq+ps92LPAtVgwAmcUCiZWYkngUj0eAlH47AlcyFSwu
	ynKe9Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8equ8bt8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 13:54:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b242062308so98535815ad.2
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 06:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774965279; x=1775570079; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGVwXnII8r4GYq3YMLLcnIXHAW1BotIg1657HyxyihA=;
        b=fkLk8ybCr+1l2/Q2uf6564tEIEOtXrumv7TQmVPDKXllH/znrruHe8b+2v/La+Jl5G
         0fGtVRJ/jwiX6LugoRWK59d8fUxrpnxvRE2qOP0QATuOG84VTKzCvQJhFZZiJY6RM/Vv
         lC90uq1EVc+in2f677e7oGXfNpW2WOdQ0TvKSVFwZXabJcSqDQOlhN0tgA49KZBa7pZx
         cYPWRh6q2F3XxlTlXaKU8ENIqrCdaOiVF0J5fjTmTbrGJazYBjoL6MILWnt8p84Xw3Ua
         CeK9MoSJ47pkv6VZ2QOr0HlskiEhTRy2lopKV4a6WK+Mg6upx4S/bWyUZe4z+/UDQojg
         aJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774965279; x=1775570079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fGVwXnII8r4GYq3YMLLcnIXHAW1BotIg1657HyxyihA=;
        b=JoqlBg/7EJZnrc1COWpDmmt/X23dy8p7amsSMgUjajVNNCUK+tLB5gBTwAMeAxv7Jo
         KKhqP7dhWSJlidEmfve/Iw1wZATZn/Ec76qL5sWcaZRJGOiw/lHyN8C15+Xi0Wc2Lvz1
         KcPH+6HwUY6H5CFo2aYoFhM0JwwPyvobeEh9wj+iNfe3IQNz5TS544yArAMUV5chZw/X
         xHQoqFR51Xb0orLvVoIIlq2WS6PoZLuZCLrpHgroViwG7s3OcT7yZ9D5kwklVOa0470G
         VNLg8AuRTTXA/GA9lfDdhaC5cWEoHEEK1FYy4eH01MpFBLlhNeA409Bkec61nai95Tss
         Ywfg==
X-Forwarded-Encrypted: i=1; AJvYcCWsTJE7OepQ3NtZzNMzT18CWEg2EkbeIzmKZbeAaEq6PFGBmQMyFeKPwrTWQx6BI77Y2cNddKgcKgZs@vger.kernel.org
X-Gm-Message-State: AOJu0YxXxQKBPt6wqSGilAFYyDWZFSLkEQ2QjVLnouTkswrP5oAmSqYB
	deZ/GcgbJD11naAUcLHem8/geVuuNOJCn5lMNt5X+HICg4H+LFAY5+Y6ObuRjiiUCdJ/ZnRTLai
	yQyyq6PyU9gCMT/p4pPMcOYNyrbcMh7/J8owvoBYCgnRwPuOeG88EZmOLiIFOiNk5
X-Gm-Gg: ATEYQzyaRzC8smqhBSs2T7P/jS/sw4uc4oTYwFuImcKELQIJOQ5OrbLruUCmRF4lhD3
	5ZnYegz0+8VMKBIWD38NqjCIbJUzgu9FtZLb9+ranpX5CqHOVHf3JTCh+eCPCcYvMkCe5Tq9NfW
	PA0C8mUkuXGwu+wAKOnBp74vvPQnMP5mZWAdcYBYZDslLpi+TpoW/XWtgrJ+r3VXZ2bM5Xn8+CU
	+N4h7qy/bEydVhig2uXuOI3n1QNi3XPwsoS/D5xNMqht2xVmwi0yIW5K680VNJ9R6cbjeq7qViq
	9RZ/ZSSYrFx4nBZgntWdJBGRrqy8FS5iwYKT1WT39e2FxEbB7hEYSGK7FJb+vH05wKeo4Ps/u5v
	3Udv8rNwTsTnlH7pmmpjVs5qYSarKiWifaSrdGGIBf1jm+cFoiUqJ35lGEhG8l+jUYHtCXEt9dR
	l0MdxMffqntvp10wX0zd5euIHJrToKIvDBmNypvnur0Q==
X-Received: by 2002:a17:902:da8c:b0:2b2:5857:601c with SMTP id d9443c01a7336-2b258576d74mr66811015ad.18.1774965279312;
        Tue, 31 Mar 2026 06:54:39 -0700 (PDT)
X-Received: by 2002:a17:902:da8c:b0:2b2:5857:601c with SMTP id d9443c01a7336-2b258576d74mr66810615ad.18.1774965278808;
        Tue, 31 Mar 2026 06:54:38 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24268e7f5sm112748945ad.35.2026.03.31.06.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 06:54:38 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 19:24:20 +0530
Subject: [PATCH 1/2] dt-bindings: nvmem: qfprom: Add glymur compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-glymur-qfprom-v1-1-5b4284d23c80@oss.qualcomm.com>
References: <20260331-glymur-qfprom-v1-0-5b4284d23c80@oss.qualcomm.com>
In-Reply-To: <20260331-glymur-qfprom-v1-0-5b4284d23c80@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774965271; l=795;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=8QcsFttIAmH0U2+jjqOm0hxfq4I9TVAlj59w8AMZfSM=;
 b=iu3Ky0nuPedLmmvBCdUs7fwCRXSVWnUSXCDANCmB+p06WenSYX1iCQPdPVahDDejnRuht9KgO
 28+6tgIJC/xCRBYqD6YCGZUOCBvhltkdgexXX4vBDEIvBMexG/wLfDv
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEzNCBTYWx0ZWRfX+eHsxP5jXgd5
 oYdb7q+ahQlGezffYMCbfdTmxq+/idw1fCnO8TctMuHtZJBwDy1cpGLA/8w2Vyh42egIqsnA5Fr
 dJ3gQ/TX5UwU4gX+Qf6N8e5hMPLrYsNHDp45PXRw47i5kPqqgioZmlUexShEGNbqgGVbtW6Eykx
 Yz+/zAyp3PkVj1hFxXsTN1S8CD+nc7RCXlGcakvJPAWu5eXZZEACFPcd8VhWXxcNIxZmmQmHpKs
 kn+s1y0urHEaEWDNbxup8mSfG7qocu+yNnUxFaVJnJkrKKldAj+IV7Zd/ZUvJaSFYCAOrJHSaJo
 CBFVUu4pJAZtgr4YRTZcWG9BgYFWR3V79eq552jjPuNDE67IdzneCpl41cM8vDlwxsepKk8COnM
 M16/YkFl7VFGxrSXThBe+GaB9JWZL6fRzK7gUW/paQexRaCvlz/REJ5afQ5W/1rqMVi2cnkjbib
 Zdw8guZggCaf9xVIuhA==
X-Proofpoint-GUID: BjrQfytrypwoLchTmbjtTP8t3RnUxwHW
X-Proofpoint-ORIG-GUID: BjrQfytrypwoLchTmbjtTP8t3RnUxwHW
X-Authority-Analysis: v=2.4 cv=YMOSCBGx c=1 sm=1 tr=0 ts=69cbd21f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vUZDLOBKDjOr5eVc11cA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310134

Document compatible string for the QFPROM on Glymur platform.

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 2ab047f2bb69..aad8f5ea6fff 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - qcom,apq8064-qfprom
           - qcom,apq8084-qfprom
+          - qcom,glymur-qfprom
           - qcom,ipq5018-qfprom
           - qcom,ipq5332-qfprom
           - qcom,ipq5424-qfprom

-- 
2.34.1

