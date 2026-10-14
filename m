Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6CC4E66D4
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 23:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792021899; cv=none; b=go5UjlLMEySYF0jytUUC71mQ6KRjXlNdq7Kovwo7QQE74gnoqHozw6D7Rni+lu7me7rlDSuccIqSG161Ju6g5lKcP1qgiq8USEYmXjUY5/QUnC+eWGsOq4H/mIviP8LZk4+otSP6Kq0t+hD0gxW5Rnbf7OayBvUEeAsEBN/HlbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792021899; c=relaxed/simple;
	bh=BF6415btVpAVudmuKDsPZH7SQiNfH+6JB5g0CaPUoN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LMN9c9i1wjBwBNRaNVBv4KVYps6k4AYrlEc2/EcXMI9k1QpYd7ljVSf3L9E8ohZUL40YcdsDyCt4M4+X/g35jDBccz8Xj9NsklEGN0pD7dNW9pAVMWsRr1F1HAPm1XJa7Y6zkrDfopWgWn7sFg7E3NQr3OgC1aXReF/mTe/mI2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G8tLsI76; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EpRZPfLw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G8tLsI76";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EpRZPfLw"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EMHQl04167548
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 23:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cK9XIjoJkCr9hVq/5NleYDwc98kzEkgjzgNbxN/oBho=; b=G8tLsI76cPThJ69z
	IBLDwtmos4tR8uMyoRCxTfmwSlK1Nw6CgnbGhY63jy1gKsIxkWsvL//yTBPudf+N
	rOJLOWazuU/UwnlrekIsLZjjK9un4NKl9KvuYpns/Le3eGTuKGSFRqUg5e9FWdat
	AlV+JSv58aWV8M5Kf0FZMQjjryrnTQ40IcwE1n07nouyNaGDrqrn61RHyZDqgExD
	BmTCSTe31YO/f/z5fPeWlWz9Dld5JfGjNTrxq4/S6jSpK3OFDYzf+WAaJ17GdIUH
	HA/tiicEqYS+NPlvvn6NiJqMTgfXTwSVF+KjmCmVH7Vfc8iOTxWUsyiYWN0VIAhp
	SOvocg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hac231u5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 23:51:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc0b31ecaso206550185a.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 16:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792021896; x=1792626696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cK9XIjoJkCr9hVq/5NleYDwc98kzEkgjzgNbxN/oBho=;
        b=EpRZPfLwv/1eBc7sx0RDv2t04410SrZjfGFnSsSXq4rA4wVABDanRrvyhzz3HzUB85
         pslzWU9RE8ovMIWOF+SiRd17HEXU0WhARPfAjPcd9d1S5VHllaPqVxpD2HSiDX1kilCJ
         dLHmUWtjL13SUkNlSzKPkHcfDSp9ECT888ZvKAn05IY9ER1B6XXeMurTIvLNPaiItH9k
         57x+fA9PtsNepHFvoaOHIVmHsDlcii7kylwrFrRbvgFENAclUEeJARuT7oOKQs+xpItg
         WFKtB9Kkwvja2msDk1U4wSf7A/7Zc5vXsP7NUKE7dX8jA4GNWXAHQyj3AdYJt+Kv3KdD
         SnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792021896; x=1792626696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cK9XIjoJkCr9hVq/5NleYDwc98kzEkgjzgNbxN/oBho=;
        b=uK9j/qmRo6CNWwTui7WTJ4tHDapKIs70z8xE25C5BnyzVq+4AlhRSHy5r5+eS2NrvH
         q8MoDvtc6JYXX8+yybC5Newc2uFdDciHEn91WxsZJJ0ZuJZWEvNC7gCZHKV+X1FvpX3U
         XXbgauTNQ7Xuqm1FPN2uYDJOCxJx6jUvh5XPShkOjzroZnnwJUIeijVdwqNIg7FsMSRI
         MBVYFyaORzqNgvX19KXmOnImh6TdQiqdN0dVhzBPyPaLtqRZpmESpBxa3s/7lUNrQUsU
         0yJj2tkPYKtGYhBQLr+cpT9BQw0I4lPv2IYKF7JqFpziJV8jqiiOM7K+3jW05Gy0tZ/f
         LNmA==
X-Forwarded-Encrypted: i=1; AKwUvBy77QpnVuY2jPOKWKMmTXAeyxZV8yCTZCx19TUWbDwldUIedhNrCipOlnx1B/mjHaMMQZVpAtAJMiDd@vger.kernel.org
X-Gm-Message-State: AFq9FYJTXVasO70zbDyWPwWZSkS6uN8nBuW6VRvo9M4gu47cv/a4VOE2
	hRKo1maka3htY5YuSEvVDAZ6RGuCyeh+leDpQj0DDldiEy6ZpULQuSrSuWTeBffNRsTMRp584nV
	FfuD6ElavlH83rEYPUuyAi25XMhFgKImWkEbKhSdO827KZQcVM6p/XKYZe/Bu0UZ/
X-Gm-Gg: AYBFou3+UxOTdoeV5QgXeE1ZxDvallA7busm1CGNU/rEnaPjMhBAaSNZAX33Ay7op9O
	mumnWVMeulPn4gDm37ZOvcBjv3fIecOolEFfaZN85WHVsP4fUEOMDGptXdaWMEYeH6UWL2u/jZw
	bY2Dn3vXZI3yHEx/pMBmfuac+UaqNNN/A2uN7Rb+Icss9oOMrmMmdwomSuzcZt9PYSfoLXmNvZq
	QuoCvEpm8+WOJmwF0fiaYzoWcrU4+IaLViE90UKdaxXDzlUsxPlS8+8llkhHMhRQOKY3qDicgsc
	zj1uAtOhHtf6MX5N+bIbw/doTg8ZBJ8Pbmj4dlxOhHkOZB73jd/paFKHTR7auDbtA0DcNSmbnuZ
	Ba07eqeGjwmoLEQkVeL46DAoJpDLDGKWH+88KPhpEvcwEexcAPqExBaCjsGSN8CAZrLzInyFaQG
	jdsh0iMS4sbOBk
X-Received: by 2002:a05:620a:628e:b0:93c:8544:6adc with SMTP id af79cd13be357-93ebd224887mr2590641785a.18.1792021896073;
        Wed, 14 Oct 2026 16:51:36 -0700 (PDT)
X-Received: by 2002:a05:620a:628e:b0:93c:8544:6adc with SMTP id af79cd13be357-93ebd224887mr2590638485a.18.1792021895674;
        Wed, 14 Oct 2026 16:51:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3aafded5414sm2285281fa.16.2026.10.14.16.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:51:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 02:51:15 +0300
Subject: [PATCH v3 3/5] dt-bindings: arm: qcom: add Qualcomm SDM845 HDK
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sdm845-hdk-v3-3-1c179cd0d16f@oss.qualcomm.com>
References: <20261015-sdm845-hdk-v3-0-1c179cd0d16f@oss.qualcomm.com>
In-Reply-To: <20261015-sdm845-hdk-v3-0-1c179cd0d16f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=843;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BF6415btVpAVudmuKDsPZH7SQiNfH+6JB5g0CaPUoN0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq0BV5IzDMXa9K9W+5qSi3hDHbsp6MOA/nhD+mf
 UCqX+ni6SCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatAVeQAKCRCLPIo+Aiko
 1ehvB/9caRFwuQem+RxOWHYn2bSAIPtNo2Qe8PRfp6DGf8AMCcKm8wxrUxK/TO4QPxeYuQ9jn1l
 zOARZ/3OChDaR9qF2/YP+TP14iGxZ8x4S8OIVnAZhqbCccm1jTo+t0sykYmsl45ZtsMOf5YpTQC
 tAfaeAdVGelTbxbnOlsip2kzhiAO5zDWDJYP6X4D7EnTmT3C9RAudDNIIxnWER0yJceCRIYSZ7u
 Xfsq9bxDkrfP3NzzU+d8Kc8b0KlLA19fsXVH+dodWqbqOjYgz4ZnVRnyGKro6qxpbGRBPMIArYW
 Bsqn/95e57n54cUj299X7JYm+zoTBAeorgb2jWADT32k4KzI
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=PYJqFShd c=1 sm=1 tr=0 ts=6ad01589 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=9nMZPvWkDyzw5AdY2PIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA5NSBTYWx0ZWRfX8CKW6ZdG8L9E
 c9swiA/PZ54SNUrleJpDKePAvppVyQmTpJjMWka3qM4NT/x1tnUPQ9M6wijej97qMtYMI2Rcgmu
 9SogcxXycpkKB00Q4bQhTrZE2tuCWxA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA5NSBTYWx0ZWRfXwDG1NExJIlQY
 stu4AgjuCAnwE5pWg3sG7T2Fbljt5DEnz14z/xDbKGQd92HP2BHcP/Rc2Qsp3ffcEx/vl7DXTop
 FPE2MbhhLwnIKHWYexOmHqRk8tuy70NiiypdLpAdkZNWrim/5SFck3oSaNpZKzv0OI3WOMX5X/T
 WA1oCPbiAAJWEGM1R2Ot5OeRsJo4jF7qOwBWzWcBrPwCFzR8j2ciRfuk/yzYvOqHJD3dr2r3C4a
 0fqNKcxxDcWgNBOzK4775CrQWDQESgtDjpRttg0BT3h+pihLE/W1ATpa7IvkoWsxplv8CGPQaY0
 p9uZlhlwRLXzTGjsFMYc4xF0DqS2HtYHTS4NcIQYaH7TJhQKiWuKxS/nvRXbQaHf322YxGV9I+o
 7JTYrKp4zf0vHQmIU1Uq91FxXe7d0kXjelAbsDWCTXxcV/plR+12nzPZBh/+c9JUD8XWoOyrw+K
 /rNymiSu4SgPXNtVusw==
X-Proofpoint-GUID: MF04vLYoWqffS6FrhSWEGOtsWPVwxb_Y
X-Proofpoint-ORIG-GUID: MF04vLYoWqffS6FrhSWEGOtsWPVwxb_Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140095

Document the mobile HDK for the Qualcomm SDM845 platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..dec58f8818df 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1003,6 +1003,7 @@ properties:
               - lg,judyp
               - oneplus,enchilada
               - oneplus,fajita
+              - qcom,sdm845-hdk
               - qcom,sdm845-mtp
               - shift,axolotl
               - samsung,starqltechn

-- 
2.47.3

