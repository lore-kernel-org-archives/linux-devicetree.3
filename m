Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550516;
	b=Qb9e0YGFAktRVasPw0FxwCCul1RAqMspfuxZcEaIv+wjsenFeWEkTPiKBO6g8UojrV2C
	 /Fyfg9eFWHUvzLsgWiNXEyCEFOoQkR+sX+M3AE0jB8zJerLdrXAriiBt2HcMI73qK2qN3
	 BXbWh1jyf/QRAVJafn4BxaITuOn95zTHqFb+I0WOoQ8NWRuoh6gIldutpEMLb79fCjV1g
	 g4x4xTG9jWSSBh3Q534CvqVvSfuw8be9K08x5q4w1iti6/aGPaRw4tvCQ+6xwQ0+rVPC+
	 ntwvM6hoYYU9gBS9VL30lWEhJ/dbo8vI3j2D0amZOMqB+3Fo4jdqtqoKNJl8V/Usczg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550516;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Zy+iehtUsspoMXUA/AtEi2Wy/F+ut0xsQzXWd1oWWZ4=;
	b=1PlPSOVIdEiUoE6ir4ZcdXBk3ixs3KVV71N9Q3/7YvSbqFI4fbZS9CI2M2af0M01bp9X
	 3RWyXohhsbggNiKXER6h+52/cKaBpGpEBWMQwOVLlDx4sSaKK+AVmtTV625WMxEqTSaqq
	 Y1R7z77yMVHlvc9BBoo0N+VIv3STnQmjJMjdDNSs/P/PYYhSS6dZZliBov/LBqhBwhi7C
	 By1ALUv9TBWVkMxKrsncImAmS/FpqkrrlKAnZ68FmcQMKQE+frefvQKs3W8WQhl2upD+R
	 1WuAX0qbiBK5UNdsznRdIJcD1PBmpb/AhqxeefHSAvz0qwi9lgCJHMu1AU/2U9ZcSQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Mbn/v1qr";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EQOUxY93;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DB8606A685
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35DB8606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mbn/v1qr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EQOUxY93
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXZbB2132755
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zy+iehtUsspoMXUA/AtEi2Wy/F+ut0xsQzXWd1oWWZ4=; b=Mbn/v1qrEphKP6KH
	QaIjKnLmuVnDvXfbLR6ZtxJdtug750+GoiZnmF40mZeOHvKWoDt63ndD2ZwZXIzj
	gaKsI5mTH8d0CDotUO8cNR8JiCinSUgae2+s1PRRuqCvMvGyCS3laYuVjP8FrNPo
	/Ss9riJxY6fEqH8UMf3VcGJOeR75lD5JNoXVub45yZI/n3fBJLYsC+Tftu7eBkef
	nTjgiOrHVucjsX6amchlYUEyoV5XKJo/z6UFRH+qmkoDT2JzTv1Ydv7fAgZzU4Nv
	oMC0v1eG75HZ4SQB7Pi5Jik24I1IgjuaCpSevqNtqtFzXQZBgro5+VYp0X7YPV9X
	hkivAQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b801yh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:01:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9496156f74fso58355185a.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550514; x=1796155314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zy+iehtUsspoMXUA/AtEi2Wy/F+ut0xsQzXWd1oWWZ4=;
        b=EQOUxY93ya1ePYXG+UT7b51vLeNQ+tG904W6LPY9znItBXLgjK5OlOb4DGd+7Cig9H
         glgbCGXNgUBPHIy9aC2iNbzgraedB8bofc+ohZ3CgWs3fHIzK4mpxmA2wROikhaevJu9
         iHCPYOuZ9k1HHWQs3lKl3U7Cnpkxxko/hNBcgnQRcAI7Ynu0dai/U80sILWvHCLwDd2V
         AeGa3/v5GGF7diuzpflNM0wCXGKcNyd6ejTwNdPC/DP15XgP2PoM8zREYdxAxsZoonvY
         HjYB7qy+RdbauZvFbp7KV1Poz/d6F4niPVhy8bdDWaNCY3ajZSDwxdwU5AaWXrd8jx/c
         xRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550514; x=1796155314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zy+iehtUsspoMXUA/AtEi2Wy/F+ut0xsQzXWd1oWWZ4=;
        b=oY7XpdLw9fARE98NyxrlcTzXzSc8crwPYYHfiUF2EzAAjXis1Mya1S4hKICD/Va5t0
         bohv72XDLtBLWbIk9mqgmDVkWNnSj/+r/N15omt7+Rvty6z7O8RgYK4gfjKbjC/PIOOg
         d/lTSSJS3Y2BD60eW5qo012EC2u9Ay/wJMzlpaeUNr4J8dU7pVEt9JyLrGHvQQxoIKNC
         +ALZOOv7UJQEqL3xJBbtLUxFUqVBaMBk/smZlYgigP6hZi+ykoIqtoMW+g8WLKR+EQzw
         62VbIwpMJeT6G09yFC6hplpGq/VgBeiaIQlCBhVDvdqnNChXyxebpRYjCB8MrgqTk2B4
         i7uQ==
X-Forwarded-Encrypted: i=1; AL+hErFYGu88aDEHVPzY5Xf1nz9V6qz13YfnNr4Hg4uvT6Vjc9RAzKiC7mbLeUI/hbbKz9AmcQBwjSeidLgt@vger.kernel.org
X-Gm-Message-State: APuU4Z/jd7pzGFC52gWM5PTrmAZidJg36ycuXRZDNOKhFEx+5y6f1pCl
	QHwk/qtDxb0G74rWzn/v+9B/foZ7GMMeKKhrgfCyu5hG1i5OdDiTmssN3Kup5iuX09fJrGap2Q9
	qySR+/DcCjYsOy3jvjxJYoCCjcCK3gB8mmyLhzAEO9/mImLOvnCSFHIbd7J5x+png
X-Gm-Gg: AZFdTZfuLylAgF8brxNvE1YqP57M5/b5bAeo6Qff1R5jda9Ke4r3Tn0wn7DLag9vOYs
	mPcAJUq9xaV1N1Yjy3KpmpnHO05A47M7ku5t+D/qkXLXL8tfv7i2Qv4q4aJUKY4/MTuAg7ZjPKl
	qZIPsaiba0FETFdw0yMz3yNzajNqjbrgcyUONY2i/tZdX3jg0STLv3wUPTDoA6XVVkciw3AbDmU
	dBcuGaRVJNZJIEkhLuBCP8q9RzL1LUplcE4OKkv2FcnTPMbn/ZvqCWcvHUu7Xq9qhNanTsNKpF6
	zClsnltEckjLFvPkKmuSvrefszgsud3WRkHgl7wwH3ZTVtcTLZLm6z2GHERQzsrRda6PssOmloA
	v4NRnnC7RO/19p942jbVbQRpI4btceJcCG+tG6h9fjOFEqCwWDYZq6eEe5MITmBhkkKo23itkDL
	IBQnoiyNw=
X-Received: by 2002:a05:620a:a11:b0:93f:740f:5a62 with SMTP id af79cd13be357-949bab7d122mr2707798985a.6.1795550512897;
        Tue, 24 Nov 2026 12:01:52 -0800 (PST)
X-Received: by 2002:a05:620a:a11:b0:93f:740f:5a62 with SMTP id af79cd13be357-949bab7d122mr2707788985a.6.1795550512169;
        Tue, 24 Nov 2026 12:01:52 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:01:51 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:33 +0100
Subject: [PATCH RFC DNM 04/15] soc: qcom: pmic_glink_altmode: Enable
 TBT/USB4 negotiation
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
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-4-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=1317;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=3/ET7POdT5Pe+t+Zq/yBmXJJgRV/1106W5V/3UIdJRI=;
 b=qv7cILk12lrlqRgI8UZiPG9d9Yieiz5lkd7kkOPhcEJOFVffw1JubNmMvhJFTs5tWJE7etKhH
 eT4plqUe5EJAL6sEKHgE1mFJ/adw3SwYZXmYsinV7VV9tLoCicCt3Zw
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX5Z/DMjzz7oeA
 1QJzi1cAtU9KJ3AadX1XvqZOyHjFxMijh0XfzSAq6LMgfuym7XyO5q8WaRaqifBSXal2PqHribO
 603vd0FpgTrnG7t51DaASXIs9vPYXypjd5e7VwshH1k8SDBHDo8ZAAIU1xNjMiJ+P0jj85L4iyo
 Kk9rXuO4nCg24WzhBifnKsZ3XdRkOtOVgOQqIZ0hqyBSz8VPHsp8T6MZY4Jo5+BtsE8Y8oEmZr3
 xxLYFLO4JKlUPB9dh8EOZNluar3aaCyjOdNvKDiAtGumEIkwP1lGXrpIRJovRDo5cnAYuDxaTsx
 /bDFovYCfxMTkA56M3ZOy+cFAOhcX53NwGd8VKUGE4aZAa5l9AdDKg31rnI0Uxn80fbuTAkLeNz
 0oaiaZoVKxSrXwl6OVaNzeDafUJd8VJKtkkdtvCA4W7tGRbk+ldOYK9uFxmuEBUw15dt9jRu0bX
 v8c8JL2TZ4QA8Yg3A7A==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b05ed33 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=WbklaN51CGUtf8hYuKEA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: aZdkd5FTpam7heEYj-_it3liF8svYR7X
X-Proofpoint-GUID: aZdkd5FTpam7heEYj-_it3liF8svYR7X
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX/G/voI1tNeJL
 0S/xX+0VLxsb5ac4VrPC1moGYUZSd0wDUVniHj7kqxt6i91JF82Ucf1ek+mEcNN9YjtH4rFX0ur
 Nq+sRWStzEaizOUvbaej0Uh8Lp2vBvM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078

From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

Now that USB4 is supported, stop identifying as an installer image and
report the default OS type instead. Newer versions of the Glymur SoCCP
firmware require this argument before they enable USB4 tunneling.

[missing W's s-o-b]
[konrad: commit message]
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index a8097c54a65559b48f64bfb65a1a4d0d8e033be8..f54d02994eaa96af04c673459b28edd482de37db 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -571,10 +571,9 @@ static void pmic_glink_altmode_enable_worker(struct work_struct *work)
 	struct pmic_glink_altmode *altmode = work_to_altmode(work);
 	int ret;
 
-	/* Set OS to installer for now to restrict USB4/TBT negotiation */
 	ret = pmic_glink_altmode_request(altmode, ALTMODE_PAN_EN,
-					 FIELD_PREP(PAN_EN_VERSION, 1) |
-					 FIELD_PREP(PAN_EN_OS_TYPE, PAN_EN_OS_INSTALLER));
+					 FIELD_PREP(PAN_EN_VERSION, 0) |
+					 FIELD_PREP(PAN_EN_OS_TYPE, PAN_EN_OS_DEFAULT));
 	if (ret)
 		dev_err(altmode->dev, "failed to request altmode notifications: %d\n", ret);
 }

-- 
2.55.0

