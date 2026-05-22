Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBBA3168FB
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 15:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779463866; cv=pass; b=rt+KiPB9hD5W7fdR2Pd4W/H0pvc8X8M0L6VNjYVFqfUfuv5bg+vJ36LkXvbH5tAKTbHO9Te8E1H9ypCwMNTP83iv5HPzzpwr9dkYBJOSttwsC5qYJovp7R54Vj/Sb+AqlsOC0YeC53CgUujEEE5hfGEMTWjjlTXWYFrb+nzNbTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779463866; c=relaxed/simple;
	bh=qRaoRj7Z7epM8eNtDzoPZWmrKrcuuGtXDIX1NKORdns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fWfmJ13eDwOuaJdWvFnK2L2KcTEmL4uZJSh1rkPX0G2QH9I2S2iaPZRv+tWEcGFUKLBDCI3ZNSzMxM7oTjDAleKZCIr8AAbfDj2yAb/6W7g2zKRlxKZcMBvUYUoR9jvX53D05i0wq4sYLauHbH4iEdaJ1jGQs6+rUHkcOajZasY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TGjclDmd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MjYtmLA8; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TGjclDmd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MjYtmLA8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MDpWAG2125172
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 15:31:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4SJt7uXqKxxv9L0dYj6MneQW8VsUAWyiu/ky5nnWUBU=; b=TGjclDmdB7J2z2IA
	Hb2J02Cv0PknCa472LLNSPukhwIEEcnJCjPrMxlmR540+r22FDsAv1S0WQygWt1Q
	fJNJJdRJnInjncoYu60ZFbNEqd34F0olPBkwhZ83rVLzCqO6NnmxUVvhjVUwb1V8
	f44dd9lVVQQUllnDFSWNPULNTVHe/wbVsULn19MdP5bQuVL2lutgSLTJGK0Qlx7M
	1vqPpLhf1HeJBHctPu+0wZuziWB/BywrsORyxtGgxKtTTwUHQ60jpcd+TNpthGBJ
	+gw47Oo0P90AIaiDFlIohf5NVkvK2MMgJ6tuTN8rhWrdpRPavE6EkCX0zejEnCtR
	Qj9CYA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eard88hsj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 15:31:02 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-482943bf703so5998843b6e.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 08:31:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779463862; cv=none;
        d=google.com; s=arc-20240605;
        b=OBlaZqRTlrLMudScephfersWZ3sx5oC+HW+StyRYMDA5f5WDyfkOEJh6co1Mczl3+6
         1PcnJ8JHOthODCp7VYBCVmGlt+uxlDAedvbCyUZLmmKqHChmJPtpMMCDioBTTMUPypCm
         26sKyA0Z5HsxDpSaaz/p2+ag9v/z1duqKqkBNobX/3Y6tUdvLkmi1MmoWJl7LGT4GeyQ
         FFJbXo6oGMwJ+HVtTVJQ/oe5hqIc5oDFViQ6SlTuCIA4FRlUOyjDAD4P9CbAg5TjDIWF
         vu7q4WICcjly+0jnfjb7WtBcnSpgc/sACJ7NbhiOX86VCaJJ9+r4FCae3q8PGWcHoAuD
         SZsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4SJt7uXqKxxv9L0dYj6MneQW8VsUAWyiu/ky5nnWUBU=;
        fh=Y1HQwokdgf7Ck9voVdVJqh9uqB4oNv4rrFhrQ+udEBc=;
        b=SKTLSRpyiZblCZSW/gQ6m1wLaUtc043rQyuqcazyRrDQsmfTKKI9pnF3WJZ+XzJNJp
         PwZB6ZFYDwSMopPNsQ8l69oa7At9zvmScPkba0JUMAmve4HColoe8+rluMqElCuy6/+H
         wuc+k+jZE3YEeq9VR9WWz0Kv7QxRDtzxpFOYnhcADDy9uiNaWTLwkfYb97OanaqbH3ds
         mtx4bURREToCt8VX3fVnyhDbIJwmBa6xcHSf8uuoZrELJYO4gD9zRQI7YpgfXGVtF/YU
         3pprSR5wyUCKqcYP6C4crKfLiBftMxNhJWFs2sXdVH/DHtKh+zbNctlb2E1TD1a6mgZf
         vKbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779463862; x=1780068662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SJt7uXqKxxv9L0dYj6MneQW8VsUAWyiu/ky5nnWUBU=;
        b=MjYtmLA8UHt6M4rDyk4gj4VWmGpcNh47Or8L507w6LVX72EddAK1TQOPW7uMr+GV9O
         nzSXTuIvbuv9BvjxjQFA1UoaKirFb35BlRGTvFw13FPto53wCyBUU3JRrQg64zjntIAu
         UyarBKksES2F4LJ63kJ92KXsIkfjcYfGKRWzHmqmBZ/qU70z8gJUma1MJYk0b349uhK4
         N4aV6JUsA8qpdfiLyz/7WfynnI1HJVMIn5QDB9451J5XbMFbbefv0NvWIci7/Sfa5Wx1
         6Krt5H5md8FXDuEq0wi4Gnrel0bjiqEWgJoQ7TchnwEp4Y0+5pQYcndu5QOcD0i6utSy
         T2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779463862; x=1780068662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4SJt7uXqKxxv9L0dYj6MneQW8VsUAWyiu/ky5nnWUBU=;
        b=MJ8GahEB/vhGP58q9P0de0AzFoSC7qlwcmO4QxS7elpxgHuCrQxi2+kKDZahGOGHlW
         oO6vLcpSDTLd1SOaHQ0WSBkRIH2PGpctpdHvui3wJ8lTveLNvLRWjlzGvYVnAChJZ5o5
         zeUuX8YJ9zL6mEZGbUwUdfDjTaL9Mbyu24T0WJozh3GkueBHitUKopRUINW1rGyDdpDg
         UyOUmcsxcbx7CG5nCqVO18D+4L+LU+O3JA4fYoYP3i4Vm3NRVMaoiRHWoy/2gztRSh14
         cMLDBWykInglKw4vEXQe1cH9uxTkRryy/2o7Xxw6GEiS0MNUWKM1D8jddgFB6Xm+K2iA
         AJfA==
X-Forwarded-Encrypted: i=1; AFNElJ8NjDwYSRmSMGFmOcB8uQ0g9vVT0cEp2KLpt89JuJ3ythGkEoKmkOQDNbTtkkymQlK0EnwADhboelwX@vger.kernel.org
X-Gm-Message-State: AOJu0YyN6wDJSDwAIk3EX4S9yJtqUcX4VZ5HXrbL4MycQ9PGT2tMjo+6
	8AhylLiWyrFdUffbJQ234Do3jUPBcCJD75xKwRfIp5LijFE4hrftjDHheiinSoL/CKC/PQ/Vq0m
	WRiqgndxumN7+sWOftuc/UK9awxrlFVxEwcSz5JvXpghUg5wNwSaU7rRD9LBDd3sKDyd938Y68J
	W6UyMMOuOX0r7zl46f2MrFQVb1/URRwLUlDtYEGFba5J+97/pD5w==
X-Gm-Gg: Acq92OHTUYFipC+7NSMvntqfcbskboNUsTea9A0T4UpL7lk27qunmo50Fc3m3zDyFmq
	GXcNwaTFTiPlS8gvjQuk7aZ/vdQLOJ1W6mPKScpeONpcYOf5XpTDY57wbBiwocHHGeghrAb+tVn
	bYp7ecOHTy2Gu3vgmlOLlETcimBu3kZc11ZQYDWKS/T2+OrGeKHZv6Yc5AU2DesfCqLMP4u1QmF
	iVjYrzFxZI6H7OHAG60C651f2s5/ghJfFJmmOg=
X-Received: by 2002:a05:6808:1703:b0:484:c3b5:9b0f with SMTP id 5614622812f47-4854a1810c9mr2093060b6e.23.1779463861900;
        Fri, 22 May 2026 08:31:01 -0700 (PDT)
X-Received: by 2002:a05:6808:1703:b0:484:c3b5:9b0f with SMTP id
 5614622812f47-4854a1810c9mr2093011b6e.23.1779463861165; Fri, 22 May 2026
 08:31:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522100026.94760-1-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260522100026.94760-1-srinivas.kandagatla@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 22 May 2026 17:30:48 +0200
X-Gm-Features: AVHnY4JKorVBG2q6rXdU9NlbUJ1CqApXXSCGWDNXeXL-zlZ965_vnWgLeQFHdps
Message-ID: <CAFEp6-3hxyFw8Mt67U7ayY-yUxHt78sZge4Epi7qrSHrXTSCyw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: Add Display Port audio on Arduino Monza
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Fus1OWrq c=1 sm=1 tr=0 ts=6a1076b6 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=n4whdITNsZht4FXFeO8A:9 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-ORIG-GUID: xvFKJsUA9XvClyj5zGQZDEV3gEU7f3-D
X-Proofpoint-GUID: xvFKJsUA9XvClyj5zGQZDEV3gEU7f3-D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE1NCBTYWx0ZWRfXz8kiGHgkNp8z
 4xCclMkgzfu3jVuW97bMpDOjQX4Cz1z9g++v/0vAwYguM8F72QBy9Mfd3AosziJO9meXRQZsmdo
 TR7zqLhfP5ZU1ZqdBxQOMad6PQAlqaYq7X8zRHl+KtyPd+EjDb/gY7iZCyiB7T2b2tODKNqV21Z
 ycNQA0ebA2xSad1O5stbrtfBZyXG3/V0tuFoMyePyVa7UQ5Q2i36v+dcUHyKXNjnCo5ZLqn1bh4
 Su2fIfkBGG2BBLe2bn2WEP62aWmbgzA6YQ73lJXZwIgiqeiNjKDB1tx2T2gOy2ReIxs8A+g820P
 JIZHSyz7maIh4vA900jLfG7U7evXD8rc17NnsfhRCV5F1y1MkmVaq65Xx6BqLLdQdf134ExF5lR
 XM5hFnMN1PMcL5nscuJP1rhb8heXpreWDqLZ7nOFGvfcjkPu+7xzGym/g1pVTK1dK7tFC+fU6L1
 JW6Doa3WwmQBbfAjKfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220154

On Fri, May 22, 2026 at 12:00=E2=80=AFPM Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com> wrote:
>
> Add support for Display port Audio on Arduino VENTUNO-Q board.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> CC: Loic Poulain <loic.poulain@oss.qualcomm.com>

Tested-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
> alsa tplg changes are:
>         https://github.com/linux-msm/audioreach-topology/pull/63
> Ucm changes are:
>         https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/ventuno=
-q
>
>
>  .../arm64/boot/dts/qcom/monaco-arduino-monza.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm=
64/boot/dts/qcom/monaco-arduino-monza.dts
> index ca14f0ea4dae..01acc8363cbb 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> @@ -117,6 +117,22 @@ platform {
>                                 sound-dai =3D <&q6apm>;
>                         };
>                 };
> +
> +               displayport-0-dai-link {
> +                       link-name =3D "DisplayPort0 Playback";
> +
> +                       codec {
> +                               sound-dai =3D <&mdss_dp0>;
> +                       };
> +
> +                       cpu {
> +                               sound-dai =3D <&q6apmbedai DISPLAY_PORT_R=
X_0>;
> +                       };
> +
> +                       platform {
> +                               sound-dai =3D <&q6apm>;
> +                       };
> +               };
>         };
>
>         vdc_3v3: regulator-3v3 {
> --
> 2.47.3
>
