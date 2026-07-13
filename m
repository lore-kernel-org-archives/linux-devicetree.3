Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB1B357CF8
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 19:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783971473; cv=none; b=TnJ4OGBNmQ5dkZkVo2mZLJEiow5e8IxVQgrEp4U5p+HLYmkELw5MhOXbXMv6qW+/BMh3qZ0aUQ5osiudrpMdrKBMstCAX7sUdUJipbKzFW8FEhbMDp/nO/s0MGLOU6tykAc1heN3vvMDhZx1NewTevJHNfjDwxgel7zXn8Vj6U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783971473; c=relaxed/simple;
	bh=W+J47DLyzKHe2QopLDHxTslHmL997c14k/yofWkF6Fo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QYaskRKPgM4uj+QY63GJ6kAhOlE9w/opfARGjLcrYGixR/cZzVrVbS8uwF59hIB5ihh++tf1xe65HapsWrYkosqmFXGe79/hK7QUWHujT/mTf4EJzgugVkveZSSGYgX2tvIFGvxDlxvssO17aoDzHQcfBCio/KpFIWCJp/N4DpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=evfh9MG6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TA0SdxGT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="evfh9MG6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TA0SdxGT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DJ9Gcc2470593
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 19:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y5q6T1WOr2wk4M+dKBh9beKBFr4ByevQ7VYwHg8nO/E=; b=evfh9MG6JUyN2/v6
	kcm57M2xZK4y8US3pVrShraZJgVU1GSAWUY2PqY4W+jGYIBCGqCHJWGZsKhUqCH/
	O95LOIID3tTCFZ3KasxYPJv5qRyJh5kUvn/wzjeeLwSuacU5XrNS3+9d2DVTfxgQ
	X3gJd9vEkP4O+ZVsLY6I//NNl3+02NLUvAGY/E3uDDfFi9STO7PqemazA39mIO1b
	7jGB5cmsh+sGxbNoFzg2z90e4w1FYl4XvLqmydoYiQHGzmIGvPI3idz43zbEw+rs
	jmtXKQpWtvgQJS6wH9FvCVv/rk1H3ukVQGXKGIUY/IZjRfdKNdkbi2GzBIyOjU3j
	MpUBCA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44jrhfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 19:37:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3811ae55313so209357a91.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783971470; x=1784576270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5q6T1WOr2wk4M+dKBh9beKBFr4ByevQ7VYwHg8nO/E=;
        b=TA0SdxGTxjXNCHAzvCb64wZYdqhXkmF9mHdJCkpgSmzUY+r5EakNWzzznmpgo60K1E
         SLP4RvXCsM4XJEJnPX7usA2OjGRARBwf0hHWJ/M+UxufuFUu9xOY8vnc4LeFpwS44rCV
         89NrKTixpIjtYVIximlxDLMr2wOXROruKQQY5ZIDAUG3GfAbKfkZAJrK85ioRoPnjXtk
         OgjW9OrLmQIbMNECuo/sLFkrZ0vmRksNBzY+rzf+H6PpH4lm5YzIMnexjR1m+1R7AK+I
         X/IjK+7OfrYqJwQYcIqq6VE8lGjVXc7XBJSio0vqdB2szjlvmGVB72UgmFOEJw1LrP6e
         YjwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783971470; x=1784576270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y5q6T1WOr2wk4M+dKBh9beKBFr4ByevQ7VYwHg8nO/E=;
        b=cWqULvfU55pP2FvlBaQdYRWqO2umBhyx1eLThHEGQ96K0xa4JRohp4WNYMni6jRN07
         WlMG6tJOKO2+j/rKZ9htF6SgAt5iMD2Z9ou6KCWQwEoNUIfQWxx7uBTqSrRrPj+lU41J
         vqZ6Nq28iE9V2BW99PoEhOv56HFfOEDb04nmWfwXQj8pTnFU+SczAfNb1hNku7ixuiie
         64U3QmgAHena6OZYRNlMtWPt+lTxSasq2BQ4u2tWq/LrAm3m4MOFkLD/TKvSGQKEdKg/
         J7ebIJ5+4JBqZnHzfed7fmUOYPc42K4eHhuzsfXPT1VslB3O+dMwz0q+HnEG6lWm76Ue
         QV5w==
X-Forwarded-Encrypted: i=1; AHgh+RrPMcXKKVGdsnKCjMhNXEaK6URtHHJdptOeGjUUKXMs3ZkDOJinAsBeqXHzH6RjnOb20bJdWaw5eECW@vger.kernel.org
X-Gm-Message-State: AOJu0YyKVWkEEBmAhX4LhlcwGLk4otAOc+znaelAP8UePS/hGOz72HSR
	+LaQhj+tsEb5Oj4A0sV9f0OPN2YeWRshZrjjX8GGefP4nkIdUFdlgdu957P2fn5y3VE1rUogd73
	lsKITJpQcSH/OfjByWaep2XZbqnGWcykFiEmUBuYRU6iWl2fkIUtDbieTCvGu2Cy9
X-Gm-Gg: AfdE7cmveUNjigj9D81wfWo2Lk40dIgLStLvAqVoFfUwxBp9q/eOFrg8yob6/IT6d1P
	va8WlB8uapTHd2ZHPy8v8lJBaXnUlV4x3JrY6Y/Oz6FF3wqnuRaV0EKsHHyM5J13j/QRNYm5frs
	qgPH6LD48rLIawQ+psxCWp4UW14J9E4PVaIIQibz1NUd893p7BqNBJNrDPPaUbf4E9qS3VD7UvI
	orNW4A8JbOm+fWhrPYMcn9GVnQ+JNVuCZ87nlXLwckvxaDo2n90i1xdcQgwcfE/nln92cChfJij
	0wIJBMi52kp8TDaia+/aBIQtv0BYpKvvLpgB5oTHy6MYUbiMGZvmrpE6r4bNCy5lFn48btS2j5/
	dJmzsXKmjOPxw1sxeXrEihf6mOw==
X-Received: by 2002:a17:90b:224a:b0:37f:b0a9:1a68 with SMTP id 98e67ed59e1d1-38dc782c68emr8926051a91.7.1783971470507;
        Mon, 13 Jul 2026 12:37:50 -0700 (PDT)
X-Received: by 2002:a17:90b:224a:b0:37f:b0a9:1a68 with SMTP id 98e67ed59e1d1-38dc782c68emr8926026a91.7.1783971470044;
        Mon, 13 Jul 2026 12:37:50 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313f3ea883asm207540eec.29.2026.07.13.12.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:37:49 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 01:06:56 +0530
Subject: [PATCH v6 07/11] arm64: dts: qcom: shikra: Enable CDSP, LPAICP and
 MPSS on EVK boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-shikra-dt-m1-v6-7-bee265d3499b@oss.qualcomm.com>
References: <20260714-shikra-dt-m1-v6-0-bee265d3499b@oss.qualcomm.com>
In-Reply-To: <20260714-shikra-dt-m1-v6-0-bee265d3499b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783971418; l=2699;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=B2Dpn2axDYIMHLk1wigFR9Q2p/KX8LBdfSSHhm53znE=;
 b=wPhxBswjZZAlwtLStujD7+yOreUeucgnGXbxxcJrCntUXmrZDwz1FqCsCxtrq8T036Q9EXAdl
 anBjR+2P0oEDqNnZhlQ/QkESXOJV3ZpIIcYFLvo6FwnM2gxBub9rkhN
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: G2j777MwZKhBYjXnSH8QUCa25mZRBh4_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDIwMiBTYWx0ZWRfX6jBr+NxkWMwq
 8dcCbNkXgosZoclV2/0tMA856fT4irapoLvK4LG6x61AvnEMROkH0eoopZaFuaEFLbyEYJy2g3Y
 GXxeFN+6bIOROLTCkPMgYh4/8egO3xC185DYJlfQxeeUSvByu/WAk5rptt47uwkOYho3nmTzMqN
 Wf0bmgYitqf09PFJkEFJMCjq8tYcUr2IVub7iHugOCgNbNIEi3aB6AG85UsFQBWXFj/1a79DXp5
 zbVzSvRrkukEgnsuVak6ademxKOR0XrkZRu/XSoIpaVAQIOnVqEvhc2HIUXxAY+Eq5JWyMjN2lu
 5LehU7qrUvZX3JrPHD9AfyyU9eUN589X0Lmhal7NYUnhcn7xUE7ftnKXpuwEv6VmLlXbkSUDqsL
 W769KZju0f0H4qdQUjw0ndR9TdvjTdvKm6bFa4dyWETHZes3aSBBm2/5QhMdJTYvy//90mhD6ba
 Hli6lQJ3/iNxgeE81Sw==
X-Authority-Analysis: v=2.4 cv=XonK/1F9 c=1 sm=1 tr=0 ts=6a553e8f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=nu3v8zf0uA-Bo5sjUnsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: G2j777MwZKhBYjXnSH8QUCa25mZRBh4_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDIwMiBTYWx0ZWRfX5YSizIuXCMdU
 9uaQdXguTTKtFtLgXdI3KfTOby3bTAMtfmb2caJhT2DIpJbu9mNxbZu8W5wsDaeJyksU41SxcfM
 AsFLnXVBpj0bsSVUmm+VmS2QJrQxWas=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130202

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Enable CDSP, LPAICP and MPSS for Qualcomm's Shikra CQM, CQS and
IQS EVK board.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 19 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 19 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 19 +++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c..b112b21b1d79 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqm/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index b3f19a64d7ae..e62ba5aef71f 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqs/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 3003a47bd759..727809430fd1 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqs/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm8150_l17>;
 	vqmmc-supply = <&pm8150_s4>;

-- 
2.34.1

