Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117471;
	b=lHabH9OO+pGAMnOKCkAxGrQEG4l417+A2lcpw3Ni5XRgP/P8zr0S/8/QACTdoJZOyd9D
	 MKrItCKc6EQOi7tGnctgOdnAAjgByjxcxapvr8LN9Z4SAgzjAdXpw2DrXaIsJ7FW1ebAl
	 xF6SXvOg1cElaWdSoDc7G6+X+RibXT5JX6fNqhCgSc1v1q2g2Czg1FwAhiQggxYwnr+Tv
	 8fAfM69l+JReX0f7LNRzkMbYlSfpQn7cN9P7aos0PKCs18cn3Z+KVWdRWRRWEnRqSiM3B
	 +UG2rDDWG7kz+Y8Zu5CIweSXf5PBDW8nSJrC2hr7zWz2PE93TGR1x/juPMyrmY5ERqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=P/dI5EVHI6hZEHd+P1qs5J5OltQJtHlpxL7TB3tOu1w=;
	b=ZSFMp5BA9sh89yy/BXNdL4dV9WG+zOGBaZMsWxJqYqn4hvNtHSTQwTBfGTlNe63Lo0hb
	 OlPiThYISv8ItyChQa82blcx5UJFlzJuCNxenKcuS7R+VhozsX2mEDjilDcYrn7WLPtou
	 JkuzY1MJH8IeMi0J+47cYqWZNXFVUunakvBJJpV3bI1WimXG7s7N8mqFuAteGzln3+i7b
	 8lSmmke2yPhp1wnYsyL4K5pQ/I9hFID6Ry/yzzjOiYECqrzLAmveoCil/RyjjyEEfDVXA
	 TZUwKoujzq7OT+0uF7mN8BsD0ue79yMjiOytSJdNzxs1orJAKFE2HS9U2FCFQapCkpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PKkfacYB;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297CE606A324
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 19:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 297CE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PKkfacYB
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-921159376efso2274126d6.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 11:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795117470; x=1795722270; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P/dI5EVHI6hZEHd+P1qs5J5OltQJtHlpxL7TB3tOu1w=;
        b=PKkfacYBubfYve3a4PkXPVfBTXEAefGayowYGIzaaquBzhkZ1sdihnlYznTpFnHBZd
         QASsO7E02+wAPEapFxzuzLGnXnqYjUwmeQHAS43qEjXHvffmMpBfPoVNyhFSSQCPHW/j
         0Bq01H4TuhLekXEXednQggP2+lEm2LV9quFM/zxuwmv1UVOzQhKgMWBFR/4XasnrN77V
         oWf9m+L0g9t6BXyKli8Sa/Jg1/FWbc+cjdxujpW4TVTLu7XtdvcH/6MmHu9kTjqhPOOM
         O6Vr8PomdywEV3n+MClg2sf/JOVhiT8wTZ0bj1EwrHvZGsQVbhbzJmgzxPy6OqDzQBVn
         BNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795117470; x=1795722270;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P/dI5EVHI6hZEHd+P1qs5J5OltQJtHlpxL7TB3tOu1w=;
        b=pnIys1y0S1VTaxRYKvZAsKS6f1vVTax/CfYDTw2qJBXwBJIAjl3fSxFxFANIUP8uFQ
         CcJlOq95GgcheSljl/+NA6suokUfO54XEYM5aNiFRMGh7bHrKp+qJaO/Pdpqyzix9w1+
         HIJfQK7cbIC4+9UzKc2xx2GZGtwe8gBRuvLePEl78YjZlM5ln4djLWr5qJi34jnaGw15
         XI4a8swnayHjrz0rYpwMMJ3aUySrxf0fxkjgYisQ//8ujReXcBU+LlPs0897iX2IVi4l
         YKVBDnY4ogGI5tM5nibaNXlC3q3IBenVY59Ya/CV8GJnVqSOJjA9zMHo3bNLhRvBzyo4
         +qfw==
X-Forwarded-Encrypted: i=1; AL+hErEP9Xai8dSpr4O5gQ+U9cgaIPkWmSb9UagbD94WFWeEvwgkJRDKFYpiYWuDVG4SecmDMiTg+CEx3svy@vger.kernel.org
X-Gm-Message-State: APuU4Z8v7r7VOJnCVcwvGtMxFSPlgmyUwRL0HxVmhIsDqdhAnAth4Q/H
	kltBNoUln75u+/CqvNmP/osyE+Bbh60JveZqTbMDbdQW8DU+FUfYLWM81Lnd4gh7sos=
X-Gm-Gg: AYBFou1Lfaew3I5HhpXGPZt8DioavKs4AKoUWt9Yn2M1yvNtN8/wa2OQnZS8lIxHDPQ
	iRFC6LHoUcwfiq5aqLTHsmiE4RMHbz0So3sIijqwQMNFmv86dK/N0AT01A2NocSY7XJuaiCZXsh
	hQptKToNXMj3T386Bv6pyunGWgOjbYotyE03r27ptYldWo+hlgK2tgKZi10V28E4jxbpkISp6oF
	HQQqyZvru0FeMkw573PxvwQhR7w5cDU4P4gA/dGigqj0ARr4Sm+BKqHiSubIRSUJztrztuSC3MX
	mzTzzKZsq7repxhwyVmGgtbcKYleVAHa74F+mOMDMmS0DmBkz0SY5f0bsEt61MJRqlaxaXUYmZL
	Oe/tLhluyQzCShQDBHzRa0JORc4T7I67FKrbMlJ6fWqhGvjK+6mXUW3tAUqyDWqROijKL5/qgKJ
	3tGb0bQ+HAZHDUzvikl9ePus4TSyRXLgQAS5E+iM6aG0pNHPyAgrrdsMfxHBVUnqqzC13mMHBWZ
	VxmVfcuWWU9kKC4SuJCinkeMU4/JK+UuvoX0OtY7mIIjhW9Sp9QVjSaMOei5RBmJpBg2wo6Eb6D
	pSU+FP/NEdDu9erEMLks9NPnjTTyjsggfM8hWjPCLqjOCksgH1dDIcwNZRew74W/PmqTZXaAECZ
	H
X-Received: by 2002:a05:620a:1308:b0:949:6493:7c6c with SMTP id af79cd13be357-949ba9e05efmr110692985a.30.1795117470015;
        Thu, 19 Nov 2026 11:44:30 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3832c8sm35428085a.18.2026.11.19.11.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:44:29 -0800 (PST)
Message-ID: <fe3f3912af33f1afed3459671fdf93a5a6764c27.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 00/28] media: add arm Mali-V76 video decoder driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Charvi Mehta <charvi.mehta@arm.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel	 <p.zabel@pengutronix.de>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>,  Rathinavel Sankaralingam
 <rath.sankaralingam@arm.com>, Shobhit Pandey <shobhit.pandey@arm.com>
Date: Thu, 19 Nov 2026 14:44:27 -0500
In-Reply-To: <20261119153758.1426673-1-charvi.mehta@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-2Q7+N9fBsq9L8TcpfMqs"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-2Q7+N9fBsq9L8TcpfMqs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

its nice to see ARM working on upstream drivers.

Le jeudi 19 novembre 2026 =C3=A0 15:37 +0000, Charvi Mehta a =C3=A9crit=C2=
=A0:
> This series introduces support for the Arm Mali-V76 Video Processing Unit
> (VPU), providing H.264 video stream decoding through the V4L2 stateful
> memory-to-memory interface.
>=20
> The Mali-V76 offloads video decoding from the application processor. The
> host driver loads and manages the codec firmware, communicating with it
> through asynchronous message queues, interrupts and RPC requests. It also
> manages the firmware address space using the V76 internal MMU and control=
s
> hardware resources through the LSID and job-queue interfaces.
>=20
> The driver currently supports:
>=20
> - H.264 decoding through the V4L2 stateful memory-to-memory interface.
> - Multi-planar capture using V4L2_PIX_FMT_YUV420M, V4L2_PIX_FMT_NV12M
>   and V4L2_PIX_FMT_NV21M, with MMAP and DMA-BUF buffer support.
> - Variant-specific definitions of supported formats, frame sizes,
>   controls and hardware resources.
> - Explicit management of decoder and firmware states throughout
>   stream setup, decoding and teardown.
> - Asynchronous firmware loading and caching, with interrupt-driven
>   communication for commands, buffer completion and firmware events.
> - Separate control of OUTPUT and CAPTURE streaming, allowing CAPTURE
>   buffers to be reconfigured during dynamic resolution changes.
> - Decoder drain, end-of-stream and dynamic resolution change handling,
>   including source-change events and LAST buffer signalling.
> - Timestamp propagation and buffer metadata handling.
> - Firmware error and unsupported-stream reporting.
>=20
> The initial implementation supports a single active decoding session, wit=
h
> hardware resource management handled through the V76 LSID and job-queue
> interfaces. Support for additional codecs and concurrent sessions is
> outside the scope of this series.
>=20
> The series is based on media-committers/next.
>=20
> To simplify the testing a tree with the new patches on top has been made
> available at [1].
>=20
> [1] https://gitlab.arm.com/media/vpu/charvi/linux.git mali/v76/v1
>=20
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> Signed-off-by: Rathinavel Sankaralingam <rath.sankaralingam@arm.com>
> Signed-off-by: Shobhit Pandey <shobhit.pandey@arm.com>
>=20
> Testing
> =3D=3D=3D=3D=3D=3D=3D
> The driver has been tested on Mali-V76 pre-silicon FPGA.
>=20
> Static tools like checkpatch, smatch, dt_binding_check, sparse, checkstac=
k
> and Coccinelle run successfully with this driver.
>=20
> The driver has been tested with v4l2-ctl[2] and Gstreamer[3],
> v4l2-compliance [4] and Fluster [5].
>=20
> [2] v4l2-ctl -d /dev/video0 --verbose \
> --set-fmt-video-out=3Dwidth=3D1920,height=3D1080,pixelformat=3DH264 \
> --set-fmt-video=3Dwidth=3D1920,height=3D1080,pixelformat=3DNM12 \
> --stream-mmap=3D4 --stream-out-mmap=3D1 \
> --stream-from /media/CrowdRun_1080p.264 --stream-to decoded.yuv
>=20
> [3] gst-launch-1.0 -v filesrc location=3D/media/CrowdRun_720p.264 ! h264p=
arse \
> ! v4l2h264dec ! filesink location=3Ddecoded.yuv sync=3Dfalse
>=20
> [4] V4l2 compliance was tested using v4l2-compliance 1.28.1:
>=20
> v4l2-compliance -d /dev/video0 --stream-from /media/CrowdRun_1080p.264 -s=
 200
>=20
> v4l2-compliance 1.28.1, 64 bits, 64-bit time_t
>=20
> Compliance test for mali-vpu device /dev/video0:
>=20
> Driver Info:
> =09Driver name      : mali-vpu
> =09Card type        : mali-vpu-decoder
> =09Bus info         : platform:6f030000.video-codec
> =09Driver version   : 7.4.0
> =09Capabilities     : 0x84204000
> =09=09Video Memory-to-Memory Multiplanar
> =09=09Streaming
> =09=09Extended Pix Format
> =09=09Device Capabilities
> =09Device Caps      : 0x04204000
> =09=09Video Memory-to-Memory Multiplanar
> =09=09Streaming
> =09=09Extended Pix Format
> =09Detected Stateful Decoder
>=20
> Required ioctls:
> =09test VIDIOC_QUERYCAP: OK
> =09test invalid ioctls: OK
>=20
> Allow for multiple opens:
> =09test second /dev/video0 open: OK
> =09test VIDIOC_QUERYCAP: OK
> =09test VIDIOC_G/S_PRIORITY: OK
> =09test for unlimited opens: OK
>=20
> Debug ioctls:
> =09test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> =09test VIDIOC_LOG_STATUS: OK (Not Supported)
>=20
> Input ioctls:
> =09test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> =09test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> =09test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> =09test VIDIOC_ENUMAUDIO: OK (Not Supported)
> =09test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> =09test VIDIOC_G/S_AUDIO: OK (Not Supported)
> =09Inputs: 0 Audio Inputs: 0 Tuners: 0
>=20
> Output ioctls:
> =09test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> =09test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> =09test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> =09test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> =09test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> =09Outputs: 0 Audio Outputs: 0 Modulators: 0
>=20
> Input/Output configuration ioctls:
> =09test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> =09test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> =09test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> =09test VIDIOC_G/S_EDID: OK (Not Supported)
>=20
> Control ioctls:
> =09test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> =09test VIDIOC_QUERYCTRL: OK
> =09test VIDIOC_G/S_CTRL: OK
> =09test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> =09test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> =09test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> =09Standard Controls: 2 Private Controls: 6
>=20
> Format ioctls:
> =09test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> =09test VIDIOC_G/S_PARM: OK (Not Supported)
> =09test VIDIOC_G_FBUF: OK (Not Supported)
> =09test VIDIOC_G_FMT: OK
> =09test VIDIOC_TRY_FMT: OK
> =09test VIDIOC_S_FMT: OK
> =09test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> =09test Cropping: OK (Not Supported)
> =09test Composing: OK (Not Supported)
> =09test Scaling: OK (Not Supported)
>=20
> Codec ioctls:
> =09test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> =09test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> =09test VIDIOC_(TRY_)DECODER_CMD: OK
>=20
> Buffer ioctls:
> =09test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> =09test CREATE_BUFS maximum buffers: OK
> =09test VIDIOC_REMOVE_BUFS: OK
> =09test VIDIOC_EXPBUF: OK
> =09test Requests: OK (Not Supported)
>=20
> Test input 0:
>=20
> Streaming ioctls:
> =09test read/write: OK (Not Supported)
> =09test blocking wait: OK
> =09Video Capture Multiplanar: Captured 632 buffers
> =09test MMAP (select): OK
> =09Video Capture Multiplanar: Captured 632 buffers
> =09test MMAP (epoll): OK
> =09test USERPTR (select): OK (Not Supported)
> =09test DMABUF: Cannot test, specify --expbuf-device
>=20
> Total for mali-vpu device /dev/video0: 52, Succeeded: 52, Failed: 0, Warn=
ings: 0
>=20
> [5] Fluster was run with
>=20
> GStreamer-H.264-V4L2 decoder:
>=20
> Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2
> Ran 78/135 tests successfully.
>=20
> The failing tests:
>=20
> 52 test vectors fail as they are interlaced clips which mali-vpu does not
> support.

Is that a real hardware limitation, or you are just skipping it in firmware=
 or
even in this driver? Its not like you have a compliant decoder without it. =
I've
recently asked Amlogic to not cut corner also, and they accepted to fix the=
ir
new driver.

>=20
> List of these test vectors:
> - cabac_mot_fld0_full
> - cabac_mot_mbaff0_full
> - cabac_mot_picaff0_full
> - CABREF3_Sand_D
> - CAFI1_SVA_C
> - CAMA1_Sony_C
> - CAMA1_TOSHIBA_B
> - cama1_vtc_c
> - cama2_vtc_b
> - CAMA3_Sand_E
> - cama3_vtc_b
> - CAMACI3_Sony_C
> - CAMANL1_TOSHIBA_B
> - CAMANL2_TOSHIBA_B
> - CAMANL3_Sand_E
> - CAMASL3_Sony_B
> - CAMP_MOT_MBAFF_L30
> - CAMP_MOT_MBAFF_L31
> - CANLMA2_Sony_C
> - CANLMA3_Sony_C
> - CAPA1_TOSHIBA_B
> - CAPAMA3_Sand_F
> - cavlc_mot_fld0_full_B
> - cavlc_mot_mbaff0_full_B
> - cavlc_mot_picaff0_full_B
> - CVCANLMA2_Sony_C
> - CVFI1_Sony_D
> - CVFI1_SVA_C
> - CVFI2_Sony_H
> - CVFI2_SVA_C
> - CVMA1_Sony_D
> - CVMA1_TOSHIBA_B
> - CVMANL1_TOSHIBA_B
> - CVMANL2_TOSHIBA_B
> - CVMAPAQP3_Sony_E
> - CVMAQP2_Sony_G
> - CVMAQP3_Sony_D
> - CVMP_MOT_FLD_L30_B
> - CVMP_MOT_FRM_L31_B
> - CVNLFI1_Sony_C
> - CVNLFI2_Sony_H
> - CVPA1_TOSHIBA_B
> - FI1_Sony_E
> - MR6_BT_B
> - MR7_BT_B
> - MR8_BT_B
> - MR9_BT_B
> - Sharp_MP_Field_1_B
> - Sharp_MP_Field_2_B
> - Sharp_MP_Field_3_B
> - Sharp_MP_PAFF_1r2
> - Sharp_MP_PAFF_2r
> 2 test vectors failed because FMO is unsupported.
> Test vectors: FM1_BT_B FM1_FT_E
> 2 test vectors failed because SP_SLICE type is unsupported.
> Test vectors: SP1_BT_A sp2_bt_b
> 1 additional test vector, CVFC1_Sony_C completes decoding but fails check=
sum
> verification due to a stride-handling issue in GStreamer 1.24.13. GStream=
er
> replaces the driver-reported 150-byte planar chroma stride with 152 bytes=
,
> causing the decoded chroma planes to be read incorrectly.

1.24 is very old by now, but I think this specific file needs more work. On=
e
part of the fix has been made recently:

https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/13059

>=20
> Running test suite JVT-FR-EXT with decoder GStreamer-H.264-V4L2
> Ran 25/69 tests successfully.
>=20
> The failing tests:
>=20
> 21 test vectors failed due to interlaced clips. Interlaced decoding is no=
t
> supported in mali-vpu driver.
>=20
> Test Vectors:
> - brcm_freh10
> - brcm_freh11
> - brcm_freh4
> - brcm_freh5
> - brcm_freh6
> - freh7_b
> - FREXT01_JVC_D
> - FREXT02_JVC_C
> - FRExt2_Panasonic_C
> - FRExt4_Panasonic_B
> - HCAFF1_HHI_B
> - HCAMFF1_HHI_B
> - HCHP3_HHI_A
> - HPCAFL_BRCM_C
> - HPCAFLNL_BRCM_C
> - HPCAMAPALQ_BRCM_B
> - HPCVFL_BRCM_A HPCVFLNL_BRCM_A
> - HVLCFI0_Sony_B
> - HVLCMFF0_Sony_B
> - HVLCPFF0_Sony_B
>=20
> 2 test vectors fail due to 10bit bitstream. 10 bit decoding support to be
> enabled in subequent patches.
> Test vectors: FREH10-1 FREH10-2

Ack.

Nicolas

>=20
> 21 test vectors failed because 4:2:2 is not supported in this driver.
> Test vectors:
> - FREXT1_TANDBERG_A
> - FREXT2_TANDBERG_A
> - FREXT3_TANDBERG_A
> - Hi422FR10_SONY_A
> - Hi422FR11_SONY_A
> - Hi422FR12_SONY_A
> - Hi422FR1_SONY_A
> - Hi422FR2_SONY_A
> - Hi422FR3_SONY_A
> - Hi422FR4_SONY_A
> - Hi422FR13_SONY_A
> - Hi422FR14_SONY_A
> - Hi422FR15_SONY_A
> - Hi422FR6_SONY_A
> - Hi422FR7_SONY_A
> - Hi422FR8_SONY_A
> - Hi422FR9_SONY_A
> - Hi422FREXT16_SONY_A
> - Hi422FREXT17_SONY_A
> - Hi422FREXT18_SONY_A
> - Hi422FREXT19_SONY_A
>=20
> Charvi Mehta (21):
>   dt-bindings: media: add Arm Mali-V76 VPU
>   media: mali-vpu: add Mali VPU platform driver
>   media: mali-vpu: register V4L2 decoder device and add querycap ioctl
>   media: mali-vpu: initialize decoder format state
>   media: mali-vpu: add V4L2 mem2mem and VB2 queue support
>   media: mali-vpu: implement format query ioctls
>   media: mali-vpu: implement TRY_FMT and S_FMT ioctls
>   media: mali-vpu: register V76 decoder controls and introduce UAPI
>     controls
>   media: mali-vpu: add firmware cache infrastructure
>   media: mali-vpu: load firmware for decoder sessions
>   media: mali-vpu: prepare firmware address space
>   media: mali-vpu: add firmware message transport
>   media: mali-vpu: route decoder controls to firmware
>   media: mali-vpu: handle firmware RPC requests
>   media: mali-vpu: add LSID hardware support
>   media: mali-vpu: add single session scheduler
>   media: mali-vpu: handle firmware interrupts
>   media: mali-vpu: start decoder firmware through LSID scheduling
>   media: mali-vpu: propagate buffer metadata
>   media: mali-vpu: handle firmware event responses
>   media: MAINTAINERS: add Arm Mali-V76 VPU driver
>=20
> Rath Sankaralingam (4):
>   media: mali-vpu: add MMU software page table manager
>   media: mali-vpu: implement vb2 buffer queue handling
>   media: mali-vpu: handle firmware buffer exchange
>   media: mali-vpu: handle fatal firmware error
>=20
> Shobhit Pandey (3):
>   media: mali-vpu: add decoder EOS and DRC handling
>   media: mali-vpu: handle firmware buffer parameters
>   media: mali-vpu: add stateful decoder state machine
>=20
>  .../bindings/media/arm,mali-v76.yaml          |   70 +
>  MAINTAINERS                                   |   11 +
>  drivers/media/platform/arm/Kconfig            |    1 +
>  drivers/media/platform/arm/Makefile           |    1 +
>  drivers/media/platform/arm/mali-vpu/Kconfig   |   17 +
>  drivers/media/platform/arm/mali-vpu/Makefile  |   18 +
>  .../platform/arm/mali-vpu/mali-vpu-buffer.c   |  426 +++++
>  .../platform/arm/mali-vpu/mali-vpu-buffer.h   |  109 ++
>  .../platform/arm/mali-vpu/mali-vpu-controls.c |  351 ++++
>  .../platform/arm/mali-vpu/mali-vpu-controls.h |   71 +
>  .../platform/arm/mali-vpu/mali-vpu-dec.c      |  226 +++
>  .../platform/arm/mali-vpu/mali-vpu-dec.h      |   27 +
>  .../platform/arm/mali-vpu/mali-vpu-device.h   |   72 +
>  .../arm/mali-vpu/mali-vpu-firmware-cache.c    |  549 ++++++
>  .../arm/mali-vpu/mali-vpu-firmware-cache.h    |  180 ++
>  .../platform/arm/mali-vpu/mali-vpu-firmware.c | 1647 +++++++++++++++++
>  .../platform/arm/mali-vpu/mali-vpu-firmware.h |  324 ++++
>  .../platform/arm/mali-vpu/mali-vpu-formats.c  |   95 +
>  .../platform/arm/mali-vpu/mali-vpu-formats.h  |   39 +
>  .../platform/arm/mali-vpu/mali-vpu-lsid.c     |  271 +++
>  .../platform/arm/mali-vpu/mali-vpu-lsid.h     |   58 +
>  .../platform/arm/mali-vpu/mali-vpu-mmu.c      |  699 +++++++
>  .../platform/arm/mali-vpu/mali-vpu-mmu.h      |  154 ++
>  .../platform/arm/mali-vpu/mali-vpu-probe.c    |  387 ++++
>  .../arm/mali-vpu/mali-vpu-protocol-def-v3.h   |  710 +++++++
>  .../arm/mali-vpu/mali-vpu-registers.h         |   81 +
>  .../arm/mali-vpu/mali-vpu-scheduler.c         |  248 +++
>  .../arm/mali-vpu/mali-vpu-scheduler.h         |   58 +
>  .../platform/arm/mali-vpu/mali-vpu-session.c  | 1260 +++++++++++++
>  .../platform/arm/mali-vpu/mali-vpu-session.h  |  174 ++
>  .../platform/arm/mali-vpu/mali-vpu-state.h    |  136 ++
>  .../arm/mali-vpu/mali-vpu-variant-v76.c       |  188 ++
>  .../platform/arm/mali-vpu/mali-vpu-variant.h  |   74 +
>  .../platform/arm/mali-vpu/mali-vpu-vb2.c      |  187 ++
>  .../platform/arm/mali-vpu/mali-vpu-vb2.h      |   13 +
>  .../platform/arm/mali-vpu/mali-vpu-vidioc.c   |  365 ++++
>  .../platform/arm/mali-vpu/mali-vpu-vidioc.h   |   17 +
>  .../uapi/linux/media/arm/mali-vpu-config.h    |   47 +
>  include/uapi/linux/v4l2-controls.h            |    6 +
>  39 files changed, 9367 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/arm,mali-v76.=
yaml
>  create mode 100644 drivers/media/platform/arm/mali-vpu/Kconfig
>  create mode 100644 drivers/media/platform/arm/mali-vpu/Makefile
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.c
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.h
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-controls=
.c
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-controls=
.h
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-dec.h
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-device.h
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-firmware=
-cache.c
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-firmware=
-cache.h
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-firmware=
.c
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-firmware=
.h
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-formats.=
c
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-formats.=
h
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-lsid.c
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-lsid.h
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-mmu.c
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-mmu.h
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-protocol=
-def-v3.h
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-register=
s.h
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-schedule=
r.c
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-schedule=
r.h
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-session.=
c
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-session.=
h
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-state.h
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-variant-=
v76.c
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-variant.=
h
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-vb2.c
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-vb2.h
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.h
>  create mode 100644 include/uapi/linux/media/arm/mali-vpu-config.h

--=-2Q7+N9fBsq9L8TcpfMqs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav9RmwAKCRDZQZRRKWBy
9LUuAQC85+soPrhr6pLbR3J+z2eHb1CxbepP0V62eQ3OY8CplAEA8vvyKhc9AZtP
LK6NV6RKwCZIDs5gZLvj7Dbkx179yA0=
=4Rok
-----END PGP SIGNATURE-----

--=-2Q7+N9fBsq9L8TcpfMqs--
