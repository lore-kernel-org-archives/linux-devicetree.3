Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76F63D566E
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089156; cv=none; b=VkM76JUyUSA8ZmGelIW4EH13L46fYV14Jbs95FwublOPx+dyxyfgJ+l8CL47afeyRY+EEXgD0mik34+59QOK1kPYmcCI2iChT5H+Aqb+8h1BDKgHJQ9aYsdKd/TM1so+h/hAqby/oLX5h8rr7EKhqoIR1W8iywyVf64fyKtqzQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089156; c=relaxed/simple;
	bh=DoendjqYMNCpaNDLx5nJc92Y8UtuCTST95sXT4ei12s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JTa62IQIHn+8rbQGtjej/8WfqDWoD56yJGw8hkLsAUYbDEmYb5lLqnjQQg/+S6ECec3OV45ebELNLc+jXsm+uCnG43f5TMy2OMi7O4FXg96aBohndn+K990hx5DlFuFb/8wwkpHDi5BMWXAr3vI9UKfKFKWr43cxMkauFEZgiu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YYFzsybg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J6cd32L4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YYFzsybg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J6cd32L4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DDm3A8481517
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EacYV252Ylxyrr9FQ/70zKkziBbfMroxAzrIkM+nfi0=; b=YYFzsybgKNPrvJTp
	5QTY6XU6xJbyYcZi2la+y5A/nzC8IurfThkGTG76iSEsCD1i6ef2iVc2Thx9ZQ//
	Ab7eFPy8Io8+/Rwr+Dx3TMTjGssvVjtzok5DnbiyzzmmBX4OYrJXca6bRykELa2L
	LJaxXdJbzta0AEMMRp9fVYYMKPNNMrvl8dq1xTqfz4a7W3FEq2U0HHLs1jPnZGkl
	+rudsyXpPEGx0Q0qlYn+p7WNAlLNv8a+p11d0PaWDlezv4SqeZTnrlxTIo3pK7tg
	qEvRLAj6dXifnS9tLe5AOC9x2t2uoAFI4QGibKpxK75iV/HqdVxZAVyPLDB5TMpW
	240LEA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dguuj9dmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:05:51 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-463a018f61bso3012750b6e.3
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 07:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776089150; x=1776693950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EacYV252Ylxyrr9FQ/70zKkziBbfMroxAzrIkM+nfi0=;
        b=J6cd32L484b7bLV6acc69RVkzIkVRGSnBfiNz4RHgtG92v9Z9/hRmiDIgGdmJcoQND
         CyWIfVodmpKsD9Y/ANsrT4r5O1jQgvcbeLl0XX2cMCX/tP+oDHKlOXiRdijkYUCPGMuz
         busiI32gBjluuRWLvPcDCadgUdFrUiqbsCDew2MDzc9TaefH35/qOImo8iTZ/qRti8la
         hJ7kLimXxNh/eMBuXm4+TPdiB5GEX1bmtRFD8BOUJjD1mp8aKbyhcmshRSRCgjKy9ZBU
         0ucCySWeRnGdtnoCAAX8GbWU4IOcC8keJYush3rW9Sdy/arg/Uo9np1+P6CskHFxhwxn
         +OLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089150; x=1776693950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EacYV252Ylxyrr9FQ/70zKkziBbfMroxAzrIkM+nfi0=;
        b=IX3tS3Cy1fgXoPJd6WEEKjuvl6/p8tOuJBu5LBLzadr8UpQp5RDn1fXlTVKNQbPPET
         nbGCYCeOAKu3NPJo5UxAX1ud6OuBTezZyHs/Am0Ad55IFVeAFF0lrEOX3ykBMYFK4EjQ
         +MwCHPgR86w6+hT05CbqR5qoWi95uwqhR2jCRopYiEmU3behhqSBb43x/Xw2OE5GN73l
         M4Pig1hbicKXvbyMca+a0P3b5BpjVcMtCfjusPJ/iWQqSbZrVMWU+pxjwXJ8LSvFjIvh
         eliAhe2c+NXtxNphvHIRZJoEIVSan/kErc/GVVPdBjo+B0RGbs6fqAG0pKXTc5cwTYfa
         Y+yA==
X-Forwarded-Encrypted: i=1; AFNElJ8q1of+5U2tl9KaziJ7tadSskkItB5uBCSdJ8xgoRYWIoaHy5D/tsWQdIrFHYvgoW9sM1UL9YgKsVqD@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa2gQpJuHP6LyUsI1Gbu1MBv3yJoZ74bW8C5g7tTP1trkhRr0L
	yBK1p3feS2AYmsHKKgBFXp0BodFdETG6AnQPF5RPmX9cj4UWPFNy6paT3cInRwymq2xZdEtqx1d
	/FP3rW1jO46dLHemz4cSkAtPxjIgZ8e6D5LdGyxcoLxIix4evBs6xi4ctZD4+QcZK
X-Gm-Gg: AeBDievTqTmhys6RfQy6ZLSyAElMLAeHe7vXIleHYEE9wttbksYlwKNj6TLkksKzVgF
	+pT2Bc4KBitVXJ7eM/YT6U2rCJF7ybd6nF5pOQG6+RslehzQA9JhvYvS/TQ0tU5TmFQAw6umzZY
	ztTuzPNCXIF3/F1B9IQZP1hVJrf0HYrGNJABu/xkb6dJ3QWJ2w6yx8XIbBi7vKIJ0JynB4ogcAT
	/qF4E7bIFsdsz9GgadVfj+RyNaYzcwvptdIipwGYK8PL2HZeDZoEb8B0QhzNgIIAB1J3l7YMILE
	UPHNCWz7LPL3aJ7AqclB+hr2g5A4shvhj2r/pb9qGVpqDBYswotR1NHpO0qqq5THiZsez4uMDno
	tCGrH1p9ng8l/Zktc9UbygKG7rpH9O9HgT0cFpCmx+8G/cdjA3ru+zI3SfrzF2WzaXhLDUim9N8
	9YZVJqQDMi3bcB1nzQxgXVWa1reToQnKIo2vM=
X-Received: by 2002:a05:6808:4f29:b0:467:fb9b:9818 with SMTP id 5614622812f47-478a0f18fddmr6046753b6e.40.1776089150300;
        Mon, 13 Apr 2026 07:05:50 -0700 (PDT)
X-Received: by 2002:a05:6808:4f29:b0:467:fb9b:9818 with SMTP id 5614622812f47-478a0f18fddmr6046700b6e.40.1776089149735;
        Mon, 13 Apr 2026 07:05:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8c91csm2687521e87.19.2026.04.13.07.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:05:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 17:05:31 +0300
Subject: [PATCH v3 08/21] drm/panel: himax-hx8394: set prepare_prev_first
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-waveshare-dsi-touch-v3-8-3aeb53022c32@oss.qualcomm.com>
References: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com>
In-Reply-To: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DoendjqYMNCpaNDLx5nJc92Y8UtuCTST95sXT4ei12s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp3Pgn18hIWmMRBJH77hbN0nEy2AN7HiG9Wx+pK
 kM48SmCVmmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCadz4JwAKCRCLPIo+Aiko
 1d4PB/43iCoGV/XPHUY+LTdEOriQxtRXRqWo0WE7dOyI1sgHpDIIc5Xb4xOmgDn9sQaqDo7hYnM
 Mu0SIMUpakh6NGnaA+3O4SqgzeZBufPT9R30GGkHmqx2G5UBf9uxemus2YKiTbKuHfwP4KliY5I
 hutN7+y7vsN4vTfDhK5Fwq3fM3vATeevkRefyzcKASTSWuNdfme6f0obHPK4mirZVJT+vFLT03v
 aJsE14N5TLnnRuMxJTUdhsdpvlIDlrfUOB0NYk5B8zUyF8faTHrbMtEMG2rO1mBIFv+uj3frVym
 Y2IZ1jPuAJXj21WzV1dHtNWQsXiCLbHZ/q0Hsw4xsRd/YVOK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEzOCBTYWx0ZWRfX8Vk3yFW0Lqhd
 tdtUssXUp/EJWC63Scr4pwZZbWHAObxlLWq9cff+7Q7lK5+Nds/IdDvrKdJP9cAVzZrzlmqTkrg
 gJ5gGFeDRsHVgxQia0QqMT3iGmMFLY/cjd/uN8qNA0WJrf03U+iKVA30iX2WP0g6qTEgoGy8FE0
 yO3K/CJ9bqKkE5XUie8v4c/vqP7mRvrgucEmMFAfo5Xa4A/FIFWLoj5YQJMhm6Ks/TCKcjmqaNL
 L+WGVn2cWHYwmUgV+MeTefaqO6v4T570GwQvmk2oQjmcikzEShNX04IVdJ0rZVPa+WhPlIeUCGT
 YgHhwiCikrjCfbvdQauPKXiRYCWT8EQuoyAKcq6x50VvAdbQfqGvs2Q2aMmm+jKDxdLxPll8W0i
 a7UXubUSfB7OzGGzIZPs8EoPizDcdwBUjnxn3KWT89QQysIdnzIEDZCpd64sxzXJ+7kcr2Uuf/0
 NHWH+o38v65TtDM0NTA==
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=69dcf83f cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=ic6V0yA_i5s2A4o5CdYA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: fmuCnbaXRCasMxj0LxSztDSDRnAi3aoo
X-Proofpoint-ORIG-GUID: fmuCnbaXRCasMxj0LxSztDSDRnAi3aoo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130138

Sending DSI commands from the prepare() callback requires DSI link to be
up at that point. For DSI hosts is guaranteed only if the panel driver
sets the .prepare_prev_first flag. Set it to let these panels work with
the DSI hosts which don't power on the link in their .mode_set callback.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-himax-hx8394.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
index c4d3e09a228d..d64f3521eb15 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -792,6 +792,8 @@ static int hx8394_probe(struct mipi_dsi_device *dsi)
 	if (ret)
 		return ret;
 
+	ctx->panel.prepare_prev_first = true;
+
 	drm_panel_add(&ctx->panel);
 
 	ret = mipi_dsi_attach(dsi);

-- 
2.47.3

