Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BCC4AB1A6
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 23:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792021890; cv=none; b=jC1DilZF1N0lhmxlZOEP+lT5Rqy7l/FgaXufZQ8e916GP7LImDsCkO8N/rkEYKbEEaNQAJQ75qky6Lrmy6S8+YZVAy8PbvNA2jx7BpIdTKOPnUZSj3R8PMN8+Ev0jp2YEQYovKkBV8AIyneMKk0WGppBFhd60bfCw4L4BSUDOnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792021890; c=relaxed/simple;
	bh=RP7WTrwAPt6xLoUSEeNrq3/jN4TYEWno3wYkzoYf07I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cYNOoKGL7gNTmfNOs9p1u+r87rmvFzWW40C7jYkS0Cr1Rxwxg6zqAK8bHakJegd60EDEY/EjvNbePbquslFDSkGQBM3gDe2+Q3VDqcKrVCg07geejsa+mLjejS6AZ/vwBWS72uCqcAc40xyiKJkwL25dKgKMb4QNCbB69suRnUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a0KUcVxT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kSN2QYAa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a0KUcVxT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kSN2QYAa"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EMFWnT905402
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 23:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LmbkMsHPiT3BBG3ZeJHnzx
	QOZZxaOSDnnOlylj3EKhg=; b=a0KUcVxTRKjRJt03yTKS/lmKIBinCps5dyUSph
	PgkzVgrQqMzqMA1vA7n+DhN44U1Y1kOeLZlliEWDwXjlCxE1A3fk5EwCffryva/2
	wYyVfpVdlq0Wb3U4ATwv8n8/OqsFWBum0GqjuewmjNP7VlrUjDRX1RbHY7P2rzBV
	fQVqZII6NheoZxCbJD+EnZq6fG/4vLM2XEzZOP2bRkwiPkWNuqz5hm+g+F3Y4fkb
	p0xEDtt9EKIKyiPrFsHqP00qUig7JJ2K/C1DjUFwZ7ue/AtQjkawvlmih9w6c6X3
	smdWPHgDBHa0r7nscCd+rRT5ZqIc1w9LF0wtpMm3ksRF/sDQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha42p4123-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 23:51:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so957786385a.2
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 16:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792021887; x=1792626687; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LmbkMsHPiT3BBG3ZeJHnzxQOZZxaOSDnnOlylj3EKhg=;
        b=kSN2QYAazX0jj12KI79xsGr/VcIx/7puSMdMqFbMa0MUGyakO43hVR5KcgzBWFl4Ac
         GKL6Niv000Jw8XMSnCyugYMHu+Are64M5/Xu2lB6JC51eVVShgpZcrUTbUa1CwVKAS25
         tr2U6Mq9OmXNSWFWjN429ktIPmoTnI1LxKlNbbOuynT96j9vjtSXSt5iSgY/dNBr84ma
         LtidW+ID0hYs9kpVtOy7Ao2j0hu9OZ5cH5ylVEkmUTcRe4Qq5zGUvfdyFpZJS6heqwjH
         FTGLP5DkJytPAsjumtEeYhaQhMaUxY5Hzb4WovdeKuW7W9GgkuEBbLQvqMVGmUqokxvl
         rwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792021887; x=1792626687;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LmbkMsHPiT3BBG3ZeJHnzxQOZZxaOSDnnOlylj3EKhg=;
        b=MI9mBE/Joz7O378D7tC5WLyKT3UrtTkdZ1Z/dm7Vyg4GkwZ3Rv35JyPHSIe/vmk1gv
         t+F8OzjzYAixadPdfmJOl4PoG9iztAF/tBh6RABmgNkZOf3Ytja4aCAl7s3nJuRdXPVY
         pxSTRpBe7ZZtmVGDLf3jZuLSTuGsF7oD78Me+mXFz0ajHJV/hnub/E+7QF0e1bmr4m/L
         ZFlnHfemIDH1HNksLN4B8NB0D/kJfDSi6IPo/ATaJ83RmX8o0D5+CQmqT7bxTd8OyEX+
         9YvqRhCH5d16A3jFVib8Hf/hEz8KEbVb1QNsKpMzXk5AacuEt7cr+PtPIMION6LBqct4
         1ogA==
X-Forwarded-Encrypted: i=1; AKwUvBybYt5e6nXaTGT75ZiqOQDCo7xlLQrGqLrTWZ1ZQcTqRxsKTG6vbcbQZ2gVPp63fS6bLU+SYX/1kVT8@vger.kernel.org
X-Gm-Message-State: AFq9FYJO3ZgD+Fe9lqcUSNIfSbMjN6F0NjSmZ8ZEU0yfmvkHNEm9NE5l
	zYWjmtZsW9Tu2dXdpWfRGT+EZEpy9IJ1XozftwfSFZUhPxvobA7wYa8ZJ2YdDxut81Sn+l7Ku0m
	E3b9v/fk2HxUPeFnRH+by4x+9fUzAi4HXLfKw0IIJMWb5DI6qyNDw4Rv+V1+M8kbl
X-Gm-Gg: AYBFou3IPSNv48GJzZo9y8q0ad7fEoLMCFnqf7IwAxuBU5ZwTGmAniV7tNem7WIJ9C7
	tm6i78wOd4LBXgRHLo7Hh0klZyzmUadCyccANM8/3zXEFUbyNMH3tzFM6U3sUYTvGg92ki9AJOF
	7qZ38ZBJTY/PRJGvnRLmyIuBV5vnmMsUq3+Y7pj7pMBJwL+pGTjUfY7P7ryrQhVlSVMQqTWiMwz
	RPqHX7faEx6TaYYmm4965h5pCdR7Z3TgRIE8g4C3ausDD6yQ/Ox4DpPENpgk6zJwrn5p+d/Rc1r
	HmvzVvXXrdvU5OabZPWGRwjfbgEzKk7coIziqJygjjEnjUgtVaUM65SpeX8hYmSGj5XnvWM/0VQ
	Waj79zhCJE5yoXgHae+WzL8/kllmbZzgCuRjIRpqIwsX5P8V1FRSw3xjkOvSogt3VPZY2ouw4gW
	/dGBIJhMiZ9MKk
X-Received: by 2002:a05:620a:6cc3:b0:93e:c12c:f128 with SMTP id af79cd13be357-93ec12d059dmr2761717185a.67.1792021886684;
        Wed, 14 Oct 2026 16:51:26 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc3:b0:93e:c12c:f128 with SMTP id af79cd13be357-93ec12d059dmr2761713685a.67.1792021886184;
        Wed, 14 Oct 2026 16:51:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3aafded5414sm2285281fa.16.2026.10.14.16.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:51:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/5] arm64: dts: qcom: support SDM845 HDK
Date: Thu, 15 Oct 2026 02:51:12 +0300
Message-Id: <20261015-sdm845-hdk-v3-0-1c179cd0d16f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHAV0GoC/23OSwrCMBCA4auUrE1Jpum0deU9xEWbhw3aRhMNS
 undTSuIgpuBf2A+ZiJBe6sD2WYT8TraYN2YothkRPbteNTUqtQEGCDjADSooRYl7dWJNgKxLJg
 UgBVJBxevjX2s2P6Qurfh5vxztSNftm8GePXNRE4ZrRENb7A02lQ7F0J+vbdn6YYhT4MsWoSPw
 BkXPwIkARXrRCfApG/+CPM8vwCrvqJ+7QAAAA==
X-Change-ID: 20260122-sdm845-hdk-9466530c4267
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2832;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RP7WTrwAPt6xLoUSEeNrq3/jN4TYEWno3wYkzoYf07I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq0BV1C2bhr93FymPWgE8pLAQxduOhlAe8Ec7rl
 oEbFE3/5iyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatAVdQAKCRCLPIo+Aiko
 1fU5B/9EQtqAkzf2qdc1i8rt4O/Z1ucIW8ZYZRV9y1fwjJK55oSjCDiiQVbvMdZdC0kmB9zn12A
 XiQAsg1i4PTCWWmctEQok0A0MhuC+qs9sxOxeVgjlkTfQWu0Hm3yRMiA7zDQmH0wrmgfHzaVj0h
 0QS92wvtu9dcrbG/4WYhw/PU3G23q72owT/KbZtGu7LaifX73BYrKeOYFAhD7LAtuqegBUsQUqX
 3i8ZGo+LFJUHNE3MfrgZl2trBnP/GhzmFYl2Gcm5umdSKRTwiKs6d6Xw72Za/4K/f0doVUOxR2J
 xr+f5rdhEnSu+GFsqydNiKjnZ5QOKMCQVv5fB/i4YYjid8ND
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA5NSBTYWx0ZWRfX7SukpnF2t45Q
 2TS66vu+rIG2lEyhLvOjFNErxRSgyv3N6Um79uujeM2v9wQyeWHzkegxCBZjdUJhCBUW+lnjjr1
 MptAroPm829jagF66EAHvOY64PFme9U=
X-Proofpoint-ORIG-GUID: O8DogMOyaEPKh3319uHGNJlViLKi4Ogy
X-Authority-Analysis: v=2.4 cv=aeb0Dhot c=1 sm=1 tr=0 ts=6ad0157f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8 a=S_NnZ3hT_RIKTG7XCKUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA5NSBTYWx0ZWRfX/LK/4SKposJr
 AdCDlPaRV3snmq0k0FnnK0Gy2Qyazv5EWkh8bTkH+CH2SABKGqZyGMJM40w29uO17fq+MjTD+z7
 9evnOJv9/Of4I/dSUDezjqYzBMxkp21BTsBoXUVSb3snoL5aiWxcMlnNe8Im0COV0hIjhMm4bJM
 5P8DA4zFBVNK7Jl9fmGjD1trahPpUjmsAohBdDgD8I3YvBP4uCxrnG5WnkTe/Fm/NsFtpRothhY
 NaVLTTyhJO3UmhfrQl1i2mbdrNF7BZdAFjfX8CdqnBj7BUJqGK3dG9IFRMDEW/mvk8AVlF55Z2J
 30qYfln1I3q9aWIg8/3YDgYKdX3kq7ZzkJ/Y4M+sq7K294/CPp1DekpHj5kzR/P06bWkcsauDZI
 XBOuGbr4DH6zKdJkfhz67jBGBugvpdnGMKomNJksXp8OZxxuJ4Yek+jvBQ0ggiZPNHZNGrSVIaY
 lPLB4/4HXxiplsObtqA==
X-Proofpoint-GUID: O8DogMOyaEPKh3319uHGNJlViLKi4Ogy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140095

Lantronix HDK845 aka Qualcomm SDM845-HDK is a hardware development kit
for the Qualcomm SDM845 / SDA845 platform. It uses the modem-less
version of the chip (SDA845) and provides a rich set of the peripherals
and connectors. The DSI panel is an optional addon, so it is being split
to a separate overlay. To (hopefully) ease merging, the overlay is split
to a separate patch as it depends on the panel. The base DT doesn't have
external dependencies.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Dropped mipi_dsi_device_info from panel_desc (Sashiko)
- Added comment to SYS_BOB (Sashiko)
- Corrected commit message for the display card, dropping mention of
  mode select line (Sashiko)
- Link to v2: https://patch.msgid.link/20261014-sdm845-hdk-v2-0-6d0b4b42f267@oss.qualcomm.com

Changes in v2:
- Dropped MDSS reset patch (Konrad)
- Added panel driver and the display card overlay.
- Link to v1: https://lore.kernel.org/r/20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com

To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Dmitry Baryshkov (5):
      dt-bindings: display: panel: add Truly NT36850 WQHD panel
      drm/panel: add Novatek NT36850 panel driver
      dt-bindings: arm: qcom: add Qualcomm SDM845 HDK
      arm64: dts: qcom: add device tree for SDM845-HDK
      arm64: dts: qcom: sdm845-hdk: add display card overlay

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 .../display/panel/truly,wqhd60-nt36850.yaml        |  98 +++
 arch/arm64/boot/dts/qcom/Makefile                  |   5 +
 .../boot/dts/qcom/sdm845-hdk-display-card.dtso     | 109 +++
 arch/arm64/boot/dts/qcom/sdm845-hdk.dts            | 824 +++++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt36850.c      | 344 +++++++++
 8 files changed, 1392 insertions(+)
---
base-commit: a7d52d51b31a58da686320f5e4edac74e2dad682
change-id: 20260122-sdm845-hdk-9466530c4267

Best regards,
--  
With best wishes
Dmitry

