Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CE837A83D
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787552927; cv=none; b=uRBsb1TiOSI849w7EF4iYfFs2VtbVLzggb9NqJRfPiysp1NJQ5BSMpqW2PT6l2BgUU3IP9tFQ0UrsojUem2xRfrBajGU8E78OxX7/TX9Ted/5C0OJZdlY+BZgUexEqdrrYQT1TstEz8pElgRR8ZQ70qbjPi8Go1yKwZac2z4mKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787552927; c=relaxed/simple;
	bh=8GFf03q967qSeVY9Ye3J1CKCJe5w1/9EsT6PvH1QMSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CyIg+Mw1Arfr59BABK3mO2Lr4tUKZYdH1htk9TS7hMkOQDAioAHyDmLyxauXxC7TnvhFiaRPttWLMvRNM/743aF14OEZ4a4asxMaKIyMjyvuHrczwCopKTg197fwJ4yIu96C917yLjtHpgsZRZ1ki8YrujDkYJBTyO4EWjUPJrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NcPSZ0W5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DrZRJgAj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NcPSZ0W5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DrZRJgAj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5R8ra2058144
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:28:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oSNCJOEbT50z9DncV9kJciWruMg5kFIYyhF37TsAucg=; b=NcPSZ0W5lccUQbA1
	4FXUESBtfrobOJgOgJCkbVg8ck5hjnIQh41YBId0NgMK0z80mVAXXamr25Xjlwhs
	MFpPayg5UO2ABhR8LggqOOYwceokp4d62omOGIzybVHYwU8e5By4rjOoyRtTd1En
	RSwT1k9j/dtVYMdk+DnzPTC2a9AMSjr0VUPQgoXrZ6x3gdqk6M4CkXo6huA1fLpt
	uAQOhJw8tOU5QniKJWRkogo2Y6aGnwnlaxrM7v4xUXk84xI8zQwNqCV06KN2Zt3Y
	xL1PhXyk+HCreNFEC9HzRnp5hcvBNKXqjdsivgmholc/psUPxyVKBKDllWFjGbEu
	sYilGA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8bdr0vjh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:28:44 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-738be9df36fso84628137.1
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 23:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787552923; x=1788157723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oSNCJOEbT50z9DncV9kJciWruMg5kFIYyhF37TsAucg=;
        b=DrZRJgAjhx0CBCGpo7fCSdBZ01hs68QpukPyCY0gsVW0fW5I1m1Ch6NcHa9RAg2jEi
         5LP2OpsMKMSfklUF1tNFePAqd25UMCoYxVwuplfsH82JPiLhxZ3S59mqeBbed9+bMjx3
         NOhKw5ruwk5UvYEW0ZlfS8fM20VDo1G0KsCIbLCcvK2mDN4b9sGJhre4GkLJyuUrOAx5
         hSuMm65dplv0V+5w4slV6XfcKEHvxdVtzlbnb8jKExyWpgV6MCnh5wPju4qVAFMhdeJt
         ZUvo24WbRLBTRC3FaNgYrK/HT6GCPL4SN/eyYZXiL3h1uyCFbxZvnAPy+Ikm114gJGjc
         2dYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787552923; x=1788157723;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oSNCJOEbT50z9DncV9kJciWruMg5kFIYyhF37TsAucg=;
        b=PdR9ql7dH0q6Qq8umvK2ZxBghI7qY7o5MlqF+6SE8ivadpPYEKpzf1eeXhMAabMEMX
         mEVg5VNiuM8f1GGcoMv1P7WLbbkm+p22OkHhZZeaTAm+Ov3Gw4VScdyBJCdToU7yb2cr
         zK6KnGFrQc89jigColS/9aFKi4jHX4/8a9XlD0ju0xjl/tZtKau/zvXiqvomKGcG62L8
         DyJY28Z8d6Rn+WLd/AKujW8sWmyZD/0GtZnzKQH1EqlztdxPlAkZ8nvJSMM4rV3IVMsk
         YE0vR4tKTfv7zhFZ7sujuismv7rweZkze3z/hcyvEegnPaN3/fSqfxaVxFyQpQO37o46
         Ofcg==
X-Forwarded-Encrypted: i=1; AHgh+RobI3HO8l4LnxucWYrqopCaE27M4Kz3JhqWeGAafifn2mFLNY7kFQljP+xxvMS4cdgnVuDcEPcCXq0q@vger.kernel.org
X-Gm-Message-State: AFuF++nc62OmrhnpngQrA8uofKzILdlMvUHi/ygcrjbc5wMbUroCKVQJ
	HKhGpiZzvjSPFFfagNDlOy71B6nadtJOWQvHHhHu8vjf+Xe375jt6RWlATsErsXZpcsGyGaKu4X
	Xhrt1qGkJFTytxmU+u4ixlC0YfrrYUOQiE2bBjZEMAM58nVIfUIktPAGyewLmLIhV
X-Gm-Gg: AR+sD12FPs6Wvv4BAa/BY1Mr/pmI57vOeOKHTEpASAVYMNpoTwMZ+TLYKsgubZlQKDJ
	rJuS2alLS2DG49EiDYzCzDYVZrYXwlMTMQlDwmm1kb9EN3ugzl7ZaL6ue/sb+7ZSvdBGeliGyaZ
	VPaL1qLl+OgVG1iBQ1U/W65DLyYuVDCepXWveIWLx2xUnX1c5Kp4sw/oKPAA1Wt6JnyapkaD97n
	rWs8TtrFR1KDgp7391eNHSFiKJc/hIzLTx+Py6LaoonQPbkOQ8BRPbR/pP0oemCjFUwzKPAi/XF
	arahJo3QJtG72rkTYolyhQiX3cnUrr/p2wHn39SkSJLhVvJ8sd3HdZpMq61FSyi51egUW4okKY9
	fzv4g9oxLEjtqSvqu1Algd8py
X-Received: by 2002:a05:6102:2d0e:b0:779:9a7d:d826 with SMTP id ada2fe7eead31-77a642323ffmr3466748137.2.1787552923523;
        Sun, 23 Aug 2026 23:28:43 -0700 (PDT)
X-Received: by 2002:a05:6102:2d0e:b0:779:9a7d:d826 with SMTP id ada2fe7eead31-77a642323ffmr3466737137.2.1787552923148;
        Sun, 23 Aug 2026 23:28:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e001305sm7265461a12.4.2026.08.23.23.28.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 23:28:42 -0700 (PDT)
Message-ID: <b7e9d655-2196-4419-bbbe-d1dde7177784@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 08:28:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: msm8917-xiaomi-riva: Add GPIO
 haptic vibrator
To: Reza Kurniawan <imkyufie@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260820110347.98068-1-imkyufie@gmail.com>
 <20260820110347.98068-3-imkyufie@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820110347.98068-3-imkyufie@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NSBTYWx0ZWRfXzxHqqWMB0WF2
 Qo4mDpRlCpVm2nlJWEXilJt+ei/68HuvWd6GsavQ6qfrPGdxTojZnwBIbmv5h0LwDPl1JlJMh4G
 KEAliD2tXX0pqLGmvsdNZ7g2Rc4sPMKrQ5Kv8UNXzfW6vduCyCtIQLXTgvOoN16Pud11nqfB5AO
 QFTvuvuxBTH1DSIUhzA2poYdef44fk9Rm8HoJn51h/HqHvFACLEJkNHej1E6U07vV3XlEjn4+6B
 58hS0H7+EMyF5B9bUgZ8juvajXcMknZbZfi9E8ljuItYxMgcP50sTGa0LMOXKE1JXYjmw/M71zy
 AxmCQZrjOtu/CF5EgMwHOYBv/moDE+me2U/6FeXQ2WKOTh4n/DUYP7Fwqi5DUxIwGrE6qA7zhsB
 wjkenZCp/gKbsUOlFtVgIQ2xNXRjDgQN3S9d/E7bCiz+23pQ7KuIh1eVVmLCFs0gcGmnlSrYuqk
 3WmUbwMDDf0K95ztSfw==
X-Proofpoint-GUID: sTEGmakrxZdMHNG8OzpmmDeROuqlIqkZ
X-Proofpoint-ORIG-GUID: sTEGmakrxZdMHNG8OzpmmDeROuqlIqkZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NSBTYWx0ZWRfX/D0wPP0FNYHt
 FUX6CpmaDQQ3xI8ZOKvi8DXZ5pmugdptrtP3aQoizXB7TreWE2P4IZM0Y5pTeTFrNJPnnEElz2R
 P4oUMiQ5uL5BXa8KjS62HLPGJZryzPQ=
X-Authority-Analysis: v=2.4 cv=W8cIkxWk c=1 sm=1 tr=0 ts=6a8be49c cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=UzYu9Azp5mvgxvfo-noA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240055

On 8/20/26 1:03 PM, Reza Kurniawan wrote:
> The haptic vibrator in Xiaomi Redmi 5A is controlled through TLMM GPIO
> 97 and is directly powered vph_pwr.
> 
> Define the vibrator node using the "gpio-vibrator" driver.
> 
> Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
