Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907AF355F5C
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909469; cv=none; b=o/Etc/5v+ts2OOVYkMOjkmgmgClqF6wAFxJvizPaQwLaiebQIZcev8RomJXcPR7wE+cH+FC9c0YvmPlIlpXN6w3nkRx89k0UOX+nIc7GZ8uAU6oSrKvwThEl1dO8UyeTMpYbZddYAQTvIcNo6FYWGTqGlEUInF5cikD/Ac7s178=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909469; c=relaxed/simple;
	bh=DoendjqYMNCpaNDLx5nJc92Y8UtuCTST95sXT4ei12s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r/Ivubbbmp8JYkQywf2nvM8z+MGqSJgvC3SD3fuRUnextg0tPfYYrKFUQwYbANpRouKbhEuipbEl1LH21RO8bC0n1S06ij8YHT9VZXIa0ioSXwaYJ0+0AwdMC+G3ahhGqw66pectJdAW9FYSeAkA0YQ/4fu9PRTO2VMZMSaDRbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvEe87M6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EJpBNkv+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvEe87M6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EJpBNkv+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B403ps3909437
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EacYV252Ylxyrr9FQ/70zKkziBbfMroxAzrIkM+nfi0=; b=lvEe87M6jsa0fiQz
	EevMhv+vCjFZzcBpxS3nTLtWlAuloiN5msMh/997rSEatRWHi/pXInJFWz91F6vk
	nS93IpmnyUM+dnagzOc96LAGLqxKjukSRZwiZ8LDE5In6Vy20v26RDQFcvuPYV9L
	sojz9J7FJTit2DxkU50Br1DNriG1MpoEJdb3E3y67nroorq6WD8PujV4inA2AiSM
	N4zLggm1lHtXu4T50gZt3hLz9HfPao9gvvTMhBKWK68oRCGLJt2qb/xdz0Mbrmll
	6PiCm7CYNexqtlOhgkaMP7lvN8a9lV/dygGiYgX8MDeCA0rUOboNal0NHkXadNJC
	6mswyg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfew00nbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:11:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8d57516c889so263506885a.2
        for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 05:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775909466; x=1776514266; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EacYV252Ylxyrr9FQ/70zKkziBbfMroxAzrIkM+nfi0=;
        b=EJpBNkv+Nn0Fm8mU2UTsKtUzZMcKaIKBqGZ1WIKOvObXOhJHAluMayw8gsGAENzxMN
         VQdAdBa/9yicLMFQSAx1fqBfSOuzwS8IqhluqaAHc5u78g6BxJfWL/REkI1jHude9DQ6
         ugnfqKFG/t23tfBbWa4wxR74gd3Hi5qwpVbuRI+r/JNi3qCAPERo3uPBw7BXqOKgn1Y+
         6z9fTAgKgJXEckkJS9lHw+E/x3c+cmBxf6pyfojBsIm4FjqWjS7+VyNTQ8DlWUXyycZx
         J4Iovw+pIiblOOOT6/Snxqmr3PZ6NB40c3Rr41AuIMvgQBm3woVOGkTIglv6Qg5u8w71
         MvuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909466; x=1776514266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EacYV252Ylxyrr9FQ/70zKkziBbfMroxAzrIkM+nfi0=;
        b=sv/KAbx3VxNEyBeykyIrz+I5HwRHmfQMnVnprI/xEscUNyKLc+GaITQwo4Y6nah/oI
         Wh9mN9bvKvXEVaIdXKtqkvjdJ6+1qlpMDaKsKr8T8Z7O9RnkipzaYhDlrkLcaUqdepP8
         ZfF/rsd6RTjoSCCNYIJl1Xk4lM4asz2Yk6W+BBNzY9cSGZIs1ldKfsTw1lEYnH1MwBJT
         WPQPuELl+yL+bw9+xVNyx4ItIGvC342tpEgtAGQzwVNJVaunj5P81ZQpNChreRCisEfj
         BxcsV5qibareosv+RH2ugpQNomDOgRuEM0vq5aYRTdEgoIum9cUGeygkhk4Rf4oYwVpc
         nyTw==
X-Forwarded-Encrypted: i=1; AJvYcCVL+QeWsLdLUJfufR5bx2gc1Y04FzPQaqC1+ZVshANevg/5YpabUDxQpp24Q8SPDguzWP4jr34mC/UM@vger.kernel.org
X-Gm-Message-State: AOJu0YyMldQO+O8omYQPnjI+W8bKd4JQBYrbovWYs/HLjCFMfOaVuZx1
	uVYNyMzNgVwU8sU+jU6Jg2DkPyYNetzSAaCPuC7CCrHwRRBXgumAKG0H5+refxTuMGzAWrBM91S
	/JvlwIR0VDz6SQY4ocaOyyNXYhM1EpvVRznycoPsEoTBnPjivIqA2Xp9bvPu4nM00
X-Gm-Gg: AeBDiesNoQfeuPcCNf18IM70fQd5Adrz+8tj423peHmXlReBGtGZH2/EoLjXixSrH++
	zrOVhgP3kK7tNSRQjUGpi8idDteH98ewmDm5CdqFd+Va0KhmXIz2A6/VkiEsNH0qKojbvluIaTx
	SLKHwL/ne0Ttv+sgtGCLOI9B9sQUn/2SPS+HEyyKcgFRBjWwygmEIIudvijGRvxAom2jYP+6h7t
	4Cj22HTLjnmz1iq5xe4PNUyl2VSVXjjzzdukZio55cP+ZA39RNqVUpKNCvSBgDs0ls0FPscVXJq
	78f6+ewuz+7PfYw9wA2tvBMHlwQHQ4E6bqvitOYGmzZoq81vU1/zBIeDuvgTWf4TPdYBbIqNKxS
	aU9ZtDycC/lMYg+Kkl6rA56EL0vpTVUa2zctYq25in0qyETmyQmNqypmqg/5RcN0I6wMA9HWMwi
	3lmdF7f2ldv3YFwgOkRKFAWqHH/9R4zBXNgj8=
X-Received: by 2002:a05:622a:1189:b0:50d:7504:b719 with SMTP id d75a77b69052e-50dd5bd1ef1mr100580451cf.52.1775909465970;
        Sat, 11 Apr 2026 05:11:05 -0700 (PDT)
X-Received: by 2002:a05:622a:1189:b0:50d:7504:b719 with SMTP id d75a77b69052e-50dd5bd1ef1mr100579891cf.52.1775909465528;
        Sat, 11 Apr 2026 05:11:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm11906291fa.41.2026.04.11.05.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:11:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 15:10:28 +0300
Subject: [PATCH v2 08/21] drm/panel: himax-hx8394: set prepare_prev_first
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-waveshare-dsi-touch-v2-8-75cdbeac5156@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DoendjqYMNCpaNDLx5nJc92Y8UtuCTST95sXT4ei12s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp2jpFW0vQ244JNcxKBxL5K1n8VoGz1ZRi3WrEQ
 5MkXyOolKCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCado6RQAKCRCLPIo+Aiko
 1VKVB/4ix4mqEZIje288JrijjZjm+C+aALrGxc+Zgv/a4M8FE9MuOwcE/LLV2qNiMBQ2DBwcTM3
 Cv5q7Rbyi8yCqXWubKIsKGFzkrxWqqubVpIIRco4W2E7MrAOfqaBH8USgRdOSmYqJYx9gHqGANo
 FPZE8gnLR9Ytjnn12c0Rn4nsxOe3ksg4j3jwtBK4lpJSd9Ki+j7H8FqXQMzr6dVMP3ffuy/hOjB
 mlbQ9jyDfbJslkpyXU542botlevdq0Hxe73OcmwOgEYbdJLcj3wp9knZBh+l57zyfAcSwEPkdOU
 f7iBc+j3jB6DPyIMi0pEMOi7EQbPvpCRmoLJym+b4JBdYJN6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEwMiBTYWx0ZWRfX43vX8LUnd43j
 zxu4VETrq/UNUGzWearwUyH0w0pMXOuBQdYKddbFEwTUO+Iro94ve6mD5FFgg/k2e5ewlMjsl6w
 B9f5Bhx+Ulpv6/L+6HhrfgVYQBgaU2WfEILOpejLwwb+ahFtuYUMqQRLOPvN9svIrca/E7WTDi7
 iPy1H63SgXaFoL5DyqeYZrc+QyOUnTZnp9U57OYyfDu38i5HW/CrI4tHuazqDXzqRT7kIHMn03c
 7SP4JF3BJRyF2H5s2ZXcccEeGBrW20o3PHKSb3IL/LRojlLaJ8J5QA9Kmthu+IqNMJHgxSKuvWA
 K/GVN9aBiRKlQR/OpjVs6mZsM6P3AReP4+1gEQCx5aqS2NoMyNDEIlozJtStTmZ8zn1V2Tb9Pqd
 7uuXEQM95Yls3SluRlFb6uIHaFegxkKVyYtIHE89dJlCEIRg/6emyQb3RpPvCApaUzFBFBgaTIL
 COhu7+eT7ylvCLu7HGg==
X-Proofpoint-GUID: 7HS1R1cdbLprmmB1_VkRPKiBPBOC9w5J
X-Authority-Analysis: v=2.4 cv=AofeGu9P c=1 sm=1 tr=0 ts=69da3a5a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=ic6V0yA_i5s2A4o5CdYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 7HS1R1cdbLprmmB1_VkRPKiBPBOC9w5J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110102

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

