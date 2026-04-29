Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D19C3A6EE7
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448663; cv=none; b=efFkYIBmg9Yr00lRu9sWysdydzE2J7p9aJ7DeV1sKqzoOmeckWeortGyHUBu8vuj/9KAm+OdrpYiDgqAzB8ZfkABtccmHNWHGjOd0/Xm/Q64i2UyG0YYAXtbtDZ0QRcol/AYXtscRj8FzKkAYBmJVNACL6CSnN1U0I2HhQ8ARRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448663; c=relaxed/simple;
	bh=IVMOjjeOvVzA34ONEIzI9yOomKhrFD3snmXGZuN/fhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mroiQEfbRVFszfyv9G9XtmVWsqupCv8zgvL1r/U7R4J2FJB4Xr9davRH4iMgAnRoOkQAmsVNvWJcKclGOc/68JLjeG4062lrFQs2EfXngQCKGynJLwjUTvgHrU8CYvQ8PohpbRN8g3AUtnZxEPtoiM5aBhODp53Osm9yAFEeoJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pEOTYkVm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DQN/kdoW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pEOTYkVm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DQN/kdoW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T249OT3705091
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jrwpLPifDsLwhC1CYMFolsR2RenoGcmSmM2DcBjyNLY=; b=pEOTYkVmR2g2pAaw
	cjTo3V6SwYGLFgDHfByQN/PDUH46QdePidNAvx8X6Ad5q10ywnIEZfDbztLp2hCb
	P7gm7Y/NPv9OSva/dCBSLcsLa6I35igZxHoF9bK1jcgT/GsoqY/zfl2nNeA+HpCA
	YHFN0aS6b0Uo7N9+6J5wbv1F6bQZyiVZDGOxkETvzSTYPABTaX2JFm8E3prNWyyz
	lP9V9YwfGZJJBZ0pl5NLoTgUfeW7cvl+v5mLWh7gHrrffTiWFV069nzqrquweNUe
	SKbbVmkjmQv9lIig2qosSHIt1mJjawpENzfu3/cX980uxMHLx+GWD61rpx2nFMcg
	26cj/w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttxhcaj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:44:17 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c798ace3e03so5234111a12.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 00:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777448656; x=1778053456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jrwpLPifDsLwhC1CYMFolsR2RenoGcmSmM2DcBjyNLY=;
        b=DQN/kdoWxHkfJseHYcRmG2g7JslqgdpDheyRI1nrypGqwMOhOsSEChtjb0Y3L2Cv8n
         Ud2quXmfI/80aDgFCXUf2wk3dpilNofAe7dWnLtYsvTvNpeYYQQE6a0i3sPYlv9OD4HN
         Y5exZv/M6aZZHTPx/57KnRUZIDS2FbSQaAkTMcwc1ECSBgCNcCV1pbHYzHTni6hmNAGq
         SCRSx9cLzZFZBM7NLmgvjxuv8PIkzlVkaFZLxdWejsebsK27NxhKG7IUkgRMVBvwI+gT
         8tbvpE2xheYx9SSgNn3Xp7qq2zZiA21civnliOpCOuBX/kPAOmf94dMXtajN/TT0WtI5
         KybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448656; x=1778053456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jrwpLPifDsLwhC1CYMFolsR2RenoGcmSmM2DcBjyNLY=;
        b=IQxeKS9f8DQ52xpIBgbJce6tBbQNzMDl0yRs2sIkbgn7FXMPs67AxGE6AmtB4x61Za
         nqH/Oadg1gsKpA6QG32tNaICk+nSZxQiWA1kcTEIeuK9D0BZgYtwpZPF54oFx3XsY5il
         Gf7hGC0YCC8Aeayj9dpgyoekYVwG/RUnNwqNmym/aqurhLq3TjI2zui4y2u6JaWKLwV3
         v1OtOb1NaPHrnK18Z0xKjHIZgiJs4M6GFYFJJheqzBNzNxEmnfq7Axr7sPPQvC7p4eaf
         SN8H9zEKOfo6TYhO53ekp8bjgufMwFfbJ7ATZqZMNViXeubOLTLC89cBjKTxI7FzqlWN
         KwAw==
X-Forwarded-Encrypted: i=1; AFNElJ+O4MIieBtwC2ZKDX9UzgCtk7OfoNypVIN3zAoeEFotGePfJ8nZnakFEdkaq0CLZhcWp+ktuV8rtlRG@vger.kernel.org
X-Gm-Message-State: AOJu0YxLsv1LvfAWZOsITDsR3abc+Yd2N2FuHKWd/j9UDw7wJJPn70Lu
	EOg1thrUS7xnhfkyycqfNWtQojiW8sAAj4LmOT9sCe+4vepVRmuAAxqG2ANKI11HF7HBX8gctUg
	9BXW4LSzaRFojv44GtuU4efpYyTejv6KfMiGZe81qXgGpnYsiYmGAj9ig8D4G3JTr
X-Gm-Gg: AeBDietbzZWJOVJxqkVcVJXO3c9rD+FRnqaCNCM7W20bAmP35GNaRzNQUrGEv0fA7Vy
	d8Ry57mDCI0lJVikIsolDc0SnVcz6YvqYnmVXvtwGYWdi5M1fPhLlsQBHVVI+lGIjezpNCvpjrB
	tfDPxW7n538DYjG+yhhcZUrfyxtfrO49vrhsLmv2JYfUmPyNOI8zZeYfR8NuQIiiHJ3fY8CAdfw
	PNXXU8zCxKhER8zURivMpBNOwI5JxQzeHSXiaOLnMbDF6qs/NY7Gih8USemy+bqJm7j9iRIbqlH
	KVqUVcXTYozq95tqOjs1hm7DYf6fRtrR5VVllModmv8GIoel6nPkR1lq8a7XKLHE5GahW3RJE3N
	5QohlwNNT4RSK3mBI3Yuj/pnsI7QWGXG/viypDjmIgZBmwD31Vw9emBnc3yOGjDo=
X-Received: by 2002:a05:6a21:e081:b0:39b:edcd:d92f with SMTP id adf61e73a8af0-3a3af47153emr2915972637.11.1777448656225;
        Wed, 29 Apr 2026 00:44:16 -0700 (PDT)
X-Received: by 2002:a05:6a21:e081:b0:39b:edcd:d92f with SMTP id adf61e73a8af0-3a3af47153emr2915934637.11.1777448655598;
        Wed, 29 Apr 2026 00:44:15 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd6506858sm1155848a12.24.2026.04.29.00.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:44:15 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 15:43:53 +0800
Subject: [PATCH v5 2/5] media: iris: Add hardware power on/off ops for
 X1P42100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-enable_iris_on_purwa-v5-2-438fa96da248@oss.qualcomm.com>
References: <20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com>
In-Reply-To: <20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777448637; l=2003;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=IVMOjjeOvVzA34ONEIzI9yOomKhrFD3snmXGZuN/fhk=;
 b=zHRn+CRPe9RYKsWCqWea9qvi1Hh0/u/crDyXYzYHHS0vj8BXGWWOOKzL4euhyYWrPDmk6SmJP
 9K9zF3qCSupBhfuQrueqcc4UVxs34XCKSm82gA9+5YkVaLRO7KDKbJH
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA3NSBTYWx0ZWRfX/lh5aDPWC0Iz
 3NpY8XWSMArxY7S5UJX0oZKZX1qPcm5oeCDLziDdIrkE8wxXMQzOU4xzX/JmpenH95f5PGTgZYw
 FRoqanbNMWmKpEiP/irkZG0zvcn3d8ezVpBoVffhc5c0p0futv1VE/AyNqvgMnwA2REe0DLH4YK
 kDFO/zA7iwFumwTRFIPpjW7SScWcjUvXKeRJxSXoBD8LwA+YC0t2+H6J0VNBjbq9OwCyd1PHoo/
 y84xR8kOy619A/MC2vxPnEO5HLo1sSEYFfQywdZwTQJYavnybtBSZ7Xb85ZijpvY7bly0dSvRqR
 0s4tBlF2BKh7pVlzY6BBSiiLIkqWXQ6Xpmmun/E0RKeD+Rth3Jh/lIOXUjummacSAtgQkH/srkI
 8BxPtQBvPavhXPbHtI4V3RYOwgfThCzfzD2yajndHQYTWAGwIHiReRkiodFO0ag2+bYIIHlylyV
 y8X2VLpEpUNNNb15/GQ==
X-Authority-Analysis: v=2.4 cv=Uu5T8ewB c=1 sm=1 tr=0 ts=69f1b6d1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=KtZWPW8jcQ_ObEEXPWgA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: XUlntVQiQniL1x-29_0Z9Bei8XUiHrwX
X-Proofpoint-GUID: XUlntVQiQniL1x-29_0Z9Bei8XUiHrwX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290075

On X1P42100 the Iris block has an extra BSE clock. Wire this clock into
the power on/off sequence.

The BSE clock is used to drive the Bin Stream Engine, which is a sub-block
of the video codec hardware responsible for bitstream-level processing. It
is required to be enabled separately from the core clock to ensure proper
codec operation.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 548e5f1727fdb7543f76a1871f17257fa2360733..281b1f54cb962dedbfb0ec96ed3a5aab99b50eb8 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -224,6 +224,7 @@ void iris_vpu_power_off_hw(struct iris_core *core)
 {
 	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
 	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
 	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
 }
@@ -292,12 +293,18 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 	if (ret && ret != -ENOENT)
 		goto err_disable_hw_clock;
 
+	ret = iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
+	if (ret && ret != -ENOENT)
+		goto err_disable_hw_ahb_clock;
+
 	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
 	if (ret)
-		goto err_disable_hw_ahb_clock;
+		goto err_disable_bse_hw_clock;
 
 	return 0;
 
+err_disable_bse_hw_clock:
+	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
 err_disable_hw_ahb_clock:
 	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
 err_disable_hw_clock:

-- 
2.43.0

