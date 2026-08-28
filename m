Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A733146D550
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 14:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925932; cv=none; b=qNcFPGI5fUcEwWU8LiDq1zPid5vkZIe51NrLu4tbL1tpZuh5QKA6SApQTU+30vgpruQc7EwpNKaLT66s+7ExfgnwebNxFMr7FoCQ4K3/H/HiSHogZegTvH9KuEKSMAV7Kfn5UEwLNMAxzb7IpRZ1By2UpVb2BirFlI13Sn4Kv7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925932; c=relaxed/simple;
	bh=6C7io++CE3SQq6sBfunNn7UU9vPIt0aJqSBWy3h4kY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JnSv9r2/ZQBmGsgdJePphmkBs9bJnQO/GcCCGGym6l8n8f8b3uiVQABl8N7hYekmplyyZNEKMuahyrc7J/WmyV3BsyKvR2IhldQWg3lXsuZLE0RL5XjymewCfJJpYfiOb1oP20vT7OHVVDek0KYg7D9y6d1bv4tGxHkUvx/2F/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZBfhaVaC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oq9eYaGr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZBfhaVaC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oq9eYaGr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDkd1C2538472
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 14:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wwJXfsloAAB2Apjdz82YrMfdU41yJCnHm61R07l03yk=; b=ZBfhaVaCZEfk2qYq
	ML9UNTOdC1dOx8kAWqDYk00AixzNQGD6WaOideeHLuvOI+h9hHSKgOxxbfOFi23e
	8otwA5vS15tbgp6/A27Kbi7DWKX7poeM/Du7MkppzH6mQNXlP0Z7SawzXujUMv+w
	WV3Uh/63GjdLkDtVGDE86Lm0E0afZlpRNup6hEngXMDZiFKowvTgU1EAxfK8utke
	f/HhGfcie1DePr5yxCiInJzP/NxENG1LnWZ9S5TCdZw7wBwmw/JNA9WfjMAwI9pB
	RIQRpS9eAfuyGpp/0qOsivnDYxPuTERyepcB9uyDDunjISGuuI54RUkO2JrE3VgZ
	1xbqAg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3mua13r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 14:05:30 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97e8be2221eso9484241.2
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 07:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787925930; x=1788530730; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwJXfsloAAB2Apjdz82YrMfdU41yJCnHm61R07l03yk=;
        b=Oq9eYaGrluegTfuW/Rng3U2l4pQiYpIIAaj0Vrbxb1ZmuKCB49s1TWvkifHjkm0Jty
         JwwQsc26HFJCG4wHTCEaNkFpy2nFH3Q5PgG+5Sn+OJ2iEzhZqLBeDMy7+eH2uqXSI73M
         zKkOFa9M8/XmxZQ0kny8jpD15dg60wk8A8jWEk4aSfcqDAXJ/9yAQ4qbJEIgMnTyIeQv
         AhJ2q4pLKCv2FQAQvLr4JL5OnzdHgUJ8KIbBIXdaVcoZHqdhbltOQiAP5JufRvAQ9kBp
         bLbf4s3p0qdYT5kLfgd8nc4KPSIiH8nF5Yb91fAm6Ei79Tito3GW8yRPs2NhwmILW7i0
         wAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925930; x=1788530730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wwJXfsloAAB2Apjdz82YrMfdU41yJCnHm61R07l03yk=;
        b=jdbmFuuRuv1BqxWwkKwnLaYSmLQxHdiBpvsbz5bSaEGXus2VjndilKyjSWSEKFXb1A
         GG+TPgTiwihhPF8mxWXXyAUGBrkRhohFsnAkJKXPb/Z+lNQqxn3m1xmfmm/c2amYNa0u
         Ye1uiShCq6ZdLHQDzp0sU8huiO2IIrZL8NFjMAoL3VsxsNsor+g/70mVc3etvogcJOnG
         qSkexxc42xTU5lKRYRTwEdSZpv4JgmQm5/fd72BTK6GmDGhSZGAG3INxGx+sy6AkWwib
         XUkZfMLzJUDYR2mNmEeB5ousDv9lFtP1kuP90IdVWnPnJKsjRT2IHU9QcO2wlAu3lC9T
         9R9A==
X-Forwarded-Encrypted: i=1; AHgh+RqecHuaPUvucKp8vniJTevZlfD7a+IPCv0SkGIxxypvm7zL+E0DDb8SYO/clH5gEayns3l7hGYXez3R@vger.kernel.org
X-Gm-Message-State: AFuF++kl3RzDfimy5IcgKXOWaixIbCfDB+Oy6Z2h6fH7QSY/hjGs9Hgl
	IOFcIj8PBuUUAlpoyU+qoV7E604/Z8M5sb95gVeEADwtMKwAw9vDdZjsbkqq2QjKbNK2bjiRelv
	JiKIEm/VwEY5eZOaSobq82NLVKSyjfLZzj56ZTZs2Bhk2IoMWANmk0taDu6AvXdi+
X-Gm-Gg: AR+sD103Exp9jw5cJ+Y0rBswFeqUJBbbd8jo12N1TXCSKdHkbin8Xk5gCY7D4WLWwex
	8RkIE0pLkwF/840p0sFAdi0NHmlEhYRtCyEinxrUNUaWcijawAJqDbLvhHonDkeDYjeUi8x0+ei
	Wa6SY7ObH8M+3mzgAdH6iQXafHe+up1/6OJ+alDNsPJnI4yaQ3HHd2gUiSpv06qBI9ABmGZy8B0
	ffIQSPXJt2JO8bOqLV1XXmvaaKXF+HvIl3KifTOFngOmXHwQ4IDTBDrbFJrSaMjzI/F//UguIPY
	2XK12arIk99l6vKMo0L588w4GfxyW+MoEvSDOXXD4dZSEXm86XwGcWHzosZiIkiHdY/ovMh5Ir2
	Zn04HJC+XAmFRjAU36XK6RbQ=
X-Received: by 2002:a05:6102:14a0:b0:779:e75e:63c6 with SMTP id ada2fe7eead31-7859946ad68mr2106149137.12.1787925929606;
        Fri, 28 Aug 2026 07:05:29 -0700 (PDT)
X-Received: by 2002:a05:6102:14a0:b0:779:e75e:63c6 with SMTP id ada2fe7eead31-7859946ad68mr2106111137.12.1787925929014;
        Fri, 28 Aug 2026 07:05:29 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20122sm3908633f8f.20.2026.08.28.07.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:05:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 16:04:59 +0200
Subject: [PATCH RFC/DO NOT MERGE 01/12] drm/msm/hdmi_bridge: Drop redundant
 initialization in msm_hdmi_bridge_init()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-drm-msm-hdmi-eliza-v1-1-67843277de17@oss.qualcomm.com>
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=848;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6C7io++CE3SQq6sBfunNn7UU9vPIt0aJqSBWy3h4kY0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkZWYBkZ3ElfHZH7luw4aONZGG1TFyP5WiPuVu
 rrHWEkjimOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapGVmAAKCRDBN2bmhouD
 180qD/9agwFhWzbkDBY+PenlIgFa5fGuW8FDEGsNfrdhd+XlCkdbjDBPnllkZ/J09DczYm/Iy1a
 ++lWEeRO/Y49aWzDmYBf4gD3Ip0bIippizJHnyNMqkoNpBasveavJAwgAuexR0831QPXoRq1XlW
 8VWJexZlqap6O+juK5mOzyEoZtKrmAT7/H6xQK2hz67hJ2UdKwON8qPfnKMjhKi/H2qTVL9oE53
 4GruP9zO4d7Yx5oDDZYH5i39GdKPJc1qfkNNio/8F3RYxrIh7aMHcvcz6m/P7BnJ26IK6ycJDQG
 B5wKuX/lC4T1qL3ADyrwJMWOQBl5Mz2+/Er7SkQP8gpaLVoIUjNp1i/SzTSKpAsqfkXzCyy6T4p
 UEIJLA1GZ6dPdth9R7+0ygwkjQCfqhQM5DSc7bCZDJUC6cKxk7fu5EZR2/TeEP2XXP0wYU5JTwv
 Bcl05VsOqAOhyVoFBwizr8azvUSsq0ags4CeNfemlmsQ9ySNACLsODUu6ln4NELyzp3nCFRfmkI
 HoItvt6InCDWoQNHjjmogmfD4CuUf51QImgUg6AVKjTj3CateCkHuamAM+dgaBUVwb3MqZFUqPf
 h1Y+kaRm+FZF8gxrczhzedIPxqaY5tykIAMYOGoN7GP1qN7m+sbybYAIoaN40lKVSvWlkBiIleF
 zoX0vZjN29TY/CA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=ZbMt8MVA c=1 sm=1 tr=0 ts=6a9195aa cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=qMQyP1WGGgURt2cF8gsA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: XZyncDr7IwJhmM694XvfzioDoW8JBJAk
X-Proofpoint-GUID: XZyncDr7IwJhmM694XvfzioDoW8JBJAk
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX7KviaIFV3/am
 iIcrsziaXnf4s5qXwjvH965Nhar2kNekUZzBFabWA//nkKUbHiMvbKPpvcIb5eG2obBAokkmr3x
 3hlR9X2gZkA7Kz/Q0mliC2W7lc2aO0M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX2TBEg08rzi0X
 1DcrWPpvZnte3PAAuMtGRY1wT9N3joyAGXCDb7W/pG/v34aKBxLow8ykTnQgbERW//r5HJFHisu
 AC79MzgBGGJv8prHIXti8LZKpdflFq6/3Mrb9HFlKdayu5TCDVYILyQCM0SjWpJ2vROY9vXucEf
 wZD/xH8t/82jD3BTRYmwUcSf8xp96IVS5jVUaOwWRhqxbv8NT55/04jrOfQhbDF+u0sayqtq3V+
 S3LF0FUBi0VzAXUzuEYULbAJLHm6tzZS/PHyOkgpc7UjIX13sYxD+GxEgdU72eU0bQGUJBa+0Gq
 ZTvW97vUIMzp7GckMlir0O7EyQApBpqDkiTpN307OU+KQ+RfmJ1h63gSzbTVYXGahHlMUmmnb7q
 8EH33aZXavx1A2/Pi+W24hINk2BTf091Rw4AEUgUxrKrpq0YrnXNsoqqbRvxLcuwWhF3z4FJotg
 bz97ZrvHD8zbegXtoyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280122

Local 'struct drm_bridge *bridge' variable is assigned in ~13th line of
the function, before any first use, thus explicit NULL initialization is
not necessary.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 157f19bd90b4..a5f891661ea3 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -472,7 +472,7 @@ msm_hdmi_hotplug_work(struct work_struct *work)
 /* initialize bridge */
 int msm_hdmi_bridge_init(struct hdmi *hdmi)
 {
-	struct drm_bridge *bridge = NULL;
+	struct drm_bridge *bridge;
 	struct hdmi_bridge *hdmi_bridge;
 	int ret;
 

-- 
2.53.0

