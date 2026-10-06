Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA18381AEF
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 05:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791264579; cv=none; b=T7HifeXryX+xWVNjQSY4A1TYZF8xFqSfncaseLyrdD+7I+Kifi8VKUZWAKeOhXdfOqsdJXbV2dp2VJl/g4v5mhMrDy7IKCHG1lJvsAUWnel2dlwyLMLXbrMwEibNHoCjJ4WJbBD+KLfiDo0JDWvb0iC/HbI1T1T9WLyAHGk9C14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791264579; c=relaxed/simple;
	bh=r93Jb+RRci5KjslpMwSwutEV/c/USqhXg7qpdeh+1sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GnzEUsSl1yaTGfIIBY2j161SlbtpcIckafbV9fj3wkqV6v7aOOVZy9JbyoSLEFdg5usvrcQImfiNPlN3p/in41QbJzZZZaB11ovjUUUOFs2AaPHUHTZS2tiZlRN4ePbSluzyp+TUWnZ024Oho0Tad8WSM2kinj7nYC/TFNJMZN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KGm6v3Xs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FSewK9pc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KGm6v3Xs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FSewK9pc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6963ACeW2818577
	for <devicetree@vger.kernel.org>; Tue, 6 Oct 2026 05:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jrWr4WEEoDxY2QpPfvYR+d27cAyfCi80wCzqnJN1qlI=; b=KGm6v3XscGWir+j+
	DcdnJdkShndEyP1ZHB48EdljHIb5VD52QKGo81YTB8IzCjYkKm61PAUWgrN/07kt
	e353mJfs6EfrsVq9/s42R4SuCN+BmnJEd/2i1BfJQRo3mXNbiWU/OPUai6pr01LR
	/curnycN2Mo27itGJhIUrxmqJggUVQ3z4IZzr4RWk4DuTZZgAvkT7bTjruYPDrtd
	JAk+qyhx5rGRwG7EEDIdj+6VwxmDKlNZbC9iq4vjWkVTkgdmKUX/ycSkT54iQnGa
	ABLzU7bRAYugZR8l73BTdAwwrhcAU/pmf+E+X9rfo6QGyHkw0M9g+O+FuMsiTSTR
	yxWmow==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4fkujd6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 05:29:37 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso3928492c88.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 22:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791264577; x=1791869377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrWr4WEEoDxY2QpPfvYR+d27cAyfCi80wCzqnJN1qlI=;
        b=FSewK9pc+hsutgD24aTJqQtkzA8A3z09QMXvgIkx1J8K9gqhq1id3Ak1v2Ago5o0xb
         lj8pu7i7DYEB6TLMi0UbH0Q7QNwYyEuQgonlFMDxY6d7j/sB1z0++BHVECfdO/Y9DeIR
         qGnnUTATtJd9vaqyAHKQfTkpwMFwtKqDzQxpUrC++NYQdA1tHxp77gNgiMcyaQtpeYVa
         7cPMPWM9Iqg5Ge4Fv57DZNCO9jShdCwoKGemOs+GM6rxRiUnV8v039WXgiJAnL/mUJyT
         THYREoLhSW6jlI6MMCAps0iu4j+V2hSUF3XLMcMI0DKAxHbPOBhnjH2/6PP9dwu4ttk0
         SqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791264577; x=1791869377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrWr4WEEoDxY2QpPfvYR+d27cAyfCi80wCzqnJN1qlI=;
        b=JFzMY4WwcT9PAAgX+O0wQCcnKSTvq+tO3TIsaz2BIZmGFv+OqpGzXqguMVKq4tBr9q
         rS3t5bvoe+5c1OsQSDs0SStCkIKMOG3yZJDTqwTgzpBtsJxc8GlH9tSP/9E+QsWOPPao
         5xoy66QvbuO/Mt9xXi6/2JfF7+ZaDnijPEvcK0WlIHuLu0bz7lgfiBziykNV1DlZydbb
         YcyS+R+ZsXLSZNaUPijSZdAzgu8fvmFw3LDvwt6EZBU3375Y5XKcDBQiE282ISFNYWbr
         XIoJnhxohdtayOGzJDxl9D9YpAR+DQywcUMvR4jEXzN09hY1WPuw9QVJXw+dJHXUD0pc
         Q70g==
X-Forwarded-Encrypted: i=1; AKwUvBwr+zmSvwluCWtzCdSWpFntSATXAxZ0K9OdgxS7nvzg+OWFoH8fnjPCSQMliuIi3JDcWfI6cOufNzxq@vger.kernel.org
X-Gm-Message-State: AFuF++mqo6n+D98AoOvb3YjdLjPpyvJvSlLOg8EWcrNnDNHc5S4JAQWX
	B5d70PrMPARdJv7W84DIJ5FjmrGJ5+1ahK2S5qBxMDKBy8WzhUZnux1825ZYh5pRxhc13mhb+u9
	sr/ojF10U4JaFfuD0cZqkgxIXKIEEUWYjWq4kpzPkoVibvZfeEVONlqNdREX1jLIa
X-Gm-Gg: AYBFou27l5knjHTH6TQei4E+C5LIYfY6/IB/hMKyCV4bruDuhlCxvIhhQdiCoGMCSQB
	Kz+DPi78Xc15O0nOWRp9LSC5ATtaoDD6n9vv17F6nBGRVkpicW4VmDzE4dfPa4xKjmBZjPCWYRB
	q3YMKMB6qVJISCPoIuZ6var/ru6b6zXkDC9iAxoRzEcOoiMrf5cE71K4+TEOIqz0hW+pD0MxyHA
	16Hf+mOmxl+RUsIw/h+biLuDbtiBKZgUXR3F+UzJwaLcwBmhXUhLdXFzg8HfRxdxNmZvWw2Hi8F
	kb/B2JJmsQUOROYJde+LWTGPUlGAQe1f5UB0Zlf346uq2Ulya+cdSfIAH8i1V5GfnEClf7NHgwH
	0ctNgJOPGB8Y33Crh4IpMbmgyRtPe5Wb5c+v0t5jDkxoCvoOm+Nc+rMYZ4DMnHX6vWstqZVxVzy
	xI3R0XIJvuJ6iHHvSibMwAtWQaxqZQ
X-Received: by 2002:a05:7022:f902:20b0:151:6e80:ba7e with SMTP id a92af1059eb24-151c0b1bc76mr13208129c88.4.1791264576475;
        Mon, 05 Oct 2026 22:29:36 -0700 (PDT)
X-Received: by 2002:a05:7022:f902:20b0:151:6e80:ba7e with SMTP id a92af1059eb24-151c0b1bc76mr13208101c88.4.1791264575932;
        Mon, 05 Oct 2026 22:29:35 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d85781d49sm4017403c88.16.2026.10.05.22.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 22:29:35 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 10:59:16 +0530
Subject: [PATCH v5 2/6] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 IPQ9650 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-phy-v5-2-cbe9330a6449@oss.qualcomm.com>
References: <20261006-phy-v5-0-cbe9330a6449@oss.qualcomm.com>
In-Reply-To: <20261006-phy-v5-0-cbe9330a6449@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=HtPjiETS c=1 sm=1 tr=0 ts=6ac48741 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=JwZr8aepJa0OdLIFGX0A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: uOH1jYygGmmcoFEk6G2D42aJn6e1SscJ
X-Proofpoint-ORIG-GUID: uOH1jYygGmmcoFEk6G2D42aJn6e1SscJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyMSBTYWx0ZWRfXxIR3aEcLKj1E
 KlIRki6j0zYwMKWrbI5lIFHIjWZ9lWJKlAQmXyEeW1Yj+9AtuwNnMarXIwG5KhXld+9XJOZIoV3
 gysyYvgxvJRb2zUthSV43ilHXlVUurk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyMSBTYWx0ZWRfX4UU4q04MRzBl
 /8IZDYiGiMVIg2edkSHrsKAjgQXfeUa8oSD1pjMOgalwCXDxQ6MU8W1Ap+AHW9OiOR+YpCcHikX
 wdsUZFs9q1oHyqMidP4ypJxTdPegdamoudWDaDsSmp2TXjVM0HvcYJybVqS/ZTq1/zkwMGC21Dz
 HdQffhe1C/Nk2j1UfeFItDWkAwvn7gAIAtd4hLcfXPI4sePuWCUcQOVH7baZ7VElOie1Kpc01F5
 3qeteeHU+RvT9pwklPCBX/zEZ1141UXLeR+aeETSfY0QCojxn8epxjGE+OIAO9e1dHloia5UoB6
 MlhEMQt6WgqJxML7g4ARR0x5VNuquLPTNdg5lNwtq8loLrh6UrZH1ymhCNAvXw4zz2TrZSGhgJ1
 NoUKoBYw8+/9Azfe6tgjJXgTsgJn5gbD8FnBm0SbOHG47/dQUrQrygpiMidQV61pnG5uN1rdp8w
 M5ChvRK3bSBfNS7uhWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_01,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060021

Add qcom,ipq9650-usb-hs-phy to the list of supported compatibles.
Unlike the existing SoCs, IPQ9650 does not share a generic
"qcom,usb-snps-hs-*nm-phy" fallback, since it requires its own
tuning/override sequence, so list it as a standalone entry.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
index 661759b25064..db00f5a99d80 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -15,6 +15,8 @@ description: |
 properties:
   compatible:
     oneOf:
+      - enum:
+          - qcom,ipq9650-usb-hs-phy
       - items:
           - enum:
               - qcom,sa8775p-usb-hs-phy

-- 
2.34.1

