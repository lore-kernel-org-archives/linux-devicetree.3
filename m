Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11463400DFC
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 10:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170713; cv=none; b=QZNrmbwR+fF/hO2Hzb/QSMlvcHGi+DB9UM14D+xWqHtLC8gztWj8DiwbzbDc89YWvWLdzb5X6Nq1tN6mmjlaS3yq1da+uVXYTWe8TsImJ3SpdPGZ70tk+KUL+8a7jbHWmr8dVia3020OXzUXM17R2I/+vVbODypily+TWVSxKdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170713; c=relaxed/simple;
	bh=lICeJH7FbTZML8s20UqPhvppOoSoXqsEi+CRHP8YGKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=deLIuTkbDLelwCL781ebo/gPFxOX7ZPHR9iPlngYUdCjVVKHlX0JTQx283yjOuFXvwZ/LsX7gi9SVj7/b4d9HO3hUDivK/EsH+ctqbQ50LLFToB4bMYOYfn3KZi52Tc7OnbfrG/+zuaICRdKXiuzg+0YrnlXQp8w9fQHj3BEk3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lq/ij1WC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KwEIHOsn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lq/ij1WC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KwEIHOsn"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V9JECa2517368
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 10:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ic7E7sKUrg6ArYIaMYR4N2bfLC57fAhY3kp7TTRCZtg=; b=lq/ij1WCraILaeBW
	s4iUNRk0Mv/sKUJ8cP9d6kcoiVfHxaj3HgriL8E3WPwg1bqyeEda5zTwTHzw6Q26
	RzO13biahMaYpUqk42qNzAVvZeKTzqSHH3XcG9wu96o6/1JTlTgnEOV7x72lWibP
	+WKl7C/9Y6Xz1him1q4bPA5K7LLL4jxuNCyV6z6H6RS4l34B8v1b3inxYCOzv0q9
	tmQHjPXB5b75N8+8gUqF6T6dDIN2TaWerxv+p92pqXEl6U26zpFmye5obmfwkcBP
	1/TRiK4GHFmU9YHsnuyOVR/L5X8oh/SY2qsOeGmk0rUSafw/0rVRW51Ek4NcKv/l
	rmxrjA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6vcr6am-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 10:05:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ef13b61bcso670615285a.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788170710; x=1788775510; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ic7E7sKUrg6ArYIaMYR4N2bfLC57fAhY3kp7TTRCZtg=;
        b=KwEIHOsnZIrQiY8AosCJ8tVa6AHDajoFE0Nh4qrQ0odlEzxA8z/1u9ifflimvIMe35
         rflL73xO/UBm3lT3UGBOriwSv8BfXvmItIMrnu667SNtXpzlez9GPHKne4bmk929MjdW
         hjvD083kHT65HASPH2k1Ctr7LUNQCNnD5jC5K6wW5y9OyOaA4t62Gm/4lGaURqnvF57I
         Q2jdawIdiVOWZvQfBU5vd5gkCoU4BwA4Kow30WKxWJDRvW/xsGrP7+sLAvcLrNSlsAW0
         wHrk24mOcI/6osNp/pvCtgNmoVj9VWUY8MlEmjVE6G2JKoggERCV4GBIdsAEoeEWdTAa
         x+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170710; x=1788775510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ic7E7sKUrg6ArYIaMYR4N2bfLC57fAhY3kp7TTRCZtg=;
        b=J/T4PEFOA0HnfabfEQTphqqdZtOu5L+32bjStPzlE/NyFDlx/SiT/efvRYpAxK7vIG
         r5jaoiAXkkLHYO1UrwSO+vwqKptaJIaWpFtXOnseD3+qKXVFDmSgGJR340GMWhZTy4tZ
         q5N2jR4jH9l9HFiPJK+btS1jzoYbVqu4dHlsIhBPsp8Bhasihm2NN2GfKtaIc5ihmcB3
         6kE1CwtAY1L1iZ9uf7jQVwRdkQ3wYFTLW9ThqHG+4MLkERZyjBUJsZlILTo1UUvpRFvp
         JbOHKC1ESHPj15UQxtoMrWrnVotCgoJ2Yfwxhw3nBbsnjMA2hgwBVVPu6OokmB9iQYPP
         2IXA==
X-Forwarded-Encrypted: i=1; AHgh+RpzS0D8xX/nLAuPa8fpWlOUQ5qygQwql5J9CupixtKyG7hQ0w67wgBCVNSQxaatoUELSf309kvN1+4T@vger.kernel.org
X-Gm-Message-State: AFuF++mvtdSSZ0SyrQT86c10jH87qkGCCmbFIgk3u2GqYS888FkagOsI
	ASYglvyzzg89rvXrN2evsGLyyfNGu4M4CtEGR5o6RaNAtRovZBLov24GZfhpwv3ZRF6lq6dfxfn
	meFB2QTTqBmWWiLn7l2TEIABr8z0acBc0JwCd/j3VukZHcUZBP6WTGHQojrnf7EfK
X-Gm-Gg: AR+sD13rudqEwWmmjIn+rP0h20lW+DLH8ybCMihB5svzGqTa+J9pyecipT7nlymCSgJ
	1Za5OI5uh6YH7wxbdffVV1GD99vnk8CyWqzcxdEIB/L+QaFKP6WK5HWBWGBWIzVJPxEZAte6vsO
	YbAy7w4wTUCdPfKb988dMJPzzJ/dYQ1sOYG/VJwXbRh4uFMuclF/a7mD1yex26M6Idhsb9dvMB+
	1UEOd2lHEKb+2+9QeYqFpcZ3zhxF8pVUY4YpP5k4I5joHhXTI1Xc7NCB8TxtSpGBq9rU4aOmi3P
	3phQ+ZoPNC/T3D9jhEe9V7KTLIrKZwSBtF6LNPbGNs33J9TmmEyqGHHNMRmBLk2B8GcJptDuJt0
	hrhb97w==
X-Received: by 2002:a05:620a:1b93:b0:939:e76:cba5 with SMTP id af79cd13be357-93913924eacmr2754976685a.32.1788170710407;
        Mon, 31 Aug 2026 03:05:10 -0700 (PDT)
X-Received: by 2002:a05:620a:1b93:b0:939:e76:cba5 with SMTP id af79cd13be357-93913924eacmr2754968485a.32.1788170709703;
        Mon, 31 Aug 2026 03:05:09 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9281772bsm131001555e9.1.2026.08.31.03.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:05:07 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:54:46 +0300
Subject: [PATCH 6/9] arm64: dts: qcom: x1e80100-yoga-slim7x: Mark the EC
 reset gpio as reserved
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-6-5b202de8c74f@oss.qualcomm.com>
References: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
In-Reply-To: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=966;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=lICeJH7FbTZML8s20UqPhvppOoSoXqsEi+CRHP8YGKc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqlVAFCvmYmnJHrI+EBuPVJSakmSEA6HgKrEHW2
 I4vHT9iZViJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapVQBQAKCRAbX0TJAJUV
 VvPDEACB8FTf+bgq1IiWKhscjLynelcPwUCBClPJsr3udkigEGzyo4VCkFQjNNfgXDlWjuUJ9kE
 Uq679ukYhqflRhmH3WyWE3VYQY/5YZiiiQwFnpLctuGje0j1CUylCc3QReT7b5Il3QOrBEBvMhc
 Ex2wS7IfDf5KVtZLrLDbwcB+qqp0UQyWj8pwrosrYqgvkOnI2TRlyvO0KekYg3VIKkRGfKDl8oV
 xW5es474P/Lpjmtz+MM4PFKb8WLaMPAX95OVUT9JcSB4HWsjS9m555BXtP7H+uL8QH8KXB+zK5D
 3nmAjcBWx4HSnvmcdLpEvE6Tc2F6yUoHBGtsWoghgSKlhVu9s9Grm5zUjxxptITh8cHYpPiCsG3
 cacLcUtYhNrpThu7a0ph3J8vsCkNIATMzyHqYuK3gspfo8WQNVLoLkWNtLWVzkY/HozTJu0vunj
 9kPkZLexAzOK5gIctlD1JARbdLCojpMnnzDJBcw3x5gGdmKRhZZm3Unij0xbwhS8zlc8Na2z9uB
 q065TOpclzjJgkJGWaXUjGkYdti22opI+xnRppi7yz+9tTYWDwp+uG0zbMl1X/7dkZ8J3kQAVxT
 NCsyZxIwkmxHJ6DlwStTc5byppMplrf8FzOeAM5KYdPFpPrCzKPAwwNMmI9+gDhlz1j7NF+6OGn
 Tnu2xUiL7y7wm3g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfX8pYZ3fX2oGU7
 7zi+JkokVj5kmeuXIc8mBeXg6nMys3rBNrPFJKbfSa32Ny5uqEfvuwI0ZaNtsxDv5WRc7uv+5BY
 QASbp6xPXlNuO0ZFk8hXcAhyRePmgQ7LZdGwYWnYyu9FVxPvwcFckumr2bKKh8dadDvZ09Ib+fk
 Aajuw6svq/87PFMvAuOG+fPAZkPacFyNrwC8lC+WkMvHf35faqFXR1ouIYbUZpMIfqJWvQpy3M0
 ExTvQoZYiRE3GYheIAvrqlz7hR6ZmOCiN+wWlNdO3NY9/NfVVRF8iADXFja86k8RBGfWhN0c338
 /ehb9y6ELhGWz3tlveEbhrwt+MKg3/TNVVpidi9CPnKvVSRYDMCUTIZ6/s64XhHwWx+KphqZ+IQ
 bv8Hk8LcXgWO6xWU8gq5C4PTWe3bK/SMpPs7KVq1WU/2TlQ0ccMxl5ZoBiCmPL1+jZuSxqmeQpL
 mKBO3Uu8Dxy2URfTtwg==
X-Proofpoint-GUID: fueXnCGMOrAkK_ZtNi0z6HmIjLkizuEr
X-Proofpoint-ORIG-GUID: fueXnCGMOrAkK_ZtNi0z6HmIjLkizuEr
X-Authority-Analysis: v=2.4 cv=Eo7iaycA c=1 sm=1 tr=0 ts=6a9551d7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Ya5dUHNku1XCqAj3LVwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfX9mEq5AKS72Yc
 b3oZewZIIOi3R/FCPS3PZGZHTxJ2QlXVLdG/bQM5yz1xKf/3YWV/b9MM3Wf6vd+en9wF8KmBaV5
 hxncGzMXX3lrfaQJXz1y6J2UqHnODC0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310086

GPIO 65 from TLMM is used by the embedded controller as its reset line.
Reserve it to prevent Linux from requesting or reconfiguring it.

Fixes: 45247fe17db2 ("arm64: dts: qcom: x1e80100: add Lenovo Thinkpad Yoga slim 7x devicetree")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 9eb2dfd99f20..3e4ab58d2f6f 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -1350,6 +1350,7 @@ right_tweeter: speaker@0,1 {
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	edp_reg_en: edp-reg-en-state {

-- 
2.54.0

