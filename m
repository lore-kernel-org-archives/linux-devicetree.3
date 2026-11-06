Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793950670;
	b=4vHNbXwuf17AGxsj9XDNe8jSoKI2IKLa1eERyXfYwkA7ct4lYOrkDuyuxWwxZmegsJUt
	 IquF7hBtBH1H8BR+Y+BDFeo7wFKGD+AaUXNVZdu+TgfRecTyHzukuwBwKR31DU5rdH4ww
	 xsVC6uR2ztbIMfOaHiYne2NdvsKq4VuOniztkgBdBxjMpFIK8lVmxbDoBUGfjiMYYmbA6
	 5DLt7HN+dE5/VNo4Keo50/aZBdH3wlblOlvOyZIgc5qiTAXp24kcKp+1yLWMIDZ7JUmeQ
	 NNmThkAp0d6eZhhIvO921SNulbJo++I/YYbM3ulBlc9HyDgFuAs3Ui381Y5wOjKvRFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793950670;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XmBZz8J29Lp9GQIu57kUSr13Q3mTJePiIqWSZfKucsE=;
	b=uZ7MtlsKxjkQn1w/mLJsBuRk0W70NBhJPpCmj5FnqxhHNWXgRHdP1+tGpvDiyAmmmBp7
	 o1AiFQ3JzWPfvLXMEltITmMEna9PxvByTfs+A5SfhftKVoC3I/lo5wFqwF6OcW06vxsk5
	 rRXZhfBWKSrbLvgKf8k4ok3VPwo8mdqrP1QV5/rttAqHIVWsxekwjtH/Cn6aQ6mPFbr9t
	 YNFUILVCAjXai7eIYoKk/ZAbKyGmNZgcYzVoBb/oYNcEISus7lwpaEq8vzFcULf4rhc6G
	 K3tB1ZTAdOFVVuvGDQCWHV6u6Ku1hc9eDlJrwGkJWs5cx2QfKU6KqMtmRR5e+e4PmuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pZ04+8ec;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PMSwk5uW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2049606A329
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 07:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2049606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pZ04+8ec;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PMSwk5uW
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RR0A3907026
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 07:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XmBZz8J29Lp9GQIu57kUSr13Q3mTJePiIqW
	SZfKucsE=; b=pZ04+8ecmdKCBnpBh2OngT6OWQDJP5SgMMUdEGtj6kx2pa2RVaY
	3UBNCPSuYTRJHisQftVw/P7WapUVCkzVhDslkykEWgUwflp5a+aipABQo9dKXN60
	v0fExz2YjcAsGMNdrWAbdRC66q9BlSFVuKYjr9W1JWY+zFgm9wHMCo0JKCj86P8s
	2UwA0sS075yZ7SaVFvQwU56zmIk9p/rea6NgQkP689YuuNtwAXaSZywWDdMNlOHk
	liQPe/F6QnM3AcujXI25sbYwzmGQKB3eTuUZ/Ck/WKrE7jGJdv8O2fQtqrO8KfdY
	0W8bXJC58wjGUkQoezrpeVKxItu4r970/ug==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pasn5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 07:37:48 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ec8c86fb91so101081e0c.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 23:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793950668; x=1794555468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XmBZz8J29Lp9GQIu57kUSr13Q3mTJePiIqWSZfKucsE=;
        b=PMSwk5uWPIMjdE5vKl62nh+bNu6HwOSmQcA7n4SF2yJ11QRtCfbnqect4hRyndQgpV
         igVaZ/Ot2ZWZ244NlyeQdPMklnG5MBJXQjOvmQrYHMTQSxpxtRCnUz1DWCGpQK2t3j3E
         zUYO9K535o6Y0tqZEfaahr/rMjNHqKfbI4TmrcVsXDSi9B/6itLa1ut+6e1AJLGPZhE3
         dmx1UAYRBT5Z69xXS3DXW3hkbx0zCwnmbqVh1gQpQ7L9UmfbdtMi5dHWHG4bjVr2m342
         D+fSqZWXuuofecQrlo9YNsYVdvxooAe/Ka4gZ9dNzAQ6JkAGt43RFqFeIPrhXg8zp0Xg
         xdsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793950668; x=1794555468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XmBZz8J29Lp9GQIu57kUSr13Q3mTJePiIqWSZfKucsE=;
        b=NT26IrYOuBuQecveoWZk86CwNsCkxXduiamu3TeeolSWwjn+Wxf6QM8DWiiNvRJhCM
         whlk3zTwvPKp6ANuUhAt1r2m1vZlxDcQ9S3+LZMWeSzx9iAGkNEDOKahg16lmmn2Hmk+
         b1kG5hk5na0SiUk4a3pA6Yd1MEhsCLEC0UuDbEtn5QtVwHIrTur9cyO/Fja0bbrd+0nI
         7Nz9ncNMe1iQjvT6zDlCg64SGCEtsAWAuhurVldGqLAhyNNTnWkqm+hvBNKuSGXt8c22
         KG/SuOUw4FzW/pYY5l6n3Gtc6rR2UMF9oTGMCLyOJF1EQggViF+/Msh+B/AS8YV0i1pK
         7HNA==
X-Forwarded-Encrypted: i=1; AKwUvBzB8PUR8tOnekNTfD/KufMkefYHh/jvUVg6vT8BcBVuwWv8roGa54Wxwv9/2Uk8fS4x4PqUAg1U6A0P@vger.kernel.org
X-Gm-Message-State: APuU4Z9nsYQMi45XRUT/vFl9IluXLClb7LKFJUGNORZbzQjchopf5tv+
	x8lw4fwZDIKhCBBRuxTDM5+4RCZlromJr/6kpFSOKvVKfTn/qDJTr4yN7bXGXr5tFWXSlogtuvG
	sMMGdGMROZJlWz7fQAxpUAbgipjcngO1cwgB73qSsfHCziYiI3qwuZDZMahjRlwS6
X-Gm-Gg: AYBFou32FUkYKFLMKvfMcUS8LobOxm+ffGbzTE6Wavd2koiJXfMsSJAyw/OBsIr+RWp
	0Tzgvfn+sImFPhJgVJknHzwrWqYpBMEa5SvunVWX7ApvxKGgRaYnvXnNHn7xlpgk4SO6mPf+EaG
	2wc9mtRsjT89YdZi4se8Uk9XFy3N8uPx86iMpwUgDkEx7WTtmWwsY4YWrrwDtI+1zu1xu5uHpmT
	4pHwkOSn6WW6TkuoyqxmHDs1lIGHJE3fEieQyDFm3zflKa3imBEHLP5l6K9uK0sK9vjmk9YNmix
	BTlFf3hpmGpOiHYlvJwkoLjO2E7AN0eJJjeP1W3Z0cO6XrAsrBFQHFp0dAPWIjajk9l+El8ndSv
	+UPbLJl/nrHjUT6BZoycghwCn4Zzhn+gNX5LEtf8RWr+76Nv8nl9nD4A2tQUbOQ==
X-Received: by 2002:a05:6102:c09:b0:7d2:7c8b:3d8 with SMTP id ada2fe7eead31-7d2a16e4764mr925009137.36.1793950667926;
        Thu, 05 Nov 2026 23:37:47 -0800 (PST)
X-Received: by 2002:a05:6102:c09:b0:7d2:7c8b:3d8 with SMTP id ada2fe7eead31-7d2a16e4764mr925004137.36.1793950667464;
        Thu, 05 Nov 2026 23:37:47 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d84726basm2155324f8f.57.2026.11.05.23.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:37:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: eliza: Use GIC_SPI macro for interrupt-map
Date: Fri,  6 Nov 2026 08:37:43 +0100
Message-ID: <20261106073742.99552-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2003; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=vGSbtJOHPFOx04pTR/hXiaYZy2s4Vo3dK7FLfdtdByM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq7YPG1leJxhCjOcL60LaENzMRXglqS58e7X6H5
 S6SXsgTb+mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCau2DxgAKCRDBN2bmhouD
 1ysBEACMKwXl2Jjl/OihJ+/SF7ONb1yHYvXj0qJ6IZeQSdpL9NOUNdqMQwosR5eboVUH8KLb6E+
 oUtktzahxXUSsWJw1vdtvSXZMKu9gKV8tykPPlxUYNIfG+Zl9gaYRy3BMhgjSjKvLj80GI+9TUD
 /GfeMfFELUnay0F27WpOOBjua3FZEvAV/2t3twVy9tCbIKpDkWGvMSTAzKBjoMvvn+jjWTA0rnE
 WlhHGiOpKZgLZ0rjpFn5uR7q8L9eiAkDgHUHYhyxQqAYAFPh0WS3nian6ShEB3nHLafulpBs27X
 LkCurfbfqhFKADiekIZeFbxK+evrBEPZPLQH38GcS5NzyLfbjeqn9yALHnJBcn+OMWkXHheVyJ/
 s66B1BtNFOJ821DdSdOHd1Igeb7dyrThBB6x26B6gPZGqjK80oU7rYD4bpC+ZjRNLeJhUGOA8VH
 /SfN89Zqss4fR/UKBOZa9hN1oFeYu5uS2Tt4IUkCsbFTPFYdY4vYQKk7s1xki0txzDJ++JnAmWc
 MwhVJ9WSsFKKCf+pUdp/49pm6xZjEk3yrbdcIao3rNL61F9+6jQRPbLqWoqYWFAt9ei/Odsj65E
 A4sD11p14EcaKe35bI24czFRBswEts9H1m50L+3wThJsRjmmynX84bSCVJTHjlUujAq6OS1AKmy oZqv8iCe6zC0cMA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMCBTYWx0ZWRfX+JyMnhvkbK/d
 bGHZv1sUPA//KAhJO2bcRkwYn2hkYNcj6T9eCJHncjEQwQej+Yv20Udl71PW0Fu9/zL+rpnKJkK
 1enL1p30y6NYr6hdSuFdKJpiRV/7ROG5SYhkCcYy6OPdoMzP5t8gHsM+32VTNEiorV6sH6uTT6w
 OJcIGPBM2Amcx5SIreLykaIDmSpGBiU0OOyjnBCKroos4d6X0gBxiyxlDbSYJqM4/WdpVqNHuVR
 USjV/KRMBd7+jkltFld4PMYA6RBsqVHFCYrTVLr7VRu+Bil065PoatLLFN0l7OMwJCIat558xnu
 cnEPRKA1ooOFaalBFzT0pvQdAN8cP9oLig1TTjSZImK+qzBrSKUieUn9HHxEJazej1lj/JuGzwD
 e/AJNl9gnER7hDCTPYzSG6fkkBxwKlz6PTK51kYqs+Vo+i4lOs/y0nM1iULmm2sZoN7UTw8IMYd
 xuTrleqB+ut6dfEB+/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMCBTYWx0ZWRfX6ha6J08VCBEm
 sXuDQSB00maizIU8LMWMiPTLASsA0dRLeb1+0Y0psM41Npqm9gjGGOJ2j55DMuHRiuTFBilCA07
 iaLBoPwIMn/fmbxfcQXWRdqoxhH/QI0=
X-Proofpoint-GUID: 6RaVepD2CKeztBVOAKipTwWP-nBhyHaO
X-Authority-Analysis: v=2.4 cv=P4ivFSAu c=1 sm=1 tr=0 ts=6aed83cc cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=7azGx4adrwFQZ_FdwBYA:9 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: 6RaVepD2CKeztBVOAKipTwWP-nBhyHaO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060030

Make the complicated interrupt-map property (with multiple '0' entries)
a bit more readable by using known define for GIC_SPI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index a8042291bd07..2997af2f3c70 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -1915,10 +1915,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			iommu-map = <0x0 &apps_smmu 0x1480 0x0 0x1>,
 				    <0x100 &apps_smmu 0x1481 0x0 0x1>;
 
-			interrupt-map = <0 0 0 1 &intc 0 0 0 564 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 0 565 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 0 566 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 0 567 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 564 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 GIC_SPI 565 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 GIC_SPI 566 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 GIC_SPI 567 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
 			#interrupt-cells = <1>;
 
@@ -2085,10 +2085,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			iommu-map = <0x0 &apps_smmu 0x1400 0x0 0x1>,
 				    <0x100 &apps_smmu 0x1401 0x0 0x1>;
 
-			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
 			#interrupt-cells = <1>;
 
-- 
2.53.0

