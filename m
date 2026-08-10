Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42ED296BAF
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 00:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786322577; cv=none; b=GW8Zw0zLaOhiZYT2u9KoYH5d3DdXYA05LXV/8Gs649tOPNqrb+S+uqixaUtofWi84UfTvUxGG6MENRT3gM0XlVioCyAvGwVMTgjoe/Bp6mYny+kXcqVnjOfqYjoh9g/87BzyeOMjzxbzN6h5yOAUVmVwcHsNV80TH6DZmnaCHL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786322577; c=relaxed/simple;
	bh=XptlCVavFWjbhOJ6EIdHSSd50V8e0b3NzSBraOqTS6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uro4ik8YC6aOlo0WRjzr0SfvAHFXl6qUIOnCEXyNdkAX8J1fRFRsQ3ds80VwyYjRtqJwbKjY9W7qdzsg5KYjOpPSdWiTKAbdUHJCBdeL84vYOjpnT/dS2iOCuZC2ajKTLzl56tEL9OoybJXarQ+IyS/FNE4qvpNhCqWVCWSvIoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JwEWu6je; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fOk0ass9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JwEWu6je";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fOk0ass9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679NJ4Z23700727
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 00:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ql5B4LomMPp9M5uchPFpG37QNDDBQiNx5rGOXpW1SQw=; b=JwEWu6jeZGmgQaVx
	kDFf0qALkNvZeJ0pWXm/nJv8+kENveO2hBH6A0CLGhHABvY7DKNklU4N/NYejFrX
	gvvfihHWuVZCpeznU/ieUVcUGzmBduSQMGKehuDrUCUpWoeuscuXzQTux+i65M3d
	/4gJ0sDnrk1uc+mXQnQg87M/qFAEgvnJciezuFwGtqbDhQsLFFPc3l8jYbchwGe+
	EYZRxDug3TUj1NXrDjHIR/QpBpla3RtMW9YynaORFRVWRrfMkEz/l760u9IrWUph
	LfZEoVt2jsBYH3MiOFr8eZzGXobM8XVda2lvY/rTdpxc9TOpYBkDz+o1b716hOSI
	dmr7Ww==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwwr9kqdp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 00:42:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9083b049f73so17104646d6.1
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 17:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786322574; x=1786927374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ql5B4LomMPp9M5uchPFpG37QNDDBQiNx5rGOXpW1SQw=;
        b=fOk0ass9gH/qFywOb5s0DGm+dqz4CcxgqNt9i/U56gxjTVYZ63Ek90aQv+ZAAM/SAQ
         tY7QixZzUbe0Xf39Hvt1aSok3FyuqqFNMLUfcWiDOwJYvjA9yiG+U0ybYQrzdKsbGvU3
         2xPXYtiMd9iIyManoyqhRenGogcvOCzIA1HN4bttieGGrYXC6e+QUt3g5hMdAa2zT5zj
         HSOSJvfEoNI+jIGZC1F3SLDF2HEfpVUPNkTOALsNf3XCeVu6iaFgiu32N5MEPZHfzA7d
         1TVNA40ZdQ34f+BSBOiF2sesfiMOp3wkIePAk1OLXsfCbhHM4KFzPDhazpXCjJQhhed+
         F40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786322574; x=1786927374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ql5B4LomMPp9M5uchPFpG37QNDDBQiNx5rGOXpW1SQw=;
        b=XAnxGL0/OLOJ+qQl5ovRcm90N+OBIhQLrAsjCxs1yMC5lsAdWbyVB1Lyy9a4GYQGOk
         4I1bf1aWIB5z1zK9gVDq4yAbAaWBxGpZD0uHLUWO68Dymlt4YA/iaXNGF736FZO+T1p8
         nUQAn4qmKcTq4oVmYYSHeR+8DxNaWiFPa3Ie1+sD/QDr9sFDAVe4hbEJZ7403FQAQfdw
         4ZtBKfMranefbXmw68xMXTWpUEBpXfuHe+JY5xE3A92mPZABIyly6JRB4burcz/A9+bB
         jPyD2Iqr46GEt/KxxbZacAMxxdBjRzWwKBXguGXNRPhYgZwKD2JuiyYjGUxxSeuicK2N
         Tzfw==
X-Forwarded-Encrypted: i=1; AHgh+Rq8DWrtIo2pp6uK0dxFq2Kcf/wZ39i5gMA3rC7CHyrpkVpsCnSZ5jVnTjRtTINixeI6GD+5JvauK5Qf@vger.kernel.org
X-Gm-Message-State: AOJu0YxngLLgUc1+errN/L9ItSg0C5cebO1l3wPMMaVpWmqzr1LdNAw7
	Zgn1jvmg7b4lL6T3MqFTo9xIDndpzADZAeCsJGs8Rvh/QMXz5Enf8JRwl2ZEDp+ukj5KzeBaDTV
	VIugtAAAHGSsTgh14gQmkBIpX/TKN0tO1ueh9yC0E2e65uguEnTAgsi+v22jgcIAy
X-Gm-Gg: AR+sD13106pAN0PfMNvujUCXEn7sr34F9uL4bg34yTmUWdoHgdU+BkVBwdDBdh18sxs
	GjbTmYo1WCxEKqaNL4GmgNh8u37fw37AU3VVlD79lQvx0IYveo9xLrPCwG8ly2a2fhF4uinm4Nu
	IW1KYjirv7UAG1ZZbx1v2JoBQXj0H6APnGG1QUX4WRlXywUvcr/253pmhqJmvNMeBQPmghcCTBY
	zQ4X4EtsljSRY41BjKqYHh0uXgk+BXdubOqwRPab63JzvlDcuFcyUz947BhAtZlPafWjO7df700
	EjQxjewxfkkLzfmGMOcF5YAPWmKOrci3AeTEIXLF+pc04RURCkgcSmzUAvUF0BNegJi/mzNh6IY
	cXag7MmorLCFpJw5EjRP2TRwzlt0jI+DuCi94OnPjZ4hby6r+cOqy8dPnm4oxLjKo9YyBrNXai3
	Zp6FgB5nmHYxzYmA==
X-Received: by 2002:a05:6214:490a:b0:908:92e3:a06 with SMTP id 6a1803df08f44-9089b64fd30mr321860676d6.24.1786322574088;
        Sun, 09 Aug 2026 17:42:54 -0700 (PDT)
X-Received: by 2002:a05:6214:490a:b0:908:92e3:a06 with SMTP id 6a1803df08f44-9089b64fd30mr321860466d6.24.1786322573775;
        Sun, 09 Aug 2026 17:42:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3d56sm1679742e87.69.2026.08.09.17.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 17:42:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 03:42:35 +0300
Subject: [PATCH 4/8] dt-bindings: usb: microchip,usb2514: document the
 USB4604 hub
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-onboard-usb-v1-4-08a805768328@oss.qualcomm.com>
References: <20260810-msm8974-onboard-usb-v1-0-08a805768328@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-onboard-usb-v1-0-08a805768328@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XptlCVavFWjbhOJ6EIdHSSd50V8e0b3NzSBraOqTS6c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeR57+i+Ru2tY0dFKsvnlPICq7rinDy2CP7emA
 jcrVs+e8OWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCankeewAKCRCLPIo+Aiko
 1Vo9B/0Wl79SNy5Ng0e5BY5wXB4TTDBopfW8pl/9mGotUFoExRTMrIaXcM/EWf6BhwKovwyUJR0
 pXweCJzRUZZKxr8Gx3XipIz5aQ2N/rR/FGvqpTcaKq40sfHpSTJdJVWywFFksZkDfE/CntkKUia
 rA3tuo1GomLZCbwGaDgqUdMllNAzN1hgfUVbr19BKTU222OWELvtQsM0ekjqMjnsR4Xz0MrmgTv
 oYHXydhnn7twm3IVfp+ulfYgnyKKubS23U2QE1PQ40tncLIJ4/Eb/b7KN9TPmFuYKNQ8hVsBgtm
 DoRentOpIzXk/HMOgFbashn2nfvueUf7t11tyJQgpb5YL7w1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=d73FDxjE c=1 sm=1 tr=0 ts=6a791e8f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=VYvdqsobsaKPDSFeC5EA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 1Bja3hcpvOaOfMuIj38-ATAAXkAFn35P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAwMyBTYWx0ZWRfX1/6gp+CudKJy
 ks0GBeAYCLCMd7V87TBdAu693rFRXEkl4pxX+YEGHjKYB1xyCXFd7n59mZug+qthGQjk7FHDSvW
 qUrGUMSfhx1kAuiOK9qRiHXCl6tYlSYpuRnXQqqWuHCY01PPMVVEn9C2yEeqWGhbalbhR/cRWmB
 IYAdH79llGDfuiUM+lsdpnmTKxJaJWcFBujkFEv3nxrFr8Tfb0OBHa83IWj1SGfvfx6Ffht7hZc
 2F7TX6P5fVTlq1vRBZqlnSbylyTe7oFLMQ9+dJvSFw+aUGW11Q0AGaeg5eVy0tLOKqSOv82QW8H
 HvzpgM2tF7HCM6ZKS243F+FbaMJ1XND0uVCWOfZT6bkkS5trGhmcrsOVTG/F0SxBYhp8bOjZ0BR
 GS49zzftLWgCW8SpLpwQ32bfzJnUw2w1aC1EE4QiWL9HlvXAWQuBj1QOrbmHwXbVEPkA7KSlFgU
 HuDb2yEAzwYR1X5xGjg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAwMyBTYWx0ZWRfX9IKBZ9ASSg6K
 Maz1sHZ1Y3GekGkFS23Xhn7ak91h43JluL50aZ40h/wOibjd6MXuShzXB1lfnSn6fK+QgUTt31n
 AeVjpqD889EEAJFerl1rfEQ6nLeHgjI=
X-Proofpoint-GUID: 1Bja3hcpvOaOfMuIj38-ATAAXkAFn35P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100003

The SMSC/Microchip USB4604 HSIC hub on the APQ8074 Dragonboard has its
RESET_N pin wired to a PMIC GPIO. On this board the hub SMBus
configuration interface is not usable (the bus pull-ups are referenced
to 1.8V while the hub samples the strap against its 3.3V rail), so the
hub runs in standalone mode and only needs its reset released, which
has to be described in DT.

Document the USB4604 device ID (0424:4604, the ID used when the
upstream port operates in HSIC mode) in the onboard hub schema.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/microchip,usb2514.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml b/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
index 4e3901efed3f..cbff9a350857 100644
--- a/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
+++ b/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
@@ -17,6 +17,7 @@ properties:
           - usb424,2417
           - usb424,2514
           - usb424,2517
+          - usb424,4604
       - items:
           - enum:
               - usb424,2512

-- 
2.47.3

