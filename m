Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BD741DEE0
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167281; cv=none; b=oUuviaCUY9tRlq7vynG6W6VbzZgRbAZ51NDLSJJlmakFZ1EO00ZOEzEwKElm0BAw5N4XNh+cfpNVOn/qxLeXZ3HrOgTudGnzYDhUz1HNEgL1JCKiY6JhEnpnS0ZnwThhQlQxfiqY/EdDUVE2sWkHV3SwQBWLYZzZ57f6wXcN6hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167281; c=relaxed/simple;
	bh=eTYd8XwPxxSKwBuex4X58kDcIqp8iWeFNrSeq0/GvEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e5JqVLtjnWmVwPlC5gP5rXFbQYio/x9fHaPtKR9KhlGyETiGh/YWNcSXEtnnYf3VoKHYkNJZ5aCK/BPWGmrVdskATrnIFGMiPfGh9Ny/EuLp/0CxCOk9cIlbGNHz7mCjdT1OgMSqLY1P/auXlu12arViz3JYiR82w2/QxMCNTVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D4BRkzLz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KKNOheQ9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D4BRkzLz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KKNOheQ9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlaau3905404
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mW4g07X1dPH7YwtsE5Onn57eNE0T0Z3+nYnkujzokns=; b=D4BRkzLzPIFNLrEf
	FS9EZuXTYUTrqXHp1PsuJfrSrNOwdUIhre/06FLcLIS1OOTyggbPqvLLdM+rtjsf
	wXcmQZfnhvn/FgtNVm9EAMMg9k6VkpuBXHWeDfs5ch985Ja8dgrdpvUE4SrK3NBp
	lRkFcDHKRUq6bMx6vDVHpksuMpFc8ByZ1EB85SPRNqvftb18Y0h0QNgih9JW6lW7
	cEemjuNm3FgAmiK/m0negEAHrmjy5j+N/kr7S8oflRyl6xsHj+tWHfk+T56bBbWf
	maWth8Q/HTkwXyZxTRycGWEUR6QgPt9AiQeq7Lq5tXVvkZFSnr7BzhG4XNTgSZei
	if60vg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4uksfjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:47:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso38296185ad.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785167277; x=1785772077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mW4g07X1dPH7YwtsE5Onn57eNE0T0Z3+nYnkujzokns=;
        b=KKNOheQ968pzV/fzL7eAiMriyLNI0vZql4UoH4KyhlguLfiRDJHFq3R0PoNxbecSzo
         TeGzzgeOkEM5Aw1818SaTVo/qlaMInB3+TK24fikK2Ee48SwRCJbt8JarAiHTMSdmjJy
         bLtJmPBb+OIFh775qV/M+bH0BDviWWPLCdNLeaIgmdleY0txwEKwnhTwaUNx3pBwDvOY
         RrL7+BQjnWyV7XtcyVeHYgLLQniOg4BD89E7d/5QGpN7zjmqcxfMjZJHinBlaKy2mvic
         R3jj2pWmtHsNImW0eK0hj+FiEzq/UBjWyEpWhJ3oal4jxImdhh7P2XL3dpIcnqGaoC74
         KmjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785167277; x=1785772077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mW4g07X1dPH7YwtsE5Onn57eNE0T0Z3+nYnkujzokns=;
        b=Z01sW/L6loaqkPDni7PY3tb+rzoLk74JL75UPKvYbOYr06ifqtZr1gd3k+2hZv4O2N
         ui/ckUVghBnSq9ebwD3Bb2cMp5r4dKwVtfMeQyiB7e0BUuHKoLSGbSOMMFirvsa71all
         ly9EDALTgOVtg+LYZYY/uT2IQ8trBIGe6JgiAGcrWbTo+UE6FnfwHfsG0cqQfSTeT8Ex
         RtJoxx07vQldiSkbdIBIMnRDG8g8MdAEVESwJAIPS6ib54/SAj//FLiRJSP2MCZL9dkm
         O2Ik4n1UTcDMRnNU65dF127c4O4ahVCCP3j3QtJ7DqDUzU5s0XCbJQCA47Z/jG29ngJm
         F9vw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/vVn89No5Kfe54tYCAkvtX+hqyK8/2kYRDh+G2t9ouwcsRxz40HeKDUhQcFyYt35PpnFbm8vKSLv+@vger.kernel.org
X-Gm-Message-State: AOJu0Yys2StSK7VM8fCInW1MafkTZKgzHhXmR9O9Yo/jDA+bHomLIMEI
	URazj8ESk1e1woCOPwnJ61/d8FAxHMC1SfNVU7jqueDgGQldu4HN3H3bEH/EdCjWagYqQwBqWS9
	5odS3gfwHT6OAa1JG7GA3NUUiV+uEiDw/D2ptlv4JY/fK/g9w41w5AtyVei4Fq0dW
X-Gm-Gg: AR+sD13Jw1Jre4cqt+SA3qib8Sn+mFAvHNiqHyqobTesA5htHGl1WTN5k8L3xFyicrH
	jLdbHNBQ1N0es9V4Ild9kyDC11yvRNcHdhnE+CYJ8bRDZDlGa9j/Zd5Usc9fHop/+i4I4DTf9mH
	2FJ/hGVxsiDKtJ8hy+VATjIw7RD6E75CW+Ha31Yl0UMMs99FDcWoFdF9SY2pkJFfMk1X1C3JFNg
	VyJnydUqStUC80+FkrT0Z1xkEi63sQ1dtAs9HKW9uW3rCEJR6Kco8hzIJYZt71pPgpdgvKvkaL/
	qSXL/Q/5hblHFyVCFdF8a9iab6vnU1Z9K/aO4xXnvTzqQJjoeU6WH/CZ5oz/FS4P8gM/ire946/
	QE3epf/6EAWG7kpyPsmTK4TgTvdESEfFXyr6UozFm0rhuGE4mFIoVfSUA3xlAJ7m7HlIUXzhWdo
	YiWCWk+cge2YUNh5mrVDFntsdysTHvyxLAVsc=
X-Received: by 2002:a17:902:ce0b:b0:2c7:f2c6:89e0 with SMTP id d9443c01a7336-2d008937d84mr11416785ad.4.1785167276956;
        Mon, 27 Jul 2026 08:47:56 -0700 (PDT)
X-Received: by 2002:a17:902:ce0b:b0:2c7:f2c6:89e0 with SMTP id d9443c01a7336-2d008937d84mr11416555ad.4.1785167276565;
        Mon, 27 Jul 2026 08:47:56 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc4164ddsm32845204eec.9.2026.07.27.08.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:47:56 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 21:17:37 +0530
Subject: [PATCH v11 3/3] arm64: dts: qcom: ipq5424: add support to get
 watchdog bootstatus from IMEM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-wdt_reset_reason-v11-3-eeedb22beefe@oss.qualcomm.com>
References: <20260727-wdt_reset_reason-v11-0-eeedb22beefe@oss.qualcomm.com>
In-Reply-To: <20260727-wdt_reset_reason-v11-0-eeedb22beefe@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: p0QwTxh2Kk9hlwT7BLzmtNGjZ_LNWB_U
X-Proofpoint-ORIG-GUID: p0QwTxh2Kk9hlwT7BLzmtNGjZ_LNWB_U
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0OCBTYWx0ZWRfXzu5t0jlrsU1A
 VeEi4qX6MrATAJspNPSd4Ouk3o0tgI5l3xOe5pAumrMn7BVTnfjDq4oxgZn2e4hxY52bB8r00NX
 wS+OnR5ffVwYqVfNAiHwpnERmk3OxEk=
X-Authority-Analysis: v=2.4 cv=PeHPQChd c=1 sm=1 tr=0 ts=6a677dae cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0OCBTYWx0ZWRfX2dKYy6EunbOK
 DAS1C8At/T3SVy28uQSuJYGcuh1xNQKdgkxHHnQsE3e8l5uUC605bjxoKGUi3mc/N1/H7K36+4Y
 zi5HIOAjriSID2xK9N/bdzFUEJtjV9Z+E9Pmk3zSwD34zeovWFWaRqzX+RKL3KlnRM7G7nnvSUo
 QAEX1ZNhu74gW5YbjiZ/6ISOH8GOULBi2fNuaJ4w0fxjDwgvNL9qGGLhRAebBMs4cKBzV1eJDdR
 hh0NgDOTMR4qcl/UA92vvEb7FJ3wK4xJbXDCfpRpAPd1y4pJdTvTsAqB51YuciO1yzQd7444nAY
 GHAadMlYAp0bWR+cW2v+Q1pW4SaD+gh/bfARn+kHMNqaC01z7UH0oJT3q7eMZhToLbLxlVPvCEV
 tg68ZRonMBUcbYAPuQf7hFBzK32d+aVShuup478Ed9tLNlEMv66W8BCrtr3nvrSVnLO8P7fRlv3
 hFWRtzMcrU70Hc8SACQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270148

Add the "sram" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index ed61db0749f8..23f851e9241f 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -624,6 +624,7 @@ watchdog@f410000 {
 			reg = <0 0x0f410000 0 0x1000>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
+			sram = <&restart_reason>;
 		};
 
 		qusb_phy_1: phy@71000 {
@@ -739,6 +740,10 @@ sram@8600000 {
 
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			restart_reason: restartreason-sram@7b0 {
+				reg = <0x7b0 0x4>;
+			};
 		};
 
 		usb3: usb3@8af8800 {

-- 
2.34.1

