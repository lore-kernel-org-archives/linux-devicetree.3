Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261713F39E8
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 04:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790051643; cv=none; b=hrFuhXFtro7od6Xpl7vd9pptIlbL3x0DSR4zQKOd8j5k1aq/8VEci0IucXA61GaFDmuIYIKC6/cQAGeiyBKUhkTUCh+Rnfq4flWYUxfYtTaxF2hyegmUrTtQ+jqcgzsr3CNA71fbvTtX1BrnCIusxpSJLCOXh6BQ728ySZCOhSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790051643; c=relaxed/simple;
	bh=WVV8y+rcjNFnB4LguK2GR1/TdwXx7ITLp4kAjYB9HTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FOVPhvM+xYPI8HVxcfclNx3ASrW/fSTSTZJEIW5tEqBFUnYzJybmQW6eepRjPemu+UlNowKMJ4qHrted4zuhgVd0ZX7BKAMPPvtd8DH3NO48MRJ8qncVwNYyBewNubMK5bqntC+NhyZIDgkOQiW5zhxXfewuMbjd1pNH2wcUwhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gieDcc6m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M8QfadV6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gieDcc6m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M8QfadV6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M2sLoQ3675278
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 04:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g2ZBm74Yk/Koo7aS1h6Sw1CThaL6RiYUvVn32kq3szE=; b=gieDcc6mprH9oWzA
	QJEYFa/Xl61jZDFJd+deo8QUOYCXKpXe2AtVLQ4uPQYt4LUqUZufnWvwh/Y56WSC
	WoYihXgTYVpQZYqL4sypS+QLC+uiKHcgdV3zTA5t/giGF9ym7qAWqpQ7yFC6ZYxu
	llLyB1e3n7f8lAlncbkz0sgGuLNlgGDIJWMBZxnb9AiNmxYm5wXfAEObPzeIN4ma
	8Y6RsONpGiFh5//d9TMenGvctA+T8YDDlw3IlwO4KylxBcYkA5AAY32ZVM/boVgG
	BDe+k22z6ZFNS1v87izVyEIeDEqERM14y/3YEqjXfitHbGK7iH8GJc3snMd9hB4K
	1uY1CQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guha5rach-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 04:33:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so12047585a91.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 21:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790051638; x=1790656438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2ZBm74Yk/Koo7aS1h6Sw1CThaL6RiYUvVn32kq3szE=;
        b=M8QfadV64sEteaLZkZEJzOf7w3b4jNMOvp9cFVtrZZxLAsfJsCaX3e6hJ+BMNLWoKk
         hU4szbm4RPrlb78LC57Y9IcnsRqpqA3R6O9rwZhAj0sch/1zbS03ZUD4Kibl38H2CD8N
         6eFzaAh2VOdOy3WHzMulQx8JlIuk5PEpdFo8lejsBTimG1UpUy8P3uK9OC+nygSlV3VA
         fEtXgr+j4OcxopvBwG7TYzreJaD24Cbdg3wTHmxDRGyL/LNLeDbTWBVMmYANTETpd8Ii
         aiMN/CajCADNvwLmY/+VIb8APjyWHy3+2RstIwBBfNjk8HPTMbooTZyIELyUCKNF+6EA
         yjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790051638; x=1790656438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2ZBm74Yk/Koo7aS1h6Sw1CThaL6RiYUvVn32kq3szE=;
        b=Lf5olVM2h2Bm7xa3wp5f1Q0KibvqJ3NpMUIx1E2tADtjtD1JxThBCSSVYcnYxHDc/K
         1YPTZ24cUHYGHEkr7L+Is82pfR77xxnCjBS31P8W6jlxIB9l46ZskEbgZeNV1/l8KMcx
         LQdKzbSNhyJaTDQsXvwURmxguMv3bS4Fqr+e3PA45Kgna+kcgbYbSM8Vo/3yP2Y4rHH/
         0A7KzizFUN9R9SgDe2M3hmcrsgINVNRl7e6YLbAhee0MfzI89wzKSaKfIk6M5gHZAytn
         tifGbDktUEP3QfSODN+CZcj5QhTyDQ6/5592BJR3rLGDrukxmOlPenrknL7kiVeRWKS0
         3c8w==
X-Forwarded-Encrypted: i=1; AKwUvBw4rFglROGTb7lKTGykao+16LDnz5SGMHSOqgbEUcTPtjG1+LIRSviucLzTc4X8fU1p+/xKi8Z0dkO8@vger.kernel.org
X-Gm-Message-State: AFuF++mwNPjy8+biesSOkS7A8GQ/+sqhSe8J/oRXpddGE2ft6MXtW1bV
	0TQ5e/llNAwNizlLGC4PqmrWQD7eOpQEJw2oXJhwhV09tssByNG/lAMVXNh0bpDyrGM3VePeELo
	sHbzdx0OARZpTZE9cnLRmCxykTT9nS3j+eVc7vvXay5Ko9IaQTsdtuW9dJUaVtoxD
X-Gm-Gg: AYBFou1aHmBz+amT4JiUxvLPNlW5B8Y/Q9zZlnwCGAfrpADwlyLojsBaDrTm3ADqeCD
	JTZWNGE5G8r/RdkF278+E6aeVTUgj8B6dBkUuOTAmPOHnDwjBJVZSZhjIWReFSpj4mun9v2aUai
	zbZaAf6YXABdH3xf5jSc0I0LnslRTCazq7VANyj9gqDnAiS/4zGMAttw+1jyzV4QaJyky2JimLh
	1AZG99rXu3+2OtSpBSdg8BreBOGFQdbKBV5+b+shpz7XBSyryP1+IvG0TfNkrAcMOkSKwgbcvdS
	41Yt+Am3srqdIK22OESNluuMXikq/e33oF2HsJv4JeB/3LcXftgnjKDJZaftsJecHn2P1nEvZ6i
	D5Pyy2Won6VlcIb2AX3fosiB51sz7GuY+dNVHh8AtBFhrW1RF2s/HtWQ3iaoeOSyNFOWxPJQltw
	pVevITycpTyH6SE7/clbZqtuUFqUhSX4KzHxE=
X-Received: by 2002:a17:903:124e:b0:2dd:c100:313c with SMTP id d9443c01a7336-2ddc1003224mr123612615ad.56.1790051638378;
        Mon, 21 Sep 2026 21:33:58 -0700 (PDT)
X-Received: by 2002:a17:903:124e:b0:2dd:c100:313c with SMTP id d9443c01a7336-2ddc1003224mr123612265ad.56.1790051637903;
        Mon, 21 Sep 2026 21:33:57 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e6129ad40sm1906375eec.12.2026.09.21.21.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 21:33:57 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 10:03:16 +0530
Subject: [PATCH v2 3/3] cpufreq: qcom-nvmem: add support for QCF3211 &
 IPQ5211
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-ipq52xx_new_ids-v2-3-4b1a0f3d04b2@oss.qualcomm.com>
References: <20260922-ipq52xx_new_ids-v2-0-4b1a0f3d04b2@oss.qualcomm.com>
In-Reply-To: <20260922-ipq52xx_new_ids-v2-0-4b1a0f3d04b2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: DgyOg6tNrdlbnXHsHn9ohsaUMsX7Pzxz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA2MiBTYWx0ZWRfX90N7/WrfpSBp
 BpF6BH73g/hlbt6QdVwvDGZ9QqlhH2t9Nl4Y51AEkgSmw75m/zGkCE7YUC+mByHu4n6iLf0/zB0
 dmvQddez+E4Tlq/gwZwK01oO1u+m7NE=
X-Authority-Analysis: v=2.4 cv=U+4Hnuru c=1 sm=1 tr=0 ts=6ab20537 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=y-kxD1SJUMLPT1neuUsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: DgyOg6tNrdlbnXHsHn9ohsaUMsX7Pzxz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA2MiBTYWx0ZWRfXwjZV9A+Z2SYA
 om5lePhlxeDjSZzMph2jHfmSunly6Yt9UAHTgeP84tLeJEW12AixhS9hoOEJMKGwK5dZvQz47pe
 D7Q5TG+/koHnzEyZCe/hRiTNiyaQ2um3lWGn1jw7RXCfmI+PHDPtC4FdAQchJMSa0H8B6Vn2caf
 k/3RbNBCz9ne8W0S/FpaT66/tJVYwcdHrhqn5foc+jHJO9kBE6vP5S0Ly/Q3hRfbwg97cL0LYes
 QJbDNQJWjDs8VesJv6eB1fcjbcudF2fC/KDcl37dNLBdjRQlmcFK5OrfN7ndUEzf2BurnMxVlYk
 8YHhtP849+HjmY14xtNwkZVFBUWucgdT75NCYT8119n2gegF4LCZCLCrbLhSu1KAlYyXbT2dBEp
 vWwYJcriETOY4LpIzbG++892pmmnIlSjXHgcLD8ZeQSepwGcshdbbypuMIQcSF/BXYOUKSrffXZ
 l3YbgnQshfeBGN6m8Fw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220062

Like all other SoCs in IPQ5210 family, cpufreq for QCF3211 & IPQ5211 is
also determined by the eFuse. Add support for the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/cpufreq/qcom-cpufreq-nvmem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
index efa766e98d86..9f2e6e6c0905 100644
--- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
+++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
@@ -205,6 +205,8 @@ static int qcom_cpufreq_kryo_name_version(struct device *cpu_dev,
 	case QCOM_ID_QCF2200:
 	case QCOM_ID_QCF3200:
 	case QCOM_ID_QCF3210:
+	case QCOM_ID_QCF3211:
+	case QCOM_ID_IPQ5211:
 		drv->versions = (*speedbin == 0xcd) ? BIT(1) : BIT(0);
 		break;
 	case QCOM_ID_IPQ5424:

-- 
2.34.1

