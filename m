Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421607;
	b=hyE/aRDj9pHtVs8cQfZ6uKVk/brzO2uqEoJEUJ05CJC4+I2UlSKM2ZKB6zr6iSdYMdul
	 k5AyoJzTDEzP70ts7OE4g4rtLcdWfjcMJ0GghtHIlivSBEmU13NMiTVM9KODUu3vL6buE
	 VtzlvBEOW7siO6JKmnZK4G4l8O+flRjEYSihNX7i0auaYFl0Hoct12PMSeWrgg3GbaXLS
	 pDt9SPh9nFz5YZ8GGEfParYFU6D4W6V+8ak3sCBDeUHjtjPq16vsCV7hLOHdKFjtT8hNM
	 vatU+upKvCqAlN1CmKDBaSKK2WEf31lZqkNEj89h2RaBMf+u2B920PZ4OhkDHzAru9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421607;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=j+p9fBwAnabUV3i4xKq7EVOzYjB0p0hPp6wh9smUiZQ=;
	b=F/wXC+YM7fMadGr0EIDzIhfXtjJNJ8QI6s87YNKDT1DjpUhWLVcO+OBbcO2Q7meudv/g
	 vWksAcHslVeTA5f266svLHaskV9AOhCzCQvjhIopWlrOzQX+2jyVdkAgW+7e0qnmyspcV
	 mVbFIscRH+/rABP4wkZyAkGKpDdRDsXesis/QnNx/ZX7+amE178Cl9i4EwzUhtYOhODvM
	 yKMyS+DB2oEqYWL6f9xyoZQnfDByBwfAQadzoaj7OftdUZJCesP+1Bdx3wIXOU9RF/dg/
	 mzBdf/P4rwGTHg09YC38JUoP1bpyGgJ6HxoOMD/2/BfsNZiCwE/uN6PRcdR4wYGYEvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KLH+1rr4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fK5FitJr;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61EFB606AAFB
	for <devicetree.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KLH+1rr4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fK5FitJr
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29F94C8481
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421607; cv=none; b=C5AX4vehsv2e5AnwOsZI5u3DFk8DirbCRmzVR1a0LI+WxKqV2GNr9R04iGlPVjTz48ehHq28iU/oF4qTTqaOc90JPcQtw2mg25e9kO/0ft0xk5j+YGBXluYFw4C4adfls2jnrDLkWrZUxfRxYwa0ysaGEHmacb1sE98IUTw1A9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421607; c=relaxed/simple;
	bh=G/kjWIzcC3oPmLS9q/TvtvOucNt1bc2bS8JpSzIl0VM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G0Egh+0kh7Ja+II6brIzKkoYMnAKHdod/IftlZHVrsH0+zn15ah8dPTAfmVmzTWPQavDYuzsG/WQwopu5doj8YAv+RUCBIGXy+KCxRuT5uKso+zCRnC/MdurUBJmNUqKJIgVhgBD48lXaUbBLU0iYc1tHt9cjcdV8/Or+rloa0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KLH+1rr4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fK5FitJr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0LV03401414
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j+p9fBwAnabUV3i4xKq7EVOzYjB0p0hPp6wh9smUiZQ=; b=KLH+1rr4147Ms2AB
	6RqJrPWDDnYZaWNnrObaXTkZWdce6WgGf6dwdf6RZJtvMRpbVtBALjuHhqez/t/L
	v8+NZMdpck17lxe7YVHLcTUw+Mkbt7C9y81Sk0iD+f0W2Gmh3r8Jshw76A8WF1FB
	Kn47TPuRTlogof/oaPOCXBa/emBdA+DOFFgbmozdUmg2dP4AeBNrIZNsJWfvdqik
	/wt9Mn8ITAibwrQ4B6NrUG24PbXqX8OrDeMABHn39MEK4IN7XztTXoeu611n2uPj
	me2URMHEocYcKfGrpgsczO8CYyA14KL+GIQH0P3warigUQpDt6zrCc+jeFzhDGxA
	XUE8ZQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdftn1hjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:53:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e629c7b16so39056885a.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421604; x=1793026404; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j+p9fBwAnabUV3i4xKq7EVOzYjB0p0hPp6wh9smUiZQ=;
        b=fK5FitJr8MRY8YX1lZ/LDMRb1kP7hWJ7g5WV58vkZk5HiGA6mZUaDUOT3MXJD/xVv5
         i5TkmQOirL9PnpxiuBgA4h2sA5qINyKWUHoWoi3RtzpIYhHWNTjsO5kc3wpcE/pAZFCz
         cJ4npod7S5kYGwFkPZCKg1r4KkQbG4mZBE8eahMqDrN8rUuW4rDz6XV3U1IMkBoKgBgq
         PDLgyZGoe1078C4kb5FeVQunGXEvwSLCtXj1PIyasuP5MjGRpWxa9yCdlBzNA+miETs3
         yRDVMzKeI7fgOEQV5DFvGeCQiUo9eHOLvx/0Oa6PmBE3BrzdHTWBEmFmPElcIKalV8CK
         oR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421604; x=1793026404;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j+p9fBwAnabUV3i4xKq7EVOzYjB0p0hPp6wh9smUiZQ=;
        b=R6OyF+IktXTe0s8Q0SMtuHFeV7J7hA5R8hAkH1WeZjnSKqpOK8vDgSSQjz/LSiAvcU
         cEiPgE0HQSR1dH42C/BGCZDJAvSHm2p73gRdim9cKuNcdb6V67KcsnaZUH7s9eYdtB/t
         muoNTxZq8XF717vPwy+Fu4Pyj2zfW5bZxaw8TAxO3Rv1IePMw1E8jE0MErgteeDmaRah
         pxrJJH76ysEhP39V84lMdQIKLgAcGaBDeZp8nzbGwMeAZeYnQzeDpODxqWsSb7T60GEV
         n0z3fuIJ/m9hrz7W9NCq3ZPiesdFhB2a5QTrgWMC0sB+ADEGYWHfvzZtmrM3YVvbnHI6
         qNyQ==
X-Forwarded-Encrypted: i=1; AKwUvByfhU6KHbegpImqAMMCcpj1PDbY8wyx69PL7jRuVZxbQzmfWe3UOR8WU9p0HZyDc8pUTE7wwqLBifqY@vger.kernel.org
X-Gm-Message-State: AFq9FYKV2dKGh3/7rhRrqqeogZHL1SkJnL5xtZjOaO0hOGFjaiEGQoI5
	5t6HN08eRgC1npVb3u6piRm1+eitsHOzpNLgdFQuA8PeCjhJll1F+bxcV/nf/KGhB/4L+h4clmc
	e2Sy5yQRJNcKuuZ0HppdTXL57QCJyaDoNm14HCGXb0OBcG247YY0pvLyXVvd5MTOy
X-Gm-Gg: AYBFou2WSsB2Tk1Mg4wf3ipqZkKdxfZsZfDJ0d984+s01lUs+nDZ0NPEgCEJ6fNM33Q
	+Y/zJaTWlnlVCH0y+SLiecsnnQorMlndsvi300+1vAngwQLXFR1erpO4b8BRcTXdCqVYpetJTV2
	C+sKkOi911ww859zMTb7bvuA4OAaEbd3/4HZEJjGwUTSDwC5xuWAINqLxZ8WVxb2apC0jkfJS/H
	VpwooGJPO3ylr/AS4D1WtyH92/DeulCa1JQ/KHRCefJ/Q8aCEMxfngulfvmWyXvlvJTtixjLjjC
	U+XzsbKdvvmpRdTMVpDDwK5i1JsWUHA/XIyuWk8fv48JEKTUDaLDbdHA+XawKaDqr0SXPgq2TCz
	KUlliqycj5677hBWW9gONRg==
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1426527785a.0.1792421604028;
        Mon, 19 Oct 2026 07:53:24 -0700 (PDT)
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1426519485a.0.1792421603076;
        Mon, 19 Oct 2026 07:53:23 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb2f64sm365653366b.77.2026.10.19.07.53.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:53:22 -0700 (PDT)
Message-ID: <11592f75-bf83-43eb-ad51-ab3aa77df0a6@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:53:20 +0200
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
Subject: Re: [PATCH v4 09/12] arm64: dts: qcom: pmh0101: Enable BCL sensor
 node
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-9-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-9-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX9hxPecBGLxpO
 AO3WDxpsZuFvjo/h8hXGRE1ZGYxH5QgI1oAHD7eYGWtjzSlzSBODpEwlo6loLEit2A9eV0quvNi
 VVt8a10fnERasoRQfGXqW3zpZwhtd3I=
X-Proofpoint-GUID: p6moNlUtQZEVzemf3IG8YEn4vnmf3jU5
X-Proofpoint-ORIG-GUID: p6moNlUtQZEVzemf3IG8YEn4vnmf3jU5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX4a/90TdI2XWJ
 i7OwOZaA004H7ujfRRTN/pFy/dHDE/860Lvv/HjWHg8yOaR2t8EH3IkDKoBnYdqsgW8k/4/8BHK
 LulyvqNV+Aw6SkdUdaXbAh4mYv1czwNht2mtOwQ6tdP7hs5G0a/CX5EBATG9V/YpOKg2Ko6FtWW
 7musRyFHTtIkEtcQG8Ueh4Kj5B29IjAQ5lYo0KbLZvs9yHkPkjzKh2VGJyKdqHdznn2XYao7yZw
 V7gdSLacA5iCl3Eedw/SPb6F/ZBev42IZMd9JwkxJ4vtyWMIK2O/i5mJkWkvsJ3MHdN19+wQUQD
 L9LWrXKRcTgUYSnqW2Xg8F6NL3mI8R6qkrxBwdWRDgOVpDN4b1HTtS9eo3OSPi0Ze0o3oReSbO7
 4Uh6yNAFK8Lc3BMaYlU8qzWOvlXsDyTAWWNUvqEFJ/IB5p2fSis0IwCPd9mImJGPF+6ZTTNNs21
 47QQrUvL4SoBE6Co/iw==
X-Authority-Analysis: v=2.4 cv=OvTaWC/t c=1 sm=1 tr=0 ts=6ad62ee4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=zUvQE7La0P2yE5F2ZKYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pmh0101
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
