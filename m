Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF1B3E5A29
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553487; cv=none; b=TiOZbDt5dhZ/aU1wRunynxRlQWoaO5SlqKecL++Z/vOpT8/DkSKmOZY9j8w0FKGh4Aj4ayaYWpkdlyKJZWo8xt9X1MSm4XCq51ypubGb6FnB/li9GwaP5JQXFg+SjWPbsJCya8hU3VIqIlW9TNY8NqFNtf3xWlgQp/lXr7HBZJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553487; c=relaxed/simple;
	bh=S26FhUx2s+8ZNZOWrhcwvRmp6V4Hz9aYqj1XArv4MgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FDiiV98aXaPeJ9Jf/JBz1h0LVUtuG1rkPZzhT1XQb1t+KaVfNXQtLNuBcIXXWMVNwrniqoC1GSd1oH8WTdkmQv5rE+3UlKsCPlgzwigLwYIUP2yjbbvodCvWnYyf2LsTcmCrJCQ7vUMhgw8V2DhkRKreNFWlJHmJoCBBLVHXu8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JUVm5xVb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OP2JgGqi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JUVm5xVb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OP2JgGqi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O67vUt1663372
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KLrEnjPX6y2jGWNfb0TIDQT0hmTh0JAPk37HWUvUvX8=; b=JUVm5xVbM+23rmXs
	/Jra9God0d8OxWilAVpjT4L9DA6LmBLAFZ8yHo5AoK2IAt0n1Xt8Qhzkl6YuhPsL
	lsl9RkL6RQgkIx1A5eDvIL9AFO4Ivn/BM542M4fTiCK3FdmoGZc1XshqDTBN4Ip+
	cuAZjoh565Cxu0vF9ABcPcFWEhOr5b6lvp9vLNguxarhgQoBLxw+ABKa32As98jj
	fXfxtsdDJTZE2lsarmA3tjIbdexjMT8tJXv5nerjSlRFDkLN99cGFykaQZF7p2Cg
	+eZaUruAuQrztPDBfPD1Hg00mK968de/OjmpEuPnvkKMNaLTDOVa8t/4TQ4NOGcz
	Cw1/mQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdsg375-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:38:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so5355064a91.1
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 23:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787553483; x=1788158283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KLrEnjPX6y2jGWNfb0TIDQT0hmTh0JAPk37HWUvUvX8=;
        b=OP2JgGqiSJH/UD08at3tvj7ex+7mcijfabW2rP3eK+BvBjVfkxjAUfyz9wZtEo6/wH
         Pi+3NZg9DIQEsOiqVUfXN0TtZRoMBBvy4IEMaZ1g45zNkGHksTpFvwOlpY7GjOXcVdDO
         sTKrJpHKqczgm+SUUVbvWXqH7K3eGK3f/fR7n2vtocdEOrkURiv1fviP8Dav5hEikXZV
         2fAfmA7btQ9Z0JaSTMQ1ORrXcnkSTwIEjgKlYu69m99gxptsnxsn7vaFLcFn8GMRqj/N
         uMMBphXOC86qmza86OiqbL84Tg4m/7wOdPd9bwDLCGs/NIsCftcgL2CO/Ox2MBdSTQOj
         xMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787553483; x=1788158283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KLrEnjPX6y2jGWNfb0TIDQT0hmTh0JAPk37HWUvUvX8=;
        b=MPUBKv2niPHcxf+RL+RsJM7wTypQt+mmWkvuYozBHI9jxaTLe/Rt4dLevj0WoFHdKf
         Yfn7fKWVpapd6V6nTs2Fr3QWfPqiKuA1qc28qgusTG/DASD8l0vuF7BpJGjkfsTb31ue
         fa54vQyWBdqTPczrMvDyuTWqO724lL3a/06iq4vP77gyktkT8uVUd9sDb+8Lsz7ZNvlU
         snRssPK8FlUo0NH+d0YWDi47EJYv9+ESULedVRu0mV86qCj+6rIcEK7eHpcoaU6ALMEq
         46x/M/tMHlDYvswFCTnfoLGl8Ok/ZFSA0JZvMxhJUkcYQfMx8mO9f9NPrY8FlRwZ2chd
         XDXw==
X-Forwarded-Encrypted: i=1; AHgh+RqCnplaPhsgYv8dbGxdvLeYI7/Lxu8x6d5URiVlyQnexmSE6OdSQdkJvK1fx52oehoJxPWEHZj2PSm1@vger.kernel.org
X-Gm-Message-State: AFuF++mox071fTINbJ7A6X6mnxK3J2QLKoKeXwjCvyc++3+gdgY8JkVm
	Hgpe38gv3hNhyFrV7EEsYEMDl4g2s5gAktECnbYhq+V9VAQtl/1vRhT72wucJOBgTrmi+EL9Lw8
	8h5sD52WYWCSxHU46MzQhsVJap/5wq3PMT1G2dbLlClFZxMXvCg9SNdVpDKPHCqrVAvlEzj6l
X-Gm-Gg: AR+sD12MiVPFVmh+jZykDLF0ZlhFBRhzg9lzWLOAVgyHgz0OyI2/uAPZdha27q8z1on
	c8bfkmreVL4PNdFRv1zCcjyDWLwtBlZBlFUW206rGsewNxpeKX9XX0D5uDWm9joJG3RSkYK8wLc
	JHFN8L/9LJS2HngkZCxhOzQkgiBDWvc5SIQygecShjq7wW2FUPoeuUNtAwxK4U10BR63Bmnxs8i
	QuX5eLgr7fTTxtxBJa2hr+mgVA3t5+DnO7ieO0Oo2L/2AfJ++auuSsOayBbzmWFcZe1fDeG2Nns
	x9EtZ6pAi6hcmQ1BwQWh44w7uS2+cRBOFRME2hLK9MQ2XT4N9juOKXAHmU2wxAUSrCyfm+B2hXv
	fg8PYqbwVeKe3/7XS7r6wqiFdZLI+Pi5MmOhVLOasPrRChvr+FRo8YG5FR99ZWOX7Ecu3o7NeSY
	Lk//7Zhq76EFOLVPtNVRTRbEem7H3Ilw==
X-Received: by 2002:a17:90b:4c84:b0:38e:2517:5d1f with SMTP id 98e67ed59e1d1-395df2595d4mr25815329a91.9.1787553483020;
        Sun, 23 Aug 2026 23:38:03 -0700 (PDT)
X-Received: by 2002:a17:90b:4c84:b0:38e:2517:5d1f with SMTP id 98e67ed59e1d1-395df2595d4mr25815270a91.9.1787553482634;
        Sun, 23 Aug 2026 23:38:02 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141861732f8sm21667830c88.10.2026.08.23.23.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 23:38:02 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 12:07:42 +0530
Subject: [PATCH 2/5] dt-bindings: phy: qcom,usb-snps-femto-v2: Add IPQ9650
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-phy-v1-2-257d68a3210b@oss.qualcomm.com>
References: <20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com>
In-Reply-To: <20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: RScBY53mDeDiRGcwahc0MDWkLBbszeOb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfX9XnxUAg89B5m
 V+Ic022npL1yHQNz/fiIOZ5mJtPvmC59qSFFgHP6UJNN4wdgZqO1wf84lNcrbIbAT5KO+SMJhtX
 cU5RtYwor/fDXbbm5D8ZRJgSjrloSxODGkoFbtw+VAwTk09I3r2MXcaIUzvJKmWCLLeUvEJefHz
 FHE0wIYqWtmaBEVcLOkM8eDf1Oi0WzMXb4LyqVCOJLX0Xr+t+IZ77igZ4A3JJIRrigw/+HME/Qg
 7GUBVzyWTkRsttvIjKG8oTZ31e+WlR/2W+xqCQnjUvUIFNbT5VBpDEN9+ihpTmZkBGy7p4mNVh2
 eeP8hvbs0lY3782wpnTIrZOrQ5YthUqNq38/8f3WiWkvqQe+V0sYvTBsxoGii5/bEbSI/OE+M/2
 Xo1oAzCSS8ioRnrX0oMx9ImEOZ8NXrnb1f6GQcIvXkuR1+Jai60QVsOfUxMWX+4OR4tZ4czqCmE
 wGkMCh0jcrGLCYspxWQ==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8be6cb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=XzRahJapldW6eB5g9eQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: RScBY53mDeDiRGcwahc0MDWkLBbszeOb
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfXwCNLktGVw1Wf
 ZD36yH1wiDBCYak1sWJHjUj7UG+moYB8K02mza78G9F7PQpgUxwmTJIwa4dqX9eJxTnenxm28cH
 WDvg4JaCv5hyPz+JZpwVip4yeaNh6lk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240057

Document the IPQ9650 USB high-speed PHY compatible. The PHY uses the SNPS
HS 6 nm PHY fallback, so allow it in the binding.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
index 661759b25064..405bfad2080e 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -20,6 +20,10 @@ properties:
               - qcom,sa8775p-usb-hs-phy
               - qcom,sc8280xp-usb-hs-phy
           - const: qcom,usb-snps-hs-5nm-phy
+      - items:
+          - enum:
+              - qcom,ipq9650-usb-hs-phy
+          - const: qcom,usb-snps-hs-6nm-phy
       - items:
           - enum:
               - qcom,qcs8300-usb-hs-phy

-- 
2.34.1

