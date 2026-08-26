Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5064334DC
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751977; cv=none; b=fE2AorTjmonzo2QPXZ6tE62NlnYh8OmDGaGvY4I24EFLK4uPG5dWzO4j85MHBJw32AfqTiy9d402PafIyn1oMTXxqW9lc2uhU28o2HRgiS+OPYcWIXy18n0zH0Iq2MHus8cMu9dAIc3rHeXoX9hmwzecGhMemsoSQRyXVutCdvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751977; c=relaxed/simple;
	bh=5KtNYFFVry6MjZPWQFGWY4OYvhJcbDcQt2VRTsLJSig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cdfXOSWoyuJdjzThx+0vP+ZxmM00IsckSBcqdY0siu6pDgLymv3D0rx85BqoDlWr9D+LxPEMMoKziXBB0Q2qJhj4lsj4o4GN0YV4i+n9katM3RMy5jC+wNAwZ647+72CDOhSIZxPkYRCbQdF0kVfPGua+pquMpsfBihoFa3XKBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RVOLDpnk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ebtmc6MO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RVOLDpnk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ebtmc6MO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCNAk8295401
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s4UvypWfe9nt7mL/wvOboSE124gWnEVIXlimAS2FGrQ=; b=RVOLDpnkM5HuLEoJ
	wg2SZGwMT+A/5zeZXVgxnZH8c9P1nhHsst/MpyMHDx1NPvc13hKzK9cK6o3VRsJt
	6O8EsVlIkQbUjXNWui+Sq5vMNy2WOLiyjj8NSdVHEdgUi4HMUHXe/2aQL3j5jshi
	aEOQxTEOptfAtQ18Yh2voRXI2TYkgVsXeiEBTdVmVSDCO9JV+JLeOZe6paYYV3Fs
	am6ykJJ4j32aBDRTz7cThujPz6OojdUpPKrIDSWnj0mlQupz+T+ahhcomDlFoA3L
	WYo2rKw1oXjHUZAhBVSjiidKg8FiPulNJr+zBs6cuUFCPTPXQJCMr09tOjg1gWpN
	Ush1xQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga03u0a7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:46:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso1241592a91.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 06:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787751970; x=1788356770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s4UvypWfe9nt7mL/wvOboSE124gWnEVIXlimAS2FGrQ=;
        b=Ebtmc6MOUVuarzLOEJAYxzzluZ9fT3uRT8YYmv9ZPRNssbdNJUz4aNEsVCmFH9JThB
         NgaxHyn9P+1zXr4ALZDm1c+UVuKVcRA1Gwj6e+vKsl0yCsGkYX23bqX1FsYuSjE9yFhe
         vAixmQqufgkTASe7nXvq7i44hjnfaVqeFZ1NmENuy/SxVNIMiisQXxftd6kpssi+jXzf
         D/7ApWl4aDBzMxkuf4W16XjnTB1pkIOylCiOJxrYgKJMjRXdQh0SCm4bOTJU+r25c38X
         MNp3mgpp+xoU7RzPrE0fi0mmawQJm/k3oGZ2XfKxftLSbGXFzAPVrBPFZ51T6qIPZIGo
         iFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751970; x=1788356770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s4UvypWfe9nt7mL/wvOboSE124gWnEVIXlimAS2FGrQ=;
        b=BxImhziv18JBPYgwDO/paYZBh2Dl5wCDjaQ5sOgy2D33SF62XxSYgCUqWYn0PrJ9Qx
         hAmQOw5UTRdKeoXt45ImRSmht+lFaO+mCqbgNw98X+aWM1jBLQgbiA+CLaDJ4pKxiYeF
         24iTkszMTkQRKaPsUbNH2liDNi9Qj4Bi0z1Vch4pSEUNfo4pCM/MEfcIQQoR72J1mD5n
         ZLvtHw1TJsZg+D+rsUctJM+gNY/xgRwXokWeFswpLfxb+V4nbOtmM4/X4nMqor5CFLa0
         vNmhIgm/3cwZcAxu+YPY6HPAG01ie3qXmK9DE54uoRelblGGdQiG5Y7gxmC9ZVUbDUox
         VOXA==
X-Forwarded-Encrypted: i=1; AHgh+RqwKV0rNb33Mmfh+Hp/RVLyYvCp+QCwJia6YhVoG6I+By2Dg0FX8KDmTSchy2JiM2Q45Fk77KBZVTqC@vger.kernel.org
X-Gm-Message-State: AFuF++lrb8xLkLgg2yy3evlqf4ATILmIdZ5T5pOegp0fBu821WuTT35M
	x9cKGHjWYlIlolX2H3JVfy5GTSqdpQnNO9b4RDRgQI/7uNvHhjvYIU9/QaoiwnmUI1HhJEeKihz
	p4bCgG4uTQqESFJOjymIc2mAZO64CziqHz7le4FTMCF36lsGo40mspMTyHWR7AF8c
X-Gm-Gg: AR+sD13DyLIrx6tZnY83L7ocvkV26+Vn5aPFLai7+yDDaOrkJ4bLA07ZzRnjixhjfgH
	vBfvk/0TdyZV2vyUDTAFXgGDpbJEcn0fVawbbSXpPglSJsWaefEC4UKWPeiu53g0Wh1I6EE8uCr
	0HZElhsyXwEGRCzFVM7yCjWbQE/X56ct1WTZUYnovW4vSIHJIqXpMVginyuy9ESVJhvI3/hQbEo
	Zxw2JCDvDzNZaKyjBwzieUU3e7xeOLvZMiNpoioHlX8O+Q7b/b+kL+22MiUNhb58vBM+mNa9V4F
	mTiCFuCM4twPPOn/6dbRCBG0OiYY2HcHzBcaURIUoEID4lUexVz5UVbipkY0iCU98nCuCBcJf0X
	tLrxKiHqNJ4fQJcl8+YOieKCaTvY2aVYwkw==
X-Received: by 2002:a17:90b:4c8d:b0:395:4de4:92c7 with SMTP id 98e67ed59e1d1-3966d1443a1mr15385560a91.3.1787751969695;
        Wed, 26 Aug 2026 06:46:09 -0700 (PDT)
X-Received: by 2002:a17:90b:4c8d:b0:395:4de4:92c7 with SMTP id 98e67ed59e1d1-3966d1443a1mr15385364a91.3.1787751968904;
        Wed, 26 Aug 2026 06:46:08 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b64c48sm8179696a91.8.2026.08.26.06.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:46:08 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 19:15:44 +0530
Subject: [PATCH 2/6] misc: fastrpc: Handle multi-cell reg in context bank
 probe
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-extended-mapping-v1-2-d046c1cb9a9f@oss.qualcomm.com>
References: <20260826-extended-mapping-v1-0-d046c1cb9a9f@oss.qualcomm.com>
In-Reply-To: <20260826-extended-mapping-v1-0-d046c1cb9a9f@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787751952; l=1169;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=5KtNYFFVry6MjZPWQFGWY4OYvhJcbDcQt2VRTsLJSig=;
 b=Dn/XjaDvVV9cYH+5zOtGZwLTfrP+4+V5CgIH/jrIudFSnEDO5v5jXqK+RlPa+zfCxSI6vzCOC
 xcsDyZd5Df6DO0lqLdMWCd3j2Tue68X3EdlMgKW/E0+vpVcFsx5VVeE
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExMyBTYWx0ZWRfXwOwnhoOk9nmB
 1UNmx2wDG1XgAjQIox9jvNxNiNhjxNeJmo/+dZVI3l3Pu0WzEcQQf6HlWp2Ks8QhLLDx9RxLxHI
 ccdXQ79Gxrc45e1P1TaTXF+b9ZBhFZDlfEDxMgayR+Mf5dZmnBSx7zzMcyRPI0w+NGAh1aAIxP5
 UAjU1E9tMFFDOOeEQrVluAVKh4wvfC/ujRXBk66pqRVeWulRe3Dzl3gPKEU5ExANsy0UBRy+I1/
 q683KSb1WlT/5uGEzUZhphZRbno0E5cTDntwZ2ChIzfclbo1BjRqJ7tMeM2hTcXyLUDRpADqWCJ
 LkSedBw+yfhK6LgnC3/6gBhbMD6CCS9qv7qSQLaHeymbSS/niN7PeTwzIGcqDtx1yTnc+XPU+yv
 wnrtre5Kg/IqSct2LWLpIm6MkHBzRRV7m075/nLKvUY537I6tV6I1hPdvmNx8F1f/zTnMGGSl7T
 Tedhq6oC3qb04ayTW8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExMyBTYWx0ZWRfX1jXc2uemh8aK
 CMS+R0aCFf7PpDrhHFVmD9JpDFOpicOUz8HVWchRKdBmpPHbg1mjFg9PTzYr7AofN9BvGc1gqCm
 haIGhvIjbqRn1B4JjrM4M/bQMWdDZeE=
X-Proofpoint-ORIG-GUID: iY8QqIy5g44xFRUwr6yQDf6cmTfAZLdZ
X-Authority-Analysis: v=2.4 cv=RcqgzVtv c=1 sm=1 tr=0 ts=6a8eee22 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=OuqQISpc-kSra7OiYdkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: iY8QqIy5g44xFRUwr6yQDf6cmTfAZLdZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260113

Platforms that use #address-cells = <2> on the fastrpc node encode the
context bank number in cell[1] of the reg property rather than cell[0].
Reading cell[0] on such platforms yields 0 for every context bank,
causing all sessions to share SID 0 and corrupting IOVA address
construction.

Use of_property_read_u32_index() with of_n_addr_cells() - 1 as the
index so the correct cell is read regardless of the parent address cell
width.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 98a61b8b9013..07a0f2b229b4 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2378,7 +2378,8 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	if (!cctx)
 		return -EINVAL;
 
-	if (of_property_read_u32(dev->of_node, "reg", &sid))
+	if (of_property_read_u32_index(dev->of_node, "reg",
+				       of_n_addr_cells(dev->of_node) - 1, &sid))
 		dev_info(dev, "FastRPC Session ID not specified in DT\n");
 
 	spin_lock_irqsave(&cctx->lock, flags);

-- 
2.34.1

