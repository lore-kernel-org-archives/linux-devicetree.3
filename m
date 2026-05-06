Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6416D37AA86
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 08:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778054946; cv=none; b=VsAWrpLyWVbn38LVxGlWchVG0Aa3K5F45Lp72ZoET5kBRiJekz3Pi3qryE9l4Ku68DFP+tlKT+WR2YALKV3WuUyUVHNwq2RdwOLL6TUWVs/p2LM8RGMKOaZdrQXyrk2O8c0nq+Sig0Lf+CspSyOr2IZYTqs2+XjaamjIGMUif4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778054946; c=relaxed/simple;
	bh=P+aIVfeZyl/NuFW9I6+W585jBf3YpKwwP6L50Z1Ia+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oHvY4tvZkR5MI19TBVzxl5sSa8z2Q1bCEXmkqLZF6WpdTzV4kTJ5GqgIE5pUdrww+28RAoIlsSD/DzjrDBRjNUWsqm/BsXQadjHuBD1/T9BGn+wQ6OBCvEkZw+1oUHJEnRLbcmbWztjtX4eTJnzIJL+UtzIGbzeM6Fwj8ipm1X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qacc7q2H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VYmzkP/5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qacc7q2H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VYmzkP/5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6467CfLQ1527930
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 08:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XaAmCd+SBWMRZQ8hFYtrPf2PXb34pZuhF9Y+T5OYGPY=; b=Qacc7q2HcJQCjpOg
	DHPXuyUNrLXR4o/TEjWIV4CfhvjDFKKsUKHyTDCnC1A0GB/qkdn/RbOJ1aLGHD1s
	K3+M1njSiehcRjNeoCWq2u+LfEbmdVtK5I509I2nyqLqJzSuLgN/jhb1tqam9n3X
	BKR3TLoB8WNYXr4WhQb4XrnVJ/vNr4kLtvn2mxFCqJrM/brvYteIpNyjnPEGvKmI
	pVRvFLSs75tNKBsXaBKxWjQIyfbxOvhE318LwiDfWGYLgqNsJ/CjGR0gtScpy8tP
	99sf4dSJjXyC0tjzyG7mlW5NGn89u8JGH16t/7fowtH1SjT7aKQcMRiaCB40K4dy
	CLiX8w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e012887s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 08:09:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50df4c130dbso22987751cf.1
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 01:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778054944; x=1778659744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XaAmCd+SBWMRZQ8hFYtrPf2PXb34pZuhF9Y+T5OYGPY=;
        b=VYmzkP/5/8UReyvfpdz7AAAZ9+WwwW/xfWPdlANhpGWcxpxifwplYufH236GdZdCAg
         1SXTQOICIpnJVi1VmRxRaK/BVjwa8q2RoL18lXEaJLzgtYAS/OuD60sQxihjm90D3WwV
         7taYs7PunNZyGy1A6MIYsyyEMj84WiyPyNhQ9Cb5x1QYsm1TjQSN4/VLu/VksTUQV+Vj
         wic7tIH9kB6+Ql+XeDzEMiMmuqcLDS5WoQGbAPDnPduNj0RZSFg4D1gPDOZ5jfu5J9fr
         DF95leSPiH83l9o+qF6ukPir0XQUuErte5pPiCTNk05FcjKWp106mtCZWBhJp/svXnwj
         LgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778054944; x=1778659744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XaAmCd+SBWMRZQ8hFYtrPf2PXb34pZuhF9Y+T5OYGPY=;
        b=otUz/mCwFFGuTrXHF/nyOlPOHt7Vs+QR++xJYB67MI63AW/sPKI0nvG7LqCGNkdBs9
         kB3AGgPtfkYi7QpazYPNVmDFTdJqsCjrNLpx2ALiCJ6VOBh1rVrx4rx98mCJHUyDp/pD
         EAELq8ChLi7vFDAG0dPXj205F02OSHCEkAs+DFdmv1juBHXL5r4Vf8r8s5Syh0ypvJsC
         hGGb7cV3iqc5ws1N3RXTtz24V8px89L2r6nvPx+nZzbOIFZ1+OdcgwZ7di/DOeocInx2
         DZG7pttQy1Gd8GYeb4N6OnnKlYbuD59oO7lxQvMRsQk5aM3GHDeonw1cKrCu843BQNd/
         A28g==
X-Forwarded-Encrypted: i=1; AFNElJ8xu+3Ev4UVEc+S+5h7mhBy37uPWj5GkKKvcj8nvXQ4NyzEfgW8N/kmq3wi6aF8VTMIPy0pLz5T/Aos@vger.kernel.org
X-Gm-Message-State: AOJu0YyomUeVbUtXHZgRCpNIY0YxPHIKfxJDucljOv03P6o8G7pidTKO
	Y+ZPi/WhJ0gXeXAcoYyGkccVqrZrgUQwuW1lDm2Y8D8NhYnq4xLlIh246MvXPDQPmQTEZKdJs0Z
	wVAZR77A3HA1rwz2+3n+8n+9dCZEIF+NKhwosSls9ZfcKYuuLIxR3CYICKiAV+8CJ
X-Gm-Gg: AeBDieu09XvHtBjns/P/bOQdP1v6JyBsjAiHdXbob4iIDAA54/a7ZHEhkOjuk1XHAcF
	q6jUfwwcUV49sPYcPV09PAiwsgXVv2HXnDkDH0pBxwNvWD5WgLSfiDG5fK+mxCj4gKtd2m8lYIP
	ZtYesqsx//U310ZYz9iEnY2xDajGkhiYgnSXOkH9pmvNEOIl3E7EFXHqxgLM9X/1Ya50eKCsCUu
	VexSN781OEYo2EdS+IjGqHkfbypXq/TRQQXKuvu9tmGXXe79pJk7VOPTwQAgUyw9NKfmu5BAZP6
	eaRrkJ1O8iiFBz+kJOmDRDWo2jmj4pLZjxclUH7BvGS0GU3QQwbL60IvdHpUPnQyUEKOHeSB4Na
	fnby5Nj1k7wBIUJ1I+bVcy9GA5RojHL1LlNPtQtYvBceZuLzlIF2RANrKg2Os
X-Received: by 2002:ac8:7dca:0:b0:50e:474a:47e1 with SMTP id d75a77b69052e-51305285fd0mr90894741cf.10.1778054943585;
        Wed, 06 May 2026 01:09:03 -0700 (PDT)
X-Received: by 2002:ac8:7dca:0:b0:50e:474a:47e1 with SMTP id d75a77b69052e-51305285fd0mr90894561cf.10.1778054943140;
        Wed, 06 May 2026 01:09:03 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1cd7:fa68:b1e1:a93e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530c1d07sm10955095e9.9.2026.05.06.01.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 01:09:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Chanhong Jung <happycpu@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] gpio: 74x164: seed the chain from DT at probe time
Date: Wed,  6 May 2026 10:09:00 +0200
Message-ID: <177805490864.4124.505982607018854833.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260429035134.1023330-1-happycpu@gmail.com>
References: <cover.1776872453.git.happycpu@gmail.com> <20260429035134.1023330-1-happycpu@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xOjlPlf_UfqHqCScjW9sPMpEKHbseU4j
X-Proofpoint-ORIG-GUID: xOjlPlf_UfqHqCScjW9sPMpEKHbseU4j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA3OCBTYWx0ZWRfX1y/wR9ZlFkHc
 WxnI6RV/lmlai2ZUQwxyrtYlbNo/mn0k1Z7aLpbD1brraO9ThLs4WcMS+pDKhdD+YKHSF+lEA45
 1rHg2fCVJgOFe6epJ6baIkvtPoHMo7gVAjuQ9OqNQ++cRsO7/UXfFOBXC9c+pc4NU+s3xoHMfXl
 bvvalpqVD/4VpswSkedTfK04LD/q+da0aQzoL6BUczT5k6aVM555eyKjvBonHhkZ+Ng/+V3qvio
 qai3lIK3Dp3osRdg80L7MRB8TesK/RKhZ0D4zWn53RPLMgc3bI7bma6zIFs2WM5MXFMoxrn8N6L
 Cipz+sNKf61KduHLtHqEXpTmqjC/EqUAc1h+k9JiVDXdJkCb4765mRX6pI3OeeEFxD1dJRj7Le+
 ALGdRaOkVc9VE1QbI99N3+eXRMVLiOwPciIHx5ZgA9tY9DBTXp46hKT9X/zgfA0DrM7VbbK8vM7
 VumgKeso4C0zlCIvPCA==
X-Authority-Analysis: v=2.4 cv=A8xc+aWG c=1 sm=1 tr=0 ts=69faf720 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=h0xZeIPYvt9JjOhX5-wA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060078


On Wed, 29 Apr 2026 12:51:32 +0900, Chanhong Jung wrote:
> This v2 reuses the existing lines-initial-states bitmask, as suggested
> by Linus Walleij, instead of inventing a new property. That sidesteps
> both the v1 review concerns at once: there is no vendor-specific
> property to argue about, and the bit-N-equals-line-N convention is
> already documented for nxp,pcf8575.
> 
> Background (carried over from v1):
> The 74HC595 / 74LVC594 family is push-pull output only. There is no
> read-back path, no defined power-on state for the parallel outputs, and
> __gen_74x164_write_config() always shifts the full chain on every
> transaction. The driver therefore publishes whatever sits in
> chip->buffer on the very first ->set() call, and today that buffer is
> fresh from kzalloc(), so all outputs come up low. On boards with active-
> low indicators or other signals whose initial level matters, the 0x00
> publish glitches the chain before user space (or gpio-leds default-state
> walking) gets a chance to run.
> 
> [...]

Reluctantly applied.

[1/2] dt-bindings: gpio: fairchild,74hc595: add lines-initial-states property
      https://git.kernel.org/brgl/c/d6e1a94888f5a4306c9998944a0f29f7bcd49411
[2/2] gpio: 74x164: support lines-initial-states for boot-time output state
      https://git.kernel.org/brgl/c/cb77f8933467d08c8896674cd39ca98550a70fd6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
