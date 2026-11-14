Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678891;
	b=MijgSHmdvKRcwphHo3lShaOaaZA9QLphUyK2sKRsShWT+DK+5iHXigZvfAFvwUOYp6rL
	 Ts5/IozJ8zaE2ueacbY2oKZ9tGFU6Dp51Aa53oRgqN+wcriRXnUDJFcrL/0Bl3eaQRcNh
	 5Ca4dHvSYuSmqc/K6Zo4jbXBXuMQdR0eGPqJc4QnHjW86bSpRnFYSrph3BsDZFb8RIme7
	 UbOAgO1eL0ySmHK1Fe/TQC1V+jQnDrUZ/bcFOhp+qGWSM7hv7AsOxfZxD82OPYXpJlNAb
	 cC2/j2WbExly+JK9ZtMwUOXz75+FrDqlRuqZRoftwdDzg8448m2b8Cgn2bSO3gMNDRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678891;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ypaNDTkykj50DMxDhN5W20Hg9WT0vYVFy5lXvRf87JQ=;
	b=MSC47TJ05gm6vwKGcjuzchV99mEh3H9faaJQ2KB6jEaEaSAY2N8TOHPh49xzcY1ipNBn
	 WVL0Ml2UuJ3sLqT1PDrg907TKdQTnGq5Z3MXNZNyvfXD2adwXz2X3VAt/LCPGyBAKo18f
	 snj9l6UsMdMZt1CqVpv9Dg3w4CjQlKsN96Es3TiDP4gLJ45ve+CYQxpnK1wfO2j8Am8FZ
	 jZZ3flKaQ8eVdaUcReLsFmgbSGOH7hVUudp4QXYeRI4HoU5RlMZBYQFuthxTFs2X+BrZs
	 eJQq0OGnpWFFF90F0MTjx8i98QLKpNEZZ2/XEz3wPtSPTo71APoKtyYWo99ytSYNaHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I1BJ9Ej2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gd4qpgxe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD535606A32D
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 17:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD535606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I1BJ9Ej2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gd4qpgxe
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEHpRnv3677625
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 17:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ypaNDTkykj50DMxDhN5W20
	Hg9WT0vYVFy5lXvRf87JQ=; b=I1BJ9Ej2BKfPwaryBVNR5KD+hlB4lYjAN2ybzi
	fqiWTiUQ660R+q3Aybg3fKDWh2I8SOWdp4mX52yeheyb5pI2MWITu7pwqodi/rGX
	QTzvTeiEPSIg2IX7moEueZIRXQmKU0IFROhW2zfe2IpiWXxiUnXL3QdtmeCoqLvb
	7SAi1UQUjnpEgMsuxCLxjNRqIBgtfYxags3OQMx9dxPKk9WY7a0mSoZ4mZDg2Pbx
	lU/tGOwCQ1J4AcT5m+Mn7j+0rI793HJ0bHpg2gfmtU390465iYhfDkgMTMHkOOvM
	bVwaFL7Wiq9/sQeb97JWFG1YLrmZcRhvS++mYctU8Pfk6FWA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhhbp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 17:54:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f3969a2a7so349053285a.2
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 09:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794678889; x=1795283689; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ypaNDTkykj50DMxDhN5W20Hg9WT0vYVFy5lXvRf87JQ=;
        b=Gd4qpgxeE7tvzHR6PyKp1X6A+DfpFNbSA2dB1OeMza8fFSn9XrZIuIkdlT+5IX4SD8
         D5txmt2fdO96DW3GU/MQfaxaewGn5lTJ7liksWOv64xlDW9dcYUvE8egcioG8EK4oeXo
         f90XHCaPyE3fDgyTc1gYKyIzs+VEaTvhp8v9b7BHq3oeKAYYbacOXLGDbqpY/S0WmCwb
         CqF4ZTeCAD99KYRi/kdmLmTvWl/ki+dBBl/jVMYjfgM8WEnIUB5+uT4WORB3DdN8stbK
         /OxSGq9xq9km9eGih++AE179TpaHvHKDSAHBDPNoU1Dl6nfBf/jI9CSJoTY9GSWE4vp9
         8Cog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678889; x=1795283689;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ypaNDTkykj50DMxDhN5W20Hg9WT0vYVFy5lXvRf87JQ=;
        b=S64z+4XMx7JTRey12EziFEe8lbKTn+CBnKjMc5g6ILtZ9OsmBJbGVmnt1nPkZqLTwR
         MYDbSdRp/aymWX1VYK9X+NiqydoJDewVSfg0AuqNzFnEexfSdCWd5cpFDrBKiwaGeCGg
         cAqeaooY0UhtSpD5C5gTgcWIyxlffnITqCuZoPx/qqaSAv19l5mkxWlBODTXyll1ir7E
         ZgKIqNtfs/ZWzErevtEQr/asSn6GPfaPmWOpZx41JTGgGDMITTGhjzyeWmdd5FgwEgG5
         xzvRqvICstkv7rQy+FqBd4zArY03mXmYxvk1NYHY0+vk5P4p/7rgdv4PI/OugexIR/Ud
         aBsQ==
X-Forwarded-Encrypted: i=1; AL+hErFoIEcW6fRPFVEewSBGk80io1FWz5XgvPFTYamwtHWz55tYpN8oxrGIj8PhGm4bedl3qrUGqw7g1n8c@vger.kernel.org
X-Gm-Message-State: APuU4Z8JOvwkvouEActrQ6mabcdzebiGjbRR1abcqOcAvptPeZbLDv5Y
	NT/D6+F4CLHc1sbQHQNXyuqpWjpufoMBhJymni9AegW9kVd3pW6l0q0CXiFDfpykRyXF+izSK3y
	DwlGHZ39CSak/qdab1c5mDlwYtfksOdN/fu1SqeL/fVx8/bo28R4sBrxMM1YK2UeE
X-Gm-Gg: AYBFou2yVpKyLyuP4QkNZDFZ+L7SSqkZpjTQawdofczPjfUYrfZLmE6UFS4HuG5SGCc
	J5fzIlp1agIdTh1QXk/PdV92qzvKkXe3jY3Fzs0+4j6pNIDML6D3Rb1Kh2klSCW5x3GiJ6FrzwH
	24dI9HlL3+TF8h5RsJxlx4xR7xjTnyk6q2E5vpJaKr/U9/5jiy8gDOR4+KJSIe415g1WTvQcsk+
	x/odATMV1CSwCXiDASddzk4qTgsH5HelWxX9A0xI8D8dmE4kHbkS0QF5o1L4qDqtAs8Jcz6N7Mm
	R2JPTBZanABSjhzqP5x3qLk5NZobsnDYchXOoEGNZCPhLj30OmbCFKESSktH+lflE7HwXmWayQh
	Bl53f3EyjvA/Emx8fjSDzHlBgdtzHi85ZyBoFRSP2D/09FLPKVXRvz4ARRwPjW9dSAWRsWA==
X-Received: by 2002:a05:620a:4012:b0:93e:6f43:b2c1 with SMTP id af79cd13be357-9494bb85888mr1013009585a.16.1794678888725;
        Sat, 14 Nov 2026 09:54:48 -0800 (PST)
X-Received: by 2002:a05:620a:4012:b0:93e:6f43:b2c1 with SMTP id af79cd13be357-9494bb85888mr1013004885a.16.1794678888165;
        Sat, 14 Nov 2026 09:54:48 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c888b90d4sm11060292f8f.9.2026.11.14.09.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:54:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 0/4] arm: qcom: display/msm: Require DSI graph endpoint
Date: Sat, 14 Nov 2026 18:54:35 +0100
Message-Id: <20261114-display-msm-of-graph-v4-0-b8de044c6c1b@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNQQ7CIBAF0KsY1mIYirS68h7GBQXGYmypjDYa0
 7tLdePCxs0kP/nz/pORT8ET2y6eLPkhUIhdDmq5YLYx3dHz4HJmUkgNAIK7QP3ZPHhLLY/Ij8n
 0DTeiArO2GlStWH7tk8dwf7P7wyfTrT55e52sqdEEusb0eO8OMPX+TAzABRdYgNBYQVmrXSRaX
 W7mbGPbrvJh09Igvy2YsWS20GGFblOi2rgZq/i25IxVZKtEJ6zQ3mqHP6xxHF9clSk+aQEAAA=
 =
X-Change-ID: 20261110-display-msm-of-graph-a081a5c614b4
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3931;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zGi4k/Gj3ijKyZBujv0aWejXJjnkHLrzLQhAr2kTbFw=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGr4oF6iONK+bdCSxG6Yxlzhx4YpjzBBXcTSQG7c0b/gJIoku
 IkCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJq+KBeAAoJEME3ZuaGi4PXQkIQAILc
 UceKi8f4MJpOmafTP6h5JM4/OeMekgPZtYL7Ou51kMK7Dm7f4X8DM92sO72o4tTq4XxLMfCdtgE
 laG1cweQhuVBZ9CGojJeIWKTIQCiJPWKYMTjJu6T5zhlOFFiKRMmapYLrwaV15JDrQIcS334rhB
 qQ5/otZVESnOS49xVKgVGupfetLhHalnbum3FBJ6mhLXvzxd353U8VzEWWketR7W3oyUpVp53wH
 FH+e3i8GBEPGr05MuOOzk7ZHVXMqiuGzc8/Rc9fBBpR1A4+uHd9ZQp85xE6Y3z7ZDYHDBLe+jox
 deExQx1kgqzEqKmjS842ob/1PAfJsOXLA1CcUR0WSiQXfUwAo4zW+oYXpoN3WOU96KzdzGat/Wx
 g3tHCpyPbcCSGvE3Ob2XN6U7/WHiwPGdUY4qd6yqOjrN1n185bP9/6GUYQnh8v6bWt0iR7givjt
 THFmjXzhO2uOW8Uoc/asCuMIyTqSmg4W3dVqD7DLMrW8CyC95DGUElJiLqy4wWM2skXFCFHAWGa
 oCVmaRjIgUed8aStElj8i6JRvqRLsBEcGnLgyPnJdQcoS1IZCGHqLMKsTwAUlYD/rQhlBThHdev
 06nVStfD8zvJAihwDJXxhfid440bN3H+IX2YV/ZVTU/2HKXF6VZarwfrpegKysFpf3WxVaWRr91
 1qfqu
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: fjakO1UwTKgfPIOTfk8cDyQMWJfCpUqL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA3MSBTYWx0ZWRfX9ZW9R9+B65Wa
 9ohdwmirITEm+V/SDz5k7pUZN0mHGCPHaa/kXO+tzFMYy/eURTJzKaW07VwNvaG/bjtxoOM7G1Y
 FHb+cHr7D7+cd6cy4jcs23+8D2K5mQY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA3MSBTYWx0ZWRfXwwn/8dEyZvw+
 vonpOa9k/45XUEkW196/d2+niduma3S33OiJAJdcKw3DR3R3zNyPa4Dvn1qSbkJXlVlBGU14maW
 w1PJtWf6JmkZT5OgI7IK8vrI0GNHaVkgG2E9YCHWJOMlCYkX0eUFDxWFBG5Z2IbDp9vlVrrXXuJ
 2K1omR498Kj41SsG9wOAGKO5z9WkNE5NfJrh5ohJGuWiaTy7oUxLdJ0BDJvw2tGY5VRxZaeNKVR
 cvxHTPGGqUgYWKcS7mAK8ZpUn+IKmFer3S1FVFQPR6s7KyN5C09pO4nkICOcAUGu/YfpWYk0XE9
 TUvnWQK3rtPfEfptJCVWISR9/HZb1N8istqWZ/rGzoxxjovZ/dSIduQjQtixDz+PLdFZT13ZkZw
 KAwiWNPJoC5RbZJbnj00kRhXzOi/TGAiwKjAOdf3YBMcpti1hOuZu1Ek+hM5vZ9/bi1XZ2v2P+E
 4gxsIbnRT/QI6+tQH0A==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6af8a069 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=_iFXmH2w7s5zJ4zlvgEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: fjakO1UwTKgfPIOTfk8cDyQMWJfCpUqL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140071

The DTS can be applied as is. After that, the bindings can go independently.

Changes in v4:
- Add new patch #3 for msm8996pro-scorpio.
- Link to v3: https://patch.msgid.link/20261112-display-msm-of-graph-v3-0-7fd0c06ec6df@oss.qualcomm.com

Changes in v3:
- Add missing mdss_dsi0 to apq8016 (patch #1)
- Adjust commit msg (no probe failure) of patch #2
- Link to v2: https://patch.msgid.link/20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com

Changes in v2:
- Patch #1: Update also apq8016
- Link to v1: https://patch.msgid.link/20261110-display-msm-of-graph-v1-0-0f3106f817b4@oss.qualcomm.com

Qualcomm DSI display drivers won't work without proper endpoint, so be
explicit about this in the bindings, so we can validate the DTS
properly.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      arm64: dts: qcom: msm8916: Disable disconnected DSI
      arm64: dts: qcom: msm8996-oneplus: Disable disconnected DSI
      arm64: dts: qcom: msm8996pro-scorpio: Disable disconnected DSI
      dt-bindings: display/msm: Require DSI graph endpoint

 .../devicetree/bindings/display/msm/dsi-controller-main.yaml      | 6 ++++++
 .../devicetree/bindings/display/msm/qcom,milos-mdss.yaml          | 1 +
 .../devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml        | 2 ++
 .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml        | 1 +
 .../devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml        | 4 +++-
 .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml        | 8 ++++++--
 .../devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml       | 2 ++
 .../devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml        | 2 ++
 .../devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml         | 1 +
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts                          | 8 ++++++++
 arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts             | 8 ++++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts              | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts                | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts                 | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts            | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi                             | 4 ++++
 arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi              | 2 --
 arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts            | 8 ++++++++
 34 files changed, 100 insertions(+), 5 deletions(-)
---
base-commit: a547b4b87c936ba23a6794128abab0a67c512cd1
change-id: 20261110-display-msm-of-graph-a081a5c614b4

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

