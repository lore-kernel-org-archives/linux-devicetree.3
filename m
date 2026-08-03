Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC72437107
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 19:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785785343; cv=none; b=lXd/BRr0PTN69fUv4g78vh8VXo31t+pwZseSakSwsz5ocimVMSbpGl0mcg/zUZ6h+SkMhDBGqh7K+bmggzFZ6qt0OpgPZFkxPMOxZNNcZy3rGOOiSTTBoO1cn4BRAuHjqqNCwdk8RKNLMccbk/7qtUunSf082CTbh/BIvRAFzXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785785343; c=relaxed/simple;
	bh=izZAAQiMKpd846XRQoInaW0CONJQZ+YANSqul+Shiak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k2OhkZWUKT9V+O3jT38nu3dYN3A4LSgIQXjQ+wzlqovb2hWhkw9BvUd9S1wijGSbQai1wamHHG1a+beYmfMx4yz15q1Wn06mT52W05mfFQKUyJ4IcDxcyNG3rT0Bf9eUurk0A4Ze/wMEt0JZ9C+jdJapEtlnw9HjRBkY0YkcjMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hwFyo+zB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bop6DPXO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hwFyo+zB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bop6DPXO"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673H6jTU1053470
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 19:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BVntk5RjiFkpJwCbB7NEt9eqle6RMXf6vY2O6thyA4s=; b=hwFyo+zB1FarSUVz
	dDM49IK/eFbGCn6REkqRUB7L0KwEEMnGnPRjWMRJsuL8rnB9WGzfqSByplPIgL1S
	qFHZTDRPYGXHda7jnrOybrdTtg1qrOzPkXEzmy90WufB27HvFMs3cNjAo9r4dEJg
	QqYcNjE2K4d2ULFcxcH6QSwPHgyLbRPmL9EtN62/a+MVyl+sI2RNbtZnNB9vNjmp
	4Jy4uVbNJPwxjLa0f5uJ3HwUdhndOfFdAN+fxczl8YIdygc64RZGMW6IZxU+gwLx
	c4KABauu03pPy4AwbgVk1raziiQYSgiDIZX00gMOt30IlPSqOHT6LuJBN3PSs07T
	d4Emjg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3qgn1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 19:29:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cccfa32670so44668925ad.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 12:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785785340; x=1786390140; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BVntk5RjiFkpJwCbB7NEt9eqle6RMXf6vY2O6thyA4s=;
        b=bop6DPXO0sPJpN2Ig47SmMoy8bCtgnHkrHo6U1PIfTW4bfDEn8ES1c8x42YO4HN/Ta
         U/OwKpNe/h7busGAJmsAxlGdL+K63wI4qW2XQZ+h+WReZ5rllIQD8ijjm99GJWLO6LPn
         yeFR76yFgHbxD7s1IjlsgaHwMhxlUkjKxXLZ+5RsStTV/klK9kx8xrwTLQaLY4ilzWDS
         4xPgGmZbjk760kiRnzPSBd/CXBvMIDXiJlPuOvMhfOjLDoa/1BbFH3H7DlFprS45koHV
         8mMFiLinOmWSr4SYXADeQplJLDAP6MnscyqKmLU1ys91KJYKT871OyQ8tWZTeSd8lorJ
         Jc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785785340; x=1786390140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BVntk5RjiFkpJwCbB7NEt9eqle6RMXf6vY2O6thyA4s=;
        b=Dx8aS6ViWv2eS4ysqWp2JsUjL07ySOInVfsD+xiTgw+sqtzlAAW3Z09XIbBtHqJHlj
         AZ1ynVpXZYfHHPU5DYjdOakI7ZOgoC99AuXwZIc1ydY566D2AqUaQzSZc/lIbnu1OYkX
         +RU6ioYXHQyyi4zWopkGvG6zSK68a2Tvgyc2OeMLIWoK+mIyWA4JiJIS4EvJYPwCdsEq
         RNbEjguYHdDRum/cbxlXudJxiSwTR3wIrxzHO3DtaCoKeSqpmSFW3ODuACUNPEsXyIK4
         GKMJizXPCsqHQW63SFeoTyyFl4gHOv6rn9ahXSchZpVBuUNc+p4CINDoeX+u80O4BttU
         wAZA==
X-Forwarded-Encrypted: i=1; AHgh+RoGPKxy8ZKoSg2bc1I8zNNqrD8xhIFEOyUu3HSS9Mlua2q8mf1PX6+kx8PGd8FPqYISz2evl+jZBVEC@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0blCMBUkAQuc1fg71q9x1seoq6MIjd363HhOtFXiECZmQDIp/
	qdeeNVbZYD8Ng5sVhCFF8FG174Gpm+CYUT+eNsP8d57bNf+YDznsFJ+omXzs3kr2WpKRF7ds9zS
	hTRG/m+gYqLwozuJT9w7lb+NHqRWuLhPlrRP496xEYBCT0ZMNKMMkTXChIAhclw9E
X-Gm-Gg: AR+sD117/ofhPbLGhrQ5MRANTEGZBxSSTbwcxUlcGPHPNgYAxi9RB5vwCPURa0J1wNC
	LRO08UcWquALZdy/nsqKXBibwR8kUgJLfuJMkDHtihALgeUUobLclihICgZbgsTculEvjbmzktz
	KEAvAvC5jJ0+lKNDoohoioz1M/yLBP2Pq3EkxmOOIT8H6p/Kz8JdiW72O1YYNQmRmeyxmXcdyQm
	L4HevqmCj2J8Nx8PoIpT5NPjC95iVb74u5EVHios5YqJOOsk0tBOZgELe+XsZvHUPFt766DWCvS
	yrOGQAoEmh6rLtwQhaPlyMoLTEer2fR28A3/o3JdEO64Dx3WPtJpx0cRZHceW9uL9WicIPjZ2jX
	TMw+mv/jk4KbCPsJaZdnDtAZlLirFeg==
X-Received: by 2002:a17:903:22c3:b0:2c0:a555:80d6 with SMTP id d9443c01a7336-2d0521bcb54mr105343185ad.2.1785785340236;
        Mon, 03 Aug 2026 12:29:00 -0700 (PDT)
X-Received: by 2002:a17:903:22c3:b0:2c0:a555:80d6 with SMTP id d9443c01a7336-2d0521bcb54mr105342855ad.2.1785785339788;
        Mon, 03 Aug 2026 12:28:59 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm38622738eec.1.2026.08.03.12.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:28:59 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 00:58:02 +0530
Subject: [PATCH v2 6/6] arm64: dts: qcom: qcs8300-ride: fix SerDes PHY
 regulator supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-b4-sgmiieth_serdes_regulator-v2-6-c4bc688177dd@oss.qualcomm.com>
References: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
In-Reply-To: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785785297; l=1012;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=izZAAQiMKpd846XRQoInaW0CONJQZ+YANSqul+Shiak=;
 b=VCkjc2WPARIqmhG/jr9G7FTASS5HS6MDritc3MjarDa/wUU5RqFTIfpyfMlxgGHF9oaXnmsNB
 Yx5FbgUTEXQArj/I08GWToQ7v52Tdnr1b+fB4tXftgiiTk/d6Er/aGC
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: ax8O0jvzVkzmD9jrUvmswpOPIYWoGdJB
X-Proofpoint-ORIG-GUID: ax8O0jvzVkzmD9jrUvmswpOPIYWoGdJB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE3MiBTYWx0ZWRfX2+ohQs6DA+UA
 XT0/5LZRYuz85zvJDYWVlti241BUiiqKje1Vmj0KqKVn83z0cJfT1JRUyJ8wYaL4a/2Qns5nUMY
 Nu699qyIFqxUfRx69pi4AgHeAixoQgtPDY7MZ6HQwfdVMKCfPJWEdVIIoHY7swbgWp638u25k5o
 Ito2hxACtCMhvij/EG59UUj/+HzYX2W4NQheJVf5EESc+SKyv4w8gLdVbChsTJNb6wZ83rBANPS
 TMNDOTnRyVDdYsfn9ibNso0Y34OI4gp/9/PR2G5PnTMMEB8cecslhWaxCnnlpFCZuuI1TyitcMK
 KJEah1x9iSiicvr5+Iep7fy+ZB6Jv1X0lst9LbOu9C1JKlpp9IRP6umfIIzHw4kBikxjYawYwTa
 Mu00HiQ2zRJneIbgK0dfAiA3GVBA2pZWLvnpe9D8vjL4n84UEeVEScC/ubv/hZbFRPDEelyfZSo
 ypPVcOYZ2dK3O0GEm5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE3MiBTYWx0ZWRfXxEp6Zk9X7usV
 ERCwU/W37J6bq6P28u3UWTf4IPQfsC+napCCuG4VizVnlVJpZOv3oMSylNImTi5jScdD6sNDNVz
 q3cDWq2HaKceJCrfeRXoGatYpjWRLdo=
X-Authority-Analysis: v=2.4 cv=ONEXGyaB c=1 sm=1 tr=0 ts=6a70ebfc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=n698lQYe1Xln1FfB2wUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030172

The SerDes PHY node was configured with 'phy-supply = <&vreg_l5a>',
which only covered the 1.2V rail. The 0.9V rail (vreg_l4a) was missing
entirely.

Replace phy-supply with the two named properties vdda-0p9-supply
(vreg_l4a) and vdda-1p2-supply (vreg_l5a).

Fixes: 787cb3b4c434 ("arm64: dts: qcom: qcs8300-ride: enable ethernet0")
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 1ff39530ea3deebe454416d70a289e44c2d89e3f..76c34215dbdf07e520fe96d350f52da8c4485c97 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -702,7 +702,9 @@ &remoteproc_gpdsp {
 };
 
 &serdes0 {
-	phy-supply = <&vreg_l5a>;
+	vdda-0p9-supply = <&vreg_l4a>;
+	vdda-1p2-supply = <&vreg_l5a>;
+
 	status = "okay";
 };
 

-- 
2.34.1

