Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DC838AC78
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716953; cv=none; b=UhEZToCl081K1hjHuyvTm97tjDm7t+x2svwju6DyAfgz0YXBGGvqO5mr6kko8DQ2g57g3FLUjrUmnuwg2Eo3+FhnmPGEL5jy7as2btDf8e+GP1z4a26PIdp29ka/jNLaInK3o65pOtkXPZGEBreyTaoXVehIAu1aL/ZQWPRQ+Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716953; c=relaxed/simple;
	bh=4ABz6wJPYJ1ehhzrRhbxP1bfJwHwHvAK6ZKFqk437qg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=L2uqnhAtkrt07dha8WkoBw/AeLqLYM+hZqTzoZcQslISLJJ+Em97VdDoVBv/l5X8qW1gI6X8t3/LyicP19i/cSc9929dHRehqnE1HMQw0KM+BzHXMt9sRHlLxFW3PPw78e769x5ivjigCm2J8yh6lr/TB/b40FUCuFBClPBmtu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MOdx6e2E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cSPiG2QO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MOdx6e2E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cSPiG2QO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rLA02115401
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YbkP/92NDSre5wnTH84JFq
	wEsaY8UPj+553PsJZAyzY=; b=MOdx6e2EgBt00w5dKummkTmcsdE6Yhc8LrQR/2
	lPSlZKuoLlf6ckH1eZE7Gs2Irj8KyDdZ/XmGSNPKHUMtMGjG/HJiPaRlHI4MCwKJ
	E+7PSQ9v5kQjEqmPbx3UqXLVMyG47wDjuRrIRmWFASoPVkxMKJakxbN9ZXSz/Xti
	qXnVp6JEGBDbN3lFSmJ/TK8zJr0hq+Oh63Cf4rWMnEae5oAkg8w+da2s3bW3Cgoz
	6e8IeRF04WcNxGywxsmiBgXpyeKfgR4w2eV34myEr+qJb4Lhn3r7w0Y7mJVkgQ4s
	aP+AtYmkRrj2+9ptGDjC0wC0h01xxlK9cpJrchok9VyFCycg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f2734d7yh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:09:11 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c9bd8b9c7so3569997eec.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 00:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782716951; x=1783321751; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YbkP/92NDSre5wnTH84JFqwEsaY8UPj+553PsJZAyzY=;
        b=cSPiG2QOiOy3XSWNVCt2ZOofPaHQHnOWmh4NmwkyqU3O3dywMsN0EVqQcKtatPqAeo
         p+PgSKHEBtDf+5RilJW99xpt/Hdu4jud7n03PjdNnv4qgV560zWZRxDrtClldDjaokCc
         4tbfC0bwdCCOF3eUd3KhtJjeZyfBAIeOZEutBCtW9xNF4FX8qzd4ww2orIq73L1T6wZq
         8O51+3uQyq8b9HPCe3pXtuHuixUjwVyf+sC5fRMBaRuaiaSlOO+dwdIxgRSe78nqPJve
         /iXUaGMxcXErFs7cavMx/w4Io0CKFrou/0FTVdFSdMYq9lWxJKULEjj/lnpRLHjyqLGk
         m6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782716951; x=1783321751;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YbkP/92NDSre5wnTH84JFqwEsaY8UPj+553PsJZAyzY=;
        b=gy+RDi04tOzIcAVkfJVdooxO6zZwaDFHbkS1PEuwXuqvyN2x1lA5/KFqFBM1L/xvHS
         ZA77HxUCNbPsgIGBlf4TRbUx+sQNjM4HXrkMkx0QfORIzlYvRuDLmwog2LcM3Vq9x+OJ
         hO5mskOGUIDCtVN4A5AytHKCYWGHV1ctYqbiF+Aqzqcbs0LPq2gLNI9Y0Wz1yroD3nsC
         fWQqFNZnH2oQz2qaFUr/Dl4HQsuzBvsiGsjbFJyVvm08zCtARG+vx/VRcQhTMQrvYWRb
         zl14cDbiTl2L4rwz8va9bmSZektE0AMY7ssm4n5nMeUD/ffqV6iky00WrB9uNssnfX6X
         yzDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq903lQAQJ1Htr76oPBn1NWDLc9f4aoEFw/xd93HB1F/VYzyqnbA9DEMwGIzVIb7U26CSp1BONTMo0I@vger.kernel.org
X-Gm-Message-State: AOJu0YybBFHL+05d3XBrqTZ/lYcjyNVU641rNKtK7BgxJKT7Gv4JccjY
	yeWeJumq0v4Ph82MTPhGxfL/Q0xvIDx09hoyCXA0cj7PnziGThQPbGiXbSg8gQgrA18L/HjfRBx
	ZJcjD7H9RfUcCldKyfw0ycvkWsx5+mJftDWTIzWo/qSdOYDCznj/urxQQ5ccA9Eg+
X-Gm-Gg: AfdE7ckWjEiQq/xiqzCXbCMoOsztJJrtirU4yY4BOYrRnuhMeQkYqvFDu+qTefD2zSJ
	q7P7LuTYk0DHH/iBWI9IM0lU9/2BxkxgbSrqTu0krdfqIkD7Y2CRPNj/jZvXnoO3mN3RS7Ytah+
	TdoBA8SPHJQz0ecqyu/i+KUGD555DmfH9ZD1a8l4PgoPPhkuF6yomRicdfE0wtXQ433h8BBC3TG
	o47aQTOqtV4cDxnHdTsBcUFaFBk3JkeMcH5JDumqR2V6OmW5fiXYCQeNH60tI54s/tthxEahaYg
	G2JSgC/JtW9MQ8LqUTgxhVuvt6k5H7geQtzzomhG2I2tqshaEtIQLvXrm2jLgkrh2EzgDQFgkBd
	Us1BnkoRzhbeKwPoX9XGdODTYixp15l+RWaACNVqdbWR+DdMUc1uD7HPLAK3nAA==
X-Received: by 2002:a05:7300:e790:b0:30c:ab4f:9ba3 with SMTP id 5a478bee46e88-30cab4f9f4fmr8669238eec.43.1782716950582;
        Mon, 29 Jun 2026 00:09:10 -0700 (PDT)
X-Received: by 2002:a05:7300:e790:b0:30c:ab4f:9ba3 with SMTP id 5a478bee46e88-30cab4f9f4fmr8669209eec.43.1782716950061;
        Mon, 29 Jun 2026 00:09:10 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm14519280eec.31.2026.06.29.00.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 00:09:09 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 00:09:05 -0700
Subject: [PATCH v2] dt-bindings: watchdog: Document Qualcomm Maili watchdog
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-maili-watchdog-v2-1-5cb9c83a581c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABAaQmoC/12NQQ6CMBBFr0K6tqQdpBBX3sOwKGVKJwGqLaKGc
 HcL7txM8pI/760sYiCM7JKtLOBCkfyUAE4ZM05PPXLqEjMQoISCmo+aBuIvPRvX+Z6LWpVQgCx
 KlCw93QNaeh/CW5O41RF5G/Rk3K5JCrXPHMXZh8+RXeQ+/hVKOP8XFskltxVatFUtKyGvPsb88
 dSD8eOYp8Oabdu+yGlUx8oAAAA=
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782716949; l=1158;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=4ABz6wJPYJ1ehhzrRhbxP1bfJwHwHvAK6ZKFqk437qg=;
 b=74cp4mhkT9eiMa+4wjLbFiQX3XHgCURSPKcBw05GNH/2Fe6354++2zTgjFtYOWiPXa1wURIrs
 Xet9ncxNAR/BRitOteCitTRue8+A4hT/Pi+QUm6PyrRuhqfZzO0z+Gc
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: HeDgHN6gil8TSPd_MfFNxR3mXxhPp7o_
X-Proofpoint-ORIG-GUID: HeDgHN6gil8TSPd_MfFNxR3mXxhPp7o_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1OSBTYWx0ZWRfXxb5s4YQguicL
 qSzPq1ovcJYeto+Iq9RNzL9fpj47j5c0qh5Kpv6+Occ0fyLtGyWNMHaMfzqVLHc9EEvBXOPgGtv
 rLfhs+6nQpvJSOE2jynLVEvBb6/DkyI=
X-Authority-Analysis: v=2.4 cv=HYokiCE8 c=1 sm=1 tr=0 ts=6a421a17 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lHQ9vJlm6CZYuNRvArUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1OSBTYWx0ZWRfX30haAtOmh7ch
 KsUfH+R5pwCYbu2ZhyjUjknjGaUeVnA3PC4JeCSZogps41Qs1LIzgBX+GrDF71O4xNiAAsOAMvr
 8YbBlNngQ7URO9ueHkzK+P4T4O+oux1/PxuE6hNF4idV1scc7qNjUy8bPHNKGsU/6z3NFidcsxJ
 x6QD4DOO09Q/TSAfhiioK1OpcFioChTnTo+Q+ZsrTP7LTnGtrg10aq/xBZky6QlY47+s5va2CbU
 x4OqM3ygZRMPMo590NFgkclgQZmg4lfHvzTXN0Wnf05Pse6AeS3xQTsbQZT1NfnBS+FO4Fv83un
 tP1/33B1psbefDNXUtA8yrOsyqGuqExDJfoNyC1ZLTQopW+aDew2cxF22l3g4v/5x4KahspK2yH
 DBaqeSnY5E9hjkdkLV1LoNqFSuWtBhLyQ0vo115sUPlZhaGEc4wcHOhfWGeYMG15pQh3mFjDTGc
 PBzizguQ01V3EA+CJ/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290059

Add devicetree binding for watchdog present on Qualcomm Maili SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- patch resend
- Link to v1: https://lore.kernel.org/r/20260524-maili-watchdog-v1-1-f7efef781701@oss.qualcomm.com
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 74117f5726a7..4ff61102e407 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -27,6 +27,7 @@ properties:
               - qcom,apss-wdt-ipq9574
               - qcom,apss-wdt-ipq9650
               - qcom,apss-wdt-kaanapali
+              - qcom,apss-wdt-maili
               - qcom,apss-wdt-msm8226
               - qcom,apss-wdt-msm8974
               - qcom,apss-wdt-msm8994

---
base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
change-id: 20260628-maili-watchdog-0865232135e1

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

