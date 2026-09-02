Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADC51DDC1B
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 14:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788357663; cv=none; b=MpR3vtPWEPtI5e25ksYSSjon7LFcf9LNyrKt354m8HrDDXb/2vVwHL0UYS6/Bcw+TANnorCPNdK/sVrJBO9PLRbAhgxWPP1Ckpm/W1PewBFCWh7/CuNQxBI2rtb2vULXTUTUb6vR+tTB9/+h67yUeymQ7prSyRDy5B3mmqyAoxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788357663; c=relaxed/simple;
	bh=QUkRyik0eCsHwhKR92w2rKBKeVOBb88SlZpwkoQ4hVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E5rg4mC4M2hZSgoyB2f+idHPl1H9e38ac9KSwa8IkU9VJRCsvljTC4rzgH2cA5M184gYEoZ9NBJj92dL7UvLBbCPn9yCtAlvuZKbjGaZXRfXQ5L5QfC4+abMlgFIR591A8sEUW9i+l5GKsTC/A9Qn9WwAZSptA03VRBB/kTbxQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X6UPllYQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A231ia58; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X6UPllYQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A231ia58"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CR3M32251479
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 14:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eLj2eXlys9pmbPYscBzp4AyUd99vJAeUI5TcFcOt/1I=; b=X6UPllYQVZ75nQg7
	FgVy6ihKj0pXCki3rg5EpsLZf8hzJplK5uJGwSV9XZH87Vac+CZYSAqknKwbbBGu
	WFwX3zQPTQ/rhODAUNRT/e5KXycMsmt+Qu0KppysOZS4pjJD5alKw3lbwqS2o4ek
	P9v7Xmg3G3fL+vg0hxYdqn0O6g3nADuO20B9N5ogvqOL7PriePm9pQfw79TFe0ke
	igVSArPRK8GzpcvY1KHg8N/jNA/3UEyEGnIajHcB+dcKZvi3ajDw2sUvKwHg1eNp
	nBIXNirX4rEJUPfrDUDYft2gUP+n7Qbi8QXdbXXISODvUSLyC7oWnplLiRQzzrIh
	CnXBfQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gebsx2ay2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 14:01:00 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-74ab6065f97so15314137.2
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 07:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788357659; x=1788962459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eLj2eXlys9pmbPYscBzp4AyUd99vJAeUI5TcFcOt/1I=;
        b=A231ia589eBiDiZDlZbHK90ih8N7heIaMzuOCytn0DUBDdMRLrKz8csDZrv7s7J+5c
         wDLll+RMIhc6jYDSBvQyHMrKhXFCjOjd8ZvTIJMU77A2vX1F+SXu6JBCQkPdPmk31U+t
         dbZUl4c6vxqH0jttADC2dASWagXF1mxn+KLRY+7pP7BZG9SKnlHlQsszaukZvmIDJm+k
         aCy4PWX7epax83Str7F30qX3pQVPgOUShNvEu6yfuNTH6jWQpUrTXpG4MCCcPZaDx5fX
         rWvg/R+rBuV4f2fGIP+3gx8eGwTzW7oZmmlvGO0yaaJHXhgIseyzwZDJ7uPe3gunsQXj
         XESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788357659; x=1788962459;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eLj2eXlys9pmbPYscBzp4AyUd99vJAeUI5TcFcOt/1I=;
        b=bioiAqhWdWCtCWBGxsB0fu5+Peb6F0doGs1xQ4STfmE07skPVvCSzaz+Fg+HlDxSe7
         bsZaPgf9RETtQToKdo2t7XW9geLPzQXzWwgV1uvcAJeeAXtRNXOrprY3vRk67bHaxhqb
         5eoNSbKhWLTpOnX5M1h0jTRFjustjhPcgo81wcwr/XOvSeiK24cY151CKgxeLdU1cz1z
         RjL2XR8paDYuy2VhwHqwjQ8vArQQuTUr/7XKWd65pBc5LLh961MvXytCD6ebN3uKPY1k
         GqXy4Wiz6qGbFIyNPMss0vZo7sBCIc6YqAdV9zqN7NktoH+oqYJmjRmiOLCca/ixth3q
         EHUw==
X-Forwarded-Encrypted: i=1; AKwUvBxp03duZ3KXLHaVGXnjIcZMgk0NsEz/6aZk0fxqvx5a1oQr1d8I9aKc0/jHEYFYNGYMdk3/wsyiFGEj@vger.kernel.org
X-Gm-Message-State: AFuF++l5dKPDyUtSZDx9+T2C/e9kUpvsjSL1nwPauqkpVr1QKuod6xX+
	CbbGSEYqbC8T7SmSuSGQJayb2O6Hryjmu/Sc9UtMIXN8Ggu53tedLv7ccC8cbtIRySlg5kRO4W7
	HX4lV4WWqKWSMibzcp+mvTbrT2vPVsFcdDjQ7ZSBBTsZ7YFed4+82tD7wKwIExmMV
X-Gm-Gg: AYBFou3Bhwa6bLlVx/yt9OdN/uErhAytaXsQ9uR3aw7Juf+T2UL6GPCJRL8s9MKPA+M
	WUOLwdN5O85DN9ZHHP51zCwSQhoGiWUJBwdmATcSCVvt3zagaDdO+6YPQfRMFaa4hXEzmVoKsX+
	9CCFGqBDIQp4LLmAgLizZ2BiiWXfcy36GVd/WkxK257o1u5oJHtC1brAJxcThOstF4bYHWerEgr
	ZElIHn8wbnOnAe7JA8mqGb+nMXty1y0SxjJ6zwjBZ2nIy82bnLdhveMI4ECvBZd0rMj1czmm8Tb
	jxPkN3bsbj0srRLtOpXuarmPrWP8R/iX8tHBdkAsVyZy0QZE/+lovJzab3oZNKIt6i3nbHduRjX
	bmEXhaa5aZzVYnAjf9GBW7g==
X-Received: by 2002:a05:6102:292c:b0:78a:135e:feb8 with SMTP id ada2fe7eead31-78a1f241009mr641446137.0.1788357659429;
        Wed, 02 Sep 2026 07:00:59 -0700 (PDT)
X-Received: by 2002:a05:6102:292c:b0:78a:135e:feb8 with SMTP id ada2fe7eead31-78a1f241009mr641231137.0.1788357656711;
        Wed, 02 Sep 2026 07:00:56 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606b25e6dsm599815e87.34.2026.09.02.07.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 07:00:55 -0700 (PDT)
Message-ID: <a8396c00-0704-4e7f-a4ae-44acebf0a470@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 16:00:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: Add initial support for Nord Ride
 Embedded board
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-7-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831032103.341633-7-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Meb-10TWT4bQWnH9a8eVLlHl0GT_dxfp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEyMyBTYWx0ZWRfXyYJX4Od+f8Bf
 EKaaVVAe1kQSXoi3+eRTBHh+3HRYvlxRau+V9AsGJljbwarVsd6EbScHhcT7r/zcv6E3n8muEYn
 HlJCH+Yi5ym6sNsGAakXDXWaHWJrsMSrDwpQDEEWoorZhkN6tIIjZ4k0UkMcCrhFG1ZeS9f8jgJ
 ZAb7THeTT9GkHd59ZeOkDErpjf/5tSLbUhW/M0P/Eq8MFVfJGGDkBTJ27HKeYVvk2hTLlMEa7Yh
 dkpy9LQ5o79JbejnYN+o0IUtoSfJ/0VCccj+ASGx1ff4mDvL9GgAb7h2GMv+KLizAJE7Ee5m26h
 UzT7yRJfo+vx++RbW67KcVFQLFdRTgNsfnYYJtmdijKKDv9lftYVlophzw8xRTNZLdIehyMq/Sj
 wtJdDAoIF4wl6rh+fbMJ9YEvKvpQyFRgkPYhRwj9wY0Ix5MuzBH0q1Ic43GNnZb+YAQs8HpdjzC
 7G4J9hRpWbDKUTGBxbQ==
X-Proofpoint-GUID: Meb-10TWT4bQWnH9a8eVLlHl0GT_dxfp
X-Authority-Analysis: v=2.4 cv=AufeGu9P c=1 sm=1 tr=0 ts=6a982c1c cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=AhoN2pN4Pgw2UKRmVskA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEyMyBTYWx0ZWRfX6qO8yt6has61
 SK3M02eJGZcyEjltSuvLvnXCqQMPLrMZQVGXRNEyP5K07hwY7HwDvpNiWgb+lsDaaMtyCkzz/wy
 jDRuWCW3UF44invOWQsAkJAZnP8kTZ0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020123

On 8/31/26 5:21 AM, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add the initial device tree for the Nord Ride Embedded board, the
> non-SCMI variant of the SA8797P automotive Ride board.

[...]

> +		vreg_l7a_1p2: ldo7 {
> +			regulator-name = "vreg_l7a_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-always-on;
> +			regulator-boot-on;

You mark _a lot_ of regulators as always- and boot-on - is that
necessary for all of them?

[...]

> +	/* PMIC H - "UPMH" satellite (CD90-73961-1) - SID 0x7, Bus E0 */

leftover?

[...]

> +	/* PMIC I - "UPMI" satellite (CD90-73961-1) - SID 0x8, Bus E0 */

likewise, a couple times

[...]

> +		vreg_s2i_gfx0: smps2 {
> +			regulator-name = "vreg_s2i_gfx0";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s7i_mm: smps7 {
> +			regulator-name = "vreg_s7i_mm";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;

Are these actually exposed as regulators and not RPMHPDs?

Konrad
