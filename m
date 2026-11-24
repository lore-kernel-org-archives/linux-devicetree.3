Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530578;
	b=RyOO9RB2pBJr8j1ZdFAelBdFMefbNSCxYjEk0Zer4JEfxFexmlLBAHwmXDm6IKZD7hSt
	 CaZqVg8NgISb+rM6m6A/6yxgDI/mch6PmN0jG2Wzfk5UZc3rZh2PlXQ7airoqtIvx+UHy
	 l4tUJqnc3zH5umKhORXz6Gtiv9ntga0OsPlFJ/ATirUw01DvJlLyCyZ/W96EBB+bCc3H9
	 QtSLcRgTFHFTK5ggkfp0w3MsSJo11AuIaXleQ5XMA3COEg2V6duIyX8gmcrZZQUQMER7O
	 7Sz4zwcIc2Pp/PMDrWF1JmHGfteSqUM0Dzja3h8PhO6jVgGxI+wyTPlT1qoGXYHPkmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530578;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=17ucF1RK7QPNWx64WDpCzIjNewACFearkdqd7q27TEc=;
	b=iSsR0ebD1MIKQTKpaJ0O1DIyMhZpTZSekonMFwIhecC7A1svqwcnX3puVkX9j1s7wxxq
	 M3tNh+VUAyqDP8j4H9oaMEzHcA5XuljcYNs8XKP7tmt0oxJjbFEyWJCHyjdA+D5rzg290
	 iFIpj7FOFUaBlpTjb8lDRuv5lmf0JhngNXMqVXHB0bRMc7zU4IaOdoiMYUGemrCLsqXOA
	 HA/cQGpvQiQsGfIgkztP+I2Q+OaKDQBdHUw7IiXH75B9wnIeIqkaHn8b37cuUGJWr+5Ty
	 TIMrLACsvZbvZHYiYgkRE7APTXt/5HKUZWA/c5Ne1To05vzsqEjr3gB0GiOeliOg4xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kMOtVNIs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N64l7bsV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC5A606A33C
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CC5A606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kMOtVNIs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N64l7bsV
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuhMX601603
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	17ucF1RK7QPNWx64WDpCzIjNewACFearkdqd7q27TEc=; b=kMOtVNIshWOq23G6
	nnwI5Hp8X+KinfBgLWYCif424xxO8QoC7Bg6VVb+wf2rWSFjL8/AnFsBYpEVweC6
	f2jeY0HLqWKkXZjeuDK9VznSbzIbSPSZn9Ks+zsSJ6zl/8g0SqZ5RR1XhxWvmtwO
	CYDKcih3e6/vsBUsDylR3hZHBUnR9drfLf7CbivhiQvVVw4dgydSfrzs87fxA5lr
	mdXVpSHSt5Ju2b/UBLd68bC7LmCeq+4ipHHfRgI5iu5dtG1X++zLKnivSaEZvBu6
	gNajik1lri64y+23HPAhZ5/M/4ygeUoHSJCJQKhmpawQ87H2swFiB/vAQERsftCi
	cUHhMw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky34vy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:29:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f20addba1so721604085a.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 06:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795530577; x=1796135377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=17ucF1RK7QPNWx64WDpCzIjNewACFearkdqd7q27TEc=;
        b=N64l7bsVqUh8VRALY1fe9gSE53BDLj5wqdiB0A+BiNh1d+qXPPkefb9zaqZmX+AGKs
         oR9B98ZYGj1BDpU/b+gHIQZm6k3Qak0KK+zJ/65HbABjGGFx60r2qGlbpJkoAtrXrVTn
         UGMvQnV0nm67ttwBhhVzHCPzP1vdpVICkc6+wZg2wKhi5melFAIXDTDFzIbgFaymvUxi
         KIh7PzY9++Fo7qrnlV7fysv51S+1/qO4WhM30Z7AfrQBbBXd5wqORQ9kAQgNYRImkses
         wbN45f5Io6KoDomj01YPgKUrYMYyb2FAMEiawv3vt7EhmBuazB88WFODmgSKdlzU9XVo
         JOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530577; x=1796135377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=17ucF1RK7QPNWx64WDpCzIjNewACFearkdqd7q27TEc=;
        b=t8Id3x1owoRtWndJo59zmZqhw/L00L890s1djH4BpjUYiLsNChVl+MzjjmWqcsN1gv
         mbEBNMgz2+PwDUMgDIA1AzKdiR7pzAhvGe3I96/ld3IrOVQ99i5sz2Ckye8W7bU6q2wz
         h/z4Gkunp28IayG2czOgQWcUwvEQS5VB2KW+CNvHNBp3aTL2X4PjXDRkchHKgIOKwQ54
         BZtuW78jKEOHLtUBk/pNWqA6FMkOwhCoU37ocw9B9bU3SGMdeDumxZuHmb040FjVkFW7
         6XKWQfrzI40DCnZru1nMqVKSRyuku+zwV95ID/YOVPfJtPIyoKVXUYbL2SPfEBjzxKlI
         NqVw==
X-Forwarded-Encrypted: i=1; AL+hErGzosewUc1SJIdFSWMET4cfMe/BM2P5gZjCmg6b6Gko79hKvgi4slZod9MAZvZNA3tbw+ge3HoaP2Zy@vger.kernel.org
X-Gm-Message-State: APuU4Z9P7filDKUTcFnA746cdhHYBaPuzVnK3eIpmyg5KGwZ5otxdbOK
	xyh/TGtIZCOYRHHFRvCFPpoKUii4UvXVOHWWJXT9Sz107alrL+uqmrD6JOGsWFvPkrED7m+yrDw
	N9xDTo0KC1b7DHWBZLgj1YyES76Waxe4TBZE/IfX9Qh7rjRlsWPfHcb6XLXRw35PH
X-Gm-Gg: AZFdTZcwhYIRbVL5WxiamhwwEHpoRuuAMeK9IXHekQQQpRhi2psb4dEVDUa14hdWy4E
	+Me6N2U9VDHnuA8K/pJQ5GNzzBjuo1+3KOqrnbN9b9GpMTs0coNeGXspORZcLgfFUGRvUqM8QBF
	d71VPcxsZRV7fYtSM8fm1b59xvfdOFrR3A2SPEQplVcqtwaouDEJr9b/TUIzC232RjR2P4WmwFc
	La/yXzEqDX2PUDkXVweh1d7JG/61SFVfZQeYgcE7PtO2M9i6ubW/Aw8y9gQho33pP1MHPUGMnYI
	ImVKToHSI0vkuF8fBZcZi8Za55g7C8aFhcJxVWdFHPEaYlCayLXkTb83XnmLgwqultcFo6TfsDp
	6PBLQPj7t+H8TIUbNa+9I0SZJIN/UZ7bUVZCJw+Hj9qwLL6hVu/2AT3c2b7QLcMn23NhDxJgLP9
	TAkay5BFz8cZN6QjSEqtTi0sVlK/L0CZ86M1qqib7OmBCFU2u6+Xlb3x2ApX9017w=
X-Received: by 2002:a05:620a:a0c8:20b0:94a:a2:9920 with SMTP id af79cd13be357-94a00a2b753mr56325185a.75.1795530576677;
        Tue, 24 Nov 2026 06:29:36 -0800 (PST)
X-Received: by 2002:a05:620a:a0c8:20b0:94a:a2:9920 with SMTP id af79cd13be357-94a00a2b753mr56321485a.75.1795530576178;
        Tue, 24 Nov 2026 06:29:36 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm12013821f8f.19.2026.11.24.06.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:29:35 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 15:29:22 +0100
Subject: [PATCH 05/11] pinctrl: qcom: hawi: mark egpio as a GPIO pin
 function
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
Message-Id: <20261124-qcom-pinctrl-egpio-v1-5-34f2c06b2658@oss.qualcomm.com>
References: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=sOe/uKklnGp8mVDGaaB2xvvWbRkpxBtJk/Ns6ZUM4Bs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrBZ9CVyICZwkNyPi/6+WKjYCC967i1fMr+gVQt
 jrpP8Z5fHuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawWfQgAKCRAFnS7L/zaE
 wwu0D/4wZ1FhhV0DoNOaoB+tMtI6aqaDQ0hQzENh/VieXwKr72Wwpq2i7rpF4U7UrnMg+4lPlgY
 e4K92qckwLmN3/Z/hhuRItZC/HCmUH+T8cegtzIZHkUqqf7bEhXi2WjblK87KrGa7Uiz//JPxZm
 g/bGBeqdY+0FpKKAyQj15dqhNt/Z20YQY6IcA6Aake9JeP16v3MbotcsEvGkLQAUUnFMQW3tYhN
 Lq/DsDNSx6+UzrXLAjYEJEk+aDe8sdwPyYETvD3aquUqAK8gQN+T7gqHwRXJGx443KieNP6Lvnb
 Ye6Jwrfq4fWSN5DqPJz94MitktVL2oRuixrT0MOk4ntsSB/5xmDkFxeo+zwJv0cIkxdxIbXdIZT
 jC4deyC32w9y5UjNGuQARDL9FyGGESbxKMIGuDEVCUsx7axZq5eDZbH3UHgCzLAf7N31nDbRf8X
 d0qeqlcpodpRjT0oWkKkFq4xEuzG6cWdskmSXY5eTFTLC7lJaTvkmyBSXP5g8I901VflduizT+f
 qtKnHKh2zxyMlxTsZEomhbVwcSiI4CZv/E4YpVUfl/P64KkAIyQ4mtEeKiyt3PsxBRsO4TVePRr
 DKtsVvY1Y/drG4eeoXCasUSkmJ8xQNii1waIM6o9qIQ7BHYmWNRYyhafMwTfYPpxRCble7cWWN4
 bUUBDBtfFpuPuVA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b059f51 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=U65A1e1nmbD1eduP8fUA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: UK5tTujPZD5wFi_yfMVdvKTnvt7Rqv1F
X-Proofpoint-ORIG-GUID: UK5tTujPZD5wFi_yfMVdvKTnvt7Rqv1F
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX0/nIW7geFux/
 uJuZqjDuNItOu9sp2AQV4MR8zi5HM6ucecCMY4oIO5IJY89o/ZIrQP9SbU+haxUE1Oe57MkUcBV
 uVxDkgCbNQzYC/5OKs7AHE8aKsQcgeo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX+H3P7p53JZL1
 2edJ7HrlfoT9qrSMkiixu9JYox8n6aQsJ3IflGXsBW5TZ9ag/KCpzgCJpp0YkQEJsKn6KJdQ3Kn
 FpiObZEr2iKCj2PbtBuiCnegKZkPEjpusvt09Z6Pzd/7G5ReIYOmzA2BrAfQgwnRAhZGBfwDZZR
 VnAPyDOCYMQporon13tvY3uvhPQL6TyaPiW3KSqFsvDmSxR3ho0gI2xu+5wKClTVQ1hZDU9IlBM
 gqrHhJxSPRueaaz7MmN95MhHGtAL4FqurBbj063FfyzWYn/my7zWv6JKuUBBGuaw8kuLmMWsZ6y
 lONrg3uwy5ABn7Pn6ePj92QZNsSGIhyziVkk9NvuDzaCoyCBRlwcaGVYyN0nt1BogMHwgk6+KFb
 kAdin23Wdf5/gg6gFEPgzu+JIx3isGT+H1DSMuYR9gREfV6C7qmrOhFovHLtJ1veKf4H/LQAFvc
 8QA1vMdVm30D6lt/KYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240056

The egpio function in the hawi driver is registered as a strict pin
function. With strict pinmux, a pin muxed to egpio cannot then be
requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
be used as a GPIO.

Fixes: 90700e10d2ad ("pinctrl: qcom: Add Hawi pinctrl driver")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-hawi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-hawi.c b/drivers/pinctrl/qcom/pinctrl-hawi.c
index 3486a6d63d10e71b0ad78f10b0a88bf6f47db738..6856ace6db1b2253da1bd168a0919e72bb131c5b 100644
--- a/drivers/pinctrl/qcom/pinctrl-hawi.c
+++ b/drivers/pinctrl/qcom/pinctrl-hawi.c
@@ -1211,7 +1211,7 @@ static const struct pinfunction hawi_functions[] = {
 	MSM_PIN_FUNCTION(ddr_bist),
 	MSM_PIN_FUNCTION(ddr_pxi),
 	MSM_PIN_FUNCTION(dp_hot),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp),
 	MSM_PIN_FUNCTION(gnss_adc),
 	MSM_PIN_FUNCTION(host_rst),

-- 
2.47.3

