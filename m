Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70691396D38
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390089; cv=none; b=Zj9TuWF5wy86exdyPJq23SEE/8W9VrrHGocr1P1IFuqnrFklZcJ1Sg9MwcP7dAFD+BbiTg898Zt4GJA5OMNg92ZQB0j7oORnlTmsnyQZYQDwWrPGON1v7by0AD+HacOuaN7vJJImYAYiKLkqbwZApm1et7nPBHqBdsaDIEZFjuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390089; c=relaxed/simple;
	bh=jvQTaT96kKhoCyFdUwRI6x3hbm4MyMiIIjUljYO9PMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BIpysTLrb2vK5+qXpzTfYDr6llwuq6pcYASaKlXtgQV3lpqMWHWj+4J611Q+rRBruuXKi+DHbn8sMFDwITdhEgoEQ+IP/ORbXo0fO2SoAgtOp7SZmwU3Ye2ieaBkaq3hF5KcyvcFhmVBHtVx0h6TG48H/I9keyPEkUAAKvPg7Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=izGS0Zg2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cug520SH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="izGS0Zg2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cug520SH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm07w727567
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lHTkexh5mVLWGi/stLEodznhkw0wZXU79mrhJZx/u+M=; b=izGS0Zg2gpLXtRnc
	DxU2B4CdhhgBLJ7WiWac1iRtHMQi6z4YYv12l3uylm7ZSPH0QBt0qbfEKZjjc48k
	3boFODfbXbENl6xqcYSNlA4hrjRvEEGtbeuMnxzFxhzM2FTmUvFlwrr/2iamPvVE
	NZTG7UQmRa+EDaU1nNdWlm99XbdTlJy4cnd/EZebmIY7vR4oFQWYcyRRmZ7s43F+
	/ziZiDqDB3Gjunoj6Cv/Ww8ro3Cd4IGYQCAYKHQw1xqFfw38Ce3EdvL8srP6qm9T
	3XQIYl4bsq4/TwrCuHXPBE7S/2Jz0qvV8HyOkwx0WdPTHj0tuQDaG9tiRw0CESYP
	kwS0Vw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5rxx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:48:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939665a1ae6so848870485a.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390085; x=1789994885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lHTkexh5mVLWGi/stLEodznhkw0wZXU79mrhJZx/u+M=;
        b=cug520SHFBGsmkAHfNiEYR7ngwlIF+ETO8+44MCgOA+r8Skz6Kvu6pRJpwRkZiC76Y
         CMHqzj4WcHX6oILeet6sRcfbtmtdcnE6Cda3mCIpPEnG7xc7Ol+TVZB0hGhgmsqrv8p/
         YNIeQwdNwLYrsLwX2IRzJCG3Vu4VWNAM51r4jWab4PmE78dvul7vsn8INwlfdXeXsTiP
         0StLBMZbEft4KT/UJZ4fnn7yUvecFALgYyOV8QoLbkBCmqVXCG4FBI9PKMvDx2WAPdyA
         vSccZrZVv1ABHzyk2eg6pelnDL0cWgeESjBeXWzLKDaB70fmm2UHSHpMJYrd6klKcH5B
         RjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390086; x=1789994886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lHTkexh5mVLWGi/stLEodznhkw0wZXU79mrhJZx/u+M=;
        b=i3Mb95Ztk8q94zinWUgeeoMhOD1aC9Yz/FckkxUkVfz3UDP985WDecxiON4WbLrXYM
         ZIEiS2EIntmf3y9vtz6JgmjivFUXWNanVXSCWiNomNN/IvhZye8ClkrVWxUgEookt/W/
         SmXRhadsVynnG8Yz3s3qabtVTTgE8LdwjeMjhYsp9DX9PQzWcRU308/UiKdQLoCEOuP8
         0mKoQdm531P6IfKO7XFeL2f6/ZsWLkAjr/SepNGbbtdQqz+FgvW+1M3yvQrAGvv43RMc
         RvU65NHq8bQVuABoaT398PLT0RDc3CXJjJmpKYHvGi4ISVQAVm4+Z1prbjRvj3M7d5oi
         2cuA==
X-Forwarded-Encrypted: i=1; AKwUvBz10/8xG7DqV0arG1hQqBmdk+VOkJ43S5VLLgt7lzNa+wMF6aN8CmdXH1UUhIZczXbk2b0R3uEg/vKg@vger.kernel.org
X-Gm-Message-State: AFuF++nchtKv6W08/EMKfxzzV1wcC8I7AL4hCffZ2umCVaSbvFKzArs0
	2aw8HCLeFwF2Cv5yTQEXPVyTaT8MFsEo1hSg9IrT6yaNm7FR3x6g3t7OvoGmAwekZuCSjeNMnT9
	0xJZiif3A9YFFno6QIeSL4EkVtsavjm2tJWsUIEq4smi5VsjKIV+3nnIadcJfYsWH
X-Gm-Gg: AYBFou3t9K2MgRu+pKWc2j5nKnLgMTHBG1tDHaG0x5CQaPDujclNIKF2O1bX46qBmiL
	oFITjp8U6R70Kxb1rf+sC8kSu9yxLQOelfNuWl4zqrrJRY0Av1GMAajCovpKFjuvx3f1Z7vCjsm
	255tOLsBKY80Wd0L+3E5oJe9hJa1k3aoadJ902V162vrq2GNdWZJNTpgsRvCG0sablfgcaV9671
	B7i6bp5+qfdSYGVYajKIUGHBFo0zofpN56e9gDoAVRfTaWWEyWyio82Nkvii3vqvJ9//Z63eIae
	TB7LZ3HuU5DMWeGZZhd+7F6ZXa9w8MKrPXq3DUbkP47WlRjfrEOE+5AThpYSYupfBFWrNaVppO2
	8fkXtMvj+
X-Received: by 2002:a05:620a:260c:b0:937:d6e8:59b0 with SMTP id af79cd13be357-93a297e5d2cmr319046385a.10.1789390085079;
        Mon, 14 Sep 2026 05:48:05 -0700 (PDT)
X-Received: by 2002:a05:620a:260c:b0:937:d6e8:59b0 with SMTP id af79cd13be357-93a297e5d2cmr319036585a.10.1789390084426;
        Mon, 14 Sep 2026 05:48:04 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:03 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:00 +0300
Subject: [PATCH v4 01/52] dt-bindings: clock: qcom: gcc-sdm845: Add CX
 power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-1-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1915;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=jvQTaT96kKhoCyFdUwRI6x3hbm4MyMiIIjUljYO9PMk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zMWGzABdVmxqLtnVf2Cfno6SD3rVDTFP2Vg
 ybsgOC27nOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfszAAKCRAbX0TJAJUV
 VstTEAClcIdLby3B1DAoDNu11A+MzqlRNpAdHJBwpSFYh6zeoihMUcHtguGGXQJMNtBQdYsLm94
 sdVonVN50jgKaPuECglsFPV3g62OyTdwX8Q/qADYZkz+XIfAHkOj6qHetHLBcCdqE64RVCO8F4n
 SWB0m+RQAFeu3rygf0ob+UU7PqZXVaHqyikWvDQhYnunb1vHvX5kgjLO14nekcJWDY2IYUPE+aK
 4cdreFtVxPaVrv/2hr69Z85SHJEAvzaZ1lSaejs27xb+ujpLBPJ6SVuN773SKLfOkYggfD+bKvQ
 FbwQRrI1uUn+R8nTp4yisccErVmVC2wMgry9r9Gn6Xi0aEN+m9IX8dy3w6uckkRxj1ZKZ0CNHZT
 0Oeup7/zLAqXB/v3r7l2b92LFxj3YPcHtLeVdNXzPXF0PjWOXPT3i5/6BFXEUnAVmEogd16uYpq
 tD5rjrTN/LIgFUqXkmKFwE2j7ZEPdznDNpQ/xPZyFWQ5JfLkgYEujjmZQzwCPjgwSb+5Pfgo4yu
 bmVJ23X8RDFtu0VkpDIv9wjUoORCQFGmA1IuyKryCEa5k/7cdAcEH/aAtXq9gU/W7x4ZykOInmo
 HpHDuNnfR+1xLhUXZbU/34IMNfpXZYbYBRFEzyI+X2K6v2UGifnQ7Mb0B+RwSrzQLLAnOebox4E
 N63ztDgkQez846Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX5+5FJTdHbNeS
 GMwmbVFd1dzibeVTqpD845AwASHf6g1Rhde5tgz7jyCiKaMFV/0JyPPjkp999FUHwDn5R1Lmsch
 OkFiCfyjqbQd63+2iYl5eZ5TqGvNxVE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX9ZkOcB1twtl3
 oHEQcZJJ0sj5+5HmfUFHAdgUNtHXh8vPshd7N1cSaxhNuJZmyrgSRyQxSlq827gAeHoMiW092RI
 veTMj8PRzrKW2AZVkU4VL05zb1juMW9lexgW+v/CTIMIny1W5w1WBBW+kWQMbXHhUUbUDQQq9Vq
 IK7IU4BSKVN/4BZ0NSgto3OVNN2G8Gi/qfPfhWEtZ2ZvXMOTNPeolJkg7Y8LI5w5GRYQ/WLpcl6
 sBF88/d4cEKM5wq6JY+3Tf4l6KGUC3g87vOCUJw/JFliPESDjb5dc8U1YfnBHbp8q2g8EO3CFx7
 oCzFtxvHe7RdEJI9GMby4L5svMZW+beic9NzcCMqVML7a5HUIty4ojBIZERqLn9TT6Wd6azkH9h
 g9nzJFfl5TW7f76Ln4j5JKNZj4nfbVDWRj+SZ72F2en42B6Dn69ljZ1PgBOlCwI04m7uMA28+/h
 chZOtPN3POh2IR76ggA==
X-Proofpoint-GUID: a5eOd67z41LICM4oRDzqTSx7gXJuu6bC
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7ed06 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=mTghPm8aXy0o-2MNGrUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: a5eOd67z41LICM4oRDzqTSx7gXJuu6bC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140182

Describe the CX power-domain dependency for SDM845 and SDM670 GCCs, and
require it for both compatibles.

Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
index a7523a414341..356af877353d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
@@ -31,7 +31,8 @@ properties:
     maxItems: 5
 
   power-domains:
-    maxItems: 1
+    items:
+      - description: CX power domain
 
 required:
   - compatible
@@ -56,6 +57,8 @@ allOf:
             - const: bi_tcxo
             - const: bi_tcxo_ao
             - const: sleep_clk
+      required:
+        - power-domains
 
   - if:
       properties:
@@ -78,6 +81,8 @@ allOf:
             - const: sleep_clk
             - const: pcie_0_pipe_clk
             - const: pcie_1_pipe_clk
+      required:
+        - power-domains
 
 unevaluatedProperties: false
 
@@ -85,6 +90,7 @@ examples:
   # Example for GCC for SDM845:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,gcc-sdm845";
       reg = <0x100000 0x1f0000>;
@@ -94,6 +100,7 @@ examples:
                <&pcie0_lane>,
                <&pcie1_lane>;
       clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk", "pcie_0_pipe_clk", "pcie_1_pipe_clk";
+      power-domains = <&rpmhpd SDM845_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

