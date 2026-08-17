Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A8541D131
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 12:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786970643; cv=none; b=XBa2iUeTRyuXQ0RicHLrvD+AS6cwUlBX7NDwXazEBmHNb7akYgoOIwkEsuCIyY3jEN7A2Vz/Zncoap4qxeGI+ZLfAkujYQxRDLCnF6YrX5FPKPumeC2rKKLzz2d0SaQVfS91uRuGR2ftmghOiDnKDp8rX90i91fkT2IhbNHShhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786970643; c=relaxed/simple;
	bh=EoDEFKf5hHzd4mY7d2njT5TPE7Yd8CeAwMOX58VdXjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o0nVzBI+/oG8UQepn+a8QgzYoCcY4h9z6uiCY2a8mV9STh+gq3ypGGegnKMKjXfKtodNZvVWraUURyUgTzLQWizDHBRx9GKeHat5qPPmJceXhZDbZ4yTysgkkb355RY8FczdeGORrTijHqo9PjaSc+giFEQWTPW3b6g3qXgNsQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U2beAW9m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XOOufO1u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U2beAW9m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XOOufO1u"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HC9tW41805269
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 12:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nmFWC+9J3QhTEr1+neKtaQTEHuzXAtpwYIpSWjjqJzc=; b=U2beAW9mDNw0i1CB
	hCdwsS6rPblRJ9oq4i64teS1l94O6etBTyUh9Mccg9xrEI3edPLb4XNNq7PzmOcD
	SgMcVQItZR8UTf6LTe/NWl2AmpTOckkhy804394YM/7cZUNFGwkfmwhfj7Gqr6si
	fGwH4PtTGSq83l2xT65dHYZVz2oQ5rl0kOZ/SQxdjNdFW3r8vx3wfZAq98Umavd7
	e44dZsx/3Y+Ghi85ju1Iigpda8YFb7rvJZ9XFrbLJIgmaeZJir7EdvvftnLxVAER
	wZszJ5G36K3c+dWy9+Zu36Lio4xL9VH5xwn5repgQKbyIWZvEr7BDIPT7491DHeN
	QRC16A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xx7gvx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 12:43:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90a80332521so8158126d6.0
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 05:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786970639; x=1787575439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nmFWC+9J3QhTEr1+neKtaQTEHuzXAtpwYIpSWjjqJzc=;
        b=XOOufO1uU1qR3VXrUzRQ0GfP9wD+uLP99X4U8fYsrcvVI1ZWavzS3eMIDnCzuNz4e2
         j1hqcTVv5BK6X5XoAyFWT3IlVA+d2AHEOOKUflucXJhwe4CMJovtsxS5HJqi3fZTAc9+
         Q4mr4qSQ88NVo/2ArO9GvyBw40PY1CbaTPvSqCkr87p+iskEmGA8xQcTKyJ36hq2AYNZ
         U0LPEXWK69nGD7xelb9zi6OZZCci2r8kKI2/yjvz7I4ce9IPTA833AsHOP/q/ueU9/rq
         eWPXl48D077/epEM0Rn+VkEYU1assHpbbl6GF1DmH9SOtKmY0PYVWAXkT09Th1yFoAXc
         d7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786970639; x=1787575439;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nmFWC+9J3QhTEr1+neKtaQTEHuzXAtpwYIpSWjjqJzc=;
        b=bLTEw+elS2ObQ1eKW2n8sccBfs2pOXqg2UcUJQfWdBFOuV3WIGWBwfKJpZS8JXb6/e
         gEO4IIsPVz4wP1MzYYaNdNVjpRqP2up+ASbPQ5uKbeCp+opT69ts7RLN0P+4yuCqvmtI
         iJpiNN0IduBcQPQpRaR9j1qOPpu2vnHM0xBhf9JphhKX+IvNgtrs8f2NA/D4lsMF+E/J
         Bs2E6JVIjRtjisOA8OP65M/CcopK+bXtJ5oSxju24f28IFmJ+lVfqaPfPPpSeRXghImW
         J3cDYx18XXgqOyTC9UV3wMRDu46sJ+8LI5/DSB8cywKl0+Qef/d7jIEQd43d91OJnBIw
         Fujw==
X-Forwarded-Encrypted: i=1; AHgh+Rpp9VpxYx9yOLU6zy3a/4lj0HmhxVm2tW2YFS4V9itGObAMmGy4KE0PuN5R+SKrU9U0TTLndAeVdAMX@vger.kernel.org
X-Gm-Message-State: AOJu0YyGdFVFFXw6X3NLIx+Mvg4UjBYJXkKxFw03HtZkGSn8rqVuyjbZ
	EctUO8mZSWlBri/rWgbaYenJUhdm81pMLzGQLvy2ZLaPTeX+QIu6XqRnSGj7Owj34rzrymdeSwa
	iuh/PASzp5mQpE/7nn/6qi+YctkUk6PfR2zf7QTsZlo9ijvNOdqKrc/5Nv/NXmpkb
X-Gm-Gg: AR+sD13KbY1tp/uchRywM7pvjUwPQFOaQMDoWhuGzd7W1qDxeV0V1CCvEbnHfJEogle
	85fAFk0fRXSo9wSqjdDOh4mUxLiO80X0+yhdo96zSLq/V8BkR46q+KW2+oSjdrWwr3rWTK6bpV0
	OXu89OXcFKrG3+6C99EWDoXe+IOJ+DMnbNYX3uYtqRNWCcgiRx/JXqv8CPtIFcu+5EfNuPT3KBb
	KIzeL3KtzF8+07gXQh57JhRG2Mk1WZtLjV4GHe/nRjd5bFUA9mtg0THnFjVhOOVHxMC/bX7jNq+
	xfRs2370ICckuLlJEBc1gBEpcN1BE16/a3v7etUtIQkINwEd7HdJiRahWkNQYUTAdldr3/JG/Wm
	k5nkQA+z4rptNt/NP0DjLeqcZ
X-Received: by 2002:a05:622a:1a86:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52d9db28d13mr101709221cf.1.1786970638800;
        Mon, 17 Aug 2026 05:43:58 -0700 (PDT)
X-Received: by 2002:a05:622a:1a86:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52d9db28d13mr101708911cf.1.1786970638349;
        Mon, 17 Aug 2026 05:43:58 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cfa87f8sm384996e87.33.2026.08.17.05.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 05:43:57 -0700 (PDT)
Message-ID: <56234c79-389f-40e5-9d41-d487524a9356@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 14:43:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5018: Add pinctrl for MDIO bus
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260811-qcom_ipq5018_mdio_pinctrl-v1-1-14ae9dc62a3f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260811-qcom_ipq5018_mdio_pinctrl-v1-1-14ae9dc62a3f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA5NyBTYWx0ZWRfX5FhZGiE+LwNG
 Z1ibio3i+9pEiVn2Al61OVV//vocfg/kiXbj4Vn9GYt+im1Y5kkeZz3sn6PbPMp01sG657EQWDh
 YKB6/w7JLScVnJh3YmeWeMRC9+U4J4Y=
X-Authority-Analysis: v=2.4 cv=TK91jVla c=1 sm=1 tr=0 ts=6a83020f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=4FRrygT47P656_Zvv6IA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: RladApDctGHitkYxp809-sv7KLQ2jNIN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA5NyBTYWx0ZWRfXx9uDz5NAzm8N
 vtTjiJGycx5wp8QC2QDTyIL9gPVsvwFzZbGBhR+cavsEa1Rj5xYJhOr+6Z95Mw97NHDbKFZ1Vq5
 MwJCGIfUgrzw/sBh6J2fHM8a9s1XSDaY1qShI1UGV9hOjBlB0OCvsrJDwXxBxe9sZYciBvuK8l0
 83X5xr4oZj6eIo142DwEnL+2sI+uBQUqNRyrQMm+cNyBcF/LT1nd+LJ7dDK3MJjlJyP0JF3ifI5
 pDOc7k+66spzB98AqwSLBJZoG9OAcT0qGzQqhXJkfjwHjChDLVLqZ+Wt5Us+PI5WCODLmwcJ20Q
 2JGgDVgUvfzIu+KVFST9BDag+3v5vXB/uC9JFj28m9OS515waTJnHe1WbwtN2ia8CzW3sA4YwCz
 L908Cbo9xq5MOBE95ub4wkZSsIoA8DVDycj43IX7LmTj1QkgXemlvIHf2jk3cO1GBMHG3aUb5Ns
 BaGh198X7kFet+8OWUw==
X-Proofpoint-ORIG-GUID: RladApDctGHitkYxp809-sv7KLQ2jNIN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170097

On 8/11/26 3:36 PM, Luo Jie wrote:
> The external MDIO bus (mdio1) needs its MDC/MDIO lines configured via
> TLMM pinctrl; without this the pins are left in their default state and
> the bus does not function on boards that enable it.
> 
> Add a mdio_pins pinctrl state for gpio36 (mdc) and gpio37 (mdio) with
> 8mA drive strength and pull-up, and reference it from the mdio1 node
> via pinctrl-0/pinctrl-names.

This paragraph is a bit heavy on repeating the diff contents (could be
just "Add the missing states and reference them." instead), but overall
this looks good

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
