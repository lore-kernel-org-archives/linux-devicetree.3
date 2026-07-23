Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AFB3B47F6
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784810867; cv=none; b=eg8S3i7TxnxUB1CSGwg7gRBv2/EG22n04Z2w1pwytryzklKP60eWdmo6F/wDSoVutSCSgf/ZKu58gWCHvVBVAWzPbl4g4L8lhRS5yfFqUcPQJjI+49ZMQVJvyyK4ApUTh+7Ke0fRyOPs8mP45EGsJJRM1xD+Bh5SoGaPYujVeLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784810867; c=relaxed/simple;
	bh=beF8BX80+h9HJHMkGhxM0lkj9SXJhy+e36vhzwEqyPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bwuYqkexUo6rfAReuphxmj4vT7DjOBGld5yOjIJay/4Yw2f/vMO/al58PxS1+FkZCuWIC73qEhlb/u8qOshLeubu3nqxUF+gt4+sMwsZzfmfGfIlmBCtgFxHrpUgrH0SVuDACPFl9YKGuZ29kQ17JdpzIyKyEtGiCZp/bST5OQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oojfa9kT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PQp9ld0d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oojfa9kT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PQp9ld0d"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qZWP3648591
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PKOwojKFA4iWwpHnCLiH+mV1B3lcGN1tG/Lk8zN4ALs=; b=oojfa9kTzRfSbrT4
	FvY5z90bnx8bR3FyHBGKlwiCwpZpgiHic+E9h+r9d1xSEMgh0hiCy0uTnKoOYBnO
	yVBTWj4sKF6SCL8uTzhkDBSbLSbleaOe87hR0pLkwY0jy7DD5W52xPSarend5ck3
	0nRJcOTM096p0cShnSMUrRDXxQ+Ad5pdEF8hhEKYUw1/6MRYk5P3htQZjy/gffe+
	0tB6nhutd+pk1odIh+Jhsxnts9Qbino7YVBo/pd+Res5YdMdbbC/vFsPdPyLFdQ6
	Kf+gnbXKswHZLXAN9LBQwepJ71jsvXUfUSABbQKnyAq7KYINegcEbpC9KIBSJLn7
	xDb3gQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7k2mp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:47:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0199faafso12843511cf.3
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 05:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784810862; x=1785415662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PKOwojKFA4iWwpHnCLiH+mV1B3lcGN1tG/Lk8zN4ALs=;
        b=PQp9ld0d4jPXTFSlizk4FeqwF/xOXsarHiGnK6lpSH6fFZ45S6ZwJwi+VaNcTRahCZ
         2alYi5/LeqNu8gpSeXM8dIPSbJpGNCSS527WNiVP6aUTwIfCnF0Shuxu+LJvyVV+Ow1c
         uLcBgGWGDrIvaLAx7lhLYlllcqgYob3ujqAYDhmnjwnNQkEyF8fIe9vw2S5BH3xNfLYy
         8wqy+0bL/tq6p6T3O3J5bIqQOfUDHxYEa1FcyNhfK1A8Bd/WUbjVjrm48AyzeDELwMLw
         YF4+LlmP63PlywQ+V8W0rbKBd/4oojIrH5t+z2r/KLxP7lSiq9UG2ROwtgimRGPz+SZV
         etPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784810862; x=1785415662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PKOwojKFA4iWwpHnCLiH+mV1B3lcGN1tG/Lk8zN4ALs=;
        b=E4IEmcrTMtMjWYKwswUbETezK+S2H47mgv6r8mBNae8JEX7TQLVXEgtdskGbMkerpt
         vuXshVc1gq9mcAJB1UsiWM19AZ3BgYaGlnUErC2n58QCzXMJ3Ht9QJ255IUxQQ87J4E9
         t0m62J/e2D/hQJ/mNQcO+e7JYtj0KLPphG1tbxPdz5q6GJkruxESg2v1wCh0WKY70m82
         tZvK8a+lVPmILgLbmrZ67QIB8anpj+4ox7rCLInS2kMYqrjPJIz0kZ/IS+7ENPnCuMwp
         GsbU256erG70RyCyX3xgUxSts42jhq2Orkx02gP9KEeIh9S0gegdLUHYorPoJTsAX0Kb
         CmeA==
X-Forwarded-Encrypted: i=1; AHgh+Rq7OlZhsZlAb7BejLho/CyjYECArXmRkN+Pc1DrYfAIA9+aJQRaOL7SKLIdDyIsU+BTruPTkFcfLU7i@vger.kernel.org
X-Gm-Message-State: AOJu0YxMLma4zYx+b85vhM70iMoPDAFSeVkxqC/NuAA1H6515dWW9v3L
	R2uAh5ikdOuzxZ2LrpIVm3/pIOhyIACgtbjC5qs1+D6kt2Urax3OxM8xJA1UsO/3wNv7heRENzu
	7VWPa2qlhKnHJdGbNGOyeMQtfI8fhIclkCafK4SX2D8tMyHKIrZjynbc104uHBFlg
X-Gm-Gg: AR+sD12AynB+FQrsFUuLhrlS21TKOTPwSogas3FHFyez/tZugin0fn74vz5CH3BMhmo
	CFzBXbxaYO8DmgCS1t9bSaC4I5Xy4PBkZ8KgteQSGO2k5uUeDftlSPSjqJm5SUgr1MKCvXXg8sB
	AxXkAA9/HS794uXeQJzeixkcFnHxEKMTMtSel3yNZ5uS0/J0HjrZC/wSjriZhZqNYzSlCWrhfRE
	rqCaplcoU43sQAJbdmjMTulBFrBjfBYKdWlNJdUF595IxJTNBbpdvn/zpMDrxWRfV73dz3tUbcE
	1uqdzBQw6u0ICaXOHJio+JigFhCVNf2FegU+h77RXN7MoH0ysgsucwLy9S8NM2ofgbqoDQgkQ+Z
	cvWUMSbAQ
X-Received: by 2002:ac8:7f06:0:b0:527:7dda:ee5d with SMTP id d75a77b69052e-5283df10791mr22037831cf.57.1784810861943;
        Thu, 23 Jul 2026 05:47:41 -0700 (PDT)
X-Received: by 2002:ac8:7f06:0:b0:527:7dda:ee5d with SMTP id d75a77b69052e-5283df10791mr22037601cf.57.1784810861450;
        Thu, 23 Jul 2026 05:47:41 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c531afsm14814283f8f.24.2026.07.23.05.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:47:40 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:47:27 +0300
Subject: [PATCH v3 2/3] arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dts-qcom-eliza-add-cdsp-v3-2-b535200996ed@oss.qualcomm.com>
References: <20260723-dts-qcom-eliza-add-cdsp-v3-0-b535200996ed@oss.qualcomm.com>
In-Reply-To: <20260723-dts-qcom-eliza-add-cdsp-v3-0-b535200996ed@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=867;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=beF8BX80+h9HJHMkGhxM0lkj9SXJhy+e36vhzwEqyPU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqYg1lf8cW9eBLNQVvtOHBOgkPn2TuphmlSsLM8
 Gau0GpSnJaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCamINZQAKCRAbX0TJAJUV
 Vim8D/9IqhwbazjmdWICuNDfNG/4zUXFLCxEUjkem8JWSAoL1qDrhbgJlBb17npD2+AEAooZH0O
 pb3miQmI2vaIChXWbAoEJJnFBX0ZQJmtw+KCXpciw4t8yFfrgEa3ZSPdoOu3TS2KJdZP2xtMDL1
 QZt55Yr8GYatLm/B4FqGKpyzxYiXv5DbZxqDiKF1LlJW/xci9bwz6u99+4rm/YVApObS/X7981A
 wfEbvMbXV/qmFIibXGUOLRv1/mYOHdnmTE71DDeJK6lQAJ/YPhNlce0F8fySCdNw6UpqLxe+Tje
 DgChmtgBJDyanrP/PYcb5uLbX8ldvm8UyvFcieF4oaRvDIral7BVOnI+fhlTDnkyinzJIhaOGXY
 6xtCwjXLV2pNvnPOVj32gq2Vk/6lbS83evgxFhIN71A0lRoNRkgt+eCfpVp52l/GJLDFEY5ZySs
 7IXsQxPkPw22V3n/1MvO843fpGiNZ1WmS0AjyZZZDSfctvIXrtKjV/+SHgFnU/BjNQlPj2vZ8T1
 0elrxQAHkZhwxfTe32ZkMV0zACO/t2cQZqcC+/7fjyl+NCmGI6V1lI2/dNfQpVjfI5lILcEogPz
 4Hhgg3dw055UsJpka2qSuP/slC0/A+4syE/Iuyh2v5BfY4iDAxXDgWgZ/B4D7X8X8qBqo7q8Cbe
 AKYy2BMTNfliqHg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: p_3yWr20pTETITh50v3BHnQAP7b2_ROQ
X-Proofpoint-ORIG-GUID: p_3yWr20pTETITh50v3BHnQAP7b2_ROQ
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a620d6f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=F2_fgvKzopLLhFp2320A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyNiBTYWx0ZWRfX1JqyucYSVwzK
 grfQWX5TywaIVZoVUkwZ3pji4E0MQDtZYuXpb+olcw2NsNzoaTnp+1A6ASnD6/UAuqBmea/YNUU
 GQkCKwTHN1aX1doTyXxDZxuucJw9F0Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyNiBTYWx0ZWRfX4e8sz/FI8jd1
 2iRCuPgW+UYBJlGka9PzpXgdDYApAxRylKGNZLzCgsiwKcJdYJapDQzfJPjLEn4xjLWPXG18gwN
 4FFsMvZ53lh8GtUqQB1oRdcXqi/tQ1M02qmEmvVj/4G16kbmVj3R56+QbZuWfkXXWBkrN7eMJl3
 kn+xp2qpR4ZirShIuNCm5/MPPQh0FvOW/Tv2iHLHvLC17UmgGK+sU/4IoJUwMbUin1GwJzwuiRC
 9I8xXlN5D4STeZbhjZt/On0crUWmrJw6odOelo+SUdDJ7jbBuKvp+d9ZPIGLFxRwiVm636+RH/D
 0NZR0/jOly+fJZAYr+nzvKOdsycGcQ/QJIySM6tz7fWsLgoui6afq9U2tmwNjtzL8XOMP3cCKdC
 JBcD1Pmebqycmz2MpdUF7GiapT8cdKPE9J+zd5LYGEfAq0ZBBTXC7zF86AutPRd4hdQyxWYxKp0
 DnYbyhS93CFSIIvE0aA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230126

Enable the CDSP remoteproc node on the Eliza MTP by providing the firmware
names and marking the node as available.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 5abc23b9b676..c5a772b05223 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -484,6 +484,13 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/eliza/cdsp.mbn",
+			"qcom/eliza/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &spi8 {
 	status = "okay";
 

-- 
2.54.0

