Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A482F33D4E1
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 06:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778133979; cv=none; b=TyFXCIlp1PKUXk0C95zIIRJYzxAMATebTPiS92Kjg0YX9zHfa8MZm8xJLU2onr+0pfRmnAM18uO5ok5BrLArkxIAUywDEV83SqIscxAhBLYFnoynd1RK9kAnXc2oeeTIJUKefVQvoPeRThEIcwwij7xeD+z+63+GsIj91owAXA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778133979; c=relaxed/simple;
	bh=qscoCSFAgisCe1f4h29FeB3VcT/jr5H2iv1XW6q2vDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GgF6sJeFe09CNVodMzONUJRLhUJqCt89GFuguMcybax6qAjlBxXyNY8UpuZot69gOBDbETeBwdYyf/dKYDo7Zhv2Y+iUlXCc3SQ0KdOj2E/3w478im7I8s4Vm5EBUeFI3VMhdepyjTdX4kH0Oyg7VH22CIAbojfsTmV9UuD8T+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p2LFrs11; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZescNGEi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p2LFrs11";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZescNGEi"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475LNnp3036465
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 06:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=; b=p2LFrs11XBtd3dUx
	1n2CFiNwRVA8YZaMXS+WCaPTqo1PhV9OfDDr2mv/SgEUJXe1Zjet+1WJXydvUZBb
	DpQgKI8vDoEjRWIvPU/Uz/oX7yC9GkwZ2OLuxBnBQHhn339DlH526F2nhENfd3mi
	GcIJwChPioJrjH9ELs6PeTWRsQMQPHJqhyDy+wjhL26l06ruOZWfNV5CuSO9ulJD
	Vr5LhFiT2jjAIWLnCmRP+SqdAWF09G4OABS4sihkjNhWHfXhmCO3pbAJUlyBlc1N
	Amf3P0V2FALKn+LT+Q/iWFh0nwEeoeVhmwFEfBI5S5OxBbJSO42Dxfiir5of9kzg
	j5e1cg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e05bf3edc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 06:06:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f6e6a3a76so444928b3a.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 23:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778133977; x=1778738777; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=;
        b=ZescNGEiQiAivMf0ioKQsraZglmGPBxJ2CrcJYQda9IFNj3IQtu+pa/oQfLeqYqdMA
         aCtAJ7/ne3iUnneg8st4sz221u32zccl/5X+HZMqED+UCOvqvFn90SME4hG+knzx8ZVY
         zS27wzJIcOlfuyjENwqwAxEADLZDcA76kIkaKQs3e1nlgr87K2n4eQZsoajTfcGYE85X
         FIukXm5J6AD6AC7PIAwQjQw6eP5b5hTpcajcyIz1x7wkzbgPrWpnG4m47aoO2os7jl1U
         VUouk7UYot8JX5eNlf62CDweo37Dvpl/drcarylOnj/chhpk6fu8XF9SM7gPcuaL180P
         hPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778133977; x=1778738777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=;
        b=INCYBPI4ORwdcI3V2ENVV4NTsYYoPgh1ZF7W5sEhJiU1cCBZH7+49OTs2zQpCXxbRc
         iSheATvxDuf45mxmxtDzqRjgdVgxc4eCC+CM/N5rt7Xj2Ij6pejawWuVErg52s4U3Rs2
         qLERIRKcDrW0Jolx+qP1qEmoFetqpln6Is/ANemshUZ09NFfbBpqDWdaVW/JdpNEdn4O
         nR0vaN6B+KUrSKdFmMcijvv1rlT9Xzip7YPgrFhVqn7DzsHIcBMukih0jOU3YP2laFHU
         MKeywqUbTBuNFbbCsncYT0nCUSP+BG6UhqQD0YkRdav1lllpuhQg8nzS2SVlFUXZjnoZ
         CMNg==
X-Forwarded-Encrypted: i=1; AFNElJ+BVSWLgpWGRWaUuDV1DKmoBXubhsLPiHyR2BxgayHzk2A4HTiyDOSTfSYN0q3YAj63QF8Ffxqw5hYc@vger.kernel.org
X-Gm-Message-State: AOJu0YzvnI4QwiaRvH41zFRNPtY7QmBUejyGYPHHEIKXEm9/dFg2E3SN
	0qgcC+W61jZoQapkfUSgFU4La3m4Ebo0CghBCxfq181wGsWxQ5F5N20ZvMmDaCLJnqnAsfHGM6b
	17BB+RUa2shTmJkFzTwa1XCXlpcikQ1MGMZdV0oTE1Rcf0B4i+Id+NX/tInSM1tjB
X-Gm-Gg: AeBDiesKy028TVlVYSDJaDyu5EaDdYrwelh3xqwMzDNuTPHh/gAmtH+G9ppg6i5yK85
	j61vyWtqcZetbAH4pmxxaEOpRnxf62NyV3UucPbjznUsPWAfn2QXzeyDhXEFyiCLO068oVFvsFG
	WQUTKC/PvS21comoJXFbstHDRXbS3w1LXVCBlQSZSlvmlSGfm+QSO4cqIAlf96Zxp2USAaIXqFd
	C9vSadfXAr9Q17PeWMqjyiDEh0wH1OnRTkkbBEQPJwkyoMawX0ZSh90IAL2BzAS0ZWmY8S2K3ar
	TEP7dxCApoANdOsAY8+woy+n73yPwe3BHGtshqwaiHgiNTA34O8WWqkgoPTVt1QcD/wBBP0k7q1
	9qhCnom6B3qPdsZoRsDPNUaYnPkTE1zs9irQXUQYYwfiGlSQRuik7NAkB3s1AcEKqrurPYsB6w9
	CYhOsA+uyfRo3ELSv3AG5+IY1/Bd1y7sQ=
X-Received: by 2002:a05:6a00:2386:b0:82a:7aa3:a2fb with SMTP id d2e1a72fcca58-83a5e3545e4mr6355712b3a.37.1778133976640;
        Wed, 06 May 2026 23:06:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:2386:b0:82a:7aa3:a2fb with SMTP id d2e1a72fcca58-83a5e3545e4mr6355661b3a.37.1778133976105;
        Wed, 06 May 2026 23:06:16 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839685a3187sm7566187b3a.60.2026.05.06.23.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:06:15 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 07 May 2026 14:05:48 +0800
Subject: [PATCH v6 5/5] arm64: dts: qcom: purwa-iot-som: enable video
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-enable_iris_on_purwa-v6-5-48da505e23bf@oss.qualcomm.com>
References: <20260507-enable_iris_on_purwa-v6-0-48da505e23bf@oss.qualcomm.com>
In-Reply-To: <20260507-enable_iris_on_purwa-v6-0-48da505e23bf@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778133946; l=1004;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=qscoCSFAgisCe1f4h29FeB3VcT/jr5H2iv1XW6q2vDA=;
 b=1/Ja8nQ7u1NL6b8WY5O+6Jfbqpfsv0cb4TCE6kGkLwUc7EKVlDGE/tpoijYSHdo58ECKeWG5y
 X8FijgyTGVFBseAwtvsvjIQjIaudFPD6sTnTyJduQtCaLXnb4VXbkDk
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA1NyBTYWx0ZWRfX7tx4Fqdzwqsd
 ZVsNI2QokmhxhrWW2ZFrRFssfc8Nf9fctBZsU2SdXkPoRsXh2DW0nOYQHpQvVLvyx7xqFgJhU1t
 4QYL06HlGJmHfb2C0a999acaL2QdR5FFModTk//HIAp1wEnBzFaV7AM6s3+3BsB81t+5iiCD68u
 u/qAT1CyQx7CMFgGwJ9OfSKdw9hReFQe+JzN/lGhv7JwF0NErJ1B0u8kjMsObzg191BnxRzP/Wp
 7xqRbX2g8/CdB2lDpKsJ1AtuEpogKx3alV4+3vMc3MkZXcSSQN4WDh/PzFhDeGdG0noU1/yOh/L
 dMR3NjHbhk1ddfu12tKqPBHycmmVYsgMDEsiiu8QWtOPKfJszT2Q3GIJl9+0WZO7MJtZc+AqJTR
 nGjB1ca+zG6J8tEASFGandCISRrXXvvPMlyjDYOhFD+J25lxAQdWUKhC2IRV7+hb+mZ0hH8sZFT
 pbaS4PXGduyc3xcPwRw==
X-Authority-Analysis: v=2.4 cv=PqmjqQM3 c=1 sm=1 tr=0 ts=69fc2bd9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=REEBHDwWlCTOHul6J5gA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: aE6ayzP-CT0XtMrRf8dxPWe4YJUOE7DK
X-Proofpoint-ORIG-GUID: aE6ayzP-CT0XtMrRf8dxPWe4YJUOE7DK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070057

Enable video nodes on the purwa-iot-som board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
index 394e65518ac5037e5c7c50583acefc0dbc8ebb47..ff8621f8750584636ad781467f9c35ace2354e4c 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
@@ -389,6 +389,10 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
 };
 
+&iris {
+	status = "okay";
+};
+
 &pcie3 {
 	pinctrl-0 = <&pcie3_default>;
 	pinctrl-names = "default";

-- 
2.43.0

