Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4748337C0FA
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 04:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782708056; cv=none; b=NwsgmXY263d2ajwc3SRJud3JV6aXFZ7CYvQ7553g3TubOWUbAKC7vVcFbx1M0mE3WmBtysJ6KIVr8jKw/RDZ4GviTdaKeRctk4j74yNqg+r99GlQpfqhaQ9GZZlC39YTIUjhd3ZZfsHUIlIhUenBD0rBqlz9s02162S9g0uvEro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782708056; c=relaxed/simple;
	bh=dLReet4qk8pKCmyNfK4/VwN5WnHNEfcbrTrlCI49Zx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mnh8zCUQjAdTXxeft2jtj8XGtPZaq2ZnriJXmURL2ZM9iFhcmkSr/LCrlfH2ZXqM1ThrlO5udkQxbUeYznwhNl+Ajh/MGMzXVIaM0MkF9XDeRC4KSteUYvkYnQLnDEOsYvPPr/2xe6IIIo1TWvhvjs8bjYRbiIPTYaHhT76hna8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lgUdXXon; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NaSe1Im1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lgUdXXon";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NaSe1Im1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NPD61745105
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 04:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8FypNscE136sRgc5I80PXm
	+ZncAbl9/Js1MyTqglHjg=; b=lgUdXXonMXdgVEDrA04Vj37xDsifNV7QkZkY9o
	Uj5bx2rHVwmdoWQ9iRJUezkQxUQBSVBkvjeAPqEc3r/nrxadwNMR1p4t2Iw+qMMG
	XsUqOhYT2Wo9PpJxGM1GPRs8FZnT/xCdD15RypZTUOZmA3hCZ7XM2zJ19dDWuEKo
	CfcndkKUaiTvF2VtTsstg9BWWUVf8G7iUI3DJ3DFipkpS4xbNVDfCQneIA87ge9q
	5RMShNuXD0TCoYXnhRtp0PzvN6nMeJq4NBl0yJ/9/XU+KYbSlo9IiKRVUDo0u3wk
	0xOFtkOMGuM1/ams7IXoq/7rZYF8BrwV/PLqahpZbFh4oWvw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f2734ch5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 04:40:54 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c9bd8b9c7so3421179eec.0
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 21:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782708053; x=1783312853; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8FypNscE136sRgc5I80PXm+ZncAbl9/Js1MyTqglHjg=;
        b=NaSe1Im1dLhjzdz9tUcnfuMiCoNH4DbWI4nOPaWV6toktpRrAYRZy1jpqj4V69PnX6
         s0/5um9QhiKx6iXiGBtiPp5GI2/YDCvQBD9Ti7Qd+Qc92LCguyv92FE7juzURjLoNW0X
         WWiTIBEetHhkZlBlSE/15v20Zot1AB1gWPTS0ui9NGcXQHmk0q8fWYJT7UHpGrgc83Vh
         9k8bG9BDlA6q+ftxtym6iQ2GpDDtP0eFZMj5kX/Q76ykJFt9p6hjMu0AYF+CqDzpP1E5
         ShkHBFLs3FzJ4FE1DL7c5oJewpIB9V3X4YIYxkT1OVrmKhCb+YteKjRxYCqksubZ6wwA
         WvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782708053; x=1783312853;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FypNscE136sRgc5I80PXm+ZncAbl9/Js1MyTqglHjg=;
        b=klNcR112sgTyR4IVUPIxjvmxdQHZYRSoy3ExJmdYbpRoNjzIeUXG1HLsf4wvggvYla
         Ojtmn9sN7uAVZn23K3dlzDi+6JR15D2oCSRWzhU/dDvuZjwilF9ClcUk9L5NGVEdtANp
         9AVvSFE1+TU3Bg4iAI4Jyd8eD0eM8uss8mxuQn6qS27KLanAKkoosoXejR5k41KfBg+/
         afQSd4sdf5dpV47GswzlVaGfYMcYVTMXUWStnAaUagjI4DzCIhGhIsxM+qadiU+/X6B6
         ArraYkLwCK9avHL8j5iNcS55TM72XJ+nG0y/muJLFWLOY9SW5obyDplhbLeXLLghjwPi
         ccxA==
X-Forwarded-Encrypted: i=1; AHgh+RoM65eUKkD3LbqEweJJU17e7RrJSKt0khiWXn9jtJD7qZxZWSEJXHtIY1fy1QOnimcG9LXxNRD0fueS@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3dfTuLWfQmBR2Z8v4xDvzXMTli6i1i0263oj3ErxD0bJ7Ey4n
	DNqr7DdEb7PhjVBRKVLtiDWdOfLTTuN3JhWErXoNhLoRUzXg9eAJ7iY4QGqm3z1RTB5ZXxbSQdT
	PE3hMvtV7fi595PO+a1Bgx3MksW7CLP0iHppvFcPCAf64jCdfwbm2r9imu8XF15IaVrhuJACZ
X-Gm-Gg: AfdE7cl2AjwzDcu2E5YMk6Pcj2gXVR/5PsnqufJ7mVJm5lWbuWTCJ98eGmcPKcy5om4
	yo2o/fgTjd8rFAvGfoR8u8ficEkLhq13A51U9lTOHna0N8UbbjC55/+juxF+jJKrHY/Ufe8ZR9z
	ISA4m2MulSY14AVGfpwaTY/+XSTI7/izC5DGnrheL65MOxb7tYALKmnAhmcuQ9ZiwfKs9ylxbQN
	7/lM+W+6+gkrRD/jF2AbTrNx8Dx0+HCrc9c312hPVBlftFTbGbi13TTYAxKuk3wmsyfkgRxksrO
	y9GzE0xJ9aoCrM5VIUQ25qPnKR1tIYXlxXUyQc10nW/GpIkLeJC1AxVRckAQsGDWXZ9DF0J7owF
	63IirVBQHRrHHOqLcTBEkGMo1+VtmB/XQjUPLr5Vbx/ROhqQ3hz+RAi8bfUq+e5+Q9tgjiIO/9f
	U6F8L9EnJE9SkRQuWKiQ+2se7CCvKzpql/Etk7g4W/
X-Received: by 2002:a05:7300:7b83:b0:30c:1739:67f7 with SMTP id 5a478bee46e88-30c8511c2f7mr16170147eec.35.1782708053128;
        Sun, 28 Jun 2026 21:40:53 -0700 (PDT)
X-Received: by 2002:a05:7300:7b83:b0:30c:1739:67f7 with SMTP id 5a478bee46e88-30c8511c2f7mr16170118eec.35.1782708052646;
        Sun, 28 Jun 2026 21:40:52 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ec3e400a2sm11849664eec.28.2026.06.28.21.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 21:40:52 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:10:46 +0530
Subject: [PATCH] dt-bindings: mailbox: qcom: Add IPQ5210 APCS compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-mailbox-v1-1-3b75ae87c4b5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE33QWoC/0XM3Q6CMAyG4VtZemyT8SPIbsVwMErRRn43JCSEe
 3eK0cO36fds4NkJezBqA8eLeBn6ENFJAd1tf2OUOjTEOs50Fp+xs9JWw4o6aoo8r4iYCcL36Li
 R9SNdy6MdT88Azsfx7xn10+zoPVL7QK6TglLNdZpdzBK9xcp6Rhq6Tmajel5n/M4SKPf9BVqNM
 eW6AAAA
X-Change-ID: 20260625-mailbox-01f977bcceec
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: a6ZEZk5BBl41zFG_DYVMNGLAsc9p1VzJ
X-Proofpoint-ORIG-GUID: a6ZEZk5BBl41zFG_DYVMNGLAsc9p1VzJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAzNyBTYWx0ZWRfX99a5VUf5GY51
 U4b/SqaQ4nik0esC3Q1aVki/2yC/aEIQhGmi9b28hTSB2pCXXnuaFxdY/RNdMtTqEjsFz4dy7hC
 pF+8fzze1aUYSZAm15mDO2X9gSao6xc=
X-Authority-Analysis: v=2.4 cv=HYokiCE8 c=1 sm=1 tr=0 ts=6a41f756 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=oC3GMwBEtLq7gvGfhnoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAzNyBTYWx0ZWRfX/ogdZ4rI398L
 215qJ2HQe6lRa73eW6q/iJvY3cB/vhXzZUkuLUVlye8zvd4yANEnYNZYhN1PmcPUmox3qgMfiXl
 S6EzJ2Q4YT7MHuT2dxIOGKY1EhQ+rtDEKNfSeZeK/hIfYFVxHhNhkVLxJPBULhR2VDRoYqJ1RdQ
 mdXRnefgPAFStOrnn2N+MdrU9a+VhomZTuMOzn0kCzgAsqnN1KBGQBN69o9iS2XXWq4AU0NPT0y
 98Im0k5twJ5QvRbI4C8TWApZ6sTSZki2E/KFzWqFMgQvAk2kvI602yeGNnzxPBd5lMWWSsl6kz1
 qg7N5mtNgV7Y8Qem0+EDqSAUD4MB8GtN/jU8HAJH9xjLm5l1mZZyfQWkuF2vUjhacyVMHqnlScy
 3lxarvSXKRlSiQ2G3cwaoKZ9Gxc9Hbspg8rrQQSlekGQXkFDMEk94pMDv4J9itIrnyivWfA/tFc
 a9Mw6BHesVFIBpicq9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290037

Add the APCS mailbox compatible for the IPQ5210 SoC. It uses the IPQ6018
APCS mailbox compatible as a fallback, so document the valid compatible
string combination in the binding.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
no cover letter contents, it is a single patch
---
 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 1b4ef0688ca7..39bc374300c3 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -19,6 +19,7 @@ properties:
       - items:
           - enum:
               - qcom,ipq5018-apcs-apps-global
+              - qcom,ipq5210-apcs-apps-global
               - qcom,ipq5332-apcs-apps-global
               - qcom,ipq5424-apcs-apps-global
               - qcom,ipq8074-apcs-apps-global

---
base-commit: 533704f3c28c3f5f9e2542aa3a6a326c32e6f5c0
change-id: 20260625-mailbox-01f977bcceec
prerequisite-change-id: 20260625-apss-clk-ed39c40ed468:v1
prerequisite-patch-id: d9efdd8a09b028b1343243c5f0e78cf3e8b1e253
prerequisite-patch-id: b4b3a2f745b4d83a81939f46ca3a4c871cde73f3

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

