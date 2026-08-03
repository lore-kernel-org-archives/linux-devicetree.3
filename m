Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649523B992A
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 09:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785747835; cv=none; b=D1QQW3j/MAfJLW1EZF/1veQSENZM3s8LpHfTHwSmIJzsyPJushfs71TeAHft9Ix1xjnmSxv3Pf/JXMLVarqoLHsRrPyziG7irY5S1jSDdhqTVv6yT3tS2Ms8x/04ii8ty1DZ2fcL3z5Zakdpwax68nhzA70dnXpTKMagMTuM3E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785747835; c=relaxed/simple;
	bh=+2ROCb6kqVvx17mUmZm+JMrsgCHyyS4gQ9bjeReqjas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LUKTSkBgBZDdHBVtuDDZ9sOa4WNiuKQZ/a1VqNjXcQQmabc2qVk4dL4p1ww/M4R8i0e6ThdiDktvsjXWf+KdnEGSEQvI1meSLpujdLU1egpfaF4XNXZ/CvqK8NHPZtkKlrkx2JlFALKtjhmeDrkFltBKu8aYJLtb4cPiR/1ZQyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m62+xJNL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GJ/5K2ia; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m62+xJNL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GJ/5K2ia"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736F4m8005963
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 09:03:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NdZFtBZ8aaJXcDnF46oSRjvRUH8o02DrQqlCp10tq1s=; b=m62+xJNL5T5bRnM3
	usoFldlEBoPKV7hqAaUXtow9nZ3lYXrY+49HPqbP8w92hJfDBJId6KdGGls4AhkD
	yCSMRaYu1u0eUWADsfXhQTi89uFJaenOU9FaJoX/hw7GQAaDOsZd2ykEbAYJnxs5
	Ve2zlUOcfpgKDlALx+5WKsiE1yc3UChK9VsWtQjGBeaaklKyGugULSI/E2vjPp66
	YL/s5TKU66SC4Ihc1jk7VTchlfRVYN2Z4k2WResebU/pbRV0ylRicpKMSAfNP28X
	W9mAQgo7lWo/68jQsGvQDsUDqTnPTllweDiD4suy3yur3VtoxyajoHZyd1Ci72wE
	Qg7ETw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnj78q48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 09:03:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a236220so27270881cf.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 02:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785747832; x=1786352632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NdZFtBZ8aaJXcDnF46oSRjvRUH8o02DrQqlCp10tq1s=;
        b=GJ/5K2iab8U36ZPlQU3HbvXQhqMKOOtK72p+Y2PoWtH2rC0gvDq9KfkWTbtRnQ8R1/
         96/STS1OF1pq4yw9ye+G/qMLovYnX7/32u/hdCRqc4qeBRVWvALIyB8LVIDHGmf0ehaA
         1iDcWwd6rPTCm38P28e7CRFpQoapQKiJH4P29Z8jt2TuWFEj425ikC1zDMnJgBJ61X/Q
         nx/ggofWiojG84CUyYOhT/vlM8k99THDTObtDqxVIJHIpRbgj4Yz8bXAdpy6s9d9ri/x
         O96BolcZ/+bhDqtDyK8GD+zQsIuhNVf7+2yNkkIHe33kKBeEeUsNf/wMGilCO31l68Vh
         XY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785747832; x=1786352632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NdZFtBZ8aaJXcDnF46oSRjvRUH8o02DrQqlCp10tq1s=;
        b=LBrqt00RP2T6MbZiaj2HMcYVS582njmUU5alPuY4/N5+HBnkfGSy/P/fO62k72hrEE
         eP3D654CMeqhNa8ELMnoGupylF73GEIDnWYpf6nmU8EPkLJKix6jCsVEBIntCYgr/IsH
         xoWQM3dg9JVY08csI7+jXZqIRfUKTEId6++0nmbrw5vzDOpoijtx30aS7PijZS6mc1rh
         l8cSjLJPU+HKxY2ZymSlokVjvfQZHeoEHlyipuLPRmy4lu5gVDcSv15kV3J7ZCv+mDlV
         rX+68X6P4ZxsZzPJz17DHrF0tLn3HC36mIbsfp0AyTRwuPzSrhsArlDJB5sR4XiZkKU7
         mAvw==
X-Gm-Message-State: AOJu0YyIT/wFYezjUNaTav1p+5VOM+YEdR7T0r49O2mbk7NDYGfziPIL
	C/tuJTVs1B7wGql0SWYUi6B8JpdacXKTTtADCMW39EM+2FluHB/ldh0dBus+q3v4Orllys/iMqI
	Y4OjDsMFyOKGR0/PUfGYGiC2LQgS1LVSqLvsxEw+KRGB1as4uOaBnQMTC4jlwNZXj
X-Gm-Gg: AR+sD10maycWVboroINeOOiUU6PjeNnXYIGF136jawcMryYBGHim73hjtJuwWZkDy2X
	itt3DZgyvCgkavuYHizZ0P1rnUZNh4i7/VYBKv79JRMvcgMpQ6BJz9wJIH45t8hw2f75eT9e2l/
	5sGMcD467bY6oeZ4MhpfatqwafeXeMC0bUyU+Da6ROclVSJ/S/NUfuo0XRGXOSL2EiBv6l2y+Eu
	HVKtHN8HlCjmRuwE2wjjbydqZwndmIb1Z3QQ0osQGquDpNJcNK9wYgptFHKMoKp0ptnnUD3tPdX
	4bF9bF1OTIhDG2DTL1F+RPtE5RVoYFsZDYKFMWZyv9jUGebO3HBYxCECxOBZ7uA7NI/N/Evd3pI
	thlrDoo04P2SLP2vnMZHZSicI
X-Received: by 2002:a05:622a:40c6:b0:51c:1f97:e852 with SMTP id d75a77b69052e-52b5675e4e9mr189006611cf.6.1785747831639;
        Mon, 03 Aug 2026 02:03:51 -0700 (PDT)
X-Received: by 2002:a05:622a:40c6:b0:51c:1f97:e852 with SMTP id d75a77b69052e-52b5675e4e9mr189005981cf.6.1785747831020;
        Mon, 03 Aug 2026 02:03:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6d7sm31858493f8f.19.2026.08.03.02.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:03:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 11:03:12 +0200
Subject: [PATCH v3 09/11] dtc: dt-check-style: Add test for trailing
 white-space in DTS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-n-dts-style-checker-continued-v3-9-6c9776928cea@oss.qualcomm.com>
References: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
In-Reply-To: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1226;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+2ROCb6kqVvx17mUmZm+JMrsgCHyyS4gQ9bjeReqjas=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqcFldtQyprT9erdnU3RSaJWqbDiQIs9r5kTd+5
 D4AX4f970aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanBZXQAKCRDBN2bmhouD
 1zz5D/0XGNivz4p5Pp6OHSNssAdvArdqq+EXzlVY5dYRsnYTF5OY9DK0/ChrdNhhE2FvdA8qFLI
 DhjOxDxpuqObj1mNtuQBR+wHl3ylJ50sOCmAPSYN0m8SKsHLFIMeYJ+bMiOn3rG4NmyB33nZdfy
 bjTiEGxbRKyClA7NBUccTjvDaCvOWUlxAOTvMsb0d599toYMq68gvTPz1+ARjkmznv0Mnx/9gWj
 erU2FSvefnLlTPQe+awz1rpnlBVbALm2Yg9cavd2fJ/QGIIlyiBujr4123wHX8K7qdJN3sVt3iZ
 QLtk/vo4586sq4rHkniN1pjr0oVgsept5m9LcOUcblnIADszMDsyNAD1TNUGkz0Cfq0BIo9GtSV
 WixMhtTl3fbWJuwHzXwCFiwGYHnK9ooc4Yt4xjHBy/Rqsw9xlg30sn0lCd0y1rkcrG9Hc5zQ47g
 Ne8U4dvujCHTQOTLcPQWKjcYtirn3Ola/XNGzVXqPxQWTNDcsbnOvbQpdmwC60pzz8UGslRTV6H
 Uv2SE5qXpgF8DDm9p4WxexhN3ZWwC1oII/RoYMou429dM7XupqMsLVKJM2Y4x0bSidiU/jL5Bpe
 lT7YxG/AA6i9BpyPL9ZvuYyUDOJYKegt4WN9VLGzGauAakUKL/Tw+u4SWo46duQiU4ua5/KWgWu
 0N1edsB7vjUx6Cw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: bv1-pWm0xCFEWw0XW1bS5ME3Z1X5xuJ6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MCBTYWx0ZWRfXy57LOdsJULp+
 fX5QcM6pvjwBGXV9r3snw4a2To7umvkbIDsTJXY92rmHia9WKimFpUI8xHdfhXIIolexj5g5Mm1
 +tR4BFXp4mi9BpZTlphfUeg9Ya5JJjOKWmouWP7puVhJYy2uQrCcx4CH0eBWi1vti+zTZ85JOIV
 Vcwtkc20lp1WbioJCW1MUtvk5yAFb946I++DLeWDZhdeUvp6KjAKAbIdZ2zzImdy5KCIgOupfCH
 n92mYKpmU3c0neaxqHHwGSw4kizI1zBOcJG3Ugszqk0vZeTxWkUONzsC8m+AqyWv/v0p6/U1sIc
 6fFI8UOXlbx379AVhDJvc4u7vY1pybr0PA63uyXGYrmoD81h+wfAl0430fy4bekdciuwjPQhkVR
 y0aISFLP+5UNBMQeidS/eGiEpVA9zcyombBIk/NJJLnEnL85WLkdsgoMLfat6Wfl39ee4P/n7Nc
 roxH9sftszWHHZ6Detw==
X-Proofpoint-GUID: bv1-pWm0xCFEWw0XW1bS5ME3Z1X5xuJ6
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a705978 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ZteHwOODggqzs_94cHsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MCBTYWx0ZWRfXy2ciQj+xu/X9
 Nt3Qg41lZijtL3SaV5W/s95eApzfNLGz7P3VGB2ht5OJ28rQT5ZPsD8oHJVqvdMJ2itw3VV4SMz
 8l1NsaTW0Uju/QtdsKD9AmUqEoGbT6w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030080

Add unit tests for expected warnings for trailing white-spaces in DTS
(there is only one for YAML files).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts          | 8 ++++++++
 scripts/dtc/dt-style-selftest/expected/dts-trailing-ws.dts.txt | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts b/scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts
new file mode 100644
index 000000000000..1eb24d91c640
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
+/ {
+	compatible = "example,test-board";  
+	#address-cells = <1>;
+	#size-cells = <1>;
+};
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-trailing-ws.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-trailing-ws.dts.txt
new file mode 100644
index 000000000000..94d9ae9d616c
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-trailing-ws.dts.txt
@@ -0,0 +1,2 @@
+# mode=relaxed
+bad/dts-trailing-ws.dts:5: [trailing-whitespace] trailing whitespace

-- 
2.53.0

