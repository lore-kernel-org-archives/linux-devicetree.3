Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0433D75A1
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 22:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463356; cv=none; b=BD3oMCduUFl5XHr8N5O0rKOifmfXcfhJsRf9O5Sk93UTZ8X9HHH/0dR6wogU+B+gwbCahXAGTZSBHYvXgyUgpZids1l+Q4hn7MxhIqavMR4AgtHZDUSevlw+FyMMbIYJWawphuMO0xChnnR0B1e5mJxNnwaYvNTJnpeCGswEXyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463356; c=relaxed/simple;
	bh=aFCxwN+s0nObB9dYmcqshZUCs9EjeMcuhwbHJaldKhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pATOTFT97NWPIQJU61+PMmSAFqq4n0umjg3/AWP42Rf++JYkT3/H6V+ku7JU3NSaBw/sLnzzoi84YLPDwdT9D4jNoJlfZfYuAo/YomjE/3prnfNQNoAv+sqcbI7xivr2zvXq/JCEtqg36z2uxJZxZ+uoxIWtbph1rh7xHuINwng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NiIChZki; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R6Es7dkX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NiIChZki";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R6Es7dkX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5N06518288
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 22:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=; b=NiIChZkiA9JCrQx1
	253QFZ8kOYXy5njNkugfhXY9FCl9gcnEIDHEkmE9kLnBdD0OILsWD8HhjYMIPvzr
	kFp4DHcIwCwGm/IeAeRSPQuaKvs3XNMy+4/0eozj5OiQv3rg9Fv46xOJSZnGe4wB
	pH578jFfwN/C/ShgQ8BNfHmu9kD3So9YxaQ8vMJjvIjUPjGQuYUCefq7tBXbUmXu
	Qa/MaFGke/1jGl6PI2dLog2oRk05a+RevFAGTXPieKOtnroJImoHWyBa+wEBc7ey
	npHnrMVaFAVqxVl+3DMch7N1XJA28q0EBq0Ll+IpYCIN8P6H50WG4q4/j1f6Y+Nt
	IAmiPQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5sf55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 22:29:13 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7383a52d9beso33682137.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 15:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783463353; x=1784068153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=R6Es7dkX73rRZ2TW793LdWIUIkNEo6uPqHI6GDO/zbuURzO046xYX66egZvHdEsZvr
         Y0n+5acjEIu+vmGZFft5invsEmmkgqrByoXjHCBfubDUmTvRglCGtUjmQBRgFjvB0GTz
         NjH2cGPnIq+/QjBFwZNn9puauW0BIFVznyBhqV+kBYowLI47ahlf5OGOU5HBz9sGpJYi
         R1pjLsVhr7p0H/d0Q1XW0VWubF7OO66fqGy47Os0vHGC+dihG7mY8ejWu62t5vTAf6Sw
         0jS/LxrnBvK62cUMCcohImWN9l1mFp7oJAk0OM+qxCuumSDkz9aSoo8eNVrgexyGQleb
         5QdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783463353; x=1784068153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=CeLVvjX2wksrcODTv3UYBNkgcGLZvVhry+O4XQnYJD76KlgZkZbrpqxkQEuzspLCOI
         8GZB/3W0b0A3Jei/vbXoXfNBSRI6mfqKU+eQhk0w3Kv8vba25d4B3gKJzOJ9B2zFarPg
         VQCOKlosZMgDnXb5zEjUcw9Zj4bdJl44JCH1KT28xFKFnbZ7Kgem8B88hnh4o9H1bAXA
         iTONrFseMWk21lfa1I9vrxJc6JtlbO4ZsaOeNNnedjeAUq6tPhlD+cMNFqJgORLbfDtp
         Tm67nNUhCKSizdFYuPxTaSz1FaFJDzWEwclBCpCvIE5lVyAqhlR/AKsHqX7XSu49lcKQ
         bcTA==
X-Forwarded-Encrypted: i=1; AHgh+Rprtk+XWHohdIb5/7KTkVQMzYaEdHMbCT7SRv8bsgWdDCyaV3IrH/tqcivbb1sJRClQkOq95NvEieIX@vger.kernel.org
X-Gm-Message-State: AOJu0YwYOFkPXJbiUa1AoeYaMWYw/0BG/iwROErD6pNMQqgD0Bjp1AJb
	a7E0M1rI27Ka8UK6b3U3EkK/BAUXhD/4zbMx4o4pgAeOOyjJk6JRX66WNHQVqaU8u7CRwJXMw7j
	AuNjZv7EVvOI2liuN2pLBLvSeB/2CUQJN1XGSrIrqb1t2/qqjSOGm53yCJyH062nt
X-Gm-Gg: AfdE7cnZHeHlkdGDBHRPHC9u8l68vpE3JC3nurJNPIuDLhK+at4kxInYHGs06HLShwZ
	k0uGdEIN8EDyh9YJ3XlvQ9qVoOue2y8d0KB4WRvz4iJ1yoFGXX1/yqLmYfYJfggU69N2Z/TgkXe
	x5XVWqJH6JDfJadXL6L+f69059ZLppGFfbGiizxcPkluBlH96BnbGMdRNayGVqvR/LqJpixEF8f
	YfU+1isKCDfK+gZIWuvA8d2TrrDoDeIVnua4mi/c3u5szZXsQB1s9pRM8Bsg1s/xG6oF56TFv5c
	i7XQBVJrSIF13cOEmrDLW2wLMynQVXRYIYvsjtWKGyXiaDESHUiax/+AP7HuNLwrOkPv0kXFzwa
	1bENYDsKSngxvIjTWn1TKe6eVbgh7F4Ybu6AtdCEjl3QRWjJw20AUwkPBddQiPaZFiPAWR1pYWP
	nBNCpliUYOqrUqFQqd2b0g/5cn
X-Received: by 2002:a05:6102:3f8f:b0:73e:751a:167b with SMTP id ada2fe7eead31-744b7ebf61bmr4629096137.29.1783463352863;
        Tue, 07 Jul 2026 15:29:12 -0700 (PDT)
X-Received: by 2002:a05:6102:3f8f:b0:73e:751a:167b with SMTP id ada2fe7eead31-744b7ebf61bmr4629081137.29.1783463352477;
        Tue, 07 Jul 2026 15:29:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm1897231fa.40.2026.07.07.15.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:29:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 01:28:45 +0300
Subject: [PATCH v6 02/18] media: iris: Skip UBWC configuration when not
 supported
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-iris-ar50lt-v6-2-374f0a46c23b@oss.qualcomm.com>
References: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
In-Reply-To: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SkhEj21efbGwh1OhN+7NneptPnsqOcydi7iGjY56ptE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqTX2oNMyxvO4unLEvy0svWQ+MNdp2GtSPxwBnI
 KQBAEc117yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak19qAAKCRCLPIo+Aiko
 1dJwB/4wyu3PSujBNfXAb+8LzNzBLXNEbiAaJ+D15/m6fq92Fhilpdoaman29BtzO5jYTReE+Fh
 g3uiwHnOlsaJUxPWYY0IIsnaRMZqi2buGGfqBPvIKt4NtmImy21N56c1fPXoee33GZoFTWm9Ny9
 BnqEo4KeTMmPjNug1WD5NfHyizoNYGPr2zFM0d5QNZM5aK+jwNqqS3bQrKXj9IhlIICwSUmTW3q
 bezqbqRCWm5eMB/gA4c3L6UuGu/gZeZ8TQ+7JUHS9qM7H2bXaStZNmiVMcgz3apWZeVkeOVH6ls
 fYtpK1Rf1WHB+Jnk4QTq0J/b0tamgbFxOjFduS/8AkcmgymJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: ZuqI_4J2WrX40j5K2PpUWv71ZNCIRdMR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX4qivkuoKctzL
 CF8Tkj5mvnZoY1l3UIrxUh9E5VBFjvz+mARB8dmr7iU1+ZNuRzwqjs//RbGKcHPIsOsDyDEmckW
 f5vf/BJhlPdKcjPyQt908f8kCf8u/2I=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4d7db9 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=wrkyJH6U6m0Jdbs6q_kA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: ZuqI_4J2WrX40j5K2PpUWv71ZNCIRdMR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX3WiMFlRnwFFF
 ZCmTbeUX4r9I1ycHMOV4fXJKwIlt9qaYF4h73RHINiTo5FvZaq0/kP7Nr7Z0s8gf6aB/7nVZpbI
 no2/LgqCjibXZTZj1/NywIfPUUCtjUZi2gR9IbBuSBOxQEf6SDG5c99L0S/Xp02ZhRvuhYMsTvf
 klWHQzfhMZ2rsWPWu6+lTLicx77PZngo7umw6HsN/EcDjiSFsBloOdNg/wPg2XMx5aeyFWWEE0H
 NXLJyD2C5ICJOpD8bku69k7SuorgkxzIu1S1Q4g9sWy6v5NXQ3GTXK+0gwQC19zGPVQSv2ZHhQR
 VGDVLxPAL/Wp4dLZRzXVQM8LVhOoyMCRtuJ9Ou3Woz2XepXJozzQxfsjqGHhAsQT/liuDbP99QE
 AQalO/NzrUshV86PMythp0PsQBCd9sb71jaVwoOLTWuNHOWcnSy9rnA1F7/n8zeDY9VX4+EF5QH
 YdezNS3W8E6H/qL18Xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070221

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

UBWC configuration is not applicable to all SoCs. Add a check to avoid
configuring UBWC during sys init on unsupported platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 0d05dd2afc07..6e04175eb904 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -140,6 +140,9 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
+	if (!ubwc->ubwc_enc_version)
+		return;
+
 	payload = qcom_ubwc_macrotile_mode(ubwc) ? 8 : 4;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAX_CHANNELS,

-- 
2.47.3

