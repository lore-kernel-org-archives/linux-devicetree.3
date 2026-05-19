Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF3238E124
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779172541; cv=none; b=pQqrVMg1TZIprj0GZXHMs9rd+tQ5NTyTcOv9shq37PBx3JLI0J392WfZX9HH2Ok+BIfD6Nu/twljb/brDT6Eff8OeiditMnAYCGubofuANp+KKpQ9mNj6nf5Fy349WC3jFNk/37f2d6NALYG8s9o8+p9Kb4BfPj9Agn+RxcRd+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779172541; c=relaxed/simple;
	bh=yX1PEq6+u3liF0g1QBiHsM+1HQ/wuFQsjt+XR4j5MtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bUyjd8da8mmrX+j9d4jbtcV3lVKPu5Wv+DjjseBZIguUqrrRvbfaXbsd4tgQBSTLB98xWgmw2JjHUDjOfJZIsAzKsF9zzU1+C3m5tlTz1mU5wTD4SxNC+fTdgnSIRNRnb+BYG5cxtUqb+QfA1FYYAEj3rZimKES6m0pBT29xD0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dX9UOg9/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aFMWV1nF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dX9UOg9/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aFMWV1nF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J0AYNa2975395
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CMm6miRDtCo
	nBCii9eCSN/fChmidDMiVAp1SA8CHD5o=; b=dX9UOg9/QlpMegev4lgifuBlXVA
	DZW2Tz90OG8Rzl5lg6NuFTgpXO+0kQBcRe/AL5MQSsyx2Jw5xn0biUqsL7McS8Bs
	Lrq0y17VH5VSdBpfxooOvfe9VXNEWpcAUwjmm4nT9oQEyisERYq6c/hOctxj8SzG
	e4HUmS1fiRoyb2mGoPT12eW/Yj3j09AmZfxkVMW93hdIymDlF+QCIrTpR349FXSE
	Aa9OmFpQULytJ1Lw9tIjivRlQXWLou4adLuzOk/lvBAokE8djB1+W+n0V8OLW6z0
	FGZh2lfoITWudQGllJvQbSoP4p+8m71/8T8Q7ETNgBw20vI5fM6VzG+e4Og==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e84v4aywh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:35:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2f1383b7439so3187819eec.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 23:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779172538; x=1779777338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CMm6miRDtConBCii9eCSN/fChmidDMiVAp1SA8CHD5o=;
        b=aFMWV1nFDnAzbYlDuX9A4/Nrut0/VrBH4j2OwxQRmLnIase0/W3jtSLH5oF5HFP5Fr
         469qwdjv4sDA0/5TtE/sVP55lO9YJ3FirF/qpmJ3PAof/oJf/AVvViCh1kzgPoz4XZTk
         MwDfMuwMcqB12dqBVHVnL9Imhsk0z7K6+KPyv56Ra5a803qdbx4dFn7w17XRPtdzf9Yh
         P8a2aBKlXrnCarNIwsyCovMHuDFVUlhdCwxmir/oz2Ti8u0cAr2y4JbIZ5qjKUJs9YDN
         AtyTCbz/8lz6KnF8ayuPeRB/EoJpvS9PQ7BhdfHvYTsvhQ7O6OEQaUf1Alsh3T6sQEoI
         e+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779172538; x=1779777338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CMm6miRDtConBCii9eCSN/fChmidDMiVAp1SA8CHD5o=;
        b=IIvHG1lKKZeB8Lh74rOYdfuvrBhA2nLAgIeDekWJ3AphvpLF2A+1kakQylwfoU89VD
         zlFvoALq/az7SvpU6tkQqjjHBZ52qcEzF7aImbOsjP68q1Kav+MU3jFF81bFkYJGwpwB
         RXSNXmnRderpQMpETh1KQ5t1LGv58mwCKjNU5sl2mMaRlaM+tRjyXecZHoFVEiw8J3vl
         +OJbhPGgS7Q9ng1EI9n2yZdL2YUYwZTsW4YeWUbOrG8OiPJsLAn/zeQEhSLgyjw9cO9M
         VTOmy94nst6rEIf6AiUmCwHiXvpZZd8kyl1A6b29fRMby0bFDabH/gmmwDdfSf4/BOHy
         Rdqw==
X-Forwarded-Encrypted: i=1; AFNElJ9oifHo7oCbK369GcLg/lzbgowfM03xuLOU6ZuQ4WdPuVSuz5F2t6QQHxFzdeYHdsGV5e/nuULSB3eY@vger.kernel.org
X-Gm-Message-State: AOJu0YzrOmFU9MxxlxhzELhYF9kJy5uJjrMsTsvJu00CgtP7NPwdcOgh
	J//FQ+JDQpI1qajUpJIbm7L7QqgzMXyEZf5EZkBelqx7j5T2tjMVjYXqOr0q9AtFTJ391Br89aR
	D7zHOJrMEd69ZwEJURUuGXrzJouV5ZQ2fWBeLt2i3X9gOGv+dWr0EkOiiisn9DKvY
X-Gm-Gg: Acq92OFRbmruLkNZh7ZLv04lUPTGyD5YFlFQ/uVwfeRWeqy3UH13VAsSz+sSzdVFaQB
	bTISgQ1CsE6OJSmVFpPM0cF9bO9brq8cdyZ7ZgpFOMBqZvESznN1xlq3bZeyFQD6IrPSBnRpuRJ
	U8Fr7nkX1tI80Eh7CR0+y3U70V8HEojD4OwFA8tGtbFJMzTQH/n2En0z0LQGQ243EfeCrSMc3oQ
	gF319ieH5PoQhlif8o7LIlrIDvE6jp3IoSzSIFt0NkYlSwSn0/OguN2cud2BVyLIkueOdfjipul
	xmpJN83wNgeeXscdEO/m5xmY0oTDVMAYfqPBTrVdRpWWi/EHM3Cnd/GI0OzWCt7WJFodU8vkveD
	gFgQzw5YK/0T9/JqzW05gicJezvjO3vdwf8a+qUDH21toKpTYL33w4is0BS4NDro0KDhBWTyi9i
	rXKCOVgQ==
X-Received: by 2002:a05:7022:ef16:b0:119:e569:f874 with SMTP id a92af1059eb24-134fffa80b1mr6635388c88.17.1779172537941;
        Mon, 18 May 2026 23:35:37 -0700 (PDT)
X-Received: by 2002:a05:7022:ef16:b0:119:e569:f874 with SMTP id a92af1059eb24-134fffa80b1mr6635372c88.17.1779172537325;
        Mon, 18 May 2026 23:35:37 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbdcf140sm22614537c88.5.2026.05.18.23.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 23:35:37 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 2/8] soc: qcom: socinfo: Add SoC ID for Nord SA8797P
Date: Tue, 19 May 2026 14:34:59 +0800
Message-ID: <20260519063505.883379-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519063505.883379-1-shengchao.guo@oss.qualcomm.com>
References: <20260519063505.883379-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VJPtWdPX c=1 sm=1 tr=0 ts=6a0c04ba cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=8lSouUAgmXO8ZBFbqGgA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: Qu_pPRWL4UTZfUnhWN0QJx5uYEaU-EVG
X-Proofpoint-GUID: Qu_pPRWL4UTZfUnhWN0QJx5uYEaU-EVG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA2MiBTYWx0ZWRfX7dK1/Vg3Q6rj
 GL1M/xk+vlv1ZJ6lnirCFjkI+juviCR4ltGh5xiQIETyOhZr1djsO94BSJsb3Iyz64Ne5Rs6Rzc
 IQspp0ERmY/6Jlq/CmhNjn8Tiunb/Gh0l0vCFu9o1mnI6ifyEMImMMCTA0ZzUfwNTbJL7bVLeQc
 te4TtYehYpKHf6aaDuXAF5vnzFo2AKMCAMDBjMeONrCmjTurlx07xEdiO0eUKnn1V2Ao9mIdzKy
 A3hudi9g9biaXcL8HtG67jIpoiZPFIao9i0UBJkARE2lgXjpHVfStyPcmkDLdvqEkDAdCMcyZM6
 5OOdfnTHw4JkGTqXfJRkDj0wRJXb4M+K02PM45ShkJvwCH0GDFOoVY1ZiVQSh5ysyKzNCwdWaps
 z8q3jFXL5+sv0Pp5ZjocnCWiN0S1axcw1on5yPYLXhn1yTc1eaMClDblBQN5dUDNFf4RLLyRsBQ
 5Pv7/vDMEWkPc02+g1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190062

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Add Nord SA8797P SoC ID to socinfo driver.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index ef7074930a55..5c8bd29dfac4 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -535,6 +535,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCS8275) },
 	{ qcom_board_id(QCS9075) },
 	{ qcom_board_id(QCS615) },
+	{ qcom_board_id(SA8797P) },
 	{ qcom_board_id(CQ7790M) },
 	{ qcom_board_id(CQ7790S) },
 	{ qcom_board_id(CQ2390M) },
-- 
2.43.0

