Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE87A46C85E
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091155; cv=none; b=cEhswR9dAEIV5Ho8G9G7Sv/kpot/VVsGyaXujuP6pLJT5z16dx9IpqaVgaHzB2/8VxkSDAk2SCihgmKmHOzSx8qWi0nlqSLUfod9e6xBGpqpAhoDZKjCtEvl6Ck/TA0I4BrFTb9qr48IixYS6DuZYVhi4UK/o69ufw1L/HfLWK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091155; c=relaxed/simple;
	bh=Nf/KBaTAlbBMsxhLsF8RhcE+jTksa6Soav7lSzKAVxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SEOl+88+18HQ6XZhT25UgXf9jPXLBi4ol3V/FJ7FqFu9bpkfgU7KB0fanrA54BUUVXiRww7YVFBeuUjuLRoHPDDrcw9Ue6ubQOAVTN9UFEluEItLoo56EQXYM6MA7D9XYhaGB2TfbSG/XKFKMdrfFs2JA0igwgP/DQwKuVM+gys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Osk/RrxT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HNixzJI/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Osk/RrxT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HNixzJI/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67781BHb3179140
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 08:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KIqPYJlbA7rF5d1r/AkvLWR5NvjW8/gMCr2f1ZNWl/c=; b=Osk/RrxT2fUst6Tn
	VEoaZzWH+YLivYHVFdDuQWrLD9F16mYkUSSx8QApx7xNsFpGa50TwQOb35itUWc6
	Iin6mA8LVSAnVmSsZx1k6nzftw7TbkTgBIICXtMdOCguSsYRyqbr89rSDsx2Gn1i
	V0oYk8uvnOabjlWbmcInvxa2DZTv/8psYlG+9WFaXj/hSGyXEXRzMp8WHxFVQpTW
	v2Yacjc9hVmZcBvGSkBU+TE2TMvFX/vagBzU3CHRyyUf0vHQuT1B9Yq/DcPB8Rq/
	SkiNIJBWot7JToDNTJD2PkE5tuPIlngairCqYg2TWfgj+7Z4oBqjB/Y92fZCOSLT
	xZjDaQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6jjxnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 08:25:53 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab041eced3so4612929a12.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 01:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786091152; x=1786695952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KIqPYJlbA7rF5d1r/AkvLWR5NvjW8/gMCr2f1ZNWl/c=;
        b=HNixzJI/cgeHOB9i/zLXR8MuGWipLGwJ5voMFyCT2p27WjMC2v2SIZsjN/JDtYq6/o
         Bf2w3LINcUhtGak5XVxrXbxK9HKmlgAvP6HU6uVNSQfdTKdJiJSOx3OWu9RN1wkXlJm8
         /LZMO9+sCiczsARFNhMznRhuB1uBAF7isSVdEegRiqG2P0wlfLMmvBmOeCiHc7srvmqn
         oJPw13NuNi1kB8fYi2RsqS/5y1QyTLkBLU+nFsLW5+R1/FCBWfMBWXcQJyDqWoVKXmjZ
         3WBgEIqh1/VD612Jc4UwZuAMUZDLMFgl6fjuuShXNt+ClsegC3Ao8Q7StmvMarCVi7gj
         fX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091152; x=1786695952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KIqPYJlbA7rF5d1r/AkvLWR5NvjW8/gMCr2f1ZNWl/c=;
        b=HMctgZ1T9MQysQD3Vu9luSKKzjo1uIUKENxfc8VtcU+hR5JUw7MnVXLmE8S0OJD5+W
         rSzNiyUe3oUYVeiEPt4Rq6J9THnjCCpfegwG8VfOAPvS2l54rq9TGZVKIg0lViYab5Hy
         pBuPz54c4/5VARLTGO3SAejCaDhYcXImHY46MMHLgVP+f3UGETKWs5dxeLVmeaZFmPRW
         fxzDfz6XzvLQVLhhkSwc/evFMd4q96y9hnlPxwgvdbBTZwIDDjI8XhnbrRf4Kyke58SC
         A9Ur3Vv7IAvuC+WkOE7bSKuUiNRDHiC0LwyjOlmWgh5YS04IElBgbcZzHTDJlGXo+rAi
         U67g==
X-Forwarded-Encrypted: i=1; AHgh+RoIV+MJdxL9HVQlXXjDIamIjVB36J6i6+CPerwaoNWGadXDDxHU19bdDI+u8an1P48HRf65UyfdlkO3@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfv+2ytcph0xTwQfmQSNTBXlYTnOwWXfCMWTvU4kWumiobSedX
	5CeQXr255FNLrWTw7mQ2Mqo8JEXY+szPbGqybrMbxFTQvciHH2HvA57x9Xlb8oiM3QJXvsa02GZ
	UrOu7OFEErVWpfmUuQAVh1ZaBel6vidRxIQmoEmNeEgJ1AAdS85Bzl7EqI3hSNKYc
X-Gm-Gg: AR+sD11/GH4EJqowDazUe1x6B7h772d+ALjfNeTxvW4r2OzTlEtTQxIhHnC7/rOon28
	sMznm7oqhpT0w8VOGXKg+52Pc7DTwPEb1ynU4vvYmNNsaxrq7JVqtt2lg7WBrWkscSCkXC5JRYg
	F6GDHQTXc7V58NItZ3Mf4JF2lgqk+TYP78nqsNtgH9UKISgsowO213eBFmSQYJAGllG2xvl8ajL
	0X7sQrftX2VDnMuaMvYJpDJ6l52R/gU7opjU+wRNtiqGaimd/4C6hC0L3fsHADkHo86am4CFIIt
	UG/fDBofkYcqzRrbNy8PzsO++szqMb98u6m8l/tOpanpfjTXdbSe0skPkJnh9TfjVaqk8dt9FCy
	yGhaE+o6ApWkFyO5vJ7ls/IZ9Gamugtyi2a4=
X-Received: by 2002:a05:6a20:cc0e:b0:3bf:ba48:ca88 with SMTP id adf61e73a8af0-3cb85e6b038mr27056867637.15.1786091152380;
        Fri, 07 Aug 2026 01:25:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:cc0e:b0:3bf:ba48:ca88 with SMTP id adf61e73a8af0-3cb85e6b038mr27056784637.15.1786091151950;
        Fri, 07 Aug 2026 01:25:51 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm5377977eec.28.2026.08.07.01.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:25:51 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 13:54:46 +0530
Subject: [PATCH 02/22] dt-bindings: media: qcom,sm8550-iris: Allow IOVA
 reservation memory-region
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-iris_iova_600mb_fix-v1-2-3996f67e33f9@oss.qualcomm.com>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        cros-qcom-dts-watchers@chromium.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Aniket Masule <amasule@codeaurora.org>,
        Malathi Gottam <quic_mgottam@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Renjiang Han <quic_renjiang@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091113; l=1573;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=ePXyKPqHKmHxQdXKNzIe40a15/+Qo3LlQ1/Mb7xNUTE=;
 b=LmRZcadXMug7v6Rl6ux/wrNXpHQ9eFamDdXetg93qZQ7TknjgL9+luqgWdtMwle2n0hi5gxQ9
 76PPNThwpKXBcA+dKHB+Fq4PuQiaCX+dacIaqFc4mQZd6P96iPGEiMr
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2MSBTYWx0ZWRfXzz1jw55fzC3d
 et2JVk/4KyL9hja+1z68a8SVupDCjU7tNdtkqHVNeADW265W1n/paPJjzx0Y9npQy4+5GN0g751
 R+056fqUB4V4GaN6KlS+0JWX0JnaxSk3RS6U6Y7+NqYW96hzZB9tmN4YORXy13QyB4BN5DRcGeo
 sYITrkBWgnpZzEXvaQEc60dK4trBalH8kPDzRWx068aKaVwpB4oQJTsJ76k86ySEtjyWf62a7/9
 3BnhiwevyYHJRL4SLPub8cfQSp/lCKptCTW/9Jv3Lysz3S3sVROTWoeXTEbnyyaadKmN4l6/fBR
 X10OGSBmI5+lVpTai68YJU9KuA7Qgvan77IXE6Lb6e8mthWzWdFzEvJKt28gtbjLnUz/YazkDHd
 pZxyORfLhRcbyvdCTVvEZfOab5lW/ywTNue27KZ6li6rglUgWak7X0YTbSZIsfBDSynv7xn4r93
 9WlfTVdfEGysc+TAjyQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2MSBTYWx0ZWRfX3DmNDo92qm4v
 2czIkwqmn1wK3IJbMfcQoLdgRcZoZUEqF0b7TWtNGbUJL5NJDfjbOYSHckD5sO3vVpHGDxQ7cjz
 d59dBs/Xl7KJ+sGdchiq1MxZJ0FuxqI=
X-Proofpoint-ORIG-GUID: pmXyigvsr8SXDQAmhstiYcRraOJdl1t4
X-Proofpoint-GUID: pmXyigvsr8SXDQAmhstiYcRraOJdl1t4
X-Authority-Analysis: v=2.4 cv=e5Y2j6p/ c=1 sm=1 tr=0 ts=6a759691 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=t9ty7G3lAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OD5a0iPE9_tbS_7HGJYA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070061

From: Daniel J Blueman <daniel@quora.org>

Non-pixel stream IDs should not allocate IOVA space from the 0 to 600MB
restricted region, as this region is reserved exclusively for secure
non-pixel.

In addition to the firmware-loaded codec carveout, Iris platforms need
to declare an IOMMU IOVA reservation (a reserved-memory node with
iommu-addresses) to keep DMA away from restricted IOVA range.

Permit a second memory-region phandle for this purpose, and describe
the meaning of each entry so the ordering is unambiguous.

Fixes: 9065340ac04d ("arm64: dts: qcom: x1e80100: Add IRIS video codec")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel J Blueman <daniel@quora.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 0400ca1bff05dcef6b742c3fbf77e38adca9f280..7dff7293fd5c834b0ea617ece87ffbf0d40e821a 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -84,7 +84,10 @@ properties:
   dma-coherent: true
 
   memory-region:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Firmware-loaded codec carveout
+      - description: IOMMU IOVA reservation region
 
   operating-points-v2: true
 

-- 
2.34.1

