Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835029;
	b=L52tguJRTgbAXpMYpM2PF6v3Hq0qd/xDR0ovOEklqLYIT7BRubtvZTuho+310xq3qj5M
	 afkfjO9Ns1XkGtxgwFZ11sH7vEFxxEZW7tRuY5ADJLk8rrJCHbEEGNeCdIAIILgFDetfK
	 MVZfWJr4ghxi1cRZiCHvC1npThmeb37VwgPJ9VhJ+UPpykQH0aSlPV99dOYNZD+PTWbzp
	 8EXc2DT7KPj6uMa8UwIVRpzQe95hir2Tw8YuL8bTgExD/8tVpSdUS9ElLi+fROLMXAq3f
	 TS3pgW6j9/7krwM5YXsffWJQXxKDykBH6AIUna/GPI9OXVifMqBrlnueDHHw+OQMB+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835029;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mX/bLIK/LBbOqRGK+WPRiYe1oCKMmUPphTR2ycXJySw=;
	b=4fDbSABU4dXF//p1zjgGVPrxMyZsBudNLWcMkTlVGZ3AVHl1J1c81pXlwuL38FX0Zpfq
	 Dqs4x8G3VtrqODSmPwvSE8SptBcGylSq3+WpdibzrjHwmP+upewc9YtI8MZNyPp9DawCT
	 n+g+ngBB6dNnL7m3PZnES6wHIPoZDc5/SoDmysvE5a+qU1DJY/HYwONbzL++J3PzaDFcr
	 b0TTIh4fk//p8K0Kyx/iqCqdzJakcNEE5aTZIUOd/nMGwrwrzfsngY1GaTiSIRCg3JDqk
	 ned0Nx7jYSGSAEdEOKPfwPFf3nVw8Tg4QlT0hQFU5M0TRxlfjHzVTUTxJg9PELGOsaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p47nZ7iM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bX80nJEr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58D6606A881
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D58D6606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p47nZ7iM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bX80nJEr
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC12ro4069561
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mX/bLIK/LBbOqRGK+WPRiY
	e1oCKMmUPphTR2ycXJySw=; b=p47nZ7iMx2ZEdr+qIWmsiuMkUMJAltKW/VTGHs
	HQBF3knKftCCwVEhl9HOpSvB7FbaGU+7fUWUlIgoXMaVa1MI7ZZM1cgujk6LltEj
	MEjfe7qp/AdiSshd2HGn7r7BnyYAdCnTonGE7wi6uTs0bSDnBdPv8HZmUcekEW8W
	vOLZjRHUlfLFlDK7WSpWx1PBIk7/oRhzzbEiporDRtsUoUstTZcKO2BDt7z5UANA
	+2pNdUJ7B7uZYiLGDIrCtUeb6VkFhHU+2nFd01ss4/UCp2AJRxtBSf5Za/0XhAPk
	gJh5eSl3H/FAS+veudhy5li784SMAtTRrltzl+DWGYGSejQg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmcehm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:17:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f6f4fe531so610534985a.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 05:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794835026; x=1795439826; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mX/bLIK/LBbOqRGK+WPRiYe1oCKMmUPphTR2ycXJySw=;
        b=bX80nJEr4pBuerGIoWs90cfZysNajVrOMgeN9NNRLy81+0en0Cc36q8HKl+UADlcfP
         3lRI7QuiM290tLn7kfec9s/QWgMvIjorNVtnQTpJnJeHAi06Xolr5NUT3pghIga9hA1Q
         iEzJUQHUstTzRvcu1OVMaq6pBSiCAXO1g0ik1yul258R96K5DPtqmqCJMLbUeNxD6N78
         NQ6gjwlGz4JHdhbBBASIMPusMeNCGGo1SESKdr8biymsMe9CX/PgOr4Jqzs0BWB8IiRw
         hcuJWcVMGSEoz2G8hgcnChblIyC0y7Eb7iKXwRfY6wZzkttRUIvbstzen/UyZm+UHXzE
         qb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835026; x=1795439826;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mX/bLIK/LBbOqRGK+WPRiYe1oCKMmUPphTR2ycXJySw=;
        b=OehwAw2xwH/dui9zbxWTL6qZw/pdtZGnH7wUa3kg3Rwb85qcsvMTMbfze0ZTRgTLRT
         PpxUxpbIuQ4f6tax6moslOYSmIYfG/NbbMojqiCcERVstqo+J9viXC8/cmMer9jwUbwT
         /kG0UyZlPzfEDx8viOrITiNSiih73I+I5nzUh+X4JAjk9MUQGsk4gnmW0mGpmswvG+gZ
         AbhbWQ7sVpzxp/rXSg97Ihznr9xY0ecn+30A0NJ4Vz7mXwRInSmP4J/v/X5xBA2bzz/C
         gTDr/dNSP3ZX2LfVv5NfvbN4UAYmEbQD1ydAcdDST/PPwnE4+lhdD4FtAxBklMS0pxI4
         KXeg==
X-Forwarded-Encrypted: i=1; AL+hErEJzwRwvnFjYIjLcc6kuAbZ5McPHklaERwctjL9tvmeIeiUEvGehBwdEOM7XfdTiAnSbeOyXYgSxdrS@vger.kernel.org
X-Gm-Message-State: APuU4Z+ghJKRiVxjHG9qBNGbw1H7UPpAg7qdIm/p3i6G0A1ZRIsVxihF
	4005s6+gGi42XPU9eprXOZ4PbV3n1/zkyBbkcNrnWA8sF8hjYAbMd4mXfS65gK7e1O7syTDstfK
	BBHV1YngEmom1xfUz9B4T9XzydiWH9XP7ZWXxXZbAbKuOyoLaFLx/5JG56UZz+8fa
X-Gm-Gg: AYBFou2gwSk1XAqUnZUG872C6rmNQX+5tYeistcGy6snX2/tftyzO6n3b5ws5wKFQ6O
	el7GGaUKnHEl6RISkgSxPkIFLv7R8THoTZ9ZHNb7iZekXwJe6+40+Hh3adVr0FScThnxd5AQy9M
	DDbsWZnbq5maFTQyEV5EpRhOPqB3uRZsH/Ij7PryxJ5tiNSvrmP5Z1xKO8hfiSbog39wurFdQtA
	JPbREanyxpjJJ/7eHw08nQOEacbUTk2A8vg95yX2razYYoB8bEJX7Vp04fmSHrRUb9p6EVGY9HQ
	POwayLsuhZYmifEgVmQxuNQDhbsPqXKlBTLKyoVT2COEp3VlsqFPCYAWgtirvRRUEsCW3/KAO8M
	CJcmHi2MdcEYlOPeP/PUQkqXb55W3GaXyid+lI73cMn90RgwCugo1rjmxrR7mXTY4IQybL0tEZF
	0k
X-Received: by 2002:a05:620a:4111:b0:93f:cbd:8e20 with SMTP id af79cd13be357-9494bbeb2cdmr1633080385a.73.1794835025830;
        Mon, 16 Nov 2026 05:17:05 -0800 (PST)
X-Received: by 2002:a05:620a:4111:b0:93f:cbd:8e20 with SMTP id af79cd13be357-9494bbeb2cdmr1633075685a.73.1794835025311;
        Mon, 16 Nov 2026 05:17:05 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8e1c94sm843927285a.39.2026.11.16.05.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:17:04 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH v3 00/11] Add Qualcomm Nord display and eDP PHY support
Date: Mon, 16 Nov 2026 18:46:39 +0530
Message-Id: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIADcC+2oC/23N0QrCIBQG4FcZXufQs7ZhV71HdOH02IyapZsUY
 ++eLgiC3Rz44T/fP5OA3mIgh2ImHqMN1g0pVLuCqF4OF6RWp0yAQcME53RwXlPtI9Uj1Ux0wE3
 VShQkfTw8GvtatdP5m8PUXVGNmciN3obR+fc6F3nubcuRU0YRasXaShneNUcXQvmc5E25+71Mh
 +SBCD+CMw7/BCRCguyENKLea9gglmX5ABMWLIECAQAA
X-Change-ID: 20260911-nord-drv-dt-d09b21f37ae9
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794835013; l=4475;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=S8GDL+ZuL9kSueOOYViGlnQ/WIx0vWEkvXhiQqNpogM=;
 b=OIEFjUoskb9ceeeg7IbVVPU3v49Fg1Xl8hofMyd9H3VeVLejaljeM3S4z5OJpRTBrxXyCsYoq
 3JlFoutkMCCDuhYvNvhP2NjntEunPSY+6sS3zQaNOkWfbp0CtQGUHCa
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfXxDto+quuqthd
 S720TK8jH/Y5AJd4ic4VUp3F3boUXcakKANp4FUgjPE7S3USViE1ZZxoSWu2OXa05LthqnMtQlo
 XYK/597tWfkeySGqODAGS0E+VIxbSa4=
X-Proofpoint-ORIG-GUID: PKuEL4SFJtpUqNlmib6jxrja64GvxvdU
X-Proofpoint-GUID: PKuEL4SFJtpUqNlmib6jxrja64GvxvdU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX5pp8+P+0rmn9
 NUbxN/nKrB84I6cBbaLiFOMMEDs6axLzIdhRhgpy6tRiTXxuu/5kAdfYEEwKylMFc3BOsm5QH0U
 XrVpKkKL4YRC10kquSyQ0UAraKmpaAvX0PrtWgK9cq4g5F85I0W1O6czaX2YU4OrN0OI21nz9He
 wO1oSCW1WNUvJ7CINXQJi6TCN+MZEzfoPeIuN0zrAj+tBERkduf4QgiPTSxqz/ZVh5ByLb7C55g
 fJ6wrs33UjlX5w+U0OLSTm55RwHf3LOJ2fJHDJZCichSsyvlJ1TEAE81DhJfkz0dUe4bQv7ROW2
 D6F27aOYQyZ6Qy6jlQTqasUEkvYKsqgBfh895cpsIc0yx1IcCkNkoWD3fhe0U9w4/zb661ZbSlV
 94fXxUKsQF9rxRKh/fPC3rFFHpdAhexSELYfu/PUOg4JS9nuwqLy3jm/+kfHbVZwCjV5H2UtLIS
 N2I3jaiq0ZdGufwjS3Q==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6afb0252 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=pGLkceISAAAA:8 a=tVI0ZWmoAAAA:8 a=QyXUC8HyAAAA:8 a=COk6AnOGAAAA:8
 a=JfrnYn6hAAAA:8 a=e5mUnYsNAAAA:8 a=VLagYuF82rudLD4T15cA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=TjNXssC_j7lpFel5tvFf:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160052

Nord is a Qualcomm SoC with a DP-only display subsystem
(MDSS 12.1 / DPU 1499A) and two independent DP controllers
backed by eDP PHY.  The PHY uses a different register layout,
PLL/SSC coefficients and TX signal parameters compared to
all existing SoCs supported by the qcom-edp driver.

This series enables the display pipeline on Nord by adding
DT bindings for the MDSS, DP controller and eDP PHY, DPU
catalog and driver entries for MDSS and DP, and full eDP
PHY support.

Tested on Nord Ride SX board with one DPU. Both MDSS and
DP controllers probe cleanly and panels render correctly.

---
Changes in v3:
- Used the SA8775p desc table instead of adding new for Nord (Krzysztof)
- Add the bindings for Nord DPU (Krzysztof)
- Split the patch "Add support for DPU 12.1 on Nord" (Dmitry)
- Squash the edp patches into 3 patches. (Dmitry)
- Link to v2: https://patch.msgid.link/20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com

Changes in v2:
- Reduced the PHY patches from 11 to 7. (Dmitry) 
- Removed redundent comments. (Dmitry)
- Addressed review feedback from v1. 
- Link to v1: https://patch.msgid.link/20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org

---
Mahadevan P (6):
      dt-bindings: phy: qcom,edp-phy: Add DP PHY compatible for Nord
      dt-bindings: display: msm: dp-controller: Document Nord DisplayPort Controller
      dt-bindings: display/msm: Document Nord MDSS
      drm/msm/dpu: Add support for DPU 12.1 on Nord
      drm/msm: mdss: Add support for MDSS on Nord
      drm/msm/dp: Add support for DP controllers on Nord

Nabige Aala (2):
      dt-bindings: display/msm: qcom,sm8650-dpu: Add Qualcomm Nord Soc
      drm/msm/dpu: Fix DSI tear interrupts broken by adding INTF_9 and INTF_10

Ritesh Kumar (3):
      phy: qcom: edp: Generalize power-on path for per-SoC overrides
      phy: qcom: edp: Add Nord-specific QSERDES COM register header
      phy: qcom: edp: Add Nord eDP/DP PHY support

 .../bindings/display/msm/dp-controller.yaml        |   1 +
 .../bindings/display/msm/qcom,nord-mdss.yaml       | 396 +++++++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
 .../devicetree/bindings/phy/qcom,edp-phy.yaml      |   2 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_12_1_nord.h  | 544 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |  20 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dp/dp_display.c                |   2 +
 drivers/gpu/drm/msm/msm_mdss.c                     |   1 +
 drivers/phy/qualcomm/phy-qcom-edp.c                | 317 +++++++++++-
 .../qualcomm/phy-qcom-qmp-qserdes-dp-com-v8-nord.h |  51 ++
 15 files changed, 1329 insertions(+), 13 deletions(-)
---
base-commit: 693de981a44b0e7e3b6a73f0b0bcbae9c8d068e6
change-id: 20260911-nord-drv-dt-d09b21f37ae9

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>

