Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165180;
	b=2zzYEb9sDRtNz02zhqrwFDmzZI05fTpnJ72glR8ITGXlYUOzeTW8YFYNssqKxJe+TCVw
	 WanTp4BJTqYKHjMRQvDPUNYoS/Z3z1OnO01fD2QRpkuz8A18AEorqsgstqqzoBU3Cq8rk
	 XA7Toh1rY74vpxfFlZXWqzaBek5P8zmV/8fTB+gh1TIUttFruN/f/InoD+DtOP+sqb8VM
	 7r8aK6Jh+C4ToxtT9SvPOaqGG+aRxuwpgMm9JRgypGwxP0pmu6sWCj2IlY9G/bDP8JeKH
	 RXciNxZ60qheJXwQRFi5sbkVR9AAvmMlgt0UO3PIRjQvmjyFZ+J1GfOosHOnYLbry2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165180;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9yC3cw49LDStsX4tcMB+rfbv7t6LPElYR1xcbvBtwNs=;
	b=BCd5N57y4+bUmrymjKGsEga+Yolbl/CptwcHM4cMm9gYyh3PPsLnvwWSJ5Cj0ujWfjqY
	 HDUd9b3rqA0e2vsAKCOC9cFUQP2Ixe2USBhghutVY/px+Nwja97BbBu3W0sNzMCxFeuoO
	 CifZwFbXG7jS4hiXbUUgsLxdNsghCQkeZDH57kYCz9wCkXuG79Niy/tCxQazmreFRnbRV
	 DYw0g88ZNkNWGMWrvO4DA9nVwyK9twzXVRJhci+OQt5QcSZfwWfV5ZXgJWf+TteWc2dZS
	 mPhdrO/f8l29PVOrSJrYzU2XLiCZKETFp96IduO7p5zUukWlwUt21GcafMukgZ79oDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BO0BDJHH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ElOsWj5E;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE49606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CE49606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BO0BDJHH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ElOsWj5E
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7ewVr605974
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9yC3cw49LDStsX4tcMB+rfbv7t6LPElYR1xcbvBtwNs=; b=BO0BDJHHVP5a4Q88
	f5AOBZso9jP0CqVvq/jzpZ4YXg1gZ80sQqxBQhuOxk38gzK23+d+6E/XnupWkV7S
	kXEGgN11mu5Kbew6nqnca+/Fnwkkp6h3s41P/Zpr+Esp+GMvwHGkFjI3Y0i568Yx
	Ds7MThrfrA7j0AsjNuATNThYtO7NRcZUKf8mDr1/2vHmZ+PvVnDLhyFRl/k2GELB
	U3uZTgB05BxXE3nR0EN/CKRYQijwjhScCwVATg1VRG6NyJVEi8xavWBMFN4e0d8Q
	mtYm8m/4Qe86Eyl6/H3ZM4SsdA8AdqLL6I/9bIE4kYo+1nnWOV/a8h/bwN8EcHBX
	dtf7WQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqrq7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:59:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-384c78aa0dbso836494eec.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795165170; x=1795769970; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9yC3cw49LDStsX4tcMB+rfbv7t6LPElYR1xcbvBtwNs=;
        b=ElOsWj5E9b0TS9gSBOn3D3+hcgB/GUZCjRBIuyrObE3uwE1pvQ9r1KDCi+Q1vQbBAv
         cuw3VEF9lL5wDqgSCGijg3r31M7+gAx4YJUkPwR+mOdUMsDaWU9hFW0wLARBodkCG73j
         ONRPpCL58WQBa45Y3w6Us5kpDvuRb+c1u86LoOybFddNRaQ/5ozY0ScrK1cQL4Kz0Lgc
         orGheWUZgR/j5Ahv950l/BIREqdRFqYOn6V/DB48PzHGBgVjsOhA8IH7+DvagFFUTi/U
         fhdB3aE2JEz/uUyoBvkgHACwhnhbua+vUb4cioh2gQqYjjENG+rFDLceFZMAivjlfOQT
         jlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795165170; x=1795769970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9yC3cw49LDStsX4tcMB+rfbv7t6LPElYR1xcbvBtwNs=;
        b=CyF90fKDdxnVzzHe0Vx2aFLmJmuJB2/bzcLyoVgvYv0KE/hdn+exlt82W7jj66N96B
         8vEtyQDRhbngrnoIpmkv5AQd7QCRFsrp72TUUtfBYpYT6LW+kvBaHFhWOiEwvn3ZyhZR
         GeROescsHcIhGRTjYsHcN+BYgPpcLbqO/+HPAKR0RsPCX+TqZNM1rsnEbhzzYEW2kMDl
         STQunHMMHTqRRs9PTwtLKoTyOn0qUCHKspQLCEUJfrMexkDYdJCzEpRQajNMf5WyPLoA
         6TfqgwGLaVnHiEU7BDEYFyrglLlp/Pp17ZPkXUMvWQwLxC4IvP8uvF0ezT38UK/8noVe
         WHdg==
X-Forwarded-Encrypted: i=1; AL+hErEIBYpUu5O9GLIq7z5xUknqnJkwmkrO7N4dWrJM4jNfJR368SLSDF7TKXqAH7bY3VDOCoVvBp13ZaEN@vger.kernel.org
X-Gm-Message-State: APuU4Z+b2GTG6RwBgWlyOOdd7GEeCyxLi+xFOIOah/+e4LnA69qmUTB9
	G8z75QtB9l6L/4qJCkV5r6w+sOSM0b02J+WQBJpVF0RiBQd9r7c7+SzqGoxtYreShzenI5LXpF9
	3UWjc5m5w+VJuJV53Z6sPbJJKrDDK5nunKJQu3Pncui/sBWf3U08h0FRT3L3wvT9+
X-Gm-Gg: AYBFou3imgdiBAsAcf/uAwab1jyswEkPECQJTKhc/0BQuA1sCY2iq1zhZp4XbFgCaFr
	QfeQQ1gsCC/KPMZNC2UGty7rkecMI9rQneEm9z4shfNI/gY4i1Kf93Z317S4CUZbwAQ0/7SP+xd
	V959xK1zXDJYiAA3mCz09aoA2/i7EtiZ5P+vfNEqK3IfqJ1aTgsqqkrfmnS+A/8bqyxBxuy9X8F
	gR451/lqottUNbK2CIvnutmmjc8BLawuUNY1HJC4rFW8byTe0zYD5PLoJy/xmwSBzRGpotR8l2H
	NSx2Xji5gCgz6moIkI6YbR3UlIZejWIIERz7/fSasT0/L7NAFagBBrbR1LFkmHm+EUpfP7a0MfZ
	cqpQ9sHnZPEXpbqQG9PePoDdgBw+hihgpJRDZiWPu0hY7xKntFSIcnPRWyT0wlGam6svfqahWEc
	x9t+5NlBvkN9csBgRwcTPBdR49Azen6wDChNWlgjLHURKyzj+6404iYa4ae47goPPrfgiLygUEr
	uBqntoc/qg=
X-Received: by 2002:a05:7023:b12:b0:141:5281:8a41 with SMTP id a92af1059eb24-1b55687fbc9mr2380947c88.9.1795165170206;
        Fri, 20 Nov 2026 00:59:30 -0800 (PST)
X-Received: by 2002:a05:7023:b12:b0:141:5281:8a41 with SMTP id a92af1059eb24-1b55687fbc9mr2380910c88.9.1795165169700;
        Fri, 20 Nov 2026 00:59:29 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm9490658c88.9.2026.11.20.00.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:59:29 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 14:29:06 +0530
Subject: [PATCH 1/4] arm64: dts: qcom: ipq9650: fix the TCSR mutex address
 range
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
Message-Id: <20261120-ipq9650_various_devices-v1-1-14f53b84c42c@oss.qualcomm.com>
References: <20261120-ipq9650_various_devices-v1-0-14f53b84c42c@oss.qualcomm.com>
In-Reply-To: <20261120-ipq9650_various_devices-v1-0-14f53b84c42c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNSBTYWx0ZWRfX+W2tQ+aaASM3
 02SdRe4/HX/S1/ZNGQ7+MrqPwCU6TsR63jwmGKt3FKkNmuTue/ib+zdzPAH9NxIzRX0h1vSDmJN
 b1DiTz0gN+82sElIaHEQ0VjwLhRmfsV7meGfiyLeZwoJ3HPpZRr86IRQaXtnDvuR8dA7uoQlG/7
 d1gMpHg3uMan9312jcLOgZnZ2mzr57CfWvpfdheZrIkS2o2xzLMYJA3YQn67tgGkwMhEoPSY9Xu
 LuYZSEAR2UwzOmlbTX2iItxPqXLRKKAM+5bLIq0vjBMvBpPdYWxprKIEZ+2ouCQQQbRiPLYNrPJ
 Rsfv0mUbiFxEP6jkte/PTmYoWBklhV84EntK9WEM8WyBrmqEbhrhfrTsUrTTMitihKzvS2v9R2g
 ScirO45GvPkBVzRFFgKlB5hcwqQ+Dic8opm88KoP4eEjQ4QLBz3+kfqaPDK9OzoA94kJLVysagq
 sUHgvKw2jT7bb7VKSZg==
X-Proofpoint-GUID: NdNodA6rk2zhA49kO2dURXDcX84Mli88
X-Proofpoint-ORIG-GUID: NdNodA6rk2zhA49kO2dURXDcX84Mli88
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNSBTYWx0ZWRfXzA8LsQxtfyyO
 8xO8p1Y2oZG0tRzB0lAa92t41ohon8Yx47Lj7bvC7THwurP7FjfMwVvN9xbTY2nz+BAZad4XNu1
 gz4Hbc8Nz8l6YWhZBYSLeNxZTrouv+w=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b000bf2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eUx0VPcQqj1qSSogbGIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200035

TCSR mutex region is 0x20000 but it is mistakenly mentioned as 0x57000.
Fix the same.

Cc: stable@vger.kernel.org
Fixes: 8cef25a0044d ("arm64: dts: qcom: add IPQ9650 SoC and rdp488 board support")
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9650.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9650.dtsi b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
index 9ace638e43e2..94269c9c8d6f 100644
--- a/arch/arm64/boot/dts/qcom/ipq9650.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
@@ -385,7 +385,7 @@ gcc: clock-controller@1800000 {
 
 		tcsr_mutex: hwlock@1917000 {
 			compatible = "qcom,tcsr-mutex";
-			reg = <0x0 0x01917000 0x0 0x57000>;
+			reg = <0x0 0x01917000 0x0 0x20000>;
 			#hwlock-cells = <1>;
 		};
 

-- 
2.34.1

