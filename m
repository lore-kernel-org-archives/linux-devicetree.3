Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AC3472798
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842621; cv=none; b=afNdN59Ecniy/9QMBQ4pdkxsd5ED3IhN5LQMyU/fOnFbOWTKutpn2wjDf5x2eE0Dnpdgiie0zjxXlYcp2aUkD2jdzpqaNmnuIeOqHDI4MXGvS0cyTjojcJE3Mv8V803mZDxzLPQDVU15YinuBQiLFNr8YC8kfaUPDXep3i315CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842621; c=relaxed/simple;
	bh=nCzaPtOgAzOu6WMMaUkEsvKLphsm8vVsM68gBNmWkoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rWSZ2kohAFn85DuZh3hYv+0cYsbtFLDJLpZSHVFmoKdy+wt79mqOqVXrnMCKw0Dg//ObUa5xUWBjWYTIstI0rurHurpNMxv7THBdpv9w56MCeHycjQ+MvtLkoRxdEBMFA4aPvrlPthKf2mFahZvM9etI9EH7b2d79NhKmAzFgDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSzHlZC+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a37i1ItI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSzHlZC+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a37i1ItI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F55U3n3512721
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xc0LIbJK2UYdiRG8GdteAjSaAc/1cnapMZKivOv4BUQ=; b=YSzHlZC+KJyWTagj
	pqBIz5MH4Cbm0H4eRUy4PEitQjqumSG5pJ3c2EwLg1XLXSsLo/uVSJEMjpSWEjlF
	SSi7G/dK9l5sEoSfRaHlFkQne/rD6+TxNzhyTMuOkWrixxzy9w8mrX7DupJuRVIz
	oD8sL77x1RlPzQgHuC1kR4WF7LCVafGtKc1gtRcxO3I1qVi/s3ynvIsPufIROMum
	hCF8j7vak4U7cErbj7WYVSD4c9rmcoH3Ql92Bf1KGLnMTZuVnWnNOndzfpWn8Sjb
	0W+wls7ethNTOYMhFc0H3HZNYMs/OHsX6p06JCBJTck4LJFKjg9tXAuOj0jb0vOH
	g4j8SQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vaxak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:56:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5163ade1583so43115301cf.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842617; x=1779447417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xc0LIbJK2UYdiRG8GdteAjSaAc/1cnapMZKivOv4BUQ=;
        b=a37i1ItIFdC7U9E+s8ljT7H8qv5Q6FPyEBXRhy/lhoHb1rqBt9jUHKLDRfB6lnnEOz
         wllrHiDm4a7gwTNoT8B150AQbGuVnulupkZ4OtMa3Kd11vK+Sh+xw1GA++tGcXqMJEjC
         wnuffPXMgaL1LswvqcXPl90P3D6ZLKhA2mm+5McJwy/4AjmnYtKCIDi7GNwdjEeKY7zi
         VCAJrCHwLysUAq3c0E9t0OJR4lXt1/qps61qDruZeNX5H+Xe0kHwS12SV7jsPw9P6Qz5
         0+oIMILs+8241RLObrUCBtPHVtQLiHLZDgR2K9g/acSEiG9EoNT2xJVM6n/lhxsJEWQk
         STWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842617; x=1779447417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xc0LIbJK2UYdiRG8GdteAjSaAc/1cnapMZKivOv4BUQ=;
        b=MJyUs+qUz6341BixkN3HdOr+IOklycpDW9V2WwOsyFGzv97S+aVCnQw5OsD181wn7+
         AkGQcPswQkSG/g3MAl244fEW1fQQqxQJhXQiyjqlIjpb8DeZVGHxV2egkfyIVm7Omps0
         owI8vkKfrUmzbFs+JSHYwH/gf0mW7Xo8enI4KYVqsucz273DWQ0kVLq9oxsWW9Bie4xw
         SN5qHaseXpc9CPaoa13TTfs82+LTF0fr9cgJBi2N1/HKeMyocs3PBkFhctu5bBwX1ad/
         924YLkHjExORmZJxdO29+3Dhq4+mtvWHnGqvoL7gbwfNlYDydjsJQpoYcfNGjOTqZ4fx
         IYsw==
X-Forwarded-Encrypted: i=1; AFNElJ9FQoLsnoPwgsSabzPuy1qkA0thuswIU5VdwZ0PwLCRaUx4TzfQWNquGM37QQr3MeldMNHH3XwDzwBw@vger.kernel.org
X-Gm-Message-State: AOJu0YyyfWpcOI0783hpS9cKs/AljXGxXH6dF9CohjQc8hS3zf9dSTW2
	05UVufC0dj2tuEm++cKcrsnfBmXnC33Vw5Jeqe4LoI69ugsHBJuuxnAKWbV1GX5zIpMAid3NDMz
	jQBicUc/b1cfw5kOzb4kzpalaXmIwlX196ptpbJ/S+AC6Mk56fPC6S5NzHyaIBQW0
X-Gm-Gg: Acq92OGxsSZDx58QEWk7ij430zA32ZMurN6wzFR68EoueTbiT5XCyNXyfwxbLRAbAvy
	/mEAhzlUFQNQqIDknTc26aFcpt37HFpPMOztX7RoomfNeNgQyGCUuurSdkFArAAA3XqHZhXZWA3
	NSfMG64PMObZqQeBkYwNfLJtAghICKs6s4rERBpP8MytapuBe6aRBrltPrEjUjsF0MjIdfcy5Ft
	0hvSh+Vdpqv7iGGJoK9WhlY/+ITZ4zoj/TNy47zWepj5ekcIJj1YP8+JboZgN0gmmaJ6oexeGJp
	kFc7Zwc2Z1+386SWnwtBCiz/pfxGggVK56i2JLfdExSmja9ACGL/5mWj/j0uTvJLukx4DkItn4t
	YxVljRpLrNnNjAwQvn10wjwgj71j9I0cv/FgyYyp/Ae5RdZuGhjVxpGdaMDXKtSUNE0sxEcjkyv
	/cvMAe5B9u6SyUASHStstVbPBS95uhvP2eRYE=
X-Received: by 2002:a05:622a:588a:b0:514:6683:2f4c with SMTP id d75a77b69052e-5165a0d1b3amr42057871cf.39.1778842617493;
        Fri, 15 May 2026 03:56:57 -0700 (PDT)
X-Received: by 2002:a05:622a:588a:b0:514:6683:2f4c with SMTP id d75a77b69052e-5165a0d1b3amr42057411cf.39.1778842617086;
        Fri, 15 May 2026 03:56:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91e2b6db9sm1240195e87.84.2026.05.15.03.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:56:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:56:38 +0300
Subject: [PATCH v7 4/6] arm64: dts: qcom: sc8280xp-x13s: Enable Iris
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-sc8280xp-v7-4-2e21f6db1897@oss.qualcomm.com>
References: <20260515-iris-sc8280xp-v7-0-2e21f6db1897@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sc8280xp-v7-0-2e21f6db1897@oss.qualcomm.com>
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
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=leB8+LKvE7kUH/wvPz6CoXenJFqROgu4EIFsX585OSg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBvvxzorg6mpVTt6wzfzmKEHOA97/fPPiuScBF
 I0yPPeAxjeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagb78QAKCRCLPIo+Aiko
 1b+OB/9Z3LS8g2BvuqWqR5uDR7+cJiH+mwhFIpP46QZsgz83QWMhf7wmOutCQb+7rCwvvmmCPYK
 X8iHqgfdVt/k4DCZ+vEyq4chvuJTdWAZU13FrYy0m0MyUF4MBJ+x+BnZB0obH8NbXUVEckk605F
 K1lj6S7/qRaDnjStpxlGQg2VQa9zRInyRg8JpiSqyqwKjZV7nvMSqCP2kjrcJUh2qeLwhJP0RlD
 AYais/TI/HoLndnRCQGnWH9xJd1tF9orYnF/B5db0SUkDt6aoCXsbtGncXvjO2vYW08YND1GNY0
 qAgd7dCiMRNyRQSvajrlH+4LClW4PpoB4PQIEalF0Wf7Ly3t
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfXxBkAxsj28LOw
 JjoHIapOhy09Wndcd+lYto915LvJCzjjGZCUAFuOsTnoPXN2dKtQuQapo3xTylNys2+z6Kr+pzO
 QHFd0+ELVew8JzyxroccEPE5WNkVpLMYVnVMERVcO9dlGtaz3q8wNGFtK5LLYSru3agmixQQtkK
 LRkVjX3J/8X+0DYJFs2tUHYaoxdE7SHhw+ZAlHF26S/nODhLTrLuUGZ/T0ucwXQCT8cAnG8K/kB
 wH0sTRgT2jgi0OBDZ0Dhu1eH48ztWpl+uvQvvdb4wEYtOQw/mSOIqeU52D0x5mPce3nZ2PNoIqA
 bIjHUMQy4Glus+9CVuz7LcBsoXchmw/2U3vpIYrlMYktI5EZKB4NhcbxXc5qWZg3L2S67IYi2n1
 MV8sbLNbUQVIlbEu6VEtVznzHRrfpfdPCGZwPhQPUNnvkyuvpinSFvNip2e40lrvemm5uauNFge
 bQ7Uzj9gA1XSkM/6/CQ==
X-Proofpoint-GUID: aUfqNkON1yJve8r3loCFjZYsxXnsYTYw
X-Proofpoint-ORIG-GUID: aUfqNkON1yJve8r3loCFjZYsxXnsYTYw
X-Authority-Analysis: v=2.4 cv=BvqtB4X5 c=1 sm=1 tr=0 ts=6a06fbfa cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Ie9TG8L8bN-JZtJQupEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150110

From: Konrad Dybcio <konradybcio@kernel.org>

Enable Iris and point the driver to the correct firmware file.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index d84ca010ab9d..0eab03495b8a 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -932,6 +932,12 @@ keyboard@68 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcvss8280.mbn";
+
+	status = "okay";
+};
+
 &pcie2a {
 	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;

-- 
2.47.3

