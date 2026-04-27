Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5502DCF55
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 20:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777320554; cv=pass; b=NabQYHvZ9+o1FDjhAjXvV6PzQb8pFBUPXdx8pVD42I5YqAIXZB8BqkQ80WAfg2X9fv/XpgHjIjxkX1mW4q1Ur9KMH9/Pr/clfYbXaB2h/XXxtN9Q+9kQQtdn22W6PFTfw3gt3U3vRLDx1FJFh/Mpnr52V/emn+YG56XNkydkryE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777320554; c=relaxed/simple;
	bh=zJf6itPcif0oS4I2opQ1ZeZHwhSjUSFKoJJMf+zZal4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KgQJIj3dogfeeEpajL1TwEZhDalzxy2ZbvtdVgAX7nvvAMdV69u+Wcl/08jD67DllzjTdXzJ+GNo3S0um+n2EMKNoIK4mF1Zh54ugCVfoE0X7+hDduvNf+VKNyZHNiwWHDKhoyfvFnnlhTWsQ46tWNUOaLI2Qv7GUGEE8yIo3u0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NUwUd2Ck; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h6oetvM+; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NUwUd2Ck";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h6oetvM+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RHNt9o663183
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 20:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K2HnqUmhHcbUyD58GB7XPc0QpK+OT1yUlEKIPYYo7QQ=; b=NUwUd2Ckcp6eQcr3
	wjTRb6FPXg5tcMtTN2yu8UL2bS2zGf/Em6YqtiyEnlJj6Yk2dGodyuNgS9UGpG+B
	LjWJugW+aBMwe0xaBWSIDK6tmE0menmih1aGaTk+sUHYEEcyXsM2ffIFPaB1koEx
	sc9eBnL1YYESQltWqWn7PK/SQB/4eRg1JKVUtTplcjikjZ+YUCOpmWV6ts618dpZ
	vwG5Woiwp46nGW5yd9HXXNrYo4pRalp3n9DrMpGse+s6MHswQJ3PhfqvlZqaZ2lF
	SvaDPXUGfjXZ4GTZtAU1C4LYoH+6bSkSIctobnRf3MyrG/MXXBT6/BO3hJy//ZQg
	TcMBxA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtc5n0mxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 20:09:11 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8a5f6110cadso253119586d6.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 13:09:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777320551; cv=none;
        d=google.com; s=arc-20240605;
        b=S/FK+3VdUFV2Yt3flnwLL3uvWvMZT0gFn881lKSPQsUAUmLg4+MSAw7aZKyjaPBY1o
         jL50tOovOxOpgjhivipdkTDiNFtjp8Otpj3w/1iGrbOzg6tOC8/VFSs+/T4N6Sd5iJC4
         4f44uQl+DbXJMUgFAvjLwVpQTcL1h3VIIWrznbZuWQKjB0buRWhVnQ4BN1XCBQzy8YvO
         PPQf5XIbmR3+9PZWW+zmLq5UB9zZ1HNIdghbNY9mMfvQeLdhIHdWJeBt9J6bbOPrGfxP
         ErH7BQMpdn3gQgZ+RsOqZYLIriZk6hyMqIjxWes5yzozD/V17WuPbORxGqVk/7rC5OvD
         eIWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K2HnqUmhHcbUyD58GB7XPc0QpK+OT1yUlEKIPYYo7QQ=;
        fh=qoT8Va+yw2Q8ALzA56MILbvAdadH8Kv9nagpxuM5mms=;
        b=Tx8Ue0vZIVOTKrzVvqueEJgb9dg5B0FmKtgT2gkXwbH31LIzO6OgBRRHZA2p4lfAQg
         209Osn3QeBsbmz1vkz+ly+AejE2D0Uo3mb3AORDOJnGxbuky7bf0djGD6Gs9ZlPe1nou
         X7QcY9E+tM66tRwYyYhjoN2wMKNnaaJs2TdTT4H75XkNyb6hJGg+SAV2aQDYzHFBshDd
         4MYevoUrp2p12VI2B1Odl5hSafYHHxFPLK+o2qG4hQibfrb4SWHvqeb8eFvYRXhof6Pp
         CqAiwi2mzVhgthgSEZSNg5v9avgJ+AQiO6snTIW5JQi+M3noJB7oNmmxRcab+iaA3EDv
         zR7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777320551; x=1777925351; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2HnqUmhHcbUyD58GB7XPc0QpK+OT1yUlEKIPYYo7QQ=;
        b=h6oetvM+pp9+S/xwnBzKR1jBNK7mGsrYc6Q0nhBAptd80K68zcVo9VLIjf06ZSjQxk
         QsozJwDRg3jB2M6AHbPU7+BIRnyPaUwH2KISec4BIbHY4eMRGOiQUFtmLCSoV9/8ktzn
         4IKrwBP5LxnWtI3pXHwVsuniSqBoD0X05odQBUFVJNUns4Ksk/ICyJFpZJ2oqAbvVkwS
         bVdFUGAyz6wpp/fhWen2He7Fw1n8HiRrb1wDWIXHZKXZrS2iyNmsH1xea4JtJq/dZyz+
         PRRp8DhXFUzIhRxWKQX3/bf25scYX4587NolzEKHuzO71ehHdIpWrORUb8G6T7hP8Ho7
         fOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777320551; x=1777925351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K2HnqUmhHcbUyD58GB7XPc0QpK+OT1yUlEKIPYYo7QQ=;
        b=CQ7gzObQlUAwX5ZFmNXhw3aK6Fek85xoXArkgLGr/kbXlmSQqrwFBAZkG1oVIkKQy+
         bEt/wUkIVIEbQreUrA19HMkerKp7yMHaekhicbsrcJzHPPekTYZEeIm8JVN+D/EIDP/b
         Xg1addlMbOxJ0twPqLpTIj/xyNhTpNokZKwweOqTH02vFj+Mv+tk+2BWde/Ty7iamSxl
         xhJtKLOY9Uf+XV/4idiZD/xAtDJZ2NLwqAEJe82z5JvZv+TfHjGN6ICVRgt5S5GU3YCn
         NXyQX/B26qM8hjcx1VRzRYxy9cG04Z9NyAGVACZBm+ps5Ud5OylPtW7v1nOWXJFws8aT
         0nyw==
X-Forwarded-Encrypted: i=1; AFNElJ8jixx0n+5NrnJ2Jj8GqdQKnUxAO3MFCAMWRNtFSpDsnCuyz83NcbIqM/IeXiizd0T0UNvuyDEXC4BS@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5ljqoXgFiKuSblHhCz/OEzsRz690FJNnPMqtGwdwQAl+pW+n4
	j3OmlOPgvnDB3nmgwdOk/ZlwMthnfAQdNy2YYGRLHsMmXewp/0R1ZSQs52Rl5eppkKfE1NTvdxG
	3sMNodWA8LfOVxDBp5gCrl0PxbmkVhsMC4/2EnI0RBatBq4NJ3IMatYduaZ7hMSyFbyiRzIO5wv
	kmhlNRhj9QV7vCNVfQPyFky8A7OeB771RxF5uPIhQ=
X-Gm-Gg: AeBDieuRcC7B5Rkd63O0t+EKFoU/MzKFksGV/YcsOFXc7OxWrHVMEHu03CY8M+iYtcw
	/ZqTiSyVORboF+q+n44lgM6FARPrVdIGZRdgNJbefthHb7oNK3xVWSMrNbxfPUX0eVCySrIPYNl
	OeUEwr3kWOcWMlDD/eRlhfHh2/ukomTl0pYt74bEgjpt8eS55sQKU/vyO+GmCZECzWM7muNAjQ+
	cK539piWdo9o6QBoGfURDsTYZJqYcNYnaVBdR0SMt3EoHgZt2Q=
X-Received: by 2002:ad4:5e8b:0:b0:8ac:b619:5ec3 with SMTP id 6a1803df08f44-8b3e31fca48mr5277946d6.50.1777320551061;
        Mon, 27 Apr 2026 13:09:11 -0700 (PDT)
X-Received: by 2002:ad4:5e8b:0:b0:8ac:b619:5ec3 with SMTP id
 6a1803df08f44-8b3e31fca48mr5277336d6.50.1777320550568; Mon, 27 Apr 2026
 13:09:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-12-f430e7485009@oss.qualcomm.com> <3e72d17c-e46c-42d3-9b17-54627f6e5e28@oss.qualcomm.com>
In-Reply-To: <3e72d17c-e46c-42d3-9b17-54627f6e5e28@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 22:08:59 +0200
X-Gm-Features: AVHnY4KEu3qZJsaEgSW3oDVV1djoe7ePu-gt-mc0PBpeJhQ4prv1LHNjDVdgtGI
Message-ID: <CAFEp6-20MzQh55iJzyhn=htFZxN1yq9o+EJJAX0CWG3O6_KSyA@mail.gmail.com>
Subject: Re: [PATCH v2 12/14] media: uapi: Add CAMSS ISP configuration definition
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIxNCBTYWx0ZWRfX/9EnYYjorC69
 pE3mAx0gs7X9SZeIBq2Qn4QS3g4MldoPN8vVO3uNYHJkjRmIa9uInzu1G4I8XotQe5lJG31udAs
 BsQfVF4YD43BAm7ykOt0U6EHAnnn0S1YX6ZxutwXl1l9m+J9ztGIbrfL0NtXr2XAlmHNT/F+x9w
 PaIh+omonjYXqeg5OFmxkjhZkEioF+mymTw44v+QjiJy9HyYkL92d0SC65rZf+RcS1sarz55aaX
 NLsa1nGYJbRDNKt4C8EzyszlvMiUsu3OnC8RA1XMCW+tuycPSr6vh+I1qieEbx0KZ2MaVUIKlca
 R7dWoX3CpDi2K+D01mPearCLNPD5fSt2OmoGAf6ev9NFPH50Iv4A0gSmmBenkWYJ4N65a1S3GjA
 21FFIwprMkEy23qF/dvXVgezyr95TJ9xZkpBUrGB4fZsZQWKpOec4p3nrHQ0fgkWzvXqGDWzJyC
 6HXTVqP+8mh+ZCVU46Q==
X-Proofpoint-GUID: _Mbl9oFvlJNkgXxySqy9fTZIun1zaFic
X-Proofpoint-ORIG-GUID: _Mbl9oFvlJNkgXxySqy9fTZIun1zaFic
X-Authority-Analysis: v=2.4 cv=ZMfnX37b c=1 sm=1 tr=0 ts=69efc267 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=NNFLuuOXt9NZh06aAH4A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270214

On Mon, Apr 27, 2026 at 2:56=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/27/26 2:43 PM, Loic Poulain wrote:
> > Add the uapi header camss-config.h defining the ISP parameter
> > structures used by the CAMSS Offline Processing Engine (OPE) driver.
> > This includes structures for white balance, chroma enhancement and
> > color correction configuration.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
>
> [...]
>
>
> > +/**
> > + * struct camss_params_wb_gain - White Balance gains
> > + *
> > + * @header:   generic block header; @header.type =3D CAMSS_PARAMS_WB_G=
AIN
> > + * @g_gain:   green channel gain (15uQ10)
> > + * @b_gain:   blue channel gain (15uQ10)
> > + * @r_gain:   red channel gain (15uQ10)
> > + */
> > +struct camss_params_wb_gain {
> > +     struct v4l2_isp_params_block_header header;
> > +     __u16 g_gain;
> > +     __u16 b_gain;
> > +     __u16 r_gain;
> > +     __u16 _pad;
> > +} __attribute__((aligned(8)));
>
> Should this be __le for all of the related types?

At the moment, this is purely a UAPI, the values are not dumped
directly to hardware as-is. Instead, each field is translated into one
or more register writes, with the appropriate math, masking and
shifting applied. Adding explicit endianness in the definition would
therefore require special handling on both user and kernel side
(to_le16, from_le16).

On the other side, there are scenarios, such as platforms that rely on
ICP (firmware-driven processing), where we may want to forward these
structures directly within an HFI packet to the ICP MCU. In that
context, explicitly defining the endianness could make some sense...

Regards,
Loic
