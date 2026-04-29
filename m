Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BBA3EF66D
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 10:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777459955; cv=none; b=lfvheTzmWZm9fxpV2NAet88+iXFLkRNb3jywUAL77o7JzvuscmNp6NV+rFgP/heGT/Qb5RDJ58CswMVN5DRq2oDCOe0Xc0Obf83Gc8RMb5NIeT4W3NeFfJsByP2rkCjCH4i4M96ZHrlEDiLPtqITwNYC2F8Oa9ZB+UMoBM1meIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777459955; c=relaxed/simple;
	bh=hpI7Hg/aEZhSjGdObruRDwA35829K1m3CN7LKanOqs8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=clcM16qXuyQFAm8w3Lhrr7V+6BwrfU6Yyt7tM34uphvEX7do3ZfmyK2NYawruDoXaMcAx6/vz02lHCkR1LfqbreHgYV9m5ri7LG5vcq/3DsTZrNFGirPIgMK4+ude12XIPAzdKIXW/1UvH+dkAfS14sWtqwp7/OBq1JRSxxUphQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ll5u/ufO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cI5CrIze; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ll5u/ufO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cI5CrIze"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qVJs2889772
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 10:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nD929g89ZCPAv1t5vqTauaakssk3+hyDU+nP/UUmTpo=; b=Ll5u/ufOibdVwuSS
	Vw2k3UCUpWQIXgX1OsJorgkApyI695foA3qEdhqJlcEV5Sfo90SLtVQcx0i8AFEa
	CPHYGUqKNxodvBsoXJV9vbuMx9o90Rns8hkiK7elj6bfnrMRwqdCIYghwCJmaC6S
	05cRUaQ9USzJ8BIRy4XPNEJLtUPGLCI4ypCVbrVHmcBPN7XZd2rB6iwxpg//ftEx
	Wwv8oZ17CfqwihU5s5uNcoZOXFx81dyJEecQ/dfqBoTOar5Ms6gukfV6pLR2BLKh
	5QZWZ6F3tlaDeFRbYqSQw/gYH6b6p01si2txilo/uO9WDPkkO6nolaQKw01K2B3L
	ckgC3w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0wqbj9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 10:52:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24cd2e2b3so114166135ad.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 03:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777459952; x=1778064752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nD929g89ZCPAv1t5vqTauaakssk3+hyDU+nP/UUmTpo=;
        b=cI5CrIzeoOfL0bnfJjfg98So01vSzkbbbGU1/pBSev5rHkv9nFHc8Mi+4Zjve6Pppr
         qOcfZnrvGX0+2A81TSYqzCCmZqqvWWAtELD0GJ7iEUa20pNZnCYpcMAPucgbId0ILVJq
         SLdEKSH9sX0yuVJiN1OV0NqbnZ6kmmhl4I8p7OqYR1dc/J6Fc5V7g5GEOWz9lNuupqxL
         fpZKEPbinpa5+u+v2czzgVyUxmpSyEFY4y2YNjNOiYmxge29YgLiINpDETbT1N1YpTVn
         JiUW5uUft4wlz2KeV8edIlgmXvTH52PdC48skc9OmhUedOxCunH7+cNSr7qI5WprrUNU
         RGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777459952; x=1778064752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nD929g89ZCPAv1t5vqTauaakssk3+hyDU+nP/UUmTpo=;
        b=k2FYyJUy5lhkjOVrCePlaVAbG7BB3zAxYaGOVzbgmxchEy1yn1Ua6myqYSKmdLec1F
         4u1lKo2Ou7xhcGJvUD2zCy5C4UCQpBroVtEhMCVOHmkm8w0KJlKVsTX/eL+VlVTF5Us4
         Bp/q0UZp0SVxELnnJw2IWZuBsbQTndjC9bsg8jFki8dgwzWpbEq5ds1kZ+oHNrImzHHg
         ZeGncA0A7cB8qBb5F+g49vn3qkaz4ti8PHk7biAXTt8rDYq6Ak3GN5MVkoxyZPj2We2l
         d3/+TESCn97BReBlMc6HFpwl5swIRYgrJmPy79O6E4bFhCLYKGJv9iZvyUjcyOeIEsW7
         Vp7A==
X-Forwarded-Encrypted: i=1; AFNElJ+IfR0PUhjlOPOcS0fL5h5vPGR2sV7y7KvjqAk0Cg0Z1xfyaUK797ItlQR4uPNrnOWlXv3HPwCqWPEx@vger.kernel.org
X-Gm-Message-State: AOJu0YykQPerYMPpEbwBJtnXrAXOVRBz26nh3Fcd9nNtzitIC98lgwJQ
	vGk//xuy3G8Tyf2RngtOIBV7pVYwul4aW4wKflt9fefQbeCQ7rfJ9x+fmwuPafD0RTHsDdUO9Io
	rAWgkW53nf0hHYvxgfAPMySRDGIqjARRWS4YzjvIjdb32MjpU6TRB01i3Z3nP425Y
X-Gm-Gg: AeBDiesHqinKfMu/mdqMm+5mXMtR977BRq0XlOWhIP212lO+mixRnInl4GLXyZxZqxr
	p6zfPNnh399C5hh3zbVLfIqoGr9y3jzFmjzWQHhNh+n/9SvO6Ch1VhH4uaBsPxoxmjQX4k2Ftjg
	Ul7P0pVKljPJB7F3Uv0ki4hDpVRuQ+t2KyG6HuJBRW5rqpI0GtgHKlw57e3OI6nOf2sZlA2rQRM
	hDpAFC2bh+gInBNhZI4QK3U1TIUnfuesZho+GgBE9BuWTFpEOTpAD3mWHIFY/kOybSLeqKoCltV
	2RjiO4sidSJ4G1YZGmiBpvEeNj9F7MB/QCzUQkIEBaiGOEktlgEmPAQ8mpeEinDlh5i5L9TASob
	qu01LuJFKakpHqB5OHeMcrpUEY0hyR59iVGK63e1eIqE7u3bYMTIwFLhp03uLcGA=
X-Received: by 2002:a17:903:11d0:b0:2ae:6192:8d78 with SMTP id d9443c01a7336-2b97c3df3d6mr68504105ad.1.1777459952252;
        Wed, 29 Apr 2026 03:52:32 -0700 (PDT)
X-Received: by 2002:a17:903:11d0:b0:2ae:6192:8d78 with SMTP id d9443c01a7336-2b97c3df3d6mr68503805ad.1.1777459951717;
        Wed, 29 Apr 2026 03:52:31 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988772e9csm18316715ad.9.2026.04.29.03.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 03:52:31 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 16:21:53 +0530
Subject: [PATCH 5/5] arm64: defconfig: Enable Qualcomm Shikra SoC Global
 clock controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-shikra-gcc-rpmcc-clks-v1-5-c3cd77558b7a@oss.qualcomm.com>
References: <20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com>
In-Reply-To: <20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: qH5CfUYd5Le4KmFF_lN74fJpso0jJd6n
X-Proofpoint-ORIG-GUID: qH5CfUYd5Le4KmFF_lN74fJpso0jJd6n
X-Authority-Analysis: v=2.4 cv=BfDoFLt2 c=1 sm=1 tr=0 ts=69f1e2f0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=kW1cseVQmWd4RU_XbDIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEwOSBTYWx0ZWRfX2+gLj8l6V2+3
 h6zzsdTrIHQvDJE+Ze29y63XLPccdbQEVJxZz9OpEP4CouvuHJlnP2rDJoWpOVqelmCwAgnkqFv
 KnuUZTqrCGTCw0ZwwpbxPeBF+5C+isz2P1So3ML2VQpV1mPNOEeVXYmi71sXpD7SuNsF0/M7/Jp
 Ok1wKkO3od8b2IE8WRA1VOQeegyJhg+TQbYKnNTwaYpQ8OgGEjf1BnZXTH9tB1aVQI2Rhr+pKcS
 k0muTkKHOpeQSUV6hKNFEwOp/TiLpDs4xn8OYTBdJQj6B2LIfx7nPQ7pxI28ECN3F4v4bgARId7
 XgFE1jhez5eRo4H5rkTCNT8gwwMVGvtUESm+s4zDZWOvGDWxoaVVBBVJtOQAsL5NGjlaxHV0dYj
 CE0rTVkawxeLTlDrnNTT8INehKgOHud3Tbfg+3glg0EO4aXP01qRkLLd7t66T/Xa63zRyKDwUuU
 43R68V283SonYwN85cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290109

Enable the Global clock controller driver on Qualcomm Shikra EVK board.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29bf631d517c38486f6896ffd82dcc9..13e04080b37160129ccd47b0148a64277b8e0e4c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1461,6 +1461,7 @@ CONFIG_CLK_IMX8QXP=y
 CONFIG_CLK_IMX8ULP=y
 CONFIG_CLK_IMX93=y
 CONFIG_CLK_IMX95_BLK_CTL=y
+CONFIG_CLK_SHIKRA_GCC=y
 CONFIG_TI_SCI_CLK=y
 CONFIG_COMMON_CLK_MT8192_AUDSYS=y
 CONFIG_COMMON_CLK_MT8192_CAMSYS=y

-- 
2.34.1

