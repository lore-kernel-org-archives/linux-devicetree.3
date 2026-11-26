Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688491;
	b=3hyc7cvtsCmx/ztGpn4zTanPGPUrG9Wh3UdCXEHPrAbbuEQYNgNZJKVCsKbOj/6QxnLw
	 9Y5ZMLjnaY5jarbJOCpWAtbhEoNGlOYTiHXYEVlCvH6lHAT+wp+UPSxoTC+On83M+c3+a
	 qZr1mRVN1VTErYK72N9EnnSzX9Wjzq7mjxvB1/Pl0/n9wogLH/odtjoaVRTmNY5K/f1I5
	 aeyOjouWFlF4QBWkkBWce/10vVmFaMkG5yoqHKKIPcG/rKURQwYQgoW2VTub1riQ89CYV
	 V5IXMESESBdTymqP42i6joORTQF+aQsRDZh6VUsgB/zwNmwk8j/0kHUoqLI608AA85w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688491;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5lP+raEuWnaY6dQL0h0eVb/A+IxLsAa0Xeo8m0ojDgI=;
	b=mBYfTMfxInwTB5c1idhJP0lAsv8zVP2jUfotbUdAEnEqUKGIWLxhQ0ZVYEGOW0Oef8hM
	 6wrFhi5PS+bRZVk+NC2Mduj8eoit5c++1GqBgbz5SdK9w3Wo5VJdXrDsMKKII60bYpVAp
	 DUG7WuRhPsYPtLRl7YVDdFzx6Rs0Gur13xbpw4wrQXqXfwUMoxYXVSucr4ZEBttAsdLoM
	 AUJqZCTXU5PVVvwb2Yt+AGAabHkdWBvD8A7osKGwdc1UOPj2m0XpaCelES/QfoAyz/o56
	 tUJYjWxfUiTEGIFbuL7Q/mF2VY10QyJS3MBvJnBEnpWTR+BC043zVkfXsCqvowLDLJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DV3catHK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T8SVbsqw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EBE606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27EBE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DV3catHK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T8SVbsqw
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7j0Up131130
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5lP+raEuWnaY6dQL0h0eVb/A+IxLsAa0Xeo8m0ojDgI=; b=DV3catHK2EEvyBgB
	mSBClzUFOg4wvGJKKAxxJ8MSP2C5ydtLPivZJrNt0X7gnaENWGz3bu5sRps1lkz6
	xs8/idykVHGN1WbXKUVRP0jEO2yvIA5F83hQB2FGN3Dqa9MBCnossnUnWnUtcQel
	kn73HFAV3gjZq58zYLc9tFeXoCrDK9NGGpldG6A0KauJtPmo6xreG3TfLWK7z/3v
	tA5yFqB9zAXRJ/2wIrT3uWRFrlExw0XzM/tfgpeMe35VPnjCDd1MJroms1+nfJQX
	c/25l7wGRPBCzoqFcfGhvD0NzL1P/e7YjbaBCQfECe747lssq3aPuePdwXQ7JUDQ
	Swi46w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6gne0kuj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:21:28 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91b937ecbb4so112189826d6.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688488; x=1796293288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5lP+raEuWnaY6dQL0h0eVb/A+IxLsAa0Xeo8m0ojDgI=;
        b=T8SVbsqwrbKc5qkV+/YvmZMmQCZbKBkUr8uS2ubrONjzwrGZXf7wgPmtEpG2Rz4irq
         Cjd0TxiuPZ/6sJ7kP+2oArsn76UZi8WFbWWBsEubh+UGaU8JzcTV2LPROifage7MvutA
         IVaa1+B7ZEZuDFUdciLYvD3iaMQyw8IOybMGrIoo0OxM4gEnq6qMzdMPOSc+MujzZsfu
         GzqsPCOxxRPimaKrHZnFdFjQxk8PqdIdK5bOPUNAwcO3rWZUvOf840p1pHUdV3Nu285a
         8wa20+4Pugker+Cd/RqyaddR9HQVKMBaCdRbhp1IdrJIWJ5HTIIYwKBET5kL3XNMorWW
         5q+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688488; x=1796293288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5lP+raEuWnaY6dQL0h0eVb/A+IxLsAa0Xeo8m0ojDgI=;
        b=gqadwo+mu6GIM/qiNIvr/M+MLw4gFujF1UHCCB58bJLqhAtAoP9pL63z1Pgi4Jz9ci
         3u5XWo0PUHUmFwosM8nrb81xPJ9DsgEggd8kHDrDBifOWrICvDqE/f0grFr8xNRY4QKg
         1uBpyZWT1kP/09gVFJhMKmj+O1LvLSkuZn9bPNIQGFVpjJMGMy0dZCtYZ6aj0h4P3l4y
         fLD3VbspYErJ9EvxS8n/dAMnnPomoN8Ktd8DKKh4vxr98YrssZMtZgdksWKOS2SUIWB+
         TQDOsQ5Z4zCvQ5gxyHFVgT6On305ETLN72dOqqnbvhwK2CzwvCI+4tCQijJa7rU+RGfD
         whrw==
X-Forwarded-Encrypted: i=1; AL+hErE21DRkJeGdoCfINxcmITBDWIJn2dO7Vkqs2PnmdBdiuEFYJdDK5ESYvC0nT0EvXTj91NavmZ4RYMfQ@vger.kernel.org
X-Gm-Message-State: APuU4Z+fqknEHiTm3fwKhOSCFxP/ZXXFySj0Tg43mYaQAwz3tyiTU1AU
	Z/oRuGTE2xq2KXy/rS8gsVwL2NNkGhunexC7cLQPUEF1a0rm8p3J61nP95Jc5aZcSMoE4MyVmqL
	Ow/rNdz/Tl+H09yZtHP+baX7qj5VXoHcjNfuEZfWuGs9HIbLYsU5o0UJnHQrSE1RK
X-Gm-Gg: AZFdTZeZTgKUUPnq1dv5q8EULwvuruln3izmuLksNn9Lss2foMN4YFijBk55LL+yRne
	QT7T1/Qi5jYwWi1CK0pAg0CN+JScOAP2599Na9DvVwdi1Xf4mRRDdBIajCSvoVFEmLKtfsxcIjn
	trg39XBQB7YdbZBMyqhjNARDn9tzsqw+jaFT1S8wcLUnyNT0NfMTy5mxmmAbzxJwt2+Yq8X/+ob
	A892Y2vNtra3U6RqKZDFAj95dWDrbye8wgb4rYSbMAoydf2UkvWFIkvWR/8OylmATCZFjby8+2n
	o8z2Od4QxglLXOcPYuH0TlEWWpCqOyc+VdZNFxxcjH0VxkZWDORTvITgVV5q5ZylrMPi22QkIzS
	AxjXjpxBn7md12YJDK03yJT9stDHqAwV+PrI+eHGWgYoijHA2soZAxcftep1CQqgBAvbH4Mvh2u
	skErHua3sfRYTXw0KCFiitpM9t+FNWgbinVeaUokpNuB5PKPmXJ+tZZVPoh3h7vYU=
X-Received: by 2002:a05:620a:6605:b0:947:920d:662d with SMTP id af79cd13be357-949ba9a2e20mr3644086485a.35.1795688488480;
        Thu, 26 Nov 2026 02:21:28 -0800 (PST)
X-Received: by 2002:a05:620a:6605:b0:947:920d:662d with SMTP id af79cd13be357-949ba9a2e20mr3644082685a.35.1795688487999;
        Thu, 26 Nov 2026 02:21:27 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm658817885e9.10.2026.11.26.02.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:27 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:21:11 +0100
Subject: [PATCH v2 07/11] pinctrl: qcom: maili: mark egpio as a GPIO pin
 function
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
Message-Id: <20261126-qcom-pinctrl-egpio-v2-7-521fb057d3bd@oss.qualcomm.com>
References: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
In-Reply-To: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1185;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=XdvDlbCAk7iqV5eoscMe27J++gdDxDTseba9eYIiNzM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCAgTHAxokGPkdXri6mwNHZ+wvcPxZQgRAVQsz
 7nY/PRemKiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawgIEwAKCRAFnS7L/zaE
 w5NuD/wMfwUHkR/OzGsE2NsN6pjZTv/Mi3HKrUn7PpmuNhA0WPy5guPbFyWtO6k9D13JZMvT9Um
 coZ4G3CKFhV7PWbADvx3O4IOTlNZz+oJXkHvWd6YlcxoGMW+P5hnv89sNoFqLgy8Cd3lX5DrtEq
 uEMYxRc298VGxy/AVc+Ry2rDE6PGT2838lgvOmI8FLLGf2SAvajBld0eLP+k+BbQExVDSQweu4c
 R9RjTJbpP0hLn88Jj2LPyK1buuIWAT2T2NY8Uvr6qUqf6pkrAeLGoaDH/dYvvpdZYEJkMwI2d96
 opSSUqkmqlM3c+dW86Lcj0LZvFmei3ieTRUUNTQoDpRi2apxM6EA5+ngsnoo4AOobhtYG4qK52Z
 Zp5zlKM4Jvc833Bymix3t4sQb+0bdBA/PIhYSm1BrYchV5hsbsOdA/mIWPuguwHAPjQbgsLVLut
 X5Xa5utj6uKk02zuFm4yx+7RX9AxzT+2wUPNkz1ZCTmUg+SdfQuvQ0cMMo19Q4MMJrLrfixRzxF
 1aoqLuJ5rkgE/gdnqJACyHDVQdgWBe7ZGxbZUNhyM5FOhe8PSdkpjwD1o2eWjZYVQN2DdGT+g+e
 I4DSrWjd2/RpJ0EPSUsVrNETLOTqnNkXCMpByP/oHE80TgMn3ttIF8LzcNTAmu/kiRDcVQ45k2G
 VpJai6BTOByx5ag==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=XpVvqlF9 c=1 sm=1 tr=0 ts=6b080829 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=rzi1cwwMUWT7pCUy_hIA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX6sMwlhoA6dSj
 cx37TKyi+pwgI705uJnKeNIlfnVShTvxi5u6m2PAkQEfLFWNmhLPvn0HBZq1aCjqN0ghxzQN2Y+
 GpgraIy2QTiG3PsA8pabU2XRdmgIZ8JMm1U79a5SKci4cCf7FoMbUpqaQkGIUqGEsvvApR4QW/d
 tyHLbKegkE1dvihg8pKGJjTfOr8F7v/apaFhTOIF7MPPMEqNKNgnBPcX6cN2YeZ1S2BDL6tjE7o
 /RGCIZIGsOmijX6ASoM599FRSpQ/vDfHulpoPGq9pSZKQHXq5VwOI9m4Ls/bsCuFs+Dd3s+q9e5
 ubS0i80L4zpjqPYVdZmkRqAWFQj2kSYn9b4/qUU48mPM+RYhoylN4nrIqMDiWM0+dBSAGgZKKgF
 dUqa0uQI53LOpJSt+GMdm9atdkQxjgCDiEyfWnYvrd9KdB1pHLTmGlXKxNudzKA/vq3J9j5msQq
 ajcpcLbUQl1OZn4uRsA==
X-Proofpoint-GUID: -QIQ2_qh9BvOhPjWhRLcryd94ff2iU7f
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfXyJaekiTUJXKV
 JTTaVgj+GtD5/ak7MGRzBtMHo5p+lrm2h0fPlCqJ8fs7dFXvDRbSmXfl65FRrV+1ZRVniVn4amc
 FcAR4gIOhSL12sHSC9vkbFVSEH6eTBQ=
X-Proofpoint-ORIG-GUID: -QIQ2_qh9BvOhPjWhRLcryd94ff2iU7f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

The egpio function in the maili driver is registered as a strict pin
function. With strict pinmux, a pin muxed to egpio cannot then be
requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
be used as a GPIO.

Fixes: 251b53103a2e ("pinctrl: qcom: Add the tlmm driver for Maili platform")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-maili.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-maili.c b/drivers/pinctrl/qcom/pinctrl-maili.c
index b9ff0f4479410656cc73567ed494a1cfe25bb56b..5b75994134238a263856ea2c0337ac196867b767 100644
--- a/drivers/pinctrl/qcom/pinctrl-maili.c
+++ b/drivers/pinctrl/qcom/pinctrl-maili.c
@@ -1226,7 +1226,7 @@ static const struct pinfunction maili_functions[] = {
 	MSM_PIN_FUNCTION(ddr_bist),
 	MSM_PIN_FUNCTION(ddr_pxi),
 	MSM_PIN_FUNCTION(dp_hot),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp),
 	MSM_PIN_FUNCTION(gnss_adc),
 	MSM_PIN_FUNCTION(host2wlan_sol),

-- 
2.47.3

