Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794956471;
	b=YTOC5uErGfUzfoUZTZgHXi5f4zlBmmUngHBx5YOzsGl52oy09PNTMbIQneWzAFFlDPee
	 87SXIEIx5k/+0jktzLsF/TwaXGvNjj29Mae/2XQMwISrNIYqKJ9y+e0DBMWMz1wSXzZ5C
	 r4pHd1mKil3T390cyKWs7YSTKVf2CFPO6UfsPzq+WOYD3gNpP85Q08uCSWIsGWdkAaPd+
	 fL3/yPsHTu1Eg9crdMK8ZlfH+admBX9Lfu3jbO3jGQunrb4ef9qhRCDXN5aetTvAq55it
	 enoZkMYctW5ZKdv9z3LRWbdLx0NjXjfs9AOjB5ITXQhok4foOgnH3qpVp3LffpwhGyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956471;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8oGuG6gtDFzH4M9TtmWAc4LvmLxE8dx3JMMf9s41U1E=;
	b=ZVI9pNTazC42N3r5UtUazQ+j2pzRweFVyiuw6+W+DdY++WJnHOmRhY771UFHy14sPqAs
	 MuKK+uKjwzvwIjaaHbf9XF0106ODJrn3DQ7s8LnZa7bFTgczO2xISDCiv0szgrcYir/Sb
	 vapOgLD1uGvSs45pX3YH+MiB83+kXIVO+RLvyTfWau4nHOMUbAHZHkfw+cEfExrTiyKt/
	 l1J7I10e7yXiABEWEgXI/LyZQ5TvnqWJCYaZDMzJMnfd9A4lVOs7GlhEUYn+2dF568YgU
	 POsmZ3DbHkGexjwZZQaeTBaRm5ZCM4sa0fTf+qHiM2GiDUnRcnifKf/dNPgiDykuSog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IG6ynn4M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FokxlMrB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876AC606A330
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 876AC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IG6ynn4M;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FokxlMrB
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMetqm1958074
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8oGuG6gtDFzH4M9TtmWAc4LvmLxE8dx3JMMf9s41U1E=; b=IG6ynn4MfORNEa8i
	XJ7nyp7/PSx00XDLozkwGJINbGUMdPwCV+pXCJWRIWt+TsbOydlIT7Dk8YAcvJ3e
	XxnfGAxnF1pHN5x7GbuV0kQsuMYEsQp5F9DfsJ2wPb4/N8mnwjm6LWX8EK3VgYyM
	g0MvMCfQdsPePuGeCuUPDRvwpdMr8pWHLWko96mlHQeMpclPd90+KxJ5FnzGCFVs
	2F0271fpw6lrohvi82PoDOSLs+XH03VMWkpYMy/srrujEySvw4dhQKzwbbfqb8gW
	22WShGo8oAqo3KBnsGt39x+pv+nUJYRhpay5kZVlw8VqpCvDPUpHajfWx3/9pJbd
	yJTKSg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv982kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:01:09 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3b63b9665so239348c88.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 15:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794956468; x=1795561268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8oGuG6gtDFzH4M9TtmWAc4LvmLxE8dx3JMMf9s41U1E=;
        b=FokxlMrBZbZaCJq0g8KFfdtemnjJdkHBo1+3yVozv6R1YWFJPpae93m/XlHY8HOYcW
         t8fsdbz5Emai2z1fKz2oJa1th3HxlHryk2xsGiDOCr74csUS1BbqUAf8uc4eB94odBTP
         1CBHNtgTmwKc9ybgX+BiXYMBkwCwXs2pzsbH5L8RxRi67tiF5re44cjGuErTY1W3YJhd
         HDUt65/4Oi11oFrS9Fvry5oTzzdIR5lMWZjg4pBGObNIu7bbxYVEOfLCAQvqZYRuZQ32
         pm6j3qcKKf/RMdeSS79S4cciFclkamELir3zuu6TpmferVPW2S2F0C+UFkKK280Y6ZE1
         j/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794956468; x=1795561268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8oGuG6gtDFzH4M9TtmWAc4LvmLxE8dx3JMMf9s41U1E=;
        b=eaiutXTKa187oW6o9ytOG5R73ZWA1OPzGLXH0ZDwnyYi0TlpDaroNS5uQ/Vz74KCQa
         G9Cx0zZllMmALSqb4zNP5CXynbwxDH/XXS30Ryfsxas3uRekMrj9AR/ln9y0gmDZDTjH
         MZ8FKFnzzkyW6DgolSWbP6DHXQhBjOQQJSIW+UxBtz0oUCPHRc4ADCvWyLdwyM03zTtf
         EyGb5hHs7JwbQF5ZDeBaQ8us8U49Lpiuww0tcJuBTxLuJv5XnHf2BKI23OO2VjbGmFZG
         t4OohBphgWj7Av67ub2oV4eWuKdop40R/jkYlinlKLO+7YjUGprSlfHbjwkW54/b0KOc
         DlQQ==
X-Forwarded-Encrypted: i=1; AL+hErEElZ3jMGMBurY0r88muk0SQXc5ZyEEezsdSQaYVFgS1f0KA8eB1YU35ixsfjT143z+a1t0Ml/Tbfjn@vger.kernel.org
X-Gm-Message-State: APuU4Z9pWynpTAKYVtvtxlB8S+b3TkS9/UNyugT+5pQ30f8dvu5SUsUG
	JuQ/mXclVKICn6eNpkMB6/KqlpbxLvRTA9Fx8DqIwrVDKdEuQ3nAHPTLOIdUKEa8L2mqtvZYk76
	DCId2EZcHzmEMlWxUVouqi5WRZu2EqSoPk1JaLuolwiuLotaJm3OvDvF1leo3l7sh
X-Gm-Gg: AYBFou3ug4QM6pQSXi6u2ah+b/x9wzoH7/1rCJg2hGysYhBc8tr5Z1Ep7MJVqxYemd/
	lfM4ERPp5eJF6BMqR9VcDT16tU6LVMlDeY2U3LinxijcizGcInSOT3Pj9M/MotD/ucqjHF+PXPL
	BP3xPhq3XG8KK21XePTsJiZG+GZmAAjpiQ67H5CbPyqEEoyZMzsYMT4CVa3x/6IYwPGFWLJO81q
	TwlFVS43arg5Az7mwDMGyKiCmc1XJAta8AJQ6V/A/dSMniS+/toimR2id2cRAjHhZm7Kw95VCqi
	UzNBRz88ZlPbKjlz2WL3CQ+pKkn02WwNid4drckn42Tzk0YkeEpooiLwpeQuaTwpHBIiJm/tr/2
	TA4UZY77ZmV/2Mda1ctGz/OH/NJw3sjtWiXWU5w8HYB4eRGupdgAmbNnBgruIREC277YKi2hpOA
	==
X-Received: by 2002:a05:7022:1408:b0:1b2:366a:e7d1 with SMTP id a92af1059eb24-1b543d3cc31mr799582c88.32.1794956468261;
        Tue, 17 Nov 2026 15:01:08 -0800 (PST)
X-Received: by 2002:a05:7022:1408:b0:1b2:366a:e7d1 with SMTP id a92af1059eb24-1b543d3cc31mr799517c88.32.1794956467368;
        Tue, 17 Nov 2026 15:01:07 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5445eb29esm1380839c88.0.2026.11.17.15.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:01:06 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 04:30:08 +0530
Subject: [PATCH v2 5/5] arm64: dts: qcom: nord-rrd: Enable Adreno 753 GPU
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-nord-gpu1-v2-5-8d6d9908b7c5@oss.qualcomm.com>
References: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
In-Reply-To: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Shivam Rawat <shivrawa@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794956423; l=813;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=PC/6atmGOO+qaJdXSQTumHCgKU+rZftW+u9k7tGoypM=;
 b=81oJm0yeVzyC+ZdQ8YeQRpGgoqhdFgmG7SzEXxTKhIsLI1fCeKTL9ePwIANNm8mrrw7xegEy3
 9ec6KAziGSTA7y956YGzjhQFN7vKgoYnCfCMxA2xM5oEu1cy/MU2psi
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfXzAEPp1kPFVeQ
 75u0gRBakia1HggvXPcJhqiuo2ecDUS/YUdNkSGBgHdaPL588+uXpbUh/8mJaZqGMjCFtgtvuEA
 7bNtj0Bm76lySafQHzdv00SRWPvUxCM=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afcdcb5 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfX1A6pPo5vGRTN
 pqrQsxMcXRQQwr1eWD9W8MC9291oOcG5r3uweijpYFns7i3XVw+5cCcfkwddwpRcptCKwt8yBmi
 BE7uYFno8lo9fCo3Cjqn7ONrkAIoXunTyqyQ8/G5zbK+0Y5W+/JgZwWzSO9O7afKgSFaOKR9rj0
 RhqjJwkJo0brCbLRAoaMPKLPVV2hjwnxqyPfvd6COy2FKQNrMOA8z0pWMJxf7sXgYMfsVXuyfRY
 4jkcj4red0PdKxFc6XN0XX6vqtSD7T6UC4uzfgECADksiM9704vP8FAmXQLfdyGHUzCSuaoCl4N
 8OXvvECQhBdY2WAG1Zl0Q2UxEC+rQw21P6n8HPeVCftBYqI9b+w4CNEh/mmMeOVi6BuUrZdGap8
 up1sTnx8bJhVadJqcHgQMHgsw40BGlNasa/t1+AkOo4xlk+5AIPRumg9v+fT/emGKAaq3thmt6z
 p2qVnOKMDmz7q+dxOlg==
X-Proofpoint-ORIG-GUID: GTIUS1EZ0A4DXxckWEPPAob93mSgzuUR
X-Proofpoint-GUID: GTIUS1EZ0A4DXxckWEPPAob93mSgzuUR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170091

From: Shivam Rawat <shivrawa@qti.qualcomm.com>

Enable the Adreno 753 GPU on the Nord RRD board and provide the
firmware path for its zap shader.

Signed-off-by: Shivam Rawat <shivrawa@qti.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..51e5ef927b7c 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -366,6 +366,18 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&gmu_0 {
+	status = "okay";
+};
+
+&gpu_0 {
+	status = "okay";
+};
+
+&gpu_0_zap_shader {
+	firmware-name = "qcom/nord/gen71300_zap.mbn";
+};
+
 &i2c7 {
 	clock-frequency = <400000>;
 

-- 
2.55.0

