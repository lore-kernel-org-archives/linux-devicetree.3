Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8D23B42CB
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784622363; cv=none; b=s4rUMbf7l0V2JG5d9mflrzTjkzhhlqbn55aRwb47R0kfmHQno3zFHWoFa/n9JHHeZVErOv/AFyaDqrPz6a1SGmhLkpD3hc7XGlOEP694Lr12StyhqV8Yyj5zSqWoEC7vMBE65e8fFB+jDL6hVEyDw7JDCyPKNXQxdYf1iwZN0KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784622363; c=relaxed/simple;
	bh=/DdqN7sH6vC2NnKyI/86E3+o2KbyOZLd0D5BhQM3yZ4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V2xLfA8f2CfVGb8Nl8sttv7SzFpNL6bVVvWy01mMs8VLhOqZe93geZyTy/ZSqWetgFCeFbO35Nok0xJ4cfHU7EycNmaKy89gO0Iok7L8QvLArIFJhF7jxVkfiF2Dwmsje5KvGLDszO3lO2u/4A0oecfW4639bMRJ/Vj1ZQldkhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RvXVzuX8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X3t5M5rn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RvXVzuX8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X3t5M5rn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L44Ii8534830
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5QbpUwVQQDqNZloiqaCGHl
	uMSCwf7elJFJ/YxRp4i/M=; b=RvXVzuX8FpQf08scaQCkOxJTi+hoKCVjwarz6F
	EeTZPMmYAXRVv7bcJa2Z0muvvlVMfUgV5GyudnPCOjybJvkhHKYP+YxiP5IMTuUH
	ij0UCCJipRTPnAokuiOSHVuk/TFdpSvQ3KQVug4uqsyjgMkUmnt/rYAb0VJYInZP
	z0M0ysa4MZwlEvNOd8/L8cVLhSo+PW+Nq486XpOT/5GW8gTAWMb8smnGN3gggZXE
	7Tj7IgF3GeoT6r4AE3dRD72P2aTXVGddwvc1RVvvFAhSrd5Ts6DaB7Nm1i0mNGDQ
	eiOwn2+YvCtu+IVcEbT/4QvbCBItjF8v1+yjbI2EntH+/3Dg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1duh0qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:26:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1c7f135bso159416701cf.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 01:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784622361; x=1785227161; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5QbpUwVQQDqNZloiqaCGHluMSCwf7elJFJ/YxRp4i/M=;
        b=X3t5M5rn9LHLuhfuIuyYPL4BgwogRCs5htlZPyMpq7mjaD/wVcyN7dguKgxvwuRcSY
         S5ONZa63EzzmIppDluXUFe/NFTDfcjxzY45kpgWmQVdP5Tv9OAOCRQrCSjUgrRjIdNjr
         t6bPmvttUDwdtcEiItqieX24PsbX2dDLTSRpny01QaGRJk0Ew4YKmamW5uyFzIDiOfi/
         F2ooDdn0Lq/EmwVD7fpLPqgd0abOedHdUcvGnAcoKbn09Cnd9MXnDVFi05KrhO62wg+o
         JC+OuTCqEfPbK0FOGtTWD+n/vXYV0HNOjfoOjaEjM9/eR5hElcFRraDss0wktIw3zdoH
         Opcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784622361; x=1785227161;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5QbpUwVQQDqNZloiqaCGHluMSCwf7elJFJ/YxRp4i/M=;
        b=PQnbEEHZ85Oq9WzPLujRfqsIJf9fNhCFZnttY8fVt/4Sf7345KAZe8c3Oo0wY5TOaP
         WYrD/izJo6pepCqdOKccKXolK/zuPJgdXblK++NiNL8RxijeFU540eXOF5PGCJOYcD6N
         iMj01iJf0nzdnRpTRVbls7m0ss44m/WKJwO97qAM7GbhPEQCWUbBqiejpkWXutXQz609
         gr7LlPgXkfwclL5WnSlvYO9482QlTnPmIiP3jzAmp3yxybwXseirlGZPmIlaktrey01U
         17Hxpa/ZieQ9YqH30aOzIuRNW+rznlYgxSLVr+18Kkn7pk2yTJDznYpQf3TBWMI2Zyl4
         Sf4A==
X-Forwarded-Encrypted: i=1; AHgh+Ro7/lhFhfb7YxjTQDkCKt7KL9ejFa1VR6erX4R0Ehy9aCR99xxBcpMvM7Jh/3m8xv58wMMm6MTihyMw@vger.kernel.org
X-Gm-Message-State: AOJu0YyjhK5FqccsOB+YRq/gIkpuE7RUJjdMOG2OQ5kZDhsCDoESGHiu
	9QD8C+kBtuaeFL7zH+5qwfNLl/e+RPnatSRBXgFvPPlL6PE9dbbbpK34J2UopJcvxJ1KXiekFuD
	RJiUzAmNBQTbpbn4Z9oi3fBUoEL078/aGptZvDVDPBeAEnPqyVctgGy7+31pIGLif
X-Gm-Gg: AfdE7ck+OoSYpoG5T6Oe6NFUlNjYaUNIOl/xvBfnjs1mr60+9ZSYd4k81pDlxwSg96T
	vmSHQxx6J6m/JUUPeYu9H4xnG5yPpu8cFxqg+1Ro6+6obMLx0A1ESPhmE1ahnzT3oJD4//dZKib
	mYXAkfA+k3Re3BW/YS083fNEEp4eTKSp/xCG8OB2/nSbTarKgKV6wdcpiX9+3EISqzvGbksue+i
	HrOEzgS+0NKfId/KBPrXyvESB42xWA1lTcRZ3Dcup8ICkfutgEJ21eRMzphk/LFo3Mk+uG97FyR
	Uin2JxgS0Ta139BhcfD2YvSKxCdIRgCXngLM6iYgHIgOyp933TK3rwn3pWLN1bavC3dnCTYUAbW
	VOa9Ztez2
X-Received: by 2002:ac8:5d91:0:b0:51c:8439:14d1 with SMTP id d75a77b69052e-5213fc578e2mr167178111cf.63.1784622360947;
        Tue, 21 Jul 2026 01:26:00 -0700 (PDT)
X-Received: by 2002:ac8:5d91:0:b0:51c:8439:14d1 with SMTP id d75a77b69052e-5213fc578e2mr167177921cf.63.1784622360381;
        Tue, 21 Jul 2026 01:26:00 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956537c7desm66664595e9.7.2026.07.21.01.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:25:59 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: eliza: Add CDSP support and
 enable it on MTP and CQS SoM
Date: Tue, 21 Jul 2026 11:25:47 +0300
Message-Id: <20260721-dts-qcom-eliza-add-cdsp-v2-0-e1e52bfb3c12@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAstX2oC/4WNQQ6CMBREr0K69pNSxaIr72FYlPYjNUChH4hKe
 ncLHsDNJC95M7MyQm+R2DVZmcfFknV9BHFImG5U/0CwJjITXJy5zE5gJoJRuw6wtR8FyhjQhgb
 goihqIy+60ILF9uCxtq99+V7+mObqiXra5jajsTQ5/96vl2zz/r8sGXDIRY4yl0ocK35zROk4q
 zbKXRqDlSGEL6ZYW0vXAAAA
X-Change-ID: 20260714-dts-qcom-eliza-add-cdsp-0288fd79c8c2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1106;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=/DdqN7sH6vC2NnKyI/86E3+o2KbyOZLd0D5BhQM3yZ4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqXy0SUVJNIjeBhg6XjfROP7VMV/Jpsdry7qqfg
 /DLkRhLq+GJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCal8tEgAKCRAbX0TJAJUV
 VgyND/93jlV/RQ2Gh6act+q7B7kzuBxmKdaHodT+bl/S907RJK7uuTkuMRwh43MFiqMprrYymnF
 XBrMJuG05rsmHchaJp5PeKhMtVu1dEuVTbydQdL6SrbuZPuqXgi8RFLGLGnxbzLvQpjrWQgQtoB
 Jq8nkrwEOX5qpFP+cfTy26djnHhy2graQQLi1/E7Jbj8qVBzVkiZ2yEWiSBrGvdeBXfdz5VmsJc
 p+FtQKwCZBJVvqheG7SUze7qXvipJPEE71lD4E8ct3h2qaiUVunI+zehoOMWckjQMYB/WwZ1TUW
 jVcSWmM3XjrlnclWLpCdkEvkphIt6CDxhNZM4u/pdyDaLhKE7PBxhK33nySEaMahxbR9yYGSBnX
 cMef8+GJq+cMArJKCMxunmIN+MG0d6zvdYHSS0XhBooNLlzwlg8ZYwLpWfd4RkhqTq1Dsipn++b
 JzpssoKui88Ztpb9REdDe6ePhRXIENGaemhfg6qdQpNyfZgVe99mIOiQvHtbK/DReb9AhsCutcG
 ObQyAwaQAUVu0RC8WQwo3NMJPkxS5NMTQxh9ki0m/aZ9uB3ZdPDeAzY0WeLUxSCwrEwfhp/RF8+
 FZWIzptTYBNQlB+EVlU03eqP1xj9nNxNjd6Mopn8qmD8ORmYG/BXza8suVWO0dBPqFGXecZ2nCk
 5Z8gfy1NFvb37GQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: LFKAcz2I-0dCR2zBQ1FrN41PErDI9ndF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA4NiBTYWx0ZWRfX4M1UYlVS+l+x
 aKQa0cR5LJt32k5EPCjkDlPyfAqFny5V0IRTqUDdIj12M/XH6Ak54Nsumz7q57o6Qobca9uPERJ
 QqxRUX8WmbLxGChSlUQoUFVT0vOtNhmXbKrQI//cXQPl52D1rndXdfzsZqtYiFUMsKXxHEKQGKA
 f4FWjGncXkLQjK6BiJjpOd355IvCwOK6SlGaHRsSiDj2qgbv5yC6h0vHikuS5ohgbUTBVWwKTIr
 LJ0mp9/brP494GblJFBW6tKDL2nNDL/ia2c0icygk2M5CR9ImL+c5wG1zceVxTei6Q9Sqf6YcN+
 AtoImn2wxhtukxqRA3N/odc/B98MUab5eqV9xGgO3kYuIX3NoEWqsqzYFMwFnev+WD2AGRqb7eC
 75dVXeE3XA4S70FjMQPDtGD2X48JRBWDdF4MtZ7h+GNuvRtvgPDc3lg2ysRZgQI/JvFaW5F9zd4
 a4jf4h74Sqxx4Lwbf8w==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5f2d19 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=gq5U9EMG04s9TwDdztQA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: LFKAcz2I-0dCR2zBQ1FrN41PErDI9ndF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA4NiBTYWx0ZWRfX5Q3Eefr3/NpB
 mIj+bXBqs4WI8+oKOC3mMMn34lR9xvkfVoEizD0blJCU4taZQFMiIDrOa3C0qfuDUU7BhG19zRa
 qS1TZxqMWrK2fY6iqn7N23N69SlSOlY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210086

Describe the CDSP node and the related SMP2P, then enable the CDSP on
both the MTP and CQS SoM.

Driver support and bindings update are here:
https://lore.kernel.org/all/20260721-remoteproc-eliza-cdsp-v2-0-f3345405e4da@oss.qualcomm.com/

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260720
- Picked up Konrad's R-b tags.
- Link to v1: https://patch.msgid.link/20260714-dts-qcom-eliza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com

---
Abel Vesa (3):
      arm64: dts: qcom: eliza: Describe the CDSP remoteproc
      arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
      arm64: dts: qcom: eliza-cqs-som: Enable CDSP remoteproc

 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi |  7 ++++
 arch/arm64/boot/dts/qcom/eliza-mtp.dts      |  7 ++++
 arch/arm64/boot/dts/qcom/eliza.dtsi         | 64 +++++++++++++++++++++++++++++
 3 files changed, 78 insertions(+)
---
base-commit: 3fe08b9796f36ef437ab9328e7dd1e5ff2d66603
change-id: 20260714-dts-qcom-eliza-add-cdsp-0288fd79c8c2

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

