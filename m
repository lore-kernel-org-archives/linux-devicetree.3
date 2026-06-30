Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24376366836
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 19:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782846221; cv=none; b=neSnaa7CYdTi688YM07Czb3uQAihNpz+KgB2X7cTOknLkc2SRNdp7yLuJiX4Kw+U/MuJ7FCyVJsTe7Sp2nrUR6KjXkMcMjxcsXYcA4cfCi8HbWnFna8CZu+eWJUDoHgbw9TqpumP3gjSmyaAkjn4shT0Jep2migA4uhOZC/tsBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782846221; c=relaxed/simple;
	bh=G9NuEUCFVaxtY10oIrUXU0lQ2ELQ2IRw99bBy7IKbvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gs7nJgfJXjuQEO0xnna8hC+q1qIHzlxauKx57zeSwZHieVIXdW4RLg2OUOjovE07b7zB3R8zM3qEcChnJOg2HwwdQkDjnaXhbOScM34VFEeM5s44tKiGHyPrYmL10meNsKmMfrawSFyUCVpmwW99L/ZRy9Sgy1+kx5/mVI27Qlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y6134SpF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=haa+EnNR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y6134SpF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="haa+EnNR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UHkmmD2723898
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 19:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FV12mCo2AWWxRhbF4a82EfY6HMBsszJrd25mPZq5hTs=; b=Y6134SpF6Qu5ds8e
	ycmPM1I3ItOtsiuisnT600NgOocxPzStjEoleO9G00qfnKIZ4nifXQf8IGO1sSaE
	yRu4i94n27AyKOSwMdRKIzgje2UJ5Lv+9B6/jhOHPPaQpCUJQLCpaY3d+EFxCVRB
	CivxGrYcKJhLVuUqJz+Env3uqHWFwIj+4MnaqovUqL+VO6uTi9cYcU8l4xXg8hxd
	yd2Gy0a2B9NXHNjnN9Ww6L8urXi53GxDY4ExRUrZLEJxlz5tVXsGihgDa+e9ujuQ
	x+hBBtRqJ5zwqsXv7m1yyE2hoOF070udOnBa/qcBWD/hXPgDVsFgGRvA71l1RY49
	TcWVKQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4avpts5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 19:03:37 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30b877ee493so1553809eec.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782846217; x=1783451017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FV12mCo2AWWxRhbF4a82EfY6HMBsszJrd25mPZq5hTs=;
        b=haa+EnNRvZzIrk/O7YlASG5jwvjG/2y4FjBR5lP/1m2Kd8RnAsqiWR6+DA488SGMIg
         BRsTkHYkDgUCdvXFQjBKxNmnyG8F3cVzQfaGtn3Z1ImfP6gmGUA+uElRceppj7DXFHqs
         HT3lcv4BPLz1dUVeUIpMRXPBkR1AnO5qulv0/FABnvOFdWHjQAJxSp4tRCGBEMHmyTJg
         KBr8o4YFtIIXR0tADK6fbTyACNYI3lmL+wIbYkcVQGl0AQ8w8C/e7iB7b/zWgApipg2Q
         lYLYMO+Js+dfB1tZ9p3Xsm83f0AxcHSple0aGKPD3B2ApgBhqnlOaccx6fQW4YDwtFEX
         oKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782846217; x=1783451017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FV12mCo2AWWxRhbF4a82EfY6HMBsszJrd25mPZq5hTs=;
        b=G2NrsQOC+IwJ4iANfIxYNGDo+T658PAwwBm7jUYksfJcTP7QeOtyu7k/+G3VdBrHfU
         /ChljcdR9jhQYqNvqhGZOLtDMZEj1oPf44g4p1RaganfJwxsQ1d5MJiiAUFm6LbnCRUH
         NsjjKDMeB2ZTib0NJCdfvtZa5AegVd6Nx9VUF7glPWAMDf7VMSuVpfdfGBnjIIG/ASGg
         wY4K9G5I/ObE+EOywrX+HfYCqTZiqPfYLpJBdTJkfuCpOTc8cLdffxRUnk6I71ypxhTn
         4T+M5ng02ysGEg/jy//HO7Uzn55pMLGslYLP94vjDCtQyfFGyr7D4KOLbiWDCM+biy36
         YS7Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro3IFws5CnKXn6xrpP6Tdiyar9lduBjBzoM8/UBKj/Up3TzGGkUWuM/8UdViUwk7a1Fjh0Te1bUqMyE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4R0hZJGknS2NXqZ4ID1jz0Q7btsVPQw2hm1QrA3FOcDVUQDJp
	vjky3mpNIWLAY5VNuuEMvi0Yc/ZWuKP5F0v1RkKXYR5HQ/XqJMyWxyPhIciB5SuIJ2+rrupnVNR
	9+xTjpH8H/rGfJJ6DjsLCUQLwlXW03HmjNs1VlybfC0sDoIQWToC1maHSuhOEvOSz
X-Gm-Gg: AfdE7cn2nbm2fFx4EX7ZMJqrnClhH9G5bHS0MneC2v4oQhhStbtZndS2yVNi86po78K
	lp/rfEhj4Kyiz+81dcsy7b68y9KPLb5mo/ixs+fjQPe5FYde5ptlHpmyA/6ya0tqgp2sLWP3E40
	46uJ4/SXiEOMtKpKA3QEPBDHkUxWDcz6ybLs5sVptOJlr4tUy9kvkswBWnoOz35sDkm8BLxr4it
	sL8yLGi1AuywXkOmX2v2LGQm9N2u03QP8Y2ik9hluO1pzUdKqe616DgD9GnCaim9augSX7+5B4b
	JDW1p+dMA6OjL6RCk2tR5VmZeU6FARtxAR7wbQ7kOGEddjV74TUqLKnM4e+86HQ10Onu71fy0xT
	ix6AuUIfVI+Xq2D4jeERx29YD2w20h1a59JQJX5UirU12TE0=
X-Received: by 2002:a05:7301:46a0:b0:30e:d6b3:ba54 with SMTP id 5a478bee46e88-30eea0fc2bdmr1565941eec.17.1782846216869;
        Tue, 30 Jun 2026 12:03:36 -0700 (PDT)
X-Received: by 2002:a05:7301:46a0:b0:30e:d6b3:ba54 with SMTP id 5a478bee46e88-30eea0fc2bdmr1565901eec.17.1782846216246;
        Tue, 30 Jun 2026 12:03:36 -0700 (PDT)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm14963815eec.15.2026.06.30.12.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 12:03:35 -0700 (PDT)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 00:32:45 +0530
Subject: [PATCH 3/9] dt-bindings: PCI: Add bindings for endpoint gpios
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-shikra-upstream-v1-3-e1a721eb8943@oss.qualcomm.com>
References: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
In-Reply-To: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782846191; l=2200;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=G9NuEUCFVaxtY10oIrUXU0lQ2ELQ2IRw99bBy7IKbvQ=;
 b=3iFkILvz6Ich1wFw6kF6CgoiNAp7GPTE7OmP5ZgStMcDSZdBrMyhCoLHdByPX06m3hNHkFaHw
 ICdc5q3F3b2AFGJIuEe4GmSzWB1iOK7nu3PyCCLt5wJMZN8on9w5JNO
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-GUID: RYQ6_m_TCEMJD0t-mCoidDvAyVv7ft0G
X-Authority-Analysis: v=2.4 cv=KqJ9H2WN c=1 sm=1 tr=0 ts=6a441309 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=DMjCJHwfCTXkfbozVOcA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfXwfd3LVspsisq
 6ErPyJ7CTP94DrL2aTtffbPGOZ1xW1R+qo+SgaMK5ELUwfrk//RciIf8qCGntuM/R2S5FnN3TCS
 TIWsOC8isXm1+vof5wIQV4XGI8NUTeGh3mQpAQvXskIbwR6hZQbzFrsdqGa3Za5AXGNzQn71+Ov
 O1Fe0v+t+l3mpggnl8OIMP3S2qk4rscQsNaY25ON9shlkLq1gMD4ghFm7MbxxNOQ/vIZQCk41jv
 2hzq/fF8ILN6P4mkAAkxXJ2Hyl/Z9q5g02mHDvlk4fMlSdM12UQXaRZN6CsrFCRNGYEccXnFHD3
 2RpZvBTEV++ZBo1lZ4Hwa/XsE468LE0tFI/Eap6V64shNtPM+RhxpWBLdb6fvs1uMBegZJ3ZjXV
 BFIDEd0Mem5QhT3ZNlv8V2BVSoWyxOYwK06GuJ2Qc+6eur8+UWoKg2VhivsZX8FCDUtxpAvPChX
 ti5zRcF0U2iNnlK5pVQ==
X-Proofpoint-ORIG-GUID: RYQ6_m_TCEMJD0t-mCoidDvAyVv7ft0G
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfX699GBbLBKV98
 15KXd1ljwC2LbbfDnUS7JT/qWJaSBu4Uq8SLlXseOSXYfUgMBIf13M/ML3G9ZdezdqCOhRxhx71
 wvh8drhtC314OMbjMN/f6gg0fqMPZ8U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300182

Add devicetree bindings for TC9563 GPIO's which are
used to control endpoint power and reset.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/toshiba,tc9563.yaml    | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
index b3ad05d90201..f9f71f28aa92 100644
--- a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
+++ b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
@@ -26,6 +26,11 @@ properties:
   reg:
     maxItems: 1
 
+  gpio-controller: true
+
+  '#gpio-cells':
+        const: 2
+
   resx-gpios:
     maxItems: 1
     description:
@@ -69,6 +74,17 @@ $defs:
     type: object
 
     properties:
+      reset-gpios:
+        description:
+          Specify the TC9563 GPIO used to reset the endpoint
+          connected to the particular TC9563 downstream port.
+
+      ep-pwr-en-gpios:
+        description:
+          Specify the TC9563 GPIO used for enabling power to
+          the endpoint connected to the particular TC9563
+          downstream port.
+
       toshiba,tx-amplitude-microvolt:
         description:
           Change Tx Margin setting for low power consumption.
@@ -104,7 +120,7 @@ examples:
         #address-cells = <3>;
         #size-cells = <2>;
 
-        pcie@0 {
+      tc9563: pcie@0 {
             device_type = "pci";
             reg = <0x0 0x0 0x0 0x0 0x0>;
 
@@ -120,6 +136,7 @@ examples:
                 device_type = "pci";
                 #address-cells = <3>;
                 #size-cells = <2>;
+                #gpio-cells = <2>;
                 ranges;
                 bus-range = <0x02 0xff>;
 
@@ -154,6 +171,9 @@ examples:
                     device_type = "pci";
                     ranges;
                     bus-range = <0x04 0xff>;
+
+                    ep-pwr-en-gpio = <&tc9563 2 GPIO_ACTIVE_HIGH>;
+                    reset-gpios = <&tc9563 5 GPIO_ACTIVE_LOW>;
                 };
 
                 pcie@3,0 {

-- 
2.43.0

