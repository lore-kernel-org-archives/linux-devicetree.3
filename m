Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA28951992F
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061586; cv=none; b=j3k0XpQyo754LSgXqVBqgKaTQvE6NyTtNt+5QscWPzEzfzjKwh44pTcwr8SOP3L/5ygv+6whtab3dlX1Hx2+bptT1NaHKDnU8HXoJDdn9iHBHfCma/lKoMd9HPKQBLXsL/WFGgPkIcIGnlD3W5N4mdTsJfIQk4i2XOolY0CSgYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061586; c=relaxed/simple;
	bh=VwGu5ZvOE+tkb1o3JLP1hcMC5C2pJPD8Wy8uCCU+jyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VkF6PS0LSbDZ17s1r38RB7TJMXckc5Fn8k8dNRYH0rhqWU+J6pH8TKiy1lFoDthvPaDITwTkg5Cq6vsEq9EiiSXj9R/1tPXaQAfVTHHVNVkfH/ibA0iGVImuSbawvMvY97ubH0wQpuGjRNDsH+hF8fbswCcuaei1FOhsDdukRPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W/2QgHXG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ErUEtxhD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W/2QgHXG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ErUEtxhD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jVrb2416877
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wHbDTnWl6ps1qUikyAxfHXapCd0y+/cU+V3jGs/ms7k=; b=W/2QgHXGhs6St1wU
	i/Y2fJ/zPfrar8ziSE/xeASY57iInYnOMiPwhPS3HQfiS3/sr9dExcP4d0/jCW68
	BRos3AtY+3yYMAMn6MnPSOGwSjHA3LJtHcMvJfUhobqEw2tFDCQgjGKv5ZoPjnM8
	1/GuwAhbVuaCeQ0ImRpGBJ0JseA0nM5+4RzhZLhtwvlckw0w+Wf5+lgdm13rA2+Q
	8ElltxG9/D0fJOyUo+socE3cw9oOb4Zzyko85nAjnMjNVg0hHCPMw+SMsh2bruMj
	aXxAcgDD53t7+3nu0SdeeLQ01F/4WP4abiApQfBxwEE0IhusaatBhwfbxkqTceUL
	VYvbgA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhhpx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:52:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e8ba4757caso31636935ad.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 03:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061574; x=1792666374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wHbDTnWl6ps1qUikyAxfHXapCd0y+/cU+V3jGs/ms7k=;
        b=ErUEtxhDVKfBYKijLmNKV7A8ouL5VDHWJLCRlcLi7kzHMH8mK1316xAoSW2S42G5ol
         Dam3px07J2+a94Jo51WIAYH+SE1RnIC6LpQl1r2qIki+kjlDwgkgu1lA5BU/eKjXIF6O
         DypYpR2kTWgqBD2HT49CboLejW8sAgpH6tsQeIgu3Jux0MsAYrdpXQy0zs2KRhK0STQB
         mWj6hnNlEVIW0BGEKjFbVeAOnf0pLIlYpYVIzXnPR9TF96E8U04BZfKtr12FQZkRRq6j
         omH7K/x2kxr4Q3TsCi6MLSaPUYTsYI33kOgOdMXA8kkFtZz3g8GW05bBwiI5k2rS1Md8
         cd6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061574; x=1792666374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wHbDTnWl6ps1qUikyAxfHXapCd0y+/cU+V3jGs/ms7k=;
        b=Y7LQKzkPOhVdsVtGoblw8rmZLU+HvgIY4A6rlvem/g2ogaUvOG2zjZG182QaAS1+HE
         rX7TIazEDF6t/rfv8MDIe/O8XPr/5MWq4l21T8cRnTJ+7X7K4Uk2AhbQ+TxwO+KKZD96
         Qwt53/LW9ColQih/1dVbcU6aT029lEA2qqzktAGwGWRffpEizWvAjTwPRB8vpLDbp/yX
         sKJvdYAcAo1+sV6Oicylp3sTT7Bg0N4jwvCErrXgkiHLpQffOEZpu9zH9nz/+gfTHt0v
         9Qjm2Bbk3E4c/n2F7yCXaPssYbUaf1XPOvoPXnhOQ3kOBgqwob8X5LgR4jlRsvTPOjze
         ROdA==
X-Forwarded-Encrypted: i=1; AKwUvByElQBHR+cRDgoJIhLwBf7RkyictEo8VUYYCKCTfjlmtunDYFOO0XMK5ZamBkaoX5dVli9rf6/DPfn3@vger.kernel.org
X-Gm-Message-State: AFq9FYLElTxkcVzmojej/HbHwSEQDcSJAatdGIbOvX+UsoVhGnQGtQ7+
	P88Vxnwa0UuNcStX2VuerSDYpEAlFrfaBKOSOH/YqdoGlEZNb7KHO9fqs4OCSgWFgeK3fYMRKku
	ZQF31JXy5dKTJB4H1eWEPb/76FaOPCjjUE1dw7Oz5/6s9cA35I4EYh4l7uYjLollf
X-Gm-Gg: AYBFou3Znt+ZXH9Luj2LL7HorvzZQde90O54JebBE2PEGTdAo+FQrxnK9nQXuaqkpR+
	/ov6/lioidVgz2+a0lO5wEwJGzCx/MgFJfeUYqXbJzNcMDwiIJKglS68vhLkKR47yRXptpJmm4y
	RPzGju6scguwnNh7dyXSRqYTCSa3sLbqsTaNVWQC7udnsTWlyT9MYje8ZgGAtSCReA+l/dVkVJH
	u61Qztz/3ZbG2XFtgHVfFPdvnLA6oruLQKw8XzE0r6lnw4MO0e3NXVa8YaiCdW11XNd8N9lrYX4
	lqSttMMZDXEAz+VLoQo0WhXfNy1rk9OICc1HTVipYrixdNGJ9KrR+OAHsdLHD0Ug/NRVx1lI3TM
	M2CQIZGBSjbb/D0GmSTeApXQJX8ubGQ==
X-Received: by 2002:a17:903:3246:b0:2e8:81e2:1d42 with SMTP id d9443c01a7336-2e881e220a7mr97847265ad.39.1792061574048;
        Thu, 15 Oct 2026 03:52:54 -0700 (PDT)
X-Received: by 2002:a17:903:3246:b0:2e8:81e2:1d42 with SMTP id d9443c01a7336-2e881e220a7mr97847145ad.39.1792061573574;
        Thu, 15 Oct 2026 03:52:53 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e95013dafdsm12770465ad.42.2026.10.15.03.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:52:53 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:22:28 +0530
Subject: [PATCH v2 3/6] arm64: dts: qcom: glymur: Add camera MCLK pinctrl
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-glymur_camss_dts-v2-3-e7b1f403146f@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
In-Reply-To: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792061550; l=1609;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=VwGu5ZvOE+tkb1o3JLP1hcMC5C2pJPD8Wy8uCCU+jyM=;
 b=ssNeWwp+Z6JPGn+9KZS3XrKGp9rToWKGr3QX+4qGvgYlS5VrXm62oQeZU+alq25Xe+uqY3a62
 +65h9wZATt9CIONXxO5+VzFIc8vzuwWJeEC/f4slfwgQIyaxXowCWZ4
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfXyRjv39SXVDIp
 XllhThnnUYeSOKNZJWzFMe+Lu8DXEkYDJpPWX0ylBNwKhetf3TlWKLSC4b2i+V0FlL2lKdpwCwC
 8N8Qyy5VVG5olixm9M4YUNjthoHu96W0McA3/7WMXfTsl+DRgi83sA3RgZDT5srieEvDk7Ta8KU
 SGark+PYfJpqgzDdLFaqw9y6JcjvXNijb+yr7hTwFPtc6gMymlnCJCZ3m5UCQ6YVVKeA6YpFoFB
 fCijHqH8hlZxhxS0HT5RJVt5y2QWXuX73mX+x2OqXkqHv8HtElL+9WluKNu/npimse0slTQ3/IY
 rb2FyiRO+LZCZi57hlTMwWfPzmTzdaf4iAXyrLHTn9v6Ig2AF81xv/H7kDkSPtKJKkclFV0u+NH
 clSXMYU3zLNSmEsIdRCRMjUP0y1es10RxYVsmKYCgfMAS2HEZmNkL+34/VEv6S00YzKokK8Og//
 QkdlhBYX5gVT89CvA0g==
X-Proofpoint-GUID: SzfINFlEFHXyjKjc9hPjk-mmctegzpKZ
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad0b086 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=XLrFv9MQ_WwsiHGvDjkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX31EnWuB1jb5R
 hv4fZ9E5+fXgMWYzaGDHVwk2yQCFCE7r6+KmkrgjApK/LPmuN7mrgKTFusHmsD3i5X7rLTH5b9F
 3dEbzZn+46gJyOh6ja4DJbfx0ch4zsM=
X-Proofpoint-ORIG-GUID: SzfINFlEFHXyjKjc9hPjk-mmctegzpKZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150043

Add pinctrl definitions for camera master clock pins on Glymur.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index fce3651c47f403e01ffc2a44d6d04a4abba1f310..e38a3cf5c9ea27e34f1ce312800965fac640b57c 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -7148,6 +7148,41 @@ rx-pins {
 				};
 			};
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio97";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio99";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio100";
+				function = "cam_asc_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_0_default: cci0-0-default-state {
 				sda-pins {
 					pins = "gpio101";

-- 
2.34.1

