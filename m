Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E299391832
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 16:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783354842; cv=none; b=FHGn8Wzg2tpgJxM0LRNQcXrwTliFhPJJ6TvPXT55kzckYBIyhnuPmCLHQ6dUx5xZechiq1zIbct/H9CWEJPgYaFUtCRLF18dcbBIkr/wUoAlRCUZwVyq9CuXtNjv8C0wimHADM/MJ45m0gc7llS0DZCRBMU6adrVJ2LP3ybaEK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783354842; c=relaxed/simple;
	bh=88wkV55+op7wraW1zb8kD42JmYHg90yDvFPVirI2ITM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=INxW4csXf3umNMd1QnSMPo5e9ef6tznH2Iz7K2KlqnTri9U+DUjFhzthTvs+ZPyWDBzd+IkTEra0r83gOQkKnX1DDPMW8VbUDomtgVWyZbbXHPiCfOWsXxgVtN3+6WVw/ymDBoH0lGE/JrwAFDMwrv5gPtFITdBqthW1rcs/skE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jAvr+EqL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eS8/k2Am; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jAvr+EqL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eS8/k2Am"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF6ER825900
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 16:20:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vj+tPjVgO4QFZGX8NX7hUas7HHKu8vOipIIcHrTeLHs=; b=jAvr+EqLq/MzzQlC
	pR3NpeLkDx2v1idnZHHZb0G2jqjoRZIkXxFfM3I6Eoi3zBeJLr90Aj98c2gLqmzt
	nqeUacUcDNx/INkPNqyA36hPD7K0wea5BmOaJogJCAIHXoM3O/8fFenFjvb4O3Oh
	sXE7JM1REmHKk7m3VJNvC3adROAwTlLCUUNmU+5nDGI6puesa9ZI3Iq0rEfD+GyW
	VDGHBeL9sYD5BZb5KoptrU5To8MXTEFjSJaAc+zZefHEdEgvo9XRizliKcfhbxOU
	sF28ezYUuM3faJPhS5ixKCEMnsvz2Zp81l3BNvKWI5BVbmjQiK5xiJchLChE52dt
	YAPSjQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t8a4ku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 16:20:40 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bebeb08c02so149526e0c.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783354839; x=1783959639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vj+tPjVgO4QFZGX8NX7hUas7HHKu8vOipIIcHrTeLHs=;
        b=eS8/k2Amx5LpqwYKmMEzg2DCk2uw4A2caqDmnpgBqXNLYcM4u0UWpn/ao75UefFH4q
         Buh9MS73kS0uv3O8Ts9huqOcQDcQ5/bE9Enl+ChBXhZhgA6TgKA3jo/UfHwZ1J/TFmNW
         lqYP82orA/FGKPaZ3vIrnZg1qEaihxCzz8oq++CTppXobczgaj4oVhW5YQ6t00Unsdhf
         OejQElK167dyDiGIfI3h6YuhnNqc3tIQ8MvDHL4bGnxqlhWCJdTIVde17j3etP5wfzgh
         qm3wMhgJgpo0E+/vpQds4pNYRgudzaGfsRzj3PyzGJgG6RGJ5YPC1Liqz7lBqOGLoAYg
         NTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783354839; x=1783959639;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vj+tPjVgO4QFZGX8NX7hUas7HHKu8vOipIIcHrTeLHs=;
        b=Oqu5fwLGzSxHZJN+Jbd2hRHsQtZH9fCSUTa7jC3rO4FGUXgx6Nf1YzyoLIXS1qEHf4
         zCB2vvJOTwz7W0N0wRU+ZdgVBz/o8dM+fAc0B8APig7p1CLZUfKqGvQ2dJn/exVCNf3X
         Tj/DLe3jth6h/7Cr+ccMP9gyjzCBTCzGu7UIpXo4S7wpJg9OG/NYSollr/O3T4bqHnsc
         XC1RrVb86+TIJdc9ColRda2apFF9WKr1hODA1y2DxZP111i9Vs1izDaH/7jTezigxheo
         SP13Oglvbf4TWlwxmPs12uNFmkrAOnD0ksSSf1O0mvOBOrfBbNq9GmhqA5fCKSvvgk9t
         PVxg==
X-Gm-Message-State: AOJu0YyjPLp9EjFdR6W64icrMnMajCsnhLlgSWnE/d1O2fchnC4zhBBu
	JszZ5hU56/qTxBnp3Npdj3oJRICcjfVlcBYqT98gGqN83dqmTpYICsvJt2eGnvljh94/CPYKtRt
	q3KjCsRg/cTpQ4vlyOfn+MbG3LQxCN1BBK7FBncsmex7gFPZR0hR9ydUIucW9knuzM+8jO/5V
X-Gm-Gg: AfdE7ckZZO+9ZuHLOVV/8kruFNyAXDB/CyPhwTFlNb4QoWr4GQZfO6mbP9qvWy1LlTb
	J15yYOaUO2pGX/DkWc9IgtLi1I2TJWv4QZXxY3JYoFfovXvZJ5k3TMVjDdqrXYRopLo2P6jHH/i
	M3URRQo9nETmkl21OXikeKhhMsCvSFGOayA8SfLSYLXluLK1VR5iOM/PiNh8ZwZlmYiMN0fy8Gq
	U/PNJdRLrTnrbRg2f9CQM7Vf2wZbrbidU4TTZCdUwMwxabxrhy+T674fxxR5hfHWUfcKmctBpxW
	u6LPQIp8ZX08mTDaDidRKAP1HBvuGtyJkK+WjrkCsbLyKFbOG0kf7Yy9wqUNmYQtZ7RDoyWIgHK
	WHIqZ8mxonWkxt31Wf1D545mSii2ncXyukqYE6uKr
X-Received: by 2002:a05:6122:1d48:b0:59c:b1f7:4df3 with SMTP id 71dfb90a1353d-5be908e9636mr775209e0c.12.1783354839590;
        Mon, 06 Jul 2026 09:20:39 -0700 (PDT)
X-Received: by 2002:a05:6122:1d48:b0:59c:b1f7:4df3 with SMTP id 71dfb90a1353d-5be908e9636mr775199e0c.12.1783354839155;
        Mon, 06 Jul 2026 09:20:39 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d8410sm26100765f8f.15.2026.07.06.09.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 09:20:37 -0700 (PDT)
Message-ID: <e8ea458e-1955-4086-ab1b-9599caf7368c@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 18:20:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] dtc: dt-check-style: Handle properly DTC-style
 includes
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260706-dts-style-checker-v3-0-03ffacff9226@oss.qualcomm.com>
 <20260706-dts-style-checker-v3-6-03ffacff9226@oss.qualcomm.com>
 <20260706161325.B76211F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260706161325.B76211F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2NiBTYWx0ZWRfX+r1Iv9/z5MwC
 tl1hzybhXDO6HdqhKSv+zoxqqKEYoHdJs1FddNs11EeoECJMr83nH4sK+DYS/iwjj4CUsausued
 eWW3tpOTT4yEOqJCKcssGyUBGqAB/TI=
X-Proofpoint-GUID: WARq47YfLXFfdV4pKoGWJ9e5o-v4KELz
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4bd5d8 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=thh0EKpwSj0m2F0jE7sA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: WARq47YfLXFfdV4pKoGWJ9e5o-v4KELz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2NiBTYWx0ZWRfX2GltYAnkrXv0
 F0KjGC7993dOv/wI8EJ5QJC+RZYYQbdqFX4cyK6XIageOEE+hos3Kb3z1v8mAPGEKCEDH8XxOVO
 m4udoxuFWkbptsnoIhwuJ1xY7SATM89Iz0aa5bPKIE4/izddR/Vwx4A+tIZCbazCFVv+EfKvuPP
 LoZ+umrNR6My63GFFPpE5TrbJsiq5Ae7KLIiZJZVw48UxAW2FdTDhjvQdW4wIc332fdakcAZDwA
 3/ue6gkUmMooEPMb0DlNBhtnLSgUSE18vG3wOsrWT0zlYv/PNs/7rn8HpLM17c21l3jT0CZwHfN
 D2VKB67ud0D2OmmoTqvwmEdn5yCLRMyccE01lxGr+BD98deA2AKD2iNeeLCSWqWGgKMz6tv7l1V
 iMbzTPJAPsv1P97JJahNry2aUSoE6lDMlSSD7inHqN0WvAZfL/kVYy6ZGCMrZz32zzmK09Ckji6
 3XNTNC220aUDmnPjioQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060166

On 06/07/2026 18:13, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The regular expression `re_dtc_directive` fails to match `/include/` directives that omit trailing whitespace before the quoted filename, leaving the original false-positive indent warnings unfixed for such cases.
> --
> 

Ack

Best regards,
Krzysztof
