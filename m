Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795002759;
	b=vb7BIdG3KyCm3NPhB0gkqRFBy2LknJTKhO3kWzxpQIvhUx3mG9gCB7x7QkV9vg1BEhth
	 U7ZQa24TnKMn4Nt+/oXOrWKznkq315zoBrou9HxpsNul4qTiZ2bg5IAcqBzj3Kxy3aOEV
	 a7og7wWdhOqoBkEnpq/5tzZTWOMXf7FN7Z1Nlg63+n9P936wj8TkIPjOd8bAH8+u1+uQw
	 AawqZUmnPBd49E7C68/558TABFl81jrEgioeJicJttYpMKnUvU74dhO6UfnZoZYeJdeVL
	 8Z2QJ3qu0Lk3WkFjsZlACT+LppQujrWSRIt+qF1rVmH7isHR+ZzoBg/3uv0VFAR6S0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002759;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=krV8GvyuUXP4zLoajbK1qiTB7b6dk0x+CpSWdoAXD7c=;
	b=Ez82McZxNdR4ODwHceXBgxTcyzn7cmBMDturmRca5bdT94n/xoLwmLpjyLGqHzUtLYBZ
	 K52gIQ/RXXY3Aq/r7SUcOZiaYmfKnTv0mKmhMndOn486C/k+pSXMNjsnxEj4cxBKymhMb
	 B7XP1VonT6Iz8pcAf7a+ghrJYrdSRkBTrrWMaGuahzPVF0ZYI8xaE86pSujdPSeu1Hjv2
	 Hd0qk7yhDGSj2+Euy3flQr3O4+HYp6TzlzR0zpn7QSdjLe6lL/kXD6ZxoENPJ3PZU8msF
	 5xcRCoo1RtL6ooUd/KNVKmFhMbRZmDv/JdqzBSeUB3mJko0aEFvb2G6cFGBnNz7tcvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="RhVRkjk/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kY38V42X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50A5606A320
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 11:52:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B50A5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RhVRkjk/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kY38V42X
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIBkf032003475
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 11:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	krV8GvyuUXP4zLoajbK1qiTB7b6dk0x+CpSWdoAXD7c=; b=RhVRkjk/yo2LJeGc
	YGPikUMNkstbY0Y6YCCZvIDpUP6Q5NoU2K67MCAUvISTeJ/iSWiuFTfQsaVwV5Sr
	hBBvLr69HirHz7qzgDTOMxL+PQA7POaN6n4ocweh+taAYVH4dRn0LKh2bhOW/fDc
	uQtFW3S9tkzQZQZQ1YUD/0sT+w1ILy9v2hgVUFwNq0V7fdvCUeNQz8ltpYpj9pZV
	LORnE1ujmGGseIxoDeBW1jClWzffPoUaHltuy3JiQADweYYm0AlxveEMxH4ZlZmW
	ROQtx023bszzSMMHJ72c6rQz/niMDCVsojZp9DobXA66So20Noq4UIfvhFOFp+fu
	e8iIEA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvbauks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 11:52:37 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso1007521a12.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:52:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795002757; cv=none;
        d=google.com; s=arc-20260327;
        b=I15Sz3mHsIdFiJilsAnPsp+29SSauWiqVFs5XIRPzYMYOjZ+F/xum9YcAIXbmHocTA
         Otwx6Jxxw7Mkw/RkkC2TQwh7zBBhTTkCRFeHJM2aBY76mvhrI/Z76EzfGb75uv7IzBt2
         EIvYh5GqYN0dm+uVq738+8FcMK2gEhT3P0mOMeCEPPXQICWykUYyzJYl3EEp53en2uAd
         RmHHj/tGvPhHEjfWFj6c35dIzw4DnWGslNCWe1MO8ncEnBKIGKUNd2Uhvfjslr8sv2fy
         lITWdZW2i6j/zm+9a53DBwytu7vdiuoKfYOUXwuUJNBKFBB2EbFfbLfCYbV6HHTm6eF7
         LCiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=krV8GvyuUXP4zLoajbK1qiTB7b6dk0x+CpSWdoAXD7c=;
        fh=3pqtPYqCIgpyoGLL2pkn61fgVzuq+bnRcr29DFKbpk4=;
        b=PGwn5NWS2Ehy0rafTSLb9Z9WybmBStXeKVHlbaT8MCI5+jtRKhhV2EXWj2Xz3zb7+Z
         jLuNyw++ylLd7XcfVb0amjgb3zBZ/q0+zJRqtD5pdNLe22b274mXFuu7JOgKNUeoyNea
         oY1EV94Ebkhw6A4NTwem8wJdY5sqBYvG5h+ilhoiBdKsIncMWTQq1z335le0rHLSqY43
         OTkiUZNXbW8suOKRv9JKT4//D/XoPsFJ5llSDhUIAx4zDMS5JAsukxU6rBLh7FPXZbwq
         uMp3opPB+Qbq70nUCX+SFzkoheekqQ4TdBd8ra2NQHtm8IcAfdQd8R3+XF2EhFSF9mUx
         NMjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795002757; x=1795607557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=krV8GvyuUXP4zLoajbK1qiTB7b6dk0x+CpSWdoAXD7c=;
        b=kY38V42XwzNikW1SF7HjjpYMHD5FfGZXpySf37tXm7tmnOuAy/307Z83U5Laq5ax38
         eiXP9UOqQlqr7OyxoC84eK7C0uxcAR9PvPXN+1N255Smus/AEhgbkImAUreqGBvbe95a
         rM9y78vyIG/AHxEUWXoJAByGl1Q7/1UXUe09aHWovnAtbnymxCN9Ux4O4Tm/VF9B5Ybc
         +pXx4yB2SEqgKxoBteeFRdsAp1lBgVY/TvAjJobPCPnPpJKDHpG7zIbbBP3AwDHsESK9
         2D0TW6oACjSQE/T+dvLuM0cs8uDgJecefp9f7U5kmW5b0dd2NUf89c4MPTfLTRmqK+kp
         E1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795002757; x=1795607557;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=krV8GvyuUXP4zLoajbK1qiTB7b6dk0x+CpSWdoAXD7c=;
        b=b7VxcHgCYYtZV2VEuKelrx7OoNilT2G/sMIPHriiStMZekRMKU2GOKGUkZ0vWto6lr
         THNoHFhAsTv9UU8jS11zDH4dtKVLXL5+JJ+IVynXCIW4DzvAVaD5uPUqy4DBiPZjjAzk
         dTcSEQ/VaR7nGxfwWDXBGF8yax+10ZIJp+3X4634ENeRDUs9ahCdm7TUxjxsduTVnEFo
         jW4DxUnEKFILVXtXwtd1SQsmP8seip9ZdY9JrUy4FGKYsUmg5waqfV/Q/Bx4s0sVujp9
         PVXuGIgDnHkccrxp7aQbpM086mIr5BPW3W9ZSoMXxGdO7tjmbMzPgwPzmBZbn64Zj/Gw
         HIUw==
X-Forwarded-Encrypted: i=1; AL+hErFu/ZWxSCx2rVtgpNBb89KAeVVSAhDqMGDz3DOOjUHvdteZj6KGjfW8MoCkEPPPQzSg82uGwCERGuCT@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ewn3rCsdlv7gLOcP6uzWG/xnqVZ6vMDfsDceM78EvO8ECoh80
	MfpiN0EYpI2FLJ+bozluWOqKz4ARetaMXdKDUBo3SQ9K9U0Fvnl539HHr2R1EAtgBBPaL1btnRy
	/9Sqjy6INxrxuDS4xQDWFwmwNW4El9+FmxpuuXjPNPjrxcrhY/hNCSRa9TSFmZ1J50D5i5OxRml
	T4oK98U1VN81QneUTkWIe66eiRTrCGqdqa5WPkKEY=
X-Gm-Gg: AYBFou360FQ4zokY3KbuSd/H0j2X8ODOvFRkMnEX0uBneLoFgEgz3bGm1f/UMavUIM6
	8hF3bsFN7r1unXoz5iUy1Oom2LrW0K+id8KAZJyDxW5jKhwungX27hdZu9Gkcmjebxht99ZKHsd
	wP2zSd0fiDbb8AQcJ6TiMUhKo4jgtVZIb5QIlSHtcJENV9nQLEZ+BX83aDOrQ=
X-Received: by 2002:a05:6a21:7784:b0:3ed:bdfd:23a8 with SMTP id adf61e73a8af0-3fe8b0fd138mr2284399637.61.1795002757167;
        Wed, 18 Nov 2026 03:52:37 -0800 (PST)
X-Received: by 2002:a05:6a21:7784:b0:3ed:bdfd:23a8 with SMTP id
 adf61e73a8af0-3fe8b0fd138mr2284369637.61.1795002756683; Wed, 18 Nov 2026
 03:52:36 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
 <20261001052243.3042627-8-mayuresh.chitale@oss.qualcomm.com> <20261110042920.2108205-1-leo.liang@sifive.com>
In-Reply-To: <20261110042920.2108205-1-leo.liang@sifive.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 17:22:25 +0530
X-Gm-Features: AclHuK8gGyKNzxG61XNU0OfhAW45im2YjqVMYzhmxWa7gPFxF1N6yrBDS1NwRIQ
Message-ID: <CAHuiULCcenE-489qnfepHO0dEf4HihzgiHSD-SgYQQd3vVoyhQ@mail.gmail.com>
Subject: Re: [PATCH v6 07/14] gtrace: Add function to copy into perf AUX buffer
To: Leo Yu-Chi Liang <leo.liang@sifive.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zane Leung <liangzhen@linux.spacemit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: _nCyyytUqOXixBKCfX5NuYIdWWjRjWtl
X-Proofpoint-ORIG-GUID: _nCyyytUqOXixBKCfX5NuYIdWWjRjWtl
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd9185 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pFyQfRViAAAA:8 a=Vcmy69C8LHsApJ-CToYA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0NyBTYWx0ZWRfX2jXosQM4jAVf
 XnfeRGVK0MJz96q765ZgFw+CzaPZEL/iG21aWsjkNTjQaNYTETGZQylbPE1f3YZ8Iw85vxeV5tn
 x/Wt745TQfabBy/M2tTB5lS0PwFlCMs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0NyBTYWx0ZWRfX9FTslbMbRJCp
 7Ka71oK2xhTEXZpxXMZrG+i1ws5HNKPIjT8AHbqf8eC6AEcY+rYsRXEm9E4JxQ4vVaOzSjGQKAg
 PSLQ12xYpSB1n9ajREwkrGxvxSEuG1IBSoYxMx3WUzoSw9YcO9tUT/vmeSROhENma4IqYqvalg9
 f73gu284bI5Nxo+NS+NhW8nOh61xnMutMGUB24RThEW9bKasKnB2doHixj7NZe75mVIRpBb3cUf
 O49tFWEpSzXPezFdUUVViLWbAkuyIpiUQ3rOP4EXTRgnl9o5XAKUG2os46Y0wDWNPR43gJ5ZyPo
 GT7PvtWgzKHZZzfZ4jfbRcRCTJJoH/NLnWyR6j4mRL14oJaQA0ylBzGNVVBvjvAW7vpGw1dI49B
 3ZeVtM/3DNcxdmkSm6gkrYg3nn7Eu4SrQuxWOaaiE/XyJsAkkWBsa+4TadJJ80eNbentyqLgn4A
 Dt3Tbb+x/IPE/wGDJeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180047

Hi Leo,

On Tue, Nov 10, 2026 at 9:59=E2=80=AFAM Leo Yu-Chi Liang <leo.liang@sifive.=
com> wrote:
>
> Hi Mayuresh,
>
> On 10/1/2026 1:22 PM, Mayuresh Chitale wrote:
> > +     list_for_each_entry(node, &path->comp_list, head) {
> > +             comp =3D node->comp;
> > +             gtdrv =3D to_gtrace_driver(comp->dev.driver);
> > +             if (!gtdrv || !gtdrv->copyto_auxbuf)
> > +                     continue;
> > +
> > +             *bytes_copied =3D gtdrv->copyto_auxbuf(comp, buf, format)=
;
> > +             ret =3D 0;
> > +             break;
> > +     }
>
> This calls copyto_auxbuf() of the first component in the path that
> implements it, which assumes only sinks implement it. On Eswin/EIC7700
> pre-ratified trace hardware the encoder and funnel each have an embedded
> system memory sink. Whether a component is the sink depends on the
> topology: an encoder connected to a funnel is not the sink, but an
> encoder with no output connection is. In the first case the data would
> be copied from the encoder rather than from the funnel, and under the
> funnel's lock (the same lock mismatch sashiko pointed out).
>
Ok. I will update in v7.
> Only the sink holds the path's trace data, so could this just call the
> sink's callback?ie
>
>         struct gtrace_component *comp =3D gtrace_path_sink(path);
>         ...
>         gtdrv =3D to_gtrace_driver(comp->dev.driver);
>         if (gtdrv && gtdrv->copyto_auxbuf) {
>                 *bytes_copied =3D gtdrv->copyto_auxbuf(comp, buf, format)=
;
>                 ret =3D 0;
>         }
>
> Thanks,
> Leo
