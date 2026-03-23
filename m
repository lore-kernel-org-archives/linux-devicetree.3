Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7773233C53F
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774251411; cv=pass; b=r30G1+Su2HJ4eFXhLb0gxp2JqmTDrQoCcwdI6hIsezAAyd3dYAZUUvLRYQOmMXQ4FqAD5pVqG7kSWRLV9PGLByDIAw9pJZ3SNtsU7pupGChr/PVM5upW4TwRDsDAlynCDuqGW5XtAcH4bBHOE2L9nsROed+0iwHjPCyvjxfpo34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774251411; c=relaxed/simple;
	bh=dE3eHD/xH3GbKQZD3wXfKMDB+XRJOlJRRKpaBH+I6gg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H6mEsX6sU0ShGjuBCXzchkYdKJRR4z+2nbovdqOJEEKo+XKLi79Gljzn4lIkb9SliFBLXr0h1/fmmYvqI4DBp05XmfFzi0d9lQzPMbjFqk4ufG7dHtavl9+NhnuHX14kZaIdCJ5zDl1Z5OWtZI3KG0Md64YZl2PyiCxBtJlCdFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FWTZeROD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CirH1nMX; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FWTZeROD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CirH1nMX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N4wupT423463
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dE3eHD/xH3GbKQZD3wXfKMDB+XRJOlJRRKpaBH+I6gg=; b=FWTZeRODWjifBRIm
	Qt7LIqjlby6QBv7fVstfT7yzb/FCwWNXnDBzEHoTkXmMzz5bS7hZECFF2Oyqf9JC
	TpW4xcJB7J64UXQDwIuVbWWQLh6TKLYzUZELLsLsFB1CN7ZrWud8wUN+ruWiXndZ
	ddiwhvGKv5euag37IWPj2vc1/KAL8oPTgzftbUZSkHcyAAlQFh9M+tnvxV8wsPGq
	LECKqFyk2o8ZsREkUM9sGFoQS2PNmVuJLxC2u7RZawBE5JwAR83f0i3QN+L32Yxa
	/fLf6Jm91hhxD6V5iUgRh/plBiqO1M5xN/zT4tgWGr0WMA95LsvfvrYGQutj92pT
	I0BhRw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1m3cv6e3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:36:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89c514077a6so255057076d6.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 00:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774251409; cv=none;
        d=google.com; s=arc-20240605;
        b=BprIFZNCYUxs7/LS8gBwR8h7m2q8/qEKgZp2KbqI54w5PH2STTHk2/jN5W/RadB9lx
         ZR3nC2rk0tSsw7BxisKeRdnfM1bRCUtTG+nhisiRXnbwz53yzux2zbTjLmhlZBx2Smmv
         IYCUL7Ek3bUETcpdP2JOoQ6W//nvAFLOojPcRsRdqGN21Rn/0DTF7gh9sQMfNRylLEBr
         yx/4ClqmyzR07r1LnPSZFO1Vlk55BR58yIuH2E2y5TZnMJvUSRezNYikedXkwShPKnrh
         g1pZAaSCb766j8V2NxB4uvdxI0CxlOGIeHvI39+L/8D8IlefIK3Uh5hS/OAUHp2AayCW
         5z7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dE3eHD/xH3GbKQZD3wXfKMDB+XRJOlJRRKpaBH+I6gg=;
        fh=4PRnXs3sGjX+dhrcuQ2xamSQTN281ZISZDCEQTX7o9o=;
        b=Lx0IhDWvqC3GePO9RC4Ixfac1p9D5zIZeixpOOvoGNIte1AtlFzm/DXna4jFE8VJdg
         cUBSMm9JCprJcepOVpHZNoZL5+iY2zj601YBRK2mktP9VUDoeovoBqv7wCAQlfyQAKSv
         5N3taAkssfqqWK27oSo5NhLeFFq2b50iPxlJjxUw+0XbxNFsARVVpSIXoAmw7NhZxHlh
         oJypv+EZSv4RZoGdXQHI+6EiwLtGC1RQfhqpF31fENcsCIG5hd7So7EfEWt82d9KWFAy
         wafz2gJ/c0Hde7XZXZAsqj+QpP1T0UJhdBXlVYCGcc5Yz290TcTWzSQHVlVqlva2MPdX
         qlTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774251409; x=1774856209; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dE3eHD/xH3GbKQZD3wXfKMDB+XRJOlJRRKpaBH+I6gg=;
        b=CirH1nMXtnzg2jAONlFvQDjpggNuKvyE+jS94pZOzkG6g6kzP+sFJp8CjtIxnLe5li
         yN+MbrJcjuDzwBG2t8BN/HbBk5mM0lLtO6gCe0NdBtd0508zT+DcxKbFM32iXSuI47XA
         hB1jzAMNDuzJFt2bhaUsS/dUzzZlrS4DFzW9QCZ9zQs94p+IvNleXg34R9AMIS5jQBd1
         qTBoXBvB9pztqMo5ZFT7nR1AOesxJmnFnqFavX1KDX7kqw1ru/IY2Y+zTijiGqzggfUq
         MB6wYCcqazH9sRr4KTEVY5dLcx88i8hvDjmEBYyZJ44urY+e875Wrdj7cjdAvR+eTQoi
         lBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774251409; x=1774856209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dE3eHD/xH3GbKQZD3wXfKMDB+XRJOlJRRKpaBH+I6gg=;
        b=DwqOMAFb48n7136aaG1alJFodjLz1U6Wo/kyD/03CUlzaEblEVLu6rr0nOQIiW8PqL
         CA5FEhEGNcJ0KLWUsg1jztzXbQO8kEdk6iD9W2iDXwWr18LoAdPmq9sKrKCeDUiIA/CD
         Kdo68oZu+rqjKmTFze4DBgWwzaI8lsGl1vbEJS+zPf3zF+yLHIXQBMFAOFTDVYt17KBA
         unevV+w2L7VZdaWFwmUrPyyJbWkaimPGSU2bBrAZiGgXhMYD5Vvbh7SPXvY3M84wmrF+
         OziREFGWbs9+flh0XlL0Hf/76xow7dblVrE3h8Hy5GblgovPNy0vPyW9jJb451NOw7zR
         cRVg==
X-Forwarded-Encrypted: i=1; AJvYcCXKbK/bXYgsKss3CajmCAwG55XFAI8PvbRvigSn+0GsQ24JjsK/EzvOl7HwuYPu7c1jVUju4NmQzkXK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw17FAeeBfeXGH48awcJethfGFgVTG1XpOKLvCqQEMjJm3ajGI
	AF3HdJrpljKOjKkem8sgpNXUyjYaKEbb/EmnnbrPlaANiQ0vTlAYLdtwgzefugo4IjbxjLHeqjx
	im+3nsW9FOMUN8k7z4fM221nEeimvyac/SfhMwdOOu/RD5cYvm+U+uq+PxK4viMVmeUifi9l9Jf
	VbYGaQlet3dI55dJYowPJktCAWQPpbuDXC73EBLG0=
X-Gm-Gg: ATEYQzxqDVB0S8sh1Hx2uFyTvMp0YxSxIAooPBG/Sfd9pOzV8kO0H+vCGOaysNJcUXV
	B7sfipGTz6WdxRBw/sxz73z+LHOyfokLMS1py2KAoK/ItlWK0RQoRK4ZZCLuggWXAT6osH/kbm1
	q2cubHUra+sjhzwdTaN8JrGttzpUlCU/6BtNLXkszjxvJCaNBFsR19FaV/Mm9D8DiDQ28O967tp
	f4QAuY=
X-Received: by 2002:a05:6214:5984:b0:89c:5f6e:451a with SMTP id 6a1803df08f44-89c859e9734mr188298236d6.21.1774251408769;
        Mon, 23 Mar 2026 00:36:48 -0700 (PDT)
X-Received: by 2002:a05:6214:5984:b0:89c:5f6e:451a with SMTP id
 6a1803df08f44-89c859e9734mr188297976d6.21.1774251408357; Mon, 23 Mar 2026
 00:36:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com> <20260318-neon-vigorous-prawn-dce7f3@quoll>
In-Reply-To: <20260318-neon-vigorous-prawn-dce7f3@quoll>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:06:36 +0530
X-Gm-Features: AaiRm52HLt66wHK0FqCRZAm7RWW-bc3MWhfzPCBrm6w6z19W9eTDZ_q3Njv0RbQ
Message-ID: <CAHz4bYvs9mnDwfkfjkebucZSQpugEqr6+sFf1-hgzNO8SodzQA@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] Enable secondary USB controller in host mode
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
X-Proofpoint-GUID: HJNnYaQ0NNdID8KkVV807glJCUP8kKtv
X-Authority-Analysis: v=2.4 cv=Z5rh3XRA c=1 sm=1 tr=0 ts=69c0ed91 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pPiH1uhGe7me3s5KK7EA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA1NyBTYWx0ZWRfX3+A+gdOptf1p
 AE/0ikQ30GxkCgXn1ZA0Q1lzRJeTT6q0FOmjjV6MXLeMgAf01ExepuRnsBypmDByZRnEyEiB2lA
 QyjKlITVs/FLByGqxTxvqyhL0pD6gDAkrrpJgdpOC8nUbAq5up4b1OGGd1Pb6RCV0pj9mSYa3cr
 Ie2fOneUk2EfSBj4XFArr4StazSvFMuwxgoZmTf32fRtZgi3rMtD7YURN3aWSaAhj7QyGtOjWzq
 TIqw2+uPxfDUlH35oCgNMTfxf39NCaPSQpNq645sKT/Oz5XV72+mUNeLpcQepKASTdNOJGo6h5K
 kKXiOnEfQB2RtR9HjMRgAw83Rtx1IdLW6TLVVEUaZjItm4ev7UcgC4CMTmAzThuqwZATHE9U3Le
 t5UWYgEM+7oStNZNTjZFhR3FttkyRJHri/BhaHwKvSjv2fW0w2Zqibh5meYXfao+sygdzDOBd1A
 akw3beei2ff9+7RkYqA==
X-Proofpoint-ORIG-GUID: HJNnYaQ0NNdID8KkVV807glJCUP8kKtv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230057

On Wed, Mar 18, 2026 at 12:33=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Wed, Mar 18, 2026 at 09:36:40AM +0530, Swati Agarwal wrote:
> > Enable secondary USB controller in host mode.
> >
> > This patch depends on:
> > https://lore.kernel.org/all/20260306091355.1178333-1-swati.agarwal@oss.=
qualcomm.com/
>
> Honestly? No. Drivers cannot depend on DTS.
Hi Krysztof,

Here what i meant by dependency is that I have rebase this patch
series over below patch series. Below patch series is related to USB2
micro USB controller support on lemans EVK.
https://lore.kernel.org/all/20260306091355.1178333-1-swati.agarwal@oss.qual=
comm.com/

There is no dependency of drivers on DT.

>
> Also, combining here USB is a no-go. Do not combine independent
> patchsets into one patchset.
>
> I also do not see how you addressed my comments from previous version.
> You never bothered to respond and I do not see them implemented.

Apologies if i missed replying any comments.
Regarding your comment on v3 series below:- GL3590 hub used in lemans
EVK requires only 1.2V and 3.3V supplies for operation, confirmes the
same from our internal HW team and update the same in thereafter patch
sets.
https://lore.kernel.org/all/20251220-economic-gay-firefly-1873a9@quoll/

Regards,
Swati
