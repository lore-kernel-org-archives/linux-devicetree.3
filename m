Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6A73ED3C8
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875041; cv=none; b=Cq3sSME7YnWDYqAUkmmgmYx8pDMd5SM5Dewmc2HrMSQuHQbNxlm2KHBYYxzN9zihdm6sdlNj+PEM56IZ6IFDeshDy/Y9AIzb9toXcxa/GgDsG8QV8ArIzMChHeoP7vhIRxMLFFuuZqPAPdO3ttlSSxTuW9SSpH9ZF77UZ6YlA/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875041; c=relaxed/simple;
	bh=ITqlLQ9Udo92Y7Wrxr3GCxCb4jJWWDsjKmMjYs/NfFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zn6wOnnTS31bSJyZWQwOuR0jeP2xPMdjrImLwx0ORR2eYfDyJuw/S84PDg98hH+f3RZgaKeo+yh99dSeqGlwHgitUjS+dWtgTkf4dkZcSqL10/xUQvSh9s7O/Wp8oJ332beJMajlWbhZSqqBerEFzhw/E5TKNAxV680Q7TxLwE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qj8XQtL6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=byL0GaoW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qj8XQtL6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="byL0GaoW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mUrN2282563
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ezqTdwQnUiN
	4UNQQ5cBICs2ytt/GCSpOUwmXcsbrcV4=; b=Qj8XQtL68Gpdo0ZcBVqZ0c5v3ez
	v1trH/FIS73Hlre0XyLEqjFrCJ9k3xga318bciIn2N+RNP0GeLw5xD1IdUcA1sjh
	gzntCLVPn90ioiAz7DgutRxTia2x6fXy9+BNZxHaD7Vri+7z+54gbk9/MNztbmAc
	4oRo1xl2mY8RbotsJV2vQNNutg9jIlTLPCfLCouNbYAmzwyS+DTExyjpiPbISM5h
	0rO4bankJ5w7Bvwjum2ATS9bxcwUmTW5TsvlO9o+jH852jLRw0qUWB91xJPpqdJ6
	VqU8EyngxozZiH6Dti6uydwk0rjSHC4X2QnbDtGtMfQUPdG/jwtQTt3CzSg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edtvcruwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:43:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba3245a43dso129298705ad.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875039; x=1780479839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezqTdwQnUiN4UNQQ5cBICs2ytt/GCSpOUwmXcsbrcV4=;
        b=byL0GaoWUnb07uHHMxdM5WoHA36vwq5gP+w7o8e4iHMh1E4CbKtA7HPkyRQZJ3w1Bu
         jtx2M/rPQNWs60TSYg6kqSCCjW9vme1DGe+OWupVy9T+QlbD4VOAi5Ul2FXI8k3twBhY
         +y6L/ew5cthP4GQpKylWVi5fydfmbr5T0PZVWbAPu/IJGBCuFZ3YCS2Xbh5+dGlz31Ut
         4UiLOXPOXJl7w/7GjwsLIDx9efYCWQn4ZvAkzT+Rgb4UNS1ndChGI9fAFHpaNYbBTDqT
         IXiT3HHZXdEfIXsIJrqBntlRBOs73rZWubksxDFTibSqgXuYf5D+4ynGLpDvakTKETDB
         8chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875039; x=1780479839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ezqTdwQnUiN4UNQQ5cBICs2ytt/GCSpOUwmXcsbrcV4=;
        b=X/Ux6mAHrIjKdseuaydituk15y+Aw9lqq+dZ7xfJmJTDNYUWEIV6dgNNzy2EWhht8M
         8fGa4ObiFxD+sde9ozGcolHQpDyfKAOaT1Qge3qzQtjl3rMy9FI1Mx7OBsxVh7JCsA1Y
         +63KpJQbk41PZqY4EEemQ8wNCGYcNCp45maoBYqRkSbWIK2g5rKWvGANzEn2tD8a/v3Z
         a4mLaefyO6SR/Eeqpa0X+EXxemNb7nEH+4sEaR2n9MggqpPCH+yzMxiHvhWX4Tu5lRSY
         xNcJm9Px4WGaUB6awXFwU7cKVt52Gc+jL5v12S5iugAUxF9KfRR6wfmFbkFGxWjnWM0r
         qNEA==
X-Forwarded-Encrypted: i=1; AFNElJ9v7J6z5rtc0EvBlELdgOYbp5KueuOX7T/a05GihcXFfsd46O/wEEhyem7WKAivlN+e575DOY+Ir64n@vger.kernel.org
X-Gm-Message-State: AOJu0YzDBjRMAl/R4CA/V6S7C4Az+iWg58o6PdlOSKUgFmHOikSQkQtG
	nCfnRlWG5YeV3zERmGTul/JUJOBhbx1WCoSI3KTQbjhbyM7MvXDRRega7gnbvr4Af/MMajzHwFg
	dUIegXX54hxo3mM1026/3WeLAlJEw+3tTQ1wChtwLhfVNoqkQm3QW9R5yvYAhXMCO
X-Gm-Gg: Acq92OF/QQVWJDQJC1r6ZFYkZxsI5FkJaxGU3pLgosUnrqClrq2uiSDp4NkwFGZ/9vz
	VP6eYcGzZWLHG9uAry/ORhtnQRuD5aUaj1E3sjUWriMdQuH3qFWQfH9AU5HqbJsgdaTcbpRspD9
	ctS8koCQdoq5hCniZOz/bJV2yvKXzUgv9Bx8dIM6n/2L34eQr0KB+ne+6Cap+vuDVg1HfcYpw6+
	Ite8zn+k8EIlk4WGhTk7kb93NEJVAcxbOmWI2jKSAS0DXPzonuMIGFU6asx5utnUKCnYSNJAegu
	xWqnFLMvDfqH2tWyD0OMCK8ObyLoSrkd1xWLf+/BWQbOfca7s5F/ig0dk1CqhZw927X5MY5gf09
	nVrYaP5MwL99u7ZANRFR0dky5vCHHA8yiD7oc/utwapru4NP/Uk5k8rStDNI=
X-Received: by 2002:a17:902:d4c9:b0:2ba:4eee:6c1e with SMTP id d9443c01a7336-2beb037693fmr242316215ad.15.1779875038469;
        Wed, 27 May 2026 02:43:58 -0700 (PDT)
X-Received: by 2002:a17:902:d4c9:b0:2ba:4eee:6c1e with SMTP id d9443c01a7336-2beb037693fmr242315995ad.15.1779875037938;
        Wed, 27 May 2026 02:43:57 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:43:57 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 04/24] arm64: dts: qcom: sc7180: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:09 +0530
Message-ID: <20260527094333.2311731-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MFlPIG1QMlHHA8VCK8kqn2DtlA9NK_w3
X-Authority-Analysis: v=2.4 cv=CY84Irrl c=1 sm=1 tr=0 ts=6a16bcdf cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=tDF5iQw9XjyWUVTH6D4A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX1iPtXlnQQpGQ
 mnnfG1wMrhUeTq1yYZbB+Slqm/xVH1xEoywzk70DRl0LJVaJN0nB5CUj1Vbn9pYcnLv/+QqZHGc
 /Pnrl7TV+welWd7bBCprvB2PcFr9Y+IuLRgGtLlpP9H/3cRC8u6y6TYDUuJNpiJbLQXU75fdK5/
 tu8o9pWiotQFFmmWNdGd0CtCRdUtFNHrNhEApwvkZ9lVhAB7QmQDDwKc+AvtlkuvgIih+Wikosi
 fDBS0OxG1bbdND/4QSEvjGfon/JaOchy7+dG0fOKqV3MTav/Llaib+53LtTZjTGHYraaXHnLDuI
 hzYysFdkKNdYERF6AJKMrpVpZozjLeg0nKtCE8lwcu9bM7RX8xQBY+vnKKVdiTj2EQLp/GJaZR8
 ZTrykwg5D9+e985TBrjQi8AeIdigk71aLKW4sHDnQXKS+HIe79toWPO2ILXzfTcoOZncZxWGNP+
 d+v8QHJXcgPnYHOwmvw==
X-Proofpoint-ORIG-GUID: MFlPIG1QMlHHA8VCK8kqn2DtlA9NK_w3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093

The OS PDC DRV register window on sc7180 spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 8341a7c4a4c6..5d985a48a62a 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3510,7 +3510,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc7180-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>;
+			reg = <0 0x0b220000 0 0x10000>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>, <125 63 1>;
 			#interrupt-cells = <2>;
 			interrupt-parent = <&intc>;
-- 
2.53.0

