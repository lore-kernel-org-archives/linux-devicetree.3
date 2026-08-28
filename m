Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451E8442373
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 12:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920689; cv=none; b=vE2A0mjIL37IZ+OyERaQ2IXUVvL5xvXEOhHRJlTMYeEnUB7Nhg9msjWCiNOL2Siyp675rIJJMHt29USlUcIE/tNLWUhmbQfVgyRAgAUOUOSCDSpTIP02AYBcjATAUhiBwM6/KOTip0AnBNOxuV+edrullXXyUQcvPRC2c9geonc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920689; c=relaxed/simple;
	bh=AwIq7INJqcsRC1a42RV6p6IeY/Wi13UytuYaSpmIP+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OM/fxzZc9VjTJ6f5soNJc+EmmWAyH63lzEjKRdLf2h6ovCJ/lwz4ZkCNusuVcmdVrNbMn4EW6aSzMc3FShaT4STSnLQJ8qCE+D7SW8Y63QLrRydjlsyN/ehArvTjCsthKtT4CJOLm46yiSC+ZyKY7W+nBa0qox9hzQaArO3hcfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cg/4zbUk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F1GFBkoN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cg/4zbUk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F1GFBkoN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7lMe3306464
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 12:37:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Avm1zhBjr712kImDEfC8gqRkT6K0ce5T8Wsvl/bF13c=; b=cg/4zbUk3FCYpTpL
	sFzZgi85fxeSdCWNkz6sbfS9zVCTuW8UlO53y55eje2OgkgWwzQ2CJUaz1tNsjFZ
	NaD5a+02X11VLANIdcg35s7doh3MVVPhxMM672aP3Py13RWVkGzDbmYUT6KYL6U7
	+CPc8ZfyL/UatnfIJ9v9qxtS6IcX5TyG7zZ899L87FIymVZxWD0xyDxsAtEDls7H
	bh0fp0S6WNvxtHJ4i0GsVSiHQi69YHk/fc8GPAGKVMY+K5dn22kJVXABN9oCOh3j
	g8avrbH+MkMgbLnvkBn2j1uSLxG08xhyaiCsjvcpAjxwQgPBIFBfAht9BVQIM+hS
	C0tUZA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb42p9kvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 12:37:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52fb6c7b680so9175571cf.1
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 05:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787920676; x=1788525476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Avm1zhBjr712kImDEfC8gqRkT6K0ce5T8Wsvl/bF13c=;
        b=F1GFBkoNgT0h7EkSHR8OJCaoH5DiUDzn46CRlGSKDmwp6oNfc92C+zAsWEGx4y9DgW
         4iE39mPA5PEI0HX41z1UDOIDS0xV3vowM6VN3f6oADKUW8OItl4MmKj76gA4rYL6Wmys
         9Kbn73aMkmi6W0lZfKmOYdzdZJyo7JtQvCBq2cXNRLF7+l5JE7PdRC2UpvbSmHK66Bnc
         T/a7AF/hbGYXoDncTELoNC2qhLMsrJyLH8ew+rbWeTBjjE5h1NPaxRT+axix3DNihwcx
         HYMWUmK+r193NFCrEI0pG0y3mcXMyJyLxmV+PuFjBmJ7h8pg8N+BSaRg14+Tswa5iVM4
         CG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787920676; x=1788525476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Avm1zhBjr712kImDEfC8gqRkT6K0ce5T8Wsvl/bF13c=;
        b=KN8L6AmQdqw+nTb6PT1NFmRNy/mPM8JAbfVyBc9d5eT4vVbeSslWYLk6WhA+buW14X
         LvxjvQ+Au6LaKUbNzt8nG94+oAKesWtYdhrKUUaQVp9f4N9m9u8sh5GubVfV9bRSBd6S
         PgS9OsuBaMe1bmMZAv7XDwYz6YnVykhgdUR20fiezLGnDahxJ6oqOY1WxpCerrh/gfhH
         90T3Tz1OnPprix8e5oOviV0lzqtigNjsF8uxVZbBb08JYQHISjV/O4+HJLtmIFtY8HmC
         TwNLjVki62CtzEmkmJNxUppPW3+1Z2tYI5FPQHbvQ7NZQdtyeuGkiKnnr1RGieUUvWOH
         1Dag==
X-Forwarded-Encrypted: i=1; AHgh+RqTI/XUr8DvyRy5RRy/uH6IiSSSZ/ATD2hs/MxLmqpkIo59mB3nzQ0UDtpTo0ow+6aIScExYTzs4BPH@vger.kernel.org
X-Gm-Message-State: AFuF++nAiF3DiPdPGFp6hr6cN2os+XmjxMySJ6ie4sMay1KkHojOHA5i
	YvXVW55wc9WpijI95SASGQGd+5VoImLKHzvtY5QBqWQSLKU9vNhP4woMov+nLzp7ffPK2BUVrzB
	2Ia+EnzbEEmLxoaot9pmiMN5F7hnjRMAJ6jauWdzdmdHuW12Ikwd+axbhLjg9YjKTxXlqT8VR
X-Gm-Gg: AR+sD10yxp0sGvqB8NiZTetuFO7wc9FHFuHTw8/88NO+N0waca/uMgbYn2fn1Qsg5s6
	vfB7/66OMsRa1noGTWpGNPckmX9il8E3rhpPpuoeZBfzlh6IXbLUzFxqS4OqrAFQ+RzEg12SIjv
	xfQjrT+rVpTGnkfw8Jwr9+yIkk+zYvIH5Ri0m+diN9azZWJqADgbV5Ho1dE97kwTS25LdgCdlMZ
	TOem+isG799jas6PtLfQU3xVb3s/XEbuU7CVyA0kkVwMjEBmhva1naGnw1xaZse1gwGdzPJJUVh
	fTX1x5Iy4s+Y84y0yS23Ad1q/IZlghShy+JoiFkDOR8LXlQTIrhMc6PkJGBIYQDHa7XpjF3y4lI
	BYw/A74k=
X-Received: by 2002:ac8:588e:0:b0:528:3471:937f with SMTP id d75a77b69052e-52fb9651c61mr56721661cf.29.1787920675779;
        Fri, 28 Aug 2026 05:37:55 -0700 (PDT)
X-Received: by 2002:ac8:588e:0:b0:528:3471:937f with SMTP id d75a77b69052e-52fb9651c61mr56714571cf.29.1787920670500;
        Fri, 28 Aug 2026 05:37:50 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92671c0esm39338965e9.2.2026.08.28.05.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:37:49 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:37:22 +0300
Subject: [PATCH 03/11] arm64: dts: qcom: sm8650: Disable Inline Crypto
 Engine by default
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-b4-dts-qcom-disable-ice-by-default-v1-3-1d6e0c2f5a69@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2844;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=AwIq7INJqcsRC1a42RV6p6IeY/Wi13UytuYaSpmIP+Q=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqkYEMTQQVWrgBFtT5bNzblWGZcuyMDCLP4Vwtu
 /m/dXIZh62JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapGBDAAKCRAbX0TJAJUV
 VpS3D/9PMnr0sjkGyGZ+TUoNe0a0/3R0wJqCYp585omGz8YSlQZ2r6uPqp29jDhd0jBTioT/rpn
 GEz2iq4MEs5XSML26xBTQ14kLUZ3kWu+OBhq0W4I1acg5xB7AqjqwJcXmy093HobHQaISJig4z6
 FVT16PDSMvFo/G3tkOOSZB9cJPrAYKy2LsLK+cBxgpwhwrWmvUFyvHQa3NcuVbEBtq5Nw9uTa/1
 3qsTTyjhjk2KPicRzqSSdsSUBg8sNR4my2WcSNkVtJMhX7CgsjHKwrqIJuvR0iUpVu/GemUnWf/
 f5q7cVhaXw2OfrbY9iNFZdh8CntF878PsS6IcCYI1vxpEnfSB1Ks1JTeBpsiFQs19ax0/BZrWM8
 oEA1RCSY6bTDndAu2R2m2KpVhbHcPUWGnEIiK7YWSkl+WikQD6QshI44Nde/QdJS9MYE6X6XNvU
 nCAkU69VkqAKW/OGeQe43Zs827QQ01NK0rQgRLfxeoDjyG2lPtjXi3RF/vyRHtVrCiHw9a2a0eK
 TF2mNB5ug0Rvkophi+UBNmrPRONUvwTOQPl9+KgGY31T0xQHb+IIYBleUHwmVNwn37w1pKuQll/
 PE9Jp6S1Up863JeOIKd9rtKPLHSnkYk+ApibYhDzHLw6Vn5mZgH5GNbSNTISofZnOWf3P2QoTP4
 bZ6ZHfwDr+TUIsA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: bXQsErEaYVmRUF0HG2EnYjYOXGyRG4zZ
X-Authority-Analysis: v=2.4 cv=ToDWQjXh c=1 sm=1 tr=0 ts=6a918125 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=0aDugNF8HWkqI1xqGi4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: bXQsErEaYVmRUF0HG2EnYjYOXGyRG4zZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX4krrBpEuAfKl
 ezsWQXkL9Bu7t1z+IQZdjN1NCI8joTakUsya2wuDVaWlw3xmpu16E+aTs/yYVxh5ZBJ1t6amHR8
 WRWy1XaYwRVpxWs44Iz5Itwem5dnQk0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX7K+LK5MyvXbL
 aEuhHDwjBgwyT2BhxsZk9+1swknPSvHvbjHjNygO4PazLslOujcU2zAKK0YjwUuHwuH6y6/ed1H
 NJLpKHGPeumhtW5R+tvRkvmI54OreKJTju/OA3kmGOtZ5hyBcg4ZC1j7XP2xrp+ayU64rSb8Zul
 PvFs30EpaTo00COpdSFN/Wf3ROPO3MMenZz/ty/NaAA10mGg4+cPpfap0tA8hCDCQd9LVlbh6GA
 C92E0N7EUPApDkwCPYSkyXbvuXDd1HwRXVwKXUG0xfB+7bqJY17e7aooOmciU25Mhzly8bJU5XR
 MXqr9kJGs5UJZAsrVr7bByz1CIsAASUCoI7uirY/nNt31Xpv5SbjjSvFsFiPEb+QTgrOYCqnzzv
 KiHHYXoy3MxO/qBJpna/gCQJ04o60cTlv7uDsiPsm9MOZmVRrx4NV9r8G/YeAM6OB6gjLHMDEUW
 Y+XprGzcIQrcTjZiciQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280109

Since UFS_PHY_GDSC is attached to the Inline Crypto Engine and the driver
does not currently enable runtime PM, the GDSC remains enabled while the
device is idle, even on boards where there are no consumers.

So disable the Inline Crypto Engine by default in the SoC DTSI and enable
it only in board DTS files that use it.

Fixes: c62b084d5d15 ("arm64: dts: qcom: sm8650: Add power-domain and iface clk for ice node")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts | 4 ++++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts              | 4 ++++
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts              | 4 ++++
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts              | 4 ++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi                 | 2 ++
 5 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
index 6ddf30ecabfe..1e93141cb754 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -1053,6 +1053,10 @@ redriver_ss_in: endpoint {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &iris {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index 41d0c7edc433..79594d6ce9a8 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -973,6 +973,10 @@ lt9611_out: endpoint {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &ipa {
 	firmware-name = "qcom/sm8650/ipa_fws.mbn";
 
diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index 26045430d34a..129f77e1b100 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -585,6 +585,10 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &iris {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index 1fb78588a504..6dbdfe6b8fe1 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -946,6 +946,10 @@ redriver_ss_in: endpoint {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &ipa {
 	firmware-name = "qcom/sm8650/ipa_fws.mbn";
 
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index b679fd8afb7d..384aa2203dfa 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4142,6 +4142,8 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc UFS_PHY_GDSC>;
+
+			status = "disabled";
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.54.0

