Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026181;
	b=rWyUwwJ4Ydxfz8rQYPYYPfGwrtABqTybWxoFNrq1pVBQQ0f6yAhgpMX5/8jm9UGbBYwG
	 Ek2O0EV06Vd2a8JNd1qm3ZwCS3He9yK1LnQltoP3+Kv0RvVWSXyu8Rnk02YAFs5V+rCoE
	 38NI6C/RitSNGKvBMNkKG4oOuRJRFZO+qH/H3oEPySYsCnHCSOLBq8npdhrQZzZxGFdM1
	 y/7nyQtpK3+z3kbxm5RRubKqvmOCGeTw8MdHe4j8fXp9Qb2zdtDgLeUQP1+UVJnd4e561
	 PrGr7qlNr3wfIxtngjHbw9H6TZFY+dZlwva4CPOfLe763hFVJvfjCa3kWAngBfLL66w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026181;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pnFc81yYYBsCYXdJavDXYGu5dz4FnG041s4V+IJ9/+0=;
	b=KnlzjGVLUBx4TcLd7jAnp1OYQHwfyI7bE8weFYAi6sDWw598YSTa+Moxs2ucQqa+1BjF
	 uyZ/gYKxIg0wH2KcQmu0xM7BDNGA8ONHPqpcxf3fH450WOHTgx5MQl9iHGKAk6XNNkCF+
	 xSXL403u4wawYXG4vGpStmFs+fcjxcxXHaRop/1ifxZSkbhXwGZKl1vlqDDE81oBoP885
	 jwgHMuW6kaW6Z2AFZFeYChrqcDa9rv2jqMIWaDr2dps5bJcsiredEW4ZBZfeww4xZDsQj
	 RXDs5XU+4XamiGz8QKTeqJH7VAoZVEXHUo063X8Y5oF6ydyrp5YTJ0TxPKMXR3QfYWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mN+Tn1Wo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T+aqJ0BF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57C060A3810
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 18:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D57C060A3810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mN+Tn1Wo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T+aqJ0BF
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHG7bW2447061
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 18:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pnFc81yYYBsCYXdJavDXYG
	u5dz4FnG041s4V+IJ9/+0=; b=mN+Tn1WoysLPHwmHMR0BvMVSl9kHh2GpWUpl0d
	r9t3D3mco9aOm75AZdqiamG+b2KQ/FJ5Pd3oP0EZJDqJwVQ0nbZftQNjuetvxfRu
	oOA9Ql4xrAM/DpTlE8oGJNw1mcG/8CRMG0AeyZDc6o7gEd4CDSMojeY3I26052K/
	UtxQUav7qBCSsHe8CbzepCXU8s/2y8nXAGK3/MgRVMWikBgIrlc3gumS/nR4F4Eg
	DwDO/UpSZO+wLGVSGqOOPp6qNtZuvyFM6V7sHXBbAHGcbKofI+Ye5GJYCILZZzVT
	S8LVgiCA7venIPjPrX1VduBPIwhjnyWjS6lbP+uaw6C+lmTA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g3b8c72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 18:22:59 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b238436265so998911c88.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 10:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795026179; x=1795630979; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pnFc81yYYBsCYXdJavDXYGu5dz4FnG041s4V+IJ9/+0=;
        b=T+aqJ0BFyHVrF3n/JF58W2/eNw2aiIYU077/fbvHNzs7YtMNIEaaefeHdqXEcpqt/Z
         L4+5WIGUH9qx/i8AUBXMBgPNN5DzATBx/ECNswhMZs7kBxlmCIbWB0o0hglvs2IfkHGd
         mNnk1AUPG/4q/ACTNBRxOFMCmDKWVBy3U/SQZTMAGdrPCi0jFoZcMsX1ucE6OxqAYyNz
         iRDqYh0KxcTwElcXZq6OuNcwXSi6yVbBnigDWjYlIPBPHzkpgeltirkZGtPobCHt1RVU
         05oiq1RYoV9dyULYGucc5ndZNpoSaYIX/SB0xQg6WwL+U/aJKr4W3DZcu/5rwz9ohgb0
         j6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026179; x=1795630979;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pnFc81yYYBsCYXdJavDXYGu5dz4FnG041s4V+IJ9/+0=;
        b=tnU1ByC2f3r0tZunfWQDTeQD14ZoYMWInS8QzBoVB5tddTw6D0DgSy8kHM9p75oDs6
         tSrkeKzRRc714g4Nd32IlkgzJumsfnpFUTKc2uCF+m01BiKU/ItR0znexOd3lhbsYlTx
         km/W4gyaWnvcvZ+WDJQ2p4ZFdvN16pKsEs/uFa0kuqVB2D/CKhEfy/uDPebI5w5OnzRh
         bhhjD375aP3sRwNINp5h0Z6X8d0sED+IEMuvy0t6bRxDTTmn2SO7vWmjR1weKiUNFwYY
         9cHRsLobj6TSSaYjYQnsAvoCP4W4zUbBXkZ5NUdcqihQXHmtQsR3vU7KY/rZ/AYc+BZI
         dwnQ==
X-Forwarded-Encrypted: i=1; AL+hErHLQ0uhGoMuq4Gw2xhgKD8Mw3y2K4biT3ncWXK0YJv+WcTeOX6tD4dFZ92SoYmg/eY4jZl0TDoOheJb@vger.kernel.org
X-Gm-Message-State: APuU4Z+I3BNcVVT79U4jo6EIBBHU3Mcg8+rJZK9wc2uqD0uhcpKX9uf/
	eZ7/Hz4Y0whGfKZTj6zThUSm49romBJeL8gg3M1wx54bJoaR66m2uN5GfqLsll7XSIU7IQsVAYM
	v6mpL0PK3qsnCaKe71NkAnfO4AfmVuY0+OK0m3Kvgn7NFOVUfmAGK4A1x/CKcSk30
X-Gm-Gg: AYBFou2M7lcrHOMivsiF20/NrGiFg9HNQqEahoYP7wdimULv0hIjJzK3hLQmBMCf6tw
	ZhGEqnAwjcZ8HDVt7V9NdL+nw/g+QZDpFhQFES0lQfaZSX3USV3jntWFUrFvxQ010n8XWekB3s6
	rwoWaoTXrsx8G0e3OHYqGf3BjlY3/cCnbezEBUTjNIzKuT5F7O9gVF4DSx4ZoCg7x3CVMCF+IZS
	rQEhAVdGA/WlAMF90BKY2CjemtUGqjRJ8SZL4iFKj587HAlY2PDZ3ciornb4qw3qTHNlQY5OZFF
	DmjQirb+D3vvpeROq4ahX8GPYJh6hAIW3HD5xTeq+YAaxW3l5UyKpfm7NFq5IyUpwdfn7H/DGL+
	v0JTJ4icVU9iBcQSmynzEbI0escpV3nUHPTC/78DLJUENXXv4SQ55ouZPngJ98uQY93YqV5p7T4
	jjWpxOuvRQB92a+YBFVLIJEbW4MH+7yh4Gm3cOwqTbkji5hKR/OvDETbAjfbzQWlUXSISS
X-Received: by 2002:a05:7022:f90c:b0:1ac:1022:b60c with SMTP id a92af1059eb24-1b543c1100amr3013124c88.1.1795026178352;
        Wed, 18 Nov 2026 10:22:58 -0800 (PST)
X-Received: by 2002:a05:7022:f90c:b0:1ac:1022:b60c with SMTP id a92af1059eb24-1b543c1100amr3013088c88.1.1795026177631;
        Wed, 18 Nov 2026 10:22:57 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b544784017sm7965663c88.4.2026.11.18.10.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 10:22:57 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 23:52:40 +0530
Subject: [PATCH] arm64: dts: qcom: glymur-crd: Enable pull-up bias for lid
 sensor
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
Message-Id: <20261118-lid_pull_up_fix-v1-1-4bb84dc70067@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAO/s/WoC/yXM0QqEIBCF4VeJuV6hsajYV4lFzKaaRUo0I4jeP
 avL78D5DwjkmQJ8swM8bRx4mRPwk4GZ9DyS4D4ZZC4rRGyE5V65aK2KTg28C5SF1o2purosIb2
 cpzQ/xfb3OsTuT2a9M3CeF5gSuQhzAAAA
X-Change-ID: 20261118-lid_pull_up_fix-123aa8c6b744
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795026174; l=1001;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=Bj5SZGVz9qulaXLgZsHLr9ZZVmCLrQRCE/FtaZlIITQ=;
 b=8zdgu+bPt09BIENQEzQVa2Un/nebimCyHzTg9I3Nrh6iEG/qearc1srrxBg0aLh3MMDAxGT2o
 D2V9PRd4GMvDpVloJdVH9s6SOZeLOLdHitxTmaBLyFG9EVVFub/mmbw
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-ORIG-GUID: ligwYp_XEp4Pgt53aySAuWz50DqNscaR
X-Proofpoint-GUID: ligwYp_XEp4Pgt53aySAuWz50DqNscaR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3MyBTYWx0ZWRfX2crHbk9iSFYU
 eBtwVuzqI5VCVN5I+Hyo0Ylxoyrf8RmRkYTqJc/OugMCViTLGa95msovskLkfcyVqldNsJ+RLA1
 p7N4+QV9/O+zgfQQW3+t+AN9NV0jgXI=
X-Authority-Analysis: v=2.4 cv=dZQVTnXe c=1 sm=1 tr=0 ts=6afded03 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=BgWmerUSY5PKo8a-cwQA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3MyBTYWx0ZWRfXzonmqk7OHJCp
 o2YsYbrKz+XGTKCpgDcznzv4H4MAtYxM1QWbPRbS5CMk6yE5oeEG+XKeS5VoXR9o9hF/x/eD9Gq
 sS44w0E+9buY4XXg5okCd+ftH8uuLnVTXJzvSJMmzdsDlgQxM0GbK+kea84ISZ5/DZGgl+WHNsQ
 YBPS7kZ8RjI7gPIv6cnTo66dcDRia43pDjd+9KnXw+ErOxRFJXoSeyNsl4UefIi3gafk4ptvdkp
 YwCyGzD872OALY12SL4yMuSSKG2lFlNH24aG/68luaV4QHacxL5BWIxRqSzKVdMLiqwtJmzsdeX
 0VXo9jtBvYydyw2izPOnJLSIdUds03ziuySmRwtrXLknk2FBeYOnms+Jd9kLu6PFosO3K2u0/8v
 tHGdXLF9h8PaklENvHbwoUM4CH/o88FIKyqmM6lYedPD75Lt4j0nD0ZGmKOWHvtAINVbVQMiGon
 at7haDB10T2EAjTIzWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180073

Hall-effect sensor on Glymur CRD has a 10k ohm pull-up resistor
Fix the hall-int-n-state node to enable the pull-up bias

Fixes: 627aab9bfe03 ("arm64: dts: qcom: glymur-crd: Enable LID sensor")
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 3a9cd5f3ec2b..74588f4f7a86 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -819,7 +819,7 @@ edp_reg_en: edp-reg-en-state {
 	hall_int_n_default: hall-int-n-state {
 		pins = "gpio92";
 		function = "gpio";
-		bias-disable;
+		bias-pull-up;
 	};
 
 	ec_int_n_default: ec-int-n-state {

---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261118-lid_pull_up_fix-123aa8c6b744

Best regards,
--  
Pankaj Patil <pankaj.patil@oss.qualcomm.com>

