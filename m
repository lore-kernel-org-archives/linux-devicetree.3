Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B52235FF58
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063509; cv=none; b=PBeDkscDDBNHZRwdPCcq66Oyc2tnWG/dUjS4R67qlFsFgUSeRNa6KXF6JOokwKYPnLPdh45q+ezJzaHLwwyrya8Q2Q3eJfnWiAEZ/yqgvoqM4IISjj+gehjhEFqwgOveDvV9Q/eCfT8kmymUjAL0ZaBEKmtvfJx9iYldZt00TgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063509; c=relaxed/simple;
	bh=tdYKWjc+NjQwtKiNkI0tCZlBsk6Wmv8Tj/eSc4bfL5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=se+NK9L01H0X44mgY0NdGjpY1KpZxMYceECqQhZCC13OF5PqZ5D4dkD10xy1CKhBTxycGlP4Bue6yIaea7mriyEJuRKMeFFO6auQaXyk2+2hZd0k9rAgrFj6ZcCxqaKxCAWpTLRyeUFkR1BnYfiaoxb6cBefzXJ6X/IvKPyGkLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UqMGuSxX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aDvSALQX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UqMGuSxX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aDvSALQX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M7Crgs3676944
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	910/59ZjODSQbXkyNHJ28zOmrunXaISfYgIhTPij4ys=; b=UqMGuSxXUoBZTGfL
	T3pcFrYgxMD+g6XNwSEf6hTuGuxSLk5IB8OwYssvx2FVAYWcg86QUPtyg2dg5lsg
	850KlC0kvZlGk094PBqhalUf+M7xj8IFtDQZY6JVzgfqhzXxILu7NBILeReXTQqZ
	9aXs++aVcdL5Y/PMmgfI5gfyBmwb4Rf988gtMZw2KXMY1bzkVaZlhs6cKBuf+LTz
	qkxmIs+kQVADG8uxVAJlSy8s6Z60KcW7wtXxS2wZ3G1EnXaqGDwGBguvTskbNTRW
	7ZRxd/N3bPIa45uJvvdQiUSgPP1+Y7fOpISH0LLL4PyCfyfG9rsA6U/Lo4OyX6yw
	FHvFFQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu85vk3np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:51:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9393ac4961fso518676285a.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 00:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790063494; x=1790668294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=910/59ZjODSQbXkyNHJ28zOmrunXaISfYgIhTPij4ys=;
        b=aDvSALQXz+VJqOZraf8Sm7Uf9i8BmEwX2JKlTRS1PPr3zsOKt32UBGONOBqlZwNrnP
         iYXrgcnOfadsQU4cLxF+aQxiHZkaYzPQqsru2/D1kIAKTqOrB0FOda1AxfSUPXz/GCsy
         dzAYwJmCH9qaLIXBbScq4dA0zSXXL9SWLk8FlWVtvywpLGedmb4I3mR7zWekGZdmc7BV
         PGmqzx0GJSdy4uaVRIfnbTyFsNk05D4ApEkTYjZzgBjMctbh7NKd+KMVLeJzBp2lrCHO
         5pqhas1L0XoRDPeNl7tdGYD8fqpVBhyxIKfhl0Jg4/xRqnGTv6nLiOnm8ou9b7vnZN8M
         Z62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063494; x=1790668294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=910/59ZjODSQbXkyNHJ28zOmrunXaISfYgIhTPij4ys=;
        b=nV5OFMJ71zxhGRxZPvKqmZjk7+Q4+Zb0CT7629NS46WLtIu+dXfDOknkNo8L8ZgmE/
         cWU9MPFLLQFv7+blQX3+OQDqZP3A5Qr6HtMumrDjrFFvSkOS5//yKWqr9JhY1zahv968
         a7tyLQfPV5aC73/2dfp4wvwsWXz3Pb2pViQaigZvMGRDVr/RVO26e/aW2y0uQFxHxaLF
         GCc6cz0QOkqZkuIY1i9axqtlaMM5nt1q9FMkLh/MGs0YRWlixNMDz8/9zraKyV/ZyZ6n
         FSWrzT0yLxhT+3GajbT9c/JWhWo5ByPcqDK2h2Cl6OxC9aon5kzT4yNFiC4HB+xG0e6w
         pGIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCJpEcDcVehjyRJEzqSQPEvFSvhDB8zQmIV7T3oNdSwK2dA4pwelE5RD2otvj767WfMvbyq4Z9Abn6@vger.kernel.org
X-Gm-Message-State: AFuF++kNIic+kZi4JoXdx/oDWocyJxfD1KCH3EHNvwUjvNRYAYUPyhCg
	hw3IQ1e1Y3EKZHZZF2m27Xagtxdw9L6VA/7i9wjzcfohJXuCsBliJPDWogG5Fmd1NVCoBPNMYBL
	3T54MI38SsWRx0UqDrWQexDHb1cOojI0awxUGpbh7t7P+LDJli/kgdNuC1mFoM+P4
X-Gm-Gg: AYBFou09O7MifnDWXYK+/Hg2pfYahvZDpNyPdg5L9PN1NOkb0rAebas3PKex9uN59Eh
	Nxho6o3I9dqvi0jWkdVpFq/TAPGP3kEDu92ez7DHK+03ZrU+VjekLQ9ySsoO3wv68jOgFUe+vN/
	alKAmu7YP0i0OPFC3814ArsaweBm5hTymUbCdseFNTjB0aF/UW1UGzf4NSVEL40GC1z2muxoXOp
	u+PmshKKoa4EQnvk48I5M4gyg78b0vZoREpzieXAdXFQ4JF0gbB4tZkA5VweDzDEIcVHFOYAObM
	fwP4NxvJjfl1ZwmOnhO3FCnPqQW1ovt4qfZc1v0C7hfSEVjvtMDuv65ysny1V8KpF2ClB19GCxy
	fL+VOTF9Z
X-Received: by 2002:a05:620a:408d:b0:939:fc18:4233 with SMTP id af79cd13be357-93c15d76208mr482020985a.20.1790063494161;
        Tue, 22 Sep 2026 00:51:34 -0700 (PDT)
X-Received: by 2002:a05:620a:408d:b0:939:fc18:4233 with SMTP id af79cd13be357-93c15d76208mr482016685a.20.1790063493609;
        Tue, 22 Sep 2026 00:51:33 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862789080sm3046925f8f.28.2026.09.22.00.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:51:32 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 10:51:11 +0300
Subject: [PATCH v3 02/13] arm64: dts: qcom: x1e001de-devkit: Mark the EC
 reset gpio as reserved
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-2-fde7f8a53382@oss.qualcomm.com>
References: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
In-Reply-To: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=tdYKWjc+NjQwtKiNkI0tCZlBsk6Wmv8Tj/eSc4bfL5I=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqsjNzmmms7uVbJwTZhxlQ2MCed4v1RIRwdCdk2
 G2FXMXtF0yJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarIzcwAKCRAbX0TJAJUV
 VvwhEACQspOAl5BTbpmB7KcuCGKwZwzz6Cwyq3t80uM8d/JUh8OQyDfPbgeXIUZk3+bPO4L4zpV
 MwZzj9Emf71gACWs10PuxrbdkWjRvAC8XnWKEQjlTSNrzgkpJp5+9FIbsyF02J0V/IhgXPYe7FN
 rIH3ZVZTcLcWSIzsyXrjEByOWY1ZUkhJ8lyyH1GzvHykdUW3Z6dprnOKMoh7wQ5+LXhs7liY1Xw
 +MPZDPJNreKmKWkxfEdjwZ1JRQO8zoNiZeHChlV8rOfSGOQgDqIzSoA8HOkKMap1q60GG86C2Y8
 v8xMXNDcYEpvc40drf+0A7Ph2UlD6pSP6qb6xlq5HHDGP/kXUy7vzTIcme+FovRajltSaalHLyP
 kkQiYZYClB4i2XmItA3mSY17VO0jEghPzQjHhOa+UrLjNhOzJXF9Vrx2D0TVk5kST//CGiGnmxz
 iyuQmye/ciI/YMEKjO8yV5iCCtJccN/5ul/J9k0sxD40QiPvhfJdhkj/V4BbjG3fppulYSiF3el
 ayD4t0aERtSOvNwAXxvWOziiraIePeHptiG53GO99blXvejsMr4LH9u+29uWMa8qi1Euyg+Q+hp
 I7hWh5nfL1KpzCnu6uAyX0dx6/d3emHjryacBoOk0Mx5/EFZf1is5kvMu4bnCSm9QizFlYST9Am
 NQLuYi6cRQe+A6A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX2GYxziPID5Ug
 ughHTc9tyWEjcyqIByMNBHYYNSbZ5jBsgvWSk3+7BLdr207MA4zHwuKvdbzTdvhMO/FnhQloPgr
 IJTBe/a1vBamDyW+MA0vLlg+4jd24Zs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX+YNLD0/qP1vM
 pK+YkWsYz4sB8joMcAYwUSKif+lW6LQ7G9h4i1U+jbT9IXB3OjG0ajKui5Q+SKius1NQy+Zy+uc
 K9C1BK6RsAnbxYKZYmt3PjV6ny4iMrM4GkQIk/x3RroRjZNbRqNBdqUc8dUMjSzjpLza+4k65lw
 w5JU6kksxR32Kbj4/i09Tl+/QLJfmfICS1+ejxo7fkCuWNT8IRhO9qAffEsMSzQsZr4ASsYtl6D
 Bp+a9RwyFpNAV5X9S4kDZo29vxwD9SAf6s9pa+3R/sb1OM9aIwUhYT6Q+PRbdbfxOZyiV/lc5dK
 3m1dNdbHsm4fXd0gn2vj8k0OijxZToLinnqP/W26WRjkgR2ijfSigBDp6MagvQ5bi8pU3eZvdRj
 nZ4UayQMNprUTyj6ZZAP/rHhB6JcbaiguZfdN+uohzGLPuj1fUY4KWBuAELiUo3J1uD8+0UGuq2
 MfOtYP0uu2o5LQ2tRZQ==
X-Authority-Analysis: v=2.4 cv=E8FYNqdl c=1 sm=1 tr=0 ts=6ab23387 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 13MUXXqPAbW1xCTF-y-YtJD-e3nsCWuZ
X-Proofpoint-GUID: 13MUXXqPAbW1xCTF-y-YtJD-e3nsCWuZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220111

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: 7b8a31e82b87 ("arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for Windows")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index 21303340a530..e105db4cbfb0 100644
--- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
+++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
@@ -1215,7 +1215,8 @@ &tcsr {
 };
 
 &tlmm {
-	gpio-reserved-ranges = <44 4>; /* SPI (TPM) */
+	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
+			       <65 1>; /* EC reset */
 
 	eusb3_reset_n: eusb3-reset-n-state {
 		pins = "gpio6";

-- 
2.54.0

