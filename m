Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793453013;
	b=Fpe7YhpWYk11nfIM1MHCgwIv30SQFqskUmS/0X0iuJkjLzPN+uanQ6sp9GMOQqiphp2+
	 7zXLghy2MMR+90YwFB16YBHzyUtLZeDlSFMtmtu9lMrdg9VITHL+S6sy1RWIWlAKC22d5
	 QlqFV+nAnlgOcXcbjQwu6eGKkKDltZ4gH4SmqSwrK63+hKtcbBGNNgXGY50IfeT7OGsNF
	 8EWOtRuEeD30k26gvPDOI3dBJnmNo/H4s2KBc5S87Q3eUXalXmxImLjVUN6ux6q5ijanH
	 ss1v0rhRS6tRvT+y7cg2Q/S9vHeK+gz8RkRfpm41XVvZErZ3XFUDaZHSjMg6huyIkiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793453013;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4JcE/VNendmPfJ887BCBrP94/QxycFFpBFFllayWf30=;
	b=1sNgGMDURl5VGIa9OjJqxZ93vAUc8LkYG1M8nRdK+/qs3yXoLUJhSv6D632MXl3HAFNR
	 qAyzldw1fe8HoLS2SIV6Pp5yM0UNyoVao7qDZh9qtzTcOKOReF8bkkRVYeksKX4QCNgsF
	 uveSsjJXF+A3LXZ1ooz2zcPVRpGFZDEcRtPehBqGV61t427akKLfi+hZBrlJqSby+FGAN
	 aYkSvLr7lDCCzJPFU4Yz59IlCupfEqVEIyJKel+HQAhWBKsAH3FtmQ32zKZye6taEgjy4
	 l2G1jYU7CN+oGkoo1MnYuZZ/FnsilD10wtSkHodmKC/2PCerIcE7Fd2RlKhLYX81HnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c2rYv4TF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="cfWAd/M9";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763AB606A324
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:23:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 763AB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c2rYv4TF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cfWAd/M9
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD02wG590455
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4JcE/VNendmPfJ887BCBrP94/QxycFFpBFFllayWf30=; b=c2rYv4TFvpuDjNPm
	KvBMRy+iSTWSiOtIftr04F/V9HhCFxI/wLZ5yRWabtjLd9wLXBAl/7Vc3rZn5zCX
	jXXIvXn/t84nHzBCkyF8HgPNwXnG/Y7eJENNVAs5rwB56+KB4t0xPNB/o11hxQYN
	Oh12Y0z8QJTPo6xKslvcRtLnOJEo+7Bg20vPDnHegfJ5pF+9FSelZliEdrQc3x7L
	bDNLoD0keSOm77meQ5U/l0vdLdSZTm+Yfz1yXmOy6/vcitj6cwse7bR4yP94pwGL
	9u114U59lxpImBxyx/ZkVU0pQhl+OQBFvSfcnNG+L5U47rIkyDvu+aO6N6WVVrjv
	32whcQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9gk10bv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:23:32 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso3045788eec.0
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 06:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793453012; x=1794057812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4JcE/VNendmPfJ887BCBrP94/QxycFFpBFFllayWf30=;
        b=cfWAd/M9XiKmc0YsI0jZKS+fXOdzXm40BCLWHLhBivjVDra++ShmAjQcCr7slyqC12
         +7slbV3+R8iKXAtcCOvUyEJsgM62mwScqK/iHHtHksH5fONQvEwAIfhZD9uiqoYYFYrs
         xoIjQHA56kH1xiQuraYyXLSdiabtBpLBoRHHruceEdQGH2FrsrKSfaaPDUjpoiwiaUTH
         91PGt+OF6JWMHQ24+FLdOjQi6xDaYNj5Y4WKn7YThB+0ZsPIsTp+5di7pyzanIFvB40H
         1GsLG7NJL+3puyzwmkfIbrbhwv2CHFGCw/t4H7WZt4IYA9+AHvlJc7oZ12BoIUF5l21S
         OKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793453012; x=1794057812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4JcE/VNendmPfJ887BCBrP94/QxycFFpBFFllayWf30=;
        b=AR1VFS3UIEYFEnQM4in4njOfQbHS3aT2CHFHmKAakKQp99Jq5uF5S7gmsHqkasxV2P
         dIS1TtPGtqX6FAhZgibr8jqXjmntLFOTyasgNSH0mKV66SSlmr5sQclAMGkAvwOd1wE9
         NaOOETBErhdgFawcTfiAQvFbSQZajHvBBHNUj+E2RMRryMpq5wPTzZxv9JMsVJketo9W
         Xatt/6t+lwN14nHs6L1KVm4WUvdxkKTVAy9+ho+RDSxTK3mVTpA0DXGy7FIqnbF8KzVT
         JQivfHsNVfGiBPJ+hxxdZ2PhjCUW5ijIREezwXSteIA1ez3HiLvPq2JLY4Wd4pu8u3cd
         ropg==
X-Forwarded-Encrypted: i=1; AKwUvBxHuudyLxFFS1ZN0SWI5DL7I9bY3xp1xjrf5jGvs8BOu37pv+GgSaaUbNiA3/Ey+LXBv7GTECuQ8Sie@vger.kernel.org
X-Gm-Message-State: AFq9FYLQbDSb2Yk2YfXfqmwiXcy+lCjwdX3EWoPW2pdTjiGer49406K+
	gZW+ldsnYH4HSOC1S60BgcOWjAfhGj5MWOuzcVotplYrIHB5X2Ug0N52g7h5ZBJD3O3T7/3YycC
	PGtvWAYRMFZ8rbn3nuQlpe1e+J9LOuIYjX5Lei6HfKwlkA6Fbk5BmumzBw4hoBVZM
X-Gm-Gg: AYBFou1IzJtbR4/7viBRwuoxTdTwi/AXj9CsQ4ohvE944q0hLlbAT0e37IPknQC+0OA
	g5ec1je1c7je0bgJbEZ1sCR2eZC912OGRprdofAuvzsifyOy6WxZRo0Enccvqi38D8Guqce0i2d
	w0AkkKS464DFNSkKdtSRhVuGKMNfA9Yygtyw4eF3zws27uFe0wpPWGiOR6RznMnlERHL2jsOREw
	yoZMssIgJBH+zWtvJJc+ht15jKrJU3oJ9fKzmJnm/wyXczSS4gUSMcKC+PNoVROyEzkwpCidMWY
	ORg6W/BDhdtvwj6c1RTbWCGkVXnu9AjwAPrp7TUEmLqPdg/BQgBXznkr94QwAoVzpTrn1aowoN0
	Oxbg38rTrbcxvgDx46+TQQJISUXD/LmwC4d12Y1xOlTZ2nagiOjUoMuxga0Wak8sUg1wE3JCPVz
	f7fd0=
X-Received: by 2002:a05:7023:a42:b0:151:ece6:b16b with SMTP id a92af1059eb24-1ac5da755bdmr6447675c88.7.1793453011907;
        Sat, 31 Oct 2026 06:23:31 -0700 (PDT)
X-Received: by 2002:a05:7023:a42:b0:151:ece6:b16b with SMTP id a92af1059eb24-1ac5da755bdmr6447639c88.7.1793453011363;
        Sat, 31 Oct 2026 06:23:31 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm18234699c88.11.2026.10.31.06.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:23:31 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 18:52:49 +0530
Subject: [PATCH v2 3/6] dt-bindings: thermal: qcom-tsens: document qcm6490
 tsens
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
Message-Id: <20261031-thermal_bin-v2-3-d76fd073ae98@oss.qualcomm.com>
References: <20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com>
In-Reply-To: <20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793452983; l=1770;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=TcfZeA/waj0J1JOXR5aaLYuqHVj1MdThFVHzlUlOpuM=;
 b=3Y/Y8DbkZHHp3RmsPF7huUN5sZdXxDlrfYSb4AnGAX7ah8k0vgRRAhqdE3cqbDQfR5sGu2+PZ
 7TYJIsaVQ5PBy0wh7txpYwXCTPVpNpEBj0EUwzhS/kiaSbYPtHjVPLc
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-GUID: l9lD6aj4l9ew66m_cRZZ-Hoofyb2iCiz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfXxpbmI8YJyB5Y
 uN/PTPWv+8iVtF+BcQNhnvpPPGz217uJuQyj6RQmwWJnWb/r9Ohfgvb1xibE8Ay+BNuTE+YeWrk
 msDct+B16kWnfhusUI2875uRoqKpIiF1ctPIUehELqczqlbQH+q8mqdUFtlyqmOyZ4mzWmEh9YQ
 a3H2nfJxlGi7FMQZDX+DLeliWJ9IyoYv56SuXo/0BkG/jUFZTrHq5CjsylmpCzAKH1yPKF7rvFS
 ay5UHGYat6tOKtDDQhl9jizHkGTy+3vLoKIl/R8V7mT9lgZB7hd8WY5x7EEWOohEkV6OTefAZfS
 EH3ASxD/1b9nsmC2lZfo+vmK/Tz2qxHEpsRKGXMqJMVW33Vbr0IqVuqLWvW7zLONGxCQCS8x0PO
 AeTm1gczljHAIknj8O+II5D7FjZfD4hwS2d5vRUPRuAGERcHK1fHaSO3wBNRuKHWXPXmh4iaB8m
 Qp8gM5f0QPrkPtosTgg==
X-Authority-Analysis: v=2.4 cv=HNBWhYtv c=1 sm=1 tr=0 ts=6ae5ebd4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VzBDfsQTI6wPN1YFWBEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfX4ervjxnUfBR9
 kR0UCm/hYHNCDPp0STQ7gel9eIrhfMPH8jyeOJf/GUQO61886Yr4lP4P1GdugyPzTPY6Wmp6dp8
 hItcVNjBpMFRnOyuI/Y4nnoOdv59xPs=
X-Proofpoint-ORIG-GUID: l9lD6aj4l9ew66m_cRZZ-Hoofyb2iCiz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310053

From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

QCM6490 uses a tsens-v2 IP block and supports hardware-binned critical
trip points. Add its compatible to the tsens-v2 enum.

SoCs that support hardware-bin critical trips read their manufacturing
bin from qfprom fuse cells rather than the usual calibration cells: a
single "i-temp" bit on hamoa/purwa-class parts, and a "jtag-id"/
"feat-id" pair on sc7280/qcm6490. Extend nvmem-cell-names with two
oneOf branches so these fuse-cell names validate.

Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 5a8f7673e730..6899f07ec218 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -65,6 +65,7 @@ properties:
               - qcom,msm8996-tsens
               - qcom,msm8998-tsens
               - qcom,qcm2290-tsens
+              - qcom,qcm6490-tsens
               - qcom,qcs8300-tsens
               - qcom,qcs615-tsens
               - qcom,sa8255p-tsens
@@ -244,6 +245,13 @@ properties:
           - pattern: '^tsens_sens[0-9]+_off$'
           - pattern: '^tsens_sens[0-9]+_off$'
           - pattern: '^tsens_sens[0-9]+_off$'
+        # hardware-binning fuse cells: a single i-temp bit
+      - items:
+          - const: i-temp
+        # hardware-binning fuse cells: jtag-id and feature-id
+      - items:
+          - const: jtag-id
+          - const: feat-id
 
   "#qcom,sensors":
     description:

-- 
2.34.1

