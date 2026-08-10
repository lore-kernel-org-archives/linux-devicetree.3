Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472342F39B8
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 00:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786322589; cv=none; b=XomPW2LWS1HJty6cVPAA7WzOmfaUg43PO1PCsvgMGSvcY8Q50Jd8lLY1mbHIEZVNe1g0FEGpIJs+fGfJZ3+3XWOdG95zeQZhsgMzBGdID3ve2KNQ9VfPeazCCLYiaq3Hs0XIXXormxWeE9GWMDakH7xqmLLsdpB01V+TSoP9+RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786322589; c=relaxed/simple;
	bh=9uFub4zMrwVWDxAjYXS3ORLWDuCKx9X0JyX4fcQ6eXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pHoP3Uof0YETbdq/paGcMn4SzhWZgw2QgPgY1fhno7OkSfkxoidQzGFFgt8Tnt3krSSbp6Dtdg3qt/gflJ0B4xBeUu9Vn8LKIdDTo/rcjx1Gz0r7qI8OnWONDaV4k/1iWkOgXdCFBDffiKOkU28JIiKQTyEbRKcTYzCWGIJUIwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BRjaiJU2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OGIY5EMv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BRjaiJU2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OGIY5EMv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679LCbl84102321
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 00:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h7pByVDSYzOL1KOuJA3cobyGqIIudk37fpY4ZwdGMAo=; b=BRjaiJU2Fnh0nGJr
	v4zSkEROQFsjS85l9rnaYq1EkPdgxvEEvLcWqroDIolghEmI6IcRhQBquwDFCU8j
	06K7V+iipFrXLvIDYLNoD0BPELNJOkWeEIya5P6aQWY6dzuGZFZwFzMt7X7VfwFa
	yMxkJ52X1DylZ9QWVRWa7vWhmVVYoLI2vGLmoIq0QFcVhIzAzkiR8Wy3Ntx8WmHS
	Nrzjo+KNI8nCbQp8/tNVdeM+chyBfcNCnq7Gs39reF/ezNKDLWX7KNzK8tm8wANg
	5g59FhNe0i/uqC30rM45a/TovD+qxdTUHE3fP+gr5/TSNIy3GFmdNLyFXWXEZDko
	J7kRZA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy18xr94r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 00:43:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1eb52e1fso27054661cf.0
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 17:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786322586; x=1786927386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h7pByVDSYzOL1KOuJA3cobyGqIIudk37fpY4ZwdGMAo=;
        b=OGIY5EMvG1XXzFAlxSrjNIfUs3WbrDElCMBfoCPG9u4ZulN/vwF46Zi1XcbBNU4X4F
         AZ9kmbpKZZkmVshx5+72Rbv19Ue2i5sEyv4fOlHy+YBKS5Ghyqoqv67Hwvd6afMBNL9a
         EtvI12yPJMN8zb9OL2Ex8lYu4CNB7TmH6AUbL3LXqPF0EMMwPz7xGO7RugJftcGn1pmK
         MXykpUgY31hySdhOG4o7xdbnFafcbn/ZdkCzMsx8+SPsQAKH39UMbgSCG72kMSjZ2PAz
         Es6OOici+k9bXwZ8cQgfGeF2fdZB/NBjAI2QoPlSECLe10RQ1VEBy0Kl40tKcFgZkjXK
         g1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786322586; x=1786927386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h7pByVDSYzOL1KOuJA3cobyGqIIudk37fpY4ZwdGMAo=;
        b=pObhfJG2BXg1XZaKB5Jr9PkdnqCVIUubxZ9WxFCUL4t1GckCIqgY/+Zb0mOp9UR8YK
         ZXMvGUaGa/ySZZ4WSJVVwzVN5bj50ah4vdpFnV/T3KU1gTwqDniKqtzpeYvpzJjybQIc
         wVAuX8URjYbseuuUsJr29Gwz9kBVkUjvGsW6ypDgDA+wCHRuuwfCJPC5HUlQHd/0ZB9v
         qZtGs3boS0t7rsuXz29aZEY6hn+VM1DWATDv3cORHa++QZMzLDCrsybpBrVjqtcgGqKR
         9nrpRyI2VDUgRA/jW8vR22+6OnzY7G2y7l4I53PMMBbch+FdprUqeZtPp6yg+yskzWKy
         m7tA==
X-Forwarded-Encrypted: i=1; AHgh+Rr4ebAvb2ZLC2U2Ud8+l3AeSczi/dJrxVh7VaSMdK/Lt4k7pyk2bZV26LOV0FyjvIPRAJ7rLr/qmPUl@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq7AypNdFi8xYSVzMNUG8aYktaoFZTXRg4Z47KiQzMFteydI+X
	kNsmjSEu43bOANYTCmmNmoyRUe6etDOkvYMj+RvP8GExexkk3cEJDQbCmD0sxDd7XzpyIaadx56
	FEBGH1tAdxB2TGPuE99948qf8coOeJCOE2RMK3o74JWHubWUDXlGf0/JgtMym7bq8
X-Gm-Gg: AR+sD136RnCgAOGHwcK7jZhgQTU89ASxEZA+qvYKn0dQ/xLhltVl9dBj8/nOhtf2hi9
	M6tM+ilF49QXPr27E+3lX1+K68KpvhoccfRu8r5oXhFx5G8A7lfJbbgs0sxWlaGkcEwwmrSuSFC
	fRUjEzQ+Hk7Yj4tw4XT58gmUcZZcddYuo6VF8UmHiXakpiiu3GLtMGOJxLSwU7x6SuY9Lv156zJ
	EY5QDgYu3xejRiYrD8Dj75chNcNqeDIzIC1hRDSK8sLzF/2tdmWCHLq474EKUfMq6W9+RIZA3+N
	cD1v783ZV9v7MYN6o4/VW0AptetyWMInjvoEpqM5ug7B2jMpkJc133KpfSIMcQG9YiCvTTkYhf8
	Qqgh4/+wl/FoKsFwiKtdibNRUN2sjMChL3bnNyHEk+20Mjf/xc3vHQVg9OhDoI7pkZBUR5ybo5l
	fI5OyUTiQlWDdIpw==
X-Received: by 2002:a05:622a:141:b0:51a:8dc5:bf89 with SMTP id d75a77b69052e-52ce5f7e59fmr427625281cf.5.1786322586451;
        Sun, 09 Aug 2026 17:43:06 -0700 (PDT)
X-Received: by 2002:a05:622a:141:b0:51a:8dc5:bf89 with SMTP id d75a77b69052e-52ce5f7e59fmr427624971cf.5.1786322586063;
        Sun, 09 Aug 2026 17:43:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3d56sm1679742e87.69.2026.08.09.17.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 17:43:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 03:42:39 +0300
Subject: [PATCH 8/8] usb: misc: onboard_usb_dev: add support for the SMSC
 USB4604
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-onboard-usb-v1-8-08a805768328@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2781;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9uFub4zMrwVWDxAjYXS3ORLWDuCKx9X0JyX4fcQ6eXU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeR58Sh8hxQPG5aW3E6H6VxYT8DTawE9L8xhch
 Vg7GlM5leeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCankefAAKCRCLPIo+Aiko
 1cwGCACDgxnevWypfEQiCQl6rbGQvesKXMjUnUBqovJFhBbnQrrZRHmCDTwSo1lHuEFsvw+vqLy
 ydaFNLPf/NxjRJFnK1FlxfUlYT9bq6Aqi7493aJIEMVc0DHv/eEzJrkd4H7ED4z2CZng0Q6ilMU
 /eHuRlnc77JIWn5BVu+vTXh4bCbDYbGGrQzoBZv4+GtIvBDZ+vn6p6brU1BxKkR1I5tAMKluTat
 iDidHv+mXijZgdOvUGxzIjnZJDtdvZW7bLlCirWCEEI6leBSsKqgLlhD8WJODu2X0araSQMb6jr
 y41abDZcYeI0K8GjscMINVJSuYNGjBcyZpJWDg+wPdzMZp0B
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAwMyBTYWx0ZWRfX6RiTjYyb3VwD
 frcA8dCWuDYn8mxEKij6MXP5sN4PsSApscBQi1Sn122VpoQpTGBTdpJTxKJ3ooroM/kDSQX92p3
 bhSd7HVbyfMvEwI5kc7WOyUb/0kylBE=
X-Proofpoint-ORIG-GUID: ZArVFZxrdBIxzNRcnoGiE3ITpNHeHtRa
X-Proofpoint-GUID: ZArVFZxrdBIxzNRcnoGiE3ITpNHeHtRa
X-Authority-Analysis: v=2.4 cv=bfZbluPB c=1 sm=1 tr=0 ts=6a791e9b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=dCaF-ntwdvq1vmmPVKAA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAwMyBTYWx0ZWRfX18iOpdN9Bn9y
 /Dfcif00qFJxydCgoBz8+m6El6NOr2MqgUN9CTJweL7u+fQM1M7s+ArIcQTYKoKt2OpnZnEps9x
 x9SV1cbDDurv1sVysnrRgo8gfmb93IllYjIixUIW7fxZVC+6aPVpBUZMCCAkMvCKlGfeFU3/3d8
 idlfjIWxYr7GIqmiQvLRJySluibOAsYXLsQBLmkA6bHzGSgYdRH41S9/HIjFy/84snhs9qcrVm2
 43giRXZxmd1A4NHxl4rT9XTWIlhTeM5KqK96BuB42gbrkA7W+CHI0kXWT/VjDWLdMMKT3SQZNXh
 DW4E2Regyg6Z9i/DYjpRs+bElLt55+aGDLcq84Z9WSieU+zdVh2WO0OfOuczMnUpEbLpsd381vf
 tOwXZTXPuC75nhH+kDkHIJtXze6FZqcg7s+MIfY9W0hXGaFsjPVwkA2utyMy/CUaUtmnZSye8xQ
 SRZ5wqCe2UKNqEX1PLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100003

The SMSC USB4604 HSIC hub on the APQ8074 Dragonboard has its RESET_N
pin wired to a PMIC GPIO, so it stays in reset until the OS releases
it. The release also has to happen while the HSIC host controller is
up: HSIC has no connect detection comparable to USB 2.0, so the
one-shot connect signaled by the hub after reset deassertion is lost
if the controller is not yet running.

Add the USB4604 (0424:4604, the ID used when the upstream port is in
HSIC mode) to the onboard USB device driver, which releases the reset
when the parent host controller probes.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/misc/onboard_usb_dev.c | 1 +
 drivers/usb/misc/onboard_usb_dev.h | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index 6299c0539212..0eeb9713f5a3 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -673,6 +673,7 @@ static const struct usb_device_id onboard_dev_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2514) }, /* USB2514B USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2517) }, /* USB2517 USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2744) }, /* USB5744 USB 2.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x4604) }, /* USB4604 HSIC HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x5744) }, /* USB5744 USB 3.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_PARADE, 0x5511) }, /* PS5511 USB 3.2 */
 	{ USB_DEVICE(VENDOR_ID_PARADE, 0x55a1) }, /* PS5511 USB 2.0 */
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index 11425bdc5a63..9e320b042a86 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -30,6 +30,13 @@ static const struct onboard_dev_pdata microchip_usb2514_data = {
 	.is_hub = true,
 };
 
+static const struct onboard_dev_pdata microchip_usb4604_data = {
+	.reset_us = 3000,
+	.num_supplies = 1,
+	.supply_names = { "vdd" },
+	.is_hub = true,
+};
+
 static const struct onboard_dev_pdata microchip_usb5744_data = {
 	.reset_us = 0,
 	.power_on_delay_us = 10000,
@@ -154,6 +161,7 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb424,2514", .data = &microchip_usb2514_data, },
 	{ .compatible = "usb424,2517", .data = &microchip_usb424_data, },
 	{ .compatible = "usb424,2744", .data = &microchip_usb5744_data, },
+	{ .compatible = "usb424,4604", .data = &microchip_usb4604_data, },
 	{ .compatible = "usb424,5744", .data = &microchip_usb5744_data, },
 	{ .compatible = "usb451,8025", .data = &ti_tusb8020b_data, },
 	{ .compatible = "usb451,8027", .data = &ti_tusb8020b_data, },

-- 
2.47.3

