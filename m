Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F94369981
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778648613; cv=none; b=oDRgCogQn/y8w71YMNBjZiWB0ezxhSdQW1WtkHAwdgXPcqn7NqIzFRAc66fs3JJd0IAVZt8yhotNYQleYkPL9OEbl31MYN7daWn+QrI5enO+WMjVhyoh9/n3mvsmoay4Lsd64Z+k14X0JkVDv9YaYt6o522b/gJXjaes1b5eAuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778648613; c=relaxed/simple;
	bh=3lC+Q2YdjsOXX5+9uW8gJQqb9emhqitcuvaZ3JD1ssc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kYCHhjoKwQ1/DSSv03qdvZMV0mCaYyn+GWY1JAxvlR1OS+4tsSFyg3egAl1ufy6e16mvdV5YRXxPTwmW/eRyUxsH9qnGiFLaPAXR4TCkxbeZQPEysHow673Ljy7Twr+emNaLuBSZO+fjHnUcebAXgDpst5qM++MqAci6HzZEl8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oMO7Ttx7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MrHyEboW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oMO7Ttx7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MrHyEboW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4p7WF2712299
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HZ57bXCmO72JMJBA0SYIpdTazDsrz1d8H3qg0XEecXs=; b=oMO7Ttx7knOu9+3Q
	mDd1r1y13D0sUZ2K/ZOXXCPcfjZKWu/UztDHW9cbPQJm15eSij/D3gFGRxsp9Q2E
	XHWd3n3Yhp++qbejjFE/wzmU/g1ORg9X4Y1a/Y3TFGubnrKzrbVNR1VCyTKjV1Tx
	7+z3FcLCL0QWh/CIjQRKRAb1gTivqfFBIV/S40ltfVnWyEobFqVBd977G1qNSiA3
	PhFv82nUay5RPukgWnTUI6Zglhdl7HVINdvkHqcLLyVWhFXNn0UUJLF0HIlBEu+p
	/w4dBnLtvamJl0WQC6WUzNC09NNVeTjHWzyI4AOnX979m6c3ZaLk7DmqruxhT1zT
	MbwnNA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e444su8qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:03:31 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f9429f49cso8009968b3a.3
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 22:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778648611; x=1779253411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZ57bXCmO72JMJBA0SYIpdTazDsrz1d8H3qg0XEecXs=;
        b=MrHyEboWuM8LBSNikQaHfWID3tC7sXVzaGRp7nZ1t0fZ5YzIeAvSi5KIRMI+pnd38K
         tsiP5dL1IHw5GppazBrqOvwWokty23V2lT7PkHWbU9XRB0cVFjyXAUoeIAZQaNoIqmYU
         oo8tRtww5W5V7kMrWIU/nU+4EVh+G2Ij4fh6kc4xj9YxMn44jgMbl/7TKZNAsw2dL5i8
         HxiOJ8+ZZfog3j7JVC951WmSV+Ymt173Ing7m8mv0lQvW42yzDdoq40t3sm2FmDHDwF0
         HYjo9WiHR78tBLmJFJYcCuahu9N337Gl0Ymk5bWEKhvebxdC8DJ2dsRSUorp2Yy7PHjY
         HXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778648611; x=1779253411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HZ57bXCmO72JMJBA0SYIpdTazDsrz1d8H3qg0XEecXs=;
        b=TJsuwgxGiJ8sKhN01vLlJYJAIcNPktc1mvy7OTPLSfUhad0hl0pap3Ov/9CMnMnYrF
         +iR6hkiZb4k+lJba7QmIfT8zf8zeHzindKij9c+6RIXi1rpMfMQZ38aE5orkW1Dw9Wwp
         b7FMrymR2PkYQHd4gEdxxo0gZcGKC7I72KCDkFK/ZwAHPg8E593orGsonzrQC5KFFsI7
         OcBnccpXIz1rLOfw+p8VR92UVV7yeyV/0BXgsIEDQqjNo8EHQPmSl4s/yUfu6h+SfeJA
         51nqnfMB936YbNz6bIyTGXC/zVbGCeZjBKkpiNgDs2pjLkWKiSQ92d8iplunuaW/D9Xf
         AAwQ==
X-Forwarded-Encrypted: i=1; AFNElJ9yrhxlO+4uWSnjCuSatdFlgPfVtyfxWjPOuWt0CJMi/0MojuaZ+4GOB9YpuE4WAzyRqely5Sqb761/@vger.kernel.org
X-Gm-Message-State: AOJu0YxN7CBIHX+XubBb78xJUpJsmRWO43q6CZYrJqjb3kp86tIFDIgr
	QBisY2AuomNRJnpfan3f61GT65I6sd7GXX2mFlM+3+pwCl7hdG/V5T050NxPfT9Fbe4fa1oA57+
	1Y9VrDagxJRwIShDz5ABiiLh/jCdLzvzexW22PcyxNqt7RY10Eh9rWDzSXeUVDTconTF1NgLr
X-Gm-Gg: Acq92OFM809A5mAMt+viJsfHiNqvPRbM8CFY+B9a0izOweZWJiW+ZLG+QXibgfmFpb8
	Q9D4tZy1GkGdMf3y9OZyAWgSESYPAjhWjRw7qIYMgbsc6ZNlOVyS+8uMB2Kc/dVdgZO8CIIvBiI
	tllgCfHxba+pZUN77jRfwBfG/IiVfrC023FGMucnN0bfoau1BqE5rfEKxDDPDJHDNhXM/6AW1qb
	TatHIsY0K05f8lthr5RvpfvsUunFAJ6FghznNuOeTozkSO4YvVfPJ79/KHHbCm67XRqatpTtpoA
	zmjG7Yv5mWwZNaVqervbPB3CgvdN7hxTYkX0z6q+oZzrzs6w6DpBWV9S4n5a4XT9ARFabq08QmH
	71NEC+/rmLhhpVibgFacCzTcQgGZKaldjf8RNzeziFgCRFPN1RxCjw4Kw/ozeOfv+DKLAogBuXS
	42QGScfpBTiJULT07BiUjRlB5KD0ZUex839Uu2wMJM4HOxt7WVDJrNfb9W
X-Received: by 2002:a05:6a00:e1a:b0:838:1c02:276c with SMTP id d2e1a72fcca58-83f042bdc4fmr1647583b3a.40.1778648610741;
        Tue, 12 May 2026 22:03:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:e1a:b0:838:1c02:276c with SMTP id d2e1a72fcca58-83f042bdc4fmr1647547b3a.40.1778648610315;
        Tue, 12 May 2026 22:03:30 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965945c1bsm26328020b3a.15.2026.05.12.22.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:03:29 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 13 May 2026 10:30:31 +0530
Subject: [PATCH v10 2/3] arm64: dts: qcom: ipq5424: Add the IMEM node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-wdt_reset_reason-v10-2-cebda08ab1ef@oss.qualcomm.com>
References: <20260513-wdt_reset_reason-v10-0-cebda08ab1ef@oss.qualcomm.com>
In-Reply-To: <20260513-wdt_reset_reason-v10-0-cebda08ab1ef@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778648598; l=1267;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=3lC+Q2YdjsOXX5+9uW8gJQqb9emhqitcuvaZ3JD1ssc=;
 b=vKtwguCDmffqpyv+/5ymxzBtz6LjOxUxcPCXuZOqRmCVi5V+z7VEesewNixuSzLv1HL4J5UTb
 hni2lSRT7p5CSjUuZ/EIIcDuu2k/Cw48URcgcnWkPzyoWnVNVBMekcR
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: 1kpu9YwCtpPXf7rtYrR5_jWP0Z60mk6q
X-Authority-Analysis: v=2.4 cv=OcKoyBTY c=1 sm=1 tr=0 ts=6a040623 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=QDJorwyCwNfNgOuVDpwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 1kpu9YwCtpPXf7rtYrR5_jWP0Z60mk6q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA0OCBTYWx0ZWRfX3bDJwzoQb/Jx
 7aPK5k/LEUvS/W2wmwRsiP9+KXV/xPpzZvd2H4O4C2qTfpkXFyeBAh6kpcZAKvqru1MBx8ozurd
 q+7OrkaEBqsdhR6SBmg8dig18EeTAqD2bd6nC1w20NTFcqhvl6G8evgpd7NIzoJ7bO5quN97xbs
 pZ0hQ5jQqNGh3aOmsqKBPod4nUYUQ2W1fFTWpY9ZgyJ2rOX8QVUR/kFf5V3xDtTkeRFzVPix6ye
 eZxWmwv/hTW/l8XovlOKzGNnBUDv76wZgmdTAK0U8DOhGYQVjKhh9LXXPD1xNH9kSAzl4FpMINC
 YcHk0vSomPf8pVE+R6lfKr565rEYDltu+zGb83h11wZPNHCV0HjeSKQpM5znRbSM6aOeWOxi1Xr
 djcXOOuMbeOcfzklSxBHyetHmIFpMAtLyvwdZgUkVKdppbR8LvnGESTQAydqhdAofrZP3b2nFOl
 qlPoc2kv9hb8YiVdFFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130048

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 112KB but only initial 4KB is
accessible by all masters in the SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 876bf6a8b8ff..9b8410e32629 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -730,6 +730,17 @@ ssphy_0: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5424-imem", "mmio-sram";
+			reg = <0 0x08600000 0 0x1c000>;
+			ranges = <0 0 0x08600000 0x1c000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb3: usb3@8af8800 {
 			compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
 			reg = <0 0x08af8800 0 0x400>;

-- 
2.34.1

