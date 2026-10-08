Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1764C9E14
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 14:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791471121; cv=none; b=O+oXrpLpzaniWjK714xewWDBrmiUl8+PxppifjawG1Q7BpqqRA845SdlWf47+5/zgBYKprRxuzZa/wlQnNSK/eGBQ7G4+m0JXW/U0yh4O0tGCZpGTDyrz+zrfV3jprDC0KA6UqU3CZzdM4h6kfmkqwMETNyhq+i1S9CSEIKhkEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791471121; c=relaxed/simple;
	bh=WGkpfCN6Up9LleQnrV1JPYhqrbmq8We1WbCehLL66ko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nf3UmHLnPIdk0on/ZBUT7pdn9aCNAnkApPkX11veFH0VZkwHAr0885eyiOp9dSIQXIZ8UJe2sjhXThBE/vs9CUst6z3BVSXu3OPKEB98wr/nezjPWwHtvpYAYDdCxOQih3O6kiHEmTGlhZfFcRFy8SjlwoA+jbJrZSM91aKBrX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AkZ2TOip; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C9b5rINe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AkZ2TOip";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C9b5rINe"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVEHo3017579
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 14:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9rO1/Za1A0DarcuqQ6a9H3IFa91AgUYHGA+PHZR++xU=; b=AkZ2TOipANPNhVY6
	nGZM3HQNID5znc37isRnMMCTWKW7Z/Es7XvMkQSAftEIR87MgOfqECFDWssNGyml
	eEl91JtJuzZqAnL/8EvZeRQO/A0il3na0+Afl1pz7AG2DHXV9pzNy3GerA3a+tlY
	Kx6E1z6e8NIDdhxVHMi4zB2WUKxAAnJyLsPMkFjbLIehg1ugC7xXx/XSU7iUmQev
	3RAomY60TVc1YJ5ivclq9R7prPqUofcDTXboRNOc+N72QzD3vDTqK06PWcLguef2
	ghULMB8eVyhpbJeZB3F/k8yMp3Ebk8K8yxVekQetfSxJZzWURr1R5+9ZRfOiwM0I
	E3U9cw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6b9kgghj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 14:51:48 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8a7d69f4204so73274667b3.2
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 07:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791471108; x=1792075908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9rO1/Za1A0DarcuqQ6a9H3IFa91AgUYHGA+PHZR++xU=;
        b=C9b5rINesiZ/5WWsvkBsahDJsEB9cBLAcfqDAzF6Y1fs2EbvSetZAt2B7FuXgrPkfz
         52BMgRVGdzbfRmYSWSq9OD/iFCyZaFaxom678OlFeVzKpZ4l27pX7HGiPDEcr+/Dh/ny
         qdYvuzjSQmeaL2m4XTnG0sLx3MT1Y1e2HQYILE95ep8oZfcXwa/pNds05RTm2NoiVi0u
         HlaXTMWO5kjf93AERiaU6IFPtTGF70hWe9sUs/2RycnlfJRmVUm9Vk7IIhx9/T1h2bsU
         AY5pQGZJn6bqEOIoUD0XbdsFt5bZRwXNJhedCsfnOYUg/ADdNJ+tKdVuZVlJNwQRbsr0
         hl+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791471108; x=1792075908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9rO1/Za1A0DarcuqQ6a9H3IFa91AgUYHGA+PHZR++xU=;
        b=WkwqKUYtsaN4YwWQtuwZkaTI+vbUgOor/PCBlkoe5fKoD9mOOtDf8iDbSY724qGsZD
         eGSejvuPXZvVf4P86uPo3OphN7CTDKJvm+oYOxTNwkN1vJpVhcH9HTQmem682foUIVly
         uewvZ2vmwK78pNKtmge6fsy5gwbsnW84VqWDvj/xG3Th8V0H37vAcBZ/ssgJadPNkhF2
         uS4yvZb6B/H+ActX2Df1eSs1wrhzy92pGYT3WleQa9GmuCUqPwWxX+3OLC9fmHNNEc7E
         9ODmh8bgR6ugbYeFy0eUDGzFh7qSP+ofX74jMkcj5J7fTx8IRurGuazr8A0QbC9XjXiu
         osew==
X-Forwarded-Encrypted: i=1; AKwUvBwVuRXnPfNEBMVsJ42tU+ohRqOgqdUutMTIs8VDYTv5RRdwIfTLuWpEU4kpJMrO/RYh5g2sV2EIjvBF@vger.kernel.org
X-Gm-Message-State: AFq9FYJXCgjNsy50mQt8TJEXvz+AQdc1yPxDNCBvcqQT33RsnNAsQmmx
	lzoYL4s35NH3bQay+qpVVV0ixe62xWklzyg0Gd4Uc+FlzJR7Fmewe6D8meyiJIo/fmutyo/Y/Wh
	3nOmBjVBmw+aol0UXEYlxG0z08WHc9pN63/M3HLnFCRKj5Jb30JOVPaZ33sF+qq3h
X-Gm-Gg: AYBFou1RnoeyqsOL+vx8AKYwqgyX3FtndpYKchwlIRUEIXiPE3/kgmTCnXQ+gkUg1dS
	Mwoo2a1mBcTozP7AuTikaKGBhOPkicTqtso7egFPOPaLti4ItrOln0phzVWPkOwgFQsvb39fhFN
	OXdENKJiXxaKnBJz/HYiCRp5+j9L4Aw6uqhs0H54oZvJKf7Gvln8zNoQW1xxzf6yKlI+pxEzOb7
	ufnGvFUMBPdZWe8HvCkqsdGmsRmYgwo18XtRN+28KuDzv8+2XSCzKLkcV3d60tZuOFqO9EtGCxM
	w4zbr/6rCyxRN9D3eTB3qlb2wAm3G1Ih59qg/QYUiCEuVzyaeUb85S1mLYJiBV/BgUefJU9gu1y
	xzmZ+icXVCoX1F9V8swhglKJtZQH9Vs25GPrFltIemBg=
X-Received: by 2002:a05:690c:c510:b0:8ab:41a5:648 with SMTP id 00721157ae682-8b05af828f3mr40462767b3.11.1791471107654;
        Thu, 08 Oct 2026 07:51:47 -0700 (PDT)
X-Received: by 2002:a05:690c:c510:b0:8ab:41a5:648 with SMTP id 00721157ae682-8b05af828f3mr40462467b3.11.1791471106920;
        Thu, 08 Oct 2026 07:51:46 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b05ab62607sm20903407b3.22.2026.10.08.07.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:51:46 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 07:51:36 -0700
Subject: [PATCH net-next 04/11] docs: networking: Document IPQ5424 as a
 supported SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-qcom_ipq5424_ppe-v1-4-16caf43e44ee@oss.qualcomm.com>
References: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
In-Reply-To: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791471094; l=1613;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=WGkpfCN6Up9LleQnrV1JPYhqrbmq8We1WbCehLL66ko=;
 b=if3FUP57wO4vhQ6UCGTPsFbJyPrCYrEceA4rd/zYEg64iZCcjrsQDD3svxr+j8HFbj6LOxn68
 QhxjTo0AMGrCBtiALSKuwswLWa1qbrwns+pPefmI3Cc5yjlLWTQDWAp
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-ORIG-GUID: vnAkK0iTBnNkT-s2FFuNeynd6vnXRyhD
X-Authority-Analysis: v=2.4 cv=U98Hnuru c=1 sm=1 tr=0 ts=6ac7ae04 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=U071OhrquwQVcrAs3WcA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfX5n+4Kc4zSZoe
 G5hVZJb8jfKXJqsRA2kX/Tmk1OtzuUWA5tn8lhPiCM2yWGn9EqMZVhzKusaFWGqT1O/90ClThyw
 KcT97s07JXcTE6JpRb0dBbTmfqumuVE=
X-Proofpoint-GUID: vnAkK0iTBnNkT-s2FFuNeynd6vnXRyhD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfX+kQ68xeE3DHd
 70Kpz76YFoATsdi6mKKymv0/fQRH9JcIbGu7Jm/cadXW8S7Urmwu6+i3pU3GO4or4z9jR6X7VZ+
 fTSGbq8NOK03+jV6S8afZ6d1x9gvJvJX45jB4lCw2+op1vnVpVYdgmnWVfk7xSyVb/+xFVyZXrr
 fRYvTylVIeJZXeeba4hGektFu1jU2MFyhGrB5LKWfcfjKn8lqd6osZJVPxcP+Oyp1zUqNa0+4/R
 YD6Cec1RR5eG1amqbfFLWBjRK3HQSyOSzTcEzTyGaxlhY5iMNb+2JhYwUcgUf+fOsE6d9IcYWXT
 2lIJCkm6ag77IKa5pXAw5EJ3uxR7oETjLqoLC+pDCLVsGKEwweoopnoncqvAOIG++JFZTJdxnd9
 DPHPhem+LX9AWVUS8yhNZ//3nQf0VIqPUNaQOkX6/a1iub+mc60LgZKGWKf7Du8UjzNUNhG6LFH
 dNw+EEOlK6QsEtEb4Uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080059

Update the qualcomm PPE driver documentation to list IPQ5424 among the
supported SoCs, and describe the per-SoC PPE hardware differences.

The IPQ5424 PPE reuses the same switch core as IPQ9574, but runs at a clock
rate of 375 MHz and supports only 3 front panel ports along with the EDMA
FIFO port for host CPU communication. The EIP FIFO port is not available on
IPQ5424.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 .../networking/device_drivers/ethernet/qualcomm/ppe/ppe.rst       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/networking/device_drivers/ethernet/qualcomm/ppe/ppe.rst b/Documentation/networking/device_drivers/ethernet/qualcomm/ppe/ppe.rst
index 4ab299a28969..04c48cec66d5 100644
--- a/Documentation/networking/device_drivers/ethernet/qualcomm/ppe/ppe.rst
+++ b/Documentation/networking/device_drivers/ethernet/qualcomm/ppe/ppe.rst
@@ -167,6 +167,14 @@ PPE Driver Supported SoCs
 The PPE driver supports the following IPQ SoC:
 
 - IPQ9574
+    The PPE runs at a clock rate of 353 MHz. The switch core has 6 front panel
+    ports (port1 to port6) and two FIFO interfaces: the EDMA FIFO (port0) for
+    the host CPU communication and the EIP FIFO (port7) for the EIP engine.
+- IPQ5424
+    The PPE reuses the same switch core as IPQ9574 and runs at a clock rate of
+    375 MHz. It supports 3 front panel ports (port1 to port3) with MAC0 to MAC2,
+    and only the EDMA FIFO interface (port0) for the host CPU communication. The
+    EIP FIFO and port4 to port6 are not available.
 
 
 Enabling the Driver

-- 
2.43.0

