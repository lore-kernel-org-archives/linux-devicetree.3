Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FB93D16EA
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 09:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779786630; cv=none; b=THqb1eIzuwFt2wfoA/cwT3Va1hnSz0dDAaQnFhRpuHOLPIKWCvnvW44HcZXlcN0ePKyfej4L1TDGSAZ6T23Yidf2d6yeWSh1PItuLfq/Fyg+n1aybc9i1rpk3VN64Yek5G6iwezAeoWXSx7IYC7T25eMX5vKM3WPyTVVlVfdd3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779786630; c=relaxed/simple;
	bh=uHxDfHp9+PexPpMOxr77xWIABoPMGfsxROU7WJAR3v8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aFNnGtEm4a3X+NnO8M80DbMt/X9JkUWiPDGO+rKQd8APHzDtIr+z5M5ulV3x5wmPzQ2hsy0+p3R6IWwAE8Hxy0+9J7EMmjUtoiaG2On19yEVkKCyKQWmweLQF3bbg2YXW7pUFhgfPykZQMiFEBnidAg8IG0Bj4JMQhmXuiWWNaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z5y/eyU1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ElPtuw0q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z5y/eyU1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ElPtuw0q"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q5xqRR1604645
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 09:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=T/2aewGB4Kp
	n1y8yQDIKkfGvFMIVNTd7+akHCzOQCLI=; b=Z5y/eyU1uBBwdHYbUe5m2j+i7jO
	K0dQFeC27fVxhamLDGwZaRMGFkSP7UKLMa/Agh7JgS8Pg39WllR+ns4CSj+nZIOH
	cCE/BNOiUSp9hMAJ4GjbPzaaySvURhl4aLXFWXaUwlaZHdiqschMqEHcaDBN4FSt
	T6wNQOrd8X37iVpp2Z8B4jdW9mkadVNgGd1j/UrBHPupHJpxOhbcDZWl/vAjnjCv
	zqsOM84QKZlva8N3x9vfFw4eOUpzs41bwKNsn+j2IGEpGmQyul1qCGNu4KXRvkII
	lBvm9JVFlvvGO7gD9kwzuxVm2hIpD43E1pf23zbFbfg5rD58z5SmwUmL/Tw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3rrpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 09:10:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2be9e0905a9so65978515ad.3
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 02:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779786627; x=1780391427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/2aewGB4Kpn1y8yQDIKkfGvFMIVNTd7+akHCzOQCLI=;
        b=ElPtuw0qBd/B8TKZkrF0IebpG7FJOdg27wJi4fzbgYYv9cARN63kf/exBYskrbOrKr
         x7w1oPS9tmqmi7+v7YbQAcoe5jdPGXwmTCfyB5GpQkuywGOMlL988lT3MsY5plhDLzRE
         fPdgmL+ndTCYH0YbRd6r5uH6wwCygoX8N5Xx6b2i4BAEwe6Bsp6iLxUrVVSOuHyWy7WY
         EDZM06BtsQpKIcHB+b/vc9h+aJ4856qqOKjZkIghRCnbk865gsEOboVR2jKQrLTNoxeJ
         n5VeB1qR9nRmXvkURiKCKSbnDW+EsgLO9/YhDlUzW8zYkTCyjXiA4SH71qZEb7RqaGlF
         FzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779786627; x=1780391427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T/2aewGB4Kpn1y8yQDIKkfGvFMIVNTd7+akHCzOQCLI=;
        b=eCfaJI+/V+eAtAQwsrjSlIrKb9WIiAmPINOyTLek3p24JU51tOsMBgffCUdrhpKrMT
         c7/aeNNzynroCvgTt+5xmVcRJipxoA08clVPl9YTcCXVoEbGRTzNsvvQs6lI4xkmJRnS
         JBjmCUlaZ8wbmgizP0RMA5ZbGrIQBgvWO05gJDxBbArcMRULng7ToQ/0zxOBsWwECppU
         6GtNiiyhxYy8g23HgNfQjvyZG17WdY2PstuGerwg/cZeLBIFEDJ2f0XPOKAH+Gj/HUr6
         pE8zcqK00oMtOd5eYAjPBp4iycWxR7UPdz3t/pGI+ioARYI53h5pbljAQtiRg9YNaOpR
         8XxQ==
X-Forwarded-Encrypted: i=1; AFNElJ8hVbJfA++ridDKZ21AeRB59AfcHiAA8oUTWY16wQiyz9VeO9pWQ+4C/EpgTJuKdROBR3i8B5njNTfE@vger.kernel.org
X-Gm-Message-State: AOJu0YyYO3JcadRJw/UdMrbjUo4bLs1O2v2WdaZqla1Gy3wEkTxD/6z+
	YflW0a0kEUcA1lJsoRd6phMB8MtNk0CmW16XDWQqr1cf4ubB5W0V77H4sHoLWnOTLa8prfkVozP
	cd0dYMSZI6NRHSA5rLTLJ8WwEk+YiwiDOmTp3ZjgUVLTlHDhQkZraz6dWQJF9+Nqw
X-Gm-Gg: Acq92OF6vZWLGJUT8qK/8aNb3l2PJBLUtTjaQQr+ji1ZqwD9Dak513Dn8ESWKvbqx6Y
	zojze3uhVjCyL3dte1lbrz364K8WLQwZHRtTR+LY6ZrixZn3vgoUsCg0zSU9DZq0pdcmvx6+GzM
	rHhpF5IIEpvq+DmIVWOsJa7uW6CC3bCmVWp+O4pMKn4cAe3MzLpsxuwprsb1GGq3jh3lyldcdTR
	Xdjb9sCgYhB4wxYEKrKV+87+r91uxe5UXjbYvbA618FqW9x+g13kgoA8C0DronxSsuukD3ja6k4
	Q/35OEHj/jFYRkljU9I/5F4XVPlzplA5G0H4oYL27nc3ZwRrllMOw29qAuAjpeM7OT5XdoaCmdZ
	967lEpbYr5rxn/pkhdKUSDK76tXBPQ+eCZv2nGGbkIAQ7uODdOtNVew==
X-Received: by 2002:a17:902:f543:b0:2be:1c3c:72bb with SMTP id d9443c01a7336-2beb069d332mr184560765ad.33.1779786627370;
        Tue, 26 May 2026 02:10:27 -0700 (PDT)
X-Received: by 2002:a17:902:f543:b0:2be:1c3c:72bb with SMTP id d9443c01a7336-2beb069d332mr184560405ad.33.1779786626890;
        Tue, 26 May 2026 02:10:26 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695a40sm109237915ad.17.2026.05.26.02.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 02:10:26 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        luca.weiss@fairphone.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH v3 2/3] scsi: ufs: qcom: dt-bindings: Document the Hawi UFS controller
Date: Tue, 26 May 2026 14:39:55 +0530
Message-Id: <20260526090956.2340262-3-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260526090956.2340262-1-palash.kambar@oss.qualcomm.com>
References: <20260526090956.2340262-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA3OSBTYWx0ZWRfX8WvGNuVFDzJw
 8tAXMC7KzSzhoH0ZdJTRmUJdrqyRCdHXeYn1znslj45/PgrgwgnMtC53eopn2kgzB4gx/pS/hPh
 S4jVxDInINpX9Ul+paFj6VxkwIgQtvTzsdJVoEEfPdoe1Zpb2ansdZrSR4mF8enBD8rK5F/2qPV
 CmQd88F4WYqMWrhxpfDWGWisjiSM0q0Rwp0+cYT7FPQlWvfRva7cpPjBJ1SixxXyeoHvEry0OKp
 4xHPnpGG0jZ1ZuwmiT7micBvPzdH1yUKY5ixOJ/WCT9+oux3BKmBLruLSOSXQgBZi5tMc28veBH
 m2LqUv2fqQHIN3VDboCnDxmDxQUDXEqQM1Eg6MdeqdS4hF0kjCN1Q53PeLUw6HK1IARaXFZnAvN
 xGzA3fQmljSlf3EyHkmRrhDsZGzszvAXKdt5iGZPi7/eTz5efxJtI1rWaYXZT2NcPpJb+Dj3vq0
 +xoNXsBKAnJWfB8cLPA==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a156384 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=dkR0I6OD3irOzcp_LXMA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: dpfXqr_VZxrRUlgHcPmRFXXqs_evpMzT
X-Proofpoint-GUID: dpfXqr_VZxrRUlgHcPmRFXXqs_evpMzT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260079

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

Document the UFS Controller on the Hawi Platform.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
index f28641c6e68f..3de00affa4c6 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
@@ -16,6 +16,7 @@ select:
       contains:
         enum:
           - qcom,eliza-ufshc
+          - qcom,hawi-ufshc
           - qcom,kaanapali-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
@@ -27,6 +28,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-ufshc
+          - qcom,hawi-ufshc
           - qcom,kaanapali-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
-- 
2.34.1

