Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42697471422
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390120; cv=none; b=ro33wMFnDJL8e8HY7YtGTXBy+l8YJh7QPd4eW76bSbdanaiIAbBn1yMTqXX1ecyEDASwqy44Nr74BW2kGNPMeotzqimcNAILCCskk2NcdIP5XpwXKUb68pZDkIP22qjjEe1YUz8hoeYCUfA7K4Damk+zWpfraNXQqJEkcvB9LtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390120; c=relaxed/simple;
	bh=PRJSk2QBfWJN+tusbboqMv6IVMV0xjBz5ZLbJ7mLLjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sutO1Zih4fzH6bIq05LosQtX+8tyWOV5jmxsOyck1BmKEdfNZCLe3kq2pDaSNtDd86mBRIS+RRRwBoc7Xtvpb3ElYj5chhD/4Xvm7rRaQRrJ2GwKxVpfIxfymh5eTKmRum22ZC1ztgR8+lR42FcbUPrAk5/NZsnXs6Qd3i2iayE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VN5h8kjo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F2r7TaMQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VN5h8kjo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F2r7TaMQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EBRG2V406722
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nmUS68ygi185/0SYErr+EnQ24e++GTJ96CGKimx1h80=; b=VN5h8kjosF15UGyk
	d1UZZlRRJqJ73Nj5zzLzAEC6m07N0Fx+s+kpc+gTXRV/XmClAsSYV4ivDvIc8jDQ
	b2HfL7/tCsi0VJcSUMo4mBOS0uasTaUP9GlvKnBQZDN0GNBOyFCRBUVNgc5O/h1k
	59I5KgjlAJXDYm2WP0T1zvKI/Yct05gEWRBBHM7LM3xi7vjJ1rCr/SllcbCXEWWH
	tQsJKWpmKhnb2wc/1i7u2BcrixfGDyQBcJlaYFl8O2i2OdNI8OjYr4cqGerardbt
	E3LATlgGJ899PX4uXuLgvy2SYKQ2Pk+R4jku4gR6bUWvCeOfwcaTrgoKTYohBJvj
	q8t8WA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kr88h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:48:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f248907fso241988485a.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390117; x=1789994917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nmUS68ygi185/0SYErr+EnQ24e++GTJ96CGKimx1h80=;
        b=F2r7TaMQw+eqfRRrXL0eaJGSOTwBZuSCbRmveg30kGuG85UtiebPRmyPUiP6FKR4NX
         RuE0jHEwlViTRqgrPz8awuFgHuhtcebvNDrn5JwpBjNdH+5bh/JcGrhj4boBxzdkBvUI
         dER9n/Gi4DHCAfDKY7sPNv2N6eh5I8l4Dh9BJLwvhTL+TLzg39ro5vQ4pWnrBK+4jZzs
         FZJnIqOxOZhULo/cCccl/XflgkbEonqM3CiScMaiyFBU/tqW13iayJtjgp887gOOFFbr
         4xIUsxi0xRzkQ/JSBQYh7qGpK5xUhbXnIYU2h4WGTXzZsZsXClYRS4oma/qnrj7A0vaT
         n1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390117; x=1789994917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nmUS68ygi185/0SYErr+EnQ24e++GTJ96CGKimx1h80=;
        b=nG0Tdy1IuRsqOZg+XuKrOIVtR+cmVqlZaGqPfx01Un2UXMUrUYSLELIEDDLNoW95eV
         sLR8Dfo3ubeZXmPz/ABfKmI5cKcSMQo++Uc5ME91Z7feErK9WSUrBsKV45mp+HJYZOox
         deXpOYZ9FJEPTy9mjpdfK69omRnEVJOgsli1mtlxdjIK5KNwQdOzd68gLtMR0OzaE4Zi
         o5BxAuhbXPbjsI0rIAysEKEVinSFh8ull1HEy4mVAsCJbeWZB2cQfCWWQIj+ddOsp7Um
         aj5p/cpuMcbqD/Gv2XI/5qEKysyAMnrg7xBmRhDULdQdKhV5ZiiiSFJOJSUqfH9bYiuH
         SpZg==
X-Forwarded-Encrypted: i=1; AKwUvBwWNFL79pe0aKTT0+kMUIMvyJ3p6TYWqYXawdN+4ZR/GVX3TGWz63m5Y2B2sWb/rMMCwmoMbngOdus9@vger.kernel.org
X-Gm-Message-State: AFuF++ksgqwh+0aYVsR2XeywSV3DxvKfMFl5WtFjXrwkiS3zAEN87LCa
	lj1Lwit0rsOSspdDw1iM5S0bk5dsHgmQbUNR1LaUkSGfJtUvFyyL9OmO2oDXJUM9ptBP3YegXjG
	s5qZ89YR2O7Upb+d4RgnUB6a9CMOoVR0mqrRIpsoa1yfwyzI0/Ib7dq7HoAFtpNXa
X-Gm-Gg: AYBFou3wk9dSkJ09XxN6O9I4VwroI+L7FQpjbn9J6pmvvgjJG1B7yEWUd5hhSX1K5oV
	ocOzr3dCaqbFFnzadi7rbqsRUPN3xqn9XrIvC5BlwQ91rQ08dDvsv1Bx2ayhXk5yTnaQRUsOCVg
	MIoYXk5kJmIGi2YcEl1uHGjmRTMH/VzwvJuyHCIpXVqDHAo8F7GuWPe3KPGkpcTZ4WDil9jdXGQ
	Vgp/AA2wSd0t2/ra4tiDPZmInZ5LuAGjJ9aRO/fGrAkv0+GJ8rVwS9eO4TMjhhwdOPFvFZFufSR
	TMWsZxcQiRGLKSZ8qxA1v7kwO6eskfli/mRcxx7/OioU2WnjrUM+LQUvKO2wOHcD9AIpiyCFgY5
	l4sQVWu/Q
X-Received: by 2002:a05:620a:1a06:b0:937:2d64:57ae with SMTP id af79cd13be357-93a294bbcaamr335423385a.0.1789390117405;
        Mon, 14 Sep 2026 05:48:37 -0700 (PDT)
X-Received: by 2002:a05:620a:1a06:b0:937:2d64:57ae with SMTP id af79cd13be357-93a294bbcaamr335416685a.0.1789390116777;
        Mon, 14 Sep 2026 05:48:36 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:35 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:12 +0300
Subject: [PATCH v4 13/52] dt-bindings: clock: qcom: qdu1000-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-13-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=PRJSk2QBfWJN+tusbboqMv6IVMV0xjBz5ZLbJ7mLLjw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zYl16nTbRqsmM64SFPddapl63aYUuxI13CR
 21LHbypFDSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs2AAKCRAbX0TJAJUV
 VqOAD/9u7mi4X7fHCtsWkR2Si06S5hksigq+TCbBJramKFjs93DZbPP40qeXgYjVYpIy0+QKuvX
 y5Kyzl5K+HcUlyonALWU/GQFOor7EY9vJaRvtEM2NqbI7n2nXbr5o+FSKUQ8hzAj9+f3GW++vFQ
 yYw4G1QePwMBC8+7DmVp4kWZ8eAUtM8u5Fx/fLfqSj6f9T6y/1usNxn9yTeYLO6XrKemBVXo6gT
 VGPi2yr0GpgNvF/e8bK+eL18aSZRTrQZG5HPkcxL7mov7R1vmehwwfAHhqunGkM52EbBXK7dbx1
 CQtsj7ucljqNmiJiBsxcsnV5zx+tKTKxu3nNSlGA76M/I6d/+2pu8XRyw41sN1EPTGlDjHKePOb
 C01scEvHb9l/hN4+BLtQwRujpTZbYh4De6MHYvnXB3MOFfCq6lLIU+TS1Z7zlNdoTv8WM6kJaBp
 jH/YAsMRcl+WDrMU+Ba8cLJ7t7fvXBZLxHbUmX0t8vMTkvw2j4riU9nHrx1/bP1YY1o6o/SO6Oi
 IbPUZMUHyXnAwD8SQyvRF3zlJspybuSNfnpCdJX1dAG3SqB+mzM6zWxx5ANgJWEmmIG2/JKdEhn
 mVIFB/5mwf63H6w0GXb3uf+9+ttUb8t6N/YypxVysBcsc4y3SwPl+hsPB+5rwm8n+pFvMxYAswg
 UkmLwsR4yvnbXXg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: sIuG4HLHOlmDpJGm98KtyC8Xof25jGdb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX+FP8qOvv68rK
 CaK0x33pVcEI4NlrftQa0XQ8obwXn0lUxEY9GjTX2EpTP4Aix7DGAHpbrQms926IurlUvvv/GNw
 aIajDKktbfrpQsCjDDNg17RiicfjUlYBMSbOhK7pMlAkdS2ZCY+NE9fHN3A9f9SA1ayopoXetCe
 1luBQlz8IJeEf+Im5eu7OG1yl0Z9Km6G0MIOkvcfbQqg+GtFQ/HE8oC4cjinVZ5kiMMBGgaIGLl
 Qw8y4AdBg2DZLnnsVjIqHbqyLrMSdopIHhFUAuW6glI2CUjz6t8FZyVcCr+03rUU8bHMXRJ9IlS
 IVTe4VJqbMb5KTdS/g3m8eNhC9JNHQwEj8WbwrueTQPm/qmvSUJQ0x0WYFDfBXGNQmBDKoHL838
 j1h3Y8lU3q5Cg5Ge/N4f22OeV8oEbD9zMb7eCAIYnfdcb+92yLqvbrhVTOo74EdBN01PUNitS7a
 zSJi06mbZEvQ7tT9NVQ==
X-Proofpoint-GUID: sIuG4HLHOlmDpJGm98KtyC8Xof25jGdb
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7ed26 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=AH-WQ1KBeD2DJq9sUnsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfXw1eoRWoZ06rr
 690kHK25mnZcUMqCjwBrUveIBRE1rPhjm4n2nIc0sEbA1S+NrGy1StKmJuv4I+f+xdwHFxUcDtb
 thbS8YUDIEO9AqL6MzOjMIVjhsz5OMs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140182

The GDSCs provided by the QDU1000 GCC are supplied by the RPMh CX
power domain. Model that parent domain in the GCC binding so the
provider can describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh
may undervolt it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qdu1000-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qdu1000-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qdu1000-gcc.yaml
index 2c5a9ef4fe4d..3f2452d0c09e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qdu1000-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qdu1000-gcc.yaml
@@ -28,9 +28,14 @@ properties:
       - description: PCIE 0 Phy Auxiliary clock source
       - description: USB3 Phy wrapper pipe clock source
 
+  power-domains:
+    items:
+      - description: CX power domain
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -41,12 +46,14 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,qdu1000-gcc";
       reg = <0x00100000 0x001f4200>;
       clocks = <&rpmhcc RPMH_CXO_CLK>, <&sleep_clk>,
                <&pcie_0_pipe_clk>, <&pcie_0_phy_aux_clk>,
                <&usb3_phy_wrapper_pipe_clk>;
+      power-domains = <&rpmhpd QDU1000_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

