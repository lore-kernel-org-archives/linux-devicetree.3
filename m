Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452189;
	b=DE3OWMUtRZjyc/zWetiDuMlNlO32apninFxn3rM5Yo/rJYtg6J9IwlZHVIyfsuibvkxb
	 zwkH9g3wLYO6pv80DxWEwBhA7nWe2uGGIRXIngyGhj7IdmePJrqrN9+zYuSQrlUzPwI+p
	 X1NG2fc73EoI2X4fFbeMEsPSm2PI18TVmVkJuNDI6xqiOkf15btBsyNhKKXcIYf2Bgi/d
	 lZEybt0A6zQ2cXPjWJM2PUvqtKyej6Sc0Um6XdZDxD/hXaecYK20f/w3yvsu+U4u8ZE2Y
	 chSP3jn53941DkBRqREFGkhRKyGOevRvDI/9vPgvEz/11qwBm5yxlq5I8FxTgEfWrSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452189;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=A5yNgUL2BDgyfbgrWsnpUHmwm50nYFdr8TLu0kHo2HY=;
	b=tXqcKv81Ef8ZiSk9L1+HOF3+32l5ZcqarG8tXMoWw43sSMH0/53eaGjk6//WrZmVG9M8
	 W6Ybnbhzuq8tdmJgPw4QxT+jEVAXp+2faVYVKll/aW8YGU7UI4v8s/0RNuFQmDMiZ9wjR
	 HfkZzNffa+6EgDL8BtziY85OZI9slrxxOqCMiI1jc9OJ0EfePiIP9neuYxEJQVyGVbrVX
	 5P7iIataAfw+WQYj46I0gqbvphcx4PnoNW9iJdPNKfmSRCXOcJQpz6h9tIuqBzlPlnyjb
	 WwjTRRsZ3S1Du2oFRXUVVh5bBg/4XgirdizkvWKPBwaLtSmvTG66L0OiwwlAZIgbSUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jVaG/tJP";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="DXG/Q+Nu";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C910606A33B
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C910606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jVaG/tJP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DXG/Q+Nu
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGpq52769015
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A5yNgUL2BDgyfbgrWsnpUHmwm50nYFdr8TLu0kHo2HY=; b=jVaG/tJPi0r5azqr
	iTYujdKSSFZiF0oXoaHGBKaO6GK2EeqBYYH/R2kMDVLZJhFMvnvC3N/l8UjI0KM4
	lx/0zs4BV6JRBDoWACHFkH/UWq/hTNj4fdCCTrHDOIO+Wd54RPFyg61POHHB3P8O
	P9KM2OyBzCWox2oAa6WxHIcVQJf5Qktgie1qgFlAfl0JvOcPn7dQyfkIzsE5KO4G
	Df7UWLuBZk4LdwSGEUYEctt/DZksROF+bfAYjbhNygHjCaItPhji+MDZzwUc1E8w
	Gl07qsYMsDkSxvlJQ3RhVbG4Y2JggiZoGDnrGbBNJgyF7b3uHLhMebIS7XkI95XU
	1q8lyw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pacdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:43:07 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c82cf2652dso1388951e0c.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 08:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795452186; x=1796056986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A5yNgUL2BDgyfbgrWsnpUHmwm50nYFdr8TLu0kHo2HY=;
        b=DXG/Q+NuMFr7Yuf3I6NXdU4VD17Nww2DhT9CBq+IlA59etn7L9LJ4qSbLU5gb4kX7P
         GfD1tMl87Gjd25P02rwETrqP0+4lzVp+OaUl8qGB+Sh/z0FtBn7d8aG3FtVMFHwW28p0
         ztamE50DOdvSyQLNm+r18CNW1X/bgAT+vJDA8O9PFxCfcAZy60NfpSA9jucMYfQ4mgVm
         r42/QUuXAUfT/rFvFHhm18Xw0qkVNehETSlC8AgfxUE3qULF7rPyDRp1HLIL+3QXC7Dz
         vp1lNqb3+QCEcKFjFxI1ROkQLJsBBBg4MG+4nHa8BOMppZ2pxuLrZL+wADSQbjNqbfmD
         3CQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452186; x=1796056986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A5yNgUL2BDgyfbgrWsnpUHmwm50nYFdr8TLu0kHo2HY=;
        b=n1/+gsBYrUuVcsECBD8A0GXLY/glE2NgF6vyzkKF9L0RR9Q2Kqgprk4z8g77kAjbor
         uqaodzdlETSrIcwwJstt+RGhdnbT476RdYRl4YdUywUtfKRAgS6djCplts3uN/C5e78H
         PvDQs1QUwFKXJf43hJmjZmTtroD7Nj1jQlCOuN6a3xyj4bk3JacZm+1qGZYITmPidBPw
         cy3SbrP2ELwpOt534MT2SucSGlVgVS0DFn1m0je2jK5jlfE1Q93Q485ZjBb8SH5mulrS
         0BWrJngw+uOXG6uoGA2I88DDwtG4psZyMi3hoJALlHItHHaaLE/CY1qJ/K0sp15EobGo
         YONA==
X-Forwarded-Encrypted: i=1; AL+hErHpdUT78YMGkhVP8jbMtvuU2Oxzh47qEmRjQ+/YJvayfznKW6dA6MLB9CiiiFwmFu1ui2CZOEta1MUO@vger.kernel.org
X-Gm-Message-State: APuU4Z/SZSJS1tnB/kRFHYGt8wYir85PW7coDGiF23DqvRsBNEpbORww
	aZDExXCptbgtb6xMIAf1IKkQBE/iUPoFSv8QsPVEvSiGuamwYhKcVpWCf4ciAXQXop/lowX7xvU
	CVa8XkGAMCvjafb2jfcmWaT7HOTbPC3ZhNb1u0OPMsup94irp7hsVlYsmOgNwpToKvMcoaKYu
X-Gm-Gg: AZFdTZdi5o1+DhZQYKKbUFfJWxbyzLKqH2o+SWAsAb6v+ci2oX0x6k7gvs2XBQww0Yr
	aFVrhFLUa+UTkUzUREm8SkhlA1h1br+33DXOm8QAg0VisHcZ71kCFcfbE1K6b8SX0gANeaZL6m1
	yvRPxoPvCpd1oqQ2Ta47dWSppnml493YCg9rhlbyH1QmPssEIvzcNoRlP2wVcuqayas6UYoC2+z
	V2nNrngYN8/HoR/o1v4hSD32Uw++elge3OwVuv34S5DacNviPbl1Ylmp2NgnyCeePb22uwl4DFw
	Pzl+X75D9+yM7SjDsO38zCHb2HRipbf7zDlB18F6Qdv8OWKCrazw2bLTLPK3t1U74mFwztjHC4P
	2C8/PVpZtqbWo5ZrqqcbVnCLe7RvuPwiBl+zr0wQN7NyQXn9OSPODGWQw2TghwHi1Ee6Kf2DQaF
	zXiDTbYL8KJNOp
X-Received: by 2002:a05:6122:2493:b0:5c9:a60b:e5bd with SMTP id 71dfb90a1353d-5ee8aeff63fmr5452467e0c.13.1795452186338;
        Mon, 23 Nov 2026 08:43:06 -0800 (PST)
X-Received: by 2002:a05:6122:2493:b0:5c9:a60b:e5bd with SMTP id 71dfb90a1353d-5ee8aeff63fmr5452457e0c.13.1795452185869;
        Mon, 23 Nov 2026 08:43:05 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm426725366b.80.2026.11.23.08.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:43:05 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:42:56 +0100
Subject: [PATCH v2 1/5] usb: misc: qcom_eud: clear the enabled state on
 disable
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
Message-Id: <20261123-qcm2290-eud-v2-1-9bfc432dee07@oss.qualcomm.com>
References: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
In-Reply-To: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX6Baehj7foMan
 n3GBUajurc3RIpqHjsW1vCmp96CzNyIS6T7dja2yXjaNjHTEPrSN85ppMsLAzMiXesKe/oDtQrZ
 qhPbd6zLtYQl3IPZZgMB0o4gnsPkCMzBwf6gTUMdZfvCY8ME8vUegIjUfqDG4UKEzc3fYJMD3xm
 wmM9gB/70kHEqqUNJqCH0hNROeQGK+2Apq3B4Yffur3OD/4OB1LttQ8lRjLjRTlmG8GWK1RK+pl
 yv+MPO1htGX0qLJDX0yN8T4CG/DUDXNl/YCGqfcbs2eqls7JEgVrQtv4Nt3Lp5j4FAYfq/7ENjL
 EQ9cyH0rtVN10DL0eCuZObd4wfL/iJPuehMm6LqLJBBshfz4SSkS3P2dJgNMT26KANq/+ai8ZBl
 iAZAPT3IrMZNc8kN4ulOCmuQGrrIxCAfoqF+U7Sl3JvbSbgIpeDlmXaW4Sm7XNHP8nC+ro4oJbp
 hQKIp11l5HOT5lkDmDw==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b046d1b cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-IlMunDoKa5HfhwsZc4A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: lZN5eF1KwVj8k_DqulPNYzhgrDPYJeye
X-Proofpoint-ORIG-GUID: lZN5eF1KwVj8k_DqulPNYzhgrDPYJeye
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX+/+Miy1ThUgl
 zjKQUHu5w18Ma2hQftrnbiHgBYGl7Wd/E3iVz1z++/wQfYzyv8DOx6Oi3D6mHfE12rW9p+lJxhy
 Wzd754HYWtljTKhPwEUCYz74Yy/eds8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230066

enable_store() sets chip->enabled when the EUD is enabled but never
clears it. After a disable the "enable" attribute keeps reading 1, and
eud_remove() disables the EUD once more.

Clear it when disable_eud() succeeds.

Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded USB Debugger(EUD)")
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 73f9fac22e19..6743a1c7d717 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -97,6 +97,8 @@ static ssize_t enable_store(struct device *dev,
 
 	} else {
 		ret = disable_eud(chip);
+		if (!ret)
+			chip->enabled = false;
 	}
 
 	return ret < 0 ? ret : count;

-- 
2.53.0

