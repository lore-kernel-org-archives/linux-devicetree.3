Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674739;
	b=vQygmhKbs23Ji5mPI6mJczr1eyczv+yVDugeJHWXAqmw+NHAZnLV+ORU8cT4kW7fcpIp
	 1h7ABU5JrhGilQm5zQS5Tk4x1aS0ReeFx4YP6E5+6ZE20jZS54/8ZgB93KRpWH/O/OjxN
	 yCkbnroiDnFRrHDKhGfG1MrfZC7Aaqb+3BxBo/4oylj7jvOSsFRPTqv1mB3y/uOhorlIc
	 J5CYBfaobJ8JqZMuegJpEA920aqBfQIu1QltCXlvEXTA+w8QHuc+sYaBnneGET6w/IMoT
	 FSrYtWsPrjmGJ7JNnJQV2PRAE3gORldMZAL+/x1MIMCCrgL8aAnMOd1heGZ4xFyBHdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674739;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4AkcPh/1wch0GkquBRzujr3SqM+yDsjNnQ1ilgbyD90=;
	b=DSdezfD58j9mG1TFw13gavygo5HSNoXj93YsGfOvV7wP/tu/Vm3DcCVBH5zxpvyTVeFX
	 KB59V1NCFaPXw2M7APMxUakdKtxSfRKOVVv4tbE3VndUv2FXOLVsZ0dpa1ObR3osPmqxp
	 DPKIz/Zdt0ytXXnO1aetJnGDjpJu+0d0i6E4hor2LPPMyEy/Py7lYIz3seX0sDwZqySLP
	 BwApf8ZYbiI8xJlIE6kCkCwpirE5EWf5s5dtX3lGaORTOzgaqCShvla4kR9let7Yz5/NC
	 4vYmuWYgkdVkSknSwv2396KKJx2hRQjuW6BJGJfARJG538vS3Uj80IlzBkw67mx30Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZdTmBJzp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="W1x2E/qE";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6463E606A686
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6463E606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZdTmBJzp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W1x2E/qE
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36Lu13022897
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4AkcPh/1wch0GkquBRzujr3SqM+yDsjNnQ1ilgbyD90=; b=ZdTmBJzpsejhQ8Nb
	+TcwWFSNTj2fYAuNXt2Fac5+3/twa7YPJCacab9hyvr8QYfFmefKJnKxFnOH37O2
	fcHVJtUkrsDVIc0XgPQyPaeW0CsTQn3X3eihe9H6mPTbsJhjCD6gD+atcm+QiA0B
	PgM04MsCHdUudm/AO+rckGk5PFl/RdgF7FaTqqCfSk3jLkeogRAZ7nXeadwsA6gk
	DypoSQoT6dvoNhKo5FmOrwgCLou7P/J/B/DbWgzq34Oybc8PkAGjHQ+dzKGlnaYx
	ttPLSgE/QxIy9SH1kT6l1n/CQm9PqDcJv5JPVVYoanS/ho3rTmDylnmmOTgu3ZKc
	PIyMPg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vatkrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:32:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f074b87307so39592485ad.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 22:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674738; x=1796279538; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4AkcPh/1wch0GkquBRzujr3SqM+yDsjNnQ1ilgbyD90=;
        b=W1x2E/qE8LLPjpaG6TcgFg8MiWwTPQzEBTJjuJr0hDvL3/b85+CymYDhsnBYPcor9E
         EDnWBCCXaltY16cmA1U81x0JFdzr3ej9ee0vXxGoCoQta9VNcV2S8npdAZG+EFAKtmC7
         KssiQn5GsSVJwLTIKQX4q65h5179h4Rjuy5Ssr2Dkn9ZzrSNWw1Dlaz8OwFJwFkFK0Az
         sUSRyp6EYJ3DBKk9Um3SYJ4UTxtlkOw3RGwjwWwAoTMEvbtk2JRkqdsjg+5TJBws9YAv
         c4F6U2CDz0a0nDbURAjcBJVlYErl1sb7egtlk21Uek82AY63ztFaEhVSDj0LB/UXuiFb
         lkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674738; x=1796279538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4AkcPh/1wch0GkquBRzujr3SqM+yDsjNnQ1ilgbyD90=;
        b=xwkWxIATHRxwwJ52TIUp1JlP5GbAUE7Zi9qI45tc6+Y/UGa4aXVmMv9XB5mTwkmVWA
         zWqZGW6GlQoWtmsaCYa+NCwRmQFqXEE0kSgQcG201GdHKFXKfiBSDvGdjIxapFMGRuUS
         HjagNa7YGerqg1oPrbGkXhwNLETywbbnSlAjmONRi92hG5Hs9ponzptvhw14o6T5Bomv
         ZpdoXPEXU3EvrgXoTiCr2PKxSFO7Z/BywsakFoNp/1cT5nxcR+SRNqDoUQGZYyqYd9dp
         dcISJSgIEsrQX7H5K2Cetlf/OYqrAUFrU+oSGcWVXDTW5LcH6KtT5IJB2fCJgHPh7x83
         YcYA==
X-Forwarded-Encrypted: i=1; AL+hErF2tZIwhj7fJCU7b35j3jnzhD5/Ict/bbqlxyEM9JL9y9kFwnV4h5A+K5y8MbnWqsD/pF/m9wGEjZS8@vger.kernel.org
X-Gm-Message-State: APuU4Z9knuG5S9US6C7WNlVg18TtKO0tOP3n3mU9pthgInjtis3+S7BA
	GoRtGCong1k3lWkGCnxLr9lCS5/AlzCyXSFOJpNDFGv0fkCd+D8JL9vayZIATrnOXG069u0U/0z
	ntyyA2G7tvUtpJXMKsW+VqV7iz1E0Lsm3pOReO4naebZwzYlgqKpptNNJa02FVyKD
X-Gm-Gg: AZFdTZfPOkdvY/jTSvV57gBahpmvVLXV8UhCmkFqICYjDtH6iGtxS44m3qnnaKijV1j
	cma5W+fkh1Ixies5tHsisJoR3pCL84/AmnNm9+hz8b3KocLlVpFVpknDG5DAJP5f2FcKpyhbn5N
	QDcJMqdAQxzaBe6o9bC6nl0SwZmsPrxh+jv0rv5zu5dEyqymTmnaM4fKBVMMEo62ogfDHTbBOE9
	VJRXNz6RjFFF477Fc8XKszJzY8DLtf5McgiOoS5W73SjhjPPJoimKUoySpUu/5FNbD6HaiZsBN4
	3dXCGa7RB48ey5/e0ABEy2IULDXjG6mkzf4E9B+H7GZZl38CGSgCMb78E+akKaEKTj86CAetykR
	tc+qaVSZxJxCeE2Tsekxw7/wP9YCJgmMZAu9BD7cjT/1jg4dms5EGBJlX4a9zlmafgz2OYXlK2r
	1r4mycvSQl
X-Received: by 2002:a17:903:2406:b0:2f0:ea76:1a19 with SMTP id d9443c01a7336-2f0ea761b46mr18249205ad.54.1795674738135;
        Wed, 25 Nov 2026 22:32:18 -0800 (PST)
X-Received: by 2002:a17:903:2406:b0:2f0:ea76:1a19 with SMTP id d9443c01a7336-2f0ea761b46mr18248945ad.54.1795674737658;
        Wed, 25 Nov 2026 22:32:17 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm97159715ad.72.2026.11.25.22.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:32:17 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:59:28 +0530
Subject: [PATCH v3 20/21] drm/msm: Register the DCP backend
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
Message-Id: <20261126-jshekhar-v3-dcp-v3-20-f1e9d7505039@oss.qualcomm.com>
References: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
In-Reply-To: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674555; l=921;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=6PWxDVi4BsbO/741ftQsQBNSZTnRP3jHkckpMt40Eso=;
 b=Wl4BjgymT1IPugnivQbz8x6tsQhKaYhy1kx4zbGuLUWYteGkdm3HxalR5HeEUukju4cP5dIWN
 +kl35YXB7zYAwa3nkmZqDOH4Hq8/2VZ6AY2DQkmg7CXkeXse2A2DgET
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfXwVqHAkMQ5D5L
 C61seUyxoYOREu3EDwpDQHImFGbiSd+ms9mbaK3fVO0Y8XGwV3zmZ2oDmLRm9sfb/evUjsoEt0+
 NuAIIzRm9Cj9uakCvo7IO1t4PpQVrzU=
X-Proofpoint-ORIG-GUID: gakS3QStvqp7YZieNcfsMIL_S37mL9Ld
X-Proofpoint-GUID: gakS3QStvqp7YZieNcfsMIL_S37mL9Ld
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b07d272 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=BMemq1xz1GlmVizxLk0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX2W/e+PN/tjEz
 V2kL1IY03LlmEwtBwHmTa06q9qyKquvjVgePfFjvVK0l4UFq+NRsHTO3QrU0N1i/QtUdjCbUyu+
 Aa5FZPTlV1iT4kS9Nr/WcowQHCH1LJHhwuOxWtNRExQx9E+mswUk1qg07LWhETiJtrL034OBvoe
 OTBpxUoYP+SokuS/oYLNsd8AdA+FDTd2+ZqTQnCb/5p9HHxCK/Y7Eslx3IDvfJ7Tg12x6Tb7+aq
 nYVDXbPH9cOfqEKOJczOwMsg2ifWbyEMCo2WhIaQwVVuH3ZJaqXjhdPMTW/K+FDoxHkUyBBGh7L
 3OYTEPODtvdad2hjII7cOZ903hx3KwrmPZ9wBLnQfyoiI3dRstvMgxVMYIxq3bRbFH3hfkiu9ub
 I7dmmFWhv89hqAYT9DU4FW4ecX5ZMx29ayIU+9qFE6WVfYJ0riLyJtGxJdv2lfCd5LIOAgAyrM2
 pWzxR/xCLssUpJH034Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

The DCP display device is discovered over VirtIO, so the MSM DRM core
must have the DCP backend registered for it to bind.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index bb383bb0fe8e..af95237ac872 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1209,6 +1209,7 @@ static int __init msm_drm_register(void)
 	DBG("init");
 	msm_mdp_register();
 	msm_dpu_register();
+	msm_dcp_register();
 	msm_dsi_register();
 	msm_hdmi_register();
 	msm_dp_register();
@@ -1230,6 +1231,7 @@ static void __exit msm_drm_unregister(void)
 	msm_dsi_unregister();
 	msm_mdp_unregister();
 	msm_dpu_unregister();
+	msm_dcp_unregister();
 }
 
 module_init(msm_drm_register);

-- 
2.43.0

