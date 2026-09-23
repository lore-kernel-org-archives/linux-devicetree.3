Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4E049BD90
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161526; cv=none; b=oajJEJJsquROhzLjHDXApikoCmb+Z8jOxznu48lHpV7qRNHzWb0x5UX6Xu+g+gCsqHrv2t1BrDWHK7lMuvnjMw1IInxZfA2Y7PhX0WB4wC9aA928kGWZeGItcuFF+x+Jwt+zE2yUjKsS87qs1hbPjy8HSMxyxpFMPvuLNs80USs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161526; c=relaxed/simple;
	bh=bqn6l4iYdSOuw4aeXmyQs004lZO8LwBG9YK/8wnvAZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e/22w3dZDxQPfN6t3Qke84UR9FEcp3jjcwD//Ojd+cIocjWBpWu1fzDDKXUzNloC1GVLYcEOKqjJGJ0SfBiP3wW+7yzYDMatM7TyqBY8J138R7516UOFwJ/NVFNpYvhqO1RfkF0B2yusEzzF/hozTRKIXrBgo1iaRzKtjfO4POs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YsifitFZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ggX7aE/o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YsifitFZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ggX7aE/o"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2tjg2951771
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tP8weeZGltbzWUDFxZtPBBXtLhbxGEarqFnYs8T3UCw=; b=YsifitFZEhisGooO
	Drib5a6RQR+GHx4EltajtUmLprp7Vnic7nEWaijgrheQAyOCSocH7wIXG46DitSj
	1SLKHTVEsXVMnDRKPYfblNUHalln9XsqFGiB/H17uAssa+6s1LJnejR6QIEnV4gT
	p07I3tX2ZDfpOAN8lDZp2BZBXN6fr9qwxXzNO/LrY6tMSft8iXCXMk3nbMMxOyJm
	Wf6WFV17EB2xy6chFs5BL/fn15oSHDtvjc8MLTCJc6gn/SlQFba7OG46bUFpUrJ6
	OYaq/xQoik9HQpJ69jWgB6GkeJquhok+1NrtYbztaUoin5IVfsOA1OTCPq8DH7SW
	elPIkw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv32qtg9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:05:17 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-313d1015161so2042455eec.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 04:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790161516; x=1790766316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tP8weeZGltbzWUDFxZtPBBXtLhbxGEarqFnYs8T3UCw=;
        b=ggX7aE/oJ7rXDIXBJRmLJBj3IGziDu8R872h/NLcpUOK2nFAmj2PUq4fj8jqUITqzL
         6LF8iR3obASRjyImDU684t5ryspBeFCByDWf9ZXgjV4fNOvztM1lZmVKMtN5A0vds1rM
         3+8/4YpxkJRhjWrEK5Fta/H1bPr5mT2RlzA1Gz5aRpCrv+Vo8D3HDDTeKiabluI46XxW
         UdvESNkpbzmw7gVlDKZZjwiYyQ4bzfJwxhphQngC8/u6oXNAZ10LlMR/ZMqHIB6AzCuI
         +94DXIroouULyDBBLOl3GUDgWv6R6F/3ARXCIKAiGA8XlGtxKMeGk1N06PSsvFDRVwV3
         WwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161516; x=1790766316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tP8weeZGltbzWUDFxZtPBBXtLhbxGEarqFnYs8T3UCw=;
        b=TJvy/4fAwra+SMqU+BP9rJuk0K+6FgyWFzfenJlqBPIoxtbuuRVPFBu7bJwTpaN6oF
         VScwbyFJCZ2qz0/hWMnu71yVXtEK7hoc0BM9FgLmhp1QN90uM4L+/tC8OoiziMZObtsy
         RNzeaPp5CDieV1CayzBf/vE6p97j58HEqUQekUmCDOfzuI/+BOgDZfcyzaozkYfjpM2d
         HeZK/RJOtqXa7u3jdamNjo1vLGOglBd9XGTRP8zBBM+smzpLr/Umf77oZ7EiInMESwTv
         oCq66ONOyO5vPDdiuMkZ6vHqzQ7ziOiYBVC/LVfNUSZUPOk53iVkPSV7XaOubfCR57EJ
         hY6g==
X-Forwarded-Encrypted: i=1; AKwUvByJAz1FCDdcsAzGQBm+5hRyKYQPBkyUTSXD7DVUyq+7wEUvR69Pzy46AQlko9PHB5QkEVkHbN0ywPP6@vger.kernel.org
X-Gm-Message-State: AFuF++kVeU5xwzmzvOb4dWiwi0kr8wN4iR1a5dfATrk9tgl9CFNi3bGU
	BxQhL0Z3MhB6AJrggWGcCoLgTeU/y5H22Fwoak3bpxHbwfemr0mJ98Gqdeu4S2u8HwGPTJo/1DA
	nx1wW8BGLO7AIfIwJUlUYXH4htHn+z7ZSCRzkakMtKuRCGcFYHPcPKovYTNe38pAl
X-Gm-Gg: AYBFou3bLtHrx/5YC0DMQVOjYI3dcixQI0s68bmMh0SwgnZDpUxAuQKde4W5KC2lHuG
	AptgxxiX4d4WqX2TTFLWyPupPwqvyj4S60+aVd/QVjYMJCvEkW4GutMpdU2xQCjhDtHcFaXNODg
	imABQ9+UPa0Gp1FYOAErfJjHkZ6fKSt+wR/+yWe6pP0+Y/D31lgi8ROO5R8zAJlALv/kXkW/Bfw
	L+zAvBmok7mixPB6h2pcx0SC/vxnH5+4OIb8z2jgFEblVxbGnRhKM+0oFDHhs/Mv0Iu+96lV6uv
	WTUkLTqR6BR1O9pp40vVRJnjHSR0sgmp8naePn3y5lLm1UH9XViiPlM6zaR1ylM1bdyxPDhn/uw
	icvDs8CoegpPJ4HrtdaDdAaAwIO3EZg==
X-Received: by 2002:a05:7300:8242:b0:33b:db21:9877 with SMTP id 5a478bee46e88-33e8d9cd464mr2014758eec.20.1790161516360;
        Wed, 23 Sep 2026 04:05:16 -0700 (PDT)
X-Received: by 2002:a05:7300:8242:b0:33b:db21:9877 with SMTP id 5a478bee46e88-33e8d9cd464mr2014744eec.20.1790161515889;
        Wed, 23 Sep 2026 04:05:15 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625825asm5905377eec.13.2026.09.23.04.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:05:14 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:32:46 +0530
Subject: [PATCH RFC 15/15] arm64: defconfig: Enable S5KJN5 camera sensor
 for Qualcomm boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-maili-camss-v1-15-cbbb42e534ef@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790161355; l=708;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=bqn6l4iYdSOuw4aeXmyQs004lZO8LwBG9YK/8wnvAZU=;
 b=BtMxks8910ezL91AonRWICuUmO6BybjXRpW34O+cKL9X7/xTV0D9Ks9n9yUFV5WtXfam3m+fa
 Sjm5Agw9OTJA50XtKxXrPLrNgIhqSX5hLQSEmrOZCA4kQsXcoINDM7s
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=SJnXx+vH c=1 sm=1 tr=0 ts=6ab3b26d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=xpjZ0Ymiy3z0-qgt9i4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: _eF_W_xdZgl-ocVPioYH-d1gwBT4bRWm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfXzgREkw1R5kSv
 3wYyet5sP22ThVcPIby8ayG732U52VCZyPsVYMa2JGUYbLGlYO5kBQPJUBxkComCSu9SzQFfKC6
 LyGDlvkyqa3LtfoyO4R9xgfTaawGbUo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX6W8XdHZc04M2
 vfc43BR2c7bOQ94w6xqgDmpwRlxZESjnbTcB071lcp7oFt1kokAP6uugJOocZ316l/CPYy7aAZ2
 d0PmfzeZi5VDxRIVv2WR5+BuTTpMK7B2xNdgCRgcNVVVQQRoOH0z7VDOmHYiSr+s2vonCyvNz7Q
 RA7rAYI3ZgpzQ+Zk67z4BMb9iCkUIDw2Co/KqJY23RfH6JTBzmhvUoi7GNTpjPfXaHKi3cOKu4Z
 X67w43md9Q//y/Ej8fzW/z1R2KRjAaf/6cQMid2LMHCnE/Bf6MxTU/FbgXiAI7XLjOZULONtDiO
 fzvdZ44xYcIGz10wn1l2g0ynGB46EbDMascYn57lfJUpULwoG++mReV4C+/LHfWbKR9MG5b8Uqh
 UsSVLzxGHy7rK9KWIi8kpvn3hBNCyHMkPCNaHNajlUzfRLn7C+aMTrQH87Sot4l7RzbtAJBs3FM
 IxYXCVH2DSdOZg78m/A==
X-Proofpoint-ORIG-GUID: _eF_W_xdZgl-ocVPioYH-d1gwBT4bRWm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230044

Enable the S5KJN5 driver which is used for the camera sensor on the
Qualcomm Hawi and Maili MTP boards.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5217de386edc5e32289e453288db0bd9449d4c6f..fa35db683bb253e83af6bb25f702e3127761c086 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -960,6 +960,7 @@ CONFIG_VIDEO_IMX412=m
 CONFIG_VIDEO_OV5640=m
 CONFIG_VIDEO_OV5645=m
 CONFIG_VIDEO_S5KJN1=m
+CONFIG_VIDEO_S5KJN5=m
 CONFIG_AUXDISPLAY=y
 CONFIG_SEG_LED_GPIO=m
 CONFIG_DRM=m

-- 
2.34.1

