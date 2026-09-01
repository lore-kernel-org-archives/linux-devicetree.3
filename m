Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7E943CEC8
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 16:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278538; cv=none; b=JLmSn4R8a6L7C/YpHjzzYhmjg3Ja2MZPuPBpGAX6WQWXYs77QffQoG1Dp8RIc8VuV1h1uidj+NeWiSGkAABpjAYDIdxbTU5ZMawMdt3CYehPDTV8tBuqvfgxaoq/fU2JRRngn7ESpnMikAJnk0mdZ2WkDzuSgx4V8l41hKnRq/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278538; c=relaxed/simple;
	bh=w4mM5Ssoiev7XYTuaP4BQ0VP2VrO/qBImVxraWj4CfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GuGXeSaueQvwnQlrsj/1W7t+BBU7XkEFwRzFACIkpINgkMfFyVwfqmziaz3mCNs4aBpO18Hmufw4AnClL/N7UtnCBqQXNLxeY3Wujszz4SSNBVojvHy/DDkp+wxV85aXP65OkhrfheGsMTC0Bq9gSQ2OSmNwIcqQ6Hgthkm67gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ODS6pkaL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MR4EipQc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ODS6pkaL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MR4EipQc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8eR62825088
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 16:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IKh/1/UdmgSx+3b5IeB58V3xIU8nJoGkuM7zr/rPEQY=; b=ODS6pkaLPLTANowl
	4iG9bEBSYyMSSlPy++dbr0cyqIYAWV8r0MY0D8036Bwex2TlbYbfUWCWCILomsBk
	MdCocYYyRH9W8I0UiJWUrWU07EH/2NM5iwMfOb0Vw40Of3BBQpUPQNn/6DOmF4lA
	VLu8jqXfRCAUfBv6ZXF1Xk3UfGuMhJROHsbTwce/tY9b3+Zpemg4Bzip6ZBKSzAd
	BH9xn5iCtBEla5Xqe3S/e61ftW5nYx7KuWyOLtNG/yejMHtRbzqTq1ElYr+3WhzR
	CHIFaSIxpwkqINM/k2C1OOhBNWgr6u2woHV/sGlA4weNcDj1OWDmp+FXZRvQUvwQ
	q1iutQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7cbgmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 16:02:15 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78055b483d8so14348137.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 09:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788278534; x=1788883334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IKh/1/UdmgSx+3b5IeB58V3xIU8nJoGkuM7zr/rPEQY=;
        b=MR4EipQcxoLgA0yz1BZ5Roq9b7knFm/ExNTqIIs3QoE/ihkO2O2AAnVgmIFyDBPDEv
         +crxzfEx7nFH8/HcCo4kl4sZxpQrHS7wilju2wjkKaJ37+Q8KAuL66+O6N0ZuGOLkzzn
         d/wx1/lLhTB048IGv9gZux5jYyg9AIhrlgBcSv2z9yFoEmAKssk8JG8Aq1np9K2fhX9j
         nEa3O1EUIlbHKtiG2By6sY9uotXHXxuuPJXP8oNnHk7bgt+tjjwJO9L6cnfF5aiheywO
         DsrDWtY9bt4/OJr/uyZE5qbGvZ4RUnoQRSMiZxoEbUnsb4d00vKYaltbLEv1RI2vmlj/
         KYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278534; x=1788883334;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IKh/1/UdmgSx+3b5IeB58V3xIU8nJoGkuM7zr/rPEQY=;
        b=qg3QKaQMFXwXc9LVqc85ic8uAqkKPKZdfdA1BdEpf66ZUO2hQqj8E+rBY4HZDx9C2L
         Hyy+ebfksO4xA/97OfzOevlTt3nBccYEx/OvF7oWfDn8wqqCF2sMQxqbJNcGD/bbU6Kz
         Tyi7iqepZWIwHEk3C7eRZ7Y2lfQMWL4b22zgxXALpa6ZLqyPlCXEVgg2mFSp6X5y5bPX
         VtEs5m1s2la4Jiqopa/GqCPNgbK+ghDA8eViItOORKy1JcX2KDCGXa0xsiTL5ZX/mdxA
         gpv/qCR+Pz5JAKbQQU/DmxUi7YFujxxcaBKyJKliHhltG1dQuFgF/shxzeh7Jj4LPD4S
         HJGg==
X-Forwarded-Encrypted: i=1; AHgh+RqOWRmQlZPg5YMoWY8gW9xztyWaenTM2ZNbmduLZph9WtxtS/H1KOE2hlVeBSCv5iN8R5HuTwSqjMcO@vger.kernel.org
X-Gm-Message-State: AFuF++kuaqyBsyh5AgOjt9T+Ez5iqKDqUYFpkmnJ8PaThoCu5dIX11hv
	jJpAYyoUGuV6cPDZ6g58/jN2PKyYfllvjAxfGQ44LR4CoxuEG2ZZEOH+N7qzNAjybQejvSZNLSK
	Nn2mfyIipfT0X0FpEZc4v9DvLQvOoQdUzYhRVXwfdmteb0s0ldmGdcbrg5pPoyQ2D
X-Gm-Gg: AR+sD102PVViEoh6K7Np9d2cxRRhf0pUGOAs6KO+PzkFfooM0fcdPaH81yJJU3E7ZDk
	Zq2r1XvJeuO/vfIHT4mdPoPc7e8CJLb+xxUhdc/dTuFRWDH0CPjMJmKIIyUZHlFanOybNYP08du
	G8CqZ6t0g1nJ7aCrZVPaJFZ+wIWy/sOXh9THYdbWX5vjG0Jz/YsiByWmGb714xE+0dV+Fn9r9sf
	8rH3YO9brHu8yshNWf198cVoej4v33ChEMcNN3EvvQP0IaAawH1vJez2+oqhZ6V+F7GqG2kKu+d
	sHNek4d00Q+mzFZchoZD7dfbeoSxUfyLgZM4ptMrRLMhmfj7RxpagKNBibv/IbFUmyHZpq0eOQj
	ygZtk91gRvAZcZzDquODE80kPUQ==
X-Received: by 2002:a05:6102:1589:b0:778:5e58:ec46 with SMTP id ada2fe7eead31-78596dd6febmr11326082137.2.1788278534005;
        Tue, 01 Sep 2026 09:02:14 -0700 (PDT)
X-Received: by 2002:a05:6102:1589:b0:778:5e58:ec46 with SMTP id ada2fe7eead31-78596dd6febmr11325986137.2.1788278533185;
        Tue, 01 Sep 2026 09:02:13 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:fd4:cb20:f8d2:dc94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10f08sm77090785e9.7.2026.09.01.09.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:02:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/2] pinctrl: qcom: Add Hawi LPASS LPI pinctrl support
Date: Tue,  1 Sep 2026 18:02:09 +0200
Message-ID: <178827852464.39834.11620315583830437575.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260821113548.2686650-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260821113548.2686650-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OcyoyBTY c=1 sm=1 tr=0 ts=6a96f707 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_3pKljZcgwLS8jvdWFwA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: pkoLudhg4MbSX8G1uBddh2Xni3qgwkP7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0MiBTYWx0ZWRfXxs2UGq0DEp3P
 0/jLGciraSvW3/cMNpaea3ARH6LptWzE7kxBbl9agLFj6G4GcF7tcrNFb0LH2jDRG76CJ39qo2z
 P4919E6ussxzeJwhBQLOZ/WBvqH2wPk=
X-Proofpoint-GUID: pkoLudhg4MbSX8G1uBddh2Xni3qgwkP7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0MiBTYWx0ZWRfX092vnCSortXu
 zyEhVMGzCjgQYwe50f8XjKlybaWX/+bClV4ReAzd0Mj/WjxGsD8JJdoia/W11AtH4PklkeVgALl
 BtstBmt193EbE8nQJxBZLsfsH2t4YLbXrVL70EtDf/RmjaUA4OlsOzgRpq/pHrdf/X8y5gIgM0a
 Tek3u8yyRGu8eTnDlAeX3tYf77c20YXOSWg/tefkLku3Em/aMyssQrsnQz4d0ZpnZgHBg1xpYIf
 3LWgU8ZrRrMe+owib0s3+TpWUNmvdcjQCB4SSGR+8dBkc68c/zzJI+mQcC9vJa38QK5xhLCJECa
 9Sh/ZzQVqtv0VtrGv4SkkrPMBiIzjwzbDq0a21pAVUbJFQjUlvLGbU4ft0TfFfb9gxr4OzA4QnR
 GOJEpK8CboPBEGt3dQTI+FWSQMwwybmW4QdT6+g5dqUvFsGw3I+NEIftexZG88pm9Ls0UZ/e00L
 1kYjxr/Y7LxBbVV2jkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010142


On Fri, 21 Aug 2026 17:05:46 +0530, Prasad Kumpatla wrote:
> Patches 1-3 from the previous revision have been merged, so this
> revision contains only the remaining Hawi LPASS LPI pinctrl support
> patches.
> 
> Patch 1 adds the DT binding for the Hawi LPASS LPI pinctrl controller.
> Patch 2 adds the corresponding Hawi LPASS LPI TLMM driver support.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: pinctrl: qcom,hawi-lpass-lpi-pinctrl: Add Hawi LPI pinctrl
      https://git.kernel.org/brgl/c/a67c78364f8b3312d36c3518fe839af8f8385101
[2/2] pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS LPI TLMM
      https://git.kernel.org/brgl/c/6f168dea0db7bf35089a7fe942f1df6214464fcc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
