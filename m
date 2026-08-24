Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEA53A2E33
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572501; cv=none; b=IPC65h/s0Gahki+o5Cu+m8tRVk4AXaE0B2SFYRzpCGEplYp+QW4tp1LPj8yNUvrFO4LEERP+DjY172Pu8i7JkMX0L0yiYDJCvsaq5heLbLT1rQj1ICQMO4N7gSI6PDtehD6kZS68dvQyyxKoXLY4HrI1TRItCrs/hIZgNHX65B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572501; c=relaxed/simple;
	bh=ILEyKxrSwZN1I2SJUcHf+gZ6fdeE01wivotuEyTrur8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sAsN4q0OBfktMT0aPY9xodl03yeY4i1KqTDefWQZm/gtqhYfC/X1VDW1dE8+Bv/EypR1UM7FnyW3JC3pcGkTEwUjW2v702csdit3Qh98WGYalsuWVRpXptXFRbHpfnVrxP0IgNvR7C+sJ9pgMWJ0yCPzih9pMN1LM7WjF1zhISA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HJiUxzyj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FEZQqqdm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HJiUxzyj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FEZQqqdm"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMcJU2372592
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k0JF61VynwiGhm6ZKGXkMg0etTJUCa3/RmwRnNWwAmg=; b=HJiUxzyjdvjmVciJ
	mHb6Lb15IL80tcAjngtjMFvo7+D2pchfH5fhxPtaJKt0g/85IQeq9Ml0TfeLWMKw
	lzkAsdFIc3w8cRHGWmSxe+WCCdQMiI4J9aF+JM5pkAyS/Grq35i49uVlGmmUPILb
	XYdK2x0DtUZEPsGMsfajBfFQOOuX6v0Ed8x2BRDXD6l5ncoGmnioM4qAEut6OQYF
	1CUGso1gegQ7N4c6O4Pc3p2SDneX5piD51j94j21v9n6PRq1MF1vy1FR/WjetQZI
	3r8Jyo3kDXn63GSS4K6XY6bGI6DGUP72m/ofBwm3Ou//qFO6TH4wksjSgnCq5DSM
	vCSkJg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdshee1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:54:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8e934385db1so39411016d6.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572498; x=1788177298; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k0JF61VynwiGhm6ZKGXkMg0etTJUCa3/RmwRnNWwAmg=;
        b=FEZQqqdmnWPHzy0CxWs7b20YHxMX6qQfmHFcVntjF8RY8wwOOr/2twwsDGgGClN1Y3
         /BjwOzUZ+ihftnL9+XCDjTw/AoTz3475ST58DbabSJYmcNtu7U3IWeOvHTp6ixvi2Wi3
         sA8MoNlBbH8TT10WwbhjfTmxS/g9cQguTCjQPPmMU8/OGL+SXJioLRzpaefzDsNer387
         GWEuVZrxO7sISDkopD4oyNpvcPmIjJCFp3CL4BXqPg2wbKE75i7WU8pFh4KvKLZduVxS
         6GT6gTkkH2LPxDYu3rfI9bba/nSeaqPO6gNizlku2aL6m1Rlt9uuejzMFLPlkHi0NEaX
         YH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572498; x=1788177298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k0JF61VynwiGhm6ZKGXkMg0etTJUCa3/RmwRnNWwAmg=;
        b=AVIdYWP8yLAcbB/KeaeEqdzdrGnZUJ4sL9bh4upFJETfYRCTTRt7uJiGetcxBrfeC/
         sfF94jiOBKtH/MHX0udyxL1mndn+YoESwbvi9j/Dp1bqrgopIUvNDnx4KcK1UKBNeqp+
         tC9tVM2xh8uK/kucyaQMDHacDakk5RMZuglKU8d0Ha/oVv289/0BUSTFPcO3vCnp+7Ot
         utAeaHSvzCTMlRtOwoQUboVweyitaaU8qJgFvHzjB/F9PWUEU2VyNC11X2sCrGsjzV12
         AC0WgrzTcXkVQ9RC5f5lgZJ3Zs35ANRqaoCPB0D1IUTWif9YlItL3M8ZMOD8R/3Y4B7m
         EpJA==
X-Forwarded-Encrypted: i=1; AHgh+RoGl082CRrDSOCg/QQYNgjLKSrOmdNvAKALYErgtT+u3VdwhI21lreI+taymG6o9GMGCPJ2L+M8gZRa@vger.kernel.org
X-Gm-Message-State: AFuF++k3BKsnmcASCYk0jI0MlvdqYkmETvJiSOKWjEgaSVHzo1oFDR7d
	vfCLl2k7idXW7epkD5ZA5LiQsOP8y+rI6o/m9YGQUntpr7sddCkTWdn+qAFlM6Gqn3rYJFEkQWS
	SzxO9hywtNFvuTfNtvvKUUKLV8X3hRDqgw24bVeKW3zIR278Au7DAvFe9fVoPl5Ls
X-Gm-Gg: AR+sD10ZgyZYqy2F12Ks7WT38Datr5sPVStGT2aE6c9FGdQvTxDsSchno0VPN4P6T0Z
	ZrS4zRqjwM53/Vn2146Kw2d+eVOtZVG7S8TuvthCIQYUBhdaXjWDkX/003gzaKmKwMWub1pFUmi
	wpFWd6jYg/8QiG5SRkCqImDglAo/Nb+uEClE44LJ5PV6ZR00UFHKtzxvpkT8/URqL1krIHnSk1F
	MyVhGT5BOm5Sjtha48Hp3wMX4G4Yh4EWJt8d/NSGEWYgEq7l8hwLIEOK0NNa4lhjX2MiPsCkLif
	R7nHSXpl/QSRy5sETOxx2MG4dZFzYLVg2nQXxz3IH1VIFfULMyn+wJc1EFkjy9aXdGIcxIKCGuW
	f48sRUATV
X-Received: by 2002:a05:6214:528c:b0:8cc:de2:3b5d with SMTP id 6a1803df08f44-90c80e00b9fmr244490116d6.16.1787572498010;
        Mon, 24 Aug 2026 04:54:58 -0700 (PDT)
X-Received: by 2002:a05:6214:528c:b0:8cc:de2:3b5d with SMTP id 6a1803df08f44-90c80e00b9fmr244489946d6.16.1787572497497;
        Mon, 24 Aug 2026 04:54:57 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:54:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:53:51 +0300
Subject: [PATCH v3 04/47] dt-bindings: clock: qcom: gcc-sm8350: Add CX
 power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-4-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1721;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ILEyKxrSwZN1I2SJUcHf+gZ6fdeE01wivotuEyTrur8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDZxKkhP9yYqje/1vsUTgRDvYC0DIYRPJxo4
 DJ2v+SU74WJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww2QAKCRAbX0TJAJUV
 ViC9D/4kXPXnv6MpIFmnrM4ZkczZSgtdyCvb/Gd0i3CB/9zxz11OV/vq3p72a6LdLtiVIg58fh0
 RA6g4+cVp2XXbHibNT3w0r1tnafLCZlb1+PLxCrUUiRZ7+0IwtnekfXw3Ae90b8cxRvnLSheh93
 j4x/IR71c4SrOibOhS4lVQdhlBMT8HbradJ95EJxadhgfZ9QOzmbnSpahE8jnBA+K+nv3TYLsqf
 mjHsQsT9LKB1mXcffYHnIc4lustXh1LRoLU/YNgl71kTFtgkW6IxvpjmUt10j9P5iGYmnSPWedU
 qmnRRSveXCDaR4UaNY+glzDYUIi0mlKIvhuSMvlU5okFiPHWUu2Xd+eBPnM0W9JTqqQiJ/2JInx
 4x6ihmCf6wg/HPfl7POIY206L/OnoQpR0hzzLrxowTgYEVk1UI0mWDWtP9IdofK5NGCQdKQoeYH
 IVdKR6mQqJtCuTiEroRKcEVg3mQX74QQ5RVCtklWUDKEe6wZln3xD2KqwepSh6C2Ej0W3i1/Iu3
 WfC+75pY8Om/NDVBaU/I6sE9kn24XNIVIqnhHYoyKWe13U9JBO+J9Zm+pSPwVkl0NWcnhdMMrZ/
 2t+0Keth9N3QLujdFhncZSnXTHuo0Jrn1LQ00gdAs+edO3W/LJPDIQc018hYJuVoAHdtTPbEYNM
 d0kdjZVROdoED2A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: -yc73KhZrcnsCg9aRgHPTrPCS9gb0UH_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXzeCsanbNVA/I
 vEjA/mS+cfyC9KVeg1YQhvYaSslpBIZWTIMmsf3v0okNochgwlb318eJH+BSU9B97YKAQmfyF9b
 eFVTpUIehgrhEW+b8Ebxng3NCVBC8mdhvIwlaicjYp4OlkTsblq8DPkwkPwr9Ay83GI6G5rkbBp
 s2bC/3nW6b0o3vnWdAo/dt2nsDLFbOWTja+vDxmRGqO1zmzn3Y3HRysWdCZVhfbObO7uC6060DQ
 XpR/4vA7JWErxoT7mkihXNGrh0ybTS6sUBe8yU2rWH9lToNDrUqa/AhsZ4USFvlvym9o9bJFda3
 7RAfW/Mz0dLH3CNyaJbW6Y1y9oCZVd3pwHColq5gfikYLVOwwga4tzDcYH87A7783gCezDIIVkn
 FX7wIVS+GKA5r2E7vZ5zd44g6p2BIEoJss6B8Q2WvNtp7IJBrsZeC8Z3nk3YhNhXlbnnW/HNEDT
 5HOorb+HMX0UJXmOz2Q==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8c3112 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=1VWmMwf-hiIXLgPH03YA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: -yc73KhZrcnsCg9aRgHPTrPCS9gb0UH_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX7gmRyANGyYA/
 4/JoZe5Cbj4XaUTaIw7Ui9QjF7JCqwXs4jHsK72UlHkRo9Mue/cMnqzDxRohfWpiHTbvvHZBKdC
 kov0XbfGNUeKHcv6724rtmoug9SE0RQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

The GDSCs provided by the SM8350 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required,
matching the hardware description needed by the GCC node.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
index 97ffae3b5522..d249b1574e0f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
@@ -51,10 +51,16 @@ properties:
       - const: usb3_uni_phy_sec_gcc_usb30_pipe_clk # Optional clock
     minItems: 2
 
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the CX power domain.
+    maxItems: 1
+
 required:
   - compatible
   - clocks
   - clock-names
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -65,12 +71,14 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@100000 {
       compatible = "qcom,gcc-sm8350";
       reg = <0x00100000 0x1f0000>;
       clocks = <&rpmhcc RPMH_CXO_CLK>,
                <&sleep_clk>;
       clock-names = "bi_tcxo", "sleep_clk";
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

