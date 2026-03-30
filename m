Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83A43DA5DC
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 14:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774880659; cv=none; b=D/kxaq+dvQsdM6VmmEl2+CBmjadoz/M0cCbgVvr6NKxJVbuM2i9FgoHLDMQi89YPOCn20G5SuPjZnARcETJquQefPSwMriO3BI0xwxna4vjX77ZtFa+/kyqUk1/yvz7/BJWjnrSE35vYVF75HsrrfHmwvl6sKoErjxHHqnVVOMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774880659; c=relaxed/simple;
	bh=SHZztl6q6V3BTfnTgfz0l+XnOXq3Ovg34Q8d3e7j3ZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Dkhfi6mMc5P16tX0MpmlPkioJTgbSa6R5bBvHFFON+3wkyZUF4acw7ZGLUdqnDH6AlT8fUwa7U1Om6Giz3TSIQBQiuD+bJg7CAU+hobjFrC3ORk/IrOUyuIFFTO5HYYa3FoSGJVKRveNMyf7UzW41Uy+Chy/x/JRxOhkptejVAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SIvxBKza; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RnBZb/FX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SIvxBKza";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RnBZb/FX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UEDFIG1090787
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 14:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+zSmgHmd/82fbIrbbko/92
	pEEhtM4soEb4zCkM+hYEw=; b=SIvxBKza33YZnRDXBliH5mpAG7cqoH2cBJpzKY
	ffBgJ3GKdHCsc8y48xS5se7Jl2awVO2AmIwX/B3rXmkv8HcY8sJs6vXyvB1RPh/A
	3vIQVORgIymcqqeDFOSb3tvPtjupx1aYby4aVpuuStrC+pBQ5s8kZVJBBxS7TQ+K
	D3zmVC01iEM6T3A0wvTBVHB0cZKq+Vzz2lytEuzDYGIMeeeznyI5Me65Qkh9ZGhh
	wIxYwkRA9FuemDCaQMxA/6jgH+msICF1Tx2UA5pLUENMlkp6nodhXUN356r1tcYT
	Rq53CGvP5gLBk0VCbZeU92bvbUyDFfiGtyoPVIDQZ4L1N1AA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7trd01st-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 14:24:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5090cc6a7d2so145688081cf.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 07:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774880656; x=1775485456; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+zSmgHmd/82fbIrbbko/92pEEhtM4soEb4zCkM+hYEw=;
        b=RnBZb/FX6oLQa13+Ep271Ei+sux9yrksOxSKRGac5ClvEG9EULz1GKk/vgxsOcfIrW
         8xPrOdVGVESlDjiPhXpBE1qjhprIIxY/SpPUHJ+Q9Qtzw3A/Fry4wu39o56V0avWbOj7
         WR+W95AusNgZjIfRZUiryZ2etqGGh+QfEFRh+ua0jFwQyuw7CGQTGc58GEE4tIOUbZZo
         R2GxaUYwFoQvz+FfN97gYXGNDEj5stdFt5D0tRbwABspZLXDUk7ZcgBbTYcS27fqSWEa
         yMYgRvnbUDPwW2mRTrgvBhr8g+Pgq3/IpVF7ZxYc1IZHMNnmVsBdFS2cVPBC2nG3vtmH
         QC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774880656; x=1775485456;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zSmgHmd/82fbIrbbko/92pEEhtM4soEb4zCkM+hYEw=;
        b=WnOCuHiCiIUq/6WTM/uF2HWwgW6Pe168AqjiOTPIfjUKwwcDwyCp79Mg81Spra/K/E
         DMZeAXq8mbqFK9Pu7xzi48Z+TWmfG56aFSQyc2vC8yFUwl4Qhkz8OXaqlaRFkEVCN4lZ
         i/ZORmIbCHPJHGQrD4R8TbGucBbW75+udbvsloxLH4fC2yfCVuidnAU9JWmfL9uh4x07
         P84BLKOprXcQvIvPLLL6Za4SbCUsp0gUu+/hf1mWVl6nDBSWxnpOBNOhS+W6eyH0mgiS
         X4fIeeq0J3+wTFStfnKyxl5QjANvSZkgZ4fUdOjcbSkvSX5j8v/asvOBoUky7IEdECLy
         2XPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUONvbBGBXmoMRQgHotr51skrq4j1hbJa5jIoWHM6ZTz2AnbdFn/8ZiT9LxcvxbrjqAUk1zIGDWbsw9@vger.kernel.org
X-Gm-Message-State: AOJu0YxomjuhPymwoMzxcsODUYhh1sXOTvCA4XxXgbvCYn5zosXGnf0K
	wQC5A75YdQvgIo5spMg4Dbcj7jzh4E4gw1NVVFHlumeXz7Ss9n6XVYWnX8Te6NZinWdnXXkrO2t
	nBHMdeWdfz+mskVdLOGkAwlM+9kNv5kH9QOS51lra8i7pTZA8Y9kn62uOpSyclPj6
X-Gm-Gg: ATEYQzwLIhDHT2L7dwgfZ5NW3G3ail6d9wPb5GUndQ/fkruWjR/xKGjv74OaT99a6jm
	eHvDKDnjNd7UnhvK1eCld9L5OWDG1qlg9OPbM5PYvY+P+x4O0JzqnKM627mx/JX25cUBaIIM6TX
	z5XTfBA1kZdcSE65MBP5OONPO5IjmTgeQ4VH50LNXHLYud4/qkiVrXrOu0jh6+BMfIoiUmsSk4C
	HF/Zd+K7M0Gz+sTPhvC1elRQndD2DTpUj8vTavKV0jnUjFpQmzdpfbe48QKkIGkjNlD0R/0qxMb
	e5FXqV0/9lZnVL6vh+tDKuo/NIMNONVYZ1LtNMHqbpc45nLSMOh3zYy1UJdRytk3bHs6XlSZq2U
	V9M30dsjbatuL6D5MlDaYo43Xxbx5hg==
X-Received: by 2002:ac8:5f13:0:b0:50b:4b3c:7554 with SMTP id d75a77b69052e-50ba37d30bamr166992601cf.10.1774880656132;
        Mon, 30 Mar 2026 07:24:16 -0700 (PDT)
X-Received: by 2002:ac8:5f13:0:b0:50b:4b3c:7554 with SMTP id d75a77b69052e-50ba37d30bamr166991801cf.10.1774880655416;
        Mon, 30 Mar 2026 07:24:15 -0700 (PDT)
Received: from hackbox.lan ([84.232.191.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21f173dsm22264839f8f.15.2026.03.30.07.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 07:24:14 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 17:24:08 +0300
Subject: [PATCH] arm64: dts: qcom: glymur-crd: Enable DisplayPort support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-glymur-enable-displayport-v1-1-1543ad6dac3a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIeHymkC/yXMQQ6CMBBA0auQWTtJpULQqxgWLYw4ppZmBoyEc
 HcLLt/i/xWUhEnhVqwg9GHlMWacTwV0TxcHQu6zoTRlbaw1OITlPQtSdD4Q9qwpuCWNMmFD17q
 pLs5W5CH3SejB3+N9b//W2b+om/YhbNsPjqHZ7H0AAAA=
X-Change-ID: 20260330-glymur-enable-displayport-8e96854a35eb
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1403;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=SHZztl6q6V3BTfnTgfz0l+XnOXq3Ovg34Q8d3e7j3ZE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpyoeJsl0XHz7ltv0++Rqq+YaQWBN+hRgxw8Kfh
 hFhYHklbSiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacqHiQAKCRAbX0TJAJUV
 VgjMD/9wpVn3glA3Z4tOeevT89nFK8p0ESXPJkEeHgzWo2a+IK3VoDuJlX46w2sjP4+CnvurcM8
 erhLZoZabcxlUjsHXEWdWUlOtD1GzSXrbqdh3/VX6D3ihF30vQ94X7sw5trVBj8nJeZ/mrJ05Oe
 USPnuD2uYmd+9A33kR/vD9R34PKkuJZwHO/+HeDxJUgC4IDFTMkqEUGRluF7e0x8UD8QvpElpb2
 L6iIPgliziwWMLpuI9KMH5AExqBaGQ76ixfWbSGg0QR0eQz1K5Aj5EztyXvM5U9zyR/TR/nd/tE
 Who9jMUtFbJVW7ZFy2HjaycqAyPUYZBVTcZ3CC1bE3eK6OqenYB1WayyfdOJImQkYQA4oaYo7hF
 Y18YVQaGvp4DaeMZ0X1nXYmOjkt/cBR3LQAv9PoalEZxjcvqtMJpNq2fwdLTkgu9wyscdkGh8fp
 pKadmlENTzvUOhjbM9j6KdWb6rxCT/Wqgmjek5KkU/6aAM+E6bcHPKaK9skE4Szy3velaK9ghJb
 abV9DvGEeIWAe+N+kdRgPvj3e8QAFw5vw+jXqDtSP65lIQK/71TS8HTC8Poay+FE+Zoj4gcW3qp
 3P2oSRoP1KZz+A/Oq9okSFl6+JQSscjfHI+rhcEPqgR/aUarqUAjAf1lcKbY9us9Kcn8lW9rYHq
 YaKPA53/NPM9Shw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: Y-P7PoO9dftIqjZnMH5wm75dbJwUAjQm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDExMiBTYWx0ZWRfXxpyr8baxe3WE
 dGRKN8s64JDhIlY2dedZR/d8UGJVHnPhnEze3HbQW+sCrSpqbpBbUV/T+uZC0vTHANDLJL0I8Sr
 2DgApWrjDSi/Xa/OoX6WmIJLVk1vwAeHdRRpWOUCFEpsez1D7o+Fv18UWumHcU2dj2w0hmFAVl0
 Ub03zugrzkqPuPmZ/zmzo9Kynd8BPW3oKW4M7ATZ0FLDi2ZSSGNxFeFLQMvfY8EOi+JbT7HagYA
 x4wBy1N/007H+LMDQxh5Jx39cX7vJ1+ke2S0DYuC55lVD9BUCz7O37Gbem1E4kS5JxCKDJ5DmH2
 A/GQGJXoHqe38YOVnTt64pADtYxpWKeHdPGELTChoNyajkP7GrEjZrSetq+bNWvb9TblX1hrz2p
 5dZCEUKJ6tkO5m+MG1bDCMHsDLBmP4ZsF8LP5jLOra9kyQQ8bi+mwPMlc++8gEKJiUI2G3ZTlod
 T/oCI/S3SK/zhre2QTw==
X-Proofpoint-ORIG-GUID: Y-P7PoO9dftIqjZnMH5wm75dbJwUAjQm
X-Authority-Analysis: v=2.4 cv=H8/WAuYi c=1 sm=1 tr=0 ts=69ca8791 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=1UCgTMz9MQc3icybWezSFQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=yjLBevxW9JIp8IFUU5MA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300112

The two Type-C ports found on Glymur CRD are DisplayPort alternate mode
capable. Everything is in place already for the USB, but for DisplayPort
the controllers need to be enabled.

So enable the related DisplayPort controller for each of these two
ports. Also define the supported link frequencies for each output.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
SoCCP support is still missing, so DP altmode won't work until SoCCP
support is added.
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 51ea23a49b9e..35aaf09e4e2b 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -202,6 +202,22 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 

---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260330-glymur-enable-displayport-8e96854a35eb

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

