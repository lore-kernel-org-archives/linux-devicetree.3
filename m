Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794618811;
	b=yc81NMswZ2M4K0vUZLIP+VvsFkxlaYWNwM6KmHM/11eQTjas7gY+a2aZig7anDmShkQR
	 IfV1oxKm7dTuB9RFBa9YLy9pszZS40QywFhYBaaqNpYDdwCpTZPiELOWVwvTwn51EugMd
	 GOIZtRomrsrNBHuE6AF6FVGT1otuhB8iOD/WEde5jtf5v6usYk/zgwwHKKl9YqDJL68iu
	 KiJCZ634lklIOHyWet4nQ/K42SmIGWG4IqplXvsnqcEEYApgBixzVFVFsU0QxZV+tC0tS
	 o25ogYLbD5T9EMxQzhwJm2Wi0ma4QBvMG/i0FRu+WUvFn2ulAbeK2vjGFmf/oYiudzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794618811;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2l7a9FO0SEOjp6R61ar4S2cjWp3e1qo59RxK3Y3Hkz0=;
	b=hgbhgbPL2xuHTGMX2L4Szu6UqcXd5KMAFM5B5fF6wWJCpxdXeuyaXA7zB5AkCfrrw+uR
	 mcFRDgmAOlSQGB0c6RxYQZfzwBsRnmuzGmk0a16tLX5kltoSMg1n8ZGBOQfaSyddrjqcN
	 iWKdQqCkMIv6VtHbm7ZteZD7IFpcO3dcDDH7+d3SYyQOYOmGuX5v4r0XFYOTCeh3YVzXz
	 +VScYyA3DOD7quRPJzuvPwUGObrR4yuPl65NiuWC6pffYPt39XmO4ijJ17QWMjLOM5TR4
	 8sjRJYEYeqluHMo3ub3h5PAEFGeaCH32ltXJ3gfbC8ewrHSRsgY65N1aPWEDYL2+nRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I9mSvnqb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gJWHrj1a;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE2B606A33E
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 01:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FE2B606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I9mSvnqb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gJWHrj1a
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADMbExk2846011
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 01:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2l7a9FO0SEOjp6R61ar4S2cjWp3e1qo59RxK3Y3Hkz0=; b=I9mSvnqbty4lHCSv
	1V595++OyJ0Z7aRn6JLT1RWafjthvzluXt7l7lECWu7HIM+tHjC+r/f8R+Q1C/zU
	ONKicF/m1XRxxqPKr99YWutec/3+Z0cv9qnDTRR3N3newo2P8weSkVIgcbNRwhK3
	ddhEyHjVcHJLiFmxHYk7jA8bby1bC/u0+PRYtZ8FcK5QoCwHjUAA6jTD7yfQlQo6
	YaYZ6YhcpYB3j85AB0kTyxy8INxP730SOy+zt75XRZgVOeE1o/fbp060PO4+BBwV
	TcMvIqREBnAxOmVUeFIOmUWrG9tPym38R2bAP5mdMC93Jb5f+SrOaQAmlqe9mZZV
	0eaZag==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx1bpayk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 01:13:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36ecd5db581so2089988eec.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 17:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794618808; x=1795223608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2l7a9FO0SEOjp6R61ar4S2cjWp3e1qo59RxK3Y3Hkz0=;
        b=gJWHrj1aWR4K3UaBmcUAajKuAOA7CcUd5hD3gqQEwKtWXqd6qK8Ot6lm1XohogntqZ
         jcIP9GjgD2V6Em99K5mdv0iHfgnCtciABAClQGnIhKqKgxOuO3NnxYsuDIRJD1yV8yZ1
         ym7dwpdwUtpU36YrsUMcVhkTJywE9Rka6FUmEw/CSEMIByPCp1ZuwpHt4Tvr44lMM9be
         FKibJl36IzFu8jFtgEv99zFhPeUssJ82ohF7w8T68ULj61ufRKv+N1MzHRpHfebbrQjc
         ZV3rgGa4MKQgnzmTMRN1zlHOi0iBVWXrcjgNm6uht0bn57Q8L+nnnDrwuY6bmw2DQc7r
         YFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794618808; x=1795223608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2l7a9FO0SEOjp6R61ar4S2cjWp3e1qo59RxK3Y3Hkz0=;
        b=UDwFRgi04/uhZ6ZZA9njn67myokKyU9FLIOU9M3db7LuU8vJtgwl6R5dEMj8jfp5VC
         M85xeowCc8LPF7/0rkrzeQidcj80kdTuO/0fgg6SN8OFnm49qXgJUwXAyJ2CRj2Puy+7
         ++lq69k5EA1KfwjXM4vRVD2+BFHvSB89DFdzhOWOTZccwB4s891ulRXzsK6zE3m/kuYC
         eNtLNvWcG+wNv1gKuz9n3TmELSyTtr+sNGdSJP5PYdw9UIE/YFAUzNeUxpDXtfXCvE0q
         ZIakYqhNuI+/7/rY4ziKAOk76vnuETcXoYC6Cu5hMU7boPp0ydrLvZJuJwnxPn1shc28
         h+kw==
X-Forwarded-Encrypted: i=1; AL+hErHiK4o1TPFbcgfHvxLuQwFQKehFm6J9kkUoRRTE+/T6Zk3ea9JCynvQgBnV6uVyOs042p6WtIID5QRj@vger.kernel.org
X-Gm-Message-State: APuU4Z+/FiBHE1Xg8aJK8dsDYHSO9imwskB1dOHsTVMaU2kZPuMpZAkn
	ERVwQtTjhCgNpGmGTmVW3JSGkBFsYz6jAKf2dpZrXiD/tCcfUfjM8qN1L5Sko1dn88lY6HWa0Y8
	6St6kAWMozOqa1j439g9ZEED1zFELd+tW6x2Ku+GSO0wWndran60p9otfb23Hewg8
X-Gm-Gg: AYBFou2/t/lRpBswbUbSgxykcvjxfYggX6krSpMk0N3C0CYnegFdUw5azxAyRF9Sq/9
	OZ6WjTfd0zl5AWim2llEtOoB+SatdmJPQLYxPqBL+d42xA3PZxjFoXkoQfKSk14JK84vBAGcgx/
	odYQUaB6VQsyf3aQTNl0vp9bLuwUsnygbnEnF1gNZGgUuiHxBumUi3mGOfD2I9QcbQhE01UshqO
	CnknQKvSg3wtVvBjifUSj4igwfLSDnSbj44z7XIM7p7I5ayV8ZZtBJAEG1DuPRU2ot4HNweNlpt
	bU9pctDoz/XK16gowhn61bnmdqo6gprVkilR3CMmRD9otL2xiMjb6W0IEjHZNql8YfA9SS/NXtE
	e3ZfW5BpcKpydkOzuNi4ZODTjRtjJcVJJvv9DCbEJlGiBN/kygMrsG1OcdlOjrE7IqxBVeXNYHu
	LQZvDp1Bms
X-Received: by 2002:a05:7301:4d10:b0:377:58c0:22a7 with SMTP id 5a478bee46e88-379655d4493mr3179175eec.6.1794618807937;
        Fri, 13 Nov 2026 17:13:27 -0800 (PST)
X-Received: by 2002:a05:7301:4d10:b0:377:58c0:22a7 with SMTP id 5a478bee46e88-379655d4493mr3179154eec.6.1794618807286;
        Fri, 13 Nov 2026 17:13:27 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm10952813eec.3.2026.11.13.17.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 17:13:27 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 06:43:04 +0530
Subject: [PATCH v3 2/6] dt-bindings: PCI: qcom-ep: Add QCS8300 compatible
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-monaco_ep-v3-2-7fe227cdfac0@oss.qualcomm.com>
References: <20261114-monaco_ep-v3-0-7fe227cdfac0@oss.qualcomm.com>
In-Reply-To: <20261114-monaco_ep-v3-0-7fe227cdfac0@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794618790; l=1137;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=s5Y87Am6PDDfuUvVslWLtn/yo2Q7MJcUCKhSdRzo2nI=;
 b=Jk36zBCLoS8UAywAYb2ft0Os2UknwfK1EJL5/lVvHm14BbQvBzWXaiRlezKB7UMZKQQ6d8atA
 ozomEkdv8gGBRRxGGqYHEIiuIdlL9j3swKMKMRm04TlBLJa/Y2CdvER
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=W9ytxhWk c=1 sm=1 tr=0 ts=6af7b5b8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=AUvBg9Asf6StguVY0UIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: afC4WIbieYGWaK9eE1GDTc_NAbr8LI3X
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAwNCBTYWx0ZWRfX4ZEhm7jTfaEo
 +DbfUVysHd+wO3UscEGpVzqlfHFbyG8YeWSbADGqP+M9RLjNUfz9sw9hV/J2ZJ337mTquz6rj0Y
 5aUDjlAGCpU0r7plIJ3mJoZA01KtbQM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAwNCBTYWx0ZWRfX4IAuediCQe8E
 qZ2OeEKVg44bIujlbexO2tGGckwQGL+IDQtrR/ZgclHbBp07AhmTRNm9TotfC5FD1e0BDNFfRDN
 t/0BECjLqrTMckA8jzBwk5fUiR8qLdn2VZSaAvk9v0G2ZTt8nZIkzSuNYfm/P/7DVwGDeUErjhm
 KUMf8zVJhFIXtotnFExPAEqESqzISKApXxpvVgHOnaFEzrj26Pxuf2qOxh4km5tTRsVR3ha387i
 CQ4DdxgZhdHGhttmZbsc9fHKYCSmMj06+EAVEVVn9bBf+/SlmC5LghssTe2dSD2kLfwmxGaA/iE
 dQJT0IFxpbrxIvQiM5K5509w1PF3H58PiqzHk4/lYFO5GqsSrcpN4s6TuPkA/lA7yd3+ji+H+mv
 Ot+kkVYlL4JjfshVjlBcxD2RBGEvic4PNl0OWrIzzyBo+du/f7hF+rug5m6yA+rUGDIkwUeAeLL
 YI33p8CW6OZ2v5UKAkA==
X-Proofpoint-ORIG-GUID: afC4WIbieYGWaK9eE1GDTc_NAbr8LI3X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_07,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140004

The QCS8300 PCIe Endpoint controller is compatible with the SA8775P
PCIe Endpoint controller and uses the same programming model. Document
the QCS8300 compatible string and its fallback to the SA8775P
compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
index bed9a40b186b..1ed0b97f883c 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
@@ -17,6 +17,10 @@ properties:
           - qcom,sar2130p-pcie-ep
           - qcom,sdx55-pcie-ep
           - qcom,sm8450-pcie-ep
+      - items:
+          - enum:
+              - qcom,qcs8300-pcie-ep
+          - const: qcom,sa8775p-pcie-ep
       - items:
           - const: qcom,sdx65-pcie-ep
           - const: qcom,sdx55-pcie-ep

-- 
2.34.1

