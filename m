Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4830D34751B
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 10:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774519671; cv=pass; b=Gy9wn9pX6w6evzqVZRqOAtEyEWuDuk/1Jz5rMhzUsgylKuqaf7ZRn/YePuo3GBJL8cj4P4M2BY+WflXTOZZaJV5D2XveA0IWQg+lU7U8I95dzNmQdt63Ipwh7PZVeeZomqpcGbtbheQT5VkWTP7xZUY9IFME7STiV/J1wV2geOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774519671; c=relaxed/simple;
	bh=lqaeI3ynPbRJKQe5PDeB9VaBQLaANlhTZEkq73SPjeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gafMRHlGPveVTwvG7GUNFul342uVKmwZ8IBr0f0hnwrIjFnOta8bs4ikemHYHJScSl0UMMJe+Ps3IaEGuv8BbfAjh6OcIoAx/EPxUEIPqK81FU/Afjbc3rh5J9CUlAmtOEsXJq302j64i0Q6OhTKPXgDlNWTidu5R5r2ax/0qIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gVauT+Jv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kMdv2SQL; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gVauT+Jv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kMdv2SQL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q9YsEr4015904
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 10:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dnMavv9VcWVUyZA6Ex4ByNZK75MDVF8digB1PwkBNzg=; b=gVauT+Jvzf4P/isc
	y/2dyX8RuxmQPASHXtfsNXVjOqQBoEGQ/nTinY2ccG3c6iJyo7W42gxAg8h63oRw
	CYW2N0kdLalzBeVllX5sEhtX0GdSJm/vLXEr0X2wFU70axClCyk7IrK3udbBriQo
	qBqGAsAp8wN9Svk92fiSkCjpiBttcYw4xP6X+yEdEFE8SO6zNY05+KsJ7KNDEpLl
	00qknhLZp9Yt1DgPp63ZHYrA2IqcPEy27u0xzG69fbudHQx75ovm4eNqxefG9F0n
	AVRaPSlNvOsUqc7dmDYYX1eLaBAPc/jeWnGzn5U1NLCKQCbOxLSIwIdbTqMe5Pqy
	Sth0BA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4w1q9964-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 10:07:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89cda8de681so14530176d6.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 03:07:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774519668; cv=none;
        d=google.com; s=arc-20240605;
        b=aFfk5DuB3z8BUNOrS6iQIQB7E/aumK4b0DUGjwscvnQ55uInQDQtE22Wy2k/e3hxfr
         4VkKM+5pP/YP6aSnlQdB7pOz0cOtgTonl7VxkChfL4Aer8fEMJJY7ZQHqkiS05ETY2K9
         6nVKEhTRuh59VX8rK8g11b+3+t/jXY7mvlh/abkwdCcZv/J3nNqiN5hwj8WhD7tExVJp
         WBVJ7mUN6Y5NdHqxKKMwdf1T1e7ZQLqDZu4ZftItbwNF2fD0GKzWyVQb37BNCgPJQ15w
         gpjCGSLM5m50BFkz7hddZ7BhEebA/i+ZOiF6YiGMc5bJtSWccytexaOLpijRF+MyepwZ
         Jm6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dnMavv9VcWVUyZA6Ex4ByNZK75MDVF8digB1PwkBNzg=;
        fh=ax+aaEuOmBuLGl+YL21lJprjcjsYa3ZbSnaN9H06DAM=;
        b=ZVykTUr3x3IxYraD/tHk3xBwrX9df++SDN4N6BGKSCfm4cKba5+cWc9CBHHIGKqyZB
         wqF+uui8uHAuoelucJ3We574x++6RD7hxZ/dRCazqhvc368mfEvQ8aEKl4LSeJX+gSwh
         k8/BJ3zed+LEqsCzO6cO6tffdwDKI7d1C/vCtzpa6IBTBZO1Rv7gAMkOvZQr17SGZj/W
         b7/2SrnkHnLTxBJ6fKXSNzjh1325MyJw12RCw38MKkAzTAtEShfSfqStxAqjczw+z1Ai
         Fu2oSCdFzwEdy3JvJa5VEGo+McWUgN+1DBQyjGv/PgtfzfiihfGOgmN7w0EFdTLX/vXx
         MT+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774519668; x=1775124468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnMavv9VcWVUyZA6Ex4ByNZK75MDVF8digB1PwkBNzg=;
        b=kMdv2SQLCJw5MBvaFsfhvwANke14fmFNraGxkXyv3ylVTKt/rNVszCc1aR6kB91HXk
         +Q4EJ78ywvyNoipSNTxDE1u3730AJ0d1MVkkkfFje2qn2SVf1Q0WOwkHY9OYfA9LDA2B
         XRl6INrZRYlWXWl6UZ7X6p2BWQQZhULnQPejBOH0xliHzF2aZUj1GEzoqjYoP8DKWzgY
         pcuSu0OK6Qj6gByxv7JBcyC3j+UePM+wzaQ8VU2j96leZrPHDQbdP1JyieSMTv7exa93
         NHFvn3CXULmcibJ7jwk4Ui+bLghh0vt85nuWyQv8+GkD0sycYlHxYeQaetfrqRWgc/yH
         OekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774519668; x=1775124468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dnMavv9VcWVUyZA6Ex4ByNZK75MDVF8digB1PwkBNzg=;
        b=ppmX7FcZ4NhuLcJQKMyc0fEt7wisPqNBoBNkeky1Ec4bJeGTyy9G2310mmIn0HOOd8
         PcyzrCiUH07lQkExt67RhoiFQTcDO0ctTba6JqMLlAO3GqoxOqLmKFk4G1f3IdJwADD/
         2a24aJd1Dq3taxVRvOgvL5LfCc5/pj3JiS3raOn5XU4ut81t828oRPqMfRH1tV2kYQDb
         qbS4FRhDgGdwFFMMk/B/iah9eIULaeZCTms35laHHOSZ7awtHBeDf29PAvwrIhTgyx6f
         ole2O7XO5EIWcNt0AY5u08IaJQgGp47o/GNrNhSjaL35G/TUUcsXe+qNC1AhAtYJxVuG
         Tj+w==
X-Forwarded-Encrypted: i=1; AJvYcCVnDsY+jZO+82WirNCxKnzYiL50twhw0ucVw099brw8Q8/jPB6G/0WTZvu6b5A+6X9Lxa/6q1yBTAM5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0bWCma0k5NSQT9Vi5ty34/IbPJB3kcpQ4cFiBuA9G8/xzWR8O
	vFpoEMWt7/mzJQF2Wh3LLfS/dttmiz4G0yutt4tYodObeVP/1kLcMMgaS+hAH8aKlWnRVmpXtwX
	RXZ/UJoe6dmB7e3B9rzNwFAoYiLATFEIFBY/kjPtBqPM0k7so7eXFhcZz0sFNxm77KGFYCGa7w0
	SbRUI7NzimWxdBNsosc/e2qS7Q2nMFn53yr1SJm3M=
X-Gm-Gg: ATEYQzwK5IVuH7TygmOZb/qzjIFK3WHmTdDyfaayy98f7KimUcY6b9OWqaYmmDlm08N
	GujFhwC8cqadExjkQDflfCZOJPu+Q5Zmdr4weJFW8VJZeQQGhNpNr8SMG6mxmBS0MmXq/HnuqhC
	//mOwD+DAS7akEBq3DRmuFMPUl79NEOd7/NitHXSEUUG7PUs0/od5bOjAvXXBdoe3rr78YIcsVy
	UcgyQ0=
X-Received: by 2002:a05:6214:400b:b0:89c:da4d:de26 with SMTP id 6a1803df08f44-89cda4ddf32mr20561306d6.17.1774519668521;
        Thu, 26 Mar 2026 03:07:48 -0700 (PDT)
X-Received: by 2002:a05:6214:400b:b0:89c:da4d:de26 with SMTP id
 6a1803df08f44-89cda4ddf32mr20561006d6.17.1774519668124; Thu, 26 Mar 2026
 03:07:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com>
 <20260318040644.3591478-2-swati.agarwal@oss.qualcomm.com> <20260318-devious-spider-of-endurance-ede46f@quoll>
In-Reply-To: <20260318-devious-spider-of-endurance-ede46f@quoll>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 15:37:36 +0530
X-Gm-Features: AQROBzDyOqDscpM1Qp598tIiy0z_Urr2uTYFmuTrlyekpsKSj5Jbxn8BdIURSw4
Message-ID: <CAHz4bYsUAojfB3BCHVoc8PMQBrjme6grdEnkxu7KhTQ+sxOf0A@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: usb: Add binding for Genesys Logic
 GL3590 hub
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Pin-yen Lin <treapking@chromium.org>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: g8mtz3MT0QNLcRa8ZLQ_W5vnvx2NRryF
X-Authority-Analysis: v=2.4 cv=HvV72kTS c=1 sm=1 tr=0 ts=69c50575 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=P-IC7800AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yKxla6SPEuOvPVJYePEA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA3MCBTYWx0ZWRfX3SF42ASBH19g
 wN4gkvt2Wx5beBYXtn5iujV+4s/1UimwjwlEPApxxb0aa3pDeuEQyE3HPfs+eTOkPhgnml/kefK
 UICE03yVmqrbE8s1ImAS1op+zQWLHtjMfYs6lRbOZVV1SeNd9aG9lYJgPcF0mtleEpJZJW/56HR
 X+Of53sjQbn2fXtKYbKXAMa3RKUcBEbkBsqV8qI9RAEZYmKkqFhGquuuT3XwTPl3KchltlDPNER
 IHyTYEuQAPawmBfCiPI3iUsgXkNwr/AJpkSS7rnkSr3PD7DGR/wBgDt7BuAgwYOzcbdfOQAHtxh
 +XnWxsHh/3wCwMy6d+VVB+vFL656Xn4AgheuOgRWueGLqptZMB2TQa5UhDnK9Me0EN0xl6FFqMp
 7MpPNqdozZYv3P69hBnqMPb6+i2A9QdmvIuhaIdeZ7Dc3+rFkQSfPlmPLnu2+YFPtlCxf45wMab
 hOPaU1J1cCR2dwLJQFA==
X-Proofpoint-GUID: g8mtz3MT0QNLcRa8ZLQ_W5vnvx2NRryF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260070

On Wed, Mar 18, 2026 at 12:31=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Wed, Mar 18, 2026 at 09:36:41AM +0530, Swati Agarwal wrote:
>
> A nit, subject: drop second/last, redundant "binding fir". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetre=
e/bindings/submitting-patches.rst#L18
>
> >    reg: true
> > @@ -26,6 +27,10 @@ properties:
> >      description:
> >        The regulator that provides 3.3V or 5.0V core power to the hub.
> >
> > +  vdd12-supply:
> > +    description:
> > +      The regulator that provides 1.2V power to the hub.
> > +
> >    peer-hub: true
> >
> >    ports:
> > @@ -69,6 +74,17 @@ allOf:
> >          peer-hub: true
> >          vdd-supply: true
>
> Here and in other cases you forgot to forbid new property (: false).
Hi Krysztof,
My v5 patch series address this thing as follows:-
https://lore.kernel.org/all/20260122092852.887624-2-swati.agarwal@oss.qualc=
omm.com/

But as per feedback from Rob on v4 and v5 series, i address it as per
his comment.

https://lore.kernel.org/all/20260122170651.GA2632938-robh@kernel.org/#t
https://lore.kernel.org/all/20260121022449.GA1804139-robh@kernel.org/#t

Let me know how we should proceed further on this @Rob Herring
@Krzysztof Kozlowski .

Regards,
Swati
