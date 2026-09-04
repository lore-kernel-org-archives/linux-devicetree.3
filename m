Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4C34908BA
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 12:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524519; cv=none; b=YN03TeBTUri71pezk7Mzwp5+vmgAeB2yN/XkNvP9aLAHj2BUWuX568lO+6UqroEi7U851bzYC/dnq2+2rFtCyd3P9uafP/+nV+vaB3IrNFciOzVaYaA15YFkdW447zqUZ99tAhmAJ34TOBw4nITljdjEONt+5jpNT6UuZs6TDDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524519; c=relaxed/simple;
	bh=YRzvAVRkZbWBIqG50cR4+R6msLR10iB8DJJthyfOr8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ee+gE950Ftww7MRWx6xPgg4CDFz0x+PULZhu1BoZDAeGGgShNWx3SPRwUwLHS5GFKpz+2BLtBpBe/X6/KapFXOUHB8HcXmm0jMnHGe4PxKw5qzLBAzGGUAOzkjWOx/TzEyBR9GW+aNFF7YLX183Z7abEFQN6Uaur6ml59VtAxt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NXRFhNQT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WuJkOmkX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NXRFhNQT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WuJkOmkX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684AIAWu3301401
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 12:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRsP4wIlhmTURuqn3eYM1ANLpIvruoM/cCuAt5SZxkQ=; b=NXRFhNQTrt1PX6k9
	AmaZVvdhvkTskOhx5hNvbDTxSzv4zgz/E99KNZIl6HeDzz9/HIt8vBts5124tFYm
	XqtOUDUWedKyR9FKSIPSdOntGtd5HBcclno3TXECgiAdwkmpTbG3IhcZiSUQIDI8
	iPIGqvD9OkxCPGqdDfHCqV4J7bAxZ20KCHsCYy5vcsi+1evYrJvgLCIgTuz818dM
	myHTKS4emBJFwZuveRgNzeFxn8NxNQLN5NVXVkkNy74Fju2rnUj+AZjHWgcmKFqw
	TJqGjczOgcYy4JuVGPSZdF8bwWYPmn8tHlZ2ItSMZxZzCk6PTLYyNV7WdrNjPiIA
	v5TcZQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfdyxkdtw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 12:21:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so194190685a.3
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 05:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788524515; x=1789129315; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRsP4wIlhmTURuqn3eYM1ANLpIvruoM/cCuAt5SZxkQ=;
        b=WuJkOmkXPX7x9W9DxbTnk2GzcP2kcwaZ+AYq2C4Gb6KR+O1M6Z1a0zIeW2KB1zp/Uq
         D5ZZLZ40JAwXl7hTvrcLFf9n+IiVKyC4xLQMCwAlRcWS/FE77Pv1H2vy0YIGcjet/iAF
         GtW17hvvRSrLIqxJrVTkGMR16sthP93VIh3KsjJ9hJhA9FgKDT1FpX1wryGL2rjUoFTG
         fi73aRRJYjnYl208H+3CzC+nwxdv7HM349vlS3Bb64/zDNLt5YdCjSa9XitMtQ1rjncB
         s7r7jwmWdRv2Cqq5YBUBCKJsEKOs1LRxZx8fsAKYxu4jo/qVEbZqKC0CM37mZ52cOuJW
         J5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524515; x=1789129315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRsP4wIlhmTURuqn3eYM1ANLpIvruoM/cCuAt5SZxkQ=;
        b=DEMkjybED22lvThoWuHU3iEZbjP5yibqX407fpyKiUdWUCkEHzyiAdgxW/JSIvO+md
         QYkDfwdUEqHRFe/g+w8Q8p22ODwRZv/0718pjCKNR2zbCabnVqs5rZiUlX5kOFo/U/gQ
         ONZkPrvxcPxtlGn/7exEROdCZMmYG9je50DHR15gqPnFNC2BvVkbkDmszb1hR+WBOJ0N
         XYLsoWuvFCeE9pfS8YmfefGPHjJ+TSxpNA/nE4NKa+sOh5IvSPe1T4WK+cJdP8jkBu5u
         hRCqIEsuGbXOZb/zV30Ma3UXqj8MGOKbsheCUSzmV7gZ4t9ux2cDnyZCEULPGQEXOVdo
         KICA==
X-Forwarded-Encrypted: i=1; AKwUvBy/FiEMjZIPJdDe8wOEGN8j0VKY5RZnHi68eR5zYPF24RRE8NEESRCSjnmbVqVUOJqutftfruBtYqG8@vger.kernel.org
X-Gm-Message-State: AFuF++n+vJT2HTX0TYHtuyMUwcwO01ksB/jmW8LKS6YOgClhDeba/k2x
	k0lhEwYYQVvyF/sjQ+b2FGjZv6h5Fgr3uNOdYtKxizB+CoqZy2YVN+vVdFy6HyK9K2T3UwhYeUS
	BmeuW1XVtPJ2O2XvGNOJwd4m+uYq4npiV4MYlOW6Q2T0DBgIc3RpDoeQ5BsIisPBd
X-Gm-Gg: AYBFou1ZkyxQdG4Nroy2f1cQGeS1Yq/ksqTWs45XrkS9NUoM3PN45fOJNk4mzxyA03H
	6tzBGf7oxCnQ5eohWAUTTLgZPozG58baEO8bMfKHo4Y1PJEg1dvJGFpZ2hYxZiE5Tl/1DTrd4MK
	6yoQtZFvzVUMN10YGFl/u+NU6e/1+25W0G67MrDSnoan6615q6SEMlwUu0xC1Q//LedYkzF5rKh
	pgBel8rOvcOtW2KnIfDnltEThDF0XRASKhbLv4O5U8AyNaSJ3ODjWv8THq82L2fyrdrE02zeZB6
	ZZoDbGkIGc5Q3LKaOwqVENHblDk/zKr5AOTm/HrzGbbAkvTFFI4QCq6J9jij9DKZc03e4uPn08F
	mkyN/yg==
X-Received: by 2002:a05:620a:4484:b0:939:6de9:d52c with SMTP id af79cd13be357-93980502f47mr482090285a.49.1788524515397;
        Fri, 04 Sep 2026 05:21:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4484:b0:939:6de9:d52c with SMTP id af79cd13be357-93980502f47mr482079785a.49.1788524514468;
        Fri, 04 Sep 2026 05:21:54 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm195686665e9.1.2026.09.04.05.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:21:53 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 15:21:42 +0300
Subject: [PATCH v6 3/3] arm64: dts: qcom: eliza-cqs-som: Enable CDSP
 remoteproc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-dts-qcom-eliza-add-cdsp-v6-3-d4f38936902e@oss.qualcomm.com>
References: <20260904-dts-qcom-eliza-add-cdsp-v6-0-d4f38936902e@oss.qualcomm.com>
In-Reply-To: <20260904-dts-qcom-eliza-add-cdsp-v6-0-d4f38936902e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=937;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=YRzvAVRkZbWBIqG50cR4+R6msLR10iB8DJJthyfOr8U=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqmrfZq7frxFIaffCzDsLIydxrjeqPaqmxisfWz
 vAJavffgHqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapq32QAKCRAbX0TJAJUV
 VhzED/9DZAbPBjiY4HjbvYJbueMinZFwHeIpWUXvgyX+feOuDpwY5OD9cIPOXnbg6ChcO8oSqKR
 YspPZeM3lk9w26/RcUaj+4C8bju4bAqBSL9ff9+WzrHg4caLZPuvVPFuE/7Er07EmX5JwbkU9UF
 QstnTzan/s1OYPU5Tf3qIO2/GD+tEoqmpUCHbyUfOcQrzN1N6hzbz9wVOYhLSjoDBfbFVZNFy1D
 lc0uGrZFYu4D+z8V0j59cqUuHD7qq+SxXpCNvAH0PfFtm6vkl0sKyM1+xSWV1J1j2FC3wDiKQEn
 kphjd6vKK7JS/dQBFxMc9caKDWDkONNuV9g2ZTMqEzWIAT2elAwRl84+Mwy57cLMor3MiGKgCVW
 DXcqS06WuqBtLxF16K+WzMA5kAZ9y2zkoJReltZSea941qL0j/N5owyiuO4Quf5foJhO4i7EY3L
 OxIi4EZ0vqtQ38szhtmxpWil7lfI2I5Li2/dm2I9dVamJNOdK0g8z5QjtayA3DjcxvoQdRLqb+f
 PyarX2SuaJtdrbDguIlOzB+VYFuZ8MDq2i6+aIZNwQX079EXNtTFmHtAgMfyxml3qYFx5Odb5s8
 1DFnJZ04adHE/fN2+ongNu/V+qP7+tUqTcX2/fyOHy6OGaz7glUojqEqUdvkbCiaq2qrOvh2jQ/
 /3N3tMV92nvBh2g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: z5ZmQ_bFIhxkadQjJJeqYyJFOue5O1AD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDExMSBTYWx0ZWRfX3gdpxQTDUQjR
 R9kZr+DuSFEMPXZ0RNVAAr3VP0Ii7lNS1qBUIsy0Ywl4/ei5C8x8CUeHB3OUGiseOQDA0lejwvv
 P35X89nsQbI7HmPMx8wKOGqFWA+uKkM=
X-Proofpoint-GUID: z5ZmQ_bFIhxkadQjJJeqYyJFOue5O1AD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDExMSBTYWx0ZWRfX2L2cpV6w/ewc
 mTPJy+pjfaZCJFsd+6tf2HvWkCTMaGCgnfjU4u4+rXwX7ycxJg7jUwA0XUzu0qvkkA48rk3nAq7
 wASypxHsl8Ya728ORtTQG86CypR/yC74woSdHqzCON7DQpt8cdQWEbL1V6MApWcQAHzpd7jCO4/
 hopxliWlT0nHzpRTH7ktOCJ89Y8ovJCQCr22w7zJ092wFPdJeqrqS2jclyRs2qih4OZp6szM0hV
 L5RM1S9NFArrV5ErFyZTVj7btuqIWHqC3Q8IabX1JghWtXTJzxgAS1hkeubmwvgfOm1WWAX5Jpz
 VU/WA6FHIqlM2GFuvHupo3IxWMx/4utkN4mT7TvWggAyuTJUIy7PsoQWlx5TD/waMkUKK/cJ5GA
 KOxQY/fg0I1VAIg/dygdXTxHThWW3sIs77SAfZ6at3Gqtr2UwX10WtrMUewx28LKrKH7ObymNk9
 LTq75PMCie2M/Vc+vuw==
X-Authority-Analysis: v=2.4 cv=X9Zi7mTe c=1 sm=1 tr=0 ts=6a9ab7e4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=gskBRPyYVKVSocykC0cA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040111

Enable the CDSP remoteproc node on the Eliza CQS SoM by providing the
firmware names and marking the node as available.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
index 5ef6c51618bf..c55947f52123 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -381,6 +381,13 @@ &remoteproc_adsp {
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

