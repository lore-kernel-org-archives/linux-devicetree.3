Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794945;
	b=OVB3yauR2q3kIkbveUXtc8YHxBTCZtkkiBZsqm0kTNAv2C0jekr10E1bf3722K2gEqSv
	 CtgTMXwiwHtl6COx5HCZddmqDnI03F2TP+wP3QyUQVSS1sGwgxaB216AHoFBMDFWrZ7Ks
	 rRi09m0w1m751E7BACyyFZpzKZtmD5vWtmhb4Fvp/ADJQVdo61Vzaov+YHSADo9Rke5Ot
	 eOANatj21jKtMztLKBPAwqp7y06GT6BsaVomgMaIkf4ekbg9ATBm2vbiftr3/b0bHcSHb
	 pultlVOr+dGg/cDdmxEDxTRuS//7nnxqFkBZM4/g2scSRoLsNId63YGINPPQHZPS4zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794945;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6nyF58dcnncG871ju7X3tQ8ZZEDodvi/j1FoZtxjGfs=;
	b=RRxSxFEOUpBhXLCCgqc3weE26ypXsmjiY0WPpsplUr+NwwTUbjeX/8TncSQG/ght0Dbg
	 BlNvsLjT/eoiujfoSCFTvheHA137UUDzmkrdTCxLCInH9CDJ9JoKojqmNMQCPfiWcB+Sn
	 NPFYB5nXH7y1I8W5U3Rf5CFDYxt1C8SAJP+zzkEuPHZkajlcoC/W65/8DxmW/2iUhtjEp
	 WHjH3PnPBb9SuQ/iBxno7cx6J5jXD9SUbuowPsYsXUXYov5DpvNaqAmevSvI4bdMs/yhE
	 HI9vk+gaWQDccCSWWnZSdM8iHbUZk87xHMFyRVDGXLbbLEqlXfJQCEvmYuk0pF8Cn7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FgOdbpEA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c792ZMJB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3002C60A2611
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3002C60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FgOdbpEA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c792ZMJB
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFpNAX2925241
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6nyF58dcnnc
	G871ju7X3tQ8ZZEDodvi/j1FoZtxjGfs=; b=FgOdbpEAl4pSbM/oCGkEbnfIitB
	55t+tnJUQD5EVgsFAXej27PiwYSRVZLuooqN61csqVFG+rMwl6WZcEmWsaO0PKPa
	+Xnc6RAjX4MuBF7oUI0iPATbsa2Bnb7VhEWuBpabAWHzZJKJl+QpeDDuwLU1lj7c
	1OG8KLvHrlQ4iPgIGUSdl8+QwWtNB4doTGsFoCRX4mRO/2l2E5z3RW85A2UotPK5
	2Yorazn/srVpTQfTcLjLOcC3aPuSubpeiFzyomCWyVwcVW5eXutTHk8A8bEn+ZBI
	2wu/OLrE0jJx/5jv9nWetzst1UHp9QJBUDykKLvAyg6p3DuI/jP03KCkYHg==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhjbb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:55:44 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67dcb5f084cso13912884d50.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 07:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795794944; x=1796399744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6nyF58dcnncG871ju7X3tQ8ZZEDodvi/j1FoZtxjGfs=;
        b=c792ZMJB1D5ap0q4lFgOnCh6W7yRQ0uPAdzcZJK6jFY+ATIHFt0T0Ckw3PnBg3wDJi
         EkfwJkrVItswTbZPwEKRzSI2re/g2D0rc/2oVJJS7/gHYJdiuJuPC9/rZffp8NLEGPR+
         +Jv1FAoo46HSAt05PLHTkTGp3CXIgP9/UBGv3RlT/3AfEp0d7X52gVJIC+sNvZJvUovM
         97Nf5inoPzvgMD8U3fYDDq/HP+81JbSpK8QPV4GTzsrGhTd0XZQQpr4lrAgYKCauHoOi
         NP7hu+K0mkjjummfv9bxqY1RQEJ5F+aT3V+SLe6r3n9xCp2OLvlYIkdRezvecMeSpR3T
         ub4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794944; x=1796399744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6nyF58dcnncG871ju7X3tQ8ZZEDodvi/j1FoZtxjGfs=;
        b=vwWX0bZh3N5p63anZPKuo8kBy667EseevlIS2zqJPzDlkoHcYwUYkFnLS0pvDnnblK
         3VeNmaVVQfQ6bbAs0ovlvO4vVOXKT9dKHEBou+AwskESvYoDs3hev0xSo98gOGrkLCuu
         V3U7Egg5IYIG4SCBg2f5aGYSeiQ5ISFEgmhqFmouGvugKJd1ZfXR/V3WzlIlrkS7mFdl
         VWFGwWenEok7zSSQtSJ/BL9WX4VmXSzwkA2VelG1MG3mJ9vAje9Aspn+xq6v+en5kS8t
         Or6E/OQIOskZUcTMu2lbwBg+FmHE7GhhZNCZNHvoR5KMvG0s8ajYubwjio2rkAmr+0bV
         OOdQ==
X-Forwarded-Encrypted: i=1; AL+hErEqjGQTR360hSuyx+MXfQAsRLh2GPbT7CA1ZhP3izXjWXHDYPb4LNUUAPDyZSnAVTS0F1Dr46hLom+p@vger.kernel.org
X-Gm-Message-State: APuU4Z+WwJt4QQr4jAI9Hmaa3AETnWa5RrKx/D5R2KruzFXiy8XADhUG
	sXoGWJK4JQUWDqBMERDqJc2Uu7KLZBTX485wkD1S5cFG7g33uHBHwdGZQT4RukwRV0205NFyE1I
	Zm3i1HwsvQjYWxIPPNDXH01sxMmUZcc+TtwN0n/ZD4dH/VpI3dZ3p4aoQ//Yhof2m
X-Gm-Gg: AZFdTZdb7O+aoFSPoUAFGK9GYMD5rFg090d2IuLvn9dtvcnofzELzkgLIFubMyk4E+L
	+h0klcsuWkMD+PoC/1IzOR44RzYWPysIkAJM14JsGtIoIIazoPW55RSFmdZEAn/bpCqqTEuC180
	I2W7P6rYA6FUFRHN8I7EYsRHv5oDauBCNCoVdcu6i2Icrc1WuuEJzeWPRNPqz7yL54GxGJBIqXW
	ra1AtpgOmVi1Z3IpC0EkfnK3mWsUQFrtu7smYBQxHPQkHyK6XBdTJkMr5egkUl5+BUeuwwaaOc3
	CSGsiiZevp768ddNrSiBIZthgF7Q60CMZGIL2iEP7QRRMqCKa6mW6+lhHeXhT0A/xJ0aVEzPomn
	TbwSG+rkNBhSS8dqprDBSwilgbqEHvgYyvzL1O97GJ503d+O2h9yn7MR966UXhkC/
X-Received: by 2002:a05:690e:130c:b0:674:1fdd:6116 with SMTP id 956f58d0204a3-67df445e102mr8628422d50.100.1795794943679;
        Fri, 27 Nov 2026 07:55:43 -0800 (PST)
X-Received: by 2002:a05:690e:130c:b0:674:1fdd:6116 with SMTP id 956f58d0204a3-67df445e102mr8628411d50.100.1795794943270;
        Fri, 27 Nov 2026 07:55:43 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm47272636f8f.10.2026.11.27.07.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:55:42 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 7/7] arm64: defconfig: enable SDCA class driver and WCD9378 codec
Date: Fri, 27 Nov 2026 15:55:20 +0000
Message-ID: <20261127155520.358909-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX/7h7lNeW0Fdo
 hskfNAkAQb4OOvd54oKbOpiQVYI1BHMYKnEeu4WwOawWO3/vuzwJQx9OMpvzXQntJ2NZawkT9ef
 NMpVzo4xfQ/edtuNFakfXZktK1+41rQ=
X-Proofpoint-ORIG-GUID: wTB3-A8guRmTOurBYZ1nrCaiX1-_w2po
X-Proofpoint-GUID: wTB3-A8guRmTOurBYZ1nrCaiX1-_w2po
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b09a800 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Lb-CJUeqFN5ILZ2-pT8A:9 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX2OXIYCiuF7A5
 Eve/eZWh3FkSkNVPvvVIsZAH282bg5zmtgXBUWoWBHRuNCY3Tc3LX4hG/CoxGQE39WUSSkdNncI
 cq2N8vQX8q+DoFb3nAaw881GI38v7tuV9YGo6/47KeX3gXT8rtHRySV9hbP7VA7NPVuZIKevisp
 aMmimmZhIll5zPTRMx3qd/yx9gwUZbYtS8Hyk9RiRaXlo3qaig0O/9UbuCjeCURP0U3vXaHRrUI
 7jRUbCv8qYJAkI3EbfWiDdp3WEHJcrNBTkB2e7Jbq8Gw7s1uRxgmMSu5cGDZxSGj5nqXOqExVwF
 LNwwI3CNoNEzI6Won9IEixATs9tbftEUvverdNQw2sPeMkLZPu1gVPmAV704k24u8ZH3uhXQmeU
 asew09czJCSU7XXOBJygh/ylKoT0QZHHAU0gjVP7pZqWbyO8RtzK1+adesvTSNNvIeffG8XO0f1
 oqLdTzsZzugB5M3YvTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270063

Enable CONFIG_SND_SOC_SDCA, CONFIG_SND_SOC_SDCA_CLASS and
CONFIG_SND_SOC_WCD9378_SDCA so Qualcomm Glymur-based laptops such as
the Qualcomm Glymur CRD, the Lenovo ThinkPad T14s Gen 7 and the ASUS
Zenbook A16 have working headset audio out of the box.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9c5b64f34a22..86b33019eaa0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1184,6 +1184,8 @@ CONFIG_SND_SOC_RK3308=m
 CONFIG_SND_SOC_RK817=m
 CONFIG_SND_SOC_RT5640=m
 CONFIG_SND_SOC_RT5659=m
+CONFIG_SND_SOC_SDCA=m
+CONFIG_SND_SOC_SDCA_CLASS=m
 CONFIG_SND_SOC_SIMPLE_AMPLIFIER=m
 CONFIG_SND_SOC_SIMPLE_MUX=m
 CONFIG_SND_SOC_TAS2552=m
@@ -1194,6 +1196,7 @@ CONFIG_SND_SOC_WCD9335=m
 CONFIG_SND_SOC_WCD934X=m
 CONFIG_SND_SOC_WCD937X_SDW=m
 CONFIG_SND_SOC_WCD939X_SDW=m
+CONFIG_SND_SOC_WCD9378_SDCA=m
 CONFIG_SND_SOC_WM8524=m
 CONFIG_SND_SOC_WM8904=m
 CONFIG_SND_SOC_WM8960=m
-- 
2.53.0

