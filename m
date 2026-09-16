Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12403587DE
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 18:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789583497; cv=none; b=FUPhIxT6WieQ+GqRBeOY/LJF4bU+xq1JKpVtWAKwRijgKhhGJyBwKXfogBuO5fqaGXiFHuerJwCQzVxeQXN7XfBUt2mPKp15OCPJb5LzvLFwPQ7yUK46L26ca5oz53AAQ414eT8lerhVXW+UgDxxAIRYSgTIhOhEuGbmQSCqJD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789583497; c=relaxed/simple;
	bh=ZPjbr0I+9Nvr8YjqDeKEPybP28k7tZ/cuW8owMAJ7nE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qnJpsz4B0/EVIw4B1801/DZjksyPDkkCYOgfxXEJy3IWPBFI1eU68KD7BMFEDC1HyxZ6ogZu/9dl0/QYwy4atDDK3Z1CQS7CWJtqZTmSpMyb8xafrmvl1IfzhIvO++oxp0HaIrKWb5wdaUZalxJ/40HrELUGgtL+7QA4FiWxC8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UE4W7/hy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Di7wkx6n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UE4W7/hy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Di7wkx6n"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFeQwM3107625
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 18:31:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TDs6IBDJvRRkHcrVDwCPA7La3o0tBeHJ4+WVchOitCc=; b=UE4W7/hy8WJQV2X0
	FYw470OcvcvABuEZ7QpQEaKHNnVl5NF5AC6f5xRdozc6HIbwLWqBgC7q0vhYs8VS
	H4SBsIHJ9Y7mggkOqOSxafnwWpJR5alRurWvSo+U2rp63FtzWWuycCioKvtQ/xdJ
	c9hHIVxRav9SKNqXghm2IkWuJsF2K6OxKtJD0o1Og/jnmXar9M/Bb86zEAbve66h
	9E5P1GlAqrlCv1KGTVkozewhLbJDDRiLvYHST73xBSeO83kZLKhYW7T6sKPEDU7o
	bD5msNdKbfMbYYQH2bdorYKgKWjcNwk77EDoErTZa3DtdYW2EIe6RfcL/cDF70ae
	/+D/zw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquw2sf4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 18:31:13 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c82ad4977dso6524933e0c.2
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 11:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789583473; x=1790188273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TDs6IBDJvRRkHcrVDwCPA7La3o0tBeHJ4+WVchOitCc=;
        b=Di7wkx6n5DjgqINUZ4sMHWJcHIHRrkIX9LbH/cUQTtGxVxJBGG+5ciUJIqX5BFzBlt
         F5tQ4qz9MifsSsOnfPVYkWDOw1/XRkTqvkor9l4rxt1s4j+tx4tp8YhVy4+bqTwQgYFy
         u4FKOryMMMH+1LyOLRo8WfpvqTJCvoWKMoschIgiNc6JmglR/+q5j7YLsrE7MVSHIl9B
         bMLwryBRdFxcprRL8Lf5E73MK6HtjqikHWpPoKR9rbZPlG9s27dlH+AG5rNvfbRUAihn
         15HQDIZkUl25sTGnvAcwpW9RZ1gXvk5t8bqUU7wl92TZ8uIwxmWIX9aw8rpYyAuE2krq
         i7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789583473; x=1790188273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TDs6IBDJvRRkHcrVDwCPA7La3o0tBeHJ4+WVchOitCc=;
        b=ffJt2D9eveYGQtvvBkZ4x7TspVDKq1uraEXcSsAx1GzkbOJWE4QoxarJZUARnvPei+
         1TEwcaZh9CH5HB1V8i587Q894dBpdNuzChaNzykTACskyqaJfVCgqkAyMVfFRqwATdaF
         68BJBMOGSFP8eCL2YHNTWPb3Hx4PcxP2kayW96La74HsVTwufyl8xfa2FNxSq8XYBpw1
         KU3umoyhyD1jq9cLrH4pRm0cjZL2Q5yaSVhkEh2dNaBBPCMRGYmWG0K4SM5oOZOoY2EO
         O+IPX4B0J01vK9tBzRtBQRcbVqFnJnEpfu+yd4iaCJFy1xhfkvmOvWE4pnuMyogQmV5u
         aI8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwkX5N9KzoWkGEapx+35EdiluHfzSzr30AddnaoYs1PY+1k+mqhgpy81Gbs8uK06e3qVraqcvsPFNJm@vger.kernel.org
X-Gm-Message-State: AFuF++nkvRpE5PAOaQArlDdNTFCFmpeMfV2U/s+nNDGdtdNxPIHYxraM
	N+3Yqk/BoDRKY/tf0fnfOCY0vAeTIqeWepSDb8nouznuuu27Xd5xoEliT0+gVbH1joUrjSxV9a/
	QDgARQriRkSaqQwCyubdxUF0h9o3PQV7qtFKyzxOGMzK/DyzrslTK48hZAESKbB1tQ3E2sNfN
X-Gm-Gg: AYBFou1uy9nJPy50xfd+oPbMEFXiIpB3KvngBswOVKEtHd8l6e617ltD4LYT7ZJHv72
	N+3JrPYJiy/b/nXeGFRX7KudluceSgVPwPv7CGAu7B3sv0yBNX82NSNt/Cm0LytA1b5Sb/gepAw
	HtFzU/ed28OCIrDq3DSSjGegDByBy2OlGkn1GkrwCTgiU8kPYYmikLoMcSa+a45Fl2THyGHVstD
	lvxnir21Nn09cu25L2BsQLWpbd+Osnj78Ef4u5xrSN7UZ0w7Wc36lIwp6Mrq+cHNi8zGvsQD4Ak
	VvOQOBiz/bs1oULtQfAsQJtTkOgu+8aRLV+ArCwaraOc3TxdBkcpbS96bRJ1Af0UZbQFA20Zngn
	PxZ4bVZ0aHIX7J+bPakHJa/s2Fe4=
X-Received: by 2002:a05:6122:4201:b0:5c9:a60b:e59e with SMTP id 71dfb90a1353d-5c9a60be837mr456812e0c.9.1789583472832;
        Wed, 16 Sep 2026 11:31:12 -0700 (PDT)
X-Received: by 2002:a05:6122:4201:b0:5c9:a60b:e59e with SMTP id 71dfb90a1353d-5c9a60be837mr456738e0c.9.1789583472427;
        Wed, 16 Sep 2026 11:31:12 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf2797csm8625416f8f.16.2026.09.16.11.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 11:31:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 20:30:51 +0200
Subject: [PATCH v2 1/3] dt-bindings: phy: qcom,snps-eusb2-phy: Document the
 Nord eUSB2 PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-nord-usb-phy-v2-1-2c8461bb30e6@oss.qualcomm.com>
References: <20260916-nord-usb-phy-v2-0-2c8461bb30e6@oss.qualcomm.com>
In-Reply-To: <20260916-nord-usb-phy-v2-0-2c8461bb30e6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1481;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZPjbr0I+9Nvr8YjqDeKEPybP28k7tZ/cuW8owMAJ7nE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqquBnwLg6NaOObkC5dpQgPcjuUaEH4gm0K9Oxb
 0/DClb2n9+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqrgZwAKCRAFnS7L/zaE
 w9u6D/9GNqNarY9ZEWJ0HcoJ13vYAmZFCdeWXnp7jyxHfUEW2xNItuyhZLgiijBpF6vds0Iejtl
 14x8sqOBsz0Va8Pf2X9YffqceCVZncXBkrsRNAbX6sQptgKuHm24Wea9dniFHqcVJocut2+ovzC
 KZN8ROPMyn1QcZGP0ZSHR9MHUlEZI0TVendzvAGgrU569t3LoWwzcsJ+qa1Z4AngVzJ82PXSaqd
 3cRttAJ2AwML/GxQYIZTvIA8H/8C/CrSCB/S7XdY7TDCHt9RCRUBNlfhlUjJ7NvAOLKhwda/Hwc
 d4vt9oA5DMG3lhHuw9FZDkAuRAJZ0ic/qL1t4I2nsRcOpaT+lrv/mykEYbFq2HuqTXmU/+iUrN0
 txqlpqfJpPZyi9rRQzRiwhNSc4uk34F0VIdq2CWZnEdI5ImFMhPn7YTGwBsGkOR7u6+nzrz7uIq
 vbuKE9A6E/kJmFyxH2tmGBo8JyStNdpzZ8U90ZgpyYvwZkwSbIf8HJQngLyK0gzVl1dBfG0WxzH
 sVwv4Fq8GonneDONOtgBPjol2KJA7BQ/QGyap5CqVP7t7AtpOW34kDChhtO/KTzSIbFTqf68n6b
 KfKejuAu2EcACD5gShft0Bc8StdjQn00ysxsFeNfmB2BixmcH3o0cJwFqGsIRFhgttqBy5si+zi
 580QN4Jxk/1WohQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDI1NSBTYWx0ZWRfX2o0bk1mZ2lO6
 1h1ui8vCtgsjcAqiQJpArfVckq0WuigdPvPI7GWw02dhyz1zZPe8Cbfvmx5Sa0yF5n2TfTp4AJw
 UsSfHJyJuI6gCwlcsD7SN+/Gx9czyMo=
X-Proofpoint-GUID: WsCOFzKylk_hgl_xR1E8DEsnKfrLZack
X-Authority-Analysis: v=2.4 cv=N4m8hG9B c=1 sm=1 tr=0 ts=6aaae071 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=M4M-QYXtbn0wZdemrtAA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: WsCOFzKylk_hgl_xR1E8DEsnKfrLZack
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDI1NSBTYWx0ZWRfX6d2rq85KPACd
 mHSziwIcdOvuKYXEPO3qR4gQyg+/XsBm+B2tulQnNfj15g1FocMFJE3YUS1ZKimOtxmSp7Phc4e
 3jn/3yGLfH0aTvIXyPjfE4T6Ni1Kpa7A01niRQKnncd01UUdq40Y0pCUt8MpBt0hKU4ZYeuCjAx
 WLTUAOyGC3kugseMR8eQFd3wbZfHOg+HqXJBv2jIGO+kh0lAWGQHeR5DMBgPe9Zs9FmlUlyAnmp
 vofBMjkqC5B7C5N09DeOojTNDZAk+lQ+1ti/g69bYEOLfMyceUZl+sXfYpRz3uBad1YbQefnxk0
 seyg1hX7hCapJETG8/ng/HzFuEAbeteDmrGhHqYc5bv3+dDSU9aWJMFmA8k7xgFwXwMzgv6wZP8
 /jNa7B8gw1ron/TtBSYFI6uff4WkC5AP3kbeGAAMFxw/vOej+eezScZGiOLau0eMV3rJoPnlNt4
 n6/P0bA4deY8vlBmjJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160255

Add a compatible for the eUSB2 PHY found on the Qualcomm Nord SoC.
It is compatible with the sm8550 eUSB2 PHY.

While at it: On Nord SoC there are three eUSB2 PHYs but only two QUSB2PHY
block resets: the HS-only USB20 tile has no dedicated PHY reset and is
instead reset as a whole through the controller's own USB20_PRIM_BCR.

Make the 'resets' property optional.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index 096f6b546632ef8cb83321961c7e5ff261db2b1d..7fe8c82db38d876a9230697103dd9467c49f6c84 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -19,6 +19,7 @@ properties:
           - enum:
               - qcom,eliza-snps-eusb2-phy
               - qcom,milos-snps-eusb2-phy
+              - qcom,nord-snps-eusb2-phy
               - qcom,sar2130p-snps-eusb2-phy
               - qcom,sdx75-snps-eusb2-phy
               - qcom,sm8650-snps-eusb2-phy
@@ -64,7 +65,6 @@ required:
   - clock-names
   - vdd-supply
   - vdda12-supply
-  - resets
 
 additionalProperties: false
 

-- 
2.47.3

