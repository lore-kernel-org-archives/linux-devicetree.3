Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39D330CD95
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 18:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782671134; cv=none; b=FFchRUGfcFcBPlV23Fu28/oDs7bsifVvUIdlga3RD4lrIUvYA8nW2+Q8aYFh6w2kX3XH1hPBVA76nPr6fla1zk88qP5zRVKGLdcVKBH/HQgdFuopWmeKtpqppK779ljZvrSuURxqkAxVZkoKDbh8Oi7lUzMSgZjYdK4nr0oMjpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782671134; c=relaxed/simple;
	bh=Kmpg2cRtDUynAO7yy0o/iSHvpnRUu362Fx7oOFfm7RI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q1yAgTj6c+RhXQYXs7RCRgqqI5I14//PWg9WN2WdLrNS1YB6NbhPEKrrFWmSLIsGbRrIOzXgEn6xvTH2viuKJFTk1SXSpSmHqBu8KwGnrkRIJ4BGSyCwOJtqnjwiKDgblPS+D7robANuEn4Kf5sH3VtE/DiXKjgfnBTZiHuuNRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hWe7bG0B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HYURjHC7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hWe7bG0B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HYURjHC7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SHjDBF444943
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 18:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1yFPVvQy+nbJ2ioSTODUoUgdioi73DC3iCTsISkzqNU=; b=hWe7bG0Blx3TxZKG
	/3NGF7L60JZiZv7jEdJ4S58RdujNMuqzXO1DdXy/pWSeSzUweKBPn4ZUio5YnVS4
	c+gukrkN97b1o29twJ/aoJtuGuNqJpaItu3bW8H/ne72D2Fn8AGFFbTRwwVQOBEI
	flY2RxtqnY0iBxGkENK9F2qPN/9E+NZ48uVSV0FYR2Kt/TfriENoviYYZsmZUMaC
	R0LgTzqy4vuFf5DjQl6zodJXTj4+CcBMMZQRgQvYEDEZaYIMihVAhcT0rboBvBv/
	M/qIf3FxptGh4XX6A6otiuFuXjxclgugTP/FZtrxKJyHkazbtJ+5F6UBWVQ0jK/5
	tS0olg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27083ctu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 18:25:32 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0a27ad86so5675562eec.0
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 11:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782671131; x=1783275931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1yFPVvQy+nbJ2ioSTODUoUgdioi73DC3iCTsISkzqNU=;
        b=HYURjHC7tkSI7thSFHx7tm2JjbDBSuOORDGX+893Di2q02mUuW+GEuFBWf70gWru/W
         Vz1XZBnoGZ02w+ZA+shJw3Qs9iUrDDegkRkwdIkJWEbn7Z2l0VpgvMBwsBZEDf6rDth0
         x6UQv/xBWoKHQHlUUnMSrxdoMPPKDWBYm496m6bHHCsTm/NqCxEjSRQLCWHxprX97uBP
         Twvc2jyQ2v1FzoBz68hKGlv7WO+2agb++rFcsGjUcqYTlcocEvRa455XKtxnwgoRMvw/
         tfAo9s+KaWmmmxnnR5FCLlDWXs8dfItMAp/LNXSG2pSrYzGZpTA9m8h51rvPR13s5Yxs
         aV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782671131; x=1783275931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1yFPVvQy+nbJ2ioSTODUoUgdioi73DC3iCTsISkzqNU=;
        b=R+Gwxg0INSDdMZgN2VSu/P4o31tdVaXuZygl3ZLN5l7SGUsgWwXITQeoT93hH95QOK
         o7d9XHiQkyruOkAnBzsRX9oAM4+EU3nEHlOoCcsZMgWwBtV/kva9HqI6t/SpFAh7N1Fz
         L2Vpl8qwUBLZVvh8/ldQYGNV2LzE7qDckioemT/FS+swNFzCt0wm+6tpBS1MqJEQ+ugY
         2Qw7qPbZnL8Z+DqsDnqIqnIpkdqvo46d8YyAu423AfPjMvF2AEEFZ6VnK7r4gCITo1Nb
         xI/P0d+buaQObhX12RcXKCudJ2pxGUny6Eu3DOq/uES647nfi18JyVyJYtIR05uUTSXV
         L6Rw==
X-Forwarded-Encrypted: i=1; AHgh+RrdW0iWIqyFuWL+WKq6w6ObAZtmFc6a34rc+hG26QoKRzM9YqbhZRJCM07Hq4SbVBb+BUVXMh73s5Y7@vger.kernel.org
X-Gm-Message-State: AOJu0YyFrPZBn0cqx3NkqfwPhvoqkL2s99k6PF8aJBKaOMu9lIW1kiPW
	D3zEBsdfx4WEvMPBjVMf/UC2+xntDTyRjfTkCl6kPW3cI8eaqYkmkqR8LQr7jtx1OYQ2zeAYk1Q
	0cL6hHxPqJiU/Dr4q87iB+4Ig5Jc8gITbYypWTvji1/6SdhJO2EekBLHwb8lWD82a
X-Gm-Gg: AfdE7clrx7FplHkX+Dhq7QWb2A+1V5a1fsCypAe/f9Qb23uTz+4Vk6FUWCcr4JWTiE/
	9Bxonv08COBdZdNuY26gTzeSvv5nqZKEDfTSsWZSIjZixygXV85o9bThECL4P5KEYnTf+kzgmIi
	XOTNP8nRNuNlAb2J6K0gaxm1xvmp9yxmHTkEEwRPuAAMrd4WDEBC3ioFUDooaRdgS0AQ3kKgfQB
	Fc+/6MzgpBikfmHEWtlTQfeBc6dP6psxOtS2Y0pA5Zuv4Rz9W1zWlSHIeBWSLGeL7vcxUlExMcV
	hVSo6C6+c0Ylxx/kL08g1uv35EhhCRUhyjCPNCAL3XL6ymVIXIJKTxj3FJkK5pFykPVJj5+4qWF
	sws675BxbWlwq1F/phfr3kJSy7XqeRLfRRQI=
X-Received: by 2002:a05:7300:7308:b0:2dd:c066:bf7 with SMTP id 5a478bee46e88-30c84e2074cmr14238230eec.11.1782671131362;
        Sun, 28 Jun 2026 11:25:31 -0700 (PDT)
X-Received: by 2002:a05:7300:7308:b0:2dd:c066:bf7 with SMTP id 5a478bee46e88-30c84e2074cmr14238195eec.11.1782671130794;
        Sun, 28 Jun 2026 11:25:30 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a75sm37508218eec.19.2026.06.28.11.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 11:25:30 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 23:54:01 +0530
Subject: [PATCH v3 8/8] arm64: dts: qcom: shikra-iqs-evk: Enable A704 GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-shikra-gpu-v3-8-9b28a3b167e1@oss.qualcomm.com>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
In-Reply-To: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782671052; l=802;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=tzXgoMGOkByneCJ+ZG1Kzo6D2yqiTmTiTrurOKuJQ0A=;
 b=vOMsC+RkFWKODgCcMX87UqVP576wC8O1KhQFPbBpZ2NKXQ8EKjv/Q1fMsAlmqzi1jvMj/Q46a
 9dFJbo/MADYBvWrmlNIu1gp4R7A4AWiByduT+jS6FwKt2dNf5omb2ZF
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=ObKoyBTY c=1 sm=1 tr=0 ts=6a41671c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=e7-BAW4puXiLW4xK5oIA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfXwKkrJE1CwvQ7
 zPRF1yFQIoIi/TI3uh1bkNmoEo6klT7CtLue24yKAHc1h9PXSo+BhjOceu5+5UsrS+G6nINxw/G
 7DUM+/MYnVTrXJqf55uSMU78Cjj9rQlCyquw+nXlO0qyyfF+49xOM3JWKw6xuddEv63DecgS4la
 YN6JfWVHS3M/7Fmt7PxKFVkln3h8WQsuFk7hTpixSVWWf5Pjs//OOE0lgNIFT+alidRZUtUJKJC
 9c2ldb1IdQdJ7KJCVow8oAh476HQp7VDd9kAyU09ZXPXiYmvT7H2zSldToqHVRZ6KAgZbRJ7cxc
 jtp/TDDU61TMlXH4i/BeZk2KF1FOa3JQ3h5TdGBPtpjCfqoVskIrfFe94w2+VqPr0NM1NSZENAI
 QHUsborHByyPhRxhNWHZUDQIzGuneM608oeO+IkKZpmKJ6HJ97UyXzEbSJFo+BXjfDi9vCzaJQN
 8up1AAOK4zCMMF9ntlA==
X-Proofpoint-ORIG-GUID: 7YyXgxNLCX3Rt7xmKEMlTlGyxQ7g09Jy
X-Proofpoint-GUID: 7YyXgxNLCX3Rt7xmKEMlTlGyxQ7g09Jy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX8mj67vpL9EQQ
 h0lE1we3lLi4ra/IViedbln6LDtk4lKp8SSeMGAjFYlTtB64Y//cvQodTj5OQZ31Hs+ySqYeekz
 gcU+PW85cZ51WbhlGIVqf/hsCFT3YIo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606280165

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Enable the A704 GPU and configure its zap-shader firmware on the
Shikra IQS EVK board.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 3003a47bd759..0918bcb4b1ea 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -23,6 +23,14 @@ chosen {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/shikra/a704_zap.mbn";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm8150_l17>;
 	vqmmc-supply = <&pm8150_s4>;

-- 
2.51.0

