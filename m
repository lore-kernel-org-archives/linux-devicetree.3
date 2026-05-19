Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A025B390CBF
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779172535; cv=none; b=W3XIopRuIQ8U0at7quJ0qDW0bb51Jm3PacwBWpB98MCXsOfzJ2KsETDt4P7pMDtNYH3x8EDgI94cLDnqfnYVrnxngFSg0d7JnWGDPdM3IN3E/XUANxn9i8qxqdFjm0o6b/cTg2vO7vslXsw/PVrOwS5/gmWDB6jFJbVJNbsRsek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779172535; c=relaxed/simple;
	bh=hGQrKFRjP1hpdpAcZfNLfUIZIR31hJSwjPWTY95YuyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SDmacu3EHDSLnsTjF8ZIlQbGIpXtODvDUOIk1zkKUwrByqMjuAlTmVyy+gWbGcoEVnf4O4d5LKqAh47fpS5+sa0koo/W2lX6jE98bMNDWU/SBmwaTpwT1Y5SZi0kqmqFpuDaTr1LFkOM3aZBy0mCiGHDUxAvPi5VjDZJCXhXH2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vr1niQA1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sy7Vci6q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vr1niQA1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sy7Vci6q"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J4vPxm2437943
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z8ISBEru/rJ
	YUpudCe+0ajVUfFZY8DjrezK4pf9ZH/M=; b=Vr1niQA1Ovyp2ai/etNo1y+o5pX
	zgpiaiQNXjIIc5qiqR0L7PbwtQVcEDQAMDoNfkxJXc09zrE7knz3c4w7u82fTDpW
	UiadLwUCOmKK9UaWczYZcDpFhdeg3TY+WmyU03Fhd6cpClVcL0s8FiIorDcvmjdS
	osZ2a0A6Ami9m3RWTAnfjDYVuBrEXfaA2NrCc0OfYYjEod7+wKRCDox4+0m9i1K6
	MhI1UOKnjenMwSLlKusUVl9rqcNdvD/h2d8ayufRvKLtavufvk+Y2dwEEOeyzyOO
	gEOGlQ6b56d4GVg+XFDA+XNYfv6eAuTfORHJoLFodGsdr4i7ZajuCJ5g1ww==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e834v3gr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:35:33 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12dc1c0b7ccso2823961c88.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 23:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779172533; x=1779777333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8ISBEru/rJYUpudCe+0ajVUfFZY8DjrezK4pf9ZH/M=;
        b=Sy7Vci6qOqZtKvHETwI/c2MOMKpgv+CbtHPb20ZU6TSkEbDe1aeL5jkcHQA1JICRMi
         YUj9AtnqS74MuJz1GMskSasQxgvfE7uKc/QF1YAuEej4BKZWUM3FvQ+UsPAG09f8FYm2
         NI+7hAWVHX4k08hXz4kpW8AZ80Iw9nl62nlci83xeTpmf8Zqa7noylRhyf/bJdaoMIDe
         1RagsCwSMDLmpyepbmdqxs3apXCjexaF5gmTXwDlFBJKegG5XoRA7/a5H2zHK51TgdtP
         V8xFn6KumzMEWps27UkcBLaLzt0oYv0L6G2Hka451Yb4lmCGTXRfbKTCXGi6GjRS557K
         qnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779172533; x=1779777333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z8ISBEru/rJYUpudCe+0ajVUfFZY8DjrezK4pf9ZH/M=;
        b=NFrt2J5y8hItjGxd/0oO9iPKVYCK8FS/zHKgkntgiq1E3HGa9NmCpAnWA1QTn4kRpi
         B6RDgfEX7EePNRE5e8qlHWIXo8fopZnXu91Rgsa+XcVhAKW1osGS2szWE2JPyFSYc6ET
         YNuFBPDvJFwFj3H7UlxofIuDyZcJV2MzodwIHoUx30CGA/EX+v4ICiwyAyY62PN/5ef0
         d5bVRNtSOSLAUu6+M9KvpC7h0AfHuexpbk1Yzoe1HTvKkkasOjqywiDUcRYtFpSg1VZZ
         GQIPGjF5MycCg7wwsIRZz0LglRrdJQqzUH4MpNgiZisunuQeobpcAI+eF6MsfKxne/ke
         uCSA==
X-Forwarded-Encrypted: i=1; AFNElJ8cnRSOpindHBDb8Krf5HqXo+nD4oDCx7F34SPjE5MnF5y/I4AR2BNB4gayy4lHtDiszGzJfVe5mZCb@vger.kernel.org
X-Gm-Message-State: AOJu0YyAETwW9FGt0fwjckXVFOEkHRy2OM8ixvK5KYA3xvOy1GJStNeD
	fIMvPGtSvsp0P671KFtZo9GtvI1cW6cbtj7BHxT0IixnbkTS3HnHa8TLkOVG6swW5enUBHkJjct
	3rOtBk0p+6ODJLFkyQBDkGg2KcVkoInbZxNz5mCKfJLlXBoN7KzqteC93Jc2dfLXX
X-Gm-Gg: Acq92OFiYCq05nfZIMMwkbQW77ldpR9t9oMCRZt1C19rPlASHZE+XHkaqzmkrS6+eA5
	Cp6TjydbR4SUrRoOf2YD5nGKXZ4bq2U6fqsC3UGXNiIBcZ/PeJCIJh3mxDicC/78p8bTKD+K8Cf
	CX9p5RuIAzyt2KPR5XMyPchY4TvETW5sSNVPCkOwJkjMu6TursgzQpDpogFOmWM/SMtKCT9pas9
	T9eUyr12hoTjb3l0Jmo+OVvint9ZvWwlV2DtFYZNkKSkmIpIMUypFwIcipJSAoXjVoYKZqX7Qd2
	aNOM/3Hbpp+Hik/TpMjDuJr5OMCS7Y0hmGPAke9QWcQLcyvXffgM5OciU0RksX1CrFzQlc5iQmo
	Vb/Of7uNmfBPjqeTiJ/TMCRXgVwcH3pBr+06XhlmE6J1F73AEdJxURjVrDpeVCl4pEVQ8gN8XTF
	5NdSxTWg==
X-Received: by 2002:a05:7022:6607:b0:12c:9037:5126 with SMTP id a92af1059eb24-134c890fb8bmr10210485c88.9.1779172533294;
        Mon, 18 May 2026 23:35:33 -0700 (PDT)
X-Received: by 2002:a05:7022:6607:b0:12c:9037:5126 with SMTP id a92af1059eb24-134c890fb8bmr10210470c88.9.1779172532773;
        Mon, 18 May 2026 23:35:32 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbdcf140sm22614537c88.5.2026.05.18.23.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 23:35:32 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 1/8] dt-bindings: arm: qcom,ids: Add SoC ID for Nord SA8797P
Date: Tue, 19 May 2026 14:34:58 +0800
Message-ID: <20260519063505.883379-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519063505.883379-1-shengchao.guo@oss.qualcomm.com>
References: <20260519063505.883379-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=F9ZnsKhN c=1 sm=1 tr=0 ts=6a0c04b5 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=v3ITllUuhb3Bg83hOPoA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: 3RCtnuaEFGQaRaOUoAjybSHn5UIWXMAV
X-Proofpoint-GUID: 3RCtnuaEFGQaRaOUoAjybSHn5UIWXMAV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA2MiBTYWx0ZWRfX1qmHT5Uqs+o/
 4pqevfbaKx4rwC/oT1JvD88m2G76TbQfbjDGhVmPOHsdY6i5BLlUIJ5ujCaQZcOi/hsbxs2PSxz
 AXGLOtWEdZ+rV6m+pDNPkiEwxLgs9T70dxeQ+h8SM8aLsu3m2kaN+hKZL8AQVvDtI59ca/iNXKd
 +Kt7nMF7Bxouoy/3TWB+657dHMU9H9a6OW4+qLNgbiY8ij/wq+x/iTgJpj5t8sgvMv+p+f4Tj1w
 pfIgJsoeHzDGx0kRtH3Tp1/xEa6I8r1c1ePB2uGmI5Sq1qQPJdFCnnV+Zm9NzAcmY5UWA89uAsa
 /AXei5xrHeivElPPgInXmmfrp/0HzajHLBEM442qUAjbFZDtcsx4ofj5v0lDoFXUGLr7774QvPj
 tyQT/bEqhuVmfqIKLqQYYu2i/DyNfUpFrBI19KBXDdnhi+NK4Hc9EJv1IZQnqG6/9k6vvJC1r3i
 qmRypa5LmEPFBKRO++A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190062

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Nord is a SoC family from Qualcomm designed as the next generation of
Lemans series. SA8797P is the automotive variant of Nord, where platform
resources such as clocks, regulators, interconnects, etc. are managed
by firmware through SCMI.

Add SoC ID for Nord SA8797P.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index bc65e233eb93..3b353c46b3ab 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -297,6 +297,7 @@
 #define QCOM_ID_QCS8275			675
 #define QCOM_ID_QCS9075			676
 #define QCOM_ID_QCS615			680
+#define QCOM_ID_SA8797P			690
 #define QCOM_ID_CQ7790M			731
 #define QCOM_ID_CQ7790S			732
 #define QCOM_ID_CQ2390M			756
-- 
2.43.0

