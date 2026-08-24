Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B0942586A
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572587; cv=none; b=bABIlcFv3zeq4ziqw1GwIzVau2AKYfQ9rISwCaqDXpX7XDtotJbp17y/6FdbHBB07IY5/izleDDAvRVVNAqp0C5ylqZMYoEfhC4/mylJm/RPEQjh5dFejj/DJIlM60+WRiv2lABBmrk/3i5grpqIraqHBNs6IOIfNtpIzdt2ZDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572587; c=relaxed/simple;
	bh=lQV0ldRNKcf/gqFd9CvCOCZHVi8E1tSUEkUVeUVD14c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HR9BChWKTiXEi5oTj0mSaeyr3sm4MwTIWpazolFnCsBxFYkqdwONRefOSqh6hoWbjNXo48XDrrhiUGsc39yM6DMlYp4vp1jVTnv2bQ/bjfgrYn9tNPLb/homoPhThFwzzvVOsq2ed5FhxX/meZusQYCB5VoOxkML2Z1hJHWh2oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICjDbyoq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V3nogHI0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICjDbyoq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V3nogHI0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMeN23195023
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UmyJOOZgdqhPljjjMNEqZWEe3ZGHlmE2PquH4ZCuwe0=; b=ICjDbyoq+PDKm3Ul
	u1qUuuIIhRUbOLqKz2Tvkmk07VCNDJ9D1fv31MhiZqUm65TWn1O1v7Lrk76ABpQ9
	iPG7Rx3kzmfd/pgYe6uMWy1Bs0GJMaKvG/qU4xPgbOZhVN05aLa8O8yE9przpxMs
	udGYKtqUri+mefE0bfqRzqb5NbElLn9cFqLwcdcj2LB7FWzUC+3QQ+wyE/AP/EVa
	CnM47SZFh4A9ZQF1n9M6hu76UhMB9sEO9UL4pqE44dMNkPbGe9ceUf2Z+O8WBMpL
	WkD20siuC9/TyQsCz9SPtWvVZJpivdmvVgVNMipI3MJg6nq5cpb4D/HeyaujjBpy
	0SSzcw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgs30w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-526da7e3c9dso34755251cf.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572584; x=1788177384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UmyJOOZgdqhPljjjMNEqZWEe3ZGHlmE2PquH4ZCuwe0=;
        b=V3nogHI0KBmubJ3vpA2shnUWDGPTu8/VLgC3zuMZaHTit0o2+6MpYeMHC2W9o7XfMp
         Ok4dJrek2CSjqFWcpBl7/dmbEc5g6taUf/cPemzBX4PRSn6TT+xskmIJmurTjImXnvh0
         K6CTXU0I1a4RKWOowJnyc4Mp3kZR95j6KfaWTY7EFFY4RNtvC3Jh9eZCX0tkg9lT1P6k
         OPi2wAhBAjfFj5bT6m5OzAthgDeBTFdOx6lxzsycLCpo2UDHqf6ErZuyoIyLY0F7O6SO
         nSi5oE1RSoP0nbZreNPgpQQyYQb6WCQW9+zhiXNCNa499Ot5s1bTtc3BA8Hr3PIca25R
         oZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572584; x=1788177384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UmyJOOZgdqhPljjjMNEqZWEe3ZGHlmE2PquH4ZCuwe0=;
        b=OX21FoBXjJxJw99CH8vvQHFrTx3X+Ia5nijSBJr4VeEb2PBrelsaRHOvurkZ0Msm8X
         tbEKeAFslTeW9soTZjJd6YTG5ycaK6YqvjYYW1uBFTSgG5SFvP5UZI6HJ+csXcYAJvAG
         N1hs2dRkq2oag/AeAtjGRSskqrjW06QAXqWuujGgVBxXd7ymIyQR5rNdh0ONQw4qTByF
         fpVtNxw92fg5oAiHS7dK5KMej7/aTJGlL2e6xWjUOsmUPP7xfYyKvwuP1rn0Fob7pYHZ
         M93S5gj0+Cm0gU53x6lmDMp9NLrfU6YZ8Waa66P2r15SFE9mWBqw81GZT+oD6HbK4r+b
         78tg==
X-Forwarded-Encrypted: i=1; AHgh+RpTw79nAcg0Csk1x3HZ7K6SnxHcmOBeA9Fqra1OQ/UqtXy5kmXkxkHc05wlM5Dd/PQLKm0IfYeIMACW@vger.kernel.org
X-Gm-Message-State: AFuF++nW7WEmOGjrmBuHrmDuDod0xnuacNn1E12UC3FUt82vkagwuiyr
	4K25zuRzBsolGTlOuwdU/bRur07Jo8rv/2uZ1YeSV/zDFpqAOJB8sDU8J9PfeBkqefrVytYtvfq
	93ZW42TuIbCzeP2o0VnXusZJT8zvtT7d9RNaSMtGMqDx+v/EmD/g40lgkKk89pz96
X-Gm-Gg: AR+sD10nmqR0TMzPuuEy9tu/H/yzd8oETvWEoZEpv7O2jeiVfh4IivvGoTiqno/Llf2
	0vkZOE/XFSoZ37020nYQy5+fsFoB8IruvlSuNwlsnJD6FfOpM1Vbuz/coIgSGaXPF3DPCdJxhmC
	27MkfpOGJsqjqlFi5odNwAv3BQREie5cU1pLVg3hpR9uNuUmS1u+Da4uisYUnXdjS5ERXnVr46U
	cLWSi6RV00P/7OE9pYZEzdBd3BIN8D3yE2Kzcox/9ge2UwpfBlYhW1ry7y6V1WaxFtrKf1azJce
	aN6yH/ZMIyCLrYZptWzSf20S/yKocksrGXeUlKb5F3pGNFtx17/PJs7iVsDdt2hURwWUW04gweG
	CVow3ba6X
X-Received: by 2002:a05:622a:1c0c:b0:51c:a8:51cd with SMTP id d75a77b69052e-52e09b81035mr184452531cf.1.1787572583870;
        Mon, 24 Aug 2026 04:56:23 -0700 (PDT)
X-Received: by 2002:a05:622a:1c0c:b0:51c:a8:51cd with SMTP id d75a77b69052e-52e09b81035mr184452031cf.1.1787572583076;
        Mon, 24 Aug 2026 04:56:23 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:22 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:21 +0300
Subject: [PATCH v3 34/47] arm64: dts: qcom: qdu1000: Add GCC CX power
 domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-34-f1205a92682b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=937;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=lQV0ldRNKcf/gqFd9CvCOCZHVi8E1tSUEkUVeUVD14c=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDD2BQ73yLRCFOKLr17yDz7Ay358Q5lphjkRs
 RfIqKaGiHeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww9gAKCRAbX0TJAJUV
 VoQ4D/96nz5DGjGvRDpblSMlp5W2mZvvnSKZP5OmQm5j7yywF8xN+SpJp8JW/ZXc6YeuqQfHquS
 LLabqSdcs47NT7iT+GDSUwHCyLueq3gU6HxJCpdQq4Yy3hyYuuYvLtpgdiYKzi6kMLJTZm5QY/l
 GMU9DQui1JhEqho+3qh4X+3TJuLbqhJBZ/IXUJEUYkoTg620VYcCn95qrgBm9LNPjzSHVBR5LEe
 Hi2yEuWnNXO/tEBr/jfNqiJo/uGF/9SAQFwYrcerGS7mXFSoeBLeEIw6BUx2y10O+CN+pZz6Lv4
 SHbqeXxECCycOJbp7OKdMqqW/PQaDTtDNCaS04kh4d78NjZZyRN9yYZMMFZiumc1TJH06FBjdtG
 MKWlPM5dQToHTbAwh9XsTZtfHIE/kmXsYNo2RRL0awMVuf/eb5ZUUfZcgH6H5mKRmTyiiuMy813
 aWTETGmPvLtylomUIBFffp2UrltArb+5zkGYfjV71fujgsx2QsXYoGIk5FqpJSmgJ8bNXKnWORn
 DLYADf/Sbjb2mMO92N3dHjz8DDvKqiOepvvniFXBvVy2kyEWkFFZc5KyDUHIKDSnXSOWHLsmY1c
 g2NFMPFH37ZuvnWJK6bOfaRO/XB+euRRbga2c8t6jIQQOE33jr32fFLLZAf8P5a0Iy/hlwwHgGE
 TCb+lsJ1xjH8C7g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX+9xNI5MkdVYG
 eGaapoeA5/1GXADEZOTe/4Z5wfTLm7VpgnANTjTtWp2khxj4ip3tZjcEm2w1oP/QE3UghWvgFCT
 bDR7wDHG3BoT/51aTBZ+mRpsSbU30Zg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX4DAXv/Cfu9Pm
 TsenHoKTO/g7ZJ2B4FKoej9o9wQ1DSC9jcRKOuhgky7/onKh9wLHGpwGHa10hxrfFKc1n0xReb2
 bkKFkbStt3bM5xt88mcMCBBccsPbNOWiE6hfJ39JFgUhzF5G2Dspi1LAg+lsdG2hcbVKd9sWOFr
 hONwuhiWpndKrjvIxZFaPdqyRVjyc1ro+jMlxWn7S6dYEqjnw/sX3R1OT9YrZGfjNtX21rzuVow
 iGBrdtsig4KhZl7BJm6tWOhJn/2042fjsHNvaWOuml7+N7nqXBPB7f9xWBFIm0WgnIuG2Zt5gaC
 6z0j6X0Jm33WhFI5NT9W2uTwOvSGh+kmApztHReHKjRaR4zy8wdXHX1pARcvFbOLU8LT3tH9cXQ
 3PUi9273M3Kwg+n7JqHeTe6KSF033HY97gir7bpJ3Fpap/TQKRwR1e8v5bYb7wDbxGkLYsbR+rz
 boUQgaSOPp2DCD3NUEQ==
X-Proofpoint-ORIG-GUID: WjT944px9PKzDBxdlNy1d8Qi6o75DrBZ
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c3168 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=frXxnpyXSSLf7P61oFUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: WjT944px9PKzDBxdlNy1d8Qi6o75DrBZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

The GCC GDSCs on QDU1000 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index af106aebd30d..accb4b989655 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -396,6 +396,7 @@ gcc: clock-controller@80000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd QDU1000_CX>;
 		};
 
 		ecpricc: clock-controller@280000 {

-- 
2.54.0

