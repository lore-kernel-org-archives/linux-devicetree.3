Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1123BF68D
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 06:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783317905; cv=none; b=TmYGAeOLhtinkF0WIH7s0fUwmvdeLifCRMdGnW2msHDcKQGeaDLpD1H0dBJQg3MJD+uCVH3A6jWZvQl2DRFDzeLzb5INIPz3Ex6UNvIe+Hmidfjl46XoFaZ3Vnbuc5RvemIKogi26RHj/E7FX3bb5J2VV13jmsTEb+qEvbDPg/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783317905; c=relaxed/simple;
	bh=iOs6GYAI1Sry/kgGSYYaJvWSsRMqJlSEIxu1Miv/29s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OV0Pr2+gOc+SRtYMubMUx5obFCEJSZu4TlTNNor2SRRKbC5e/b6/nq3b+IHytI0sQcBjrWhF2k1jI9SABIOg/FCd4tiC9y3lpKUkxSJKq8pPhxVdXUZ17kVUQ6fnYza6IRFmgb6wpgYAgbh5L/aJBc51FbMvvBCoC+JoNMGcg4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHBIriv7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SnJvpoSk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHBIriv7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SnJvpoSk"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641Zlf3438166
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 06:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cnp+51k+QSROYzZ2w2FlmfOReH0A4P11krpEcpJ9Z34=; b=cHBIriv70cikITZV
	/tm/dWUoZ1yWEKeAgOq7vuuyJIsneTae+46Y7FCYsB8ZE6t2y6HjnhiGCVP0bDay
	UR5H3TDh6l827t92i7cpI7OeRtOxXs0Xf1eh8v07bRE3tw7pjPzTbBIqoMdbJjWx
	EpE2Mqt3Jnizqmn9g2xgnkesq7HhHUCLHlreql81+3fJx3AfMp1eP0BBm/y2bUd1
	ivbQJaO8/D0vh0l8If+PDGoS7lkMQeXPQ00wLeukOzYDLmh1b/g5/az07uRTTZEf
	doZbL5AGO89Kb/0DpYldu2j1CGc7HAK3jqDmTep//HW4SJx0ylCiaurSMp/I4SrU
	8qgS8g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6tj8mk82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:05:02 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c889d1eedcdso4270056a12.1
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 23:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783317901; x=1783922701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cnp+51k+QSROYzZ2w2FlmfOReH0A4P11krpEcpJ9Z34=;
        b=SnJvpoSk0B9JIZDKAUsqFvfdkydSfJuQOcpsiu/vISYOOiwq2RhRi97TKbN+xtuBUa
         hZdJwPqhxVt9TXhN1YG2afGL5Nu4InTBg3kpctSZ8iMqCItDxHw8tH9II5oGqi4VH21N
         veekibw3y6bGoHr9nvVjcmutl/rhQxpCjhHEJ2JvDmsiIxL1AyB5LHTN+6Z5+ML8fYUm
         kIxJScB956GLCzIyde9nCE1JW4WPGFK28fLU9oMgAeuKJ2JiIdeSdfB8AJ2t0gJYGKWB
         gn8c8Xu4Qd6dLBzvzAaGwpRKL1FHR4MDXy7Cu1TUxNK4vM0GmHE0sKKyV30Otqs3d9aO
         GGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783317901; x=1783922701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cnp+51k+QSROYzZ2w2FlmfOReH0A4P11krpEcpJ9Z34=;
        b=LYvVl3mSPbnZdMTbjiDMRJiaXMrTRns395f+AMa2ilkUfdQ8fmlYqGQppE17R3WVQf
         hienDukEYSv4A5M8EhD0AZDs7fa32Hkmv1M966A2CKwaG9W+4DtTEnqztZ4DMuyo+/pw
         +BW3X+hIPFERBhtID1gu3m4StrCAAq6xBNunpYohBrVozURbJ3p8143FYAFBaMHoJed9
         HZ7EP0vRvjw4FkL8tHHwLcOdBnQxpbXzkU4M8BKtphvZ0/DbCaSelO5KtHBjy88vQWkf
         Z55My7wUEYcAa2E9cbDQ6dk30Zn8Do0Uo5Z38v8EVqmFT69RuJBJXzY3TNu5aozCMVEC
         NA+Q==
X-Forwarded-Encrypted: i=1; AHgh+RpeOmCjbYqQDBJlx8dWuJ9wm3oqzKOFtpGMybSSZ7aPvzF6KS9rlk67psCv3YlI+KDkfjb8xQAk0gdS@vger.kernel.org
X-Gm-Message-State: AOJu0YwErHNJ6yW9dIG50R/pqCIUK4menwIx3ltLmXdY6P2fT5/vstdf
	SqDUBcDwOO1vJO2n37gY+hoN4qaaIho7CIqdt7+fCwNNyxG40el2KBKIfW+wID1VjrmE29L+aUp
	HHIANOu92ji+liIpC8xvNnEjokquNmrX/jya2Y2i57i1Z/LSmcbzY7y3+fs9QalzO
X-Gm-Gg: AfdE7cn1C9Yx4+wEu5IcSzNjB+Yq00R8D+kFueDncr8nC3yfirclHneZm2T8LG0s3H0
	2nLqK8SiNqr6WuiVVoRMCLRvhlRBBmtTCMgKHmCnrRvBsg84BNLn5Jm/xjvwR6rvQpcT22VqZAF
	kW7sM7K35UWG72ZINn0bTsqADMEJG2CHThTDMQ9Ucge2CMLFt9sjFcPddxeIhJX4+cQ7Irxf53O
	pWUDLP5dipkrg1MNvCy8w4ITfhSztmUtZVfOMW/Fh0esRzsPEay0tibc+i6TDQve4U8KhHrEURn
	6LaGWPgEeCzs0b2nCA/bZT9keEJVaoA+/i2DTUz5CWuPsre5iKqQF30CLI7Zhgm2QT691r9gT02
	sR0e6WHY8ZhQkf6RqnBg58TCZCCIuIbEApzJpjw==
X-Received: by 2002:a05:6a00:1884:b0:845:e7e9:b57a with SMTP id d2e1a72fcca58-847f6faf1admr8298941b3a.61.1783317901306;
        Sun, 05 Jul 2026 23:05:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:1884:b0:845:e7e9:b57a with SMTP id d2e1a72fcca58-847f6faf1admr8298921b3a.61.1783317900881;
        Sun, 05 Jul 2026 23:05:00 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d498dcsm3113266b3a.30.2026.07.05.23.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 23:05:00 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 11:34:43 +0530
Subject: [PATCH v2 3/4] arm64: defconfig: Enable ILI7807S DSI panel driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-shikra-dt-changes-v2-3-56fcd1659ea4@oss.qualcomm.com>
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
In-Reply-To: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783317885; l=834;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=UnybwlAPEOA7quqfyfGuxz2V5vHlqCvNZa7cTXVKqzc=;
 b=M40tYN558Fzi0vX7Q3USfhw4wZ13RiEeAwc8eDSbW154SZAnM6NlmNLN7SVX2Uf9Ju25moi3B
 HWziuiz9n8ZBhJE3y20o6MFYYy8BgdFcPv8pPYHG8HH6146uNZsIb7x
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA1OCBTYWx0ZWRfX+97F7l0WXV7b
 WEUAc/sCZMiLUVODXblr8yKKB4NePv1iszAqFlOyE3XVbwScZgAIT0JJMBxNa+rqz6+zPjDTNHR
 llmZDkBlgo66eosk3ZtQp3Mbfk2jfi+2el/bNlyTyEWR1ac0XhdEYK33RY1f4bO0FaMDvxv+lNm
 PNNtVacAfvQsKQHJs1S8LmgEPyK8hNnt6PaozRDBWu2Bj8Q5fRQ5c7TLxdUW54nfFFPwOiv/Tbj
 ZnhJSd5p7az456DuksSJcFyW2YXhPLpNqtJ61q3Gk/bhouXvuInAKuu1PpPpOlcTOsrlE/5r4g8
 ChfmCBl+0p1adOW2LlqBYHrwriFuqZRxDX0Wgg9RiEcv1YK/pgmJtOc6JCE2pNXJxSCdsbD0/65
 r/HpkqEhA9/kXq2jXzZR/2N6RjSGhMme/E90fDM5+sUQrZf7klOVWdyc0Tioj+EScaxBAhAc+nZ
 ORME1tNaSO7yTFYOFFw==
X-Proofpoint-ORIG-GUID: --l8lu0n5zgieJBZ1UoztqRPHG_1ooj3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA1OCBTYWx0ZWRfX1xU156abdW1B
 TwTwl2f6tnQJu5lPm21mdbTcbfTEKfeLH2obA5c8/KzpNksddXaIyJSmqQnIm5JqLUqCze4avQs
 KidPCllrYO0bk1EpA9H8XDVwtS+IYtM=
X-Proofpoint-GUID: --l8lu0n5zgieJBZ1UoztqRPHG_1ooj3
X-Authority-Analysis: v=2.4 cv=H6TrBeYi c=1 sm=1 tr=0 ts=6a4b458e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Glpgw3x1L1QHtqWtt5QA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060058

From: Arpit Saini <arpit.saini@oss.qualcomm.com>

Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
used on the Qualcomm Shikra CQM EVK board and CQS EVK board.

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f2e6ae93e533..53f7b3d104ba 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1013,6 +1013,7 @@ CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_HIMAX_HX8279=m
 CONFIG_DRM_PANEL_HIMAX_HX83112A=m
 CONFIG_DRM_PANEL_HIMAX_HX83112B=m
+CONFIG_DRM_PANEL_ILITEK_ILI7807S=m
 CONFIG_DRM_PANEL_ILITEK_ILI9882T=m
 CONFIG_DRM_PANEL_KHADAS_TS050=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m

-- 
2.34.1

