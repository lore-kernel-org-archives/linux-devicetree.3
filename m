Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411620;
	b=VxCHcmIa1Y8b2D3r1S/NXUQCPAJ+7aVCY0aaNSsWwFYulLyU4TIFCq7PZ6MqTjk8eMR0
	 TfZShM605vGIjgMepUDNJxMRT9B/vjcukVoixMhgR46J++RIIuE4T6JmXHdGbdRdQJWm4
	 scLiDdSdGs8kdsZpdOcjmQpTpoQ5BBamaIo9oGHXzzDONeAGgylvKNyW3gArm2HlNO+fi
	 oEtGUyjr83pSNeimdkhOuc+PF56y5sVUqT1ET5OyejaATIiE/Q2y5dYPfFj//TpvS59PL
	 btxNle16Tqv4ZWzzGP+ARvFW8mT5TjBAXfZnfD/gwBmJ4RKDSIr44zewkaPd8Wc7MJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411620;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OprF36JLM5p8Id+XvKPw4GzNwkz1XZPEfq/0vWjxfZk=;
	b=Q/NSYqlsuJIEwrd4y7tDLUwONcRirxXtK0EOLKWoTtiwWZIv0+mmzQf7ydu3ri/Mtt5H
	 pg6jWXNZxmeQqa1QVcoJBbTuBhjQbzdaWSNIl6zB+Xo0Uuu4CKw7p1arL8mllwDzO0vx1
	 si4rMHdFI77w9Ilq8MzLiimxFVw6aquWCI8ai0G/GWwigbjiCMOTiVkmidGDO3cxJ8Rww
	 kuhZP9y6DqXkUOCE0/asElW9uzxd4rjqvmiuXiYTUxRobzoZmr3Ge57ReTOS8YF9QvTjj
	 h/xreR1FnDsukZqHmkr69sTY1IvB4h+QryJ2i8bdEiu6aag8slX33TsOwanvv4OauNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M3QwgKSx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F6K+7eDA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A44606A895
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 15:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1A44606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M3QwgKSx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F6K+7eDA
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0NvQ2665092
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 15:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OprF36JLM5p
	8Id+XvKPw4GzNwkz1XZPEfq/0vWjxfZk=; b=M3QwgKSxxQJcxSGDa83MrU9chql
	7DznRsYzMHol8NytPvt3D1F2xJjmZ7dbthOA0b/J5D1EodiOHkvC0ns+JiO33T1T
	K0X8/mW6GYTCiciPkvLf9yJh4vSogWBim3GwODi6alKa11Ki6We46ssLeTFXRZbQ
	73acnyKcZNE6fPVGfRl3youG4KSxRumDeKrCNIpH4/ZgK4GE7Hc1IhSozZ/qOkdJ
	W6BHo95e5jnbpoyzkd/qx+2ZxtVCZXc4g8mFRyMYmyY1ShMMCTR63hokMnRaUZ8I
	ry39PhoMrxAMgMeaQN3W1WenZC5Lho3ZexgSJFvWTYn2LyqR/cvuYBmwERQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdjhkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 15:40:18 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2cb77c7abso378257137.3
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794411618; x=1795016418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OprF36JLM5p8Id+XvKPw4GzNwkz1XZPEfq/0vWjxfZk=;
        b=F6K+7eDABkt7UC+imlBBZ1AEA4ZfVsAuhxpuk2455MVR3z5g8rTJGGrz5TNokawhCQ
         eGEe0h58hYX1GN0mcO7tcueEZmUKgcWXfhy7WJr4W8ZN/OxHjI5lTKBzKqVClo38aziH
         I7sdhV4e14u4935XIbBad+Z7jaicPpIFUzl8GQJYKVM4xHVALHxCkWc9agQiJr2K9FIE
         QKolPWM4xdcX/06T24Dfa77cyhp7YSgl2UyTUDM5kbyGunUd6HPZyEz0U6DFJvAyDCZs
         AwYSD6ycuTIxD7Dmb/+0gMmc9on/GNiX1qa7jOw6WrNDtYwz0+27tvOd0vDsC3C73Gid
         xFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411618; x=1795016418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OprF36JLM5p8Id+XvKPw4GzNwkz1XZPEfq/0vWjxfZk=;
        b=mqHdYkDGEsp1pCbNc59nqLmdgIZ3xsJjxn/T07thOHH9jfr03FudFBwDK9Hazf577p
         k7TRPh++yorwqLa5rgzPg4nCFM0ISmGcUzesX7CDTnb/1VqZANShs6u4Qpwy5JAWgoAJ
         ke1nCtmn5xnG1zk4wa79udpvpluB6zA6kajVVEOWUWH0CDzWWK0QPcxP0lcPdDDpPJwD
         6fzCFhPUrdWT1SkZ3HTUZbzlJvAYyP9fVqAmIqt47fWs5CovVgSV2AmCflxdLjBd/6fk
         Yki90rChDHo4/x2E+g8/CAo30lPWa8jFho+YFFz0Uw5rk6keS0BOL7XQ6CdGhdaLY6UD
         b4Fw==
X-Forwarded-Encrypted: i=1; AL+hErGorhMNqrq6XIHe4s2MNZJQ+QbHAMyJMyYarjJuNLAg6k+tK6C7IhP+uJ6hmvfWxD2h0nWYl0fut5td@vger.kernel.org
X-Gm-Message-State: APuU4Z/U6/Si70ixjdhl29V6piJGzqDZbWQsBXxlqY/vhZBtt/3g0Hll
	JDsTsLBoj0c2B0LoYqwKIzEi8vOtuilpNXZ1ur8KF3xPaNsGmf+KIs0YzJU22UQfoOyRTYBV56+
	aYMsEFitut9eLsj0OgCuebtVHbDCuAOBFh28BCtvYcvFJHsMmCuX0TGkNRRFzC8Q3
X-Gm-Gg: AYBFou3kUCQcxIo5VZGD9uK8TXGsHu6xZzPtXnII54R2JiH3Ncs99cYl2nwM1XzZzxq
	rYN8ce4TWuaPADiKNkigLp/1snC2N3r4bvfFCp5O2dQvZpLWm0RK57K8tKgfjnkCdBaMr1g6kQu
	kN69EOOpbbq9mLVsp27pURSjHAqdURgR3DC7tmZ526mc8a4hJanyXohIPzDbv1ljaKgpPlqvbo9
	zhvHTc5EZ+hRKEHisdiKsJ3NI8dDRmJElF4UCc7MHmXbmzBuIOrUnp3P00ErFtlmgMBTuEzLIQ3
	9A//D7Zz93Sl8YP1TE6tLC/aeWvPr7JITq1Pu7wKZuS5hhS6O08Icks1Q2JDNJRH5EdCWfrGlCM
	db5zVedjRYfHyrbdpHHGzKwA1Pq4ZXN9fglNDPp0+FE69QKyersofqvg46lQ5zwfHknwASsJ1XQ
	==
X-Received: by 2002:a05:6102:5798:b0:7b3:7653:5487 with SMTP id ada2fe7eead31-7d50610a960mr802010137.32.1794411617695;
        Wed, 11 Nov 2026 07:40:17 -0800 (PST)
X-Received: by 2002:a05:6102:5798:b0:7b3:7653:5487 with SMTP id ada2fe7eead31-7d50610a960mr802004137.32.1794411617218;
        Wed, 11 Nov 2026 07:40:17 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c5f53efsm3517355e9.13.2026.11.11.07.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:40:16 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: Re: [PATCH v8 3/8] media: v4l2-jpeg: Add a baseline JPEG header writer
Date: Wed, 11 Nov 2026 17:40:14 +0200
Message-Id: <20261111154014.654617-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <qb6mqteoxdk7xb7qhgiruncdamptf7m62m3y4zrccs4cesxr4t@q3oukzsd6qyr>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com> <20261110163909.78085-4-atanas.filipov@oss.qualcomm.com> <qb6mqteoxdk7xb7qhgiruncdamptf7m62m3y4zrccs4cesxr4t@q3oukzsd6qyr>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af48c62 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=l-wiyt6Y1aSZOmScoPQA:9
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: DzLsZXPZGU18TGLkmcPa5UiEX3tMgkOE
X-Proofpoint-GUID: DzLsZXPZGU18TGLkmcPa5UiEX3tMgkOE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX82WoMvvEhHBw
 kcR2Hi+Y3mBOfCKabT0CLCCu+SUV8klqmCdlI9OYjhBlOc7aSwU8QTRQIISBtbnQHYpgHAxuapH
 cC6ZQJFqcaEN7t4ql67/e7NGY6vJ+FjYKaMuPpUJ87BPxu505NTspcOtMTKDTsGFAzyXivt8FdE
 sWkJbbOATaKak8GV4qx/5k3qTmlhej0H6bhdGGzcWWudSyLCHRjfDUDsN9VSzAzvJvQglclF+32
 pqeSG5QUJUHXubVTMfYAAiwKzaxk349WayJmey9Dw4LcpT8+sTEVzUDMXXRwCEnZlLVaCFxmwz+
 Nv4D1xjjZAvdwH3FDxMXsnT9DMC4N+fECmFMsRaI6qezUP7119YuBZmZBLXtcd1ZntWRtZf5Dyk
 d1nul6wFQUxukQFWQakYtPW0+BeJFoLsrpLQJK4ECx5hlChHFOkKX/f4FWXVW/VNWxchRo2M2cT
 nsYhh2SyNhirDGI4r5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX9K8HdIlJHLrr
 rqZpe3LX+/fCyfmHQJy1cafsffXkRN0ntfBhUglGJijOcTnx4J7frJhNnu62Aphlq4DPFkWCOsX
 f2kwSrZJ5SRqvU/UT4EaqmHdyVt44rg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110062

On Wed, Nov 11, 2026 at 03:30:57PM +0200, Dmitry Baryshkov wrote:
> > +/* Writes past the end only advance pos; v4l2_jpeg_write_header() checks it */
> > +static void jpeg_put_bytes(struct jpeg_hdr_buf *b, const void *src, size_t n)
> > +{
> > +	if (b->pos + n <= b->len) {
> > +		if (src)
> > +			memcpy(b->buf + b->pos, src, n);
> > +		else
> > +			memset(b->buf + b->pos, 0, n);
> > +	}
> > +	b->pos += n;
>
> Now b->pos has advanced past the b->len. Is it expected?

Yes. Nothing is written past the end, and the final check returns
-ENOSPC. I agree it is not clear. I will use an explicit overflow flag
in the next version.

> > +	jpeg_put_u8(&b, nc);
> > +	for (i = 0; i < nc; i++) {
> > +		jpeg_put_u8(&b, i + 1);
> > +		jpeg_put_u8(&b, i ? JPEG_SAMPLING_H1V1 : params->luma_sampling);
> > +		jpeg_put_u8(&b, i ? JPEG_QTABLE_CHROMA : JPEG_QTABLE_LUMA);
> > +	}
>
> I think it might be better to write explicitly:
>
> 	jpeg_put_u8(&b, 1);
> 	jpeg_put_u8(&b, params->luma_sampling);
> 	jpeg_put_u8(&b, JPEG_QTABLE_LUMA);
>
> 	if (params->num_components != JPEG_COMP_MONO) {
> 		jpeg_put_u8(&b, 2);
> 		jpeg_put_u8(&b, JPEG_SAMPLING_H1V1);
> 		jpeg_put_u8(&b, JPEG_QTABLE_CHROMA);
> 	}

Ok, I will write them explicitly in the next version.

> > +	jpeg_put_u8(&b, nc);
> > +	for (i = 0; i < nc; i++) {
> > +		jpeg_put_u8(&b, i + 1);
> > +		jpeg_put_u8(&b, i ? JPEG_TABLE_SEL_CHROMA : JPEG_TABLE_SEL_LUMA);
> > +	}
>
> The same.

Ok, the same for SOS.

--
Best regards,
Atanas
