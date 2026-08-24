Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589FA3FADF1
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572520; cv=none; b=FsVlrdVoGYCGQWJWRzjLpoTJ9T6gcBBixTWxOzIgh2d75g0HnAWsvk2l+JHNXiQMpfHvyqL8gAcJM9/hF4sQnjIqc5IUixqmb+Wv0gP1AF6IvPfLRaT+cDZk8cEtrtFh2CcU+J1J7KNrPd373fPFf19Uyf78i8E82wVq0APDnVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572520; c=relaxed/simple;
	bh=6qFf/kDPw9tgUbvy8kWxoeUEXj0aF58lOGYhG7+ZlZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EvpIB6201ewasvpmzV/FoCMWWG9rbZ/R/KwrCLIMx8Gzh8leRFkhNHVWmC7a6032JjzZAds7bgtxv/FZBU7ML7+wZLLqmG5gkr698s/u9dp96ttyeMCkgQunGDK6X/f/qXUTJmq8woEi+bN8LepD4u7Ju1iCwBnkhqj6fdcrJOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LsexOkjX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uq6/Y+nt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LsexOkjX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uq6/Y+nt"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMV2k2647985
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e/IushsgO7MvkFlfGxM9MPtKLnaVKr9D0ywtvvyNu7c=; b=LsexOkjXSwQjI6Yr
	TwJw0iVIoATib8H1bdxA5igmvu0+GIw16P1jZvVv+7JuV/ewX73nrufrCUZ8erQ8
	QV/B6skkzbBx/t2UagJHU7QYnpd1+LdHPe+OOPgfgt8vT0dRzJ5i9MM+AUF+Jqzj
	pWztDfO8zHkD0NqGxuii47VhCBwa+pgdcisOZrxNBJ9UXCWCYjwmb4yqQXn7wxjD
	OiF6rgbplWchRO3ZfRBfcRAV+p16IWxmROiSKeMmIH+gA0V0FU/mjTu4qtvgTB6q
	BNR/LR97sKdtIqmJF8qN3v43/HToZTHJBd4CO5oUolKN9PQizU+nQF9VGYTFHoeW
	vlx5Sg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gqn9aaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21c01cf3so64364381cf.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572517; x=1788177317; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e/IushsgO7MvkFlfGxM9MPtKLnaVKr9D0ywtvvyNu7c=;
        b=Uq6/Y+ntFM35YMmwlvNkzXM7UQ/bSCjGKY8V0Q6wPFHZZhqPYSJfRImlIGWS10SrUi
         EcpGPynQ/udtNSUsYXmQTMieA4y1/lDnWdMelWmqng7xHqDH0Cd00L7K0qRBHqp+xmSi
         BSVHMo/oQ3HVoRodTNOZptsp+8FDs0z2bhGQmSDnfMJQWmug7hbVORFWieWhE+0ZzrcP
         fyi0jUpH2GuPbQQVsI273FWyM/dR1LxqfAV3M/eesj1v4o0WynwedcE3qckM+lvL3NLD
         l0NsWP/bM5CDK105WnUZLO+DOK0+xxj/RRXbEs11DY1UTcUa+h8vR5xBxA8HEfvT6PYv
         cteA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572517; x=1788177317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e/IushsgO7MvkFlfGxM9MPtKLnaVKr9D0ywtvvyNu7c=;
        b=HtT8aSn8olDmxfaPjMxqY4sc1prjNd7YT4yyNrtA7t/PEfip53DkFjJlFGFKk6jOLs
         aYh79/TPasY6DTohxVZ/gi+mCcd9z0Ar9b+poV5xYSyBTbzgnHQjBfdjKGINl2wvCnVm
         OfAXVj/sI3avCyAbQUzSzzGp0rDI21yu0jVHlgSQx1k/rzpt5Q8yBzn+6GceqyRvC8+t
         tV/Jp2k0mjVIDUTRzbQGXncMnOiT51IoPvzOs7kvOHY8wp4R/hK+Jll5xyIS2JRM/5WI
         aIY5U1+BVZSbMXZmRjP+U1ycTsOfOu8vPcS8mC9cofairUJzoFlw4j1hG6ZB3hGtfwlX
         EcEg==
X-Forwarded-Encrypted: i=1; AHgh+RquwRSPyKw1P8FK0JJdk/Io6Jzk3Nm8/l7M0RZtDS4AJ9zXsS2aGmHIKcMh27D/kHEB8dDAIlA6OnNq@vger.kernel.org
X-Gm-Message-State: AFuF++l10wbMjj+J/XqV9/pg6X1IvY9xo/Halv0ZsrCa1YGhL0RC11E3
	m+hjr2ShQP+LAjrqFiKWlhi7PBFGtfxGNdTVDrxKy6CCGo+T2jsmye4UG+O0ca3wtEsRhXLXav3
	pIyub/y4JI9maKoJM6BDHX5EEdBTb2jX9vmHqkLLF6FECI60PogNVbFkzUZlZ2WW7
X-Gm-Gg: AR+sD12oqX3B4tiLV+w18JOjVs1m0s2dAumh1zosLHYZG5aT2cLlAD0ZbWSjCGAZWuv
	Z0kdwo2OLlovpaDVdw6KRU6NWMEn1a/7QwBZgCh9kySmDAeaYxHf1JLzp8cELkFFPlLDIEpRrG1
	pwkiYhxqIs4tp0q7uhNRzl56c+yxFRYBy1KDDYKcrrd0OiewDhgwWZMhYKInW5vbGm4/9qXUpji
	vr8aZpGcGx+YBV2wxPSBSy43Tt+gbxWQ+Gf9VU8V8svvsRH3Qft3ZgLnchDRy3Ey3P/VZvvvDkl
	ZjlkVGhDRO0RborVmH3gQuP0kTZquIaKCWOhreDrSvFGna6dDSrS+h+N/HOmA2bfVr+Bc2SHDeY
	NSl6oaVyR
X-Received: by 2002:a05:622a:5591:b0:516:ed02:c85d with SMTP id d75a77b69052e-52df5637a7dmr287463061cf.3.1787572517363;
        Mon, 24 Aug 2026 04:55:17 -0700 (PDT)
X-Received: by 2002:a05:622a:5591:b0:516:ed02:c85d with SMTP id d75a77b69052e-52df5637a7dmr287456001cf.3.1787572510985;
        Mon, 24 Aug 2026 04:55:10 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:09 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:53:56 +0300
Subject: [PATCH v3 09/47] dt-bindings: clock: qcom: sm8750-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-9-f1205a92682b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1847;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=6qFf/kDPw9tgUbvy8kWxoeUEXj0aF58lOGYhG7+ZlZE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDeg3Aptz66KE+9arLO4DSsW7tzotpNDfdO9
 BKgDBRgb6iJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww3gAKCRAbX0TJAJUV
 Vrp6D/9LS5BOj9HDcLwpAH/D6hGEdjg3vkv/540ATe9J4DQTQh8cCttQoSQ1aoId+8ddc/LDiM3
 eY4YEXXluWUt8gbNmXYfZ/zUYdDf0a0MT6RJQ1OO19a5K6C2aVqCmknviLbI8KhW6mRlF4A4CRI
 VHGloCOEo5KDeNgSTzKcr/AOwQtqoK2NfsN+k42aF2SlfCKV7v2OgmTlF3l9wczp1DAdsB9wtWe
 SqBSVUTZZxjf31QGbB86BEGwhdzxRPO2sh+1jc//20af1i8lcbhDyNzwNqQUrHfuM1YRawt0co7
 qB9540F56R8ZdDoIGt23KNQ3wszxtSHmnoUZ900J9MnLg1iSAPL8n+3zaWJMmPFmWV8BEDaSpxm
 xpMc9jzaymrKfjpVWVMhgvpp2YuSWg57Oq2maE97TYZvn8/w1+Gubs48cD7hNe3pRMXTEH/0dkR
 Q6IyqFi5hERadtecdePOhrh7pWJWGm4m3bmBUY/jp/Yo1RDXqwi0DS8uv/KBRXoqW3wPA1Y2wAA
 I5beZKZuyRuTxoPbCjRjL4aKrKs2oFZWNajRmiBJTtdr60xbk60fTYdOwEuaPqRyzJP4D/vaTF2
 Yzr8gCzlTvKwnsFzjkY6wQov76SuCHnzSGdfyLYA8UbJYQ8yqcpbkDYYaP68ObDIksbUCezMU1n
 EgYkuTqevEWwV0A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX1OK2orUDXaea
 rUFyIcdI8opjn4Y1Yf+UmXqg6Apg/RzyH0S2xjG9mVYf45GIifaN1TMBRIDxZxGipX8c59e3s40
 ASyS0tz/0ySRzOCxK5kK07ysZE2bAVg=
X-Proofpoint-GUID: 7oYMGMK1_vZ2KcRwz6XNTP_2fndC-Owq
X-Authority-Analysis: v=2.4 cv=fqXsol4f c=1 sm=1 tr=0 ts=6a8c3126 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=1VWmMwf-hiIXLgPH03YA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXwH1FFwTSYQp6
 KIa9LrXNrCOYI7fwNa+PnLBRiDRrZHzU2mX895sx1teb0AKT7xgnh3Ll8ayWZIIGSF+JGrU8be/
 vtqDHhPq4XqvxywWIHrTEUjSM1apMqDkMgYEbRqbQYrpafzp5hnDCTc2KnOjJ4iWzMQfumHoY/B
 9/F23aRQH9dNw5TlOOHiRM4duYkXDOXYVaEKxlkKQQwmILsrU9NGKuRoAG1rCPcan4t/1jv93DM
 BLLo2K6NnzB3wXMYwKBuyVLpFtPv94yMBqJ2585MAAfEuyqinMfkDTFK/Wxx2QykAVLEpDz3NCJ
 zUbBc6dBjH6/NOxqpBThor9r8tcfzLDILcOlkINThcOXq3wdjw4eXMMNIy3Dawv3pNO2uCTaF9b
 Cleairjy8iRH5FvVZe5FR+BTd1RvSU4scR+vtjxxDIpp7lRDX5O5WefhdxhHH3a4Q9XGQ56BNhP
 x37WsXkaPbYLPnInvEQ==
X-Proofpoint-ORIG-GUID: 7oYMGMK1_vZ2KcRwz6XNTP_2fndC-Owq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

The GDSCs provided by the SM8750 and Kaanapali GCCs are supplied by the
RPMh CX power domain. Model that parent domain in the GCC binding so the
provider can describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required,
matching the hardware description needed by the GCC node.

Fixes: 342d2a607450 ("dt-bindings: clock: qcom: Add Kaanapali Global clock controller")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml
index 0114d347b26f..f54e836f3135 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml
@@ -34,9 +34,15 @@ properties:
       - description: UFS Phy Tx symbol 0 clock source
       - description: USB3 Phy wrapper pipe clock source
 
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
@@ -47,6 +53,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@100000 {
       compatible = "qcom,sm8750-gcc";
       reg = <0x00100000 0x001f4200>;
@@ -58,6 +65,7 @@ examples:
                <&ufs_mem_phy 1>,
                <&ufs_mem_phy 2>,
                <&usb_1_qmpphy>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

