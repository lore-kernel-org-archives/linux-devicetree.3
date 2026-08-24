Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E883A413D62
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572603; cv=none; b=ao+vjbQotRWbaDMXnVA6OINBaSulGld5qk6qvGfRp1S4G1DrcbSrfQSPNRgKfXNrVprt9ph1kalODEoT1HRlZWouC2v0lbx+aN8nPR5p6R0+jl1A8yzcA80hTxJp3yRVF7lQiNutwVrGaBo2nC2Q6Y5e9oa47zNAQRFIeFTMHfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572603; c=relaxed/simple;
	bh=F80H9I0DjUCTxp9n76OgxJurzIJXm534S5e9STO9TtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J9jANprfG6Ihedpq5xJHun2G0Bc/8Cl4zBOkONqV1UXUfSE4LPtW+3bfRnsGj2/9JaU8k1zySFl2JSlnbz5RMZIN3bz4paqjDk0i97xDHPXC9NeMSQ++MaCHI7tDO+4nIRkA3ukdd4tAAmatYp/8uIFINtTWH2y5QoQWxjti/Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CiDOxYKa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gLhG1zd7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CiDOxYKa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gLhG1zd7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMaWN3869990
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKmhlTgx1VIL08aqjbOIr72fw3Tnkf2jNo721b3IBJA=; b=CiDOxYKaOs6PR0OY
	+f/Ddw509g/v9Y1u+7dFDa9sqWQsV1Mp7frQ2hmvBwUR4RU3De5xdas5yUQYfYVg
	aJtdN9aBnHo97i32dAtEL19kB/jHm1sT8osOp1Mt5C/jFa/TnlzXXBQZri5WSApW
	sHzKcJJwXhmyb8nQ5QtsFx+/muLWsO/Sk5hM1TNEOuLCPLYiYcGJvyoMfqXC5tkI
	cS2lXY/8CFr8c2ND2W/gHmI4f+qDWQwTQp9uviS67VkGhjC4K7jLcKRGtEzTG8tW
	XIIs/oU8iALwM+arsfINEo24X3OGr2+Mh5q6hlVI4OSGex8edQbCID5KznnWux2p
	5A+1hg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jpjh26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d9cef8d15so63896381cf.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572600; x=1788177400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKmhlTgx1VIL08aqjbOIr72fw3Tnkf2jNo721b3IBJA=;
        b=gLhG1zd7GMJx0idZ76UvtlzqNWyYLsn3ujlJRjxpAcDcTH1K+dwL7qKhSUak7JpNJr
         UDlnjjZ5jLPEEHXo4dGHW9Vpn4EPtodzp9hHtv0X+bkrBOYFNrMpk/6OVE1zzEt/ZfbE
         mZoWlC1BUXyd4+px629Gd+B2/Hfaz65XDrcmPkMun2xEwV8ABn8i/t3ywPneJO4r99HB
         bqOx1GbtjA2qoBL1iJ7U8BsKBGv6wp+zibS4xxcBIkIhs5eBK9I2IC7k6SixVhLh8LbC
         4hZsQX3MeC/3DwLiTpCxTirrGvYtOp+ajfSl0ePgKoO7c6FfNzsbaQ1Qnkb+Y+sxO5bf
         deMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572600; x=1788177400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKmhlTgx1VIL08aqjbOIr72fw3Tnkf2jNo721b3IBJA=;
        b=UWQOB1qQSsc5hqpC0VjAS8x9df6br6G61ilCzToLs5GSFjtjz2JWfqINad43ZpyL4F
         ujPthoQpTtcknEvNNT2WL2J927c6ES6J6npcuHT8Iw05fFWzuyfxdtXG0Nt1yiMjfUL0
         ygmOwmKFB63InMuxrDf4Dw2A6LlpksSRjG/NtNSpYKkPdMkC/qZ7h7GRy6qlm9LxZMWV
         45R7MFSSHwY3BnDyEDvumvBVDjbpXIFZcAAfuncukElCdx+D3OKq75mTmvte41xsfIZg
         mkrIAf+piWlugI1TYsD8QcMWSDdzmQlMuHyUfXTa1HWHnVXbWnTTDh2GKaeWOlngv4on
         nf8A==
X-Forwarded-Encrypted: i=1; AHgh+RrBg6MY66t8cIhKk/Ukbhu2BMOAla5zVjBCtJttIMPc6P1B7NxcGpy/3rKrX7hbeQdCdH3Lo2LoZCty@vger.kernel.org
X-Gm-Message-State: AFuF++kEabKxYFUXqi6tK1c5A98uI9mNQ1XAaievPC9tLni5st4CIkY8
	kAKcKTUfaiNJ8ap7MwTfE8zTNsxPffCzqH2CsvtHF6aQlVsCGnuL5b1HksdF4xzwSrhZ7AXTh7+
	+sjeJNZiKzUst+w9r/QiSUcMr0w1z+DR38kXYrq5AkWwsf+Du4ChRmacr8+Jp2M1E
X-Gm-Gg: AR+sD10o6TGsN/6AJm7Te6q2Fsy6rhh1Twj+nWRRLnWsJSfep51NtsB6JoTcifLo94t
	uIX0nQ2GvXlxOjZTlejkr1lQpbr4nIPoNdYPntm9JeZK2Ju5dAiA+iNkYfzeucqBlQwWNhWZmpt
	+dGm4Lkrhla1xc6cGSdyAXK8SO5Z8jSulIjqTzHVkFIR9kufDgRtVyvx5jgnh7d7ynE21lLrMBz
	w5LwZNQsAiq5mTTnVeXBcZ0yJ4vMWAAffr2H3e5nU1lcS9xskLqiHxuLymGFIVIhVz2u+dSn1Ba
	xdgjCV00QmEOx7WAtP2sTBcn+TfwdLGtMH4U0haWqRfO7kkcXRH64HF76nzt4BhJTzPhPTdas2A
	QUfMGfxVL
X-Received: by 2002:a05:622a:229a:b0:519:f884:b587 with SMTP id d75a77b69052e-52e09cabe0fmr189632461cf.27.1787572599707;
        Mon, 24 Aug 2026 04:56:39 -0700 (PDT)
X-Received: by 2002:a05:622a:229a:b0:519:f884:b587 with SMTP id d75a77b69052e-52e09cabe0fmr189631881cf.27.1787572599174;
        Mon, 24 Aug 2026 04:56:39 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:27 +0300
Subject: [PATCH v3 40/47] arm64: dts: qcom: sm8150: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-40-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=932;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=F80H9I0DjUCTxp9n76OgxJurzIJXm534S5e9STO9TtI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDD86/X4+gHznf3pGD/u8NKgQj7u0bjeCpgMT
 OczFV0gk8SJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww/AAKCRAbX0TJAJUV
 VoacD/9XwdzVX7uArlZXlJ/UWZ+R/hCYjieIwFQRvdvN2ucOS2WvWDuWA+BaczDTu6jEVub4dkH
 d4zDp6LVsMXGukHKWiESm9vGJtlPFZV5+sh9KN8B2EqLDOotB5LlFXCVmxX87Ky1jaTYiayEb9M
 aeDa3+dwYx8muoPuiAhG2rwq0QgIuA0wEO/9Gt5NtNzy1SW3xweW7MxZwBcK+72jYDKHVLSBwv9
 J72bFjXMO74RwNEUKjX+qEAVJcKu3fXCHdw8bhOp9rhHQcd6fXCmXFtkY2b3Da04tp2OqlhcD2Z
 kbNUCr49SkVYEQmMw1rxqb57d62ZmP5fFcXsx54Uw7t1lfTnh360sM7pX+1zqJ3AEdbsQ1LpfNw
 brDNJ8wJeuU4Z1vI9/XHcROjycaCe2N/GUCowBxTzhF/YGGzApaTiQU4P/PuOcHaZUAC7e+pnKr
 s5jSavRX1idP44J4Ott93NZRN8wJhpi5Zet/FXEcZENzhAM/FTbxFav/yicnFmvqHoB5ySbzMM0
 uEqRoKZMbZJoQczVzf/bHc6k98672A2RmPsbAr3Hix06gaOswNwIsKJZNMt4ArnsNkLqyybWuZK
 KOdnLzrnUVL9sFleekxttVS02kB/mZuUtD8UlStmgesuPRWVNmRz8wkAaHcqiu3M6w5NWQw+qxV
 u+9ILxuLF3jZU/g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfXxOhKvQfwHyOq
 ZEEiVCHzIlgBEK5OLIrAm2kRreiXwbu+IwKpVDMU2WsorDGRAZuvTw96hwvE/HTQwxKgGdt3K1g
 8AVJwJlqsL0U8WAqRgbNkgoUgFrY/6J45+AnvZgO/gK4ju7DUy6Z7mOpjb2WLj5WreVb+1qUHOd
 AOobQ6EGkhziomzNlpcwj0hR6+DWuChXEvHn3SVSthJJuteUQnDn6tbdlCqsD1bJRnpWbmFbovu
 QboWu8T6um5V4ACCZcMqO5F6WpFZxEUduCQfxgkFcIwlX99GagzypkFYA2rUAcUXmqz4BHYou8U
 H1kjJTadhcR75dnamHR6899NMm/1BGPxptwDpR6OFJLgUxcZEWZFVaibYNUJVXlt8Yv8ZUXvHsY
 2hg/ovhJLNu2l3tLiGnCPwXNiVPEeeNJw6FO79gzT1pfRkL1EuAQQHbHWsI/y9ylIeL0AJ4M/Om
 g/nPGvHAq+EZDlfjjPA==
X-Proofpoint-GUID: kn1nXeEq9wRqahW6x0_J7BVRekFRr-mS
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfXy/sEUN3Vexm+
 9o5jnPVlYtNhzbxGNplxyyVnuSQBxpboA3BG/hZpE0rhP4tc95mHHbu00LxDCUXIqNrY/0tLeNU
 RlzaTdodWXQ+YDJZxuwvw9nEArQYbNw=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8c3178 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: kn1nXeEq9wRqahW6x0_J7BVRekFRr-mS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240100

The GCC GDSCs on SM8150 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 94a3b02cb289..397c0142ea57 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -913,6 +913,7 @@ gcc: clock-controller@100000 {
 				      "sleep_clk";
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&sleep_clk>;
+			power-domains = <&rpmhpd SM8150_CX>;
 		};
 
 		gpi_dma0: dma-controller@800000 {

-- 
2.54.0

