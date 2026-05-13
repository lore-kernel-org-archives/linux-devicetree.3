Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FE73803D7
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686556; cv=none; b=AhEKCbtlMtFT7S/vo3il7+fPKBr4sEuqi/rPqMAz2cWDnZ94/8ueDNBqubYizNImrFiEPILLZJV/Qu6feFTJUd466ZQGCyH2yPZSIs+SvBbTJ8l4JbOEZWdrTBf1LmxEPFxoug3iZM/vrVxMZiIbP76Z5uhZ0TPLtgcbIYtzvkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686556; c=relaxed/simple;
	bh=rISBv32VZRJHCe3I/c+s75nTu40II2+RrJDUcL5VN/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q7Hh6eVO/hGEF65F/ATOmYoNGkU00N0vM6ad6D0bMYD1X5qFEYYVF7HUGs3au2j83ad04b5k5QyMh8FbYrWcBMASsds+axcg84jFgdx3gNq1wv9QseeGR0jW6Ot+PSpoouVNnkt50e1N6nx1yRqBsmAyXQnPDLAJ9ehyIrxPBPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bfI7l5Tp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hNlN5371; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bfI7l5Tp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hNlN5371"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVt4I1393180
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:35:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o2hoaXqlrNgqLFRzekm3d2iZ6wdlHEJPfnH8qVCkVtg=; b=bfI7l5TpYmN/RNGJ
	5r7qUCNcPe+5K07H3aNZj79c9cxmfEaqnCd+jKP3dskUGTrUC7RujbPwYDKcyL+B
	6dISHcattyRSGMoZdAoK/sCdA+zEtPu9p6QCoSh78hs+EqGvJOSrBelOZ3IWkFqF
	oCx7ZyPucvvRlLZlml4jk0wWGjx457XYo16/vQk86Lyn3+ymC3mugGkDPf3aPM5W
	ZSDXfYFhLgkgIWBAiBwQ0SuVWBXOT0tuLwcpw/GWzDOizG1+PiwGMAy8lXg8/XTZ
	ljJKrpM73PGn+eTUM2SNmj5xlhjKQ+ivmFIuy0nc2D6yQBlfxjGrZ3CDemdMh9B4
	45bZNA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k262d5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:35:51 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95d25cc8f5bso9749827241.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 08:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778686551; x=1779291351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o2hoaXqlrNgqLFRzekm3d2iZ6wdlHEJPfnH8qVCkVtg=;
        b=hNlN5371hXyypzL1bYpxCTLfBv3indYPfgZ6fSajONdqLXj9vw6ZWkqMo4tde8aEov
         qd3MEy99xTdEYfKozuE5YTJZaad0Sufh0M6vAOfdBs58Mi2vfUKxAzoFHZINARlzvZzz
         Jb/sdRGfP9PpOF2zP1YVH5KdgDzLIp97GrrFHgTClTY9vxLap9ZqqvGyN9by4UYcoMYW
         Bw2n0rqsyLsF2HzJ2FBQUOKTk97jj3RZKiuHMvbL4QEgWBqCPI8foPxdMMx22zQQ+OPb
         Lsy/t8OqO19dwVs1DCEg/SreEKpXl5/HVefU8gxf7IVZLxL/1a6m4+8TlcIvVTIswm0X
         AuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686551; x=1779291351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o2hoaXqlrNgqLFRzekm3d2iZ6wdlHEJPfnH8qVCkVtg=;
        b=jAWW22dJ7z9I5s6jZmeCbQ3Ckb8fY87vn4y/Acl8xsQbYMKvGJ/Kn4zI9jzAwmfXCT
         3gU9fcFVkDq2WSGHQjjwWax4ruo16wpUtzvmcXxg5b0iRZlv56tnkMksFrkYP8YDh1A5
         m0df1/ToEtS+Js5n7BxPU1agtRMC6VVb4IKL6nFUjWj8uay+69XLiJNWj6b5Y7kHtRBc
         a/utxjadvDIJIbx5KreWqpTHGQzEn+xymXIWbXsDAzFghWiUmZ5qqKLkA4IgBVUY76e1
         RgQcPqhMM4rwQDmHsBdMwS4tb34aDj2yhxppAvoplvdf9hkalYy7yOvrl80JUEvxAAfe
         EMkg==
X-Forwarded-Encrypted: i=1; AFNElJ9KJdNNXgaC9HKvyyNKyaO7GmcHmIMspN0C2nSpafWhpeVgXAbawFdG7JEoBC8tCAF9aCYSmoGRphAG@vger.kernel.org
X-Gm-Message-State: AOJu0YyN/6VMQ1SEjU/rgcsYi/9wnHsZK6Zg+OmcTK7dVnIqT7wkTJs8
	CeeAg7G188WOJJxSuULOgi/KwxPTtRxwPMKuzvmnhdalN99cx6K0irgRUpvE11VDwR5nU405Ri9
	Bs/F8WtO94762DTfdJJGgzpsGx7LgjHZSopRsABfVcbJxgwyMycfzUQoJI8PLZF1N
X-Gm-Gg: Acq92OHv8lVRdWOV4wI2X/oYQvgitW39u8onNLskhrm+hpBzp4JMY1hBO/GtRPx0k73
	9DlXpQpftg5Huw6EkTNs6/M8/CuDKatyxJn1dsdsLNWW9XYnNovMMW3HlgXv6ovbpjlWujeegM2
	YBWZmxxxEoW12dsY0fxbt4GIseggEM5rNu0gpNaCwcgJ1lqZyg5zVU34prY9qhbr4XQuDNluA5U
	5X+F0R5ygudfZSKg76FE1O5sYXwY2aVbJkBgdZr8fAN77eUJsemrYj7n2jCHKU6lOH7Y8y5VPQ5
	vP0dQvj6CtEvFHxhhP8luN4IzXxLIG1D3uUIQNgQuYBY1vS4Qk5Z+h4UpSLzIaFjE46YA09n5in
	rq44LqliWM7+F29Ig2xdORoiMGy/vptez5KB/aV21nNrS0d+iGQ==
X-Received: by 2002:a05:6102:5091:b0:62f:46be:8318 with SMTP id ada2fe7eead31-637733e7ec3mr2235653137.6.1778686545702;
        Wed, 13 May 2026 08:35:45 -0700 (PDT)
X-Received: by 2002:a05:6102:5091:b0:62f:46be:8318 with SMTP id ada2fe7eead31-637733e7ec3mr2235568137.6.1778686545109;
        Wed, 13 May 2026 08:35:45 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:63ec:4acc:c4f6:423])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f446ec6sm43165835e9.32.2026.05.13.08.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:35:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 13 May 2026 17:35:29 +0200
Subject: [PATCH 1/2] dt-bindings: clock: qcom: add missing definition for
 the USB2 PHY reset
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-nord-clk-usb2-phy-v1-1-8eafcb2d5129@oss.qualcomm.com>
References: <20260513-nord-clk-usb2-phy-v1-0-8eafcb2d5129@oss.qualcomm.com>
In-Reply-To: <20260513-nord-clk-usb2-phy-v1-0-8eafcb2d5129@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: brgl@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=921;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rISBv32VZRJHCe3I/c+s75nTu40II2+RrJDUcL5VN/E=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqBJpHyq62Fd0D422+798qtyGB3Qh1sliG24iW0
 MfNBA28jLGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagSaRwAKCRAFnS7L/zaE
 wzgjEACo+oJDN7R2y7DDlPZmNZDA7W5u9oOrcgYRMACpxRKh2fg6jcA+QVUKl9uGTBexKJBFH/Q
 zUEZoiBhetVUoiJEzW08YKrKE6nzPyjGlDsyGUiof+Js1pihMIWw6JVjNVA63be/cGY8alyzfh+
 V2lheK8sAzKOfXOZ2bTzH0XSpCDbAdPyj778eyZVLjmOUomvtfpK0JW0qNd6jGM8zuVVJFPiQow
 XhAlCVGJyBCsOtUxPmX79hCuDamzR4xgE8Smmohsc/jqUhXPyJawNqwB0az05eriNzSLZWy+A9/
 oCExbYcLYkwSPcOhleQ7jrZlFY/eYz0D+9QmLLXhiixSogn+l4cBTXeJt4NSxnsKN02Pa7Kl8hB
 VuELTCNL0sx3Gy0d4yD/lmqS+zr8a6cBp0TIaOccAVacVhJ3qt4+//J46lFNrWkoplZAYcqWM3W
 422/lBKeXkzny6WRBnMp3W1kwXdFqqaImBJgSp5rbz8KTrx0gLhQRbQYPf6PWHc18zvoUsM6fwY
 IZeaq4/DLOVw0kQMMASrJqEU5S3j/hzxf80fzCywcfPXVRa0ejjeszsob3KYr0cQZYc0+7ZFhGm
 xvD492PNWyeW8xoPKEidgPIhbklCkXXPrCvKG4LOOzfQTSIUL/ZSr9Uf+l7Xy8n7K8MqAbgxzzK
 HPtde6xutVbaxmA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a049a57 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=XZKVq7CPqAJHpqD8ud4A:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2MCBTYWx0ZWRfX7jnrYBtKHWbI
 go4tu9QYumQkXNGGdkLDugIOl+CwXmKZbUDC/hbqmfhDm36w7KVx+joALQ5Ebtboc+uF7NnVaT+
 w8ZzGBTtujLZhfhsyvKOls1wGcFGtMkXt3arYdsXraGHY7gf7hrNhhQ6xBJHUlU4XFDmjyYp6Vf
 hr+UtRoeTdw1HK+wp9EcHQ6w8SCKvxyEmYzu8nIpY25mflNz0qrjzIQmKS8tBsSOjyOVAZGPR+b
 VBxbR2Ul4LfkrqW2pE61M9ebrp4FAJc3cFY+B9B8PJ16ptlVoTZh/Fj2my9gjVaaf+i62Y8cgPS
 jxSOzIcwByk+BE45vpWWOC7JUE/Ee93xo9MeJMHEu1EOYUpEVwUFCqjKZQpn2nAApvff2xX3bhu
 KFV/FtotH4c9OPgBTWey6E3+71yUdaSMF1h5tScnSCQvgEMEmGBla8aowcD+aN3nZveVgND9nC7
 SNLQxpDwoDTBWLU+EgQ==
X-Proofpoint-ORIG-GUID: bpq91r3NU-KtcEsoEfJ-9LP1gj2Zl7Bu
X-Proofpoint-GUID: bpq91r3NU-KtcEsoEfJ-9LP1gj2Zl7Bu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130160

The USB2 PHY reset definition is missing from the negcc clock driver and
its bindings. Provide it in order to enable adding the USB nodes in DTS.

Fixes: 06498d59bb4e ("dt-bindings: clock: qcom: Add Nord Global Clock Controller")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,nord-negcc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,nord-negcc.h b/include/dt-bindings/clock/qcom,nord-negcc.h
index 95f333d8e1aa7cf1e386b6926380b2c853f7cf43..c2d048d9fc9e98d04658de665a1928297bde035a 100644
--- a/include/dt-bindings/clock/qcom,nord-negcc.h
+++ b/include/dt-bindings/clock/qcom,nord-negcc.h
@@ -120,5 +120,6 @@
 #define NE_GCC_USB3_PHY_SEC_BCR					10
 #define NE_GCC_USB3PHY_PHY_PRIM_BCR				11
 #define NE_GCC_USB3PHY_PHY_SEC_BCR				12
+#define NE_GCC_QUSB3PHY_PRIM_BCR				13
 
 #endif

-- 
2.47.3

