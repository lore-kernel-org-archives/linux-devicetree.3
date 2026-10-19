Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63F04DDB25
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 12:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413098; cv=none; b=bEREpfaBwHANG3nMw3aDSfDp1ucDVrW2jlr5sv8KVyB3dqTo9phmBw0gOydYmdZo2Tq4R010xibDRh7StXloKoOoCBUaSS5jehDpSZoGThJQIVUtTKi1SNszA1LUin9lnOG7FG2h1ea8uJ5v7xtQIClKBOZzbivpqPKS7Y0DlSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413098; c=relaxed/simple;
	bh=8EGxWuYlQ7OXKhzQbvph7ohelP0EC9V3y0OQ4e+V/kE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jb46PSLBPHemaB4bEuseHLM+lP+nlYz/MIXWP8mWyAKf8hgO4SohuZeN5jlS9evX2k4Yi0rynYfLiLPSYNiARxqZEz1PC8M5xk6BNEns1a53BZE9K0o3R6i+OF+vj4PS8TZQkOO3O+9PcUuutG3OijlKrcnu1rv1CAggmN6i+5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PgXxb2lP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZAg1ldlz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PgXxb2lP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZAg1ldlz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P5os1896526
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 12:31:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	txESpfZ1KaTUu4rWKR+uZuZxaLU8Tf/Hk0bNSZQy788=; b=PgXxb2lPr8/6R74a
	4EMF60QmvDN4AltVu/aRXIWapYshPM/aRd4TppnpCrjI/2YXQZXRbZiG5jh3glSM
	uujC8uFb78h+4iejMiPiX452wkGFjRXatOYLOr3oX9r3bTTCqC/Ga4GV+DK3cAtt
	MJLjnjk0WlKolKmr0hV6zrQkixIrEl0RnSJMeQUKoUuBchNISoR+n72biJ1+KHhF
	rURKfkxtN41j3pfXzodr0d1rFmjtDh8ninwh9p9QNbkAeTmJnzo+mag9ngY8aOCk
	EJP7C+hrRL6ViFFbY2a3N85q3WHWyxjkHfgFuJMHXkW/kwToWiu7zmncNykthO2X
	bftmYQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdbvr9u61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 12:31:13 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c100f6f8ffso46288137.3
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 05:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792413073; x=1793017873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=txESpfZ1KaTUu4rWKR+uZuZxaLU8Tf/Hk0bNSZQy788=;
        b=ZAg1ldlzUi6CYYY8ljiuPoxvdBkbLUKpE7q0SL9Bza0lpWYffImNNc/L/anl+JKhxP
         Fu54ET93EWJ4aa9s9UXD7nz/cfq2Q3tuH5dWa3N4051Yu6b++UUfkULz2EkB2KtKAiI+
         p3fTdw3KwES7/ficD62FWOD4UuGl8mpMAtVw2+rBIGRtEQsDfSwyZCCYSXw3yPD4Kthi
         cAL5qC6/6psfA0czXfFiOThsYq9SGUFx3vD+Av4b2S0vrN9E50XpYvnl7/k33YejISDt
         q2B/yX5NR668LgWk7zJCCghWS0X33yNOcrHY5sbdhlyCaGbueMChi09jRCaKw9XKDSyE
         8KlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413073; x=1793017873;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=txESpfZ1KaTUu4rWKR+uZuZxaLU8Tf/Hk0bNSZQy788=;
        b=RnlRbgLxxIzOh7vtrdq3nZvaQzwbGOUyfNkIq4LHnYhRBuZ/S1ZH4nxaoQCS7oRWXF
         UXsip/S/kjjXoQZrkAgtxw2AfR/TKoIm8hwE4TYY2KDLTGEAW3C9W5KgjcrCxQxipdYS
         qCLLsO8w6DLEDWSmB85zmlwftNLVaL8zmDQhpTcgDXl1b024egarjisKPhrb/P92ytHw
         D8VUjBQ4yV1XMlNVyjb+2SH9bG9bWPvwNM+b1Ukm04xAJXpbngqJlSXe3026tWL/JF7I
         nkMhws8O+FItaW2v4V1bTdnGfnyO4ONR5G/q67Un4xIJP9HeQ1Vy4UG1sePt4AuN6icT
         d5eQ==
X-Forwarded-Encrypted: i=1; AKwUvByUAqSlygwv2gSu7/Lrk5gUGIpxXlhOl9q3SiFL8DnWwqMZDMXyVAtl03YYcqQrBvem8pHmVLwDurGQ@vger.kernel.org
X-Gm-Message-State: AFq9FYJBEKvAqy19kzfGIFZoUPs+lbLNN040pk0Kfdtjjd3zlmb+0jwC
	dx4IRwj3vIy74qzR828fzPU98vYjltqRgwTfPtJ0kumveZnKAlp/qXTovxL6PYp21mwT1g1cT9B
	ENIMpcfcldSaWm1cQeQB8cQL6hlYCZj0CrkR7a8yqUUREHVtlnehk+bGXbEWT+2va
X-Gm-Gg: AYBFou2yaYDb0zrDpAD/ivXWJdDnUsD7u6xBd2UydKDesLvN4KbKWa/cGWhYNDZjLR0
	jsI1VxH/Nlb0NCJFnIpoiOtFKJEjdmwuGfhiKiHDF3twurnLmozJA0RxbLJ8qUNXQLGh5BFPZRV
	UwuVULMJv7yWnukDBYelOP7Apcr7D8z5M/LxG6DzvjG8XBBpr6Gm4YIiuKUhft7HKhFam9V3qNs
	/6tSJYdNMMrzGQRsQWdVRRq9OxVatRjO/Q/ijg9iol2knUype35UdFnFd0LEcYZODkUxXixednB
	YZspTnOCG5vcMHXZ8ZqHQxeke0JSE7hviY0aTILg54QuZK7MHYSL9NZq3uypuXOFPuGqkKqjJ7l
	g5b5yBm/3URdSd7YSbFdICQ==
X-Received: by 2002:a05:6102:50a1:b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7cc369efc05mr1517836137.3.1792413072725;
        Mon, 19 Oct 2026 05:31:12 -0700 (PDT)
X-Received: by 2002:a05:6102:50a1:b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7cc369efc05mr1517832137.3.1792413072286;
        Mon, 19 Oct 2026 05:31:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1ea48bsm3601007a12.35.2026.10.19.05.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 05:31:11 -0700 (PDT)
Message-ID: <e675b54f-9eae-46f0-a207-02580fd0b974@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:31:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: lemans: Add Draco EVK board
To: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Ajinkya Inchure <ainchure@qti.qualcomm.com>,
        Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>
References: <20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com>
 <20261019-lemans-draco-final-changes-bringup-v1-3-dcabe94f1074@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-lemans-draco-final-changes-bringup-v1-3-dcabe94f1074@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0OSBTYWx0ZWRfX3+c1EFA6Lef2
 LGO3X1GmWPjhAC3F3ALr1Fgt61oW/sB0ICZe+L7JCalDjFNenCLnUztapMR0hnTthshsdysYsVd
 BLgnNKn9Ijv8k683ZPeG4hO7u8L2/h6cCRITMIQDYFtL87y9Sf8yw5SCr7lUBqtSOEl9eR4/a3K
 iIKKv/aq7JNa7ZHWv5QbtaW1fGpDk+cTFnJI84Xj5DqRz6echyAbR8/7n6kNhb06MVPEWvJhmuz
 0WkJDe3saj/TwYbpYV/Wf2NRFaT6P0QvGwlLe630t6oKfod9kNvZfxiwY9t7kYAy3bkVA9ElJ57
 FyT0V6/ev/+v6ti/pllqBEN96Qq8Fu++FEw0ciYYbyOrjm+8aY4XtIdkUl95rhqBuysc9jd5Scf
 yCAcyQAA/F6RicMGBLSaIRtC5rWNmXOpUHT0/IWjnsLpCkrEmjhUMFy/LkZlolt9CQqIMUZ3ov7
 qDQSrkGlBva3tyHQJhA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0OSBTYWx0ZWRfX2lpRdf4b60Tj
 bfM5PvADzeT4qW52raqaGqngqCAd6826Jgr2R/s5QnCejT/NVHurdja0G0bpwpvXn4Ow4p+iyvl
 2xTq4pVZJ66Wirs5Ral3XIgLFF4PQgM=
X-Proofpoint-GUID: lpH1O2hnEKWaJSP6b29wFqBbFbIpi54E
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad60d91 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=2y-c5VRBA9tA1ecnzscA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: lpH1O2hnEKWaJSP6b29wFqBbFbIpi54E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190049

On 10/19/26 12:27 PM, Gopikishan Thawre wrote:
> Add the device tree for the LeMans Draco EVK platform which combines
> the LeMans Draco EVK SoM and Draco carrier board.
> 
> This device tree adds board-specific peripheral configuration on top
> of the SoM, including:
> 

[...]

> +	ethernet0_default: ethernet0-default-state {
> +		ethernet0_mdc: ethernet0-mdc-pins {

Please drop unused labels

Konrad
