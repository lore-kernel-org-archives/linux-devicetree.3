Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4533FE343
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 05:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780638354; cv=none; b=XS2vGigrCFFOXb8DBnBDyKm2ojRfMoZJkYQ7IOOgpvs78HgVGJHNKPd2pLbnQXC4Mur6Fr9kRjmCqKlTzaEMjryQh0nnBArGpJyB70DUEyxDYRGClT17JfPVxmqliu+GaMm2KlHwdYqbQYqTQUsoRTEPNJWz2nbKjGZDf7MumZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780638354; c=relaxed/simple;
	bh=Tva/THzHBTqT2ONF1mJDs2pzgPcet8fzDuKUep33HZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bRm/3zJ4QmsVVOeA0FaRCoRdYBFmhJKdF6HbGpDiPvE1MWltJ3aWisrJDRuv6tvc1+FlBtn6wd/PWrJtB1GLLwjdm2s2sHBgV24VEOsfEF/tSBHmLplRsVicVFVZsz/fv8pz+N/vChRyKf0wOMhM8aESDGEmqYuVxvM9czswN+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/DgsCUB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A7Pqh2KL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/DgsCUB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A7Pqh2KL"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654NGvV21132186
	for <devicetree@vger.kernel.org>; Fri, 5 Jun 2026 05:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J+gMWLEMj8dIYBFuFbm1S4Zeb9oR0rkjHmKZnsKAxvI=; b=b/DgsCUBdXv+I1j2
	v5kZaz79NTF7WWVQJ+LrTLAbb8Hv4mJhR7wQKA4juevX2IuJ8g29GZSilCSi28ZN
	o/Dh1XKw0VCB6a31mThd2RPX3FZlYkSnU/3GavpSBMqQyFRvRibTph9XYHex3weL
	HUgatdHy9VSIHt10P96xll5733oXwScXH0Ylu3OWoDs7ycYc9Y70NPXML7Ws1KzN
	lVoDUJGkxovD7T1G06yetSzVqI28YJIMeybeYBCMvOjIAI2QE1zn+4+cGkukwv8M
	NykZ4OJwFSiq0HV0neyYW95uMyWGDqQ3jAtPytMG99Fr7YoTaEjZp1r4p/LJHFTE
	qGBopQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek5wsmwng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 05:45:52 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304d0d0b28eso4161993eec.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 22:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780638351; x=1781243151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J+gMWLEMj8dIYBFuFbm1S4Zeb9oR0rkjHmKZnsKAxvI=;
        b=A7Pqh2KL2Fb9jPI8ZKUWkCYT6qy/9oAVeWoQTpl0v28g8GAG2n3OKi6rQzawWtZsO4
         9br117Z9Q/Olskh+miyxqqLDSNG4wW0s6JoaNtrWuH88+ezR398+rH29g00/NX1Jw/kL
         FjYm64O8kCsra8cuGNNxWzQ5xL8J7s3t6iCqJR2gyFJofTLDF3dw4o1wZhZnaPnaDJQ3
         L1I8W15kj46Bs2posrErXx5Vam6wO6B11Hbf6qKIthsSj5/dxMgU/QHGeUZs1DVQ8udx
         OpaWaavOGM5ViOLYEhdTkzHBB8SxsFDiRShN7Pdg8zXmNtO6OJomwXAQQNxenjS8oFt/
         n06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780638351; x=1781243151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J+gMWLEMj8dIYBFuFbm1S4Zeb9oR0rkjHmKZnsKAxvI=;
        b=SrORJlNo1JCn17LbOYgy+1ep9CaDCfTC3Jfg3+vmPRqbi8fW45HFuOYFoweqCDck8d
         QGJMXHBa9CXhnE00wMA/yD2dOnyGQTax2skYuwvTd4T6dT2Jx+j6DWlUkCS4QYieE1ni
         +tBJ7ZAoOZOxwQudgOkYypU1x4wf1+OuJklTHvD5Kqi9Mm+pGJhe733xRR19Jqbx80p1
         XQF5gJGdhC8sNo/PVIVa0XukhLLGF04qsglwSkIW/zdeAFUUvb4DNg/2Qf3cWFotm01q
         TZMLzuwqyRSc4j20WjTE8R9crkca84Dh46lyrQ6IYkK2iqxVQtE6pWF7f8E0ON+F9J7A
         T3hQ==
X-Forwarded-Encrypted: i=1; AFNElJ/fWt6fwMv80li2EkjZRR2ZRbPYFBVW6yDisx1OzdFHfeZUuTmRCOWkAN4l2gfuq5ZGUSPIBZyswhLP@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6mZ2m+YU2V9gAhGS2RPwnP+ruuLi6dAuD51fNID7b9VlEcYa+
	R0TYuRJNZ4/zTtXj3OxN39B/DMaZrs43wmCjELeeN0UE0lbuIX36P4B4qFcDXCkz292UV6TFXC5
	BjVN4IJnTl35b5I27JffsAD77SumtXpeHikPAPC6B7+z4oalg3QYpFuyQrrDYtkDg
X-Gm-Gg: Acq92OHB2k8UHJPlfr2jNrPdjnIYyq95vpiTeYkuw83HzyzfxWpH7mH+ZjxjdGB8Wev
	i7bfgYZdK0PHe9f7oLKa+hKOz97hIoqnj+GVWRA4F2ZcKRvsE53craolee8yZ3pesdDZ+TFYKoM
	PV2VL6EtcaMZGNvJ1hczjLji6NS3MvsDGai6B04tsSUNZFORxUEYJVmQLOoSGP9tJYZd0E3aI9H
	QmOnVK5recJhEsufMGcT0fboYcbxE3Ph8FFzUKePQ542MS7zhNBqDKJYtbzuy3EXTvVVr8kiv51
	1yzyuqcNfiUYciVL1Ta8auwxRdoXLidoZT3ofdzu89X9qAil/QhLpSS7ngMCiUZLYcW8G0xrbHZ
	f6ZJY3P/drRd5zL4ChPwoPPVLG+iFt8/uaJSTbovnghKWOAbTwEVMEMxmWa/U5cSG4k5bxJkRH2
	Dad+3vRNA=
X-Received: by 2002:a05:7300:f193:b0:304:d8cb:8413 with SMTP id 5a478bee46e88-3077b7c60bemr922927eec.24.1780638351579;
        Thu, 04 Jun 2026 22:45:51 -0700 (PDT)
X-Received: by 2002:a05:7300:f193:b0:304:d8cb:8413 with SMTP id 5a478bee46e88-3077b7c60bemr922913eec.24.1780638351092;
        Thu, 04 Jun 2026 22:45:51 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db560d7sm9480955eec.5.2026.06.04.22.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 22:45:50 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 22:45:44 -0700
Subject: [PATCH v2 1/3] dt-bindings: firmware: qcom,scm: Document SCM on
 Maili SOC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-maili-soc-binding-v2-1-21b5e9bd1aa5@oss.qualcomm.com>
References: <20260604-maili-soc-binding-v2-0-21b5e9bd1aa5@oss.qualcomm.com>
In-Reply-To: <20260604-maili-soc-binding-v2-0-21b5e9bd1aa5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780638348; l=1059;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Tva/THzHBTqT2ONF1mJDs2pzgPcet8fzDuKUep33HZE=;
 b=NNIxbmnyRBCS8OoVeR3G46l9aY6s7cmMGPZboc557Bv30diZv4Ywo6M/+AMcQpxJKpJc8QvPw
 PQh9ZZB+92ZCihTeaOHtLJ7iIQnEQNKpwCgXDzxLK0QVQ/0e8gv8jUW
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: mn8tOv9z-e2bu5J_89lO5obJlctXeoH4
X-Proofpoint-ORIG-GUID: mn8tOv9z-e2bu5J_89lO5obJlctXeoH4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA1MiBTYWx0ZWRfX5nPSKgvbyySc
 wfsajEb6TDirnct5aZt8Fl5uVb2P1fnwTY0a5HspnEbBiPiWr8Phyu9+pxdkFkBpke6MLxxzzW0
 MGmWd9Vff2vVVwV8sbpoOFpF4+T4lpAGO3TSmz3ZAnk9PaWLp0hZfxouMETAF5nfXNBR9GiCc/+
 XshMcPTZvfgz7LYvnbu2De3KPsYoTj0IoDOZqxKWXmvCsVDSicIhKaXnq8f7WWs/WGt5NkKuwYC
 GKtEQKda0dshHWwDAkUEcpJgBHIYTRivHahn5/++X2MPvJf1efazWSFHa5+xG5cbdWVoSdGTID1
 zhaE7z6ms+4Phyv0XSj+aL1hunr0lzlkI7J7ySYmP7223enjTfcAhI1emxpuuBSmw8iZ1FmgF0F
 Moamj6FN3eGvHrFvXnWv4ocOGWq/UVOCWQNPTPPdO20ZQRtBczmk+b2gvBlGfAoDN8mEtbxRwpc
 gAcQlo1I3FFPVz11www==
X-Authority-Analysis: v=2.4 cv=POc/P/qC c=1 sm=1 tr=0 ts=6a226290 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ffYJIid-Q94gFHaen9MA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050052

Document SCM compatible for the Qualcomm Maili SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 25f62bacbc91..f344d1390b1b 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -37,6 +37,7 @@ properties:
           - qcom,scm-ipq9574
           - qcom,scm-ipq9650
           - qcom,scm-kaanapali
+          - qcom,scm-maili
           - qcom,scm-mdm9607
           - qcom,scm-milos
           - qcom,scm-msm8226
@@ -212,6 +213,7 @@ allOf:
                 - qcom,scm-eliza
                 - qcom,scm-hawi
                 - qcom,scm-kaanapali
+                - qcom,scm-maili
                 - qcom,scm-milos
                 - qcom,scm-sm8450
                 - qcom,scm-sm8550

-- 
2.34.1

