Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74734DF4B9
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 14:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607105; cv=none; b=jjYUiMeqt6Tc7FxVPP5chQ+z1bZjMl5ci4x3hUI+wNj5yZA3ONg+E9YMQz7gICdREX0DCvPxQGyXeflpN3rdXXn0VZcxPjEIjgtBdMkU/1C+Ok9+cVMWfVJKZGMpkOibqP9QYxB80DwDwAUELlp0WTH4zSx8DJht6TtIYTeCgik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607105; c=relaxed/simple;
	bh=VHh9BvaOe14A405lLmF3EkfjMXNDD6EjGQjTA5nafkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UfrysI43YuxVQvrUYwW9GrNkLsCnfWHD2WxOSdUsk9Z3bMB/XFonLgrQZYXPzXacaYCssN6OwjPaGsrfFjS4guRMHB72d6mtDWtipOBvxgvj0da4ePTkQ0V1p56Ykcc9dxhkaVkFOp8weZDYvK/G+GiJX4sxeMUq861MfzzUBOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OjB2xNLT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FmWxSuRQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OjB2xNLT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FmWxSuRQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEe2i71498412
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 14:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZmhFpeTSl3y
	9IoBkZPsx5G2f0FCu2azZTfk9A9ZK40E=; b=OjB2xNLT3Vvmx41LEuBZ4RS1fMg
	iOxCiI77/a2CG0vdIQ28rTFdXWsa6FV01kowJEY3qK5gqGQQTikzSC4JwKISSAtT
	OFCrfT0dOre0nAkFQFt6IGATjjO85Q7/sZhltGs6LwEDX/z+ZimYlEXRZASCD2He
	Nu8Ol6Hby7j/Dq8pftzsIdv1G89Lt8q1BoPXfW85MPVXOYu22qHx0GhSQyJfdS+Y
	aoBxxWPire03NyEQnLoRIaHTPl8b9J5dAoyNw/iJCGADk2JGpGD5gkh4o6RSIz0B
	BOTduHVBop3B5q9CvzICVQXKzaLWKEIB2AgQmw1Fz06j4ycemUkPvSq+eqQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyk5mstdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 14:51:42 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98304865f02so2735625241.1
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 07:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790607102; x=1791211902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZmhFpeTSl3y9IoBkZPsx5G2f0FCu2azZTfk9A9ZK40E=;
        b=FmWxSuRQu3+3EFHV3nPgcegeZ2XAq/wEMMu8MTxAarrZizwCe9Q/U9uOyFihkWYRTc
         tgDno6qWIDgyNducGIGvdNc10V3b/7uZRpJVLRFqz8YPb4zDi1BaoCrfI8otvcySa2Gz
         hMVE/iBoh8HZOpYV5BSkFiXuVpVSSIFPAVfnjaETHqaBjo75vIZVj9PMXHahld7rUdJ8
         EXzZTZenljJ4qihjQ9V+ym/8QuBQ6Oz8ZtcAkU8EDLc3C+RenuJBspbElUpPyFuqVqxe
         rOgUk8JlOi/X5EoYdezV+nEy3Eud8HN9a7XA+nnTwXGcoPsMb5Ac5I76aQb1PWX+qFcZ
         Jzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790607102; x=1791211902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZmhFpeTSl3y9IoBkZPsx5G2f0FCu2azZTfk9A9ZK40E=;
        b=iq5TICXUC3/7mSSGJQPpxsXHbfEhzkD256ELoxNf8r+AtogTAQvV6VPLNHK+xa7Ozl
         M5oqtUfpGASfK3+Y1X+TpfzaJUjpsOU9UD2rBDZ+J3BzerrBCSteh+UrfZBqoD2Ppe31
         j+WlEupntDgV7V2yybIG2gUFTRc5tx/EAd5FsiVJsu6/oC0PN/tmWISffqDeknr1lE67
         XFg8XEW4M8txDNqkDbJG7ad5C+EheVXHSA9ehzt8WkOzK3ZbK1AZBYjeJnnlcVcCApD8
         gnNs4zeGscoR0wiFNr2HfW3aFX5Zd+Kvhws86yV/aA0vHVEsE2pWe+MLkJPMHy3iHZ4D
         XPqA==
X-Forwarded-Encrypted: i=1; AKwUvBxrjJWlw4xb8PPmxxlwYlBGf2tZoqGItu3DT0uECmPWyQLTHmNgrIj1HvOJW5o66wK7t6GNGLuD1Hem@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1wNiUYxkOhYk7T+cImYyjryqNGsDx4q7+CM0D7xs0JvpqOMiL
	mn1uA7G5Dl7ClZDKuSuyZvYV/qXmWghi1i/6mDONigWPmL84T7Wew12/xfNd2Fj2sNMxPXFn1yL
	ouTtxKo4j3snYkhwZhACRdwB1A5irWlhMGKwIHX5OooIqM1u/KHSMNSulUybcvz06
X-Gm-Gg: AYBFou1lkPCYHDjj80S7lqQXBhWWbG+q1fFAbXskq3wYdtbDWDhfUbi3JHqUzBomKID
	Zogi62igKJ0Axbxw/0AH6y9jQfOA/ZPcGdOd8GjJr6DpoKQuRj+LsFOQ/npdkyJePSc9RDa7OPg
	QMJerLM7eV81XqybGUMeh9xuJbhI4z2UjfSdh1e/yhryr7rsYNAsdbNJyRDR6CP7q1CsJM25DeT
	dnmOz1YsMPI6Qg4dcOMnTsKk1OonJgt4D9+EpdfA931c9geHG15l5ZsRlje4QKgDDEZi2Ud8tSN
	wvoEuZ8ZtrhNyRgDQ7n0ZBYHeJRjHNHI6UUat2t5EKn8bYXOIszUV+3MSlDtw2CyfVRltBkV7ZX
	rk+LzuJMPWAIk
X-Received: by 2002:a05:6102:6883:b0:7a1:f7d2:e820 with SMTP id ada2fe7eead31-7af1ecf1913mr4911091137.25.1790607101781;
        Mon, 28 Sep 2026 07:51:41 -0700 (PDT)
X-Received: by 2002:a05:6102:6883:b0:7a1:f7d2:e820 with SMTP id ada2fe7eead31-7af1ecf1913mr4911073137.25.1790607100373;
        Mon, 28 Sep 2026 07:51:40 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a007fd1a01sm42777315e9.0.2026.09.28.07.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:51:38 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: add Lenovo ThinkPad T14s Gen 7 (Mahua)
Date: Mon, 28 Sep 2026 15:51:20 +0100
Message-ID: <20260928145122.1337186-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260928145122.1337186-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260928145122.1337186-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2H9npCcGvpIeDV35RFZ7aVAxKc2ETx9J
X-Proofpoint-GUID: 2H9npCcGvpIeDV35RFZ7aVAxKc2ETx9J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1OSBTYWx0ZWRfX2hcNzyIHMHRd
 WjibNGdLGbkMsQgNSvdSt5yzIGa8+ng7+6qop+lvQ7eYiPJ43eV7OeL1cO4aWzOU5vF3UZGQRmQ
 6yo+jVIU1FK/qupJXnNaIeK7V++/fc4/zisUNbBlvt8IKg9O02LQLH84yhWmO5vEyNeHSR1iQQj
 0Quv8IT+iaqN3FvEyTxkv6bJ2cdBLpvhbGqBQ4sL353DqHgkPF1fInXyk7rKO14SflLgjwZ1jtQ
 o+M6kUa841wRxqEBiO6M5JfMw1XhROZcHiSahleRGzEdD3qyQb1kVmVXqrJi+SUblYi3U+yZ7Vi
 AHupD73C86XFcZZOA0Z1XbUSB4UHy2Z7/n2TRjKQht3EWSTTKqgy4HQ/s11X+QU6i5vB0UsAcJA
 Jp1iApBzMRnQ/Mq0eAQ4gr9Sd7E/sjFqgykNc5FT5E55dhGU6QVYhz2PnPITeGvkwT5ZpP8AGwl
 v2/RAp+wJ+0wDdLpa8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1OSBTYWx0ZWRfX5RjzKOXyTPfO
 +9D2G1rq81gUzcKlhepIhcgY+6VAe0oRPoMawfPyZVqJIy8VejjvOtLSv7UryJM3/Q9vxiBkwhS
 AbcaYFCcsn95hGF6Xg7WFbYJF+3D8As=
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6aba7efe cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=MSM6P-WPhp0LPykjVWQA:9 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280059

Add lenovo,thinkpad-t14s-gen7 as a board compatible under qcom,mahua.
The T14s Gen 7 uses the Mahua SoC (a 12-core variant of Glymur with
cluster2 / cpu12-cpu17 fused off) rather than Glymur proper, matching
what the platform's ACPI MADT dump reports (12 enabled + 6 disabled
processors).

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 18a13b4a460f..de4647501085 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -194,6 +194,13 @@ properties:
               - qcom,mahua-crd
           - const: qcom,mahua
 
+      - items:
+          - enum:
+              - lenovo,thinkpad-t14s-gen7-lcd
+              - lenovo,thinkpad-t14s-gen7-oled
+          - const: lenovo,thinkpad-t14s-gen7
+          - const: qcom,mahua
+
       - description: Sierra Wireless MangOH Green with WP8548 Module
         items:
           - const: swir,mangoh-green-wp8548
-- 
2.53.0

