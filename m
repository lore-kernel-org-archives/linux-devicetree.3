Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4687A3ACF1F
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788146489; cv=none; b=HfzV8pXvz4ZI4smmDQy+f5jOJJqfcOEpZG0RH8d9fGOZdxkthYVlMCoGmLiSdpqySn6ZjgLRWQHhLBF2zTCNZT9hophuUjG1e+6RQgjfDaGrij1zFBW970XRz5wLXXi9Qf18jfE4EIFdvmcao0+7aLPPZh8wbMOjchkX+dHALHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788146489; c=relaxed/simple;
	bh=Qo1auokYYhVIFaBJtPQFmiVUQCNJkFUL4nNSwi2XFZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V7v9kASCaHx4yFACpaZ6Zx2S9W4cpa2C5XjKxpbol5XDVhYPn9gdz0c3HeGQvaq7o3znZs0+jXx1l0ywql4qOQRvgoT5Lawb3Ys8p36dhJ2AeupdQ9+pA2vpj/+w38gjk+zA6//4HkaIarGhj/OF1HQD1RuxRw8yFPnxxPHp5PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B2Lue4Th; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g0vdf/dr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B2Lue4Th";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g0vdf/dr"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1bcoi2819962
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=T5xLFRY6QC4
	gGYyfGZe54JVlSYu/D3Sb6Z4L8g9c4Mg=; b=B2Lue4ThYUDpYiazk9ZTm98xxF5
	xoDfbW3xdn/vFU06JYTkOX3IJT9qcDKHVs2dqzFEwCMkBAYzbPT9gnVM+7/aLbSl
	iivhQ1GwNKs8lLEFnkV8j0uyUBdBnK423sCJ40QEL9D/wXay3gVjds9lLfSPuUko
	Q8/h2mG7QFa6OEJIjR5hbfabFfitMZr7f8dLovijh2ngoW4UbLEU/Lh61qC+icsd
	V7FVixTmZ+1kOgGXpcXLR/BJqMPsXwOmihaH3HgzE8ep+XHfBL/WAaFEZjMXk9tH
	Nl69dlHsU9htmllNuGTGsGQHg+l11LnhQDSwJYhiCL/lrRmrVIrthGkuAUg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqdfmbp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:21:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso3990607a91.2
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 20:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788146487; x=1788751287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T5xLFRY6QC4gGYyfGZe54JVlSYu/D3Sb6Z4L8g9c4Mg=;
        b=g0vdf/drJ4Ma3uqwbz3NFuDgfSFdrAog0968h7lArGFvx3ZFaZdj8KXuB7N8OYJVtL
         9+oDr0HghShp8cyhWT+0imbeo2VHykM+E6+CqA/b/43z6gtNpw3AqMu6L92OtSE/ykTd
         y0mpCpyE3CwzyGGKeWbPY8bNEfwoPeO9H2TL8ev/XfR1XmD7Nqpwz6exnyyGgOSisLIJ
         kkzYTfnzeLpiRDykUEd1Pd68J0KaaBusWnba4J8TLCRLswA26sh1AC7bjxeexAUfsC7y
         Mu1TfQgP8yN052NqOAfgiHfW8SaZOvEXMQPF+P7vdfqt51EyR58NKyNtiZUeZLFVvWTY
         xSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788146487; x=1788751287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T5xLFRY6QC4gGYyfGZe54JVlSYu/D3Sb6Z4L8g9c4Mg=;
        b=LcBfNSCofh9P+x0VMtWF1IvjsNve93wUuJBlfFD4yLJamdLMeTkN9o7zAgElxJkHWw
         nCb1h5ZXbi03OvHLzv03U6bc+GTTxZZDIWn2cgK8hPAGRx0oDUyan9BoD3Ez/ZoTWWBu
         SM4A/LEVLItwPZKTFi9pHm7VLEq2T2eTuG7Dit8c/6MpIk9DvCGmGtMTO6F9teEq32uq
         7eAZK2Z2XDQp0PsvSAOBDUR1ELDbu/OzeyxjgPzd8sPhfPOA3B3Vh8Rh4Y9iQ/dKOza/
         COV1BSNCvGqq0b+MZAvTlveMMRAdcrCg1nx389hUlVWCV4dBg20iiS6tHKWdHZurBvBI
         LlYQ==
X-Forwarded-Encrypted: i=1; AKwUvBza14E+8/t1HoDhrGXf3znb6L9zQF7JeTyTXTuKwjdQaF+PdiPPZkN/tcKS/CXg5O7dDoLZikZb9I+t@vger.kernel.org
X-Gm-Message-State: AFuF++k6YmTaJuicOV6Rbr5U8YYvD5ujOdJoJUgKwDCVzM+EQvB2iWzj
	ZsuqFUkPp3BqMssc20HD6YDsNunug5mxVZGjzN/3cTVbxGYxJUYGst91O/7XKwLHDvQRkR6akYy
	hR4Au2wyUgKFHC/LLnXAA9N5RdfXxlLJ7pUNlAqG5chCnWENBDS4Umk58Di/XkKtJ
X-Gm-Gg: AYBFou1iyWH5sywU/3GxH112pToj8xQKdIrdcpJqT9PmyxBxoCREGW1i2YWOnyQF+5G
	Ha1dnWLf/H/00g0SHTBMynoc9p9jaFJMX/yOVz7OC+7mT8mIuiOrEM4a+KWEPZwqvvu751DXjCY
	lAYmp4QpJQlmEvNNghw+CDnDolNqQnqNjIt4SqyVyXS3ZkNK68E3h5YYrJaZPGsHXKaOKG5aEzL
	3CS7PTltHM07yDpH8jJVGh5kjIHElqf0P/RMwQBGU8b7h9f9XbGkMiJQdAAYZoRAa7Z/DCHexvO
	tKCvLXl024ss+x6d/L+0cFFui52BCvs/8t1u6yJAB4OvXlZ46PQdto2VYLsV2/JBQ/p8Rphr/1D
	CU49CwzoZu4N2wvL7MJj5s34wd8NUDFh6BXUoKeDN1/OLKVtBcrYa1uN38MGp
X-Received: by 2002:a17:90b:384e:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-396d104d0bfmr31846947a91.15.1788146486781;
        Sun, 30 Aug 2026 20:21:26 -0700 (PDT)
X-Received: by 2002:a17:90b:384e:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-396d104d0bfmr31846728a91.15.1788146485315;
        Sun, 30 Aug 2026 20:21:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a160sm25599208eec.18.2026.08.30.20.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 20:21:24 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/6] arm64: dts: qcom: nord: Add the SPMI PMIC arbiter
Date: Mon, 31 Aug 2026 11:21:00 +0800
Message-ID: <20260831032103.341633-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAyNiBTYWx0ZWRfXzsau+brYz2Ms
 djrBmvxxJBah7fLYy2LNOTax2q555OH2HCV7hhJXfpAIvGd2kfXTw5yv4MbHdVTKMjUz806SXq2
 8E+v7EuXG3ia7/JeWP5GJ9Vrv3TDVUXoB3Rq1FEDarYXOUTM220fyy6qlFYWLsblJ9w1JYBXYIZ
 +iM8yzuqBCq+XUhta0ihTm76okXOmdwnrfZWb/QfOUqQoVTnGVuShrv2OCofwLcJb1kb7ondD/v
 LvB8Z/wtfXl8xovwBVXvdJSYEFCURmeg05wPxLAIe3aPPmme1xKpcmjXew/t+2lE+/IkoQKAd82
 lzYJy1sbEKCb9sJz5MdgvESv8ZYC4/StE3wbCbYM2d8Vxv3O1frFQJ/qhN4iWz4G5nG9VjeaQ4F
 SBVkSKnNHMQ2+s1GLW0Trbx7nhNnYW0fTjmzQGShUVJ9cUdtSKP+wzEOx9Kq61KqlBkNnysBd5G
 /fGbZAs0URWrcTLtnxA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAyNiBTYWx0ZWRfX4n8dWshqir6p
 NRuuPDb5XyktJs1tUNHuoIq3kQr2h1ekCwwx01qOF9sgn2nxxVfYGXNmhRmXeOynQ7sRQBEOwmz
 rBfoJYBAn4jeEebDygq7jvYZXKtycOk=
X-Authority-Analysis: v=2.4 cv=B7eJFutM c=1 sm=1 tr=0 ts=6a94f337 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=eAws4zb0lv8ujySLY5IA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: YKfh_RHDhf8xMoIEcDKnGgYZPqdNYUp8
X-Proofpoint-ORIG-GUID: YKfh_RHDhf8xMoIEcDKnGgYZPqdNYUp8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310026

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add the SPMI PMIC Arbiter node for the Nord platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 03703324f487..83760341456b 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1865,6 +1865,28 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			#clock-cells = <0>;
 		};
 
+		spmi_bus: spmi@c400000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0 0x0c400000 0x0 0x3000>,
+			      <0x0 0x0c500000 0x0 0x400000>,
+			      <0x0 0x0c440000 0x0 0x80000>,
+			      <0x0 0x0c4c0000 0x0 0x10000>,
+			      <0x0 0x0c42d000 0x0 0x4000>;
+			reg-names = "core",
+				    "chnls",
+				    "obsrvr",
+				    "intr",
+				    "cnfg";
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "periph_irq";
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			qcom,channel = <0>;
+			qcom,ee = <0>;
+		};
+
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,nord-tlmm";
 			reg = <0x0 0x0f100000 0x0 0xc0000>;
-- 
2.43.0

