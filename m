Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB034968F0
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784809570; cv=none; b=VKtKJV6b0l+qYugJk0YAWYJi1ojcWW/2Gri0LYeAvtly2ObFUatLQOIoxPQtcSWke6QHaQ9YGu35+d13QgEApfcrVOa4iP7jhCon3AF00a8Y5UlXDE18BzOiC24W5w8PuyGziYd8lsfROVBA1jA7i38EP7XiFBmldEBktH90LDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784809570; c=relaxed/simple;
	bh=/eRmcbGLD5Z7zb6cJ7VFrcd2+sDww4ph8DEQ4lXRbjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aohmnyaB2ZzI4dp6r9/HUEUMU8Tm52k2xf27UcMn2USSUHuY83sPOCSoTC4nuafUBQM6UUsb+yN86gAgAuy0M9M31UTHfwKdyZbkfvgHc0LVKGlE0W1uAWh+VwxID4qcaykfQA9FZjfEABX6f/T84pAO6irOd/26zWSN/Lai4CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oWUsQCjO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E0EReIXt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oWUsQCjO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E0EReIXt"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qcGF3606157
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mX/Jdvmv3EVPtmjTwDcYPWmYUu5TaT/TQvtaFNFv0rE=; b=oWUsQCjOPGxUUzGx
	wHq3n0C0VeRFMy91hRMpOh1ixT9WEPeG+PMhREiBq/Lr4zNSMpzaWYl7gE4lzxHa
	6OCGZPsF8k/wqZnCc8kytZvCn/8e3ISmkcqFjm9ZXTpVzrbRc7qz/5HYmBm9I48o
	nwhITf0veE1gemR2rfoitRxZPyHnIJVQC+G/GJygYjvRZnHyemMZpHLWIMthqkTD
	0hRXCFfd3JBYaUNXRl7xwb5lFYmIEEmgvc5+a5Px89R4xMON6pTY2iVqkUXrWMn7
	E46B6A44jp9KZ5wWBlWil4nLa1NI8ZEfUutl1YB4PUJeCFvM0sGBVi2M/9DLWZ+q
	rc0OSQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke7qh8nb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:26:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bec738909so10585871cf.1
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 05:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784809567; x=1785414367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mX/Jdvmv3EVPtmjTwDcYPWmYUu5TaT/TQvtaFNFv0rE=;
        b=E0EReIXtnQrdd8Dxk8cSPcl/qe1G/a5fXDFf5U+WB8Occ+TEQXF/AhY6ji+TwgpbAM
         I4k4EHA6w5L0/WToEeGPLLKaN0y/qKDU1O2a8gkWYxbFW+qjO7XfXhafRQuASG1O5ZT3
         4TZxgNglYyRDyfph6ek1MPgLDKWGMbny2ggy3enTqRbKmnkKY9pkuBGMJHseCgXpdy1W
         ky/avz1lGEZ08fG//oQxogTzedjvA8mB9IxCHCSnxFKj83P8AllY4U8zHAH/jceaUR4S
         RFOyKw1NI+vaZOdRNcQ17iEJ7xVdPnH6Fpq9C7h9LjqYCzrw83SQdxyl7XSf7V6BHHeB
         kLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784809567; x=1785414367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mX/Jdvmv3EVPtmjTwDcYPWmYUu5TaT/TQvtaFNFv0rE=;
        b=ZMmRiVgboUC2sAA5X5WEi9Q+mWRhfSirRL270Y+y/ussvI27K31QCPr6YjR60Ll0o8
         VOcfaTkSxRPbp69pdcTgecT55Nq/uHgxf8F5GNMfZCXVOr30DvNP1C78TIQCI4VZQMOI
         x4VxTVxq2lXdew1v5aBFFDB1hy5YWkSaoECCp9wLoDtTC/82cey/jMGp1NDb22SQe2ec
         beL4A3IkkthC4t1N5JyJxPWDiyG6HJD3A3xGR4GP0AbwWOaOq6R9CjIzXcpZPtcNNREv
         cNaFGqQcdgj9DgJtTt6oa62GIbEZzPTrsucVDQmcuTyjffY2VXbv0o1JydB5DM9z+nnm
         7Cwg==
X-Forwarded-Encrypted: i=1; AHgh+RoOmKgQPfI46tdNiZKNmPHzjzTSY1GPJLVUxD/EWONMN9Ctxlk7/RQTzigs49VcH2xaEU1rl0nnLucm@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9sWf4uMwrG0hBMonMluVXp+l5i06koOJGtivnhEVKU11QuR9u
	YRYeeFni1n1e41f8M1BSMLxfSpcRT+M+fO3ebAm9vbtE5FjH0wIfBE8DXP96RgezSJ4y7PtmF1g
	sQtgb1wA0T7q8Wd9NjXzufNnrNYaLhQ3K5IZPQsMZ4zaNpdsjBGwup5ZiedQYktrd
X-Gm-Gg: AR+sD11ua3L6zQSYdGVHImQXYDfIbLDQnVaiIJdo9RYS/QJHIJQXvrso7Vzje3mhy9u
	o4BmC0PrRUXrIgBpGGzI+MrP0JkZAqhwfp/vQ9gYsaVUwBG1YWM3ddmNUVT1VdPoGmorVrTkrgC
	tNp+/QTFD67r7T/3vMyNNROy7RJ+296Lz8MrwCD7hLGxeh02Kuq3wLZ8QeK8MQhLJd+XHEuNijz
	dyBiNPZzU7p1RD5BgJVltFh9aX3dEuKlA42BKOL+QeAJip4GcTwOTuR+3lzmbtXe21mfv8dFBlB
	ukFSI0sYOrui7+O5khufdW/b0Fp+/cVxdgDIHXAjapkbmRXSkcJC00XTTpJ9wRzFiSoxSGYNdv3
	jpA0pDVX1
X-Received: by 2002:a05:622a:1f87:b0:517:87bc:9b47 with SMTP id d75a77b69052e-5283de83b13mr25897851cf.39.1784809566778;
        Thu, 23 Jul 2026 05:26:06 -0700 (PDT)
X-Received: by 2002:a05:622a:1f87:b0:517:87bc:9b47 with SMTP id d75a77b69052e-5283de83b13mr25897461cf.39.1784809566014;
        Thu, 23 Jul 2026 05:26:06 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6e9a2sm15236106f8f.35.2026.07.23.05.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:26:05 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:25:52 +0300
Subject: [PATCH v3 3/3] arm64: dts: qcom: eliza-cqs-som: Enable CDSP
 remoteproc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dts-qcom-eliza-add-cdsp-v3-3-93e17e687384@oss.qualcomm.com>
References: <20260723-dts-qcom-eliza-add-cdsp-v3-0-93e17e687384@oss.qualcomm.com>
In-Reply-To: <20260723-dts-qcom-eliza-add-cdsp-v3-0-93e17e687384@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-2f6f2
X-Developer-Signature: v=1; a=openpgp-sha256; l=937;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=/eRmcbGLD5Z7zb6cJ7VFrcd2+sDww4ph8DEQ4lXRbjU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqYghUEC7d3/cD9ZBafw3wH2to5Pt6BJQN4PIaX
 I2AJSVgdHCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCamIIVAAKCRAbX0TJAJUV
 VuRwD/4oXCuhzvdh9wR3I/obS4hVNxzGr06ZC/r8lywrV/YlJjNIPgr6QQADYhD7QuYyAv0/00s
 8bR25tVsHJMj/rCi5JVdHXwi5VX5I7Au7QXymxP3LbP8Txffp/oND2GtYzJdu8ZlQdJVj4Vhe1C
 f3z9iEBueNFWPHB36V+h54EcW15u9DFKhWgIAZRgP31aH6pwMcSZCesCCx8zultv1LWrblQC+dH
 NegA+94WdlEeZifGoa1BW4CkdYWgck+rfWN7GHSvibXM0c52weOai8NcRtYRTeENyrg5Q3Ri6K5
 NV6KwzQ6lav/vHs2nhCcKzS4ItfoZXTSMYx6aUGrx6acC1x416HRZUYOry2oBzei/hPMvGQiplf
 Nf5vHTPobePP+TW2qJ/DW4HtGPhPxuagYeWSb6ZmJjB/I0Gqnl4HLazG3kKt3TaxbeT45sri2UV
 p9WIq3N9ntOyPUrDjy7avKDktEslh5HtLvCPnQDvmU+NDE+bli7jY1vEFzIPeGBIuCp1UQCbKMr
 VM8PjvdptvjxAXXIIWVXtp4Re2ex5fQdLER9372/i/8jnfomFXXoc8Xt4YhNUUQM1c5mQDfw1sZ
 VlqD81PyL6ZSEnFKi9l50G3uS3GzBSUuMIDj0zbpnCGPvak2RY+RlI1JrbXdgckJuDh0+Fx6Ai5
 3cbvsew6kWck7Uw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyMiBTYWx0ZWRfX7psmt7YX5Rk9
 0P2t0Ljffp6vi2L0RkNDewCZbZSUoWNKCFczYJ2983DbcMDj5rEUAk7k4GldvcAhVZa2q1snwoM
 wxdYXat2EzJ09fIQS97UMKG6KQlYKq4=
X-Authority-Analysis: v=2.4 cv=aYxRWxot c=1 sm=1 tr=0 ts=6a62085f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=27Bx3adQT_mWtQqGTPIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: y-zIIUwuQgPRFiVKaMcm4fxAV_8-pRe5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyMiBTYWx0ZWRfX+MlHYvgSffux
 VMJgVIdKe2QSmXDKxKdYtln4pQeAldaDrXYQEr23B4jH/HQW+kBYNqg+ouwNr5e2PCEnRP9Qqfv
 /gKaOYXRNwX0UP6yD4u2V/UvtYFmw3opte+V0jyj4Vrnp8+0FUC508WV7lI+FPNmSNTfB3UkTur
 1RgKjNA1M6ZFHTUwHzDjrX/qH++bMsuoKhPbeRlSOTAUnFmai0wpbhBXtRGcGvRsUMp6iMBhINl
 dN8E4c0zo6PSh3sc9yMfaOuG5PjipqhKUHeCPpnsaW3+u2BQZ6MMpfSoG7alwbO5qdAKJIEJu/O
 4onsbRfhWAWbulICWnePkQ/4iubcBJ5qELXDoAqQ2T1djDlkPacZHlUrtPqZvTHRIt5d1mLX6M6
 mKTufm8dUu6HCvIODctxEx7wetBCof4j54FWD5hYX+9hhmrJlrrN62f6uQCryyz4wzC8g+N0YuG
 IGKPovmv4Df7ruGHZHg==
X-Proofpoint-ORIG-GUID: y-zIIUwuQgPRFiVKaMcm4fxAV_8-pRe5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230122

Enable the CDSP remoteproc node on the Eliza CQS SoM by providing the
firmware names and marking the node as available.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

