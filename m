Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3722EC09B
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 06:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788935198; cv=pass; b=kpTKpLDa4v1fTC6VxncN+pVDFId55Zus1Wnst/uywGEaOcWAO4qkSJmuQ4dhIkjB7/2wbpfxiRNfHj1cUtPldILgkLYfjalS+Ep8krKcPTeuUF3eM8g7mD4POA6E++QffaGVVIJzckG/1mggW8GhEsdigFBHiqgwtHbuOu1+hjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788935198; c=relaxed/simple;
	bh=NKoJ6JE3E+luIRxglgalTNs8vDhX048M3Yn5LzxShXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DY1KGDYvFz9DP4qsqjqfMECFzoesAm67L6RAGzqAZHjIuuk0KvqY/An2r2AeJ5+wg1BgIttFhrdHK80lej//Z63fwdsNL4cjJdlpxvNZGEpvSYG0NmwDrJctIbm8wotBSRDEy5giv0U0qIlGYCJICBBwdiZAaff0GG9J18UuUCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L/H5nfBf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A7MPN6HM; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L/H5nfBf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A7MPN6HM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688MgGJX1274611
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 06:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z9txVF1E2CwqfuIlPlfen4d7jX6bNOZdy7o/BqDBXj4=; b=L/H5nfBf/HUiNmWd
	unIzWDWxr38VJB/3XxIaweghFfymZGIYjltXc7ElRQUfChY1VY5Rb3/u4PVPAKDa
	4hYs2GtyWx2f+Tm3bFXHhaZ4L+Tp5fBJybix0R/I1LXJsrto2PAilf8fMuGokstN
	tmw3NC+20CfJgYJ5b5gDwKoMXvehV1t6CxU+6xwfwTl7WtENZwAnED3jVLPjmInt
	Oeq5+Dc0qrfWaE/E1AVq2GUGD+0JS6xnWskGiyH2YaOj0YO8d8WyviruKe/gj3mT
	jTlz1FES2ZiW5AlpvbYwxqkFOrFNmz0TFbTuLl+INGdvflkAT0WRxCPpFrAf0g/1
	SpJPtg==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqdw2kx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 06:26:36 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-67105617528so1019149d50.2
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 23:26:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788935195; cv=none;
        d=google.com; s=arc-20260327;
        b=UeMd1SBeNEydTQSwlfiHPSCgPzI4tSemDtjahTJcZCBGWbA8o6ST3HtPVARaQ/X4ZM
         tOvUUaLIsc9n15GqIGpcfuKp7mfMmLo5Il3HZTEFIEbzdirBLceumZbMClK6W9SYAOtt
         cxIygokTA4vxkBQBr1M3yqqQD379g3xpF6UIc5PTIxH6q+XCRQvd51HgESHyZxUPaGae
         v1ORIHcQwCmSLEEKenKQhkpKuBT3jYCWD6OpOgN4kFlCcwIjiL/fOEqqeZMQLAGpL0xL
         OCQaJ/paEh5x2W+cKUeH60x3kAZN2PFYCS32Vi/lzWMouB7vm8MWIjjHv6Dc2AMIvcAi
         Du7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z9txVF1E2CwqfuIlPlfen4d7jX6bNOZdy7o/BqDBXj4=;
        fh=EEKbeR5NLOslunm1uTvOfLZ1jIbGtgT9j4rPIhVtc5c=;
        b=V8IijURpKKOXVYMCpysp+0VYSnh1xo6Sy2rZX/NpkFnGTdANm13KYInwJTnDSdh9ku
         7ycF9bHqzRQkUOY6bAg4If0AazPAecnL7EiRv5vBZRCzMnPcm8fqaqtZKj7pchqXGN5G
         lx/wtRx2URzEfMIyGBViLsru4dwzpc3IOHN+Ump660nQP/74uSwahtH4tFRZcUGFG2Kl
         VtyvPqjqJTghQp5LboHnH4r3vmzWAYqep0G/lPeASmRn7cVoKNGY+foiKn6CB/q2lg8j
         hxyaSfjl+7VeWREsGXLxVpeBRnvhaqG9sn0/NugRqBqxcTfyTBmEpze7l8TYrBNUWmIq
         USnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788935195; x=1789539995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z9txVF1E2CwqfuIlPlfen4d7jX6bNOZdy7o/BqDBXj4=;
        b=A7MPN6HMYDrQWv5fC5ucSz0zVoM9rf/CUSaTI7NYEKXyau+hILqsZDVmedrGtc/eSw
         LIF3pCsJOePH086YjJRAeBqFGp4VBphX4Kp4I365bmvTDeKK9E+9YBY8tXyNl7eZ1zPz
         yDiZ+QNAjVw80SbuW5LPAL36Mmhpzp9z+Aoo6a4r4nMiMixQSmI7d1WY2XwBhfvR45MK
         PBdS/4bQQ1nlty8gW885q0AC4YShGQGh2SXnhIwcngs8Bz/Ckpq/ad1M5k6zv1q5v4sa
         AerlRzzFp7AdQJOGsenT8dVN6VRpfFnq0jBOBzPlQLEBhcTOjcF8aKTgpE8WYzpJowcC
         VHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788935195; x=1789539995;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z9txVF1E2CwqfuIlPlfen4d7jX6bNOZdy7o/BqDBXj4=;
        b=EhpxJ1fmcococ73CIP9JlpuXnd2WlH7eUnbrYx1p4LA+OoGx/ge0vVYk8hBrjiO6gL
         MD2lu0ncfvRZ7aM6q1Gr2uETTlXx2332bhoLFhVL7y1EUBNIa45kKm4/ZWZzzSA/T+BI
         zArtNhnOIcN6r9xCrFMwBDk9C5EjYTZ9zTvl8Qwgq0tbDHyVJJI+oUaIpTBPW2FuF8GI
         GSZhiQcXvwW2rd5sLmm29AIyHgUDMRXsdTOqaiKDGo4ACefPeLs+2NChGoyIagvGllrp
         CpvZlCLLWUJI8cd3lJTi49czMyGYkGOUvugwO4lc9XQEbtweZQiz7tWX2Zl8JsCtXcrV
         808w==
X-Forwarded-Encrypted: i=1; AKwUvBxv0Rrl5V3m9WZcuuaatVeweMX0BtqqkeN7PNA8fJYdkIj/xD7LJ5Ce4bQSgZedYiifttv4W1+4N1M8@vger.kernel.org
X-Gm-Message-State: AFuF++npNKe5sbdSTsUjmoAQCHaGJgBWz3B5sS19tDEu5L432wLzSbhy
	UncqGr3/M6LuIsW9uI+MSgkzZ+7Ulhbit8Bet6VZ/JUvY16wPKbsYxG+OWehEl9ZgDpwjjMXo6b
	zSlfYy1KGEy9LRMPpnJQGhX9vSOJbb20El9DI6mpOqtqbywYQvxxnEfGtwIMFyUu+eIpv4HwWMM
	iU9x0IMOZ37TrtRhWaGCnGqY3v7PO30CT+t1T6e+94XcTV6GM=
X-Gm-Gg: AYBFou2Oestwm/VaUYGZ4dKAzrG8rL7dBxjKEUb1W1FYqoDKYnjHqXqNunOZNgNWkkY
	QCX3JJxG0WXgcKmE252CZCeitRqtJ+fZBkJZPB6/MMr+gH6cSsGBLcZywLTqpcwT/jARPUJa2Jt
	XF0HCKZlPLHB82qRIeLT3hzZjB5LYbaSrtIBTRYKfzn0hgwXgPKsjmquQ4NA==
X-Received: by 2002:a53:ac9a:0:b0:671:b80:e8ed with SMTP id 956f58d0204a3-6710b80f5b4mr71249d50.34.1788935195181;
        Tue, 08 Sep 2026 23:26:35 -0700 (PDT)
X-Received: by 2002:a53:ac9a:0:b0:671:b80:e8ed with SMTP id
 956f58d0204a3-6710b80f5b4mr71231d50.34.1788935194710; Tue, 08 Sep 2026
 23:26:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-b4-qaif-shikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com>
 <20260907-b4-qaif-shikra-audio-v5-1-6d8ad9ba5c9f@oss.qualcomm.com> <a69c1fb4-b1cc-4ba2-81d0-7f6488536062@sirena.org.uk>
In-Reply-To: <a69c1fb4-b1cc-4ba2-81d0-7f6488536062@sirena.org.uk>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 11:56:23 +0530
X-Gm-Features: AcwNN1UG8vvPTUZsvntZ8kx4jgNLH5GSTTTzIh3U6QIOG3hHK7a5SxUyRoYHjrs
Message-ID: <CAC-tS8B2CFFZ5XvTmUpWj_FxfJvfZ1mu91xML5wABOz07aiWTw@mail.gmail.com>
Subject: Re: [PATCH v5 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding
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
X-Proofpoint-ORIG-GUID: gvo28gOLLoCI_W9LnmLMKv1wM2G8B0TE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA3MSBTYWx0ZWRfXyTQJK5z7eWK2
 gyAf9zE3eZlHvaWAVJkVpR4On6azpizCtnKALMYgdeBopgN6kI1QU1f5svMTw+wpvGoOUudKcvu
 AFmCXgY9csw5Esrr/jhcTk65a+NhA7I=
X-Proofpoint-GUID: gvo28gOLLoCI_W9LnmLMKv1wM2G8B0TE
X-Authority-Analysis: v=2.4 cv=Bo2tB4X5 c=1 sm=1 tr=0 ts=6aa0fc1c cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=CrgXKhL8gDnHMrsOWy4A:9
 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA3MSBTYWx0ZWRfX5HDUAdF3ugt5
 w2K655S4X5syZq8hO6qxjnKCm1OCPD7ZsZhfSaQoWFd79beH7CjTnLV8xBJRwiRwFZDD3j40Nmu
 F92DQonyN9vDLIQb6mjkictV9vVFcaEHgaowP0i87d3h6dpi+S4LKx2tkMnAP+/3hrBgBQMpv9p
 R9kw/M8zQOzQTsoKTpQRCDfA7TIRAvmb31TrBA9t7+LTaMSq/l9SAcPsx1KYFWy2HqALNgZzQO6
 rdoOCvFLIC46JtpNkrYNuiOpR9L8/piev6/J0T2ilQB0OHVHgNFPE3U+laGbf7YfSBOFnrQPWds
 a009Xbju3aX/Wijt277+FK5SVnvrP3Td0JdUHrvYkyvZnRAH/NZU9DGVLRbT7ina5oV0FUnLrfN
 BzbHo+hlLjaOtUOBO1jza4dDODiauVQnLkXceYKWeEc1TCUFd0jEL2dlwhEps/43BrSUdlSdJhs
 h17Qf5HkTHg9Nl1eY/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090071

On Wed, Sep 9, 2026 at 1:19=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Mon, Sep 07, 2026 at 05:39:26PM +0530, Harendra Gautam wrote:
> > Add the Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU =
DAI
> > controller used on the Shikra audio platform, together with a dt-bindin=
gs
> > header for QAIF DAI and AIF interface IDs.
>
> > +  clocks:
> > +    minItems: 5
> > +    maxItems: 9
> > +
> > +  clock-names:
> > +    description:
> > +      The first five clocks are always required. Any further entries a=
re the
> > +      per-AIF bit clocks (aif_if<N>_ibit), supplied in order starting =
from
> > +      AIF interface 0 for as many serial AIF interfaces as the board u=
ses.
> > +    minItems: 5
> > +    items:
> > +      - const: lpass_config
> > +      - const: lpass_core_axim
> > +      - const: aud_dma
> > +      - const: aud_dma_mem
> > +      - const: bus
> > +      - const: aif_if0_ibit
> > +      - const: aif_if1_ibit
> > +      - const: aif_if2_ibit
> > +      - const: aif_if3_ibit
>
> The driver doesn't request any of these clocks as optional, are they
> really optional?  Probably easier to make them all mandatory and then
> relax later if they can genuinely be optional.
Thanks for your input. Will make all these clocks mandatory in the next ver=
sion.
-Harendra
