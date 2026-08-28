Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A2C4582E0
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 12:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920714; cv=none; b=k76cfIAKAmbhfvXFEBQMO7fl6rhgBxRZ7jJfIJVLQZvdrteJVV2oROg/NcfRH6DuRxvEQoWEYGop+Clt5DPjpzgYp11M3i87x55DLQC99iMvKyFoIT0XiifEtu6qUXAgd+iyCzpsP/GoyccmcEheZ8tXQZADYKOjs/wNbqgV5CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920714; c=relaxed/simple;
	bh=EgvnDUksmFTLSf5SJawv2fmDcsR/7eXrUK8gvnax7L0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c3ZSZxVVF7Xd+nrlaEB7fPCLd7bPBTGeU85jl6wtozJ3/f2+t9pQG5HVQvc90rkfCWVs7rc5szUmg+Kj12MMa2CzA4jIMRiOJAekkAAU0KJv8OumofDHJsaofaq8brDGI+1FgqugyuGSL1twPXTeNYG/mJcI+Zz0cVR0roLFTKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6TYltrn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=REi9hzgJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6TYltrn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="REi9hzgJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA8TsE2492037
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 12:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZhRNRsbZM8eE6FMDqHz8J53GzZk8ooiSvy1QOXVGep4=; b=Q6TYltrnIngsXK00
	Ph9u8KlcyQh79V3LBVSaA6+y4ql2lb8NrlCrzK276KXKDXt0mEpFE9QcwbHdODNg
	z/tWYl5bhbU3e4EGjt3rHNuVCdMGamkNDg8R1lkVta9Qlf5HyKaDOZtZGarHcZ0t
	tacYlppaV5s87x2RptD7GIwuC3MIwwizoeYnSNn4HvQR2BgtxnUNB1ykppbtUJSg
	hrlSvAbKmAUDV2LXEiHkWwcDOcz1ozQDvARPMEV2dtW3gDunsLeqN0BYsiUtxiX7
	eC4IMV2cjVGDGsxu28JXXELof77gxhMz7VWNsQmYS0Raw2YKaShFvzk9s4uCsW2r
	Qt6vEg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3hs1twe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 12:38:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52fc0097865so15252011cf.2
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 05:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787920698; x=1788525498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZhRNRsbZM8eE6FMDqHz8J53GzZk8ooiSvy1QOXVGep4=;
        b=REi9hzgJQFtRnezNYRKnAF7Vir0n71asg9wDE/A1WXh5xwqIXlM9ICbLCHsnemguZv
         F2alv7li/vUvAFT2j9ttiK7Mvx+ruOSs5EaRvTOFq3FZmZ0Q8zYDQ9/ChmyvZg04Cggu
         mTqi/DX3GR3itVj8haVXb5CuBTx8xuXMC0Y9e8Ao6kt6xkxMnuPdaGif3iYIcDaWBspc
         bS4Gjk59BVN29vRDLYVALBBOIi7/xBuDxgTk03ozBQf7r/b/8v1+Q1WMWvaMUl11mWBh
         zo/yj+RvbzQCIFYrLPTxoaIB2RucTdGtyD5zUtwotCr09CVXA4hqoXHi/v6YiV5g50wy
         vH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787920698; x=1788525498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZhRNRsbZM8eE6FMDqHz8J53GzZk8ooiSvy1QOXVGep4=;
        b=TteOWdaAnQAkUr/sfNvrfbvy1f2+eHdSDzi4y6buBJkS5saanYFDoIey5T85OVj90/
         gzGbrwZe6WBCXRZpZS83Ytv3lxV8H+/6ccBY5vm2g1YVJoJgQN7bqoNg/jNftjj6kNVj
         hxGG/3lxVwkb6GTCrCBTIq8Hz3LRIO+ZVGEagiTOukg6AgUYB7nwTrL1wS271prq0Ozd
         1ui2yN9SOh6pdnbn4g/pmdyELgxPWvQA/RtqMvhIWm0o5ciL7i4f0alc/cwEUPl5KkJG
         DaCEr9+IUP3C+fHslBsPQWrWz1cz9jkt4b2KQFosvWSdxdk3+qGvrvjkTXjbHIUjVBgB
         lWwA==
X-Forwarded-Encrypted: i=1; AHgh+RroJ5LNBCmySHtXWNGhxaYotmvg2imPtJXV9sgw4ZDSFoSj6/0pqCgUcZowbeE+lqQWRK+wMXDZmVDK@vger.kernel.org
X-Gm-Message-State: AFuF++kLFEWKlOHIDypLrbQm41REFP/lF+tQ4VesikBasUfCjekvHI/G
	fyKlR8fRTrGQ6mnz/F6iGMtjy/aFm6mpMKuxWlDKGvte2d5ZG9aO4CNSfAna1eHib1gLiLe0zLB
	x6ZP2m0x9UPwtnWCnXDh3Jzj9ILYcrjRUfd6X3MuN9hHjlMVxsp/atT2Q0mGXp9zzvu1n0Zaj
X-Gm-Gg: AR+sD13+RyqtmBj2+Ns1dDV5TzANZytdv9F+qR67BY6Z1bFOfSs/xIpGwWq1Yt+kh2q
	2SyNFHJhJVYFzUngsMeJttcUFsPPwPxCoOy+wwz01h0QcKwZ47zCME8vnMFdppFe9h+p29+WnfC
	GmHMvWqvoUx8wP7XTSSYhC1v0/BstOjx4g44/qYKk5GMoSw1Fh/Bl3gsSJ+5fPbf3jHotwAs+MJ
	qriz30QMgnv+ZZUx2Hrzm9sfvWYksDv1SeNzwFQqbp4xqMwJUtKeK2ANGWckDy4CvSnXCHOKNKM
	sxOCGsQtxqz6YRd9rpxI+CaL1G1nQtr7kFsOu0kfCOy81SkHhY4YkD+ohyraBsfBjUSvTpoel63
	tzegluQw=
X-Received: by 2002:a05:622a:e490:20b0:52f:bdbf:4086 with SMTP id d75a77b69052e-52fbdbf4745mr33282331cf.23.1787920692594;
        Fri, 28 Aug 2026 05:38:12 -0700 (PDT)
X-Received: by 2002:a05:622a:e490:20b0:52f:bdbf:4086 with SMTP id d75a77b69052e-52fbdbf4745mr33281691cf.23.1787920691863;
        Fri, 28 Aug 2026 05:38:11 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92671c0esm39338965e9.2.2026.08.28.05.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:38:10 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:37:30 +0300
Subject: [PATCH 11/11] arm64: dts: qcom: sc7180: Disable Inline Crypto
 Engine by default
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-b4-dts-qcom-disable-ice-by-default-v1-11-1d6e0c2f5a69@oss.qualcomm.com>
References: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
In-Reply-To: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=EgvnDUksmFTLSf5SJawv2fmDcsR/7eXrUK8gvnax7L0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqkYEUffgxq9Sb1/B9R1By2e8YlbTxrnOECOgug
 G2mBQldXBaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapGBFAAKCRAbX0TJAJUV
 VmJbD/4iI/2xFABG3CvUSDkl7lktJjB9Wf5MbNhiTZTlLSOScRqfnZYRwWXd1rnGUA5Q0HNrbFQ
 Q7xcJfuvz4rqk3Q2KVoHamzph9AqWjfflJM8OJ/I7Ufp/3W6fjfIzhpfMa3pDXg+3jEuiqcw2ck
 yxupgVUUtu9yF0+9TrbGuCO9BstrwbCEzgaKuM5b5yAtgyIGcIomVBuiMkzCUhJXvRUNzAi54nb
 jOVtN4M8482VyjHdoJdfkyzP5k+6YNsIVkKXj9VZlmgteStLz9Td1GdVOfd4b3kXQC11qJf6qRV
 BcqWLBXVAtoK1RGZzFx3JNvnOV0FV2nnGMgLKIdQaw7oD7NiObcRF+5agKVZMw0+y45bQqyPJr5
 mlmI7HbvUhA775KZEZS5k0a7PbYbR6xc6SwFJpW+5aF9GlzzB5gscNVWDpizUqra/mCupOzXqwB
 cPBUh1mY12Fm8b5NsOZNHtMm839MW6mJQIRpVWyZPURFBLWT18grlCUhiIYRdqvO3P2VtlzcuCp
 HFIyc8vXjr/CtjK4A4vqjLBOfh+k7lTNc7MjIilEUEq6UyNQV4hGTmxJsS8fUhz98X+DyN1GVa/
 qpEC84zfgmaZB66FhmNMs0CdklLZkhtm68EX2jSCXq5T+eEyScc4H1WCye1TnwD9SXlfPtKICbx
 fqdd8qsUI65X59Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=XKYAjwhE c=1 sm=1 tr=0 ts=6a91813a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=R9TnukjFd2VXrOE3MjoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX28EVhz4QsqA8
 1GjWLazZJ9s5ALhkRdjmCb9u/i2YV81xcTSdVsmYed6Xso3w2ugZoXvBWvlUGDZS4kxA+e69SM9
 a1wqRpD7Rk6bDagoxzESJS/fEGI9nRvtEUXOCVglWSRqXBLWoGhXaRX/rcaLJhcZw+OgIQXA6RI
 xOuqbntfpzHfPzGpqPOHA02L701aTVY51pjNgrWewdPch6OjDgVcbMO85apHL5Z3BDqR12YIv1I
 yAql3BLGsSkzhbNqGsbZkXc9H75MfkLIBusomMgX0ifE8kPIuqkDSoTD52Y11/Ifjdh8YGksWxk
 Yo3jzLrN/gzK/R3bNL+QIhMNNtmKcfT9Rr4aixNGHH1kbYIlnvXQyOlJ34TFmWfMP7Ec4hf1VgA
 PGDXX3s6AXNamACc9ard0bI3BwZjcMIngQ5y/CpfiEMRNe+2fLlRaCSvE5CBGsnbjGDZLdQAnHz
 m5GvoONYYzA4+ssUp3g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX6APxHirCzVmG
 O5/t1PYMoxXUKXLLRhdMaKb3qAg4Km4V3pVQ7bL8MWs7aSK72tg+qm2Z2RFwG/bfuqd4o/oT/8V
 fjp5Jr282q5Hyp4TRx7nqMTePzUkDLQ=
X-Proofpoint-GUID: VIcqcQDSXGVyEMkYLgUZPl8EGV7C4GwX
X-Proofpoint-ORIG-GUID: VIcqcQDSXGVyEMkYLgUZPl8EGV7C4GwX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280109

Since UFS_PHY_GDSC is attached to the Inline Crypto Engine and the driver
does not currently enable runtime PM, the GDSC remains enabled while the
device is idle, even on boards where there are no consumers.

So disable the Inline Crypto Engine by default in the SoC DTSI and enable
it only in board DTS files that use it.

Fixes: 7cd7271ac525 ("arm64: dts: qcom: sc7180: Add power-domain and iface clk for ice node")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi               | 2 ++
 arch/arm64/boot/dts/qcom/sm7125-xiaomi-common.dtsi | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 70fbfb31d4a4..9aabecdc57cc 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1611,6 +1611,8 @@ ice: crypto@1d90000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc UFS_PHY_GDSC>;
+
+			status = "disabled";
 		};
 
 		ipa: ipa@1e40000 {
diff --git a/arch/arm64/boot/dts/qcom/sm7125-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/sm7125-xiaomi-common.dtsi
index b9cff60efe6f..cb419a44ea4d 100644
--- a/arch/arm64/boot/dts/qcom/sm7125-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm7125-xiaomi-common.dtsi
@@ -333,6 +333,10 @@ &dispcc {
 	status = "disabled";
 };
 
+&ice {
+	status = "okay";
+};
+
 &pm6150_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 	status = "okay";

-- 
2.54.0

