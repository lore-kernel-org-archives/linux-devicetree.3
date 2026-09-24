Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1727A47C11A
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246443; cv=none; b=VtwHm4M4IrgHRJIqmLtchecADcdwSeYK3EtrcaHiajKfy/YDp2lrvy1aSppBF8qTBjr/4SyVrnTjlJ8If5fKViX0pfaHsdTJ5/FfmmG5dS5UyD5ukgW9yfsX95axroyXhaIXnAE/zFpVkM9Z2kOSn4V0IRkw95P/8mGSONLkR4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246443; c=relaxed/simple;
	bh=/GkuWioc8EmlLG3OhgcLeY/qF3cuJPcE3d5ehINiuok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mOOvQpg1ROT5HXicbPPYm5AMd7GcQVb0Nmwgi5x1WGBVl0OBanKxz5VZLPw+Mc67krvYmfkfMSO0LNSLVOojq5vtBiTN6oE7sEsuUySAKUeHvTg6EXe4B6MKF4NOdnLnwcZI0serHzk/KbE0w47I4vLzGoR4WLGyy7IXDLbVHFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O1nq8bQ2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eg60ui+q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O1nq8bQ2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eg60ui+q"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA3Y30538623
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QMnK3BU0x8u3Ow42e0wy/Iz9sWsMqtB3FpvcoguTk0g=; b=O1nq8bQ2eEVGh8wu
	0bl9Z6F9Fw32dA0E2VZRCbxajc+GmiIXfu5WSc68mcrS+MwOzvjZDbGjmi0Hzt5B
	EELjf7Etm5vWedt9WtNRy2KisR5ug0KG/VlSigs971caumg7pY5vnZESIKvvkwEl
	42yADg2gyHL2KkgWsWJ2744V6By0i0Ef2SSDNIyrjsqnJ8JZ90huNMhLLcPGGis6
	jMz0BybstY/W9b/oGNCIvMH1scmCMaE57SWdyaNcPL9XiZUo/L2KgZDQjmSYIdtj
	QaP6ucC/1jDdPIhMLrFDAjAxtD545bpAxJV42k0CZNDxiRwvR68MAbeCpGI65eQQ
	6JZHew==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc84df-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:40:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93bfb2da664so457945185a.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 03:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246434; x=1790851234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QMnK3BU0x8u3Ow42e0wy/Iz9sWsMqtB3FpvcoguTk0g=;
        b=eg60ui+qLlTkasVhgACBVaqhILNdIymywmLQk6Dn+RkIV4Ot+vLtaKkrXByR4uWZrE
         i/Q+alJIQpY7PrXSEbUXWvmXyF9LlERFt9KVq8YfXforEqpQLcyNJ2rDA5Kujex9rehk
         wyVipfjREFrRj0gC+rn5UPe1rBjcUryGD6xeKsJARkyjcZr3GCJ0u3/PcPpCAcJLt8rO
         5h3rREd7H6gYAPAj1m0UemTnWhO7fTNm7aFIAJ9QKgBlrRIewaRFUV/wG80KF8WDbT3e
         6O+6hwkDtUZw2B04785kFK+b8ciR0Kj44m06XhaPlXOex3lQEkhRNfDfrpHsETGbhVKw
         a6kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246434; x=1790851234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QMnK3BU0x8u3Ow42e0wy/Iz9sWsMqtB3FpvcoguTk0g=;
        b=qVPTvTqEwA8QRGKMDR+DB0XMFOdNEgE9a4Ju0r6+yvIK0vXSwiB2QJmvX+/gZyfFrE
         9LGc1T/wZLIA3QB0DUC+fyxSIUPtwGEoEPM+AYmJVmwIFdg3/NeX6eHBBIwaZyjjKe6M
         FkDnwmMKE2G4T2bsDRUV/HI6Bh2K3U4LmFjhCtwWptfhoW1wFyeY086k4EA59SxjTOs4
         J9Rp+0seOjIdm9PYn1bi9vi3rzF/5XcXQAfPnsVzXLKkRJVlOP0JcvkGjNe90r5y9g31
         puTb+BXnfwcVwQW6pjfTqrfHCrKXqhCS8OioAYciPZ5rlcUTj9cIb2//zJwoLj674sqB
         EFSg==
X-Forwarded-Encrypted: i=1; AKwUvBwEM0RNdOgFXACMyu/9og6qwSPT/MXcDq3fKCwxRIKiBeclCRpcFhKK01ZZWddJ9vUpEfr3JQEc2yJ2@vger.kernel.org
X-Gm-Message-State: AFuF++n9s+uXoJJwaqd4bT1WkSJ+ZYEVe8mHT6/cJlANwk8aeyXhCyzS
	K/a+kqMH3P7vfNd1JLj1x1m1AvjqsmGWUfQx7WSS1CyPxYfzC1V6QFh+AyItfRknDjUDv57UrA8
	xsqAGpR4z0VFjk1whnYafGKgLZKrNlCJ9P1n4HYVyDag9pwc/vqnHYoLGKSHkEvab
X-Gm-Gg: AYBFou0IWPlzwxysSK/rC0MsRzrMUQAPmTC4RKHoEuJtGFUBQxhE3dXNPAcn4/yDT8h
	UzfhocKu9RrU3NOKYWNOnQhURYf6imslp8881t65MTXofgy/zMWiwfdZ7W5kKEFPfJJqm7GQ2RK
	boPqGQzjcYBWt7qGXc2jLdZfpyV7F1edlsXAhNm/PsfNFRBL80GUoo9B12Gla47tsMSiS4kvFnY
	Kwzf9zS1sBsK1lICw2dYKd874GyC+qitR1Z8Pm8XwiuRaE3TGfoTXSMLukBn7gZNqw2nMYayUpq
	PxyzECwZ487ZAWGCUV4f30nEawTso7/jD64E6GNeMZUVgUky4rgP4Ngvsu0mUtZy1FAQpNKpJis
	+dN4gt1lR
X-Received: by 2002:a05:620a:4148:b0:93c:2c15:e51d with SMTP id af79cd13be357-93c363d6666mr216466085a.46.1790246434474;
        Thu, 24 Sep 2026 03:40:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4148:b0:93c:2c15:e51d with SMTP id af79cd13be357-93c363d6666mr216460785a.46.1790246433838;
        Thu, 24 Sep 2026 03:40:33 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:32 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:25 +0300
Subject: [PATCH v5 09/42] dt-bindings: clock: qcom: sm8750-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-9-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1901;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=/GkuWioc8EmlLG3OhgcLeY/qF3cuJPcE3d5ehINiuok=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3iS849P+AfG8Zuc04kIJdWro28qL000OlnP
 cN3aR8Z3SWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT94gAKCRAbX0TJAJUV
 Vp64D/9s5YJ0v/ehu2LuE+H1lfTvrwbE3H1S7+TteZ7YAXK+nqta7ztJMGHbvD7jhk2qwZ5nIab
 YQPjc6pXmlSWgOWne/VmlrgvL3grhlkCChVDtsXyAch0KAZaIRV28VTvRssrYHXz/3OTRHsXPC0
 OeTDTYY63suZiXTDrolsuLTUPpQtNdNvWfD/riO4r5n84lxTLZpe5yUbZvw6nQ3+qYMrwZONWWw
 GZj0o/PdIh3hodK6lG1Xtn59nQUtD1EiuxPDN/qFuPcMJxIzx+ZqgK1NiKP2/80NIHWeWGJTW8t
 +hlFtvT6flLMTWpO5jqfKIjgrFc3XTH4tCFBOeKwXdnE6YsBFz++qgEDI8g502DWvIM+kwDI0+B
 ONwB7em0q5hSxH/6wuzyH7JYRXBwyaWbzmjHBRp++MOKe9iSdXz7Kv5T7O9sISp1Us58wdiueqE
 /ScXYKQuwI4LenDPRSxZVYa2GWDOcR6bN6EeHeLVgHD49WefzvNmWu+W9wwN4xVLhv3XZYZu8wR
 oE72XU/utDoM7DiQSQTEa1ldcZ/0JDN4nyP9hPLT0KNruvQPoFz4SVMqkr1+HShE8Nte9RnpKsX
 Sa9AyW6FpWGm9a60+5PbScPPxf6x2Pn+6brVIyPvJuPokDAQ0tqMZ8tPmFsK5h6Li0zBy1My1rw
 YnBjNQ4C4hJ7aaA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: 97wmYEmwLvAUzycEfVEnpyk04LJdHc41
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX1m2RgnWmGqI6
 qsELTw8pjw8b+UDPTjFxaULGevzJACDhlWoQn2uKwOUTguIPnbvusANP1R8QYPpWftBhMILNLGk
 nUCK2W+CZG21t69QrmiA38HzHF33aY1kpOFnpL5Y0cEIplvMnof0u4EMVQzIjObbsm+e0kcq91I
 lBIiXJEZUEZXBeNlP49CQ2DH2eEpOsCQ653HIaV1rtsTmJl6adi77hsgIDvv0/rA4GH0v3upiqT
 LeevnzqKjS391AHRDaiIiTD3tPXySC0KzsGT7wO0NJ3UrvWT2E6WC0czwu+2O9oBVyT7+c5ui5Q
 paPmamM6HphyP3MHToISbQ9f1srhwzNOTKDZPHV3kXe4BpnDoUGijqOqgu3QPamIV59VsNuAuVV
 xBkVyRdlT04LOxigSDwA8GSl98tPDW10OKvtPhz7QIkhel5DZWxI12wNMq3EbUOkXicefGSDRrD
 isnELketEu1f84apBdw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX/BlPE2m3XFBp
 kV7016cgjr+Zm63qci7X/RNM6rYxBDyVlMYO696QvAUD/REFBNjPN0z/owtADHMfrvWfFxtettZ
 rbXr6YuY14InI+0eQHs7iVzjMfALzB8=
X-Proofpoint-ORIG-GUID: 97wmYEmwLvAUzycEfVEnpyk04LJdHc41
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab4fe23 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GDSCs provided by the SM8750 and Kaanapali GCCs are supplied by the
RPMh CX power domain. Model that parent domain in the GCC binding so the
provider can describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Fixes: 342d2a607450 ("dt-bindings: clock: qcom: Add Kaanapali Global clock controller")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml
index 0114d347b26f..59da3eb2b073 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml
@@ -34,9 +34,14 @@ properties:
       - description: UFS Phy Tx symbol 0 clock source
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
@@ -47,6 +52,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,sm8750-gcc";
       reg = <0x00100000 0x001f4200>;
@@ -58,6 +64,7 @@ examples:
                <&ufs_mem_phy 1>,
                <&ufs_mem_phy 2>,
                <&usb_1_qmpphy>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

