Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552AB3BB9F3
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 12:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597892; cv=pass; b=SRcxG3MduSuJvo/wn1eNbqEGc1TSns1GFESgGnajAUkDK1ANLuhG537tNTbWZ1P3oNBaHjZSJky/QC3CijIZsRBLuOBL34h+Q1ggpzJujeK3/aDihlg0/aFpReT3QHSlZ2mVQta9QPA68iX2hBihrlG1kmLzfxwn3WJcNZZCxxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597892; c=relaxed/simple;
	bh=QD+IP/JQeXFvG68TvIWuMoLOYB24jv3h0RzVmWZVzU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m/4BGwdIREqKDmtkoHupQ8iTbF/NCSWzKxRJGTWPJl5U1Fgvw/omdpgKuwGW32/RjbsTSGowf++M7kAavnU/RJWh9g77R4vB4wEQfC+YneF3+/AQJSa6GClrZkUUShq/nxcLHnwWOXfM06MckuoUzbl7eeL/0U9GUuRvnIr1SzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F7IJNSFc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FmTc9wGU; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F7IJNSFc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FmTc9wGU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAMOj558602
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 12:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XzefpZA05xL3xDa+q/jRzRAJHenJne+6yuOvzxu+MdM=; b=F7IJNSFc4XLasLfh
	wmCm3cOuG1L32UjmoTkxsrcwdVAUOlzyb3CB/oKsvkNsdaBJpOWSQ+n1VFj+XMEN
	Kr75rJwm4IQ+BrJcwP9H9r05BmcCZ3ZuW1+gasBqKJZ49SHE8wYg0ycVny2i/yoQ
	3HKo3yopBMQL6EfHeJSpNGrThfOrRdS4kXbcV7sxk6B7NS9e6eLttyf7iW4XcImH
	ZSqb+W/fFfPdv2ejzE4ywZsTAiBf7h1P/jIUy9Y7Qiyw4fDNSGhFYKA2bxxjw0jF
	sqIlvYUu4kfvg4GeWeuOxXy1QHIL3DXBqagYCgeKpXv4kGwq8RsyJeyLRXI+fQlN
	qm3aMw==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq22ca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 12:18:10 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-674153ece6bso2681381d50.2
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 05:18:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790597889; cv=none;
        d=google.com; s=arc-20260327;
        b=pmOJllINC4tTFwfDfjsl6JSRSWeu96fGFDWmmym1BHQpLB+7E/Nlxp2tH3CeLcptZs
         5+BeGMRdiZTZ0nGDiY8z4LhMmT4KC7mgjODcKWFsHAYFJm9P2k4oKHj7VopvJ5XtHTb0
         LSttsqOAgsMv1dW3qbZL6Wq1VJahQzEcD0FZpTqEJNZAYiWrkDq9y6dxb1SyT70mZl3Y
         SCxqrY4VY8wVOcCjsIRxGZthpVe+GZShlptwwLeJoHk9dTvjP8sF4Il5UdRGbAyWBR2M
         r6WQWT+Kv+bi23xbdGhFU8flA8KsCnagbSrhIHUK0VLyPDRkvf0I3HDb6oOQTXyGm3Hi
         dZ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XzefpZA05xL3xDa+q/jRzRAJHenJne+6yuOvzxu+MdM=;
        fh=qJ/kDoDh8hgIR+bFKWDJH6nu3uiHRfiLmR031UyPbic=;
        b=ElFiTSP59dT9rLFrUz2XGD3hdCSHy6q5fodhWF468PNPkqTM3Uild+DkznPcQzlQ/f
         UohEQ9KXIB1r0VTurPngl1KinenyetXvrtimVPS6e5TJCBit7zB+e0QUV0NmgV/UE6jQ
         Jjx2xU1n+C7AoW2Re0LAjzhcQiy3Unc281vR0zrngVx5g6O/6LMuiTZR+TOyjh+6h2cz
         6jx1kUPOQlUIcW8Dq6CZELryq/UQOAzMUAvoRaqK4eLa8UyQkFfIIVm9ImLm/sDCOKqX
         75YRuycYcuU5BXKPwqsU/6qfp1NSt0RvP+Qxd5tAEpiwmXqJ1FS58I8MgwXaV+TaHhpf
         Tmqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790597889; x=1791202689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XzefpZA05xL3xDa+q/jRzRAJHenJne+6yuOvzxu+MdM=;
        b=FmTc9wGUwoWQb7Mh5xXHr1LAIxgIHf/0qnlkwZgp9VrPc9mmOI2yyqwXvDnQpoWQ16
         3YKJqSML/bclOi/5a9exdNjgDZvRPVAw5MZ3Un6DuonMxj27pglgB4EWr7PYFcRX46RR
         4j1C5t0V18RhUDjEmfkB9vNvYgwe4U5IlSIzANrAUjuVjuzd6MO5b+ZXW+ravr9JUXbT
         6ZVPrlKAz2he5uEP6mWPIKwoPjnftBAF1G2F1dD4eFxSCtHL5onuq9gdGkU6D9KkMTWj
         yfg+GINxIlT7k0wzG2lR0K1+kw8cmkmniNnJl3KT7o1mTztpqqih9U8bsy5vjrMXgrO9
         QUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790597889; x=1791202689;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XzefpZA05xL3xDa+q/jRzRAJHenJne+6yuOvzxu+MdM=;
        b=COXQ4yXZN/jDd5yYcKChiTnpvsMFRm+Uv8mi7ZF2FDMehHYqU5fCIV4Gwhb+9Tx6fQ
         qxxlal4AvK8LS66A2u4EIauYEGsjl9o5Dk7SCuGi2ixcdJONgMlsmD+zbXgyHzIj8yVc
         xOROq7FOtio9aoNXn32UOsIlPYr/pEGVEE80p9jHPYrpiyFzbiPQT0RQZdzfU2u5P+vh
         ScnkInj3/eANL6jdfE97RmAYI+Gd/XG6fyhIMFSguJg7HVQnm7wXBqPItXLeY0XjIOHZ
         BfTF7zdecvpUap4pya/YXHJHfLehxpFGryrk3q8kBB8BlawcX7cjayXha0/1fvPk8jXB
         n39w==
X-Forwarded-Encrypted: i=1; AKwUvByMyCC0jt7VKoTyd7W5s95qV2MvxopuxBcgr5GxF+Vk3CTZFx4OjwZ6thAnz5mTajDBiPgBNxEJUKoy@vger.kernel.org
X-Gm-Message-State: AFq9FYIAYrJJbpcSv/MfJlRQoNtIjF8Ge3ZOkjqgkRPBmeW/d7HQ1AGk
	qfFliVtExT88lys/ugrA6pEpbX4TJ1ruKk7EjeepUOAGc4NLnVEhnhkbHUY/dT3KCNCefPEI+R+
	fneEehbnBaI2Q3mx0ozlf3zD+TKf7WtDKbDGYCTumzHN59ncxYTW7JgwV2YJ+Z2od34LlTbPH1f
	uDS46LHY5M6h93OCmYmHPN8CoX4ZnTdAiA/aUZmJU=
X-Gm-Gg: AYBFou1f46XN/2MmI7Y4ichf09G6YytlEZZvz4rkRdLfctLQGv/vxesuYwOgLZZOZlG
	O6pxbod83kBW6VqIrj7V0kQ78yPHoYxW1s2qkjg5irjuirDKPv04TcBQeYtZcil83KTH48qwml1
	eYSCWGR9nm86D+hI2DjuqlovbkmP621wrwgvbwoSR7P+ScLSG5DEPrxV4MJA==
X-Received: by 2002:a05:690e:e8c:b0:671:70d2:528d with SMTP id 956f58d0204a3-672ed3a1adcmr5448715d50.80.1790597889325;
        Mon, 28 Sep 2026 05:18:09 -0700 (PDT)
X-Received: by 2002:a05:690e:e8c:b0:671:70d2:528d with SMTP id
 956f58d0204a3-672ed3a1adcmr5448691d50.80.1790597888749; Mon, 28 Sep 2026
 05:18:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
 <20260923-b4-qaif-shikra-audio-v7-4-d5b6f056568e@oss.qualcomm.com>
 <arOe2yA4KOvhYqRb@sirena.co.uk> <CAC-tS8ASR899SH45=mbr+8z6xcOBoRgYJWXfXXER9CUXdYCOrw@mail.gmail.com>
In-Reply-To: <CAC-tS8ASR899SH45=mbr+8z6xcOBoRgYJWXfXXER9CUXdYCOrw@mail.gmail.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 17:47:56 +0530
X-Gm-Features: AclHuK_s5MCzD1RecRG5TV0tZYeXGtKCs8wJ16v90jxnA5FxxzHDjGMMxqJkfeA
Message-ID: <CAC-tS8DUxJ4uD5s_BYc52v7bigMc9Mn585YGDQ_x9VaZdLe+yA@mail.gmail.com>
Subject: Re: [PATCH v7 04/10] ASoC: qcom: Add QAIF CPU DAI ops, regmap, DT
 parsing and platform init
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: EzXg_GQjaEqOjirvLSGqAkeVZ82fOOkH
X-Proofpoint-GUID: EzXg_GQjaEqOjirvLSGqAkeVZ82fOOkH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0OCBTYWx0ZWRfX/jViblaQix/u
 bOKquLEvXJvtYsomFyBUBfhm5JhaRiraz315dIHnF8RhWjJXXW4cBT5eYVKM3QRaU8w4g8A4L8T
 RNu3z7b7eWaLhSLZv7NSr22XWuMhrfk=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6aba5b02 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=6YM43U1n-Uw7COpwBTIA:9
 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0OCBTYWx0ZWRfX8QULuRN1BdCJ
 2tN7nNG8kAUfeosdtzj4JLRDou91WoOpfKD7jvPDO2ZBDkv/0lcTOK/EfX9m3hLMz+XiYFTKwWW
 wX7YbhIBpMSD91pMxiLJfc5QxYBKTWTbj1kamhlJ4uaFqYLDwkokylWsYkzY0YAuMUFIZZUHCC5
 KgZfB5xrrqhnOPPgDzqUCb+I1yOrziqYTtEVRZ63iWqH62bmhtdDJVPNTpJKflzMoxP4X4ysdBe
 iihGQZXc88eLOcTwE1cvj7wVLCxIzD5FSUhh9MAN5ZPMXpSZ3QLaAYoxc0USWsOuvRvseEi/Vqs
 gxv4orEzVfAH1MVOPGbcAWnT9VhtLkXDbJw5Jn1Tecc0QXun6FGEACstv5D7+vwC6JsTxD1yVvI
 P6dV4/Nvr/aBei4vjbyLGcLbsbX9te0ss9ciIMOwOmn9x2yDDfwF0UHP+0VZe8p1+WBBPHYBmFV
 6xh1BQPQl0oj2Ww6qzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280048

On Mon, Sep 28, 2026 at 3:08=E2=80=AFPM Harendra Gautam
<harendra.gautam@oss.qualcomm.com> wrote:
>
> >
> > > +     /*
> > > +      * The sync, lane and frame configuration and the MI2S bit cloc=
k are
> > > +      * shared by both directions of an AIF. Concurrent playback and
> > > +      * capture on the same interface are therefore expected to use =
a
> > > +      * compatible format, rate and slot configuration.
> > > +      */
> >
> > What enforces this?
> Both directions share the bit clock and slot width, so rate and sample
> bits must match on concurrent streams. Would adding symmetric_rate and
> symmetric_sample_bits to the AIF DAI entries work?
>
Please ignore my earlier symmetric_rate/symmetric_sample_bits
suggestion, Playback and capture are separate DAIs on separate
dai_links so it won't work.
The comment text in hw_param() is misleading, hw_params() doesn't set
rate or bit clock (the machine driver does via set_sysclk()). It only
writes sync/lane/frame config from aif_intf_cfg[idx], fixed at probe
and via set_fmt()/set_tdm_slot(), so both directions write the same
values. Will reword the comment.
-Harendra
