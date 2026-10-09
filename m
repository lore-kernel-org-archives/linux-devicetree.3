Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042BC4E7807
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 14:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791557013; cv=pass; b=EpB3wbWTo4HkqM8VZzEC4E3XfgEkXelslIIYbgm5AEIMkm0pgWaeItrGVA8tR4K5R3i1I+WMym35NWMQ78tjXfJ89mMbnRjk1mvLeWqBs4ARMbMYkewBYN0kmqzjXjnXzsM4cuC8XmaacctlBL2r3olk7hBGCghMadWX2x5zjEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791557013; c=relaxed/simple;
	bh=5U7XqM0iYXBdDlJihKxhkWeps6uHFjeVxdyfKfJZthQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A0z5aBSGO3ymKs7EQ4heDnSWj6zmbOrEpw7Irba0dHUIACPXsYeCNx0j3Z5A+BHMUOHZ4PUM9EScfm9fyhOtYPXteQmpW0XiiYm1iXh7Mv6O9Tchv23Q7SMQ55ZCp1fcTpB/+OJlWFhwoQ4VMGCI+QiuAx+A6WoGDuOWWWWZ1yk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OucXmOv8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ciw6hc9e; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OucXmOv8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ciw6hc9e"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DKYqE1061078
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 14:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MFR2AOl4yda5AptAjwSQat1eKBRcF12cEmBSADWeyns=; b=OucXmOv8QLOr2EQt
	RI+eChZ5BICG4gv1ayGqO7u8MoiGZTMrZgMQ6JYdSwkUl+pkidf1YD2NGfYKhgNX
	egvb1RRlmAIGyoc2U9vUnXrOlYrRy2wHBtSi3zdo2rJ2RzzOFQyeee8EFAeUgss0
	tOe0vjrletI0qD7TPDccY4BfYYsorOtfdC524/xN919n3Iy6FpyQ3JXbscviIiEN
	lk0QtWtE575fJRD8XtywnfK0SUxxgqG78GtP2cv3vBHQx6YLfLtA5rFoQXkljXVX
	CLNZ1C1i3qJSthYN6CXIMd4IbbB3pCNrwpbfo2GceUEPA84JEvxMKUvxsD7s5awB
	bfR5Qw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxk41pa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 14:43:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c26012cd0so121020401cf.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 07:43:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791557009; cv=none;
        d=google.com; s=arc-20260327;
        b=ZsLXwDVn/xteB+cH5CWx4C6oUDUUa9pvP+ezKlYm40gJI6jrM4fvagbefsKZjx4fOj
         uxFC0wTx//lWko2T/nP+AGBdaaIE8T8Il/yxQaDJGIPTPlZPzP8DsZ9ZBU25iHiICRDl
         7SWdwCIQSbqjqD449ZMVqrSp7Sk+2ZIs2BZ6bUgTn/nS31fqsUhdbPGg9z8scnsHOdR+
         3iLyoOCAzD0bZ0GuspryhGm/qxqyxWhJBhI4Yb8ogybPaEzk4UBfFDCDIq1hmDAQceKk
         VrCsDDmlZqFNQA4jcItjxaZwCN1SCsvYhG/dFd6zR7GbejSzotUruOCZsCLXMYNXOe6V
         QyWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MFR2AOl4yda5AptAjwSQat1eKBRcF12cEmBSADWeyns=;
        fh=1ysOA2g5L2CVpyTUK7w6drJp35Ps6hlWb1YaumMSW1c=;
        b=X8mIpIzqZhcVz1DX9vr2B6Osfzl5qpHCK4IX1TjCB4VS6ZM1NS7/zc5DovAPUb5BKG
         ZIrKkJsJ01EU7FfiLQ0CPiaxv/8tFZV1AH6S6J4Q8NrffgprfX0hLFEEZNmlmVU53b7n
         m9XvCQtjub8VDI5mQrDuaeHGtBjyIfPuVoS4w1W7HXT/T649xuJnemJlDaT8qZss53di
         ALwVbfdFH8+u9WuHUpBmd/L/Xh1h+50n3rD/6muIyj/sD4RY+aIgdxz8DZZsbPk1jyJv
         ueZPNkKtj4esZJBxWWCo0aCMqZGvgBY+WTaopi6OiM/J4bFph5BQ9URJiJjvFNk0rty7
         6gww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791557009; x=1792161809; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MFR2AOl4yda5AptAjwSQat1eKBRcF12cEmBSADWeyns=;
        b=Ciw6hc9e7jVP0tV0wOENeAOL6tPpqiFEusceiMCB+mzZ7eiWkPxY0ngaqdTJr0vLms
         yFTPsEVRF0ksygC0a1PJRQr3GhIjMfFzOKi7y/TVwyrp2xPn8/JKKuuLawYZxe7EVCtJ
         4zScA9aWavjyImUGDod3Rw0pWACJC1vmOa9+mWDddDpoaxrQwH0ZM5PZKUZFtY5wIb4O
         f5srld3UFdKH2zFgyH3A1PyPfJJw0lMqwtEKTzulcUGK07EvT7AJfp9VC7NCJJrVyziv
         iZ4cZfX0wF3qZa4qxBb7RICPJFC8buqc85a1Dgz1vHD5lkqOWPG7RLu1a41PwHnPMJAZ
         3SFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791557009; x=1792161809;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MFR2AOl4yda5AptAjwSQat1eKBRcF12cEmBSADWeyns=;
        b=Gj6XhFCvge8u+dd9LfzIeHuue1Yd2XDPyjLsU7W3ciJxQLFEzWZnMM3loaoggN9vxC
         Ubc+Do7+2LpvbctPRJGYq8KPcuhDTE/B9qCHJge/YBVGgRtx+dxElK1EJUBwqlhtAg8W
         8Djw6FreB8YjnqKVoJVFwUn1J05xu/gYJlf2qZvYVLYD0lDV1Wi5pQXvO5G+epC5dkj5
         QJoomu8eFhCjOHUSL1A9GsGRbJ0l6ISJnPqdj/lblaE6pwHC5ylJ93I//pSELGqAgfHC
         9VOXrT09wNQDI7n0G9Q9rTf1is5+Mpm1Eb6K6ad3Emogp/Q8NnWadbhjni8N7HWkABWz
         AtFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSX2TCOEsy23t7wO23AvwKOLuTywjjyc7ZKB5zceKA3qxTJB7HQWXzQ8FkjafqNdaLYyf0wfdHaGqu@vger.kernel.org
X-Gm-Message-State: AFuF++nJorbVcs9fIbyB0dftlZUQ/GQQFuO1Nl9jQYWOVP/a7dW6zW6j
	al5H/7Jchx6//EnAvmsk6n6tsq9mZOmPS3Jm+JXioDEGknngBQXooPMhFNm9D/XTyYEfM7Rlnoq
	5L24t8fC+XE+HHzK9DsV4jGf6NlNnUEnlHd5Lat6aBElwNAMgXQ9ejx/jwLTfJ/1x5tAMA2qvSR
	yg3d1bCkUfC1pKxGxY9mYx/6lI/lwl8sJToZSsjyA=
X-Gm-Gg: AYBFou0WONepPhqxxKMwxkLMY1Fl8FJA1OoUAxd61pjhHNjDhS5KPQEf4tWp+3DXT4i
	Ho3/ctpGww/92Yy6de8CkuLzOk9d3A7RsMlnEKfRw7rGySgM9qjzuTYchTzx7hQCdFdme4obGsW
	ux7P1ND6qERckEB5jsCS5+RpzdlLl26CUdm8ZBpnWgAWtOMwtjB+1ay2c=
X-Received: by 2002:a05:622a:2517:b0:533:73b3:ab37 with SMTP id d75a77b69052e-5359facd277mr32614041cf.21.1791557008993;
        Fri, 09 Oct 2026 07:43:28 -0700 (PDT)
X-Received: by 2002:a05:622a:2517:b0:533:73b3:ab37 with SMTP id
 d75a77b69052e-5359facd277mr32613541cf.21.1791557008361; Fri, 09 Oct 2026
 07:43:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
 <20261005-rpmi-tee-service-grp-dev-v2-7-72f222e23ec1@oss.qualcomm.com>
 <CAGgiveU+8d-MmPL4n_ADimkrthsE1sU4QHJoBeh==sxLZmdrFw@mail.gmail.com> <f9e91a7d-1628-4746-b2e7-03c7b1be11cc@oss.qualcomm.com>
In-Reply-To: <f9e91a7d-1628-4746-b2e7-03c7b1be11cc@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 16:43:17 +0200
X-Gm-Features: AclHuK-iwpXhKCW1lDKHLFQjYfiUaQQVp7wnVNfe_r5bhgAvlRHOCGBGjBCgB9Y
Message-ID: <CAGgiveU0DcUYW-EF-hneNqeQOkk9OTwcvzhgUvFB4JJOGSiwkg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 7/8] tee: optee: bind RPMI services and negotiate
 backend capabilities
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=fKesTpae c=1 sm=1 tr=0 ts=6ac8fd92 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=9OYd7h5rvP6jySxxyU8A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 4HpnG5VNfbSimo_48Iyy3kEkMeMn8J68
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1OCBTYWx0ZWRfX2SUZX6OOn8Q/
 feAODPnxrLkA+qm9uS/dpLxMYamPowDv0hmlyukwpFWmgs4QPLbcQDGMNF3fID96OmFBQ4gdcp2
 wmZEjRhOdyRkPGYcWG1lZtCOiJ5XtNY=
X-Proofpoint-ORIG-GUID: 4HpnG5VNfbSimo_48Iyy3kEkMeMn8J68
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1OCBTYWx0ZWRfXx+B6fTCMTjBN
 PLnuMUvvbMFm2KbMU7XP6OWRVkCORpLFjtD/HwR9zg6TdYlAO161HtJDouePOfJpd4anRx25EdO
 MDa+y02euzbDu/zahWzB6F061ZmVxJ/8HBfoedgcoxKGQkmSKFHFbrlSCJhSAz4RJ3NWTKraMAB
 RV9D4xeBjEyzQeM+t25rmwasoiyscamExKzsRjc7SNL698sUzTjLOKZRhMwADGsq3FS49L8G9Qn
 KadUzoulDcR3Rv6Rfzu74RgGjhYPe8p3IkpfKqTtBxo+VEBnfVRKYOBZPZzhrRt0iLIHqLHdD35
 TNsYpcZHnDONEx6aZOVjCpXPiCvlrXHGpMPJ+cR/IzO55uDCObLQUrS9iUvNCTpdJ7wNto2f8fs
 UlXtE8Mh7k0v3Sr0FnaQYF/Jp9tWTpaRW2RhZARQurfuoi2WtOueSwVHxtU3Ipf4Pz/2hnejaD0
 9anyPVVP+/4D3BqkwVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090058

Hi Amir,

On Fri, Oct 9, 2026 at 1:10=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> Hi jens,
>
> On 10/8/2026 7:20 PM, Jens Wiklander wrote:
> > Hi Amir,
> >
> > On Tue, Oct 6, 2026 at 2:40=E2=80=AFAM Amirreza Zarrabi
> > <amirreza.zarrabi@oss.qualcomm.com> wrote:
> >>
> >> Register an RPMI service driver matching the OP-TEE service UUID and
> >> integrate it with OP-TEE module initialization and removal.
> >>
> >> Check the service API version, query the trusted OS revision, and
> >> obtain the RPC parameter and logical notification counts. Initialize
> >> shared-memory tracking, the call queue, supplicant state and internal
> >> context before publishing the client and supplicant TEE devices.
> >>
> >> Connect the RPMI backend to the common OP-TEE operations and enumerate
> >> trusted application devices. Enable in-kernel RPMB routing when the
> >> RPMB subsystem is reachable.
> >>
> >> Add removal and probe failure cleanup for the backend resources.
> >>
> >> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> >> ---
[snip]
> >> +
> >> +/* Query and store secure-world capabilities and buffer limits. */
> >> +static int optee_rpmi_exchange_caps(struct optee *optee)
> >> +{
> >> +       struct optee_rpmi_probe_req req =3D {
> >> +               .op =3D cpu_to_le32(OPTEE_RPMI_EXCHANGE_CAPABILITIES),
> >> +       };
> >> +       struct optee_rpmi_caps_resp caps;
> >> +       u32 rpc_count, sec_caps, notif_count;
> >> +       int ret;
> >> +
> >> +       ret =3D optee_rpmi_call(optee, &req, sizeof(req), &caps, sizeo=
f(caps));
> >> +       if (ret)
> >> +               return ret;
> >> +
> >> +       sec_caps =3D get_unaligned_le32(&caps.secure_caps);
> >> +       rpc_count =3D get_unaligned_le32(&caps.rpc_param_count);
> >> +       notif_count =3D get_unaligned_le32(&caps.notification_count);
> >> +       if (!notif_count || !rpc_count)
> >> +               return -EPROTO;
> >> +
> >> +       optee->rpc_param_count =3D rpc_count;
> >> +       optee->rpmi.sec_caps =3D sec_caps;
> >> +       optee->rpmi.notification_count =3D notif_count;
> >> +       optee->in_kernel_rpmb_routing =3D IS_REACHABLE(CONFIG_RPMB);
> >
> > What if OP-TEE is built without RPMB support?
> >
>
> I discussed this with Sumit, and the intention was to make RPMB probing
> part of the baseline for the new ABI rather than negotiate it separately.
> I can enable the capability bit if it should remain optional.

You have a point. Let's keep it, but we may want to move the
assignment down into optee_rpmi_probe(), as the other probe functions
have it.

Cheers,
Jens
