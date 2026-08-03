Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CD3386422
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 10:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785754034; cv=none; b=Am2V7Bs/gOG8bYRVy4x6K2uoPAgK9EMUmIIf1EdgT2jjr71VEaDE9RP7hrKCCtQEDpLlh9DxVMWcxP0QmbeJKLvR1QDeAD9YbO0ct6iQFM6z4Ni8/eaA32bRMwP1rrcbr2S6hThbSWezymtL0LgCGwac+bUALWHaeDtBrHN3ktc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785754034; c=relaxed/simple;
	bh=bloAeWS97IJ5qqPAdt7nsKjEyYSGak2VI2PPUR8dBeM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OaOb/NQ42krvZtYVEUbn+UkQgXvWmq2ZVsV6dl8Y6txpCqs8eGmjcQPBVu2efOHlv0Kr83y63sHHhUZiDI8iOvXwsMU1YwOVARv8X2PvmH+Fzp5NFbpfw+aCbmk7ms0AOd947nobPnj6+hGIw9JLoDxHP9vRs+hn09KUeW51hVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TSGHcJqo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q7qJWFzJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TSGHcJqo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q7qJWFzJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736S8tw051899
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 10:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tdomSG4cINgdN6XeSewnH69cAoSAj/JSssxs+ZUxKEg=; b=TSGHcJqoBkHM8Hle
	SLWqnE+KCrjMNHYsoybUFK4xFnfXcwb/kSzLpeOLr6VhEb1un9KmumJ6Ij2QDN3T
	n3uPlzKLii2S0vrnXpbGwVBllZZRm6xjXFf0gld3be37t1MUB7ASjtrGVEvkk+3f
	BLgqoLrBRc0lXJhiKvfO2ifAdYJo697EqWH4CyBWT3MEw2fiTCh+e0c0GRpleNF7
	CLge17pzUWU4P7fQa3R59fOZkVQe8P+xD6llkWiQT+IiSlsSNfUAgi7VZ8uUP7OJ
	4aF1aepeEPpQw477EvYbfUfLUA/SamggBSPMMwTTqF9vez+1y2vUUF3nfFiM6M8Q
	Lq45Yw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrb93mr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 10:47:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb7d6ba548eso4168556a12.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 03:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785754030; x=1786358830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdomSG4cINgdN6XeSewnH69cAoSAj/JSssxs+ZUxKEg=;
        b=Q7qJWFzJpuf64PHfRSZqdifIdujX5ZVAXsUs9d3385qsXT/PE9TeeCQUf9uBBAoey+
         qZtPEqyofiTfcUikQhsv/C7byIeK6remxO4g2Z6erTw2+lCojv6Xee4nEX84bWz4hAXN
         N/oUV33r7OD3anJ1YMAqjXLn+Nox7x0g+0LjccXcQS3WGyApZqVHtk/CEUH12nmvnDNm
         oP9nJ2IuIMdnbUB+TwbkrhNAZHZyLbsEGFzCVqPvcNhRj+hTI/2LkG3Uit4sW8mQYCgw
         vuz1FXcppf7s3k1PFMVoYGH1kvABVQigGJVH3DFgWkQxoZ7uIFdXMnIx02RIc1eyylbc
         20Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785754030; x=1786358830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdomSG4cINgdN6XeSewnH69cAoSAj/JSssxs+ZUxKEg=;
        b=Nxs9TsTkc9D+vMU94WH8gF6dKRPsHWKF7UycIfB4FXLqHmP2I2YiG7xHAFsHWVI9/N
         Yxh7Ob9mzbT6zskixKs4ISHuLuHbBuT8HzlwWZv6AU5Axiyc+a1+aGcKb8eo6WGfRssb
         wt2e7BYc0kvr10OsOl6BvZS8BKAJfdQh8fq0EYyj0+lunNkMQjwF1XBkxA4cNZlKDm3E
         7ybJe1VMD6ZXSEX+UdtR5lKraZD7xe6PzCmieQjyvIKjyaQ6ARuw5+Uqt9Z+zyJzXKG5
         9h1bogVbgKNIgmUWRePqiB/DzNR+qgiyHIi9/NtxWT8lEE1xpBsTc/vJIaXnsGdAyck6
         iPTA==
X-Forwarded-Encrypted: i=1; AHgh+RrlzW5IivCG98ZS1PyX1vvO4RAtvKkj29ExJKLlwX++l9xxvEhr2VdJaq2AWW0gfuJ1Jgn7giMg9pXO@vger.kernel.org
X-Gm-Message-State: AOJu0YwKFtMXr35BzcNE6nh2BxQ4mIGqzVefrteJTR9uDXTppUv5DSHi
	ZZ3LzERdolhc3yYE36RHbX6fA6LEyYEkci4Z2vRmLFEPfS82Th87bDKNQpqJqV+LkzezQ/n0zGG
	HZ1oVabT7vsGOBTdCm99V6RRC6iVbbkL8XBc812649r/CAW2ZGP4MVHxpm98hoEuw
X-Gm-Gg: AR+sD11Z0QUf5X/ICPELGgtu4EaO7YH60nq3LxCUgTtvHGK/anNfi1EqJ/Bb7GzXmmu
	OGNvuBruSVOBkACbzUQk4v0z0MCjhhOHEpn/yeLotFQpJnTbwWODw9rkrCc14lhGK5R4hAXmXh7
	Vfwtx6rVs6+kfDQvA9h8sdc19DgIqBPQDSY+wYN64Foo46xB+txrrzMM4bostkawkIYlHux1oma
	Nk/jUCjJqaQMx5nfRK87CaHshbI1WMrApWKl2MWzO2EwE/uH1+7Op+qTu9xHTAQLolUBaVEgWBl
	ai/ftNPlASDEf4bGruNiDZFBtyey9IWp53Dl64jxc7uWEAsg0hgvk4wIBvKkXt1f2oQHbkgEy/a
	Fq5NF4SfaIgqtZZ9fro23qgJSD6E/txfFM6B2EB+fBORbQ5ImOoB0vPw386+SVNY6xp6G3TIWx8
	Eo/Fq1iSEmthL4rDRnGvLw7v8sVW48VA==
X-Received: by 2002:a05:6a21:6cc4:b0:3c3:8ce8:203 with SMTP id adf61e73a8af0-3c92a8f3287mr8929322637.50.1785754030617;
        Mon, 03 Aug 2026 03:47:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:6cc4:b0:3c3:8ce8:203 with SMTP id adf61e73a8af0-3c92a8f3287mr8929304637.50.1785754030211;
        Mon, 03 Aug 2026 03:47:10 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm29993730c88.13.2026.08.03.03.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:47:09 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:16:15 +0530
Subject: [PATCH v14 9/9] arm64: dts: qcom: ipq9574: Enable q6v5_wcss
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-rproc-v14-9-a1f87b0b0ad2@oss.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
In-Reply-To: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX5De1FIFAQcDY
 mSvvfqBvtI9pw4fuoA4x8JttlW+/w3x9HHimThHG0O77org8HuCNBLURfW+BpmKdDBPYIvh5ivg
 PwQbtKGnak+uf3v531VUStpn6GDIDIg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfXyM7eIA2qQlvl
 IwicZ/lGBMbnweCV5Ppd6ozZTy6sxrVnr6rDS53P4k89FZQqxUUPvDX0pTj7HmI3HMz5KyZRSrq
 cIskvHu3Af0670hssKoBAMum3VlDdMhD0Gy5Q6xM3agJtCcm0NNW7E1xIz0kILveYUd01DrRkoo
 1rn15863MdeoFRCAypaudsijHLIFpoICYmPzaOfSedLClq7tpL1hd+Uk5lnEpwQn3q9KoTUwAeC
 pwq0nHzRbQHoi2VrqC9ko8RCaqWht5FMmmxrvax8uYgbzXyoc9rtDJkK4y7tbTr4bC1ZJigH0I1
 eyjCC7ChgiVGv+kOO9ueijLc/gN3bUNeNcseKaHkr5GPj4wObwLUEbCrVij6qcW5wClkT4LkwkC
 AR+9IsJa5CaS5tmGANqDqvSk2OKf5dBqyQZunHi9W0oVy7pXZTb/RrPlLq81Dd765ubg5TMlN41
 tkOIeS/Klq4JcHaspNA==
X-Authority-Analysis: v=2.4 cv=RNSD2Yi+ c=1 sm=1 tr=0 ts=6a7071af cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=jH_bmcyh0L3YvPtRZzoA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: Q7QfLwtaT1virzCWeT8Gg8SuBHnMNyIl
X-Proofpoint-ORIG-GUID: Q7QfLwtaT1virzCWeT8Gg8SuBHnMNyIl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030096

Turn on the q6v5_wcss node.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
index 62877b46f9b3..494a150535cf 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
@@ -113,6 +113,10 @@ &cpu3 {
 	cpu-supply = <&mp5496_s1>;
 };
 
+&q6v5_wcss {
+	status = "okay";
+};
+
 &rpm_requests {
 	regulators {
 		compatible = "qcom,rpm-mp5496-regulators";

-- 
2.34.1

