Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493349;
	b=X7SVI37qQuk9y5/cWVHo22z35OvHRfVEkiGdMk2KdSR09XmScxWx5l+kLOGBQl/8mKru
	 XO5g+6e/bb+ebMjM0AQpTN2cxODOYGqu0iJ79ZfASowV9ed0zBx6BMG0Oye4HPdOVBCUF
	 B5DJOeRhWLnomk5U7VWJu1ZsLmve48E6flRNpsCcYP5DKMaqUp5pMzn5S/YYRrYHRf21x
	 CePvTAaelEXT/T8iZe7GXBL3/xcPEwSI7+5s4cPxa++4RebS7srUwElyJ63OLH49YcpLw
	 f2oZ8NjfzftENeE02ifTiTsDz73vVvqnyzcl2GEP4uapaFQYJUmRX8SKcz8itxZJjig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493349;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=trCl0IagpgcoO8afehRhGBb553RQMJrfCqZC+//rWNY=;
	b=PuQ6knwKBTB+qxiez6GbUdXXuTDn2SWm7UHJgCbY8EvLIDM47Pv8xbIuGFisu5pT3wnx
	 HArzbzznf60bZ+zE5b9Nzohai8q8Mt9yaAFBgu0+45Mvth4JoqoqsVEA+ub4VdZBvXiHM
	 mEHlNOI6obtQkhLJXJouXy6ISQOowyvDh4Wyp0zYIc4weMEDr407gafvbSyb/7oMGe+iJ
	 OOmrY6DbwTG7oRWK/d/MP6oRcwnxXcKPStjeM+T+wAvsM9nR6EQRbrLoxZkDPPB4BZ23o
	 I5PC3qZQoEk5yOlWSPK1QlgpAXHso7+QU8G3p4uQkXqz++qaNbzfbn//W/8NxihACzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AprRcdk4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="KnF/8cI+";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4233F60A2605
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4233F60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AprRcdk4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KnF/8cI+
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAZvu61398831
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	trCl0IagpgcoO8afehRhGBb553RQMJrfCqZC+//rWNY=; b=AprRcdk4LR1jWCUu
	ikTATDCUXNBzvj4py/NyCVz0Y08DJJQrwXULba6OSy/LnqcWRfd8m4zT8pyBYBYI
	pRW0JACZOhkLwLkOaEpLqonPtNHEdcL3Wf/hwgBkVkXkHsNS9+cCf/5X56VpVv/H
	FyYzaIHy95DvineVyNXf44lSFPoYZW9hT3c5Hw5Xy02jTkpB09VyZFwY3kdgF6sR
	415q6sxraurE0DwtR4oJ6PCZ4b4xJOqIES0rWVzl3sjIC1LuBqcOMeHg1SWKVb93
	DBHjZu6V2rIJEGXtqueCLC+c4fy3mwYvTsHt7KPAECmEn2AbVJ7O1Q6yPpE8iN6S
	xv+igw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n24mn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:49:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1440e081so52667785a.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 03:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792493347; x=1793098147; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=trCl0IagpgcoO8afehRhGBb553RQMJrfCqZC+//rWNY=;
        b=KnF/8cI+xuhttzsVE6aNOzwEdcDcSSJDCl45iRsBdYZuB7TwSpl+R1pwqFs24SE6RB
         Ut49GZprbm/ZnULHvYX/cI7rF/HZYrLO9JV/Uh8DruwXCANL7kVROmxq1yJWfYBvrSCq
         2RccJxvZESYaFJkS4b+qkfxKUNwyg4z5ExaaTP2zQ6fG54OXuVYideYMoevwJnWtVU64
         EN8yQcGlBTKCXcwfuuT1Y8dK7Ttth3uahKEatYpVyA+DQ4nBFLq+5wBdPBVDrK3aOEs5
         2LFwBvVrCRNU3oA68IvhKViRQo/F9zP7vO032zxkV/i2GRWi56doYU51bEhVilgNayo8
         c8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493347; x=1793098147;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trCl0IagpgcoO8afehRhGBb553RQMJrfCqZC+//rWNY=;
        b=MPmUJTgE8W+u41MjBCgFHAKLiv1C8CL1ihT/stsTnms/WWSxXaSWrZYf8rrkAW9PXX
         lRW0aK78lJkS0PMKNzbdfvUl8gxXBBq5gJ6qrUHzk2FXLCsKpXDvtGDk9yG7zaQn5lAw
         RitxV9l+6ut7YI3buyIuui0P+0Zlz/E0mlBGocW7Xyfq8Mqy8D5onSMgwsdHnumnTtl4
         F3WabZA9Q4YXL7XRMQQ5coEPals2Kkm0Emd58F/5xHSdGwnvltOTjD/YD5o8e0XbT5Bf
         eU8+z3sauVWyYkfGktgde0O4l6FNaxoWKgkFn/MvDiPHexaVT8jqiCEGSgiTBuBNdGFq
         6vCg==
X-Forwarded-Encrypted: i=1; AKwUvBxWS4iuXVL5+HZIV/Jh/ksUvargw3h7JVB8boziYVvsa4dA0sWqh3atRL2SI8baImnq0kiB02MUKMTd@vger.kernel.org
X-Gm-Message-State: AFq9FYJDLydfy2zdzQ9YKyNf+8uf248YBNE6nkD1860XKdLLlVTxrTJ8
	ncgX3Se27kaEi10oxlrrkxqJdcEYfydxcwrb56WjvrfNXbPK3EY3w2980cP75Gs01x8nok69FWB
	fmFsm5/Tyin+D3WTdbdilzhAm6N/NMZN/kTXSn+b0yb2zFbenWGWrDvDCYTHXu6Ct
X-Gm-Gg: AYBFou38X2Z0RB3b+s6nWddg0RLgAcDvSvdRZfcjRmtVBQaTwpcnGVbO0sFl2XnQ2rs
	WepmVaWU4UIoSL+GnTO8g0RxHNLbGStQn8/RUu3d9OI7A1VqfK9PSfBJe34cBymg5F30NMllzhs
	n00BliBkyQVxmqnQel0NsgTlzGmKFvtRyKOeJtJfcmTF5Smvke/pUG6u2ebQtz4dHBuzO1m7aKa
	FF4KJK0LtfDk+y+u8kHdNFyPw3IdC0RLvEAoV+1XmKhc+sodVXHarjy3RaoPsXbNh55fN7HS/Hk
	mZyikYrM9QdgFHZU4fhhIfkEnTnKLwnD2wJ1ON36l8v25sRUuhNLby9xuBQcOC8YmDurxxiZK4p
	rwumJ4SlZlDbomCiBlGwEqA==
X-Received: by 2002:a05:620a:2a0a:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f29b88632mr1974420985a.1.1792493346582;
        Tue, 20 Oct 2026 03:49:06 -0700 (PDT)
X-Received: by 2002:a05:620a:2a0a:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f29b88632mr1974417485a.1.1792493346081;
        Tue, 20 Oct 2026 03:49:06 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c416a4be585sm407740466b.68.2026.10.20.03.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 03:49:05 -0700 (PDT)
Message-ID: <d2719210-26a4-4f9d-82bc-e6aa5ff3f2b3@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 12:49:02 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] phy: qcom: snps-femto-v2: Fix order of arguments
 to qcom_snps_hsphy_write_mask
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
 <20261009-phy-v6-4-50408e45bcc1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-phy-v6-4-50408e45bcc1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 87gVf6APj84z-j3G69nUMrWTl_V9zNzq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0MiBTYWx0ZWRfXwL5yIwBoCLGB
 Yyd40eO+/o4dRujwFsrO3t8fTDFElCSmJ26hi/kBYUbf8y0skoLld6X8kX6cGgrxnlp32POUQXC
 TwUqyP70HBfe+X7KqFsc7VKZ2RIdx4w=
X-Proofpoint-ORIG-GUID: 87gVf6APj84z-j3G69nUMrWTl_V9zNzq
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad74723 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Iap0342ROmGHmkRQeUEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0MiBTYWx0ZWRfX1nbvaKz+AgIy
 XU0g4F0g+MDSYm67HshsqngQ8b4/OZHptHN9h29aeAskKbA8njGB1tB8m4jqBi3gkLzA7D6d1rh
 8kmjHq4O1xIRn1tH1hZ5YgPYH93Y1Nkqx/Anch2jGxfmxckXcggqPLCBnPKePURDxLb3li4yZdN
 Y5HGQvmQ3hGZM2Z+x9H1wr/WQiCE2dXcuG14jYK4kdWNjmqUILzZQ8BF1h2ZZP0MhXNrJ8tcDbK
 kD8XeULm59+B0ywIPmmq75J0hDGDOAoSJCKHdWrK2gb2jkcV5CgAVeh8csDLw8zyk8kfJs7Id+S
 PB1tK2xym3NzcniQyGCgWBQA2E+BLwyiv9RCMaZANDLwYiJ7z9L3wCp9YWZ6EBWvKpT+vECtznG
 rOhwyw2TvTjJS5YTRcMGxzf5UZ7REPEWZJjhlo6MJnWRRITNOG5OV3sEXSpuXcO6QZweCJ0OY+z
 HpSjx/jpc08dy1Utfww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200042

On 10/9/26 6:49 AM, Varadarajan Narayanan wrote:
> Fix the register bit field mask & value argument order while programming
> USB2_PHY_USB_PHY_REFCLK_CTRL in qcom_snps_hsphy_init() and USB2_AUTO_RESUME
> in qcom_snps_hsphy_suspend().
> 
> Fixes: 51e8114f80d07 ("phy: qcom-snps: Add SNPS USB PHY driver for QCOM based SOCs")
> Fixes: 0d75f508a9d56 ("phy: qcom-snps: Add runtime suspend and resume handlers")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
