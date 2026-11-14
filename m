Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794663229;
	b=i3JH6pMZk1weP99a0xcVkgFKyt1DunVpcFWOpe4kTpnEkfvLkbO1B3tce35jkF3/Togz
	 UPhOltMOaWAvUtxr3swd2xYJW6zxLwS18qS4bWSw9NYaaobTJLfFD8SWo1R2tjogmOXRL
	 oJ73AVHWx+qbJa8WEF9T1myqwAM08XnMSvWUr9ztvgXnwdnG7AkSjl6u2UsZK6UliHPgE
	 p6/oBsRTlJUj5q+XwB2M9fZksJBMqkJ1TGxm9Pr+/WqLIwaO9WawdzeDYsP00toriBg4Q
	 +t6NTxJptOLwXPRdmDJ6s9UgvHdsrTw7C4hnC25nAFjiCqIy288m9th5tygElE2VBuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663229;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7rjRjbUCbBEYBTu1h8HP42axTTj090IQJUErwaGJ3I0=;
	b=klkYQJNLmYZSjzUyB+EUehKFL+7vSocoRxieA7jnY+oBILof13jPEasYzrsOKggBQLrv
	 2VqdXmnoqR+PR7v1iV5FfRIZ7qht4qDbDlI72X3U50OWYmeObdvHkR6uLhsF7gHeXdloE
	 uuPgcffRhukqiObuS1bj2fbsZshTJxCtiWaVKAShDcVZ3BNPJ9THwtotBUXze+vbSd6KC
	 Nuk6+5cPf6n6dIjzEMq00ZtwEd6FDnOUsDdd0ldgx0RVaQvmpr6AXQh0jy/c5LqoW0Qbj
	 sxo/bkAF/DtZXxW0ZzT1ECvsCd6mPADW41cDKKqAxT1z9yAFE19OeDinV+P1VcBhWug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G0jg0wOs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I7wXEufy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C32606A88E
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 13:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2C32606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G0jg0wOs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I7wXEufy
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wdV01089381
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 13:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7rjRjbUCbBE
	YBTu1h8HP42axTTj090IQJUErwaGJ3I0=; b=G0jg0wOsQwALK0I6fuaxrUZqtF0
	kFrTDzQoEGgsxyJb5bqP4NFVV5luZKBpQLKuHtBqTAIqipRn4/yCloo3dQWhV6+q
	okeBZ5mzCKd00pIh758obnvtrIwQcGvf05sYR4vHafts3yHceY7bth5/NxEQWfd6
	PHc3eCdhIN9F2DAH61VcRihlWo93PPrx1yW0TN/6pJFnVOcp21T5q6GmkTDtL2dE
	pohaw+CzMhi2biEd+Wy5Fu6gNirvJQkvDhP/scrBsC4XpqJneLyX6kv4ZGOCta50
	V9g1jX0Fs1GrUq9wz+UwFgsisi4xILG0rzJ3pCkKeChQnstIhD+D55rKL2w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhm8rtmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 13:33:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed077a15c3so15351345ad.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 05:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794663227; x=1795268027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7rjRjbUCbBEYBTu1h8HP42axTTj090IQJUErwaGJ3I0=;
        b=I7wXEufybj9XjNfo8H4l7DitsBSJBdwTOKpNqc6vg6aucV0PWvnZjAv/OEXJ5ZaX3S
         2OMbgIdmEsXKNn+1QFZH6ql44Jrbk4t6dk1cVzPUBrl1xLKYqKzhFQyCk1r6whO0bJVA
         BQp1/6J6nal+k92jzwp/BqrKZOOfSuZpSC6UcmVMvhzb+UB4LyKX/PTxvH1P/69cccKB
         Z3YBX87oSufX96o42WVsefyUoJY59jD42L6W0uNlqlAizSpbpUI0gTI4aIb9CTT8yvDI
         2KYLoKTuHUl0K1Hso0K1EBOEXo0ortTa3sssAiop7mPsXVRkzL3CGQjBv11bOOaKUKjt
         3Q5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663227; x=1795268027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7rjRjbUCbBEYBTu1h8HP42axTTj090IQJUErwaGJ3I0=;
        b=cYnTa05rD3WeAjQOlpFKeTdHWZyUx6Jt7O1QaZ+6+WTf/TbRHBvMxbOTJZQqEMNzAj
         HlbX1o58Lp/kuijafTSAhQ9NI6Khiy+7aTtv/jm2P63kMqnuzxKCk+WV2jU2BhE69+zh
         Xd6wCnTg8vQ8o5dPEY9BhvqCjNzGlNRj6caKdpMSH6SGudbrIzPrwwYcMKtKEk42IbPc
         JQy66yyrunfFL/ZFi5cD3HS7H0SwqCG335y7e+YsU8BYsM5ViZa8pWz68WwIerdOlxkZ
         6+P53ic0TsmK2AoOwwBnHNLOoYeVRW/bUQmJ+TUdRo+oX2CqJRbW9A0N+GDt7IN12CXQ
         kcwA==
X-Forwarded-Encrypted: i=1; AL+hErEGwiFxSxguxTFA1uTgO2rxNkb2qIIi8EeywNTMED2ysmBuaRVd/5AksoY16TJqvC8H3CRshsiCl5aK@vger.kernel.org
X-Gm-Message-State: APuU4Z+LAGAI48BkVMUUDRjrkb0nOV8GW3pabwq3RhTGDCCrJGt4fB+u
	KYcHsJJcyOK9zb4nVJFWcz71sg+TVx3o/uC5CdbgYyVh5nw8Hnm9MEulUa2rhNxXFWHlZAkfCe1
	nUDqfIIMInJYLYBr2DVGIShqWrc1cGv1I6Fyh/bh+OoMzA6T3Iyd3imGVb4Enmgrn
X-Gm-Gg: AYBFou3iMn5RUodSKeYKQjIVP+4W2h1oPHjTm7RDp0d6mgBZcqJfdR3VSokAEY2qUO2
	9P6DVMtfPqftXaQqa+4tllxq/Tur388CiQpQi8e7h5IZumvi2Goq/Pfu52lzjPt3wUfq9xfV/OW
	GkwO1C0Ixzt9DS6dkiT/Pxeg6G9MQ5D/6xEtrQnIapl+YQFE0xY8M3XJLkLo0gtYlj0So+m5JSS
	Ujq10cVj63wPgh6bPgm/e6MKFd8wJheMfz447GeLJRFUqexfVk6rG+OasyYflsY18bkf50VjFc6
	pTWFTC+bom4ZxXXxfIH99rYO95ZoJRA1DLUCHRs5UOPecHzEbrDuUkoT9RsE8qJ0/Wo3+wapZut
	7Bw+aWKouN90KAHCwElBPM4DGWYsJSADGqjgrO+nEwuN1eG/AHghzLaRtbySBO06JADwgSMBMQp
	TADEvfSjRNjCZ3IG+AjRZqP6cNI56ZhEl7+7eo
X-Received: by 2002:a17:902:e84a:b0:2e9:5ed2:c3a3 with SMTP id d9443c01a7336-2ee0dc04d6cmr52558165ad.37.1794663226596;
        Sat, 14 Nov 2026 05:33:46 -0800 (PST)
X-Received: by 2002:a17:902:e84a:b0:2e9:5ed2:c3a3 with SMTP id d9443c01a7336-2ee0dc04d6cmr52557975ad.37.1794663226156;
        Sat, 14 Nov 2026 05:33:46 -0800 (PST)
Received: from ap-kernel-sh04-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8eb275sm20266965ad.64.2026.11.14.05.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:33:45 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 4/4] soc: qcom: socinfo: Add SoC ID for IQ10800MD
Date: Sat, 14 Nov 2026 21:33:04 +0800
Message-ID: <20261114133304.989635-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
References: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=ItKL47/g c=1 sm=1 tr=0 ts=6af8633b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=0mEx7QAgp8bgaAyPUFEA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfX0A6tXhUi25KI
 LLfJ0GKuwl7u/OJ+ZURBehcUEPJzRmcNbB4+3rSdprD7lPz8YOjEZkGVzXfDnE3DV2+MA34YUOX
 gA7Fvu1gZixE1MhQeihPI/RIuZBFzDY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfX8TMj88YKcOjS
 8zzfDJvMzN2zxcsa3xhShBZ7teZZGPDnDfa9BlNzuaK4LdCVt+yilI28QP6p1ei9Hz9zZI2iQ++
 52eLuQ3NYlWKhbMUywRZjG5jKi0rhFdd9q2fC8MfasOqn9q94y3Z1aFfJimdjtHVMHY3ibt8Be+
 AOxEnJuQGFx5IHIhxfBBYdM1L1aEMWdJ0z0lTNMWkup8Hcr8KqQqEF9aTaQnHH0GpcR+/IeGbbh
 0N9HofOG/hGHP2BUGbsXrJpXfrkj/7zFr5j/2B6RGY/lnTsT6q5Clus5W6qy1wh0VwF38rLcYaZ
 62QEXANJHJ++BLLjz57I7oij+M5VqbhE4xpHuagmItnKvbY1x6N+LSuEiDORYFDdbvw+P6CGHlr
 YesmvYb8uW01PjnA/jhyFMluExd2fYhZl2SeUG8K9+YVDdHmv7Wprs56rSnjwZ3GLR46SC4UHH5
 Snfo1E9ozIevLYoKq3Q==
X-Proofpoint-ORIG-GUID: NySd3vRD4GDDybPxKrTw_OtIS4I0bocA
X-Proofpoint-GUID: NySd3vRD4GDDybPxKrTw_OtIS4I0bocA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611140053

Add SoC ID for Qualcomm IQ10800MD, the robotics SKU of the Nord SoC.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index ecb4369fd309..950b5c226f04 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -561,6 +561,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ9630) },
 	{ qcom_board_id(IPQ9640) },
 	{ qcom_board_id(IPQ9670) },
+	{ qcom_board_id(IQ10800MD) },
 	{ qcom_board_id(QCF3211) },
 	{ qcom_board_id(IPQ5211) },
 };
-- 
2.43.0

