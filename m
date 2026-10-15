Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778704E325D
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054739; cv=none; b=J5HryxyGDDiHfeCWTS8Co9ASRnCxSizceB1CBvHPn1FJEcwVm5wDDeLaDqEDZ5UO/yO8GpDjybUNzZoQ8jdJeWFlfFTXrH3LL0PeuLWZKTcIGHK/XL0KCapW0WVU+ENzil0FnwyS4oQF2YvQf1eGq6eDFYsRSmCdL0f8YQkNv94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054739; c=relaxed/simple;
	bh=bW8kWuHi0rdhUiH2MmvmuegVaB0kaQIgT5fkySeoKIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SYJgx7/vjcXu+CGjSwqyFi/9P0jaO2K7P5/YdKESFiKZbt9T5hPw7aBbM9dq8yPjxeHV3QDTCHtogofLzckM2zMSNId8nm6SOdGUOJr/PttTFK8bgg8I0+ecsPYXCA9bCaPPyejlNR6B/iNxN8HzdE2XyEG+n1qB9zXT3XI+mMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X697Fs0I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OKtuslI0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X697Fs0I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OKtuslI0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3wYAf1889484
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:58:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fu5asBWsdvZx56+/lcE1g2WUnCmTjVqkOuMEFTUOFaA=; b=X697Fs0IdN13Qryf
	ZNhc2bA8OX4BO3VAw1w5Te04sfP3+bIHx9kTu5yyBtwKRS2O0EYgGcEWzz1Ieo5w
	HpQaIiUUG/n0hYXrqCJQxgyQXFdmfDVnJmffumNjoSTpbkK3KbPJiaBZUxVcn1Vy
	WdFlHFHWrhq9KYX8W/M7gyZQE+CyKWkZ6R0EOxgvj3APXvlQOaY6Q7nIbGtBeqam
	KFK9F0k3HtS6FoZxvBQ++x2aFaxh2g35y2QZuaTTZ2OLO4ynr6Kvy0khiyI6CfRw
	0TMxcOaUWevEpNrDfbyJSHu4+EPCK2B7XT1ru6bsPcS9/Qs+po6JuBtqWTJISerJ
	yAF1pg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda14xk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:58:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917b7dd3f1dso20731896d6.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 01:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792054736; x=1792659536; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fu5asBWsdvZx56+/lcE1g2WUnCmTjVqkOuMEFTUOFaA=;
        b=OKtuslI04q/WFhXXSREhBU9HeVzwgmcE8WjM4s2Htl+vxMahsYpITe4Kwqr9z6i9r4
         GE3fyne6/6ykHFSynNTOvO+Elj4fwDwvDtdEbceK5ZSkF/5o3gfs7nj6smqkd3cOirkH
         5+xE5whVGNl38Gx954atN/+ZIrbT8HZCP/5Y4uvLNXv8zGerczeAOwmErt2SSrzdr+pL
         yUnAAIWXa95pr6sAeixDwazXovUMGipCGz+FhOsPLRyTAbgBm8qw4v9Wlp0BNDeKgEOw
         dxchXMoGrdFENKyaEChSAykwH5lo6tDBpa7UXYVSsCaXQtesEAV9nwYtqtEWt/WCjzRb
         9LxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054736; x=1792659536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fu5asBWsdvZx56+/lcE1g2WUnCmTjVqkOuMEFTUOFaA=;
        b=ZS8tHz5TG6AsRSA2ZYXEIcyh2kjuS8fPkXtExhx2GqysycJ0X86kn2UdNH2Fd75GCW
         J4Bzb5X5Uh3ST18tvYG0fwUyrpx89lAqasvHHayeyQyAqwtqbPfFT0mxg80KdcmtlZtx
         QSmZ03aJgTyv34SQFnQBjXPA2HjL/OUqgJ+jdLNna3vJNPSyTvPPkHieRXF5CmepgZKm
         Vwo6kyXO1kB4y9mOdN4Iqmge3fGycUHWqirw0tg7Wmxo4FPS8G8WsSVQAyZfrX7qrIIU
         ax0OeOKypY01P+/fCc0vVtUEiLNgOKa8Nk7HNvsc+OK00Npc8rM2KJh8DOxaIjVMUpBo
         I/4w==
X-Forwarded-Encrypted: i=1; AKwUvByKHvDxGCOA6Gu4BqHgsGDFyA+G7Dp5ThSc45VMgrhSLM0pkZ6xp9f6vHzZZ5D0QTwnSkhTF/sw8KNV@vger.kernel.org
X-Gm-Message-State: AFq9FYJBRM+GBUXANeuYVGZ5O7XbC+3sTRHmioKIKZyieP3gr36xlE54
	W6fdX3OcUPNNZxOzQZ9KZcfnncm5nW3b3gRGk2vEiGn4Ls2Y+uj+/vKIysS5oNo0voXRIMijvFt
	4ruoA3I9ZOHg3N6WzYgwK7DlklQTM3nX/4Jefp+IWSnlvm6MeyACpMZOwSkvjcR/N
X-Gm-Gg: AYBFou0DLqbMddpiRkS6X+zQAkabruIUDlAc/pNQ+3TB6Om1VMbj1sX20g2jxA3u7LW
	0KVTFw8MpBf3AzRssvWhuOrDjtubjzWAfdNgUGC8Ktiowjvtiibe4lgTXoP9vL13bMOhOH66nIo
	Nm/lSA4pPb/0I4FH8fX5yE51lXYUhgS5dxrdU2nnctBjufdgdgIQl81CN2d0Dky/YEJTH1HBszl
	ChEEepOXEX9Fk0aqqDB8cBph4uSaAwleSHJe3wFrhBbczT03YBXPItINWM623ai+1vBrdqQc9hk
	NzQJor6S/z+sbaIOtyn0NR2138YvBghQzwvPW4WP4B5aPf7zuHqi6J9EwnYUG1z9u+vm4GZMUjZ
	FeShc6F5OWKWzVWQ8CGWmuqUiT7lXaEFaDqzzy5H+GhKMBd3DmHevRTqOLLHrml0QdWuPuADpjh
	b+WfPQxrf+TPNP
X-Received: by 2002:a05:620a:4515:b0:93c:aa75:71e with SMTP id af79cd13be357-93ebd27cc81mr2940668585a.55.1792054735523;
        Thu, 15 Oct 2026 01:58:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4515:b0:93c:aa75:71e with SMTP id af79cd13be357-93ebd27cc81mr2940665285a.55.1792054734983;
        Thu, 15 Oct 2026 01:58:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3b51fd1dsm371590e87.58.2026.10.15.01.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:58:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:58:39 +0300
Subject: [PATCH 2/9] backlight: qcom-wled: fix string detection brightness
 on WLED5
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sm8150-display-card-v1-2-5c14928cef29@oss.qualcomm.com>
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
In-Reply-To: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2006;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bW8kWuHi0rdhUiH2MmvmuegVaB0kaQIgT5fkySeoKIY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq0JXD7igeeOEw9oAho9ES6xgeGbyBhJTixyVNF
 dpItUZlKseJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatCVwwAKCRCLPIo+Aiko
 1ZJ1B/43vXCy6gNpky6dmfGFc57JTgyIeKTZ3FvHMZZ+jRKMpJEx6YXigKvK8BjcF/iqVJ8KKb2
 xCLhzcKp78trBZwwKLDxXmTs/o8j5oaug1+UYmj0h1ikO2QOZVTpblxQlHlZ0tn8b9tgYBV5298
 Gv5UJm3+jcwLI31guZvzpqOkEn9ROAEwzdTKWuO6MdCagN0nkPmNaScX77F5USHl2x7Cf/0Bz7A
 4O+RJ8LJnplu7TKGJ6lz4C94YBrWIGgSuFyx6rHN7983t2CnRfRyJAv0CN8yK61m/1Gigl7DaCB
 Y/9SIXc7kwXBvbWeJh3ImoDIJiL45/yjrgCNhU2PQmGEoNYY
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfXw/2XXihf9OIs
 qO7d03PwM6bKhi5rGg8UEm+6l0K1E8QzloU57vS/oNNv05tmtOwO1dmk9os97YH2u2qxEUyl0YS
 gYItMkt9zd//Oo0JYruJm4Vs+SFoeNs=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad095d1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=DHE891H7Gske2VlohvUA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: p-y6084qFz5r3dq_XUrlgru1NITQrjMQ
X-Proofpoint-ORIG-GUID: p-y6084qFz5r3dq_XUrlgru1NITQrjMQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfXz9N2QsBR7pr9
 C5KGf6UHxVOpIyKuyTwSYkJ4dcPL2fIwvxiSxErsIkRFhqqqIRpOzZ7FHpRR6U1RCGCtTOf6PlD
 WcjmZ1eh543qkFmb9jbvjIfGnFOpp1SpXXL88HbpSnJPqiE2Xj2zdAfD3vutbz35ooMs6dBk/Qr
 /WOcT0VnUEN9qyNgpLcuqldHU9tQWDGr86hlAjVmei7nE67M4sql+7RY1WLoTjC+We7dCA8m354
 uL4EfYzOcLPWAQ867SlmyLBZ4rUeMXOxr2TF4ckDU5dl8E5MclZalx/rl8CZo2O47zeU5AsdWh8
 m/5bfcJnl6pVUsfspsNDXmNunLP4rmEsKbzFFtnQT2U7BdTvMuGbMZ2KyhF62zf4oL20oAYVPck
 Zsdx1zv8txFIgY0lcarEjoA33ONv0SST4xO9QvHKPhY25ctlsGo+Hbov55pWVHONvvue28jZ9zO
 mEO63KSEX55LpiRiMAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150035

The string detection sets the test brightness through
wled4_set_brightness(). On WLED5 that writes to unrelated registers and
the detection runs with whatever brightness has been programmed before.

Use the per-version callback and latch the new value on WLED5.

Fixes: 62a1d3f623ac ("backlight: qcom-wled: Add support for WLED5 peripheral that is present on PM8150L PMICs")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/video/backlight/qcom-wled.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index f2e0430cccbc..6fbac6a4c29b 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -577,6 +577,17 @@ static irqreturn_t wled_short_irq_handler(int irq, void *_wled)
 
 #define AUTO_DETECT_BRIGHTNESS		200
 
+static int wled_auto_detect_set_brightness(struct wled *wled, u16 brightness)
+{
+	int rc;
+
+	rc = wled->wled_set_brightness(wled, brightness);
+	if (rc < 0 || wled->version < 5)
+		return rc;
+
+	return wled5_mod_sync_toggle(wled);
+}
+
 static void wled_auto_string_detection(struct wled *wled)
 {
 	int rc = 0, i, j, delay_time_us;
@@ -603,7 +614,7 @@ static void wled_auto_string_detection(struct wled *wled)
 	}
 
 	/* Set low brightness across all sinks */
-	rc = wled4_set_brightness(wled, AUTO_DETECT_BRIGHTNESS);
+	rc = wled_auto_detect_set_brightness(wled, AUTO_DETECT_BRIGHTNESS);
 	if (rc < 0) {
 		dev_err(wled->dev, "Failed to set brightness for auto detection rc=%d\n",
 			rc);
@@ -743,7 +754,7 @@ static void wled_auto_string_detection(struct wled *wled)
 	}
 
 	/* Restore brightness */
-	rc = wled4_set_brightness(wled, wled->brightness);
+	rc = wled_auto_detect_set_brightness(wled, wled->brightness);
 	if (rc < 0) {
 		dev_err(wled->dev, "Failed to set brightness after auto detection rc=%d\n",
 			rc);

-- 
2.47.3

