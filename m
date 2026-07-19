Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91FB28688C
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 02:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784427061; cv=none; b=GXaRA3N2rGgRCpBQ/E4ht68evd1z/oF0XufY1Kn5dhQhtazou90UNuUnmqwGnrZbZ1SDoDoNy6gi2ofXful0GYNYe0QMQaBa96kQ2t3kJrRKxvLj3QEaaNFoWbyHLtzQ2zphwB4DjbejyypNWBSPebJV54MyL+N6R2BxgsmQHvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784427061; c=relaxed/simple;
	bh=R6/eBx0dOExr5javRdf2etaJDNgbRZVlAciWScYcY5U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aRdOfKmsoTm65sDF4v+MQE5szzimrPSfUL4LM3P/9cGpSL4jGeIZ1/FJEMHY7kNHVmCdBcK86vLmjoJrX7kqX2JSXfGoex5iVmptT9t6c+HPhguSHR7N4jJnLaODvlsobbxB8jonncmdeXKy4CGLMYlztFMyBQGdDpVDC9uwJYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WxnocBu1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZncXMs+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WxnocBu1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IZncXMs+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66J232EY2311649
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 02:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/nji6/9dRFy5m349usk56mPECY63Tbm+yUPmWxeKoJ4=; b=WxnocBu1lJ30V/DM
	J1JEwupYUox5MGNYUofBjb7Xa+s28TFdBk42yd6RVxYEyRSGasE3tmwQs/WgnlvP
	0nz/+Ad7ayx9xxgK/IwMIi+3FPtJdGD5RkBq95SFCM07qZni4ip87dA5YYlkqkzY
	TRkqYqHl3gWLLN9aYGiR8iLTRiDuBFDDx6ICV5fDHMpr01NjAdR0T9AiQ+txwF17
	oHHL8FmyC/Wufp79KZAzxb7DkBtV9Z+n/X05dNfMp7hjtuAOhaoag6vKJGcBbORY
	WOe5Gx/wWYZ40xamKPX+v5fCJYy+K7ODJ+wW0LzhgLWmSxHBJ0nf6DevCCcX6pFe
	PtwaaA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fgd04rvh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 02:10:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbf293831so13535376a91.3
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 19:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784427057; x=1785031857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/nji6/9dRFy5m349usk56mPECY63Tbm+yUPmWxeKoJ4=;
        b=IZncXMs+XhaHb1n04/CFGsapePIvZNDs1J9ITyjoVQmqs2C/TdayRDBypVmqV5MNrj
         c4l5qshVXrO0ZbtJuLY6hiuxa9GsqXGErQIUyg9PvNADKQExg/5hiSjgwvPHD9BPNs4G
         XOCem0nm/gZzjdCz4h/EOGEDqb0FOJXpiPXgtobBNOMdZPPYWTjJQIIV95GL5C7zehv4
         G4u+gQ/aBOOo6/sS2ar/ifpuktiOBZh48xpLCCOnjLAE54+NaUpvp6rLzgBCJc01i8sy
         J1xomFjbQkvlu0WQeZ5qbiXAie05AnsjbE6irP57OjtDEYr4HBTBh5SZZoH5MGqDSMMt
         B1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784427057; x=1785031857;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/nji6/9dRFy5m349usk56mPECY63Tbm+yUPmWxeKoJ4=;
        b=QIxdPqkdmy0UiTCy9HJWDTEDvPMRazWsTRuym7/hKuGmjid4Unsr+5kMBpmF5N3DKv
         ZTx1RXIVn90QYsxwPkX4uh1bsgOBnsoILNZt14PH6qIGQwwr8NrJ/MwM7YCDdxx49F5f
         +0i0do4l67cBFHsKPpqGANBawFUbzuCOOTRf0H3HkwKwh5H1T2B3Hy+2S+EUUbI4/ESd
         KnoK9/9c1EWeYm7GQgKKajpPdQNhZrLQoyJ1RIR4ZWGFZ2LT8iOSE8HYyeQmOZUn1i6h
         OfjFpGchMpnMgsWct8M6UxPUqN9Bm2k4rn/hw+nXxhk8FGhcKUdsSN60VaRJOsUtf7PE
         W86A==
X-Forwarded-Encrypted: i=1; AHgh+RrBJCuCIMSwyy9sZH1Yiqi20LgT6ZXwRcFR3JhSUf0xN+LYqGKTxFYGXhb796ZL4000/FfNQA8OWqoh@vger.kernel.org
X-Gm-Message-State: AOJu0YwbvMr/6uY4WFRqy7XVZ2IJLwPH8olChHqbmPcHsaHS+0sgJtq6
	ds3Ny9VhAsOQhtuZkd3AHQcbFYFMiMDF+Bq3ZQsHnonnF870HprITlLBTdU13YPjBwxLITBVVG/
	BuC8RUw1r9r9Hlwy69MqbZDuFWPsVU8lKPaaMvbm/ysPUl6FrncE4p/hxUKuqW4xw
X-Gm-Gg: AfdE7cksjxdhFbKdU2R/ITjfAZGgHWHVQ3SuotovO7FOARHouQDmRK7Cwlduv6Wlx5k
	hlYb914JvlnO85/UlOegwB6tE6t+Tn/QdxetWJ0TxfRPJbPYFeJ7c1dbuCzN1/3rjLIZ6XNeRZL
	G/o66lSjAfnkiuZT565jtnM9jh9Dq0vAIDa44gklU2X18ZTy3kaFH/125r56JvJDcT3BeaZF+Yt
	/1S0YtqWFVF/GIiwPyk/HIQ44cDKce8rGP3M6TxIZhg0A3yiQcoQMjZXSLSiDXCe3mRbx7Py+gz
	1wX3bQcVmobt9cHSXA76BtKN5yiUh45eDW/xIRkNp/GzU35mBNBWIbgxnLu0cF6i1PeCXEUNQ5s
	QyRDrYqeVoLuoqL9J
X-Received: by 2002:a17:90b:3942:b0:37f:9ce1:cda8 with SMTP id 98e67ed59e1d1-38e4b59469cmr9276541a91.30.1784427057533;
        Sat, 18 Jul 2026 19:10:57 -0700 (PDT)
X-Received: by 2002:a17:90b:3942:b0:37f:9ce1:cda8 with SMTP id 98e67ed59e1d1-38e4b59469cmr9276526a91.30.1784427057091;
        Sat, 18 Jul 2026 19:10:57 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e3a100753sm5454606a91.13.2026.07.18.19.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 19:10:56 -0700 (PDT)
Date: Sun, 19 Jul 2026 03:10:50 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich
 <Michael.Hennerich@analog.com>,
        "David Lechner" <dlechner@baylibre.com>,
        Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
        Andy Shevchenko
 <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel
 <p.zabel@pengutronix.de>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Shuah Khan
 <skhan@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Marius
 Cristea <marius.cristea@microchip.com>,
        "Marcus Folkesson"
 <marcus.folkesson@gmail.com>,
        Kent Gustavsson <kent@minoris.se>, <linux-iio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, Janani Sunil
 <jan.sun97@gmail.com>,
        <linux-spi@vger.kernel.org>, Kent Gustavsson
 <nedo80@gmail.com>
Subject: Re: [PATCH v6 1/5] spi: dt-bindings: Add spi-device-addr peripheral
 property
Message-ID: <20260719031038.4cbb21db@jic23-huawei>
In-Reply-To: <20260715-ad5529r-driver-v6-1-cfdf8b9f5ee3@analog.com>
References: <20260715-ad5529r-driver-v6-0-cfdf8b9f5ee3@analog.com>
	<20260715-ad5529r-driver-v6-1-cfdf8b9f5ee3@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=POs/P/qC c=1 sm=1 tr=0 ts=6a5c3232 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gAnH3GRIAAAA:8 a=9c9bR3m6y8SIrhsu7zEA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDAxNyBTYWx0ZWRfX7dDA+BEcbYuT
 MD3BpjlY+K+exRwSKE/+DaCmi6yhub34o9KAgsFTBr/PjXyKYwHZhvt4StC4WGmL3oG5K5HPCCd
 Y64PFfjNWz1XD/hGBXeiidFdqbyCTE4oZpX0knxde2033pzJUik2YPP16lqqDRLkk0E/o/m8XO8
 R97XoCM8lvDnnDd53rGxFrYg1m8dd/0TOoIKSMygHitRCyGVIHuJ5+WEZKKpXT93u9cRV1rxtcI
 7F+vE2CIFB55kJsp6EryaeIh7bxtun9KfCZUMFym7yqXfDVibYoaQdwVjH90wTWuCwsx1N+d732
 1iu6YL7Dkb2mv3dJ/MwOzKx++QCg0AK02bAtZnZFbIobMr6VbI0X6qOvBHYJwZR/i6yBm+BQ1bs
 MCvuaLgQuqUxczN4JpBa5L4Wc7LS1ZwDDpCvGw84JBk0XQU2mBEFEdOn5y2VB0lz+mxhuouE4a1
 C33dMJnjOldDjkMuoww==
X-Proofpoint-ORIG-GUID: IvFY6wLB2WPRr3jqao7KlZujJb29XeaF
X-Proofpoint-GUID: IvFY6wLB2WPRr3jqao7KlZujJb29XeaF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDAxNyBTYWx0ZWRfXymsGDxvkHNpu
 fzMqCOekQqTPj2UYaSiCuG4bMzgG1N6gg31D2IeuK5rk6cSNhVNe01zS9gzLZJYIV9lF0zeAK42
 tRS8bfM9Td6409WNG2p5AU9+6fR1dcc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607190017

On Wed, 15 Jul 2026 13:41:04 +0200
Janani Sunil <janani.sunil@analog.com> wrote:

> Some SPI devices support sharing a single chip select across multiple
> physical chips by encoding a device address in the SPI frame itself.
> Add the generic spi-device-addr property for describing these hardware
> addresses. The property is placed on the SPI peripheral node and may
> contain multiple addresses.
> 
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
> ---
>  Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> index 880a9f624566..135657582131 100644
> --- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> @@ -142,6 +142,11 @@ properties:
>      minItems: 2
>      maxItems: 4
>  
> +  spi-device-addr:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      Device address used when multiple peripherals share a single chip select.

This needs to also explain why it is an array.

> +
>    st,spi-midi-ns:
>      deprecated: true
>      description: |
> 

