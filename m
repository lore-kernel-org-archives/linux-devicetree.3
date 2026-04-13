Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BCA22E3F0
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089175; cv=none; b=q47d3jcnaP9nTmcETe/lNmdHA1/sl7tBj22nG0DCxPV9dAPXu+gtPeKReRYCpDwI8Nm8oMHxcm8cCGDdkxef0v6cIfqIkvHH7A3kM+oAXiCWIF2ulliu8G1xlKAqaDKJkm/DodUavPo4u6HdJr72a/Y/nBdiizJacjUJC+fQCEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089175; c=relaxed/simple;
	bh=MIfetJdxtR4RP3QkPd0ovBX9kWXJpuY2wobhSOEc4s4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IeZsXBWy89WkgnowC2vu1/r2Oj1j7tFt2l8FViqhGPEMyzb3TFHj4w8rVpHo8x7R9UmDyIcRW3srS3Xg9JhdgKjsDDWxX2RcSYcQGd9vOi79OpATJwpcyHctneM5hqWeFBCDxt+IBP4LktU0uWfAH10Eo7242Ej3a7tJao8V/rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lR/ZvGYu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QZbJzJwk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lR/ZvGYu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QZbJzJwk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7Z1en602445
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/QeO015RCxdo80CJPmCfEiIyAEYkER9w0zgodL9IPJU=; b=lR/ZvGYu9/q7j3cA
	6ViXL6gYgeFwNTBNq/5Tf22WMIGo2h6bew+mljHW8mDzbkLhzPK0U8T/HFTKw9+q
	AW8Ee0foCRhzsZpa+TkFlXp8j6W1mUUiq789kcg6DnC9WCyzeiH1WL8UXqxM1eLH
	bCfOsfwBH5Xnw1rwyPSy1sw/fxLoO52Hh8XkJHBnaBFQ+ZlR52sdi9/auKLJRytn
	8ZLAqg9oUF+jXXsktRSwtAdTVabLSIHwzEXs6rIlE9b5L1tIJfj+6osGVDvbs6hM
	TlSqZxT5ZJOTz4Oq91XrC0lFaCtBj2KcVs///qTQkkIxPryIp/zF4hq13mTnVMxD
	8faYEA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfffhwjtd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:06:09 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-467ec73eec1so3053595b6e.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 07:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776089168; x=1776693968; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/QeO015RCxdo80CJPmCfEiIyAEYkER9w0zgodL9IPJU=;
        b=QZbJzJwkgHcmIqZRVOIhSbSto4lbvVbUWiCqvz3Wv/zPsAgbiflg43kKoP8dmfT4q+
         5GVhHg4dxPXQ7+wBh/REuMgkLOZJiEaJnuYy93Tc+InAR/o/kQc7T6ei/x59H4XetdGk
         nIOeRyKB/6NQ93UCVQm1IRo6CvIaVHcUVzxNSv3wW80Ipx+yHMjRRuOYx5PcuZZDu7kk
         uKXlpI/zBQ4c15zyJh8eUOt/oHXDuUQ8kxnp4jWjGAht1kiyMAcHAsDF6uqVwvCkG/Jk
         sSBwHq6zqZs7NfwCw1eRO7A4Me54c0wuFDloOkdn1sCkGJdANyPYRXzBCXleNYlyOGe6
         27/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089168; x=1776693968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/QeO015RCxdo80CJPmCfEiIyAEYkER9w0zgodL9IPJU=;
        b=h2vgls8+5vScGYbwiaU3pB+bfWygbM6pvRrXpaiXNU4NnCNHnvhzuGEemYeg8WEF+o
         0aaUasY+ojvIjBA7aVGnzoQLZLfRxPUpjcenPQWdYCEtc+Gr6Su+ZyCqy8Y5dW35Y00+
         oPAV1gI+xZsvwmaOJ7fCz1DKZx0YnJZSDdG3JKKJNUuW5ohOfivt/1WIf6Qrk7SJSHxZ
         m4s15BIpdrurHjtlNMVbEly1YIopKLQhQBOHrQNCWyqQOrfoT11Us0dEfgGnOswLrKhZ
         Ix2zsgfNYPnhcJZ0LQJH8iO8DgV66l/3Wp8A+xCDhME4qgos1BHl6BWHwbdXcuDh0+6Q
         HXOQ==
X-Forwarded-Encrypted: i=1; AFNElJ8d6cn7VvWWiADriGrAdS/3/Ci0hyzMRjYSS6OqS5WyhjXaABGb15oqls6yXYqfIyFAWZOYnqe3GT8K@vger.kernel.org
X-Gm-Message-State: AOJu0YwjPJ8n4ZqyfNiH+DM98W9J5gYXHcHjw6xHUDYJxlrfoJFtPn4d
	bVrCy7N748lSuMj6+IDlmPE2IJMNnTTlYoIMYF6mcaeGj1Lu2uh9bEZB3e4jG37Y5/DZF4BkxNP
	uSecOzBB161RA0vD/JICO1biD043+jfa/GCPUhEhbqZP6UUdH8gB77UYr0001XMW+
X-Gm-Gg: AeBDieuMyMqDbamZ4+1XJDKnEVwmnV0zQsiykJqX7kfRNQkqF3mh4wXGp02koNu6F8Z
	lNvh9YBB3OjdN7oXQ5MZP0MqGXeX79nxSwK/71Jn27ysNGj9Gi3ddPqh9bCQhlpk17GvLAwbRTE
	yMWw8YDl6QvQX3kR2fKud8DdUeBMVPI8rBVk46MNljSbsvXAlPHW/Qogo9xKyGkbdYhmxQsmpHj
	WOexlwN8RUc+43dADS8z9KQeDxq2wJYYKqxLnqmlPj+7U6KnBj+gC7F81S3Cj/ysMyZCiwA0BG8
	qRaPiUFGLz99lHFX3BEKF2TIK1r+sRnt5mJpOS/UWtzmSyGe/U7d+zanufiMXViZ19SDnM+9DHl
	rKYb06n7k5jWiZXS6W64GADoTNBNv14gyqE2QhL6dVcU5TaNqGl7Ajt5qyVJ0LOVglN8LEEgbSa
	je0rvLcanE9U4DIM/3Vj+wCz9gTBvYBpARMNI=
X-Received: by 2002:a05:6808:1442:b0:467:1c6b:ee14 with SMTP id 5614622812f47-478a0405951mr6227980b6e.33.1776089167780;
        Mon, 13 Apr 2026 07:06:07 -0700 (PDT)
X-Received: by 2002:a05:6808:1442:b0:467:1c6b:ee14 with SMTP id 5614622812f47-478a0405951mr6227928b6e.33.1776089167036;
        Mon, 13 Apr 2026 07:06:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8c91csm2687521e87.19.2026.04.13.07.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:06:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 17:05:37 +0300
Subject: [PATCH v3 14/21] drm/panel: jadard-jd9365da-h3: support Waveshare
 round DSI panels
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-waveshare-dsi-touch-v3-14-3aeb53022c32@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Riccardo Mereu <r.mereu@arduino.cc>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=24423;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MIfetJdxtR4RP3QkPd0ovBX9kWXJpuY2wobhSOEc4s4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp3PgozqkuupRh1rfb+qM9/pA7DoBMvABs98Jce
 l6sv6N6Sn2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCadz4KAAKCRCLPIo+Aiko
 1VKAB/0Zg+Xrk9u6YEA2ISE4iS4oDJQMOgz+sCYEpEp0rRE/xx331UwwcyH+UPvkjj/sWFMV1b9
 yS4YgRUbNJOt3xv8T713EBjeQq7K0i2qnKFDwHEj6yEQxE262O3QhFBJz/IQnXKy2qYc/yYLxUD
 +elGkqZt0F4QG5Y4fIQg9vKIBeQ4JV6Igyat+Io/gtmfKeOl50vDx015z+XDYLhBaha5dFrOKUK
 yx0jABXKLsCPVON3bISLGfT/bDruTNYWj8k4YfxbJDwcbapH+ZWkDTd+DYgEKx0uBb6ra7AXVIC
 s8cQS/06xEO5lWRXK5FelTh7ZxES5pokqoZR9Peth4MxfEeH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEzOCBTYWx0ZWRfX4S+uFSPv9Vtf
 CzO5wU2+PUeLyFTELayhbLgZlzZ+P4EEGCzEjRKqTr1QQSxwDHD41FwiRC3eu3yivHMmI/M5DX4
 IVbBc4zDll+vCSe9Svhxgtkkmh5fd4BPzpz/s6tIG4yAPwK7Wn6bkBCdxWaMztTGRoaDb9FC0lZ
 6rA3+HVvQMzw6SpJ0ObeLrhdvPSsB9DN6FkamLn3U0G5ELld+Wl7lBXy35zqloPOU6xaUfDZgN7
 QurTISJIWeDGxFHTaokysuWK/xRZ8APgkJcdjEkPiUtQh2heljOuV6zEK92p7ZzzneNMxdluV4E
 7dmo+XTPYTv9fXNVqj/6IwY5g4PJVElReq6NVZp3CkA2wMQVwcWIJgvAZAjMgojR60khkkZblUK
 X9974gnU5y+ifZItlyMTa4lzibLq8AgbdES40EfgcwyAVlbDQxl1kA+3h2N3+CWcbZW7HlK8feC
 QOphUKXPAAHXh1gXhSQ==
X-Proofpoint-ORIG-GUID: -JTUhlDPC1edSQzfSalWF4U6tI5015-4
X-Authority-Analysis: v=2.4 cv=FOkrAeos c=1 sm=1 tr=0 ts=69dcf851 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=sK-RQuhdBYdXSAti0wYA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: -JTUhlDPC1edSQzfSalWF4U6tI5015-4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130138

Add configuration for Waveshare 3.4" and 4.0" round DSI panels using
JD9365 controller.

Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 476 +++++++++++++++++++++++
 1 file changed, 476 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index bc079b97cfb3..61d67efed379 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -1599,6 +1599,474 @@ static const struct jadard_panel_desc taiguan_xti05101_01a_desc = {
 	.enter_sleep_to_reset_down_delay_ms = 100,
 };
 
+static int waveshare_3_4_c_init(struct jadard *jadard)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
+
+	jd9365da_switch_page(&dsi_ctx, 0x00);
+	jadard_enable_standard_cmds(&dsi_ctx);
+
+	jd9365da_switch_page(&dsi_ctx, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0xd0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0xd0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0xfe);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x26);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x78);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0x64);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0xc7);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x1b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x56);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x2f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x53);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x4c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x3d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x56);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x2f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x53);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x4c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x3d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x0f);
+
+	jd9365da_switch_page(&dsi_ctx, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x5e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x5e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x4a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x4a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0b, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0f, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x13, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x14, 0x42);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x5e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x5e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x4b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x4b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x21, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x26, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2c, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2d, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2e, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x30, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x31, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x32, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x36, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x46, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x47, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x48, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x49, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4a, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4b, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4c, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4d, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4e, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4f, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x50, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x51, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x52, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x53, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x54, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x1f);
+
+	jd9365da_switch_page(&dsi_ctx, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0xa6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x88);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0xd9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x43);
+
+	jd9365da_switch_page(&dsi_ctx, 0x00);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	msleep(120);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	msleep(5);
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+
+	return dsi_ctx.accum_err;
+}
+
+static const struct jadard_panel_desc waveshare_3_4_inch_c_desc = {
+	.mode_2ln = &(const struct drm_display_mode) {
+		.clock		= (800 + 40 + 20 + 20) * (800 + 24 + 4 + 12) * 60 / 1000,
+
+		.hdisplay	= 800,
+		.hsync_start	= 800 + 40,
+		.hsync_end	= 800 + 40 + 20,
+		.htotal		= 800 + 40 + 20 + 20,
+
+		.vdisplay	= 800,
+		.vsync_start	= 800 + 24,
+		.vsync_end	= 800 + 24 + 4,
+		.vtotal		= 800 + 24 + 4 + 12,
+
+		.width_mm	= 88,
+		.height_mm	= 88,
+		.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+	},
+	.lanes = 2,
+	.format = MIPI_DSI_FMT_RGB888,
+	.init = waveshare_3_4_c_init,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+};
+
+static int waveshare_4_0_c_init(struct jadard *jadard)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
+
+	jd9365da_switch_page(&dsi_ctx, 0x00);
+	jadard_enable_standard_cmds(&dsi_ctx);
+
+	jd9365da_switch_page(&dsi_ctx, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0xd0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0xd0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0xfe);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x26);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x78);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0x64);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0xc7);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x1b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x56);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x2f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x53);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x4c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x3d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x56);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x2f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x53);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x4c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x3d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x0f);
+
+	jd9365da_switch_page(&dsi_ctx, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x5e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x5e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x4a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x4a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0b, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0f, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x13, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x14, 0x42);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x5e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x5e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x4b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x4b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x21, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x26, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2c, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2d, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2e, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x30, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x31, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x32, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x36, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x46, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x47, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x48, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x49, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4a, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4b, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4c, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4d, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4e, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4f, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x50, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x51, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x52, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x53, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x54, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x1f);
+
+	jd9365da_switch_page(&dsi_ctx, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0xa6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x88);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0xd9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x43);
+
+	jd9365da_switch_page(&dsi_ctx, 0x00);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	msleep(120);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	msleep(5);
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+
+	return dsi_ctx.accum_err;
+}
+
+static const struct jadard_panel_desc waveshare_4_0_inch_c_desc = {
+	.mode_2ln = &(const struct drm_display_mode) {
+		.clock		= (720 + 40 + 20 + 20) * (720 + 24 + 4 + 12) * 60 / 1000,
+
+		.hdisplay	= 720,
+		.hsync_start	= 720 + 40,
+		.hsync_end	= 720 + 40 + 20,
+		.htotal		= 720 + 40 + 20 + 20,
+
+		.vdisplay	= 720,
+		.vsync_start	= 720 + 24,
+		.vsync_end	= 720 + 24 + 4,
+		.vtotal		= 720 + 24 + 4 + 12,
+
+		.width_mm	= 88,
+		.height_mm	= 88,
+		.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+	},
+	.lanes = 2,
+	.format = MIPI_DSI_FMT_RGB888,
+	.init = waveshare_4_0_c_init,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+};
+
 static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
 {
 	struct device *dev = &dsi->dev;
@@ -1722,6 +2190,14 @@ static const struct of_device_id jadard_of_match[] = {
 		.compatible = "taiguanck,xti05101-01a",
 		.data = &taiguan_xti05101_01a_desc
 	},
+	{
+		.compatible = "waveshare,3.4-dsi-touch-c",
+		.data = &waveshare_3_4_inch_c_desc
+	},
+	{
+		.compatible = "waveshare,4.0-dsi-touch-c",
+		.data = &waveshare_4_0_inch_c_desc
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, jadard_of_match);

-- 
2.47.3

