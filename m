Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793298859;
	b=avZLYD2b/UjEE7aRCmhVwK6ZpwOMtZ6rELDv1Cczlx8sP24lKp3gRPfOAVXHJMka/lrQ
	 u6LfX8NPqafxkq06R8G18ZrsJ9xa6G8U+QmwpvZEBs4Ag4lBvtDeo3dGquQYfDDK9UOuc
	 9xhC0IZ+q/FTXvWCEOMdUNwvBZ5HiFDN7vbHWVUutk3l3e8+eLrRHh61nlxuWhiyAniFH
	 9M4ytR3i1w24VsPPJyjMqbojz8YS68dncIaTqMp8QWoQcLkQRDy2bRkFX5xKyE6zCZLEI
	 WoLDqvcuA69FrNrmv2Loy33AXUBHL6pl/T3O6b8RSidsPJH47nqdS8UuN5H175fpFgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298859;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=I5/i1P6Q22/jVe3qh850qyOZHuGm5I20P8+ycPLEBiI=;
	b=HdVRrQigKp+v5vj/XqulZ42UMb07mLK4qf4/8MZgOVK46E0L4TfvvrBmjic2z8ceZ7zd
	 8pZJoPMSiN/d7PqrwaJit6DQ9H3Kgjqmt7P/MwMwX56CUuLcZ8MLeV0+H1Dt/qLjVcM6p
	 HxxpfnxAeDYVdNRPXHV7uS6WWgQrR1sOT4GphQBYZYUMBqheT326Syt28Pry3emdB5aYH
	 JfGyXsojRcvpqSI1n7ZFdUbiI3l1E1mhVODOOj3BT8KLaccHdtcydv/9sBkCpil31b4GG
	 OfyW5h2OiEgvIfmPHotwEANz6ni6KMDB5ogHGRwHylhm007nBUdfPCa86N8n192cJFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XMqT1kSg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="R/L3/0ul";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44CA606A331
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D44CA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XMqT1kSg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R/L3/0ul
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDXJZ3234253
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I5/i1P6Q22/jVe3qh850qyOZHuGm5I20P8+ycPLEBiI=; b=XMqT1kSg6empzHnV
	wf/ioey4N6yT8NoWHDxlKCSriNgmHFmZ6iwjrb+45ERs1GkOHcp8fu6Q9hNzJhcr
	YqCQHiofDc2a/u0IDl5pSarwNseXWp9M5pbrygexrdqtRWrwiW4ic7ZDpW1CscB9
	ek2Wam/QP8ia948TV/FUUVJP8itxIXzRzA5eu5VMwVa3hqn/QzKBGrOKAdjCvJRY
	o9kG86TRcLg3z6qiuLHbXY1BECEh9c9+AS4Xixe/4SSBGbwit8e+JpxlUonnUDLW
	sxSaKoS/mMIzGba/cILNt5bv3EkPwcmR6eRasmGjjbDQgKwsa/2O4eMHBPwJdGGT
	3+CZAA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm31b2hm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:34:18 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a1e2485fdso4976212eec.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 11:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793298858; x=1793903658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I5/i1P6Q22/jVe3qh850qyOZHuGm5I20P8+ycPLEBiI=;
        b=R/L3/0ulLq56Uy5iZ6rZPyOYAqnTXEy7mgoBmZRoakIxTXU/I4CnQJig405rK27AVE
         SbAWw/XVhI2ZjE/3zzwoWhxTxzhw+N3fR+wp9RqWfwNNCOuvL/1v6XL2YP5G3bJnwGW1
         Jm/PkyXB5j0/qYgrV3OHzmQRTl2zjZYQJN72MrYgG1cj5uxGJKQu17VEuNyCKz5nzdFm
         VzGOXVBqYtt9KPX7V7wlQZspz5abx0/aPzZpWzakjs8maA0rA+GcxHK9tNkZTF3B2/5M
         s7ihtl9xIqA8wdF7nupsLfZnJwggwchbrn3VmlzMFXK77C8UnRjgR9IVFHqtiJaqB6zg
         Bw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793298858; x=1793903658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I5/i1P6Q22/jVe3qh850qyOZHuGm5I20P8+ycPLEBiI=;
        b=GlyB747qlYGj2GhP306PAfkfSWORf/uz1V9QGD0NPCLwn/VLcbcdggVi6cedW0i73Q
         adylqdj0RbAeq869EY1Izlyh6nzRN1zDoOpORrwMJ/u+WN8cXpiYoB1UFhtnK37HQcan
         Z7k4bkjz9lbaBmzmljTz5mBm3NtzhuYKBWN28SvyYQj93nR292GHUldGdghRmEg5CBUK
         k4dxpZF0Ab9aT6W2Eb/R6L9WREwKhVMTn5P/xpmPjnJsTycSY4eMkjPJwE+ehgPyYV6+
         +MLftYOXOiUE64MCyVnI9hzZSI1RuwfBe66FVR10GzPcEDDEmfTXfDDHeYbLwqP2zHku
         4VXw==
X-Forwarded-Encrypted: i=1; AKwUvByk/1X4OiCew1yHsiTeIVfr70AcHU8qWsrCsgSNNRU4GcXj36ABnLeZXOnoaRTz40Q0dmQUlGRV8QRx@vger.kernel.org
X-Gm-Message-State: AFq9FYLJcLenKQf1wSd9mFAkC73FOnWiTko2sP9MwEOrJvUULH43W87k
	NnmGFtol1SLbTv5vS/MpwEjx5i1Jiq2cvI+xZ9ejPtYQFNcm+C38e+XL6h4suqqpq33h+50UoAw
	yXakkMQrDtio7ECF6S6kBSVRywtZeow5z6khIdYyJLzsBcdrHJgG3Iw37di18Z0Mf
X-Gm-Gg: AYBFou2aS4b4sfVkMmdqSRavkAxLmdn+CJwTO9SuX5n333W1aRu0LB5OwGimob3x7Ai
	t4BHVGPt/qOenVCsFvKY6FQlctpbD6+59zyZvkHXgY2Maoe2Gu9BAF2pxrlkZ8FrlN0lWWA5dI4
	DvRyOgP9c5LvUvi/WGlVsTL8wTT7yPMGkAkDKFgQvbxjNzoNCxr94Ud8Cx1UoSvl3NbtgtVLti1
	932eCfIa5/9ywDs/bDCG1/hLleC6mROW59fgC6G8EuP0MvbT8Y+u5Rg9a6QDzizeHObvHWuxKGH
	rRa827SeQ+UOWtDSdgpAbX/lqvPIrDi+7LJDxkrie2T/+EdmzQX5n6X9wJk854BRcWSeIKd9zg7
	1D/vpQO42MVEmb/hmkEr2KeBoOy2WwVgwi8zB8BX41k3LSLI0Hf2YP0BmEY+moTMEyzI9a87ZWi
	CUoAGdvWM07/aaMp8mw8zVwZ/ES/TF9EwmrHGJjzxM+Q==
X-Received: by 2002:a05:7300:ec97:b0:359:8492:20ff with SMTP id 5a478bee46e88-36a4240193fmr263445eec.12.1793298857377;
        Thu, 29 Oct 2026 11:34:17 -0700 (PDT)
X-Received: by 2002:a05:7300:ec97:b0:359:8492:20ff with SMTP id 5a478bee46e88-36a4240193fmr263391eec.12.1793298856670;
        Thu, 29 Oct 2026 11:34:16 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm389458eec.21.2026.10.29.11.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:34:16 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 00:03:43 +0530
Subject: [PATCH 6/6] arm64: dts: qcom: sm8350: Mark USB controllers as DMA
 coherent
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
Message-Id: <20261030-usb-dma-coherent-v1-6-3147b8f7aa64@oss.qualcomm.com>
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793298829; l=938;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=q6qHNfYBzgQKg615pfscwOCc6p9bX6lOaiAEZbMgff8=;
 b=3UzHcLpW5lvtt/3IVhmh7IyyhimC6iVExWR7sijLVfm1qZTkgC9jeduXsTg28qAuHkir3cbjB
 Hg5NYAgSC/0BZzWF77wLNK/lalkDWie+930a50ho1YCh/oYq9hwqCVq
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX7icNHdxtcB+f
 CRMWaIvGYLLoKqMemnooUfZrV9iF2fTLDvCQSrZnsBk6Cft/Nyl1aXYUyKRybGoJDOaBgcK2vZl
 1o6vzzG4s7Ldetq8L4z8tdrWfYeP4QI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX71/zG4s043T6
 mYMefUN0m0rEj8I/2wqoWHZHDI5BluldZWe2ayntDiHkiMtO+FHbLrCRnJo5A4ZPFuT4zRzj+nK
 jS7n1uTttQVDs/DZ0NhPs2pcjYjif5LrGKGVV8DfDrqdFt/xuuSWbkd99Cwce6UIUsXsTXdlxmt
 GcsN+iQS/wwAxel/Jfxp3DGrygZGAkoDEPdxB5dGf4n2wdhIaYNvCpd6y9mwJ/SemJ1Glmy3O19
 BQa99ZK66bZBiIrQDjzMv3c1+qMajcIMBRvATOK4Nhj+7jZTKO503f1emJ8HCRKqVviDxZNyFTY
 v9kq5CybD86pmB77UsKXFxY+7n/7OPxytfzh8HEMsnVbpbdWd6EaboQOGd9w8SezranCzftlWzT
 z9/imzZNGq5/p0p/Cw/jG600UCGZPRI23+FbK00MaMrYmyANGpdILqXnu1UzeeZy2MDY4xAj4Wp
 aX9Mj2QKgQvQ1APxL6g==
X-Authority-Analysis: v=2.4 cv=A8T5rKWG c=1 sm=1 tr=0 ts=6ae391aa cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=7BzVpCbw7KuSwccWv-wA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: tvF49DW31Dt6kECgI8KVo8s_x--Dt7cW
X-Proofpoint-ORIG-GUID: tvF49DW31Dt6kECgI8KVo8s_x--Dt7cW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290072

Both USB controllers on SM8350 are DMA coherent. Add property
indicating the same.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 55b32050ce9c..863874da94a8 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2669,6 +2669,7 @@ usb_1_dwc3: usb@a600000 {
 				snps,dis-u2-entry-quirk;
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
+				dma-coherent;
 
 				ports {
 					#address-cells = <1>;
@@ -2748,6 +2749,7 @@ usb_2_dwc3: usb@a800000 {
 				snps,dis-u2-entry-quirk;
 				phys = <&usb_2_hsphy>, <&usb_2_qmpphy>;
 				phy-names = "usb2-phy", "usb3-phy";
+				dma-coherent;
 			};
 		};
 

-- 
2.34.1

