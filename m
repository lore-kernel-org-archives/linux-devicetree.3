Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A84A2C11E4
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779325803; cv=none; b=svS/EgTWkIfCxDBtaSSnm0P6SFAnzsYUhFvm+TsGIf6snYq293lZXctUUIe8LYlfev6YYOXXC2PA3u6P07nRMgyQoNc224TXBFO8pRCELn0jqJprkWPIz0s63pm0T304dwbbJbBaN9Vir/B4ARJ1w8H44jF20QUpD6Ni/JxCLyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779325803; c=relaxed/simple;
	bh=sHaXDiFQgCt9FlMExLxzDgxjno95mKMkDP35FvdVBDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JHNMX8UE4no6VS95TtxOrgdyLJ8sjnvzssSXa74GjlkAAYA+rUno3kDsOFj9s9uLtl2/Mz/kFeFNoqNYbVYTa7ytCnqP6zWQmSQ8DPz/XMEBN1FA2PdcIk9snFnXCsBV4Sd4H+EMd7us/yxtwkxFBwXvc77qvipirDfPyiWbs4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RvtUmOFa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XEgEIMtU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RvtUmOFa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XEgEIMtU"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KIdhS13085238
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6dRmKU+5SKA
	eTGqRwOTPOTFNGFIlyQSi7HHIupFI5YQ=; b=RvtUmOFagx+eHfpxxq6rjUTfilI
	euKm7aBxgbzV3OT0CzQHG41jKBf3tmXSeJpOqcbEkZRVWNEE68GMiOWAf5UpvPC4
	Y4DC72ITFVnisxFwPmHcGC3u7MTborwBg0CjY67UV8ox6E7Yzx7mv8/MAAwLtiFJ
	jzTTE0qaDui360rDvUh5uIsVP/gPkCK5KFRAc5am9HodzF091HDqb+ZbOzsOvNJZ
	Jy1i//VZW11+brqSO4IDNkclNsHarFAwFi5iQWgXxPwt/UEq99n4n9GM7qYdP+oc
	rq2Eju3JxMo4cejU+UQ1kWXaQUbAuAtTKpRszrjajfRwCZlysDM+wWP9VHg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f2xfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:10:00 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7bd5c9e1826so80093937b3.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 18:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779325800; x=1779930600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dRmKU+5SKAeTGqRwOTPOTFNGFIlyQSi7HHIupFI5YQ=;
        b=XEgEIMtUcquy9MFM0oxEXfZSZww63VusKKrerY10ZF+POQghArIrBnMhYGfTfG5qWS
         kL8d9A5EiMqlB9k2+igUdhZhXsTxte7OF8/h1xH6WsArzRb77vFcCPON2gKeBWHbMsMS
         JMddp7AI+s4lirQyUFF6xaHQfVbI8g9DRMjz6UPYR8jkmVScEhWFk+eImoVRf3iuF9m+
         IIavycYnq/75L19NGtvsRKvF+K9rigLLnOdwZH32mcDM5ExxsSInWcBFId0yScyVetfL
         ekNDnfcc1QwKLrYnMviv3DMPE7I+5I8GbJB0v20dMuijKrSVNyEZy9Nc2P0PXFL1VJX4
         y++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779325800; x=1779930600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6dRmKU+5SKAeTGqRwOTPOTFNGFIlyQSi7HHIupFI5YQ=;
        b=N0cTAI61tOuX/rrUXBQ88kgyLSa3t5vM4896R7nvcRtBsL5yNXFsJoopMibJ20wKMo
         aTD1+gcQLWpzQ8rvvrlKuA2/6sMrKzIYBZZ+JBMrsfNHwiqZIzWB8vmN0a16zf4sX5Qk
         ryUQPAy7mbSDi+FJsy5rNLoO6Wpeeei+MOFkIWqEGmUIGCgll9V6oDwcEEbR3svPglGD
         fiFR//Y4QGmRkYySQfmCv1lR+bdq5B482k063BIsenuT6HfjOoHWDKXRQtoJzf8R9Nn/
         Zq7G7fotfSyhXVaKof8jzO2R1PUkbpwnpZeKl2VTF4grcRjyvIynqEkxUL1zSujkFZTw
         b+pw==
X-Forwarded-Encrypted: i=1; AFNElJ/uHxYo8Z1OG7pVy2AU2rkMtjOP36/6olrkWKUaj2NJoWEX4EftA+GoK46xMtHu/eJPiW2p6xE+2rLH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6+x7h6LpbaGhl/3xkt+CXQXJAGWNS2gXlG32v1fpPN5XB2ipK
	nzniaxF+sIjmCaqXG1zzVqTIgTzRpnNQ8voAqRC8zCVlW559fWn6ret5VWZ2+PejsXzqbPq0oqj
	HI3EWqdEDulue8iqo9lvFTTNw+yP7gPB39nazzWmif9YYGgj5HVOE3TLG2h9kbuZl
X-Gm-Gg: Acq92OFHfNQlVjfMS2bn8Q2oT/tIhdq92BIYG7Jlkf/miqqA6DycR0ko1+j6zifyh61
	J/rTJFm5/BX7A0Stj7Fbfk04mvV6O8/v2o/PhN2WswWcRrlE6AIkk87TtclEPQqlLojMkvQ81WG
	qkx3A+uAUoOxldNbwFX0+BSkvQ9jmhgNHu51lehVwaA3OHRvPcM6A9UqZV4FWDFKyvbOpaIFHa9
	A3X/3fT2rDvjDYcOJLh/AaBnTRHoPl+YPwt5D1y1npH1QNPJA6B1X4tQCu9uUN2QmoNeOh4qoMB
	HD9G0IjoOddg6fnqPcd8oZH1plvjRyU/w0hNhxWV5Ca0bQbQa0kQfTR9oRs+Eq8urza4Opm42Gi
	c5kyqqRv3m8F+527FSyUoWwgXClksw7UyDCJrzox4pBEet0Du//tzex6qc0/ZHvZ7yZJ/83fKgu
	phE9dRIMj0DMrD3gM=
X-Received: by 2002:a05:690c:9990:b0:7bf:b4a:179b with SMTP id 00721157ae682-7d20d50e192mr7151107b3.18.1779325800424;
        Wed, 20 May 2026 18:10:00 -0700 (PDT)
X-Received: by 2002:a05:690c:9990:b0:7bf:b4a:179b with SMTP id 00721157ae682-7d20d50e192mr7150837b3.18.1779325800058;
        Wed, 20 May 2026 18:10:00 -0700 (PDT)
Received: from scottml-Latitude-7455 (107-198-5-8.lightspeed.irvnca.sbcglobal.net. [107.198.5.8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc991c98d9sm60851307b3.10.2026.05.20.18.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 18:09:59 -0700 (PDT)
From: Michael Scott <mike.scott@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org
Cc: vkoul@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        abelvesa@kernel.org, faisal.hassan@oss.qualcomm.com,
        linux-phy@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org, val@packett.cool,
        bryan.odonoghue@linaro.org, laurentiu.tudor1@dell.com,
        alex.vinarskis@gmail.com, linux-kernel@vger.kernel.org,
        Michael Scott <mike.scott@oss.qualcomm.com>, stable@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: qcom: x1-dell-thena: mark l12b and l15b always-on
Date: Wed, 20 May 2026 18:09:34 -0700
Message-ID: <20260521010935.1333494-4-mike.scott@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
References: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0e5b68 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=cdagev08qavQYXHyx3V8vg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=CbK1FIr4-MOfYfEwsVEA:9 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: zt721wT5uers0KHfi2ZDBy-8-kQWNX20
X-Proofpoint-ORIG-GUID: zt721wT5uers0KHfi2ZDBy-8-kQWNX20
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDAwOCBTYWx0ZWRfX2XiKVc33SzkZ
 G20o86en1GOv26OBV+hbwp81uP4DgyXfNdN1uj+la4aZ5ILzc5xFNCucN6hYIL+6SgE2gIMfk3q
 lZY4cmYwZEPkOYlsybLNyGBDR6YEmUGhCND83YzFL7yn84L4+y1u9An9X/KBsZnIKIugBjUQDTa
 1aSGY9HUP9sHspvA6bWTXkLgPW8FxcUNOVx+Am7PWerRZuS3WAwgNlAGwMyhWyY1XiFicbEgE1K
 SygeDugaTBlGP2AAeM5CnKO6EkcNpwLb5YaRklAenc8/BxSmh2zjOIPo6AjdOL0X/zUpeZDFl6L
 Esx8wbW8HXr9vE5ICRujuyEmD32lrVU5i0lw21ygLw9zcjhwbOGeKbOKaU6lp1EacNeBoETj5Ty
 BMuY9xPCQAjje+9s6hHU69labpzEQTpboy+wiJIvuL4SlrN6BM5SrEsXowsKcmHfSr7/otomk5K
 //H5a5BN86k4BDO64pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210008

The l12b and l15b supplies are used by components that are not (fully)
described (and some never will be) and must never be disabled.

Mark the regulators as always-on to prevent them from being disabled,
for example, when consumers probe defer or suspend.

Note that these supplies currently have no consumers described in
mainline for dell-thena beyond the audio codec (vdd-buck/vdd-rxtx/
vdd-io on wcd938x), which can release them when the codec goes idle.
The board-level gpio-fixed regulators that feed the Type-C retimer's
VDDIO and other rails are not described with a vin-supply link, so
the kernel cannot keep their parent LDOs alive on its own.

This mirrors the same change Johan Hovold applied to every other
X1E80100 board in a March 2025 series; commit 63169c07d740
("arm64: dts: qcom: x1e80100-dell-xps13-9345: mark l12b and l15b always-on")
is representative. The dell-thena board file was introduced four months
later and did not inherit that change; this patch closes the gap.

Fixes: e7733b42111c ("arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455")
Cc: stable@vger.kernel.org
Signed-off-by: Michael Scott <mike.scott@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index db291730130c..d6de4da02dcd 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -589,6 +589,7 @@ vreg_l12b_1p2: ldo12 {
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
 		};
 
 		vreg_l13b_3p0: ldo13 {
@@ -610,6 +611,7 @@ vreg_l15b_1p8: ldo15 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
 		};
 	};
 
-- 
2.53.0

