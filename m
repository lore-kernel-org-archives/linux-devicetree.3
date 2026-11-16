Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835101;
	b=XBKizLvrUGWZCsFM02BpIO6Q2814wWRL56pEz/ggVvdXi2/17tmwwf7I2FaK26QyAFV4
	 8gO3OPD8hW+IFmeqDw6pdtCCMY9KGBiZpSmXmntnLkpJwE0EotwrKpE4NC14bm3ayZr8W
	 53LdHFEsG9J2J1hu9uRI6Ldh6pwd2xOLs+c7vXlPgCaa5VqurbReM683jYOp1AbK5neDl
	 Xi+WAdXZBANTbr53P1vZ4HPsrfjhTH2J+u7ZS7TBNlcKw3q+rXiy+wJknztS1gOtUJmFs
	 1sbZwg1xT39r7LrhDfuAfTkfbhIdkhN6G/H9UBP/0A2yIP1i436QJretqpaefLWaE1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835101;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=eiucA+wtjzHIfQz9RvwaXxBQzP8Dhf3ByqiqoY+aurM=;
	b=Lr558S1S7oA7+NC0ev6a7VFUjSFw6Arr+PzNtvOOYN1+TMgKi7VBr4pgao9s138XRRpb
	 inbMJFbcHbuuqhfOVxOq/V/1xLwtSqFpGkYIMLEPhRJ8RXp+1qrI+CWJmfHYzC4zeyrQb
	 q6SxMnKNpI9voRKNx4Q9qyMZN6ob6dv/HJnPdPMlJ28pHINbaX/1+818V4bxbo/+cC5LE
	 M2HcX5Useb3nABqWZ8vQdWH6Ta61QDnOHXnLYkSKUeJOUlxVd46F71yBBNbdVf7c8FCQB
	 04hQv7RwLo4Px+97XbeC33fv+TebyMkhHLk1gXE8yLKwmHhzpkEu4w/Hcc3ZyCX/v/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V0tPSJ6P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XzaKo140;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20EC606A32A
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B20EC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V0tPSJ6P;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XzaKo140
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC0uDi2472430
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eiucA+wtjzHIfQz9RvwaXxBQzP8Dhf3ByqiqoY+aurM=; b=V0tPSJ6PVwrpjHtZ
	Zi3tJ/BSazgFYTmvRqQdk9TSdWokZLmDiLT90OIxED+9p57GGOD3U08rHm/qmUbq
	utNEDf4rSsqp7PuU/t0Z2ichhhuQ2ipjAzQm2ht05MTwZ/tz6S9za4Yi3cCYj7rR
	r6rsEEy7S33hlrbO1axgP235Un0U52/PvBNAQS192Q5iMD47cm4c8n1gFdnN8uAc
	RgKpRgJsGzr88ApI1peasgiYfrdoHK5LLsTB+7A6Lpvopf2/YHMJdQxmberQ9tKW
	uZ5o4INsXMDSszEtSW7tBRTlperwt+Q+uVguZfP1uvIWHu1JXH7HBUJaFEKOAB69
	b+yGIg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhdxhqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:18:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844e383so614658285a.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 05:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794835099; x=1795439899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eiucA+wtjzHIfQz9RvwaXxBQzP8Dhf3ByqiqoY+aurM=;
        b=XzaKo140ticZp2E/PdGzh0yUQYwZzTMVgBNA/DRkbmgeAipynYUXaVUOvrjjI4RMIN
         Ojj4DpyRCzXxoV1z8+/rUn6ZKfPw7+HRrtvI4+tu+67nUHWoViUX9DBjtl+1YbRHha3h
         deE5OIiADaaCP6NEjOHARcl/aDoWs7eniOhlyqv0W4ljpc7bMRIsDjBwHanC4sMJ+fzt
         dceS6gC7MJp6fF31MD2Tpbudgu2x2larYDcF4wR2rrs1nGuOvr+yVz9jHabu98nFWZgK
         UpIjBCSn6bVEAgEH/kr0JjFLZyPdyKp6ALo14bo2tohhajUYxFUku9HpW6dpKYodGwpl
         +WeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835099; x=1795439899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eiucA+wtjzHIfQz9RvwaXxBQzP8Dhf3ByqiqoY+aurM=;
        b=orVBI16Xm/ZTQ31lYvuxBXztXbzaQcDfJAjhNmnQAGBfA9bDdNSUPatgTUSw2GIuT1
         p2AANXQ5pWYvxcDSaI0HmQhrkg0dIV19c147u3LWpd1BCA8mHGwPzR1AMfjaAGw+SRAK
         rJaPIanPGJnJzkXNFf/IROJRu1CaBonr3W0F5WI7/AhnN34/7f5bCAGV28raYldII74j
         6DQxVtcbaWgg+7rf1qqkKQ6PHH/Wibyq3BFssohq3+0A5A43NNw2KpA4ncUZ7jnW37rc
         dG9DgcdIz/sY93wokUpNvf2JGmF8YBFyXYgCcVTR0sAnnjPn0V0U4p1rmMHRxSLwLh1f
         4hbw==
X-Forwarded-Encrypted: i=1; AL+hErGZ0j8ffRMMbyULR56vH2DtAkkT4Y3AtRsNNzdWJ/kUCnHifGwDh3ANkvKrZ8WsLXzJt4Gtz9fZHZjk@vger.kernel.org
X-Gm-Message-State: APuU4Z+zuw6XtVvRrP8MAU7hx5dp5zj/ycOgW5vGzlwSeagORK9w4C8q
	zXSf3BjUj0faOl97391xOhru2yAHtZ/gCZpqx4qgx4w/yq5kpxpq3BxwFnhJBGJeSGXPf6lUIZh
	WBJGFarGWmOm2+HF1C25pZTOvSTSzDvfOdnHqjK9tBRlrFtjGQ0CnLx/+OWwswg45
X-Gm-Gg: AYBFou3U9cnwPJgpEnrKdeo+4FeZPlxp+GE4n1AX8yGw1gWIU1jCtZmoHCHn0dYiZHO
	xJYkyA3OsRJfJFPFYaGDIJ2d0ag5pGcewk2MYCidSl7G1dZ7UHR1CbxrqxZn5JQKGVymIbenzC1
	W1WQBxB3fzjZfV9YvZyb0zgT+uqJAkz6ZDNHnInjpnfoVWgKkfV5WcYFzM2SIREj5oug3kIZeYz
	MbhC7ig6qcy5j9BGH+I+OvSNt7xfUMG1NQ1pqwG8e6dNKWiSegdgToMsSTb4SKaWefu0MA2LGtF
	qPCoZEsvKlwHmq3F2JLU2+uZvRpvSYG31vyeu/v3nNULkn6Ce97GkrSoWYx6D7/LbzIPvlDRvx2
	PYhUxXSQl8KR7uLebnZtQjtTE5ciIxNsKeZSidP120PWea/pUHBtxXwZPfRCIcfP8F3bU8Djb3T
	6w
X-Received: by 2002:a05:620a:2709:b0:944:d79:c02 with SMTP id af79cd13be357-9494ba55576mr1456186585a.10.1794835098953;
        Mon, 16 Nov 2026 05:18:18 -0800 (PST)
X-Received: by 2002:a05:620a:2709:b0:944:d79:c02 with SMTP id af79cd13be357-9494ba55576mr1456179385a.10.1794835098475;
        Mon, 16 Nov 2026 05:18:18 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8e1c94sm843927285a.39.2026.11.16.05.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:18:18 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 18:46:46 +0530
Subject: [PATCH v3 07/11] drm/msm: mdss: Add support for MDSS on Nord
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
Message-Id: <20261116-nord-drv-dt-v3-7-e3d3bf0e2c49@oss.qualcomm.com>
References: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
In-Reply-To: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794835013; l=978;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=cUv9ygkqVGKsKi0AqbVOUesQJiSTwCdwgeTcXPt+zc0=;
 b=feVgYY8v1OmtMYZhR56xObEddH4ZfXk+7alnHhbbpkFAvGzUXeze73NFNgFXi7LWeLUnEunZb
 K9td4X7BvYFCOuLLmWeFhM3EL6B86ftpqGoAb+5luNQDk3Pj6p2k7jJ
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=VOVIDNPX c=1 sm=1 tr=0 ts=6afb029c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ikCT10dxFQO67KJDykEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX+R7XxRWlWv95
 W0b2gXwFexJ5UDrq901uJXwbxAAKefnO3tgapedP8VOq8YjAHK7V0u4RH7IgIwPF+aCWpArC8Di
 NSnwNEgpxt797X6QdGclieX5zKhLwMc=
X-Proofpoint-ORIG-GUID: E291s8KkadjlGM6FeZotkd8tus87Zgc8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX+pU3d1Q/SwBK
 0tVoi874mMLvNUpQSESqvNQCPEIHDIYBGbe0o5e0W9bduruYLxGH00lgXdOQ4RZIVzP9FNPqiJe
 +w8uVqwM9XFT8TPPbNrl+uZCM8T4le6wLG8MgSJ0ztXHpSflUe/maViiSsUv4FDgvR3MYsq2N7k
 JnJLfFm4coXWy6v6DPpSiPrcmJrXMsBFaBYOIafFRCqxve6/r17QfDUwHb9+YR0uM73i2+r0WDg
 yZnlrRKfWEblTPOBH3c2sPchdOn159d3aLTOLlCrAMNZB6x1tASRvqPZpC6Q8L8vMj/cIBbPj33
 wAcSjHhc6LkZF7ALYKfU8Bmj2BoU/vy4KR/uUdahxu1GLzCTRAUyDEAiDq2GMfy/q50G4g4IWv4
 7QV6grRFe996S63UrmKEDknQBWiSjNaMQWFjX0ufUzqE+oID3Vniudenv2bZAiATJQjB8CuN/F/
 H/AhjuCTWoHstQ3NcSA==
X-Proofpoint-GUID: E291s8KkadjlGM6FeZotkd8tus87Zgc8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160052

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Add Mobile Display Subsystem (MDSS) support for the Nord
platform.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9087c4b290db..90bcc8c28dc2 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -531,6 +531,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
 	{ .compatible = "qcom,milos-mdss", .data = &data_14k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,nord-mdss", .data = &data_57k },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcs8300-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },

-- 
2.34.1

