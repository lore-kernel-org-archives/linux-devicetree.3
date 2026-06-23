Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182FB3A9DB1
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 05:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782194198; cv=none; b=o8cpPRTfeUI8GdW4YtnQOOH7KC3AVz9uUREEbEZUJ0CJ5Fbe3uOL9ZHVwpxhxxrMFsrDs5rqcbmreqL35pRsJhfCoa/OT7TJKoCisFbiHMr7DXuZXTaLMDYlcXq7tuAj/VDeEkn3MhLGJuKng4Q9e8SwPrnUefhI3Y1Ii/qKJ5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782194198; c=relaxed/simple;
	bh=38hp3yau3RDTeW0oghznzoTSMclkrDug0F9GSJUr8b4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WPliQ0/C/N6qQA+dezYpSciqOuCLIh7XkwobKR1R0MATcs8+biFRAqOYAvQu54+MfMw+RPmdKtgJ3isekxJsfOxJs1PJBvzhiX8Eq0nxa5lG1x38aaZsh+2Rul0+i599Ei2GdbkZOdGY44J/CVx4GCOZtJTWYqEfoqVy/4Ld4Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvZ+qfxz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gD1oWtBa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvZ+qfxz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gD1oWtBa"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N0l2Pv2869382
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 05:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PUkNBK1opUpsH3sD9JrtSJHZXqqd2H2Eza2
	2wRUqSHM=; b=kvZ+qfxzblWnPpLzCCUN9E6wVvShPr31cBpABbm6nK4SxP4yyVI
	GjXxtSY+TL3e0MgPrvX0cH7ZjE8MAEJNwma7kjZ4L/57I78NgghSgubLO9UkYCZs
	1YuUzvDlB3QKJ4FLKO/bz25JQMLtFi4b5AefcIm9f+nuk0oidXBpGvwEcGH0wNZm
	/ny8ObuL5YF4XGRr8AVJRrCTta2Mz88woNVWYo5ZOXONjePyaphg+jW0xibatXYx
	EoLC7Gr5J6WRP/CFOKaThyLTPgTljERJIBjA73xs24GyRCqFlVaVaC5ysVlXLacL
	n2Yj7PSGhHvXdzIwWxBnlSzNnAs7QL/PtRw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey6tmtwfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 05:56:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915d1d4fc5aso945068685a.3
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 22:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782194195; x=1782798995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PUkNBK1opUpsH3sD9JrtSJHZXqqd2H2Eza22wRUqSHM=;
        b=gD1oWtBa5tho03gSlYwkxYqMkcSqJ10K0Mm7BDvhi3p29x4RONVztMnejfc1vFdTwh
         ua9GRh5XY/hfeMQ2W16qe4niUNR2y8/DLK3U39axJX+aWL4x5xu5wdVL8ssqJN/U5AGV
         rUg2GxLndjADBTSqXyKVf1T+RVqc3JLsoIzjinvG1nwklVFjNE9iheF5UBAz8dzPXn3C
         lRm2QrDsTuw4BckqFbbs9axRrZYflNyw2lHUu/NrE/MLifiaL7RNrCBlBfNTu54wXpdh
         ry7Mhn8m9dshlwxTSO/axLxJ4z+utvQDu5hAOSEty+VFLo09HivSElW79oVC3y9ljVV1
         W6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782194195; x=1782798995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PUkNBK1opUpsH3sD9JrtSJHZXqqd2H2Eza22wRUqSHM=;
        b=daImboqeF3q+Ei/rtk1vFjykuDIUwb0SMmueKKUa88DoyO0Sz5WLAh6dPUBNcnkVqn
         +lfSIYAfpxQLBsfqr/Zv5nxw5i2mQMojXTtL+MfXqmMPHc9GyTgii5XxVtM46X4O5D7U
         rcTgOHbfYevugA5x2sVIK09oioVqzXBr7NQFzaKWapkMO2PxS2O0PW0BTmgowaEHDTvA
         qEOvHnYQGVdbUOD+VUhxPmoXuy/5lb2JTekzvFX2NOO4y8Jr04NDL4xt1W2K9PFTFfrr
         UzLoFyTMJzZWJsIU+YAuwI22R7BoCqCf/BWMmuc7X12R+dzRqFjiKVTSSXJm34MLcKvH
         Z0yw==
X-Forwarded-Encrypted: i=1; AFNElJ/CLriOr7V8z7dNndQ+FdJRn/PrSxoCGqcwhzmpXheBf0kLhCtkPDkK4dfM4PFc0aZIRMMSH1YEUfwq@vger.kernel.org
X-Gm-Message-State: AOJu0YwTrQomBodk92NOhJGAfbtV8VP/5ZihYTQ0kONuFFPVC7TSzZ2N
	DUXoV9e70CezjnoFTOA8FRbgEPCFhdaoUy0GyLA+F7UpmLzgJ+gziL9b018NYB55mcTLqaLHQuc
	XttOLAFT0gaRoUKEyESAojLwNu33q6rfLfiDVO6RR3cyl/nex8ihDvr/En5J0qWLS
X-Gm-Gg: AfdE7ckjjfAtkzamoey8KDI6VCd80sg2yPKamolnke7wylnPIWlc4YfempliT7E8Nz8
	cw37c2uMezjvT+Hhr5U+/iXXHr/rl/mH7yg0cfbWDjOpUR4KRSGQmLzjPRUfCdrFMSsRjrHrJlk
	qKrMwcOzCrOvJwUNap56hIxlMvprXfu4rpkgRluDJV1AGQKygdVKDZyo+Jya8mNKoblqE8JBZXm
	RlIpPZKyoiS8GWFMotXjK3MPUmSvk0WSA0QQV2JyeWTbEKuHuGar9SKE9OE7uvgs+i6wH9tRDKN
	9l4zcCfsIU0OnIVLeUTiWzTv4sL7tijxImzT877AzKc2pEEL44sEtgrkgLjEsBXyoMOGsxx/5y9
	NSzpaYNR7ypaC7klXQQ9vn60q5ug=
X-Received: by 2002:a05:620a:4481:b0:915:d32a:1cba with SMTP id af79cd13be357-92646584105mr267942985a.27.1782194195068;
        Mon, 22 Jun 2026 22:56:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4481:b0:915:d32a:1cba with SMTP id af79cd13be357-92646584105mr267940485a.27.1782194194509;
        Mon, 22 Jun 2026 22:56:34 -0700 (PDT)
Received: from quoll ([178.197.218.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49249207dabsm472730495e9.0.2026.06.22.22.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 22:56:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Barnabas Czeman <barnabas.czeman@mainlining.org>,
        Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: clock: Replace bouncing emails
Date: Tue, 23 Jun 2026 07:56:27 +0200
Message-ID: <20260623055626.23814-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2088; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=38hp3yau3RDTeW0oghznzoTSMclkrDug0F9GSJUr8b4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqOiAKYsNS6tRKh5vJxix7/ly3bWTgUxwiqMBSo
 F0mmQGmFtqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCajogCgAKCRDBN2bmhouD
 11mQD/4n+LkA+3kQ6RSk2nVSLPIh+GVx1iNsnmEBK0+sjPsuWzEyhtFCkt4QTnaac/9wzAzM91Q
 UF27QIyy80KmCXPSBAXSGaD7G9WOQ72IdPBOU2liUucSQ0qSdN+oyd7UK/l8A6jGhJzp57sqBol
 gX19h8Byp1PVTjJVSBKpNKoYJIYCiG82MqKA7gNXGXL5/IDODVDVsneNhoJS+Mjtz7cuPfu5YMk
 EvQPIXCGNRWOxnGuihKh7O9JnfaWxXyzW5LGPWBiSEbQL/sZiIV6mKSEPh+psP2cSH/cDlTK7TD
 jcHuAHHQJmcT2qYNbLx6X9lNQf/9McOngnRHGpTW/82sPvg5/e1xhxTvxesJayz3vw+pIWq4NNN
 3R9beskLV9WnING8FFr7EknYYKmKJaKDZrp29705xjaI9E/2HIkrmhSWeluX8tASI7JVGQawmyA
 V4BIcHTda/ZQ+aVDrTdMQsxvI/PWCXrqIhqvGCiRjr3zjybX6Eh0eSn49W3BE2FMfoUHoa82TC/
 VBbVPXffhf36fPRM9Chl9EFEilnbIIY8SmPC/ogDRlv/i9YDassuN6aGDgLLchLIdnb4mRgsz8t
 009ChylQcO/SkI88HDEoSzGhH0ZeK0J/2ngpFMEzheiWyBAncO2f1XJmOiA/cUE5kEGEEfF6uAq UYWs/dOg3gQOJmA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA0NSBTYWx0ZWRfX5JxX//DSmflV
 IO5tR/ykhET8bcfF9J6vsOXINaVPWu2BvCGUw8OZF7nnOMHvDC+Pa0PG9ntlZzc76Rhb3xJGdP8
 n5DniZ+YHL3W/BAEDkH6D0F5GwxBsGw=
X-Proofpoint-GUID: V-VuH1-60PzzuLBZCmdQRFghT73evCl6
X-Proofpoint-ORIG-GUID: V-VuH1-60PzzuLBZCmdQRFghT73evCl6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA0NSBTYWx0ZWRfX7S7ywvvKa3hL
 zNL8NIrSN5AczFzRQFfbCc7KTOBwkHRXZ0ZMIqGFs38mZLelHGVFm0HoLarAUo0ieLauC/5ZCcW
 c3yvooJ4TrID008c1rq4xCdP93QjlUqym7FjlhuQiyqJaMUOm66fPe7BivMjCTZeoOClSpTFHwR
 F+WkkW1EKPr7DsHQFnfpcvKGaw4DXX6MfH+FcWRgZqmeXRQ0ncbH+3qJFFxf76xcsZTI74xgUGq
 bZGtsyMxgKt1BnKdW/Z3EvYe8ZQcTLnDfB83QQVNW2wjdhHmZ5l1rXMQob5mxnUdrJtXEpfCeU/
 Vv4Zl/b8x562KNLNrMx50wvHuqiCsidkrPuYKNlAekTxhaP7/ATBJDN8yYjfDntoWrdz/D9Om6I
 p8gxJ2JStOz3zVA9O/5euIYmLqt6RWr902tPg0Njfp4c+Y8MPGzuCy9rXmrS1wodVf7DgaywIpD
 ZG2CnjCHybmzmufdLXw==
X-Authority-Analysis: v=2.4 cv=H4HrBeYi c=1 sm=1 tr=0 ts=6a3a2014 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=qMZSjPy+XpteAuilWfML4g==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=sfOm8-O8AAAA:8 a=OuZLqq7tAAAA:8 a=hD80L64hAAAA:8
 a=VwQbUJbxAAAA:8 a=Dav5TBI4JZG5gbSsjs8A:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=TvTJqdcANYtsRzA46cdi:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_01,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230045

Replace permanently bouncing email addresses (550 5.1.1 Recipient address
rejected) of Adam Skladowski, Sireesh Kodali and Chanho Park.  There are
no new messages from them via other email addresses, so drop them
permanently.  Add Alim Akhtar to Samsung ExynosAutov9 SoC clocks,
because he looks at other Samsung clock hardware and drivers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Stephen, can you take this directly?
---
 Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml   | 2 --
 .../devicetree/bindings/clock/samsung,exynosautov9-clock.yaml   | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
index fc0360554f68..9f2b970bfb48 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
@@ -7,8 +7,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Global Clock & Reset Controller on MSM8937, MSM8940, MSM8953 and SDM439
 
 maintainers:
-  - Adam Skladowski <a_skl39@protonmail.com>
-  - Sireesh Kodali <sireeshkodali@protonmail.com>
   - Barnabas Czeman <barnabas.czeman@mainlining.org>
 
 description: |
diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
index e9d17d48b4f3..3dcdfa7a8792 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung Exynos Auto v9 SoC clock controller
 
 maintainers:
-  - Chanho Park <chanho61.park@samsung.com>
+  - Alim Akhtar <alim.akhtar@samsung.com>
   - Chanwoo Choi <cw00.choi@samsung.com>
   - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
-- 
2.53.0

