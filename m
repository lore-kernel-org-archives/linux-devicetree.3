Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD1E42B72A
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675704; cv=none; b=cnLwIDG3CFWVB95moMUTke2QcS0uMOaVmebACycP5vR+N5KvoABmLjSaPdWkSPDMgF4JtKoOGuoPXmrFxwWShg2f2WDp6wW8lWKYYVht4ZYkh5zHzBSZkIH1+9ZJfW1neug7cbgQ5sycwXQWC9BzxMjX7sXsKk6vxELRyRhX7i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675704; c=relaxed/simple;
	bh=dicEJZtLq6zW0VUaiQ1W5EgO1yN4WYL6q5FtmZ8EKdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b3ouyBhPT7tfcEhdODK/KfYclK4pj0dS44GNOx1SrPBYd3DkQZbL8uOFS3Du/ofHOb4zUC7m2FJgQIMx0b5L2Sl8DMDOdQ1kytqws+zIWOscuFI56PgnZpuV26Pk2yM0/rQTEE1qW1IhlUToj/9wfYKB9PTuE8fwvOPuP7rvP88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eCz77HSM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LkBMhAfZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eCz77HSM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LkBMhAfZ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DBmUmj2965306
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hyGb0UCYPIrtzlYMMFqHwR0AZmvnwPLK/gKxBVnW7aQ=; b=eCz77HSMAXJY/8Pn
	oHuBX0EPTn4a2bnIFNRxpXmwlqRUICj40yJuH1kmLcA9wiRJj7JyHuqK0bc0EUyk
	0MLSJhcBGaHGhXEkQjX/7x2VqadS7QuVw4MiwS9AypXCHXf/jgAg9mX2wICsyGvk
	GVPiaIrZiP4pNY4QqAIfKVCgXUuIfbbAvP8n3dMnOTBIoP0kcjDKqCbvhb0UiUxT
	PWNqgWHacfeB4uohkSRqR2uv+LRK0twnHZHdR9yVtf+HlKKCuvqc5kqFyy6b7kwS
	w7eGci1+gLXwoXtQyZE9f73g3Dx1aTicGmudXFY/bt6zzGIX528gIWQGYVUcXl9a
	n/lWzg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma59ad5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:35:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d812c898cso161097971cf.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778675700; x=1779280500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hyGb0UCYPIrtzlYMMFqHwR0AZmvnwPLK/gKxBVnW7aQ=;
        b=LkBMhAfZp8heKlRoac2Sg8H4YCROuctQ79avnOwpwu23FgZoK4q4x4PuL/mXUMclWO
         tTR8jBt8YMC4MXNxndI5rHHxQXOLQlpUn2QhyxRgwL91GOZwU58sJthpj0ITGUC8Jz1p
         TQGP7mD/RH5GcdIivJey0CYeGHbZkIosKQMtxhDCqWQnFSnQufTF/ylWLxJWD+18rgHo
         dJVBJsjuIQ5md2X5SxSJLKQbmeC7/cm1+qUBLg291XcGY8KuQvLuX1gNeEZudJWuILY7
         xz0CAZb2E0Hxizx6vY7UuoKD70egWSLCOJuC9oJsFBHMfn8LUOt8s4oH8zXBM1XWmxZA
         fzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675700; x=1779280500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hyGb0UCYPIrtzlYMMFqHwR0AZmvnwPLK/gKxBVnW7aQ=;
        b=hUDUfIOiyuF5YJhzMd3TIXWBkWWo1xmGPnkyRL2+MS5HoG6vd6A3fpdPnXU4GDg8Cq
         meXkL6rw8RBuQBPU4Iri2Jc+2AdqzgjPD9WxUVV4LygQVcTosMEu6R7MfW4g5PTT0Jyt
         X5A61zk/sETtW+yJBCn6103EWCiR0+ZaTk1QJtFTGmj+APIV5u2ekPmB7QsTsQGMiKa3
         4MmzwCN+3oFr0AV95+ZTXGWE2Hykw+J8b9NWU8j+uBcZRdgBuYbGS85J5/sYTqBd40aI
         jWlqD2GVPJ9ia9YPi/+I2pci9SUOkGJClr2Tj0RD7qTuN6E9bm4qT27SurnTTN9nBpDb
         +HgA==
X-Forwarded-Encrypted: i=1; AFNElJ+Wqceu/LTdaWplD2hZGyUZak/+NOgDRDKbSzlN+sRKuodaYZyQknbJSf29W3ci+a4LJKKVoXTWXo/b@vger.kernel.org
X-Gm-Message-State: AOJu0YzA9tNCMVNQvHoHfhSVLDEIrIeB96eTcxlgT+/wFsBy6evYGe/M
	5NjdH48i8CL5YW0dEMJYbptEVJOYhJJn9wqrqIC0j0Tz511gd5gjlGn6M1B8SPq5Nh/KqFsuOyL
	p9hFd9Fieklk3S0aBVv2FBxNDJKS9sxQUHABA8lXH4yqHjdHheRfogiYF5DcHER66
X-Gm-Gg: Acq92OGp9czMKxRpV4XjSOjtgQlx61/54wDbtkhsXbMyuilV9hPyJmwCJ+T4n4XlNdR
	/cUdII9kj9Akvncz+KInUO+HiHwIOjGQIZTMwW7LRZBaKPCoosPkycERfTrWZEjmVB9fXrSyN/T
	j/GK4ldaj3fDbBGuHOW5axbQBkFGz+AkPelKtcwbMmelRKIzAqQoHn45R0LIuVKQNZM66mHGp5g
	78IXXC9us5nBaUPE3pwmvXX3Nx6Qlikebpc9hreOFhc0xAfqt8qf7v1o1S9wt6YCmsP8cCH6K+R
	dEjvLdLvTYraH2a/BBIN2lIWXskpxiLgO0V5zX3MRmPMF89IrehCbCew3F5MNVaZrHgK7zcsMf8
	UfC8TYmlxFZiDjdqxR8dbyj+nbLc4X3iUYARIlxj8nSKNE8Arnw8AOxYZWUD2ZR4iZb6gxe0Qvy
	EAjq46kSXW3WKMGZlJcVYg3kG0uVr8KNvfY3w=
X-Received: by 2002:a05:622a:a17:b0:50f:bc91:709 with SMTP id d75a77b69052e-5162ff0cbd4mr35335311cf.39.1778675700485;
        Wed, 13 May 2026 05:35:00 -0700 (PDT)
X-Received: by 2002:a05:622a:a17:b0:50f:bc91:709 with SMTP id d75a77b69052e-5162ff0cbd4mr35335051cf.39.1778675700087;
        Wed, 13 May 2026 05:35:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660c1sm4132610e87.66.2026.05.13.05.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:34:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:34:48 +0300
Subject: [PATCH v6 6/6] arm64: dts: qcom: sm8350-hdk: enable Iris core
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-sc8280xp-v6-6-0d11d90d3e26@oss.qualcomm.com>
References: <20260513-iris-sc8280xp-v6-0-0d11d90d3e26@oss.qualcomm.com>
In-Reply-To: <20260513-iris-sc8280xp-v6-0-0d11d90d3e26@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=806;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dicEJZtLq6zW0VUaiQ1W5EgO1yN4WYL6q5FtmZ8EKdM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBG/mMzuZ2CO8MKO5+uhvdxsyiKGr3SmewIBjq
 QM1hUvPXESJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagRv5gAKCRCLPIo+Aiko
 1RxrCACy03R5HrcGKACC1VcQJ6q81GOpEocy5kSrC/3h20cc7Qm2HjPWhzVsCwUu7A2oKtrv3qM
 T0im3Q2gLN+WshzPl+Mega75B4nwugyS1+UNvu1OM52iwvu5ebPKDcjlTecErqSD9oJLaunGtWJ
 jBawKFIIsdOfUscDUwZaAP88irxRS8AhyoYI9AYsqHRLYAzOj6a3pBVcyRru00dcgSj85GK+rjI
 caJOl5R3GIf0f0dV9TX5X859MSbI58M2sc57Kg58OpIJ5nDRcKvTjTDpwdLXSUqFFTEGUSDiSWA
 fI2M55btufSr6ldBYIzUO/1kvhJ5aHiwuiDysSKEwnMFtRzm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMSBTYWx0ZWRfXyFCk1l5I2J08
 jB48ULdBRB8ry5WtqVEcFRiO6oXvGVtR4xRSRyn+q5ll47HOYubUFraWDSq/yhNPvcAgnmNO/zh
 Gp2P9hVl0Dvuu/exKWE0r/Qfnx2tn8Ej8V6fPNdI6bt0vDcNVb38lR55Qzw9uKcCxXaQdSmqxOv
 8q8HqxwNIqj6wi3frKRFkj06uZTpCXCxzCclPf8s63ZKzGJKGu8vlwGufyGNph7MRK79OPFJU2C
 56LT+EnXIjCaDNjeTmaXODWqz1Noz0gGwxDVU2z+JG5rDdkxWhJexy+VLLe7Jesck2jx18ZZO3f
 GeuXThIkpmNQJM5MnQeOMD6kGToEN1HsLzaqYOSdGcu+V068Q0t0Pi71UjK9pl35Uow8oyPgH23
 VIwjero3alvC7jDXAQZwtojQpt/gtF6brs7ouDwzNO26scI5gX20PhY3dbNIi1z/lVpeCrwvb94
 0nWqasku8C1XmkkyUjA==
X-Proofpoint-ORIG-GUID: Xp9INFB1FN1TEnyGlHMpGVfvaQtUP0JD
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a046ff5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=6kKVESMuOeKZ7y-A11oA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Xp9INFB1FN1TEnyGlHMpGVfvaQtUP0JD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130131

Enable video en/decoder on the SM8350 HDK board. The firmware is not
(yet) a part of linux-firmware and needs to be extracted from Android
data.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 5f975d009465..055fc8ade85a 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -472,6 +472,12 @@ lt9611_out: endpoint {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu20_p4_sm8350.mbn";
+
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.47.3

