Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931963845DC
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 10:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258795; cv=none; b=BqgYKfgVJSgvPOMx6dmnOTz8UmXQD5zcml2y9KKnySK5FeFbOvIjWZ+EuL2M6JMQKt2G0F9B0Tx6ADbMjzl3t3M8RvLHloIWpiuhd3jqwTvg67srlQDRkd41wzEyPGS5l8eeB/gwON7bmKvk1eUUCQGBXlvwD2ajcI19Jifwnnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258795; c=relaxed/simple;
	bh=V37AGxiIlCADNfSVQa1EtPvInImMvR59PBciUJmFxDc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C8aap1H7spO2Tcvwzw0xDEEZz8jUbeFYP3SabxxAK8SuoKbCG5NOw+eEP7uZ7J5WaH3v0hpO+8J+bitkWM905u1QicLqqffVvzX0piKisqVych79BTv95pWF5ndJb66ETvHn6wAf4N8jXV6H3/vcmJqUScQnG30u3RoTuP3+sNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wlch6Jr+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SE8UK3Q+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wlch6Jr+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SE8UK3Q+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJ9nu1641293
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 10:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Rps05BzNsJlsNoYV02zDupxVjpxJ2krr4ce
	Ti6viGmU=; b=Wlch6Jr+g5IKNJhz1JpH9241NrwjccJI7ZSZwBOYU54DTPxPhl6
	q51cxiBW3fPRgksjDMB5PPg+6HmUEKMlKOkgHW9uNI1tfILLqaWFOSUIXGZ2pr94
	3Fypro+OBt9oBxo2CjthJxNv6NByGaJpdEkvlBKOpleibCWef8nec1s8SVhH35pS
	2b7LP4rU7b3IKcA3W7EzNcoMj6xR1QstLaFSfAdYZORGezPwnh1Ql6m2Yowj+yPb
	o36rIlKPrq0+wCjQnW8FPA5pw3uY0HLJATFwmaQ4XLBGdiac0SQmBv5IsuKYpO3P
	j3YxnBsS5z1XwDyRdPb8yJor0eOY9uE2zZA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8t2ha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 10:33:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso4652330a91.3
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 03:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788258793; x=1788863593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rps05BzNsJlsNoYV02zDupxVjpxJ2krr4ceTi6viGmU=;
        b=SE8UK3Q+DzaTFuO0xincUApt6ICLxuhT9QeiBbJf7uOcjVGYFoXrMch6MZJPJtQjJQ
         5oPV3nTGkHTz8IpwKnNvAt6pt/Jzvhh3jVW001jX5ngPcZHSNz+9LJi/jqs+jzLTk/y5
         diCXSRuCHFwPRebT4lEcBNILueMaIpWYHZ1DNRYkwxTyzy/Xg2mpPw8CzEShTWF0YoHk
         bw8aMHeLTzVAdOqrDgdGh8qss5JPFuSeDNKYUWn2mGIiuEOYt/5xJFqCb4eDEPYqQfIv
         73FrHg+7YZCBWjoReSPkORvm52HTLQVHAvVEtv2iGik6Rj13wFMCV710/ACEAXWeBQCs
         yNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788258793; x=1788863593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rps05BzNsJlsNoYV02zDupxVjpxJ2krr4ceTi6viGmU=;
        b=Aqh/CR4KUkf21bMMkFGRTV4qeYq1S8khvgERVUBysC3YxL/PtmChXXLsSEUPSWPwmb
         LFSucABVnzzU2pdN2mMqoZ0lU15OaFZJ7DOHMkKTN6HCRSrYF1VOR6SdtLsA+O3sxNBT
         AFuomf/7rpljL8hg1eURDxg1eDiXQhfaVDxV676QGjPPnmqwpiMqFaR7xTOGHQNezWle
         S6s22sjG3xElZZ1/VdcXvrECW+riw9UVQBh+dRMohv4aWnVBqx8vSArLWI5efgEgu0c4
         uxUrYwaxjd+RjgLnVcpZxjUWcY8a3rz3ndH4EX1C+x3cHzyW62TMkIbDmGaQOLiFVSTG
         33jg==
X-Forwarded-Encrypted: i=1; AKwUvByacDEBLskCfjhS4t4LE2m43aBVSF3OYGL/rbG/0vF0FIzWw4FwIzKHIJbvNfft+aR5vJUmDeikxHWM@vger.kernel.org
X-Gm-Message-State: AFuF++mFL5CVcMgggbu5hEb5qRarguzGLIvFGIJhjakS6WKLntDEJMU4
	51+8+v6uU2yhIaEbK9/MAEdypmitdmqxFJQZh4Nzcy6j6SkDilrD2/iyvgs3y5w1k6JpeubMRoC
	0Mh5d3T4OhUcnzUsxll5BmZdhutZlmcs1j30rXT5JiKg9YolkKCrQb/U8XfPAApnx
X-Gm-Gg: AYBFou1VJccG+sW9QAs9hNwhFveQIEpxHpKx8qwte8rgj96jAJ79yMx3gf22P9bFs9e
	m6JmlJ3GXfKsdGqmP0TWX05Waj3YDILNBJC5vcZDrl9LupUD8+kKIdWhRVf11R+Qv7Htkju6oZ8
	CWtSphp66jRYgRSa18JZHOCGbOtPXeiUo/k4DUwhyjgjanQdUwPEy74PpM2IAX10wdf3n/uBd9I
	Nh0pQ8mXu/QR9KZZ53NhsQZILtoFCgEbFn8g+Pt2WIn6PN11oMPKK4VAqRXh7Pw9JVlwwPSRyiX
	SywVRjwj/MMWVS/6rnrn1Ep1uXcoTIJDDVwEKWRSY8oBxrbubLGX3srHsZrFY14XRfkgH1uWsB8
	2KwiV8a0V21BD94ucx03i7rvm6kx0DN80rbFp+dawYeTAsApBk3noe6wiJeGB
X-Received: by 2002:a17:90b:52cc:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-39907e0f90dmr9999021a91.13.1788258793147;
        Tue, 01 Sep 2026 03:33:13 -0700 (PDT)
X-Received: by 2002:a17:90b:52cc:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-39907e0f90dmr9998946a91.13.1788258792676;
        Tue, 01 Sep 2026 03:33:12 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9ecaa9sm38719882eec.26.2026.09.01.03.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 03:33:12 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: usb: qcom,snps-dwc3: Document the Nord DWC3 controller
Date: Tue,  1 Sep 2026 18:33:00 +0800
Message-ID: <20260901103300.60803-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a96a9e9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=tFf_m68rkw3bL0m7f1YA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5MyBTYWx0ZWRfX8umCmEvHehTW
 3NtW1k2neheF6m54MFY5/HII6PXvwRjor+BY+Y4ThN3x0mUmIqouexJ05YiCRnq5yVbuin+/jic
 dsE0VfeldUKG5lp5zFxFvMM/J509zsS07PUapBTsvwTyM/uSOVE8StxYfURohktVfrUag0Xz/qx
 urX1XW2ceu8Jyfz57zXy3npbE41pdR+O8S4NZJY5X+6giZel2sYpDLOM7HlU5BcjSI5QsGos2C8
 gcZJXFEev1hg1+Q2jEzfAH331atoRNUfEjOyaEmhPfvQ6bhqtwpea62wevI6DI5FW6rOJ9UW0zQ
 6eOtL8WhgYRr+DjbfTfvpHxujWFCPSY7E9T2hBRY/iX6D1k6CdZAzjkbRWnbbD0UhDZd629cP7X
 cCKgCZ+5JQIOQHDvDMmkwQ1tUad9eGoYEdV4l/kDMUZtQOD76DsBJAGXwZe9EO+fkWdEcszDlCO
 DHsRcefaq1V/fUoyEFQ==
X-Proofpoint-ORIG-GUID: YsFHVM29m7LvqxVmfONV52pZ79WS15j8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5MyBTYWx0ZWRfX1+wfIRdUkTam
 b1tVuE/h0wbOVnDqNu4NKS5N1rvqBWyUI1HgVPSGiQ0YgvYriOXe5GAj12E6Y4lnWOBQoy7tRa0
 nXwkRrq/N8irrFZ+MwB+ntbA/ImCzSA=
X-Proofpoint-GUID: YsFHVM29m7LvqxVmfONV52pZ79WS15j8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010093

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add a compatible for the DWC3 USB controller found on the Qualcomm Nord
SoC.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index ea60f7220afe..1830b979bf3e 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -43,6 +43,7 @@ properties:
           - qcom,msm8994-dwc3
           - qcom,msm8996-dwc3
           - qcom,msm8998-dwc3
+          - qcom,nord-dwc3
           - qcom,qcm2290-dwc3
           - qcom,qcs404-dwc3
           - qcom,qcs615-dwc3
@@ -359,6 +360,7 @@ allOf:
             enum:
               - qcom,eliza-dwc3
               - qcom,milos-dwc3
+              - qcom,nord-dwc3
               - qcom,qcm2290-dwc3
               - qcom,qcs615-dwc3
               - qcom,sar2130p-dwc3
@@ -526,6 +528,7 @@ allOf:
             enum:
               - qcom,glymur-dwc3
               - qcom,milos-dwc3
+              - qcom,nord-dwc3
               - qcom,x1e80100-dwc3
     then:
       properties:
-- 
2.43.0

