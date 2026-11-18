Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007364;
	b=qoJpot/aj6t8B64pYN5dsSKgFof7GiZXynF+e1iXR6D6VYuf34hXuM47i9y/PV6cyabm
	 DO3m6/S2z4raQjcGyc0Gtkg8FU1hCRS82mvM87+cMWvc8QGwuuMa518FEvIQ23hgv3XiP
	 CdrNIN2ZV8PlEiSFKE4GJh5jE/2YRY9lnURAz65toSGxJ/eJWKMgiQ9aMXLbk6B2yJVvO
	 hPet5Q+fL8DNA/Z9nQSlJexCOv9rBVCzqjeWiDTgefppVRiThu1oiVTk3KI2g8e1PufS+
	 QYoiqBAOy10TEdn+fgus1duwZwjQx8hCsHvg10pnKboLaoBnJGeyFIXCq44ggm+SLmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007364;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=50tJpTY0/NQyUgPm5jhQ+vnZd/4bBfqxV08nQXImnYQ=;
	b=F4qBXr+G0AOk13/qQVfSNXjUgqdY6FB6WbbuAJglr5u5tZKqboxi2ZVoc5AIQM7PeV6c
	 wuJ6yRV6o8kq5zV/IXzlhvzm4l8dq/Jpg0gcp2+ShfMaSEuiwDi4XbJo/nmQ0MLfWclMU
	 ZJOVlQHyTV7azq6hINbSoiyn6DVf763lQzOJassPA6CqQw74MkbexWtdWKRz+5Psb0ubL
	 yYDhALEbc0YRLpZ8nDyIIXktAel21MroHIuVd5MzsnCwcFoePx+K4EK99nbwniZLYfDvC
	 kzw+IzXVcR8DFtkz6hW991NKuzRcsNdz6bqwo9ApwY4PCe6GZhIVZOcPH3fVO/cgiyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g4Mm2InU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e1HaQ1B8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42597606A333
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 13:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42597606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g4Mm2InU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e1HaQ1B8
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AICLBkw3769861
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 13:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	50tJpTY0/NQyUgPm5jhQ+vnZd/4bBfqxV08nQXImnYQ=; b=g4Mm2InUlKtWel8W
	AxFk2UYEeAs/Y4adM6uBs6VVrikELWv71NK6QSY0xFKeC4/Uyp0UdKT7bIwkbxiq
	6wXUN6KAsdXLKSFORbje5RI171Uz20MFjy5lebVO2Ye68nboGkj7gHu6JJtP634N
	mVYjKJWldUuMZyf6Y0/yzE5EHwkSt0e9RJQ5nSF8WP9nl6CeSFuNl9ECACDNwsyC
	l2M5X0xl5NXxOkwKEE4xCo7Mvr0rJwGD4o9KI1MNoZc6VEw7izz3icrIHG2NEbHa
	hOOuJlNvl/66byJtoU2aCgIqEmFzdkUzB5jR5doXwFSNBwfYIrWM2kQneRumz1j7
	KxYrdA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9b3c8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 13:09:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b141294006so198104a91.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795007362; x=1795612162; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=50tJpTY0/NQyUgPm5jhQ+vnZd/4bBfqxV08nQXImnYQ=;
        b=e1HaQ1B8zb8FcwrG1HrCmgy9Wfgu0Trre8GIzBO1Pd8ptm8Em/6ng6vy4nkd3G/hxl
         LMgLecX3Et6Q76E1cbfQisAfzBf/Fl6ZFw7Wfe/YEH4LPlIw6t8zW9L8YdTN2pogbqLL
         ZJ2V5HmUkbVkHYuxEbz4JfZUkMcTQ+mWQyojuqHh+/CIr08tzaMZWaAnKjAP/FryQzAp
         GcuCJPWwEJgxFF9GowQe/1OTtuXCJMWmCh0Zs+akgIuivnFBKTGfsobCcNOHWzw1aOQY
         K2ypYwZKHcd+xxpmfAqIaUAsY++jlaXRQNc6ZL+wi9Ede3dvlYkHqxjfJ9ex258ktSEu
         mx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795007362; x=1795612162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=50tJpTY0/NQyUgPm5jhQ+vnZd/4bBfqxV08nQXImnYQ=;
        b=V86+3LcJaGJ/MGCBewXkDpZFcVy5DsbCHRKUKxV2GDGSMYH4v3L6o74UTstPMmv4zV
         j4YFa5e8Ht9dlOKq2PHIrThrqm0VtbUeVifTljOcTzahCs7bBcPN2H3LdUvUEplDcymw
         Wn7Tez4rl+DGiRhc694PSeDao2ooFzA+E3+jLV4Jl7GUr3WPuctkkmFw3Znp6ZZjmlV9
         hCnQuSOmGp8T25jg7Vbv+gfTR12ZBmHs7ACZtyF7v4Y9qun0NJud5CCP8eGsUJRSou0V
         UB7mGrTP8jH7g9FXoTJrwACRT+tRHL81Oacvdf1eM76yLmgwFwXPKPkN3ly8XLjGhRo3
         qxZQ==
X-Forwarded-Encrypted: i=1; AL+hErFmxkW7LTpnwvLrYPaU0NIoRb6rjOOUn3A3gYqtsCy8oA06xOsshsPnNLgReshe2OakZM67xsuEINXM@vger.kernel.org
X-Gm-Message-State: APuU4Z8R6JusXWPlB+5isMS7/i/c3wYgO6k4uRzVs5VNFr2s7YtOq+el
	9QVZ4NkNVoXDuMoEy0Y0RDp+F4IZj7KOPywOaWC3d6ufpQM3EJ3yiZSgmnEeLEoJTA/zYUM16Mr
	04Qe6JLkis5lgl9QMqg9/k4L3shs9+wrCl2uGpSolTeTcNNRyUNIxaLZWEDG/WWqP
X-Gm-Gg: AZFdTZfwvwv83v+7mh8uJBscxQO08wSOD+NxK1NYH1XFskOXRocTkkyHGMvuJ6hFjW8
	VVf9AiI/6mBTRZV0F6qTZi88kkrD7xzAz4cnwXfc9bcqzGw5K1BKxC6owdcvMCbsDZUiTSyB/8I
	u8Focu8Isk+N9+7KKDp02gaVrmfzUOQOD21haNcghxKbUqQtTqk9mFicIbLeRMbLBgMyQZBN9Pf
	ZcBqMywQ8hqNDP2lo2437i/cMhUoSrTHmblUJNHxz1SfE32OOZqpRpXdORU10TyU+dvysSPAlTz
	dslZyI9DtviKADJhxVg578Pp9/J5StIikWgOxNN/+g0rAFAVLV/acpJ7IYwuHlMUsoAAqoTF4A2
	aPibQB+OdM8WuG9KscWjNyPrYx/dv85A8UlnQOKah0ZTnSJWkjxLClc6e2c8al2FoirNa7EIvDO
	Lw8YHeyEkA
X-Received: by 2002:a17:90a:e7ca:b0:3b3:ab75:c947 with SMTP id 98e67ed59e1d1-3b3d06a489fmr4456546a91.1.1795007361486;
        Wed, 18 Nov 2026 05:09:21 -0800 (PST)
X-Received: by 2002:a17:90a:e7ca:b0:3b3:ab75:c947 with SMTP id 98e67ed59e1d1-3b3d06a489fmr4456486a91.1.1795007360842;
        Wed, 18 Nov 2026 05:09:20 -0800 (PST)
Received: from hu-pvgtejas-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d187dc82sm4909533a91.6.2026.11.18.05.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:09:20 -0800 (PST)
From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 18:38:30 +0530
Subject: [PATCH 6/6] arm64: dts: qcom: shikra: Describe the GPU CX SMMU
 aperture
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
Message-Id: <20261118-adreno-scm-fallback-v1-6-e99cdbf3121d@oss.qualcomm.com>
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
In-Reply-To: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795007310; l=958;
 i=puranam.tejaswi@oss.qualcomm.com; s=20261118; h=from:subject:message-id;
 bh=OrV/5vTYv13MHRURk6HQcE68oIHzOJUujrYoLsrCZl0=;
 b=E02f0xCUQ0B2N8YwWTg2OQt6tBwet88oCSzgp/qF8U6IEa/zGvNPhvlA1LLu0l2TD5KGmW876
 bGya8WcAb/nCcfpQ0ad2361m10ugHZ3zS27WF3pmhb2SD5rO+ux7ch2
X-Developer-Key: i=puranam.tejaswi@oss.qualcomm.com; a=ed25519;
 pk=I7kFxZ7dcroo7ZWUatk8fR/J/KVbRzZq4ZBLhRRGpJo=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1MiBTYWx0ZWRfX4gwwj/WcOT6h
 oGaTqbqlFiOFyR4fnrCcM/MkTwGOLFcQ7MIcAWK8VYohGZuk8X6mnc6lXo4/ITdgbtspYnHUrcn
 Bh7+iyUcXb2pV76hVOCqdMBIQ7Zb/hM=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afda383 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=KBsJZNVkQGKO3p3TXRAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1MiBTYWx0ZWRfX3TeykSX1NeNe
 U6el2uzoq5+0QjLb9jwitP26Gc8BnP35Nx/qFRfGJsFMUVFtLnTRlkdVgwaSTHvMr3zuedB8k4S
 LfzD6QnDy7jNDpOqyuiILOby8o9b4N7UzTkfqNuHFmD78dc8ZT8QbTwdyZtrWE21tPQWK0kWE9H
 RBTEev+i3O9nT2SYlvRCtJJoPObp1UHs1zLzjG5Wt49QLNQkQaJYTS5qN/fR6ys/+wLe1yT1sOL
 xP9Ze7mhJ9b91U3HvHPNdNCFFGDUktYQDpyrQfuWylwNFCmrxzd0IEZtceHMLAQXOXuhS+TxoTB
 T0HbypKH1u2srQSmUw7OLs4X2armVQchcTBKOHK3nGHpTXEtFXB1Wqu6divLJs0O3nqkDfzcngc
 xRLuLmbBeMQAfSuQyxQ1BFT/NtEaMUoJfVOoOeCoKXWhDc2NwAv9957qUtKAkRhKkGXC7UPHryY
 8Ch5JarGKE1TbtdK11w==
X-Proofpoint-ORIG-GUID: CLxWnrJxTG9W902RccF3VfSFIKLOkXi0
X-Proofpoint-GUID: CLxWnrJxTG9W902RccF3VfSFIKLOkXi0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180052

Add the CX SMMU aperture register region to the GPU node.

Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 0a95ad5a5582..ebbe5e23d173 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2647,10 +2647,12 @@ gpu: gpu@5900000 {
 			compatible = "qcom,adreno-07000400", "qcom,adreno";
 			reg = <0x0 0x05900000 0x0 0x40000>,
 			      <0x0 0x0599e000 0x0 0x1000>,
-			      <0x0 0x05961000 0x0 0x800>;
+			      <0x0 0x05961000 0x0 0x800>,
+			      <0x0 0x05960000 0x0 0x1000>;
 			reg-names = "kgsl_3d0_reg_memory",
 				    "cx_mem",
-				    "cx_dbgc";
+				    "cx_dbgc",
+				    "aperture";
 
 			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>;
 

-- 
2.34.1

