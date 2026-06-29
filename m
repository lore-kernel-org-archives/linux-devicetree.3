Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B463F8705
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782723347; cv=none; b=Mpx8U6aPT2SrW6iPKe1emQ9p+KC9ei3fpMN7KUobJjBqQ1nrkgqeRzJH3kv/ZwFjThN2d5XnDnE/ZO8mtz84/OvpWkmYAeMhq+s/k/vtLxqRDnvNrG+6wNavoakgvonV2+bB0EI/4vkBKTqnKvDehWhjyzJR7O8AFs9FyrRrNEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782723347; c=relaxed/simple;
	bh=xh4ucig5hPRkaGw1GggCAwEU1pqdfnGTPbj3vUFpt5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tfP6IxswrkGwaDc93Z7yRtt/YgiVKN+rBJk/YZeo9hf777yJdNhfBEsdUdml4L7wfzHQp8xkb1Q0vXgx0s9LP1xt8A/FXgporLHO/j3jCvxic/6J3zHEa6k6TKMymxmSiI0w18mPQiAw0hLaV+OzUMPYFYR1CMT1km/49bMiZgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F1Fcs9z1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AOBEQBjK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F1Fcs9z1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AOBEQBjK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rHlp2101534
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=; b=F1Fcs9z1Aw6XRZTs
	Um7fEWGgX5KMk8DW9SYSLWVtVnGWMJoda5P8TBu5fBZ3dVMgwzv6NR9VP+2jTMO9
	F9h+ZjaDO9PlssYceWEKHXRrKeR2KStUYV7d4vpowsopRKjKBUAzdLPtVtLtWLbY
	fDxJri626kkWHDHjJmKmv+ksfmW5/EqibfVeuYrF/4mLCNM4Ot4/R1kY5GmT0knZ
	E8//UYQO8q/RRHP/sc38FkSY62FIrSbjWcgouKPze7dsixwql/LsXLDVr0HdN0Fd
	qeQ/zpD0gUl6oTpQwEdeGYE4Ew8MW6Hsq1+kAIhSwnMR5g7MaLJRA0WXT+K+2U/K
	0tmChg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f279cng3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:55:37 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bbecd250b7so1158916e0c.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 01:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782723336; x=1783328136; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=AOBEQBjKIgTnXwJxyvX7rCT6xzjLuyp80J8/Vs3oqHsJBHrG2y0KRGA2YEtOpOS8vt
         JKrtwBT+mhW1wkE15eEQ+mAcCo1Q55vq/npwcu2Fr8qUMzkSvW4Uc1cTfVxbSwsc6pKV
         ceVvKjgUGZjr+k4I9USXnZ8GYs0G5NJioLGrvM4apFa+4lcwFDIzSFUf1oU0sANNeIaj
         DGDi63ucVzCqndpqirmAtu3S6tTrBFiOS/sGM+IHFz5IfWvoUty8zOuP0Qvam0MozNcY
         4o/o8ImtsDLLcyOijuP3I+TlQ2iRO+lG2AlTvA3x758nGQWkk3t4A+sAigeXxqU0HGEA
         5uGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782723336; x=1783328136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=QPce0haJsrRJd8wQiBdx6I/xtkNnBiKRD1/EiIMb2ESJdi5pRG8tLeSyuDJYOG3o80
         +cD/ENZzjhZ7Q+eI8di1Px81T3cYPR4S5/+1aX8vvPt+BAahEml8t34h0Nv+xdZuChT2
         u2jsQiX8i0lDPqBj6ddbnCSwt/rCDuidy68+gqhu3Y0dGsOhA5FCfi7ZoPV5oe1tSVgQ
         cLRDQvPnJbS+hEpPznSTqUKebZcaXMkolCJ6mEALwM0XmBrBhcYQCubUgDFuxlRXLC+T
         RE6dOVR3CMsYgG2YZnnDI0Hq1dM2WjsExkiTwMxNILvAAKEBq2bbRMcW8J2XEGXdn+tI
         S3Tw==
X-Forwarded-Encrypted: i=1; AHgh+RqR0VY/6AI/nzz4UxZcEHKgzYI5MhVpac6xbANf5Ms1Tm8gLYj2KIFgWZGTGK5DSU9H96faj4Q3f7x2@vger.kernel.org
X-Gm-Message-State: AOJu0YzYn7WdojQBXrIQm0DzK6WLc54rBje69zNE8VOMFY6MeltidrUa
	AC9YD5yRTPydduKRcGzCDoemZHa0NhrHBRAlf9So8pIp8iH1uxHxPUI9zucR7a3beNgn81BPX5r
	vE9cMav4dXL+1sToSzI4zS6geITQ9y0EdnhVu+YnrRAqmhUj/VdnemO5I1FrUHrdQ
X-Gm-Gg: AfdE7clZIVhTeO7Iq9FoWE+CsXitMbI2eCn6S5zscHay9DFEEIzIU83TbLLJXhGYNTU
	nsCdWY2ArPSy7+EoWZdtmwi6Mn/funwNq9QgCRuuv/xsRznWzfjLk7edjPxohfj7HgMHOZRdpPt
	z1qFCGQUPamxMr5z+8PDjHVm6zYj92Tqchdvhn0qkJTOHL7YVlTQlmdbU0qD5GueFlAUQrBXSYD
	UG+SNd7mKRtGsL2Ep9nRD4Ey+JyF3tyh2MVieblIfr2JhjUTUWcpxUXDhr2rjWxg3v9UKcJIwWY
	4c8hKLlvlKmRFRq3TrYzWrapXuOGNT1VCYq7qitsTv7seMb6wNVsLX+VmPQAlmt/eXqZ6bvbmKF
	omeAYjqsQWxFkVsw7V86evttHDI0qIDTBzfbuFfXom7EJMdJ/OEt4iT29W67ISvmD06XpBJm2go
	mLCtY+WhogsWE/NegKt8MMLQuNqG8Ht4kYXMQpGaeI+27STXrgeTDNZjlUA1gfU7HccyC/H6MSR
	ee6vQO38W48PDzAfM92
X-Received: by 2002:a05:6122:3123:b0:5a4:6680:64f0 with SMTP id 71dfb90a1353d-5bd69cc1bf6mr6342977e0c.4.1782723336504;
        Mon, 29 Jun 2026 01:55:36 -0700 (PDT)
X-Received: by 2002:a05:6122:3123:b0:5a4:6680:64f0 with SMTP id 71dfb90a1353d-5bd69cc1bf6mr6342973e0c.4.1782723336048;
        Mon, 29 Jun 2026 01:55:36 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f4bc8016sm6558981a12.25.2026.06.29.01.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 01:55:35 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:55:23 +0200
Subject: [PATCH v6 4/9] dt-bindings: bluetooth: qcom: Add NVMEM BD address
 cell
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-block-as-nvmem-v6-4-f02513dcd46d@oss.qualcomm.com>
References: <20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com>
In-Reply-To: <20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=evzvCIpX c=1 sm=1 tr=0 ts=6a423309 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jFERsaRKWwo8c2z-USAA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfXxu9kWTNun53N
 XhPLO7jf7n64m2Jl37FWyM5Davb4k2vlp8PBspchL9yVswUQq7DYpSTCDKh/FBq5W7rzIdEu7JX
 2NAo9oA3jf8kJRusIWD2mYZQMQx72WU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfXza9BMalHFpQK
 uY0w5RED/W9mbzgK6BPShZpMcf8CGu9+EfPKsTJ8cFMm4ufUg0DjUqldTKD7hjnxKrFlu8YzYIj
 wPvpO/cYzlahuzBO3NmMUbPgtw9PHIOZmbjpeBwfZrundiIv55T3/NvYH9NxddSG8hjQxXiphkm
 EYMMRWY/L+GB8pOnb6zN2edMcVX2qk0E++Olmkb1EtRuUuNIQFjHmvoNhfUWnUtYmk7o+vcackB
 GFuxzbjWXTiyHbXVC1jrZ74S5iBahGRXAcIBNFf+zSpGJ1txRHBOckj66hN3FJO+Q/i4GGshwNM
 4qp4+3EURsuUwfgO7NBak2IcyZhMAj4Jz9/VO5YkSP6mg8FeZHmRGWf5LjAaTodKp0vzbvv8gfp
 /eaiNEQW0o6NduiuQc+sLrUcj++JGUriYxB207T9phJa2x21qkcjpZP897KuA5BEVGce7ME7H/R
 d7DBveTNGAPTahh5wrA==
X-Proofpoint-GUID: ixjoRhrcLaVKw--GdBCyifgut6Y6dEm_
X-Proofpoint-ORIG-GUID: ixjoRhrcLaVKw--GdBCyifgut6Y6dEm_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290071

Add support for an NVMEM cell provider for "local-bd-address",
allowing the Bluetooth stack to retrieve controller's BD address
from non-volatile storage such as an EEPROM or an eMMC partition.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
index c8e9c55c1afb4c8e05ba2dae41ce2db4194b4a0f..7cb28f30c9af032082f23311f2fc89a32f266f17 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
@@ -22,4 +22,13 @@ properties:
     description:
       boot firmware is incorrectly passing the address in big-endian order
 
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Nvmem data cell that contains a 6 byte BD address with the most
+      significant byte first (big-endian).
+
+  nvmem-cell-names:
+    const: local-bd-address
+
 additionalProperties: true

-- 
2.34.1

