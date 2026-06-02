Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173432F39B9
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 03:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780371178; cv=pass; b=QLhFXTctbsleZ5mTkpgAP/rlv821U4Mk4YlyjW4eIGDx/F4vhBllT3qRHpw9c2eWmaffD3hyloqC6/tw0Qsfb2FrlKBITiyfgTlc0gBoXHysJpe8q06rohInTbUhFTikweYnALOdLUB08XlKcP+04Z5U14VjRxW23d6QTNoae/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780371178; c=relaxed/simple;
	bh=JsbILUc2MqRg0Kz4TLV1RtuG+L7bJEMwjzE/zzc0pSU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ihBsnfk9DM6/n+401qo8N9bTYBS3T1Lkzgu/wUBQUK4Gn3fQk9Yw7Hy8llmS/mXXfqjzc/75vrGpCcYNp+SFrDBAnlMeWZngX+9j+9sWUwS0FYATgIC/SJYGZA0LK0Au3i9/SushaCfJiVuHievkflFXdMO+U86FhPHHT0y3VKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e2fC40qf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kjP8lJfP; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e2fC40qf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kjP8lJfP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6520MbkC4110823
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 03:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qhd5e8S16leMfeXxhwe5B5BRfJS5NsQG99cPsuJ4qCo=; b=e2fC40qfN/oKVqQM
	o7ej3cSCBXhZxXET2wYbmIg/mCJONTzq6zVu/A/6A9CTcjCVCjQHyHs4wmQQPTq4
	Clr0temfkHIHGfI2qlvO4iev91i3+dApm3u1UFKgoQJsOPBmckRs1WgDcHbVpAjt
	471Pux4Rr287bbrQ2R92D+BAELUFnpsSJwqSA/fcxd9NbZPN99i3NHVonVY8H8X/
	eZKgRdKlhlP285KKdTluvn5VXZnEKoUM7Czj3jUpNsAHWYUPzFzN7R8ABWzIskbN
	c4SkHpirwoYPWIlPA4x/3F6lVBYFBXCnl/hU2n2LMCuSWx1kuirSApf43b4Owjuz
	4sNB4A==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6s3v944-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 03:32:56 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7e9369f8d6fso1572757b3.1
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 20:32:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780371175; cv=none;
        d=google.com; s=arc-20240605;
        b=VbgZFIFMJsN5/UBVPu7VVUL0qCoH7DEjLTq9Soo4Pc3uNV+j0HjcUvEHFBx4o22ZyH
         BO1fwDEguFAHJZGxRBPUVid+MBj1JG4kF3rorsDmWXWXYngCg1Q5zD7XLHLv4gE4TiIA
         snrUKEm0LQiGKTASUTPjFJS0A7+kr2Xu0QqHMVDd3bJU4Xq19n6L+jltpsWaE7jjsce9
         URcyVSpGYrBl3VyfQDeF8des7dA/4kM0Gy094xCcMYI5guRM1BbfSz06MtzYni4vUuD7
         23eGo8ePkTFXuBdb5iqKIXg9cmO+sKVcoQuxf3ibFf/UXgzw1o7djN9CZb/+UNC8163n
         e0Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qhd5e8S16leMfeXxhwe5B5BRfJS5NsQG99cPsuJ4qCo=;
        fh=ClFxKBVlFQe9bRKI8aNbYcbJvQHlIS+EzAF2E3mLhwE=;
        b=D1SSm+yUyTtqbS0ni6bxrNEpGb8RVhucFwHpDTkJ7U7gKnvfIum5DlBTxtbK7v6ThB
         I73OPQFarIS0e6seTyU+4gnkjmhf/WpO8mLVFmf455b8EAfWPacD69U03oGBB59eJsGL
         aUezpVxMnZ1y5T8cnP8iuyRbJosWEPj1xdjGSqb71s8Hor82TcFrynW8z+bHAb+/U1I0
         MnbN+UIJ+LDvKUJxJfc+RvU/GYxUch84EQ9Aw+xeHB+ISEvdAwbyp2NhDHuEJ7WjETF4
         OlTR9dSl6rzsrrQBFbJza3x9bd3L3TnYknqs5ma9YxozZX20ID0QjKzDTvMigepPVhrl
         0Y4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780371175; x=1780975975; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhd5e8S16leMfeXxhwe5B5BRfJS5NsQG99cPsuJ4qCo=;
        b=kjP8lJfPck5u78LR4hUE9S6Y16dGZBZ1on5AgBP10266gzsjJkSUwDqHhbiv/0zewE
         9JFinlzFsOk2Jh5E61qpmJ6KjEF5QlLYgjs6GBPikuCsSVvKrDX0ksZmAprpoeVB15Wm
         GCQ2JZr53go1Tg6OqHarpWaCYJ5GJJJtzSbnZ5uFCWBDQsO5r7RlbsxowcyxeFpizxGj
         xrS3NQIyVcdYUx1ol3ftby8+ttrJLSjELTjFVouEn1TlUlwi5tU9+ap80pbbCcRgG70h
         xsPrX+KTJlvZ+8Nu06Rrg9vN2itXlqdo7swzX6+dTgAHBaqR+jfRvXbICEDx2ZKayH7e
         7eWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780371175; x=1780975975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qhd5e8S16leMfeXxhwe5B5BRfJS5NsQG99cPsuJ4qCo=;
        b=b8IhmK/qdmhpv0HqaGxc5c287RngZ7t9jK04bKElCbFFxXeiOW1GZscUKl2JCxHRNF
         L5HuVPbrPlW5ivcxrS58L7mM+kYoml+IHR9G/TLoS5PxXkMeAc7MCud99vteNWoy55XQ
         0VTsRU6zfWCzwBM6vMXz/vW5cbW7OWXZDKu4JgFeDUo0EOLgYOf3dJhQCLsI5q7//vd3
         GgY9l9hSyYjVXNnp1uCj9YWcwv3GSn0iwOrQIkHq8LNtl3ZIaVjJlCG7iru46URmdo9O
         D1Mj897XGMIucrfw6siGfkuwqnB63jFhfcX2mVrtMqlHGyFHS24xL17OyskncQuvPjRl
         C2SQ==
X-Forwarded-Encrypted: i=1; AFNElJ/RIOhjBx1G8OSUTIjUq1qGsGntb6TP3SCJB8CApfJXc4V01rilc9OEg6AKmdZdHUBTf2aFxvKiePCT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2yvC0qNGqlemIluQxHiHhYW1V9l9e5NjaBhb/0XW3xZieuqpH
	PY0pTwHGTewGE62eIzURZut4bNvaQBOegTxTG8yQgUlsbMCIPSrg8H+5ZsqYrQZgXGOoV/hBtEw
	wc95snvqRqtuuAodDY0eQxNlA8dTClGYl7p2/kK6IwckwkfZHP2rvmOPvIP+jf20E6ZYtbBWAtl
	7NKz9HB8WbUmdXicmaky6ln5T8x/s8/qD9F1Xf4UM=
X-Gm-Gg: Acq92OFBe9oqQ9HkSidrbJFtXBEIiTW7l1A1m3jgRWv52IxH9RrK12hWiQaE9+ENzR8
	DS0fjlX03Drvv+98HNEKBbKQAmAjnvOcuq3TyQipIvMJ+0k0SkwxtuLPSEVj479Q9DGXAR0Fde0
	ANidGM/FYQl4n3vRojJEjDP0Uw7uHUkt+9fs+iAu+7SNG827jZ4WcEpbhM57S3F2HE7qYf8cRTv
	1+TQ7pC8UhD/tTakw==
X-Received: by 2002:a05:690c:6202:b0:7bd:a4dc:c22a with SMTP id 00721157ae682-7e061bcfb82mr125935197b3.48.1780371175262;
        Mon, 01 Jun 2026 20:32:55 -0700 (PDT)
X-Received: by 2002:a05:690c:6202:b0:7bd:a4dc:c22a with SMTP id
 00721157ae682-7e061bcfb82mr125934967b3.48.1780371174810; Mon, 01 Jun 2026
 20:32:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260531071409.3557734-1-qian.zhang@oss.qualcomm.com>
 <vvnecdwfbpzeuo2zjk7ajkfwaay7dexjncjuuhiu5ldqlp62wp@ybhqbzzj6x2f>
 <CALC2J1MXRygj9oRwEBsSPfhLjpRZi1T=_E14vkbOkGKKTCz7cQ@mail.gmail.com> <hrqzdro3s75sf4tfphmbzswiwquflrj2krm7e4bkohn3zd27rv@mra5xbg55qqa>
In-Reply-To: <hrqzdro3s75sf4tfphmbzswiwquflrj2krm7e4bkohn3zd27rv@mra5xbg55qqa>
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 11:32:18 +0800
X-Gm-Features: AVHnY4KjD12CE3aIN2RhduaOMBHpw9ezYCdyAibcKu0AR08HXiZQUEcpI2UBAAI
Message-ID: <CALC2J1PLbuL3dpkL8jyhchREB1d1Pc0BLHzZCdEjgfitQahqNQ@mail.gmail.com>
Subject: Re: [PATCH v4] arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B
 WiFi support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=AP3YypGC c=1 sm=1 tr=0 ts=6a1e4ee8 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=IdTbGg7WZLYeGAxCe_YA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDAyOSBTYWx0ZWRfX9I/ZpvvdBabO
 MUDfkrTH51ynCsRqJBsNYx7jgxT8edb43kcV8qh2kQsH6mPmKu0pGOgPlWi4KSqewl0RwWVWCuJ
 qfGZ+GO5kFi1yMmnwLRMactDDH+QO43gPtJmpQnrezBZtxL8As/HcdlcK54pd9jMmvRmHM/sATQ
 pxYVVHg663l2O1RvSknvgoQy9KTSuh/r8cSnXtc1B1I+5lX+PZWOHF6FYJ+11wI0S4nL5jiRHDM
 ckHE+Oy2aj+sA12eUxulQa74YbYJlIK5wMuF55hfzQsTzFYv5rdwJDEf2tmiTtpuT7AquIOc4E5
 ZPhYS5frsA8WUXRv1j6zrQ4aUSa0ss8k0ZnB0lBY2eAEkJJXNnskdi2wMyeFiuiKrk0hjnMDBVV
 K/s4x9n5Td9jF+xD3/cp+oWG828Ym3bHeHxvOQlc0ArEdjTP7TVVeqduz1Izlw5vxv+bjGdPZ2R
 ziMM9Ji7bHvFfhhcCgQ==
X-Proofpoint-GUID: ID2iLYK9YK0g52nYnskZmHSi_b3vKNkB
X-Proofpoint-ORIG-GUID: ID2iLYK9YK0g52nYnskZmHSi_b3vKNkB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020029

On Mon, Jun 1, 2026 at 8:39=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Jun 01, 2026 at 07:46:49PM +0800, Qian Zhang wrote:
> > On Sun, May 31, 2026 at 5:09=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Sun, May 31, 2026 at 12:44:09PM +0530, Qian Zhang wrote:
>
> > > > +
> > > > +     wcn6855-pmu {
> > > > +             compatible =3D "qcom,wcn6855-pmu";
> > > > +
> > > > +             pinctrl-names =3D "default";
> > > > +             pinctrl-0 =3D <&wlan_en_state>;
> > > > +
> > > > +             wlan-enable-gpios =3D <&tlmm 56 GPIO_ACTIVE_HIGH>;
> > >
> > > No bt-enable-gpios?
> > BT is enabled in node uart10
> > https://lore.kernel.org/all/20260429103537.1282497-1-shuai.zhang@oss.qu=
alcomm.com/
>
> The BT is powered on by this PMU. So, if you are adding PMU, it should
> be used by the BT node too.
>
Will move bt_en from uart10 to here.

Thanks,
Qian

> > >
> > > > +
> > > > +             vddio-supply    =3D <&vdc_3v3>;
> > >
>
> --
> With best wishes
> Dmitry
