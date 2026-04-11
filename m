Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C81E35B64A
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909488; cv=none; b=GahID97QChm0HauweL35h4SLF0rhTqjWBGgivCG8DhfgUCuSQ5LSEY3s15IFQQR5oNE/Yq96Qn00SjdqVjK+o4hRsWje+B8LD81EiPM1fPrS2J2GpxlcTCRwOcFjgOKLxE7nbpCgmu5CJG6uCrj2otgqKAt6W1sNLzki8CDV4BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909488; c=relaxed/simple;
	bh=GeCr1NynOzRyMTA3YNx3AI6OZgpUDXwfoJ9GX7n6oNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ti9KbV6+Z5wlq+xzHqIqbgkpckgJANtpZt1fpHvUOjG0njiX/n/RvbV4/2XTHx0Xgy4TATnnGt+oeRqmWtaQQaRM381ToDOiGBEJfd1ZT6jIW8m13xVcqVRpDDBV7uiVgBWTP549AdhlVwymoTbZPQDF/bCUcCa/CCE77eBhSSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FdzcflcA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dinwBGcB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FdzcflcA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dinwBGcB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B7vWJP3337683
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:11:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nZzwGnW+MUE+QNALit7cwinZB2Bkr8D00pSmlzKzjwY=; b=FdzcflcApesnwK1v
	7fvg1OxjaS3loM1FylEKbFCCUZpf/0Jv1nfd8Mlba3sU5LUwhxu9gqlOn4bwMTNU
	TTK9UtIhJYhVnVE2BjPPvYBiPMgEu78fAmmEH77O1m7m7RLxr7TlZyXtwmvsY+Ye
	cv1kEp5XV41sPedOYpfp1p6/+/CyGRwDa/gHbouyMAxNlrtL8rN9My5k3B88EgTa
	xFnwQZf4XSs+3KRD7HV3sTyPD39LiskheTBqQYljGEaE0icqwUR+4A49dC2W1GAp
	VCualyXR0Cw+tXr75OS5SdhH8NPX3X1l2/qncwJrEjNM3tLahyr+Eyg1Ce+C4Ny3
	WBMP5A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfjbp8a79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:11:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b44f7b7bbso74322071cf.3
        for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 05:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775909485; x=1776514285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nZzwGnW+MUE+QNALit7cwinZB2Bkr8D00pSmlzKzjwY=;
        b=dinwBGcBkfv/nk0wIE+Pk4VIBWZVtfdVtlZKWPWm9it0Jj4Tdyu5WAX4nxOpGZXUef
         QKHDN+9KylfQ2SVZtKIDawCOVcrl+OFk3z2ZxwE3JfYan5hGgpY94Lb22pOVHXj/3cf9
         i7H35Q3+NLT1a+53xx6ADNcc1opPeglJKpkS3c2y0bSQGXJlKHEVvw98JdG9nHSx8OBe
         DUAuepGsaV+xvxCbgvpwUxvbqJ0kRV1QijnF2ou3lVpU2h22EX8Q+qh2pfMXtdtH1Qnx
         3Jrm94KZtV9K+IaWGMHv0Vsy0zP8GZTZbcmDfedgsATY9CbV7OvGN9VW2ST1uJH6Pgz3
         HCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909485; x=1776514285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nZzwGnW+MUE+QNALit7cwinZB2Bkr8D00pSmlzKzjwY=;
        b=KraspUtMyQM6BZUp54Jz1ljgRswAALH+qaiVW9PfDfeyoddTKgIcrLePcHDhMLfm73
         fpuyV7+GgIU9nHuAtCXEPitZeLonyvIOowGX/6QScaMoWkmL8FAIkVzC01vm+1IKyp4W
         HPXLiC7SHndHddR7ze2fD7eWMXHv9rvF+zbtspH0Cq4HVaSDwh6mnj02cJZvs12PF0TI
         ajBF4qYHPRaLQLWxKss/vhuKEoTGA10LzT6HkYqp9aFnhCMMY1qrArkLhSNxdLRx+gm5
         1HLsp4PdOXjk3h2jOQv2js1FWgHkEwXqa+eHg5B1juO8kmX5pJE9k6SzqL/c47fN9Jq+
         Mitw==
X-Forwarded-Encrypted: i=1; AJvYcCU3luAsDOYdSWTTBgOV1E5hAMjjgrDFkHEsZCa+dBgBZjruzk1lPEhcHJy9abfMNGRfAJZafbpg5DaY@vger.kernel.org
X-Gm-Message-State: AOJu0YyE/i8w4dLjqbVuqC7nMYRo9VY9mH/n8D7ZS48nIQTmb5coUGE1
	Vhl2HlRThwsja3DBNVynmzSsjoYWkOet0+oip8WnWXcwLckX0tpDoO1qSosWlhDhYp8Fs1K3kP7
	+4yKL9l8cEmCDyF0YzKHeyvjV1PR8YjVqYrzSFllEY+M070G0Uft7eNqZ2NHKOkRU
X-Gm-Gg: AeBDievWMhyEZy7tgqhMQCPeX5scQb+EClu/npGsgFO7mw30BGpOSQn8AzyPtJ7DI/V
	ff8kAZdzWpadJWRlDCNABYZC/KWmeB2yyM9Q2UaB9zQuH93NNTykKmguLJod1QssLM5sE7V75bb
	Afe0C/gevr5lTrcdSY2t9sxKVXpMTFF658V15bq5+alv8pXNLInISYeZojDzIi67JlzSZDMq0mW
	S2t9eIaKpfdfl7CMfDHcRQpPlolus4hElQWBj9QvH8fYWmWJuo1J703BrtHEHQ0jxTFHDF/INfG
	2ABXh0PXqe3cPKCkO9ukoptfK4Ij/zmYUlS2Eq6Gcm8qYhu8AigJP9nwwKwJkTXUcTiaZkZWhjf
	krsdcWTLzERZhXbRp3YDs4CrFQ6ULEEkXBpmjoD8JqqSiwLI7ThdsSZSspbICYpNkwL0PZmbX1G
	quprBfTkVJRCWNKstRDlmTukxdIvPgc5qwoio=
X-Received: by 2002:a05:622a:588b:b0:50d:a602:1255 with SMTP id d75a77b69052e-50dd5be78ecmr92161971cf.50.1775909485155;
        Sat, 11 Apr 2026 05:11:25 -0700 (PDT)
X-Received: by 2002:a05:622a:588b:b0:50d:a602:1255 with SMTP id d75a77b69052e-50dd5be78ecmr92161441cf.50.1775909484633;
        Sat, 11 Apr 2026 05:11:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm11906291fa.41.2026.04.11.05.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:11:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 15:10:37 +0300
Subject: [PATCH v2 17/21] drm/panel: ilitek-ili9881c: support Waveshare
 7.0" DSI panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-waveshare-dsi-touch-v2-17-75cdbeac5156@oss.qualcomm.com>
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
In-Reply-To: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=11997;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=GeCr1NynOzRyMTA3YNx3AI6OZgpUDXwfoJ9GX7n6oNY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp2jpHfG5oWWlmIUR1KAJYmQXCxY+dELdAPF73Z
 Bi3h9UpPWOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCado6RwAKCRCLPIo+Aiko
 1QjyB/9n2LxW+xRG5ZajKwSC8A764JloAVVmN6iYfqMWHFngF6/SsTeoZWBxGIwKp+ntF9iV+wQ
 a9aqvkLc337NAj9xOOtbaK7TnntOKu9X0KaP7ed9DN8mM4UU4uFGeFkcsmEVDZfGIUIOLjGoVb8
 ox6JNdhRO/WcOoaZDgPJA1qiD1PGMX4N2AH8w0edrz/Ou0So26tiuq5BEagetWkFflC5b6lUZeb
 iJWqfkrbDREBN54SJfTa+Dh1FznfYLqWkmi9NpmOap994WdUpbiv8BLy+HyWxQQDkIl9QCUCyIX
 QfyHLieKdP47nUHP339osH1EOf57C+D+fjy/k4l6fnVxclww
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=PuijqQM3 c=1 sm=1 tr=0 ts=69da3a6e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Vzx2zukWpxHvXuQtFQgA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 3_r8GJw7INPGf03mDycXjycbDyiVctuz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEwMiBTYWx0ZWRfXxEw8d5a8QcCi
 CEya1DaTrNquax9/+vSBCKuShQIG49W8m6RrYH0oU/p8St+iD5xoNMUxZUa/w3LhWbbhJ+L/RL0
 RpUrENAkMdrPFIFFVo0ROKunQ6GjNeD7rGPbiAVkppQ5yYQ3O0JwhHU75GvTv6UW9xLgU/J2mkd
 x12ZWM7113sZ8vccGyiwvm1RXiDBEmfyvIiHPfuMWmVhhqByPge5pVvJUG9+XTjrHyT7pDSdJOD
 bDVms2rc0FEcYzWxEf6nZsSikopNVxAvOIEW7Y59zoanXM+C0cyeVPyc58hUr98WI6ltrWIeC8q
 /1TcFkFbAUod/9c7K5lh+c8BLfYi1es2K05flqL2pNCuaCceAQWpI+0XTc9y7LIx5YLK/5Ol1HG
 muXfEu7+K6bGIf7hgasWXzfPGP7FXwOlRYRNqssd85+a6hE+3lFRLbUPaJzKGeC6Kj6WN0aR2Ud
 bOSfYrDiiGSWEL/C27Q==
X-Proofpoint-GUID: 3_r8GJw7INPGf03mDycXjycbDyiVctuz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110102

Enable support for Waveshare 7.0" DSI TOUCH-A panel. It requires
additional voltage regulator, iovcc.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 251 +++++++++++++++++++++++++-
 1 file changed, 249 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index 947b47841b01..0652cdb57d11 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -52,6 +52,7 @@ struct ili9881c {
 	const struct ili9881c_desc	*desc;
 
 	struct regulator	*power;
+	struct regulator	*iovcc;
 	struct gpio_desc	*reset;
 
 	enum drm_panel_orientation	orientation;
@@ -1997,6 +1998,205 @@ static const struct ili9881c_instr bsd1218_a101kl68_init[] = {
 	ILI9881C_COMMAND_INSTR(0xd3, 0x3f),
 };
 
+static const struct ili9881c_instr waveshare_7inch_a_init[] = {
+	ILI9881C_SWITCH_PAGE_INSTR(3),
+	ILI9881C_COMMAND_INSTR(0x01, 0x00),
+	ILI9881C_COMMAND_INSTR(0x02, 0x00),
+	ILI9881C_COMMAND_INSTR(0x03, 0x73),
+	ILI9881C_COMMAND_INSTR(0x04, 0x00),
+	ILI9881C_COMMAND_INSTR(0x05, 0x00),
+	ILI9881C_COMMAND_INSTR(0x06, 0x0a),
+	ILI9881C_COMMAND_INSTR(0x07, 0x00),
+	ILI9881C_COMMAND_INSTR(0x08, 0x00),
+	ILI9881C_COMMAND_INSTR(0x09, 0x61),
+	ILI9881C_COMMAND_INSTR(0x0a, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0b, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0c, 0x01),
+	ILI9881C_COMMAND_INSTR(0x0d, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0e, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0f, 0x61),
+	ILI9881C_COMMAND_INSTR(0x10, 0x61),
+	ILI9881C_COMMAND_INSTR(0x11, 0x00),
+	ILI9881C_COMMAND_INSTR(0x12, 0x00),
+	ILI9881C_COMMAND_INSTR(0x13, 0x00),
+	ILI9881C_COMMAND_INSTR(0x14, 0x00),
+	ILI9881C_COMMAND_INSTR(0x15, 0x00),
+	ILI9881C_COMMAND_INSTR(0x16, 0x00),
+	ILI9881C_COMMAND_INSTR(0x17, 0x00),
+	ILI9881C_COMMAND_INSTR(0x18, 0x00),
+	ILI9881C_COMMAND_INSTR(0x19, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1a, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1b, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1c, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1d, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1e, 0x40),
+	ILI9881C_COMMAND_INSTR(0x1f, 0x80),
+	ILI9881C_COMMAND_INSTR(0x20, 0x06),
+	ILI9881C_COMMAND_INSTR(0x21, 0x01),
+	ILI9881C_COMMAND_INSTR(0x22, 0x00),
+	ILI9881C_COMMAND_INSTR(0x23, 0x00),
+	ILI9881C_COMMAND_INSTR(0x24, 0x00),
+	ILI9881C_COMMAND_INSTR(0x25, 0x00),
+	ILI9881C_COMMAND_INSTR(0x26, 0x00),
+	ILI9881C_COMMAND_INSTR(0x27, 0x00),
+	ILI9881C_COMMAND_INSTR(0x28, 0x33),
+	ILI9881C_COMMAND_INSTR(0x29, 0x03),
+	ILI9881C_COMMAND_INSTR(0x2a, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2b, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2c, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2d, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2e, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2f, 0x00),
+	ILI9881C_COMMAND_INSTR(0x30, 0x00),
+	ILI9881C_COMMAND_INSTR(0x31, 0x00),
+	ILI9881C_COMMAND_INSTR(0x32, 0x00),
+	ILI9881C_COMMAND_INSTR(0x33, 0x00),
+	ILI9881C_COMMAND_INSTR(0x34, 0x04),
+	ILI9881C_COMMAND_INSTR(0x35, 0x00),
+	ILI9881C_COMMAND_INSTR(0x36, 0x00),
+	ILI9881C_COMMAND_INSTR(0x37, 0x00),
+	ILI9881C_COMMAND_INSTR(0x38, 0x3c),
+	ILI9881C_COMMAND_INSTR(0x39, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3a, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3b, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3c, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3d, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3e, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3f, 0x00),
+	ILI9881C_COMMAND_INSTR(0x40, 0x00),
+	ILI9881C_COMMAND_INSTR(0x41, 0x00),
+	ILI9881C_COMMAND_INSTR(0x42, 0x00),
+	ILI9881C_COMMAND_INSTR(0x43, 0x00),
+	ILI9881C_COMMAND_INSTR(0x44, 0x00),
+	ILI9881C_COMMAND_INSTR(0x50, 0x10),
+	ILI9881C_COMMAND_INSTR(0x51, 0x32),
+	ILI9881C_COMMAND_INSTR(0x52, 0x54),
+	ILI9881C_COMMAND_INSTR(0x53, 0x76),
+	ILI9881C_COMMAND_INSTR(0x54, 0x98),
+	ILI9881C_COMMAND_INSTR(0x55, 0xba),
+	ILI9881C_COMMAND_INSTR(0x56, 0x10),
+	ILI9881C_COMMAND_INSTR(0x57, 0x32),
+	ILI9881C_COMMAND_INSTR(0x58, 0x54),
+	ILI9881C_COMMAND_INSTR(0x59, 0x76),
+	ILI9881C_COMMAND_INSTR(0x5a, 0x98),
+	ILI9881C_COMMAND_INSTR(0x5b, 0xba),
+	ILI9881C_COMMAND_INSTR(0x5c, 0xdc),
+	ILI9881C_COMMAND_INSTR(0x5d, 0xfe),
+	ILI9881C_COMMAND_INSTR(0x5e, 0x00),
+	ILI9881C_COMMAND_INSTR(0x5f, 0x0e),
+	ILI9881C_COMMAND_INSTR(0x60, 0x0f),
+	ILI9881C_COMMAND_INSTR(0x61, 0x0c),
+	ILI9881C_COMMAND_INSTR(0x62, 0x0d),
+	ILI9881C_COMMAND_INSTR(0x63, 0x06),
+	ILI9881C_COMMAND_INSTR(0x64, 0x07),
+	ILI9881C_COMMAND_INSTR(0x65, 0x02),
+	ILI9881C_COMMAND_INSTR(0x66, 0x02),
+	ILI9881C_COMMAND_INSTR(0x67, 0x02),
+	ILI9881C_COMMAND_INSTR(0x68, 0x02),
+	ILI9881C_COMMAND_INSTR(0x69, 0x01),
+	ILI9881C_COMMAND_INSTR(0x6a, 0x00),
+	ILI9881C_COMMAND_INSTR(0x6b, 0x02),
+	ILI9881C_COMMAND_INSTR(0x6c, 0x15),
+	ILI9881C_COMMAND_INSTR(0x6d, 0x14),
+	ILI9881C_COMMAND_INSTR(0x6e, 0x02),
+	ILI9881C_COMMAND_INSTR(0x6f, 0x02),
+	ILI9881C_COMMAND_INSTR(0x70, 0x02),
+	ILI9881C_COMMAND_INSTR(0x71, 0x02),
+	ILI9881C_COMMAND_INSTR(0x72, 0x02),
+	ILI9881C_COMMAND_INSTR(0x73, 0x02),
+	ILI9881C_COMMAND_INSTR(0x74, 0x02),
+	ILI9881C_COMMAND_INSTR(0x75, 0x0e),
+	ILI9881C_COMMAND_INSTR(0x76, 0x0f),
+	ILI9881C_COMMAND_INSTR(0x77, 0x0c),
+	ILI9881C_COMMAND_INSTR(0x78, 0x0d),
+	ILI9881C_COMMAND_INSTR(0x79, 0x06),
+	ILI9881C_COMMAND_INSTR(0x7a, 0x07),
+	ILI9881C_COMMAND_INSTR(0x7b, 0x02),
+	ILI9881C_COMMAND_INSTR(0x7c, 0x02),
+	ILI9881C_COMMAND_INSTR(0x7d, 0x02),
+	ILI9881C_COMMAND_INSTR(0x7e, 0x02),
+	ILI9881C_COMMAND_INSTR(0x7f, 0x01),
+	ILI9881C_COMMAND_INSTR(0x80, 0x00),
+	ILI9881C_COMMAND_INSTR(0x81, 0x02),
+	ILI9881C_COMMAND_INSTR(0x82, 0x14),
+	ILI9881C_COMMAND_INSTR(0x83, 0x15),
+	ILI9881C_COMMAND_INSTR(0x84, 0x02),
+	ILI9881C_COMMAND_INSTR(0x85, 0x02),
+	ILI9881C_COMMAND_INSTR(0x86, 0x02),
+	ILI9881C_COMMAND_INSTR(0x87, 0x02),
+	ILI9881C_COMMAND_INSTR(0x88, 0x02),
+	ILI9881C_COMMAND_INSTR(0x89, 0x02),
+	ILI9881C_COMMAND_INSTR(0x8a, 0x02),
+
+	ILI9881C_SWITCH_PAGE_INSTR(4),
+	ILI9881C_COMMAND_INSTR(0x38, 0x01),
+	ILI9881C_COMMAND_INSTR(0x39, 0x00),
+	ILI9881C_COMMAND_INSTR(0x6c, 0x15),
+	ILI9881C_COMMAND_INSTR(0x6e, 0x2a),
+	ILI9881C_COMMAND_INSTR(0x6f, 0x33),
+	ILI9881C_COMMAND_INSTR(0x3a, 0x94),
+	ILI9881C_COMMAND_INSTR(0x8d, 0x14),
+	ILI9881C_COMMAND_INSTR(0x87, 0xba),
+	ILI9881C_COMMAND_INSTR(0x26, 0x76),
+	ILI9881C_COMMAND_INSTR(0xb2, 0xd1),
+	ILI9881C_COMMAND_INSTR(0xb5, 0x06),
+	ILI9881C_COMMAND_INSTR(0x3b, 0x98),
+
+	ILI9881C_SWITCH_PAGE_INSTR(1),
+	ILI9881C_COMMAND_INSTR(0x22, 0x0a),
+	ILI9881C_COMMAND_INSTR(0x31, 0x00),
+	ILI9881C_COMMAND_INSTR(0x53, 0x71),
+	ILI9881C_COMMAND_INSTR(0x55, 0x8f),
+	ILI9881C_COMMAND_INSTR(0x40, 0x33),
+	ILI9881C_COMMAND_INSTR(0x50, 0x96),
+	ILI9881C_COMMAND_INSTR(0x51, 0x96),
+	ILI9881C_COMMAND_INSTR(0x60, 0x23),
+	ILI9881C_COMMAND_INSTR(0xa0, 0x08),
+	ILI9881C_COMMAND_INSTR(0xa1, 0x1d),
+	ILI9881C_COMMAND_INSTR(0xa2, 0x2a),
+	ILI9881C_COMMAND_INSTR(0xa3, 0x10),
+	ILI9881C_COMMAND_INSTR(0xa4, 0x15),
+	ILI9881C_COMMAND_INSTR(0xa5, 0x28),
+	ILI9881C_COMMAND_INSTR(0xa6, 0x1c),
+	ILI9881C_COMMAND_INSTR(0xa7, 0x1d),
+	ILI9881C_COMMAND_INSTR(0xa8, 0x7e),
+	ILI9881C_COMMAND_INSTR(0xa9, 0x1d),
+	ILI9881C_COMMAND_INSTR(0xaa, 0x29),
+	ILI9881C_COMMAND_INSTR(0xab, 0x6b),
+	ILI9881C_COMMAND_INSTR(0xac, 0x1a),
+	ILI9881C_COMMAND_INSTR(0xad, 0x18),
+	ILI9881C_COMMAND_INSTR(0xae, 0x4b),
+	ILI9881C_COMMAND_INSTR(0xaf, 0x20),
+	ILI9881C_COMMAND_INSTR(0xb0, 0x27),
+	ILI9881C_COMMAND_INSTR(0xb1, 0x50),
+	ILI9881C_COMMAND_INSTR(0xb2, 0x64),
+	ILI9881C_COMMAND_INSTR(0xb3, 0x39),
+	ILI9881C_COMMAND_INSTR(0xc0, 0x08),
+	ILI9881C_COMMAND_INSTR(0xc1, 0x1d),
+	ILI9881C_COMMAND_INSTR(0xc2, 0x2a),
+	ILI9881C_COMMAND_INSTR(0xc3, 0x10),
+	ILI9881C_COMMAND_INSTR(0xc4, 0x15),
+	ILI9881C_COMMAND_INSTR(0xc5, 0x28),
+	ILI9881C_COMMAND_INSTR(0xc6, 0x1c),
+	ILI9881C_COMMAND_INSTR(0xc7, 0x1d),
+	ILI9881C_COMMAND_INSTR(0xc8, 0x7e),
+	ILI9881C_COMMAND_INSTR(0xc9, 0x1d),
+	ILI9881C_COMMAND_INSTR(0xca, 0x29),
+	ILI9881C_COMMAND_INSTR(0xcb, 0x6b),
+	ILI9881C_COMMAND_INSTR(0xcc, 0x1a),
+	ILI9881C_COMMAND_INSTR(0xcd, 0x18),
+	ILI9881C_COMMAND_INSTR(0xce, 0x4b),
+	ILI9881C_COMMAND_INSTR(0xcf, 0x20),
+	ILI9881C_COMMAND_INSTR(0xd0, 0x27),
+	ILI9881C_COMMAND_INSTR(0xd1, 0x50),
+	ILI9881C_COMMAND_INSTR(0xd2, 0x64),
+	ILI9881C_COMMAND_INSTR(0xd3, 0x39),
+
+	ILI9881C_SWITCH_PAGE_INSTR(0),
+	ILI9881C_COMMAND_INSTR(0x3a, 0x77),
+	ILI9881C_COMMAND_INSTR(0x36, 0x00),
+};
+
 static inline struct ili9881c *panel_to_ili9881c(struct drm_panel *panel)
 {
 	return container_of(panel, struct ili9881c, panel);
@@ -2035,9 +2235,19 @@ static int ili9881c_prepare(struct drm_panel *panel)
 	int ret;
 
 	/* Power the panel */
+	if (ctx->iovcc) {
+		ret = regulator_enable(ctx->iovcc);
+		if (ret)
+			return ret;
+	}
+
+	msleep(5);
 	ret = regulator_enable(ctx->power);
-	if (ret)
-		return ret;
+	if (ret) {
+		mctx.accum_err = ret;
+		goto disable_iovcc;
+	}
+
 	msleep(5);
 
 	/* And reset it */
@@ -2074,6 +2284,9 @@ static int ili9881c_prepare(struct drm_panel *panel)
 
 disable_power:
 	regulator_disable(ctx->power);
+disable_iovcc:
+	if (ctx->iovcc)
+		regulator_disable(ctx->iovcc);
 	return mctx.accum_err;
 }
 
@@ -2085,6 +2298,8 @@ static int ili9881c_unprepare(struct drm_panel *panel)
 	mipi_dsi_dcs_set_display_off_multi(&mctx);
 	mipi_dsi_dcs_enter_sleep_mode_multi(&mctx);
 	regulator_disable(ctx->power);
+	if (ctx->iovcc)
+		regulator_disable(ctx->iovcc);
 	gpiod_set_value_cansleep(ctx->reset, 1);
 
 	return 0;
@@ -2260,6 +2475,23 @@ static const struct drm_display_mode bsd1218_a101kl68_default_mode = {
 	.height_mm	= 170,
 };
 
+static const struct drm_display_mode waveshare_7inch_a_mode = {
+	.clock		= 83333,
+
+	.hdisplay	= 720,
+	.hsync_start	= 720 + 120,
+	.hsync_end	= 720 + 120 + 100,
+	.htotal		= 720 + 120 + 100 + 100,
+
+	.vdisplay	= 1280,
+	.vsync_start	= 1280 + 10,
+	.vsync_end	= 1280 + 10 + 10,
+	.vtotal		= 1280 + 10 + 10 + 10,
+
+	.width_mm	= 85,
+	.height_mm	= 154,
+};
+
 static int ili9881c_get_modes(struct drm_panel *panel,
 			      struct drm_connector *connector)
 {
@@ -2329,6 +2561,11 @@ static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
 		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->power),
 				     "Couldn't get our power regulator\n");
 
+	ctx->iovcc = devm_regulator_get_optional(&dsi->dev, "iovcc");
+	if (IS_ERR(ctx->iovcc))
+		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->iovcc),
+				     "Couldn't get our iovcc regulator\n");
+
 	ctx->reset = devm_gpiod_get_optional(&dsi->dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->reset))
 		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->reset),
@@ -2454,6 +2691,15 @@ static const struct ili9881c_desc bsd1218_a101kl68_desc = {
 	.lanes = 4,
 };
 
+static const struct ili9881c_desc waveshare_7inch_a_desc = {
+	.init = waveshare_7inch_a_init,
+	.init_length = ARRAY_SIZE(waveshare_7inch_a_init),
+	.mode = &waveshare_7inch_a_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_HSE |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	.lanes = 2,
+};
+
 static const struct of_device_id ili9881c_of_match[] = {
 	{ .compatible = "bananapi,lhr050h41", .data = &lhr050h41_desc },
 	{ .compatible = "bestar,bsd1218-a101kl68", .data = &bsd1218_a101kl68_desc },
@@ -2462,6 +2708,7 @@ static const struct of_device_id ili9881c_of_match[] = {
 	{ .compatible = "tdo,tl050hdv35", .data = &tl050hdv35_desc },
 	{ .compatible = "wanchanglong,w552946aaa", .data = &w552946aaa_desc },
 	{ .compatible = "wanchanglong,w552946aba", .data = &w552946aba_desc },
+	{ .compatible = "waveshare,7.0-dsi-touch-a", .data = &waveshare_7inch_a_desc },
 	{ .compatible = "ampire,am8001280g", .data = &am8001280g_desc },
 	{ .compatible = "raspberrypi,dsi-5inch", &rpi_5inch_desc },
 	{ .compatible = "raspberrypi,dsi-7inch", &rpi_7inch_desc },

-- 
2.47.3

