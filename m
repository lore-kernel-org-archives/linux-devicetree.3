Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAD73803E4
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 03:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776657135; cv=none; b=FPOerdKwvOR5MBgK+wJKxDRsg7jPraaAseZB2SYdm3nIeUCaNdkNyUeuggr+ELdRypqKNULvqrWHaA1+FiHOD4enfSGXVT+r9P7tnKYA3r6DybWzjDht6OX3JuHmJ63buR39uNvtlnfyxcp5T9lEChHJ/ysYG7OrCHHHlebpHcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776657135; c=relaxed/simple;
	bh=B0XLqXHUgBZZJX90mTOCc3uPsZWSvR4krbaDfNJTfmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mebhy4ZTa5wqNS0RBiFPtCFO9LINiS2tSa+0KEFwbRU2s3jnoJvRHeGaYaMFBjtYqxHs6lYBtMyhC+uXpBC9rrEyvBAhoZTMzvUKcQAQI/SOJ9iB8zqr5QzqXvc1HhImYfgomzcWNCeCwi0zM5b3jqJWgc4XrXg4+alkDJEel5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IWuCFuKF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IAwu9Gl+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IWuCFuKF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IAwu9Gl+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K320wt2147151
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 03:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pVhGmAWyYmU
	7/TxyYDl95sQD/qE0Y/S45u7/+wIjVZ0=; b=IWuCFuKFqaBfPBQHphHR64DR3LW
	s34yVbbrLFpcHeBYXyPUufWDryiqxeYBKMTD3997vA/MsObx+NwCbZjwXwQJHmd1
	BiQv+VgrK3bpSGnKUAWuppPzXOUUrQBkSDhudz/ZNQJEsBnBXgGYjCAC6SWwBtex
	oHIC3QB25EVaBda0sCaJRhpLeE5+zZQBkewR4RB4wQ3/iEv9IUkCPCFLpRd2zdMo
	QI18wHRnm0n3ilCGQ9kPWe8AFMfKHAacCksLzawwNct0lW23K8EjvySqQGtf2t/X
	u7KgffGmDZ66VSbIMjGrccDfpa7OthiUoUWxpHkPK2MlFwf63vXaqkvd4uQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkynec6pj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 03:52:13 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12c8de02a4dso1819446c88.1
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 20:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776657133; x=1777261933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVhGmAWyYmU7/TxyYDl95sQD/qE0Y/S45u7/+wIjVZ0=;
        b=IAwu9Gl+hQNpslLpSnnQexMZ1UVeFR0QMFy9mZVjXHQWODFp/ccu+fOCd1MKDREOtC
         b82g+NlBs1haPJWhLrjssDCZx8pczPbnWiHrcEm6VMeXSSN+t42a7cAAe21ThoQZdj/n
         FhDYy5FMIdt7gy3SY+f2SpjFwQ3qCKFFBxu+0zSq9+vV8nim8ngYEoQorguOquBYc4Sz
         p6w1hVBq1/P7Z1tLQ3IUoCMxSwmeur9RWI9qkoA7WDzUE0rUJyVqGI7YuBiRLr3ZuC0H
         q5dQ+mJuOwwUkxyNYx8DgQtKnHcmWaSjm+FuSwbZalmsPVqATinNyuCxRSQM2dTJNCxa
         lk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776657133; x=1777261933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pVhGmAWyYmU7/TxyYDl95sQD/qE0Y/S45u7/+wIjVZ0=;
        b=XhGni+jpg4R8JBs5nkWNUrOXsq8qvuNyqCqpxEyCegoHZNGZJPxbntawuzRBdDFHWm
         Wt1HVAxzOl9mJOGn5tPiHRaFvVf7xYiEVIloga/ulvf+dssj1ygEgE7T5ma3kVy7uBW5
         3q/LXKUbEDjMYXWCjlMSjlY3080p2vmVEruFvYq7kuDGqCuT9gmIBG5U7R8tJkDvjOy6
         s9weUPLORaPvLwzz8hK/p+iPqmCLCrD6Y4AByTwNnL8W9VupxAafCS1cwCdlhlstwd4+
         2aDjjkdxQex2T9/97hwTyjDj6Ffko9j7n3p78TbCaBI7T0GoGkHftaQb7cOlhtiBm1ck
         YLmQ==
X-Forwarded-Encrypted: i=1; AFNElJ/fy+MaHdL/v585sZxRbwU97GbrfiIpanbgxGwEbKTYc7Xyd50wrANzuYXQ93vhH1bnj/ztORNr212O@vger.kernel.org
X-Gm-Message-State: AOJu0YzN+W1CAnd9kd0WhTZzYdEdarjaue6tFdE5/V5w+n26erUPZPBJ
	onSnwrO0ExsDxTbwc+z0ELpnNerb64MbNi/R8ToSVzLJkMOv7aYD1dlmK3yLUtVKzvQYiojO9wG
	j1E//xKSlzxe9dEWmP68bCum+w2LkSoIzT3e70kj87lk44V+nvCPvo82gw4JZ+IZF
X-Gm-Gg: AeBDievAmDH8ESXqMOvBHmzUzrgMdrXzhPonU9IwNisCS4CuFA2JamME4zHZOGLUA/Z
	6mCvwnC79d2aYqiJ9M7bAk4ZwKyNdhDC+jTsiU59qNwaWZruT5SuPI4bWgXYOSY/N5vu3bieoNW
	JbMHLQ0A3udaMILNForwAfS6/nc8M6fcNesG5+TRioA2ZIMytGYC67PMoRmw0ZQaoEIpxWAzoei
	oaCroLY5sfsoO/wOFs0PCRdm9EWVO/K5zuxYCHCPUgl0YJ/PfEqnQxUvcNWMZt/iVhQgSWd9gyl
	Uzwpb4tqDtKUxwJo9dvoHBLmAcVwMMBNlWKHWkRA8ts7x5btnpzuxXdxrK/iVq25nz/YPXYqXgb
	Y2re+zSbPPj4EVN5T8KCxgtVrdVhMYMSwR/kUe0Ghp/jHXk1a6uM1e+iUh4Cs17NtWVAnaJvehQ
	ItRAEBPjMfL1jM1pK3
X-Received: by 2002:a05:7022:30e:b0:12a:949b:b9b with SMTP id a92af1059eb24-12c73f99c7fmr5985490c88.23.1776657132385;
        Sun, 19 Apr 2026 20:52:12 -0700 (PDT)
X-Received: by 2002:a05:7022:30e:b0:12a:949b:b9b with SMTP id a92af1059eb24-12c73f99c7fmr5985470c88.23.1776657131814;
        Sun, 19 Apr 2026 20:52:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a20c55sm13056111c88.13.2026.04.19.20.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 20:52:11 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: mailbox: qcom: Document Nord CPUCP mailbox controller
Date: Mon, 20 Apr 2026 11:49:31 +0800
Message-ID: <20260420034932.1247344-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420034932.1247344-1-shengchao.guo@oss.qualcomm.com>
References: <20260420034932.1247344-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HbokiCE8 c=1 sm=1 tr=0 ts=69e5a2ed cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=gsWVsoWImq32ZgTqCxIA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: FbHZgd5E3DMf7rKPMMfldbzy7iaGQXT6
X-Proofpoint-ORIG-GUID: FbHZgd5E3DMf7rKPMMfldbzy7iaGQXT6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAzMyBTYWx0ZWRfX5BMKS6MAB1B5
 wpMB+JV9L8RASax86bMkcpiYuA1LF/G+k02wQWc2WNJIqn8RAOyfabD6xG9rFdY8hXqO1i7AFyA
 Af4MDRgFSs+ZAITWOILbZB9oAvRo+3teWEBKAJiLCWWbhKnDWSh3MjhYbrGczVSBWNv8Shwxg+b
 TU3ZHQN3tdWttpQjZT1UGISugUbZt2HbbAByAOIE5/mee8j4L5PzXHffa70hwQ6jGsFMM52sM6l
 CViQa/WiwDpii0RAhKLdIt50HNwPWi5BinUgWPKl2O33lbWnHlD2y6QFMdf0RbKFL4vv2JIselo
 BbvM5ewfBlRP8vUO/7l/zCSC6RcrVHy0pg2gcMnMd/kndrRZ+c/k75RW0+cNoJT7CWc3UrEsoSx
 EpTe3oJn0ErpDyI73OIeBBMQGwdL2cPMeo6EwrLVZQOQJxo+yHiXLgnt+AVhA+Qqd4iSmsyAqLE
 SrxSIiEYhBNq97XqoUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200033

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document CPUSS Control Processor (CPUCP) mailbox controller for Qualcomm
Nord SoC.  It has 16 IPC channels, compared to 3 on X1E80100 CPUCP.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
index 90bfde66cc4a..2dd66a88c186 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,sm8750-cpucp-mbox
           - const: qcom,x1e80100-cpucp-mbox
       - enum:
+          - qcom,nord-cpucp-mbox
           - qcom,x1e80100-cpucp-mbox
 
   reg:
-- 
2.43.0

