Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6940E39657A
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779172546; cv=none; b=lav27GH5gknkfUT9M6r7PIg5ee0JIyOmQzjgwqTW7ohAQ9jqNo31ZX6H2RoJORoJlbAPADqWXBCYT+tAV9tFft96yKBO9WoQLc9AluM81zzE5hvz5ksr3IqJFCSK81SGSnShMdWHjGBFXLkx0FflQQDOjWLhg66UZ1FVfiesTCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779172546; c=relaxed/simple;
	bh=pe7UzcxfU06eezrl9Dda4KYQlU9VUYtnry/wytvwyDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mWlIvLt9LBA7KPiPWx0snT5yxByLECUsjbLmHKrD0/Lq1Em7tB0om/xy+5vZFeFnyzhtTJYBjl+pEGQ3y4GgfUsA5Is3MMw85BZ8MOD68dd1y+qM8cM/k0V/aP5+ptJcNjgsdnEFuwfiVNvR2YJejheapdJr9/juJWREukHLe38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YXtuUQ6A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NYel2NVH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YXtuUQ6A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NYel2NVH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5CHZI1250942
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:35:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=anYxvu5W0r/
	rDvXM24K6u7MxX9zy3DAVGlYV6dijd4Q=; b=YXtuUQ6AISbIFU9CXuPckfR+UVF
	DRvGAbgE710rRCd4WUKVHZ0sMHZd1vn3+Iv0+dMecc5GrA+MHdsOjegUXM+Fd+k3
	gQ+B9fkhfxchzM7WXqUg+/oKypafbEVE+3TkntzG1ADZcliw7BpnuCFKR5JpK+g3
	2HLm+1QWToncjqUIhY0kKs59Y00Hqfrqj62UFioRFEMb1nC4/sMCP4epjIQ7J3zU
	2MhS+KL72gMC3DclNg8karsxlOdefmiHf0y0v42R3Thcr+VBIr+G2EOYKy2LsWgC
	oWYlAnND8FrFwsx4gkIc5A1lpHYmtnqq2o8ULY7tu4bhtSOxKDUR55EyNxQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82c0krsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:35:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-303b38ec2f6so4348490eec.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 23:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779172543; x=1779777343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anYxvu5W0r/rDvXM24K6u7MxX9zy3DAVGlYV6dijd4Q=;
        b=NYel2NVHL2V19nDGmd0TfU2fIFGptTHWLEK+dJb1IJPuYWrLxsRIqMWXCHeczqH8i1
         J1IF7zeswCgT8/GDuu4F7T33MT8iuFMXEVw0tZwTDDdGNQcgG2FlZ+edGwJv99suD/K1
         JzqcCS0c6OO/LAWsi7/1o9Sbs46wDB5HCN2E5CBeNJDICzYNFY0llLI1Rysm/4P3jS8I
         5AGDNOd/h1C47QXT8ZzqgY5kQxNyLXk5XmUJBblDxwCDdUFDED47P/zDvTrbwMr4/BOt
         DlOJeoEvT9+iOXHKrEgvin79ki2AVWKIW1OWDdsHNr8ZvKkFLKtmdt98pGyRomUNIDL5
         aIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779172543; x=1779777343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=anYxvu5W0r/rDvXM24K6u7MxX9zy3DAVGlYV6dijd4Q=;
        b=LKMRmzQ19+0Blyr69X29rWqU2YuSmu8sGnRSqfyYkBBEynLN6qQaMwbpOQe3JQHMjr
         +nkzg8efMPypl/712hptd5TkS/9yd9CxNZGr62tjkk7eWLofYViUV36JNkPM2OB1bT8M
         SgTkqb34zyBilgp3RhRO3Wj3y94CvbBNNPEtGl43bUTiebD1Li2UPDsLoo5NQEXf9vUY
         awcWP4NogluNNbPtd30dd4K6xLIQ8PTKr+QWqZccrUrJPhshpETEFARA2+bId9q2qw5Y
         1AjLXQBoz5f4F8rAIO2i/p7MCGP5afcrCUBXudNKhTNJblNMzLAPiBWdKoGpXw6YVky8
         YEkg==
X-Forwarded-Encrypted: i=1; AFNElJ8ifA0t9IPcziga16uAdJWnwVqVHny9QbTMWKyv9S7bM92TsZQLzu1GEnJqMcArvjIhh+6GtADYcBAX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3MKXlKdwDwX5Zo/gfraqWCCTnCLt7FY0fU7TJeROEzM/1g8PV
	+1kVfuXo8BeUcSzEVyor7i7UfQ3yW9skPJaQ77WmHylpYbH1xhK6amYj6sahYbuEucV/+f1oeKM
	B8cMmjxVhGBcmXDh9hInm/SxCJyqK4bH967fL0vXVQgJ1qE+rZAxqbOkxbOQtBZ21
X-Gm-Gg: Acq92OEhxE3G5vGHXZ7CRy4gjYpwqAqQ90ai8wLmQOJqZxa0CUrevstA8g4Rw8VkGt7
	6HgWjLhXD5OP3usxB8fpIbqwHJM4s6gS7GoePjc0sU2apqYi8qeRgSnTVmvk15Vd6ILsA9TucaQ
	ZIuVna4aCymuOp47WhiYoNkQNijmnqib32p78rLMKnXz4vh8g2EUXtjBb2AYyLkgjJMqGu5Tqmy
	1QIA6xHOOyPO6SLdQbAMmyU+nRSnP3+DfvJhMtVNbJswVzKJaUSnGkqPp4nne/2mAzlLx4ancfN
	i7gsobahdV+WyDM90dfukmw2ZglJ5sd4TjEy0+x4vDQ/yLZvPVzpHf6T+pbfTsvCmvR1yfKK00g
	38/V6rNA9aiSOBnqEKaeY2eOMP1Pz8cxWu3bQGeQ8DwsDan9dGgpn0obBplK7UXcsmV8wx6ZEjf
	BTUGGfkA==
X-Received: by 2002:a05:7022:402:b0:128:d3de:c9e4 with SMTP id a92af1059eb24-1350553acb8mr7625090c88.30.1779172543015;
        Mon, 18 May 2026 23:35:43 -0700 (PDT)
X-Received: by 2002:a05:7022:402:b0:128:d3de:c9e4 with SMTP id a92af1059eb24-1350553acb8mr7625072c88.30.1779172542467;
        Mon, 18 May 2026 23:35:42 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbdcf140sm22614537c88.5.2026.05.18.23.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 23:35:41 -0700 (PDT)
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
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 3/8] soc: qcom: socinfo: Add PMIC PMAU0102
Date: Tue, 19 May 2026 14:35:00 +0800
Message-ID: <20260519063505.883379-4-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA2MiBTYWx0ZWRfXyrd19AUJTcA6
 F83SshdnRIRUu4TgJOOWbehdIN+Xmp8sRg4tnSd3C62poPyuk/jXKwMNxtLqpDZM3iz8BUBtbnu
 4exgyAAgJVHcWH379RrD1u8j9CisqXbQW+DRSXRlN2qUSSW2rNXfAZ2h11Bwfs8EdaKSTBbl301
 vJ50wP7nCd/WFOHXvya9xfw41zNwC5XUlDZ086JPDcRdNVRK+GoBLoxXWelT69otieHOJtjQkn2
 jwc3Paen/ZTPrbnmN2taDaPr4Y1Jqh5dtFScHrx+JnQXAaWD+CLa2IxlupTi9ThRLhsPLZ6qJmP
 1uPAzIu0TuOKK6ZAI9w7ybK6nKz8q9rzDhgci4/JFV6mr84s+aMmecUn5Kd/8og4Phpua/5LuOB
 nNwnlhQn/V6xi83mJfgcP8ybdYtTyu6vhg7l8k+20fVPKx5LAB92jC6y1QAElE44f77ad0iENgE
 UphnJooQ60s5CrP6zFw==
X-Authority-Analysis: v=2.4 cv=A5Jc+aWG c=1 sm=1 tr=0 ts=6a0c04bf cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=V5oRiDBFaZMDcuiOaXsA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: nj8lpOfepxe9kv7OiPnzb85EpRHQodj4
X-Proofpoint-ORIG-GUID: nj8lpOfepxe9kv7OiPnzb85EpRHQodj4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190062

Add PMAU0102 found on Nord boards to pmic_models array.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 5c8bd29dfac4..ef29d4ad3c7d 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -194,6 +194,7 @@ static const char *const pmic_models[] = {
 	[91] = "PMIV0108",
 	[92] = "PMK8850",
 	[93] = "PMH0101",
+	[94] = "PMAU0102",
 	[95] = "SMB2370",
 	[96] = "PMH0104",
 	[97] = "PMH0110",
-- 
2.43.0

