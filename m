Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E5647D93A
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034392; cv=none; b=bipIIbtwPrjvPjZKVG1xfVAI1sI5hYEbWzkjE3R6KXvJNJMtdf8R5srbTWKfEuK/c+yyDTUEQ/1XSPy9FkYvu7NWpfJhlsfdFLmwItwT6TfxxXzMG4FWWp3yxtz+RrAD1uggZJsMrbdL1vjqBMSU2HzO9OO2x5R6cangmb4icXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034392; c=relaxed/simple;
	bh=OwDhqAA2uO/F093Pn+M2f/ZO6s9esDXCzLQX0HD+7AE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ddf412mLj8w2IKYffSCAhjGs3lYVCKtz9W9sz7JV9T35L4x/v9j/LwAaxZ1mlvj+UIybvzeqVo4cRalVFzSGykz5MLTT8N2OqZE4ojIrbor3Ikrg3kZMcYhotN953iEAKwvcsdyP/ZhyE5uv/b4SkS8WyHQ368BqdKWJK8775O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ra5QltlP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L4fPxnFB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ra5QltlP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L4fPxnFB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBNoos376976
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mMfjv7N+IUr+8DUXpwWiIvW4QRhrIOegOkd5Kb/Jmdk=; b=Ra5QltlP/cSQ7bkE
	Zvugr8XMoFQ8G7cqhoV8OyX1QvMszA5sre41rZvz7RQC2X0Wkv3iN3M/jj+HI7My
	e94EQUMjkzYeDEKN5ERFIDzoXMJa6EmmH/aDd7kxtZ5UFNXjI4AlnF5UA4MAdFYr
	hqLWsQrEVPy+3KEj+uvQS5lvl3d//0PioLksw4ESJ3fz74mKAC2zoNp6vd6s6vJo
	vKcGg6cdiEyaJwirPsVUTuUv2EyUtceEMGk3v/dpOIfqav+jVFpq3JVH7Msa1rP1
	7gM5D3v0DCSruY81wLHyWH82gaOsUFlp5RrybXM+YfY5bdLVXwCvK4KgZbk4RXGY
	uKdj+w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdbr4acm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:06:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a236220so67890691cf.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784034389; x=1784639189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mMfjv7N+IUr+8DUXpwWiIvW4QRhrIOegOkd5Kb/Jmdk=;
        b=L4fPxnFB4SADPP0ohV1M8Uj40//RGNrUdaFSxErukKw9i7h+P+gPNV1HMgePe0i8uJ
         YWm+NoZ7R8XIu6lLvkQ9L3oiWG5MSTUw1UBw9q5zLeP9J0+HfZ/87tBtYStYHGHayqPi
         ozDNKDLKnHbcQ41B9OMWAbFMkDKIr8Q6Zsr9oxYKWWQK5Bf59/uyOsCNjN3Rev0l2Nqz
         ZwNJ9LaQteSvZuzdIunAIH5krgkVzv1RFFOWrQA2VKtzpMsXkxgaxvSywyvvtQm4LCcw
         e3Kd12PYm+u+Vz5wPklO+oq0K0/lix9EhYKUHojvORsIJemzSdo+xPl5+xUfJCzrXXO3
         Ie2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034389; x=1784639189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mMfjv7N+IUr+8DUXpwWiIvW4QRhrIOegOkd5Kb/Jmdk=;
        b=fLkoBKML7wvZoWqZodGacKcLMVXYfW885842N3MoLu0fP1uWANCaHYLvfWfjGYknt7
         lxt1839mqvwlFuHV96NaaRJvWIiPZwhsQdCtwN7pQ3k5IQmonrtMosaN4xY2vhaQgqbX
         kU4lQlN05Ocgbhnvq8J/d2KZAzjHGabq9/Y+VdEI628FfR3Gp9JRuUsuZP3179fRrMk/
         vHusaYf2/wBDfP7KJWUh6hezuHqa2ymRQJH2l7plJQgKO0mTv0MWg+E727s6ReiH3CXE
         K1/rHT6HCnL3kav84I8CNtIXa4VddlrWKmD7ynl0AW2lK/KmEpo2t8jT0fBdo9XjTRh7
         NUjw==
X-Forwarded-Encrypted: i=1; AHgh+Rq3SxHRYB69R/zRvE5ysLqaVqxPz4bfFvF1u9EGWGnConNyJ8VyIo9awF+N9QSNW+tm728lbyNA2kXA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw++AcaeSAnVzn58fCslkWpU3EqMHNtArH131hAyFcws71Bq3c6
	kdFSIe9WpnVHexiyLotPAwO3yDXDsDAf1pCr4rf/yLzoCWH+84DXJ7brG2RoWgwFA6pn+CDJTiO
	zEmdqAH1mvSnSIri9sryCOh0gSV8DQpDhPy8u5RcOgp/XOdBp7YQXq98/UPgKU2TI
X-Gm-Gg: AfdE7cl6Me09yvWpyajTkx7YXkkVdozw+1rwXMgShykCjjpb1WlcIlGMOjv+ienGEa/
	adqvIZKky9KJZzKgF5uNQQaJKtEVkMAEmQoRYAcUF1ocvGYYdcXKRNENjtvpbgszhoaqCcjxfJN
	6aB6sVc5f0eIva9w/6YsoY0xnQC0EAZ5oVw/W8rMK0E608dTJA3QPES55+I/1qbXTMklp7EIfoK
	bGK1f4yGuI6h8ub1GsNlwx2deTH2PIffz+DKpCs3U9OyPYrNliGTue83y066xZVbSlIr3/i2Ahv
	6TVCrHaBUXSXtnVajHQEPBRGpZ6m4m+tusv7jGJdBgklTlIcU4pjna45Y119ZYeFAfYV5jPs76N
	f2z7Y2UqZDiQ9FBY=
X-Received: by 2002:a05:622a:106:b0:51c:7b13:6302 with SMTP id d75a77b69052e-51e3c39d1f9mr35236831cf.88.1784034386686;
        Tue, 14 Jul 2026 06:06:26 -0700 (PDT)
X-Received: by 2002:a05:622a:106:b0:51c:7b13:6302 with SMTP id d75a77b69052e-51e3c39d1f9mr35236291cf.88.1784034386052;
        Tue, 14 Jul 2026 06:06:26 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f47688f29sm6323742f8f.21.2026.07.14.06.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 06:06:25 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 16:06:10 +0300
Subject: [PATCH 3/3] arm64: dts: qcom: eliza-cqs-som: Enable CDSP
 remoteproc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-dts-qcom-eliza-add-cdsp-v1-3-525e757a23b0@oss.qualcomm.com>
References: <20260714-dts-qcom-eliza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com>
In-Reply-To: <20260714-dts-qcom-eliza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=809;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=OwDhqAA2uO/F093Pn+M2f/ZO6s9esDXCzLQX0HD+7AE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqVjRJWlT3wWMMTl2E+Fe02SKahP0gjByNv6Mkp
 MLpalF48EGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCalY0SQAKCRAbX0TJAJUV
 VodgD/9aSNNbPoM0IObILwEFLP7lTKvcmHUS114NMstb5YqCiiJFcqrWZgGvG3HRnELxb40bW+M
 RkQSZ1tS2KIjVjvO6VTAM58p6SGvdBWuCMGJhKGxrvBpSHozrBl3NHUjRub9bv4TJOZAGcEjT1J
 4Hlp5CfpwXJ73nuxPUU9h0OUPMWQu2o4NSPdgCeeZa/m+8wA8P+nLm3utNCZBuAbiy0hQOxh3Ax
 FA8pplbABIHlCd1jNKyUbHhTz+/SY+sx+D+6JEbiANX9pxmbNyC+BxkZwVf9a+sScEHkrWRorDz
 W2kaXfa/OSs/TuyR0jInNLkmyeRXWrEyNWVL5J1P2bXyxneO2/+UbgViPOXyzjNe6DqpLi5WKaF
 xV3RSZpvm2EUYAWj+TNTLQ0BRWclT9B88q/bdlpZ0FvxzaPDitlBN+3+mkF1v773Ka5BbVBSX6S
 MSqND1vYCi+u7vS6gjKc5e/WuQz5zdXQp4E2sDs2FuEihj3X43P0YnUL8p/2eTYR8q/z2h5viN4
 PMbmXBAz1479mg3wgsj+bNUegxaYW12p4VWKU3NS0T78KZtrN7NTeicHZcUfwIV4+4zhr6M4UwQ
 nvJ5zjfkt4nySRlWwLvqPhaacgVRSf88Q40rU/hhZ97OKQu/7RnRwZybTW4Rck7moEpi45gu9k9
 05yAN3hMDK1G7OQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: xWvlcMjfLrDukNz1orCzrZrOZi3fbefB
X-Proofpoint-ORIG-GUID: xWvlcMjfLrDukNz1orCzrZrOZi3fbefB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzNiBTYWx0ZWRfXyyHLEuckgJNr
 t9rczjBIrLZ/EcsNrMHJCkRXNHE/bav7GXZSiKa6jDctmtmy8Xyv5hhVvPAtn1F+cD0qu8bQLRB
 I6n+pEZIIvS6xbS001qDKXYbvCI703DXkEWdfR7DSxBlzFdOjPSsEDnhlMd121BSGbYjFgtG93g
 GFyEqq0YRxCp6CSsvR35HQLpAzBq55QCf/UARnxE+y0c7Qtl0aZxhD8kJpTexJT1vnbvXopWwBc
 K8oKEiXJSlFdZNSkPRwPnNGTIkmMxjQ/a0nj2mNF1BMPnjc6TuGWGPmHn1qo4H0fmqBEI2BbGvu
 Y6nbhNPbVMmkxLahw4dbuCWgx+01aSDZU4x8wy7SM0Hw6Zr0MIky7XQ1EIJzpaOfx11gRIJVpjV
 7dQ53b3T1jzrPMKOtWO3LXh98BInAhLy808zD34eUH01nB5ZTIfvTJb6NxtV7PtGf4FkYWSx4eu
 5MlSowx/P/60K0qIV3g==
X-Authority-Analysis: v=2.4 cv=F5hnsKhN c=1 sm=1 tr=0 ts=6a563456 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=27Bx3adQT_mWtQqGTPIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzNiBTYWx0ZWRfXxkHE6LS30QV0
 vuZ64opDz6fKuWQ6CXgZRrJOo+PolgTI0l7Chz0+Ryco//0oNI0GofpfacDIgYYMK8jaLxQBY7Y
 9Xs3qs2LkypUrgCxWVcwY3EtrlP9qoo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140136

Enable the CDSP remoteproc node on the Eliza CQS SoM by providing the
firmware names and marking the node as available.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
index 318ae3c22351..d31267968cad 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -376,6 +376,13 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/eliza/cdsp.mbn",
+			"qcom/eliza/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&vreg_l12b>;
 	vqmmc-supply = <&vreg_l1d>;

-- 
2.54.0

