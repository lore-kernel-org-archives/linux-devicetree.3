Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54C52206A7
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 18:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780555; cv=none; b=Wn0sh3Q5HlI8x5KAe81YP18aV4b9iTzc4VTsoMqkP693uC5ahCY/H1L+nJWbR7oXSSHd2opA3Rx9KXBqRjx45iFtdruArX9/Gl1s79EwrCk8Q8z40vgRPtNiFb2l4g2dwu2qgFNR9uarjxzg7UcGeZ0kDoEGYR5+4zDBhGssREQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780555; c=relaxed/simple;
	bh=pEcF4/ScY9yepDUk6ra3ssH1iheAlSjyXcFH23m7zkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ukg/58Wmh8kgOc1SJzdPgdgfsG88eMOVg5R+GxXLo8Yenl/TgEy2VOifyyqKOilTeXOQutoSKtwC8bFFyVjShRE3ZS1XZBPgNteaR5PzmJ23i1eTOT7ej1rImIkhLWwkG+r/rQD0LdHWzsB3y8nY5cpsJau/TmZzjSQtrHeWjoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kV9T8WKF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PBowEvWI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kV9T8WKF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PBowEvWI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673GwNnx1224792
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 18:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pEcF4/ScY9yepDUk6ra3ssH1iheAlSjyXcFH23m7zkc=; b=kV9T8WKFGUR7GR7t
	BmoPKkpKLwPEM2BmAgc8G0u9ZAukWMNlUN8hUV/pWggiJwiKX/8cWzhRhNtYjCMd
	f4ppDmo8EZ9fJZeqhK06ZKIOwp3Qg8JFceOgY80JqpvszXDnMKJpXZlIbW09ReAm
	44sC262fAc4jjbX/mFjLnmBXTwH+g3lWAf29bobSQXIBcA3mxJur72jMWzyrmnOu
	Z/78F4rFGkEMau/01olZU7YqWvzKV2JRE9IbmNQC2Oh7BjRPISx3niNZEzpdpIBx
	W9dd81i8tuQJ1pRHuLhQMRnYIEV4cQHv9+aS0Np5+f1fn3k5T5UhR8T1mYBLgvvQ
	LuhhLw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnvnjy2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 18:09:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so2591785a12.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 11:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785780551; x=1786385351; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pEcF4/ScY9yepDUk6ra3ssH1iheAlSjyXcFH23m7zkc=;
        b=PBowEvWIuC/j2Gy9cJXDC5CyvYi6bLnnwbC2uivPynbcO2dCzEd1vLEcy+RFfgcjfe
         MvVFo2tuZKxAGpw7A6tnofv5mz1iL/Pc+OEBkxlbSrxI60ftRG2wb4iaqT0tpXImMr7j
         IFyGkB3DleL4JRToG0sTOfA5hSXzOhpTrS1hJcboipdDTxvcrfp9jVXZpXKPU61Dyz7X
         2Ht5mROYJbst+BQHgNbwurD6NOItinpd7hBruFbP/13A2VvBtWWKcCZsL6qPOiMvHOG9
         16Czr+CvHjyZ6gX1Qf5gSrGOgJ61L/AVppdNkJLj9s2A8s2iPLezqTlEXKBkrSyr7YNm
         HMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785780551; x=1786385351;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pEcF4/ScY9yepDUk6ra3ssH1iheAlSjyXcFH23m7zkc=;
        b=oPcEACocZxqTYee1fFh5t5KgkCMccVfwQ0sndQf/AsggebaeVyUfxQ2KD0jaAw/DA/
         MGzjeJrOBdB9BYWidswWgsJKZgrDnfrFH8u7MmScYTLD3XtfcPh9VHWafUnGMpPQbTDn
         Ybk3F+vrQ0BZdXEpQ0FPmajos+VXOwPQO9EnFx6BohPGigNz8BZjL7ySD0sEm+5StHcs
         PAJaqUS0pumonYCb/mNvuww6tzl4ccP/dobTjSElxdDolWnFm7fYrLU1vuobZBKr4e+B
         I3i62JeCj2c84ytZteY46hz/6lsFd5Fb85mtw86EwvIfONpZQpmmXiJb2qJzrLNay23J
         tyCw==
X-Forwarded-Encrypted: i=1; AHgh+RoNg3qfljuVbICURy78BZMl5HjNCnbj9gwBhbS7v2zMxMFUDOSpY7KyGIgBq/WslcJi3+Oz5oLRWgo3@vger.kernel.org
X-Gm-Message-State: AOJu0YwUMBrgwxdvpaQBvsC6OMbwVndw+U1KJpcyfdg27QPZHcd16k/L
	D5tzK6yegmCRKgHStk0Gv9e4c2QbbqkO2UTJMoy+AO4IW9IL6AwLBD+uUxSyT24SEri870SSLEb
	ktPNA5FYGwQ90grdVtHmp7mDmf+eFAupqLTDVsi0Hmk0YEv4BjvXNkys8tFYgsUpf
X-Gm-Gg: AR+sD12FP8bcnXbAfU2z3A5a1Ji2OnY8RsVF7QEycPkaav8eNhpDN3K4DlC7aIzuwmN
	lH1nU4RkaV9xPnx2WNKEavGpDFIf9E+HZqrdO5KH4+/++JhelcJ3tWBvf8CZvBOOf3DhSev+uxJ
	uSF0FvzPLHefvX330RTKFnLFjCqOQdpIJNao+FvI124pSOlA7eISJkgLOdvSCGh4rYYOFs1B+j8
	MNcia4fUvXmAXJH1j/HrvSiFE9QQ77H1WUhBp7Jjq2UXbJKXgxC5WjMDqPlaLw+tL1ysbg0iKmY
	sD3MdKUqQGa8TM1ulwlsWk+CtEBLOKz0HGHaRfAa7wRQ5vdfh8JHOCrvC56Z80rmVOUJqpjh9tM
	7Rf1v7T9J+fA0SG2GXiJQaHnN9huEOVLMQA8=
X-Received: by 2002:a05:6a20:6a10:b0:3c6:3c5b:f2e3 with SMTP id adf61e73a8af0-3c92a62d94cmr11790944637.33.1785780551600;
        Mon, 03 Aug 2026 11:09:11 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a10:b0:3c6:3c5b:f2e3 with SMTP id adf61e73a8af0-3c92a62d94cmr11790921637.33.1785780551213;
        Mon, 03 Aug 2026 11:09:11 -0700 (PDT)
Received: from [192.168.0.100] ([49.204.17.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e114sm65919018eec.28.2026.08.03.11.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 11:09:10 -0700 (PDT)
Message-ID: <bb8dd840-cf24-441b-b096-91cadf7b62a1@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 23:39:05 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] ASoC: qcom: add AudioReach TDM backend support
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260801054610.4047089-1-prasad.kumpatla@oss.qualcomm.com>
 <47bce201-5086-4f70-9e4f-e5c50059e487@sirena.org.uk>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <47bce201-5086-4f70-9e4f-e5c50059e487@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aoaCzyZV c=1 sm=1 tr=0 ts=6a70d948 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=/JTPBhwEQko7YaD0RKblyA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=O_9MOtM5Qdc4zGp9YqwA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: vpaoJJR78nYAVllMwH3d8j3PDpnyAHPm
X-Proofpoint-ORIG-GUID: vpaoJJR78nYAVllMwH3d8j3PDpnyAHPm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE2MSBTYWx0ZWRfX00vFEBrbWrd8
 Jr8dwaN91nYzXRu9uUkO1so4rIJ7xYnlSC3yNViMkpHBEY7An0UFp/I93eLJtwAPshmjbAjm78p
 8KRYXLBs2bEvVr9flfEuw+4/irxdw7YOY98r8JJNI/RZBcoUbMeU5eOqboTf+rHPlpgW089d+nS
 TFV60f1miL61/1PG3K8h7UO5K9aAsg9QVf/Xdc2D/7bglJ3kDZbLmT3hfA8VzIdiPpBa5UcTeuZ
 GzoDbHbp3iTjEs4PpHIQnKFETxsN/5ty8jebDJFTPbP13cJFN3mZuY/Ntgvepzp0c1HNMK7nc8h
 de7xsXW5V91aJdYGDYbMsDdSTRTBlO/hYVjC6IvEJDsfdHYnEUMJcJn9KzJ98sGGwM/B11KQwb5
 EIn/EB1xRNTZn8KsicCBi9odONVHvp8KlWPf2wgm7XSvg0kCRfbdjsjeY1d/DHHDZDnoAKCw5GI
 MuZq5xdhLWGU1JREivA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE2MSBTYWx0ZWRfX3t3/a+WssikF
 BbNjzSa6Kk8+b2VOE9B+2G182Pl2Xga5M6mvGkIrFp00K98DpqrD2gt1ChR3dQFNdVj/86O8gM0
 YMvY/sA6M1BAdolrNifumkspNzJA5Ok=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030161


On 8/3/2026 6:37 PM, Mark Brown wrote:
> On Sat, Aug 01, 2026 at 11:16:03AM +0530, Prasad Kumpatla wrote:
>> Add AudioReach support for LPASS Audio IF based TDM backends and wire it
>> up for the sc8280xp machine driver.
> This doesn't apply against current code, please check and resend.
Hi Mark,

Ack, Sure will check and update.

Thanks,
Prasad
