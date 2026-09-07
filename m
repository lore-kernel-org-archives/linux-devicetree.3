Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8B745FFDF
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 10:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775706; cv=none; b=h1hB43Z3ccaxyiJidqPcY8l12PFfiaHWTwIThD1bXWwTT4+1WrZYIEj3yyTXsS4Q1ssinBFXgd6aaYMBZwHXBnOpcKTQnUE+Wn9NjWRplWo+UVvJW7475si4G/Dp43FQGYalHAY5VupeM2RWkSfIpbRjz3s1cOw6fU9D561Ns70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775706; c=relaxed/simple;
	bh=gIpSneSaqWvfdVAtDTtKctxeaHXl3KYuy7TPtmNyI5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IP8Qh7RlWzhqzguQ8qnIRhEmKQzTMwk5LjImXpAro6nstsOsUZ5q9mG10KOMGX+yBabgVLLZvFYi1ggoWTgC/VYDPfkP3pR4T/+MvctJvqBS8LarnIiMJqMiVI/UE64DpaDCj6EJ4BBUECaIQphXqyb8PwOFEOdQCn4Olp726IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gfj1aLBY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jp7HrTRT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gfj1aLBY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jp7HrTRT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bXJZ319010
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 10:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nBEkaDsIfBrFkWSuIwGLw/UVkzMUI4RXlx+msSm6rck=; b=gfj1aLBYZV1l6VTO
	cOqpYaOh9ldZlSkzSyFkXaO8CjjmipcP8j3aHVl3/hzJwRcjGSpt5qm2YMKrXvsS
	2maPqbAiYNfCX1IAoDvVSHs5ySSBPduLvXGEs0ExPw7XlIV3pTF3ARSdCBHUHA5d
	36sjj/I5b6NwkzI7LBIvmJgEUzUTTEKPRhfunJjTEgzd/NgDC794roD9Y90z6gky
	s6MGUJEeM9cA3DCp1wfj7+NWa/qAJUbRNvKfEOe8GEOyfF2sC2sNWo6Wx4AYyIQ4
	EzpNxQtEJXkGecCnlWooOniMFjwZVoDF2XQvNZtBF9SvU4iAnJzGEuQXBleE74lN
	ZyKKtw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfwjj650-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 10:08:23 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso1316837a12.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 03:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788775703; x=1789380503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nBEkaDsIfBrFkWSuIwGLw/UVkzMUI4RXlx+msSm6rck=;
        b=Jp7HrTRTpKFPOBWX9QJFAF9OYUjqQtCdOw7L8UXfBbPInTjECvE/nezidHj4wyK5S5
         2oJu+UWDXo14i9Z3dPnycHImWg3nphKbF2ezJ+D4bHDDiJmaqEwgqdsfriGo+HHFSGAt
         kAAerZ5+UCWwS0+Hb8FHqIprQTtiJp9+0he3EG/DNcs2cs/h3KKlWTMJLMzyPiyxvayb
         CfJ/6USyWa0a2pILM+cwYPfWLeDMLiYp9UMd3qk39Ij1T+xlucHgtZvT4uT+tU73NYXt
         hLXdSAjPpwQVtvJX9OOAgsuN8/hKV1fRcGT8h+3GkGwfLg3f47m7zl/4BAmwJZuDTDhK
         TvyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788775703; x=1789380503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nBEkaDsIfBrFkWSuIwGLw/UVkzMUI4RXlx+msSm6rck=;
        b=MfmK+00OhecTJepaXqPcaIKfJXzt6S+51wriBxcd6/0CgGZmrd67k7a82qBO+ErQak
         S/heQUtKA31Uzide/clvn86X2ua80jeSJgcIeHDZTgbY25UfnMX2uiHoS8yIVC8VA6Ny
         I64k7WdXkaMbWBYarWCeojyytmZVBjWAXN6JO/W4xoJe19gok5RFjDjAOIYM2zsd7J3I
         8eurt+PPq8zfJW+F6Tvrqw/OLORO+X/kyuuW0c/+rQsMjm0RiXUsZQ6f74LfXN4rBUCA
         HYL0AlQRUdHYwv8ZANasZOjm1xpr54vjimoswbWcu0xUgzE4+CBHCF6Sf8D0n76kUAma
         WmyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsXEi6mL60zkLKDxYfJziiW9ILEe4HMtrqRw4YzozPLM2pZO6MBm1/acifD7n8tSXsWxqY2ufzSmTz@vger.kernel.org
X-Gm-Message-State: AFuF++k+OHJWW+6ONCNZVKfjff0QzV8QNWR7Cc7rNC1S3Pt4QT2CUMHb
	bbcb890eV8audxeET/Vg2dtys3UMKr9ezVgsJKLh2Au9OYCcAYagwKKATEyKXRJ4q/um6a8zk+r
	zzhBhnDRbOq3iYxcteui77SPCY8LMnr/RYZs7vjJp/yJ3dc6qvbqABp3TohK4fmYK
X-Gm-Gg: AYBFou2k8b8guSPi+ns15gqJRF7B7f6VAGFRk4tRTdRDoMEdtkT5dJXRTJM2hoqlFAO
	zW9k/TahOCms/dHhtcDndd2FUrreke5m1L6Vso8a+H3a0ZVT9hCY01aNP9Wh9JYry5Xm1HshQ5b
	qWLMNIeE8+BXagcE68v9m4iLDst7W+5Kcfj27OR2Kp0Tx70qQS5ki1G9XJSJkabZR/n/Zol2cnd
	z4nE5TVuX2W2INWOCq/7QV2371N9GjyOZh0Jr9DMIoM26xwTmepBBTWcFbDh14qnTGL5f2WE14V
	Pyzf/hLc2i+2QqFf/nOcxghXIPl4Hclb4BXqwvuXHRfHGu74m2oDiz/vIqJ5PoGWFubG4/o4CGD
	o3TpdOJKD0+codcWu+BrkXD+KrqVSZv0=
X-Received: by 2002:a17:90b:2ccd:b0:398:9c00:29f0 with SMTP id 98e67ed59e1d1-39b2628fc25mr35715181a91.24.1788775703120;
        Mon, 07 Sep 2026 03:08:23 -0700 (PDT)
X-Received: by 2002:a17:90b:2ccd:b0:398:9c00:29f0 with SMTP id 98e67ed59e1d1-39b2628fc25mr35715103a91.24.1788775702667;
        Mon, 07 Sep 2026 03:08:22 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa37dbdsm22891332eec.11.2026.09.07.03.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:08:22 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 15:37:49 +0530
Subject: [PATCH 6/6] arm64: defconfig: Enable OV08X40 camera sensor driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-glymur_camss_dts-v1-6-6c2ced5ea5f9@oss.qualcomm.com>
References: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
In-Reply-To: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788775671; l=680;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=gIpSneSaqWvfdVAtDTtKctxeaHXl3KYuy7TPtmNyI5Q=;
 b=2ec/UXHnnDDHBsM2OPfWog78Omca4aHesaynUpX9rCXbiGLtUvYwQ3W3H8CjWfg+3wbatlaoA
 h8j6Lqz+BqgDgJDEC4OQciDX23PWor4ZmYIy18FtM3s/4a1mk6kUkXv
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfX/kd4EkRJV6oo
 k2ttlv9ooqeFUdBmEkoLAI15WaS1O7XXePF15Xss9bZM7pBNpRuNhvlzIJxbzFiFEnZk5Iz5KeE
 KCjKraGqmLko8/CiNEBntBMkJIG8Xr4=
X-Authority-Analysis: v=2.4 cv=NanWEWD4 c=1 sm=1 tr=0 ts=6a9e8d17 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=WSFeanDOTqpEkpu4Xu4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: sUfRhsS0j6M9X85sEegOkKSz9J1muahw
X-Proofpoint-ORIG-GUID: sUfRhsS0j6M9X85sEegOkKSz9J1muahw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfX11tIrQ1Fh1n1
 TiwglZE8iChTfEjRGs1NsLBihfl+WAaXpJtB2vMlQP8qHhglm/uh4zhjvzCoejLDKnQVWzJT5Zf
 T3zYy3qE16PteeX60bPN+/u9rTsrBRtc7Q9M2ZCoW+6ooZzgcZdDRcvHiT6X+PiplqThVrixoPY
 ghTInbPW4MCnZMgrFauMQElk7TTPvB2hO4BV8UGgDtQHKqsXxsgAJ5Hi6wLNjO+iogDGDybeIdx
 G4mphhZfC78j5B8wM9sxrYSI1RWxrqGbg2zVFqyERAhuAOe6RpjsNjKU8Oc8Kp9Y7BH3z0K7XRo
 Na7m7feSfbQQyPH8BBx/uqPMCSUKB7//g/ROAiDYKkEQNbhVOLcpS52MZROdjj0MkHeTUfeqj9i
 QyPD1hRjhi703YhUqAeTxGRSWO3+4V/4iNeAropU6Gwo0bWxbrYboWZJUhUTH/QdXjMbT4vmquP
 /QDflMVfSoeNeeqEICQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070110

OV08X40 is used as the RGB camera sensor on Glymur CRD.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 87a6c50bdd14b6851cae81daa32cb3b4e35f66ae..ac2697ffb94ac8b75415c6477fd06eedf5d1dbef 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -955,6 +955,7 @@ CONFIG_VIDEO_TI_J721E_CSI2RX=m
 CONFIG_VIDEO_HANTRO=m
 CONFIG_VIDEO_IMX219=m
 CONFIG_VIDEO_IMX412=m
+CONFIG_VIDEO_OV08X40=m
 CONFIG_VIDEO_OV5640=m
 CONFIG_VIDEO_OV5645=m
 CONFIG_VIDEO_S5KJN1=m

-- 
2.34.1

