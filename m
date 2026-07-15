Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736D93ADB9A
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122181; cv=none; b=T5Fo6XEX4CM1iURSXMXIepRmrpX+NEeX06czmEq33n0cGPBMMy6CihbQDXSI/yg6/e5ZsHNJl85F/gMawBabWnm5SaQY2N8gglowvg2VyFrxzvJcEikISTn37YkKDl7NPJqVGLAeC4kFQvF+3+/7GfL5yedBEnFf0Zwo6koMdwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122181; c=relaxed/simple;
	bh=RG+2NhTeu2iLP7GDKQnZinA0znM+EU9zjm6IEJ0H2G0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fpsqJ+kO+mZoU0SHhrNQA5ZarIdtPqLswVCua7nAHjZMgR1IDA7iSmioh7ugACVP142AKfbYmrQYLh6wdfrChE/YMxg3Y/IJblR90D5htLsyQl18u/HATZT710odKRFHfts68wNjc6a9ApVJU1pUzZ+G9TChjuXKPvAcI/QSl3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k78hml7b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hleppy/o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k78hml7b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hleppy/o"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcf0Y3599439
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:29:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jytwvE4MoycSrSXL8N/TT2deQ9+mZfWatCBgM+WxdVU=; b=k78hml7bv/O8HC8z
	QOhOoVArWpIOSde0mUpi4dYmFM+n4/HcCaKHm4fAizjTHSMDRmIZEtPR38UpIORi
	E02kUjYGRfE55slqc0aYlF3ZYyZ/e9Hc+N1CtsdYv5wErxWD6a2K6v1MZ7CDLVMQ
	bsVSNwlvNpX4JiGWcBdxrR735J+aJLq8hVKw63z5l2TCyE9IbsvvLesnSP00QoF8
	zU6/h4F0UeVg1tlBb36nbTtcW0oi1XAQ9EKGBYActIZu/QZkCzI345DRYHfR7h1x
	R27x84WrhPpSFjfGUYFN5Ij/Zsd91dFS3ZKj7LcC8FLsR3/FWYCUtk/Xmw+3QqqZ
	oDnlbQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7q60uw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:29:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e538afe65so605592885a.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784122176; x=1784726976; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jytwvE4MoycSrSXL8N/TT2deQ9+mZfWatCBgM+WxdVU=;
        b=Hleppy/omjp0vc16r6KEbUD1g2SW7VMYc3CJ7/nbTDdjYeF/0uFyUL0XxDDxzWOdS5
         /TXt+WQgmbQh/BKIQId0zjOz1LElsV+AzhMu963FHfJjajmWR2DNs1cFtLIrBxfzFydX
         ZuogBpNF0SrIc4085XgPNt4fJ2y4HibNrWpl5h25vf3SAhI863UuhbmK7pudmcyZyHPh
         paSV9QxeNy3+iINRWvSMuTRmJJJTKfBTByAVaXOUE225ttIT/XpTKze6kTMp6Kj1N8mA
         qUdC7r85WyiRBqkgjSMPkjpbxFUuhYAhAY9hIPNdaSjpT3FFeowlrpbEILequ4cVnd5Y
         WV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122176; x=1784726976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jytwvE4MoycSrSXL8N/TT2deQ9+mZfWatCBgM+WxdVU=;
        b=XR80n9YPKMdi/PG8Ed/WrEE4DE8ttciGR1I+gUJ3TaB8BNE+hWGR+Tnf+TaevhR0Li
         bg/3KTHvWOw0+O9+Cnc6b0A6S/RHqyEkn6DFmugyZved6udh4IFEMT8IfOoBSSYbD2BY
         Fe2k2eayatHF4g9SL8RTfgzKwFoXLvcEWrub2ANaiMmqxw/5Z7xI0BJJmvTPjWNeZbvL
         OdQv5Dp6POtCKfRBgYp6ocdM3TlKODNW0gCaQruBNYg20zYIYDobK9IdbT4iecHl8kb9
         1XuhGOvCAP3ZTyjU2nB5+0dVli9Jaj2/WkK30GGNPH42szAFsQkkZFAFu6jxHYnvPV5M
         EAxg==
X-Forwarded-Encrypted: i=1; AHgh+RqOKuUrDzpbMApSjTbajH1ZMxYa1bqcm5+8gd2X+kBdqDKsD3aAwY//woN/rjRKbIiYInGJa46HyANT@vger.kernel.org
X-Gm-Message-State: AOJu0YxaqPUBwbxfcB0b3IfTYAibv0BYKlkrvGRfkB8fiG92QGvj44cq
	q3fh9GX6+kO8BfghWSqtulp/pk06U6IhZ1kGqz5Ur4158L8cghr7zT8aNrgcna4YSWYSLVNmwRX
	OACv2znt8txWCPqN++g6Ym2cHlXHzRHLcucnHtP1fa6QinJpqlv+ku+7cFwPTwfUW
X-Gm-Gg: AfdE7cm0rvPxEPEEh+7mz1aRFfSppfomL+uzmW1s0aPXkZ0/SaYBfp3n779r9sH04AF
	b9p5fP1S1ghvlnKx4SzAGILUKjgM3lmLbRNjSPSC4rMHxpaborNZxChd9u1fatMhs6kMro3omRG
	MVyD2/cGZGX3J5nkmMsfN8p/2nx2e7zq1596a9+0x5IYSGcPrGLKtPM3o71UWMogTy6j7Rp35If
	0pFDSl7l+FHSOuwQzsH8wi8148Zd0eGkwRn/cnd9/wD0gECPLOVEF+kJXrQFUAOg8+rPPoFq/as
	kfkNpN7pVlMkncemEaXCoe/11YvMR4v1v++ZXtYZr6SJiTxgUFkvN5RnhGysYphQ6vckm5IeaQH
	+XsdV98Y1xcUj/3E=
X-Received: by 2002:a05:622a:13c8:b0:51c:167d:b346 with SMTP id d75a77b69052e-51e4237c4a8mr58336441cf.23.1784122175449;
        Wed, 15 Jul 2026 06:29:35 -0700 (PDT)
X-Received: by 2002:a05:622a:13c8:b0:51c:167d:b346 with SMTP id d75a77b69052e-51e4237c4a8mr58335251cf.23.1784122174104;
        Wed, 15 Jul 2026 06:29:34 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a9cesm16945760f8f.14.2026.07.15.06.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:29:32 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 16:29:14 +0300
Subject: [PATCH v3 1/3] dt-bindings: clock: qcom: glymur-gcc: Add missing
 CX power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-glymur-fix-gcc-cx-scaling-v3-1-72eb5adad156@oss.qualcomm.com>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1929;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=RG+2NhTeu2iLP7GDKQnZinA0znM+EU9zjm6IEJ0H2G0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqV4s0s3bRGOPigrskaJpqSs8szumcn7kNdh5P3
 o4gsx4E0vuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaleLNAAKCRAbX0TJAJUV
 Vi3OEADJML07IVNxB6pIXf3WRfjJjI9Ren3d7ZUMSeFVQbUP1DQA041jplay8jhMmT97HCewTWi
 uG6S/H+fo225Jda0IfI+YRVJRV8Vo17XlBLwcx8fwNJUMCERxicuj/iplPvzMALYZSJhN5O5YyW
 iS884/SI8olEG06i63T1B88hITtgsmOR8n+58fIqyFxyDF6dp6dTb5/47lGieAX4izPRXXKiMTs
 dAGRIwSWHIlySjg9sP68razQBscVil4KBQTX62PHLVWX4E0Gqp4zhISpPffP/rB/6cCUtChc7Js
 IZjmUE+xA7OinayYkAVKOv2pkUmXu5WClGo3H/pcWVbL5NXIZkGo4MG9HdLy7ilRvSvLUGmqu0R
 VBN9SbWvrMp5LarFEV4cVw61HXIG7WW0GklrWF4v+811OaAoXDZw22te1S8UGdEdp3F5S4RFk76
 cs42IopPSB832FdkNpAo7yDaqbivEzhlwzoYJeROYChwpCGOVPE/wG3evraQ3ccWtYxHa753Ets
 ILezYRzyvx236d0C3L0XPaMav+EJNJriuaJcAf2vstBFdZD8SAU25rNlW/WARCHqGQOPAs4C7iw
 WwMLuj2qVYdqWEYc+72C8LyzIrIQhkFc4f5P2e2WEZLLzB8eO713TKelZERqwwwvsCIWf5zKhKZ
 fl3QtlEIozqVBhQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfX7oF2drc8R12W
 lxuGtRKes+n7c60OFU5Gv4BeHVWfSF7IPs7jbcmrdtYzCiLJ/kBJMKmYuLi9kIyw63lKDqMIQdz
 WKRhh55zBTsWL4Fa084JOHdbRPZiEO4=
X-Proofpoint-ORIG-GUID: tNDfrxY4uW8auwSdE9GgtgJKNdZmj6dB
X-Proofpoint-GUID: tNDfrxY4uW8auwSdE9GgtgJKNdZmj6dB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfX+yliUdY9QMRL
 2/1nuRudbQ3Ky/EXEscY4ch4nwOfn+DbqLC9cpvoj3s3uy1RKB96ZVxERoDqLCGCqwIrNnNLhZQ
 KrWt1LdMVuar1XuicC9VA/QRWpSTqXRdcKafX16BODiwwWtzJPwJqzz0WEE9d/umWg+8vGIC/PU
 i3/tt7vj2oCsK4YPnpEbOL+GdLr5cluHp49QiF+85o3EE9mPPh2gmGpiUmEp9b/zLrmiVPQpCSO
 UM+KDqZxgWyTvaOGl/zKL20iLfeRMw71usWpVXPHWEORtTu1l+CMeZR0ns4LYVFpP1HrlrblhlS
 GORQBFDg7F/pXmdVRHbmFQqO9efgWl5s37qWOpzKN/xw1X3s3kyo/lpQS760zKj72sH/+e9huBX
 YuNilEF79PYDRT5fLGh4xZP0SRm2sgM/nYwqxgfLDcNUHOO4RT3e0gzD+U04W78YNxYpSAsSqdA
 BJFQE6zGYTusfWh3m5Q==
X-Authority-Analysis: v=2.4 cv=BajoFLt2 c=1 sm=1 tr=0 ts=6a578b40 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=1VWmMwf-hiIXLgPH03YA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150134

The GDSCs provided by the Glymur GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required,
matching the hardware description needed by the GCC node.

Fixes: ee2d967030fe ("dt-bindings: clock: qcom: document the Glymur Global Clock Controller")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml
index b05b0e6c4483..7a4054c9f215 100644
--- a/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml
@@ -65,9 +65,15 @@ properties:
       - description: USB4 PHY 2 pcie pipe clock source
       - description: USB4 PHY 2 Max pipe clock source
 
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the CX power domain.
+    maxItems: 1
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -78,6 +84,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@100000 {
       compatible = "qcom,glymur-gcc";
       reg = <0x100000 0x1f9000>;
@@ -113,6 +120,7 @@ examples:
                <&usb4_phy_0_pcie_pipe>, <&usb4_phy_0_max_pipe>,
                <&usb4_phy_1_pcie_pipe>, <&usb4_phy_1_max_pipe>,
                <&usb4_phy_2_pcie_pipe>, <&usb4_phy_2_max_pipe>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

