Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400FD476CEC
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246426; cv=none; b=rfq0HrSwKtMbkSAGAaZ/0dBA0GHs7zzTy8mlmQPII6jpPm9xCSq7UTDC4KNnw50BnNcrMTiHtg8rKiul4rl51vPtnlwxNAtqIzDtJtWtsFEct9ryJUiGZtGrWQPC2GO3fNCDNrVNiQ7d+CpyTcCgfAC119dKR/LvAbe4R5/mnUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246426; c=relaxed/simple;
	bh=8fU5nCq5rjDUDl46rbWej/ln3KiK3a63qpkKkh6pVxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iLpEWDvqWHxpyQHk01Y59JXcPupIIt0dWndwCxTS6pViiIbQGKt1gWPgIwcGIlKbj/6JW5cVfjidREZv6zpylLlwuVjimJRFEnFeeNQE4SeONqBEUQM/2xRTw+h/1T18ok3djVIwu/X4Us2nijqyFHiCeyTzX6oWObBQkPfC0xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mynm7TtQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GPYgH/cl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mynm7TtQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GPYgH/cl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PlK01270581
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7COMz6Qt/lb0RO+8joivHL5s/Q68xi0gkqCw+gZJqXo=; b=mynm7TtQWm/FaYCq
	k4u9ALzpz9MnMX3ObwjJlAhrV/jM1qFzdt3e/r3Imgc3iT7IAn9BzZpLE34LZDXK
	Rl5iCPvzjMH01r85ONRLGQ6QD9A7BzQYlRD13rQuDzbESiPJxfMs9ijQmMfkwoOZ
	yp/7N0OIxvCZPlSypvTCFwoWoISkeFlRsh3r9JGJq+5/+EeujMStffyOxHDIOBTF
	VDTei8SnLXXeUs7FPFbnxYIrrc43v4I0Z0gDERe/BWKVGXj6YsNC6+9qCPhRYZ3i
	SXL6LeqFwOS/qeFrAZhh74JCGggkqqA6kQ617FMhqjKoVJ8tNyNQOrRvAt0cHE1Q
	iH8d3w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr90ajsd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:40:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936aa34873bso324223185a.3
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 03:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246420; x=1790851220; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7COMz6Qt/lb0RO+8joivHL5s/Q68xi0gkqCw+gZJqXo=;
        b=GPYgH/clWn/5+pcRn48JlNfBb7CddXQZ5H365m0mlky4o4co37cGvF2oOKKpJk1MWo
         4I2ASexuG7PLwahUwy6vipHaPwGo5RWTA4YMJ10QT62FPghE10IZfIn0thceg0oJq1ky
         /lUyq+vvU/9pTleIQmU8Yd+tWdxhDtz1nwkISvEDWBtrcH/KwKMGfNw77M534Bzsmdaa
         LuDXssnuLS/pnZMxMQP8wF2eUTa8Y4IfHdSA4V5c54HHfeu4s3+1acRPuH6LG8cwzC7g
         giI7PAsVLl3xCtsYw/Whnbs27WdvasYuKN1YRdRYtTC754vj8UhAdOt7Jx7Dh3GCl44w
         6xSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246420; x=1790851220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7COMz6Qt/lb0RO+8joivHL5s/Q68xi0gkqCw+gZJqXo=;
        b=iDB18lAbCk+o7nH+zOWd7qgLw0pFn0yR1ibAJJfSKm3Vg7GWAdiRa2yxkjo+sZrZFl
         RQ+DiblWKWJl2FGswd5iXZR6hCHGA7V2P/SrIL3IdFsrRmUmi3kemOgEjwMuOFdMvodC
         5iw9Yagjdn/F6oIa8OcyoURhliifx7BmdVBiLXagOoxg+Zs4Dy0o30v9p8FewsduSh+d
         a6nYVU/fjMDnWyAmDTQZNQ5jKfTT05ih7/HiZfahdErH0wmauETllJz150Xz7V0S8ZlT
         840i18Lxi0E+XGqwxKzF8sN6ASabRkpu8KGb+HUr/PXjxnBX9Ki4rt+QME2tMxEETGGR
         RniQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTg1frbLxtL42Mdz/5I976cYURZ2WJYJacmHYUXqj6fGAbS/kcN2e2pXfezI8hjhqjXbEJdGfK3hl2@vger.kernel.org
X-Gm-Message-State: AFuF++lk7CxSAh4T+vewmYnuiT570gTyojLPHgf9ZQ2QTuRsVV7YBPks
	Q2rCSjD9jEiVSqfcYjH14PtR/IW477eZZwVYj7/DDE9Xlq+FqdPvseck38e0hH4ZB5pqrewdYlD
	58j7gC45wff/3PGBCqZ3ixL1GGfBeKs+3nmok9y69MwKyXkQNdI5Hc46MIinltkCm
X-Gm-Gg: AYBFou2vQRpT+5z5n4aW2Uxs/a9zvKwTMNl35nfhoUANiNxI5dWAW37iuI1hbUrcKPp
	vObRpv9fBWtx4gs37kzEUtj56KyfQKzEcP53eL4AQrSEXjGTaqxYscZ+0H42dqOt2WsQvqNzctT
	gVKwXhjHrj1/RFByalGnGMRjDFunvvbp4wtHJE7d/ari/5UYLzmeFogQpRFaAc+PZJqou25Y2J2
	mFQE1Eyq0yk0qv6FWqRrtKRTfZkVyR+fKXmqbPhtbMYa/v+1OUl70tTN0YPV2YOKWIJYTnCedYJ
	DOs4YqRq2zjVDxAbUZb4QW5Il0yT7Fnu6E4Qq3UQQHNWSHiAgufQa6O4Y+pkbpHqAGMghf4WOmw
	eebyMfDc5
X-Received: by 2002:a05:620a:1b85:b0:93b:6f87:ff60 with SMTP id af79cd13be357-93c3629e932mr203222885a.14.1790246420396;
        Thu, 24 Sep 2026 03:40:20 -0700 (PDT)
X-Received: by 2002:a05:620a:1b85:b0:93b:6f87:ff60 with SMTP id af79cd13be357-93c3629e932mr203218085a.14.1790246419794;
        Thu, 24 Sep 2026 03:40:19 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:18 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:20 +0300
Subject: [PATCH v5 04/42] dt-bindings: clock: qcom: gcc-sm8350: Add CX
 power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-4-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1775;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=8fU5nCq5rjDUDl46rbWej/ln3KiK3a63qpkKkh6pVxY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3dbfYe/P+r+gfU0+X0LDCp8p+ztVAGBT5Hn
 j24xojzGqWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT93QAKCRAbX0TJAJUV
 VkdhD/9SM3jd5RkWlFrf0mvlHFgIhfYKDovzCaPtCK4ySWFgTIPTJOBmOFoqK3hdcdu8icj3lb0
 EYeUbGJPCYIUAerP2c/lkIKw9i/L/Mobs3s7auDQ3VyUbrSVv2+SK10YE5+H1Djuc3aJhMTsjeR
 55PPGYAtn4058Z+HVj/NRslOeqm/wAa9zzTz8uVAs4yBjTSHGUK+tK/I8E+twVhoIE6Oc+aX5y9
 s0TfLksQGhfqpc833Mq9lHZzxAuzIshaY4FwONlAbM3V8n+EKe+A+rFCr5xaHm8vkv2Tf+yiyrR
 cTZ31FHCq7L/MZN2GZxWm32O5KCI3qjWUWBXeuZEPKaVmghy6yCGpS4QW6PNDkV/HlUZaX6A80C
 HQzcJcBnnS5wF/Efn0NxqB5eIgB3veyUkCIViXMjORV2YHOvEK1tjnEKMaE7tvrJHhR7Tt4EzKr
 auYKv6gucZbHlvtbtcQs9UjuNU63Fk/Z64yNBmOItJ47A4VuK45pbHXhO4NruWKxL8wKN9pgSbC
 iRbgYobAYM+q6axh4HpHgyi965qGAzejlBE8Ef21SRZDlGGuJz1w7Q5J10Xhnw7nh5lrm2uArDS
 s9WWey8UyIwozhh1m9K2j/Xz9KRmYp/Ns31Wvedrdb6dEexKrPuWKKDSiEXKMS6/MSddiimTBaM
 whrxT2V/Om6Ni7Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX75T3oqfvj81y
 WFJy1AWQ7xcArtlMSxXSF26yESZdthzsOOwy+P8eQO2zf2DzhdQFySwxsi57bbjSm1Fdtu1OarZ
 NBlIvyDMu9svOYGUnmBUAk5tHnb4x54=
X-Proofpoint-GUID: aii28PJ7zjZeJUBLpnqAbXhBWji3Cosv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXw2ib42AfQX/l
 mXw3QO+rk+YRRaaNWb5z9AFWgvjGwCW+oGxs/6aWbDcCsbL4AGkWVE2gJWMVxyoTqXOa0dArJO/
 tizsUqTugYUGqHPCt5YwD0wMkLRyJyql50fQrStBBmEnfTgFw6FAbkHoOK6LK07VLk3nCcg1f3n
 l0anCUbA+M4Xlss8TsZae4xMZaluRuxgpj7QDvvMiUGuzOGe0jqyYck+2xl2h3i8G20u/6YRXW6
 mv55af3JyCbdB8zE55CUSi4X4aH1wbPek0gnzmL8lVn84MlqOnY1aTy4K2VuuMDJJIyVCxdMjaQ
 DkPcG6uUQ7uAHoqiE0ys4YjpnhQrJ6zOtXio164H5m5ddjxK4qDzjs4Ansqwg5bsOgXFzDDlsxu
 gTJYz+ps9FyCcMiNz3KDPqzg//tGrfwhIoqu5EsS9cBkTteH8HUs3tFdJ4QlX1a5qL+G0EJ2KQK
 /inEy4R19lyYzAWP0Bw==
X-Proofpoint-ORIG-GUID: aii28PJ7zjZeJUBLpnqAbXhBWji3Cosv
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab4fe15 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

The GDSCs provided by the SM8350 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
index 97ffae3b5522..7f3947db5807 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
@@ -51,10 +51,15 @@ properties:
       - const: usb3_uni_phy_sec_gcc_usb30_pipe_clk # Optional clock
     minItems: 2
 
+  power-domains:
+    items:
+      - description: CX power domain
+
 required:
   - compatible
   - clocks
   - clock-names
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -65,12 +70,14 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
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

