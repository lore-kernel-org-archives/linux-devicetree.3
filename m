Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419123;
	b=2WWKykhxf071p9L2NMVzd8C+Ko9J6dzMe8HGaVA5qDly7mKxxEs0Kk4RsGbXiXy83o77
	 3cjw1adt9H6AymL+mjnciWLqMs5GfjM3xmCXdLBh/2LQLn1YNAZwrDZN0bByJxlTHDRV2
	 eWbwbqiFTrU8XItjViZMRCZwoitvozI8EQWU3nWourNXYC7f2t7WIe08jAn6uTzsHdR4q
	 JU7lYE+qST4KS938zydGCon6wwHrfKOOSEhOipvjhrlq4PzKY0ugFF7EkPT5FS7UOc0Ip
	 zrmX/SrksAQtV14OcLB3x0wkxksjjhLSAVAl8base+30bvFjiUrRr44UDIjNS0dUjYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419123;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XEOLUODIyOXWFNay8M/E3b1bVzpi6+JwlNSpxHy2Yv8=;
	b=P0fbfVzFZblMpsbPnwVrBsMxXcDQ6vaM1OGlLzF1njMWNfc6kENtQ367MR3NtAOG0nbX
	 6dB5jWfw3PJ8n/lDuWraQ2mP4ucxUwBg0vel4LGJLrhcKyN1u7cnq3W3J0nCmX0pTj4jg
	 +j/zegA54WGQqcU7x6jZ64WoK3pyNDVt/Zx78xGjDe0EjJXfcJ4l7ODjEUleFDzO7KbdF
	 ZmuC2q4rnI+SUJz6ObJ9+BlAuYvUlqX62Dx/yZkFkT2K6qiIbrArtXdpvVXJLYpbSvJwl
	 mw0v94KD1G+RmjLRniISkTJgLqtH71oVf1/2LcIStYZnnAiGob2HOZLFjLKpSWQmnUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Iq4HKIEG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NDaFrTcK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B320F606A333
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 17:45:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B320F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Iq4HKIEG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NDaFrTcK
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF18OI2115517
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 17:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XEOLUODIyOXWFNay8M/E3b1bVzpi6+JwlNSpxHy2Yv8=; b=Iq4HKIEGTLKBTq31
	+ro3Dgiif/n2EdDc7nciPUjtRtjWa+XBXm9RQzhccFQEDQrW4KIAenq/yUXDPMEs
	Y3z8Xx4S5b1/Mw9QweZKAsUjVvy2tZgpsh3OdXnuE9Mkeyc9uXFVOdHSVBndPul+
	sUd+KQL/8dW0DRnOALV/PUMKHqdp8FOuJtjj8DZJPv/CKI3zMYJZ5JlIGUgvDV8A
	roT8i5T6zLhg+aCKXJHpvj06UbWZGlSgmVu+DanHME/9B0QB7ilt62eG58LXctGH
	rbzHiOB2ETTONeP7bWZNSiNxZQeZ1cl/XHLrnhSjFh/xVVXBgJUQjJ3/3w7/Kf8B
	y/XkZw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawkbj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 17:45:21 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9987bffdecdso2530234241.2
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 09:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794419121; x=1795023921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XEOLUODIyOXWFNay8M/E3b1bVzpi6+JwlNSpxHy2Yv8=;
        b=NDaFrTcKuw8jgG8eW43bqc8eayRwZIOcF4oiHGZIDKRubgWLYDzvAQDMOhwqlToz7l
         d9++PNhlrMzl1OeH9Thnhik5nWvuY0VQi10cY2SPzPapG3LrMQq2hWl1F7eJGgmOIa/c
         Jgi0j9+Vt+IZL6PV1SEULCeHPbOxE7DGy8INfPReTgW8M2qwr5K+zoq3n+7wvRy4vuIF
         ZjtvRdEQbKsQR34IO4FpQrPvTysT0F26GFxekt3d9UOhPG1wMxI8UPuElUQ8sBpWow1p
         wJsNL/yIl0uh0k0JheE6YtI2UCMpcB1hIBDGe3KsdK3ySez0MQ7D33i0r0BG1nhSA2GP
         eU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794419121; x=1795023921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XEOLUODIyOXWFNay8M/E3b1bVzpi6+JwlNSpxHy2Yv8=;
        b=Jwrqz6FlMibFFV1F6HgYB3zXM6fPwRWKIJQ77DHy6Py8u2Wd7kzsvGrjA3lvpgxPpW
         pcXwrf8La93gbX60rgFR31vXII2gYx0vHvixYLN15atm0BqaxKOSiET1zjHkaG7bTETI
         /kBcdwxWlfMZXdvu4g9vZ2vmNBXBZB+QAp/OqI4s7BoK5qQHqXEOwAuR1IhxzugOjryY
         AdTE+2jJ+OkjtZHBEIu5KKcJpDIfyRVcv53zf32ohox/vQjzx+ll+fs6Vntzp5tANV3F
         Ttrz/ykNOzW8tiHYGvpFCJMbmeQwKuNXBbSwqAEZkuG+kPbSBnmhLMcg9x7ckwLRPbbM
         eOgQ==
X-Forwarded-Encrypted: i=1; AL+hErHtwzPPuEbATfSdmJkFZ3JAj0bNfW7/EhiVuFClcM6VtmuGErMq0TGRcqhTUxgz/4OTasYTFeFlJtr7@vger.kernel.org
X-Gm-Message-State: APuU4Z9R1/HiX00YI9KjETGS0qNce1Y1GnicuvGmyhKacsSWbIDCXAZ/
	a7hq/T0Svf3t2u0ocxjfZsCllwYKoyMaFdLJ9/W3kVv4M9HMOTrgrn4uM4mtTO0IMH+WFg+oMpg
	VQC8ENa9VcXJwnIuSXp1ScKgyAgjLX5saYngCk1yotphyFhh5XWOmhArPkO01ums1
X-Gm-Gg: AYBFou0ZmxkEIDL5qxz8dxEYWGVPgeJirdb84x6ZmtEu2n2ZEj7DF78IcPpOgWuOuwG
	AHcWHGVdw+1XZItaqC+s0D/FrEbREnzc6O2jwEHpMIpfOhuZr0dmdmJwX7aipUfBHGzbBVmPdrG
	NEec6CV8vhcvFdr5Alls3eXeTmzlYNAdTOPPg7/DClPi//JHhXncy9FlI1mMypUiSKbVTfy5dDZ
	uriIAbxrUA0EGSJpbficA1oZPkms0azMQ+XT4IbJcu2gJkT9kUredXIWrZsIVdd+fVST7+L+0Y5
	xWpmmaIAGlisE/4ZFjmzkAaxBag6XTyE3lCrBMRL/QGWQkivf95lorFYS2zk4WJ678VvKGzMVb4
	Zh4rkE0g2MAAKfr1biQXXPGjWX9XthqUQodn/RyR1tEFsUdt19a9ulxtiVCD0dKSgq4/8ug==
X-Received: by 2002:a67:e713:0:b0:7d2:d9f8:21cf with SMTP id ada2fe7eead31-7d5061e6d25mr1449247137.29.1794419120632;
        Wed, 11 Nov 2026 09:45:20 -0800 (PST)
X-Received: by 2002:a67:e713:0:b0:7d2:d9f8:21cf with SMTP id ada2fe7eead31-7d5061e6d25mr1449229137.29.1794419120074;
        Wed, 11 Nov 2026 09:45:20 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e1f5810sm4846525e9.0.2026.11.11.09.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:45:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 18:45:00 +0100
Subject: [PATCH v2 1/3] arm64: dts: qcom: msm8916: Disable disconnected DSI
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
Message-Id: <20261111-display-msm-of-graph-v2-1-fdf8fd97f49d@oss.qualcomm.com>
References: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
In-Reply-To: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5050;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=P4VVgVXWltSSj7aZCWsKHMz6d5FfrRARZf5CW9AC908=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9KmluyyDPrdXA09BqwooVEM09xhRcORFlWDiN
 3+4aN13qeqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavSppQAKCRDBN2bmhouD
 13h0D/9g/KlHv0ldGfuSMu/+ECd2SkWmVhZAMeZfVM4hBVW6e7Iwy0tBAgQ+FdFAeQlv4071Jvv
 2iqe52zPWcrUqQIetrSkmpIDA2HUUyzQe5dFU1vpMg0y9qs5HSJdo9inyv+3flAJhBGGNge/yOf
 itGlewsYMoEB9hr5Pp9aXVb6Twe82u8DQMmtPXBbH+lXfH8ab0ckKLjEdqxVQZk4Jymq/MjZ0L2
 8yWYJhMjeKoGDR4duEJg5pmELVm73zpRB7S3Lo0Nz7qUm7PwS1jpk2tTUEhOY6KnwlTFMNbchs/
 gDGzD4jeQCXvGdpfGV3phA+ml1BqRXzILN6O6rNlCiwOOFhh39FxqqwNfLEI+UOwNbO1vGjY7jS
 wfk2awkbxPxMFXrRPyhohgrgyUCgDlFQ0KGQROwWLL42k6bcEmYnIKCIatcj+Yp8SYwkBzE5Wjo
 nZMJ7/Ny2YUs0Kym1Yk45kPvYFnTipAtJsOVv3shJDvNL0IaH5wk2TMjuMSxu/jR4YO69wnocFb
 CWcqX+FfzI0wNl0POdC5K0QpJdsGNjAohgHKxfywBXsgVu1D2Xqzm8ylkxlNAR2+b2kzDet1lfW
 0dSBmkAn5zRa2uXqLT+lowIrbV53Zr3Vu+SJUy/BxPDQ0LKMT8iEeCYRAIbHtstsh2qY4LcyWGg
 w8SnJdsba8/edug==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MCBTYWx0ZWRfXw7bt0b8P1uht
 51Q5NjZpJont/BnyoEG1h1dGK+Xtc4GXMOf24CSFBzOnfDy3oCtiuhSXj9yRhufuEvw/J0Nz86D
 nNz3utHtMxQ3jObxTz1R/WARqsWHIK4=
X-Proofpoint-ORIG-GUID: jWZkW8SO_ffX0sc5ob8qBUT8A5rKavn0
X-Proofpoint-GUID: jWZkW8SO_ffX0sc5ob8qBUT8A5rKavn0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MCBTYWx0ZWRfX+gtSv7AH7gFz
 1qzC/BRY+uYe+4PZN2W1SJDq9nEGor23FuLTn4G3bwJUC7BNNcz+AbIfXoFRN61iFq0T3HoTYpx
 SnBWwm2tG9/pPHHPYRFa8CcDIxn2UKFlilwMWMMrNePRQeK3vsDc3POGGhIzDi7w/+UbUpEce1E
 X7ytldATcxY9qZYJAOmJJbS4YOSbFbXLphKbMej7cpxCWzeC0Lq9JvnCR/tTVtPpJNEbl6A9p07
 MSf/qRUYf8Jm2J4kC43HzGEH+pIg9vEu1fbePZyz5NzHFV2vS/c4uoJX754v4wQDNSp8PckbeQa
 vjvtiX9fO5vWshhdxTKwBWT5YdnLSZAoCE1F70UPVHjKgkYvS6qY3g50kknPv4DW7uSj4fD/RR+
 H9IybFjgEcrjte9M530BOmsMk6FEgips1JFLDml8MN2TXiu1KvN9goD8R+JwZULi3ioS6Ky8goL
 jFMxfRbObKj5fjqeV3g==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af4a9b1 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=b5eSGgufP5Rg0J_mn4MA:9 a=4tUkUnfIpJ8A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110070

MDSS DSI and DSI PHY is useless, when nothing is attached (no panel
description in DTS), thus should be disabled in DTS.  Linux MSM DRM
drivers will also fail the probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts               | 4 ++++
 arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts  | 4 ++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts   | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts     | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts      | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi                  | 4 ++++
 7 files changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index ba6ccf0db16a..6c94489f5f70 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -262,6 +262,10 @@ &mdss_dsi0_out {
 	remote-endpoint = <&adv7533_in>;
 };
 
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &mpss {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts b/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
index ce75046ffdac..370ad8b01a1a 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
@@ -218,6 +218,10 @@ &mdss_dsi0_out {
 	remote-endpoint = <&adv7533_in>;
 };
 
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &pm8916_codec {
 	qcom,mbhc-vthreshold-low = <75 150 237 450 500>;
 	qcom,mbhc-vthreshold-high = <75 150 237 450 500>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
index 906d31f1ea21..d3adbc7406b7 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
@@ -87,6 +87,8 @@ &clk_pwm {
 };
 
 &mdss_dsi0 {
+	status = "okay";
+
 	panel@0 {
 		reg = <0>;
 
@@ -109,6 +111,10 @@ &mdss_dsi0_out {
 	remote-endpoint = <&panel_in>;
 };
 
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &touchkey {
 	vcc-supply = <&reg_touch_key>;
 	vdd-supply = <&reg_key_led>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts
index 5b34529b816c..fe333ed489b5 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts
@@ -133,6 +133,8 @@ &mdss_dsi0 {
 	pinctrl-1 = <&mdss_sleep>;
 	pinctrl-names = "default", "sleep";
 
+	status = "okay";
+
 	panel@0 {
 		compatible = "samsung,ltl101at01", "samsung,s6d7aa0";
 		reg = <0>;
@@ -154,6 +156,10 @@ &mdss_dsi0_out {
 	remote-endpoint = <&panel_in>;
 };
 
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &sound {
 	model = "samsung-gt510";
 	pinctrl-0 = <&cdc_pdm_default &sec_mi2s_default>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts
index 3d6d9dd3b8a8..85d1cae19a66 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts
@@ -98,6 +98,8 @@ &mdss_dsi0 {
 	pinctrl-1 = <&mdss_sleep>;
 	pinctrl-names = "default", "sleep";
 
+	status = "okay";
+
 	panel@0 {
 		compatible = "samsung,lsl080al03", "samsung,s6d7aa0";
 		reg = <0>;
@@ -119,6 +121,10 @@ &mdss_dsi0_out {
 	remote-endpoint = <&panel_in>;
 };
 
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &sound {
 	model = "samsung-a2015";
 	pinctrl-0 = <&cdc_pdm_default &sec_mi2s_default &secondary_mic_default>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
index 71b5c98458ff..65de798201eb 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
@@ -337,6 +337,8 @@ &mdss_dsi0 {
 	pinctrl-0 = <&mdss_default>;
 	pinctrl-1 = <&mdss_sleep>;
 
+	status = "okay";
+
 	panel@0 {
 		compatible = "samsung,s6e88a0-ams427ap24";
 		reg = <0>;
@@ -359,6 +361,10 @@ &mdss_dsi0_out {
 	remote-endpoint = <&panel_in>;
 };
 
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &mpss_mem {
 	reg = <0x0 0x86800000 0x0 0x5a00000>;
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index e39743e22043..7d351cd15f90 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1634,6 +1634,8 @@ mdss_dsi0: dsi@1a98000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				status = "disabled";
+
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -1668,6 +1670,8 @@ mdss_dsi0_phy: phy@1a98300 {
 				clocks = <&gcc GCC_MDSS_AHB_CLK>,
 					 <&xo_board>;
 				clock-names = "iface", "ref";
+
+				status = "disabled";
 			};
 		};
 

-- 
2.53.0

