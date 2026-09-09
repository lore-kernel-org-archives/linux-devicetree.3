Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E016F448D1F
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 07:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788938311; cv=none; b=WprCrDIsBqK6BxosOR5Wcxt/YcWR2ficU5/TmW1rL6K1lcstvEZZmCPExc+5YzQEeLN4xdidx+dTF85dOpnqlJ0KkjmnzeUPCbG+GmSKkzr/y9A89jN4irseO3PjWPD8wnK8yAyPjYg6qwD+FDlFMVrEjgIJTL6MYGgNKSMgy3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788938311; c=relaxed/simple;
	bh=P8CuQEhXW1fMhFKa1ABt3ale4EsqUaPUHgiFlWdjSNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jjGCVsU5/RKeziR2VQcYC08Jla+rc+GtcFDTCopmduJYBamS4RPNkPiJie9bp0vdYNtisRHl23vu2mN66UHSM/F+FTQayzZjV+PMhIeY9BVQiikya9edg/hehtohrv/FpgHH3jolC9AqLse9yLBTlGBCu7cH5VsKbn0XKGoexmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnpacUt5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MFjlUldL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnpacUt5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MFjlUldL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896JF1c482287
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 07:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F3StvAQJYDI9ePttlpzxZnCtj+uDr6O+fRoh71JuwC8=; b=KnpacUt5mqKfOJu3
	bP8t13P2i4Xmj6GSMbWq3DSs7N/YCV/eJXJ7qZvEHLyy2BibcePHv+U6Qkql03Mr
	53yRpjX/BnT2M6pMx4NIOywjGkUT62bquRhmDomo7l2kOcF6BQkchJnag88xNk1Y
	T2uLoPzzYVwcSGCOZphxOiZoOSwkSpDe0moWbxXNu8+39zK/L3wHSY52/pQSzbN5
	kcsIhCUGd+RzHZtma+Mkplq3PnRngPbEPzz4m2b7q87qKKLA/ly41OppCUPsL5qY
	VPj/aCMkr0ZKy1UUAtgt2LQFRWtXM0zxegqR3guIM+MjaJ4BGcoR+eDixeqltaVc
	8DtwGQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqf1jqw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 07:18:27 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-85f3a39f3beso7398824b3a.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 00:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788938306; x=1789543106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3StvAQJYDI9ePttlpzxZnCtj+uDr6O+fRoh71JuwC8=;
        b=MFjlUldLd6LktrIzV2wtn1BBL8KqRfkv6d69iKQ8Nymua0r7K5Ab6W40uBhnufhISE
         MjISp7zHSa0GdyQGMAc+1S1zeoqlpimzUOOOiLnS538Q2D9QLeuhPSvlPMcRwAPRy6bP
         SmhQUx4jPEYCSpCbd1mQvLv10rIpI/nkkVnpGfWZFEvVRTQ2+dcwVIqOibuEPn3uu6LX
         CNEF86TNTmXlQKzL4npjtFi6NUvI283mZcNTyaeiwBvNsuMOyGidbedPqxvsdyrlE8gi
         i+rXMe4tz905YF/raY0TBa8+nx2x7rnTgTxnuqDX7juHnJEQf426qa8+MmgRT9VRs9AN
         DSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938306; x=1789543106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F3StvAQJYDI9ePttlpzxZnCtj+uDr6O+fRoh71JuwC8=;
        b=leJtaJZxUEdVq3AEv719MgKW08Phq5mqo0fj+0Nw+eYbF8SxkStMQ9E36JVvYvFrxm
         avXFtViIUN8G1xssXxFf204l0qwBTwYXT7e0OHmq9r9GeezwrL4swnsJwIVWaB0bRezC
         gDbw1tbz2pPCuabx65HNZQ0n7/fhyJyJc5Xyapmjr6fwz+8m1fxz1we01yZE8CZ0w5V1
         BI7LU06juaut+ay27LEwHO53LfBMh3s9v/M77dMKjoK0JQwhnhkMIjZ9itQOfCDzeJHs
         cC7OFlcunbs0mm2fh/NpoaEG1wkUvR6euf8fpzZFZijlNS39acgpvYBugYIF2RKL8jpH
         qZyg==
X-Forwarded-Encrypted: i=1; AKwUvBzcL9wqr2FKIOLGsW+QgFTB3j3q4/bIXROMR75UJK8ySGCB3jvVVQpee29JC6BgyOdc4y+ZqzofyGfl@vger.kernel.org
X-Gm-Message-State: AFuF++loegux4baNT5eMRh3ZIXgghjL8119fjtunhdsTOSqJuFPfXJwb
	QS2mCWYaFWUIK9yVP9lhsiMzxcpAQuSpkvnGcdh8Ivfa1ik6YI9dKu703XSFecdfpeJlhohX91/
	7uQpQ7O9+kPY96LBa/g2ZFqgEPiQQTdXImmWhIPHnpmT9e5afmqo0LhziRWzVuGnl
X-Gm-Gg: AYBFou1BS7TY1KvUsMZeO2vub1ZiZBiSQf5Dr8B91oVavsiIUaiFJ8HqhtJBF6DeRJU
	T54ARN2aDrLyl1MNjPaBqinzQaRv1Y+hoN4+DUSXed94TKOugkE+YEf+im4OC64mJ/SigiE+tRV
	rjt6cmdumKClaL7O0+MSxJMRN3yhVtay3MAVQtngEANyjcRkCLcZZ1+9JchwwRBa73f14l182Ii
	uXQzdOom1QUnnrTYqhgbtoG1d2oubPdm6+GVZeLUuW2XmPnhB2qK1fC/xGKd3m8nVIHguKjK4Fl
	sYW2Won6bK2SiQnYj4ZJuo64nuZFPmEZEkDAMAlyMy/7jh6r23j/ASpi25xpjlSKUIyIg8YaIq1
	PXNdblnSl5h+nj97ml7zHAUGgZ+k4IsKgxWPwdM8kvpbQlyYNibpAoYu80CQYIeEd
X-Received: by 2002:a05:6a21:3a44:b0:3cc:8344:1213 with SMTP id adf61e73a8af0-3da39e68250mr52778770637.8.1788938306551;
        Wed, 09 Sep 2026 00:18:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a44:b0:3cc:8344:1213 with SMTP id adf61e73a8af0-3da39e68250mr52778708637.8.1788938306123;
        Wed, 09 Sep 2026 00:18:26 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm48308536eec.7.2026.09.09.00.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:18:25 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 00:18:18 -0700
Subject: [PATCH v7 5/5] soc: qcom: ubwc: Add Kalambo UBWC config
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-b4-kalambo-crd-v7-5-f5685804478a@oss.qualcomm.com>
References: <20260909-b4-kalambo-crd-v7-0-f5685804478a@oss.qualcomm.com>
In-Reply-To: <20260909-b4-kalambo-crd-v7-0-f5685804478a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788938297; l=1205;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=P8CuQEhXW1fMhFKa1ABt3ale4EsqUaPUHgiFlWdjSNw=;
 b=CTu1SSploTT+XX55GZxz+qJyblrDe4SzV0qDNtolPeb3zYrAQG6gDezHjnMCEJya9FVDnlBj1
 dQMPH5aXSXcCMppAnvOXSxjQVgocuqwVYSy7FVIxDH3ordFoYBsJhMB
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA4MSBTYWx0ZWRfX47uh0Dl4E0uy
 iGLuuSNoy7xjpfk7doqIC/Lpeoe9AaziEi3mxDAy6UrOXLdy8FdNRzTnrEgIBqGJszoQD9aFhoE
 iAq0FOX4L8mMfL2/ac9Pd75It8sKBOhPFpgB6PS/SxKflT5FsV1RwQzjbJPeJgqVCyIxU+TaKts
 N0fDAgU+niE32eC+9pdcW5+JU1mkkgZ7piJ4J21CzsWU+nY6GpT7R+672AVcDxvIETgZrepeELD
 eC46QZRYRf7l7wzuC1D5X8mF6T0s4tNvd1BaM9JkyafoTaFl7664BJW5TIy1OISKzWaOzqSKune
 ydP7v5RCAXhZwxBF8oUUt2H9shsMjwRsfKJFnb9pvUYZ7IQuPRv1/RJWk/CT5aCDZgWhwZl1CKS
 yRyZmHj6WJ4/0uWKUVQ3W1CWfrc66oac6lhw7qsIgp/f3uNz+od44THpNBmmiuL3BFPXsw3SLsS
 8AtH4UVTkHEvjSZAYqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA4MSBTYWx0ZWRfX5ppsH8PlvVDz
 QdB3qyo7zoQAqWtqmnQLXsLPo7u/mS9/9nD6gjciEQRKtil02AWMTeAI87OXYk3oA+TkcqiRUur
 rWYfiituBmYAS8Yft8dL+SdKhKFicsE=
X-Proofpoint-GUID: Y4L4PJUE_DQu67v98yhVKZ8OixYJUlV2
X-Authority-Analysis: v=2.4 cv=JY2Ma0KV c=1 sm=1 tr=0 ts=6aa10843 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=vwhQhcXuLYmSI6hVBhoA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: Y4L4PJUE_DQu67v98yhVKZ8OixYJUlV2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090081

Qualcomm Kalambo is a derivative of the Mahua SoC and shares the same
Universal Bandwidth Compression (UBWC) configuration. Add the Kalambo
compatible to the UBWC configuration table to enable support.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index e593386920ed..f67ef41dae09 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -121,6 +121,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,glymur", .data = &glymur_data},
 	{ .compatible = "qcom,hawi", .data = &ubwc_7_0_hbb16 },
 	{ .compatible = "qcom,kaanapali", .data = &ubwc_6_0_hbb16 },
+	{ .compatible = "qcom,kalambo", .data = &glymur_data },
 	{ .compatible = "qcom,mahua", .data = &glymur_data },
 	{ .compatible = "qcom,maili", .data = &ubwc_7_0_hbb16, },
 	{ .compatible = "qcom,milos", .data = &milos_data },

-- 
2.34.1

