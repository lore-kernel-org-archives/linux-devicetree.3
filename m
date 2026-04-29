Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2ED3FD147
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 14:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777471821; cv=none; b=Rl2xvwqNN1ngVt01dvIXPDfByH/7lviSGFf2eZTckROwatk3gVT0grVXExnAp5n+CotODLPYXEx52robAvLsgQP5MxpORFm7OU+SN0+DCSiM8SRe+POJ11GfrI62OUyPySdPvaKSpvm8/rcxX9p2RnCZjl82qy3Yi0TqfR6HqLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777471821; c=relaxed/simple;
	bh=XtDgh9EmFEUZTFmmIEWobw9+f5N/wS8Pmul7XFNhQBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K4Ksyh2XxJSxVfQ33qzsneJVLBZoOURFcfsHY/rXTs6XwJHXiYvoV2Lr5AD6VcRd2qe7kh3+4w1Nz1stXICkdjjyZBzlomGp3oMxc9S9sUDk5byntqZ8mLtxM6XWO/BCol8HkMLM5INOMDPE/fbVFOaiKIzBGLMCZx4nxMcUYVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TaXepd6Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eergk2Ga; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TaXepd6Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eergk2Ga"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8psMK2094143
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 14:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ysp1U9NNqTsUxNFeHUm82oPmQG1qVjCig1cIpSv7JdE=; b=TaXepd6QlNhhrcak
	L8xgyWvNk9Jh+FeNoy0q+/CHcX1U2NvqwsoTz57sEZfKOcKmjQxhS0avu6+MnGoI
	AKTYTHlBrKUzoMuTfsVfIw1svIf3Yg+uUfcC0LX60SH1deMZWNijQYyjubECmh9S
	Gg0cca2vtpb22diJZMDzgTVje3jGQAW3ZkQRG9A5JkY7loEVIh41QZcwKOHVH+q9
	Zn6r6479IipXLKvAM61lDgAPnEuBuZCgWAqeywmbmpyb5zChAnOnLFLlqjanlowM
	LrxL3nvtce709vj9LorimgudFqVL2FExMIxpKsc1dg54V/nUX9uTfJomQ+0m8lko
	AeoOpQ==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dudh3sm9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 14:10:18 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-657e42cee12so4303971d50.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777471818; x=1778076618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ysp1U9NNqTsUxNFeHUm82oPmQG1qVjCig1cIpSv7JdE=;
        b=eergk2GatJwddK0m5aDHk7mW1Vqve4NKgrLTD/xMf1cdoaN61l3rFXLmoD56XLwVT1
         1OgGjY+fDt3+itf2xR3zzsUFSsJfJPQW42Ztdx/8mqYMx5+Y5zE994sF4QnLZEZP/+MU
         qAX2UR8t3b6hhsXpasbHFy85w0abSoVXWQr5BRECFjoO+JPSURH8GaAhTJalT8IFmppo
         8publ8BpcrGXZa0QFQ2t6owe/4ry5mEUWjbt64DiAYUtz5Pi4NnNTDzo4LVLodkuP7Re
         vMO+00HXqz+fNrysjD03Vuhryr3F2iVqUaXl9dVG9yUutLGCaCLP38SpiA+Svv8abqpf
         xVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777471818; x=1778076618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ysp1U9NNqTsUxNFeHUm82oPmQG1qVjCig1cIpSv7JdE=;
        b=BAumqguhLBcFZydEFgQz3rV2SD8x7Dua+GIL+MfFG0Q0/kCf7/uGW4jjTWE+GeNPMy
         fwFKYM4nyv+wW9KUu68s+oEo9Z7429TAyLmozxtc9vxA5+bJyN7oct77PldObC1uSBas
         yPBZH+LeyCMDKOdmbfk2palS3fX5DIZewVzzA4Ju5SAse9G8CPzhYhuit7nvB/p5qP75
         3jKot5PundNBJUns2g5kWDhBY0Igyzgulky2psMVG7lgik+jE5hfLnd/HV3vq4/dXmGL
         womeiBq6O0j4Ceq1VE3e3NyFR829S7otSxj67fylLghR1h3NL5a1QiWoK20YC5RfgTLE
         sayg==
X-Forwarded-Encrypted: i=1; AFNElJ+zN7pfG28hQZZft8Q3igoTLtdxllYktRdZT1UOIYkvbM4lgFbNrHbBrrIaKsH1Ke72fGjWjasB2UX2@vger.kernel.org
X-Gm-Message-State: AOJu0YzbCc20IGDjDJ7YFIMkVKwtp3gahvtNpsDsnX0PHRLzIUrsRsmn
	9E1jESaYtuNn4vvwNnOYdRmC3bC2q9jjabdHF7NOXo1xKh9A+zYT/3amXfh4ICMVOwrQA6Csf8S
	UyWcihuhFONdbWyEPGQJibm26Ydre/UYV/mmWE15mCetsaFyFm1noBmrF7RDNUWo=
X-Gm-Gg: AeBDieuRN+eShdt+abrvdwrcWXp+dQCFmRB34vj5RkMdS2b7PUGQDB/u6iz/4qiUWaw
	FhH49ihALoiPdiKUagRq98mIRkPlZ0/tovMVrHuqRn8Ll8pzrg+fCgTBvKW65mhjsimj3m3me7U
	gATvvy4hO3dCAIb2wkUr05V1nDdIY1DjWU9tgF6K1OjtxWKOAXS3nnCFjEz9rnk8WBevFg4jGZ6
	bHmSkJvcnOXjQSJXkjHkuk9Zpj59E9AoPj6rpdOzbdnKg5i8P0m2/0cs0AJQrLmp7P10BqQOKZi
	/veMBOCoEII1MCf6wi/JBpDamXz1r8h/apFoQgSQpKwVS3hTj+0abbr12nkelH7ItlP72+J5VLg
	uAO2jbQYL2xq1Qctppn7Im9IWf70zwSCRzIS7kdVQf73/ydbCJwqQbJBoFMRpYA==
X-Received: by 2002:a53:5a05:0:b0:650:3952:3d3d with SMTP id 956f58d0204a3-65beee8dad9mr5103173d50.44.1777471817846;
        Wed, 29 Apr 2026 07:10:17 -0700 (PDT)
X-Received: by 2002:a53:5a05:0:b0:650:3952:3d3d with SMTP id 956f58d0204a3-65beee8dad9mr5103131d50.44.1777471817363;
        Wed, 29 Apr 2026 07:10:17 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65bff7ce720sm1286731d50.21.2026.04.29.07.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:10:17 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 19:39:57 +0530
Subject: [PATCH 2/2] soc: qcom: rpmpd: Add Shikra RPM Power Domains
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-add_rpmpd_shikra-v1-2-fdba28564380@oss.qualcomm.com>
References: <20260429-add_rpmpd_shikra-v1-0-fdba28564380@oss.qualcomm.com>
In-Reply-To: <20260429-add_rpmpd_shikra-v1-0-fdba28564380@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777471803; l=1679;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=XtDgh9EmFEUZTFmmIEWobw9+f5N/wS8Pmul7XFNhQBs=;
 b=YdF4LQ5P7/s+dPEDIb1S7XAm19xZRPt1lXvu9pK2Z5oPFhc2qt2eFhU8lYegQ8hVoQOAkbYlU
 VYvbR/zoIeNBGBUjlr9yUuqVnN/eZidzlZnM47xzb2E4wuq4dJrh6JK
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-GUID: WWz3RzKsqgE2R1-6y1_TwH9rBUHdfeVt
X-Authority-Analysis: v=2.4 cv=A4dc+aWG c=1 sm=1 tr=0 ts=69f2114a cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Q_XHpadt4R70q37f1CAA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-ORIG-GUID: WWz3RzKsqgE2R1-6y1_TwH9rBUHdfeVt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE0MiBTYWx0ZWRfXw1m9JUUx3xsD
 uXXWwiAB5CtM8qlx7nZ+W25qhJm96doI6qliMo6H3YlfQXcE1F/o+9j9kd9SEYJjSgOJ9cB9D52
 zQnGe3wivo5DRQ5n1J2ArKZ/Wj1JmIxXAX4Dvku9f7vsAWpWZWLshCowzdeh+G44XGQ+Cb+IdPP
 Gxd3Czzp1ir3jzGwFaoBBOMbPzYb7QL1xv+dSfgV3VumjKelZRa7vTXaDA9eaLkY7XZLLY5ZCZu
 eUXP8UtB5pepYN8yjMA7gRUcUXoHQ/ddVckFsXhXorWtssn+5gO7ksAnUTrKHP6NtDqzU3uKI+S
 D/wpdu3S2z9dowBh76rXp4rqBOiLmxHrv5ACy/xixKu2mM71ycrqBm7jcv8ewaavE23V+1P1ms6
 BjQKtHML/TorXmZzLQkZ7Uy/Lze88qn3TTNPx1dRbYL6uQ3EMJnij/k1AJ8GACjhGCrKf5CVEeE
 20txzNQuOhOrrPOzvqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290142

Add RPM Power Domains support for the Shikra platform.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmpd.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
index 15a11ff282c3f86b1e86c6604d165e297620f6cf..6f751ee5a7833912d54d2bcfd5d85837ab7a97d3 100644
--- a/drivers/pmdomain/qcom/rpmpd.c
+++ b/drivers/pmdomain/qcom/rpmpd.c
@@ -863,6 +863,21 @@ static const struct rpmpd_desc sdm660_desc = {
 	.max_state = RPM_SMD_LEVEL_TURBO,
 };
 
+static struct rpmpd *shikra_rpmpds[] = {
+	[RPMPD_VDDCX] =		&cx_rwcx0_lvl,
+	[RPMPD_VDDCX_AO] =	&cx_rwcx0_lvl_ao,
+	[RPMPD_VDDCX_VFL] =	&cx_rwcx0_vfl,
+	[RPMPD_VDDMX] =		&mx_rwmx0_lvl,
+	[RPMPD_VDDMX_AO] =	&mx_rwmx0_lvl_ao,
+	[RPMPD_VDDMX_VFL] =	&mx_rwmx0_vfl,
+};
+
+static const struct rpmpd_desc shikra_desc = {
+	.rpmpds = shikra_rpmpds,
+	.num_pds = ARRAY_SIZE(shikra_rpmpds),
+	.max_state = RPM_SMD_LEVEL_TURBO_NO_CPR,
+};
+
 static struct rpmpd *sm6115_rpmpds[] = {
 	[SM6115_VDDCX] =	&cx_rwcx0_lvl,
 	[SM6115_VDDCX_AO] =	&cx_rwcx0_lvl_ao,
@@ -949,6 +964,7 @@ static const struct of_device_id rpmpd_match_table[] = {
 	{ .compatible = "qcom,qcs404-rpmpd", .data = &qcs404_desc },
 	{ .compatible = "qcom,qm215-rpmpd", .data = &qm215_desc },
 	{ .compatible = "qcom,sdm660-rpmpd", .data = &sdm660_desc },
+	{ .compatible = "qcom,shikra-rpmpd", .data = &shikra_desc },
 	{ .compatible = "qcom,sm6115-rpmpd", .data = &sm6115_desc },
 	{ .compatible = "qcom,sm6125-rpmpd", .data = &sm6125_desc },
 	{ .compatible = "qcom,sm6375-rpmpd", .data = &sm6375_desc },

-- 
2.34.1

