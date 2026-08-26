Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A184F3C4552
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740685; cv=pass; b=XIqz0BX4HdJGVaPO5g6vd3GQCPXpbJN26DB5L8xLNCA+mHdtrvaSlITzcF/vqF1c1dBhrlADVqIhUt0fuxfI6asPTx9au6RpQ3wVowWbZnk6su9WLKdtp2xHPLVSWS6yc0CtPkz8uzEQLQGrJI3zgu2eLw4SUNSNMlK4cjiJH1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740685; c=relaxed/simple;
	bh=e/Lr729rJWGz+ybwYNJEv1Gw8F8Cga9cb4fE+B3gek0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jJiuPKgAu//Kf9YoeBDLelDICsDv/kC60kP1S7e2Ne8tLjaafAFxcDu6vEYLcHCzftaOmzF9QAwZ3OyJCz0Es8zacBQzqx3gqg+3fQMtEerJ0vJgCBv1gHCA3uEDYaUVcpQtPlvOtOmAKLXrOLqpLWr1mEQrtSZdQXsFgfFwp/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XMIxFJEK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UTkDceyZ; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XMIxFJEK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UTkDceyZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAHAVr122208
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Mlmuxjem4aPLL7xfct0+PRJEG19R04ojiMOoV/zU4c=; b=XMIxFJEK32OQPk/z
	l1RXhzcHK9j6Ha9Hj3X4vMewANPLELNstzY4RnhxpU9nJkFenrNSul5bFOcTdWD3
	ACQ1CIo/S0FHpTbYF2ZIbKhKxHDMBnjad4rRjM0ZtOuFpQ0k3a31hcu6u1z+VpcP
	0sJkwdngSscMpLMkbk7QfgOttHNzcjasSxF4QTh8KdCY3K5RMn28loi6E9qM+94V
	DYoCwTLFis+LoNov4b2JbmeOiVJttG62Qhu88mZMqgw45sYqRKlQ6A/8ZYQztf5B
	5DvpNAQW1EhA4vwVHiU9syfNsEIifBxvfC7GMKxXSLnsjp5JUGDO2vMnPEj4cA5Z
	/hUlYg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smx9c20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:38:01 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-836cfd56077so12167767b3.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 03:38:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787740680; cv=none;
        d=google.com; s=arc-20260327;
        b=I82XmOhUnswUeUMfJi+Hfi/ILrpz31MhtTwV2extlMUbl5/TUuKOPdaFUtTRSdXI8R
         TDV+GPGsU/kZY2YMNG/hJM8Bug/SS9QCVQKOxYKNHzvXaqTikN7w7lV/jSDgC8J/LgSY
         7T7X2v6hnwWHoww0YIsl0f/21aZc9/68CBeMmtcC2arSic7mq2SFExzfxL2xRKVyhIXA
         Xe6BcrtU1PaN1fnBh4cLkY1CReaa2wPxM6Tl4wzw+ft/TcCPSoD+h9G4bUBiUwqskYqR
         2PLNOApqxgFySg5TwqQ8XkcKRxjx7/irQn+MVAzXTBHMQ2x7lS7j/2efqARGUeFSHz4T
         PSHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+Mlmuxjem4aPLL7xfct0+PRJEG19R04ojiMOoV/zU4c=;
        fh=ks8FoELjrwH0M6Vk4EYT6I0njkgKUiQs1kAybhLXfmE=;
        b=H77Kp+wKm+u1Wr3VF8VRj8+71EAdQg5PO3FG/AMRAWMaOEDzCE3TAIDXvAGDJVBegf
         swRk2qN/HAPM5F9/8wubcjOQOmtcflNLGNokQqOG7+so+QSPKLLjPNRCeejD5g0cgDET
         4QkT1VnplKOt3DMZ1dCm80w3uTRI5uIJ7fIRh6ax5tRn86sMGTMpKU9G9Rq5Z3xe+v3g
         IYDASjbovaW5uEVawJgIDnOH0z6HCkoh/iiO1h4MjY4RdSQB4IBStm05TJhWARg1DinS
         WaHKobgf+ET+fyG2wsjY/r7rnPMI42VaZLQCTL+DTmtn0FGeMHVnYAcK+I42lS4JUGIG
         N6Pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740680; x=1788345480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Mlmuxjem4aPLL7xfct0+PRJEG19R04ojiMOoV/zU4c=;
        b=UTkDceyZqKC7cInfxQmy1WsIMpCQyUoOA4xOZBTwJn8yZJlU9ZvIqqr2xPHHE1m8/0
         OUbgZ9pW4aFsLiVGSzz2K+vmgyGh0xGG/JQHw1nJei2z11ErzJALGVr5DuLS/1qgrOaA
         1HJVOYvRfhsruG3vqvCYLqljy6+1S4aPIRZqisuuk+Ol8rem+ZgK4PWLPmb0TenEa9Nr
         Eq+g0K6uhkk8snlARMz7O/rcQuT5aGE2zYpuuO5zNfINtlEaxqyLSqJq3fb+UYvfP809
         9mH8IZy8efQJek9tWCRYad/2d8cshHh8gOofbcnvloqx08MGDt1vrfXr8UzhuGcIjmgX
         Bnlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740680; x=1788345480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Mlmuxjem4aPLL7xfct0+PRJEG19R04ojiMOoV/zU4c=;
        b=fN5HVhXqZ8ObxcxeohEyiAjnbF+71hM8fuWy7nMnA4he3EwKsSVDXrrzbe4ZAdAD5Y
         Bym8Ur9f7MQrJL0sBVnMmeeaUtBKBXAJ2AChqcIpijAm+I0+j2y7vofJpWIByH/EKX16
         /4R58j9Oc+NRx5p6gHox0EZcqEKb81m8dw/Sw8zg0IULdqEftZRApbWP8w+Ll/2HhpB7
         LqfTfxi3TujP0Jbx5F7C4UpIb3pBMK7wFZenqf+2JadrzDjbL64+WYMtYcxZ6SjvcN7+
         Rjtn6Rkib6nWCfLqqyjwadEo3h3EKHF2oK6jMoV8h3WTI3HFQhBO+0wP1q5fRZcC2PqH
         673A==
X-Forwarded-Encrypted: i=1; AHgh+Rq5THwlk139HkwLoterybkK35c0TGtW7ZY1PO976/8LHFLP1thlI94zLqjBg81eJkZETyq9LX3By6HQ@vger.kernel.org
X-Gm-Message-State: AFuF++mQlZDsA2YypmAgyQnf9uLw9si3Wp+swTQIK8jAQxiFIFUDQgK2
	eoYaILtxU30lKl06cJLUD1rlfDGAbxDJ53C6sr7IZgVXhuQ8AboWSuMmhW6XuRYTZn9PORQJrzW
	QJsjXtwHVLBvJYX47FWaSBk1HLvsdcWCfmCraGUiReU7apRioOIs3jUcpMcVWuWD1OOvv9ekl2O
	kcZ4dKJAtEOZ/AAKPv/y347HIIhprzS7Kzzbzq7cA=
X-Gm-Gg: AR+sD12Ip7wGhwkJ1Lzk/D26qZFBK/I+1U/7f2x6blfxDGBEncTdB8qiaVKp+vHGp9W
	KKs/6ALtBKH3T/c/NkFKfKenMt3olPmn6BRJWWLV+0XCj0nlgaAkxd+bNZtFfjJ5kM4ICTMTbSL
	YeRm/s24fC4Mf3s2fJhavhv7C+2lgbC5utuKF66m4ncNaEGoC+vVfKhP7AWA==
X-Received: by 2002:a05:690c:1a:b0:845:1064:5c03 with SMTP id 00721157ae682-8573fadc903mr27120697b3.23.1787740680143;
        Wed, 26 Aug 2026 03:38:00 -0700 (PDT)
X-Received: by 2002:a05:690c:1a:b0:845:1064:5c03 with SMTP id
 00721157ae682-8573fadc903mr27120457b3.23.1787740679756; Wed, 26 Aug 2026
 03:37:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-9-harendra.gautam@oss.qualcomm.com>
 <9c1dddb8-5f1b-4b7c-b810-64cbd6f7ccac@oss.qualcomm.com> <CAC-tS8Bwgqd8_dZcG50bbFCcVPX+=KMVzx=3Q_zh9dAzQiqSbw@mail.gmail.com>
 <d03353cd-90c2-4042-b7e5-2cab5bfd484a@oss.qualcomm.com>
In-Reply-To: <d03353cd-90c2-4042-b7e5-2cab5bfd484a@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 16:07:48 +0530
X-Gm-Features: AcwNN1XBYCuPhgbUzFIDpZZP4PB_1GNeNQnN5gU4WnrdKYte1HfRJE3iB1kMShw
Message-ID: <CAC-tS8CSyrxdLJ773WA2uvXry3=Gwiks1TFG4z8N7rs2d3EHKQ@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] ASoC: qcom: Add Shikra QAIF support
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8ec209 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=ykc42Gtf8Ew0kkRZKZcA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: l8CJ9JqYgF5VUNqtgOtjI7yWFrdumZkx
X-Proofpoint-ORIG-GUID: l8CJ9JqYgF5VUNqtgOtjI7yWFrdumZkx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4OCBTYWx0ZWRfX6M2wzYTDRz7d
 dpyV3kv9LCTiIVSia6oOyCTOhWIoS4QrMu1H9jQb8k8WgKWxyy6fPdmM5Bf8InMpWPh1bXOhgXg
 woH9tGDgMDnFOTtOAOJsi6rOrTuqioF4MCFEYhzjKSMn7PGv8A/biYTRb1VBXHw/x1iULhXcBv5
 bQOg33BfKgqO/nR1Xdz774WojzUujBfG/1p2HQCX0bYoU+h4u4dcPorbae6h7+IJPzvs7Elru0j
 fKRoQ9E72P6XYgpFHPqGU3GpXR7Svv1gI08PLnS4jLMQWQXeifTnp/Z01crSy+zL1iGj9kjeHhI
 mexJIcfxYf4MjCcT3JEZIePQZOyuwkJhxocHqkL/IQcZjQFMyrTS2QDuuSkNLABr3PR98Ki/lwv
 MADCyvswfQEoFoDeEYBtkCEbCIHGeQruUyCBrOscHJgEewHW0zwFAgEK19k2D1raKSKHw4aNz7z
 /ooZpm9/yUYRcZz+jHg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4OCBTYWx0ZWRfX0ykJdQPxCSd/
 I/KhWbv14FK+rA+5wOzRQHQmIdSp5RizztXuCsNtr46sPshWgnYwlcCivclQnPoDpKKdZvjHeMX
 SQuO44qikmDz2qLjqJVRzPiJFsIzo6s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260088

On Wed, Aug 26, 2026 at 3:43=E2=80=AFPM Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com> wrote:
>
> On 8/26/26 9:58 AM, Harendra Gautam wrote:
> >>> +             .id =3D QAIF_CDC_DMA_RX0,
> >>> +             .name =3D "CDC DMA RX0",
> >>> +             .playback =3D {
> >>> +                     .stream_name =3D "WCD Playback0",
> >>> +                     .formats =3D SNDRV_PCM_FMTBIT_S16,
> >>> +                     .rates =3D SNDRV_PCM_RATE_48000,
> >>> +                     .rate_min       =3D 48000,
> >>> +                     .rate_max       =3D 48000,
> >>> +                     .channels_min   =3D 1,
> >>> +                     .channels_max   =3D 2,
> >>> +             },
> >>> +             .ops    =3D &asoc_qcom_qaif_cif_dai_ops,
> >>> +     }, {
> >>> +             .id =3D QAIF_CDC_DMA_RX1,
> >>> +             .name =3D "CDC DMA RX1",
> >>> +             .playback =3D {
> >>> +                     .stream_name =3D "WCD Playback1",
> >> No dai for WCD capture (or) it's missing in this patch.
> >>
> >>
> >> Best Regards,
> >> Rafi.
> >>
> > On Shikra, capture is always through the VA Macro, irrespective of
> > whether the source is WCD AMIC or MSM DMIC and the stream_name is only
> > a descriptive identifier.
>
> WCD naming is totally incorrect w.r.t this driver, WCD is external
> codec, which can be connected to any dai. QAIF just exposes FE dais It
> should not have any codec level information either as names or any other.
> Pl remove and use the correct naming which reflect the dai name w.r.t to
> QAIF.
>
> --srini
Thanks for the suggestion. Will have consistent and correct naming in
the next version.
-Harendra
>
> > -Harendra
>
