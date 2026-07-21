Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E753BB130
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784622368; cv=none; b=qf+6GjYr3wJ1z1DxL0qHyrM1YTdagTZUVuIMP7I35/zBHQe32qU2fUey37XnWpv9yGFX1zlG2N2IGpbiqSb4Re8hiPXZCAL95UYO30And2jnA9QgEh1hC3+T2oz/99ORiYIfhmaKrBF4zhBXmNjWq/9Aa4+i7jJHOM/4wCgn+w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784622368; c=relaxed/simple;
	bh=M1vUvvpfcU6is8pbV6WwTEvts83UeWZLOwICJrqoWWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=umi4KG2y1JssOm9bX1hWKQew8ZX9xO8rJE9YZ9q2157Fug0zaIU1oUzGESu1kL7ZNETyaQNlnY0aydMQLqTvdpfkiFdthbc9QzzdPwJrv0Dp5iy0zKA6XhjhEV4L4ntsGbXzwmjA9l8BhnY/iu2UHqtTokvzWeANWBKdOygNgdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R0KcMHbp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cvhx9Qfv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R0KcMHbp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cvhx9Qfv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6GQ6I3980888
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j38ulgScMZZkU/DUH6XgMNi7oPGQjlhHD0izRPHIJ/8=; b=R0KcMHbp1f7ZGnUe
	iXwe3SJFku8XejrN4tbZR0R4y/rbj1Jg4FRCK4xNZZmM2i0Gdy4oifV4nIiqRUzD
	EG7shXrJkblYkrgfovNxKmQICEgjdgWtH1pANAtN4HSv9+IiS6Ww/xGzzem+FSUF
	SKU8EcI+QV4HXdW35kz5NguHggS0z16jYKO6Lk9vT0CZN879QTUVltQQyuD/TzTk
	4ib4j2L/cqld543e5qeOgrMKoF1kEg3yUcWEJjMLKw3sfCSEulvTBwIALRx95e6I
	opNBr5X3NC98X0QCdboId460jQb3Pyv8FUU7Hl8zT+UdiMnpOFpnlif/cChfpJrc
	mqa0/w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv4390x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:26:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51ebdfceddcso128760121cf.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 01:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784622365; x=1785227165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j38ulgScMZZkU/DUH6XgMNi7oPGQjlhHD0izRPHIJ/8=;
        b=cvhx9QfvU6sJ6yFmg76qlnKvur2xbjZtchbONAZu9aC/1dZLsGNIx3780+xpHaixfH
         mq0Ix5tw5p3z1lb0l+uajFZAmyiDdfE6fq5pjPkEhERsViVmkq0K0YvXl3UAlwHMiKPR
         FPol4A25FUSXledkMGb4VnHE59S/EoXKd3zDwrxf9GhoryXehNzeBiGpqOpm0pFly0UV
         RIv8nMx8zHiTPATvysreLCRvUkt32cx7zo5DZVCwpg1H6p0Dic7EXRvMmcp7TOsIZrc4
         6rxTAv4vyB4p+OktP8vjbiY9vsEgAW+AObQWoEgsFOYR2uAHdGlXnlQSmeUjxPeu3bV6
         puwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784622365; x=1785227165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j38ulgScMZZkU/DUH6XgMNi7oPGQjlhHD0izRPHIJ/8=;
        b=YRruKOiXp+tiBg2rfsldbkKELTht39VmnL7ELlTMHGOt2h4BgpaBhFI8yBDiMIRx3r
         8iaTp9DgNXk8Db59FPGuXbQotzWbKWSai5+rhow5w7OP3D/C0XGwCMmzAIVvarqAej5d
         4niADSTXfxE6Lgg7hMeEscKbnOrgTPJu6d04UJrcqlnU93mK27FcQUkgarobYxnY6aLx
         d16hBtFEFrLDk67JaxqBoPogB009j9bQMDIV11LxwRTKexVzanaZvyl58DA1eDAGhrgn
         +hCsgSyB7x9mwOb3CDPNpCWGeEFL0OH6zRtjEXAYyt0xjZiyuBX43eyL+a68foBBjcut
         o10g==
X-Forwarded-Encrypted: i=1; AHgh+Rqe8XFXvnnawfRGT6gqNEa1MX2U7uDnECjdt4kDr7lOED8Oejy+xG0fKEQ59Bh8AeM+YPOpD0rZLrJ4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8JwCUXMu2UN559casPT+miVS4xwl9c2wp5r3av5gFYylvfXv3
	1Sk5NAvMu8zQ9lCn4fpxa/SEqyuBmI3tHdToKz1Y5zvoa7YEEYDCu9NgTvHa3HCD1C61k3lI9hS
	9nZunOj9YKnPRe2EGVi6yA1ceZ+WuCM3V5OyZjQ9oa/r2rPp81JlFz4zBEdnCio4e
X-Gm-Gg: AfdE7cl/LN/EWLsXjdF7dJOq8ZKkRsc3VTbPsImAiXZ1oQ94M0bQ8uAmkVdm2C3CfWk
	hLzLeswar2HVBvhKNkXlUxRAgRSX9VcxV3GDIWTpKHOpu/n5/xk+LI19qgvRJ5H6Dy6MrWYjs4p
	inaEEglRFFTuEx+aErgiw8UFieD/sZcqa5925pwSbgGaZkxe6wU8QIn8r4rSoDW6cBb3Fi1L0B9
	pV/BgROaM/wYuLOoPw3Jvdao1wVNfWVswfhAjfQXrip42zN1e4ap1+9Ys1Rt8ukbDK5p1+boxEk
	/nnbi8JwPzHu54FAASrscXnNLvmFz5lNKTr6N0oadPuRb+zzD6vjva+xG89ebpSE5TZpV9wVU2l
	2kSSNvtJt
X-Received: by 2002:ac8:5c91:0:b0:526:75fb:73ad with SMTP id d75a77b69052e-52675fb76f9mr12339481cf.79.1784622364825;
        Tue, 21 Jul 2026 01:26:04 -0700 (PDT)
X-Received: by 2002:ac8:5c91:0:b0:526:75fb:73ad with SMTP id d75a77b69052e-52675fb76f9mr12339281cf.79.1784622364227;
        Tue, 21 Jul 2026 01:26:04 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956537c7desm66664595e9.7.2026.07.21.01.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:26:03 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 11:25:49 +0300
Subject: [PATCH v2 2/3] arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dts-qcom-eliza-add-cdsp-v2-2-e1e52bfb3c12@oss.qualcomm.com>
References: <20260721-dts-qcom-eliza-add-cdsp-v2-0-e1e52bfb3c12@oss.qualcomm.com>
In-Reply-To: <20260721-dts-qcom-eliza-add-cdsp-v2-0-e1e52bfb3c12@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=800;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=M1vUvvpfcU6is8pbV6WwTEvts83UeWZLOwICJrqoWWg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqXy0UX7SCptWFL+7BOFZoncmq+tzHvw/K1LL6U
 tsliZCn3yWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCal8tFAAKCRAbX0TJAJUV
 Vu9QEACoJxoX05Uaj5xw8l06Qu9r+W4A+nn905yLuK43SMt5oxVDsS9u0a/3TLj/6yQYz7wHWhR
 zJSdvnO6NNSVCz27CxgEbq6orJIRAyTBm5sAJrb3gnWJqvN7bRSW72cMMbAnVxtGIg5iQKJ/RHe
 Kv51g2Ta2amauYpP/ZxrbevninkA+c/n4niF/VV/d7krAFuMPiCSZtyMqFnyjDIoG+I4bLimOyg
 y3T+b6Kfm38jyzHe2pLqKUqdojYb3UVA0Yebqm4nJdd16btv8f5r5zY4/scSOjnq6PbpV8gBfew
 gSRLNUbmdK4ozEw59ABLn5+082RASL5/bvk3prtI1qhgL7kpNl40Xy0Rh9BeExzN80ZwnJuRbJx
 nEustyALUpNwnuoRlopEygi17jhDHOk0uPBV2HPvfFQqKKUGonY+pm7ns1lgnEGMgdFRZnfYxT2
 5aobw8ES//MpUPQ0q73X+vpk/OR2NOhelL+xctCSo4MuaVgmj4IyppwYc5gvwt+u1eUcQ3Rk5HJ
 MB0hSqq6oPCqI7dfu1gQ/dATsU/iIfg5hAP6kBAKTEEbn1rCjRzp3BRy6gdh3FjP8G2aIM+pppL
 6bzzEKbiJ5QByOlFIpnNr8Vlsw7490mNbB9ooJjP/EX0SFvKWqc7tWtzzQIAOvDVIAJlQvN1rHV
 eIdwP0m/HeTa00g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: NyMxABCvBoqcpiw7FvMfAFYYkN9Fmltj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA4NyBTYWx0ZWRfX6tzMztBmMp3c
 ETB/+0xOF6GSqot5/fvFV0YIYArBfrmE2VEufcAw1UdctCvPIJPKgLK9Z+2D2tcLV/jdNDQLsVn
 7XCgvXixdmYLeavtCf4bnpSHQjEa1pWzUMjF6YzL/mWvpEo1NSzwR580oypvZNNOAuTz50UQzS+
 bRSrFczUUOv9tQVIX+o1ut8ABvc9aiukXPSoem9XmAQbITMMK2nwRzmwRv9ZtBBONLQCp4D4TvR
 n8J5AUoq5qXDc0P3YQdl2ithKpYNwlozK8D2MA9XV2xuFTdHwqZj/h6BH60zKPzxgi4eN2fcwip
 g+47EvCHpwWpBLgzQQf/NNEj+0lmJWssOgVt7fEDR0eQ2eNVODq3keh7lg7Ne1gK1QurtVS3EI7
 mb9VE+NlJDwe9mFBRT7kVcCNMVR6VhfgawpGmoXNODIYna2tIpm0Xa5nXhmXzFV/w8EGjUJ7Lb6
 PL0CSH9CPHakYIAVlmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA4NyBTYWx0ZWRfXy7ACA9QxQglY
 5RcqVkxalpK9tFBAGxpFCegB9Tjhlr1N3JreMZ0lcn3rDgTKFoozxadTSfEcr3acws6ZOyMJGgw
 2q+XYOKu13eDA5e8Kc6BpSaT3GHBG2g=
X-Authority-Analysis: v=2.4 cv=daawG3Xe c=1 sm=1 tr=0 ts=6a5f2d1d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=F2_fgvKzopLLhFp2320A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: NyMxABCvBoqcpiw7FvMfAFYYkN9Fmltj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210087

Enable the CDSP remoteproc node on the Eliza MTP by providing the firmware
names and marking the node as available.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

